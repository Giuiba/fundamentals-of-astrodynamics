# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 6 June 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np

from ..constants import SMALL, MU
from ..mathtime.vector import rot1, rot3, angle
from .kepler import OrbitType, determine_orbit_type, newtonnu, newtonm


###############################################################################
# Local Utility Functions
###############################################################################

def is_equatorial(inc):
    """Equatorial check for inclinations"""
    return inc < SMALL or abs(inc - np.pi) < SMALL


###############################################################################
# Spherical Elements
###############################################################################

def adbar2rv(rmag, vmag, rtasc, decl, fpav, az):
    """Conversion from spherical elements to position & velocity vectors

    This function transforms the orbital elements (rtasc, decl, fpav,
    azimuth, position and velocity magnitude) into ECI position and velocity
    vectors.

    References:
        vallado: 2001, xx
        chobotov       70

    Args:
        rmag (float): ECI position vector magnitude in km
        vmag: (float): ECI velocity vector magnitude in km/sec
        rtasc (float): Right ascension of satellite in radians
        decl (float): Declination of satellite in radians
        fpav (float): Satellite flight path angle from vertical in radians
        az (float): Satellite flight path azimuth in radians

    Returns:
        r (numpy array): ECI position vector
        v (numpy array): ECI velocity vector
    """
    # Form position vector
    r = np.array(
        [
            rmag * np.cos(decl) * np.cos(rtasc),
            rmag * np.cos(decl) * np.sin(rtasc),
            rmag * np.sin(decl)
        ]
    )

    # Form velocity vector
    v = np.array(
        [
            vmag * (np.cos(rtasc)
                    * (-np.cos(az) * np.sin(fpav) * np.sin(decl)
                       + np.cos(fpav) * np.cos(decl))
                    - np.sin(az) * np.sin(fpav) * np.sin(rtasc)),
            vmag * (np.sin(rtasc)
                    * (-np.cos(az) * np.sin(fpav) * np.sin(decl)
                       + np.cos(fpav) * np.cos(decl))
                    + np.sin(az) * np.sin(fpav) * np.cos(rtasc)),
            vmag * (np.cos(az) * np.cos(decl) * np.sin(fpav)
                    + np.cos(fpav) * np.sin(decl))
        ]
    )

    return r, v


def rv2adbar(r, v):
    """Conversion from position & velocity vectors to spherical elements

    This function transforms a position and velocity vector into the adbarv
    elements: rtasc, decl, fpav, azimuth, position and velocity magnitude.

    References:
        vallado: 2001, xx
        chobotov       70

    Args:
        r (array_like): ECI position vector
        v (array_like): ECI velocity vector

    Returns:
        rmag (float): ECI position vector magnitude in km
        vmag: (float): ECI velocity vector magnitude in km/sec
        rtasc (float): Right ascension of satellite in radians
        decl (float): Declination of satellite in radians
        fpav (float): Satellite flight path angle from vertical in radians
        az (float): Satellite flight path azimuth in radians
    """
    rmag = np.linalg.norm(r)
    vmag = np.linalg.norm(v)
    rtemp = np.sqrt(r[0]**2 + r[1]**2)
    vtemp = np.sqrt(v[0]**2 + v[1]**2)

    # Right ascension of sateillite
    if rtemp < SMALL:
        rtasc = np.arctan2(v[1], v[0]) if vtemp > SMALL else 0
    else:
        rtasc = np.arctan2(r[1], r[0])

    # Declination of satellite
    decl = np.arcsin(r[2] / rmag)

    # Flight path angle from vertical
    h = np.cross(r, v)
    fpav = np.arctan2(np.linalg.norm(h), np.dot(r, v))

    # Flight path azimuth
    hcrossr = np.cross(h, r)
    az = np.arctan2(r[0] * hcrossr[1] - r[1] * hcrossr[0], hcrossr[2] * rmag)

    return rmag, vmag, rtasc, decl, fpav, az


###############################################################################
# Classical Elements
###############################################################################

def coe2rv(p, ecc, incl, raan, nu=0, arglat=0, truelon=0, lonper=0):
    """Convert from classical elements to position & velocity vectors.

    This function finds the position and velocity vectors in geocentric
    equatorial (ijk) system given the classical orbit elements.

    References:
        vallado: 2007, p. 126, Algorithm 10
        chobotov       70

    Args:
        p (float): Semi-latus rectum of the orbit in km
        ecc (float): Eccentricity of the orbit
        incl (float): Inclination of the orbit in radians
        raan (float): Right ascension of the ascending node (RAAN) in radians
        nu (float): True anomaly in radians
        arglat (float, optional): Argument of latitude in radians
        truelon (float, optional): True longitude in radians
        lonper (float, optional): Longitude of periapsis in radians

    Returns:
        r (numpy.ndarray): ijk position vector in km
        v (numpy.ndarray): ijk velocity vector in km/s
    """
    # Handle special cases for orbit type
    if ecc < SMALL:
        if is_equatorial(incl):
            # Circular equatorial
            argp = 0.0
            raan = 0.0
            nu = truelon
        else:
            # Circular inclined
            argp = 0.0
            nu = arglat
    else:
        # Elliptical equatorial
        if is_equatorial(incl):
            argp = lonper
            raan = 0.0
        else:
            # Rectilinear orbits
            nu = arglat
            argp = 0.0

    # Compute position and velocity in the perifocal coordinate system
    cosnu = np.cos(nu)
    sinnu = np.sin(nu)
    r_pqw = np.array([cosnu, sinnu, 0.0]) * (p / (1 + ecc * cosnu))
    v_pqw = np.array([-sinnu, ecc + cosnu, 0.0]) * (np.sqrt(MU / p))

    # Transform from PQW to IJK (GEC)
    r = rot3(rot1(rot3(r_pqw, -argp), -incl), -raan)
    v = rot3(rot1(rot3(v_pqw, -argp), -incl), -raan)

    return r, v


def rv2coe(r, v):
    """Converts position and velocity vectors into classical orbital elements.

    Args:
        r (array-like): Position vector in km
        v (array-like): Velocity vector in km/s

    References:
        vallado: 2007, p. 121, Algorithm 9

    Returns:
        p (float): Semilatus rectum in km
        a (float): Semimajor axis in km
        ecc (float): Eccentricity
        incl (float): Inclination in radians
        raan (float): Right ascension of the ascending node in radians
        argp (float): Argument of perigee in radians
        nu (float): True anomaly in radians
        m (float): Mean anomaly in radians
        arglat (float): Argument of latitude in radians
        truelon (float): True longitude in radians
        lonper (float): Longitude of periapsis in radians
        orbit_type (enum): Type of orbit as defined in the OrbitType enum
    """
    def adjust_angle(ang):
        """Adjust angle by subtracting it from 2pi"""
        return 2 * np.pi - ang

    (p, a, ecc, incl, raan, argp, nu,
     m, arglat, truelon, lonper) = (np.nan,) * 11
    orbit_type = None

    # Make sure position and velocity vectors are numpy arrays
    r = np.array(r)
    v = np.array(v)

    # Get magnitude of position and velocity vectors
    r_mag = np.linalg.norm(r)
    v_mag = np.linalg.norm(v)

    # Get angular momentum
    h = np.cross(r, v)
    h_mag = np.linalg.norm(h)

    # Elements are undefined for negative angular momentum
    if h_mag < 0:
        return (
            p, a, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper,
            orbit_type
        )

    # Define line of nodes vector
    n_vec = np.array([-h[1], h[0], 0])
    n_mag = np.linalg.norm(n_vec)

    # Get eccentricity vector
    e_vec = ((v_mag ** 2 - MU / r_mag) * r - np.dot(r, v) * v) / MU
    ecc = np.linalg.norm(e_vec)

    # find a, e, and p (semi-latus rectum)
    sme = (v_mag ** 2 / 2) - (MU / r_mag)
    if abs(sme) > SMALL:
        a = - MU / (2 * sme)
    else:
        a = np.inf

    # Semi-latus rectum
    p = h_mag ** 2 / MU

    # Find inclination
    incl = np.arccos(h[2] / h_mag)

    # Determine orbit type
    orbit_type = determine_orbit_type(ecc, incl, tol=SMALL)

    # Find right ascension of ascending node
    if n_mag > SMALL:
        raan = np.arccos(np.clip(n_vec[0] / n_mag, -1, 1))
        if n_vec[1] < 0:
            raan = adjust_angle(raan)

    # Find argument of periapsis
    if orbit_type is OrbitType.EPH_INCLINED:
        argp = angle(n_vec, e_vec)
        if e_vec[2] < 0:
            argp = adjust_angle(argp)

    # Find true anomaly at epoch
    if orbit_type in [OrbitType.EPH_INCLINED, OrbitType.EPH_EQUATORIAL]:
        nu = angle(e_vec, r)
        if np.dot(r, v) < 0:
            nu = adjust_angle(nu)

    # Find argument of latitude (inclined cases)
    if orbit_type in [OrbitType.CIR_INCLINED, OrbitType.EPH_INCLINED]:
        arglat = angle(n_vec, r)
        if r[2] < 0:
            arglat = adjust_angle(arglat)

    # Find longitude of periapsis
    if ecc > SMALL and orbit_type is OrbitType.EPH_EQUATORIAL:
        lonper = np.arccos(np.clip(e_vec[0] / ecc, -1, 1))
        if e_vec[1] < 0:
            lonper = adjust_angle(lonper)
        if incl > np.pi / 2:
            lonper = adjust_angle(lonper)

    # Find true longitude
    if r_mag > SMALL and orbit_type is OrbitType.CIR_EQUATORIAL:
        truelon = np.arccos(np.clip(r[0] / r_mag, -1, 1))
        if r[1] < 0:
            truelon = adjust_angle(truelon)
        if incl > np.pi / 2:
            truelon = adjust_angle(truelon)

    # Find mean anomaly for all orbits
    e, m = newtonnu(ecc, nu)

    return (
        p, a, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper, orbit_type
    )


###############################################################################
# Equinoctial Elements
###############################################################################

def eq2rv(a, af, ag, chi, psi, meanlon, fr):
    """Convert from equinoctial elements to position & velocity vectors.

    This function finds the position and velocity vectors in geocentric
    equatorial (ijk) system given the equinoctial orbit elements.

    References:
        vallado: 2013, p. 108

    Args:
        a (float): Semi-major axis in km
        af (float): Component of eccentricity vector (also called k)
        ag (float): Component of eccentricity vector (also called h)
        chi (float): Component of node vector in eqw (also called p)
        psi (float): Component of node vector in eqw (also called q)
        meanlon (float): Mean longitude in radians
        fr (float): Retrograde factor (+1 for prograde, -1 for retrograde)

    Returns:
        np.array: Position vector in km
        np.array: Velocity vector in km/s
    """
    # Initialize variables
    arglat, truelon, lonper = (0., ) * 3

    # Compute eccentricity
    ecc = np.sqrt(af**2 + ag**2)
    p = a * (1.0 - ecc**2)
    incl = (
        np.pi * ((1.0 - fr) * 0.5)
        + 2.0 * fr * np.arctan(np.sqrt(chi**2 + psi**2))
    )
    omega = np.arctan2(chi, psi)
    argp = np.arctan2(ag, af) - fr * omega

    if ecc < SMALL:
        # Circular orbits
        if is_equatorial(incl):
            # Circular equatorial
            truelon = omega
            omega = 0
        else:
            # Circular inclined
            arglat = argp
    else:
        # Elliptical equatorial
        if is_equatorial(incl):
            lonper = argp
            omega = 0

    # Mean anomaly
    m = meanlon - fr * omega - argp
    m = np.mod(m, 2.0 * np.pi)

    # Solve for eccentric anomaly and true anomaly
    e0, nu = newtonm(ecc, m)

    if ecc < SMALL:
        # Circular orbits
        if is_equatorial(incl):
            # Circular equatorial
            truelon = nu
        else:
            # Circular inclined
            arglat = nu - fr * omega

    # Convert back to position and velocity vectors
    return coe2rv(p, ecc, incl, omega, nu, arglat, truelon, lonper)


###############################################################################
# Topocentric Elements
###############################################################################

def tradec2rv(rho, trtasc, tdecl, drho, tdrtasc, tddecl, rseci, vseci):
    """Converts topocentric coordinates (range, right ascension, declination,
    and their rates) into geocentric equatorial (ECI) position and velocity
    vectors.

    References:
        vallado: 2022, p. 254, Eqs. 4-1 to 4-2

    Args:
        rho (float): Satellite range from site in km
        trtasc (float): Topocentric right ascension in radians
        tdecl (float): Topocentric declination in radians
        drho (float): Range rate in km/s
        tdrtasc (float): Topocentric right ascension rate in rad/s
        tddecl (float): Topocentric declination rate in rad/s
        rseci (array-like): ECI site position vector in km
        vseci (np.array): ECI site velocity vector in km/s

    Returns:
        reci (np.array): ECI position vector in km
        veci (np.array): ECI velocity vector in km/s
    """

    # Calculate topocentric slant range vectors
    rhov = np.array([
        rho * np.cos(tdecl) * np.cos(trtasc),
        rho * np.cos(tdecl) * np.sin(trtasc),
        rho * np.sin(tdecl)
    ])

    drhov = np.array([
        drho * np.cos(tdecl) * np.cos(trtasc) - rho * np.sin(tdecl) * np.cos(
            trtasc) * tddecl - rho * np.cos(tdecl) * np.sin(trtasc) * tdrtasc,
        drho * np.cos(tdecl) * np.sin(trtasc) - rho * np.sin(tdecl) * np.sin(
            trtasc) * tddecl + rho * np.cos(tdecl) * np.cos(trtasc) * tdrtasc,
        drho * np.sin(tdecl) + rho * np.cos(tdecl) * tddecl
    ])

    # ECI position and velocity vectors
    reci = rhov + rseci
    veci = drhov + vseci

    return reci, veci


def rv2tradec(reci, veci, rseci, vseci):
    """Converts geocentric equatorial (ECI) position and velocity vectors into
    range, topocentric right ascension, declination, and rates.

    References:
        vallado: 2022, p. 257, Algorithm 26

    Args:
        reci (array-like): ECI position vector in km
        veci (array-like)): ECI velocity vector in km/s
        rseci (array-like)): ECI site position vector in km
        vseci (array-like)): ECI site velocity vector in km/s

    Returns:
        rho (float): Satellite range from site in km
        trtasc (float): Topocentric right ascension in radians
        tdecl (float): Topocentric declination in radians
        drho (float): Range rate in km/s
        dtrtasc (float): Topocentric right ascension rate in rad/s
        dtdecl (float): Topocentric declination rate in rad/s
    """
    # Find ECI slant range vector from site to satellite
    rhoveci = np.array(reci) - np.array(rseci)
    drhoveci = np.array(veci) - np.array(vseci)
    rho = np.linalg.norm(rhoveci)

    # Calculate topocentric right ascension and declination
    temp = np.sqrt(rhoveci[0] ** 2 + rhoveci[1] ** 2)
    if temp < SMALL:
        trtasc = np.arctan2(drhoveci[1], drhoveci[0])
    else:
        trtasc = np.arctan2(rhoveci[1], rhoveci[0])

    # Directly over the North Pole
    if temp < SMALL:
        tdecl = np.sign(rhoveci[2]) * np.pi / 2  # +- 90 deg
    else:
        tdecl = np.arcsin(rhoveci[2] / rho)

    if trtasc < 0.0:
        trtasc += 2.0 * np.pi

    # Calculate topocentric right ascension and declination rates
    temp1 = -rhoveci[1] ** 2 - rhoveci[0] ** 2
    drho = np.dot(rhoveci, drhoveci) / rho
    if abs(temp1) > SMALL:
        dtrtasc = (drhoveci[0] * rhoveci[1] - drhoveci[1] * rhoveci[0]) / temp1
    else:
        dtrtasc = 0.0

    if abs(temp) > SMALL:
        dtdecl = (drhoveci[2] - drho * np.sin(tdecl)) / temp
    else:
        dtdecl = 0.0

    return rho, trtasc, tdecl, drho, dtrtasc, dtdecl

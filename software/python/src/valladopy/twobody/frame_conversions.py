# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 6 June 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np

from ..constants import SMALL, MU
from ..mathtime.vector import rot1, rot3


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
    """Convert from classical elements to position & velocity vectors

    This function finds the position and velocity vectors in geocentric
    equatorial (ijk) system given the classical orbit elements.

    References:
        vallado: 2007, p. 126, Algorithm 10
        chobotov       70

    Parameters:
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
        if incl < SMALL or abs(incl - np.pi) < SMALL:
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
        if incl < SMALL or abs(incl - np.pi) < SMALL:
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

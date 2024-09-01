# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np

from ...constants import RE, ECCEARTHSQRD, SMALL, TWOPI


def site(latgd, lon, alt):
    """Finds the position and velocity vectors for a site.

    The answer is returned in the geocentric equatorial (ECEF) coordinate
    system. Note that the velocity is zero because the coordinate system is
    fixed to the Earth.

    References:
        Vallado: 2001, p. 404-407, Algorithm 47

    Args:
        latgd (float): Geodetic latitude in radians
        lon (float): Longitude of the site in radians
        alt (float): Altitude in km

    Returns:
        rsecef (np.array): ECEF site position vector in km
        vsecef (np.array): ECEF site velocity vector in km/s
    """
    # Compute site position vector
    sinlat = np.sin(latgd)
    cearth = RE / np.sqrt(1.0 - ECCEARTHSQRD * sinlat ** 2)
    rdel = (cearth + alt) * np.cos(latgd)
    rk = ((1.0 - ECCEARTHSQRD) * cearth + alt) * sinlat

    rsecef = np.array([
        rdel * np.cos(lon),
        rdel * np.sin(lon),
        rk
    ])

    # Site velocity vector in ECEF frame is zero
    vsecef = np.array([0.0, 0.0, 0.0])

    return rsecef, vsecef


def findc2c3(znew):
    """Calculates the c2 and c3 functions for the universal variable z.

    References:
        Vallado: 2001, p. 70-71, Algorithm 1

    Args:
        znew (float): z variable in rad^2

    Returns:
        tuple: (c2new, c3new)
            c2new (float): c2 function value
            c3new (float): c3 function value
    """
    if znew > SMALL:
        sqrtz = np.sqrt(znew)
        c2new = (1.0 - np.cos(sqrtz)) / znew
        c3new = (sqrtz - np.sin(sqrtz)) / (sqrtz ** 3)
    elif znew < -SMALL:
        sqrtz = np.sqrt(-znew)
        c2new = (1.0 - np.cosh(sqrtz)) / znew
        c3new = (np.sinh(sqrtz) - sqrtz) / (sqrtz ** 3)
    else:
        c2new = 0.5
        c3new = 1.0 / 6.0

    return c2new, c3new


def lon2nu(jdut1, lon, incl, raan, argp):
    """Converts the longitude of the ascending node to the true anomaly.

    This function calculates the true anomaly (`nu`) of an object
    at a given Julian date (`jdut1`) using the Greenwich Mean Sidereal Time
    (GMST) and orbital elements.

    Args:
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lon (float): Longitude of the ascending node in radians
        incl (float): Orbital inclination in radians
        raan (float): Right ascension of the ascending node in radians
        argp (float): Argument of periapsis in radians

    Returns:
        float: True anomaly (`nu`) in radians (0 to 2pi)
    """
    # Calculate GMST
    ed = jdut1 - 2451544.5  # Elapsed days from 1 Jan 2000, 0 hrs
    gmst = 99.96779469 + 360.9856473662860 * ed + 0.29079e-12 * ed * ed  # deg
    gmst = np.remainder(np.radians(gmst), TWOPI)

    # Check quadrants
    if gmst < 0.0:
        gmst += TWOPI

    # Calculate lambdau
    lambdau = gmst + lon - raan

    # Ensure lambdau is within 0 to 2pi radians
    lambdau = np.mod(lambdau, TWOPI)

    # Calculate argument of latitude
    arglat = np.arctan(np.tan(lambdau) / np.cos(incl))

    # Adjust arglat for quadrants
    if (lambdau >= 0.5 * np.pi) and (lambdau < 1.5 * np.pi):
        arglat += np.pi

    return np.mod(arglat - argp, TWOPI)


def gc2gd(latgc):
    """Converts geocentric latitude to geodetic latitude for positions on the
    surface of the Earth.

    References:
        Vallado: 2001, p. 146, Eq. 3-11

    Args:
        latgc (float): Geocentric latitude in radians

    Returns:
        (float): Geodetic latitude in radians (-pi/2 to pi/2)
    """
    return np.arctan(np.tan(latgc) / (1.0 - ECCEARTHSQRD))


def gd2gc(latgd):
    """Converts geodetic latitude to geocentric latitude for positions on the
    surface of the Earth.

    References:
        Vallado: 2001, p. 146, Eq. 3-11

    Args:
        latgd (float): Geodetic latitude in radians

    Returns:
        (float): Geocentric latitude in radians (-pi/2 to pi/2)
    """
    return np.arctan((1.0 - ECCEARTHSQRD) * np.tan(latgd))

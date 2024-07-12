# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np

from ...constants import RE, ECCEARTHSQRD, SMALL


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
        znew (float): z variable (rad^2)

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

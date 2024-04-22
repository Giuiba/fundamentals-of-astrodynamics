# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from enum import Enum

import numpy as np

from ..constants import SMALL


class OrbitType(Enum):
    CIR_EQUATORIAL = 1  # circular equatorial
    CIR_INCLINED = 2    # circular inclined
    EPH_EQUATORIAL = 3  # elliptical, parabolic, hyperbolic equatorial
    EPH_INCLINED = 4    # elliptical, parabolic, hyperbolic inclined


def determine_orbit_type(ecc, incl, tol=SMALL):
    """Determine the type of orbit based on eccentricity and inclination

    Args:
        ecc (float): The eccentricity of the orbit
        incl (float): The inclination of the orbit in radians.
        tol (float, optional): Small value for tolerance

    Returns:
        OrbitType: The type of orbit categorized into one of the following:
                   - circular equatorial
                   - circular inclined
                   - elliptical, parabolic, hyperbolic equatorial
                   - elliptical, parabolic, hyperbolic inclined
    """
    if ecc < tol:
        if (incl < tol) or (abs(incl - np.pi) < tol):
            return OrbitType.CIR_EQUATORIAL
        else:
            return OrbitType.CIR_INCLINED
    elif (incl < tol) or (abs(incl - np.pi) < tol):
        return OrbitType.EPH_EQUATORIAL
    else:
        return OrbitType.EPH_INCLINED


def newtonnu(ecc, nu, parabolic_lim_deg=168):
    """Solve Kepler's equation given the true anomaly and eccentricity.

    This function solves Kepler's equation when the true anomaly is known.
    The mean and eccentric, parabolic, or hyperbolic anomaly is also found.
    The default parabolic limit at 168 deg is arbitrary. The hyperbolic anomaly
    is also limited. The hyperbolic sine is used because it's not double
    valued.

    References:
        vallado: 2007, p. 85, Algorithm 5

    Args:
        ecc (float): Eccentricity of the orbit
        nu (float): True anomaly in radians
        parabolic_lim_deg (float, optional): The paraboloic limit in degrees

    Returns:
        e0 (float): Eccentric anomaly in radians
        m (float): Mean anomaly in radians
    """
    e0, m = np.inf, np.inf

    # Circular case
    if abs(ecc) < SMALL:
        e0 = nu
        m = nu
    # Elliptical case
    elif ecc < 1.0 - SMALL:
        sine = (np.sqrt(1.0 - ecc**2) * np.sin(nu)) / (1.0 + ecc * np.cos(nu))
        cose = (ecc + np.cos(nu)) / (1.0 + ecc * np.cos(nu))
        e0 = np.arctan2(sine, cose)
        m = e0 - ecc * np.sin(e0)
    # Hyperbolic case
    elif ecc > 1.0 + SMALL:
        if ecc > 1.0 and abs(nu) < np.pi - np.arccos(1.0 / ecc):
            sine = (
                (np.sqrt(ecc**2 - 1.0) * np.sin(nu)) / (1.0 + ecc * np.cos(nu))
            )
            e0 = np.arcsinh(sine)
            m = ecc * np.sinh(e0) - e0
    # Parabolic case
    else:
        if abs(nu) < np.radians(parabolic_lim_deg):
            e0 = np.tan(nu / 2.0)
            m = e0 + (e0**3) / 3.0

    # Update eccentric and mean anomaly to be within (0, 2pi) range
    if ecc < 1.0:
        m = np.fmod(m, 2.0 * np.pi)
        if m < 0.0:
            m += 2.0 * np.pi
        e0 = np.fmod(e0, 2.0 * np.pi)

    return e0, m

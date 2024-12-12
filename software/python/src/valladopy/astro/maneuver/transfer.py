# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from typing import Tuple

import numpy as np

from ... import constants as const


def hohmann(
    rinit: float,
    rfinal: float,
    einit: float,
    efinal: float,
    nuinit: float,
    nufinal: float,
) -> Tuple[float, float, float]:
    """Calculates the delta-v values for a Hohmann transfer, either circle-to-circle
    or ellipse-to-ellipse.

    References:
        Vallado 2007, p. 327, Algorithm 36

    Args:
        rinit (float): Initial position magnitude in km
        rfinal (float): Final position magnitude in km
        einit (float): Eccentricity of the initial orbit
        efinal (float): Eccentricity of the final orbit
        nuinit (float): True anomaly of the initial orbit in radians (0 or pi)
        nufinal (float): True anomaly of the final orbit in radians (0 or pi)

    Returns:
        tuple: (deltava, deltavb, dttu)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            dttu (float): Time of flight for the transfer in seconds
    """
    # Semi-major axes of initial, transfer, and final orbits
    ainit = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    atran = (rinit + rfinal) / 2.0
    afinal = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Initialize outputs
    deltava, deltavb, dttu = 0.0, 0.0, 0.0

    if einit < 1.0 or efinal < 1.0:
        # Calculate delta-v at point A
        vinit = np.sqrt((2.0 * const.MU) / rinit - (const.MU / ainit))
        vtrana = np.sqrt((2.0 * const.MU) / rinit - (const.MU / atran))
        deltava = np.abs(vtrana - vinit)

        # Calculate delta-v at point B
        vfinal = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / afinal))
        vtranb = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / atran))
        deltavb = np.abs(vfinal - vtranb)

        # Calculate transfer time of flight
        dttu = np.pi * np.sqrt(atran**3 / const.MU)

    return deltava, deltavb, dttu


def bielliptic(
    rinit: float,
    rb: float,
    rfinal: float,
    einit: float,
    efinal: float,
    nuinit: float,
    nufinal: float,
) -> tuple[float, float, float, float]:
    """Calculates the delta-v values for a bi-elliptic transfer, either circle-to-circle
    or ellipse-to-ellipse.

    References:
        Vallado 2007, pp. 327, Algorithm 37

    Args:
        rinit (float): Initial position magnitude in km
        rb (float): Intermediate position magnitude in km
        rfinal (float): Final position magnitude in km
        einit (float): Eccentricity of the initial orbit
        efinal (float): Eccentricity of the final orbit
        nuinit (float): True anomaly of the initial orbit in radians (0 or pi)
        nufinal (float): True anomaly of the final orbit in radians (0 or pi)

    Returns:
        tuple: (deltava, deltavb, deltavc, dttu)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            deltavc (float): Change in velocity at point C in km/s
            dttu (float): Time of flight for the transfer in seconds
    """
    # Semi-major axes of initial, transfer, and final orbits
    ainit = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    atran1 = (rinit + rb) * 0.5
    atran2 = (rb + rfinal) * 0.5
    afinal = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Initialize outputs
    deltava, deltavb, deltavc, dttu = 0.0, 0.0, 0.0, 0.0

    # Check if inputs represent elliptical orbits
    if einit < 1.0 and efinal < 1.0:
        # Calculate delta-v at point A
        vinit = np.sqrt((2.0 * const.MU) / rinit - (const.MU / ainit))
        vtran1a = np.sqrt((2.0 * const.MU) / rinit - (const.MU / atran1))
        deltava = np.abs(vtran1a - vinit)

        # Calculate delta-v at point B
        vtran1b = np.sqrt((2.0 * const.MU) / rb - (const.MU / atran1))
        vtran2b = np.sqrt((2.0 * const.MU) / rb - (const.MU / atran2))
        deltavb = np.abs(vtran1b - vtran2b)

        # Calculate delta-v at point C
        vtran2c = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / atran2))
        vfinal = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / afinal))
        deltavc = np.abs(vfinal - vtran2c)

        # Calculate total time of flight
        dttu = np.pi * np.sqrt(atran1**3 / const.MU) + np.pi * np.sqrt(
            atran2**3 / const.MU
        )

    return deltava, deltavb, deltavc, dttu


def onetangent(
    rinit: float,
    rfinal: float,
    efinal: float,
    nuinit: float,
    nutran: float,
    tol: float = 1e-6,
) -> tuple[float, float, float, float, float, float, float]:
    """Calculates the delta-v values for a one tangent transfer, either circle-to-circle
    or ellipse-to-ellipse.

    References:
        Vallado 2007, p. 335, Algorithm 38

    Args:
        rinit (float): Initial position magnitude in km
        rfinal (float): Final position magnitude in km
        efinal (float): Eccentricity of the final orbit
        nuinit (float): True anomaly of the initial orbit in radians (0 or pi)
        nutran (float): True anomaly of the transfer orbit in radians
                        (same quadrant as `nuinit`)
        tol (float): Tolerance for checking if transfer orbit is valid (default 1e-6)

    Returns:
        tuple: (deltava, deltavb, dttu, etran, atran, vtrana, vtranb)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            dttu (float): Time of flight for the transfer in seconds
            etran (float): Eccentricity of the transfer orbit
            atran (float): Semi-major axis of the transfer orbit in km
            vtrana (float): Velocity of the transfer orbit at point A in km/s
            vtranb (float): Velocity of the transfer orbit at point B in km/s

    Raises:
        ValueError: If the one-tangent burn is not possible for the given inputs
    """
    # Initialize variables
    dttu = 0.0

    # Ratio of initial to final orbit radii
    ratio = rinit / rfinal

    # Determine eccentricity of transfer orbit
    if abs(nuinit) < 0.01:  # near 0 or 180 degrees
        etran = (ratio - 1.0) / (np.cos(nutran) - ratio)
    else:
        etran = (ratio - 1.0) / (np.cos(nutran) + ratio)

    # Check if transfer orbit is valid
    if etran >= 0.0:
        # Semi-major axes of initial, final, and transfer orbits
        afinal = (rfinal * (1.0 + efinal * np.cos(nutran))) / (1.0 - efinal**2)

        if abs(etran - 1.0) > tol:
            atran = (rinit * (1.0 + etran * np.cos(nuinit))) / (1.0 - etran**2)
        else:
            atran = np.inf  # parabolic orbit (infinite semi-major axis)

        # Calculate velocities
        vinit = np.sqrt(const.MU / rinit)
        vtrana = np.sqrt((2.0 * const.MU) / rinit - (const.MU / atran))
        deltava = np.abs(vtrana - vinit)

        vfinal = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / afinal))
        vtranb = np.sqrt((2.0 * const.MU) / rfinal - (const.MU / atran))
        fpatranb = np.arctan2(etran * np.sin(nutran), 1.0 + etran * np.cos(nutran))
        fpafinal = np.arctan2(efinal * np.sin(nutran), 1.0 + efinal * np.cos(nutran))
        deltavb = np.sqrt(
            vtranb**2 + vfinal**2 - 2.0 * vtranb * vfinal * np.cos(fpatranb - fpafinal)
        )

        # Calculate time of flight
        if etran < 1.0:
            sinv = (np.sqrt(1.0 - etran**2) * np.sin(nutran)) / (
                1.0 + etran * np.cos(nutran)
            )
            cosv = (etran + np.cos(nutran)) / (1.0 + etran * np.cos(nutran))
            e = np.arctan2(sinv, cosv)
            eainit = 0.0 if abs(nuinit) < 0.01 else np.pi
            dttu = np.sqrt(atran**3 / const.MU) * (
                e - etran * np.sin(e) - (eainit - etran * np.sin(eainit))
            )
    else:
        raise ValueError("The one-tangent burn is not possible for this case.")

    return deltava, deltavb, dttu, etran, atran, vtrana, vtranb

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

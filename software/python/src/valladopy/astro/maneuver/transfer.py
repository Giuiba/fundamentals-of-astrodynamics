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
        Vallado 2007, pp. 327, Algorithm 36

    Args:
        rinit (float): Initial position magnitude in km
        rfinal (float): Final position magnitude in km
        einit (float): Eccentricity of the initial orbit
        efinal (float): Eccentricity of the final orbit
        nuinit (float): True anomaly of the initial orbit in radians (0 or pi)
        nufinal (float): True anomaly of the final orbit in radians (0 or pi)

    Returns:
        tuple: (deltava, deltavb, dttu)
            - deltava (float): Change in velocity at point A in km/s
            - deltavb (float): Change in velocity at point B in km/s
            - dttu (float): Time of flight for the transfer in seconds
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

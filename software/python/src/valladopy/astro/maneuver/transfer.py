# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from typing import Tuple

import numpy as np


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

    Args:
        rinit: Initial position magnitude (in er).
        rfinal: Final position magnitude (in er).
        einit: Eccentricity of the initial orbit.
        efinal: Eccentricity of the final orbit.
        nuinit: True anomaly of the initial orbit (0 or pi radians).
        nufinal: True anomaly of the final orbit (0 or pi radians).

    Returns:
        tuple: A tuple containing:
            - deltava (float): Change in velocity at point A (in er/tu).
            - deltavb (float): Change in velocity at point B (in er/tu).
            - dttu (float): Time of flight for the transfer (in tu).
    """
    # Gravitational parameter in canonical units
    mu = 1.0

    # Semi-major axes of initial, transfer, and final orbits
    ainit = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    atran = (rinit + rfinal) / 2.0
    afinal = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Initialize outputs
    deltava, deltavb, dttu = 0.0, 0.0, 0.0

    if einit < 1.0 or efinal < 1.0:
        # Calculate delta-v at point A
        vinit = np.sqrt((2.0 * mu) / rinit - (mu / ainit))
        vtrana = np.sqrt((2.0 * mu) / rinit - (mu / atran))
        deltava = np.abs(vtrana - vinit)

        # Calculate delta-v at point B
        vfinal = np.sqrt((2.0 * mu) / rfinal - (mu / afinal))
        vtranb = np.sqrt((2.0 * mu) / rfinal - (mu / atran))
        deltavb = np.abs(vfinal - vtranb)

        # Calculate transfer time of flight
        dttu = np.pi * np.sqrt(atran**3 / mu)

    return deltava, deltavb, dttu

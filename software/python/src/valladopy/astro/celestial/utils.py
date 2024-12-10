# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 31 Oct 2003
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import logging
from enum import Enum

import numpy as np
from numpy.typing import ArrayLike

from ... import constants as const


# Set up logging
logger = logging.getLogger(__name__)


class EarthModel(Enum):
    SPHERICAL = "s"
    ELLIPSOIDAL = "e"


def in_sight(
    r1: ArrayLike, r2: ArrayLike, earth_model: EarthModel = EarthModel.ELLIPSOIDAL
) -> bool:
    """Determines if there is line-of-sight (LOS) between two satellites, considering
    the Earth's shape.

    References:
        Vallado: 2001, p. 291-295, Algorithm 35

    Args:
        r1 (array_like): Position vector of the first satellite in km
        r2 (array_like): Position vector of the second satellite in km
        earth_model (EarthModel, optional): Earth model to use (default is ELLIPSOIDAL)

    Returns:
        bool: True if there is line-of-sight, False otherwise
    """
    # Magnitudes
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)

    # Scale z-components for ellipsoidal Earth
    temp = (
        1.0 / np.sqrt(1.0 - const.ECCEARTHSQRD)
        if earth_model == EarthModel.ELLIPSOIDAL
        else 1.0
    )
    tr1 = np.array([r1[0], r1[1], r1[2] * temp])
    tr2 = np.array([r2[0], r2[1], r2[2] * temp])

    # Compute magnitudes and dot product
    asqrd = magr1**2
    bsqrd = magr2**2
    adotb = np.dot(tr1, tr2)

    # Compute minimum parametric value
    if abs(asqrd + bsqrd - 2.0 * adotb) < 1e-4:
        tmin = 0.0
    else:
        tmin = (asqrd - adotb) / (asqrd + bsqrd - 2.0 * adotb)
    logger.debug(f"Minimum parametric value (tmin): {tmin}")

    # Check line-of-sight (LOS)
    if tmin < 0.0 or tmin > 1.0:
        return True
    else:
        distsqrd = ((1.0 - tmin) * asqrd + adotb * tmin) / const.RE**2
        return True if distsqrd > 1.0 else False

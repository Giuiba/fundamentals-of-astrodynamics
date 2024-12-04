# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import warnings
from typing import Tuple

import numpy as np

from ... import constants as const
from ...mathtime.vector import unit


def gibbs(
    r1: np.ndarray, r2: np.ndarray, r3: np.ndarray, orbit_tol: float = 1e-6
) -> Tuple[np.ndarray, float, float, float]:
    """Performs the Gibbs method for orbit determination.

    Args:
        r1 (np.ndarray): ECI position vector #1 in km
        r2 (np.ndarray): ECI position vector #2 in km
        r3 (np.ndarray): ECI position vector #3 in km
        orbit_tol (float, optional): Tolerance for orbit determination (default 1e-6)

    Returns:
        tuple: (v2, theta12, theta23, copa)
            v2 (np.ndarray): ECI velocity vector at r2 in km/s
            theta12 (float): Angle between r1 and r2 in radians
            theta23 (float): Angle between r2 and r3 in radians
            copa (float): Co-planarity angle in radians
    """
    # Initialize variables
    theta12, theta23 = 0.0, 0.0

    # Magnitudes of position vectors
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)
    magr3 = np.linalg.norm(r3)

    # Initialize velocity vector
    v2 = np.zeros(3)

    # Cross products
    p = np.cross(r2, r3)
    q = np.cross(r3, r1)
    w = np.cross(r1, r2)

    # Unit vectors
    pn = unit(p)
    r1n = unit(r1)

    # Co-planarity angle
    copa = np.arcsin(np.dot(pn, r1n))

    # Check for coplanarity
    if abs(np.dot(r1n, pn)) > np.sin(np.radians(1)):
        warnings.warn(
            "Vectors are not coplanar - results might be inaccurate.", UserWarning
        )

    # Sum of cross products
    d = p + q + w
    magd = np.linalg.norm(d)

    # Weighted sum of position vectors
    n = magr1 * p + magr2 * q + magr3 * w
    magn = np.linalg.norm(n)

    # Check if orbit determination is possible
    # Both `d` and `n` must be in the same direction and non-zero
    if any(x < orbit_tol for x in [magd, magn, np.dot(unit(n), unit(d))]):
        warnings.warn("Orbit determination is not possible.", UserWarning)
        return v2, theta12, theta23, copa

    # Angles between position vectors
    theta12 = np.arccos(np.clip(np.dot(r1, r2) / (magr1 * magr2), -1, 1))
    theta23 = np.arccos(np.clip(np.dot(r2, r3) / (magr2 * magr3), -1, 1))

    # Differences in position vector magnitudes
    r1mr2 = magr1 - magr2
    r3mr1 = magr3 - magr1
    r2mr3 = magr2 - magr3

    # S vector
    s = r1mr2 * np.array(r3) + r3mr1 * np.array(r2) + r2mr3 * np.array(r1)

    # B vector
    b = np.cross(d, r2)

    # Scaling factor
    lg = np.sqrt(const.MU / (magd * magn))

    # Compute velocity at r2
    tover2 = lg / magr2
    v2 = tover2 * b + lg * s

    return v2, theta12, theta23, copa

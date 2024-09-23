# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np

from ...constants import MU, SMALL, TWOPI


def lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec):
    """Accomplishes a 180-degree (and 360-degree) transfer for the Lambert
    problem.

    Reference:
        Thompson JGCD 2013 v34 n6 1925
        Thompson AAS GNC 2018

    Args:
        r1 (array_like): Initial position vector in km
        v1 (array_like): Initial velocity vector in km/s
        r2 (array_like): Final position vector in km
        p (float): Semi-parameter of transfer orbit in km
        ecc (float): Eccentricity of the transfer orbit
        dnu (float): Change in true anomaly in radians
        dtsec (float): Time between r1 and r2 in seconds

    Returns:
        tuple: (v1t, v2t)
            v1t (np.ndarray): Transfer velocity vector at r1 in km/s
            v2t (np.ndarray): Transfer velocity vector at r2 in km/s
    """
    # Create numpy arrays and compute magnitudes of r1 and r2
    r1 = np.array(r1)
    r2 = np.array(r2)
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)

    # Compute parameters a and b
    a = MU * (1.0 / magr1 - 1.0 / p)
    b = (MU * ecc / p) ** 2 - a ** 2

    # Calculate x1 based on b
    x1 = 0.0 if b <= 0.0 else -np.sqrt(b)

    # 180-degree or multiple 180-degree transfers
    if abs(np.sin(dnu)) < SMALL:
        # Check that the cross product norm is not zero
        cross_product_r1_v1 = np.cross(r1, v1)
        norm_cross_r1_v1 = np.linalg.norm(cross_product_r1_v1)
        if norm_cross_r1_v1 < SMALL:
            raise ValueError(
                'Vectors r1 and v1 are parallel or nearly parallel;'
                ' the vector normal is undefined.'
            )

        # Normal vector
        nvec = cross_product_r1_v1 / norm_cross_r1_v1

        # Adjust the direction of x1 based on the time of flight
        if ecc < 1.0:
            ptx = TWOPI * np.sqrt(p ** 3 / (MU * (1.0 - ecc ** 2) ** 3))
            if dtsec % ptx > ptx * 0.5:
                x1 = -x1
    else:
        # Common path
        y2a = MU / p - x1 * np.sin(dnu) + a * np.cos(dnu)
        y2b = MU / p + x1 * np.sin(dnu) + a * np.cos(dnu)
        if abs(MU / magr2 - y2b) < abs(MU / magr2 - y2a):
            x1 = -x1

        # Check that the cross product norm is not zero
        cross_product_r1_r2 = np.cross(r1, r2)
        norm_cross_r1_r2 = np.linalg.norm(cross_product_r1_r2)
        if norm_cross_r1_r2 < SMALL:
            raise ValueError(
                'Vectors r1 and r2 are parallel or nearly parallel;'
                ' the vector normal is undefined.'
            )

        # Normal vector
        # Depending on the cross product, this will be normal, in plane, or
        # even a fan
        nvec = cross_product_r1_r2 / norm_cross_r1_r2
        if dnu % TWOPI > np.pi:
            nvec = -nvec

    # Compute transfer velocity vectors
    v1t = (
        (np.sqrt(MU * p) / magr1)
        * ((x1 / MU) * r1 + np.cross(nvec, r1) / magr1)
    )
    x2 = x1 * np.cos(dnu) + a * np.sin(dnu)
    v2t = (
        (np.sqrt(MU * p) / magr2)
        * ((x2 / MU) * r2 + np.cross(nvec, r2) / magr2)
    )

    return v1t, v2t

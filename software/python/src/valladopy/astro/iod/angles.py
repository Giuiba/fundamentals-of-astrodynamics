# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------


import numpy as np
from numpy.typing import ArrayLike
from typing import Tuple

from ... import constants as const


def anglesl(
    decl1: float,
    decl2: float,
    decl3: float,
    rtasc1: float,
    rtasc2: float,
    rtasc3: float,
    jd1: float,
    jdf1: float,
    jd2: float,
    jdf2: float,
    jd3: float,
    jdf3: float,
    diffsites: bool,
    rs1: ArrayLike,
    rs2: ArrayLike,
    rs3: ArrayLike,
) -> Tuple[np.ndarray, np.ndarray]:
    """Solve orbit determination problem using three optical sightings and Laplace's
    method.

    References:
        Vallado: 2001, p. 413-417

    Args:
        decl1 (float): Declination of first sighting in radians
        decl2 (float): Declination of second sighting in radians
        decl3 (float): Declination of third sighting in radians
        rtasc1 (float): Right ascension of first sighting in radians
        rtasc2 (float): Right ascension of second sighting in radians
        rtasc3 (float): Right ascension of third sighting in radians
        jd1 (float): Julian date of first sighting (days from 4713 BC)
        jdf1 (float): Julian date fraction of first sighting (days from 4713 BC)
        jd2 (float): Julian date of second sighting (days from 4713 BC)
        jdf2 (float): Julian date fraction of second sighting (days from 4713 BC)
        jd3 (float): Julian date of third sighting (days from 4713 BC)
        jdf3 (float): Julian date fraction of third sighting (days from 4713 BC)
        diffsites (bool): True if different sites, False if same site
        rs1 (array_like): ECI site position vector of first sighting in km
        rs2 (array_like):  ECI site position vector of second sighting in km
        rs3 (array_like):  ECI site position vector of third sighting in km

    Returns:
        tuple: (reci, veci)
            reci (np.ndarray): ECI position vector in km
            veci (np.ndarray): ECI velocity vector in km/s
    """
    # Convert Julian dates to time intervals
    tau12 = ((jd1 - jd2) + (jdf1 - jdf2)) * const.DAY2SEC
    tau13 = ((jd1 - jd3) + (jdf1 - jdf3)) * const.DAY2SEC
    tau32 = ((jd3 - jd2) + (jdf3 - jdf2)) * const.DAY2SEC

    # Line-of-sight unit vectors
    los1 = np.array(
        [np.cos(decl1) * np.cos(rtasc1), np.cos(decl1) * np.sin(rtasc1), np.sin(decl1)]
    )
    los2 = np.array(
        [np.cos(decl2) * np.cos(rtasc2), np.cos(decl2) * np.sin(rtasc2), np.sin(decl2)]
    )
    los3 = np.array(
        [np.cos(decl3) * np.cos(rtasc3), np.cos(decl3) * np.sin(rtasc3), np.sin(decl3)]
    )

    # Check denominators for zero to avoid division errors
    if any(tau == 0 for tau in (tau12, tau13, tau32)):
        raise ValueError(
            "One or more time intervals (tau12, tau13, tau32) are zero, causing"
            "division by zero."
        )

    # Lagrange coefficients
    s1 = -tau32 / (tau12 * tau13)
    s2 = (tau12 + tau32) / (tau12 * tau32)
    s3 = -tau12 / (-tau13 * tau32)
    s4 = 2.0 / (tau12 * tau13)
    s5 = 2.0 / (tau12 * tau32)
    s6 = 2.0 / (-tau13 * tau32)

    # First and second derivatives of los2
    ldot = s1 * los1 + s2 * los2 + s3 * los3
    lddot = s4 * los1 + s5 * los2 + s6 * los3

    # First and second derivatives of rs2
    if not diffsites:
        earth_rot_vec = [0.0, 0.0, const.EARTHROT]
        rs2dot = np.cross(earth_rot_vec, rs2)
        rs2ddot = np.cross(earth_rot_vec, rs2dot)
    else:
        rs2dot = s1 * np.array(rs1) + s2 * np.array(rs2) + s3 * np.array(rs3)
        rs2ddot = s4 * np.array(rs1) + s5 * np.array(rs2) + s6 * np.array(rs3)

    # Determinants for position and velocity
    dmat = np.column_stack((los2, ldot, lddot))
    dmat1 = np.column_stack((los2, ldot, rs2ddot))
    dmat2 = np.column_stack((los2, ldot, rs2))
    dmat3 = np.column_stack((los2, rs2ddot, lddot))
    dmat4 = np.column_stack((los2, rs2, lddot))

    d = 2.0 * np.linalg.det(dmat)
    d1 = np.linalg.det(dmat1)
    d2 = np.linalg.det(dmat2)
    d3 = np.linalg.det(dmat3)
    d4 = np.linalg.det(dmat4)

    # Check determinant value
    if abs(d) < const.SMALL:
        raise ValueError("Determinant is too small; system may be singular.")

    # Solve the 8th-order polynomial
    l2dotrs = np.dot(los2, rs2)
    poly = np.zeros(9)
    poly[0] = 1.0
    poly[2] = l2dotrs * 4.0 * d1 / d - 4.0 * d1**2 / d**2 - np.linalg.norm(rs2) ** 2
    poly[5] = const.MU * (l2dotrs * 4.0 * d2 / d - 8.0 * d1 * d2 / d**2)
    poly[8] = -4.0 * const.MU**2 * d2**2 / d**2
    roots = np.roots(poly)

    # Select the appropriate root
    bigr2 = max(root.real for root in roots if root.imag == 0 and root.real > 0)

    # Solve for rho and rho dot
    rho = -2.0 * d1 / d - 2.0 * const.MU * d2 / (bigr2**3 * d)
    rhodot = -d3 / d - const.MU * d4 / (bigr2**3 * d)

    # Position and velocity vectors
    reci = rho * los2 + rs2
    veci = rhodot * los2 + rho * ldot + rs2dot

    return reci, veci

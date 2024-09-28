# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np
from enum import Enum

from ...constants import MU, SMALL, TWOPI


class Direction(Enum):
    """Enum class for the direction of motion."""""
    LONG = 'L'
    SHORT = 'S'


def seebatt(v):
    """Recursively calculates a value used in the Lambert Battin problem using
    predefined coefficients.

    Args:
        v (float): Input value for the recursive calculations (v > -1)

    Returns:
        float: The computed value

    Raises:
        ValueError: If `v` is less than -1
    """
    # Check that v is greater than -1
    if v <= -1:
        raise ValueError('Input value v must be greater than -1.')

    # Coefficients derived from Battin's recursive series
    c = [
        9.0 / 7.0,
        16.0 / 63.0,
        25.0 / 99.0,
        36.0 / 143.0,
        49.0 / 195.0,
        64.0 / 255.0,
        81.0 / 323.0,
        100.0 / 399.0,
        121.0 / 483.0,
        144.0 / 575.0,
        169.0 / 675.0,
        196.0 / 783.0,
        225.0 / 899.0,
        256.0 / 1023.0,
        289.0 / 1155.0,
        324.0 / 1295.0,
        361.0 / 1443.0,
        400.0 / 1599.0,
        441.0 / 1763.0,
        484.0 / 1935.0
    ]

    # Recursive formulaiton for the Lambert problem
    sqrtopv = np.sqrt(1.0 + v)
    eta = v / (1.0 + sqrtopv)**2
    ktr = 20
    term2 = 1.0 + c[ktr - 1] * eta
    for j in range(ktr - 2, -1, -1):
        term2 = 1.0 + (c[j] * eta / term2)

    return (
        8.0
        * (1.0 + sqrtopv)
        / (3.0 + (1.0 / (5.0 + eta + ((9.0 / 7.0) * eta / term2))))
    )


def kbatt(v):
    """Recursively calculates a value used in the Lambert Battin problem using
    predefined coefficients.

    Args:
        v (float): Input value for the recursive calculations

    Returns:
        float: The computed value
    """
    # Coefficients derived from Battin's recursive series
    d = [
        1.0 / 3.0,
        4.0 / 27.0,
        8.0 / 27.0,
        2.0 / 9.0,
        22.0 / 81.0,
        208.0 / 891.0,
        340.0 / 1287.0,
        418.0 / 1755.0,
        598.0 / 2295.0,
        700.0 / 2907.0,
        928.0 / 3591.0,
        1054.0 / 4347.0,
        1330.0 / 5175.0,
        1480.0 / 6075.0,
        1804.0 / 7047.0,
        1978.0 / 8091.0,
        2350.0 / 9207.0,
        2548.0 / 10395.0,
        2968.0 / 11655.0,
        3190.0 / 12987.0,
        3658.0 / 14391.0
    ]

    # Initial values
    sum1 = d[0]
    delold = 1.0
    termold = d[0]
    i = 1

    # Process forwards
    ktr = 21
    while i < ktr and abs(termold) > 1e-8:
        del_ = 1.0 / (1.0 + d[i] * v * delold)
        term = termold * (del_ - 1.0)
        sum1 += term
        i += 1
        delold = del_
        termold = term

    # Process backwards
    term2 = 1.0 + d[-1] * v
    for i in range(ktr - 2):
        sum2 = d[ktr - i - 2] * v / term2
        term2 = 1.0 + sum2

    return d[0] / term2


def lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec):
    """Accomplishes a 180-degree (and 360-degree) transfer for the Lambert
    problem.

    References:
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


def lambertmin(r1, r2, dm, nrev):
    """Solves the Lambert minimum energy problem.

    Args:
        r1 (array_like): Initial ECI position vector in km
        r2 (array_like): Final ECI position vector in km
        dm (Direction): Direction of motion, either LONG or SHORT
        nrev (int): Number of revolutions (0, 1, 2, ...)

    Returns:
        tuple: (v, aminenergy, tminenergy, tminabs)
            v (np.ndarray): Minimum energy velocity vector in km/s
            aminenergy (float): Minimum energy semi-major axis in km
            tminenergy (float): Minimum energy time of flight in seconds
            tminabs (float): Minimum time of flight (parabolic) in seconds
    """
    # Create numpy arrays and compute magnitudes of r1 and r2
    r1 = np.array(r1)
    r2 = np.array(r2)
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)

    # Compute the cosine of the angle between the two position vectors
    cosdeltanu = np.dot(r1, r2) / (magr1 * magr2)

    # Compute the minimum energy semi-major axis
    c = np.sqrt(magr1**2 + magr2**2 - 2.0 * magr1 * magr2 * cosdeltanu)
    s = 0.5 * (magr1 + magr2 + c)
    aminenergy = 0.5 * s

    # Define alphae and betae
    alphae = np.pi
    betae = 2.0 * np.arcsin(np.sqrt((s - c) / s))

    # Compute the minimum energy time of flight
    # Use multiplier based on direction of motion
    sign = 1 if dm == Direction.SHORT else -1
    tminenergy = (
        np.sqrt(aminenergy**3 / MU)
        * (2.0 * nrev * np.pi + alphae + sign * (betae - np.sin(betae)))
    )

    # Calculate the parabolic time of flight, which serves as the minimum limit
    tminabs = (1.0 / 3.0) * np.sqrt(2.0 / MU) * (s**1.5 - (s - c)**1.5)

    # Compute intermediate values
    rcrossr = np.cross(r1, r2)
    magrcrossr = np.linalg.norm(rcrossr)
    pmin = magr1 * magr2 / c * (1.0 - cosdeltanu)
    sindeltanu = magrcrossr / (magr1 * magr2) * sign

    # Compute the minimum energy velocity vector
    v = (
        (np.sqrt(MU * pmin) / (magr1 * magr2 * sindeltanu))
        * (r2 - (1.0 - magr2 / pmin * (1.0 - cosdeltanu)) * r1)
    )

    return v, aminenergy, tminenergy, tminabs

# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np
from enum import Enum
from numpy.typing import ArrayLike
from typing import Tuple

from ...constants import MU, SMALL, TWOPI


class DirectionOfMotion(Enum):
    """Enum class for the direction of motion."""""
    LONG = 'L'   # Long way
    SHORT = 'S'  # Short way


class DirectionOfEnergy(Enum):
    """Enum class for the direction of energy."""""
    LONG = 'L'             # Long way
    HYPERBOLICSHORT = 'H'  # Hyperbolic and Short way


class DirectionOfFlight(Enum):
    """Enum class for the direction of flight."""
    DIRECT = 'D'       # Direct motion
    RETROGRADE = 'R'   # Retrograde motion


def seebatt(v: float) -> float:
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


def kbatt(v: float) -> float:
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


def lambhodograph(r1: ArrayLike, v1: ArrayLike, r2: ArrayLike, p: float,
                  ecc: float, dnu: float,
                  dtsec: float) -> Tuple[np.ndarray, np.ndarray]:
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


def lambertmin(r1: ArrayLike, r2: ArrayLike, dm: DirectionOfMotion,
               nrev: int) -> Tuple[np.ndarray, float, float, float]:
    """Solves the Lambert minimum energy problem.

    Args:
        r1 (array_like): Initial ECI position vector in km
        r2 (array_like): Final ECI position vector in km
        dm (DirectionOfMotion): Direction of motion (LONG or SHORT)
        nrev (int): Number of revolutions (0, 1, 2, ...)

    Returns:
        tuple: (v, aminenergy, tminenergy, tminabs)
            v (np.ndarray): Minimum energy velocity vector in km/s
            aminenergy (float): Minimum energy semi-major axis in km
            tminenergy (float): Minimum energy time of flight in seconds
            tminabs (float): Minimum time of flight (parabolic) in seconds

    Raises:
        ValueError: If `dm` is not of type `DirectionOfMotion`
    """
    # Check that `dm` is of type `DirectionOfMotion`
    if not isinstance(dm, DirectionOfMotion):
        raise ValueError(
            f'Invalid direction of motion: {dm}. Must be of type'
            f' {DirectionOfMotion}.'
        )

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
    sign = 1 if dm == DirectionOfMotion.SHORT else -1
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


def lambertmint(r1: ArrayLike, r2: ArrayLike, dm: DirectionOfMotion,
                de: DirectionOfEnergy, nrev: int, fa_tol: float = 1e-5,
                fa_iter: int = 20) -> Tuple[float, float, float]:
    """Solves Lambert's problem to find the minimum time of flight for
    the multi-revolution cases.

    References:
        Vallado: 2013, p. 494, Algorithm 59
        Prussing: JAS 2000

    Args:
        r1 (array_like): Initial ECI position vector in km
        r2 (array_like): Final ECI position vector in km
        dm (DirectionOfMotion): Direction of motion (LONG or SHORT)
        de (DirectionOfEnergy): Direction of energy (LONG or HYPERBOLICSHORT)
        nrev (int): Number of revolutions (0, 1, 2, ...)
        fa_tol (float, optional): Tolerance for the Prussing method min TOF
                                  (defaults to 1e-5)
        fa_iter (int, optional): Maximum number of iterations for the Prussing
                                 method min TOF (defaults to 20)

    Returns:
        tuple:
            tmin (float): Minimum time of flight in seconds
            tminp (float): Minimum time of flight (parabolic) in seconds
            tminenergy (float): Minimum energy time of flight in seconds

    Raises:
        ValueError: If `dm` or `de` are not of type `DirectionOfMotion` or
                    `DirectionOfEnergy`, respectively
    """
    # Check that `dm` and `de` are the correct types
    if not isinstance(dm, DirectionOfMotion):
        raise ValueError(
            f'Invalid direction of motion: {dm}. Must be of type'
            f' {DirectionOfMotion}.'
        )
    if not isinstance(de, DirectionOfEnergy):
        raise ValueError(
            f'Invalid direction of energy: {de}. Must be of type'
            f' {DirectionOfEnergy}.'
        )

    # Create numpy arrays and compute magnitudes of r1 and r2
    r1 = np.array(r1)
    r2 = np.array(r2)
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)
    cosdeltanu = np.dot(r1, r2) / (magr1 * magr2)
    cosdeltanu = np.clip(cosdeltanu, -1.0, 1.0)  # ensure it's within [-1, 1]

    # Calculate chord and semiperimeter
    chord = np.sqrt(magr1**2 + magr2**2 - 2.0 * magr1 * magr2 * cosdeltanu)
    s = (magr1 + magr2 + chord) * 0.5

    # Multipliers based on direction of motion and energy
    sign_dm = 1 if dm == DirectionOfMotion.LONG else -1
    sign_de = 1 if de == DirectionOfEnergy.LONG else -1

    # Calculate minimum parabolic time of flight tasee if orbit is possible
    tminp = (
        (1.0 / 3.0)
        * np.sqrt(2.0 / MU)
        * ((s**1.5) + sign_dm * (s - chord)**1.5)
    )

    # Calculate minimum energy ellipse time of flight
    amin = 0.5 * s
    beta = 2.0 * np.arcsin(np.sqrt((s - chord) / s))
    tminenergy = (
        (amin**1.5)
        * ((2.0 * nrev + 1.0) * np.pi
           + sign_dm * (beta - np.sin(beta))) / np.sqrt(MU)
    )

    # Iteratively calculate the minimum time of flight (ellipse)
    # using Prussing method (Prussing 1992 AAS, 2000 JAS, Stern 1964 p. 230)
    an = 1.001 * amin
    i = 1
    fa = 10.0
    xi, eta = 0.0, 0.0
    while abs(fa) > fa_tol and i <= fa_iter:
        a = an
        alp = 1.0 / a
        alpha = 2.0 * np.arcsin(np.sqrt(0.5 * s * alp))
        beta = sign_de * 2.0 * np.arcsin(np.sqrt(0.5 * (s - chord) * alp))
        xi = alpha - beta
        eta = np.sin(alpha) - np.sin(beta)
        fa = (
            (6.0 * nrev * np.pi + 3.0 * xi - eta) * (np.sin(xi) + eta)
            - 8.0 * (1.0 - np.cos(xi))
        )
        fadot = (
            (
                (6.0 * nrev * np.pi + 3.0 * xi - eta)
                * (np.cos(xi) + np.cos(alpha))
                + (3.0 - np.cos(alpha)) * (np.sin(xi) + eta)
                - 8.0 * np.sin(xi)
            )
            * (-alp * np.tan(0.5 * alpha))
            + (
                (6.0 * nrev * np.pi + 3.0 * xi - eta)
                * (-np.cos(xi) - np.cos(alpha))
                + (-3.0 - np.cos(beta)) * (np.sin(xi) + eta)
                + 8.0 * np.sin(xi)
            )
            * (-alp * np.tan(0.5 * beta))
        )
        an = a - fa / fadot
        i += 1

    # Calculate the minimum time of flight
    tmin = (an**1.5) * (TWOPI * nrev + xi + sign_dm * eta) / np.sqrt(MU)

    return tmin, tminp, tminenergy


def lambertb(r1: ArrayLike, v1: ArrayLike, r2: ArrayLike,
             dm: DirectionOfMotion, df: DirectionOfFlight, nrev: int,
             dtsec: float) -> Tuple[np.ndarray, np.ndarray]:
    """Solves Lambert's problem using Battin's method.

    This method is developed in battin (1987) and explained by Thompson 2018.
    It uses continued fractions to speed the solution and has several
    parameters that are defined differently than the traditional gaussian
    technique.

    References:
        Vallado: 2013, p. 493-497
        Battin: 1987, p. 325-342
        Thompson: 2018

    Args:
        r1 (array_like): Initial ECI position vector in km
        v1 (array_like): Initial ECI velocity vector in km/s
                         (needed for 180-degree transfer)
        r2 (array_like): Final ECI position vector in km
        dm (DirectionOfMotion): Direction of motion (LONG or SHORT)
        df (DirectionOfFlight): Direction of flight (DIRECT or RETROGRADE)
        nrev (int): Number of revolutions (0, 1, 2, ...)
        dtsec (float): Time between r1 and r2 in seconds

    Returns:
        tuple: (v1dv, v2dv)
            v1dv (np.ndarray): Transfer velocity vector at r1 in km/s
            v2dv (np.ndarray): Transfer velocity vector at r2 in km/s
    """
    # Initialize values
    v1dv = np.array([np.NAN] * 3)
    v2dv = np.array([np.NAN] * 3)
    y = 0.0

    # Create numpy arrays and compute magnitudes of r1 and r2
    r1 = np.array(r1)
    r2 = np.array(r2)
    magr1 = np.linalg.norm(r1)
    magr2 = np.linalg.norm(r2)

    # Calculate cosine and sine of delta nu
    cosdeltanu = np.dot(r1, r2) / (magr1 * magr2)
    cosdeltanu = np.clip(cosdeltanu, -1.0, 1.0)  # Ensure within bounds [-1, 1]

    # Determine direction of flight
    magrcrossr = np.linalg.norm(np.cross(r1, r2))
    sign = 1.0 if df == DirectionOfFlight.DIRECT else -1.0
    sindeltanu = sign * magrcrossr / (magr1 * magr2)

    # Compute delta nu
    dnu = np.arctan2(sindeltanu, cosdeltanu)
    dnu = dnu if dnu >= 0 else TWOPI + dnu  # Ensure positive angle

    # Calculate chord and semiperimeter
    chord = np.sqrt(magr1**2 + magr2**2 - 2.0 * magr1 * magr2 * cosdeltanu)
    s = (magr1 + magr2 + chord) * 0.5
    ror = magr2 / magr1
    eps = ror - 1.0

    # Calculate lambda, L, and m
    lam = 1.0 / s * np.sqrt(magr1 * magr2) * np.cos(dnu * 0.5)
    l_ = ((1.0 - lam) / (1.0 + lam))**2
    m = 8.0 * MU * dtsec**2 / (s**3 * (1.0 + lam)**6)

    # Initial guess for x
    xn = 1.0 + 4.0 * l_ if nrev > 0 else l_

    # High energy case adjustments for long way, retrograde multi-rev
    if dm == DirectionOfMotion.LONG and nrev > 0:
        xn, x = 1e-20, 10.0
        loops = 1
        while abs(xn - x) >= SMALL and loops <= 20:
            # Calculate h1 and h2
            x = xn
            temp = 1.0 / (2.0 * (l_ - x**2))
            temp1 = np.sqrt(x)  # check
            temp2 = (nrev * np.pi * 0.5 + np.arctan(temp1)) / temp1
            h1 = temp * (l_ + x) * (1.0 + 2.0 * x + l_)
            h2 = temp * m * temp1 * ((l_ - x**2) * temp2 - (l_ + x))

            # Calculate b and f
            b = 0.25 * 27.0 * h2 / ((temp1 * (1.0 + h1))**3)
            if b < 0.0:
                f = 2.0 * np.cos(1.0 / 3.0 * np.arccos(np.sqrt(b + 1.0)))
            else:
                a_ = (np.sqrt(b) + np.sqrt(b + 1.0))**(1.0 / 3.0)
                f = a_ + 1.0 / a_

            # Calculate y and xn
            y = 2.0 / 3.0 * temp1 * (1.0 + h1) * (np.sqrt(b + 1.0) / f + 1.0)
            xn = (
                0.5
                * ((m / (y**2) - (1.0 + l_))
                   - np.sqrt((m / (y**2) - (1.0 + l_))**2 - 4.0 * l_))
            )
            loops += 1

        # Determine transfer velocity vectors for high energy case
        x = xn
        a = s * (1.0 + lam)**2 * (1.0 + x) * (l_ + x) / (8.0 * x)
        p = (
            (2.0 * magr1 * magr2 * (1.0 + x) * np.sin(dnu * 0.5)**2)
            / (s * (1 + lam)**2 * (l_ + x))
        )
        ecc = np.sqrt(1.0 - p / a)
        v1dv, v2dv = lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec)
    else:
        # Standard processing for the other cases
        loops = 1
        x = 10.0
        while abs(xn - x) >= SMALL and loops <= 30:
            # Calculate h1 and h2
            x = xn
            if nrev > 0:
                temp = 1.0 / ((1.0 + 2.0 * x + l_) * (4.0 * x**2))
                temp1 = (
                    (nrev * np.pi * 0.5 + np.arctan(np.sqrt(x))) / np.sqrt(x)
                )
                h1 = (
                    temp * (l_ + x)**2
                    * (3.0 * (1.0 + x)**2 * temp1 - (3.0 + 5.0 * x))
                )
                h2 = (
                    temp * m
                    * ((x**2 - x * (1.0 + l_) - 3.0 * l_) * temp1
                       + (3.0 * l_ + x))
                )
            else:
                tempx = seebatt(x)
                denom = (
                    1.0
                    / ((1.0 + 2.0 * x + l_) * (4.0 * x + tempx * (3.0 + x)))
                )
                h1 = (l_ + x)**2 * (1.0 + 3.0 * x + tempx) * denom
                h2 = m * (x - l_ + tempx) * denom

            # Calculate y and xn
            b = 0.25 * 27.0 * h2 / ((1.0 + h1)**3)
            u = 0.5 * b / (1.0 + np.sqrt(1.0 + b))
            k2 = kbatt(u)
            y = (
                ((1.0 + h1) / 3.0)
                * (2.0 + np.sqrt(1.0 + b) / (1.0 + 2.0 * u * k2 * k2))
            )
            xn = np.sqrt(((1.0 - l_) * 0.5)**2 + m / (y**2)) - (1.0 + l_) * 0.5
            loops += 1

        # Determine transfer velocity vectors for standard case
        if loops < 30:
            p = (
                (2.0 * magr1 * magr2 * y**2 * (1.0 + x)**2
                 * np.sin(dnu * 0.5)**2)
                / (m * s * (1 + lam)**2)
            )
            ecc = np.sqrt(
                (eps**2 + 4.0 * magr2 / magr1 * np.sin(dnu * 0.5)**2
                 * ((l_ - x) / (l_ + x))**2)
                / (eps**2 + 4.0 * magr2 / magr1 * np.sin(dnu * 0.5)**2)
            )
            v1dv, v2dv = lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec)

    return v1dv, v2dv

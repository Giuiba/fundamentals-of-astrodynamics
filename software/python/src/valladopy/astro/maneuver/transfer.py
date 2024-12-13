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


########################################################################################
# Coplanar Transfers
########################################################################################


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
        tuple: (deltava, deltavb, dtsec)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            dtsec (float): Time of flight for the transfer in seconds
    """
    # Semi-major axes of initial, transfer, and final orbits
    ainit = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    atran = (rinit + rfinal) / 2.0
    afinal = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Initialize outputs
    deltava, deltavb, dtsec = 0.0, 0.0, 0.0

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
        dtsec = np.pi * np.sqrt(atran**3 / const.MU)

    return deltava, deltavb, dtsec


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
        tuple: (deltava, deltavb, deltavc, dtsec)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            deltavc (float): Change in velocity at point C in km/s
            dtsec (float): Time of flight for the transfer in seconds
    """
    # Semi-major axes of initial, transfer, and final orbits
    ainit = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    atran1 = (rinit + rb) * 0.5
    atran2 = (rb + rfinal) * 0.5
    afinal = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Initialize outputs
    deltava, deltavb, deltavc, dtsec = 0.0, 0.0, 0.0, 0.0

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
        dtsec = np.pi * np.sqrt(atran1**3 / const.MU) + np.pi * np.sqrt(
            atran2**3 / const.MU
        )

    return deltava, deltavb, deltavc, dtsec


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
        tuple: (deltava, deltavb, dtsec, etran, atran, vtrana, vtranb)
            deltava (float): Change in velocity at point A in km/s
            deltavb (float): Change in velocity at point B in km/s
            dtsec (float): Time of flight for the transfer in seconds
            etran (float): Eccentricity of the transfer orbit
            atran (float): Semi-major axis of the transfer orbit in km
            vtrana (float): Velocity of the transfer orbit at point A in km/s
            vtranb (float): Velocity of the transfer orbit at point B in km/s

    Raises:
        ValueError: If the one-tangent burn is not possible for the given inputs
    """
    # Initialize transfer time
    dtsec = 0.0

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
            dtsec = np.sqrt(atran**3 / const.MU) * (
                e - etran * np.sin(e) - (eainit - etran * np.sin(eainit))
            )
    else:
        raise ValueError("The one-tangent burn is not possible for this case.")

    return deltava, deltavb, dtsec, etran, atran, vtrana, vtranb


########################################################################################
# Non-Coplanar Transfers
########################################################################################


def inclonly(deltai: float, vinit: float, fpa: float) -> float:
    """Calculates the delta-v for a change in inclination only.

    References:
        Vallado 2007, p. 346, Algorithm 39

    Args:
        deltai (float): Change in inclination in radians
        vinit (float): Initial velocity in km/s
        fpa (float): Flight path angle in radians

    Returns:
        float: Delta-v required for inclination change in km/s

    Notes:
        - Units are flexible for `vinit` and the output will match its units
    """
    return 2.0 * vinit * np.cos(fpa) * np.sin(0.5 * deltai)


def nodeonly(
    iinit: float,
    ecc: float,
    deltaraan: float,
    vinit: float,
    fpa: float,
    incl: float,
    tol: float = 1e-7,
) -> Tuple[float, float, float, float]:
    """Calculates the delta-v for a change in longitude of the ascending node.

    References:
        Vallado 2007, pp. 349, Algorithm 40

    Args:
        iinit (float): Initial inclination in radians
        ecc (float): Eccentricity of the initial orbit
        deltaraan (float): Change in right ascension of the ascending node in radians
        vinit (float): Initial velocity in km/s
        fpa (float): Flight path angle in radians
        incl (float): Inclination in radians
        tol (float): Tolerance for checking if transfer is elliptical (default 1e-7)

    Returns:
        tuple: (ifinal, deltav, arglat_init, arglat_final)
            ifinal (float): Final inclination in radians
            deltav (float): Change in velocity in km/s
            arglat_init (float): Initial argument of latitude in radians
            arglat_final (float): Final argument of latitude in radians

    Notes:
        - Units are flexible for `vinit` and `deltav` will match its units
    """
    if ecc > tol:
        # Elliptical orbit
        theta = np.arctan(np.sin(iinit) * np.tan(deltaraan))
        ifinal = np.arcsin(np.sin(theta) / np.sin(deltaraan))
        deltav = 2.0 * vinit * np.cos(fpa) * np.sin(0.5 * theta)

        # Initial argument of latitude
        arglat_init = np.pi / 2  # set at 90 degrees

    else:
        # Circular orbit
        ifinal = incl
        theta = np.arccos(np.cos(iinit) ** 2 + np.sin(iinit) ** 2 * np.cos(deltaraan))
        deltav = 2.0 * vinit * np.sin(0.5 * theta)

        # Initial argument of latitude
        arglat_init = np.arccos(
            (np.tan(iinit) * (np.cos(deltaraan) - np.cos(theta))) / np.sin(theta)
        )

    # Final argument of latitude
    arglat_final = np.arccos(
        (np.cos(incl) * np.sin(incl) * (1.0 - np.cos(deltaraan))) / np.sin(theta)
    )

    return ifinal, deltav, arglat_init, arglat_final


def inclandnode(
    iinit: float, ifinal: float, deltaraan: float, vinit: float, fpa: float
) -> Tuple[float, float, float]:
    """Calculates the delta-v for a change in inclination and right ascension of the
    ascending node.

    References:
        Vallado 2007, p. 350, Algorithm 41

    Args:
        iinit (float): Initial inclination in radians
        ifinal (float): Final inclination in radians
        deltaraan (float): Change in right ascension of the ascending node in radians
        vinit (float): Initial velocity in km/s
        fpa (float): Flight path angle in radians

    Returns:
        tuple: (deltav, arglat_init, arglat_final)
            deltav (float): Change in velocity in km/s
            arglat_init (float): Initial argument of latitude in radians
            arglat_final (float): Final argument of latitude in radians

    Notes:
        - Units are flexible for `vinit` and `deltav` will match its units
    """
    # Pre-compute trigonometric values for efficiency
    cosdraan = np.cos(deltaraan)
    sinii, cosii = np.sin(iinit), np.cos(iinit)
    sinif, cosif = np.sin(ifinal), np.cos(ifinal)

    # Calculate theta
    cost = cosii * cosif + sinii * sinif * cosdraan
    theta = np.arccos(cost)
    sint = np.sin(theta)

    # Calculate delta-v
    deltav = inclonly(theta, vinit, fpa)

    # Calculate argument of latitude changes
    arglat_init = np.arccos((sinif * cosdraan - cost * sinii) / (sint * cosii))
    arglat_final = np.arccos((cosii * sinif - sinii * cosif * cosdraan) / sint)

    return deltav, arglat_init, arglat_final


########################################################################################
# Combined Transfers
########################################################################################


def mincombined(
    rinit: float,
    rfinal: float,
    einit: float,
    efinal: float,
    nuinit: float,
    nufinal: float,
    iinit: float,
    ifinal: float,
    use_optimal: bool = True,
    tol: float = 1e-6,
) -> tuple[float, float, float, float, float]:
    """Calculates the delta-v and inclination change for the minimum velocity change
    between two non-coplanar orbits.

    References:
        Vallado 2007, p. 355, Algorithm 42

    Args:
        rinit (float): Initial position magnitude in km
        rfinal (float): Final position magnitude in km
        einit (float): Eccentricity of the initial orbit
        efinal (float): Eccentricity of the final orbit
        nuinit (float): True anomaly of the initial orbit in radians (0 or pi)
        nufinal (float): True anomaly of the final orbit in radians (0 or pi)
        iinit (float): Initial inclination in radians
        ifinal (float): Final inclination in radians
        use_optimal (bool): Use iterative optimization for inclination change
                            (default True)
        tol (float): Tolerance for inclination iteration (default 1e-6)

    Returns:
        tuple: (deltai_init, deltai_final, deltava, deltavb, dtsec)
            deltai_init (float): Inclination change at point A in radians
            deltai_final (float): Inclination change at point B in radians
            deltava (float): Delta-v at point A in km/s
            deltavb (float): Delta-v at point B in km/s
            dtsec (float): Time of flight for the transfer in seconds
    """

    def compute_vel(r, sme):
        return np.sqrt(2.0 * ((const.MU / r) + sme))

    def compute_sme(a):
        return -const.MU / (2.0 * a)

    # Compute semi-major axes
    a1 = (rinit * (1.0 + einit * np.cos(nuinit))) / (1.0 - einit**2)
    a2 = 0.5 * (rinit + rfinal)
    a3 = (rfinal * (1.0 + efinal * np.cos(nufinal))) / (1.0 - efinal**2)

    # Compute specific mechanical energy
    sme1 = compute_sme(a1)
    sme2 = compute_sme(a2)
    sme3 = compute_sme(a3)

    # Compute velocities
    vinit = compute_vel(rinit, sme1)
    v1t = compute_vel(rinit, sme2)
    vfinal = compute_vel(rfinal, sme3)
    v3t = compute_vel(rfinal, sme2)

    # Delta inclination
    tdi = ifinal - iinit

    # Delta-Vs
    temp = (1.0 / tdi) * np.arctan(
        np.sin(tdi) / ((rfinal / rinit) ** 1.5 + np.cos(tdi))
    )
    deltava = np.sqrt(v1t**2 + vinit**2 - 2.0 * v1t * vinit * np.cos(temp * tdi))
    deltavb = np.sqrt(
        v3t**2 + vfinal**2 - 2.0 * v3t * vfinal * np.cos(tdi * (1.0 - temp))
    )

    # Inclination change
    deltai_init = temp * tdi
    deltai_final = tdi * (1.0 - temp)

    # Compute transfer time of flight
    dtsec = np.pi * np.sqrt(a2**3 / const.MU)

    if not use_optimal:
        return deltai_init, deltai_final, deltava, deltavb, dtsec

    # Iterative optimization
    deltai_final_iter, n_iter = 100.0, 0
    while abs(deltai_init - deltai_final_iter) > tol:
        deltai_final_iter = deltai_init
        deltava = np.sqrt(
            v1t**2 + vinit**2 - 2.0 * v1t * vinit * np.cos(deltai_final_iter)
        )
        deltavb = np.sqrt(
            v3t**2 + vfinal**2 - 2.0 * v3t * vfinal * np.cos(tdi - deltai_final_iter)
        )
        deltai_init = np.arcsin(
            (deltava * vfinal * v3t * np.sin(tdi - deltai_final_iter))
            / (vinit * v1t * deltavb)
        )
        n_iter += 1

    return deltai_init, tdi - deltai_init, deltava, deltavb, dtsec

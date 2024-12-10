# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import logging

import numpy as np

from ... import constants as const


# Set up logging
logger = logging.getLogger(__name__)


def position(jd: float) -> tuple[np.ndarray, float, float]:
    """Calculates the geocentric equatorial position vector of the Moon.

    References:
        Vallado: 2007, p. 290, Algorithm 31

    Args:
        jd (float): Julian date (days from 4713 BC)

    Returns:
        tuple: (rmoon, rtasc, decl)
            rmoon (np.ndarray): Inertial moon position vector in km
            rtasc (float): Right ascension of the moon in radians
            decl (float): Declination of the moon in radians
    """
    # Julian centuries from J2000.0
    ttdb = (jd - const.J2000) / const.CENT2DAY

    # Ecliptic longitude (radians)
    eclplong = (
        np.radians(
            218.32
            + 481267.8813 * ttdb
            + 6.29 * np.sin(np.radians(134.9 + 477198.85 * ttdb))
            - 1.27 * np.sin(np.radians(259.2 - 413335.38 * ttdb))
            + 0.66 * np.sin(np.radians(235.7 + 890534.23 * ttdb))
            + 0.21 * np.sin(np.radians(269.9 + 954397.70 * ttdb))
            - 0.19 * np.sin(np.radians(357.5 + 35999.05 * ttdb))
            - 0.11 * np.sin(np.radians(186.6 + 966404.05 * ttdb))
        )
        % const.TWOPI
    )

    # Ecliptic latitude (radians)
    eclplat = (
        np.radians(
            5.13 * np.sin(np.radians(93.3 + 483202.03 * ttdb))
            + 0.28 * np.sin(np.radians(228.2 + 960400.87 * ttdb))
            - 0.28 * np.sin(np.radians(318.3 + 6003.18 * ttdb))
            - 0.17 * np.sin(np.radians(217.6 - 407332.20 * ttdb))
        )
        % const.TWOPI
    )

    # Horizontal parallax (radians)
    hzparal = (
        np.radians(
            0.9508
            + 0.0518 * np.cos(np.radians(134.9 + 477198.85 * ttdb))
            + 0.0095 * np.cos(np.radians(259.2 - 413335.38 * ttdb))
            + 0.0078 * np.cos(np.radians(235.7 + 890534.23 * ttdb))
            + 0.0028 * np.cos(np.radians(269.9 + 954397.70 * ttdb))
        )
        % const.TWOPI
    )

    # Obliquity of the ecliptic (radians)
    obliquity = np.radians(np.degrees(const.OBLIQUITYEARTH) - 0.0130042 * ttdb)

    # Intermediate values for debugging
    logger.debug(f"Ecliptic longitude: {np.degrees(eclplong): .2f} deg")
    logger.debug(f"Ecliptic latitude: {np.degrees(eclplat): .2f} deg")
    logger.debug(f"Horizontal parallax: {np.degrees(hzparal): .2f} deg")
    logger.debug(f"Obliquity: {np.degrees(obliquity): .2f} deg")

    # Geocentric direction cosines
    l = np.cos(eclplat) * np.cos(eclplong)  # noqa: E741
    m = np.cos(obliquity) * np.cos(eclplat) * np.sin(eclplong) - np.sin(
        obliquity
    ) * np.sin(eclplat)
    n = np.sin(obliquity) * np.cos(eclplat) * np.sin(eclplong) + np.cos(
        obliquity
    ) * np.sin(eclplat)

    # Moon's position vector (Earth radii)
    magr = 1.0 / np.sin(hzparal)
    rmoon = np.array([magr * l, magr * m, magr * n])

    # Right ascension and declination
    rtasc = np.arctan2(m, l)
    decl = np.arcsin(n)

    return rmoon * const.RE, rtasc, decl

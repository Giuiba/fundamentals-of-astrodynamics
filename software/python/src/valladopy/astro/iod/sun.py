# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 1 March 2001
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------
import logging

import numpy as np
from typing import Tuple

from ... import constants as const


# Setup logging
logger = logging.getLogger(__name__)


def position(jd: float) -> Tuple[np.ndarray, float, float]:
    """Calculates the geocentric equatorial position vector of the Sun.

    This is the low precision formula and is valid for years from 1950 to 2050. The
    accuaracy of apparent coordinates is about 0.01 degrees.  notice many of the
    calculations are performed in degrees, and are not changed until later. This is due
    to the fact that the almanac uses degrees exclusively in their formulations.

    Sergey K (2022) has noted that improved results are found assuming the oputput is in
    a precessing frame (TEME) and converting to ICRF.

    References:
        Vallado: 2007, p. 281, Algorithm 29

    Args:
        jd (float): Julian date (days from 4713 BC)

    Returns:
        tuple: (rsun, rtasc, decl)
            rsun (np.ndarray): Inertial sun position vector in km
            rtasc (float): Right ascension of the sun in radians
            decl (float): Declination of the sun in radians
    """
    # Julian centuries from J2000
    tut1 = (jd - const.J2000) / const.CENT2DAY

    # Mean longitude of the Sun (degrees)
    meanlong = 280.460 + 36000.77 * tut1
    meanlong %= np.degrees(const.TWOPI)

    # Mean anomaly of the Sun (radians)
    meananomaly = 357.5277233 + 35999.05034 * tut1
    meananomaly = np.radians(meananomaly) % const.TWOPI

    # Ecliptic longitude of the Sun (degrees)
    eclplong = (
        meanlong
        + 1.914666471 * np.sin(meananomaly)
        + 0.019994643 * np.sin(2.0 * meananomaly)
    )
    eclplong = np.radians(eclplong) % const.TWOPI

    # Obliquity of the ecliptic (radians)
    obliquity = np.radians(np.degrees(const.OBLIQUITYEARTH) - 0.0130042 * tut1)

    # Magnitude of the Sun vector (AU)
    magr = (
        1.000140612
        - 0.016708617 * np.cos(meananomaly)
        - 0.000139589 * np.cos(2.0 * meananomaly)
    )

    # Sun position vector in geocentric equatorial coordinates
    rsun = np.array(
        [
            magr * np.cos(eclplong),
            magr * np.cos(obliquity) * np.sin(eclplong),
            magr * np.sin(obliquity) * np.sin(eclplong),
        ]
    )

    # Right ascension (radians)
    rtasc = np.arctan(np.cos(obliquity) * np.tan(eclplong))

    # Ensure right ascension is in the same quadrant as ecliptic longitude
    if eclplong < 0.0:
        eclplong += const.TWOPI
    if abs(eclplong - rtasc) > np.pi / 2.0:
        rtasc += np.pi

    # Declination (radians)
    decl = np.arcsin(np.sin(obliquity) * np.sin(eclplong))

    return rsun * const.AU2KM, rtasc, decl


def sunriset(
    jd: float, latgd: float, lon: float, whichkind: str = "s"
) -> Tuple[float, float]:
    """Finds the universal time for sunrise and sunset given the day and site location.

    References:
        Vallado: 2007, p. 283, Algorithm 30

    Args:
        jd (float): Julian date (days from 4713 BC)
        latgd (float): Geodetic latitude of the site in radians
        lon (float): Longitude of the site in radians (west is negative)
        whichkind (str): Type of event to calculate:
            - 's': sunrise/sunset
            - 'c': civil twilight
            - 'n': nautical twilight
            - 'a': astronomical twilight

    Returns:
        tuple: (sunrise, sunset)
            sunrise (float): Universal time of sunrise in hours
            sunset (float): Universal time of sunset in hours
    """
    # Normalize longitude to -π to π
    lon = (lon + np.pi) % const.TWOPI - np.pi

    # Select the sun angle based on the kind of event
    # fmt: off
    sunangle_map = {
        "s": np.radians(90.0 + 50.0 / 60.0),  # sunrise/Sunset
        "c": np.radians(96.0),                # civil twilight
        "n": np.radians(102.0),               # nautical twilight
        "a": np.radians(108.0)                # astronomical twilight
    }
    # fmt: on
    sunangle = sunangle_map.get(whichkind.lower(), None)
    if sunangle is None:
        raise ValueError(f"Invalid 'whichkind': {whichkind}")

    # Initialize results dictionary
    results = {"sunrise": np.nan, "sunset": np.nan}

    # Loop for sunrise and sunset
    initial_guess_times = {"sunrise": 6.0, "sunset": 18.0}
    for event, jd_offset in initial_guess_times.items():
        # Initialize Julian date for the day
        jdtemp = (
            jd
            + (np.degrees(-lon) / const.DEG2HR / const.DAY2HR)
            + jd_offset / const.DAY2HR
        )

        # Julian centuries from J2000.0
        tut1 = (jdtemp - const.J2000) / const.CENT2DAY

        # Mean longitude of the Sun (degrees)
        meanlonsun = (280.4606184 + 36000.77005361 * tut1) % np.degrees(const.TWOPI)

        # Mean anomaly of the Sun (radians)
        meananomalysun = np.radians((357.5277233 + 35999.05034 * tut1)) % const.TWOPI

        # Ecliptic longitude of the Sun (radians)
        lonecliptic = (
            np.radians(
                (
                    meanlonsun
                    + 1.914666471 * np.sin(meananomalysun)
                    + 0.019994643 * np.sin(2.0 * meananomalysun)
                )
            )
            % const.TWOPI
        )

        # Obliquity of the ecliptic (radians)
        obliquity = np.radians(np.degrees(const.OBLIQUITYEARTH) - 0.0130042 * tut1)

        # Right ascension and declination (radians)
        ra = np.arctan(np.cos(obliquity) * np.tan(lonecliptic))
        decl = np.arcsin(np.sin(obliquity) * np.sin(lonecliptic))

        # Local hour angle
        lha = (np.cos(sunangle) - np.sin(decl) * np.sin(latgd)) / (
            np.cos(decl) * np.cos(latgd)
        )
        if abs(lha) > 1.0:
            logger.error("Local hour angle out of range; sunrise/sunset not visible.")
            return results["sunrise"], results["sunset"]

        lha = np.arccos(lha)
        if event == "sunrise":
            lha = const.TWOPI - lha

        # GST and UT
        gst = (
            1.75336855923327
            + 628.331970688841 * tut1
            + 6.77071394490334e-06 * tut1**2
            - 4.50876723431868e-10 * tut1**3
        ) % const.TWOPI
        uttemp = (lha + ra - gst) % const.TWOPI
        uttemp = np.degrees(uttemp) / const.DEG2HR
        uttemp = uttemp % const.DAY2HR

        # Assign to sunrise or sunset
        results[event] = uttemp

    return results["sunrise"], results["sunset"]

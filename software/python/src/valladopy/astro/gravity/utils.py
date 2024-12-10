# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from typing import Tuple

import numpy as np

from ... import constants as const


def pathm(llat: float, llon: float, range_: float, az: float) -> Tuple[float, float]:
    """Determines the end position (latitude and longitude) for a given range and
    azimuth from a given starting point.

    References:
        Vallado: 2001, p. 774-776, Eq. 11-6 and 11-7

    Args:
        llat (float): Start geocentric latitude in radians (-pi/2 to pi/2)
        llon (float): Start longitude in radians (0.0 to 2pi).
        range_(float): Range between points in Earth radii
        az (float): Azimuth in radians (0.0 to 2pi)

    Returns:
        tuple: (tlat, tlon)
            tlat (float): End geocentric latitude in radians (-pi/2 to pi/2)
            tlon (float): End longitude in radians (0.0 to 2pi)
    """
    # Normalize inputs
    az = az % const.TWOPI
    llon = (llon + const.TWOPI) % const.TWOPI
    range_ = range_ % const.TWOPI

    # Find geocentric latitude
    tlat = np.arcsin(
        np.sin(llat) * np.cos(range_) + np.cos(llat) * np.sin(range_) * np.cos(az)
    )

    # Find delta n, the angle between the points
    deltan = 0.0
    if abs(np.cos(tlat)) > const.SMALL and abs(np.cos(llat)) > const.SMALL:
        sindn = np.sin(az) * np.sin(range_) / np.cos(tlat)
        cosdn = (np.cos(range_) - np.sin(tlat) * np.sin(llat)) / (
            np.cos(tlat) * np.cos(llat)
        )
        deltan = np.arctan2(sindn, cosdn)
    else:
        # Case where launch is within a small distance of a pole
        if abs(np.cos(llat)) <= const.SMALL:
            deltan = az + np.pi if np.pi < range_ < const.TWOPI else az

        # Case where end point is within a small distance of a pole
        elif abs(np.cos(tlat)) <= const.SMALL:
            deltan = 0.0

    # Compute end longitude
    tlon = (llon + deltan) % const.TWOPI

    return tlat, tlon


def rngaz(
    llat: float, llon: float, tlat: float, tlon: float, tof: float = 0.0
) -> tuple[float, float]:
    """Calculates the range and azimuth between two specified ground points
    on a spherical Earth.

    Args:
        llat (float): Start geocentric latitude in radians (-pi/2 to pi/2)
        llon (float): Start longitude in radians (0.0 to 2pi)
        tlat (float): End geocentric latitude in radians (-pi/2 to pi/2)
        tlon (float): End longitude in radians (0.0 to 2pi)
        tof (float): Time of flight if applicable, in minutes (default is 0.0)

    Returns:
        tuple: (range_, az)
            range_ (float): Range between points in km
            az (float): Azimuth in radians (0.0 to 2pi)
    """
    omegaearth = 0.05883359221938136  # rad/TU (TODO: fix units?)
    # omegaearth = const.EARTHROT * const.MIN2SEC  # rad/min

    # Calculate the spherical range
    range_ = np.arccos(
        np.sin(llat) * np.sin(tlat)
        + np.cos(llat) * np.cos(tlat) * np.cos(tlon - llon + omegaearth * tof)
    )

    # Check for special cases where range is 0 or half the Earth
    if abs(np.sin(range_) * np.cos(llat)) < const.SMALL:
        az = np.pi if abs(range_ - np.pi) < const.SMALL else 0.0
    else:
        az = np.arccos(
            (np.sin(tlat) - np.cos(range_) * np.sin(llat))
            / (np.sin(range_) * np.cos(llat))
        )

    # Adjust azimuth if it is greater than pi
    if np.sin(tlon - llon + omegaearth * tof) < 0.0:
        az = const.TWOPI - az

    return range_ * const.RE, az

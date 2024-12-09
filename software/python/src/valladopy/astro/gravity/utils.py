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

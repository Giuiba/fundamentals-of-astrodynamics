# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------


import numpy as np
from typing import Tuple

from .. import constants as const


def jday(
    year: int, month: int, day: int, hour: int, minute: int, second: float
) -> Tuple[float, float]:
    """Calculate the Julian Date (JD) and fractional day

    This function finds the Julian Date given the year, month, day, and time.

    References:
        Vallado: 2007, p. 189, Algorithm 14, Example 3-14

    Args:
        year (int): Year (e.g., 2024)
        month (int): Month (1 to 12)
        day (int): Day (1 to 31)
        hour (int): Universal Time hour (0 to 23)
        minute (int): Universal Time minute (0 to 59)
        second (float): Universal Time second (0.0 to 59.999)

    Returns:
        tuple:
            jd (float): Julian Date
            jd_frac (float): Fractional part of the Julian Date
    """
    # Calculate Julian Date
    jd = (
        367.0 * year
        - np.floor((7 * (year + np.floor((month + 9) / 12.0))) * 0.25)
        + np.floor(275 * month / 9.0)
        + day
        + 1721013.5
    )  # Use - 678987.0 to go to MJD directly

    # Calculate fractional part of the day
    jd_frac = (second + minute * const.MIN2SEC + hour * const.HR2SEC) / const.DAY2SEC

    # Adjust if jd_frac > 1
    if jd_frac > 1.0:
        jd += np.floor(jd_frac)
        jd_frac -= np.floor(jd_frac)

    return jd, jd_frac


def day_of_week(jd: float) -> int:
    """Finds the day of the week for a given Julian date.

    References:
        Vallado: 2007, p. 188, Eq. 3-39

    Args:
        jd (float): Julian date (days from 4713 BC)

    Returns:
        int: Day of the week (1 for Sunday, 2 for Monday, etc.)
    """
    # Ensure the Julian date corresponds to 0.0 hours of the day
    jd = int(jd + 0.5)

    # Calculate the day of the week (1 = Sunday, ..., 7 = Saturday)
    return ((jd + 1) % 7) + 1

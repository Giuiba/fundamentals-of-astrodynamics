# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from enum import Enum
from typing import Tuple

import numpy as np

from .calendar import days_to_mdh
from .. import constants as const


# Constants
JULIAN_DATE_REFERENCE_YEAR = 1900  # Reference year for the Julian Date
JULIAN_DATE_1900 = 2415019.5  # Julian date for January 0, 1900
JULIAN_DATE_EPOCH_OFFSET = 4716  # Julian date offset from the Gregorian calendar


class CalendarType(Enum):
    JULIAN = "j"
    GREGORIAN = "g"


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


def jdayall(
    year: int,
    month: int,
    day: int,
    hour: int,
    minute: int,
    second: float,
    calendar_type: CalendarType = CalendarType.GREGORIAN,
) -> Tuple[float, float]:
    """Calculates the Julian Date and fractional Julian Day.

    The Julian Date is defined by each elapsed day since noon, Jan 1, 4713 BC.

    References:
        Vallado: 2001, p. 187

    Args:
        year (int): Year (e.g., 1900 .. 2100)
        month (int): Month (1 .. 12)
        day (int): Day (1 .. 31)
        hour (int): Universal Time hour (0 .. 23)
        minute (int): Universal Time minute (0 .. 59)
        second (float): Universal Time second (0.0 .. 59.999)
        calendar_type (CalendarType, optional): Calendar type (Julian or Gregorian)
                                                (Defaults to CalendarType.GREGORIAN)

    Returns:
        tuple: (jd, jdfrac)
            jd (float): Julian Date
            jdfrac (float): Fractional part of the Julian Date
    """
    if month <= 2:
        year -= 1
        month += 12

    # Determine B based on the calendar type
    if calendar_type == CalendarType.JULIAN:
        b = 0.0
    elif calendar_type == CalendarType.GREGORIAN:
        b = 2 - (year // 100) + (year // 400)
    else:
        raise ValueError(
            "Invalid calendar type. Must be either CalendarType.JULIAN or"
            "CalendarType.GREGORIAN"
        )

    # Compute Julian Date
    jd = (
        int(const.YR2DAY * (year + JULIAN_DATE_EPOCH_OFFSET))
        + int(30.6001 * (month + 1))
        + day
        + b
        - 1524.5
    )

    # Compute fractional day
    jdfrac = (hour * const.HR2SEC + minute * const.MIN2SEC + second) / const.DAY2SEC

    # Normalize jdfrac if it exceeds 1.0
    if jdfrac >= 1.0:
        jd += int(jdfrac)
        jdfrac %= 1.0

    return jd, jdfrac


def invjday(jd: float, jdfrac: float) -> Tuple[int, int, int, int, int, float]:
    """Converts Julian Date and fractional day to calendar date and time.

    Args:
        jd (float): Julian Date (days from 4713 BC)
        jdfrac (float): Fractional part of the Julian Date

    Returns:
        tuple: (year, month, day, hour, minute, second)
            year (int): Year
            month (int): Month
            day (int): Day
            hour (int): Hour
            minute (int): Minute
            second (float): Second

    Notes:
        - This assumes the Gregorian calendar type.
    """
    # Normalize jdfrac if it spans multiple days
    if abs(jdfrac) >= 1.0:
        jd += int(jdfrac)
        jdfrac %= 1.0

    # Adjust for fraction of a day in the Julian Date
    dt = jd - int(jd) - 0.5
    if abs(dt) > 1e-8:
        jd -= dt
        jdfrac += dt

    # Compute year and day of year
    temp = jd - JULIAN_DATE_1900
    tu = temp / const.YR2DAY
    year = JULIAN_DATE_REFERENCE_YEAR + int(tu)
    leap_years = (year - (JULIAN_DATE_REFERENCE_YEAR + 1)) // 4
    days = int(
        temp
        - ((year - JULIAN_DATE_REFERENCE_YEAR) * np.floor(const.YR2DAY) + leap_years)
    )

    # Handle start-of-year edge case
    if days + jdfrac < 1.0:
        year -= 1
        leap_years = (year - (JULIAN_DATE_REFERENCE_YEAR + 1)) // 4
        days = int(
            temp
            - (
                (year - JULIAN_DATE_REFERENCE_YEAR) * np.floor(const.YR2DAY)
                + leap_years
            )
        )

    # Convert days of year + fractional day to calendar date and time
    month, day, hour, minute, second = days_to_mdh(year, days + jdfrac)

    return year, month, day, hour, minute, second


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

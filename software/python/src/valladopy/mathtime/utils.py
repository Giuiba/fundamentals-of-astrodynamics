import numpy as np

from .. import constants as const


def safe_sqrt(value: float, context: str = "") -> float:
    """Safe square root function that checks for negative values.

    Args:
        value (float): The value to take the square root of
        context (str, optional): A description of the current step or variable
                                 being used

    Returns:
        float: The square root of the value

    Raises:
        ValueError: If the value is negative
    """
    if value < 0:
        error_message = f"Cannot take square root of negative value: ({value})"
        if context:
            error_message += f"\nContext: {context}"
        raise ValueError(error_message)
    return np.sqrt(value)


def hms2sec(hours: float, minutes: float, seconds: float) -> float:
    """Convert hours, minutes, and seconds to seconds.

    Args:
        hours (float): The number of hours
        minutes (float): The number of minutes
        seconds (float): The number of seconds

    Returns:
        float: The total number of seconds
    """
    return hours * const.HR2SEC + minutes * const.MIN2SEC + seconds


def sec2hms(seconds: float) -> tuple[float, float, float]:
    """Convert seconds to hours, minutes, and seconds.

    Args:
        seconds (float): The total number of seconds

    Returns:
        tuple: (hours, minutes, seconds)
            hours (float): The number of hours
            minutes (float): The number of minutes
            seconds (float): The number of seconds
    """
    # Get the hours and the fraction of hours
    total_hours = seconds / const.HR2SEC
    hours = int(total_hours)
    hours_fraction = total_hours - hours

    # Get the minutes and seconds
    minutes = int(hours_fraction * const.MIN2SEC)
    secs = (hours_fraction - minutes / const.MIN2SEC) * const.HR2SEC

    # Adjust seconds to avoid floating point errors
    secs = round(secs) if abs(secs - round(secs)) < const.SMALL else secs

    return hours, minutes, secs


def hms2rad(hours: float, minutes: float, seconds: float) -> float:
    """Convert hours, minutes, and seconds to radians.

    Args:
        hours (float): The number of hours
        minutes (float): The number of minutes
        seconds (float): The number of seconds

    Returns:
        float: The total number of radians
    """
    return (hours + minutes / const.MIN2SEC + seconds / const.HR2SEC) * const.HR2RAD


def rad2hms(radians: float) -> tuple[float, float, float]:
    """Convert radians to hours, minutes, and seconds.

    Args:
        radians (float): The total number of radians

    Returns:
        tuple: (hours, minutes, seconds)
            hours (float): The number of hours
            minutes (float): The number of minutes
            seconds (float): The number of seconds
    """
    # Get the total seconds from the radians
    total_seconds = radians / const.HR2RAD * const.HR2SEC

    # Convert the total seconds to hours, minutes, and seconds
    return sec2hms(total_seconds)


def dms2rad(degrees: float, minutes: float, seconds: float) -> float:
    """Convert degrees, minutes, and seconds to radians.

    Args:
        degrees (float): The number of degrees
        minutes (float): The number of minutes
        seconds (float): The number of seconds

    Returns:
        float: The total number of radians
    """
    return float(
        np.radians(degrees + minutes / const.DEG2MIN + seconds / const.DEG2ARCSEC)
    )


def rad2dms(radians: float) -> tuple[float, float, float]:
    """Convert radians to degrees, minutes, and seconds.

    Args:
        radians (float): The total number of radians

    Returns:
        tuple: (degrees, minutes, seconds)
            degrees (float): The number of degrees
            minutes (float): The number of minutes
            seconds (float): The number of seconds
    """
    # Convert radians to total degrees
    total_degrees = np.degrees(radians)
    degrees = int(total_degrees)
    degrees_fraction = total_degrees - degrees

    # Get minutes and seconds
    minutes = int(degrees_fraction * const.DEG2MIN)
    secs = (degrees_fraction - minutes / const.DEG2MIN) * const.DEG2ARCSEC

    # Adjust seconds to avoid floating-point errors
    secs = round(secs) if abs(secs - round(secs)) < const.SMALL else secs

    return degrees, minutes, secs


def jd2sse(julian_date: float) -> float:
    """Converts Julian Date to seconds since epoch.

    Args:
        julian_date (float): The Julian Date (days from 4713 BC)

    Returns:
        float: Seconds since epoch (1 Jan 2000 00:00:00 UTC)
    """
    return (julian_date - const.J2000_UTC) * const.DAY2SEC

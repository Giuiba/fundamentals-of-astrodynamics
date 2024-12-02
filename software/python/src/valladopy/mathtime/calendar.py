import calendar
from datetime import datetime
from typing import Dict, List


def initialize_time(year: int) -> Dict[str, List]:
    """Initializes time-related information for a given year.

    Args:
        year (int): The year for which the data is initialized
                    (to account for leap years)

    Returns:
        dict[str, List]: A dictionary with three keys:
              - 'lmonth': List of days in each month for the given year
              - 'monthtitle': List of abbreviated month names
              - 'daytitle': List of abbreviated day names (starting with Sunday)
    """
    return {
        "lmonth": [calendar.monthrange(year, i)[1] for i in range(1, 13)],
        "monthtitle": [calendar.month_abbr[i].lower() for i in range(1, 13)],
        "daytitle": [calendar.day_abbr[(i + 6) % 7].lower() for i in range(7)],
    }


def get_int_month(month_str: str):
    """Converts a 3-character month abbreviation to its integer equivalent.

    Args:
        month_str (str): Abbreviation of the month (e.g., 'jan', 'feb')

    Returns:
        int: Integer representation of the month (1 for January, 2 for February, etc.)

    Raises:
        ValueError: If the input string is not a valid month abbreviation.
    """
    try:
        return datetime.strptime(month_str[:3].capitalize(), "%b").month
    except ValueError as e:
        raise ValueError(f"Invalid month abbreviation: {month_str}") from e

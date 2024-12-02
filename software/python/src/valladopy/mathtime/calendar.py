def get_int_month(month_str: str):
    """Converts a 3-character month abbreviation to its integer equivalent.

    Args:
        month_str (str): Abbreviation of the month (e.g., 'jan', 'feb')

    Returns:
        int: Integer representation of the month (1 for January, 2 for February, etc.)
    """
    # List of month abbreviations
    month_list = [
        "jan",
        "feb",
        "mar",
        "apr",
        "may",
        "jun",
        "jul",
        "aug",
        "sep",
        "oct",
        "nov",
        "dec",
    ]

    # Find the integer equivalent
    try:
        return month_list.index(month_str.lower()) + 1
    except ValueError:
        raise ValueError(f"Invalid month abbreviation: {month_str}")

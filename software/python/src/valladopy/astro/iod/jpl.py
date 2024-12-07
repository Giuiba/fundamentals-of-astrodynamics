# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 22 January 2018
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

from typing import Tuple, Dict

import numpy as np

from ... import constants as const
from ...mathtime.julian_date import jday


def init_jplde(filepath: str) -> Tuple[Dict[str, np.ndarray], float, float]:
    """Initializes the JPL planetary ephemeris data by loading the sun and moon
    positions.

    Args:
        filepath (str): Path to the input text file containing ephemeris data

    Returns:
        tuple: (jpldearr, jdjpldestart, jdjpldestart_frac)
            jpldearr (dict[str, np.ndarray]): Dictionary of JPL DE data records.
            jdjpldestart (float): Julian date of the start of the JPL DE data
            jdjpldestart_frac (float): Fractional part of the Julian date at the start
    """
    # Load the input file data
    file_data = np.loadtxt(filepath)

    # Initialize the JPL DE data dictionary
    jpldearr = {
        "year": file_data[:, 0].astype(int),
        "month": file_data[:, 1].astype(int),
        "day": file_data[:, 2].astype(int),
        "rsun1": file_data[:, 3],
        "rsun2": file_data[:, 4],
        "rsun3": file_data[:, 5],
        "rsmag": file_data[:, 6],
        "rmoon1": file_data[:, 8],
        "rmoon2": file_data[:, 9],
        "rmoon3": file_data[:, 10],
    }

    # Calculate Modified Julian Date (MJD)
    jd, jd_frac = jday(jpldearr["year"], jpldearr["month"], jpldearr["day"])
    jpldearr["mjd"] = jd + jd_frac - const.JD_TO_MJD_OFFSET

    # Find the start epoch date
    jdjpldestart, jdjpldestart_frac = jday(
        jpldearr["year"][0], jpldearr["month"][0], jpldearr["day"][0]
    )

    return jpldearr, jdjpldestart, jdjpldestart_frac

import numpy as np

from src.valladopy.mathtime.julian_date import jday, day_of_week

from ..conftest import DEFAULT_TOL


def test_jday():
    year, month, day, hour, minute, second = (1992, 8, 20, 12, 14, 33)
    jd, jd_frac = jday(year, month, day, hour, minute, second)
    assert np.isclose(jd, 2448854.5, rtol=DEFAULT_TOL)
    assert np.isclose(jd_frac, 0.5101041666666667, rtol=DEFAULT_TOL)


def test_day_of_week():
    jd = 2448854.125
    dow = day_of_week(jd)
    assert dow == 4

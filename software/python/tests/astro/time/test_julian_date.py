import numpy as np

from src.valladopy.astro.time.julian_date import jday

DEFAULT_TOL = 1e-12


def test_jday():
    year, month, day, hour, minute, second = (1992, 8, 20, 12, 14, 33)
    jd, jd_frac = jday(year, month, day, hour, minute, second)
    assert np.isclose(jd, 2448854.5, rtol=DEFAULT_TOL)
    assert np.isclose(jd_frac, 0.5101041666666667, rtol=DEFAULT_TOL)

import numpy as np

from src.valladopy.astro.time.sidereal import gstime
from ...conftest import custom_isclose


DEFAULT_TOL = 1e-12


def test_gstime():
    # Test Julian Date of J2000 epoch
    assert custom_isclose(gstime(2451545.0), np.radians(280.460618375))

    # Vallado, Example 3-5 (2013)
    assert custom_isclose(
        gstime(2448855.009722), np.radians(152.57870762835), rtol=DEFAULT_TOL
    )

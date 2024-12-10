import numpy as np
import pytest

import src.valladopy.astro.celestial.moon as moon

from ...conftest import DEFAULT_TOL, custom_isclose


def test_position():
    # Vallado 2007, Example 5-3
    jd = 2449470.5
    rmoon, rtasc, decl = moon.position(jd)

    # Expected values
    rmoon_expected = [-134240.61111304158, -311571.55616382667, -126693.77078952147]
    assert np.allclose(rmoon, rmoon_expected, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(rtasc), -113.30879478775752, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(decl), -20.477717465404574, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    "elev, illum_expected",
    [
        (np.radians(100), 0.11663785663534358),
        (np.radians(15), 0.016132194140321483),
        (np.radians(3), 0.0024392692225373856),
        (np.radians(-1), 0.0),
    ],
)
def test_illumination(elev, illum_expected):
    f = np.radians(45)
    assert custom_isclose(moon.illumination(f, elev), illum_expected)

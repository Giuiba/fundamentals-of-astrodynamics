import numpy as np

import src.valladopy.astro.celestial.moon as moon

from ...conftest import DEFAULT_TOL


def test_position():
    # Vallado 2007, Example 5-3
    jd = 2449470.5
    rmoon, rtasc, decl = moon.position(jd)

    # Expected values
    rmoon_expected = [-134240.61111304158, -311571.55616382667, -126693.77078952147]
    assert np.allclose(rmoon, rmoon_expected, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(rtasc), -113.30879478775752, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(decl), -20.477717465404574, rtol=DEFAULT_TOL)

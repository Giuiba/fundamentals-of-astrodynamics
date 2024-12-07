import numpy as np

import src.valladopy.astro.iod.sun as sun

from ...conftest import DEFAULT_TOL


def test_position():
    # Vallado 2007, Example 5-1
    jd = 2453827.5
    rsun, rtasc, decl = sun.position(jd)

    # Expected values
    rsun_expected = [0.9771944767850643, 0.19244242031650038, 0.08343075731414097]
    assert np.allclose(rsun, rsun_expected, rtol=DEFAULT_TOL)
    assert np.isclose(rtasc, 0.19444536135038037, rtol=DEFAULT_TOL)
    assert np.isclose(decl, 0.08357377635869676, rtol=DEFAULT_TOL)

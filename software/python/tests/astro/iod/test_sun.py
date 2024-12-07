import numpy as np

import src.valladopy.astro.iod.sun as sun

from ...conftest import DEFAULT_TOL


def test_position():
    # Vallado 2007, Example 5-1
    jd = 2453827.5
    rsun, rtasc, decl = sun.position(jd)

    # Expected values
    rsun_expected = [146186212.98684618, 28788976.311702874, 12481063.64508394]
    assert np.allclose(rsun, rsun_expected, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(rtasc), 11.140898551273013, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(decl), 4.788424663323541, rtol=DEFAULT_TOL)

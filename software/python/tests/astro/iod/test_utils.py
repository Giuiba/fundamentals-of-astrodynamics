import numpy as np

import src.valladopy.constants as const
from src.valladopy.astro.iod.utils import gibbs

from ...conftest import DEFAULT_TOL


def test_gibbs():
    # Vallado 2022, Example 7-3
    r1 = [0.0, 0.0, const.RE]
    r2 = [0.0, -4464.696, -5102.509]
    r3 = [0.0, 5740.323, 3189.068]

    # Call Gibbs method
    v2, theta12, theta23, copa = gibbs(r1, r2, r3)

    # Check results
    v2_expected = [0.0, 5.5311472050176125, -5.191806413494606]
    assert np.allclose(v2, v2_expected, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(theta12), 138.81407085944375, rtol=DEFAULT_TOL)
    assert np.isclose(np.degrees(theta23), 160.24053069723146, rtol=DEFAULT_TOL)

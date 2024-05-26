import numpy as np
import pytest

from src.valladopy.twobody.utils import site


DEFAULT_TOL = 1e-12


@pytest.mark.parametrize('latgd, lon, alt, rsecef_exp', [
    (0, 0, 0, np.array([6378.1363, 0, 0])),
    (np.pi / 4, np.pi / 4, 0,
     np.array([3194.4187944733417, 3194.418794473341, 4487.347916379808])),
    (np.radians(39.007), np.radians(-104.883), 2.187,
     np.array([-1275.1217701148173, -4797.988500532293, 3994.2970129784385]))
])
def test_site(latgd, lon, alt, rsecef_exp):
    rsecef, vsecef = site(latgd, lon, alt)

    assert np.allclose(rsecef, rsecef_exp, rtol=DEFAULT_TOL)
    assert np.allclose(vsecef, [0.0, 0.0, 0.0], rtol=DEFAULT_TOL)

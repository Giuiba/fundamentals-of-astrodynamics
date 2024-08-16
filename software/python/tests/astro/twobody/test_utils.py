import numpy as np
import pytest

from src.valladopy.astro.twobody.utils import site, findc2c3, lon2nu


DEFAULT_TOL = 1e-12


@pytest.mark.parametrize(
    'latgd, lon, alt, rsecef_exp',
    [
        (0, 0, 0, np.array([6378.1363, 0, 0])),
        (np.pi / 4, np.pi / 4, 0,
         np.array([3194.4187944733417, 3194.418794473341, 4487.347916379808])),
        (np.radians(39.007), np.radians(-104.883), 2.187,  # Ex. 7-1
         np.array(
             [-1275.1217701148173, -4797.988500532293, 3994.2970129784385])
         )
    ]
)
def test_site(latgd, lon, alt, rsecef_exp):
    rsecef, vsecef = site(latgd, lon, alt)
    assert np.allclose(rsecef, rsecef_exp, rtol=DEFAULT_TOL)
    assert np.allclose(vsecef, [0.0, 0.0, 0.0], rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    'znew, c2new_exp, c3new_exp',
    [
        (-39.47842, 6.756775284482481, 1.054067771837564),
        (0, 0.5, 0.16666666666666666),
        (0.57483, 0.47650299902524496, 0.16194145738041812),
        (39.47842, 4.612053269571722e-16, 0.025330293604932358)
    ]
)
def test_findc2c3(znew, c2new_exp, c3new_exp):
    c2new, c3new = findc2c3(znew)
    assert np.isclose(c2new, c2new_exp, rtol=DEFAULT_TOL)
    assert np.isclose(c3new, c3new_exp, rtol=DEFAULT_TOL)


def test_lon2nu():
    jdut1 = 2456864.5
    lon = np.radians(7.020438698)
    incl = np.radians(0.070273056)
    raan = np.radians(19.90450011)
    argp = np.radians(352.5056022)
    nu = lon2nu(jdut1, lon, incl, raan, argp)
    assert np.isclose(nu, 5.204957786050412, rtol=DEFAULT_TOL)

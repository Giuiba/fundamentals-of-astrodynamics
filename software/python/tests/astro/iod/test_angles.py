import numpy as np
import pytest

import src.valladopy.astro.iod.angles as angles

from ...conftest import DEFAULT_TOL


@pytest.fixture
def obs_data():
    """Observation data for three sightings (Vallado 2022, Example 7-2)"""
    # Right Ascension (radians)
    rtasc1, rtasc2, rtasc3 = np.radians([0.939913, 45.025748, 67.886655])

    # Declination (radians)
    decl1, decl2, decl3 = np.radians([18.667717, 35.664741, 36.996583])

    # Julian dates (integer and fractional parts)
    jd1 = jd2 = jd3 = 2456159.5
    jdf1 = 0.4864351851851852
    jdf2 = 0.49199074074074073
    jdf3 = 0.4947685185185185

    return decl1, decl2, decl3, rtasc1, rtasc2, rtasc3, jd1, jdf1, jd2, jdf2, jd3, jdf3


@pytest.fixture
def site_data():
    """Site position vectors for three sightings (Vallado 2022, Example 7-2)"""
    # Site position vectors (ECI, in km)
    rseci1 = [4054.881, 2748.195, 4074.237]
    rseci2 = [3956.224, 2888.232, 4074.364]
    rseci3 = [3905.073, 2956.935, 4074.430]

    return rseci1, rseci2, rseci3


@pytest.mark.parametrize(
    "diffsites, reci_expected, veci_expected",
    [
        (
            True,
            [6375.656382985365, 5309.839885514231, 6530.941565891183],
            [22.32079637714886, 26.24161577925484, 28.464611900869997],
        ),
        (
            False,
            [6375.826207838072, 5310.009863069861, 6531.113998039411],
            [5.836959439606365, 14.208716188023974, 11.488650926772648],
        ),
    ],
)
def test_angles_laplace(obs_data, site_data, diffsites, reci_expected, veci_expected):
    # Calculate position and velocity vectors
    reci, veci = angles.anglesl(*obs_data, diffsites, *site_data)

    # Expected results
    assert np.allclose(reci, reci_expected, rtol=DEFAULT_TOL)
    assert np.allclose(veci, veci_expected, rtol=DEFAULT_TOL)


def test_angles_gauss(obs_data, site_data):
    # Expected results
    reci_expected = [6313.378130210396, 5247.50563344895, 6467.707164431651]
    veci_expected = [-4.185488280436629, 4.7884929168898145, 1.721714659663034]

    # Calculate position and velocity vectors
    reci, veci = angles.anglesg(*obs_data, *site_data)

    # Expected results
    assert np.allclose(reci, reci_expected, rtol=DEFAULT_TOL)
    assert np.allclose(veci, veci_expected, rtol=DEFAULT_TOL)

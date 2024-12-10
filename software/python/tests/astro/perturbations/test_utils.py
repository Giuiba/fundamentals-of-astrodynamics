import numpy as np
import pytest

import src.valladopy.astro.perturbations.utils as utils

from ...conftest import DEFAULT_TOL


@pytest.mark.parametrize(
    "x, expected_result",
    [
        # Test scalar input
        (0.5, -0.4375),
        # Test vector input
        ([0.5, 0.6, 0.7], [-0.4375, -0.36, -0.1925]),
        # Test matrix input
        (
            [[0.1, 0.2, 0.3], [0.4, 0.5, 0.6], [0.7, 0.8, 0.9]],
            [
                [-0.1475, -0.28, -0.3825],
                [-0.44, -0.4375, -0.36],
                [-0.1925, 0.08, 0.4725],
            ],
        ),
    ],
)
def test_leg_poly(x, expected_result):
    # Call leg_poly method
    result = utils.leg_poly(x, order=3)

    # Check results
    assert np.allclose(result, expected_result, rtol=DEFAULT_TOL)


def test_pathm():
    llat = np.radians(50)
    llon = np.radians(40)
    range_ = 0.0553
    az = np.radians(140)

    # Call pathm method
    tlat, tlon = utils.pathm(llat, llon, range_, az)

    # Check results
    assert np.isclose(tlat, 0.8295940837231528, rtol=DEFAULT_TOL)
    assert np.isclose(tlon, 0.7507764872963939, rtol=DEFAULT_TOL)


def test_rngaz():
    llat = np.radians(50)
    llon = np.radians(40)
    tlat = np.radians(65)
    tlon = np.radians(55)
    tof = 1234.56

    # Call rngaz method
    range_, az = utils.rngaz(llat, llon, tlat, tlon, tof)

    # Check results
    assert np.isclose(range_, 2039.9822541511369, rtol=DEFAULT_TOL)
    assert np.isclose(az, 0.4816107666380967, rtol=DEFAULT_TOL)

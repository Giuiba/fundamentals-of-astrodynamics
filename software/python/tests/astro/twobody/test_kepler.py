import numpy as np
import pytest

import src.valladopy.astro.twobody.kepler as kepler


@pytest.mark.parametrize(
    # TODO: find test case where np.abs(alpha) < SMALL
    "ro, vo, dtsec, r_expected, v_expected",
    [
        # alpha >= SMALL
        (
            [-6518.1083, -2403.8479, -22.1722],
            [2.604057, -7.105717, -0.263218],
            120,
            [-6150.8180772417, -3233.5647020192746, -53.47890911642744],
            [3.5085906394995146, -6.703227854017405, -0.2578170063354219],
        ),
        # alpha < SMALL
        (
            [15912.1061, 1352024060, 0],
            [-0.000783895533, 31889.3576, 0],
            100000,
            [15833.716546696181, 4540959819.99955, 0],
            [-0.000783895533049524, 31889.357599993506, 0],
        ),
        # alpha < SMALL, not converged
        (
            [15912.1061, 1352024060, 0],
            [-0.000783895533, 31889.3576, 0],
            5485549291.841488,
            [0, 0, 0],
            [0, 0, 0],
        ),
    ],
)
def test_kepler(ro, vo, dtsec, r_expected, v_expected):
    r, v = kepler.kepler(ro, vo, dtsec)
    assert np.allclose(r, r_expected, rtol=1e-12)
    assert np.allclose(v, v_expected, rtol=1e-12)

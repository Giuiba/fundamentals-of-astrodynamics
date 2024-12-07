import numpy as np
import pytest

import src.valladopy.astro.twobody.kepler as kepler

from ...conftest import DEFAULT_TOL


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
    assert np.allclose(r, r_expected, rtol=DEFAULT_TOL)
    assert np.allclose(v, v_expected, rtol=DEFAULT_TOL)


def test_pkepler():
    # Input values
    ro = [-6518.1083, -2403.8479, -22.1722]
    vo = [2.604057, -7.105717, -0.263218]
    dtsec = 12345.0
    ndot, nddot = 5e-10, 1e-15

    # Expected values
    r_expected = [-1918.8942755619782, -6636.821817502705, -210.30326936057827]
    v_expected = [7.295164512561593, -2.115661226327176, -0.13016935223789428]

    # Compute the position and velocity vectors
    r, v = kepler.pkepler(ro, vo, dtsec, ndot, nddot)

    assert np.allclose(r, r_expected, rtol=DEFAULT_TOL)
    assert np.allclose(v, v_expected, rtol=DEFAULT_TOL)


def test_pkepler_bad_inputs(caplog):
    # Input values
    ro = [15912.1061, 1352024060, 0]
    vo = [-0.000783895533, 31889.3576, 0]

    # Compute the position and velocity vectors
    r, v = kepler.pkepler(ro, vo, 100000, 0, 0)

    # Check that the returned values are all zeros and that an error was logged
    assert np.allclose(r, [0, 0, 0], rtol=DEFAULT_TOL)
    assert np.allclose(v, [0, 0, 0], rtol=DEFAULT_TOL)
    assert caplog.records[0].levelname == "ERROR"
    assert caplog.records[0].message == "Negative semi-major axis encountered"

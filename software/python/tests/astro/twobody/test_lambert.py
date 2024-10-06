import numpy as np
import pytest

import src.valladopy.astro.twobody.lambert as lambert
import src.valladopy.constants as const
from ...conftest import DEFAULT_TOL, custom_allclose


@pytest.fixture
def lambert_inputs():
    r1 = np.array([2.5 * const.RE, 0, 0])
    r2 = [1.9151111 * const.RE, 1.6069690 * const.RE, 0]
    v1 = [0, 4.999792554221911, 0]
    nrev = 1
    return r1, r2, v1, nrev


class TestEnumCheck:
    def test_check_enum_valid(self):
        lambert.check_enum(
            lambert.DirectionOfMotion.LONG, lambert.DirectionOfMotion
        )
        lambert.check_enum(
            lambert.DirectionOfEnergy.LONG, lambert.DirectionOfEnergy
        )
        lambert.check_enum(
            lambert.DirectionOfFlight.DIRECT, lambert.DirectionOfFlight
        )

    def test_check_enum_invalid(self):
        with pytest.raises(ValueError):
            lambert.check_enum(
                lambert.DirectionOfEnergy.LONG, lambert.DirectionOfMotion
            )
        with pytest.raises(ValueError):
            lambert.check_enum('X', lambert.DirectionOfMotion)


def test_seebatt():
    # Check nominal case
    v = 0.123
    assert np.isclose(lambert.seebatt(v), 5.153421950753984, rtol=DEFAULT_TOL)

    # Check when `v` is less than -1
    v = -1.5
    with pytest.raises(ValueError):
        lambert.seebatt(v)


def test_kbatt():
    v = 0.123
    assert np.isclose(lambert.kbatt(v), 0.327568960337347, rtol=DEFAULT_TOL)


def test_lambhodograph():
    r1 = [6888, 0, 0]
    v1 = [0, 7.6072, 0]
    r2 = [8000 * np.sin(np.pi/4), 8000 * np.cos(np.pi/4), 0]
    p = 7000
    ecc = 1e-3
    dnu = np.radians(2.1)
    dtsec = 1234

    # Check nominal case
    v1t, v2t = lambert.lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec)
    assert custom_allclose(v1t, [0, 7.668753340719345, 0])
    assert custom_allclose(v2t, [-4.665702986379401, 4.672061552209318, 0])

    # Check when r1 and v1 are parallel and dnu is zero
    new_v1 = [7.6072, 0, 0]
    new_dnu = 0
    with pytest.raises(ValueError):
        lambert.lambhodograph(r1, new_v1, r2, p, ecc, new_dnu, dtsec)

    # Check when r1 and r2 are parallel
    new_r2 = [8000, 0, 0]
    with pytest.raises(ValueError):
        lambert.lambhodograph(r1, v1, new_r2, p, ecc, dnu, dtsec)


@pytest.mark.parametrize(
    'dm, v_exp, aminenergy_exp, tminenergy_exp, tminabs_exp',
    [
        (
            lambert.DirectionOfMotion.LONG,
            [-2.0474089759890735, -2.924003076447717, 0.0],
            10699.484172968232,
            15554.50821587732,
            1534.8915813389815
        ),
        (
            lambert.DirectionOfMotion.SHORT,
            [2.0474089759890735, 2.924003076447717, 0.0],
            10699.484172968232,
            17488.265508772805,
            1534.8915813389815
        )
    ]
)
def test_lambertmin(lambert_inputs, dm, v_exp, aminenergy_exp, tminenergy_exp,
                    tminabs_exp):
    # Unpack inputs
    r1, r2, _, nrev = lambert_inputs

    # Compute Lambert minimum energy
    v, aminenergy, tminenergy, tminabs = lambert.lambertmin(r1, r2, dm, nrev)

    # Check results
    assert np.allclose(v, v_exp, rtol=DEFAULT_TOL)
    assert np.isclose(aminenergy, aminenergy_exp, rtol=DEFAULT_TOL)
    assert np.isclose(tminenergy, tminenergy_exp, rtol=DEFAULT_TOL)
    assert np.isclose(tminabs, tminabs_exp, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    'dm, de, tmin_exp, tminp_exp, tminenergy_exp',
    [
        (
            lambert.DirectionOfMotion.LONG,
            lambert.DirectionOfEnergy.LONG,
            12468.267989702517,
            3139.7046602121873,
            17488.26550877280
        ),
        (
            lambert.DirectionOfMotion.SHORT,
            lambert.DirectionOfEnergy.LONG,
            15048.526832075213,
            1534.8915813389815,
            15554.50821587732
        ),
        (
            lambert.DirectionOfMotion.LONG,
            lambert.DirectionOfEnergy.HYPERBOLICSHORT,
            21648.968497701877,
            3139.7046602121873,
            17488.265508772805
        ),
        (
            lambert.DirectionOfMotion.SHORT,
            lambert.DirectionOfEnergy.HYPERBOLICSHORT,
            16972.34235386572,
            1534.8915813389815,
            15554.50821587732
        )
    ]
)
def test_lambertmint(lambert_inputs, dm, de, tmin_exp, tminp_exp,
                     tminenergy_exp):
    # Unpack inputs
    r1, r2, _, nrev = lambert_inputs

    # Compute Lambert minimum time
    tmin, tminp, tminenergy = lambert.lambertmint(r1, r2, dm, de, nrev)

    # Check results
    assert np.allclose(tmin, tmin_exp, rtol=DEFAULT_TOL)
    assert np.allclose(tminp, tminp_exp, rtol=DEFAULT_TOL)
    assert np.allclose(tminenergy, tminenergy_exp, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    'dm, df, v1dv_exp, v2dv_exp',
    [
        (
            lambert.DirectionOfMotion.LONG,
            lambert.DirectionOfFlight.DIRECT,
            [-0.8696153795282852, 6.3351545812502374, 0.0],
            [-3.405994961791248, 5.41198791828363, 0.0]
        ),
        (
            lambert.DirectionOfMotion.SHORT,
            lambert.DirectionOfFlight.DIRECT,
            [5.832522716212579, 1.4319944881331306, 0.0],
            [-5.388439978490882, -2.652101898141935, 0.0]
        ),
        (
            lambert.DirectionOfMotion.LONG,
            lambert.DirectionOfFlight.RETROGRADE,
            [-6.241103309400493, -1.351339299630816, 0.0],
            [5.6495867154901545, 2.976517897853268, 0.0]
        ),
        (
            lambert.DirectionOfMotion.SHORT,
            lambert.DirectionOfFlight.RETROGRADE,
            [0.6411191586146303, -5.957501823796459, 0.0],
            [3.33828270226307, -4.975814585231199, 0.0]
        )
    ]
)
def test_lambertb(lambert_inputs, dm, df, v1dv_exp, v2dv_exp):
    # Unpack inputs and set dtsec
    r1, r2, v1, nrev = lambert_inputs
    dtsec = 92854.234

    # Compute Lambert minimum time
    v1dv, v2dv = lambert.lambertb(r1, v1, r2, dm, df, nrev, dtsec)

    # Check results
    assert np.allclose(v1dv, v1dv_exp, rtol=DEFAULT_TOL)
    assert np.allclose(v2dv, v2dv_exp, rtol=DEFAULT_TOL)


def test_lambertb_bad_inputs(lambert_inputs):
    # Unpack inputs
    r1, r2, v1, nrev = lambert_inputs
    dm = lambert.DirectionOfMotion.LONG
    df = lambert.DirectionOfFlight.DIRECT

    # Check when dtsec is 0
    with pytest.raises(ValueError):
        lambert.lambertb(r1, v1, r2, dm, df, nrev, dtsec=0)

    # Check when dtsec is positive but within a certain range
    # (hits the error in a different part of the algorithm)
    with pytest.raises(ValueError):
        lambert.lambertb(r1, v1, r2, dm, df, nrev, dtsec=-76*60)


@pytest.mark.parametrize(
    'dm, psib_exp, tof_exp',
    [
        (lambert.DirectionOfMotion.LONG, 113.602815095262, 16971.386078436695),
        (lambert.DirectionOfMotion.SHORT, 57.8159275519482, 15048.626881962446)
    ]
)
def test_lambertumins(lambert_inputs, dm, psib_exp, tof_exp):
    # Unpack inputs
    r1, r2, _, nrev = lambert_inputs

    # Compute universal variable Lambert problem
    psib, tof = lambert.lambertumins(r1, r2, dm, nrev)

    # Check results
    assert np.isclose(psib, psib_exp, rtol=DEFAULT_TOL)
    assert np.isclose(tof, tof_exp, rtol=DEFAULT_TOL)

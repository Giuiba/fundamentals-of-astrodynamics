import numpy as np
import pytest

from src.valladopy.twobody.kepler import (
    OrbitType, determine_orbit_type,
    newtonnu, newtonm
)


@pytest.mark.parametrize('ecc, incl, expected_orbit_type', [
    (0.0, 0.0, OrbitType.CIR_EQUATORIAL),  # Circular equatorial
    (0.0, np.pi, OrbitType.CIR_EQUATORIAL),  # Circular equatorial
    (0.0, 0.1, OrbitType.CIR_INCLINED),  # Circular inclined
    (0.1, 0.0, OrbitType.EPH_EQUATORIAL),  # Elliptical equatorial
    (0.1, np.pi, OrbitType.EPH_EQUATORIAL),  # Elliptical equatorial
    (0.1, 0.1, OrbitType.EPH_INCLINED),  # Elliptical inclined
    (1.1, 0.0, OrbitType.EPH_EQUATORIAL),  # Hyperbolic equatorial
    (1.1, np.pi, OrbitType.EPH_EQUATORIAL),  # Hyperbolic equatorial
    (1.1, 0.1, OrbitType.EPH_INCLINED),  # Hyperbolic inclined
])
def test_determine_orbit_type(ecc, incl, expected_orbit_type):
    assert determine_orbit_type(ecc, incl) == expected_orbit_type


def test_newtonnu():
    # TODO: test all cases
    ecc = 0.1
    nu = np.radians(45)
    e0, m = newtonnu(ecc, nu)
    assert abs(np.degrees(e0) - 41.078960346507934) < 1e-12
    assert abs(np.degrees(m)) - 37.31406335764441 < 1e-12


@pytest.mark.parametrize(
    'ecc, m, expected_e0, expected_nu',
    [
        # Test elliptical orbit (0 < ecc < 1)
        # Vallado Ex. 2-1
        (0.4, np.radians(235.4), 3.8486617450971616, -2.6674915592323702),
        # Test hyperbolic orbit (ecc > 1)
        (1.5, np.pi/2, 1.449742150875263, 1.8916928725677562),
        # Test parabolic orbit (ecc = 1)
        (1.0, np.pi/4, 0.6804016596037228, 1.1949025292471007),
        # Test circular orbit (ecc = 0)
        (0, np.pi/3, np.pi/3, np.pi/3),  # e0 and nu should equal m
        # Test edge cases
        (0.9999, np.pi, np.pi, np.pi),   # Near-parabolic
        (0, 0, 0, 0),                    # Circular and m = 0
    ]
)
def test_newtonm(ecc, m, expected_e0, expected_nu):
    e0, nu = newtonm(ecc, m)
    assert abs(e0 - expected_e0) < 1e-11
    assert abs(nu - expected_nu) < 1e-12

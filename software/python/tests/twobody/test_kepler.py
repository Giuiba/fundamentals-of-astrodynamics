import numpy as np
import pytest

from src.valladopy.twobody.kepler import (
    OrbitType,
    determine_orbit_type,
    newtonnu
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

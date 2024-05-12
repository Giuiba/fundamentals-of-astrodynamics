import numpy as np
import pytest

from src.valladopy.twobody.frame_conversions import (
    adbar2rv, rv2adbar, coe2rv, rv2coe
)
from src.valladopy.twobody.kepler import OrbitType


DEFAULT_TOL = 1e-12


class TestSpherical:
    @pytest.fixture
    def rv(self):
        # Position and velocity in km and km/s
        r = np.array([4.286607049870562e+03, 4.286607049870561e+03, 3.5e+03])
        v = np.array([4.059474712855235, 4.860051329924127, 4.018776695238445])
        return r, v

    @pytest.fixture
    def rvmag(self, rv):
        rmag = np.linalg.norm(rv[0])
        vmag = np.linalg.norm(rv[1])
        return rmag, vmag

    @pytest.fixture
    def adbarv(self, rvmag):
        rtasc = np.radians(45)
        decl = np.radians(30)
        fpav = np.radians(5)
        az = np.radians(60)
        return rvmag[0], rvmag[1], rtasc, decl, fpav, az

    def test_adbar2rv(self, rv, adbarv):
        # Unpack variables
        rmag, vmag, rtasc, decl, fpav, az = adbarv
        expected_r, expected_v = rv  # expected values

        # Call the function with test inputs
        r, v = adbar2rv(rmag, vmag, rtasc, decl, fpav, az)

        # Check if the output is close to the expected values
        assert np.allclose(r, expected_r, rtol=DEFAULT_TOL)
        assert np.allclose(v, expected_v, rtol=DEFAULT_TOL)

    def test_rv2adbar(self, rv, adbarv):
        expected_elems = adbarv

        # Call the function with test inputs
        out = rv2adbar(rv[0], rv[1])

        # Check if the output is close to the expected values
        assert np.allclose(out, expected_elems, rtol=DEFAULT_TOL)


class TestClassical:
    @pytest.fixture
    def coe(self):
        # Vallado, 2007, Ex. 2-6
        p = 11067.790              # semi-latus rectum, km
        ecc = 0.83285              # eccentricity
        incl = np.radians(87.87)   # inclination, rad
        raan = np.radians(227.89)  # RAAN, rad
        argp = np.radians(53.38)   # arg. of periapsis, rad
        nu = np.radians(92.335)    # true anomaly, rad
        return p, ecc, incl, raan, argp, nu

    @pytest.fixture
    def rv(self):
        # Vallado, 2007, Ex. 2-5
        # Position and velocity in km and km/s
        r = np.array([6524.834, 6862.875, 6448.296])
        v = np.array([4.901327, 5.533756, -1.976341])
        return r, v

    def test_coe2rv(self, coe):
        # Vallado, 2007, Ex. 2-6
        p, ecc, incl, raan, _, nu = coe
        r_exp = np.array([-4.049198890323112e+03, -4.479765179366826e+03, 0])
        v_exp = np.array(
            [0.303279847002191, -0.274130533804499, 10.9917080783198]
        )

        # Call the function with test inputs
        r_out, v_out = coe2rv(p, ecc, incl, raan, nu)

        # Check if the output is close to the expected values
        assert np.allclose(r_out, r_exp, rtol=DEFAULT_TOL)
        assert np.allclose(v_out, v_exp, rtol=DEFAULT_TOL)

    def test_rv2coe(self, rv):
        # Vallado, 2007, Ex. 2-5
        # TODO: add tests for other orbit type cases
        # Call the function with test inputs
        (p, a, ecc, incl, raan, argp, nu,
         m, arglat, truelon, lonper, orbit_type) = rv2coe(*rv)

        # Check if the output is close to the expected values
        assert abs(p - 11067.798350991814) < DEFAULT_TOL
        assert abs(a - 36127.337763974785) < DEFAULT_TOL
        assert abs(ecc - 0.8328533990836885) < DEFAULT_TOL
        assert abs(incl - 1.5336055626394494) < DEFAULT_TOL
        assert abs(raan - 3.9775750028016947) < DEFAULT_TOL
        assert abs(argp - 0.9317428111437854) < DEFAULT_TOL
        assert abs(nu - 1.6115524999414736) < DEFAULT_TOL
        assert abs(m - 0.1327277817291186) < DEFAULT_TOL
        assert abs(arglat - 2.5432953110852594) < DEFAULT_TOL
        assert np.isnan(truelon)
        assert np.isnan(lonper)
        assert orbit_type is OrbitType.EPH_INCLINED

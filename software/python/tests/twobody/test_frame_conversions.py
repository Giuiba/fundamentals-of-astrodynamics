import numpy as np
import pytest

from src.valladopy.twobody.frame_conversions import adbar2rv, rv2adbar, coe2rv


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
        assert np.allclose(r, expected_r, rtol=1e-12)
        assert np.allclose(v, expected_v, rtol=1e-12)

    def test_rv2adbar(self, rv, adbarv):
        expected_elems = adbarv

        # Call the function with test inputs
        out = rv2adbar(rv[0], rv[1])

        # Check if the output is close to the expected values
        assert np.allclose(out, expected_elems, rtol=1e-12)


class TestClassical:
    @pytest.fixture
    def coe(self):
        p = 11067.790              # semi-latus rectum, km
        ecc = 0.83285              # eccentricity
        incl = np.radians(87.87)   # inclination, rad
        raan = np.radians(227.89)  # RAAN, rad
        argp = np.radians(53.38)   # arg. of periapsis, rad
        nu = np.radians(92.335)    # true anomaly, rad
        return p, ecc, incl, raan, argp, nu

    @pytest.fixture
    def rv(self):
        # Position and velocity in km and km/s
        r = np.array([-4.049198890323112e+03, -4.479765179366826e+03, 0])
        v = np.array([0.303279847002191, -0.274130533804499, 10.9917080783198])
        return r, v

    def test_coe2rv(self, coe, rv):
        # Reference: Vallado, 2007, p. 126, Ex. 2-5
        p, ecc, incl, raan, _, nu = coe
        r_expected, v_expected = rv

        # Call the function with test inputs
        r_out, v_out = coe2rv(p, ecc, incl, raan, nu)

        # Check if the output is close to the expected values
        assert np.allclose(r_out, r_expected, rtol=1e-12)
        assert np.allclose(v_out, v_expected, rtol=1e-12)

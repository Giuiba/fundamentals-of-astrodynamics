import numpy as np
import pytest

from src.valladopy.twobody.frame_conversions import adbar2rv, rv2adbar


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

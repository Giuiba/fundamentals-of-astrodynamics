import numpy as np
import pytest

from src.valladopy.twobody.frame_conversions import (
    adbar2rv, rv2adbar, coe2rv, rv2coe, eq2rv, rv2eq, tradec2rv, rv2tradec
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
        # TODO: lonper is not `nan` in the book example (but is in matlab)
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


class TestEquinoctial:
    # TODO: validate with more test cases
    @pytest.fixture
    def eq(self):
        a = 7000           # semimajor axis, km
        af = 0.001         # eccentricity component
        ag = 0.001         # eccentricity component
        chi = 0.001        # EQW node vector component
        psi = 0.001        # EQW node vector component
        meanlon = np.pi/4  # mean longitude, rad
        fr = 1             # retrograde factor (+1 = prograde)
        return a, af, ag, chi, psi, meanlon, fr

    @pytest.fixture
    def rv(self):
        r = np.array([4942.747468305833, 4942.747468305833, 0])
        v = np.array(
            [-5.34339547370427, 5.343395473704271, 0.021373624642066363]
        )
        return r, v

    def test_eq2rv(self, eq, rv):
        # Expected outputs
        r_exp, v_exp = rv

        # Call the function with test inputs
        r_out, v_out = eq2rv(*eq)

        # Check if the outputs are close to the expected values
        assert np.allclose(r_out, r_exp, rtol=DEFAULT_TOL)
        assert np.allclose(v_out, v_exp, rtol=DEFAULT_TOL)

    def test_rv2eq(self, rv, eq):
        # expected outputs
        a_exp, af_exp, ag_exp, chi_exp, psi_exp, meanlon_exp, fr_exp = eq

        # Call the function with test inputs
        a, n, af, ag, chi, psi, meanlon, truelon, fr = rv2eq(*rv)

        # Check if the outputs are close to the expected values
        assert abs(a - a_exp) < DEFAULT_TOL
        assert abs(n - 0.001078007612466833) < DEFAULT_TOL
        assert abs(af - af_exp) < DEFAULT_TOL
        assert abs(ag - ag_exp) < DEFAULT_TOL
        assert abs(chi - chi_exp) < DEFAULT_TOL
        assert abs(psi - psi_exp) < DEFAULT_TOL
        assert abs(meanlon - meanlon_exp) < DEFAULT_TOL
        assert abs(truelon - np.pi/4) < DEFAULT_TOL
        assert int(fr) == int(fr_exp)


class TestTopocentric:
    @pytest.fixture
    def rvseci(self):
        # ECI site position and velocity vector in km and km/s
        rseci = [
            -2.968655122428691e+03,
            3.980613919662232e+03,
            3.992860345291290e+03
        ]
        vseci = [-0.290278922351514, -0.216325537609299, -0.000157672327972]
        return rseci, vseci

    @pytest.fixture
    def tradec(self):
        # Topocentric coordinates
        rho = 4.437731184421759e+09       # range, km
        trtasc = 5.148532095674960        # right ascension, rad
        tdecl = -0.363438990548242        # declination, rad
        drho = -25.599038196399519        # range rate, km/s
        tdrtasc = -2.051513501139983e-09  # right ascension rate, rad/s
        tddecl = -3.189648164446254e-10   # declination rate, rad/s
        return rho, trtasc, tdecl, drho, tdrtasc, tddecl

    @pytest.fixture
    def rveci(self):
        r_eci = [1752246215.6652846, -3759563434.243893, -1577568101.96675]
        v_eci = [-18.323497062513614, 18.332049491766764, 7.777041227057346]
        return r_eci, v_eci

    def test_tradec2rv(self, rvseci, tradec, rveci):
        # Expected outputs
        r_eci_exp, v_eci_exp = rveci

        # Call the function with test inputs
        r_eci, v_eci = tradec2rv(*tradec, *rvseci)

        # Check if the output is close to the expected values
        assert np.allclose(r_eci, r_eci_exp, rtol=DEFAULT_TOL)
        assert np.allclose(v_eci, v_eci_exp, rtol=DEFAULT_TOL)

    def test_rv2tradec(self, rvseci, tradec, rveci):
        # Call the function with test inputs
        tradec_out = rv2tradec(*rveci, *rvseci)

        # Check if the output is close to the expected values
        assert np.allclose(tradec_out, np.array(tradec), rtol=DEFAULT_TOL)

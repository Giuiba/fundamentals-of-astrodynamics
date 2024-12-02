import numpy as np
import pytest

import src.valladopy.astro.time.frame_conversions as fc
from src.valladopy.constants import ARCSEC2RAD
from ...conftest import custom_allclose

DEFAULT_TOL = 1e-12


@pytest.fixture
def rva_eci():
    # Example ECI vectors (km, km/s, km/s^2)
    reci = np.array([2989.905220660578, -7387.200565596868, 6379.438182851598])
    veci = np.array([2.940401948462732, 3.809395206305895, 5.53064935673674])
    aeci = np.array([-3.927364527726347e-05, -0.00269956155725574, 0.0030002544835211])
    return reci, veci, aeci


@pytest.fixture
def rva_ecef():
    # Example ECEF vectors (km, km/s, km/s^2)
    recef = np.array([-1033.4793830, 7901.2952754, 6380.3565958])
    vecef = np.array([-3.225636520, -2.872451450, 5.531924446])
    aecef = np.array([0.001, 0.002, 0.003])
    return recef, vecef, aecef


def get_rvpef():
    # Example PEF vectors (km, km/s, km/s^2) [opt = "80"]
    rpef = [-1033.4750313057266, 7901.305585585349, 6380.344532748868]
    vpef = [-3.225632746974616, -2.872442510803122, 5.531931287696299]
    apef = [0.000293685046453725, 0.0031151716514636447, 0.0030001437204660755]
    return rpef, vpef, apef


@pytest.fixture
def rva_pef():
    return get_rvpef()


@pytest.fixture
def rva_mod():
    # Example MOD vectors (km, km/s, km/s^2)
    rmod = [2994.30249664958, -7384.348641268552, 6380.677444947862]
    vmod = [2.934478765910065, 3.8121950281090644, 5.531865978456613]
    amod = [-3.79431747506729e-05, -0.0026995983568731115, 0.003000238492782315]
    return rmod, vmod, amod


def get_rvatod():
    # Example TOD vectors (km, km/s, km/s^2) [opt = "80"]
    rtod = [2994.049189091933, -7384.738996771148, 6380.344532748868]
    vtod = [2.9348194081733827, 3.8118380124472613, 5.531931287696299]
    atod = [-3.801990321023478e-05, -0.002699702600291877, 0.0030001437204660755]
    return rtod, vtod, atod


@pytest.fixture
def rva_tod():
    return get_rvatod()


@pytest.fixture
def rva_teme():
    # Example TEME vectors (km, km/s, km/s^2)
    rteme = [2994.454240128889, -7384.574761007484, 6380.344532748868]
    vteme = [2.9346103230979974, 3.8119989825937415, 5.531931287696299]
    ateme = [-3.787182351239877e-05, -0.0026997046816358795, 0.0030001437204660755]
    return rteme, vteme, ateme


@pytest.fixture
def t_inputs():
    # Time inputs
    ttt = 0.042623631888994  # Julian centuries of TT
    jdut1 = 2.4531015e06  # Julian date of UT1
    lod = 0.0015563  # excess length of day, sec
    return ttt, jdut1, lod


@pytest.fixture
def orbit_effects_inputs():
    # Other inputs for accounting for orbit effectgs
    xp = -0.140682 * ARCSEC2RAD  # polar motion coefficient, rad
    yp = 0.333309 * ARCSEC2RAD  # polar motion coefficient, rad
    ddpsi = -0.052195 * ARCSEC2RAD  # delta psi correction to GCRF, rad
    ddeps = -0.003875 * ARCSEC2RAD  # delta epsilon correction to GCRF, rad
    eqeterms = True  # add extra terms for ast calculation
    return xp, yp, ddpsi, ddeps, eqeterms


@pytest.fixture
def eop_corrections():
    ddx = -0.000205 * ARCSEC2RAD  # delta x correction to GCRF, rad
    ddy = -0.000136 * ARCSEC2RAD  # delta y correction to GCRF, rad
    return ddx, ddy


def test_eci2ecef(rva_ecef, rva_eci, t_inputs, orbit_effects_inputs):
    # Expected ECEF output vectors
    recef, vecef, _ = rva_ecef

    # Call the function with test inputs
    recef_out, vecef_out, aecef_out = fc.eci2ecef(
        *rva_eci, *t_inputs, *orbit_effects_inputs
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(recef, recef_out)
    assert custom_allclose(vecef, vecef_out)

    # For some reason, the acceleration out does not quite match that from the
    # original ECEF input
    aecef = np.array(
        [0.0002936830002159169, 0.0031151668034451073, 0.003000148416052949]
    )
    assert custom_allclose(aecef, aecef_out)


def test_ecef2eci(rva_ecef, rva_eci, t_inputs, orbit_effects_inputs):
    # Expected ECI output vectors
    reci, veci, aeci = rva_eci

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = fc.ecef2eci(
        *rva_ecef, *t_inputs, *orbit_effects_inputs
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)


@pytest.mark.parametrize(
    "opt, rpef_exp, vpef_exp, apef_exp",
    [
        ("80", *get_rvpef()),
        (
            "06a",
            [-1033.4734337662508, 7901.305790524991, 6380.3445377211865],
            [-3.225633311574051, -2.872441866986253, 5.531931294553923],
            [0.00029368567694983984, 0.0031151715898397126, 0.003000143719901478],
        ),
        (
            "06b",
            [-1033.4734456702645, 7901.305791560639, 6380.344534510474],
            [-3.22563332182, -2.8724418652201553, 5.531931287939059],
            [0.0002936856715466058, 0.003115171591826446, 0.003000143720818848],
        ),
        (
            "06c",
            [-1033.4734409358227, 7901.305788025019, 6380.344539655799],
            [-3.2256333179729153, -2.8724418686308826, 5.531931289126641],
            [0.00029368567330056804, 0.003115171589584073, 0.0030001437217282664],
        ),
    ],
)
def test_eci2pef(
    rva_eci,
    t_inputs,
    orbit_effects_inputs,
    eop_corrections,
    opt,
    rpef_exp,
    vpef_exp,
    apef_exp,
):
    # Orbit effects inputs
    *_, ddpsi, ddeps, eqeterms = orbit_effects_inputs

    # Call the function with test inputs
    rpef_out, vpef_out, apef_out = fc.eci2pef(
        *rva_eci, *t_inputs, ddpsi, ddeps, opt, *eop_corrections, eqeterms
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rpef_exp, rpef_out)
    assert custom_allclose(vpef_exp, vpef_out)
    assert custom_allclose(apef_exp, apef_out)


def test_pef2eci(t_inputs, orbit_effects_inputs, rva_eci, rva_pef):
    # Expected ECI output vectors
    reci, veci, aeci = rva_eci

    # Orbit effects inputs
    *_, ddpsi, ddeps, eqeterms = orbit_effects_inputs

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = fc.pef2eci(
        *rva_pef, *t_inputs, ddpsi, ddeps, eqeterms
    )

    # Expected ECI output vectors
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)


@pytest.mark.parametrize(
    "opt, rtod_exp, vtod_exp, atod_exp",
    [
        ("80", *get_rvatod()),
        (
            "06a",
            [2994.0511035304567, -7384.738216289892, 6380.3445377211865],
            [2.934818401418668, 3.8118387776179086, 5.531931294553923],
            [-3.8019204736770936e-05, -0.0026997026107558153, 0.003000143719901478],
        ),
        (
            "06b",
            [2994.051083864024, -7384.73822703743, 6380.344534510474],
            [2.934818427864671, 3.8118387668563694, 5.531931287939059],
            [-3.8019210693728655e-05, -0.0026997026096524635, 0.003000143720818848],
        ),
        (
            "06c",
            [2987.4142083334755, -7387.425590613056, 6380.344539655799],
            [2.9382424201279527, 3.809200107170083, 5.531931289126641],
            [-4.044505401041308e-05, -0.002699667356008036, 0.0030001437217282664],
        ),
    ],
)
def test_eci2tod(
    rva_eci,
    t_inputs,
    orbit_effects_inputs,
    eop_corrections,
    opt,
    rtod_exp,
    vtod_exp,
    atod_exp,
):
    # Extract inputs
    ttt, *_ = t_inputs
    _, _, ddpsi, ddeps, _ = orbit_effects_inputs

    # Call the function with test inputs
    rtod_out, vtod_out, atod_out = fc.eci2tod(
        *rva_eci, ttt, ddpsi, ddeps, opt, *eop_corrections
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rtod_exp, rtod_out)
    assert custom_allclose(vtod_exp, vtod_out)
    assert custom_allclose(atod_exp, atod_out)


def test_tod2eci(t_inputs, orbit_effects_inputs, rva_eci, rva_tod):
    # Expected ECI output vectors
    reci, veci, aeci = rva_eci

    # Extract inputs
    ttt, *_ = t_inputs
    *_, ddpsi, ddeps, _ = orbit_effects_inputs

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = fc.tod2eci(*rva_tod, ttt, ddpsi, ddeps)

    # Expected ECI output vectors
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)


def test_eci2mod(rva_eci, rva_mod, t_inputs):
    # Expected MOD output vectors
    rmod, vmod, amod = rva_mod

    # Extract inputs
    ttt, *_ = t_inputs

    # Call the function with test inputs
    rmod_out, vmod_out, amod_out = fc.eci2mod(*rva_eci, ttt)

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rmod, rmod_out)
    assert custom_allclose(vmod, vmod_out)
    assert custom_allclose(amod, amod_out)


def test_mod2eci(rva_eci, rva_mod, t_inputs):
    # Expected ECI output vectors
    reci, veci, aeci = rva_eci

    # Extract inputs
    ttt, *_ = t_inputs

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = fc.mod2eci(*rva_mod, ttt)

    # Check if the output vectors are close to the expected values
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)


def test_eci2teme(rva_eci, rva_teme, t_inputs, orbit_effects_inputs):
    # Expected TEME output vectors
    rteme, vteme, ateme = rva_teme

    # Extract inputs
    ttt, *_ = t_inputs
    _, _, ddpsi, ddeps, _ = orbit_effects_inputs

    # Call the function with test inputs
    rteme_out, vteme_out, ateme_out = fc.eci2teme(*rva_eci, ttt, ddpsi, ddeps)

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rteme, rteme_out)
    assert custom_allclose(vteme, vteme_out)
    assert custom_allclose(ateme, ateme_out)


def test_teme2eci(rva_eci, rva_teme, t_inputs, orbit_effects_inputs):
    # Expected ECI output vectors
    reci, veci, aeci = rva_eci

    # Extract inputs
    ttt, *_ = t_inputs
    _, _, ddpsi, ddeps, _ = orbit_effects_inputs

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = fc.teme2eci(*rva_teme, ttt, ddpsi, ddeps)

    # Check if the output vectors are close to the expected values
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)


def test_ecef2pef(rva_ecef, rva_pef, t_inputs, orbit_effects_inputs):
    # Expected PEF output vectors
    # For some reason, the acceleration out does not quite match that from the
    # original PEF input
    rpef, vpef, _ = rva_pef
    apef = [0.0010000020461365159, 0.0020000048477791838, 0.0029999960860945377]

    # Extract inputs
    ttt, *_ = t_inputs
    xp, yp, *_ = orbit_effects_inputs

    # Call the function with test inputs
    rpef_out, vpef_out, apef_out = fc.ecef2pef(*rva_ecef, xp, yp, ttt, opt="80")

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rpef, rpef_out)
    assert custom_allclose(vpef, vpef_out)
    assert custom_allclose(apef, apef_out)


def test_pef2ecef(rva_ecef, rva_pef, t_inputs, orbit_effects_inputs):
    # Expected ECEF output vectors
    # For some reason, the acceleration out does not quite match that from the
    # original ECEF input
    recef, vecef, _ = rva_ecef
    aecef = [0.00029368300021545085, 0.0031151668034444385, 0.0030001489546600006]

    # Extract inputs
    ttt, *_ = t_inputs
    xp, yp, *_ = orbit_effects_inputs

    # Call the function with test inputs
    recef_out, vecef_out, aecef_out = fc.pef2ecef(*rva_pef, xp, yp, ttt, opt="80")

    # Check if the output vectors are close to the expected values
    assert custom_allclose(recef, recef_out)
    assert custom_allclose(vecef, vecef_out)
    assert custom_allclose(aecef, aecef_out)


def test_ecef2mod(rva_ecef, rva_mod, t_inputs, orbit_effects_inputs):
    # Expected MOD output vectors
    # For some reason, the acceleration out does not quite match that from the
    # original MOD input
    rmod, vmod, _ = rva_mod
    amod = [-0.0010028781946650484, -0.0017988314102041973, 0.003000035987896538]

    # Call the function with test inputs
    rmod_out, vmod_out, amod_out = fc.ecef2mod(
        *rva_ecef, *t_inputs, *orbit_effects_inputs
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(rmod, rmod_out)
    assert custom_allclose(vmod, vmod_out)
    assert custom_allclose(amod, amod_out)

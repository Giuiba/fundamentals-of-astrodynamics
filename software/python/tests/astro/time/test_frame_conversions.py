import numpy as np

from src.valladopy.constants import ARCSEC2RAD
from src.valladopy.astro.time.frame_conversions import ecef2eci
from ...conftest import custom_allclose

DEFAULT_TOL = 1e-12


def test_ecef2eci():
    # Define input ECEF vectors (km/s)
    recef = np.array([-1033.4793830, 7901.2952754, 6380.3565958])
    vecef = np.array([-3.225636520, -2.872451450, 5.531924446])
    aecef = np.array([0.001, 0.002, 0.003])

    # Expected ECI output vectors
    reci = np.array([2989.905220660578, -7387.200565596868, 6379.438182851598])
    veci = np.array([2.940401948462732, 3.809395206305895, 5.53064935673674])
    aeci = np.array([-3.927364527726347e-05, -0.00269956155725574,
                     0.0030002544835211])

    # Time inputs
    ttt = 0.042623631888994  # Julian centuries of TT
    jdut1 = 2.4531015e+06    # Julian date of UT1
    lod = 0.0015563          # Excess length of day, sec

    # Other inputs
    xp = -0.140682 * ARCSEC2RAD     # Polar motion coefficient
    yp = 0.333309 * ARCSEC2RAD      # Polar motion coefficient
    eqeterms = True                 # Add extra terms for ast calculation
    ddpsi = -0.052195 * ARCSEC2RAD  # Delta psi correction to GCRF, raed
    ddeps = -0.003875 * ARCSEC2RAD  # Delta epsilon correction to GCRF

    # Call the function with test inputs
    reci_out, veci_out, aeci_out = ecef2eci(
        recef, vecef, aecef, ttt, jdut1, lod, xp, yp, ddpsi, ddeps, eqeterms
    )

    # Check if the output vectors are close to the expected values
    assert custom_allclose(reci, reci_out)
    assert custom_allclose(veci, veci_out)
    assert custom_allclose(aeci, aeci_out)

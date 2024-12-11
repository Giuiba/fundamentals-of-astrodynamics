import numpy as np

import src.valladopy.astro.mission.geometry as geometry

from ...conftest import DEFAULT_TOL


def test_pathm():
    llat = np.radians(50)
    llon = np.radians(40)
    range_ = 0.0553
    az = np.radians(140)

    # Call pathm method
    tlat, tlon = geometry.pathm(llat, llon, range_, az)

    # Check results
    assert np.isclose(tlat, 0.8295940837231528, rtol=DEFAULT_TOL)
    assert np.isclose(tlon, 0.7507764872963939, rtol=DEFAULT_TOL)


def test_rngaz():
    llat = np.radians(50)
    llon = np.radians(40)
    tlat = np.radians(65)
    tlon = np.radians(55)
    tof = 1234.56

    # Call rngaz method
    range_, az = geometry.rngaz(llat, llon, tlat, tlon, tof)

    # Check results
    assert np.isclose(range_, 2039.9822541511369, rtol=DEFAULT_TOL)
    assert np.isclose(az, 0.4816107666380967, rtol=DEFAULT_TOL)


def test_satfov():
    # Define inputs
    az = np.radians(60)
    slatgd = np.radians(50)
    slon = np.radians(40)
    salt = 800
    tfov = np.radians(25)
    etactr = np.radians(27.5)

    # Call satfov method
    rhomin, rhomax, lat, lon = geometry.satfov(az, slatgd, slon, salt, tfov, etactr)

    # Check results
    assert np.isclose(rhomin, 705.4162089609695, rtol=DEFAULT_TOL)
    assert np.isclose(rhomax, 1095.1968425221394, rtol=DEFAULT_TOL)
    assert np.isclose(lat, 0.9220427081196254, rtol=DEFAULT_TOL)
    assert np.isclose(lon, 0.8570042342856551, rtol=DEFAULT_TOL)

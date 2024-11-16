import os
import pytest

import numpy as np
import scipy

from src.valladopy.astro.time.iau_transform import iau80in, iau06in, iau06era, iau06gst
from ...conftest import custom_allclose, DEFAULT_TOL


def load_matlab_data(file_path: str, keys: list) -> dict:
    """Load MATLAB .mat file data

    Args:
        file_path (str): Path to the .mat file
        keys (list): list of variable names to grab

    Returns:
        dict [str, np.ndarray]: Dictionary of the input keys and their associated matlab
                                data as numpy arrays
    """
    # Load the .m data file
    data = scipy.io.loadmat(file_path)

    # Grab data for each key
    return {key: data[key] for key in keys}


@pytest.fixture()
def iau80_mat_data():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "nutation_data.mat")
    return load_matlab_data(file_path, keys=["iar80", "rar80"])


@pytest.fixture()
def iau06_mat_data():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "iau06in_data.mat")
    keys = [
        "axs0",
        "a0xi",
        "ays0",
        "a0yi",
        "ass0",
        "a0si",
        "apn",
        "apni",
        "appl",
        "appli",
        "agst",
        "agsti",
    ]
    return load_matlab_data(file_path, keys=keys)


def test_iau80in(iau80_mat_data):
    matlab_iar80 = iau80_mat_data["iar80"]
    matlab_rar80 = iau80_mat_data["rar80"]

    # Load Python data using iau80in
    iar80, rar80 = iau80in()

    # Check that they are the same
    assert np.array_equal(iar80, matlab_iar80)
    assert custom_allclose(rar80, matlab_rar80)


def test_iau06in(iau06_mat_data):
    # Load MATLAB data
    matlab_data = iau06_mat_data

    # Load Python data using iau06in
    axs0, a0xi, ays0, a0yi, ass0, a0si, apn, apni, appl, appli, agst, agsti = iau06in()

    # Check that they are the same
    assert custom_allclose(axs0, matlab_data["axs0"])
    assert np.array_equal(a0xi, matlab_data["a0xi"])
    assert custom_allclose(ays0, matlab_data["ays0"])
    assert np.array_equal(a0yi, matlab_data["a0yi"])
    assert custom_allclose(ass0, matlab_data["ass0"])
    assert np.array_equal(a0si, matlab_data["a0si"])
    assert custom_allclose(apn, matlab_data["apn"])
    assert np.array_equal(apni, matlab_data["apni"])
    assert custom_allclose(appl, matlab_data["appl"])
    assert np.array_equal(appli, matlab_data["appli"])
    assert custom_allclose(agst, matlab_data["agst"])
    assert np.array_equal(agsti, matlab_data["agsti"])


def test_iau06era():
    # Expected values
    era_exp = np.array(
        [
            [-0.8884015255896265, -0.4590672383540609, 0.0],
            [0.4590672383540609, -0.8884015255896265, 0.0],
            [0.0, 0.0, 1.0],
        ]
    )

    # Call function
    era = iau06era(2448855.009722)

    # Check that they are the same
    assert np.allclose(era, era_exp, rtol=DEFAULT_TOL, atol=DEFAULT_TOL)


def test_iau06gst():
    delunay_elems = [
        5.844239313494585,  # l
        6.23840254543787,  # l1
        3.0276889929096353,  # f
        3.2212027489393993,  # d
        5.089920270731961,  # omega
    ]
    planet_lon = [
        0.02422268041366862,  # mercury
        0.08339248169484563,  # venus
        0.030584726431970796,  # earth
        0.03334439906671072,  # mars
        0.1029125735528856,  # jupiter
        0.05248218685834288,  # saturn
        0.10871847648477687,  # uranus
        0.09936537545632083,  # neptune
    ]
    precrate = 4.2555121682972836e-05  # precession rate
    judt1 = 2448855.009722  # Julian date of UT1
    ttt = 0.1  # Terrestrial Time (TT) in Julian centuries of TT
    deltapsi = -5.978331920752922e-05  # change in longitude

    # Call function
    gst, st = iau06gst(judt1, ttt, deltapsi, *delunay_elems, *planet_lon, precrate)

    # Check against expected values
    st_exp = np.array(
        [
            [-0.8894007799234658, -0.4571282671980926, 0.0],
            [0.4571282671980926, -0.8894007799234658, 0.0],
            [0.0, 0.0, 1.0],
        ]
    )
    assert custom_allclose(gst, 2.6668289843344684)
    assert custom_allclose(st, st_exp)

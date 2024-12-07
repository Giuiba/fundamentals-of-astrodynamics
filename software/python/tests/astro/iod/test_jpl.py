import numpy as np
from pathlib import Path

import pytest
from src.valladopy.astro.iod.jpl import init_jplde, find_jplde_param

from ...conftest import DEFAULT_TOL


@pytest.fixture
def sunmooneph_filepath(data_dir):
    filepath = Path(data_dir) / "sunmooneph_430t.txt"
    assert filepath.exists()
    return filepath


def test_init_jplde(sunmooneph_filepath):
    # Call the function
    jpldearr, jdjpldestart, jdjpldestart_frac = init_jplde(sunmooneph_filepath)

    # Check start Julian date and fractional part
    assert np.isclose(jdjpldestart, 2435839.5)
    assert np.isclose(jdjpldestart_frac, 0.0)

    # Validate the structure of jpldearr
    expected_keys = {
        "year",
        "month",
        "day",
        "rsun1",
        "rsun2",
        "rsun3",
        "rsmag",
        "rmoon1",
        "rmoon2",
        "rmoon3",
        "mjd",
    }
    assert set(jpldearr.keys()) == expected_keys

    # Ensure data is present and that all arrays have the same length
    n_pts = len(jpldearr["year"])
    assert n_pts > 0  # ensure data is present
    for keys in expected_keys:
        assert len(jpldearr[keys]) == n_pts

    # Spot-check some values
    assert jpldearr["year"][0], jpldearr["year"][-1] == (1957, 2098)
    assert np.isclose(jpldearr["rsun1"][0], 27869796.6511, rtol=DEFAULT_TOL)
    assert np.isclose(jpldearr["mjd"][0], 35839.0, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    "interp, rsun_exp, rmoon_exp",
    [
        (
            "n",
            [98498799.3378, 105065115.0082, 45546069.1442],
            [-311173.3387, -246845.7203, -71047.7913],
        ),
        (
            "l",
            [98189413.7028805, 105311774.2471488, 45653002.59384974],
            [-301699.37820820103, -255856.13060991265, -74614.39469838185],
        ),
        (
            "s",
            [98191299.56964143, 105313814.22568269, 45653888.30512573],
            [-302576.59863313846, -256669.07629020023, -74853.18748977917],
        ),
    ],
)
def test_find_jplde_param(sunmooneph_filepath, interp, rsun_exp, rmoon_exp):
    jd, jd_frac = 2457884.5, 0.1609116400462963

    # Get the data
    jpldearr, jdjpldestart, _ = init_jplde(sunmooneph_filepath)

    # Call the function
    rsun_out, rmoon_out = find_jplde_param(jd, jd_frac, interp, jpldearr, jdjpldestart)

    # Check the outputs
    assert np.allclose(rsun_out, rsun_exp, rtol=DEFAULT_TOL)
    assert np.allclose(rmoon_out, rmoon_exp, rtol=DEFAULT_TOL)

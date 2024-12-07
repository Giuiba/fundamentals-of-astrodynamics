import numpy as np
from pathlib import Path

from src.valladopy.astro.iod.jpl import init_jplde

from ...conftest import DEFAULT_TOL


def test_init_jplde(data_dir):
    filepath = Path(data_dir) / "sunmooneph_430t.txt"
    assert filepath.exists()

    # Call the function
    jpldearr, jdjpldestart, jdjpldestart_frac = init_jplde(filepath)

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

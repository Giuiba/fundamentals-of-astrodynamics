import numpy as np

import src.valladopy.astro.gravity.utils as utils

from ...conftest import DEFAULT_TOL


def test_pathm():
    llat = np.radians(50)
    llon = np.radians(40)
    range_ = 0.0553
    az = np.radians(140)

    # Call pathm method
    tlat, tlon = utils.pathm(llat, llon, range_, az)

    # Check results
    assert np.isclose(tlat, 0.8295940837231528, rtol=DEFAULT_TOL)
    assert np.isclose(tlon, 0.7507764872963939, rtol=DEFAULT_TOL)

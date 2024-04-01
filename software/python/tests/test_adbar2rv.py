import numpy as np
from src.valladopy.adbar2rv import adbar2rv


def test_adbar2rv():
    # Input values
    rmag = 7000  # km
    vmag = 7.5  # km/s
    rtasc = np.radians(45)
    decl = np.radians(30)
    fpav = np.radians(5)
    az = np.radians(60)

    # Expected output values
    expected_r = np.array(
        [4.286607049870562e+03, 4.286607049870561e+03, 3500.0]
    )
    expected_v = np.array(
        [4.059474712855235, 4.860051329924127, 4.018776695238445]
    )

    # Call the function with test inputs
    # noinspection PyTypeChecker
    r, v = adbar2rv(rmag, vmag, rtasc, decl, fpav, az)

    # Check if the output is close to the expected values
    assert np.allclose(r, expected_r, rtol=1e-12)
    assert np.allclose(v, expected_v, rtol=1e-12)

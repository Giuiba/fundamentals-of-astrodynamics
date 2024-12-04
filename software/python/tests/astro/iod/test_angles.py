import numpy as np
import pytest

import src.valladopy.astro.iod.angles as angles

from ...conftest import DEFAULT_TOL


@pytest.mark.parametrize(
    "diffsites, reci_expected, veci_expected",
    [
        (
            True,
            [6375.656382985365, 5309.839885514231, 6530.941565891183],
            [22.32079637714886, 26.24161577925484, 28.464611900869997],
        ),
        (
            False,
            [6375.826207838072, 5310.009863069861, 6531.113998039411],
            [5.836959439606365, 14.208716188023974, 11.488650926772648],
        ),
    ],
)
def test_angles(diffsites, reci_expected, veci_expected):
    # Right Ascension (radians)
    rtasc1, rtasc2, rtasc3 = np.radians([0.939913, 45.025748, 67.886655])

    # Declination (radians)
    decl1, decl2, decl3 = np.radians([18.667717, 35.664741, 36.996583])

    # Julian dates (integer and fractional parts)
    jd1 = jd2 = jd3 = 2456159.5  # August 20, 2012
    jdf1 = 0.4864351851851852  # 11:40:28.00
    jdf2 = 0.49199074074074073  # 11:48:28.00
    jdf3 = 0.4947685185185185  # 11:52:28.00

    # Site position vectors (ECI, in km)
    rs1 = [4054.881, 2748.195, 4074.237]
    rs2 = [3956.224, 2888.232, 4074.364]
    rs3 = [3905.073, 2956.935, 4074.430]

    # Calculate position and velocity vectors
    reci, veci = angles.anglesl(
        decl1,
        decl2,
        decl3,
        rtasc1,
        rtasc2,
        rtasc3,
        jd1,
        jdf1,
        jd2,
        jdf2,
        jd3,
        jdf3,
        diffsites,
        rs1,
        rs2,
        rs3,
    )

    # Expected results
    assert np.allclose(reci, reci_expected, rtol=DEFAULT_TOL)
    assert np.allclose(veci, veci_expected, rtol=DEFAULT_TOL)

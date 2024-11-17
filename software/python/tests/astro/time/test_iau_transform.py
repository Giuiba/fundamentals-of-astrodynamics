import numpy as np
import pytest

import src.valladopy.astro.time.iau_transform as iau_transform
from ...conftest import custom_isclose, custom_allclose, DEFAULT_TOL


@pytest.fixture()
def ttt():
    # Terrestrial Time (TT) in Julian centuries of TT
    return 0.1


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
    era = iau_transform.iau06era(2448855.009722)

    # Check that they are the same
    assert np.allclose(era, era_exp, rtol=DEFAULT_TOL, atol=DEFAULT_TOL)


def test_iau06gst(ttt):
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
    deltapsi = -5.978331920752922e-05  # change in longitude

    # Call function
    gst, st = iau_transform.iau06gst(
        judt1, ttt, deltapsi, *delunay_elems, *planet_lon, precrate
    )

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


def test_iau06pna(ttt):
    (
        deltapsi,
        pnb,
        prec,
        nut,
        l,
        l1,
        f,
        d,
        omega,
        lonmer,
        lonven,
        lonear,
        lonmar,
        lonjup,
        lonsat,
        lonurn,
        lonnep,
        precrate,
    ) = iau_transform.iau06pna(ttt)

    # Check against expected values
    pnb_exp = np.array(
        [
            [0.9999968301767307, 0.0023093302141092642, 0.0010033097493433538],
            [-0.0023093439022892153, 0.9999973333838805, 1.2484743714435523e-05],
            [-0.0010032782425055283, -1.4801691391685055e-05, 0.9999994966067123],
        ]
    )
    prec_exp = np.array(
        [
            [0.9999970278755955, 0.0022361037218361396, 0.0009716378547293649],
            [-0.0022361037097214137, 0.9999974999163708, -1.0988114751975253e-06],
            [-0.0009716378826099, -1.073874801980047e-06, 0.9999995279592244],
        ]
    )
    nut_exp = np.array(
        [
            [0.9999999968199907, 7.31692338336742e-05, 3.172194366990678e-05],
            [-7.316966806263472e-05, 0.9999999972294239, 1.368765438014563e-05],
            [-3.172094206683474e-05, -1.3689975420727585e-05, 0.9999999994031832],
        ]
    )
    assert custom_isclose(deltapsi, 7.97497241593155e-05)
    assert custom_allclose(pnb, pnb_exp, rtol=1e-9)
    assert custom_allclose(prec, prec_exp, rtol=1e-9)
    assert custom_allclose(nut, nut_exp, rtol=1e-9)
    assert custom_isclose(l, 5.844239313494585)
    assert custom_isclose(l1, 6.23840254543787)
    assert custom_isclose(f, 3.0276889929096353)
    assert custom_isclose(d, 3.2212027489393993)
    assert custom_isclose(omega, 5.089920270731961)
    assert custom_isclose(lonmer, 0.02422268041366862)
    assert custom_isclose(lonven, 0.08339248169484563)
    assert custom_isclose(lonear, 0.030584726431970796)
    assert custom_isclose(lonmar, 0.03334439906671072)
    assert custom_isclose(lonjup, 0.1029125735528856)
    assert custom_isclose(lonsat, 0.05248218685834288)
    assert custom_isclose(lonurn, 0.10871847648477687)
    assert custom_isclose(lonnep, 0.09936537545632083)
    assert custom_isclose(precrate, 4.2555121682972836e-05)

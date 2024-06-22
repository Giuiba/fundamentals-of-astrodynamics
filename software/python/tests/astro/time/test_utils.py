import numpy as np
import pytest

from src.valladopy.astro.time.utils import fundarg, precess, nutation, polarm
from ...conftest import custom_isclose, custom_allclose

DEFAULT_TOL = 1e-12


@pytest.mark.parametrize(
    'ttt, opt, results',
    [
        (0.1, '06',
         [5.844239313494585, 6.23840254543787, 3.0276889929096353,
          3.2212027489393993, 5.089920270731961, 0.02422268041366862,
          0.08339248169484563, 0.030584726431970796, 0.03334439906671072,
          0.1029125735528856, 0.05248218685834288, 0.10871847648477687,
          0.09936537545632083, 4.2555121682972836e-05]),
        (1.3, '96',
         [3.7263866519539266, 6.218507382213416, 0.9754435804880215,
          4.626729788935919, 2.2806396540189735, 0.0, 5.151167862645337,
          1.739240779528124, 0.6601251108969298, 0.34433358093148264,
          3.4701579303306653, 0.0, 0.0, 0.03170537748539087]),
        (-0.15, '02',
         [3.4057180143687678, 6.242546458897546, 5.8114135943580365,
          1.8811765778266971, 0.9628107824807162, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
          0.0, 0.0, 0.0]),
        (-1.1, '80',
         [1.679344348277534, 6.258264795030512, 5.0797486481605745,
          1.8155859432858112, 1.6161209896111113, 6.162757588791571,
          4.368908183592073, 1.7289231570255421, 3.1236157622942082,
          5.129697204536531, 2.5078636021906533, 0.0, 0.0, 0.0])
    ]
)
def test_fundarg(ttt, opt, results):
    """
    Results are a tuple with the following output:
        (l, l1, f, d, omega, lonmer, lonven, lonear, lonmar, lonjup, lonsat,
        lonurn, lonnep, precrate)

    Some values are a different representation of the MATLAB outputs due to
    `np.mod` always returning a positive angle (unlike the `rem` function) but
    they are still equivalent
    """
    results_out = fundarg(ttt, opt)
    assert custom_allclose(results, results_out, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    'ttt, opt, prec, psia, wa, ea, xa',
    [
        (
            0.1, '80',
            np.array([
                [0.99999702751987, 0.00223623766396228, 9.716956978347777e-04],
                [-0.0022362376639804, 0.99999749961684, -1.08645419889999e-06],
                [-9.7169569779302e-04, -1.0864915479894e-06, 0.999999527903034]
            ]),
            0.0024428166982077833, 0.409092806670512, 0.40907010765003343,
            5.0006227129429165e-06
        ),
        (
            3.4, '50',
            np.array([
                [0.99656203288, 0.07597927776, 0.03297579896],
                [-0.07597927776, 0.9971069944000001, -0.0012551847999999997],
                [-0.03297579896, -0.0012551847999999997, 0.9994542524]
            ]),
            0.03801516768171585, 0.03300637882588775, 0.03805971221205611,
            2.9466975537837596e-07
        ),
        (
            -0.2, '06',
            np.array([
                [0.999988113087504, -0.0044717893242489, -0.00194339495019456],
                [0.00447178937247984, 0.999990001490586, -4.320434382393e-06],
                [0.0019433948392142, -4.370069859043412e-06, 0.999998111596918]
            ]),
            -0.004885658734881702, 0.4090926358130436, 0.409138014700149,
            -1.0697548647819031e-05
        )
    ]
)
def test_precess(ttt, opt, prec, psia, wa, ea, xa):
    prec_out, psia_out, wa_out, ea_out, xa_out = precess(ttt, opt)
    assert np.allclose(prec, prec_out, rtol=DEFAULT_TOL)
    assert custom_isclose(psia, psia_out)
    assert custom_isclose(wa, wa_out)
    assert custom_isclose(ea, ea_out)
    assert custom_isclose(xa, xa_out)


def test_precess_bad():
    # Test invalid option
    with pytest.raises(ValueError):
        _ = precess(0.5, '25')


def test_nutation():
    # Inputs
    ttt = 0.2
    ddpsi = np.radians(3.5)
    ddeps = np.radians(5.7)

    # Expected nutation transformation matrix
    nut_exp = np.array(
        [
            [0.9981396814091349, 0.05325395821546375, 0.02968488387810016],
            [-0.05593874439282744, 0.9935655167907828, 0.09848056011223039],
            [-0.024249397357966784, -0.09995789002700262, 0.9946961279451756]
        ]
    )

    # Call the function with test inputs
    deltapsi, trueeps, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)

    # Check if the outputs are close to the expected values
    assert custom_isclose(deltapsi, 0.06100648612598722, rtol=DEFAULT_TOL)
    assert custom_isclose(trueeps, 0.5085229888820868, rtol=DEFAULT_TOL)
    assert custom_isclose(meaneps, 0.409047411073268, rtol=DEFAULT_TOL)
    assert custom_isclose(omega, 1.7142161907757703, rtol=DEFAULT_TOL)
    assert custom_allclose(nut, nut_exp, rtol=DEFAULT_TOL)


@pytest.mark.parametrize(
    'xp, yp, ttt, use_iau80, pm_expected',
    [
        (0.1, 0.2, 0.042623631889, True,
         np.array([
             [0.9950041652780257, 0.0, -0.09983341664682815],
             [0.019833838076209875, 0.9800665778412416, 0.19767681165408385],
             [0.09784339500725571, -0.19866933079506122, 0.9751703272018158]
         ])),
        (0.1, 0.2, 0.042623631889, False,
         np.array([
             [0.9950041652780257, 0.0198338380857286, -0.09784339500532617],
             [-9.663803175648039e-12, 0.980066577841049, 0.1986693307960115],
             [0.09983341664682815, -0.19767681165408385, 0.9751703272018158]
         ])),
        (0.0, 0.0, 0.042623631889, True, np.identity(3)),
        (0.0, 0.0, 0.042623631889, False,
         np.array([
             [1.0, 9.71232434283103e-12, 0.0],
             [-9.71232434283103e-12, 1.0, 0.0],
             [0.0, 0.0, 1.0]
         ]))
    ]
)
def test_polarm(xp, yp, ttt, use_iau80, pm_expected):
    pm = polarm(xp, yp, ttt, use_iau80)
    assert custom_allclose(pm, pm_expected, rtol=DEFAULT_TOL)

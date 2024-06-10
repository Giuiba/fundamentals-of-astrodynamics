import numpy as np
import pytest

from src.valladopy.astro.time.utils import precess


DEFAULT_TOL = 1e-12


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
    assert abs(psia - psia_out) < DEFAULT_TOL
    assert abs(wa - wa_out) < DEFAULT_TOL
    assert abs(ea - ea_out) < DEFAULT_TOL
    assert abs(xa - xa_out) < DEFAULT_TOL


def test_precess_bad():
    # Test invalid option
    with pytest.raises(ValueError):
        _ = precess(0.5, '25')

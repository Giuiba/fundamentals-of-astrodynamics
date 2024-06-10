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

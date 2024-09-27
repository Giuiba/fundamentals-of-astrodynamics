import numpy as np
import pytest

import src.valladopy.astro.twobody.lambert as lambert
from ...conftest import custom_allclose


def test_seebatt():
    # Check nominal case
    v = 0.123
    assert np.isclose(lambert.seebatt(v), 5.153421950753984)

    # Check when `v` is less than -1
    v = -1.5
    with pytest.raises(ValueError):
        lambert.seebatt(v)


def test_lambhodograph():
    r1 = [6888, 0, 0]
    v1 = [0, 7.6072, 0]
    r2 = [8000 * np.sin(np.pi/4), 8000 * np.cos(np.pi/4), 0]
    p = 7000
    ecc = 1e-3
    dnu = np.radians(2.1)
    dtsec = 1234

    # Check nominal case
    v1t, v2t = lambert.lambhodograph(r1, v1, r2, p, ecc, dnu, dtsec)
    assert custom_allclose(v1t, [0, 7.668753340719345, 0])
    assert custom_allclose(v2t, [-4.665702986379401, 4.672061552209318, 0])

    # Check when r1 and v1 are parallel and dnu is zero
    new_v1 = [7.6072, 0, 0]
    new_dnu = 0
    with pytest.raises(ValueError):
        lambert.lambhodograph(r1, new_v1, r2, p, ecc, new_dnu, dtsec)

    # Check when r1 and r2 are parallel
    new_r2 = [8000, 0, 0]
    with pytest.raises(ValueError):
        lambert.lambhodograph(r1, v1, new_r2, p, ecc, dnu, dtsec)

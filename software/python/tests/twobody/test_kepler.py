import numpy as np

from src.valladopy.twobody.kepler import newtonnu


def test_newtonnu():
    ecc = 0.1
    nu = np.radians(45)
    e0, m = newtonnu(ecc, nu)
    assert abs(np.degrees(e0) - 41.078960346507934) < 1e-12
    assert abs(np.degrees(m)) - 37.31406335764441 < 1e-12

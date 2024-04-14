import numpy as np
import pytest

import src.valladopy.mathtime.vector as vec


@pytest.mark.parametrize('func, angle, vector, expected', [
    (vec.rot1, np.pi/2, [1, 0, 0], [1, 0, 0]),
    (vec.rot2, np.pi/2, [1, 0, 0], [0, 0, 1]),
    (vec.rot3, np.pi/2, [1, 0, 0], [0, -1, 0]),
    (vec.rot1, np.pi, [0, 1, 0], [0, -1, 0]),
    (vec.rot2, np.pi, [0, 0, 1], [0, 0, -1]),
    (vec.rot3, np.pi, [0, 1, 0], [0, -1, 0]),
])
def test_rotations(func, angle, vector, expected):
    assert np.allclose(func(vector, angle), expected, rtol=1e-12)

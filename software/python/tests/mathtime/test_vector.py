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


@pytest.mark.parametrize('v1, v2, expected_angle', [
    (np.array([1, 0, 0]), np.array([1, 0, 0]), 0),
    (np.array([1, 0, 0]), np.array([-1, 0, 0]), np.pi),
    (np.array([1, 0, 0]), np.array([0, 1, 0]), np.pi / 2),
    (np.array([1, 0, 0]), np.array([1, 1, 0]), np.arccos(1 / np.sqrt(2))),
    (np.array([0, 0, 0]), np.array([1, 0, 0]), np.nan),
    (np.array([1, 0, 0]), np.array([0, 0, 0]), np.nan),
    (np.array([1e-10, 0, 0]), np.array([1e-10, 0, 0]), np.nan),
])
def test_angle_between_vectors(v1, v2, expected_angle):
    angle = vec.angle(v1, v2)
    assert (
        np.isnan(angle) if np.isnan(expected_angle)
        else abs(angle - expected_angle) < 1e-12
    )

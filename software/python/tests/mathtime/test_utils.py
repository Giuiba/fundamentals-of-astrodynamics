import numpy as np
import pytest

import src.valladopy.mathtime.utils as utils


@pytest.mark.parametrize(
    "value, context, expected_output, raises_error",
    [
        (4, "Test positive sqrt", 2, False),  # Normal case
        (0, "Edge case for zero", 0, False),  # Edge case
        (-1, "Negative value test", None, True),  # Negative value
    ],
)
def test_safe_sqrt(value, context, expected_output, raises_error):
    if raises_error:
        with pytest.raises(ValueError):
            utils.safe_sqrt(value, context)
    else:
        result = utils.safe_sqrt(value, context)
        assert np.isclose(result, expected_output)


@pytest.mark.parametrize(
    "hours, minutes, seconds, expected_output",
    [
        (1, 1, 1, 3661),  # Normal case
        (0, 0, 0, 0),  # Edge case
        (-1, -1, -1, -3661),  # Negative case
    ],
)
def test_hms2sec(hours, minutes, seconds, expected_output):
    result = utils.hms2sec(hours, minutes, seconds)
    assert result == expected_output


@pytest.mark.parametrize(
    "hours, minutes, seconds, expected_output",
    [
        (1, 1, 1, 0.26623543298130165),  # Normal case
        (0, 0, 0, 0),  # Edge case
        (-1, -1, -1, -0.26623543298130165),  # Negative case
    ],
)
def test_hms2rad(hours, minutes, seconds, expected_output):
    result = utils.hms2rad(hours, minutes, seconds)
    assert np.isclose(result, expected_output)


@pytest.mark.parametrize(
    "degrees, minutes, seconds, expected_output",
    [
        (1, 1, 1, 0.01774902886542011),  # Normal case
        (0, 0, 0, 0),  # Edge case
        (-1, -1, -1, -0.01774902886542011),  # Negative case
    ],
)
def test_dms2rad(degrees, minutes, seconds, expected_output):
    result = utils.dms2rad(degrees, minutes, seconds)
    assert np.isclose(result, expected_output)


def test_jd2sse():
    assert np.isclose(utils.jd2sse(2460647.567), 786504988.7999833)

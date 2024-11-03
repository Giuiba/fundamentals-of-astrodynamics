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

import numpy as np
import pytest

import src.valladopy.astro.maneuver.transfer as transfer
import src.valladopy.constants as const

from ...conftest import custom_isclose


@pytest.mark.parametrize(
    "einit, efinal, deltava_expected, deltavb_expected",
    [
        # Vallado 2007, Example 6-1
        (0.0, 0.0, 0.3108064306010284, 0.18698526891884426),
        # Test non-zero eccentricities
        (0.00123, 0.024, 0.3102006391807183, 0.1822894641495918),
    ],
)
def test_hohmann(einit, efinal, deltava_expected, deltavb_expected):
    rinit = (const.RE + 191.3411) / const.RE
    rfinal = (const.RE + 35781.34857) / const.RE
    nuinit, nufinal = 0.0, np.pi
    deltava, deltavb, dttu = transfer.hohmann(
        rinit, rfinal, einit, efinal, nuinit, nufinal
    )

    # Expected values
    assert custom_isclose(deltava, deltava_expected)
    assert custom_isclose(deltavb, deltavb_expected)
    assert custom_isclose(dttu, 23.455512658504887)

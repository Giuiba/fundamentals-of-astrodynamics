import numpy as np
import pytest

import src.valladopy.astro.maneuver.transfer as transfer
import src.valladopy.constants as const

from ...conftest import custom_isclose


@pytest.mark.parametrize(
    "einit, efinal, deltava_expected, deltavb_expected",
    [
        # Vallado 2007, Example 6-1
        (0.0, 0.0, 2.457038635627854, 1.478187015430896),
        # Test non-zero eccentricities
        (0.00123, 0.024, 2.4522496326398677, 1.4410649593617622),
    ],
)
def test_hohmann(einit, efinal, deltava_expected, deltavb_expected):
    # Input values
    rinit = const.RE + 191.3411
    rfinal = const.RE + 35781.34857
    nuinit, nufinal = 0.0, np.pi

    # Calculate Hohmann transfer
    deltava, deltavb, dttu = transfer.hohmann(
        rinit, rfinal, einit, efinal, nuinit, nufinal
    )

    # Expected results
    assert custom_isclose(deltava, deltava_expected)
    assert custom_isclose(deltavb, deltavb_expected)
    assert custom_isclose(dttu / const.MIN2SEC, 315.4027569935991)


@pytest.mark.parametrize(
    "einit, efinal, deltava_expected, deltavb_expected, deltavc_expected",
    [
        # Vallado 2007, Example 6-2
        (0.0, 0.0, 3.1562341430432026, 0.6773580299907941, 0.07046593708633986),
        # Test non-zero eccentricities
        (0.00123, 0.024, 3.151445140055216, 0.6773580299907941, 0.08278725521142083),
    ],
)
def test_bielliptic(
    einit, efinal, deltava_expected, deltavb_expected, deltavc_expected
):
    # Input values
    rinit = const.RE + 191.3411
    rb = const.RE + 503873.0
    rfinal = const.RE + 376310.0
    nuinit, nufinal = 0.0, np.pi

    # Calculate bielliptic transfer
    deltava, deltavb, deltavc, dttu = transfer.bielliptic(
        rinit, rb, rfinal, einit, efinal, nuinit, nufinal
    )

    # Expected results
    assert custom_isclose(deltava, deltava_expected)
    assert custom_isclose(deltavb, deltavb_expected)
    assert custom_isclose(deltavc, deltavc_expected)
    assert custom_isclose(dttu / const.HR2SEC, 593.9199987732167)

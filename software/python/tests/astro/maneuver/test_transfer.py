import numpy as np
import pytest

import src.valladopy.astro.maneuver.transfer as transfer
import src.valladopy.constants as const

from ...conftest import custom_isclose


@pytest.fixture
def rinit_rfinal():
    rinit = const.RE + 191.3411
    rfinal = const.RE + 35781.34857
    return rinit, rfinal


@pytest.fixture
def nuinit_nufinal():
    return 0.0, np.pi


@pytest.mark.parametrize(
    "einit, efinal, deltava_expected, deltavb_expected",
    [
        # Vallado 2007, Example 6-1
        (0.0, 0.0, 2.457038635627854, 1.478187015430896),
        # Test non-zero eccentricities
        (0.00123, 0.024, 2.4522496326398677, 1.4410649593617622),
    ],
)
def test_hohmann(
    rinit_rfinal, nuinit_nufinal, einit, efinal, deltava_expected, deltavb_expected
):
    # Calculate Hohmann transfer
    deltava, deltavb, dttu = transfer.hohmann(
        *rinit_rfinal, einit, efinal, *nuinit_nufinal
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
    rinit_rfinal,
    nuinit_nufinal,
    einit,
    efinal,
    deltava_expected,
    deltavb_expected,
    deltavc_expected,
):
    # Input values
    rinit, _ = rinit_rfinal
    rb = const.RE + 503873.0
    rfinal = const.RE + 376310.0

    # Calculate bielliptic transfer
    deltava, deltavb, deltavc, dttu = transfer.bielliptic(
        rinit, rb, rfinal, einit, efinal, *nuinit_nufinal
    )

    # Expected results
    assert custom_isclose(deltava, deltava_expected)
    assert custom_isclose(deltavb, deltavb_expected)
    assert custom_isclose(deltavc, deltavc_expected)
    assert custom_isclose(dttu / const.HR2SEC, 593.9199987732167)


@pytest.mark.parametrize(
    "efinal, deltavb_expected",
    [
        # Vallado 2007, Example 6-3
        (0.0, 2.1239372795577847),
        # Test non-zero eccentricity
        (0.024, 2.0814417965636647),
    ],
)
def test_onetangent(rinit_rfinal, nuinit_nufinal, efinal, deltavb_expected):
    # Input values
    nuinit, _ = nuinit_nufinal
    nutran = np.radians(160)

    # Calculate one-tangent transfer
    deltava, deltavb, dttu, etran, atran, vtrana, vtranb = transfer.onetangent(
        *rinit_rfinal, efinal, nuinit, nutran
    )

    # Expected results
    assert custom_isclose(deltava, 2.575396079597792)
    assert custom_isclose(deltavb, deltavb_expected)
    assert custom_isclose(dttu / const.MIN2SEC, 207.44540183723626)
    assert custom_isclose(etran, 0.7705727464030682)
    assert custom_isclose(atran, 28634.25027761329)
    assert custom_isclose(vtrana, 10.364786573669267)
    assert custom_isclose(vtranb, 2.2335537984044187)


def test_onetangent_bad_transfer(rinit_rfinal, nuinit_nufinal):
    # Input values
    efinal = 0.0
    nuinit, _ = nuinit_nufinal
    nutran = np.radians(0)

    # Calculate one-tangent transfer
    with pytest.raises(ValueError):
        transfer.onetangent(*rinit_rfinal, efinal, nuinit, nutran)

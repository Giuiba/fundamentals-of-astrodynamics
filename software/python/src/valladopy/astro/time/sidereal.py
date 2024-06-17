import numpy as np

from ...constants import CENT2DAY, TWOPI, J2000, EARTHROT


def gstime(jdut1):
    """Calculates the Greenwich Sidereal Time (IAU-82).

    References:
        Vallado: 2022, p. 189, Eq. 3-48

    Args:
        jdut1 (float): Julian date of UT1 (days from 4713 BC)

    Returns:
        float: Greenwich Sidereal Time (0 to 2pi radians)
    """
    # Julian centuries from the J2000.0 epoch
    tut1 = (jdut1 - J2000) / CENT2DAY

    # Calculate Greenwich Sidereal Time in seconds
    gst = (
        -6.2e-6 * tut1**3 + 0.093104 * tut1**2
        + (876600.0 * 3600 + 8640184.812866) * tut1 + 67310.54841
    )

    # Convert to radians
    return np.remainder(gst * EARTHROT, TWOPI)

import numpy as np
import os

from ...constants import ARCSEC2RAD, J2000, TWOPI


def iau80in():
    """Initializes the nutation matrices needed for reduction calculations

    Returns:
        tuple: A tuple containing:
            - iar80 (np.ndarray): Integers for FK5 1980
            - rar80 (np.ndarray): Reals for FK5 1980 (in radians)
    """
    # Define the path to the nut80.dat file
    current_dir = os.path.dirname(os.path.abspath(__file__))
    file_path = os.path.join(current_dir, "data", "nut80.dat")

    # Load the nutation data
    nut80 = np.loadtxt(file_path)

    # Split into integer and real parts
    iar80 = nut80[:, :5].astype(int)
    rar80 = nut80[:, 5:9]

    # Convert from 0.0001 arcseconds to radians
    convrt = 0.0001 * ARCSEC2RAD
    rar80 *= convrt

    return iar80, rar80


def iau06era(jdut1: float) -> np.ndarray:
    """Calculates the transformation matrix that accounts for sidereal time via the
    Earth Rotation Angle (ERA).

    References:
        Vallado, 2004, p. 212.

    Args:
        jdut1 (float): Julian date of UT1 (days)

    Returns:
        np.ndarray: 3x3 transformation matrix for PEF to IRE
    """
    # Julian centuries of UT1 (in days from J2000 epoch)
    tut1d = jdut1 - J2000

    # Earth rotation angle (ERA) in radians
    era = TWOPI * (0.7790572732640 + 1.00273781191135448 * tut1d)
    era = np.mod(era, TWOPI)

    # Transformation matrix from PEF to IRE
    return np.array(
        [
            [np.cos(era), -np.sin(era), 0.0],
            [np.sin(era), np.cos(era), 0.0],
            [0.0, 0.0, 1.0],
        ]
    )

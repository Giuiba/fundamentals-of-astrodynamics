import numpy as np
import os
from typing import Tuple

from ...constants import ARCSEC2RAD, J2000, TWOPI


DATA_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "data")


def iau80in() -> Tuple[np.ndarray, np.ndarray]:
    """Initializes the nutation matrices needed for reduction calculations.

    Returns:
        tuple: (iar80, rar80)
            iar80 (np.ndarray): Integers for FK5 1980
            rar80 (np.ndarray): Reals for FK5 1980 in radians
    """
    # Define the path to the nut80.dat file
    file_path = os.path.join(DATA_DIR, "nut80.dat")

    # Load the nutation data
    nut80 = np.loadtxt(file_path)

    # Split into integer and real parts
    iar80 = nut80[:, :5].astype(int)
    rar80 = nut80[:, 5:9]

    # Convert from 0.0001 arcseconds to radians
    convrt = 1e-4 * ARCSEC2RAD
    rar80 *= convrt

    return iar80, rar80


def iau06in() -> (
    Tuple[
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
        np.ndarray,
    ]
):
    """Initializes the matrices needed for IAU 2006 reduction calculations.

    References:
        Vallado, 2004, p. 205-219, 910-912

    Returns:
        tuple: (axs0, a0xi, ays0, a0yi, ass0, a0si, apn, apni, appl, appli, agst, agsti)
            axs0 (np.ndarray): Real coefficients for X in radians
            a0xi (np.ndarray): Integer coefficients for X
            ays0 (np.ndarray): Real coefficients for Y in radians
            a0yi (np.ndarray): Integer coefficients for Y
            ass0 (np.ndarray): Real coefficients for S in radians
            a0si (np.ndarray): Integer coefficients for S
            apn (np.ndarray): Real coefficients for nutation in radians
            apni (np.ndarray): Integer coefficients for nutation
            appl (np.ndarray): Real coefficients for planetary nutation in radians
            appli (np.ndarray): Integer coefficients for planetary nutation
            agst (np.ndarray): Real coefficients for GST in radians
            agsti (np.ndarray): Integer coefficients for GST

    Notes:
        Data files are from the IAU 2006 precession-nutation model:
            - iau06xtab5.2.a.dat (file for X coefficients)
            - iau06ytab5.2.b.dat (file for Y coefficients)
            - iau06stab5.2.d.dat (file for S coefficients)
            - iau03n.dat (file for nutation coefficients)
            - iau03pl.dat (file for planetary nutation coefficients)
            - iau06gsttab5.2.e.dat (file for GST coefficients)
    """
    # Conversion factors
    convrtu = 1e-6 * ARCSEC2RAD  # microarcseconds to radians
    convrtm = 1e-3 * ARCSEC2RAD  # milliarcseconds to radians

    def load_data(
        filename, columns_real, columns_int, conv_factor, convert_exclude_last=False
    ):
        """Helper function to load and process data."""
        filepath = os.path.join(DATA_DIR, filename)
        data = np.loadtxt(filepath)
        reals = data[:, columns_real]
        if convert_exclude_last:
            reals[:, :-1] *= conv_factor  # convert all except the last column
        else:
            reals *= conv_factor  # convert all
        integers = data[:, columns_int].astype(int)
        return reals, integers

    # Load data
    axs0, a0xi = load_data(
        "iau06xtab5.2.a.dat",
        columns_real=[1, 2],
        columns_int=range(3, 17),
        conv_factor=convrtu,
    )
    ays0, a0yi = load_data(
        "iau06ytab5.2.b.dat",
        columns_real=[1, 2],
        columns_int=range(3, 17),
        conv_factor=convrtu,
    )
    ass0, a0si = load_data(
        "iau06stab5.2.d.dat",
        columns_real=[1, 2],
        columns_int=range(3, 17),
        conv_factor=convrtu,
    )
    apn, apni = load_data(
        "iau03n.dat",
        columns_real=range(6, 14),
        columns_int=range(0, 5),
        conv_factor=convrtm,
    )
    appl, appli = load_data(
        "iau03pl.dat",
        columns_real=range(16, 21),  # include column 21 (extra)
        columns_int=range(1, 15),
        conv_factor=convrtm,
        convert_exclude_last=True,
    )
    agst, agsti = load_data(
        "iau06gsttab5.2.e.dat",
        columns_real=[1, 2],
        columns_int=range(3, 17),
        conv_factor=convrtu,
    )

    return axs0, a0xi, ays0, a0yi, ass0, a0si, apn, apni, appl, appli, agst, agsti


def iau06era(jdut1: float) -> np.ndarray:
    """Calculates the transformation matrix that accounts for sidereal time via the
    Earth Rotation Angle (ERA).

    References:
        Vallado, 2004, p. 212

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

import numpy as np
from typing import Tuple

from .data import iau06in
from .utils import fundarg, precess
from ...constants import ARCSEC2RAD, DEG2ARCSEC, J2000, TWOPI
from ...mathtime.vector import rot1mat, rot2mat, rot3mat


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


def iau06gst(
    jdut1: float,
    ttt: float,
    deltapsi: float,
    l: float,
    l1: float,
    f: float,
    d: float,
    omega: float,
    lonmer: float,
    lonven: float,
    lonear: float,
    lonmar: float,
    lonjup: float,
    lonsat: float,
    lonurn: float,
    lonnep: float,
    precrate: float,
) -> tuple[float, np.ndarray]:
    """Calculates the IAU 2006 Greenwich Sidereal Time (GST) and transformation matrix.

    References:
        Vallado, 2004, p. 216

    Args:
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        ttt (float): Julian centuries of TT
        deltapsi (float): Change in longitude in radians
        l (float): Delaunay element in radians
        l1 (float): Delaunay element in radians
        f (float): Delaunay element in radians
        d (float): Delaunay element in radians
        omega (float): Delaunay element in radians
        lonmer (float): Longitude of Mercury in radians
        lonven (float): Longitude of Venus in radians
        lonear (float): Longitude of Earth in radians
        lonmar (float): Longitude of Mars in radians
        lonjup (float): Longitude of Jupiter in radians
        lonsat (float): Longitude of Saturn in radians
        lonurn (float): Longitude of Uranus in radians
        lonnep (float): Longitude of Neptune in radians
        precrate (float): Precession rate in radians per Julian century

    Returns:
        tuple[float, np.ndarray]: (gst, st)
            gst (float): Greenwich Sidereal Time in radians (0 to 2pi)
            st (np.ndarray): 3x3 transformation matrix
    """
    # Mean obliquity of the ecliptic
    ttt2 = ttt * ttt
    ttt3 = ttt2 * ttt
    ttt4 = ttt2 * ttt2
    ttt5 = ttt3 * ttt2
    epsa = (
        84381.406
        - 46.836769 * ttt
        - 0.0001831 * ttt2
        + 0.00200340 * ttt3
        - 0.000000576 * ttt4
        - 0.0000000434 * ttt5
    )  # arcseconds
    epsa = np.mod(np.radians(epsa / DEG2ARCSEC), TWOPI)

    # Load the IAU 2006 data (GST coefficients)
    _, _, _, _, _, _, _, _, _, _, agst, agsti = iau06in()

    # Evaluate the EE complementary terms
    gstsum0, gstsum1 = 0.0, 0.0
    n_elem = len(agsti) - 1
    for i in range(n_elem):
        tempval = (
            agsti[i, 0] * l
            + agsti[i, 1] * l1
            + agsti[i, 2] * f
            + agsti[i, 3] * d
            + agsti[i, 4] * omega
            + agsti[i, 5] * lonmer
            + agsti[i, 6] * lonven
            + agsti[i, 7] * lonear
            + agsti[i, 8] * lonmar
            + agsti[i, 9] * lonjup
            + agsti[i, 10] * lonsat
            + agsti[i, 11] * lonurn
            + agsti[i, 12] * lonnep
            + agsti[i, 13] * precrate
        )
        gstsum0 += agst[i, 0] * np.sin(tempval) + agst[i, 1] * np.cos(tempval)

    # MATLAB's j = 1 translates to Python index 33 (last valid index)
    tempval = (
        agsti[n_elem, 0] * l
        + agsti[n_elem, 1] * l1
        + agsti[n_elem, 2] * f
        + agsti[n_elem, 3] * d
        + agsti[n_elem, 4] * omega
        + agsti[n_elem, 5] * lonmer
        + agsti[n_elem, 6] * lonven
        + agsti[n_elem, 7] * lonear
        + agsti[n_elem, 8] * lonmar
        + agsti[n_elem, 9] * lonjup
        + agsti[n_elem, 10] * lonsat
        + agsti[n_elem, 11] * lonurn
        + agsti[n_elem, 12] * lonnep
        + agsti[n_elem, 13] * precrate
    )
    gstsum1 += agst[n_elem, 0] * ttt * np.sin(tempval) + agst[n_elem, 1] * ttt * np.cos(
        tempval
    )
    eect2000 = gstsum0 + gstsum1 * ttt

    # Equation of the equinoxes
    ee2000 = deltapsi * np.cos(epsa) + eect2000

    # Earth rotation angle (ERA)
    tut1d = jdut1 - J2000  # days from the Jan 1, 2000 12h epoch (ut1)
    era = TWOPI * (0.7790572732640 + 1.00273781191135448 * tut1d)
    era = np.mod(era, TWOPI)

    # Greenwich Mean Sidereal Time (GMST), IAU 2000
    gmst2000 = era + (
        (
            0.014506
            + 4612.156534 * ttt
            + 1.3915817 * ttt2
            - 0.00000044 * ttt3
            + 0.000029956 * ttt4
            + 0.0000000368 * ttt5
        )
        * ARCSEC2RAD
    )

    # Greenwich Sidereal Time (GST)
    gst = gmst2000 + ee2000

    # Transformation matrix
    st = np.array(
        [
            [np.cos(gst), -np.sin(gst), 0.0],
            [np.sin(gst), np.cos(gst), 0.0],
            [0.0, 0.0, 1.0],
        ]
    )

    return gst, st


###############################################################################
# IAU 2006 Precession-Nutation Theories (IAU2006/2000A and IAU2006/2000B)
###############################################################################


def _build_transformation_matrices(
    ttt: float, deltaeps: float, deltapsi: float, use_extended_prec: bool
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Constructs nutation, precession, and combined precession-nutation matrices.

    Args:
        ttt (float): Julian centuries of TT
        deltaeps (float): Nutation in obliquity in radians
        deltapsi (float): Nutation in longitude in radians
        use_extended_prec (bool): Whether to include extended precession terms.

    Returns:
        tuple:
            nut (np.ndarray): Nutation matrix (mean to true transformation)
            prec (np.ndarray): Precession matrix (J2000 to date transformation)
            pnb (np.ndarray): Combined precession-nutation matrix (ICRS to GCRF)
    """
    # Get precession angles
    _, psia, wa, ea, xa = precess(ttt, opt="06")

    # Obliquity of the ecliptic
    oblo = 84381.406 * ARCSEC2RAD

    # Nutation matrix
    a1 = rot1mat(ea + deltaeps)
    a2 = rot3mat(deltapsi)
    a3 = rot1mat(-ea)
    nut = a3 @ a2 @ a1

    # Precession matrix
    a4 = rot3mat(-xa)
    a5 = rot1mat(wa)
    a6 = rot3mat(psia)
    a7 = rot1mat(-oblo)

    # ICRS to J2000
    a8 = rot1mat(-0.0068192 * ARCSEC2RAD)
    a9 = rot2mat(0.0417750 * np.sin(oblo) * ARCSEC2RAD)
    a10 = rot3mat(0.0146 * ARCSEC2RAD)

    # Precession and combined matrices
    if use_extended_prec:
        prec = a10 @ a9 @ a8 @ a7 @ a6 @ a5 @ a4
        pnb = prec @ nut
    else:
        prec = a7 @ a6 @ a5 @ a4
        pnb = a10 @ a9 @ a8 @ prec @ nut

    return nut, prec, pnb


def iau06pna(
    ttt: float,
) -> Tuple[
    float,
    np.ndarray,
    np.ndarray,
    np.ndarray,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
]:
    """Calculates the transformation matrix that accounts for the effects of
    precession-nutation using the IAU2006 precession theory and the IAU2000A nutation
    model.

    References:
        Vallado, 2004, p. 212-214

    Args:
        ttt (float): Julian centuries of TT

    Returns:
        tuple:
            deltapsi (float): Change in longitude in radians
            pnb (np.ndarray): Combined precession-nutation matrix
            prec (np.ndarray): Precession transformation matrix (MOD to J2000)
            nut (np.ndarray): Nutation transformation matrix (IRE to GCRF)
            l (float): Delaunay element in radians
            l1 (float): Delaunay element in radians
            f (float): Delaunay element in radians
            d (float): Delaunay element in radians
            omega (float): Delaunay element in radians
            lonmer (float): Longitude of Mercury in radians
            lonven (float): Longitude of Venus in radians
            lonear (float): Longitude of Earth in radians
            lonmar (float): Longitude of Mars in radians
            lonjup (float): Longitude of Jupiter in radians
            lonsat (float): Longitude of Saturn in radians
            lonurn (float): Longitude of Uranus in radians
            lonnep (float): Longitude of Neptune in radians
            precrate (float): Precession rate in radians per Julian century
    """
    # Obtain data for calculations from the 2000a theory
    (
        l,
        l1,
        f,
        d,
        omega,
        lonmer,
        lonven,
        lonear,
        lonmar,
        lonjup,
        lonsat,
        lonurn,
        lonnep,
        precrate,
    ) = fundarg(ttt, opt="06")

    # Load IAU 2006 data
    _, _, _, _, _, _, apn, apni, appl, appli, _, _ = iau06in()

    # Compute luni-solar nutation
    pnsum, ensum = 0.0, 0.0
    for i in range(len(apni) - 1, -1, -1):
        tempval = (
            apni[i, 0] * l
            + apni[i, 1] * l1
            + apni[i, 2] * f
            + apni[i, 3] * d
            + apni[i, 4] * omega
        )
        tempval = np.mod(tempval, TWOPI)
        pnsum += (apn[i, 0] + apn[i, 1] * ttt) * np.sin(tempval) + apn[i, 4] * np.cos(
            tempval
        )
        ensum += (apn[i, 2] + apn[i, 3] * ttt) * np.cos(tempval) + apn[i, 6] * np.sin(
            tempval
        )

    # Compute planetary nutation
    pplnsum, eplnsum = 0.0, 0.0
    for i in range(len(appli)):
        tempval = (
            appli[i, 0] * l
            + appli[i, 1] * l1
            + appli[i, 2] * f
            + appli[i, 3] * d
            + appli[i, 4] * omega
            + appli[i, 5] * lonmer
            + appli[i, 6] * lonven
            + appli[i, 7] * lonear
            + appli[i, 8] * lonmar
            + appli[i, 9] * lonjup
            + appli[i, 10] * lonsat
            + appli[i, 11] * lonurn
            + appli[i, 12] * lonnep
            + appli[i, 13] * precrate
        )
        pplnsum += appl[i, 0] * np.sin(tempval) + appl[i, 1] * np.cos(tempval)
        eplnsum += appl[i, 2] * np.sin(tempval) + appl[i, 3] * np.cos(tempval)

    # Combine nutation components
    deltapsi = pnsum + pplnsum
    deltaeps = ensum + eplnsum

    # Apply IAU 2006 corrections
    j2d = -2.7774e-6 * ttt * ARCSEC2RAD
    deltapsi += deltapsi * (0.4697e-6 + j2d)
    deltaeps += deltaeps * j2d

    # Build transformation matrices
    nut, prec, pnb = _build_transformation_matrices(ttt, deltaeps, deltapsi, False)

    return (
        deltapsi,
        pnb,
        prec,
        nut,
        l,
        l1,
        f,
        d,
        omega,
        lonmer,
        lonven,
        lonear,
        lonmar,
        lonjup,
        lonsat,
        lonurn,
        lonnep,
        precrate,
    )


def iau06pnb(
    ttt: float,
) -> Tuple[
    float,
    np.ndarray,
    np.ndarray,
    np.ndarray,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
    float,
]:
    """Calculates the transformation matrix that accounts for the effects of
    precession-nutation using the IAU2006 precession theory and a simplified nutation
    model based on IAU2000B.

    References:
        Vallado, 2004, p. 212-214

    Args:
        ttt (float): Julian centuries of TT

    Returns:
        tuple:
            deltapsi (float): Change in longitude in radians
            pnb (np.ndarray): Combined precession-nutation matrix
            prec (np.ndarray): Precession transformation matrix (MOD to J2000)
            nut (np.ndarray): Nutation transformation matrix (IRE to GCRF)
            l (float): Delaunay element in radians
            l1 (float): Delaunay element in radians
            f (float): Delaunay element in radians
            d (float): Delaunay element in radians
            omega (float): Delaunay element in radians
            lonmer (float): Longitude of Mercury in radians
            lonven (float): Longitude of Venus in radians
            lonear (float): Longitude of Earth in radians
            lonmar (float): Longitude of Mars in radians
            lonjup (float): Longitude of Jupiter in radians
            lonsat (float): Longitude of Saturn in radians
            lonurn (float): Longitude of Uranus in radians
            lonnep (float): Longitude of Neptune in radians
            precrate (float): Precession rate in radians per Julian century
    """
    # Definitions
    iau2000b_terms = 77

    # Obtain data for calculations from the 2000b theory
    (
        l,
        l1,
        f,
        d,
        omega,
        lonmer,
        lonven,
        lonear,
        lonmar,
        lonjup,
        lonsat,
        lonurn,
        lonnep,
        precrate,
    ) = fundarg(ttt, opt="02")

    # Load IAU 2006 data
    _, _, _, _, _, _, apn, apni, _, _, _, _ = iau06in()

    # Compute luni-solar nutation
    pnsum, ensum = 0.0, 0.0
    for i in range(iau2000b_terms - 1, -1, -1):
        tempval = (
            apni[i, 0] * l
            + apni[i, 1] * l1
            + apni[i, 2] * f
            + apni[i, 3] * d
            + apni[i, 4] * omega
        )
        pnsum += (apn[i, 0] + apn[i, 1] * ttt) * np.sin(tempval) + (
            apn[i, 4] + apn[i, 5] * ttt
        ) * np.cos(tempval)
        ensum += (apn[i, 2] + apn[i, 3] * ttt) * np.cos(tempval) + (
            apn[i, 6] + apn[i, 7] * ttt
        ) * np.sin(tempval)

    # Planetary nutation constants
    pplnsum = -0.000135 * ARCSEC2RAD
    eplnsum = 0.000388 * ARCSEC2RAD

    # Combine nutation components
    deltapsi = pnsum + pplnsum
    deltaeps = ensum + eplnsum

    # Build transformation matrices
    nut, prec, pnb = _build_transformation_matrices(ttt, deltaeps, deltapsi, True)

    return (
        deltapsi,
        pnb,
        prec,
        nut,
        l,
        l1,
        f,
        d,
        omega,
        lonmer,
        lonven,
        lonear,
        lonmar,
        lonjup,
        lonsat,
        lonurn,
        lonnep,
        precrate,
    )

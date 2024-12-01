# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------


import numpy as np
from numpy.typing import ArrayLike
from typing import Tuple

from . import iau_transform as iau
from .sidereal import sidereal
from .utils import precess, nutation, polarm
from ... import constants as const


def calc_orbit_effects(
    ttt: float,
    jdut1: float,
    lod: float,
    xp: float,
    yp: float,
    ddpsi: float,
    ddeps: float,
    opt: str = "80",
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    """Calculates the orbit effects from precession, nutation, sidereal time,
    and polar motion.

    Args:
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        opt (str, optional): Option for precession/nutation model ('50', '80', or '06')
                             (default '80')
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple: (prec, nut, st, pm, omegaearth)
            prec (np.array): Transformation matrix for MOD to J2000
            nut (np.ndarray): Transformation matrix for TOD - MOD
            st (np.ndarray): Transformation matrix for PEF to TOD
            pm (np.ndarray): Transformation matrix for ECEF to PEF
            omegaearth (np.ndarray): Earth angular rotation vecctor
    """
    # Find matrices that account for various orbit effects
    prec, *_ = precess(ttt, opt=opt)
    deltapsi, _, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)
    st, _ = sidereal(jdut1, deltapsi, meaneps, omega, lod, eqeterms)
    pm = polarm(xp, yp, ttt, use_iau80=True)

    # Calculate the effects of Earth's rotation
    thetasa = const.EARTHROT * (1.0 - lod / const.DAY2SEC)
    omegaearth = np.array([0, 0, thetasa])

    return prec, nut, st, pm, omegaearth


###############################################################################
# ECI <-> ECEF Frame Conversions
###############################################################################


def eci2ecef(
    reci: ArrayLike,
    veci: ArrayLike,
    aeci: ArrayLike,
    ttt: float,
    jdut1: float,
    lod: float,
    xp: float,
    yp: float,
    ddpsi: float,
    ddeps: float,
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the ECI mean equator, mean equinox frame
    (J2000) to the Earth-fixed (ITRF) frame (ECEF).

    References:
        Vallado: 2013, p. 223-229

    Args:
        reci (array_like): ECi position vector in km
        veci (array_like): ECI velocity vector in km/s
        aeci (array_like): ECI acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple: (recef, vecef, aecef)
            recef (np.ndarray): ECEF position vector
            vecef (np.ndarray): ECEF velocity vector
            aecef (np.ndarray): ECEF acceleration vector
    """
    # Find matrices that account for various orbit effects
    prec, nut, st, pm, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, xp, yp, ddpsi, ddeps, eqeterms=eqeterms
    )

    # Position transformation
    rpef = st.T @ nut.T @ prec.T @ reci
    recef = pm.T @ rpef

    # Velocity transformation
    vpef = st.T @ nut.T @ prec.T @ veci - np.cross(omegaearth, rpef)
    vecef = pm.T @ vpef

    # Acceleration transformation
    aecef = (
        pm.T @ (st.T @ nut.T @ prec.T @ aeci)
        - np.cross(omegaearth, np.cross(omegaearth, rpef))
        - 2.0 * np.cross(omegaearth, vpef)
    )

    return recef, vecef, aecef


def ecef2eci(
    recef: ArrayLike,
    vecef: ArrayLike,
    aecef: ArrayLike,
    ttt: float,
    jdut1: float,
    lod: float,
    xp: float,
    yp: float,
    ddpsi: float,
    ddeps: float,
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the Earth-fixed (ITRF) frame (ECEF) to the ECI
    mean equator, mean equinox (J2000) frame.

    References:
        Vallado: 2013, p. 223-229

    Args:
        recef (array_like): ECEF position vector in km
        vecef (array_like): ECEF velocity vector in km/s
        aecef (array_like): ECEF acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple: (reci, veci, aeci)
            reci (np.ndarray): ECI position vector
            veci (np.ndarray): ECI velocity vector
            aeci (np.ndarray): ECI acceleration vector
    """
    # Find matrices that account for various orbit effects
    prec, nut, st, pm, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, xp, yp, ddpsi, ddeps, eqeterms=eqeterms
    )

    # Position transformation
    rpef = np.dot(pm, recef)
    reci = np.dot(prec, np.dot(nut, np.dot(st, rpef)))

    # Velocity transformation
    vpef = np.dot(pm, vecef)
    veci = np.dot(prec, np.dot(nut, np.dot(st, vpef + np.cross(omegaearth, rpef))))

    # Acceleration transformation
    aeci = (
        np.dot(prec, np.dot(nut, np.dot(st, np.dot(pm, aecef))))
        + np.cross(omegaearth, np.cross(omegaearth, rpef))
        + 2.0 * np.cross(omegaearth, vpef)
    )

    return reci, veci, aeci


###############################################################################
# ECI <-> PEF Frame Conversions
###############################################################################


def eci2pef(
    reci: ArrayLike,
    veci: ArrayLike,
    aeci: ArrayLike,
    ttt: float,
    jdut1: float,
    lod: float,
    ddpsi: float,
    ddeps: float,
    opt: str,
    ddx: float = 0.0,
    ddy: float = 0.0,
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the mean equator, mean equinox frame (J2000),
    to the pseudo earth-fixed frame (PEF).

    References:
        Vallado: 2001, p. 219, Eqs. 3-65 to 3-66

    Args:
        reci (array_like): ECI position vector in km
        veci (array_like): ECi velocity vector in km/s
        aeci (array_like): ECI acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lod (float): Excess length of day in seconds
        ddpsi (float): Nutation correction for delta psi in radians
        ddeps (float): Nutation correction for delta epsilon in radians
        opt (str): Option for precession/nutation model ('80', '06a', '06b', or '06c')
        ddx (float, optional): EOP correction for x in radians
                               (required for IAU 2006 models)
        ddy (float, optional): EOP correction for y in radians
                               (required for IAU 2006 models)
        eqeterms (bool): Add terms for ast calculation (default True)

    Returns:
        tuple: (rpef, vpef, apef)
            rpef (np.ndarray): PEF position vector in km
            vpef (np.ndarray): PEF velocity vector in km/s
            apef (np.ndarray): PEF acceleration vector in km/s²
    """
    # Get the precession matrix and the Earth's rotation vector
    iau_opt = "06" if "06" in opt else opt
    prec, *_, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, 0.0, 0.0, ddpsi, ddeps, opt=iau_opt, eqeterms=eqeterms
    )

    # Get orbit effects based on the option
    if opt == "80":
        # IAU 1980 model
        deltapsi, _, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)
        st, _ = sidereal(jdut1, deltapsi, meaneps, omega, lod, eqeterms)
    else:
        if opt == "06c":
            # CEO based, IAU 2006 precession/nutation model
            *_, pnb = iau.iau06xys(ttt, ddx, ddy)
            st = iau.iau06era(jdut1)
        elif opt == "06a":
            # Classical equinox-based IAU 2006A model
            deltapsi, pnb, prec, nut, *_ = iau.iau06pna(ttt)
            _, st = iau.iau06gst(jdut1, ttt, deltapsi, *_)
        elif opt == "06b":
            # Classical equinox-based IAU 2006B model
            deltapsi, pnb, prec, nut, *_ = iau.iau06pnb(ttt)
            _, st = iau.iau06gst(jdut1, ttt, deltapsi, *_)
        else:
            # Invalid option
            raise ValueError(
                f"Invalid opt value: {opt}. Must be '80', '6a', '6b', or '6c'."
            )
        prec = np.eye(3)
        nut = pnb

    # Transform vectors
    rpef = st.T @ nut.T @ prec.T @ reci
    vpef = st.T @ nut.T @ prec.T @ veci - np.cross(omegaearth, rpef)
    apef = (
        st.T @ nut.T @ prec.T @ aeci
        - np.cross(omegaearth, np.cross(omegaearth, rpef))
        - 2.0 * np.cross(omegaearth, vpef)
    )

    return rpef, vpef, apef


def pef2eci(
    rpef: ArrayLike,
    vpef: ArrayLike,
    apef: ArrayLike,
    ttt: float,
    jdut1: float,
    lod: float,
    ddpsi: float,
    ddeps: float,
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the pseudo Earth-fixed (PEF) frame to the ECI mean
    equator, mean equinox (J2000) frame using the IAU 1980 model.

    References:
        Vallado: 2001, p. 219, Eq. 3-68

    Args:
        rpef (array_like): PEf position vector in km
        vpef (array_like): PEF velocity vector in km/s
        apef (array_like): PEF acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1 (days from 4713 BC)
        lod (float): Excess length of day in seconds
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple: (reci, veci, aeci)
            reci (np.ndarray): ECI position vector in km
            veci (np.ndarray): ECI velocity vector in km/s
            aeci (np.ndarray): ECI acceleration vector in km/s²
    """
    # Find matrices that account for various orbit effects
    prec, nut, st, _, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, 0, 0, ddpsi, ddeps, eqeterms=eqeterms
    )

    # Transform vectors
    reci = prec @ nut @ st @ np.asarray(rpef)
    veci = prec @ nut @ st @ (np.asarray(vpef) + np.cross(omegaearth, rpef))
    aeci = (
        prec
        @ nut
        @ st
        @ (
            np.asarray(apef)
            + np.cross(omegaearth, np.cross(omegaearth, rpef))
            + 2.0 * np.cross(omegaearth, vpef)
        )
    )

    return reci, veci, aeci


###############################################################################
# ECI <-> TOD Frame Conversions
###############################################################################


def eci2tod(
    reci: ArrayLike,
    veci: ArrayLike,
    aeci: ArrayLike,
    ttt: float,
    ddpsi: float,
    ddeps: float,
    opt: str,
    ddx: float = 0.0,
    ddy: float = 0.0,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the ECI mean equator, mean equinox frame
    (J2000) to the true equator, true equinox of date (TOD) frame.

    References:
        Vallado: 2001, p. 216-219, Eq. 3-65

    Args:
        reci (array_like): ECI position vector in km
        veci (array_like): ECI velocity vector in km/s
        aeci (array_like): ECI acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        opt (str): Option for precession/nutation model ('80', '06a', '06b', or '06c')
        ddx (float, optional): EOP correction for x in radians
        ddy (float, optional): EOP correction for y in radians

    Returns:
        tuple: (rtod, vtod, atod)
            rtod (np.ndarray): TOD position vector in km
            vtod (np.ndarray): TOD velocity vector in km/s
            atod (np.ndarray): TOD acceleration vector in km/s²
    """
    # Precession
    iau_opt = "06" if "06" in opt else opt
    prec, *_ = precess(ttt, opt=iau_opt)

    # Get orbit effects based on the option
    if opt == "80":
        # IAU 1980 model
        *_, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)
    else:
        if opt == "06c":
            # CEO based, IAU 2006 precession/nutation model
            *_, pnb = iau.iau06xys(ttt, ddx, ddy)
        elif opt == "06a":
            # Classical equinox-based IAU 2006A model
            _, pnb, prec, nut, *_ = iau.iau06pna(ttt)
        elif opt == "06b":
            # Classical equinox-based IAU 2006B model
            _, pnb, prec, nut, *_ = iau.iau06pnb(ttt)
        else:
            # Invalid option
            raise ValueError(
                f"Invalid opt value: {opt}. Must be '80', '6a', '6b', or '6c'."
            )
        prec = np.eye(3)
        nut = pnb

    # Transform vectors
    rtod = nut.T @ prec.T @ np.asarray(reci)
    vtod = nut.T @ prec.T @ np.asarray(veci)
    atod = nut.T @ prec.T @ np.asarray(aeci)

    return rtod, vtod, atod


def tod2eci(
    rtod: ArrayLike,
    vtod: ArrayLike,
    atod: ArrayLike,
    ttt: float,
    ddpsi: float,
    ddeps: float,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the true equator, true equinox of date (TOD) frame
    to the ECI mean equator, mean equinox (J2000) frame.

    References:
        Vallado: 2001, p. 219-220, Eq. 3-68

    Args:
        rtod (array_like): TOD position vector in km
        vtod (array_like): TOD velocity vector in km/s
        atod (array_like): TOD acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians

    Returns:
        tuple: (reci, veci, aeci)
            reci (np.ndarray): ECI position vector in km
            veci (np.ndarray): ECI velocity vector in km/s
            aeci (np.ndarray): ECI acceleration vector in km/s²
    """
    # Precession (IAU 1980 model)
    prec, *_ = precess(ttt, opt="80")

    # Nutation
    *_, nut = nutation(ttt, ddpsi, ddeps)

    # Transform vectors
    reci = prec @ nut @ np.asarray(rtod)
    veci = prec @ nut @ np.asarray(vtod)
    aeci = prec @ nut @ np.asarray(atod)

    return reci, veci, aeci


###############################################################################
# ECI <-> MOD Frame Conversions
###############################################################################


def eci2mod(
    reci: ArrayLike, veci: ArrayLike, aeci: ArrayLike, ttt: float
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the ECI mean equator, mean equinox frame
    (J2000) to the mean equator, mean equinox of date (MOD) frame.

    References:
        Vallado: 2001, p. 214-215, Eq. 3-57

    Args:
        reci (array_like): ECI position vector in km
        veci (array_like): ECI velocity vector in km/s
        aeci (array_like): ECI acceleration vector in km/s²
        ttt (float): Julian centuries of TT

    Returns:
        tuple: (rmod, vmod, amod)
            rmod (np.ndarray): MOD position vector in km
            vmod (np.ndarray): MOD velocity vector in km/s
            amod (np.ndarray): MOD acceleration vector in km/s²
    """
    # Precession (IAU 1980 model)
    prec, *_ = precess(ttt, opt="80")

    # Transform vectors
    rmod = prec.T @ np.asarray(reci)
    vmod = prec.T @ np.asarray(veci)
    amod = prec.T @ np.asarray(aeci)

    return rmod, vmod, amod


def mod2eci(
    rmod: ArrayLike, vmod: ArrayLike, amod: ArrayLike, ttt: float
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the mean equator, mean equinox of date (MOD) frame
    to the ECI mean equator, mean equinox (J2000) frame.

    References:
        Vallado: 2013, p. 219-220, Eq. 3-68

    Args:
        rmod (array_like): MOD position vector in km
        vmod (array_like): MOD velocity vector in km/s
        amod (array_like): MOD acceleration vector in km/s²
        ttt (float): Julian centuries of TT

    Returns:
        tuple: (reci, veci, aeci)
            reci (np.ndarray): ECI position vector in km
            veci (np.ndarray): ECI velocity vector in km/s
            aeci (np.ndarray): ECI acceleration vector in km/s²
    """
    # Precession (IAU 1980 model)
    prec, *_ = precess(ttt, opt="80")

    # Transform vectors
    reci = prec @ np.asarray(rmod)
    veci = prec @ np.asarray(vmod)
    aeci = prec @ np.asarray(amod)

    return reci, veci, aeci


###############################################################################
# ECI <-> TEME Frame Conversions
###############################################################################


def _get_teme_eci_transform(
    ttt: float, ddpsi: float, ddeps: float
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Generates the transformation matrices for TEME ↔ ECI.

    Args:
        ttt (float): Julian centuries of TT
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians

    Returns:
        tuple: (prec, nut, eqe)
            prec (np.ndarray): Precession matrix
            nut (np.ndarray): Nutation matrix
            eqe (np.ndarray): Equation of equinoxes rotation matrix
    """
    # Precession (IAU 1980 model)
    prec, *_ = precess(ttt, opt="80")

    # Nutation
    deltapsi, _, meaneps, _, nut = nutation(ttt, ddpsi, ddeps)

    # Equation of equinoxes (geometric terms only)
    eqeg = deltapsi * np.cos(meaneps)
    eqeg = np.remainder(eqeg, 2.0 * np.pi)

    # Construct the rotation matrix for the equation of equinoxes
    eqe = np.array(
        [
            [np.cos(eqeg), np.sin(eqeg), 0.0],
            [-np.sin(eqeg), np.cos(eqeg), 0.0],
            [0.0, 0.0, 1.0],
        ]
    )

    return prec, nut, eqe


def eci2teme(
    reci: ArrayLike,
    veci: ArrayLike,
    aeci: ArrayLike,
    ttt: float,
    ddpsi: float,
    ddeps: float,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the ECI mean equator, mean equinox (J2000) frame to the
    true equator, mean equinox (TEME) frame.

    References:
        Vallado: 2013, p. 231-233

    Args:
        reci (array_like): ECI position vector in km
        veci (array_like): ECI velocity vector in km/s
        aeci (array_like): ECI acceleration vector in km/s²
        ttt (float): Julian centuries of TT
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians

    Returns:
        tuple: (rteme, vteme, ateme)
            rteme (np.ndarray): TEME position vector in km
            vteme (np.ndarray): TEME velocity vector in km/s
            ateme (np.ndarray): TEME acceleration vector in km/s²
    """
    # Get the individual transformation matrices
    prec, nut, eqe = _get_teme_eci_transform(ttt, ddpsi, ddeps)

    # Combined transformation matrix
    tm = eqe @ nut.T @ prec.T

    # Transform vectors
    rteme = tm @ np.asarray(reci)
    vteme = tm @ np.asarray(veci)
    ateme = tm @ np.asarray(aeci)

    return rteme, vteme, ateme


def teme2eci(
    rteme: ArrayLike,
    vteme: ArrayLike,
    ateme: ArrayLike,
    ttt: float,
    ddpsi: float,
    ddeps: float,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """Transforms a vector from the true equator, mean equinox (TEME) frame to the ECI
    mean equator, mean equinox (J2000) frame.

    References:
        Vallado: 2013, p. 231-233

    Args:
        rteme (array_like): TEME position vector in km
        vteme (array_like): TEME velocity vector in km/s
        ateme (array_like): TEME acceleration vector in km/s²
                            (set to zeros if not available)
        ttt (float): Julian centuries of TT
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians

    Returns:
        tuple: (reci, veci, aeci)
            reci (np.ndarray): ECI position vector in km
            veci (np.ndarray): ECI velocity vector in km/s
            aeci (np.ndarray): ECI acceleration vector in km/s²
    """
    # Get the individual transformation matrices
    prec, nut, eqe = _get_teme_eci_transform(ttt, ddpsi, ddeps)

    # Combined transformation matrix
    tm = prec @ nut @ eqe.T

    # Transform vectors
    reci = tm @ np.asarray(rteme)
    veci = tm @ np.asarray(vteme)
    aeci = tm @ np.asarray(ateme)

    return reci, veci, aeci

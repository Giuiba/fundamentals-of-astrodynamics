# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 4 June 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------


import numpy as np
from numpy.typing import ArrayLike
from typing import Tuple

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
    eqeterms: bool = True,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    """Calculates the orbit effects from precession, nutation, sidereal time,
    and polar motion.

    Args:
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        prec (np.array): Transformation matrix for MOD to J2000
        nut (np.ndarray): Transformation matrix for TOD - MOD
        st (np.ndarray): Transformation matrix for PEF to TOD
        pm (np.ndarray): Transformation matrix for ECEF to PEF
        omegaearth (np.ndarray): Earth angular rotation vecctor
    """
    # Find matrices that account for various orbit effects
    prec, _, _, _, _ = precess(ttt, opt="80")
    deltapsi, _, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)
    st, _ = sidereal(jdut1, deltapsi, meaneps, omega, lod, eqeterms)
    pm = polarm(xp, yp, ttt, use_iau80=True)

    # Calculate the effects of Earth's rotation
    thetasa = const.EARTHROT * (1.0 - lod / const.DAY2SEC)
    omegaearth = np.array([0, 0, thetasa])

    return prec, nut, st, pm, omegaearth


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
        recef (array_like): Position vector (Earth-fixed frame) in km
        vecef (array_like): Velocity vector (Earth-fixed frame) in km/s
        aecef (array_like): Acceleration vector (Earth-fixed frame) in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple:
            reci (np.ndarray): Position vector in the ECI frame
            veci (np.ndarray): Velocity vector in the ECI frame
            aeci (np.ndarray): Acceleration vector in the ECI frame
    """
    # Find matrices that account for various orbit effects
    prec, nut, st, pm, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, xp, yp, ddpsi, ddeps, eqeterms
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
        reci (array_like): Position vector (inertial frame) in km
        veci (np.array): Velocity vector (inertial frame) in km/s
        aeci (np.array): Acceleration vector (inertial frame) in km/s²
        ttt (float): Julian centuries of TT
        jdut1 (float): Julian date of UT1
        lod (float): Excess length of day in seconds
        xp (float): Polar motion coefficient in radians
        yp (float): Polar motion coefficient in radians
        ddpsi (float): Delta psi correction to GCRF in radians
        ddeps (float): Delta epsilon correction to GCRF in radians
        eqeterms (bool, optional): Add terms for ast calculation (default True)

    Returns:
        tuple:
            recef (np.ndarray): Position vector in the ECEF frame
            vecef (np.ndarray): Velocity vector in the ECEF frame
            aecef (np.ndarray): Acceleration vector in the ECEF frame
    """
    # Find matrices that account for various orbit effects
    prec, nut, st, pm, omegaearth = calc_orbit_effects(
        ttt, jdut1, lod, xp, yp, ddpsi, ddeps, eqeterms
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

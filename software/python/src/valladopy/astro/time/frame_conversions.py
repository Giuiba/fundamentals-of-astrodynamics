# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 4 June 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------


import numpy as np

from .sidereal import sidereal
from .utils import precess, nutation, polarm
from ... import constants as const


def ecef2eci(recef, vecef, aecef, ttt, jdut1, lod, xp, yp, ddpsi, ddeps,
             eqeterms=True):
    """Transforms a vector from the Earth-fixed (ITRF) frame (ECEF) to the ECI
    mean equator, mean equinox (J2000) frame.

    References:
        Vallado: 2013, p. 223-229

    Args:
        recef (array-like): Position vector in the Earth-fixed frame in km
        vecef (array-like): Velocity vector in the Earth-fixed frame in km/s
        aecef (array-like): Acceleration vector in the Earth-fixed frame
                            (km/s²)
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
    prec, psia, wa, ea, xa = precess(ttt, opt='80')
    deltapsi, trueeps, meaneps, omega, nut = nutation(ttt, ddpsi, ddeps)
    st, stdot = sidereal(jdut1, deltapsi, meaneps, omega, lod, eqeterms)
    pm = polarm(xp, yp, ttt, use_iau80=True)

    # Calculate the effects of Earth's rotation
    thetasa = const.EARTHROT * (1.0 - lod / const.DAY2SEC)
    omegaearth = np.array([0, 0, thetasa])

    # Position transformation
    rpef = np.dot(pm, recef)
    reci = np.dot(prec, np.dot(nut, np.dot(st, rpef)))

    # Velocity transformation
    vpef = np.dot(pm, vecef)
    veci = np.dot(
        prec, np.dot(nut, np.dot(st, vpef + np.cross(omegaearth, rpef)))
    )

    # Acceleration transformation
    aeci = (
        np.dot(prec, np.dot(nut, np.dot(st, np.dot(pm, aecef))))
        + np.cross(omegaearth, np.cross(omegaearth, rpef))
        + 2.0 * np.cross(omegaearth, vpef)
    )

    return reci, veci, aeci

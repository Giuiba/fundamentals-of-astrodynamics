# ------------------------------------------------------------------------------
# Name: adbar2rv.py
# Author: David Vallado
# Date: 6 June 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np


def adbar2rv(rmag, vmag, rtasc, decl, fpav, az):
    """
    This function transforms the orbital elements (rtasc, decl, fpav, azimuth,
    position and velocity magnitude) into ECI position and velocity vectors.

    Args:
        rmag (float): ECI position vector magnitude in km
        vmag: (float): ECI velocity vector magnitude in km/sec
        rtasc (float): Right ascension of satellite in radians
        decl (float): Declination of satellite in radians
        fpav (float): Satellite flight path angle from vertical in radians
        az (float): Satellite flight path azimuth in radians

    Returns:
        r (numpy array): ECI position vector
        v (numpy array): ECI velocity vector
    """
    # Form position vector
    r = np.array(
        [
            rmag * np.cos(decl) * np.cos(rtasc),
            rmag * np.cos(decl) * np.sin(rtasc),
            rmag * np.sin(decl)
        ]
    )

    # Form velocity vector
    v = np.array(
        [
            vmag * (np.cos(rtasc)
                    * (-np.cos(az) * np.sin(fpav) * np.sin(decl)
                       + np.cos(fpav) * np.cos(decl))
                    - np.sin(az) * np.sin(fpav) * np.sin(rtasc)),
            vmag * (np.sin(rtasc)
                    * (-np.cos(az) * np.sin(fpav) * np.sin(decl)
                       + np.cos(fpav) * np.cos(decl))
                    + np.sin(az) * np.sin(fpav) * np.cos(rtasc)),
            vmag * (np.cos(az) * np.cos(decl) * np.sin(fpav)
                    + np.cos(fpav) * np.sin(decl))
        ]
    )

    return r, v

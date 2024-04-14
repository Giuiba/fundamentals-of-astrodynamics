# -----------------------------------------------------------------------------
# Author: David Vallado
# Date: 27 May 2002
#
# Copyright (c) 2024
# For license information, see LICENSE file
# -----------------------------------------------------------------------------

import numpy as np


###############################################################################
# Axes Rotations
###############################################################################

def rot1(vec, xval):
    """Rotation about the 1st axis (x-axis)

    Inputs:
        vec (array_like): Input vector
        xval (float): Angle of rotation in radians

    Returns:
        array_like: Rotated vector
    """
    c, s = np.cos(xval), np.sin(xval)
    outvec = np.array(
        [
            vec[0],
            c * vec[1] + s * vec[2],
            c * vec[2] - s * vec[1]
        ]
    )
    return outvec


def rot2(vec, xval):
    """Rotation about the 2nd axis (y-axis)

    Inputs:
        vec (array_like): Input vector
        xval (float): Angle of rotation in radians

    Returns:
        array_like: Rotated vector
    """
    c, s = np.cos(xval), np.sin(xval)
    outvec = np.array(
        [
            c * vec[0] - s * vec[2],
            vec[1],
            c * vec[2] + s * vec[0]
        ]
    )
    return outvec


def rot3(vec, xval):
    """Rotation about the 3rd axis (z-axis)

    Inputs:
        vec (array_like): Input vector
        xval (float): Angle of rotation in radians

    Returns:
        array_like: Rotated vector
    """
    c, s = np.cos(xval), np.sin(xval)
    outvec = np.array(
        [
            c * vec[0] + s * vec[1],
            c * vec[1] - s * vec[0],
            vec[2]
        ]
    )
    return outvec

import numpy as np

from ... import constants as const


# TODO: Move to a more general location


def time_of_flight(a):
    """Calculate the time of flight for a given semi-major axis."""
    return np.pi * np.sqrt(a**3 / const.MU)


def specific_mech_energy(a):
    """Computes specific mechanical energy at a given semi-major axis."""
    return -const.MU / (2.0 * a)


def velocity_mag(r, a):
    """Computes velocity magnitude at a given radius and specific mechanical energy."""
    return np.sqrt(2.0 * ((const.MU / r) + specific_mech_energy(a)))


def angular_velocity(a):
    """Computes the angular velocity at a given semi-major axis."""
    return np.sqrt(const.MU / a**3)


def deltav(v1, v2, theta):
    """Computes the delta-v for a given initial and final velocity with an angle."""
    return np.sqrt(v1**2 + v2**2 - 2.0 * v1 * v2 * np.cos(theta))


def semimajor_axis(r, e, nu):
    """Computes the semi-major axis for an elliptical orbit."""
    return (r * (1.0 + e * np.cos(nu))) / (1.0 - e**2)

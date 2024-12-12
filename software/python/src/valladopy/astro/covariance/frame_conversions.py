import numpy as np

from ..twobody import frame_conversions as fc
from ...constants import KM2M, MUM


########################################################################################
# Classical Elements
########################################################################################


def _compute_partials_a(a, n, reci_m, veci_m):
    """Compute partial derivatives of a w.r.t. (rx, ry, rz, vx, vy, vz)."""
    tm_a = np.zeros(6)
    p0 = 2.0 * a**2 / np.linalg.norm(reci_m) ** 3
    p1 = 2.0 / (n**2 * a)
    tm_a[:3] = p0 * reci_m
    tm_a[3:] = p1 * veci_m
    return tm_a


def _compute_partials_ecc(reci_m, veci_m, ecc_vec, ecc):
    """Compute partial derivatives of ecc w.r.t. (rx, ry, rz, vx, vy, vz)."""
    rx, ry, rz = reci_m
    vx, vy, vz = veci_m
    tm_ecc = np.zeros(6)
    p0 = 1.0 / (MUM * ecc)

    magr = np.linalg.norm(reci_m)
    magr3 = magr**3

    tm_ecc[0] = -p0 * (
        ((vx * vy - MUM * rx * ry / magr3) * ecc_vec[1])
        + ((vx * vz - MUM * rx * rz / magr3) * ecc_vec[2])
        - (vy**2 + vz**2 - MUM / magr + MUM * rx**2 / magr3) * ecc_vec[0]
    )
    tm_ecc[1] = -p0 * (
        ((vx * vy - MUM * rx * ry / magr3) * ecc_vec[0])
        + ((vy * vz - MUM * ry * rz / magr3) * ecc_vec[2])
        - (vx**2 + vz**2 - MUM / magr + MUM * ry**2 / magr3) * ecc_vec[1]
    )
    tm_ecc[2] = -p0 * (
        ((vx * vz - MUM * rx * rz / magr3) * ecc_vec[0])
        + ((vy * vz - MUM * ry * rz / magr3) * ecc_vec[1])
        - (vx**2 + vy**2 - MUM / magr + MUM * rz**2 / magr3) * ecc_vec[2]
    )
    tm_ecc[3] = -p0 * (
        ((rx * vy - 2 * ry * vx) * ecc_vec[1])
        + ((ry * vy + rz * vz) * ecc_vec[0])
        + ((rx * vz - 2 * rz * vx) * ecc_vec[2])
    )
    tm_ecc[4] = -p0 * (
        ((ry * vx - 2 * rx * vy) * ecc_vec[0])
        + ((rx * vx + rz * vz) * ecc_vec[1])
        + ((ry * vz - 2 * rz * vy) * ecc_vec[2])
    )
    tm_ecc[5] = -p0 * (
        ((rx * vx + ry * vy) * ecc_vec[2])
        + ((rz * vx - 2 * rx * vz) * ecc_vec[0])
        + ((rz * vy - 2 * ry * vz) * ecc_vec[1])
    )

    return tm_ecc


def _compute_partials_incl(reci_m, veci_m, h_vec, node):
    """Compute partial derivatives of inclination w.r.t. (rx, ry, rz, vx, vy, vz)."""
    rx, ry, rz = reci_m
    vx, vy, vz = veci_m
    h = np.linalg.norm(h_vec)
    tm_incl = np.zeros(6)
    p3 = 1.0 / node
    tm_incl[0] = -p3 * (vy - h_vec[2] * (vy * h_vec[2] - vz * h_vec[1]) / h**2)
    tm_incl[1] = p3 * (vx - h_vec[2] * (vx * h_vec[2] - vz * h_vec[0]) / h**2)
    tm_incl[2] = -p3 * (h_vec[2] * (vy * h_vec[0] - vx * h_vec[1]) / h**2)
    tm_incl[3] = p3 * (ry - h_vec[2] * (ry * h_vec[2] - rz * h_vec[1]) / h**2)
    tm_incl[4] = -p3 * (rx - h_vec[2] * (rx * h_vec[2] - rz * h_vec[0]) / h**2)
    tm_incl[5] = p3 * (h_vec[2] * (ry * h_vec[0] - rx * h_vec[1]) / h**2)

    return tm_incl


def _compute_partials_node(reci_m, veci_m, node_vec, node):
    """Compute partial derivatives of node w.r.t. (rx, ry, rz, vx, vy, vz)."""
    rx, ry, rz = reci_m
    vx, vy, vz = veci_m
    tm_node = np.zeros(6)
    p4 = 1.0 / (node**2)
    tm_node[0] = -p4 * vz * node_vec[1]
    tm_node[1] = p4 * vz * node_vec[0]
    tm_node[2] = p4 * (vx * node_vec[1] - vy * node_vec[0])
    tm_node[3] = p4 * rz * node_vec[1]
    tm_node[4] = -p4 * rz * node_vec[0]
    tm_node[5] = p4 * (ry * node_vec[0] - rx * node_vec[1])

    return tm_node


def _compute_partials_argp(
    tm_ecc, reci_m, veci_m, ecc_vec, ecc, h_vec, node, n_dot_e, w_scale
):
    """Compute partial derivatives of argp w.r.t. (rx, ry, rz, vx, vy, vz)."""
    rx, ry, rz = reci_m
    vx, vy, vz = veci_m
    magr = np.linalg.norm(reci_m)
    tm_argp = np.zeros(6)
    tm_argp[0] = (
        -h_vec[1] * (vy**2 + vz**2 - MUM / magr + MUM * rx**2 / magr**3)
        - h_vec[0] * (vx * vy - MUM * rx * ry / magr**3)
        + vz * MUM * ecc_vec[0]
    )
    tm_argp[0] = (
        tm_argp[0] / (MUM * node * ecc)
        + vz * h_vec[1] * n_dot_e / (node**3 * ecc)
        - tm_ecc[0] * n_dot_e / (node * ecc**2)
    ) * w_scale

    tm_argp[1] = (
        h_vec[0] * (vx**2 + vz**2 - MUM / magr + MUM * ry**2 / magr**3)
        + h_vec[1] * (vx * vy - MUM * rx * ry / magr**3)
        + vz * MUM * ecc_vec[1]
    )
    tm_argp[1] = (
        tm_argp[1] / (MUM * node * ecc)
        - vz * h_vec[0] * n_dot_e / (node**3 * ecc)
        - tm_ecc[1] * n_dot_e / (node * ecc**2)
    ) * w_scale

    tm_argp[2] = (
        -h_vec[1] * (vx * vz - MUM * rx * rz / magr**3)
        + h_vec[0] * (vy * vz - MUM * ry * rz / magr**3)
        + vx * MUM * ecc_vec[0]
        + vy * MUM * ecc_vec[1]
    )
    tm_argp[2] = (
        -tm_argp[2] / (MUM * node * ecc)
        + (vy * h_vec[0] - vx * h_vec[1]) * n_dot_e / (node**3 * ecc)
        - tm_ecc[2] * n_dot_e / (node * ecc**2)
    ) * w_scale

    tm_argp[3] = (
        (rx * vy - 2 * ry * vx) * h_vec[0]
        - h_vec[1] * (ry * vy + rz * vz)
        + rz * MUM * ecc_vec[0]
    )
    tm_argp[3] = (
        -tm_argp[3] / (MUM * node * ecc)
        - rz * h_vec[1] * n_dot_e / (node**3 * ecc)
        - tm_ecc[3] * n_dot_e / (node * ecc**2)
    ) * w_scale

    tm_argp[4] = (
        -(ry * vx - 2 * rx * vy) * h_vec[1]
        + h_vec[0] * (rx * vx + rz * vz)
        + rz * MUM * ecc_vec[1]
    )
    tm_argp[4] = (
        -tm_argp[4] / (MUM * node * ecc)
        + rz * h_vec[0] * n_dot_e / (node**3 * ecc)
        - tm_ecc[4] * n_dot_e / (node * ecc**2)
    ) * w_scale

    tm_argp[5] = (
        -(rz * vx - 2 * rx * vz) * h_vec[1]
        + h_vec[0] * (rz * vy - 2 * ry * vz)
        - rx * MUM * ecc_vec[0]
        - ry * MUM * ecc_vec[1]
    )
    tm_argp[5] = (
        -tm_argp[5] / (MUM * node * ecc)
        + (rx * h_vec[1] - ry * h_vec[0]) * n_dot_e / (node**3 * ecc)
        - tm_ecc[5] * n_dot_e / (node * ecc**2)
    ) * w_scale

    return tm_argp


def _compute_partials_nu(
    tm_ecc, reci_m, veci_m, ecc, ecc_term, r_dot_v, r_dot_e, nu_scale
):
    """Compute partial derivatives of nu/M w.r.t. (rx, ry, rz, vx, vy, vz)."""
    rx, ry, rz = reci_m
    vx, vy, vz = veci_m
    magr = np.linalg.norm(reci_m)
    tm_nu = np.zeros(6)
    tm_nu[0] = (
        ry * (vx * vy - MUM * rx * ry / magr**3)
        - rx * ecc_term
        + rz * (vx * vz - MUM * rx * rz / magr**3)
        - rx * (vy**2 + vz**2 - MUM / magr + MUM * rx**2 / magr**3)
        + vx * r_dot_v
    )
    tm_nu[0] = (
        -tm_nu[0] / (MUM * magr * ecc)
        - rx * r_dot_e / (magr**3 * ecc)
        - tm_ecc[0] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    tm_nu[1] = (
        rx * (vx * vy - MUM * rx * ry / magr**3)
        - ry * ecc_term
        + rz * (vy * vz - MUM * ry * rz / magr**3)
        - ry * (vx**2 + vz**2 - MUM / magr + MUM * ry**2 / magr**3)
        + vy * r_dot_v
    )
    tm_nu[1] = (
        -tm_nu[1] / (MUM * magr * ecc)
        - ry * r_dot_e / (magr**3 * ecc)
        - tm_ecc[1] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    tm_nu[2] = (
        rx * (vx * vz - MUM * rx * rz / magr**3)
        - rz * ecc_term
        + ry * (vy * vz - MUM * ry * rz / magr**3)
        - rz * (vx**2 + vy**2 - MUM / magr + MUM * rz**2 / magr**3)
        + vz * r_dot_v
    )
    tm_nu[2] = (
        -tm_nu[2] / (MUM * magr * ecc)
        - rz * r_dot_e / (magr**3 * ecc)
        - tm_ecc[2] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    tm_nu[3] = (
        ry * (rx * vy - 2 * ry * vx)
        + rx * (ry * vy + rz * vz)
        + rz * (rx * vz - 2 * rz * vx)
    )
    tm_nu[3] = (
        -tm_nu[3] / (MUM * magr * ecc) - tm_ecc[3] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    tm_nu[4] = (
        rx * (ry * vx - 2 * rx * vy)
        + ry * (rx * vx + rz * vz)
        + rz * (ry * vz - 2 * rz * vy)
    )
    tm_nu[4] = (
        -tm_nu[4] / (MUM * magr * ecc) - tm_ecc[4] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    tm_nu[5] = (
        rz * (rx * vx + ry * vy)
        + rx * (rz * vx - 2 * rx * vz)
        + ry * (rz * vy - 2 * ry * vz)
    )
    tm_nu[5] = (
        -tm_nu[5] / (MUM * magr * ecc) - tm_ecc[5] * r_dot_e / (magr * ecc**2)
    ) * nu_scale

    return tm_nu


def covct2cl(
    cartcov: np.ndarray, cartstate: np.ndarray, use_mean_anom: bool = False
) -> tuple[np.ndarray, np.ndarray]:
    """Transforms a 6x6 covariance matrix from Cartesian elements to classical orbital
    elements.

    References:
        Vallado and Alfano 2015

    Args:
        cartcov (np.ndarray): 6x6 Cartesian covariance matrix, in km and km/s
        cartstate (np.ndarray): 6x1 Cartesian orbit state in km and km/s
                                (rx, ry, rz, vx, vy, vz)
        use_mean_anom (bool): Flag to use mean anomaly instead of true anomaly

    Returns:
        tuple: (classcov, tm)
            classcov (np.ndarray): 6x6 Classical orbital elements covariance matrix
            tm (np.ndarray): 6x6 Transformation matrix
    """
    # Parse the input state vector
    rx, ry, rz, vx, vy, vz = cartstate * KM2M  # convert to meters
    reci_m = np.array([rx, ry, rz])
    veci_m = np.array([vx, vy, vz])
    reci = reci_m / KM2M  # convert back to km
    veci = veci_m / KM2M

    # Convert to classical orbital elements
    _, a, ecc, incl, omega, argp, nu, *_ = fc.rv2coe(reci, veci)
    a *= KM2M
    n = np.sqrt(MUM / a**3)

    # Common quantities
    sqrt1me2 = np.sqrt(1.0 - ecc**2)
    magr = np.linalg.norm(reci_m)
    magv = np.linalg.norm(veci_m)

    # Eccentricity vector
    r_dot_v = np.dot(reci_m, veci_m)
    ecc_term = magv**2 - MUM / magr
    ecc_vec = (ecc_term * reci_m - r_dot_v * veci_m) / MUM

    # Node vector
    h_vec = np.cross(reci_m, veci_m)
    node_vec = np.cross([0.0, 0.0, 1.0], h_vec)
    node = np.linalg.norm(node_vec)

    # Additional terms for argument of periapsis and true anomaly
    n_dot_e = np.dot(node_vec, ecc_vec)
    sign_w = np.sign((magv**2 - MUM / magr) * rz - r_dot_v * vz)
    cos_w = n_dot_e / (ecc * node)
    w_scale = -sign_w / np.sqrt(1 - cos_w**2)

    # Additional terms for true anomaly
    r_dot_e = np.dot(reci_m, ecc_vec)
    cos_nu = r_dot_e / (magr * ecc)
    sign_nu = np.sign(r_dot_v)
    nu_scale = -sign_nu / np.sqrt(1 - cos_nu**2)

    # Compute partial derivatives
    tm = np.zeros((6, 6))

    # Compute partials
    tm[0, :] = _compute_partials_a(a, n, reci_m, veci_m)
    tm[1, :] = _compute_partials_ecc(reci_m, veci_m, ecc_vec, ecc)
    tm[2, :] = _compute_partials_incl(reci_m, veci_m, h_vec, node)
    tm[3, :] = _compute_partials_node(reci_m, veci_m, node_vec, node)
    tm[4, :] = _compute_partials_argp(
        tm[1, :], reci_m, veci_m, ecc_vec, ecc, h_vec, node, n_dot_e, w_scale
    )
    tm[5, :] = _compute_partials_nu(
        tm[1, :], reci_m, veci_m, ecc, ecc_term, r_dot_v, r_dot_e, nu_scale
    )

    # Update partials for mean anomaly, if specified
    if use_mean_anom:
        dmdnu = (sqrt1me2**2) ** 1.5 / (1.0 + ecc * np.cos(nu)) ** 2
        dmde = (
            -np.sin(nu)
            * (
                (ecc * np.cos(nu) + 1)
                * (ecc + np.cos(nu))
                / np.sqrt((ecc + np.cos(nu)) ** 2)
                + 1.0
                - 2.0 * ecc**2
                - ecc**3 * np.cos(nu)
            )
            / ((ecc * np.cos(nu) + 1.0) ** 2 * sqrt1me2)
        )
        tm[5, :] = tm[5, :] * dmdnu + tm[1, :] * dmde

    # Calculate the classical covariance matrix
    classcov = tm @ cartcov @ tm.T

    return classcov, tm

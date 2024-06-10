import numpy as np

from ...constants import ARCSEC2RAD


def precess(ttt, opt):
    """Calculates the transformation matrix that accounts for the effects of
    precession. Both the 1980 and 2006 theories are handled.

    Args:
        ttt (float): Julian centuries of Terrestrail Time (TT)
        opt (str): Method option ('50', '80', '06')

    Returns:
        tuple: A tuple containing:
            - prec (np.array): Transformation matrix for MOD to J2000
            - psia (float): Canonical precession angle in radians
            - wa (float): Canonical precession angle in radians
            - ea (float): Canonical precession angle in radians
            - xa (float): Canonical precession angle in radians

    TODO:
        - Implement commented out methods (from m-file)?
        - Use enums instead of strings for option/method?
    """
    def calc_prec_angle(ttt, coeffs):
        return (
            (
                (
                    (coeffs[0] * ttt + coeffs[1]) * ttt + coeffs[2]
                ) * ttt + coeffs[3]
            ) * ttt + coeffs[4]
        ) * ttt

    # Initialize some variables
    ttt2 = ttt * ttt
    ttt3 = ttt2 * ttt
    prec = np.eye(3)

    if opt == '50':
        # Commenting these out because they seem important but not used
        # TODO: Decide if these need to be used instead of definitions below
        # psia = 50.3708 + 0.0050 * ttt
        # wa = 0.0
        # ea = 84428.26 - 46.845 * ttt - 0.00059 * ttt2 + 0.00181 * ttt3
        xa = 0.1247 - 0.0188 * ttt

        zeta = 2304.9969 * ttt + 0.302 * ttt2 + 0.01808 * ttt3
        theta = 2004.2980 * ttt - 0.425936 * ttt2 - 0.0416 * ttt3
        z = 2304.9969 * ttt + 1.092999 * ttt2 + 0.0192 * ttt3

        prec[0, 0] = 1.0 - 2.9696e-4 * ttt2 - 1.3e-7 * ttt3
        prec[0, 1] = 2.234941e-2 * ttt + 6.76e-6 * ttt2 - 2.21e-6 * ttt3
        prec[0, 2] = 9.7169e-3 * ttt - 2.07e-6 * ttt2 - 9.6e-7 * ttt3
        prec[1, 0] = -prec[0, 1]
        prec[1, 1] = 1.0 - 2.4975e-4 * ttt2 - 1.5e-7 * ttt3
        prec[1, 2] = -1.0858e-4 * ttt2
        prec[2, 0] = -prec[0, 2]
        prec[2, 1] = prec[1, 2]
        prec[2, 2] = 1.0 - 4.721e-5 * ttt2

        # Pass these back out for testing
        # TODO: decide if these need to be removed
        psia = zeta
        wa = theta
        ea = z

    elif opt == '80':
        psia = 5038.7784 * ttt - 1.07259 * ttt2 - 0.001147 * ttt3
        wa = 84381.448 + 0.05127 * ttt2 - 0.007726 * ttt3
        ea = 84381.448 - 46.8150 * ttt - 0.00059 * ttt2 + 0.001813 * ttt3
        xa = 10.5526 * ttt - 2.38064 * ttt2 - 0.001125 * ttt3

        zeta = 2306.2181 * ttt + 0.30188 * ttt2 + 0.017998 * ttt3
        theta = 2004.3109 * ttt - 0.42665 * ttt2 - 0.041833 * ttt3
        z = 2306.2181 * ttt + 1.09468 * ttt2 + 0.018203 * ttt3

    elif opt == '06':
        oblo = 84381.406
        psia = calc_prec_angle(
            ttt,
            [-0.0000000951, 0.000132851, -0.00114045, -1.0790069, 5038.481507]
        )
        wa = calc_prec_angle(
            ttt,
            [0.0000003337, -0.000000467, -0.00772503, 0.0512623, -0.025754]
        ) + oblo
        ea = calc_prec_angle(
            ttt,
            [-0.0000000434, -0.000000576, 0.00200340, -0.0001831, -46.836769]
        ) + oblo
        xa = calc_prec_angle(
            ttt,
            [-0.0000000560, 0.000170663, -0.00121197, -2.3814292, 10.556403]
        )
        zeta = calc_prec_angle(
            ttt,
            [-0.0000003173, -0.000005971, 0.01801828, 0.2988499, 2306.083227]
        ) + 2.650545
        theta = calc_prec_angle(
            ttt,
            [-0.0000001274, -0.000007089, -0.04182264, -0.4294934, 2004.191903]
        )
        z = calc_prec_angle(
            ttt,
            [0.0000002904, -0.000028596, 0.01826837, 1.0927348, 2306.077181]
        ) - 2.650545
    else:
        raise ValueError(
            "Method must be one of the following: '50', '80', or '06'"
        )

    # Convert units to radians
    zeta *= ARCSEC2RAD
    theta *= ARCSEC2RAD
    z *= ARCSEC2RAD

    if opt in ['80', '06']:
        coszeta = np.cos(zeta)
        sinzeta = np.sin(zeta)
        costheta = np.cos(theta)
        sintheta = np.sin(theta)
        cosz = np.cos(z)
        sinz = np.sin(z)

        # Form matrix MOD to J2000
        prec[0, 0] = coszeta * costheta * cosz - sinzeta * sinz
        prec[0, 1] = coszeta * costheta * sinz + sinzeta * cosz
        prec[0, 2] = coszeta * sintheta
        prec[1, 0] = -sinzeta * costheta * cosz - coszeta * sinz
        prec[1, 1] = -sinzeta * costheta * sinz + coszeta * cosz
        prec[1, 2] = -sinzeta * sintheta
        prec[2, 0] = -sintheta * cosz
        prec[2, 1] = -sintheta * sinz
        prec[2, 2] = costheta

    return (
        prec,
        psia * ARCSEC2RAD,
        wa * ARCSEC2RAD,
        ea * ARCSEC2RAD,
        xa * ARCSEC2RAD
    )

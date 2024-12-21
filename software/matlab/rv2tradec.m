% ------------------------------------------------------------------------------
%
%                           function rv2tradec
%
%  this function converts geocentric equatorial (ecef) position and velocity
%    vectors into range, topcentric right acension, declination, and rates.
%    notice the value of small as it can affect the rate term calculations.
%    the solution uses the velocity vector to find the singular cases. also,
%    the right acension and declination rate terms are not observable unless
%    the acceleration vector is available.
%
%  author        : david vallado           davallado@gmail.com    19 jul 2004
%
%  inputs          description                              range / units
%    recef        - ecef position vector                      km
%    vecef        - ecef velocity vector                      km/s
%    latgd       - geodetic latitude                        -pi/2 to pi/2 rad
%    lon         - longitude of site                        -2pi to 2pi rad
%    alt         - altitude                                 km
%    ttt         - julian centuries of tt                   centuries
%    jdut1       - julian date of ut1                       days from 4713 bc
%    lod         - excess length of day                     sec
%    xp          - polar motion coefficient                 rad
%    yp          - polar motion coefficient                 rad
%    terms       - number of terms for ast calculation      0,2
%
%  outputs       :
%    rho         - satellite range from site                km
%    trtasc      - topocentric right ascension              0.0 to 2pi rad
%    tdecl       - topocentric declination                  -pi/2 to pi/2 rad
%    drho        - range rate                               km/s
%    dtrtasc     - topocentric rtasc rate                   rad / s
%    dtdecl      - topocentric decl rate                    rad / s
%
%  locals        :
%    rhovecef     - ecef range vector from site               km
%    drhovecef    - ecef velocity vector from site            km / s
%
%  coupling      :
%    mag         - magnitude of a vector
%    rot3        - rotation about the 3rd axis
%    rot2        - rotation about the 2nd axis
%
%  references    :
%    vallado       2022, 257, alg 26
%
%  [rho, trtasc, tdecl, drho, dtrtasc, dtdecl] = rv2tradec ( recef, vecef, rsecef, vsecef )
% ------------------------------------------------------------------------------

function [rho, trtasc, tdecl, drho, dtrtasc, dtdecl] = rv2tradec ( recef, vecef, rsecef, vsecef )

    constmath;

    % --------------------- implementation ------------------------
    % ------- find ecef slant range vector from site to satellite ---------
    rhovecef  = recef - rsecef;
    drhovecef = vecef - vsecef;
    rho      = mag(rhovecef);

    % --------------- calculate topocentric rtasc and decl ---------------
    temp = sqrt( rhovecef(1) * rhovecef(1) + rhovecef(2) * rhovecef(2) );
    if (temp < small)
        trtasc = atan2( drhovecef(2), drhovecef(1) );
    else
        trtasc = atan2( rhovecef(2), rhovecef(1) );
    end

    % directly over the north pole
    if (temp < small)
        tdecl = sign(rhovecef(3)) * halfpi;   % +- 90 deg
    else
        magrhoecef = mag(rhovecef);
        tdecl = asin( rhovecef(3) / magrhoecef );
    end
    if (trtasc < 0.0)
        trtasc = trtasc + 2.0*pi;
    end

    % ---------- calculate topcentric rtasc and decl rates -------------
    temp1 = -rhovecef(2) * rhovecef(2) - rhovecef(1) * rhovecef(1);
    drho = dot(rhovecef, drhovecef) / rho;
    if ( abs( temp1 ) > small )
        dtrtasc = ( drhovecef(1)*rhovecef(2) - drhovecef(2) * rhovecef(1) ) / temp1;
    else
        dtrtasc = 0.0;
    end

    if ( abs( temp ) > small )
        dtdecl = ( drhovecef(3) - drho * sin( tdecl ) ) / temp;
    else
        dtdecl = 0.0;
    end

end   % rv2tradec

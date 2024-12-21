% ----------------------------------------------------------------------------
%
%                           function tirs2eci
%
%  this function trsnforms a vector from the pseudo earth fixed frame (tirs),
%    to the mean equator mean equinox (j2000) frame.
%
%  author        : david vallado                  719-573-2600   25 jun 2002
%
%  revisions
%    vallado     - add terms for ast calculation                 30 sep 2002
%    vallado     - consolidate with iau 2000                     14 feb 2005
%
%  inputs          description                    range / units
%    rtirs        - position pseudo earth fixed    km
%    vtirs        - velocity pseudo earth fixed    km/s
%    atirs        - acceleration pseudo earth fixedkm/s2
%    ttt         - julian centuries of tt         centuries
%    jdut1       - julian date of ut1             days from 4713 bc
%    lod         - excess length of day           sec
%    terms       - number of terms for ast calculation 0,2
%
%
%
%  outputs       :
%    reci        - position vector eci            km
%    veci        - velocity vector eci            km/s
%    aeci        - acceleration vector eci        km/s2
%
%  locals        :
%    prec        - matrix for eci - mod
%    deltapsi    - nutation angle                 rad
%    trueeps     - true obliquity of the ecliptic rad
%    meaneps     - mean obliquity of the ecliptic rad
%    omega       -                                rad
%    nut         - matrix for mod - tod
%    st          - matrix for tod - tirs
%    stdot       - matrix for tod - tirs rate
%
%  coupling      :
%   precess      - rotation for precession        mod - eci
%   nutation     - rotation for nutation          tod - mod
%   sidereal     - rotation for sidereal time     tirs - tod
%
%  references    :
%    vallado       2001, 219-220, eq 3-68
%
% [reci, veci, aeci] = tirs2eci(rtirs, vtirs, atirs, iau06arr, xysarr, ttt, jdut1, lod, ddx, ddy, opt1 )
% ----------------------------------------------------------------------------

function [reci, veci, aeci] = tirs2eci(rtirs, vtirs, atirs, iau06arr, xysarr, ttt, jdut1, lod, ddx, ddy, opt1 )
    constastro;
    pnb = zeros(3,3);
    st = zeros(3,3);

    [fArgs06] = fundarg(ttt, '06');

    [prec, psia, wa, ea, xa] = precess ( ttt, '06' );

    % ---- ceo based, iau2006
    if not(contains(opt1, 'a')) || not(contains(opt1, 'b'))
        [x, y, s, pnb] = iau06xys (iau06arr, fArgs06, xysarr, ttt, ddx, ddy, opt1);
        [st, stdot] = sidereal(jdut1, 0.0, 0.0, 0.0, 0.0, 0, '06' );
    end

    % ---- class equinox based, 2000a
    if opt1 == '06a'
        [ deltapsi, pnb, prec, nut, l, l1, f, d, omega, ...
            lonmer, lonven, lonear, lonmar, lonjup, lonsat, lonurn, lonnep, precrate ...
            ] = iau06pna (ttt);
        [gst,st] = iau06gst(jdut1, ttt, deltapsi, l, l1, f, d, omega, ...
            lonmer, lonven, lonear, lonmar, lonjup, lonsat, lonurn, lonnep, precrate);
    end

    % ---- class equinox based, 2000b
    if opt1 == '06b'
        [ deltapsi, pnb, prec, nut, l, l1, f, d, omega, ...
            lonmer, lonven, lonear, lonmar, lonjup, lonsat, lonurn, lonnep, precrate ...
            ] = iau06pnb (ttt);
        [gst,st] = iau06gst(jdut1, ttt, deltapsi, l, l1, f, d, omega, ...
            lonmer, lonven, lonear, lonmar, lonjup, lonsat, lonurn, lonnep, precrate);
    end
    prec = eye(3);
    nut = pnb;


    thetasa= earthrot * (1.0  - lod/86400.0 );
    omegaearth = [0; 0; thetasa;];

    reci = prec*nut*st*rtirs;

    veci = prec*nut*st*(vtirs + cross(omegaearth,rtirs));

    temp = cross(omegaearth,rtirs);
    aeci = prec*nut*st*(atirs + cross(omegaearth,temp) ...
        + 2.0*cross(omegaearth,vtirs));


% ----------------------------------------------------------------------------
%
%                           function eci2tirs
%
%  this function transforms a vector from the mean equator, mean equinox frame
%    (j2000), to the pseudo earth fixed frame (tirs).
%
%  author        : david vallado                  719-573-2600   27 may 2002
%
%  revisions
%    vallado     - add terms for ast calculation                 30 sep 2002
%    vallado     - consolidate with iau 2000                     14 feb 2005
%
%  inputs          description                    range / units
%    reci        - position vector eci            km
%    veci        - velocity vector eci            km/s
%    aeci        - acceleration vector eci        km/s2
%    ttt         - julian centuries of tt         centuries
%    jdut1       - julian date of ut1             days from 4713 bc
%    lod         - excess length of day           sec
%    terms       - number of terms for ast calculation 0,2
%    ddpsi
%    ddeps
%
%  outputs       :
%    rtirs        - position pseudo earth fixed    km
%    vtirs        - velocity pseudo earth fixed    km/s
%    atirs        - acceleration pseudo earth fixedkm/s2
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
%    vallado       2001, 219, eq 3-65 to 3-66
%
% [rtirs, vtirs, atirs] = eci2tirs(reci, veci, aeci, iau06arr, fArgs06, xysarr, ttt, jdut1, lod, ddx, ddy, opt1 )
% ----------------------------------------------------------------------------

function [rtirs, vtirs, atirs] = eci2tirs(reci, veci, aeci, iau06arr, fArgs06, xysarr, ttt, jdut1, lod, ddx, ddy, opt1 )
    constastro;
    pnb = zeros(3,3);
    st = zeros(3,3);

    [prec, psia, wa, ea, xa] = precess ( ttt, '06' );

    % ---- ceo based, iau2006
    if not(contains(opt1, 'a')) || not(contains(opt1, 'b'))
        [x, y, s, pnb] = iau06xys (iau06arr, fArgs06, xysarr, ttt, ddx, ddy, opt1);
        [st]  = iau06era (jdut1 );
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

    rtirs = st'*nut'*prec'*reci;
    %cross(omegaearth,rtirs)
    vtirs = st'*nut'*prec'*veci - cross( omegaearth,rtirs );

    temp = cross(omegaearth,rtirs);
    atirs = st'*nut'*prec'*aeci - cross(omegaearth,temp) ...
        - 2.0*cross(omegaearth,vtirs);

    rtirs  = st'*nut'*prec'*reci;

    vtirs  = st'*nut'*prec'*veci - cross( omegaearth,rtirs );

    temp  = cross(omegaearth,rtirs);




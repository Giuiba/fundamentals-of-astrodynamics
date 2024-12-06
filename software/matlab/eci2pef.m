% ----------------------------------------------------------------------------
%
%                           function eci2pef
%
%  this function transforms a vector from the mean equator, mean equinox frame
%    (j2000), to the pseudo earth fixed frame (pef).
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
%    rpef        - position pseudo earth fixed    km
%    vpef        - velocity pseudo earth fixed    km/s
%    apef        - acceleration pseudo earth fixedkm/s2
%
%  locals        :
%    prec        - matrix for eci - mod
%    deltapsi    - nutation angle                 rad
%    trueeps     - true obliquity of the ecliptic rad
%    meaneps     - mean obliquity of the ecliptic rad
%    omega       -                                rad
%    nut         - matrix for mod - tod
%    st          - matrix for tod - pef
%    stdot       - matrix for tod - pef rate
%
%  coupling      :
%   precess      - rotation for precession        mod - eci
%   nutation     - rotation for nutation          tod - mod
%   sidereal     - rotation for sidereal time     pef - tod
%
%  references    :
%    vallado       2001, 219, eq 3-65 to 3-66
%
% [rpef, vpef, apef] = eci2pef(reci, veci, aeci, iau80arr, ttt, jdut1, lod, eqeterms, ddpsi, ddeps)
% ----------------------------------------------------------------------------

function [rpef, vpef, apef] = eci2pef(reci, veci, aeci, iau80arr, ttt, jdut1, lod, eqeterms, ddpsi, ddeps)
    constastro;
    pnb = zeros(3,3);
    st = zeros(3,3);

    [fArgs] = fundarg(ttt, '80');

    [prec, psia, wa, ea, xa] = precess ( ttt, '80' );

    [deltapsi, trueeps, meaneps, nut] = nutation  (ttt, ddpsi, ddeps, iau80arr, fArgs);

    [st, stdot] = sidereal(jdut1, deltapsi, meaneps, fArgs(5), lod, eqeterms );

    thetasa= earthrot * (1.0  - lod/86400.0 );
    omegaearth = [0; 0; thetasa;];

    rpef = st'*nut'*prec'*reci;
    %cross(omegaearth,rpef)
    vpef = st'*nut'*prec'*veci - cross( omegaearth,rpef );

    temp = cross(omegaearth,rpef);
    apef = st'*nut'*prec'*aeci - cross(omegaearth,temp) ...
        - 2.0*cross(omegaearth,vpef);

    rpef  = st'*nut'*prec'*reci;

    vpef  = st'*nut'*prec'*veci - cross( omegaearth,rpef );

    temp  = cross(omegaearth,rpef);





% ----------------------------------------------------------------------------
%
%                           function tod2ecef
%
%  this function trsnforms a vector from the true equator of date
%  to an earth fixed (ITRF) frame.  the results take into account
%    the effects of sidereal time, and polar motion.
%
%  author        : david vallado                  719-573-2600   27 jun 2002
%
%
%  inputs          description                    range / units
%    rtod        - position vector tod            km
%    vtod        - velocity vector tod            km/s
%    atod        - acceleration vector tod        km/s2
%    ttt         - julian centuries of tt         centuries
%    jdut1       - julian date of ut1             days from 4713 bc
%    lod         - excess length of day           sec
%    xp          - polar motion coefficient       arc sec
%    yp          - polar motion coefficient       arc sec
%
%  outputs       :
%    recef       - position vector earth fixed    km
%    vecef       - velocity vector earth fixed    km/s
%    aecef       - acceleration vector earth fixedkm/s2
%
%  locals        :
%    st          - matrix for pef - tod
%    stdot       - matrix for pef - tod rate
%    pm          - matrix for ecef - pef
%
%  coupling      :
%   sidereal     - rotation for sidereal time     tod - pef
%   polarm       - rotation for polar motion      pef - ecef
%
%  references    :
%    vallado       2013, 223-229
%
% [recef, vecef, aecef] = tod2ecef  ( rtod, vtod, atod, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps )
% ----------------------------------------------------------------------------

function [recef, vecef, aecef] = tod2ecef  ( rtod, vtod, atod, iau80arr, jdut1, ttt, lod, xp, yp, eqeterms, ddpsi, ddeps )
    constastro;

    [fArgs] = fundarg(ttt, '80');

    [deltapsi, trueeps, meaneps, nut] = nutation  (ttt, ddpsi, ddeps, iau80arr, fArgs);

    [st, stdot] = sidereal(jdut1, deltapsi, meaneps, fArgs(5), lod, eqeterms, '80' );

    [pm] = polarm(xp, yp, ttt, '80');

    thetasa= earthrot * (1.0  - lod/86400.0 );
    omegaearth = [0; 0; thetasa;];

    rpef  = st'*rtod;
    recef = pm'*rpef;

    vpef  = st'*vtod - cross( omegaearth,rpef );
    vecef = pm'*vpef;

    temp  = cross(omegaearth,rpef);

    % two additional terms not needed if satellite is not on surface
    % of the Earth
    aecef = pm'*(st'*atod)- cross(omegaearth,temp) - 2.0*cross(omegaearth,vpef);


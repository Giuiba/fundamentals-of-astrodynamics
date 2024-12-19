
% ----------------------------------------------------------------------------
%
%                           function pef2ecef
%
%  this function trsnforms a vector from the true equator of date
%  to an earth fixed (ITRF) frame.  the results take into account
%    the effects of sidereal time, and polar motion.
%
%  author        : david vallado                  719-573-2600   27 jun 2002
%
%
%  inputs          description                    range / units
%    rpef        - position vector pef            km
%    vpef        - velocity vector pef            km/s
%    apef        - acceleration vector pef        km/s2
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
%    st          - matrix for pef - pef
%    stdot       - matrix for pef - pef rate
%    pm          - matrix for ecef - pef
%
%  coupling      :
%   sidereal     - rotation for sidereal time     pef - pef
%   polarm       - rotation for polar motion      pef - ecef
%
%  references    :
%    vallado       2013, 223-229
%
% [recef,vecef,aecef] = pef2ecef  ( rpef, vpef, apef), opt, ttt, xp, yp);
% ----------------------------------------------------------------------------

function [recef,vecef,aecef] = pef2ecef  ( rpef, vpef, apef, opt, ttt, xp, yp)
    constastro;

    [pm] = polarm(xp, yp, ttt, opt);

    recef = pm'*rpef;

    vecef = pm'*vpef;


    % two additional terms not needed if satellite is not on surface
    % of the Earth
    aecef = pm'*apef;


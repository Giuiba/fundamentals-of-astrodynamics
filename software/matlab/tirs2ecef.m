%
% ----------------------------------------------------------------------------
%
%                           function tirs2ecef
%
%  this function trsnforms a vector from the tirs frame
%  to an earth fixed (ITRF) frame.  the results take into account
%    the effects of  polar motion.
%
%  author        : david vallado                  719-573-2600   27 jun 2002
%
%
%  inputs          description                    range / units
%    rtirs        - position vector tirs            km
%    vtirs        - velocity vector tirs            km/s
%    atirs        - acceleration vector tirs        km/s2
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
%    st          - matrix for tirs - tirs
%    stdot       - matrix for tirs - tirs rate
%    pm          - matrix for ecef - tirs
%
%  coupling      :
%   sidereal     - rotation for sidereal time     tirs - tirs
%   polarm       - rotation for polar motion      tirs - ecef
%
%  references    :
%    vallado       2013, 223-229
%
% [recef, vecef, aecef] = tirs2ecef( rtirs, vtirs, atirs, ttt, xp, yp)
% ----------------------------------------------------------------------------

function [recef, vecef, aecef] = tirs2ecef( rtirs, vtirs, atirs, ttt, xp, yp)
    constastro;

    [pm] = polarm(xp, yp, ttt, '06');

    recef = pm'*rtirs;

    vecef = pm'*vtirs;


    % two additional terms not needed if satellite is not on surface
    % of the Earth
    aecef = pm'*atirs;


% ----------------------------------------------------------------------------
%
%                           function eci2tod
%
%  this function transforms a vector from the mean equator mean equinox frame
%    (j2000) to the true equator true equinox of date (tod).
%
%  author        : david vallado                  719-573-2600   25 jun 2002
%
%  revisions
%    vallado     - consolidate with iau 2000                     14 feb 2005
%
%  inputs          description                    range / units
%    reci        - position vector eci            km
%    veci        - velocity vector eci            km/s
%    aeci        - acceleration vector eci        km/s2
%    ttt         - julian centuries of tt         centuries
%    ddpsi       - correction for iau2000         rad
%    ddeps       - correction for iau2000         rad
%
%  outputs       :
%    rtod        - position vector of date
%                    true equator, true equinox   km
%    vtod        - velocity vector of date
%                    true equator, true equinox   km/s
%    atod        - acceleration vector of date
%                    true equator, true equinox   km/s2
%
%  locals        :
%    prec        - matrix for eci - mod
%    deltapsi    - nutation angle                 rad
%    trueeps     - true obliquity of the ecliptic rad
%    meaneps     - mean obliquity of the ecliptic rad
%    omega       -                                rad
%    nut         - matrix for mod - tod
%
%  coupling      :
%   precess      - rotation for precession        mod - eci
%   nutation     - rotation for nutation          tod - mod
%
%  references    :
%    vallado       2001, 216-219, eq 3-654
%
% [rtod, vtod, atod] = eci2tod(reci, veci, aeci, iau80arr, fArgs, ttt, ddpsi, ddeps, ddx, ddy )
% ----------------------------------------------------------------------------

function [rtod, vtod, atod] = eci2tod(reci, veci, aeci, iau80arr, fArgs, ttt, ddpsi, ddeps)

    showit = 'n';

    [prec,psia,wa,ea,xa] = precess ( ttt, '80' );

    [deltapsi, trueeps, meaneps, nut] = nutation  (ttt, ddpsi, ddeps, iau80arr, fArgs);

    if showit == 'y'
        conv = pi / (180.0*3600.0);
        fprintf(1,'dpsi %11.7f trueeps %11.7f mean eps %11.7f deltaeps %11.7f \n', deltapsi/conv, trueeps/conv, meaneps/conv, (trueeps-meaneps)/conv);
        fprintf(1,'nut iau 76 \n');
        fprintf(1,'%20.14f %20.14f %20.14f \n',nut );
    end

    rtod=nut'*prec'*reci;

    vtod=nut'*prec'*veci;

    atod=nut'*prec'*aeci;



%
% ----------------------------------------------------------------------------
%
%                           function pef2eci
%
%  this function trsnforms a vector from the pseudo earth fixed frame (pef),
%    to the mean equator mean equinox (j2000) frame.
%
%  author        : david vallado                  719-573-2600   25 jun 2002
%
%  revisions
%    vallado     - add terms for ast calculation                 30 sep 2002
%    vallado     - consolidate with iau 2000                     14 feb 2005
%
%  inputs          description                    range / units
%    rpef        - position pseudo earth fixed    km
%    vpef        - velocity pseudo earth fixed    km/s
%    apef        - acceleration pseudo earth fixedkm/s2
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
%    st          - matrix for tod - pef
%    stdot       - matrix for tod - pef rate
%
%  coupling      :
%   precess      - rotation for precession        mod - eci
%   nutation     - rotation for nutation          tod - mod
%   sidereal     - rotation for sidereal time     pef - tod
%
%  references    :
%    vallado       2001, 219-220, eq 3-68
%
% [reci, veci, aeci] = pef2eci(rpef, vpef, apef, ttt, jdut1, lod, opt1, iau80arr, fArgs, eqeterms, ddpsi, ddeps, iau06arr, fArgs06, ddx, ddy )
% ----------------------------------------------------------------------------

function [reci, veci, aeci] = pef2eci(rpef, vpef, apef, ttt, jdut1, lod, opt1, iau80arr, fArgs, eqeterms, ddpsi, ddeps, iau06arr, fArgs06, ddx, ddy )
constastro;
        pnb = zeros(3,3);
        st = zeros(3,3);
 
       [prec, psia, wa, ea, xa] = precess ( ttt, opt1 );

          if opt1 == '80'
            [deltapsi, trueeps, meaneps, nut] = nutation  (ttt, ddpsi, ddeps, iau80arr, fArgs);
            [st, stdot] = sidereal(jdut1, deltapsi, meaneps, fArgs(5), lod, eqeterms );
        else
            % ---- ceo based, iau2006
            if opt1 == '06c'
               [x, y, s, pnb] = iau06xys (iau06arr, fArgs, 's', ttt, ddx, ddy);
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
        end


        thetasa= earthrot * (1.0  - lod/86400.0 );
        omegaearth = [0; 0; thetasa;];

        reci = prec*nut*st*rpef;

        veci = prec*nut*st*(vpef + cross(omegaearth,rpef));

        temp = cross(omegaearth,rpef);
        aeci = prec*nut*st*(apef + cross(omegaearth,temp) ...
               + 2.0*cross(omegaearth,vpef));


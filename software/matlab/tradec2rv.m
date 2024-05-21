% ------------------------------------------------------------------------------
%
%                           function tradec2rv
%
%  this function converts range, topcentric right acension, declination, and rates
%    into geocentric equatorial (eci) position and velocity vectors.  
%
%  author        : david vallado           davallado@gmail.com    4 nov 2022
%
%  revisions
%
%  inputs          description                              range / units
%    rho         - satellite range from site                km
%    trtasc      - topocentric right ascension              0.0 to 2pi rad
%    tdecl       - topocentric declination                  -pi/2 to pi/2 rad
%    drho        - range rate                               km/s
%    dtrtasc     - topocentric rtasc rate                   rad / s
%    dtdecl      - topocentric decl rate                    rad / s
%    rseci       - eci site position vector                 km
%    lod         - excess length of day                     sec
%
%  outputs       :
%    reci        - eci position vector                      km
%    veci        - eci velocity vector                      km/s
%
%  locals        :
%    rhov        - eci range vector from site               km
%    drhov       - eci velocity vector from site            km / s
%    omegaearth  - eci earth's rotation rate vec            rad / s
%    tempvec     - temporary vector
%    latgc       - site geocentric latitude                 rad
%
%  coupling      :
%    mag         - magnitude of a vector
%    rot3        - rotation about the 3rd axis
%    rot2        - rotation about the 2nd axis
%
%  references    :
%    vallado       2022, 254, eq 4-1 to 4-2
%
% [reci, veci] = tradec2rv(trr, trtasc, tdecl, tdrr, tdrtasc, tddecl, rseci, vseci)
% ------------------------------------------------------------------------------
                                          
function [reci, veci] = tradec2rv(trr, trtasc, tdecl, tdrr, tdrtasc, tddecl, rseci, vseci)
    constmath;
    
    % --------  calculate topocentric slant range vectors ------------------
    rhov(1) = trr * cos(tdecl) * cos(trtasc);
    rhov(2) = trr * cos(tdecl) * sin(trtasc);
    rhov(3) = trr * sin(tdecl);

    drhov(1) = tdrr * cos(tdecl) * cos(trtasc) - ...
        trr * sin(tdecl) * cos(trtasc) * tddecl - ...
        trr * cos(tdecl) * sin(trtasc) * tdrtasc;
    drhov(2) = tdrr * cos(tdecl) * sin(trtasc) - ...
        trr * sin(tdecl) * sin(trtasc) * tddecl + ...
        trr * cos(tdecl) * cos(trtasc) * tdrtasc;
    drhov(3) = tdrr * sin(tdecl) + trr * cos(tdecl) * tddecl;

    % ------ find eci range vector from site to satellite ------
    reci = rhov + rseci;
    veci = drhov + vseci;
    
    end  % tradec2rv


% ------------------------------------------------------------------------------
%
%                           function gc2gd
%
%  this function converts from geodetic to geocentric latitude for positions
%    on the surface of the earth.  notice that (1-f) squared = 1-esqrd.
%
%  author        : david vallado                  719-573-2600   21 jun 2002
%
%  revisions
%                -
%
%  inputs          description                    range / units
%    latgd       - geodetic latitude               -pi/2 to pi/2 rad
%
%  outputs       :
%    latgc       - geocentric latitude             -pi/2 to pi/2 rad
%
%  locals        :
%    none.
%
%  coupling      :
%    none.
%
%  references    :
%    vallado       2022, 142, eq 3-11
%
% [latgd] = gc2gd ( latgc );
% ------------------------------------------------------------------------------

function [latgd] = gc2gd ( latgc );

        eesqrd = 0.006694385000;     % eccentricity of earth sqrd

        % -------------------------  implementation   -----------------
        latgd= atan( tan(latgc)/(1.0  - eesqrd) );


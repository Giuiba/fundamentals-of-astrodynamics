% -----------------------------------------------------------------------------
%
%                           function lstime
%
%  this function finds the local sidereal time at a given location.  gst is from iau-82.
%
%  author        : david vallado                  719-573-2600   27 may 2002
%
%  revisions
%                -
%
%  inputs          description                    range / units
%    lon         - site longitude (west -)        -2pi to 2pi rad
%    jdut1       - julian date of ut1             days from 4713 bc
%
%  outputs       :
%    lst         - local sidereal time            0.0 to 2pi rad
%    gst         - greenwich sidereal time        0.0 to 2pi rad
%
%  locals        :
%    none.
%
%  coupling      :
%    gstime        finds the greenwich sidereal time
%
%  references    :
%    vallado       2022, 190, Alg 15, ex 3-5
%
% [lst,gst] = lstime ( lon, jdut1 );
% -----------------------------------------------------------------------------

function [lst,gst] = lstime ( lon, jdut1 );

        twopi  = 2.0*pi;

        % ------------------------  implementation   ------------------
        [gst] = gstime( jdut1 );
        lst = lon + gst;

        % ----------------------- check quadrants ---------------------
        lst = rem( lst,twopi );
        if ( lst < 0.0 )
            lst= lst + twopi;
          end


% -----------------------------------------------------------------------------
%
%                           function daylight
%
%  this function finds the dates for switiching to daylight savings time in
%    a given year. The date is set as the 2nd sunday in march and the 1st
%    sunday in november. The DST dates are adjusted -10hr to get 0200, -Zone to get
%    the local time zone, and -1.0hr to process the stop because the local time is
%    on DST before a stop.
%
%  Author        : David Vallado                  719-573-2600   17 Mar 2007
%
%  Inputs          Description                    Range / Units
%    Year        - Year                           1900 .. 2100
%    Lon         - SITE longitude (WEST -)        -2Pi to 2Pi rad
%
%  Outputs       :
%    StartDay    - Day in April when DST begins   1 .. 28,29,30,31
%    StopDay     - Day in October when DST ends   1 .. 28,29,30,31
%
%  Locals        :
%    DW          - Day of the week                1 .. 7
%    JDStartDST  - Julian date of start           Days from 4713 BC
%    JDStopDST   - Julian date of stop            Days from 4713 BC
%    Zone        - Time zone of site. Default
%                  of 0.0 gives Greenwich         hrs
%
%  coupling      :
%    jday        - find the julian date
%
%  references    :
%    vallado       2007, 188
%
% [startday,stopday,jdstartdst,jdstopdst] = daylight(year,lon);
% -----------------------------------------------------------------------------

function [startday,stopday,jdstartdst,jdstopdst] = daylight(year,lon);

        rad2deg = 180.0/pi;

        % ------------------------  implementation   ------------------
        zone = floor(lon*rad2deg/15.0);
        if zone > 0.0
            zone = zone - 24;
        end
        if year < 2007
           startday= 0;
            dw = 0;
            while ((dw ~= 1) && (startday ~= 8)) % 1 is sunday
                  startday = startday + 1;
                  [jdstartdst,jdfrac] = jday( year,4,startday,12,0,0.0 );
                  jdstartdst = jdstartdst + jdfrac;
                  dw= floor( jdstartdst - 7 * floor( (jdstartdst+1)/7 ) + 2 );
            end
            jdstartdst= jdstartdst + (-10.0-zone)/24.0;   % set to 0200 utc

            dw = 0;
            stopday= 32;
            while ((dw ~= 1) && (stopday ~= 24)) % 1 is sunday
                  stopday = stopday - 1;
                  [jdstopdst,jdfrac] = jday( year,10,stopday,12,0,0.0 );
                  jdstopdst = jdstopdst + jdfrac;
                  dw = floor( jdstopdst - 7 * floor( (jdstopdst+1)/7 ) + 2 );
            end
            jdstopdst = jdstopdst + (-10.0-zone)/24.0;   % set to 0200 utc
        else
            startday= 7;
            dw = 0;
            while ((dw ~= 1) && (startday ~= 15)) % 1 is sunday
                  startday = startday + 1;
                  [jdstartdst,jdfrac] = jday( year,3,startday,12,0,0.0 );
                  jdstartdst = jdstartdst + jdfrac;
                  dw= floor( jdstartdst - 7 * floor( (jdstartdst+1)/7 ) + 2 );
            end
            jdstartdst= jdstartdst + (-10.0-zone)/24.0;   % set to 0200 utc

            dw = 0;
            stopday= 0;
            while ((dw ~= 1) && (stopday ~= 8)) % 1 is sunday
                  stopday = stopday + 1;
                  [jdstopdst, jdfrac] = jday( year,11,stopday,12,0,0.0 );
                  jdstopdst = jdstopdst + jdfrac;
                  dw = floor( jdstopdst - 7 * floor( (jdstopdst+1)/7 ) + 2 );
            end
            jdstopdst = jdstopdst + (-10.0-zone)/24.0;   % set to 0200 utc
        end;


% ------------------------------------------------------------------------------
%
%                              Ex5_1.m
%
%  this file demonstrates example 5-1.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

    constmath;
    
    conv = pi / (180*3600);
    timezone = 0;

    year = 2006;  % need UTC that will give TDT on the 2 Apr 0 hr
    mon = 4;
    day = 1;
    hr = 23;
    minute = 58;
    second = 54.816;
    [jd, jdfrac] = jday(year, mon, day, hr, minute, second);
    fprintf(1,'jd  %11.9f \n',jd+jdfrac );
    dat = 33;
    dut1 = 0.2653628;

    [ut1, tut1, jdut1,jdut1frac, utc, tai, tt, ttt, jdtt,jdttfrac, tdb, ttdb, jdtdb,jdtdbfrac ] ...
        = convtime ( year, mon, day, hr, minute, second, timezone, dut1, dat );
    fprintf(1,'input data \n\n');
    fprintf(1,' year %5i ',year);
    fprintf(1,' mon %4i ',mon);
    fprintf(1,' day %3i ',day);
    fprintf(1,' %3i:%2i:%8.6f\n ',hr,minute,second );
    fprintf(1,' dut1 %8.6f s',dut1);
    fprintf(1,' dat %3i s',dat);

    fprintf(1,'tt  %8.6f ttt  %16.12f jdtt  %18.11f ',tt,ttt,jdtt );
    [h,m,s] = sec2hms( tt );
    fprintf(1,'hms %3i %3i %8.6f \n',h,m,s);

    [rsun,rtasc,decl] = sun ( jd+jdfrac );
    fprintf(1,'sun  rtasc %14.6f deg decl %14.6f deg\n',rtasc*rad,decl*rad );
    fprintf(1,'sun newTOD %11.9f%11.9f%11.9f au\n',rsun );
    fprintf(1,'sun newTOD %14.4f%14.4f%14.4f km\n',rsun*149597870.0 );

    rsunaa = [0.9775113 0.1911521  0.0828717]*149597870.0; % astronomical alm value into km
    fprintf(1,'rs almanac  ICRF %11.9f %11.9f %11.9f km \n',rsunaa);
    %rs aa ICRF 146233608.380930990 28595947.006026998 12397429.803279001 km 
    % from jpl de430 (icrf) ephemerides are centered on jdtdb
    %   2006  4  2          146233601.8528      28595943.3080      12397428.8371     149518194.6330  1.0010661  
    %   2006  4  2           187657.2460        286860.8848        155666.9298
    fprintf(1,'rs jplde430 ICRF 146233601.8528      28595943.3080      12397428.8371   km \n\n');

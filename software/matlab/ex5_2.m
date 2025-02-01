% ------------------------------------------------------------------------------
%
%                              Ex5_2.m
%
%  this file demonstrates example 5-2.
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

    % --------  sun         - sun rise set
    [jd,jdfrac] = jday( 1996, 3, 23, 0, 0, 0.00 );
    latgd = 40.0/rad;
    lon = 0.00 / rad;
    whichkind = 's';

    [utsunrise,utsunset,error] = sunriset(jd+jdfrac,latgd,lon,whichkind);

    fprintf(1,'sun sunrise %14.4f  %14.4f  sunset %14.4f %14.4f \n',utsunrise, (utsunrise-floor(utsunrise))*60, utsunset, (utsunset-floor(utsunset))*60);


    [jd,jdfrac] = jday( 2011, 6, 25, 0, 0, 0.00 );
    latgd = 40.9/rad;
    lon = -74.3 / rad;
    whichkind = 's';

    [utsunrise,utsunset,error] = sunriset(jd+jdfrac,latgd,lon,whichkind);

    fprintf(1,'sun sunrise %14.4f  %14.4f  sunset %14.4f %14.4f \n',utsunrise, (utsunrise-floor(utsunrise))*60, utsunset, (utsunset-floor(utsunset))*60);


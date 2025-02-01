% ------------------------------------------------------------------------------
%
%                              Ex3_4.m
%
%  this file demonstrates example 3-4.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

    % -------- jday         - find julian date
    year = 1996;
    mon = 10;
    day = 26;
    hr  = 14;
    minute = 20;
    secs = 0.00;
    fprintf(1,'\n--------jday test \n' );
    fprintf(1,'year %4i ',year);
    fprintf(1,'mon %4i ',mon);
    fprintf(1,'day %3i ',day);
    fprintf(1,'hr %3i:%2i:%8.6f\n ',hr,minute,secs );

    [jd, jdfrac]= jday(year,mon,day,hr,minute,secs);
    fprintf(1,'jd %18.10f  %18.10f   %18.10f \n\n\n',jd, jdfrac, jd + jdfrac);

    

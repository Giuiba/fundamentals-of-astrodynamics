% ------------------------------------------------------------------------------
%
%                              Ex3_1.m
%
%  this file demonstrates example 3-1.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

    re = 6378.1363;
    rad = 180.0/pi;
    flat       = 1.0/298.257223563;
    eccearth = sqrt(2.0*flat - flat^2)
    eccearthsqrd = eccearth^2

    % -------------------------  implementation   -----------------
    latgd = 39.586667/rad;
    lon   = -105.640/rad;
    alt   = 4.3476672;  % km
    sinlat = sin( latgd );

    % ------  find rdel and rk components of site vector  ---------
    cearth= re / sqrt( 1.0 - ( eccearthsqrd*sinlat*sinlat ) );
    rdel  = ( cearth + alt )*cos( latgd );
    rk    = ( (1.0-eccearthsqrd)*cearth + alt )*sinlat;

    fprintf(1,'c %16.8f s %11.8f km \n',cearth, cearth*(1.0-eccearthsqrd) );
    
    fprintf(1,'rdelta %16.8f rk %11.8f km \n',rdel, rk );


% ------------------------------------------------------------------------------
%
%                              Ex2_3.m
%
%  this file demonstrates example 2-3.
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
    constastro;

    % --------  newtonm      - find hyperbolic and true anomaly given ecc and mean anomaly
    ecc = 2.4;
    m = 235.4/rad;

    fprintf(1,'               m                e           nu           h   \n');

    [h ,nu]= newtonm(ecc, m);
    
    fprintf(1,'newm  %14.8f %14.8f %14.8f %14.8f  rad \n',m, ecc, nu, h );
    fprintf(1,'newm  %14.8f %14.8f %14.8f %14.8f  deg \n',m*rad, ecc, nu*rad, h*rad );


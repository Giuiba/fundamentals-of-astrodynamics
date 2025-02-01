% ------------------------------------------------------------------------------
%
%                              Ex6_15.m
%
%  this file demonstrates example 6-15.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

    constastro;
    
    fprintf(1,'-------------------- problem ex 6-14 \n');
    ro = [0.0 0.0 0.0];
    vo = [-0.1 -0.04 -0.02];

    ralt = 590.0;
    dtsec = 0.0;

    [rint, vint] = hillsr( ro,vo, ralt,dtsec );

    fprintf(1,'initial interceptor position \n');
    fprintf(1,' r  %11.7f  %11.7f  %11.7f \n',rint);
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',vint);


    dtsec = 300.0;
    [rint, vint] = hillsr( ro,vo, ralt,dtsec );

    fprintf(1,' r  %11.7f  %11.7f  %11.7f \n',rint);
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',vint);

    dtsec = 1200.0;
    [rint, vint] = hillsr( ro,vo, ralt,dtsec );

    fprintf(1,' r  %11.7f  %11.7f  %11.7f \n',rint);
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',vint);


    dtsec = 600.0;
    [rint, vint] = hillsr( ro,vo, ralt,dtsec );


    fprintf(1,'-------------------- problem ex 6-15 \n');
    fprintf(1,'initial interceptor position \n');
    fprintf(1,' r  %11.7f  %11.7f  %11.7f \n',rint);
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',vint);

    dtsec = 300.0;
    [v] = hillsv( rint, ralt,dtsec );
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',v);

    dtsec = 900.0;
    [v] = hillsv( rint, ralt,dtsec );
    fprintf(1,' v  %11.7f  %11.7f  %11.7f \n\n',v);



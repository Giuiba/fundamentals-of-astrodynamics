%     -----------------------------------------------------------------
%
%                              Ex7_5.m
%
%  this file implements example 7-5.note that the intialization has changed
%  from what is shown in the book, and the example there. The empiracle
%  formula seems to give better results for the intiial evaluation, so it's
%  used here. the book values of psi = 0.0 is not used here.
%
%                          companion code for
%             fundamentals of astrodynamics and applications
%                                 2020
%                            by david vallado
%
%     (w) 719-573-2600, email dvallado@agi.com
%
%     *****************************************************************
%
%  current :
%            26 may 20  david vallado
%                         separate from temp codes.
%  changes :
%            13 feb 07  david vallado
%                         original baseline
%     *****************************************************************

    fid = 1;
    directory = 'd:\codes\library\matlab\';
    outfile = fopen(strcat(directory,'tlambfig.out'), 'wt');

    constastro;

    % ---------------------------- book tests -----------------------------
    r1 = [ 2.500000,    0.000000 ,   0.000000]*re;
    r2 = [ 1.9151111,   1.6069690,   0.000000]*re;

    % original orbit, assume circular
    v1 = [0 0 0];
    fprintf(1,'\n-------- lambert test book pg 497 short way \n' );
    v1(2) = sqrt(mu/r1(1));
    ang = atan(r2(2)/r2(1));
    v2 = [-sqrt(mu/r2(2))*cos(ang);sqrt(mu/r2(1))*sin(ang);0.0];
    fprintf(1,'\n v1 %16.8f%16.8f%16.8f\n',v1 );
    fprintf(1,'\n v2 %16.8f%16.8f%16.8f\n',v2 );
    dtsec = 76.0*60.0;

    % now show all the cases
    magr1 = mag(r1);
    magr2 = mag(r2);

    % this value stays constant in all calcs, vara changes with df
    cosdeltanu = dot(r1,r2) / (magr1*magr2);

    dm = 'S';
    de = 'L';
    nrev = 0;
            [kbi, tof] = lambertumins( r1, r2, 1, 'S' ) ;   
    tbiSu(1, 1) = kbi;
    tbiSu(1, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 2, 'S' ) ;   
    tbiSu(2, 1) = kbi;
    tbiSu(2, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 3, 'S' ) ;   
    tbiSu(3, 1) = kbi;
    tbiSu(3, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 4, 'S' ) ;   
    tbiSu(4, 1) = kbi;
    tbiSu(4, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 5, 'S' ) ;   
    tbiSu(5, 1) = kbi;
    tbiSu(5, 2) = tof;

            [kbi, tof] = lambertumins( r1, r2, 1, 'L' ) ;   
    tbiLu(1, 1) = kbi;
    tbiLu(1, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 2, 'L' ) ;   
    tbiLu(2, 1) = kbi;
    tbiLu(2, 2) = tof;
           [kbi, tof] = lambertumins( r1, r2, 3, 'L' ) ;   
    tbiLu(3, 1) = kbi;
    tbiLu(3, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 4, 'L' ) ;   
    tbiLu(4, 1) = kbi;
    tbiLu(4, 2) = tof;
            [kbi, tof] = lambertumins( r1, r2, 5, 'L' ) ;   
    tbiLu(5, 1) = kbi;
    tbiLu(5, 2) = tof;
    fprintf(1,' r1 %16.8f%16.8f%16.8f\n',r1 );
    fprintf(1,' r2 %16.8f%16.8f%16.8f\n',r2 );
    fprintf(1,'From universal variables \n%11.7f %11.7f s \n',tbiSu(1,1),tbiSu(1,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiSu(2,1),tbiSu(2,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiSu(3,1),tbiSu(3,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiSu(4,1),tbiSu(4,2));
    fprintf(1,'%11.7f %11.7f s \n\n',tbiSu(5,1),tbiSu(5,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiLu(1,1),tbiLu(1,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiLu(2,1),tbiLu(2,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiLu(3,1),tbiLu(3,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiLu(4,1),tbiLu(4,2));
    fprintf(1,'%11.7f %11.7f s \n',tbiLu(5,1),tbiLu(5,2));

    [minenergyv, aminenergy, tminenergy, tminabs] = lambertmin ( r1, r2, 'L', 0 );
    fprintf(1,' minenergyv %16.8f %16.8f %16.8f a %11.7f  dt %11.7f  %11.7f \n', minenergyv, aminenergy, tminenergy, tminabs );

    [minenergyv, aminenergy, tminenergy, tminabs] = lambertmin ( r1, r2, 'H', 0 );
    fprintf(1,' minenergyv %16.8f %16.8f %16.8f a %11.7f  dt %11.7f  %11.7f \n', minenergyv, aminenergy, tminenergy, tminabs );


    dtwait = 0.0;
    fprintf(1,'\n-------- lambertu test \n' );
    [v1t, v2t, errorl] = lambertu ( r1, r2, v1, 'S', de, nrev, dtsec, 0.0, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    
    
    % run the 6 cases
    fprintf(1,' ------------- new time to accomodate 1 rev \n');
    dtsec = 21000.0;
    fprintf(1,' TEST ------------------ S  L  0 rev \n');
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'S', 'L', 0, dtsec, 0.0, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,' TEST ------------------ L  H  0 rev \n');
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'L', 'H', 0, dtsec, 0.0, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,' TEST ------------------ S  L  1 rev \n');
    [kbi, tof] = lambertumins( r1, r2, 1, 'S' ) ;   
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'S', 'L', 1, dtsec, kbi, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,' TEST ------------------ S  H  1 rev \n');
    [kbi, tof] = lambertumins( r1, r2, 1, 'S' ) ;   
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'S', 'H', 1, dtsec, kbi, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,' TEST ------------------ L  L  1 rev \n');
    [kbi, tof] = lambertumins( r1, r2, 1, 'L' ) ;   
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'L', 'L', 1, dtsec, kbi, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,' TEST ------------------ L  H  1 rev \n');
    [kbi, tof] = lambertumins( r1, r2, 1, 'L' ) ;   
    [v1t, v2t, errorl] = lambertu ( r1,  r2, v1, 'L', 'H', 1, dtsec, kbi, fid );
    fprintf(1,' v1t %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2t %16.8f%16.8f%16.8f\n',v2t );

    fprintf(1,'\n-------- lambertb test \n' );
    [v1t, v2t, errorl] = lambertb ( r1,  r2, v1, 'L', 'L', 1, dtsec );
    fprintf(1,' v1dv %16.8f%16.8f%16.8f\n',v1t );
    fprintf(1,' v2dv %16.8f%16.8f%16.8f\n',v2t );







    %
    %  testall
%
% test all the matlab routines
% ths allows comparison withother langugaes (c#, c++, etc)
%
%

%todo - all indicies have to be +1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


%exampleEnumType = struct('zero',0, 'one',1, 'two',2);


function fid = testall

    testnum = -10;

    if (testnum == -10)
        optstart = 1;
        optstop = 102;
    else
        optstart = testnum;
        optstop = testnum;
    end

    fid = 1;
    directory = 'D:\Codes\LIBRARY\matlab\';
    fid = fopen(strcat(directory,'testallm.out'), 'wt');

    for opt = optstart:optstop
        fprintf(1,'\n\n=================================== Case %4i =======================================', opt);

        switch opt
            case 1
                testvecouter();
            case 2
                testmatadd();
            case 3
                testmatsub();
            case 4
                testmatmult();
            case 5
                testmattrans();
            case 6
                testmattransx();
            case 7
                testmatinverse();
            case 8
                testdeterminant();
            case 9
                testcholesky();
            case 10
                testposvelcov2pts();
            case 11
                testposcov2pts();
            case 12
                testremakecovpv();
            case 13
                testremakecovp();
            case 14
                testmatequal();
            case 15
                testmatscale();
            case 16
                testunit();
            case 17
                testmag();
            case 18
                testcross();
            case 19
                testdot();
            case 20
                testangle();
            case 21
                testasinh();
            case 22
                testcot();
            case 23
                testacosh();
            case 24
                testaddvec();
            case 25
                testPercentile();
            case 26
                testrot1();
            case 27
                testrot2();
            case 28
                testrot3();
            case 29
                testfactorial();
            case 30
                testcubicspl();
            case 31
                testcubic();
            case 32
                testcubicinterp();
            case 33
                testquadratic();
            case 34
                testconvertMonth();
            case 35
                testjday();
            case 36
                testdays2mdhms();
            case 37
                testinvjday();
            case 38
                % tests eop, spw, and fk5 iau80
                testiau80in();
            case 39
                testfundarg();
            case 40
                testprecess();
            case 41
                testnutation();
            case 42
                testnutationqmod();
            case 43
                testsidereal();
            case 44
                testpolarm();
            case 45
                testgstime();
            case 46
                testlstime();
            case 47
                testhms_sec();
            case 48
                testhms_ut();
            case 49
                testhms_rad();
            case 50
                testdms_rad();
            case 51
                testeci_ecef();
            case 52
                testtod2ecef();
            case 53
                testteme_ecef();
            case 54
                testteme_eci();
            case 55
                testqmod2ecef();
            case 56
                testcsm2efg();
            case 57
                testrv_elatlon();
            case 58
                testrv2radec();
            case 59
                testrv_razel();
            case 60
                testrv_tradec();
            case 61
                testrvsez_razel();
            case 62
                testrv2rsw();
            case 63
                testrv2pqw();
            case 64
                testrv2coe();
            case 65
                testcoe2rv();
            case 66
                testlon2nu();
            case 67
                testnewtonmx();
            case 68
                testnewtonm();
            case 69
                testnewtonnu();
            case 70
                testfindc2c3();
            case 71
                testfindfandg();
            case 72
                testcheckhitearth();
                testcheckhitearthc();
            case 73
                testgibbs();
                testhgibbs();
            case 74
                % in sln directory, testall-Angles.out
                testangles();
                % D\faabook\current\excel\testgeo.out for ch9 plot
                testgeo();
            case 75
                testlambertumins();
                testlambertminT();
            case 76
                testlambhodograph();
            case 77
                testlambertbattin();
            case 78
                testeq2rv();
            case 79
                testrv2eq();
            case 80
                directoryx = 'd\codes\library\matlab\';
                % book example, simple
                testlambertuniv();
                fprintf(1,'lambert envelope test case results written to %s testall.out ', directoryx);

                % old approach? yes...
                testAllMoving();
                fprintf(1,'lambert all moving test case results written to  %s tlambertAllx.out ', directoryx);
                fprintf(1,'lambert all moving test case results written to  %s tlamb3dx.out ', directoryx);

                % envelope testing
                testAll();
                fprintf(1,'lambert envelope test case results written to %s testall.out ', directoryx);

                % known problem cases testall-lambertknown.out in sln directory
                testknowncases();
                fprintf(1,'lambert known test case results written to %s testall-lambertknown.out ', directoryx);
            case 81
                testradecgeo2azel();
            case 82
                testijk2ll();
            case 83
                testgd2gc();
            case 84
                testsite();
            case 85
                testsun();
            case 86
                testmoon();
            case 87
                testkepler();
            case 88
                % mean
                testcovct2clmean();
            case 89
                % true
                testcovct2cltrue();
            case 90
                testhill();
            case 91
            case 92
                testcovct2rsw();
                testcovct2ntw();
                testcovcl2eq('truea');
                testcovcl2eq('truen');
                testcovcl2eq('meana');
                testcovcl2eq('meann');
                testcovct2eq('truea');
                testcovct2eq('truen');
                testcovct2eq('meana');
                testcovct2eq('meann');
                testcovct2fl('latlon');
                testcovct2fl('radec');
            case 93
            case 94
            case 95
            case 96
                testcovct2rsw();
            case 97
                testcovct2ntw();
            case 98
                testsunmoonjpl();
            case 99
                testkp2ap();
            case 100
                testproporbit();
                directoryy = 'd\codes\library\matlab\';
                fprintf(1,'testproporbit (legendre) results written to %s legpoly.out ', directoryy);
                fprintf(1,'testproporbit (legendre) results written to %s legendreAcc.out ', directoryy);
            case 101
                %testsemianaly();
            case 102
                testazel2radec();
        end

    end % for

end  % runtests


function testvecouter()

    vec1 = [ 2.3, 4.7, -1.6 ];
    vec2 = [ 0.3, -0.7, 6.0 ];

    mat1 = vecouter(vec1, vec2, 3);

    fprintf(1,'vecout = %11.7f %11.7f %11.7f \n', mat1(1, 1), mat1(1, 2), mat1(1, 3));
    fprintf(1,'vecout = %11.7f %11.7f %11.7f \n', mat1(2, 1), mat1(2, 2), mat1(2, 3));
    fprintf(1,'vecout = %11.7f %11.7f %11.7f \n', mat1(3, 1), mat1(3, 2), mat1(3, 3));
end


function testmatadd()
    mat1 = [ 1.0,   2.0,   3.0 ;
        -1.1,   0.5,   2.0 ;
        -2.00,  4.00,  7.0 ];
    mat2 = [ 1.0,  1.4, 1.8 ;
        0.0,  2.6, -0.6 ;
        1.9,  0.1, 7.1  ];

    mat3 = mat1 + mat2;

    fprintf(1,'matadd = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'matadd = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'matadd = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end


function testmatsub()
    mat1 = [ 1.0,   2.0,   3.0 ;
        -1.1,   0.5,   2.0 ;
        -2.00,  4.00,  7.0 ];
    mat2 = [ 1.0,  1.4, 1.8 ;
        0.0,  2.6, -0.6 ;
        1.9,  0.1, 7.1  ];

    mat3 = mat1 - mat2;

    fprintf(1,'matsub = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'matsub = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'matsub = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end


function testmatmult()
    mat1 = [ 1.0,   2.0,   3.0 ;
        -1.1,   0.5,   2.0 ;
        -2.00,  4.00,  7.0 ];
    mat2 = [  1.0,  1.4 ;
        0.0,  2.6 ;
        1.9,  0.1  ];
    mat3 = mat1 * mat2;

    fprintf(1,'matmult = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'matmult = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'matmult = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end


function testmattrans()
    mat1 = [ 1.0,   2.0,   3.0 ;
        -1.1,   0.5,   2.0 ;
        -2.00,  4.00,  7.0 ];
    [mat3] = mat1';

    fprintf(1,'mattrans = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'mattrans = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'mattrans = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end

function testmattransx()
    mat1 = [ 1.0,   2.0,   3.0 ;
        -1.1,   0.5,   2.0 ;
        -2.00,  4.00,  7.0 ];

    mat3 = mat1';
end

function testmatinverse()
    % enter by COL!!!!!!!!!!!!!!
    mat1 = [ 3, 5, 6 ;  2, 0, 3  ; 1, 2, 8  ];
    matinv = matinverse(mat1, 3);

    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(1, 1), matinv(1, 2), matinv(1, 3));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(2, 1), matinv(2, 2), matinv(2, 3));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(3, 1), matinv(3, 2), matinv(3, 3));

    %Results: test before
    % 0.1016949    0.4745763 - 0.2542373
    % 0.2203390 - 0.3050847 - 0.0508475
    %- 0.0677966    0.0169492    0.1694915

    mat1 = [ 1, 3, 3  ; 1, 4, 3 ;  1, 3, 4  ];
    matinv = matinverse(mat1, 3);

    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(1, 1), matinv(1, 2), matinv(1, 3));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(2, 1), matinv(2, 2), matinv(2, 3));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f \n', matinv(3, 1), matinv(3, 2), matinv(3, 3));


    ata = [ 264603537.493561, 206266447.729262, 274546062925.826, -282848493891885, 362835957483807, -4.3758299682612E+17 ;...
        206266447.729262, 160790924.64848, 214016946538.904, -220488942186083, 282841585443473, -3.41109159752805E+17 ;...
        274546062925.826, 214016946538.904, 284862180536440, -2.93476576836794E+17, 3.76469583735348E+17, -4.54025256502168E+20;...
        -282848493891885, -220488942186083, -2.93476576836794E+17, 3.02351477439543E+20, -3.87854240635812E+20, 4.67755241586584E+23;...
        362835957483807, 282841585443473, 3.76469583735348E+17, -3.87854240635812E+20, 4.97536553328938E+20, -6.00032966815125E+23;...
        -4.3758299682612E+17, -3.41109159752805E+17, -4.54025256502168E+20, 4.67755241586584E+23, -6.00032966815125E+23, 7.23644441510866E+26 ];

    matinv = matinverse(ata, 6);

    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(1, 1), matinv(1, 2), matinv(1, 3), matinv(1, 4), matinv(1, 5), matinv(1, 6));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(2, 1), matinv(2, 2), matinv(2, 3), matinv(2, 4), matinv(2, 5), matinv(2, 6));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(3, 1), matinv(3, 2), matinv(3, 3), matinv(3, 4), matinv(3, 5), matinv(3, 6));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(4, 1), matinv(4, 2), matinv(4, 3), matinv(4, 4), matinv(4, 5), matinv(4, 6));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(5, 1), matinv(5, 2), matinv(5, 3), matinv(5, 4), matinv(5, 5), matinv(5, 6));
    fprintf(1,'matinv = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', matinv(6, 1), matinv(6, 2), matinv(6, 3), matinv(6, 4), matinv(6, 5), matinv(6, 6));

    mat3 = ata * matinv;

    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3), mat3(1, 4), mat3(1, 5), mat3(1, 6));
    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3), mat3(2, 4), mat3(2, 5), mat3(2, 6));
    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3), mat3(3, 4), mat3(3, 5), mat3(3, 6));
    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(4, 1), mat3(4, 2), mat3(4, 3), mat3(4, 4), mat3(4, 5), mat3(4, 6));
    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(5, 1), mat3(5, 2), mat3(5, 3), mat3(5, 4), mat3(5, 5), mat3(5, 6));
    fprintf(1,'mat3 = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', mat3(6, 1), mat3(6, 2), mat3(6, 3), mat3(6, 4), mat3(6, 5), mat3(6, 6));
end


function testdeterminant()
    order = 3;

    mat1(1, 1) = 6.0;
    mat1(1, 2) = 1.0;
    mat1(1, 3) = 1.0;
    mat1(2, 1) = 4.0;
    mat1(2, 2) = -2.0;
    mat1(2, 3) = 5.0;
    mat1(3, 1) = 2.0;
    mat1(3, 2) = 8.0;
    mat1(3, 3) = 7.0;

    det = determinant(mat1, order);

    fprintf(1,'det = %11.7f ans -306/n', det);
end

function testcholesky()
    mat1 = cholesky(a);

    fprintf(1,'matcho = %11.7f %11.7f %11.7f \n', matcho(1, 1), matcho(1, 2), matcho(1, 3));
    fprintf(1,'matcho = %11.7f %11.7f %11.7f \n', matcho(2, 1), matcho(2, 2), matcho(2, 3));
    fprintf(1,'matcho = %11.7f %11.7f %11.7f \n', matcho(3, 1), matcho(3, 2), matcho(3, 3));
end

function testposvelcov2pts()

    [sigmapts] = posvelcov2pts(reci, veci, cov);

    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f \n', sigmapts(1, 1), sigmapts(1, 2), sigmapts(1, 3));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f \n', sigmapts(2, 1), sigmapts(2, 2), sigmapts(2, 3));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f \n', sigmapts(3, 1), sigmapts(3, 2), sigmapts(3, 3));
end

function testposcov2pts()
    r1(1) = statearr(1, 1);
    r1(2) = statearr(1, 2);
    r1(3) = statearr(1, 3);

    v1(1) = statearr(1, 4);
    v1(2) = statearr(1, 5);
    v1(3) = statearr(1, 6);

    cov2(1, 1) = 12559.93762571587;
    cov2(1, 2) =  12101.56371305036;
    cov2(1, 2) = cov2(2, 1);
    cov2(1, 3) =  -440.3145384949657;
    cov2(1, 3) = cov2(3, 1);
    cov2(1, 4) = -0.8507401236198346;
    cov2(1, 4) = cov2(4, 1);
    cov2(1, 5) =  0.9383675791981778;
    cov2(1, 5) = cov2(5, 1);
    cov2(1, 6) =  -0.0318596430999798;
    cov2(1, 6) = cov2(6, 1);
    cov2(2, 2) = 12017.77368889201;
    cov2(2, 3) =  270.3798093532698;
    cov2(2, 3) = cov2(3, 2);
    cov2(2, 4) =  -0.8239662300032132;
    cov2(2, 4) = cov2(4, 2);
    cov2(2, 5) =  0.9321640899868708;
    cov2(2, 5) = cov2(5, 2);
    cov2(2, 6) =  -0.001327326827629336;
    cov2(2, 6) = cov2(6, 2);
    cov2(3, 3) = 4818.009967057008;
    cov2(3, 4) =  0.02033418761460195;
    cov2(3, 4) = cov2(4, 3) ;
    cov2(3, 5) =  0.03077663516695039;
    cov2(3, 5) = cov2(5, 3);
    cov2(3, 6) =  0.1977541628188323;
    cov2(3, 6) = cov2(6, 3);
    cov2(4, 4) = 5.774758755889862e-005;
    cov2(4, 5)  = -6.396031584925255e-005;
    cov2(4, 5) = cov2(5, 4);
    cov2(4, 6) =  1.079960679599204e-006;
    cov2(4, 6) = cov2(6, 4);
    cov2(5, 5) = 7.24599391355188e-005;
    cov2(5, 6) = 1.03146660433274e-006;
    cov2(5, 6) = cov2(6, 5);
    cov2(6, 6) = 1.870413627417302e-005;

    % form sigmapts pos/vel
    [sigmapts] = posvelcov2pts(r1, v1, cov2);
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(1, 1), sigmapts(1, 2), sigmapts(1, 3), sigmapts(1, 4), sigmapts(1, 5), sigmapts(1, 6));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(2, 1), sigmapts(2, 2), sigmapts(2, 3), sigmapts(2, 4), sigmapts(2, 5), sigmapts(2, 6));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(3, 1), sigmapts(3, 2), sigmapts(3, 3), sigmapts(3, 4), sigmapts(3, 5), sigmapts(3, 6));

    % reassemble covariance at each step and write out
    [yu, covout] = remakecovpv(sigmapts);
    [sigmapts] = poscov2pts(reci, cov);

    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(1, 1), sigmapts(1, 2), sigmapts(1, 3), sigmapts(1, 4), sigmapts(1, 5), sigmapts(1, 6));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(2, 1), sigmapts(2, 2), sigmapts(2, 3), sigmapts(2, 4), sigmapts(2, 5), sigmapts(2, 6));
    fprintf(1,'sigmapts = %11.7f %11.7f %11.7f %11.7f %11.7f %11.7f \n', sigmapts(3, 1), sigmapts(3, 2), sigmapts(3, 3), sigmapts(3, 4), sigmapts(3, 5), sigmapts(3, 6));
end


function testremakecovpv()

    [yu, sigmapts] = remakecovpv(sigmapts);

    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(1, 1), cov(1, 2), cov(1, 3));
    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(2, 1), cov(2, 2), cov(2, 3));
    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(3, 1), cov(3, 2), cov(3, 3));
end


function testremakecovp()
    [yu, cov] = remakecovp(sigmapts);

    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(1, 1), cov(1, 2), cov(1, 3));
    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(2, 1), cov(2, 2), cov(2, 3));
    fprintf(1,'cov = %11.7f %11.7f %11.7f \n', cov(3, 1), cov(3, 2), cov(3, 3));
end


function testmatequal()
    matr = 3;

    mat3 = matequal(mat1, matr);


    fprintf(1,'matequal = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'matequal = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'matequal = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end

function testmatscale()
    matr = 3;
    matc = 3;
    scale = 1.364;

    mat3 = matscale(mat1, matr, matc, scale);

    fprintf(1,'matscale = %11.7f %11.7f %11.7f \n', mat3(1, 1), mat3(1, 2), mat3(1, 3));
    fprintf(1,'matscale = %11.7f %11.7f %11.7f \n', mat3(2, 1), mat3(2, 2), mat3(2, 3));
    fprintf(1,'matscale = %11.7f %11.7f %11.7f \n', mat3(3, 1), mat3(3, 2), mat3(3, 3));
end


function testunit()
    vec1 = [ 2.3, 4.7, -1.6 ];

    vec2 = unit(vec1);

    fprintf(1,'unit = %11.7f %11.7f %11.7f \n', vec2(1), vec2(2), vec2(3));
end


function testmag()
    x = [ 1.0, 2.0, 5.0 ];

    magx = mag(x);

    fprintf(1,'mag = %11.7f \n', magx);
end


function testcross()
    vec1 = [ 1.0, 2.0, 5.0 ];
    vec2 = [ 2.3, 4.7, -1.6 ];

    [outvec] = cross(vec1, vec2);

    fprintf(1,'cross = ' + outvec(1), outvec(2), outvec(3));
end


function testdot()
    x = [ 1, 2, 5 ];
    y = [ 2.3, 4.7, -1.6 ];

    dotp = dot(x, y);

    fprintf(1,'x ' + x(1), x(2), x(3));
    fprintf(1,'y ' + y(1), y(2), y(3));

    fprintf(1,'dot = ' + dotp);
end


function testangle()
    vec1 = [ 1, 2, 5 ];
    vec2 = [ 2.3, 4.7, -1.6 ];

    ang = angle(vec1, vec2);

    fprintf(1,'angle = ' + ang);
end


function testasinh()
    xval = 1.45;

    ans = asinh(xval);

    fprintf(1,'asinh = ' + ans);
end


function testcot()
    xval = 0.47238734;

    ans = cot(xval);

    fprintf(1,'cot = ' + ans);
end


function testacosh()
    xval = 1.43;

    ans = acosh(xval);

    fprintf(1,'acosh = ' + ans);
end


function testaddvec()
    vec1 = [ 1, 2, 5 ];
    vec2 = [ 2.3, 4.7, -5.6 ];
    a1 = 1.0;
    a2 = 2.0;

    [vec3] = addvec(a1, vec1, a2, vec2);

    fprintf(1,'vec1 ' + vec1(1), vec1(2), vec1(3));
    fprintf(1,'vec2 ' + vec2(1), vec2(2), vec2(3));

    fprintf(1,'addvec = ' + vec3(1), vec3(2), vec3(3));
end


function testPercentile()
    excelPercentile = 0.3;
    arrSize = 7;
    sequence(1) = 45.3;
    sequence(2) = 5.63;
    sequence(3) = 5.13;
    sequence(4) = 345.3;
    sequence(5) = 45.3;
    sequence(6) = 3445.3;
    sequence(7) = 0.03;

    ans = Percentile(sequence, excelPercentile, arrSize);

    fprintf(1,'percentile = ' + ans);
end


function testrot1()
    rad = 180.0 / pi;
    vec(1) = 23.4;
    vec(2) = 6723.4;
    vec(3) = -2.4;
    xval = 225.0 / rad;

    vec3 = rot1(vec, xval);

    fprintf(1,'testrot1 = %11.7f  %11.7f  %11.7f \n', vec3(1), vec3(2), vec3(3));
end


function testrot2()
    rad = 180.0 / pi;
    vec(1) = 23.4;
    vec(2) = 6723.4;
    vec(3) = -2.4;
    xval = 23.4 / rad;
    vec3 = rot2(vec, xval);

    fprintf(1,'testrot2 = %11.7f  %11.7f  %11.7f \n', vec3(1), vec3(2), vec3(3));
end


function testrot3()
    rad = 180.0 / pi;
    vec(1) = 23.4;
    vec(2) = 6723.4;
    vec(3) = -2.4;
    xval = 323.4 / rad;
    vec3 = rot3(vec, xval);

    fprintf(1,'testrot3 = %11.7f  %11.7f  %11.7f \n', vec3(1), vec3(2), vec3(3));
end


function testfactorial()
    n = 4;

    ans = factorial(n);

    fprintf(1,'factorial = %11.7f \n', ans);
end


function testcubicspl()
    p1 = 1.0;
    p2 = 3.5;
    p3 = 5.6;
    p4 = 32.0;

    [acu0, acu1, acu2, acu3] = cubicspl(p1, p2, p3, p4);

    fprintf(1,'cubicspl = %11.7f  %11.7f  %11.7f  %11.7f \n', acu0, acu1, acu2, acu3);
end


function testcubic()
    a3 = 1.7;
    b2 = 3.5;
    c1 = 5.6;
    d0 = 32.0;
    opt = 'I';  % all roots, unique, real

    [r1r, r1i. r2r, r2i, r3r, r3i] = cubic(a3, b2, c1, d0, opt);

    fprintf(1,'cubic = %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f \n', r1r, r1i, r2r, r2i, r3r, r3i);
end


function testcubicinterp()
    p1a = 1.7;
    p1b = 3.5;
    p1c = 5.6;
    p1d = 11.7;
    p2a = 21.7;
    p2b = 35.5;
    p2c = 57.6;
    p2d = 181.7;
    valuein = 4.0;

    ans = cubicinterp(p1a, p1b, p1c, p1d, p2a, p2b, p2c, p2d, valuein);

    fprintf(1,'cubic= %11.7f \n', ans);
end

function testquadratic()
    a = 1.7;
    b = 3.5;
    c = 5.6;
    opt = 'I';  % all roots, unique, real

    [r1r, r1i. r2r. r2i] = quadratic(a, b, c, opt);

    fprintf(1,'quad = %11.7f  %11.7f  %11.7f  %11.7f \n', r1r, r1i, r2r, r2i);
end

function testconvertMonth()
    monstr = 'Jan';
    mon;

    mon = getIntMonth(monstr);
end

function testjday()
    year = 2020;
    mon = 12;
    day = 15;
    hr = 16;
    minute = 58;
    second = 50.208;
    [jd, jdFrac] = jday(year, mon, day, hr, minute, second);

    fprintf(1,'jd %11.7f  %11.7f \n', jd, jdFrac);
    % alt tests
    [year,mon,day,hr,minute,secs] = invjday ( 2450382.5, jdfrac );
    fprintf(1,'year %5i   mon %4i day %3i %3i:%2i:%8.6f\n',year, mon, day, hr, minute, secs);

    [year,mon,day,hr,minute,secs] = invjday ( 2450382.5, jdfrac - 0.2 );
    fprintf(1,'year %5i   mon %4i day %3i %3i:%2i:%8.6f\n',year, mon, day, hr, minute, secs);

    [year,mon,day,hr,minute,secs] = invjday ( 2450382.5 + 1, jdfrac + 1.5 );
    fprintf(1,'year %5i   mon %4i day %3i %3i:%2i:%8.6f\n',year, mon, day, hr, minute, secs);

    [year,mon,day,hr,minute,secs] = invjday ( 2450382.5, -0.5 );
    fprintf(1,'year %5i   mon %4i day %3i %3i:%2i:%8.6f\n',year, mon, day, hr, minute, secs);

    [year,mon,day,hr,minute,secs] = invjday ( 2450382.5, +0.5 );
    fprintf(1,'year %5i   mon %4i day %3i %3i:%2i:%8.6f\n',year, mon, day, hr, minute, secs);

end


function testdays2mdhms()
    year = 2020;
    days = 237.456982367;
    [mon, day, hr, minute, sec] = days2mdhms(year, days);
    fprintf(1,'year %6i  \n',year);
    fprintf(1,'mon  %3i  \n',mon);
    fprintf(1,'days  %3i  \n',days);

end


function testinvjday()
    jd = 2449877.0;
    jdFrac = 0.3458762;

    [year, mon, day, hr, minute, second] = invjday(jd, jdFrac);

    fprintf(1,' hr min sec %4i  %4i  %8.6f \n',hr, minute, second);

    % some stressing cases
    for i = 1:11
        if (i == 1)
            jd = 2457884.5;
            jdF = 0.160911640046296;
        end
        if (i == 2)
            jd = 2457884.5;
            jdF = -0.160911640046296;
        end
        if (i == 3)
            jd = 2457884.5;
            jdF = 0.660911640046296;
        end
        if (i == 4)
            jd = 2457884.5;
            jdF = -0.660911640046296;
        end
        if (i == 5)
            jd = 2457884.5;
            jdF = 2.160911640046296;
        end
        if (i == 6)
            jd = 2457884.660911640046296;
            jdF = 0.0;
        end
        if (i == 7)
            jd = 2457884.0;
            jdF = 2.160911640046296;
        end
        if (i == 8)
            jd = 2457884.5;
            jdF = 0.0;
        end
        if (i == 9)
            jd = 2457884.5;
            jdF = 0.5;
        end
        if (i == 10)
            jd = 2457884.5;
            jdF = 1.0;
        end
        if (i == 11)
            jd = 2457884.3;
            jdF = 1.0;
        end

        jdb = floor(jd + jdF) + 0.5;
        mfme = (jd + jdF - jdb) * 1440.0;
        if (mfme < 0.0)
            mfme = 1440.0 + mfme;
        end
        [year,mon,day,hr,min,sec] = invjday ( jd, jdF );
        if (abs(jdF) >= 1.0)
            jd = jd + floor(jdF);
            jdF = jdF - floor(jdF);
        end
        dt = jd - floor(jd) - 0.5;
        if (abs(dt) > 0.00000001)
            jd = jd - dt;
            jdF = jdF + dt;
        end
        % this gets it even to the day
        if (jdF < 0.0)
            jd = jd - 1.0;
            jdF = 1.0 + jdF;
        end
        fprintf(1,'%2i %4i %2i %2i %2i:%2i:%7.4f   %9.4f %9.4f %12.4f %8.5f %5.4f \n',...
            i, year, mon, day, hr, min, sec, mfme, hr*60.0+min+sec/60.0, jd, jdF, dt);
    end  % through stressing cases

    pause;

    [jdo, jdfraco] = jday(2017, 8, 23, 12, 15, 16);

    [jdo, jdfraco] = jday(2017, 12, 31, 12, 15, 16);
    fprintf(1,'%11.6f  %11.6f \n',jdo,jdfraco);
    [year,mon,day,hr,min,sec] = invjday ( jdo + jdfraco, 0.0 );
    fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n', year,mon,day,hr,min,sec);
    [year,mon,day,hr,min,sec] = invjday ( jdo, jdfraco );
    fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n', year,mon,day,hr,min,sec);

    for i = -50:50
        jd = jdo + i/10.0;
        jdfrac = jdfraco;
        [year,mon,day,hr,min,sec] = invjday ( jd + jdfrac, 0.0 );
        fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n', year,mon,day,hr,min,sec);
        [year,mon,day,hr,min,sec] = invjday ( jd, jdfrac );
        dt = jd - floor(jd);
        fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n\n', year,mon,day,hr,min,sec);
    end

    fprintf(1,'end first half \n');

    for i = -50:50
        jd = jdo;
        jdfrac = jdfraco + i/10.0;
        [year,mon,day,hr,min,sec] = invjday ( jd + jdfrac, 0.0 );
        fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n', year,mon,day,hr,min,sec);
        [year,mon,day,hr,min,sec] = invjday ( jd, jdfrac );
        fprintf(1,'%4i  %3i  %3i  %2i:%2i:%6.4f  \n\n', year,mon,day,hr,min,sec);
    end
end   % testinvjday


% tests eop, spw, and fk5 iau80
function testiau80in()
    year = 2017;
    mon = 4;
    day = 6;
    hr = 0;
    minute = 0;
    second = 0.0;

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);

    eopFileName = 'D:\Codes\LIBRARY\DataLib\EOP-All-v1.1_2018-01-04.txt';
    [eoparr, mjdeopstart, ktrActObs, updDate] = readeop(eopFileName);

    fprintf(1,'EOP tests  mfme    dut1  dat    lod           xp                      yp               ddpsi                   ddeps               ddx                 ddy\n');
    for i = 0: 90

        [jd, jdfrac] = jday(year, mon, day, hr + i, minute, second);
        [dut1, dat, lod, xp, yp, ddpsi,ddeps, ddx, ddy] = findeopparam(jd, jdFrac, 's', eopdata, mjdeopstart + 2400000.5);
        [y, m, d, h, mm, ss] = invjday(jd, jdFrac);
        fprintf(1,' %i  %i  %i  %i  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f \n', ...
            y, m, d, h * 60 + mm, dut1, dat, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
    end

    spwFileName = 'D:\Codes\LIBRARY\DataLib\SpaceWeather-All-v1.2_2018-01-04.txt';
    [spwdata, mjdspwstart, ktrActObs] = readspw(spwFileName);
    fprintf(1,'SPW tests  mfme f107 f107bar ap apavg  kp sumkp aparr[]  \n');
    for i = 0: 90

        [jd, jdFrac] = jday(year, mon, day, hr + i, minute, second);
        % adj obs, last ctr, act con
        [f107, f107bar, ap, avgap, aparr, kp, sumkp, kparr] = findspwparam(jd, jdFrac, 's', 'a', 'l', 'a', EOPSPWLibr.spwdata, mjdspwstart + 2400000.5);
        [y, m, d, h, mm, ss] = invjday(jd, jdFrac);
        fprintf(1,'%i  %i  %i  %i  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f \n', ...
            y, m, d, h * 60 + mm, f107, f107bar, ap, avgap, kp, sumkp, aparr(1), aparr(2), aparr(3));
    end
end  % testiau80in

function testfundarg()
    opt = '80';
    ttt = 0.042623631889;

    [fArgs] = fundarg(ttt, opt);
    fprintf(1,'fundarg = %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f \n', ...
        fArgs(1), fArgs(2), fArgs(3), fArgs(4), fArgs(5), fArgs(6), fArgs(7), fArgs(8),...
        fArgs(9), fArgs(10), fArgs(11), fArgs(12), fArgs(13), fArgs(14));

    % do in deg
    for i = 1: 15
        fArgs(i) = fArgs(i) * 180.0 / pi;
    end

    fprintf(1,'fundarg = %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f \n', ...
        fArgs(1), fArgs(2), fArgs(3), fArgs(4), fArgs(5), fArgs(6), fArgs(7), fArgs(8),...
        fArgs(9), fArgs(10), fArgs(11), fArgs(12), fArgs(13), fArgs(14));


    [fArgs] = fundarg(ttt, AstroLib.EOpt.e06cio);
    fprintf(1,'fundarg = %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f \n', ...
        fArgs(1), fArgs(2), fArgs(3), fArgs(4), fArgs(5), fArgs(6), fArgs(7), fArgs(8),...
        fArgs(9), fArgs(10), fArgs(11), fArgs(12), fArgs(13), fArgs(14));

    % do in deg
    for i = 1: 15
        fArgs(i) = fArgs(i) * 180.0 / pi;
    end

    fprintf(1,'fundarg = %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f  %11.7f %11.7f \n', ...
        fArgs(1), fArgs(2), fArgs(3), fArgs(4), fArgs(5), fArgs(6), fArgs(7), fArgs(8),...
        fArgs(9), fArgs(10), fArgs(11), fArgs(12), fArgs(13), fArgs(14));
end  % testfundarg


function testprecess()
    opt = '80';
    ttt = 0.042623631889;
    % ttt = 0.04262362174880504;
    [prec, psia, wa, epsa, chia] = precess(ttt, opt);

    fprintf(1,'prec = %11.7f  %11.7f  %11.7f \n', prec(1, 1), prec(1, 2), prec(1, 3));
    fprintf(1,'prec = %11.7f  %11.7f  %11.7f \n', prec(2, 1), prec(2, 2), prec(2, 3));
    fprintf(1,'prec = %11.7f  %11.7f  %11.7f \n', prec(3, 1), prec(3, 2), prec(3, 3));

    [psia, wa, epsa, chia] = precess(ttt, '06');

    fprintf(1,'prec06 = %11.7f  %11.7f  %11.7f \n', prec(1, 1), prec(1, 2), prec(1, 3));
    fprintf(1,'prec06 = %11.7f  %11.7f  %11.7f \n', prec(2, 1), prec(2, 2), prec(2, 3));
    fprintf(1,'prec06 = %11.7f  %11.7f  %11.7f \n', prec(3, 1), prec(3, 2), prec(3, 3));
end


function testnutation()
    opt = '80';
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);

    ttt = 0.042623631889;
    ddpsi = -0.052195;
    ddeps = -0.003875;

    [fArgs] = fundarg(ttt, opt);

    [deltapsi, deltaeps, trueeps, meaneps, nut] = nutation(ttt, ddpsi, ddeps, iau80arr, opt, fArgs);

    fprintf(1,'nut = %11.7f  %11.7f  %11.7f \n', nut(1, 1), nut(1, 2), nut(1, 3));
    fprintf(1,'nut = %11.7f  %11.7f  %11.7f \n', nut(2, 1), nut(2, 2), nut(2, 3));
    fprintf(1,'nut = %11.7f  %11.7f  %11.7f \n', nut(3, 1), nut(3, 2), nut(3, 3));

    [fArgs] = undarg(ttt, '06');
    nut00 = precnutbias00a(ttt, ddpsi, ddeps, EOPSPWLibr.iau06arr, '06', fArgs);
    fprintf(1,'nut06 c= %11.7f  %11.7f  %11.7f \n', nut(1, 1), nut(1, 2), nut(1, 3));
    fprintf(1,'nut06 c= %11.7f  %11.7f  %11.7f \n', nut(2, 1), nut(2, 2), nut(2, 3));
    fprintf(1,'nut06 c= %11.7f  %11.7f  %11.7f \n', nut(3, 1), nut(3, 2), nut(3, 3));

    %fundarg(ttt, AstroLib.EOpt.e00a, out fArgs);
    %nut00 = nutation00a(ttt, ddpsi, ddeps, EOPSPWLibr.iau06arr, AstroLib.EOpt.e00a);
    %fprintf(1,'nut06 a= ' + nut(1, 1), nut(1, 2), nut(1, 3));
    %fprintf(1,'nut06 a= ' + nut(2, 1), nut(2, 2), nut(2, 3));
    %fprintf(1,'nut06 a= ' + nut(3, 1), nut(3, 2), nut(3, 3));
end


function testnutationqmod()
    opt = '80';
    string nutLoc;
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);
    ttt = 0.042623631889;
    % ttt = 0.04262362174880504;

    [fArgs] = undarg(ttt, opt);

    [opt, fArgs, deltapsi, deltaeps, meaneps, nutq] = nutationqmod(ttt, iau80arr);
end


function testsidereal()
    eqeterms = 2;
    opt = '80';
    jdut1 = 2453101.82740678310;
    ttt = 0.042623631889;
    %ttt = 0.04262362174880504;
    lod = 0.001556;

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);

    ddpsi = -0.052195;
    ddeps = -0.003875;

    [fArgs] = fundarg(ttt, opt);
    [deltapsi, deltaeps, trueeps, meaneps, nut] = nutation(ttt, ddpsi, ddeps, iau80arr, opt, fArgs);
    st = sidereal(jdut1, deltapsi, meaneps, fArgs, lod, eqeterms, opt);
    fprintf(1,'st = %11.7f  %11.7f  %11.7f \n', st(1, 1), st(1, 2), st(1, 3));
    fprintf(1,'st = %11.7f  %11.7f  %11.7f \n', st(2, 1), st(2, 2), st(2, 3));
    fprintf(1,'st = %11.7f  %11.7f  %11.7f \n', st(3, 1), st(3, 2), st(3, 3));


    opt = '06';
    [fArgs] = fundarg(ttt, opt);
    [deltapsi, deltaeps, trueeps, meaneps, nut] = nutation(ttt, ddpsi, ddeps, iau06arr, opt, fArgs);
    st = sidereal(jdut1, deltapsi, meaneps, fArgs, lod, eqeterms, opt);
    fprintf(1,'st00 = %11.7f  %11.7f  %11.7f \n', st(1, 1), st(1, 2), st(1, 3));
    fprintf(1,'st00 = %11.7f  %11.7f  %11.7f \n', st(2, 1), st(2, 2), st(2, 3));
    fprintf(1,'st00 = %11.7f  %11.7f  %11.7f \n', st(3, 1), st(3, 2), st(3, 3));
end


function testpolarm()
    opt = '80';

    ttt = 0.042623631889;
    %ttt = 0.04262363188899416;
    xp = 0.0;
    yp = 0.0;

    pm = polarm(xp, yp, ttt, opt);

    fprintf(1,'pm = %11.7f  %11.7f  %11.7f \n', pm(1, 1), pm(1, 2), pm(1, 3));
    fprintf(1,'pm = %11.7f  %11.7f  %11.7f \n', pm(2, 1), pm(2, 2), pm(2, 3));
    fprintf(1,'pm = %11.7f  %11.7f  %11.7f \n', pm(3, 1), pm(3, 2), pm(3, 3));

    pm = polarm(xp, yp, ttt, '06');

    fprintf(1,'pm06 = %11.7f  %11.7f  %11.7f \n', pm(1, 1), pm(1, 2), pm(1, 3));
    fprintf(1,'pm06 = %11.7f  %11.7f  %11.7f \n', pm(2, 1), pm(2, 2), pm(2, 3));
    fprintf(1,'pm06 = %11.7f  %11.7f  %11.7f \n', pm(3, 1), pm(3, 2), pm(3, 3));
end


function testgstime()
    jdut1 = 2453101.82740678310;

    gst = gstime(jdut1);

    fprintf(1,'gst = %11.7f  %11.7f \n', gst, (gst * 180.0 / pi));
end


function testlstime()
    lon = -104.0 / rad;
    jdut1 = 2453101.82740678310;

    [lst, gst] = lstime(lon, jdut1);

    fprintf(1,'lst = %11.7f  %11.7f \n', lst, (lst * 180.0 / pi));
end


function testhms_sec()
    hr = 12;
    min = 34;
    sec = 56.233;

    [utsec ] = hms2sec( hr,min,sec );

    fprintf(1,'utsec = %11.7f \n', utsec);

    [hr,min,sec ] = sec2hms( utsec);

    fprintf(1,' hr min sec %4i  %4i  %8.6f \n',hr, min, sec);
end


function testhms_ut()
    hr = 13;
    min = 22;
    sec = 45.98;

    fprintf(1,' hr min sec %4i  %4i  %8.6f \n',hr, min, sec);

    %[ut] = hms2ut(hr, min, sec);

    %fprintf(1,'ut = %11.7f \n', ut);

   % [utsec] = ut2hms( hr,min,sec );

    %fprintf(1,'hms %11.7f \n',utsec);

    temp   = utsec   / 3600.0;
    hr  = fix( temp  );
    min = fix( (temp - hr)*60.0 );
    sec = (temp - hr - min/60.0 ) * 3600.0;
end


function testhms_rad()
    hr = 15;
    min = 15;
    sec = 53.63;

    fprintf(1,' hr min sec %4d  %4d  %8.6f \n',hr, min, sec);
    
    [hms] = hms2rad( hr,min,sec );

    fprintf(1,'hms %11.7f %11.7f \n',hms, hms * 180.0/pi);

    [hr,min,sec] = rad2hms( hms );

    fprintf(1,' hr min sec %4d  %4d  %8.6f \n',hr, min, sec);
end


function testdms_rad()
    deg = -35;
    min = -15;
    sec = -53.63;

    fprintf(1,'deg %4i ',deg);
    fprintf(1,'min %4i ',min);
    fprintf(1,'sec %8.6f \n',sec);

    [dms] = dms2rad( deg, min, sec );

    fprintf(1,'dms = %11.7f  %11.7f \n' + dms);

    [deg, min, sec] = rad2dms( dms );

    fprintf(1,' deg min sec %4d  %4d  %8.6f \n', deg, min, sec);
end


function testeci_ecef()
    conv = pi / (180.0 * 3600.0);  % arcsec to rad

    recef = [ -1033.4793830, 7901.2952754, 6380.3565958 ];
    vecef = [ -3.225636520, -2.872451450, 5.531924446 ];
    year = 2004;
    mon = 4;
    day = 6;
    hr = 7;
    minute = 51;
    second = 28.386009;

    % sofa example -------------
    %year = 2007;
    %mon = 4;
    %day = 5;
    %hr = 12;
    %minute = 0;
    %second = 0.0;

    [jd, jdFrac] = jday(year, mon, day, hr, minute, second);

    dut1 = -0.4399619;      % sec
    dat = 32;               % sec
    xp = -0.140682 * conv;  % ' to rad
    yp = 0.333309 * conv;
    lod = 0.0015563;
    ddpsi = -0.052195 * conv;  % ' to rad
    ddeps = -0.003875 * conv;
    ddx = -0.000205 * conv;    % ' to rad
    ddy = -0.000136 * conv;

    % sofa example -------------
    %dut1 = -0.072073685;      % sec
    %dat = 33;                % sec
    %xp = 0.0349282 * conv;  % ' to rad
    %yp = 0.4833163 * conv;
    %lod = 0.0;
    %ddpsi = -0.0550655 * conv;  % ' to rad
    %ddeps = -0.006358 * conv;
    %ddx = 0.000175 * conv;    % ' to rad
    %ddy = -0.0002259 * conv;

    jdtt = jd;
    jdftt = jdFrac + (dat + 32.184) / 86400.0;
    ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
    fprintf(1,'ttt wo base (use this) %11.7f \n', ttt);
    jdut1 = jd + jdFrac + dut1 / 86400.0;

    fprintf(1,'ITRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);

    % test creating xys file
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    % done, works in c#. :-)
    %createXYS(nutLoc, iau06arr, fArgs);

    % now read it in
   % [jdxysstart, jdfxysstart, xys06arr] = initxys(nutLoc);

    % now test it for interpolation
    %jdtt = jd + jdFrac + (dat + 32.184) / 86400.0;
    [fArgs] = fundarg(ttt, '06');
    [x, y, s] = iau06xysS(ttt, iau06arr, fArgs);
    fprintf(1,'iau06xys     x   ' + x, ' y ' + y, ' s ' + s);
    fprintf(1,'iau06xys     x   ' + (x / conv), ' y ' + (y / conv), ' s ' + (s / conv));
    x = x + ddx;
    y = y + ddy;
    fprintf(1,'iau06xys     x   ' + x, ' y ' + y, ' s ' + s);
    fprintf(1,'iau06xys     x   ' + (x / conv), ' y ' + (y / conv), ' s ' + (s / conv));
    [x, y, s] = findxysparam(jdtt + jdftt, 0.0, 'n', xysarr, jdxysstart);
    fprintf(1,'findxysparam n x   %11.7f  y  %11.7f  s  %11.7f  \n', x, y, s);
    [x, y, s] = findxysparam(jdtt + jdftt, 0.0, 'l', xysarr, jdxysstart);
    fprintf(1,'findxysparam l x   %11.7f  y  %11.7f  s  %11.7f  \n', x, y, s);
    [x, y, s] = findxysparam(jdtt + jdftt, 0.0, 's', xysarr, jdxysstart);
    fprintf(1,'findxysparam s x   %11.7f  y  %11.7f  s  %11.7f  \n', x, y, s);

    [reci,veci,aeci] = ecef2eci  ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,eqeterms,ddpsi,ddeps );
    fprintf(1,'GCRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));

    Console.WriteLine(' checking book test');
    [reci,veci,aeci] = ecef2eci  ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,eqeterms,ddpsi,ddeps );
    fprintf(1,'GCRF          IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));


    % try backwards
    [recef,vecef,aecef] = eci2ecef  ( reci,veci,aeci,ttt,jdut1,lod,xp,yp,eqeterms,ddpsi,ddeps );
    fprintf(1,'ITRF rev       IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));
    recef = [ -1033.4793830, 7901.2952754, 6380.3565958 ];
    vecef = [ -3.225636520, -2.872451450, 5.531924446 ];


    % these are not correct
    [reci,veci,aeci] = ecef2eciiau06 ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,option, ddx, ddy );
    % ----------------------------------------------------------------------------    fprintf(1,'GCRF          IAU-2006 06  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));

    [reci,veci,aeci] = ecef2eciiau06 ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,option, ddx, ddy );
    fprintf(1,'GCRF          IAU-2006 06a  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));
    fprintf(1,'00a case is wrong \n');



    % writeout data for table interpolation
    year = 1980;
    mon = 1;
    day = 1;
    hr = 0;
    minute = 0;
    second = 0.0;
    interp = 'x';  % full series

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);

    % read interpolated one
    %EOPSPWLibr.initEOPArrayP(ref EOPSPWLibr.eopdataP);

    % read existing data - this does not find x, y, s!
    %getCurrEOPFileName(this.EOPSPWLoc.Text, out eopFileName);
    eopFileName = 'D:\Codes\LIBRARY\DataLib\EOP-All-v1.1_2018-01-04.txt';
    [eoparr, mjdeopstart, ktrActObs, updDate] = readeop(eopFileName);
    jdeopstart = mjdeopstart + 2400000.5;

    % now find table of CIO values

    % rad to '
    double convrt = (180.0 * 3600.0) / pi;
    fprintf(1,'CIO tests      x                   y                     s          ddpsi            ddeps      mjd \n');
    for (i = 0; i < 14; i++)   % 14500

        [jd, jdFrac] = jday(year, mon, day + i, hr, minute, second);
        %EOPSPWLibr.findeopparam(jd, jdFrac, 's', EOPSPWLibr.eopdata, mjdeopstart + 2400000.5, out dut1, out dat,
        %   out lod, out xp, out yp, out ddpsi, out ddeps, out ddx, out ddy);
        jdtt = jd;
        jdftt = jdFrac + (dat + 32.184) / 86400.0;
        ttt = (jdtt + jdftt - 2451545.0) / 36525.0;

        [fArgs] = fundarg(ttt, AstroLib.EOpt.e80);

        ddpsi = 0.0;
        ddeps = 0.0;
        deltapsi = 0.0;
        deltaeps = 0.0;
        for ii = 105; ii >= 0; ii--

            tempval = iau80arr.iar80[ii, 0] * fArgs(1) + iau80arr.iar80[ii, 1] * fArgs(2) + iau80arr.iar80[ii, 2] * fArgs(3) +
            iau80arr.iar80[ii, 3] * fArgs(4) + iau80arr.iar80[ii, 4] * fArgs(5);
            deltapsi = deltapsi + (iau80arr.rar80[ii, 0] + iau80arr.rar80[ii, 1] * ttt) * sin(tempval);
            deltaeps = deltaeps + (iau80arr.rar80[ii, 2] + iau80arr.rar80[ii, 3] * ttt) * cos(tempval);
        end

        % --------------- find nutation parameters --------------------
        deltapsi = (deltapsi + ddpsi); % (2.0 * pi);
        deltaeps = (deltaeps + ddeps); % (2.0 * pi);

        % CIO parameters
        [fArgs] = fundarg(ttt, AstroLib.EOpt.e06cio);
        ddx = 0.0;
        ddy = 0.0;
        [x, y, s] = iau06xys(jdtt, jdftt, ddx, ddy, interp, iau06arr, fArgs, jdxysstart);
        x = x * convrt;
        y = y * convrt;
        s = s * convrt;
        deltapsi = deltapsi * convrt;
        deltaeps = deltaeps * convrt;

        fprintf(1,' ' + x, y, s, deltapsi, deltaeps, (jd + jdFrac - 2400000.5));
    end
end


function testtod2ecef()
    conv = pi / (180.0 * 3600.0);

    recef = [ -1033.4793830, 7901.2952754, 6380.3565958 ];
    vecef = [ -3.225636520, -2.872451450, 5.531924446 ];
    year = 2004;
    mon = 4;
    day = 6;
    hr = 7;
    minute = 51;
    second = 28.386009;
    [jd jdFrac] = jday(year, mon, day, hr, minute, second);

    dut1 = -0.4399619;      % sec
    dat = 32;               % sec
    xp = -0.140682 * conv;  % ' to rad
    yp = 0.333309 * conv;
    lod = 0.0015563;
    ddpsi = -0.052195 * conv;  % ' to rad
    ddeps = -0.003875 * conv;
    ddx = -0.000205 * conv;    % ' to rad
    ddy = -0.000136 * conv;

    reci = [ 0.0, 0.0, 0.0 ];
    veci = [ 0.0, 0.0, 0.0 ];

    string nutLoc;
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);
    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);
    jdtt = jd;
    jdftt = jdFrac + (dat + 32.184) / 86400.0;
    ttt = (jdtt + jdftt - 2451545.0) / 36525.0;

    % now read it in
    double jdfxysstart;
    AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

    jdut1 = jd + jdFrac + dut1 / 86400.0;

    fprintf(1,'ITRF start    IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));

    % PEF
    [rpef,vpef,apef] = ecef2pef  ( recef,vecef,aecef,ttt,xp,yp );
    fprintf(1,'GCRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rpef(1), rpef(2), rpef(3), vpef(1), vpef(2), vpef(3));

    ecef_pef(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rpef, ref vpef,    AstroLib.EOpt.e80, ttt, xp, yp);
    fprintf(1,'ITRF  rev     IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    ecef_pef(ref recef, ref vecef, MathTimeLib.Edirection.eto, ref rtemp, ref vtemp,    AstroLib.EOpt.e06cio, ttt, xp, yp);
    fprintf(1,'TIRS          IAU-2006 CIO %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtemp(1), rtemp(2), rtemp(3), vtemp(1), vtemp(2), vtemp(3));
    ecef_pef(ref recefi, ref vecefi, MathTimeLib.Edirection.efrom, ref rtemp, ref vtemp,    AstroLib.EOpt.e06cio, ttt, xp, yp);
    fprintf(1,'ITRF rev      IAU-2006 CIO %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % TOD
    [rtod, vtod, atod] = ecef2tod(recef, vecef, aecef, ttt, jdut1, lod, xp, yp, eqeterms, 0.0, 0.0 )
    fprintf(1,'TOD wo corr   IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    [rtod, vtod, atod] = ecef2tod(recef, vecef, aecef, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps )
    fprintf(1,'TOD w corr    IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    [recefi,vecefi,aecefi] = tod2ecef  ( rtod,vtod,atod,ttt,jdut1,lod,xp,yp,eqeterms,ddpsi,ddeps );
    fprintf(1,'ITRFi         IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    [rtemp,vtemp,atemp] = ecef2tod(recef, vecef, aecef,ttt,jdut1,lod,xp,yp,eqeterms,ddx,ddy );
    fprintf(1,'CIRS          IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtemp(1), rtemp(2), rtemp(3), vtemp(1), vtemp(2), vtemp(3));
    [recefi,vecefi,aecefi] = tod2ecef  ( rtod,vtod,atod,ttt,jdut1,lod,xp,yp,eqeterms,ddx,ddy );
    fprintf(1,'ITRF rev      IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % MOD
    [rmod, vmod, amod] = ecef2mod(recef, vecef, aecef, ttt, jdut1, lod, xp, yp, eqeterms, 0.0, 0.0 );
    fprintf(1,'MOD wo corr   IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    [rmod, vmod, amod] = ecef2mod(recef, vecef, aecef, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(1,'MOD  w corr   IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    [recefi,vecefi,aecefi] = mod2ecef  ( rmod,vmod,amod,ttt,jdut1,lod,xp,yp,eqeterms, ddpsi, ddeps );
    fprintf(1,'ITRF  rev     IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));


    % J2000
    [recii,vecii,aecii] = ecef2eci  ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,eqeterms,0.0, 0.0 );
    fprintf(1,'J2000 wo corr IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % GCRF
    [reci,veci,aeci] = ecef2eci  ( recef,vecef,aecef,ttt,jdut1,lod,xp,yp,eqeterms,ddpsi,ddeps );
    fprintf(1,'GCRF w corr   IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));
    eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recefi, ref vecefi,
    AstroLib.EOpt.e80, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'ITRF rev      IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    eci_ecef(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref recef, ref vecef,
    AstroLib.EOpt.e06cio, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'GCRF          IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));
    [recefi,vecefi,aecefi] = eci2ecefiau06  ( recii,vecii,aecii,ttt,jdut1,lod,xp,yp,option, ddx, ddy );    
    fprintf(1,'ITRF rev      IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % sofa
    fprintf(1,'SOFA ECI CIO  5102.508959486507   6123.011392959787   6378.136934384333');
    fprintf(1,'SOFA ECI 06a  5102.508965811828   6123.011397147659   6378.136925303720');
    fprintf(1,'SOFA ECI 00a  5102.508965732931   6123.011397847143   6378.136924695331');


    % now reverses from eci
    fprintf(1,'GCRF wco STARTIAU-76/FK5   ' + reci(1), reci(2), reci(3)
    + veci(1), veci(2), veci(3));

    % PEF
    eci_pef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rpef, ref vpef,
    AstroLib.EOpt.e80, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'PEF           IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rpef(1), rpef(2), rpef(3), vpef(1), vpef(2), vpef(3));
    eci_pef(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rpef, ref vpef,
    AstroLib.EOpt.e80, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'ECI rev       IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    eci_pef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rpef, ref vpef,
    AstroLib.EOpt.e06cio, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'TIRS          IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rpef(1), rpef(2), rpef(3), vpef(1), vpef(2), vpef(3));
    eci_pef(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rpef, ref vpef,
    AstroLib.EOpt.e06cio, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'ECI rev       IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % TOD
    eci_tod(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rtod, ref vtod,
    AstroLib.EOpt.e80, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'TOD           IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    eci_tod(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rtod, ref vtod,
    AstroLib.EOpt.e80, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'ECI rev       IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    eci_tod(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rtod, ref vtod,
    AstroLib.EOpt.e06cio, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'CIRS          IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    eci_tod(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rtod, ref vtod,
    AstroLib.EOpt.e06cio, iau80arr, iau06arr,    jdtt, jdftt, jdut1, jdxysstart, lod, ddpsi, ddeps, ddx, ddy);
    fprintf(1,'ECI rev       IAU-2006 CIO  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % MOD
    eci_mod(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rmod, ref vmod,    '80', iau80arr, iau06arr, ttt);
    fprintf(1,'MOD           IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    eci_mod(ref recii, ref vecii, MathTimeLib.Edirection.efrom, ref rmod, ref vmod,    '80', iau80arr, iau06arr, ttt);
    fprintf(1,'ECI rev       IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));
end


function testteme_ecef()
    eqeterms = 2;
    conv = pi / (180.0 * 3600.0);

    recef = [ -1033.4793830, 7901.2952754, 6380.3565958 ];
    vecef = [ -3.225636520, -2.872451450, 5.531924446 ];
    year = 2004;
    mon = 4;
    day = 6;
    hr = 7;
    minute = 51;
    second = 28.386009;
    jday(year, mon, day, hr, minute, second, out jd, out jdFrac);

    dut1 = -0.4399619;      % sec
    dat = 32;               % sec
    xp = -0.140682 * conv;  % ' to rad
    yp = 0.333309 * conv;
    lod = 0.0015563;
    ddpsi = -0.052195 * conv;  % ' to rad
    ddeps = -0.003875 * conv;
    ddx = -0.000205 * conv;    % ' to rad
    ddy = -0.000136 * conv;

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);

    % note you have to use tdb for time of ineterst AND j2000 (when dat = 32)
    ttt = (jd + jdFrac + (dat + 32.184) / 86400.0 - 2451545.0 - (32 + 32.184) / 86400.0) / 36525.0;
    jdut1 = jd + jdFrac + dut1 / 86400.0;

    fprintf(1,'ITRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));

    teme_ecef(ref rteme, ref vteme, MathTimeLib.Edirection.efrom, ttt, jdut1, lod, xp, yp,    eqeterms, '80', ref recef, ref vecef);
    fprintf(1,'TEME          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rteme(1), rteme(2), rteme(3), vteme(1), vteme(2), vteme(3));

    recef = [ 0.0, 0.0, 0.0 ];
    vecef = [ 0.0, 0.0, 0.0 ];
    teme_ecef(ref rteme, ref vteme, MathTimeLib.Edirection.eto, ttt, jdut1, lod, xp, yp,    eqeterms, '80', ref recef, ref vecef);
    fprintf(1,'ITRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));

end


function testteme_eci()
    conv = pi / (180.0 * 3600.0);

    reci = [ 5102.5089579, 6123.0114007, 6378.1369282 ];
    veci = [ -4.743220157, 0.790536497, 5.533755727 ];
    year = 2004;
    mon = 4;
    day = 6;
    hr = 7;
    minute = 51;
    second = 28.386009;
    [jd jdFrac] = jday(year, mon, day, hr, minute, second);

    dut1 = -0.4399619;      % sec
    dat = 32;               % sec
    xp = -0.140682 * conv;  % ' to rad
    yp = 0.333309 * conv;
    ddpsi = -0.052195 * conv;  % ' to rad
    ddeps = -0.003875 * conv;
    ddx = -0.000205 * conv;    % ' to rad
    ddy = -0.000136 * conv;

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);

    % note you have to use tdb for time of ineterst AND j2000 (when dat = 32)
    ttt = (jd + jdFrac + (dat + 32.184) / 86400.0 - 2451545.0 - (32 + 32.184) / 86400.0) / 36525.0;
    jdut1 = jd + jdFrac + dut1 / 86400.0;

    fprintf(1,'GCRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));

    teme_eci(ref rteme, ref vteme, iau80arr, MathTimeLib.Edirection.efrom, ttt, ddpsi, ddeps, AstroLib.EOpt.e80, ref reci, ref veci);
    fprintf(1,'TEME          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rteme(1), rteme(2), rteme(3), vteme(1), vteme(2), vteme(3));

    teme_eci(ref rteme, ref vteme, iau80arr, MathTimeLib.Edirection.eto, ttt, ddpsi, ddeps, AstroLib.EOpt.e80, ref reci, ref veci);
    fprintf(1,'GCRF          IAU-76/FK5  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));
end


function testqmod2ecef()
    ttt = 0.042623631889;
    jdutc = 2453101.82740678310;

    fundarg(ttt, opt, out fArgs);

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(nutLoc);

    [recef, vecef] = qmod2ecef(rqmod, vqmod, ttt, jdutc, iau80arr, opt);
end

function testcsm2efg()
    xp = 0.0;
    yp = 0.0;
    lod = 0.0;
    jdut1 = 2453101.82740678310;
    ttt = 0.042623631889;
    ddpsi = -0.052195;
    ddeps = -0.003875;
    eqeterms = 2;

    csm2efg(r1pef, v1pef, r2ric, v2ric, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps, AstroLib.EOpt.e80,
    out r1ecef, out v1ecef, out r2ecef, out v2ecef);

    fprintf(1,'csm2efg  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', r1ecef(1), r1ecef(2), r1ecef(3), r2ecef(1), r2ecef(2), r2ecef(3));
end

function testrv_elatlon()
    rad = 180.0 / pi;
    rr = 12756.00;
    ecllat = 60.04570;
    ecllon = 256.004567345;
    drr = 0.045670;
    decllat = 6.798614;
    decllon = 0.00768;

    rv_elatlon(ref rijk, ref vijk, MathTimeLib.Edirection.efrom, ref rr, ref ecllat, ref ecllon, ref drr, ref decllat, ref decllon);
    fprintf(1,'rv ecllat  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rijk(1), rijk(2), rijk(3), vijk(1), vijk(2), vijk(3));

    rv_elatlon(ref rijk, ref vijk, MathTimeLib.Edirection.eto, ref rr, ref ecllat, ref ecllon, ref drr, ref decllat, ref decllon);

    fprintf(1,'rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rr, ecllat * rad, ecllon * rad, drr, decllat, decllon);



    % additional tests
    rad    = 180.0 / pi;
    twopi = 2.0 * pi;
    % 1" to rad
    convrt = pi / (3600.0*180.0);

    latgd = 20.7071/rad;
    lon = -156.257/rad;
    alt = 3.073;  % km
    fprintf(1,'\n\nrsecef = -5466.080829    -2404.282897    2242.177454 \n');

    year = 2021;
    mon  =  10;
    day  =  12;
    hr   =    4;
    min  =   10;
    sec  =   0.00;
    [jd, jdfrac] =  jday( year, mon, day, hr, min, sec );

    % 2021 10 11 59498  0.204294  0.265940 -0.1059506 -0.0002003 -0.116845 -0.008499  0.000164 -0.000071  37
    % 2021 10 12 59499  0.202929  0.265318 -0.1056985 -0.0003003 -0.116696 -0.008264  0.000206 -0.000037  37
    % 2021 10 13 59500  0.201347  0.265115 -0.1053769 -0.0003296 -0.116533 -0.008163  0.000249 -0.000003  37
    % 2021 10 14 59501  0.199531  0.264474 -0.1050561 -0.0002785 -0.116392 -0.008233  0.000253 -0.000031  37

    dut1 =  -0.1056985;  % s
    dat  = 37;
    xp   =  0.202929* convrt;  % " to rad
    yp   =  0.265318 * convrt;
    lod  =  -0.0003003;
    timezone = 0;
    ddpsi =  -0.116696* convrt;
    ddeps =  -0.008264* convrt;
    dx  = 0.000206* convrt;
    dy  = -0.000037* convrt;
    order =  106;
    terms = 2;
    % , tcg, jdtcg,jdtcgfrac, tcb, jdtcb,jdtcbfrac
    [ ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, ...
        tdb, ttdb, jdtdb, jdtdbfrac ] ...
        = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    fprintf(1,'ut1 %8.6f tut1 %16.12f jdut1 %18.11f\n',ut1,tut1,jdut1 );
    fprintf(1,'utc %8.6f\n',utc );
    fprintf(1,'tai %8.6f\n',tai );
    fprintf(1,'tt  %8.6f ttt  %16.12f jdtt  %18.11f\n',tt,ttt,jdtt );
    fprintf(1,'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n',tdb,ttdb,jdtdb );

    [lst, gst] = lstime(lon, jd + jdfrac);
    fprintf(1,'lst %11.7f gst %11.7f \n',lst*rad, gst*rad );

    %     rho = 100000.0;
    %     az = 40.0/rad;
    %     el = 20.0/rad;
    %
    %     % horizontal
    %     [r, v] = razel2rv ( rho,az,el,0.0, 0.0, 0.0,latgd,lon,alt, ttt,jdut1,lod,xp,yp,terms,ddpsi,ddeps );
    reci = [2919.71566515,    -6559.47300411,      276.48177946]';
    veci = [-1.168779561,    -0.198323404,    7.352918872]';
    fprintf(1,'reci    %14.7f %14.7f %14.7f',reci );
    fprintf(1,' v %14.9f %14.9f %14.9f\n',veci );

    [rho,az,el,drho,daz,del] = rv2razel ( reci, veci, latgd,lon,alt,ttt,jdut1+jdut1frac,lod,xp,yp,terms,ddpsi,ddeps );
    if az < 0.0
        az = az + twopi;
    end
    fprintf(1,'rvraz   %14.7f %14.7f %14.7f',rho, az*rad, el*rad );
    fprintf(1,' %14.7f %14.12f %14.12f\n',drho, daz*rad, del*rad );
    fprintf(1,'STK 12 Oct 2021 04:09:07.155          159.523              5.000    2788.517174 \n');
    fprintf(1,'STK 12 Oct 2021 04:10:07.000          158.339              9.710    2393.490995 \n');
    %  rtascdecl report
    %             147.238               57.942    12 Oct 2021 04:09:00.000
    %             144.255               53.546    12 Oct 2021 04:10:00.000

    %rtascdav report
    %12 Oct 2021 04:09:07.154735    2788.517174       159.522583           5.000332           326.863806           -57.466141
    %12 Oct 2021 04:10:07.000000    2393.490995       158.338742           9.710252           323.927386           -52.964440

    % geocentric
    [rr,rtasc,decl,drr,drtasc,ddecl] = rv2radec( reci, veci );
    fprintf(1,'            rho km       rtasc deg     decl deg      drho km/s      drtasc deg/s   ddecl deg/s \n' );
    if rtasc < 0.0
        rtasc = rtasc + twopi;
    end
    fprintf(1,'radec  %14.7f %14.7f %14.7f',rr,rtasc*rad,decl*rad );
    fprintf(1,' %14.7f %14.12f %14.12f\n',drr,drtasc*rad,ddecl*rad );

    [reci,veci] = radec2rv(rr,rtasc,decl,drr,drtasc,ddecl);
    fprintf(1,'reci    %14.7f %14.7f %14.7f',reci );
    fprintf(1,' v %14.9f %14.9f %14.9f\n',veci );

    % topocentric
    ddpsi = 0.0;
    ddeps = 0.0;
    [trr,trtasc,tdecl,tdrr,tdrtasc,tddecl] = rv2tradec( reci, veci, rseci, vseci );
    fprintf(1,'           trho km      trtasc deg    tdecl deg     tdrho km/s     tdrtasc deg/s  tddecl deg/s \n' );
    if trtasc < 0.0
        trtasc = trtasc + twopi;
    end
    fprintf(1,'tradec  %14.7f %14.7f %14.7f',trr,trtasc*rad,tdecl*rad );
    fprintf(1,' %14.7f %14.12f %14.12f\n',tdrr,tdrtasc*rad,tddecl*rad );
    fprintf(1,'STK 12 Oct 2021 04:09:07.155              326.864              -57.466 \n');
    fprintf(1,'STK 12 Oct 2021 04:10:07.000              323.927              -52.964 \n');


    % satellite ecef
    % 12 Oct 2021 04:10:00.0000    -6166.715106346013    -3676.915653933220      282.460443869915
    %                              -0.605685283644995     1.601875853811738     7.350462613646496
    % satellite eci vector
    % 12 Oct 2021 04:10:00.0000     2919.71566515    -6559.47300411      276.48177946
    %                               -1.168779561    -0.198323404     7.352918872


end


function testrv2radec()
    r = [ -605.79221660, -5870.22951108, 3493.05319896 ];
    v = [ -1.56825429, -3.70234891, -6.47948395 ];
    rr = rtasc = decl = drr = drtasc = ddecl = 0.0;

    rv_radec(ref r, ref v, MathTimeLib.Edirection.eto, ref rr, ref rtasc, ref decl, ref drr, ref drtasc, ref ddecl);
    fprintf(1,'rv radec  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', r(1), r(2), r(3), v(1), v(2), v(3));
    fprintf(1,'rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rr, rtasc, decl, drr, drtasc, ddecl);

    rv_radec(ref r, ref v, MathTimeLib.Edirection.efrom, ref rr, ref rtasc, ref decl, ref drr, ref drtasc, ref ddecl);

    fprintf(1,'rv radec  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', r(1), r(2), r(3), v(1), v(2), v(3));
end


function testrv_razel()
    recef = [ -605.79221660, -5870.22951108, 3493.05319896 ];
    vecef = [ -1.56825429, -3.70234891, -6.47948395 ];
    %rsecef = [ -1605.79221660, -570.22951108, 193.05319896 ];
    lon = -104.883 / rad;
    latgd = 39.883 / rad;
    alt = 2.102;
    rho = 0.0186569;
    az = -0.3501725;
    el = -0.5839385;
    drho = 0.6811410;
    daz = -0.4806057;
    del = 0.6284403;

    rv_razel(ref recef, ref vecef, latgd, lon, alt, MathTimeLib.Edirection.eto, ref rho, ref az, ref el, ref drho, ref daz, ref del);
    fprintf(1,'rv razel  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));
    fprintf(1,'rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rho, az, el, drho, daz, del);

    rv_razel(ref recef, ref vecef, latgd, lon, alt, MathTimeLib.Edirection.efrom, ref rho, ref az, ref el, ref drho, ref daz, ref del);
    fprintf(1,'rv razel  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));
end

function testrv_tradec()
    rijk = [ 4066.716, -2847.545, 3994.302 ];
    vijk = [ -1.56825429, -3.70234891, -6.47948395 ];
    rsijk = [ -1605.79221660, -570.22951108, 193.05319896 ];
    rho = 0.2634728;
    trtasc = -0.1492353;
    tdecl = 0.0519525;
    drho = 0.3072265;
    dtrtasc = 0.2045751;
    dtdecl = -0.7510033;

    rv_tradec(ref rijk, ref vijk, rsijk, MathTimeLib.Edirection.eto, ref rho, ref trtasc, ref tdecl, ref drho, ref dtrtasc, ref dtdecl);
    fprintf(1,'rv tradec  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rijk(1), rijk(2), rijk(3), vijk(1), vijk(2), vijk(3));
    fprintf(1,'tradec %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f \n', rho, trtasc, tdecl, drho, dtrtasc, dtdecl);

    rv_tradec(ref rijk, ref vijk, rsijk, MathTimeLib.Edirection.efrom, ref rho, ref trtasc, ref tdecl, ref drho, ref dtrtasc, ref dtdecl);
    fprintf(1,'rv tradec  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rijk(1), rijk(2), rijk(3), vijk(1), vijk(2), vijk(3));
end


function testrvsez_razel()
    rhosez = [ -605.79221660, -5870.22951108, 3493.05319896 ];
    drhosez = [ -1.56825429, -3.70234891, -6.47948395 ];
    rho = 0.0186569;
    az = -0.3501725;
    el = -0.5839385;
    drho = 0.6811410;
    daz = -0.4806057;
    del = 0.6284403;

    rvsez_razel(ref rhosez, ref drhosez, MathTimeLib.Edirection.eto, ref rho, ref az, ref el, ref drho, ref daz, ref del);
    fprintf(1,'rv rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rhosez(1), rhosez(2), rhosez(3), drhosez(1), drhosez(2), drhosez(3));
    fprintf(1,'rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rho, az, el, drho, daz, del);

    rvsez_razel(ref rhosez, ref drhosez, MathTimeLib.Edirection.efrom, ref rho, ref az, ref el, ref drho, ref daz, ref del);

    fprintf(1,'rv rhosez  %11.7f  %11.7f  %11.7f %11.7f  %11.7f  %11.7f \n', rhosez(1), rhosez(2), rhosez(3), drhosez(1), drhosez(2), drhosez(3));
end


function testrv2rsw()

    r = new double(4);
    v = new double(4);
    rrsw = new double(4);
    vrsw = new double(4);
    double[,] tm = new double(4, 4);
    r = [ -605.79221660, -5870.22951108, 3493.05319896 ];
    v = [ -1.56825429, -3.70234891, -6.47948395 ];

    tm = rv2rsw(r, v, out rrsw, out vrsw);

    fprintf(1,'rv2rsw ' + rrsw(1), rrsw(2), rrsw(3),
    vrsw(1), vrsw(2), vrsw(3));
end

function testrv2pqw()
    r = new double(4);
    v = new double(4);
    rpqw = new double(4);
    vpqw = new double(4);
    double[,] tm = new double(4, 4);
    r = [ -605.79221660, -5870.22951108, 3493.05319896 ];
    v = [ -1.56825429, -3.70234891, -6.47948395 ];

    rv2pqw(r, v, out rpqw, out vpqw);

    fprintf(1,'rv2pqw ' + rpqw(1), rpqw(2), rpqw(3),
    vpqw(1), vpqw(2), vpqw(3));
end

function testrv2coe()
    for (i = 1; i <= 21; i++)

        if (i == 1)

            r = [ -605.79221660, -5870.22951108, 3493.05319896 ];
            v = [ -1.56825429, -3.70234891, -6.47948395 ];
        end
        if (i == 2)

            fprintf(1,' coe test ----------------------------');
            r = [ 6524.834, 6862.875, 6448.296 ];
            v = [ 4.901327, 5.533756, -1.976341 ];
        end

        % ------- elliptical orbit tests -------------------
        if (i == 3)

            fprintf(1,' coe test elliptical ----------------------------');
            r = [ 1.1372844 * gravConst.re, -1.0534274 * gravConst.re, -0.8550194 * gravConst.re ];
            v = [ 0.6510489 * gravConst.velkmps, 0.4521008 * gravConst.velkmps, 0.0381088 * gravConst.velkmps ];
        end
        if (i == 4)

            fprintf(1,' coe test elliptical ----------------------------');
            r = [ 1.056194 * gravConst.re, -0.8950922 * gravConst.re, -0.0823703 * gravConst.re ];
            v = [ -0.5981066 * gravConst.velkmps, -0.6293575 * gravConst.velkmps, 0.1468194 * gravConst.velkmps ];
        end

        % ------- circular inclined orbit tests -------------------
        if (i == 5)

            fprintf(1,' coe test near circular inclined ----------------------------');
            r = [ -0.422277 * gravConst.re, 1.0078857 * gravConst.re, 0.7041832 * gravConst.re ];
            v = [ -0.5002738 * gravConst.velkmps, -0.5415267 * gravConst.velkmps, 0.4750788 * gravConst.velkmps ];
        end
        if (i == 6)

            fprintf(1,' coe test near circular inclined ----------------------------');
            r = [ -0.7309361 * gravConst.re, -0.6794646 * gravConst.re, -0.8331183 * gravConst.re ];
            v = [ -0.6724131 * gravConst.velkmps, 0.0341802 * gravConst.velkmps, 0.5620652 * gravConst.velkmps ];
        end

        if (i == 7) % -- CI u = 45 deg

            fprintf(1,' coe test circular inclined ----------------------------');
            r = [ -2693.34555010128, 6428.43425355863, 4491.37782050409 ];
            v = [ -3.95484712246016, -4.28096585381370, 3.75567104538731 ];
        end
        if (i == 8) % -- CI u = 315 deg

            fprintf(1,' coe test circular inclined ----------------------------');
            r = [ -7079.68834483379, 3167.87718823353, -2931.53867301568 ];
            v = [ 1.77608080328182, 6.23770933190509, 2.45134017949138 ];
        end

        % ------- elliptical equatorial orbit tests -------------------
        if (i == 9)

            fprintf(1,' coe test elliptical near equatorial ----------------------------');
            r = [ 21648.6109280739, -14058.7723188698, -0.0003598029 ];
            v = [ 2.16378060719980, 3.32694348486311, 0.00000004164788 ];
        end
        if (i == 10)

            fprintf(1,' coe test elliptical near equatorial ----------------------------');
            r = [ 7546.9914487222, 24685.1032834356, -0.0003598029 ];
            v = [ 3.79607016047138, -1.15773520476223, 0.00000004164788 ];
        end

        if (i == 11) % -- EE w = 20 deg

            fprintf(1,' coe test elliptical equatorial ----------------------------');
            r = [ -22739.1086596208, -22739.1086596208, 0.0 ];
            v = [ 2.48514004188565, -2.02004112073465, 0.0 ];
        end
        if (i == 12) % -- EE w = 240 deg

            fprintf(1,' coe test elliptical equatorial ----------------------------');
            r = [ 28242.3662822040, 2470.8868808397, 0.0 ];
            v = [ 0.66575215057746, -3.62533022188304, 0.0 ];
        end

        % ------- circular equatorial orbit tests -------------------
        if (i == 13)

            fprintf(1,' coe test circular near equatorial ----------------------------');
            r = [ -2547.3697454933, 14446.8517254604, 0.000 ];
            v = [ -5.13345156333487, -0.90516601477599, 0.00000090977789 ];
        end
        if (i == 14)

            fprintf(1,' coe test circular near equatorial ----------------------------');
            r = [ 7334.858850000, -12704.3481945462, 0.000 ];
            v = [ -4.51428154312046, -2.60632166411836, 0.00000090977789 ];
        end

        if (i == 15) % -- CE l = 65 deg

            fprintf(1,' coe test circular equatorial ----------------------------');
            r = [ 6199.6905946008, 13295.2793851394, 0.0 ];
            v = [ -4.72425923942564, 2.20295826245369, 0.0 ];
        end
        if (i == 16) % -- CE l = 65 deg i = 180 deg

            fprintf(1,' coe test circular equatorial ----------------------------');
            r = [ 6199.6905946008, -13295.2793851394, 0.0 ];
            v = [ -4.72425923942564, -2.20295826245369, 0.0 ];
        end

        % ------- parabolic orbit tests -------------------
        if (i == 17)

            fprintf(1,' coe test parabolic ----------------------------');
            r = [ 0.5916109 * gravConst.re, -1.2889359 * gravConst.re, -0.3738343 * gravConst.re ];
            v = [ 1.1486347 * gravConst.velkmps, -0.0808249 * gravConst.velkmps, -0.1942733 * gravConst.velkmps ];
        end

        if (i == 18)

            fprintf(1,' coe test parabolic ----------------------------');
            r = [ -1.0343646 * gravConst.re, -0.4814891 * gravConst.re, 0.1735524 * gravConst.re ];
            v = [ 0.1322278 * gravConst.velkmps, 0.7785322 * gravConst.velkmps, 1.0532856 * gravConst.velkmps ];
        end

        if (i == 19)

            fprintf(1,' coe test hyperbolic ---------------------------');
            r = [ 0.9163903 * gravConst.re, 0.7005747 * gravConst.re, -1.3909623 * gravConst.re ];
            v = [ 0.1712704 * gravConst.velkmps, 1.1036199 * gravConst.velkmps, -0.3810377 * gravConst.velkmps ];
        end

        if (i == 20)

            fprintf(1,' coe test hyperbolic ---------------------------');
            r = [ 12.3160223 * gravConst.re, -7.0604653 * gravConst.re, -3.7883759 * gravConst.re ];
            v = [ -0.5902725 * gravConst.velkmps, 0.2165037 * gravConst.velkmps, 0.1628339 * gravConst.velkmps ];
        end

        if (i == 21)

            fprintf(1,' coe test rectilinear --------------------------');
            r = [ -1984.03023322569, 1525.27235370582, 6364.76955283447 ];
            v = [ -1.60595491095, 1.23461759098, 5.15190381139 ];
            v = [-1.60936089585, 1.23723602618, 5.16283021192end;  % 196
                end

        fprintf(1,' start r ' + r(1), r(2), r(3),
        'v ' + v(1), v(2), v(3));
        % --------  coe2rv       - classical elements to posisiotn and velocity
        % --------  rv2coe       - position and velocity vectors to classical elements
        rv2coe(r, v, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
        fprintf(1,'           p km       a km      ecc      incl deg     raan deg     argp deg      nu deg      m deg      arglat   truelon    lonper');
        fprintf(1,'ans coes ' + p.PadLeft(17), a.PadLeft(17), ecc.ToString('0.000000000'), (incl * rad),
        (raan * rad), (argp * rad), (nu * rad), (m * rad),
        (arglat * rad), (truelon * rad), (lonper * rad));

        % rectilinear orbits have sign(a) determines orbit type, arglat
        % is nu, but the magnitude is off...?
        if (Math.Abs(ecc - 1.0) < 0.0000001)
            p = mag(r) * 1.301;
            coe2rv(p, ecc, incl, raan, argp, nu, arglat, truelon, lonper, out r1, out v1);
            fprintf(1,' end  r ' + r1(1), r1(2), r1(3),
            'v ' + v1(1), v1(2), v1(3));
        end  % through for
    end

    function testfindc2c3()
        % --------  findc2c3     - find c2 c3 parameters for f and g battins method
        znew = -39.47842;
        findc2c3(znew, out c2new, out c3new);
        fprintf(1,'findc2c3 z ' + znew, c2new, c3new);

        znew = 0.0;
        findc2c3(znew, out c2new, out c3new);
        fprintf(1,'findc2c3 z ' + znew, c2new, c3new);

        znew = 0.57483;
        findc2c3(znew, out c2new, out c3new);
        fprintf(1,'findc2c3 z ' + znew, c2new, c3new);

        znew = 39.47842;
        findc2c3(znew, out c2new, out c3new);
        fprintf(1,'findc2c3 z ' + znew, c2new, c3new);
    end


    function testcoe2rv()
        rad = 180.0 /pi;

        % alt test various combinations of coe/eq and rv
        for j = 1:2
            if j == 1
                fprintf(1,'coe tests ----------------------------\n' );
            else
                fprintf(1,'\n\neq tests ----------------------------\n' );
                %pause;
            end
            for i = 1:21
                if i == 1
                    r=[ 6524.834;6862.875;6448.296];
                    v=[ 4.901327;5.533756;-1.976341];
                end
                if i == 2
                    fprintf(1,'coe test ----------------------------\n' );
                    r=[ 6524.834;6862.875;6448.296];
                    v=[ 4.901327;5.533756;-1.976341];
                end

                % ------- elliptical orbit tests -------------------
                if i == 3
                    fprintf(1,'coe test elliptical ----------------------------\n' );
                    r=[ 1.1372844; -1.0534274; -0.8550194]*6378.137;
                    v=[0.6510489;  0.4521008;  0.0381088]*7.905366149846;
                end
                if i == 4
                    fprintf(1,'coe test elliptical ----------------------------\n' );
                    r=[  1.0561942;-0.8950922;-0.0823703]*6378.137;;
                    v=[  -0.5981066;-0.6293575; 0.1468194]*7.905366149846;
                end

                % ------- circular inclined orbit tests -------------------
                if i == 5
                    fprintf(1,'coe test near circular inclined ----------------------------\n' );
                    r=[ -0.4222777; 1.0078857; 0.7041832]*6378.137;
                    v=[  -0.5002738;-0.5415267; 0.4750788]*7.905366149846;
                end
                if i == 6
                    fprintf(1,'coe test near circular inclined ----------------------------\n' );
                    r=[ -0.7309361;-0.6794646;-0.8331183]*6378.137;
                    v=[  -0.6724131; 0.0341802; 0.5620652]*7.905366149846;
                end

                if i == 7 % -- CI u = 45 deg
                    fprintf(1,'coe test circular inclined ----------------------------\n' );
                    r = [-2693.34555010128  6428.43425355863  4491.37782050409];
                    v = [   -3.95484712246016  -4.28096585381370  3.75567104538731];
                end
                if i == 8 % -- CI u = 315 deg
                    fprintf(1,'coe test circular inclined ----------------------------\n' );
                    r = [-7079.68834483379;  3167.87718823353; -2931.53867301568];
                    v = [    1.77608080328182;  6.23770933190509; 2.45134017949138];
                end

                % ------- elliptical equatorial orbit tests -------------------
                if i == 9
                    fprintf(1,'coe test elliptical near equatorial ----------------------------\n' );
                    r=[ 21648.6109280739; -14058.7723188698; -0.0003598029];
                    v=[ 2.16378060719980; 3.32694348486311; 0.00000004164788 ];
                end
                if i == 10
                    fprintf(1,'coe test elliptical near equatorial ----------------------------\n' );
                    r=[  7546.9914487222;  24685.1032834356; -0.0003598029];
                    v=[ 3.79607016047138; -1.15773520476223; 0.00000004164788 ];
                end

                if i == 11 % -- EE w = 20 deg
                    fprintf(1,'coe test elliptical equatorial ----------------------------\n' );
                    r = [-22739.1086596208  -22739.1086596208     0.0];
                    v = [    2.48514004188565  -2.02004112073465  0.0];
                end
                if i == 12 % -- EE w = 240 deg
                    fprintf(1,'coe test elliptical equatorial ----------------------------\n' );
                    r = [ 28242.3662822040    2470.8868808397    0.0];
                    v = [    0.66575215057746  -3.62533022188304  0.0];
                end

                % ------- circular equatorial orbit tests -------------------
                if i == 13
                    fprintf(1,'coe test circular near equatorial ----------------------------\n' );
                    r=[ -2547.3697454933; 14446.8517254604; 0.000 ];
                    v=[  -5.13345156333487; -0.90516601477599; 0.00000090977789 ];
                end
                if i == 14
                    fprintf(1,'coe test circular near equatorial ----------------------------\n' );
                    r=[  7334.858850000; -12704.3481945462;   0.000 ];
                    v=[  -4.51428154312046; -2.60632166411836; 0.00000090977789 ];
                end

                if i == 15 % -- CE l = 65 deg
                    fprintf(1,'coe test circular equatorial ----------------------------\n' );
                    r = [ 6199.6905946008; 13295.2793851394;      0.0];
                    v = [ -4.72425923942564; 2.20295826245369;    0.0];
                end
                if i == 16 % -- CE l = 65 deg i = 180 deg
                    fprintf(1,'coe test circular equatorial ----------------------------\n' );
                    r = [ 6199.6905946008; -13295.2793851394;      0.0];
                    v = [ -4.72425923942564; -2.20295826245369;    0.0];
                end

                % ------- parabolic orbit tests -------------------
                if i == 17
                    fprintf(1,'coe test parabolic ----------------------------\n' );
                    r=[  0.5916109;-1.2889359;-0.3738343]*6378.137;
                    v=[   1.1486347;-0.0808249;-0.1942733]*7.905366149846;
                end

                if i == 18
                    fprintf(1,'coe test parabolic ----------------------------\n' );
                    r=[-1.0343646; -0.4814891;  0.1735524]*6378.137;
                    v=[ 0.1322278; 0.7785322; 1.0532856  ]*7.905366149846;
                end

                if i == 19
                    fprintf(1,'coe test hyperbolic ---------------------------\n' );
                    r=[0.9163903; 0.7005747; -1.3909623  ]*6378.137;
                    v=[0.1712704; 1.1036199; -0.3810377  ]*7.905366149846;
                end

                if i == 20
                    fprintf(1,'coe test hyperbolic ---------------------------\n' );
                    r=[12.3160223; -7.0604653; -3.7883759]*6378.137;
                    v=[-0.5902725; 0.2165037; 0.1628339  ]*7.905366149846;
                end

                if i == 21
                    fprintf(1,'coe test rectilinear --------------------------\n' );
                    r = [-1984.03023322569, 1525.27235370582, 6364.76955283447];
                    v = [-1.60595491095, 1.23461759098, 5.15190381139];  % 201?
                    %v = [-1.60936089585, 1.23723602618, 5.16283021192];  % 196
                end

                fprintf(1,'start %15.9f %15.9f %15.9f',r );
                fprintf(1,' v  %15.10f %15.10f %15.10f\n',v );

                if j == 1
                    % --------  rv2coe       - position and velocity vectors to classical elements
                    [p,a,ecc,incl,omega,argp,nu,m,arglat,truelon,lonper ] = rv2coe (r,v);
                    fprintf(1,'          p km         a km         ecc        incl deg     raan deg     argp deg      nu deg      m deg      arglat   truelon    lonper\n');
                    fprintf(1,'coes %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f\n',...
                        p,a,ecc,incl*rad,omega*rad,argp*rad,nu*rad,m*rad, ...
                        arglat*rad,truelon*rad,lonper*rad );

                    % --------  coe2rv       - classical elements to position and velocity
                    % rectilinear orbits have sign(a) determines orbit type, arglat
                    % is nu, but the magnitude is off...?
                    if abs(ecc-1.0) < 0.0000001
                        p = mag(r)*1.301;
                    end
                    [rn,vn] = coe2rv(p,ecc,incl,omega,argp,nu,arglat,truelon,lonper);
                    fprintf(1,'rn    %15.9f %15.9f %15.9f',rn );
                    fprintf(1,' vn %15.10f %15.10f %15.10f\n',vn );
                    dr(1) = r(1) - rn(1);
                    dr(2) = r(2) - rn(2);
                    dr(3) = r(3) - rn(3);
                    if mag(dr) > 0.01
                        fprintf(1,'ERROR in this case dr = %11.7f \n', mag(dr));
                    end
                else
                    % --------  rv2eq       - position and velocity vectors to classical elements
                    [ a, n, af, ag, chi, psi, meanlonM, meanlonNu, fr ] = rv2eq (r,v);
                    fprintf(1,'       fr     a km         n rad      af           ag         chi          psi      meanlonnu deg   meanlonm deg \n');
                    fprintf(1,'eqs    %2d %11.4f %11.4f %13.9g %13.7g %11.5g %11.5g %11.5f %11.5f \n',...
                        fr, a, n, af, ag, chi, psi, meanlonNu*rad, meanlonM*rad );

                    % --------  eq2rv       - classical elements to position and velocity
                    [rn,vn] = eq2rv( a, af, ag, chi, psi, meanlonM, fr);
                    fprintf(1,'rn    %15.9f %15.9f %15.9f',rn );
                    fprintf(1,' vn %15.10f %15.10f %15.10f\n',vn );
                    dr(1) = r(1) - rn(1);
                    dr(2) = r(2) - rn(2);
                    dr(3) = r(3) - rn(3);
                    if mag(dr) > 0.01
                        fprintf(1,'ERROR in this case dr = %11.7f \n', mag(dr));
                    end
                end

                % reci = [1525.9870698051157, -5867.209915411114, 3499.601587508083]';
                % veci = [1.4830443958075603, -7.093267951700349, 0.9565730381487033]';
                % rmag = 7000; % km
                % vmag = 7.546;  % km/s
                % latgc = pi / 6;  % 30 degrees
                % lon = pi / 2;  % 90 degrees
                % fpa = -pi / 6;  % -30 degrees
                % az = pi / 4;  % 45 degrees
                %
                % conv = pi / (180.0*3600.0);
                % ttt = 0.042623631888994;
                % jdut1 = 2.45310150e+06;
                % lod = 0.0015563;
                % xp = -0.140682 * conv;
                % yp = 0.333309 * conv;
                % eqeterms = 2;
                % ddpsi = -0.052195 * conv;
                % ddeps = -0.003875 * conv;
                % % ---- flight elements
                % [lon, latgc, rtasc, decl, fpa, az, magr, magv] = rv2flt ( reci,veci,ttt,jdut1,lod,xp,yp,2,ddpsi,ddeps );
                % fprintf(1,'         rmag km       vmag km/s     latgc deg       lon deg       fpa deg       az deg\n');
                % fprintf(1,'flt  %14.7f%14.7f%14.7f%15.7f%14.7f%14.7f\n',rmag,vmag,...
                %         latgc*rad,lon*rad,fpa*rad,az*rad );
                % [r,v] = flt2rv ( rmag,vmag,latgc,lon,fpa,az,ttt,jdut1,lod,xp,yp,2,ddpsi,ddeps );
                % fprintf(1,'r    %15.9f%15.9f%15.9f',r );
                % fprintf(1,' v %15.10f%15.10f%15.10f\n',v );
                %
                % % ----  adbarv elements
                % [rmag,vmag,rtasc,decl,fpav,az] = rv2adbar ( r,v );
                % fprintf(1,'          rmag km      vmag km/s     rtasc deg       decl deg      fpav deg      az deg\n');
                % fprintf(1,'adb  %14.7f%14.7f%14.7f%15.7f%14.7f%14.7f\n',rmag,vmag,...
                %          rtasc*rad,decl*rad,fpav*rad,az*rad );
                % [r,v] = adbar2rv ( rmag,vmag,rtasc,decl,fpav,az );
                % fprintf(1,'r    %15.9f%15.9f%15.9f',r );
                % fprintf(1,' v %15.10f%15.10f%15.10f\n',v );
                %
                % % ---- radial, along-track, cross-track
                % [rrac,vrac,transmat] = rv2rac(r,v);
                % fprintf(1,'rac  %15.9f%15.9f%15.9f',rrac );
                % fprintf(1,' v %15.10f%15.10f%15.10f\n',vrac );
                %
                % % ---- in-radial, velocity, cross-track
                % [rivc,vivc,transmat] = rv2ivc(r,v);
                % fprintf(1,'ivc  %15.9f%15.9f%15.9f',rivc );
                % fprintf(1,' v %15.10f%15.10f%15.10f\n',vivc );




            end  % for
        end % for through coe/eq tests


        fprintf(1,'\n\n\n tests \n');
        r = [4942.74746831, 4942.74746831, 0.];
        v = [-5.34339547, 5.34339547, 0.02137362];
        fprintf(1,'r    %15.9f %15.9f %15.9f',r );
        fprintf(1,' v %15.10f %15.10f %15.10f\n',v );
        [ a, n, af, ag, chi, psi, meanlonM, meanlonNu, fr ] = rv2eq (r, v);
        fprintf(1,'       fr     a km         n rad      af           ag         chi          psi      meanlonnu deg   meanlonm deg \n');
        fprintf(1,'eqs    %2d %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f \n',...
            fr, a, n, af, ag, chi, psi, meanlonNu*rad, meanlonM*rad );
        [p,a,ecc,incl,omega,argp,nu,m,arglat,truelon,lonper ] = rv2coe (r,v);
        fprintf(1,'          p km         a km         ecc        incl deg     raan deg     argp deg      nu deg      m deg      arglat   truelon    lonper\n');
        fprintf(1,'coes %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f\n',...
            p,a,ecc,incl*rad,omega*rad,argp*rad,nu*rad,m*rad, ...
            arglat*rad,truelon*rad,lonper*rad );

        fprintf(1,'\n\ STK ? tests \n');
        r = [4942.72769736, -4942.72769736,  19.77095033];
        v = [-5.34341685, -5.34341685, 0];
        fprintf(1,'r    %15.9f %15.9f %15.9f',r );
        fprintf(1,' v %15.10f %15.10f %15.10f\n',v );
        [ a, n, af, ag, chi, psi, meanlonM, meanlonNu, fr ] = rv2eq (r, v);
        fprintf(1,'       fr     a km         n rad      af           ag         chi          psi      meanlonnu deg   meanlonm deg \n');
        fprintf(1,'eqs    %2d %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f \n',...
            fr, a, n, af, ag, chi, psi, meanlonNu*rad, meanlonM*rad );
        [p,a,ecc,incl,omega,argp,nu,m,arglat,truelon,lonper ] = rv2coe (r,v);
        fprintf(1,'          p km         a km         ecc        incl deg     raan deg     argp deg      nu deg      m deg      arglat   truelon    lonper\n');
        fprintf(1,'coes %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f %11.5f\n',...
            p,a,ecc,incl*rad,omega*rad,argp*rad,nu*rad,m*rad, ...
            arglat*rad,truelon*rad,lonper*rad );


        fprintf(1,'\n other tests \n');
        [rn,vn] = eq2rv( 7000.0, 0.001, 0.001, 0.001, 0.001, 45.0/rad, fr);
        fprintf(1,'rn    %15.9f %15.9f %15.9f',rn );
        fprintf(1,' vn %15.10f %15.10f %15.10f\n',vn );
        [ a, n, af, ag, chi, psi, meanlonM, meanlonNu, fr ] = rv2eq (rn,vn);
        fprintf(1,'       fr     a km         n rad      af           ag         chi          psi      meanlonnu deg   meanlonm deg \n');
        fprintf(1,'eqs    %2d %11.4f %11.4f %13.9f %13.7f %11.5f %11.5f %11.5f %11.5f \n',...
            fr, a, n, af, ag, chi, psi, meanlonNu*rad, meanlonM*rad );
    end


    function testlon2nu()
        jdut1 = 2449470.5;
        incl = 35.324598 / rad;
        lon = -121.3487 / rad;
        raan = 45.0 / rad;
        argp = 34.456798 / rad;

        lon = lon2nu(jdut1, lon, incl, raan, argp, out strtext);

    end

    % faster version?
    function testnewtonmx()
        rad = 180.0 / pi;
        ecc = 0.4;
        m = 334.566986 / rad;

        newtonmx(ecc, m, out eccanom, out nu);

        fprintf(1,' newtonmx ' + ecc, ' m ' + (m * rad),
        ' eccanom ' + (eccanom * rad), ' nu ' + (nu * rad));
    end

    % --------  newtonm      - find eccentric and true anomaly given ecc and mean anomaly
    function testnewtonm()
        rad = 180.0 / pi;
        ecc = 0.4;
        eccanom = 334.566986 / rad;
        newtone(ecc, eccanom, out m, out nu);

        fprintf(1,' newtone ecc ' + ecc,' eccanom ' + (eccanom * rad) +
        ' m ' + (m * rad),' nu ' + (nu * rad));

        ecc = 0.34;
        m = 235.4 / rad;
        newtonm(ecc, m, out eccanom, out nu);
        fprintf(1,' newtonm ecc ' + ecc,' m ' + (m * rad) +
        ' eccanom ' + (eccanom * rad),' nu ' + (nu * rad));
    end


    % --------  newtone      - find true and mean anomaly given ecc and eccentric anomaly
    function testnewtone()
        double rad = 180.0 / pi;
        ecc = 0.34;
        eccanom = 334.566986 / rad;
        newtone(ecc, eccanom, out m, out nu);

        fprintf(1,' newtone ecc ' + ecc,' eccanom ' + (eccanom * rad) +
        ' m ' + (m * rad),' nu ', (nu * rad));
    end

    % --------  newtonnu     - find eccentric and mean anomaly given ecc and true anomaly
    function testnewtonnu()
        double rad = 180.0 / pi;
        ecc = 0.34;
        nu = 134.567001 / rad;

        [eccanom, m] = newtonnu(ecc, nu);

        fprintf(1,' newtonnu ecc ' + ecc,' nu ' + (nu * rad) +
        ' eccanom ' + (eccanom * rad),' m ' + (m * rad));
    end


    function [c2new, c3new, xnew, znew] =  keplerc2c3(r1, v1);

        % -------------------------  implementation   -----------------
        ktr, i, numiter, mulrev;
        h = new double(4);
        rx = new double(4);
        vx = new double(4);
        double f, g, fdot, gdot, rval, xold, xoldsqrd,
        xnewsqrd, p, dtnew, rdotv, a, dtsec,
        alpha, sme, period, s, w, temp, magro, magvo, magh, magr, magv;
        char show;
        %string errork;

        show = 'n';
        double small, twopi, halfpi;

        for (ii = 0; ii < 3; ii++)

            rx[ii] = 0.0;
            vx[ii] = 0.0;
        end
        r2 = rx;  % seems to be the only way to get these variables out
        v2 = vx;
        xnew = 0.0;
        c2new = 0.0;
        c3new = 0.0;

        small = 0.000000001;
        twopi = 2.0 * pi;
        halfpi = pi * 0.5;

        % -------------------------  implementation   -----------------
        % set constants and intermediate printouts
        numiter = 50;

        if (show == 'y')

            %            printf(' r1 %16.8f %16.8f %16.8f ER \n',r1(1)/gravConst.re,r1(2)/gravConst.re,r1(3)/gravConst. );
            %            printf(' vo %16.8f %16.8f %16.8f ER/TU \n',vo(1)/velkmps, vo(2)/velkmps, vo(3)/velkmps );
        end

        % --------------------  initialize values   -------------------
        ktr = 0;
        xold = 0.0;
        znew = 0.0;
        %errork = '      ok';
        dtsec = dtseco;
        mulrev = 0;

        if (Math.Abs(dtseco) > small)

            magro = mag(r1);
            magvo = mag(v1);
            rdotv = dot(r1, v1);

            % -------------  find sme, alpha, and a  ------------------
            sme = ((magvo * magvo) * 0.5) - (gravConst.mu / magro);
            alpha = -sme * 2.0 / gravConst.mu;

            if (Math.Abs(sme) > small)
                a = -gravConst.mu / (2.0 * sme);
            else
                a = 999999.9;
                if (Math.Abs(alpha) < small)   % parabola
                    alpha = 0.0;

                    if (show == 'y')

                        %           printf(' sme %16.8f  a %16.8f alp  %16.8f ER \n',sme/(gravConst.mu/gravConst.), a/gravConst.re, alpha * gravConst. );
                        %           printf(' sme %16.8f  a %16.8f alp  %16.8f km \n',sme, a, alpha );
                        %           printf(' ktr      xn        psi           r2          xn+1        dtn \n' );
                    end

                    % ------------   setup initial guess for x  ---------------
                    % -----------------  circle and ellipse -------------------
                    if (alpha >= small)

                        period = twopi * sqrt(Math.Abs(a * a * a) / gravConst.mu);
                        % ------- next if needed for 2body multi-rev ----------
                        if (Math.Abs(dtseco) > Math.Abs(period))
                            % including the truncation will produce vertical lines that are parallel
                            % (plotting chi vs time)
                            %                    dtsec = rem( dtseco,period );
                            mulrev = Convert.ToInt16(dtseco / period);
                            if (Math.Abs(alpha - 1.0) > small)
                                xold = sqrt(gravConst.mu) * dtsec * alpha;
                            else
                                % - first guess can't be too close. ie a circle, r2=a
                                xold = sqrt(gravConst.mu) * dtsec * alpha * 0.97;
                            end
                        else

                            % --------------------  parabola  ---------------------
                            if (Math.Abs(alpha) < small)

                                cross(r1, v1, out h);
                                magh = mag(h);
                                p = magh * magh / gravConst.mu;
                                s = 0.5 * (halfpi - atan(3.0 * sqrt(gravConst.mu / (p * p * p)) * dtsec));
                                w = atan(Math.Pow(Math.Tan(s), (1.0 / 3.0)));
                                xold = sqrt(p) * (2.0 * cot(2.0 * w));
                                alpha = 0.0;
                            end
                        else

                            % ------------------  hyperbola  ------------------
                            temp = -2.0 * gravConst.mu * dtsec /
                            (a * (rdotv + Math.Sign(dtsec) * sqrt(-gravConst.mu * a) *
                            (1.0 - magro * alpha)));
                            xold = Math.Sign(dtsec) * sqrt(-a) * Math.Log(temp);
                        end
                    end % if alpha

                    ktr = 1;
                    dtnew = -10.0;
                    double tmp = 1.0 / sqrt(gravConst.mu);
                    while ((Math.Abs(dtnew * tmp - dtsec) >= small) && (ktr < numiter))

                        xoldsqrd = xold * xold;
                        znew = xoldsqrd * alpha;

                        % ------------- find c2 and c3 functions --------------
                        findc2c3(znew, out c2new, out c3new);

                        % ------- use a newton iteration for new values -------
                        rval = xoldsqrd * c2new + rdotv * tmp * xold * (1.0 - znew * c3new) +
                        magro * (1.0 - znew * c2new);
                        dtnew = xoldsqrd * xold * c3new + rdotv * tmp * xoldsqrd * c2new +
                        magro * xold * (1.0 - znew * c3new);

                        % ------------- calculate new value for x -------------
                        xnew = xold + (dtsec * sqrt(gravConst.mu) - dtnew) / rval;

                        % ----- check if the univ param goes negative. if so, use bissection
                        if (xnew < 0.0)
                            xnew = xold * 0.5;

                            if (show == 'y')

                                %  printf('%3i %11.7f %11.7f %11.7f %11.7f %11.7f \n', ktr,xold,znew,rval,xnew,dtnew);
                                %  printf('%3i %11.7f %11.7f %11.7f %11.7f %11.7f \n', ktr,xold/sqrt(gravConst.),znew,rval/gravConst.re,xnew/sqrt(gravConst.),dtnew/sqrt(mu));
                            end

                            ktr = ktr + 1;
                            xold = xnew;
                        end  % while

                        if (ktr >= numiter)

                            %errork = 'knotconv';
                            %           printf('not converged in %2i iterations \n',numiter );
                            for (i = 0; i < 3; i++)

                                v2[i] = 0.0;
                                r2[i] = v2[i];
                            end
                        end
                    else

                        % --- find position and velocity vectors at new time --
                        xnewsqrd = xnew * xnew;
                        f = 1.0 - (xnewsqrd * c2new / magro);
                        g = dtsec - xnewsqrd * xnew * c3new / sqrt(gravConst.mu);

                        for (i = 0; i < 3; i++)
                            r2[i] = f * r1[i] + g * v1[i];
                            magr = mag(r2);
                            gdot = 1.0 - (xnewsqrd * c2new / magr);
                            fdot = (sqrt(gravConst.mu) * xnew / (magro * magr)) * (znew * c3new - 1.0);
                            for (i = 0; i < 3; i++)
                                v2[i] = fdot * r1[i] + gdot * v1[i];
                                magv = mag(v2);
                                temp = f * gdot - fdot * g;
                                %if (Math.Abs(temp - 1.0) > 0.00001)
                                %    errork = 'fandg';

                                if (show == 'y')

                                    %           printf('f %16.8f g %16.8f fdot %16.8f gdot %16.8f \n',f, g, fdot, gdot );
                                    %           printf('f %16.8f g %16.8f fdot %16.8f gdot %16.8f \n',f, g, fdot, gdot );
                                    %           printf('r1 %16.8f %16.8f %16.8f ER \n',r2(1)/gravConst.re,r2(2)/gravConst.re,r2(3)/gravConst. );
                                    %           printf('v1 %16.8f %16.8f %16.8f ER/TU \n',v(1)/velkmps, v(2)/velkmps, v(3)/velkmps );
                                end
                            end
                        end % if fabs
                    else
                        % ----------- set vectors to incoming since 0 time --------
                        for (i = 0; i < 3; i++)

                            r2[i] = r1[i];
                            v2[i] = v1[i];
                        end

                        %       fprintf( fid,'%11.5f  %11.5f %11.5f  %5i %3i ',znew, dtseco/60.0, xold/(rad), ktr, mulrev );
                    end  % keplerc2c3


                    function testfindfandg()
                        r1 = [ 4938.49830042171, -1922.24810472241, 4384.68293292613 ];
                        v1 = [ 0.738204644165659, 7.20989453238397, 2.32877392066299 ];
                        r2 = [ -1105.78023519582, 2373.16130661458, 6713.89444816503 ];
                        v2 = [ 5.4720951867079, -4.39299050886976, 2.45681739563752 ];
                        dtsec = 6372.69272563561; % 1ld
                        dtsec = 60.0; % must be small step sizes!!

                        %% dan hyperbolic test
                        %r1 = [ 4070.5942270000000, 3786.8271570000002, 4697.0576309999997 ];
                        %%v1 = [ -32553.559100851671, -37563.543526937596, -37563.543526937596 ];
                        %% exact opposite from r velocity
                        %v1 = [ -34845.69531184976, -32416.55098811211, -40208.43885307875 ];
                        %r2 = [ -1105.78023519582, 2373.16130661458, 6713.89444816503 ];
                        %v2 = [ 5.4720951867079, -4.39299050886976, 2.45681739563752 ];
                        %dtsec = 0.25; % must be small step sizes!!

                        fprintf(1,' r1 ' + r1(1), r1(2), r1(3),               'v1 ' + v1(1), v1(2), v1(3));

                        for i = 0:5

                            if (i == 0)
                                dtsec = 60.0;
                            end
                            if (i == 1)
                                dtsec = 0.1;
                            end
                            if (i == 2)
                                dtsec = 1.0;
                            end
                            if (i == 3)
                                dtsec = 10.0;
                            end
                            if (i == 4)
                                dtsec = 100.0;
                            end
                            if (i == 5)
                                dtsec = 500.0;
                            end

                            keplerc2c3(r1, v1, dtsec, out r2, out v2, out c2, out c3, out x, out z);
                            fprintf(1,' r2 ' + r2(1), r2(2), r2(3),                    'v2 ' + v2(1), v2(2), v2(3));
                            fprintf(1,'c2 ' + c2,' c3 ' + c3,' x ' +                    x,' z ' + z,' dtsec ' + dtsec);

                            opt = 'pqw';
                            findfandg(r1, v1, r2, v2, dtsec, x, c2, c3, z, opt, out f, out g, out fdot, out gdot);
                            double ans = f * gdot - g * fdot;
                            fprintf(1,'f and g pqw    ' + f, g,                    fdot, gdot, ans);

                            opt = 'series';  %  pqw, series, c2c3
                            findfandg(r1, v1, r2, v2, dtsec, x, c2, c3, z, opt, out f, out g, out fdot, out gdot);
                            ans = f * gdot - g * fdot;
                            fprintf(1,'f and g series ' + f, g,                    fdot, gdot, ans);

                            opt = 'c2c3';  %  pqw, series, c2c3
                            findfandg(r1, v1, r2, v2, dtsec, x, c2, c3, z, opt, out f, out g, out fdot, out gdot);
                            ans = f * gdot - g * fdot;

                            fprintf(1,'f and g c2c3   ' + f, g,                    fdot, gdot, ans,'\n');
                        end

                    end

                    function testcheckhitearth()
                        nrev = 0;
                        r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                        r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                        % assume circular initial orbit for vel calcs
                        v1t = [ 0.0, sqrt(gravConst.mu / r1(1)), 0.0 ];
                        ang = atan(r2(2) / r2(1));
                        v2t = [ -sqrt(gravConst.mu / r2(2)) * cos(ang), sqrt(gravConst.mu / r2(1)) * sin(ang), 0.0 ];
                        altpad = 100.0; % km

                        magr1 = mag(r1);
                        magr2 = mag(r2);
                        cosdeltanu = dot(r1, r2) / (magr1 * magr2);

                        checkhitearth(altpad, r1, v1t, r2, v2t, nrev, out hitearth, out hitearthstr, out rp, out a);

                        fprintf(1,'hitearth? ' + hitearthstr, (cos(cosdeltanu) * 180.0 / pi));
                    end

                    function testcheckhitearthc()
                        nrev = 0;
                        r1c = [ 2.500000, 0.000000, 0.000000 ];
                        r2c = [ 1.9151111, 1.6069690, 0.000000 ];
                        % assume circular initial orbit for vel calcs
                        v1tc = [ 0.0, sqrt(1.0 / r1c(1)), 0.0 ];
                        ang = atan(r2c(2) / r2c(1));
                        v2tc = [ -sqrt(1.0 / r2c(2)) * cos(ang), sqrt(1.0 / r2c(1)) * sin(ang), 0.0 ];
                        altpadc = 100.0 / gravConst.re; % er

                        magr1c = mag(r1c);
                        magr2c = mag(r2c);
                        cosdeltanu = dot(r1c, r2c) / (magr1c * magr2c);
                        [hitearth, hitearthstr, rp, a] = checkhitearthc(altpadc, r1c, v1tc, r2c, v2tc, nrev);

                        fprintf(1,'hitearth? ' + hitearthstr, (acos(cosdeltanu) * 180.0 / pi));
                    end


                    function testgibbs()
                        rad = 180.0 / pi;

                        r1 = [ 0.0000000, 0.000000, gravConst.re ];
                        r2 = [ 0.0000000, -4464.696, -5102.509 ];
                        r3 = [ 0.0000000, 5740.323, 3189.068 ];

                        [v2, theta, theta1, copa, errorstr] = gibbs(r1, r2, r3);

                        fprintf(1,'testgibbs %11.7f  %11.7f  %11.7f \n', v2(1), v2(2), v2(3));
                        fprintf(1,'testgibbs %11.7f  %11.7f  %11.7f \n', theta * rad, theta1 * rad, copa * rad);
                    end


                    function testhgibbs()
                        rad = 180.0 / pi;

                        r1 = [ 0.0000000, 0.000000, gravConst.re ];
                        r2 = [ 0.0000000, -4464.696, -5102.509 ];
                        r3 = [ 0.0000000, 5740.323, 3189.068 ];
                        jd1 = 2451849.5;
                        jd2 = jd1 + 1.0 / 1440.0 + 16.48 / 86400.0;
                        jd3 = jd1 + 2.0 / 1440.0 + 33.04 / 86400.0;
                        [v2, theta, theta1, copa, errorstr] = herrgibbs(r1, r2, r3, jd1, jd2, jd3);

                        fprintf(1,'testherrgibbs %11.7f  %11.7f  %11.7f \n', v2(1), v2(2), v2(3));
                        fprintf(1,'testherrgibbs %11.7f  %11.7f  %11.7f \n', (theta * rad), (theta1 * rad), (copa * rad));
                    end



                    function testgeo()
                        double rad = 180.0 / pi;

                        % misc test
                        dt = 86400.0;  % 1 day in sec
                        c22 = 1.57461532572292E-06;
                        s22 = -9.03872789196567E-07;
                        j22 = sqrt(c22 * c22 + s22 * s22);
                        % stable longitude point
                        lons = 0.5 * atan2(s22, c22);
                        omegaearth = 0.000072921158553;   % rad /s
                        z = 6.6017;  % rad
                        % initial longitude with 0 initial drift
                        lonp = 12.0 / rad;
                        lonp = lons;

                        lona = lonp - 1.0 / rad;
                        lona = lons;
                        londot = 0.0;
                        for jj=0:400

                            lona = lona + londot * dt;
                            londot = 3.0 * omegaearth / z * sqrt(2.0 * j22) * sqrt(cos(2.0 * (lona - lons)) - cos(2.0 * (lonp - lons)));
                            strbuildObs.AppendLine(jj, lona * rad, (lonp - lons) * rad, londot * rad / 86400.0);
                        end % for through all the tracks testing rtasc/decl rates
                        File.WriteAllText('D:\faabook\current\excel\testgeo.out', strbuildObs);
                    end


   
    
    
                        % test angles-only routines
                        % output these results separately to the testall directory
                        function testangles()
                            %conv = pi / (180.0 * 3600.0);
                            rad = 180.0 / pi;
                            errstr = '';
                            char diffsites = 'n';
                            StringBuilder strbuildall = new StringBuilder();
                            StringBuilder strbuildallsum = new StringBuilder();
    
                            this.opsStatus.Text = 'Test Angles ';
                            Refresh();
    
                            string nutLoc;
                            string ans;
                            Int32 ktrActObs;
                            string EOPupdate;
                            Int32 mjdeopstart;
                            nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                            [iau80arr] = iau80in(nutLoc);
                            nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                            [iau06arr] = iau06in(nutLoc);
    
                            eopFileName = 'D:\Codes\LIBRARY\DataLib\EOP-All-v1.1_2020-02-12.txt';
                            [eoparr, mjdeopstart, ktrActObs, updDate] = readeop(eopFileName);
    
                            % now read it in
                            jdxysstart, jdfxysstart;
                            AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);
    
                            % gooding tests cases from Gooding paper (1997 CMDA)
                            los1;
                            los2;
                            los3;
    
                            % read input data
                            % note the input data has a # line between each case
                            string infilename = @'D:\Codes\LIBRARY\DataLib\anglestest.dat';
                            string[] fileData = File.ReadAllLines(infilename);
    
                            % --- read obs data in
                            %caseopt = 0;  % set this for whichever case to run
    
                            % find mins
                            % orbits only need to be close
                            %double rtol = 500.0; % km
                            %double vtol = 0.1;   % km/s
                            %double atol = 500.0; % km
                            %double ptol = 500.0; % km
                            %double etol = 0.1;  %
                            itol = 5.0 / rad;   % rad
    
                            for caseopt = 0 : 24  % 0  23
    
                                strbuildall.AppendLine('caseopt ' + caseopt);
                                ktr = 1;     % skip header, go to next # comment line
    
                                line = fileData[ktr];
                                line.Replace(@'\s+', ' ');
                                string[] linesplt = line.Split(' ');
                                tmpcase = Convert.ToInt32(linesplt(2));
                                while (tmpcase ~= caseopt)
    
                                    line = fileData[ktr];
                                    line.Replace(@'\s+', ' ');
                                    linesplt = line.Split(' ');
                                    if (line(1).Equals('#'))
                                        tmpcase = Convert.ToInt32(linesplt(2));
                                    end
    
                                    ktr = ktr + 1;
                                end
    
                                % get all the data for caseopt
                                obsktr = 0;
                                % set the first case only
                                if (caseopt == 0)
    
                                    ans = fileData[ktr];
                                    ktr = 2;
                                else
                                    ans = fileData[ktr - 1];
                                end
                                while (ktr < fileData.Count() && !fileData[ktr](1).Equals('#'))
    
                                    line = fileData[ktr];
                                    linesplt = line.Split(',');
                                    mon[obsktr] = Convert.ToInt32(linesplt(2));
                                    day[obsktr] = Convert.ToInt32(linesplt(1));
                                    year[obsktr] = Convert.ToInt32(linesplt(3));
                                    hr[obsktr] = Convert.ToInt32(linesplt(4));
                                    minute[obsktr] = Convert.ToInt32(linesplt(5));
                                    second[obsktr] = Convert.ToDouble(linesplt(6));
                                    jday(year[obsktr], mon[obsktr], day[obsktr], hr[obsktr], minute[obsktr], second[obsktr],
                                    out jd[obsktr], out jdf[obsktr]);
    
                                    latgd[obsktr] = Convert.ToDouble(linesplt(7)) / rad;
                                    lon[obsktr] = Convert.ToDouble(linesplt(8)) / rad;
                                    alt[obsktr] = Convert.ToDouble(linesplt(9)) / rad;
    
                                    trtasc[obsktr] = Convert.ToDouble(linesplt(10)) / rad;
                                    tdecl[obsktr] = Convert.ToDouble(linesplt(11)) / rad;
                                    if (obsktr == 0)
                                        initguess[tmpcase] = Convert.ToDouble(linesplt(12));  % initial guess in km
                                    end
    
                                    obsktr = obsktr + 1;
                                    ktr = ktr + 1;
                                end
    
                                idx1 = 0;
                                idx2 = 1;
                                idx3 = 2;
                                strbuildallsum.AppendLine('/n/n ================================ case number ' + caseopt, ' ================================');
                                strbuildall.AppendLine('/n/n ================================ case number ' + caseopt, ' ================================');
                                switch (caseopt)
    
                                    case 0:
                                        idx1 = 2;
                                        idx2 = 4;
                                        idx3 = 5;
    
                                        break;
                                    case 1:
                                        % book example
                                        %dut1 = -0.609641;      % sec
                                        %dat = 35;              % sec
                                        %lod = 0.0;
                                        %xp = 0.137495 * conv;  % ' to rad
                                        %yp = 0.342416 * conv;
                                        %ddpsi = 0.0;  % ' to rad
                                        %ddeps = 0.0;
                                        %ddx = 0.0;    % ' to rad
                                        %ddy = 0.0;
                                        %latgd = 40.0 / rad;
                                        %lon = -110.0 / rad;
                                        %alt = 2.0;  % km
                                        % ---- select points to use
                                        idx1 = 2;
                                        idx2 = 4;
                                        idx3 = 5;
    
                                        idx1 = 5;
                                        idx2 = 9;
                                        idx3 = 13;
    
                                        break;
                                    case n when (n >= 2 && n <= 12):
                                        idx1 = 0;
                                        idx2 = 1;
                                        idx3 = 2;
                                        break;
                                end  % end switch
    
                                %    % herrick interplantetary Herrick pp 384-5 & 418 (gibbs)
                                %    % units of days in 1910 (?) and au
                                %    % says mu = 1.0
                                %    % k = 0, rho = 5.9 and 5.9 au?
                                %    % some initi rho of 1000000 still works
                                %    % days 7.8205, 26.7480, 48.6262 (in 1910 Nov)
                                %    %rtasc = 3-50-24.3, decl = 25-11-10.5
                                %    %rtasc = 3-13-3.0  decl = 22-29-31.3
                                %    %rtasc = 4-54-19.5  decl = 20-14-51.9
                                %    double tau12 = 0.325593;
                                %    double tau13 = 0.701944;
                                %    rseci1 = [ 0.7000687 * astroConsts.au,
                                %        0.6429399 * astroConsts.au, 0.2789211 * astroConsts.au ];
                                %    rseci2 = [ 0.4306907, 0.8143496, 0.3532745 ];
                                %    rseci3 = [ 0.0628371, 0.9007098, 0.3907417 ];
                                %    los1 = [ 0.9028975, 0.0606048, 0.4255621 ];
                                %    los2 = [ 0.9224764, 0.0518570, 0.3825549 ];
                                %    los3 = [ 0.9347684, 0.0802269, 0.3460802 ];
                                %    %(light-corrected times not used but aze 0.325578 and 0.701903)
                                %    break;
                                %case 2:
                                %    % extreme case Lane ex 2
                                %    tau12 = 1.570796327;
                                %    tau13 = 3.141592654;
                                %    rseci1 = [ 0.0, -1.0, 0.0 ];
                                %    rseci2 = [ 1.0, 0.0, 0.0 ];
                                %    rseci3 = [ 0.0, 1.0, 0.0 ];
                                %    los1 = [ 0.0, 1.0, 0.0 ];
                                %    los2 = [ 0.0, 0.0, 1.0 ];
                                %    los3 = [ 0.0, -1.0, 0.0 ];
    
                                %    break;
                                %case 3:
                                %    % rectilinear case
                                %    tau12 = 1.047197552;
                                %    tau13 = 2.960420507;
                                %    rseci1 = [ 1.0, 0.0, 0.0 ];
                                %    rseci2 = [ 0.0, 1.0, 0.0 ];
                                %    rseci3 = [ 0.0, 0.0, 0.0 ];
                                %    los1 = [ -1.0, 0.0, 0.5 ];
                                %    los2 = [ 0.0, -1.0, 1.5 ];
                                %    los3 = [ 0.0, 0.0, 2.0 ];
                                %    break;
                                %case 5:
                                %    % revised escobal example
                                %    tau12 = 0.0381533;
                                %    tau13 = 0.0399364;
                                %    rseci1 = [ 0.16606957, 0.84119785, -0.51291356 ];
                                %    rseci2 = [ -0.73815134, -0.41528280, 0.53035336 ];
                                %    rseci3 = [ -0.73343987, -0.42352540, 0.53037164 ];
                                %    los1 = [ -0.92475472, -0.37382824, -0.07128226 ];
                                %    los2 = [ 0.80904274, -0.55953385, 0.17992142 ];
                                %    los3 = [ 0.85044131, -0.49106628, 0.18868888 ];
                                %    break;
                                %case 7:
                                %    % example from Lane
                                %    tau12 = 2.2;
                                %    tau13 = 0.35225232;
                                %    rseci2 = [ 0.89263524, 0.28086002, 0.35277012 ];
                                %    rseci3 = [ -0.02703285, 0.93585748, 0.35152067 ];
                                %    los1 = [ 0.76526944, 0.12314580, 0.63182102 ];
                                %    los2 = [ -0.21266402, -0.54295751, 0.81238609 ];
                                %    los3 = [ 0.52029946, -0.39083440, 0.75930030 ];
                                %    break;
    
    
                                % state already exists use that period
                                % TLE exists use that period
                                % otherwise options, 95 min, 108 min, 150 min, 250 min, 7.2 hr, 12 hr, and 24 hr
    
                                %                for (z = 0; z <= -10; z++)
                                %
                                %    switch (z)
                                %
                                %        case 0:
                                %            idx1 = 2;
                                %            idx2 = 4;
                                %            idx3 = 5;
                                %            break;
                                %        case 1:
                                %            idx1 = 0;
                                %            idx2 = 2;
                                %            idx3 = 3;
                                %            break;
                                %        case 2:
                                %            idx1 = 0;
                                %            idx2 = 2;
                                %            idx3 = 9;
                                %            break;
                                %        case 3:
                                %            idx1 = 0;
                                %            idx2 = 2;
                                %            idx3 = 6;
                                %            break;
                                %        case 4:
                                %            idx1 = 0;
                                %            idx2 = 2;
                                %            idx3 = 7;
                                %            break;
                                %        case 5:
                                %            idx1 = 0;
                                %            idx2 = 2;
                                %            idx3 = 12;
                                %            break;
                                %        case 6:
                                %            idx1 = 2;
                                %            idx2 = 4;
                                %            idx3 = 14;
                                %            break;
                                %        case 7:
                                %            idx1 = 2;
                                %            idx2 = 4;
                                %            idx3 = 7;
                                %            break;
                                %        case 8:
                                %            idx1 = 0;
                                %            idx2 = 13;
                                %            idx3 = 14;
                                %            break;
                                %        case 9:
                                %            idx1 = 2;
                                %            idx2 = 4;
                                %            idx3 = 10;
                                %            break;
                                %        case 10:
                                %            idx1 = 10;
                                %            idx2 = 11;
                                %            idx3 = 12;
                                %            break;
                                %    end
                                %    fprintf(1,'\nz ' + z);
    
                                %jd1 = jd[idx1] + jdf[idx1];
                                %jd2 = jd[idx2] + jdf[idx2];
                                %jd3 = jd[idx3] + jdf[idx3];
                                site(latgd[idx1], lon[idx1], alt[idx1], out rsecef1, out vsecef1);
                                EOPSPWLibr.findeopparam(jd[idx1], jdf[idx1], 's', EOPSPWLibr.eopdata, mjdeopstart + 2400000.5,
                                out dut1, out dat, out lod, out xp, out yp, out ddpsi, out ddeps, out ddx, out ddy);
                                %convtime(year[idx1], mon[idx1], day[idx1], hr[idx1], minute[idx1], second[idx1], 0, dut1, dat,
                                %    out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
                                %    out tt, out ttt, out jdtt, out jdttfrac, out tdb, out ttdb, out jdtdb, out jdtdbfrac);
                                jdtt = jd[idx1];
                                jdftt = jdf[idx1] + (dat + 32.184) / 86400.0;
                                ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
                                % note you have to use tdb for time of ineterst AND j2000 (when dat = 32)
                                %  ttt = (jd + jdFrac + (dat + 32.184) / 86400.0 - 2451545.0 - (32 + 32.184) / 86400.0) / 36525.0;
                                jdut1 = jd[idx1] + jdf[idx1] + dut1 / 86400.0;
                                eci_ecef(ref rseci1, ref vseci1, MathTimeLib.Edirection.efrom, ref rsecef1, ref vsecef1,
                                AstroLib.EOpt.e80, iau80arr, iau06arr,
                                jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
    
                                site(latgd[idx2], lon[idx2], alt[idx2], out rsecef2, out vsecef2);
                                EOPSPWLibr.findeopparam(jd[idx2], jdf[idx2], 's', EOPSPWLibr.eopdata, mjdeopstart + 2400000.5,
                                out dut1, out dat, out lod, out xp, out yp, out ddpsi, out ddeps, out ddx, out ddy);
                                %convtime(year[idx2], mon[idx2], day[idx2], hr[idx2], minute[idx2], second[idx2], 0, dut1, dat,
                                %    out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
                                %    out tt, out ttt, out jdtt, out jdttfrac, out tdb, out ttdb, out jdtdb, out jdtdbfrac);
                                jdtt = jd[idx2];
                                jdftt = jdf[idx2] + (dat + 32.184) / 86400.0;
                                ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
                                jdut1 = jd[idx2] + jdf[idx2] + dut1 / 86400.0;
                                eci_ecef(ref rseci2, ref vseci2, MathTimeLib.Edirection.efrom, ref rsecef2, ref vsecef2,
                                AstroLib.EOpt.e80, iau80arr, iau06arr,
                                jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
                                double gst, lst;
                                lstime(lon[idx2], jdut1, out lst, out gst);
                                strbuildall.AppendLine('\nlst ' + lst, (lst * rad));
    
    
                                site(latgd[idx3], lon[idx3], alt[idx3], out rsecef3, out vsecef3);
                                EOPSPWLibr.findeopparam(jd[idx3], jdf[idx3], 's', EOPSPWLibr.eopdata, mjdeopstart + 2400000.5,
                                out dut1, out dat, out lod, out xp, out yp, out ddpsi, out ddeps, out ddx, out ddy);
                                jdtt = jd[idx3];
                                jdftt = jdf[idx3] + (dat + 32.184) / 86400.0;
                                ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
                                jdut1 = jd[idx3] + jdf[idx3] + dut1 / 86400.0;
                                eci_ecef(ref rseci3, ref vseci3, MathTimeLib.Edirection.efrom, ref rsecef3, ref vsecef3,
                                AstroLib.EOpt.e80, iau80arr, iau06arr,
                                jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
    
                                if (Math.Abs(latgd[idx1] - latgd[idx2]) < 0.001 && Math.Abs(latgd[idx1] - latgd[idx3]) < 0.001
                                    && Math.Abs(lon[idx1] - lon[idx2]) < 0.001 && Math.Abs(lon[idx1] - lon[idx3]) < 0.001)
                                    diffsites = 'n';
                                else
                                    diffsites = 'y';
                                end
    
    
                                % write output
                                strbuildall.AppendLine('rseci1 ' + rseci1(1),                rseci1(2), rseci1(3));
                                strbuildall.AppendLine('rseci2 ' + rseci2(1),                    rseci2(2), rseci2(3));
                                strbuildall.AppendLine('rseci3 ' + rseci3(1),                    rseci3(2), rseci3(3));
    
                                los1(1) = cos(tdecl[idx1]) * cos(trtasc[idx1]);
                                los1(2) = cos(tdecl[idx1]) * sin(trtasc[idx1]);
                                los1(3) = sin(tdecl[idx1]);
    
                                los2(1) = cos(tdecl[idx2]) * cos(trtasc[idx2]);
                                los2(2) = cos(tdecl[idx2]) * sin(trtasc[idx2]);
                                los2(3) = sin(tdecl[idx2]);
    
                                los3(1) = cos(tdecl[idx3]) * cos(trtasc[idx3]);
                                los3(2) = cos(tdecl[idx3]) * sin(trtasc[idx3]);
                                los3(3) = sin(tdecl[idx3]);
    
                                strbuildall.AppendLine('los1 ' + los1(1).ToString('0.00000000'),
                                los1(2).ToString('0.00000000'), los1(3).ToString('0.00000000') +
                                ' ' + mag(los1).ToString('0.00000000'));
                                strbuildall.AppendLine('los2 ' + los2(1).ToString('0.00000000'),
                                los2(2).ToString('0.00000000'), los2(3).ToString('0.00000000') +
                                ' ' + mag(los2).ToString('0.00000000'));
                                strbuildall.AppendLine('los3 ' + los3(1).ToString('0.00000000'),
                                los3(2).ToString('0.00000000'), los3(3) +
                                ' ' + mag(los3).ToString('0.00000000'));
    
                                % to get initial guess, take measurments (1/2 and 2/3), assume circular orbit
                                % find velocity and compare - just distinguish between LEO, GPS and GEO for now
                                dt1 = (jd[idx2] - jd[idx1]) * 86400.0 + (jdf[idx2] - jdf[idx1]) * 86400.0;
                                dt2 = (jd[idx3] - jd[idx2]) * 86400.0 + (jdf[idx3] - jdf[idx2]) * 86400.0;
                                dtrtasc1 = (trtasc[idx2] - trtasc[idx1]) / dt1;
                                dtrtasc2 = (trtasc[idx3] - trtasc[idx2]) / dt2;
                                dtdecl1 = (tdecl[idx2] - tdecl[idx1]) / dt1;
                                dtdecl2 = (tdecl[idx3] - tdecl[idx2]) / dt2;
    
                                strbuildall.AppendLine('rtasc ' + (trtasc[idx1] * rad), (trtasc[idx2] * rad)
                                , (trtasc[idx3] * rad));
                                strbuildall.AppendLine('decl ' + (tdecl[idx1] * rad), (tdecl[idx2] * rad)
                                , (tdecl[idx3] * rad));
    
    
                                strbuildall.AppendLine('');
                                strbuildallsum.AppendLine('Laplace -----------------------------------');
                                strbuildall.AppendLine('Laplace -----------------------------------');
    
                                strbuildall.AppendLine('\n\ninputs: \n');
                                strbuildall.AppendLine('Site obs1 '
                                + rseci1(1), rseci1(2), rseci1(3)
                                + ' km  lat ' + (latgd[idx1] * rad), ' lon ' + (lon[idx1] * rad)
                                + alt[idx1]);
                                strbuildall.AppendLine('Site obs2 '
                                + rseci2(1), rseci2(2), rseci2(3)
                                + ' km  lat ' + (latgd[idx2] * rad), ' lon ' + (lon[idx2] * rad)
                                + alt[idx2]);
                                strbuildall.AppendLine('Site obs3 '
                                + rseci3(1), rseci3(2), rseci3(3)
                                + ' km  lat ' + (latgd[idx3] * rad), ' lon ' + (lon[idx3] * rad)
                                + alt[idx3]);
                                invjday(jd[idx1], jdf[idx1], out iyear1, out imon1, out iday1, out ihr1, out iminute1, out isecond1);
                                strbuildall.AppendLine('obs#1 ' + iyear1, imon1, iday1
                                , ihr1.ToString('00'), iminute1.ToString('00'), isecond1.ToString('0.000')
                                , (trtasc[idx1] * rad), (tdecl[idx1] * rad));
                                invjday(jd[idx2], jdf[idx2], out iyear2, out imon2, out iday2, out ihr2, out iminute2, out isecond2);
                                strbuildall.AppendLine('obs#2 ' + iyear2, imon2, iday2
                                , ihr2.ToString('00'), iminute2.ToString('00'), isecond2.ToString('0.000')
                                , (trtasc[idx2] * rad), (tdecl[idx2] * rad));
                                invjday(jd[idx3], jdf[idx3], out iyear3, out imon3, out iday3, out ihr3, out iminute3, out isecond3);
                                strbuildall.AppendLine('obs#3 ' + iyear3, imon3, iday3
                                , ihr3.ToString('00'), iminute3.ToString('00'), isecond3.ToString('0.000')
                                , (trtasc[idx3] * rad), (tdecl[idx3] * rad));
                                %if (caseopt == 2)
                                %    diffsites = 'y';
                                %else
                                %diffsites = 'n';
    
                                angleslaplace(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3],
                                diffsites, rseci1, rseci2, rseci3, out r2, out v2, out bigr2x, out errstr);
                                strbuildall.AppendLine(errstr);
                                strbuildall.AppendLine('r2 ' + r2(1), r2(2), r2(3) + 'v2 ' + v2(1), v2(2), v2(3));
                                rv2coe(r2, v2, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                                strbuildall.AppendLine('\nlaplace coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildall.AppendLine(ans);
                                strbuildallsum.AppendLine('laplace coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildallsum.AppendLine(ans);
    
                                strbuildallsum.AppendLine('Gauss  -----------------------------------');
                                strbuildall.AppendLine('Gauss  -----------------------------------');
                                if (caseopt == 23)
                                    % curtis example -many mistakes!
                                    rseci1 = [ 3489.8, 3430.2, 4078.5 ];
                                    rseci2 = [ 3460.1, 3460.1, 4078.5 ];
                                    rseci3 = [ 3429.9, 3490.1, 4078.5 ];
                                end
                                anglesgauss(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3],
                                rseci1, rseci2, rseci3, out r2, out v2, out errstr);
                                strbuildall.AppendLine(errstr);
                                strbuildall.AppendLine('r2 ' + r2(1),  r2(2), r2(3) + 'v2 ' + v2(1), v2(2), v2(3));
                                rv2coe(r2, v2, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                                strbuildall.AppendLine('gauss coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildall.AppendLine(ans);
                                strbuildallsum.AppendLine('gauss coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildallsum.AppendLine(ans);
    
                                double pctchg = 0.05;
                                strbuildallsum.AppendLine('Double-r -----------------------------------' );
                                strbuildall.AppendLine('Double-r -----------------------------------' );
                                % initial guesses needed for double-r and Gooding
                                % use result from Gauss as it's usually pretty good
                                % this seems to really help Gooding!!
                                getGaussRoot(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3],
                                rseci1, rseci2, rseci3, out bigr2x);
                                initguess[caseopt] = bigr2x;
    
                                rng1 = initguess[caseopt];  % old 12500 needs to be in km!! seems to do better when all the same? if too far off (*2) NAN
                                rng2 = initguess[caseopt] * 1.02;  % 1.02 might be better? make the initial guess a bit different
                                rng3 = initguess[caseopt] * 1.08;
                                anglesdoubler(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3],
                                rseci1, rseci2, rseci3, rng1, rng2, out r2, out v2, out errstr, pctchg);
                                strbuildall.AppendLine(errstr);
                                strbuildall.AppendLine('r2 ' + r2(1), r2(2), r2(3) + 'v2 ' + v2(1), v2(2), v2(3));
                                rv2coe(r2, v2, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                                strbuildall.AppendLine('doubler coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildall.AppendLine(ans);
                                strbuildallsum.AppendLine('doubler coes a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildallsum.AppendLine(ans);
    
    
                                strbuildallsum.AppendLine('Gooding -----------------------------------');
                                strbuildall.AppendLine('Gooding -----------------------------------');
                                numhalfrev = 0;
    
                                [bigr2x] = getGaussRoot(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3], rseci1, rseci2, rseci3);
                                initguess[caseopt] = bigr2x;
    
                                rng1 = initguess[caseopt];  % old 12500 needs to be in km!! seems to do better when all the same? if too far off (*2) NAN
                                rng2 = initguess[caseopt] * 1.02;  % 1.02 might be better? make the initial guess a bit different
                                rng3 = initguess[caseopt] * 1.08;
    
                                anglesgooding(tdecl[idx1], tdecl[idx2], tdecl[idx3], trtasc[idx1], trtasc[idx2], trtasc[idx3],
                                jd[idx1], jdf[idx1], jd[idx2], jdf[idx2], jd[idx3], jdf[idx3],
                                rseci1, rseci2, rseci3, numhalfrev, rng1, rng2, rng3, out r2, out v2, out errstr);
                                strbuildall.AppendLine(errstr);
                                strbuildall.AppendLine('r2 ' + r2(1), r2(2), r2(3)+ 'v2 ' + v2(1), v2(2), v2(3));
                                rv2coe(r2, v2, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                                strbuildall.AppendLine('gooding coes  a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildall.AppendLine(ans);
                                strbuildallsum.AppendLine('gooding coes  a= ' + a + ' e= ' + ecc.ToString('0.000000000') + ' i= ' + (incl * rad),
                                (raan * rad), (argp * rad), (nu * rad), (m * rad),
                                (arglat * rad)); %, (truelon * rad), (lonper * rad));
                                strbuildallsum.AppendLine(ans);
    
                                %                end  % loop through cases of caseopt = 0
    
                            end % caseopt
    
                            directory = 'D:\Codes\LIBRARY\cs\TestAll\';
                            fprintf(1,'angles only tests case results written to ' + directory + 'testall-Angles.out ');
                            fprintf(1,'geo data for chap 9 plot written to D:\faabook\current\excel\testgeo.out for ch9 plot ');
    
                            File.WriteAllText(directory + 'testall-Angles.out', strbuildall);
                            File.WriteAllText(directory + 'testall-Anglessum.out', strbuildallsum);
    
                        end   % testangles
    
    
    
    
    
                        function testlambertumins()
                            r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                            r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                            char dm = 'S';
                            %char de = 'L';
                            Int32 nrev = 0;
    
                            % timing of routines
                            var watch = System.Diagnostics.Stopwatch.StartNew();
                            for (i = 0; i < 1000; i++)
    
                                for j=1:5
                                    [tmin, tminp, tminenergy] = lambertminT(r1, r2, dm, 'L', nrev);
                                end
    
                                for j=1:5
                                    [tmin, tminp, tminenergy] = lambertminT(r1, r2, dm, 'H', nrev);
                                end
                            end
    
                            % timing of routines
                            for i=0:1000
    
                                lambertumins(r1, r2, 1, 'S', out kbi, out tof);
                                tbidu(2, 2) = kbi;
                                tbidu(2, 3) = tof;
                                lambertumins(r1, r2, 2, 'S', out kbi, out tof);
                                tbidu(3, 2) = kbi;
                                tbidu(3, 3) = tof;
                                lambertumins(r1, r2, 3, 'S', out kbi, out tof);
                                tbidu(4, 2) = kbi;
                                tbidu(4, 3) = tof;
                                lambertumins(r1, r2, 4, 'S', out kbi, out tof);
                                tbidu(5, 2) = kbi;
                                tbidu(5, 3) = tof;
                                lambertumins(r1, r2, 5, 'S', out kbi, out tof);
                                tbidu(6, 2) = kbi;
                                tbidu(6, 3) = tof;
    
                                lambertumins(r1, r2, 1, 'L', out kbi, out tof);
                                tbiru(2, 2) = kbi;
                                tbiru(2, 3) = tof;
                                lambertumins(r1, r2, 2, 'L', out kbi, out tof);
                                tbiru(3, 2) = kbi;
                                tbiru(3, 3) = tof;
                                lambertumins(r1, r2, 3, 'L', out kbi, out tof);
                                tbiru(4, 2) = kbi;
                                tbiru(4, 3) = tof;
                                lambertumins(r1, r2, 4, 'L', out kbi, out tof);
                                tbiru(5, 2) = kbi;
                                tbiru(5, 3) = tof;
                                lambertumins(r1, r2, 5, 'L', out kbi, out tof);
                                tbiru(6, 2) = kbi;
                                tbiru(6, 3) = tof;
                            end
    
                            tusec = 806.8111238242922;
                            ootusec = 1.0 / tusec;
    
                            [s, tau] = AstroLambertkLibr.lambertkmins1st(r1, r2);
    
                            % for general cases, use 'x' for dm to get the tof/kbi values
                            for i=0:1000
    
                                AstroLambertkLibr.lambertkmins(s, tau, 1, 'x', 'L', out kbi, out tof);
                                tbidk(2, 2) = kbi;
                                tbidk(2, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 2, 'x', 'L', out kbi, out tof);
                                tbidk(3, 2) = kbi;
                                tbidk(3, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 3, 'x', 'L', out kbi, out tof);
                                tbidk(4, 2) = kbi;
                                tbidk(4, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 4, 'x', 'L', out kbi, out tof);
                                tbidk(5, 2) = kbi;
                                tbidk(5, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 5, 'x', 'L', out kbi, out tof);
                                tbidk(6, 2) = kbi;
                                tbidk(6, 3) = tof * ootusec;
    
                                AstroLambertkLibr.lambertkmins(s, tau, 1, 'x', 'H', out kbi, out tof);
                                tbirk(2, 2) = kbi;
                                tbirk(2, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 2, 'x', 'H', out kbi, out tof);
                                tbirk(3, 2) = kbi;
                                tbirk(3, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 3, 'x', 'H', out kbi, out tof);
                                tbirk(4, 2) = kbi;
                                tbirk(4, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 4, 'x', 'H', out kbi, out tof);
                                tbirk(5, 2) = kbi;
                                tbirk(5, 3) = tof * ootusec;
                                AstroLambertkLibr.lambertkmins(s, tau, 5, 'x', 'H', out kbi, out tof);
                                tbirk(6, 2) = kbi;
                                tbirk(6, 3) = tof * ootusec;
                            end
    
                            fprintf(1,'time for Lambert kmin ' + watch.ElapsedMilliseconds);
                        end
    
                        function testlambertminT()
                            r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                            r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                            dm = 'S';
                            de = 'L';
                            nrev = 0;
    
                            lambertminT(r1, r2, dm, de, nrev, out tmin, out tminp, out tminenergy);
                            fprintf(1,'lambertmtmin  s ' + tmin,' minp ' + tminp,
                            ' minener ' + tminenergy);
    
                            lambertminT(r1, r2, dm, 'H', nrev, out tmin, out tminp, out tminenergy);
                            fprintf(1,'lambertmtmin  s ' + tmin,' minp ' + tminp +
                            ' minener ' + tminenergy);
                        end
    
                        function testlambhodograph()
                            double rad = 180.0 / pi;
                            r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                            r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                            % assume circular initial orbit for vel calcs
                            v1 = [ 0.0, sqrt(gravConst.mu / r1(1)), 0.0 ];
                            p = 12345.235;  % km
                            ecc = 0.023487;
                            dnu = 34.349128 / rad;
                            dtsec = 92854.234;
    
                            lambhodograph(r1, r2, v1, p, ecc, dnu, dtsec, out v1t, out v2t);
    
                            fprintf(1,'lamb hod ' + v1t(1), v1t(2), v1t(3),' \nlamb hod' +
                            v2t(1), v2t(2), v2t(3));
                        end
    
                        function testlambertbattin()
                            r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                            r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                            dm = 'S';
                            de = 'L';
                            nrev = 0;
                            dtsec = 76.0 * 60.0;
                            altpadc = 100.0 / gravConst.re;  %er
                            dtwait = 0.0;
    
                            [v1t, v2t, hitearth, errorsum, errorout] = lambertbattin(r1, r2, v1, dm, de, nrev, dtwait, dtsec, altpadc, 'y');
    
                            fprintf(1,'lambertbattin ' + v1t(1), v1t(2), v1t(3),' \nlambertbattin ', v2t(1), v2t(2), v2t(3));
                        end
    
                        function testeq2rv()
                            a = 7236.346;
                            af = 0.23457;
                            ag = 0.47285;
                            chi = 0.23475;
                            psi = 0.28374;
                            meanlon = 2.230482378;
                            fr = 1;
    
                            eq2rv(a, af, ag, chi, psi, meanlon, fr, out r, out v);
    
                            fprintf(1,'eq2rv ' + r(1), r(2), r(3), v(1), v(2), v(3));
                        end
    
    
                        function testrv2eq()
                            r = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                            % assume circular initial orbit for vel calcs
                            v = [ 0.0, sqrt(gravConst.mu / r(1)), 0.0 ];
    
                            rv2eq(r, v, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
    
                            fprintf(1,'rv2eq   a ' + a,' n ' + n,' af ' + af,' ag '
                            + ag,' chi ' + chi,' psi ' + psi,' mm ' +  meanlonM,' mnu ' + meanlonNu);
                        end
    
    
    
                        % test building the lambert envelope
                        function testAllLamb()
                            %char show = 'n';     % for test180, show = n, show180 = y
                            %char show180 = 'n';  % for testlamb known show = y, show180 = n, n/n for envelope
    
                            whichcase = 'k';  % k
                            % whichcase = 'u'; %  universal
                            % whichcase = 'b';  % battin
    
                            dm = 's';
                            de = 'r';
                            double altpadc = 200.0 / 6378.137;  % set 200 km for altitude you set as the over limit.
                            ktr1 = 0;
                            ktr2 = 0;
                            ktr3 = 0;
                            ktr4 = 0;
                            tofu1 = 0.0;
                            tofu2 = 0.0;
                            kbiu1 = 0.0;
                            kbiu2 = 0.0;
    
                            mu = 3.986004415e5;
                            %tusec = 806.8111238242922;
                            numiter = 17;
                            dtwait = 0.0;
                            tof = 0.0;
                            kbi = 0.0;
    
                            this.opsStatus.Text = 'working on all cases ';
                            Refresh();
    
                            % book fig
                            r1 = [ 2.500000 * 6378.137, 0.000000, 0.000000 ];
                            r2 = [ 1.9151111 * 6378.137, 1.6069690 * 6378.137, 0.000000 ];
                            % assume circular initial orbit for vel calcs
                            v1 = [ 0.0, sqrt(mu / r1(1)), 0.0 ];
                            double ang = atan(r2(2) / r2(1));
                            v2 = [ -sqrt(mu / r2(2)) * cos(ang), sqrt(mu / r2(1)) * sin(ang), 0.0 ];
    
                            %% test case
                            %r2 = [ -1105.78023519582, 2373.16130661458, 6713.89444816503 ];
                            %v2 = [ 5.4720951867079, -4.39299050886976, 2.45681739563752 ];
                            %r1 = [ 4938.49830042171, -1922.24810472241, 4384.68293292613 ];
                            %v1 = [ 0.738204644165659, 7.20989453238397, 2.32877392066299 ];
    
                            % more unital figure
                            %r2 = [ -10000.0, 3750.0, 0.00 ];
                            %v2 = [ 5.4720951867079, -4.39299050886976, 2.45681739563752 ];
                            %r1 = [7278.0,  0.00, 0.00end;
                            %v1 = [ 0.738204644165659, 7.20989453238397, 2.32877392066299 ];
    
                            % case 71 ld1 this is a 360/0 deg case
                            %nrev = 1;
                            %r1 = [ -1467.02165038667, 1586.15766686882, 6812.89290230288 ];
                            %v1 = [ -6.99554331377, -2.45471059071, -0.93275076625 ];
                            %r2 = [ -1467.02165038667, 1586.15766686882, 6812.89290230288 ];
                            %v2 = [ -0.631836782875836, 1.40386453042887, 2.14318960051298 ];  % xx
                            %dtsec = 6325.0;
    
                            %r2 = [ 12214.84096602,  10249.46843675,      0.00000000end;
                            %v2 = [-4.77718638,      3.67191377,      0.00000000 ];
                            %r1 = [ 15945.34250000,      0.00000000,      0.00000000 ];
                            %v1 = [  0.00000000,      4.99979228,      0.00000000 ];
    
                            %% 179.9999972 test
                            %r1 = [ 5690.21923, 3309.62377, 1311.30504 ];
                            %v1 = [ -6.99554331377, -2.45471059071, -0.93275076625 ];
                            %r2 = [ -5691.9147514, -3310.6095425, -1311.695711 ];
                            %v2 = [ -2.65211231086955, 1.55584941166386, -5.96175008776875E-07 ];
    
                            % near 0 180 deg test
                            %r1 = [ -1467.0216503866718, 1586.1576668688224, 6812.892902302875 ];
                            %v1 = [ -6.99554331377, -2.45471059071, -0.93275076625 ];
                            %r2 = [ 1482.87003576258, -1557.63131212973, -6827.43044367934 ];
                            %v2 = [ -2.65211231086955, 1.55584941166386, -5.96175008776875E-07 ];
    
    
                            %r1 = [ -1567.0216503866718, 1686.1576668688224, 6812.892902302875 ];
                            %v1 = [ -6.99554331377, -2.45471059071, -0.93275076625 ];
                            %r2 = [ 1482.87003576258, -1557.63131212973, -6827.43044367934 ];
                            %v2 = [ -2.65211231086955, 1.55584941166386, -5.96175008776875E-07 ];
    
                            % case 25
                            %nrev = 1;
                            %r1 = [ -1467.0216503866718, 1586.1576668688224, 6812.892902302875 ];
                            %v1 = [ -6.99554331377, -2.45471059071, -0.93275076625 ];
                            %r2 = [ -1271.900616, 2703.476434, 6306.177922 ];
                            %v2 = [ 2.65211231086955, -1.55584941166386, 5.96175008776875E-07 ];
                            %dtsec = 5000.0; % 1sr
    
                            % case 78 Nathaniel test case
                            %nrev = 1;
                            %r1 = [ 7117.5156243154161, -4257.1942597683246, -583.88210887807986 ];
                            %v1 = [ -7.0417929290503141, -2.8681303717265290, 1.2224374606557487 ];
                            %r2 = [ 7172.3074180808417, -4123.2685183007470, -560.47505356742181 ];
                            %v2 = [ 5.9109725501309471, 2.0990367313315055, -1.1164901518784618 ];  % xx
    
                            %case 82: % Dan dread
                            nrev = 0;
                            r1 = [ -1984.0302332256897, 1525.2723537058205, 6364.7695528344739 ];
                            v1 = [ 3.659783, -6.176723, 2.606056 ];
                            r2 = [ -5123.56515285304, -1168.59526837238, -4876.40096908065 ];
                            v2 = [ 5.9109725501309471, 2.0990367313315055, -1.1164901518784618 ];  % xx
                            dtsec = 1130.0;
    
                            %% case 83: % Dan dread
                            %nrev = 0;
                            %r1 = [ -1984.0302332256897, 1525.2723537058205, 6364.7695528344739 ];
                            %v1 = [ 3.659783, -6.176723, 2.606056 ];
                            %r2 = [ -2038.89153433683, 1538.41986781477, 6419.63247439258 ];
                            %v2 = [ 5.9109725501309471, 2.0990367313315055, -1.1164901518784618 ];  % xx
                            %dtsec = 2580;
    
                            % ----------------------------- put min values etc points on plot ---------------------------------
                            ktemp = -sqrt(2);
                            hitearth = '-';
    
                            % ----------------------------- put min values etc points on plot ---------------------------------
                            lambertminT(r1, r2, 'S', 'L', 1, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   L   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   L   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
                            lambertminT(r1, r2, 'S', 'L', 2, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   L   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   L   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
                            lambertminT(r1, r2, 'S', 'L', 3, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   L   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   L   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
    
                            lambertminT(r1, r2, 'S', 'H', 1, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   H   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   H   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
                            lambertminT(r1, r2, 'S', 'H', 2, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   H   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   H   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
                            lambertminT(r1, r2, 'S', 'H', 3, out tmin, out tminp, out tminenergy);
                            detailSum = 'S   H   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + ktemp.ToString('0.#######').PadLeft(15) + ' - 0';
                            fprintf(1,detailSum);
                            detailSum = 'S   H   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + ' m' + (-ktemp).ToString('0.#######').PadLeft(15) + ' - 0\n';
                            fprintf(1,detailSum);
    
    
    
    
                            % do 0 rev cases first
                            nrev = 0;
                            ktr = 0;  % overall ktr
                            for (iktr = 1; iktr <= 2; iktr++)
    
                                if (iktr == 1)
    
                                    dm = 'S';
                                    de = 'L';   % or 'H'
                                end
                                if (iktr == 2)
    
                                    dm = 'L';
                                    de = 'H';    % or 'L'
                                end
    
                                dtseco = 0.0;
                                % calc the actual lambert values
                                for (i = 1; i <= 500; i++)
    
                                    if (i < 60)
                                        dtsec = dtseco + i * 1.0;
                                    else
    
                                        if (i < 200)
                                            dtsec = dtseco + (i - 59) * 60.0;
                                        else
                                            dtsec = dtseco + (i - 185) * 600.0;
                                        end
                                    end
                                    if (de == 'L')
    
                                        if (whichcase == 'k')
    
                                            AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, 'n', 'y',
                                            out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                            if (detailAll.Contains('gnot'))
    
                                                AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, 'n', 'y',
                                                out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                            end
                                        end
                                        if (whichcase == 'b')
                                            lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                        end
                                        if (whichcase == 'u')
                                            lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, 0.0, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                        end
                                    end
                                else
    
                                    if (whichcase == 'k')
    
                                        AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, 'n', 'y',
                                        out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                        if (detailAll.Contains('gnot'))
    
                                            AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, 'n', 'y',
                                            out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                        end
                                    end
                                    if (whichcase == 'b')
                                        lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                    end
                                    if (whichcase == 'u')
                                        lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, 0.0, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                    end
                                end
                                ktr = ktr + 1;
                                if (whichcase == 'k' || whichcase == 'u')
                                    fprintf(1,detailSum);
                                end
                                % if (detailAll.Contains('All'))
                                if (whichcase == 'b')
                                    fprintf(1,detailSum);  % for battin tests
                                end
                            end  % for i through all the times
    
                            fprintf(1,' ');
                            if (iktr == 1)
                                ktr1 = ktr;
                            end
                            if (iktr == 2)
                                ktr2 = ktr;
                            end
                        end % for iktr through cases
    
                        fprintf(1,' ');
    
                        AstroLambertkLibr.lambertkmins1st(r1, r2, out s, out tau);
    
                        for iktr = 1: 4
    
                            if (iktr == 1)
    
                                dm = 'S';
                                de = 'L';
                            end
                            if (iktr == 2)
    
                                dm = 'S';
                                de = 'H';
                            end
                            if (iktr == 3)
    
                                dm = 'L';
                                de = 'L';
                            end
                            if (iktr == 4)
    
                                dm = 'L';
                                de = 'H';
                            end
    
                            for nrev = 1: 4
    
                                dtseco = 0.0;
                                if (nrev > 0)
    
                                    % secs
                                    getmins(1, 'u', nrev, r1, r2, 0.0, 0.0, dm, de, out tofu1, out kbiu1, out tofu2, out kbiu2, out outstr);
                                    % secs fix SH and LL cases
                                    %if (dm == 'S' && de == 'H')
                                    %    AstroLambertkLibr.lambertkmins(s, tau, nrev, dm, 'L', out kbi, out tof);
                                    %else
                                    %if (dm == 'L' && de == 'L')
                                    %    AstroLambertkLibr.lambertkmins(s, tau, nrev, dm, 'H', out kbi, out tof);
                                    %else
                                    AstroLambertkLibr.lambertkmins(s, tau, nrev, dm, de, out kbi, out tof);
    
    
                                    %getmins(1, 'k', nrev, r1, r2, s, tau, dm, de, out tofk1, out kbik1, out tofk2, out kbik2, out outstr);
    
                                    if (de == 'H')
    
                                        if (whichcase == 'k')
                                            dtseco = tof;  % in sec
                                        end
                                        if (whichcase == 'u')
                                            dtseco = tofu2;
                                        end
                                        if (whichcase == 'b')
                                            dtseco = tofu2;  % use the univ var value
                                        end
                                    end
                                else
    
                                    if (whichcase == 'k')
                                        dtseco = tof;
                                    end
                                    if (whichcase == 'u')
                                        dtseco = tofu1;
                                    end
                                    if (whichcase == 'b')
                                        dtseco = tofu1;  % use the univ var value
                                    end
                                end
                            end
    
                            % calc the actual lambert values
                            for i = 1:500
    
                                if (i < 60)
                                    dtsec = dtseco + i * 1.0;
                                else
    
                                    if (i < 200)
                                        dtsec = dtseco + (i - 59) * 60.0;
                                    else
                                        dtsec = dtseco + (i - 185) * 600.0;
                                    end
                                end
                                if (de == 'L')
    
                                    if (whichcase == 'k')
    
                                        AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tof, kbi, numiter, altpadc, 'n', 'y',
                                        out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                        %if (detailAll.Contains('gnot'))
                                        %
                                        %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbi, kbi, numiter, altpadc, 'n', 'y',
                                        %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                        %end
                                    end
                                    if (whichcase == 'b')
                                        lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                    end
                                    if (whichcase == 'u')
                                        lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, tofu1, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                    end
                                end
                            else
    
                                if (whichcase == 'k')
    
                                    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tof, kbi, numiter, altpadc, 'n', 'y',
                                    out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                    %if (detailAll.Contains('gnot'))
                                    %
                                    %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbi, kbi, numiter, altpadc, 'n', 'y',
                                    %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                    %end
                                end
                                if (whichcase == 'b')
                                    lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                end
                                if (whichcase == 'u')
                                    lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, tofu2, altpadc, 'n', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                end
                            end
                            ktr = ktr + 1;
                            if (whichcase == 'k' || whichcase == 'u')
                                fprintf(1,detailSum);
                            end
                            % if (detailAll.Contains('All'))
                            if (whichcase == 'b')
                                fprintf(1,detailSum);  % for battin tests
                            end
                        end  % for i through all the times
    
                        fprintf(1,' ');
                    end  % if nrev > 0
    
                    fprintf(1,' ');
                    if (iktr == 2)
                        ktr3 = ktr;
                    end
                    if (iktr == 4)
                        ktr4 = ktr;
                    end
                end % for iktr through cases
    
                fprintf(1,'ktrs ' + ktr1, ktr2, ktr3, ktr4);
    
                string directory = @'d:\codes\library\matlab\';
                File.WriteAllText(directory + 'tlambertAll.out', strbuild);
    
                this.opsStatus.Text = 'Done ';
                Refresh();
            end  % testAll
    
    
            % ------------------------------------------------------------------------------
            %                                 testAllMoving
            %
            % calc the values needed to graph the whole envelope response. this is the most
            % generic construction for the lambert solutions.
            %  you need to entere which lambert technique to use
            %      output these results separately to the matlab directory
            %
            %  author        : david vallado             davallado@gmail.com  10 oct 2019
            %
            %  inputs        description                                   range / units
            %
            %  outputs       :
            %
            %  locals        :
            %    r1          - ijk position vector 1                km
            %    r2          - ijk position vector 2                km
            %    v1          - ijk velocity vector 1 if avail       km/s
            %    dm          - direction of motion                  'L', 'S'
            %    de          - orbital energy                       'L', 'H'
            %    dtsec       - time between r1 and r2               sec
            %    dtwait      - time to wait before starting         sec
            %    nrev        - number of revs to complete           0, 1, 2, 3,
            %    tbi         - array of times for nrev              [,]
            %    altpad      - altitude pad for hitearth calc       km
            %    v1t         - ijk transfer velocity vector         km/s
            %    v2t         - ijk transfer velocity vector         km/s
            %    hitearth    - flag if hit or not                   'y', 'n'
            %    error       - error flag                           1, 2, 3,   use numbers since c++ is so horrible at strings
            %
            % ------------------------------------------------------------------------------*/
    
            function testAllMoving()
                % initialize variables
                detailSum = '';
                detailAll = '';
                outstr = '';
                char show = 'y';     % for test180, show = n, show180 = y
                %char show180 = 'n';  % for testlamb known show = y, show180 = n, n/n for envelope
                tofsh = 0.0;
                kbish = 0.0;
                toflg = 0.0;
                kbilg = 0.0;
                toflo = 0.0;
                kbilo = 0.0;
                tofhi = 0.0;
                kbihi = 0.0;
    
                whichcase = 'k';
                %    whichcase = 'u';
                %    whichcase = 'b';
    
                dm = 'S';
                de = 'H';
                double altpadc = 200.0 / 6378.137;  % set 200 km for altitude you set as the over limit.
                ktr1 = 0;
                ktr2 = 0;
                ktr3 = 0;
                ktr4 = 0;
    
                %mu = 3.986004415e5;
                %tusec = 806.8111238242922;
                numiter = 17;
                dtwait = 0.0;
    
                this.opsStatus.Text = 'working on all cases ';
                Refresh();
    
                % book fig
                %   r1o = [ 2.500000 * 6378.137, 0.000000, 0.000000 ];
                %   r2o = [ 1.9151111 * 6378.137, 1.6069690 * 6378.137, 0.000000 ];
    
                % do reverse case to check retro direct!
                %r2 = [ 2.500000 * 6378.137, 0.000000, 0.000000 ];
                %r1 = [ 1.9151111 * 6378.137, 1.6069690 * 6378.137, 0.000000 ];
    
                % assume circular initial orbit for vel calcs
                %    v1o = [ 0.0, sqrt(mu / r1o(1)), 0.0 ];
                %    double ang = atan(r2o(2) / r2o(1));
                %    v2o = [ -sqrt(mu / r2o(2)) * cos(ang), sqrt(mu / r2o(1)) * sin(ang), 0.0 ];
    
                % book fig 7-17 case tgt/fixed
                r1o = [ -6518.1083, -2403.8479, -22.1722 ];
                v1o = [ 2.604057, -7.105717, -0.263218 ];
                r2o = [ 6697.4756, 1794.5832, 0.000 ];
                v2o = [ -1.962373, 7.323674, 0.000 ];
    
                % book fig 7-18 case tgt/moving
                r1o = [ -6175.1034, 2757.0706, 1626.6556 ];
                v1o = [ 2.376641, 1.139677, 7.078097 ];
                r2o = [ -1078.007289, 8796.641859, 1890.7135 ];
                v2o = [ 2.654700, 1.018600, 7.015400 ];
    
    
                % nathaniel test case (1 rev)
                r1o = [ 7117.5156243154161, -4257.1942597683246, -583.88210887807986 ];
                v1o = [ -7.0417929290503141, -2.8681303717265290, 1.2224374606557487 ];
                r2o = [ 7172.3074180808417, -4123.2685183007470, -560.47505356742181 ];
                v2o = [ 5.9109725501309471, 2.0990367313315055, -1.1164901518784618 ];  % xx
    
                %double tmin, tminp, tminenergy;
                %lambertminT(r1o, r2o, 'S', 'L', 0, out tmin, out tminp, out tminenergy);
                %lambertminT(r1o, r2o, 'S', 'L', 1, out tmin, out tminp, out tminenergy);
    
                %double tmaxrp;
                %lambertTmaxrp(r1o, r2o, 'S', 0, out tmaxrp, out v1t);
                %lambertTmaxrp(r1o, r2o, 'S', 2, out tmaxrp, out v1t);
    
                %char opt = 'f';  % fixed target through dtsec
                char opt = 'm';  % moving target through dtsec
    
                % be sure to set the correct S/L, L/H below as needed
    
                % dtwait
                lktr1 = 250;  % 250
                double step1 = 120.0;  % 120
                % dtsec
                lktr2 = 100;  % 100
                double step2 = 120.0;  % 120
    
                % do a loop for dtwait
                for (loopktr = 0; loopktr < lktr1; loopktr++)  % 0
    
                    dtwait = loopktr * step1;   % secs
    
                    this.opsStatus.Text = 'working dtwait = ' + dtwait;
                    Refresh();
    
                    % propagate through dtwait
                    kepler(r1o, v1o, dtwait, out r1, out v1);
    
                    hitearth = '-';
    
                    % -------------- do 0 rev cases first
                    nrev = 0;
                    ktr = 0;  % overall ktr
                    for (iktr = 1; iktr <= 1; iktr++)   % 1    2
    
                        if (iktr == 1)
    
                            dm = 'S';
                            de = 'L';   % or 'H'
                        end
                        if (iktr == 2)
    
                            dm = 'L';
                            de = 'H';    % or 'L'
                        end
    
                        dtseco = 0.0;
                        % calc the actual lambert values
                        for (i = 1; i <= lktr2; i++)
    
                            dtsec = dtseco + i * step2;
    
                            % propagate through dtsec and dtwait
                            if (opt.Equals('m'))
                                kepler(r2o, v2o, dtwait + dtsec, out r2, out v2);
                            else
                                kepler(r2o, v2o, dtwait, out r2, out v2);
    
                                if (nrev > 0)
                                    getmins(1, 'u', nrev, r1, r2, 0.0, 0.0, dm, de, out tofsh, out kbish, out toflg, out kbilg, out outstr);
                                    % fprintf(1,outstr);
                                    hitearth = '-';
    
                                    if (de == 'L')
    
                                        if (whichcase == 'k')
    
                                            AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, toflo, kbilo, numiter, altpadc, 'n', show,
                                            out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                            % writeout details if there's a problem...probably not needed
                                            %if (detailAll.Contains('gnot'))
                                            %
                                            %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbilk, numiter, altpadc,
                                            %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                            %end
                                        end
                                        if (whichcase == 'b')
                                            lambertbattin(r1, r2, v1, dm, de, nrev, dtsec, dtwait, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                            if (whichcase == 'u')
    
                                                if (dm == 'S')
                                                    lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbish, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                else
                                                    lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbilg, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                end
                                            end
                                        else
    
                                            if (whichcase == 'k')
    
                                                AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tofhi, kbihi, numiter, altpadc, 'n', show,
                                                out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                %if (detailAll.Contains('gnot'))
                                                %
                                                %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbihk, numiter, altpadc,
                                                %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                                %end
                                            end
                                            if (whichcase == 'b')
                                                lambertbattin(r1, r2, v1, dm, de, nrev, dtsec, dtwait, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                if (whichcase == 'u')
    
                                                    if (dm == 'S')
                                                        lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbish, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                    else
                                                        lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbilg, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                    end
                                                end
                                                ktr = ktr + 1;
                                                %fprintf(1,detailSum);
                                                dv1 = [ 0.0, 0.0, 0.0 ];
                                                dv2 = [ 0.0, 0.0, 0.0 ];
                                                if (mag(v1t) > 0.0000001)
    
                                                    for (ii = 0; ii < 3; ii++)
    
                                                        dv1[ii] = v1t[ii] - v1[ii];
                                                        dv2[ii] = v2t[ii] - v2[ii];
                                                    end
                                                end
                                                fprintf(1,detailSum, mag(dv1), mag(dv2));
                                                double magdv1 = mag(dv1);
                                                double magdv2 = mag(dv2);
                                                strbuildDV.AppendLine(dtwait.ToString('0.0000000').PadLeft(12),
                                                dtsec.ToString('0.0000000').PadLeft(15),
                                                magdv1, magdv2);  %, dm + '  ' + de);
                                                %   fprintf(1,detailAll);
                                            end  % for i through all the times
    
                                            fprintf(1,' ');
                                            strbuildDV.AppendLine(' ');
                                            if (iktr == 1)
                                                ktr1 = ktr;
                                                if (iktr == 2)
                                                    ktr2 = ktr;
                                                end % for iktr through cases
    
                                                %fprintf(1,' ');
                                                this.opsStatus.Text = 'working dtwait = ' + dtwait, ' now the 4 cases';
                                                Refresh();
    
                                                % set this for doing just the nrev cases
                                                getmins(1, 'u', nrev, r1, r2, 0.0, 0.0, dm, de, out tofsh, out kbish, out toflg, out kbilg, out outstr);
    
                                                for (iktr = 5; iktr <= 1; iktr++)  %4
    
                                                    if (iktr == 1)
    
                                                        dm = 'S';
                                                        de = 'L';
                                                    end
                                                    if (iktr == 2)
    
                                                        dm = 'S';
                                                        de = 'H';
                                                    end
                                                    if (iktr == 3)
    
                                                        dm = 'L';
                                                        de = 'L';
                                                    end
                                                    if (iktr == 4)
    
                                                        dm = 'L';
                                                        de = 'H';
                                                    end
    
                                                    for (nrev = 1; nrev <= 1; nrev++)   % 1  4
    
                                                        dtseco = 0.0;
                                                        if (nrev > 0)
    
                                                            % probably need to use kmins...
                                                            if (whichcase == 'k')
    
                                                                if (de == 'H')
                                                                    dtseco = toflo;% * tusec; % use univ for test
                                                                else
                                                                    dtseco = tofhi;% * tusec;  % use univ for test
                                                                end
                                                            else
    
                                                                % use univ for all these cases (univ and battin)
                                                                if (dm == 'L')
                                                                    dtseco = toflg;
                                                                else
                                                                    dtseco = tofsh;
                                                                end
                                                            end
    
                                                            % calc the actual lambert values
                                                            for (i = 1; i <= lktr2; i++)
    
                                                                dtsec = dtseco + i * step2;
    
                                                                % propagate through dtsec and dtwait
                                                                if (opt.Equals('m'))
                                                                    kepler(r2o, v2o, dtwait + dtsec, out r2, out v2);
                                                                else
                                                                    kepler(r2o, v2o, dtwait, out r2, out v2);
    
                                                                    getmins(1, 'u', nrev, r1, r2, 0.0, 0.0, dm, de, out tofsh, out kbish, out toflg, out kbilg, out outstr);
                                                                    % fprintf(1,outstr);
                                                                    hitearth = '-';
    
                                                                    if (de == 'L')
    
                                                                        if (whichcase == 'k')
    
                                                                            AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, toflo, kbilo, numiter, altpadc, 'n', show,
                                                                            out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                            %if (detailAll.Contains('gnot'))
                                                                            %
                                                                            %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbilk, numiter, altpadc,
                                                                            %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                                                            %end
                                                                        end
                                                                        if (whichcase == 'b')
                                                                            lambertbattin(r1, r2, v1, dm, de, nrev, dtsec, dtwait, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                            if (whichcase == 'u')
    
                                                                                if (dm == 'S')
                                                                                    lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbish, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                                else
                                                                                    lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbilg, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                                end
                                                                            end
                                                                        else
    
                                                                            if (whichcase == 'k')
    
                                                                                AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tofhi, kbihi, numiter, altpadc, 'n', show,
                                                                                out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                %if (detailAll.Contains('gnot'))
                                                                                %
                                                                                %    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, tbihk, numiter, altpadc,
                                                                                %         out v1t, out v2t, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll, 'y', show180);
                                                                                %end
                                                                            end
                                                                            if (whichcase == 'b')
                                                                                lambertbattin(r1, r2, v1, dm, de, nrev, dtsec, dtwait, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                                if (whichcase == 'u')
    
                                                                                    if (dm == 'S')
                                                                                        lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbish, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                                    else
                                                                                        lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbilg, altpadc, 'y', out v1t, out v2t, out hitearth, out detailSum, out detailAll);
                                                                                    end
                                                                                end
                                                                                ktr = ktr + 1;
                                                                                %fprintf(1,detailSum);
                                                                                dv1 = [ 0.0, 0.0, 0.0 ];
                                                                                dv2 = [ 0.0, 0.0, 0.0 ];
                                                                                if (mag(v1t) > 0.0000001)
    
                                                                                    for (ii = 0; ii < 3; ii++)
    
                                                                                        dv1[ii] = v1t[ii] - v1[ii];
                                                                                        dv2[ii] = v2t[ii] - v2[ii];
                                                                                    end
                                                                                end
                                                                                fprintf(1,detailSum, mag(dv1), mag(dv2));
                                                                                double magdv1 = mag(dv1);
                                                                                double magdv2 = mag(dv2);
                                                                                strbuildDV.AppendLine(dtwait.ToString('0.0000000').PadLeft(12),
                                                                                dtsec.ToString('0.0000000').PadLeft(15),
                                                                                magdv1, magdv2);  %, dm + '  ' + de);
                                                                            end  % for i through all the times
    
                                                                            fprintf(1,' ');
                                                                            strbuildDV.AppendLine(' ');
                                                                        end  % if nrev > 0
    
                                                                        %                    fprintf(1,' ');
                                                                        if (iktr == 2)
                                                                            ktr3 = ktr;
                                                                            if (iktr == 4)
                                                                                ktr4 = ktr;
                                                                            end % for iktr through cases
    
    
                                                                        end % loop through dtwait
    
                                                                        fprintf(1,'ktrs ' + ktr1, ktr2, ktr3, ktr4);
    
                                                                        string directory = @'d:\codes\library\matlab\';
                                                                        File.WriteAllText(directory + 'tlambertAllx.out', strbuild);
                                                                        File.WriteAllText(directory + 'tlamb3dx.out', strbuildDV);
    
                                                                        this.opsStatus.Text = 'Done ';
                                                                        Refresh();
                                                                    end  % testAllMoving
    
    
                                                                    % ------------------------------------------------------------------------------
                                                                    %                                    getmins
                                                                    %
                                                                    % find tbi mins for k, lambert, etc. does either universal and k approach.
                                                                    %   universal seems to find them better though... could store in an array, but
                                                                    %   faster to do 1 at a time. also note that the k lambert needs SH - LL, and LL - SH
                                                                    %   reversal and it is done here.
                                                                    %
                                                                    %  author        : david vallado             davallado@gmail.com  10 oct 2019
                                                                    %
                                                                    %  inputs        description                                   range / units
                                                                    %    loopktr     - ktr for whether or not to write output           0 (writes)
                                                                    %    app         - which approach to use                           'u', 'k'
                                                                    %    nrev        - number of revolultions
                                                                    %    r1          - first position vector                            km
                                                                    %    r2          - second position vector                           km
                                                                    %    s           - parameter for k only, not needed for univ
                                                                    %    tau         - parameter for k only, not needed for univ
                                                                    %    dm          - parameter for k only, not needed for univ        'S', 'L'
                                                                    %    de          - parameter for k only, not needed for univ        'L', 'H'
                                                                    %
                                                                    %  outputs       :
                                                                    %    tof         - min tof for the specified nrev                    s
                                                                    %    kbi         - min psi/k/etc for the given nrev
                                                                    %    outstr      - output string if case 0
                                                                    %
                                                                    %  locals :
                                                                    %
                                                                    %  coupling      :
                                                                    %
                                                                    % ------------------------------------------------------------------------------*/

                                                                    function getmins
                                                                        (
                                                                        loopktr, char app, nrev, r1, r2, double s, double tau, char dm, char de,
                                                                        out double tof1, out double kbi1, out double tof2, out double kbi2, out string outstr
                                                                        )
                                                                        tof1 = 0.0;
                                                                        kbi1 = 0.0;
                                                                        tof2 = 0.0;
                                                                        kbi2 = 0.0;

                                                                        %tusec = 806.8111238242922;
                                                                        if (nrev > 0)


                                                                            if (app == 'u')

                                                                                % universal variable approach
                                                                                lambertumins(r1, r2, nrev, 'S', out kbi1, out tof1);
                                                                                lambertumins(r1, r2, nrev, 'L', out kbi2, out tof2);
                                                                            end
                                                                        else

                                                                            % -----------do these calcs one time to save time
                                                                            % call this outside getmins
                                                                            % AstroLambertkLibr.lambertkmins1st(r1, r2, out s, out tau);

                                                                            % k value approaches
                                                                            AstroLambertkLibr.lambertkmins(s, tau, nrev, 'x', 'L', out kbi1, out tof1);
                                                                            %tof1 = tof1 / tusec;  % in tu, tof is in secs
                                                                            AstroLambertkLibr.lambertkmins(s, tau, nrev, 'x', 'H', out kbi2, out tof2);
                                                                            %tof2 = tof2 / tusec;
                                                                            % switch these here so it's not needed elsewhere
                                                                            % no, switch in kmins
                                                                            %if ((dm == 'S' && de == 'H') || ((dm == 'L' && de == 'L')))
                                                                            %
                                                                            %    temp = kbi1;
                                                                            %    kbi1 = kbi2;
                                                                            %    kbi2 = temp;
                                                                            %    temp = tof1;
                                                                            %    tof1 = tof2;
                                                                            %    tof2 = temp;
                                                                            %end
                                                                        end

                                                                        % -----------------------------put min values etc points on plot ---------------------------------
                                                                        % writeout just one time
                                                                        if (loopktr == 0)

                                                                            fprintf(1,'Lambertumin');
                                                                            detailSum = 'S   L   1  0.000 ' + tof1.ToString('0.#######').PadLeft(15) + ' psimin ' + kbi1.ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            fprintf(1,'Lambertkmin');
                                                                            detailSum = 'S   L   1  0.000 ' + (tof1).ToString('0.#######').PadLeft(15) + ' kmin ' + kbi1.ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            % -----------------------------put min values etc points on plot ---------------------------------
                                                                            double tmin, tminp, tminenergy;
                                                                            fprintf(1,'Lamberttmin');
                                                                            lambertminT(r1, r2, 'S', 'L', 1, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'S   L   tminp  0.000 ' + tminp.ToString('0.#######').PadLeft(15) + '5.0000000'.PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'S   L   tminp  0.000 ' + tminp.ToString('0.#######').PadLeft(15) + '-5.0000000'.PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            detailSum = 'S   L   tminenergy  0.000 ' + tminenergy.ToString('0.#######').PadLeft(15) + '5.0000000'.PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'S   L   tminenergy  0.000 ' + tminenergy.ToString('0.#######').PadLeft(15) + '-5.0000000'.PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            lambertumins(r1, r2, 1, 'S', out kbish, out tofsh);
                                                                            detailSum = 'S   L   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'S   L   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);
                                                                            lambertumins(r1, r2, 2, 'S', out kbish, out tofsh);
                                                                            lambertminT(r1, r2, 'S', 'L', 2, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'S   L   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'S   L   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);
                                                                            lambertumins(r1, r2, 3, 'S', out kbish, out tofsh);
                                                                            lambertminT(r1, r2, 'S', 'L', 3, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'S   L   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'S   L   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (tofsh + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            lambertminT(r1, r2, 'L', 'H', 1, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'L   H   tminp  0.000 ' + tminp.ToString('0.#######').PadLeft(15) + '5.0000000'.PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'L   H   tminp  0.000 ' + tminp.ToString('0.#######').PadLeft(15) + '-5.0000000'.PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            detailSum = 'L   H   tminenergy  0.000 ' + tminenergy.ToString('0.#######').PadLeft(15) + '5.0000000'.PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'L   H   tminenergy  0.000 ' + tminenergy.ToString('0.#######').PadLeft(15) + '-5.0000000'.PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            lambertumins(r1, r2, 1, 'L', out kbilg, out toflg);
                                                                            detailSum = 'L   H   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'L   H   1  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);
                                                                            lambertumins(r1, r2, 2, 'L', out kbilg, out toflg);
                                                                            lambertminT(r1, r2, 'S', 'H', 2, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'L   H   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'L   H   2  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);
                                                                            lambertumins(r1, r2, 3, 'L', out kbilg, out toflg);
                                                                            lambertminT(r1, r2, 'S', 'H', 3, out tmin, out tminp, out tminenergy);
                                                                            detailSum = 'L   H   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg - 5).ToString('0.#######').PadLeft(15) + ' -0';
                                                                            fprintf(1,detailSum);
                                                                            detailSum = 'L   H   3  0.000 ' + tmin.ToString('0.#######').PadLeft(15) + (toflg + 5).ToString('0.#######').PadLeft(15) + ' -0\n';
                                                                            fprintf(1,detailSum);

                                                                            % find max rp values for each nrev
                                                                            double tmaxrp;
                                                                            lambertTmaxrp(r1, r2, 'S', 0, out tmaxrp, out v1t);
                                                                            fprintf(1,'x   x   0  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15));
                                                                            fprintf(1,'x   x   0  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15) + '\n');
                                                                            lambertTmaxrp(r1, r2, 'S', 1, out tmaxrp, out v1t);
                                                                            fprintf(1,'x   x   1  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15));
                                                                            fprintf(1,'x   x   1  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15) + '\n');
                                                                            lambertTmaxrp(r1, r2, 'S', 2, out tmaxrp, out v1t);
                                                                            fprintf(1,'x   x   2  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15));
                                                                            fprintf(1,'x   x   2  0.000 ' + tmaxrp,
                                                                            v1t(1).ToString('0.0000000').PadLeft(15) + v1t(2).ToString('0.0000000').PadLeft(15) + v1t(3).ToString('0.0000000').PadLeft(15) + '\n');
                                                                        end
                                                                    end  % if nrev > 0

                                                                    outstr = strbuild;
                                                                end   % getmins


                                                                % ------------------------------------------------------------------------------
                                                                %                                      makesurf
                                                                %
                                                                %  make a surface from a fixdat result with numbers takes a text file of number of points,
                                                                %  then all the points, and cross-hatches it to get a surface. you run fixdat first
                                                                %  in most cases.
                                                                %
                                                                %  author        : david vallado             davallado@gmail.com  10 oct 2019
                                                                %
                                                                %  inputs        description                                   range / units
                                                                %    infilename  - in filename
                                                                %    outfilename - out filename
                                                                %
                                                                %  outputs       :
                                                                %
                                                                %  locals :
                                                                %
                                                                %  coupling      :
                                                                %
                                                                % ------------------------------------------------------------------------------*/

                                                                function makesurf
                                                                    (
                                                                    string infilename,
                                                                    string outfilename
                                                                    )
                                                                    Restoflgine = '';

                                                                    string[] fileData = File.ReadAllLines(infilename);

                                                                    % process all the x lines
                                                                    numPerLine = 0;
                                                                    ktr = 0;     % reset the file
                                                                    NumLines = 0;
                                                                    while (ktr < fileData.Count() - 1)  % not eof

                                                                        line = fileData[ktr];
                                                                        linesplt = line.Split(' ');
                                                                        numPerLine = Convert.ToInt32(linesplt(1));
                                                                        % matlab uses Inf or Nan to start a new line
                                                                        % needs to be in each col as well
                                                                        fprintf(1,' Nan Nan NaN NaN NaN NaN');  % numPerLine,
                                                                        ktr = ktr + 1;
                                                                        NumLines = NumLines + 1;

                                                                        for (i = 1; i <= numPerLine; i++)

                                                                            line = fileData[ktr];
                                                                            line1 = Regex.Replace(line, @'\s+', ' ');
                                                                            linesplt = line1.Split(' ');
                                                                            %posrest = line1.IndexOf(linesplt(3), 15); % start at position 3
                                                                            %Restoflgine = line1.Substring(posrest -1, line1.Length -posrest);
                                                                            Restoflgine = linesplt(3), linesplt(4),
                                                                            linesplt(5), linesplt(6);
                                                                            fprintf(1,linesplt(1), linesplt(2), Restoflgine);
                                                                            ktr = ktr + 1;
                                                                        end
                                                                    end

                                                                    % ------process the y lines-------
                                                                    % 'process y lines ');
                                                                    % the number of lines needs to be constant!!
                                                                    %numPerLine = 0;
                                                                    numinrow = 0;  % position of each y line
                                                                    % go through each poin initial line
                                                                    while (numinrow < numPerLine)

                                                                        this.opsStatus.Text = 'Done with line ' + numinrow;
                                                                        Refresh();

                                                                        % ---get the nth pofrom the first row---
                                                                        ktr = 0;  % reset the file
                                                                        %line = fileData[ktr];
                                                                        %linesplt = line.Split(' ');
                                                                        %k = Convert.ToInt32(linesplt(1));
                                                                        fprintf(1,' Nan Nan NaN NaN NaN NaN');  % k,
                                                                        ktr = ktr + 1 + numinrow;  % get to first poof data
                                                                        line = fileData[ktr];
                                                                        line1 = Regex.Replace(line, @'\s+', ' ');
                                                                        linesplt = line1.Split(' ');
                                                                        Restoflgine = linesplt(3), linesplt(4),
                                                                        linesplt(5), linesplt(6);
                                                                        fprintf(1,linesplt(1), linesplt(2), Restoflgine);

                                                                        % ---get nth number from each other segment---
                                                                        % since they are all evenly spaced, simply add the delta until the end of file
                                                                        Int32 ktr0 = ktr + 1;
                                                                        for (j = 1; j < NumLines; j++)

                                                                            ktr = ktr0 + j * numPerLine;
                                                                            line = fileData[ktr];
                                                                            line1 = Regex.Replace(line, @'\s+', ' ');
                                                                            linesplt = line1.Split(' ');
                                                                            Restoflgine = linesplt(3), linesplt(4),
                                                                            linesplt(5), linesplt(6);
                                                                            fprintf(1,linesplt(1), linesplt(2), Restoflgine);
                                                                            ktr0 = ktr0 + 1;
                                                                        end

                                                                        numinrow = numinrow + 1;
                                                                    end  % while

                                                                    string directory = @'d:\codes\library\matlab\';
                                                                    File.WriteAllText(directory + 'surf.out', strbuild);
                                                                end  % makesurf



                                                                % ------------------------------------------------------------------------------
                                                                %                                      fixdat
                                                                %
                                                                %  fix the blank lines in a datafile. let 4 values be taken depending on the
                                                                %  intindex values inserts the number of points for each segment, then it can be
                                                                %  used in makesurf.
                                                                %
                                                                %  author        : david vallado             davallado@gmail.com  10 oct 2019
                                                                %
                                                                %  inputs        description                                   range / units
                                                                %    infilename  - in filename
                                                                %    outfilename - out filename
                                                                %    intindxx    - which indices to use, 1.2.3.4.5, 2.5.7.8 etc
                                                                %
                                                                %  outputs       :
                                                                %
                                                                %  locals :
                                                                %
                                                                %  ------------------------------------------------------------------------------*/

                                                                Function fixdat
                                                                (
                                                                string infilename,
                                                                string outfilename,
                                                                intindx1, intindx2, intindx3, intindx4, intindx5, intindx6
                                                                )
                                                                string[] fileData = File.ReadAllLines(infilename);

                                                                i = 0;
                                                                ktr = 0;
                                                                while (ktr < fileData.Count() - 1)  % not eof

                                                                    LongString = fileData[ktr];

                                                                    if ((LongString.Contains('xx')) || LongString.Length < 10 || (i == 2000))

                                                                        this.opsStatus.Text = 'Break ' + ktr;
                                                                        Refresh();

                                                                        % ----Put a mandatory break at 2000----
                                                                        if ((i == 2000) && (!LongString.Contains('xx')))
                                                                            fprintf(1,(i + 1), ' xx broken');
                                                                        else

                                                                            if (i > 0)
                                                                                fprintf(1,i, ' xx ');
                                                                            end
                                                                        end

                                                                        % ----Write out all the data to this point----
                                                                        for (j = 1; j <= i; j++)
                                                                            fprintf(1,DatArray[j]);
                                                                        end

                                                                        % ----Write out crossover pofor the mandatory break ---
                                                                        if ((i == 2000) && ((!LongString.Contains('x')) || LongString.Length > 10))

                                                                            fprintf(1,LongString);
                                                                            % write out last one in loop !
                                                                            i = 1;
                                                                            DatArray[i] = LongString;
                                                                        end
                                                                    else

                                                                        i = 0;
                                                                        ktr = ktr + 1;   % file counter
                                                                    end
                                                                end
                                                            else
                                                                % ----Add new data ----

                                                                i = i + 1;
                                                                string line1 = Regex.Replace(LongString, @'\s+', ' ');
                                                                string[] linesplt = line1.Split(' ');

                                                                DatArray[i] = linesplt[intindx1], linesplt[intindx2], linesplt[intindx3], linesplt[intindx4]
                                                                , linesplt[intindx5], linesplt[intindx6];
                                                                ktr = ktr + 1;   % file counter
                                                            end

                                                        end  % while through file

                                                        % ----Write out the last section----
                                                        if (i > 1)

                                                            if ((i == 2000) && (!LongString.Contains('x')) && LongString.Length > 10)
                                                                fprintf(1,(i + 1), ' xx broken');
                                                            else

                                                                if (i > 0)
                                                                    fprintf(1,i, ' xx ');
                                                                end
                                                            end
                                                            for (j = 1; j <= i; j++)
                                                                fprintf(1,DatArray[j]);
                                                            end
                                                        end

                                                        string directory = @'d:\codes\library\matlab\';
                                                        File.WriteAllText(directory + 't.out', strbuild);
                                                    end  % fixdat


                                                    function testlambertuniv()

                                                        v1t = new double(4);
                                                        v2t = new double(4);
                                                        v1t1 = new double(4);
                                                        v2t1 = new double(4);
                                                        v1t2 = new double(4);
                                                        v2t2 = new double(4);
                                                        v1t3 = new double(4);
                                                        v2t3 = new double(4);
                                                        v1t4 = new double(4);
                                                        v2t4 = new double(4);
                                                        double[,] tbidu = new double[10, 3];
                                                        double[,] tbiru = new double[10, 3];
                                                        r1 = new double(4);
                                                        r2 = new double(4);
                                                        r3 = new double(4);
                                                        r4 = new double(4);
                                                        v1 = new double(4);
                                                        dv1 = new double(4);
                                                        dv11 = new double(4);
                                                        dv12 = new double(4);
                                                        dv13 = new double(4);
                                                        dv14 = new double(4);
                                                        v2 = new double(4);
                                                        v3 = new double(4);
                                                        v4 = new double(4);
                                                        dv2 = new double(4);
                                                        dv21 = new double(4);
                                                        dv22 = new double(4);
                                                        dv23 = new double(4);
                                                        dv24 = new double(4);
                                                        double kbi, tof, dtwait, altpad, ang, dtsec;
                                                        Int32 nrev, i, j;
                                                        string errorsum = '';
                                                        string errorout = '';
                                                        char show = 'n';     % for test180, show = n, show180 = y
                                                        %char show180 = 'n';  % for testlamb known show = y, show180 = n, n/n for envelope
                                                        char hitearth, dm, de;
                                                        nrev = 0;
                                                        r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                                                        r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                                                        % assume circular initial orbit for vel calcs
                                                        v1 = [ 0.0, sqrt(gravConst.mu / r1(1)), 0.0 ];
                                                        ang = atan(r2(2) / r2(1));
                                                        v2 = [ -sqrt(gravConst.mu / r2(2)) * cos(ang), sqrt(gravConst.mu / r2(1)) * sin(ang), 0.0 ];
                                                        dtsec = 76.0 * 60.0;
                                                        altpad = 100.0;  % 100 km


                                                        lambertumins(r1, r2, 1, 'S', out kbi, out tof);
                                                        tbidu(2, 2) = kbi;
                                                        tbidu(2, 3) = tof;
                                                        lambertumins(r1, r2, 2, 'S', out kbi, out tof);
                                                        tbidu(3, 2) = kbi;
                                                        tbidu(3, 3) = tof;
                                                        lambertumins(r1, r2, 3, 'S', out kbi, out tof);
                                                        tbidu(4, 2) = kbi;
                                                        tbidu(4, 3) = tof;
                                                        lambertumins(r1, r2, 4, 'S', out kbi, out tof);
                                                        tbidu(5, 2) = kbi;
                                                        tbidu(5, 3) = tof;
                                                        lambertumins(r1, r2, 5, 'S', out kbi, out tof);
                                                        tbidu(6, 2) = kbi;
                                                        tbidu(6, 3) = tof;

                                                        lambertumins(r1, r2, 1, 'L', out kbi, out tof);
                                                        tbiru(2, 2) = kbi;
                                                        tbiru(2, 3) = tof;
                                                        lambertumins(r1, r2, 2, 'L', out kbi, out tof);
                                                        tbiru(3, 2) = kbi;
                                                        tbiru(3, 3) = tof;
                                                        lambertumins(r1, r2, 3, 'L', out kbi, out tof);
                                                        tbiru(4, 2) = kbi;
                                                        tbiru(4, 3) = tof;
                                                        lambertumins(r1, r2, 4, 'L', out kbi, out tof);
                                                        tbiru(5, 2) = kbi;
                                                        tbiru(5, 3) = tof;
                                                        lambertumins(r1, r2, 5, 'L', out kbi, out tof);
                                                        tbiru(6, 2) = kbi;
                                                        tbiru(6, 3) = tof;


                                                        if (show == 'y')
                                                            fprintf(1,' TEST ------------------ s/l  d  0 rev ------------------');
                                                            hitearth = ' ';
                                                            dm = 'S';
                                                            de = 'L';
                                                            nrev = 0;
                                                            dtwait = 0.0;


                                                            lambertuniv(r1, r2, v1, dm, de, nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);

                                                            lambertuniv(r1, r2, v1, dm, 'H', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);

                                                            dtsec = 21000.0;
                                                            lambertuniv(r1, r2, v1, 'S', 'H', 1, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r2, v1, 'S', 'L', 1, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r2, v1, 'L', 'H', 1, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r2, v1, 'L', 'L', 1, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t, out v2t, out hitearth, out errorsum, out errorout);


                                                            % test chap 7 fig 7-18 runs
                                                            if (show == 'y')
                                                                fprintf(1,' TEST ------------------ s/l  d  0 rev ------------------');
                                                                hitearth = ' ';
                                                                dm = 'S';
                                                                de = 'L';
                                                                nrev = 0;
                                                                dtwait = 0.0;

                                                                % fig 7-18 fixed tgt and int
                                                                r1 = [ -6518.1083, -2403.8479, -22.1722 ];
                                                                v1 = [ 2.604057, -7.105717, -0.263218 ];
                                                                r2 = [ 6697.4756, 1794.5832, 0.0 ];
                                                                v2 = [ -1.962373, 7.323674, 0.0 ];
                                                                fprintf(1,'dtwait  dtsec       dv1       dv2 ');
                                                                this.opsStatus.Text = 'Status:  on case 80a';
                                                                Refresh();
                                                                %           for (i = 0; i < 250; i++)

                                                                i = 0;
                                                                dtsec = i * 60.0;
                                                                lambertuniv(r1, r2, v1, 'S', 'L', nrev, dtwait, dtsec, kbi,
                                                                altpad, 'y', out v1t1, out v2t1, out hitearth, out errorsum, out errorout);
                                                                lambertuniv(r1, r2, v1, 'S', 'H', nrev, dtwait, dtsec, kbi,
                                                                altpad, 'y', out v1t2, out v2t2, out hitearth, out errorsum, out errorout);
                                                                lambertuniv(r1, r2, v1, 'L', 'L', nrev, dtwait, dtsec, kbi,
                                                                altpad, 'y', out v1t3, out v2t3, out hitearth, out errorsum, out errorout);
                                                                lambertuniv(r1, r2, v1, 'L', 'H', nrev, dtwait, dtsec, kbi,
                                                                altpad, 'y', out v1t4, out v2t4, out hitearth, out errorsum, out errorout);

                                                                if (errorout.Contains('ok'))

                                                                    addvec(1.0, v1t1, -1.0, v1, out dv11);
                                                                    addvec(1.0, v2t1, -1.0, v2, out dv21);
                                                                    addvec(1.0, v1t2, -1.0, v1, out dv12);
                                                                    addvec(1.0, v2t2, -1.0, v2, out dv22);
                                                                    addvec(1.0, v1t3, -1.0, v1, out dv13);
                                                                    addvec(1.0, v2t3, -1.0, v2, out dv23);
                                                                    addvec(1.0, v1t4, -1.0, v1, out dv14);
                                                                    addvec(1.0, v2t4, -1.0, v2, out dv24);
                                                                    fprintf(1,dtwait, dtsec,
                                                                    '  ' + mag(dv11), '  ' + mag(dv21),
                                                                    '  ' + mag(dv12), '  ' + mag(dv22),
                                                                    '  ' + mag(dv13), '  ' + mag(dv23),
                                                                    '  ' + mag(dv14), '  ' + mag(dv24));
                                                                end
                                                            else
                                                                fprintf(1,errorsum, errorout);
                                                            end


                                                            % fig 7-19 moving tgt
                                                            r1 = [ 5328.7862, 4436.1273, 101.4720 ];
                                                            v1 = [ -4.864779, 5.816486, 0.240163 ];
                                                            r2 = [ 6697.4756, 1794.5831, 0.0 ];
                                                            v2 = [ -1.962372, 7.323674, 0.0 ];
                                                            fprintf(1,'dtwait  dtsec       dv1       dv2 ');
                                                            % diff vectors, needs new umins

                                                            this.opsStatus.Text = 'Status:  on case 80b';
                                                            Refresh();
                                                            %           for (i = 0; i < 250; i++)

                                                            i = 0;
                                                            dtsec = i * 60.0;
                                                            kepler(r2, v2, dtsec, out r3, out v3);
                                                            %                for (j = 0; j < 25; j++)

                                                            j = 0;
                                                            dtwait = j * 10.0;
                                                            dtwait = 0.0;  % set to 0 for now

                                                            lambertuniv(r1, r3, v1, 'S', 'L', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t1, out v2t1, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r3, v1, 'S', 'H', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t2, out v2t2, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r3, v1, 'L', 'L', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t3, out v2t3, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r1, r3, v1, 'L', 'H', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t4, out v2t4, out hitearth, out errorsum, out errorout);
                                                            if (errorout.Contains('ok'))

                                                                addvec(1.0, v1t1, -1.0, v1, out dv11);
                                                                addvec(1.0, v2t1, -1.0, v3, out dv21);
                                                                addvec(1.0, v1t2, -1.0, v1, out dv12);
                                                                addvec(1.0, v2t2, -1.0, v3, out dv22);
                                                                addvec(1.0, v1t3, -1.0, v1, out dv13);
                                                                addvec(1.0, v2t3, -1.0, v3, out dv23);
                                                                addvec(1.0, v1t4, -1.0, v1, out dv14);
                                                                addvec(1.0, v2t4, -1.0, v3, out dv24);
                                                                fprintf(1,dtwait, dtsec,
                                                                '  ' + mag(dv11), '  ' + mag(dv21),
                                                                '  ' + mag(dv12), '  ' + mag(dv22),
                                                                '  ' + mag(dv13), '  ' + mag(dv23),
                                                                '  ' + mag(dv14), '  ' + mag(dv24));
                                                            end
                                                        else
                                                            fprintf(1,errorsum, errorout);
                                                        end
                                                    end


                                                    % fig 7-21
                                                    StringBuilder strbuildFig = new StringBuilder();
                                                    r1 = [ -6175.1034, 2757.0706, 1626.6556 ];
                                                    v1 = [ 2.376641, 1.139677, 7.078097 ];
                                                    r2 = [ -6078.007289, 2796.641859, 1890.7135 ];
                                                    v2 = [ 2.654700, 1.018600, 7.015400 ];

                                                    strbuildFig.AppendLine('dtwait  dtsec       dv1       dv2 ');
                                                    this.opsStatus.Text = 'Status:  on case 80c';
                                                    Refresh();
                                                    totaldts = 15000;
                                                    totaldtw = 30000;
                                                    step1 = 60;   % 60 orig
                                                    step2 = 600;  % 600 orig
                                                    stop1 = (int) (totaldts/step1);
                                                    stop2 = (int) (totaldtw/step2);
                                                    for (i = 0; i < stop1; i++)  % orig 250, 15000 s total

                                                        dtsec = i * step1;    % orig 60
                                                        kepler(r1, v1, dtsec, out r4, out v4);
                                                        for (j = 0; j < stop2; j++)  % orig 25 600*25 = 15000 s total

                                                            dtwait = j * step2;   % orig 600
                                                            kepler(r2, v2, dtsec + dtwait, out r3, out v3);

                                                            lambertuniv(r4, r3, v4, 's', 'd', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t1, out v2t1, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r4, r3, v4, 's', 'r', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t2, out v2t2, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r4, r3, v4, 'l', 'd', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t3, out v2t3, out hitearth, out errorsum, out errorout);
                                                            lambertuniv(r4, r3, v4, 'l', 'r', nrev, dtwait, dtsec, kbi,
                                                            altpad, 'y', out v1t4, out v2t4, out hitearth, out errorsum, out errorout);
                                                            if (errorout.Contains('ok'))

                                                                addvec(1.0, v1t1, -1.0, v4, out dv11);
                                                                addvec(1.0, v2t1, -1.0, v3, out dv21);
                                                                addvec(1.0, v1t2, -1.0, v4, out dv12);
                                                                addvec(1.0, v2t2, -1.0, v3, out dv22);
                                                                addvec(1.0, v1t3, -1.0, v4, out dv13);
                                                                addvec(1.0, v2t3, -1.0, v3, out dv23);
                                                                addvec(1.0, v1t4, -1.0, v4, out dv14);
                                                                addvec(1.0, v2t4, -1.0, v3, out dv24);
                                                                strbuildFig.AppendLine(dtwait, dtsec,
                                                                '  ' + mag(dv11), '  ' + mag(dv21),
                                                                '  ' + mag(dv12), '  ' + mag(dv22),
                                                                '  ' + mag(dv13), '  ' + mag(dv23),
                                                                '  ' + mag(dv14), '  ' + mag(dv24));
                                                            end
                                                        else
                                                            strbuildFig.AppendLine(errorsum, errorout);
                                                        end
                                                    end

                                                    % write data out
                                                    string directory = @'D:\Codes\LIBRARY\Matlab\';
                                                    File.WriteAllText(directory + 'surfMovingSalltest.out', strbuildFig);
                                                end

                                                % test all the known problem cases for lambert
                                                % output these results separately to the testall directory
                                                private void testknowncases()

                                                %  this file runs all the known problem cases.
                                                double tusec = 806.8111238242922;
                                                Int16 numiter = 16;
                                                Int32 caseopt, nrev;
                                                double dtwait, dtsec;
                                                r1 = new double(4);
                                                r2 = new double(4);
                                                v1 = new double(4);
                                                v2 = new double(4);
                                                v1tk = new double(4);
                                                v2tk = new double(4);
                                                v1tu = new double(4);
                                                v2tu = new double(4);
                                                v1tb = new double(4);
                                                v2tb = new double(4);
                                                v1tt = new double(4);
                                                v2tt = new double(4);
                                                string detailSum, detailAll, errorout;
                                                dv1 = new double(4);
                                                dv2 = new double(4);
                                                dv1t = new double(4);
                                                dv2t = new double(4);
                                                r3h = new double(4);
                                                v3h = new double(4);
                                                dr = new double(4);
                                                double ang, f, g, gdot, s, tau;
                                                double tmin, tminp, tminenergy;
                                                StringBuilder strbuildAll = new StringBuilder();
                                                detailSum = '';
                                                detailAll = '';
                                                %i;
                                                char dm, de, hitearth;
                                                % for test180, show = n, show180 = y
                                                % for testlamb, show = y, show180 = n known cases
                                                % for envelope, show = n, show180 = n

                                                double altpadc = 200.0 / gravConst.re;  % set 200 km for altitude you set as the over limit.

                                                dtsec = 0.0;
                                                nrev = 0;
                                                for (caseopt = 0; caseopt <= 85; caseopt++) % 74

                                                    this.opsStatus.Text = 'working on lambert case ' + caseopt;
                                                    Refresh();

                                                    dtwait = 0.0;
                                                    % Problem cases during evaluation
                                                    switch (caseopt)

                                                        case 0:
                                                            strbuildAll.AppendLine('\n-------- lambert test book pg 497 short way \n');
                                                            nrev = 0;
                                                            r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
                                                            r2 = [ 1.9151111 * gravConst.re, 1.6069690 * gravConst.re, 0.000000 ];
                                                            % assume circular initial orbit for vel calcs
                                                            v1 = [ 0.0, sqrt(gravConst.mu / r1(1)), 0.0 ];
                                                            ang = atan(r2(2) / r2(1));
                                                            v2 = [ -sqrt(gravConst.mu / r2(2)) * cos(ang), sqrt(gravConst.mu / r2(1)) * sin(ang), 0.0 ];
                                                            dtsec = 99900.3;
                                                            dtsec = 76.0 * 60.0;
                                                            dtsec = 21000.0;

                                                            strbuildAll.AppendLine('r1 ', r1(1).ToString('0.00000000000'), r1(2).ToString('0.00000000000'), r1(3).ToString('0.00000000000'));
                                                            strbuildAll.AppendLine('r2 ', r2(1).ToString('0.00000000000'), r2(2).ToString('0.00000000000'), r2(3).ToString('0.00000000000'));
                                                            strbuildAll.AppendLine('v1 ', v1(1).ToString('0.00000000000'), v1(2).ToString('0.00000000000'), v1(3).ToString('0.00000000000'));
                                                            strbuildAll.AppendLine('v2 ', v2(1).ToString('0.00000000000'), v2(2).ToString('0.00000000000'), v2(3).ToString('0.00000000000'));
                                                            break;
                                                        case 1:
                                                            nrev = 1;
                                                            r2 = [ -1105.78023519582, 2373.16130661458, 6713.89444816503 ];
                                                            v2 = [ 5.4720951867079, -4.39299050886976, 2.45681739563752 ];
                                                            r1 = [ 4938.49830042171, -1922.24810472241, 4384.68293292613 ];
                                                            v1 = [ 0.738204644165659, 7.20989453238397, 2.32877392066299 ];
                                                            dtsec = 6372.69272563561; % 1ld
                                                            break;
                                                    end  % switch

                                                    strbuildAll.AppendLine('===== Lambert Case ' + caseopt, ' === ');

                                                    ang = atan(r2(2) / r2(1));
                                                    double magr1 = mag(r1);
                                                    double magr2 = mag(r2);

                                                    % this value stays constant in all calcs, vara changes with df
                                                    double cosdeltanu = dot(r1, r2) / (magr1 * magr2);

                                                    %fprintf(1,'now do findtbi calcs');
                                                    %fprintf(1,'iter       y         dtnew          psiold      psinew   psinew-psiold   dtdpsi      dtdpsi2    lower    upper     ');

                                                    AstroLambertkLibr.lambertkmins1st(r1, r2, out s, out tau);
                                                    strbuildAll.AppendLine(' s ' + s,' tau ' + tau );

                                                    double kbi, tof;
                                                    double[,] tbidk = new double[10, 3];
                                                    AstroLambertkLibr.lambertkmins(s, tau, 1, 'x', 'L', out kbi, out tof);
                                                    tbidk(2, 2) = kbi;
                                                    tbidk(2, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 2, 'x', 'L', out kbi, out tof);
                                                    tbidk(3, 2) = kbi;
                                                    tbidk(3, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 3, 'x', 'L', out kbi, out tof);
                                                    tbidk(4, 2) = kbi;
                                                    tbidk(4, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 4, 'x', 'L', out kbi, out tof);
                                                    tbidk(5, 2) = kbi;
                                                    tbidk(5, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 5, 'x', 'L', out kbi, out tof);
                                                    tbidk(6, 2) = kbi;
                                                    tbidk(6, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 6, 'x', 'L', out kbi, out tof);
                                                    tbidk[6, 1] = kbi;
                                                    tbidk[6, 2] = tof / tusec;

                                                    double[,] tbirk = new double[10, 3];
                                                    AstroLambertkLibr.lambertkmins(s, tau, 1, 'x', 'H', out kbi, out tof);
                                                    tbirk(2, 2) = kbi;
                                                    tbirk(2, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 2, 'x', 'H', out kbi, out tof);
                                                    tbirk(3, 2) = kbi;
                                                    tbirk(3, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 3, 'x', 'H', out kbi, out tof);
                                                    tbirk(4, 2) = kbi;
                                                    tbirk(4, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 4, 'x', 'H', out kbi, out tof);
                                                    tbirk(5, 2) = kbi;
                                                    tbirk(5, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 5, 'x', 'H', out kbi, out tof);
                                                    tbirk(6, 2) = kbi;
                                                    tbirk(6, 3) = tof / tusec;
                                                    AstroLambertkLibr.lambertkmins(s, tau, 6, 'x', 'H', out kbi, out tof);
                                                    tbirk[6, 1] = kbi;
                                                    tbirk[6, 2] = tof / tusec;

                                                    strbuildAll.AppendLine('From k variables ');
                                                    strbuildAll.AppendLine(' ' + tbidk(2, 2).ToString('#0.00000000000') + '  ' + (tbidk(2, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbidk(2, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbidk(3, 2).ToString('#0.00000000000') + '  ' + (tbidk(3, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbidk(3, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbidk(4, 2).ToString('#0.00000000000') + '  ' + (tbidk(4, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbidk(4, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbidk(5, 2).ToString('#0.00000000000') + '  ' + (tbidk(5, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbidk(5, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbidk(6, 2).ToString('#0.00000000000') + '  ' + (tbidk(6, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbidk(6, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine('');
                                                    strbuildAll.AppendLine(' ' + tbirk(2, 2).ToString('#0.00000000000') + '  ' + (tbirk(2, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbirk(2, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbirk(3, 2).ToString('#0.00000000000') + '  ' + (tbirk(3, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbirk(3, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbirk(4, 2).ToString('#0.00000000000') + '  ' + (tbirk(4, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbirk(4, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbirk(5, 2).ToString('#0.00000000000') + '  ' + (tbirk(5, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbirk(5, 3)).ToString('0.00000000000') + ' tu ');
                                                    strbuildAll.AppendLine(' ' + tbirk(6, 2).ToString('#0.00000000000') + '  ' + (tbirk(6, 3) * tusec).ToString('0.00000000000') + ' s ' + (tbirk(6, 3)).ToString('0.00000000000') + ' tu ');


                                                    %fprintf(1,'lambertTest' + caseopt, r1(1).ToString('0.00000000000'), r1(2).ToString('0.00000000000'), r1(3).ToString('0.00000000000') +
                                                    %    ' ' + v1(1).ToString('0.00000000000'), v1(2).ToString('0.00000000000'), v1(3).ToString('0.00000000000') +
                                                    %    ' ' + r2(1).ToString('0.00000000000'), r2(2).ToString('0.00000000000'), r2(3).ToString('0.00000000000') +
                                                    %    ' ' + v2(1).ToString('0.00000000000'), v2(2).ToString('0.00000000000'), v2(3).ToString('0.00000000000'), dtsec);

                                                    lambertminT(r1, r2, 'S', 'L', 1, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mS ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);
                                                    lambertminT(r1, r2, 'S', 'L', 2, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mS ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);
                                                    lambertminT(r1, r2, 'S', 'L', 3, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mS ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);

                                                    lambertminT(r1, r2, 'L', 'H', 1, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mL ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);
                                                    lambertminT(r1, r2, 'L', 'H', 2, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mL ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);
                                                    lambertminT(r1, r2, 'L', 'H', 3, out tmin, out tminp, out tminenergy);
                                                    strbuildAll.AppendLine('mL ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);

                                                    char modecon = 'n';  % 'c' to shortcut bad cases (hitearth) at iter 3 or 'n'

                                                    strbuildAll.AppendLine(' TEST ------------------ s/l  H  0 rev ------------------');
                                                    hitearth = ' ';
                                                    dm = 'S';
                                                    de = 'H';
                                                    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, modecon, 'n',
                                                    out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                    strbuildAll.AppendLine(detailAll);
                                                    %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                    strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                    strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                    %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                    kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                    strbuildAll.AppendLine('r3h ', r3h(1).ToString('0.00000000000'), r3h(2).ToString('0.00000000000'), r3h(3).ToString('0.00000000000'));
                                                    for (j = 0; j < 3; j++)
                                                        dr[j] = r2[j] - r3h[j];
                                                        if (mag(dr) > 0.01)
                                                            strbuildAll.AppendLine('velk does not get to r2 position (km) ' + mag(dr), '\n');

                                                            lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, 0.0, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                            %fprintf(1,detailSum);
                                                            strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                            strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                            kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                            for (j = 0; j < 3; j++)
                                                                dr[j] = r2[j] - r3h[j];
                                                                if (mag(dr) > 0.01)
                                                                    strbuildAll.AppendLine('velu does not get to r2 position (km) ' + mag(dr), '\n');

                                                                    for (j = 0; j < 3; j++)

                                                                        dv1[j] = v1tk[j] - v1tu[j];
                                                                        dv2[j] = v2tk[j] - v2tu[j];
                                                                    end
                                                                    if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                        strbuildAll.AppendLine('velk does not match velu \n');

                                                                        lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                        %fprintf(1,detailSum);
                                                                        strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                        strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                        kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                        for (j = 0; j < 3; j++)
                                                                            dr[j] = r2[j] - r3h[j];
                                                                            if (mag(dr) > 0.01)
                                                                                strbuildAll.AppendLine('velb does not get to r2 position (km) ' + mag(dr), '\n');
                                                                                %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                for (j = 0; j < 3; j++)

                                                                                    dv1[j] = v1tk[j] - v1tb[j];
                                                                                    dv2[j] = v2tk[j] - v2tb[j];
                                                                                end
                                                                                if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                    strbuildAll.AppendLine('velk does not match velb \n');
                                                                                    %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));

                                                                                    %% teds approach
                                                                                    %r2ted = [ r2(1), r2(2), r2(3) ];
                                                                                    %v2ted = [ v2(1), v2(2), v2(3) ];
                                                                                    %r1ted = [ r1(1), r1(2), r1(3) ];
                                                                                    %v1ted = [ v1(1), v1(2), v1(3) ];
                                                                                    %Cartesian r1com = new Cartesian(r1ted(1), r1ted(2), r1ted(3));
                                                                                    %Cartesian v1com = new Cartesian(v1ted(1), v1ted(2), v1ted(3));
                                                                                    %Cartesian r2com = new Cartesian(r2ted(1), r2ted(2), r2ted(3));
                                                                                    %Cartesian v2com = new Cartesian(v2ted(1), v2ted(2), v2ted(3));
                                                                                    %var result = LambertDeltaV.FindMinimumDeltaV(r2com, v2com, r1com, v1com, dtsec, Lambert.EngagementType.Prox, 0);  % .Intercept
                                                                                    %v1tr =  result.Velocities.Item1.X, result.Velocities.Item1.Y, result.Velocities.Item1.Z ];  % LambertKMin/s
                                                                                    %v2tr =  result.Velocities.Item2.X, result.Velocities.Item2.Y, result.Velocities.Item2.Z ];  % LambertKMin/s
                                                                                    %for (i = 0; i < 3; i++)
                                                                                    %
                                                                                    %    dv1t[i] = v1[i] - v1tr[i];
                                                                                    %    dv2t[i] = v2[i] - v2tr[i];
                                                                                    %end
                                                                                    %magv1tt = mag(dv1);
                                                                                    %magv2tt = mag(dv2);
                                                                                    %%fprintf(1,detailAll);  % dont do again
                                                                                    %double knew = 1.1;
                                                                                    %detailAll = ('T' + detailSum.PadLeft(2) + result.LambertCalculations.PadLeft(4) + 0.PadLeft(3) + '   ' + dm + '  ' + df + dtwait.ToString('0.00000000000').PadLeft(15) +
                                                                                    %           dtsec.ToString('0.00000000000').PadLeft(15) + knew.ToString('0.00000000000').PadLeft(15) +
                                                                                    %           v1tr(1).ToString('0.00000000000').PadLeft(15) + v1tr(2).ToString('0.00000000000').PadLeft(15) + v1tr(3).ToString('0.00000000000').PadLeft(15) +
                                                                                    %           v2tr(1).ToString('0.00000000000').PadLeft(15) + v2tr(2).ToString('0.00000000000').PadLeft(15) + v2tr(3).ToString('0.00000000000').PadLeft(15) +
                                                                                    %           (cos(cosdeltanu) * 180 / pi).ToString('0.00000000000').PadLeft(15) + caseopt + hitearth);
                                                                                    %%                fprintf(1,detailAll);

                                                                                    %%                fprintf(1,magv1tt.ToString('0.00000000000') + '  ' + magv2tt.ToString('0.00000000000') + ' \n');
                                                                                    %if ((Math.Abs(magv1t - magv1tt) > 0.01) || (Math.Abs(magv2t - magv2tt) > 0.01))
                                                                                    %    fprintf(1,'Error between the approaches');

                                                                                    % timing of routines
                                                                                    %var watch = System.Diagnostics.Stopwatch.StartNew();
                                                                                    %l = 0;
                                                                                    %for (l = 1; l < 500; l++)

                                                                                    strbuildAll.AppendLine(' TEST ------------------ s/l L 0 rev ------------------');
                                                                                    dm = 'L';
                                                                                    de = 'L';
                                                                                    % k near 180 is about 53017 while battin is 30324!
                                                                                    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nrev, dtwait, dtsec, 0.0, 0.0, numiter, altpadc, modecon, 'n',
                                                                                    out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                    strbuildAll.AppendLine(detailAll);
                                                                                    %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + mag(dr).ToString('0.00000000000'));
                                                                                    strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                                                    strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                                                    %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                                                    kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                                                    for (j = 0; j < 3; j++)
                                                                                        dr[j] = r2[j] - r3h[j];
                                                                                        if (mag(dr) > 0.01)
                                                                                            strbuildAll.AppendLine('velk does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                            lambertuniv(r1, r2, v1, dm, de, nrev, 0.0, dtsec, 0.0, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                                                            %fprintf(1,detailSum);
                                                                                            strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                                                            strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                                                            kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                                                            for (j = 0; j < 3; j++)
                                                                                                dr[j] = r2[j] - r3h[j];
                                                                                                if (mag(dr) > 0.01)
                                                                                                    strbuildAll.AppendLine('velu does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                    for (j = 0; j < 3; j++)

                                                                                                        dv1[j] = v1tk[j] - v1tu[j];
                                                                                                        dv2[j] = v2tk[j] - v2tu[j];
                                                                                                    end
                                                                                                    if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                        strbuildAll.AppendLine('velk does not match velu \n');

                                                                                                        lambertbattin(r1, r2, v1, dm, de, nrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                                                        %fprintf(1,detailSum);
                                                                                                        strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                                                        strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                                                        kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                                                        for (j = 0; j < 3; j++)
                                                                                                            dr[j] = r2[j] - r3h[j];
                                                                                                            if (mag(dr) > 0.01)
                                                                                                                strbuildAll.AppendLine('velb does not get to r2 (km) position ' + mag(dr), '\n');
                                                                                                                %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                                                for (j = 0; j < 3; j++)

                                                                                                                    dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                    dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                end
                                                                                                                if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                    strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                    %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));

                                                                                                                    for (j = 0; j < 3; j++)

                                                                                                                        dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                        dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                    end
                                                                                                                    if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                        strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                        %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                                                                                    end
                                                                                                                    %watch.Stop();
                                                                                                                    %var elapsedMs = watch.ElapsedMilliseconds;
                                                                                                                    %Console.WriteLine(watch.ElapsedMilliseconds);

                                                                                                                    % use random nrevs, but check if nrev = 0 and set to 1
                                                                                                                    % but then you have to check that there is enough time for 1 rev
                                                                                                                    nnrev = nrev;
                                                                                                                    if (nnrev == 0)
                                                                                                                        nnrev = 1;

                                                                                                                        lambertminT(r1, r2, 'S', 'L', nnrev, out tmin, out tminp, out tminenergy);
                                                                                                                        strbuildAll.AppendLine('mS ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);
                                                                                                                        lambertminT(r1, r2, 'L', 'L', nnrev, out tmin, out tminp, out tminenergy);
                                                                                                                        strbuildAll.AppendLine('mL ' + tmin + ' minp ' + tminp + ' minener ' + tminenergy);

                                                                                                                        strbuildAll.AppendLine(' TEST ------------------ S  L ' + nnrev, ' rev ------------------');
                                                                                                                        %if (dtsec / tusec >= tbidk[nnrev, 2])
                                                                                                                        % do inside lambertk now

                                                                                                                        dm = 'S';
                                                                                                                        de = 'L';
                                                                                                                        AstroLambertkLibr.lambertkmins(s, tau, nnrev, dm, de, out kbi, out tof);
                                                                                                                        AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nnrev, dtwait, dtsec, tof, kbi, numiter, altpadc, modecon, 'n',
                                                                                                                        out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                                                        strbuildAll.AppendLine(detailAll);
                                                                                                                        %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + mag(dr).ToString('0.00000000000'));
                                                                                                                        strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                                                                                        strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                                                                                        %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                                                                                        kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                                                                                        for (j = 0; j < 3; j++)
                                                                                                                            dr[j] = r2[j] - r3h[j];
                                                                                                                            if (mag(dr) > 0.01)
                                                                                                                                strbuildAll.AppendLine('velk does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                lambertumins(r1, r2, nnrev, dm, out kbi, out tof);
                                                                                                                                lambertuniv(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, kbi, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                                                                                                %fprintf(1,detailSum);
                                                                                                                                strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                                                                                                strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                                                                                                kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                                                                                                for (j = 0; j < 3; j++)
                                                                                                                                    dr[j] = r2[j] - r3h[j];
                                                                                                                                    if (mag(dr) > 0.01)
                                                                                                                                        strbuildAll.AppendLine('velu does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                        for (j = 0; j < 3; j++)

                                                                                                                                            dv1[j] = v1tk[j] - v1tu[j];
                                                                                                                                            dv2[j] = v2tk[j] - v2tu[j];
                                                                                                                                        end
                                                                                                                                        if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                            strbuildAll.AppendLine('velk does not match velu \n');

                                                                                                                                            lambertbattin(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                                                                                            %fprintf(1,detailSum);
                                                                                                                                            strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                                                                                            strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                                                                                            kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                                                                                            for (j = 0; j < 3; j++)
                                                                                                                                                dr[j] = r2[j] - r3h[j];
                                                                                                                                                if (mag(dr) > 0.01)
                                                                                                                                                    strbuildAll.AppendLine('velb does not get to r2 (km) position ' + mag(dr), '\n');
                                                                                                                                                    %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                                                                                    for (j = 0; j < 3; j++)

                                                                                                                                                        dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                                                        dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                                                    end
                                                                                                                                                    if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                        strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                                                        %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                                                                                                                    end
                                                                                                                                                    %else
                                                                                                                                                    %    fprintf(1,' ------------------------- not enough time for 1 revs ');

                                                                                                                                                    strbuildAll.AppendLine(' TEST ------------------ L  L ' + nnrev, ' rev ------------------');
                                                                                                                                                    %if (dtsec / tusec >= tbidk[nnrev, 2])
                                                                                                                                                    % do inside lambertk now

                                                                                                                                                    dm = 'L';
                                                                                                                                                    de = 'L';
                                                                                                                                                    % switch tdi!!  tdidk to tdirk 'H'
                                                                                                                                                    AstroLambertkLibr.lambertkmins(s, tau, nnrev, dm, de, out kbi, out tof);  % 'H'

                                                                                                                                                    %double tofk1, kbik2, tofk2, kbik1;
                                                                                                                                                    %string outstr;
                                                                                                                                                    %getmins(1, 'k', nrev, r1, r2, s, tau, dm, de, out tofk1, out kbik1, out tofk2, out kbik2, out outstr);

                                                                                                                                                    AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nnrev, dtwait, dtsec, tof, kbi, numiter, altpadc, modecon, 'n',
                                                                                                                                                    out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                                                                                    strbuildAll.AppendLine(detailAll);
                                                                                                                                                    %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + mag(dr).ToString('0.00000000000'));
                                                                                                                                                    strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                                                                                                                    strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                                                                                                                    %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                                                                                                                    kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                                                                                                                    for (j = 0; j < 3; j++)
                                                                                                                                                        dr[j] = r2[j] - r3h[j];
                                                                                                                                                        if (mag(dr) > 0.01)
                                                                                                                                                            strbuildAll.AppendLine('velk does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                            lambertumins(r1, r2, nnrev, dm, out kbi, out tof);
                                                                                                                                                            lambertuniv(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, kbi, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                                                                                                                            %fprintf(1,detailSum);
                                                                                                                                                            strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                                                                                                                            strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                                                                                                                            kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                                                                                                                            for (j = 0; j < 3; j++)
                                                                                                                                                                dr[j] = r2[j] - r3h[j];
                                                                                                                                                                if (mag(dr) > 0.01)
                                                                                                                                                                    strbuildAll.AppendLine('velu does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                                    for (j = 0; j < 3; j++)

                                                                                                                                                                        dv1[j] = v1tk[j] - v1tu[j];
                                                                                                                                                                        dv2[j] = v2tk[j] - v2tu[j];
                                                                                                                                                                    end
                                                                                                                                                                    if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                        strbuildAll.AppendLine('velk does not match velu \n');

                                                                                                                                                                        lambertbattin(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                                                                                                                        %fprintf(1,detailSum);
                                                                                                                                                                        strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                                                                                                                        strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                                                                                                                        kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                                                                                                                        for (j = 0; j < 3; j++)
                                                                                                                                                                            dr[j] = r2[j] - r3h[j];
                                                                                                                                                                            if (mag(dr) > 0.01)
                                                                                                                                                                                strbuildAll.AppendLine('velb does not get to r2 (km) position ' + mag(dr), '\n');
                                                                                                                                                                                %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                                                                                                                for (j = 0; j < 3; j++)

                                                                                                                                                                                    dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                                                                                    dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                                                                                end
                                                                                                                                                                                if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                                    strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                                                                                    %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                                                                                                                                                end
                                                                                                                                                                                %else
                                                                                                                                                                                %    fprintf(1,' ------------------------- not enough time for 1 revs ');

                                                                                                                                                                                strbuildAll.AppendLine(' TEST ------------------ S  H ' + nnrev, ' rev ------------------');
                                                                                                                                                                                %if (dtsec / tusec >= tbirk[nnrev, 2])
                                                                                                                                                                                % do inside lambertk now

                                                                                                                                                                                dm = 'S';
                                                                                                                                                                                de = 'H';
                                                                                                                                                                                % switch tdi!!  tdirk to tdidk  'L'
                                                                                                                                                                                AstroLambertkLibr.lambertkmins(s, tau, nnrev, dm, de, out kbi, out tof);  % 'L'
                                                                                                                                                                                AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nnrev, dtwait, dtsec, tof, kbi, numiter, altpadc, modecon, 'n',
                                                                                                                                                                                out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                                                                                                                strbuildAll.AppendLine(detailAll);
                                                                                                                                                                                %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + mag(dr).ToString('0.00000000000'));
                                                                                                                                                                                strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                                                                                                                                                strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                                                                                                                                                %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                                                                                                                                                kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                                                                                                                                                for (j = 0; j < 3; j++)
                                                                                                                                                                                    dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                    if (mag(dr) > 0.01)
                                                                                                                                                                                        strbuildAll.AppendLine('velk does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                                                        lambertumins(r1, r2, nnrev, dm, out kbi, out tof);
                                                                                                                                                                                        lambertuniv(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, kbi, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                                                                                                                                                        %fprintf(1,detailSum);
                                                                                                                                                                                        strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                                                                                                                                                        strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                                                                                                                                                        kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                                                                                                                                                        for (j = 0; j < 3; j++)
                                                                                                                                                                                            dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                            if (mag(dr) > 0.01)
                                                                                                                                                                                                strbuildAll.AppendLine('velu does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                                                                for (j = 0; j < 3; j++)

                                                                                                                                                                                                    dv1[j] = v1tk[j] - v1tu[j];
                                                                                                                                                                                                    dv2[j] = v2tk[j] - v2tu[j];
                                                                                                                                                                                                end
                                                                                                                                                                                                if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                                                    strbuildAll.AppendLine('velk does not match velu \n');

                                                                                                                                                                                                    lambertbattin(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                                                                                                                                                    %fprintf(1,detailSum);
                                                                                                                                                                                                    strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                                                                                                                                                    strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                                                                                                                                                    kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                                                                                                                                                    for (j = 0; j < 3; j++)
                                                                                                                                                                                                        dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                                        if (mag(dr) > 0.01)
                                                                                                                                                                                                            strbuildAll.AppendLine('velb does not get to r2 (km) position ' + mag(dr), '\n');
                                                                                                                                                                                                            %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                                                                                                                                            for (j = 0; j < 3; j++)

                                                                                                                                                                                                                dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                                                                                                                dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                                                                                                            end
                                                                                                                                                                                                            if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                                                                strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                                                                                                                %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                                                                                                                                                                            end
                                                                                                                                                                                                            %else
                                                                                                                                                                                                            %    fprintf(1,' ------------------------- not enough time for 1 revs ');

                                                                                                                                                                                                            strbuildAll.AppendLine(' TEST ------------------ L  H ' + nnrev, ' rev ------------------');
                                                                                                                                                                                                            %if (dtsec / tusec >= tbirk[nnrev, 2])
                                                                                                                                                                                                            % do inside lambertk now

                                                                                                                                                                                                            dm = 'L';
                                                                                                                                                                                                            de = 'H';
                                                                                                                                                                                                            AstroLambertkLibr.lambertkmins(s, tau, nnrev, dm, de, out kbi, out tof);
                                                                                                                                                                                                            AstroLambertkLibr.lambertK(r1, v1, r2, dm, de, nnrev, dtwait, dtsec, tof, kbi, numiter, altpadc, modecon, 'n',
                                                                                                                                                                                                            out v1tk, out v2tk, out f, out g, out gdot, out hitearth, out errorout, out detailSum, out detailAll);
                                                                                                                                                                                                            strbuildAll.AppendLine(detailAll);
                                                                                                                                                                                                            %fprintf(1,'k#' + caseopt, detailSum + ' diffs ' + mag(dr).ToString('0.00000000000'));
                                                                                                                                                                                                            strbuildAll.AppendLine('lamk v1t ', v1tk(1).ToString('0.00000000000'), v1tk(2).ToString('0.00000000000'), v1tk(3).ToString('0.00000000000'));
                                                                                                                                                                                                            strbuildAll.AppendLine('lamk v2t ', v2tk(1).ToString('0.00000000000'), v2tk(2).ToString('0.00000000000'), v2tk(3).ToString('0.00000000000'));
                                                                                                                                                                                                            %fprintf(1,magv1t.ToString('0.0000000').PadLeft(12), magv2t.ToString('0.0000000').PadLeft(12));

                                                                                                                                                                                                            kepler(r1, v1tk, dtsec, out r3h, out v3h);
                                                                                                                                                                                                            for (j = 0; j < 3; j++)
                                                                                                                                                                                                                dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                                                if (mag(dr) > 0.01)
                                                                                                                                                                                                                    strbuildAll.AppendLine('velk does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                                                                                    lambertumins(r1, r2, nnrev, dm, out kbi, out tof);
                                                                                                                                                                                                                    lambertuniv(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, kbi, altpadc * gravConst.re, 'n', out v1tu, out v2tu, out hitearth, out detailSum, out detailAll);
                                                                                                                                                                                                                    %fprintf(1,detailSum);
                                                                                                                                                                                                                    strbuildAll.AppendLine('univ v1t ', v1tu(1).ToString('0.00000000000'), v1tu(2).ToString('0.00000000000'), v1tu(3).ToString('0.00000000000'));
                                                                                                                                                                                                                    strbuildAll.AppendLine('univ v2t ', v2tu(1).ToString('0.00000000000'), v2tu(2).ToString('0.00000000000'), v2tu(3).ToString('0.00000000000'));
                                                                                                                                                                                                                    kepler(r1, v1tu, dtsec, out r3h, out v3h);
                                                                                                                                                                                                                    for (j = 0; j < 3; j++)
                                                                                                                                                                                                                        dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                                                        if (mag(dr) > 0.01)
                                                                                                                                                                                                                            strbuildAll.AppendLine('velu does not get to r2 (km) position ' + mag(dr), '\n');

                                                                                                                                                                                                                            for (j = 0; j < 3; j++)

                                                                                                                                                                                                                                dv1[j] = v1tk[j] - v1tu[j];
                                                                                                                                                                                                                                dv2[j] = v2tk[j] - v2tu[j];
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                            if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                                                                                strbuildAll.AppendLine('velk does not match velu \n');

                                                                                                                                                                                                                                lambertbattin(r1, r2, v1, dm, de, nnrev, 0.0, dtsec, altpadc * gravConst.re, 'n', out v1tb, out v2tb, out hitearth, out detailSum, out detailAll);
                                                                                                                                                                                                                                %fprintf(1,detailSum);
                                                                                                                                                                                                                                strbuildAll.AppendLine('batt v1t ', v1tb(1).ToString('0.00000000000'), v1tb(2).ToString('0.00000000000'), v1tb(3).ToString('0.00000000000'));
                                                                                                                                                                                                                                strbuildAll.AppendLine('batt v2t ', v2tb(1).ToString('0.00000000000'), v2tb(2).ToString('0.00000000000'), v2tb(3).ToString('0.00000000000'));
                                                                                                                                                                                                                                kepler(r1, v1tb, dtsec, out r3h, out v3h);
                                                                                                                                                                                                                                for (j = 0; j < 3; j++)
                                                                                                                                                                                                                                    dr[j] = r2[j] - r3h[j];
                                                                                                                                                                                                                                    if (mag(dr) > 0.01)
                                                                                                                                                                                                                                        strbuildAll.AppendLine('velb does not get to r2 (km) position ' + mag(dr), '\n');
                                                                                                                                                                                                                                        %fprintf(1,'diffs ' + mag(dr).ToString('0.00000000000'));

                                                                                                                                                                                                                                        for (j = 0; j < 3; j++)

                                                                                                                                                                                                                                            dv1[j] = v1tk[j] - v1tb[j];
                                                                                                                                                                                                                                            dv2[j] = v2tk[j] - v2tb[j];
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        if (mag(dv1) > 0.01 || mag(dv2) > 0.01)
                                                                                                                                                                                                                                            strbuildAll.AppendLine('velk does not match velb \n');
                                                                                                                                                                                                                                            %fprintf(1,'diffs ' + MathTimeLib::mag(dr).ToString('0.00000000000'));
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        %else
                                                                                                                                                                                                                                        %    fprintf(1,' ------------------------- not enough time for 1 revs ');

                                                                                                                                                                                                                                        strbuildAll.AppendLine(' --------------------------------end case ' + caseopt + '------------------------------------------------ ');
                                                                                                                                                                                                                                        string resultStr = strbuildAll;
                                                                                                                                                                                                                                    end

                                                                                                                                                                                                                                    string directory = @'D:\Codes\LIBRARY\cs\TestAll\';
                                                                                                                                                                                                                                    File.WriteAllText(directory + 'testall-lambertknown.out', strbuildAll);

                                                                                                                                                                                                                                    this.opsStatus.Text = 'Done ';
                                                                                                                                                                                                                                    Refresh();
       end  % testknowncases


       function testradecgeo2azel()
           rtasc = 294.98914583 / rad;
           decl = -20.8234944 / rad;
           xp = 0.0;
           yp = 0.0;
           lod = 0.0;
           jdut1 = 2453101.82740678310;
           ttt = 0.042623631889;
           ddpsi = -0.052195;
           ddeps = -0.003875;
           rr = 12373.3546098;  % km
           latgd = 39.007 / rad;
           lon = -104.883 / rad;
           alt = 0.3253;

           [az, el] = radecgeo2azel(rtasc, decl, rr, latgd, lon, alt, ttt, jdut1, lod, xp, yp, ddpsi, ddeps, AstroLib.EOpt.e80);
       end

       function testijk2ll()
           rad = 180.0 / pi;

           r = [ 1.023 * gravConst.re, 1.076 * gravConst.re, 1.011 * gravConst.re ];

           [latgc, latgd, lon, hellp] = ecef2ll(r);

           fprintf(1,'ecef2ll %11.7f  %11.7f  %11.7f  \n', latgd*rad, lon * rad, hellp);

           [latgc, latgd, lon, hellp] = ecef2llb(r);

           fprintf(1,'ecef2llb %11.7f  %11.7f  %11.7f  \n', latgd*rad, lon * rad, hellp);
       end

       function testgd2gc()
           double rad = 180.0 / pi;
           latgd = 34.173429 / rad;

           [ans] = gd2gc(latgd);

           fprintf(1,'gd2gc %11.7f \n' + ans,'\n');
       end

       function testsite()
           latgd = 39.007 / rad;
           lon = -104.883 / rad;
           alt = 0.3253;
           fprintf(1,'site gc %16.9f %16.9f %16.9f  %16.9f  \n',r, latgc*rad );

           [rsecef, vsecef] = site(latgd, lon, alt);

           fprintf(1,'site ' + rsecef(1), rsecef(2), rsecef(3),
           vsecef(1), vsecef(2), vsecef(3));

       end


       % --------  sun          - analytical sun ephemeris
       function testsun()
           jd = 2449444.5;
           [rsun, rtasc, decl] = sun(jd);

           fprintf(1,'sun ' + rsun(1), rsun(2), rsun(3));


           fprintf(1,'now take the TOD sun vector (analytical) and move to MOD and TOD for comparison \n');
           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsun',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n\n',db, mag(db) );

           %         [reci,veci,aeci] = eci2mod ( rsun',vmod,amod,ttt );
           %         fprintf(1,'eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );
           %
           %         [reci,veci,aeci] = eci2tod ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           %         fprintf(1,'eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [hms] = hms2rad( 0,44,33.42 );
           [dms] = dms2rad( 4,47,18.3 );
           fprintf(1,'hms ast alm rtasc %11.9f decl %11.9f \n',hms*rad,dms*rad );


           % now try alamnac method
           [rsuna,rtasca,decla] = sunalmanac ( jd+jdfrac );
           fprintf(1,'\n\nsun  rtasc %14.6f deg decl %14.6f deg\n',rtasca*rad, decla*rad );
           fprintf(1,'sun ALM %11.9f%11.9f%11.9f au\n',rsuna );
           fprintf(1,'sun ALM %14.4f%14.4f%14.4f km\n',rsuna*149597870.0 );

           fprintf(1,'rs aa ICRF %11.9f %11.9f %11.9f km \n',rsunaa);

           fprintf(1,'now take the TOD sun vector (analytical) and move to MOD and TOD for comparison \n');
           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsuna',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsuna',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n\n',db, mag(db) );

           %         [reci,veci,aeci] = eci2mod ( rsuna',vmod,amod,ttt );
           %         fprintf(1,'eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );
           %
           %         [reci,veci,aeci] = eci2tod ( rsuna',vmod,amod,ttt, ddpsi, ddeps );
           %         fprintf(1,'eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [hms] = hms2rad( 0,44,33.42 );
           [dms] = dms2rad( 4,47,18.3 );
           fprintf(1,'hms ast alm rtasc %11.9f decl %11.9f \n',hms*rad,dms*rad );

           fprintf(1,'==============================================================\n');
           % previous edition example
           year = 1994;
           mon = 4;
           day = 1;
           hr = 23;
           minute = 58;
           second = 59.816;
           [jd,jdfrac] = jday(year, mon, day, hr, minute, second);
           fprintf(1,'jd  %11.9f \n',jd+jdfrac );
           dat = 28;
           dut1 = -0.0226192;
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
           fprintf(1,'sun ICRS %11.9f%11.9f%11.9f au\n',rsun );
           fprintf(1,'sun ICRS %14.4f%14.4f%14.4f km\n',rsun*149597870.0 );

           rsunaa = [0.9772766 0.1922635  0.0833613]*149597870.0; % astronomical alm value into km
           fprintf(1,'rs almanac MOD %11.9f %11.9f %11.9f km \n',rsunaa);

           fprintf(1,'now take the TOD sun vector (analytical) and move to MOD and TOD for comparison \n');
           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsun',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n\n',db, mag(db) );

           %         [reci,veci,aeci] = eci2mod ( rsun',vmod,amod,ttt );
           %         fprintf(1,'eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );
           %
           %         [reci,veci,aeci] = eci2tod ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           %         fprintf(1,'eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           % now try alamnac method
           [rsuna,rtasca,decla] = sunalmanac ( jd+jdfrac );
           fprintf(1,'\n\nsun  rtasc %14.6f deg decl %14.6f deg\n',rtasca*rad, decla*rad );
           fprintf(1,'sun ALM %11.9f%11.9f%11.9f au\n',rsuna );
           fprintf(1,'sun ALM %14.4f%14.4f%14.4f km\n',rsuna*149597870.0 );

           fprintf(1,'rs aa ICRF %11.9f %11.9f %11.9f km \n',rsunaa);

           fprintf(1,'now take the TOD sun vector (analytical) and move to MOD and TOD for comparison \n');
           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsuna',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsuna',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           fprintf(1,'==============================================================\n');
           % another example tdt = 29+32.184 secs less than 4/2 at 0 hrs
           year = 1995;
           mon = 4;
           day = 1;
           hr = 23;
           minute = 58;
           second = 58.816;
           [jd,jdfrac] = jday(year, mon, day, hr, minute, second);
           fprintf(1,'jd  %11.9f \n',jd+jdfrac );
           dat = 29;
           dut1 = 0.1535663;
           [ut1, tut1, jdut1,jdut1frac, utc, tai, tt, ttt, jdtt,jdttfrac, tdb, ttdb, jdtdb,jdtdbfrac ] ...
               = convtime ( year, mon, day, hr, minute, second, timezone, dut1, dat );
           fprintf(1,'input data \n\n');
           fprintf(1,' year %5i ',year);
           fprintf(1,' mon %4i ',mon);
           fprintf(1,' day %3i ',day);
           fprintf(1,' %3i:%2i:%8.6f\n ',hr,minute,second );
           fprintf(1,' dut1 %8.6f s',dut1);
           fprintf(1,' dat %3i s',dat);

           fprintf(1,'ut1 %8.6f tut1 %16.12f jdut1 %18.11f ',ut1,tut1,jdut1 );
           [h,m,s] = sec2hms( ut1 );
           fprintf(1,'hms %3i %3i %8.6f \n',h,m,s);
           fprintf(1,'utc %8.6f ',utc );
           [h,m,s] = sec2hms( utc );
           fprintf(1,'hms %3i %3i %8.6f \n',h,m,s);
           fprintf(1,'tai %8.6f',tai );
           [h,m,s] = sec2hms( tai );
           fprintf(1,'hms %3i %3i %8.6f \n',h,m,s);
           fprintf(1,'tt  %8.6f ttt  %16.12f jdtt  %18.11f ',tt,ttt,jdtt );
           [h,m,s] = sec2hms( tt );
           fprintf(1,'hms %3i %3i %8.6f \n',h,m,s);
           fprintf(1,'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n',tdb,ttdb,jdtdb );

           [rsun,rtasc,decl] = sun ( jd+jdfrac );
           fprintf(1,'sun  rtasc %14.6f deg decl %14.6f deg\n',rtasc*rad,decl*rad );
           fprintf(1,'sun ICRS %11.9f%11.9f%11.9f au\n',rsun );
           fprintf(1,'sun ICRS %14.4f%14.4f%14.4f km\n',rsun*149597870.0 );

           rsunaa = [0.9781158 0.1884327  0.0816997]*149597870.0; % astronomical alm value into km
           fprintf(1,'rs almanac MOD %11.9f %11.9f %11.9f km \n',rsunaa);

           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsun',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n\n',db, mag(db) );

           %         [reci,veci,aeci] = eci2mod ( rsun',vmod,amod,ttt );
           %         fprintf(1,'eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - mod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );
           %
           %         [reci,veci,aeci] = eci2tod ( rsun',vmod,amod,ttt, ddpsi, ddeps );
           %         fprintf(1,'eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           %         db = reci*149597870.0-rsunaa';
           %         fprintf(1,'delta eci - tod  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           % now try alamnac method
           [rsuna,rtasca,decla] = sunalmanac ( jd+jdfrac );
           fprintf(1,'\n\nsun  rtasc %14.6f deg decl %14.6f deg\n',rtasca*rad, decla*rad );
           fprintf(1,'sun ALM %11.9f%11.9f%11.9f au\n',rsuna );
           fprintf(1,'sun ALM %14.4f%14.4f%14.4f km\n',rsuna*149597870.0 );

           fprintf(1,'rs aa ICRF %11.9f %11.9f %11.9f km \n',rsunaa);

           fprintf(1,'now take the TOD sun vector (analytical) and move to MOD and TOD for comparison \n');
           %ttt= ( jd - 2451545.0  )/ 36525.0;
           vmod = [0 0 0]';
           amod = [0 0 0]';
           [reci,veci,aeci] = mod2eci  ( rsuna',vmod,amod,ttt );
           fprintf(1,'mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta mod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );

           [reci,veci,aeci] = tod2eci  ( rsuna',vmod,amod,ttt, ddpsi, ddeps );
           fprintf(1,'tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',reci*149597870.0, mag(reci)*149597870.0 );
           db = reci*149597870.0-rsunaa';
           fprintf(1,'delta tod - eci  %11.9f %11.9f %11.9f %11.4f km  \n',db, mag(db) );



       end

       % --------  moon         - analytical moon ephemeris
       function testmoon()
           jd = 2449470.5;
           [rmoon, rtasc, decl] = moon(jd);

           fprintf(1,'moon ' + rmoon(1), rmoon(2), rmoon(3));
       end


       function testkepler()
           dtsec = 42397.344;  % s

           r1 = [ 2.500000 * gravConst.re, 0.000000, 0.000000 ];
           % assume circular initial orbit for vel calcs
           v1 = [ 0.0, sqrt(gravConst.mu / r1(1)), 0.0 ];
           fprintf(1,'kepler %16.8f %16.8f %16.8f %16.8f %16.8f %16.8f  %16.8f \n', r1(1), r1(2), r1(3), v1(1), v1(2), v1(3), dtsec);

           kepler(r1, v1, dtsec, out r2, out v2);

           fprintf(1,'kepler %16.8f %16.8f %16.8f %16.8f %16.8f %16.8f \n', r2(1), r2(2), r2(3), v2(1), v2(2), v2(3));

           % test multi-rev case
           rv2coe(r1, v1, out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
           period = 2.0 * pi * sqrt(Math.Pow(mag(r1),3)/ gravConst.mu);

           [r2, v3] = kepler(r1, v1, dtsec+7.0*period);

           fprintf(1,'kepler ' + r2(1), r2(2), r2(3),
           v2(1), v2(2), v2(3), (dtsec+7.0*period));

           % alt tests
           % initial coes with more than one period = 6281.815597 sec
           rad = 180.0/pi;
           [ro, vo] = coe2rv (7358.39, 0.0, 28.5/rad, 0.0/rad, 30.0/rad, 0.0/rad, 0.0, 0.0, 0.0);
           fprintf(1,'input: \n' );
           fprintf(1,'ro %16.8f %16.8f %16.8f km \n',ro );
           fprintf(1,'vo %16.8f %16.8f %16.8f km/s \n',vo );

           % convert 40 minutes to seconds
           dtsec = 4000.0*60.0;
           dtsec = 1.291007302335531e+03;
           dtsec = 6281.815597;
           fprintf(1,'dt %16.8f sec \n',dtsec );
           fprintf(1,'intermediate values: \n' );

           [r1,v1] =  kepler ( ro,vo, dtsec );

           % answer in km and km/s
           fprintf(1,'output: \n' );
           fprintf(1,'r1 %16.8f %16.8f %16.8f er \n',r1/re );
           fprintf(1,'r1 %16.8f %16.8f %16.8f km \n',r1 );
           fprintf(1,'v1 %16.8f %16.8f %16.8f er/tu \n',v1/velkmps );
           fprintf(1,'v1 %16.8f %16.8f %16.8f km/s \n',v1 );



           ro=[-3244.01178958993; 5561.5015207476; 3181.63137126354];
           vo=[-0.311911476329513; 3.55766787343696; -6.53796978233233];
           dtsec = 240.0;
           fprintf(1,'dt %16.8f sec \n',dtsec );
           fprintf(1,'intermediate values: \n' );

           [r1,v1] =  kepler ( ro,vo, dtsec );

           % answer in km and km/s
           fprintf(1,'output: \n' );
           fprintf(1,'r1 %16.8f %16.8f %16.8f er \n',r1/re );
           fprintf(1,'r1 %16.8f %16.8f %16.8f km \n',r1 );
           fprintf(1,'v1 %16.8f %16.8f %16.8f er/tu \n',v1/velkmps );
           fprintf(1,'v1 %16.8f %16.8f %16.8f km/s \n',v1 );





       end



       % test in geoloc.sln
       %function testcovct2cl()
       %
       %    double[,] cartcov = new double[6, 6];
       %    cartstate = new double(7);
       %    string anomclass;
       %    double[,] classcov = new double[6, 6];
       %    double[,] tm = new double[6, 6];

       %    covct2cl(cartcov, cartstate, anomclass, out classcov, out tm);

       %end
       %function testcovcl2ct()
       %
       %    covcl2ct
       %    (double[,] classcov, classstate, string anomclass, out double[,] cartcov, out double[,] tm
       %            );
       %end
       %function testcovct2eq()
       %
       %    classState = new double(7);
       %    cartState = new double(7);
       %    eqState = new double(7);
       %    flState = new double(7);
       %    double[,] cartCov = new double[6, 6];
       %    double[,] classCov = new double[6, 6];
       %    double[,] eqCov = new double[6, 6];
       %    double[,] flCov = new double[6, 6];
       %    double[,] rswCov = new double[6, 6];
       %    double[,] ntwCov = new double[6, 6];
       %    double[,] tm = new double[6, 6];

       %    cartCov = new double[,]   1, 0, 0, 0, 0, 0   0, 1, 0, 0, 0, 0   0, 0, 1, 0, 0, 0
       %                          0, 0, 0, 1, 0, 0   0, 0, 0, 0, 1, 0   0, 0, 0, 0, 0, 1 end ];


       %    covct2eq
       %    (     double[,] cartcov, cartstate, string anomeq, Int16 fr, out double[,] eqcov, out  tm                );
       %end
       %function testcoveq2ct()
       %
       %    coveq2ct
       %     (                double[,] eqcov, eqstate, string anomeq, Int16 fr, out double[,] cartcov, out  tm                );
       %end
       %function testcovcl2eq()
       %
       %    covcl2eq
       %    (
       %            double[,] classcov, classstate, string anomclass, string anomeq, Int16 fr, out double[,] eqcov, out  tm                );
       %end
       %function testcoveq2cl()
       %
       %    coveq2cl(double[,] eqcov, eqstate, string anomeq, string anomclass, Int16 fr, out double[,] classcov, out  tm);
       %end
       %function testcovct2fl()
       %
       %    covct2fl
       %      (
       %            double[,] cartcov, cartstate, string anomflt, double ttt, double jdut1, double lod,
       %            double xp, double yp, Int16 terms, double ddpsi, double ddeps, out double[,] flcov, out  tm
       %            );
       %end
       %function testcovfl2ct()
       %
       %    covfl2ct(double[,] flcov, flstate, string anomflt, double ttt, double jdut1, double lod,
       %            double xp, double yp, Int16 terms, double ddpsi, double ddeps, out double[,] cartcov, out  tm);

       %end
       %function testcovct_rsw()
       %
       %    covct_rsw(ref double[,] cartcov, cartstate, MathTimeLib.Edirection direct, ref double[,] rswcov, out  tm);
       %        direct = MathTimeLib.Edirection.eto;
       %        covct_ntw(ref cartCovo, cartState, direct, ref ntwCov, out tm);

       %    end
       %    function testcovct_ntw()
       %
       %        direct = MathTimeLib.Edirection.eto;
       %        covct_ntw(ref cartCovo, cartState, direct, ref ntwCov, out tm);

       %        covct_ntw(ref double[,] cartcov, cartstate, MathTimeLib.Edirection direct, ref double[,] ntwcov, out  tm);
       %end

       function testsunmoonjpl()
           j[jd, jdF] = day(2017, 5, 11, 3, 51, 42.7657);

           fprintf(1,' =============================   test sun and moon ephemerides =============================\n');

           % read in jpl sun moon files
           % answers
           fprintf(1,'2017  5 11  0  96576094.2145 106598001.2476 46210616.7776     151081093.9419  0.9804616 -252296.5509 -302841.7334 -93212.7720');
           fprintf(1,'2017  5 11 12  95604355.9737 107353047.2919 46537942.1006     151098145.9151  0.9802403 -218443.5158 -325897.7785 -102799.8515');
           fprintf(1,'2017  5 12  0  94625783.6875 108100430.4112 46861940.2387     151115133.0492  0.9800199 -182165.5046 -345316.4032 -111246.7742');

           % for 1 day centers, need to adjust the initjpl function
           %initjplde(ref jpldearr, 'D:/Codes/LIBRARY/DataLib/', 'sunmooneph_430t.txt', out jdjpldestart, out jdjpldestartFrac);
           infilename = append('D:\Codes\LIBRARY\DataLib\', 'sunmooneph_430t12.txt');
           [jpldearr, jdjpldestart, jdjpldestartFrac] = initjplde(infilename);

           findjpldeparam(jd, 0.0, 'l', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
           fprintf(1,'findjpldeephem 0000 hrs l\n ' + jd, ' 0.00000 ' + rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));

           findjpldeparam(jd, 0.0, 's', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
           fprintf(1,'findjpldeephem 0000 hrs s\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));

           sunmoonjpl(jd, 0.0, 's', ref jpldearr, jdjpldestart, out rsun, out rtascs, out decls, out rmoon, out rtascm, out declm);
           fprintf(1,'sunmoon 0000 hrs s\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));


           findjpldeparam(jd, jdF, 'l', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
           fprintf(1,'findjpldeephem hrs l\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));

           sunmoonjpl(jd, jdF, 'l', ref jpldearr, jdjpldestart, out rsun, out rtascs, out decls, out rmoon, out rtascm, out declm);
           fprintf(1,'sunmoon hrs l\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));

           findjpldeparam(jd, 1.0, 'l', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
           fprintf(1,'findjpldeephem 2400 hrs s\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));


           % ex 8.5 test
           jday(2020, 2, 18, 15, 8, 47.23847, out jd, out jdF);
           findjpldeparam(jd, 0.0, 's', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
           fprintf(1,'ex findjpldeephem 0000 hrs s\n ' + jd, jdF, rsun(1),
           rsun(2), rsun(3),
           rmoon(1), rmoon(2), rmoon(3));

           % test interpolation of vectors
           % shows spline is MUCH better - 3 km sun variation in mid day linear, 60m diff with spline.
           jday(2017, 5, 11, 3, 51, 42.7657, out jd, out jdF);
           jday(2000, 1, 1, 0, 0, 0.0, out jd, out jdF);
           fprintf(1,'findjplde  mfme     rsun x             y                 z             rmoon x             y                z      (km)');

           var watch = System.Diagnostics.Stopwatch.StartNew();
           % the code that you want to measure comes here
           % read in jpl sun moon files - seems to be the slowest part (800 msec)
           infilename = append('D:\Codes\LIBRARY\DataLib\', 'sunmooneph_430t.txt');
           [jpldearr, jdjpldestart, jdjpldestartFrac] = initjplde(infilename);

           watch.Stop();
           var elapsedMs = watch.ElapsedMilliseconds;

           watch = System.Diagnostics.Stopwatch.StartNew();

           ii;
           for (ii = 0; ii < 36500; ii++)

               % seems pretty fast (45 msec)
               for (jj = 0; jj < 24; jj++)

                   findjpldeparam(jd + ii, (jj * 1.0) / 24.0, 's', jpldearr, jdjpldestart, out rsun, out rsmag, out rmoon, out rmmag);
                   % the write takes some time (160 msec)
                   %fprintf(1,' ' + jd, (ii * 60.0).ToString('0000'),
                   %    rsun(1), rsun(2), rsun(3),
                   %    rmoon(1), rmoon(2), rmoon(3));
               end
           end

       end


       function testkp2ap()

           for i = 1: 27
               kp = 10.0 * i / 3.0;
               [ap] = kp2ap(kp);
               % get spacing correct, leading 0, front spaces
               fprintf(1,'%11.7f %11.7f  %11.7f \n', i, 0.1 * kp, ap);
           end
       end


       function testazel2radec()

           double rad = 180.0 / pi;
           reci = new double(4);
           veci = new double(4);
           recef = new double(4);
           vecef = new double(4);
           rsecef = new double(4);
           vsecef = new double(4);
           rseci = new double(4);
           vseci = new double(4);
           double rho, az, el, drho, daz, del, alt, latgd, lon;
           double rr, rtasc, decl, drr, drtasc, ddecl;
           double trtasc, tdecl, dtrtasc, dtdecl;
           double ttt, xp, yp, lod, jdut1, ddpsi, ddeps, ddx, ddy, dut1, lst, gst, jdtt, jdftt;
           year, mon, day, hr, minute, dat;
           double second, jd, jdFrac;

           rr = trtasc = tdecl = rtasc = decl = drr = dtrtasc = dtdecl = drtasc = ddecl = 0.0;
           rho = az = el = drho = daz = del = 0.0;

           nutLoc = 'D:\Codes\LIBRARY\DataLib\';
           [iau80arr] = iau80in(nutLoc);
           nutLoc = 'D:\Codes\LIBRARY\DataLib\';
           [iau06arr] = iau06in(nutLoc);

           % now read it in
           double jdxysstart, jdfxysstart;
           AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

           xp = 0.0;
           yp = 0.0;
           lod = 0.0;
           ddpsi = -0.052195;
           ddeps = -0.003875;
           ddx = 0.0;  % fixxxxxx
           ddy = 0.0;
           dut1 = -0.37816;

           year = 2015;
           mon = 12;
           day = 15;
           hr = 16;
           dat = 36;
           minute = 58;
           second = 50.208;
           jday(year, mon, day, hr, minute, second, out jd, out jdFrac);

           % note you have to use tdb for time of ineterst AND j2000 (when dat = 32)
           jdtt = jd;
           jdftt = jdFrac + (dat + 32.184) / 86400.0;
           ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
           jdut1 = jd + jdFrac + dut1 / 86400.0;

           recef = [ -605.79221660, -5870.22951108, 3493.05319896 ];
           recef = [ -100605.79221660, -1005870.22951108, 1003493.05319896 ];
           vecef = [ -1.56825429, -3.70234891, -6.47948395 ];
           eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.efrom, ref recef, ref vecef,
           AstroLib.EOpt.e80, iau80arr, iau06arr,
           jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);

           lon = -104.883 / rad;
           latgd = 39.007 / rad;
           alt = 2.102;
           site(latgd, lon, alt, out rsecef, out vsecef);

           eci_ecef(ref rseci, ref vseci, MathTimeLib.Edirection.efrom, ref rsecef, ref vsecef,
           AstroLib.EOpt.e80, iau80arr, iau06arr,
           jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);

           lstime(lon, jdut1, out lst, out gst);

           % prout initial conditions
           fprintf(1,'recef  ' + recef(1), recef(2), recef(3),
           'v  ' + vecef(1), vecef(2), vecef(3));
           fprintf(1,'rs ecef  ' + rsecef(1), rsecef(2), rsecef(3));
           fprintf(1,'reci  ' + reci(1), reci(2), reci(3),
           'v  ' + veci(1), veci(2), veci(3));
           fprintf(1,'rs eci  ' + rseci(1), rseci(2), rseci(3));


           rv_razel(ref recef, ref vecef, latgd, lon, alt, MathTimeLib.Edirection.eto, ref rho, ref az, ref el, ref drho, ref daz, ref del);

           rv_radec(ref reci, ref veci, MathTimeLib.Edirection.eto, ref rr, ref rtasc, ref decl, ref drr, ref drtasc, ref ddecl);

           rv_tradec(ref reci, ref veci, rseci, MathTimeLib.Edirection.eto, ref rho, ref trtasc, ref tdecl, ref drho, ref dtrtasc, ref dtdecl);

           % prout results
           fprintf(1,'razel ' + rho, az, el,
           '  ' + drho, daz, del);
           fprintf(1,'radec ' + rr, rtasc, decl,
           '  ' + drr, drtasc, ddecl);
           fprintf(1,'tradec ' + rho, trtasc, tdecl,
           drho, dtrtasc, dtdecl);

           double rtasc1;
           [rtasc, decl, rtasc1] = azel_radec(az, el, lst, latgd);
           fprintf(1,'radec ' + rtasc + ' rtasc1 ' + rtasc1, decl);
           fprintf(1,'radec ' + (pi * 2 - rtasc) + ' rtasc1 ' + (pi * 2 - rtasc1), decl);
       end


       % ------------------------------------------------------------------------------
       %
       %                           function LegPolyEx
       %
       %   this function finds the exact (from equations) Legendre polynomials for the gravity field.
       %   note that the arrays are indexed from 0 to coincide with the usual nomenclature (eq 8-21
       %   in my text). fortran implementations will have indicies of 1 greater as they often
       %   start at 1. these are exact expressions derived from mathematica.
       %
       %  author        : david vallado             davallado@gmail.com  16 dec 2019
       %
       %  inputs        description                                   range / units
       %    latgc       - Geocentric lat of satellite                   pi to pi rad
       %    order       - size of gravity field                         1..2160..
       %
       %  outputs       :
       %    LegArr      - [,] array of Legendre polynomials
       %
       %  locals :
       %    L,m         - degree and order indices
       %    conv        - conversion to un-unitalize
       %
       %  coupling      :
       %   none
       %
       %  references :
       %    vallado       2013, 597, Eq 8-57
       % ------------------------------------------------------------------------------*/

       function LegPolyEx
           (
           double latgc,
           Int32 order,
           out double[,] LegArrEx
           )

           LegArrEx = new double[order + 2, order + 2];

           double s = LegArrEx(2, 1) = sin(latgc);
           double c = LegArrEx(2, 2) = cos(latgc);

           % -------------------- exact epxressions ----------------------
           LegArrEx(3, 1) = 0.5 * (3 * s * s - 1.0);
           LegArrEx(3, 2) = 3.0 * s * c;
           LegArrEx(3, 3) = 3.0 * c * c;

           % include (-1)^m for all the terms
           LegArrEx(4, 1) = -0.5 * s * (3 - 5 * s * s);
           LegArrEx(4, 2) = (3.0 / 2) * c * (-1 + 5 * s * s); % 15s^2 - 3
           LegArrEx(4, 3) = 15 * s * c * c;
           LegArrEx(4, 4) = 15 * (c * c * c);

           LegArrEx(5, 1) = 1.0 / 8.0 * (35.0 * s^4) - 30.0 * s^2) + 3.0);
           LegArrEx(5, 2) = 2.5 * c * (-3 * s + 7 * s^3));
           LegArrEx(5, 3) = 7.5 * c^2) * (-1 + 7 * s^2));
           LegArrEx(5, 4) = 105.0 * c^3) * s;
           LegArrEx(5, 5) = 105.0 * c^4);

           LegArrEx(6, 1) = (1.0 / 8) * s * (15 - 70 * s^2) + 63 * s^4));
           LegArrEx(6, 2) = (15.0 / 8) * c * (1 - 14 * s^2) + 21 * s^4));
           LegArrEx(6, 3) = (105.0 / 2) * c * c * (-s + 3 * s^3));
           LegArrEx(6, 4) = (105.0 / 2) * c^3) * (-1 + 9 * s^2));
           LegArrEx(6, 5) = 945.0 * s * c^4);
           LegArrEx(6, 6) = 945.0 * c^5);

           LegArrEx[6, 0] = 1.0 / 16 * (-5 + 105 * s^2) - 315 * s^4) + 231 * s^6));
           LegArrEx[6, 1] = (21.0 / 8) * c * (5 * s - 30 * s^3) + 33 * s^5));
           LegArrEx[6, 2] = (105.0 / 8) * c * c * (1 - 18 * s^2) + 33 * s^4));
           LegArrEx[6, 3] = (315.0 / 2) * c^3) * (-3 * s + 11 * s^3));
           LegArrEx[6, 4] = 945.0 / 2 * Math.Pow(c * c, 2) * (-1 + 11 * s^2));
           LegArrEx[6, 5] = 10395.0 * s * c^5);
           LegArrEx[6, 6] = 10395.0 * Math.Pow(c * c, 3);

           LegArrEx[7, 0] = 1.0 / 16 * (-35 * s + 315 * s^3) - 693 * s^5) + 429 * s^7));
           LegArrEx[7, 1] = (7.0 / 16) * c * (-5 + 135 * s^2) - 495 * s^4) + 429 * s^6));
           LegArrEx[7, 2] = (63.0 / 8) * c * c * (15 * s - 110 * s^3) + 143 * s^5));
           LegArrEx[7, 3] = (315.0 / 8) * c^3) * (3 - 66 * s^2) + 143 * s^4));
           LegArrEx[7, 4] = 3465.0 / 2 * Math.Pow(c * c, 2) * (-3 * s + 13 * s^3));
           LegArrEx[7, 5] = (10395.0 / 2) * c^5) * (-1 + 13 * s^2));
           LegArrEx[7, 6] = 135135.0 * s * Math.Pow(c * c, 3);
           LegArrEx[7, 7] = 135135.0 * c^7);

           LegArrEx[8, 0] = 1.0 / 128 * (35 - 1260 * s^2) + 6930 * s^4) - 12012 * s^6) + 6435 * s^8));
           LegArrEx[8, 1] = (9.0 / 16) * c * (-35 * s + 385 * s^3) - 1001 * s^5) + 715 * s^7));
           LegArrEx[8, 2] = (315.0 / 16) * c * c * (-1 + 33 * s^2) - 143 * s^4) + 143 * s^6));
           LegArrEx[8, 3] = (3465.0 / 8) * c^3) * (3 * s - 26 * s^3) + 39 * s^5));
           LegArrEx[8, 4] = 10395.0 / 8 * Math.Pow(c * c, 2) * (1 - 26 * s^2) + 65 * s^4));
           LegArrEx[8, 5] = (135135.0 / 2) * c^5) * (-s + 5 * s^3));
           LegArrEx[8, 6] = (135135.0 / 2) * Math.Pow(c * c, 3) * (-1 + 15 * s^2));
           LegArrEx[8, 7] = 2027025.0 * s * c^7);
           LegArrEx[8, 8] = 2027025.0 * Math.Pow(c * c, 4);

           LegArrEx[9, 0] = 1.0 / 128 * (315 * s - 4620 * s^3) + 18018 * s^5) - 25740 * s^7) + 12155 * s^9));
           LegArrEx[9, 1] = (45.0 / 128) * c * (7 - 308 * s^2) + 2002 * s^4) - 4004 * s^6) + 2431 * s^8));
           LegArrEx[9, 2] = (495.0 / 16) * c * c * (-7 * s + 91 * s^3) - 273 * s^5) + 221 * s^7));
           LegArrEx[9, 3] = (3465.0 / 16) * c^3) * (-1 + 39 * s^2) - 195 * s^4) + 221 * s^6));
           LegArrEx[9, 4] = 135135.0 / 8 * Math.Pow(c * c, 2) * (s - 10 * s^3) + 17 * s^5));
           LegArrEx[9, 5] = (135135.0 / 8) * c^5) * (1 - 30 * s^2) + 85 * s^4));
           LegArrEx[9, 6] = (675675.0 / 2) * Math.Pow(c * c, 3) * (-3 * s + 17 * s^3));
           LegArrEx[9, 7] = (2027025.0 / 2) * c^7) * (-1 + 17 * s^2));
           LegArrEx[9, 8] = 34459425.0 * s * Math.Pow(c * c, 4);
           LegArrEx[9, 9] = 34459425.0 * c^9);

           LegArrEx[10, 0] = 1.0 / 256 * (-63 + 3465 * s^2) - 30030 * s^4) + 90090 * s^6) - 109395 * s^8) + 46189 * s^10));
           LegArrEx[10, 1] = (55.0 / 128) * c * (63 * s - 1092 * s^3) + 4914 * s^5) - 7956 * s^7) + 4199 * s^9));
           LegArrEx[10, 2] = (495.0 / 128) * c * c * (7 - 364 * s^2) + 2730 * s^4) - 6188 * s^6) + 4199 * s^8));
           LegArrEx[10, 3] = (6435.0 / 16) * c^3) * (-7 * s + 105 * s^3) - 357 * s^5) + 323 * s^7));
           LegArrEx[10, 4] = 45045.0 / 16 * Math.Pow(c * c, 2) * (-1 + 45 * s^2) - 255 * s^4) + 323 * s^6));
           LegArrEx[10, 5] = (135135.0 / 8) * c^5) * (15 * s - 170 * s^3) + 323 * s^5));
           LegArrEx[10, 6] = (675675.0 / 8) * Math.Pow(c * c, 3) * (3 - 102 * s^2) + 323 * s^4));
           LegArrEx[10, 7] = (11486475.0 / 2) * c^7) * (-3 * s + 19 * s^3));
           LegArrEx[10, 8] = 34459425.0 / 2 * Math.Pow(c * c, 4) * (-1 + 19 * s^2));
           LegArrEx[10, 9] = 654729075.0 * s * c^9);
           LegArrEx[10, 10] = 654729075.0 * Math.Pow(c * c, 5);

           LegArrEx[11, 0] = 1.0 / 256 * (-693 * s + 15015 * s^3) - 90090 * s^5) + 218790 * s^7) - 230945 * s^9) + 88179 * s^11));
           LegArrEx[11, 1] = (33.0 / 256) * c * (-21 + 1365 * s^2) - 13650 * s^4) + 46410 * s^6) - 62985 * s^8) + 29393 * s^10));
           LegArrEx[11, 2] = (2145.0 / 128) * c * c * (21 * s - 420 * s^3) + 2142 * s^5) - 3876 * s^7) + 2261 * s^9));
           LegArrEx[11, 3] = (45045.0 / 128) * c^3) * (1 - 60 * s^2) + 510 * s^4) - 1292 * s^6) + 969 * s^8));
           LegArrEx[11, 4] = 135135.0 / 16 * Math.Pow(c * c, 2) * (-5 * s + 85 * s^3) - 323 * s^5) + 323 * s^7));
           LegArrEx[11, 5] = (135135.0 / 16) * c^5) * (-5 + 255 * s^2) - 1615 * s^4) + 2261 * s^6));
           LegArrEx[11, 6] = (2297295.0 / 8) * Math.Pow(c * c, 3) * (15 * s - 190 * s^3) + 399 * s^5));
           LegArrEx[11, 7] = (34459425.0 / 8) * c^7) * (1 - 38 * s^2) + 133 * s^4));
           LegArrEx[11, 8] = 654729075.0 / 2 * Math.Pow(c * c, 4) * (-s + 7 * s^3));
           LegArrEx[11, 9] = (654729075.0 / 2) * c^9) * (-1 + 21 * s^2));
           LegArrEx[11, 10] = 13749310575.0 * s * Math.Pow(c * c, 5);
           LegArrEx[11, 11] = 13749310575.0 * c^11);

           LegArrEx[12, 0] = (231.0 - 18018 * s^2) + 225225 * s^4) - 1021020 * s^6) + 2078505 * s^8) - 1939938 * s^10) + 676039 * s^12)) / 1024;
           LegArrEx[12, 1] = (39.0 / 256) * c * (-231 * s + 5775 * s^3) - 39270 * s^5) + 106590 * s^7) - 124355 * s^9) + 52003 * s^11));
           LegArrEx[12, 2] = (3003.0 / 256) * c * c * (-3 + 225 * s^2) - 2550 * s^4) + 9690 * s^6) - 14535 * s^8) + 7429 * s^10));
           LegArrEx[12, 3] = (15015.0 / 128) * c^3) * (45 * s - 1020 * s^3) + 5814 * s^5) - 11628 * s^7) + 7429 * s^9));
           LegArrEx[12, 4] = 135135.0 / 128 * Math.Pow(c * c, 2) * (5 - 340 * s^2) + 3230 * s^4) - 9044 * s^6) + 7429 * s^8));
           LegArrEx[12, 5] = (2297295.0 / 16) * c^5) * (-5 * s + 95 * s^3) - 399 * s^5) + 437 * s^7));
           LegArrEx[12, 6] = (2297295.0 / 16) * Math.Pow(c * c, 3) * (-5 + 285 * s^2) - 1995 * s^4) + 3059 * s^6));
           LegArrEx[12, 7] = (130945815.0 / 8) * c^7) * (5 * s - 70 * s^3) + 161 * s^5));
           LegArrEx[12, 8] = 654729075.0 / 8 * Math.Pow(c * c, 4) * (1 - 42 * s^2) + 161 * s^4));
           LegArrEx[12, 9] = (4583103525.0 / 2) * c^9) * (-3 * s + 23 * s^3));
           LegArrEx[12, 10] = (13749310575.0 / 2) * Math.Pow(c * c, 5) * (-1 + 23 * s^2));
           LegArrEx[12, 11] = 316234143225.0 * s * c^11);
           LegArrEx[12, 12] = 316234143225.0 * Math.Pow(c * c, 6);

           LegArrEx[13, 0] = (3003.0 * s - 90090 * s^3) + 765765 * s^5) - 2771340 * s^7) + 4849845 * s^9) - 4056234 * s^11) + 1300075 * s^13)) / 1024;
           LegArrEx[13, 1] = ((91.0 * c * (33 - 2970 * s^2) + 42075 * s^4) - 213180 * s^6) + 479655 * s^8) - 490314 * s^10) + 185725 * s^12)) / 1024));
           LegArrEx[13, 2] = (1365.0 / 256) * c * c * (-99 * s + 2805 * s^3) - 21318 * s^5) + 63954 * s^7) - 81719 * s^9) + 37145 * s^11));
           LegArrEx[13, 3] = (15015.0 / 256) * c^3) * (-9 + 765 * s^2) - 9690 * s^4) + 40698 * s^6) - 66861 * s^8) + 37145 * s^10));
           LegArrEx[13, 4] = 255255.0 / 128 * Math.Pow(c * c, 2) * (45 * s - 1140 * s^3) + 7182 * s^5) - 15732 * s^7) + 10925 * s^9));
           LegArrEx[13, 5] = (2297295.0 / 128) * c^5) * (5 - 380 * s^2) + 3990 * s^4) - 12236 * s^6) + 10925 * s^8));
           LegArrEx[13, 6] = (43648605.0 / 16) * Math.Pow(c * c, 3) * (-5 * s + 105 * s^3) - 483 * s^5) + 575 * s^7));
           LegArrEx[13, 7] = (218243025.0 / 16) * c^7) * (-1 + 63 * s^2) - 483 * s^4) + 805 * s^6));
           LegArrEx[13, 8] = 4583103525.0 / 8 * Math.Pow(c * c, 4) * (3 * s - 46 * s^3) + 115 * s^5));
           LegArrEx[13, 9] = (4583103525.0 / 8) * c^9) * (3 - 138 * s^2) + 575 * s^4));
           LegArrEx[13, 10] = (105411381075.0 / 2) * Math.Pow(c * c, 5) * (-3 * s + 25 * s^3));
           LegArrEx[13, 11] = (316234143225.0 / 2) * c^11) * (-1 + 25 * s^2));
           LegArrEx[13, 12] = 7905853580625.0 * s * Math.Pow(c * c, 6);
           LegArrEx[13, 13] = 7905853580625.0 * c^13);

           LegArrEx[14, 0] = (-429.0 + 45045 * s^2) - 765765 * s^4) + 4849845 * s^6) - 14549535 * s^8) + 22309287 * s^10) - 16900975 * s^12) + 5014575 * s^14)) / 2048;
           LegArrEx[14, 1] = ((105.0 * c * (429 * s - 14586 * s^3) + 138567 * s^5) - 554268 * s^7) + 1062347 * s^9) - 965770 * s^11) + 334305 * s^13)) / 1024));
           LegArrEx[14, 2] = ((1365.0 * c * c * (33 - 3366 * s^2) + 53295 * s^4) - 298452 * s^6) + 735471 * s^8) - 817190 * s^10) + 334305 * s^12)) / 1024));
           LegArrEx[14, 3] = (23205.0 / 256) * c^3) * (-99 * s + 3135 * s^3) - 26334 * s^5) + 86526 * s^7) - 120175 * s^9) + 58995 * s^11));
           LegArrEx[14, 4] = 2297295.0 / 256 * Math.Pow(c * c, 2) * (-1 + 95 * s^2) - 1330 * s^4) + 6118 * s^6) - 10925 * s^8) + 6555 * s^10));
           LegArrEx[14, 5] = (43648605.0 / 128) * c^5) * (5 * s - 140 * s^3) + 966 * s^5) - 2300 * s^7) + 1725 * s^9));
           LegArrEx[14, 6] = (218243025.0 / 128) * Math.Pow(c * c, 3) * (1 - 84 * s^2) + 966 * s^4) - 3220 * s^6) + 3105 * s^8));
           LegArrEx[14, 7] = (654729075.0 / 16) * c^7) * (-7 * s + 161 * s^3) - 805 * s^5) + 1035 * s^7));
           LegArrEx[14, 8] = 4583103525.0 / 16 * Math.Pow(c * c, 4) * (-1 + 69 * s^2) - 575 * s^4) + 1035 * s^6));
           LegArrEx[14, 9] = (105411381075.0 / 8) * c^9) * (3 * s - 50 * s^3) + 135 * s^5));
           LegArrEx[14, 10] = (316234143225.0 / 8) * Math.Pow(c * c, 5) * (1 - 50 * s^2) + 225 * s^4));
           LegArrEx[14, 11] = (7905853580625.0 / 2) * c^11) * (-s + 9 * s^3));
           LegArrEx[14, 12] = 7905853580625.0 / 2 * Math.Pow(c * c, 6) * (-1 + 27 * s^2));
           LegArrEx[14, 13] = 213458046676875.0 * s * c^13);
           LegArrEx[14, 14] = 213458046676875.0 * Math.Pow(c * c, 7);

           LegArrEx[15, 0] = (-6435.0 * s + 255255 * s^3) - 2909907 * s^5) + 14549535 * s^7) - 37182145 * s^9) + 50702925 * s^11) - 35102025 * s^13) + 9694845 * s^15)) / 2048;
           LegArrEx[15, 1] = ((15.0 * c * (-429 + 51051 * s^2) - 969969 * s^4) + 6789783 * s^6) - 22309287 * s^8) + 37182145 * s^10) - 30421755 * s^12) + 9694845 * s^14)) / 2048));
           LegArrEx[15, 2] = ((1785.0 * c * c * (429 * s - 16302 * s^3) + 171171 * s^5) - 749892 * s^7) + 1562275 * s^9) - 1533870 * s^11) + 570285 * s^13)) / 1024));
           LegArrEx[15, 3] = ((69615.0 * c^3) * (11 - 1254 * s^2) + 21945 * s^4) - 134596 * s^6) + 360525 * s^8) - 432630 * s^10) + 190095 * s^12)) / 1024));
           LegArrEx[15, 4] = 3968055.0 / 256 * Math.Pow(c * c, 2) * (-11 * s + 385 * s^3) - 3542 * s^5) + 12650 * s^7) - 18975 * s^9) + 10005 * s^11));
           LegArrEx[15, 5] = (43648605.0 / 256) * c^5) * (-1 + 105 * s^2) - 1610 * s^4) + 8050 * s^6) - 15525 * s^8) + 10005 * s^10));
           LegArrEx[15, 6] = (218243025.0 / 128) * Math.Pow(c * c, 3) * (21 * s - 644 * s^3) + 4830 * s^5) - 12420 * s^7) + 10005 * s^9));
           LegArrEx[15, 7] = (654729075.0 / 128) * c^7) * (7 - 644 * s^2) + 8050 * s^4) - 28980 * s^6) + 30015 * s^8));
           LegArrEx[15, 8] = 15058768725.0 / 16 * Math.Pow(c * c, 4) * (-7 * s + 175 * s^3) - 945 * s^5) + 1305 * s^7));
           LegArrEx[15, 9] = (105411381075.0 / 16) * c^9) * (-1 + 75 * s^2) - 675 * s^4) + 1305 * s^6));
           LegArrEx[15, 10] = (1581170716125.0 / 8) * Math.Pow(c * c, 5) * (5 * s - 90 * s^3) + 261 * s^5));
           LegArrEx[15, 11] = (7905853580625.0 / 8) * c^11) * (1 - 54 * s^2) + 261 * s^4));
           LegArrEx[15, 12] = 71152682225625.0 / 2 * Math.Pow(c * c, 6) * (-3 * s + 29 * s^3));
           LegArrEx[15, 13] = (213458046676875.0 / 2) * c^13) * (-1 + 29 * s^2));
           LegArrEx[15, 14] = 6190283353629375.0 * s * Math.Pow(c * c, 7);
           LegArrEx[15, 15] = 6190283353629375.0 * c^15);

           LegArrEx[16, 0] = (6435.0 - 875160 * s^2) + 19399380 * s^4) - 162954792 * s^6) + 669278610 * s^8) - 1487285800 * s^10) + 1825305300 * s^12) - 1163381400 * s^14) + 300540195 * s^16)) / 32768;
           LegArrEx[16, 1] = ((17.0 * c * (-6435 * s + 285285 * s^3) - 3594591 * s^5) + 19684665 * s^7) - 54679625 * s^9) + 80528175 * s^11) - 59879925 * s^13) + 17678835 * s^15)) / 2048));
           LegArrEx[16, 2] = ((765.0 * c * c * (-143 + 19019 * s^2) - 399399 * s^4) + 3062059 * s^6) - 10935925 * s^8) + 19684665 * s^10) - 17298645 * s^12) + 5892945 * s^14)) / 2048));
           LegArrEx[16, 3] = ((101745.0 * c^3) * (143 * s - 6006 * s^3) + 69069 * s^5) - 328900 * s^7) + 740025 * s^9) - 780390 * s^11) + 310155 * s^13)) / 1024));
           LegArrEx[16, 4] = (1322685.0 * Math.Pow(c * c, 2) * (11 - 1386 * s^2) + 26565 * s^4) - 177100 * s^6) + 512325 * s^8) - 660330 * s^10) + 310155 * s^12)) / 1024);
           LegArrEx[16, 5] = (3968055.0 / 256) * c^5) * (-231 * s + 8855 * s^3) - 88550 * s^5) + 341550 * s^7) - 550275 * s^9) + 310155 * s^11));
           LegArrEx[16, 6] = (43648605.0 / 256) * Math.Pow(c * c, 3) * (-21 + 2415 * s^2) - 40250 * s^4) + 217350 * s^6) - 450225 * s^8) + 310155 * s^10));
           LegArrEx[16, 7] = (5019589575.0 / 128) * c^7) * (21 * s - 700 * s^3) + 5670 * s^5) - 15660 * s^7) + 13485 * s^9));
           LegArrEx[16, 8] = 15058768725.0 / 128 * Math.Pow(c * c, 4) * (7 - 700 * s^2) + 9450 * s^4) - 36540 * s^6) + 40455 * s^8));
           LegArrEx[16, 9] = (75293843625.0 / 16) * c^9) * (-35 * s + 945 * s^3) - 5481 * s^5) + 8091 * s^7));
           LegArrEx[16, 10] = (527056905375.0 / 16) * Math.Pow(c * c, 5) * (-5 + 405 * s^2) - 3915 * s^4) + 8091 * s^6));
           LegArrEx[16, 11] = (14230536445125.0 / 8) * c^11) * (15 * s - 290 * s^3) + 899 * s^5));
           LegArrEx[16, 12] = 71152682225625.0 / 8 * Math.Pow(c * c, 6) * (3 - 174 * s^2) + 899 * s^4));
           LegArrEx[16, 13] = (2063427784543125.0 / 2) * c^13) * (-3 * s + 31 * s^3));
           LegArrEx[16, 14] = (6190283353629375.0 / 2) * Math.Pow(c * c, 7) * (-1 + 31 * s^2));
           LegArrEx[16, 15] = 191898783962510625.0 * s * c^15);
           LegArrEx[16, 16] = 191898783962510625.0 * Math.Pow(c * c, 8);

           LegArrEx[17, 0] = (109395.0 * s - 5542680 * s^3) + 81477396 * s^5) - 535422888 * s^7) + 1859107250 * s^9) - 3650610600 * s^11) + 4071834900 * s^13) - 2404321560 * s^15) + 583401555 * s^17)) / 32768;
           LegArrEx[17, 1] = ((153.0 * c * (715 - 108680 * s^2) + 2662660 * s^4) - 24496472 * s^6) + 109359250 * s^8) - 262462200 * s^10) + 345972900 * s^12) - 235717800 * s^14) + 64822395 * s^16)) / 32768));
           LegArrEx[17, 2] = ((2907.0 * c * c * (-715 * s + 35035 * s^3) - 483483 * s^5) + 2877875 * s^7) - 8633625 * s^9) + 13656825 * s^11) - 10855425 * s^13) + 3411705 * s^15)) / 2048));
           LegArrEx[17, 3] = ((14535.0 * c^3) * (-143 + 21021 * s^2) - 483483 * s^4) + 4029025 * s^6) - 15540525 * s^8) + 30045015 * s^10) - 28224105 * s^12) + 10235115 * s^14)) / 2048));
           LegArrEx[17, 4] = (305235.0 * Math.Pow(c * c, 2) * (1001 * s - 46046 * s^3) + 575575 * s^5) - 2960100 * s^7) + 7153575 * s^9) - 8064030 * s^11) + 3411705 * s^13)) / 1024);
           LegArrEx[17, 5] = ((43648605.0 * c^5) * (7 - 966 * s^2) + 20125 * s^4) - 144900 * s^6) + 450225 * s^8) - 620310 * s^10) + 310155 * s^12)) / 1024));
           LegArrEx[17, 6] = (1003917915.0 / 256) * Math.Pow(c * c, 3) * (-21 * s + 875 * s^3) - 9450 * s^5) + 39150 * s^7) - 67425 * s^9) + 40455 * s^11));
           LegArrEx[17, 7] = (3011753745.0 / 256) * c^7) * (-7 + 875 * s^2) - 15750 * s^4) + 91350 * s^6) - 202275 * s^8) + 148335 * s^10));
           LegArrEx[17, 8] = 75293843625.0 / 128 * Math.Pow(c * c, 4) * (35 * s - 1260 * s^3) + 10962 * s^5) - 32364 * s^7) + 29667 * s^9));
           LegArrEx[17, 9] = (75293843625.0 / 128) * c^9) * (35 - 3780 * s^2) + 54810 * s^4) - 226548 * s^6) + 267003 * s^8));
           LegArrEx[17, 10] = (2032933777875.0 / 16) * Math.Pow(c * c, 5) * (-35 * s + 1015 * s^3) - 6293 * s^5) + 9889 * s^7));
           LegArrEx[17, 11] = (14230536445125.0 / 16) * c^11) * (-5 + 435 * s^2) - 4495 * s^4) + 9889 * s^6));
           LegArrEx[17, 12] = 412685556908625.0 / 8 * Math.Pow(c * c, 6) * (15 * s - 310 * s^3) + 1023 * s^5));
           LegArrEx[17, 13] = (6190283353629375.0 / 8) * c^13) * (1 - 62 * s^2) + 341 * s^4));
           LegArrEx[17, 14] = (191898783962510625.0 / 2) * Math.Pow(c * c, 7) * (-s + 11 * s^3));
           LegArrEx[17, 15] = (191898783962510625.0 / 2) * c^15) * (-1 + 33 * s^2));
           LegArrEx[17, 16] = 6332659870762850625.0 * s * Math.Pow(c * c, 8);
           LegArrEx[17, 17] = 6332659870762850625.0 * c^17);

           LegArrEx[18, 0] = (-12155.0 + 2078505 * s^2) - 58198140 * s^4) + 624660036 * s^6) - 3346393050 * s^8) + 10039179150 * s^10) - 17644617900 * s^12) + 18032411700 * s^14) - 9917826435 * s^16) + 2268783825 * s^18)) / 65536;
           LegArrEx[18, 1] = ((171.0 * c * (12155 * s - 680680 * s^3) + 10958948 * s^5) - 78278200 * s^7) + 293543250 * s^9) - 619109400 * s^11) + 738168900 * s^13) - 463991880 * s^15) + 119409675 * s^17)) / 32768));
           LegArrEx[18, 2] = ((14535.0 * c * c * (143 - 24024 * s^2) + 644644 * s^4) - 6446440 * s^6) + 31081050 * s^8) - 80120040 * s^10) + 112896420 * s^12) - 81880920 * s^14) + 23881935 * s^16)) / 32768));
           LegArrEx[18, 3] = ((101745.0 * c^3) * (-429 * s + 23023 * s^3) - 345345 * s^5) + 2220075 * s^7) - 7153575 * s^9) + 12096045 * s^11) - 10235115 * s^13) + 3411705 * s^15)) / 2048));
           LegArrEx[18, 4] = (3357585.0 * Math.Pow(c * c, 2) * (-13 + 2093 * s^2) - 52325 * s^4) + 470925 * s^6) - 1950975 * s^8) + 4032015 * s^10) - 4032015 * s^12) + 1550775 * s^14)) / 2048);
           LegArrEx[18, 5] = ((77224455.0 * c^5) * (91 * s - 4550 * s^3) + 61425 * s^5) - 339300 * s^7) + 876525 * s^9) - 1051830 * s^11) + 471975 * s^13)) / 1024));
           LegArrEx[18, 6] = ((1003917915.0 * Math.Pow(c * c, 3) * (7 - 1050 * s^2) + 23625 * s^4) - 182700 * s^6) + 606825 * s^8) - 890010 * s^10) + 471975 * s^12)) / 1024));
           LegArrEx[18, 7] = (75293843625.0 / 256) * c^7) * (-7 * s + 315 * s^3) - 3654 * s^5) + 16182 * s^7) - 29667 * s^9) + 18879 * s^11));
           LegArrEx[18, 8] = 75293843625.0 / 256 * Math.Pow(c * c, 4) * (-7 + 945 * s^2) - 18270 * s^4) + 113274 * s^6) - 267003 * s^8) + 207669 * s^10));
           LegArrEx[18, 9] = (225881530875.0 / 128) * c^9) * (315 * s - 12180 * s^3) + 113274 * s^5) - 356004 * s^7) + 346115 * s^9));
           LegArrEx[18, 10] = (14230536445125.0 / 128) * Math.Pow(c * c, 5) * (5 - 580 * s^2) + 8990 * s^4) - 39556 * s^6) + 49445 * s^8));
           LegArrEx[18, 11] = (412685556908625.0 / 16) * c^11) * (-5 * s + 155 * s^3) - 1023 * s^5) + 1705 * s^7));
           LegArrEx[18, 12] = 2063427784543125.0 / 16 * Math.Pow(c * c, 6) * (-1 + 93 * s^2) - 1023 * s^4) + 2387 * s^6));
           LegArrEx[18, 13] = (191898783962510625.0 / 8) * c^13) * (s - 22 * s^3) + 77 * s^5));
           LegArrEx[18, 14] = (191898783962510625.0 / 8) * Math.Pow(c * c, 7) * (1 - 66 * s^2) + 385 * s^4));
           LegArrEx[18, 15] = (2110886623587616875.0 / 2) * c^15) * (-3 * s + 35 * s^3));
           LegArrEx[18, 16] = 6332659870762850625.0 / 2 * Math.Pow(c * c, 8) * (-1 + 35 * s^2));
           LegArrEx[18, 17] = 221643095476699771875.0 * s * c^17);
           LegArrEx[18, 18] = 221643095476699771875.0 * Math.Pow(c * c, 9);

           LegArrEx[19, 0] = (-230945.0 * s + 14549535 * s^3) - 267711444 * s^5) + 2230928700 * s^7) - 10039179150 * s^9) + 26466926850 * s^11) - 42075627300 * s^13) + 39671305740 * s^15) - 20419054425 * s^17) + 4418157975 * s^19)) / 65536;
           LegArrEx[19, 1] = ((95.0 * c * (-2431 + 459459 * s^2) - 14090076 * s^4) + 164384220 * s^6) - 951080130 * s^8) + 3064591530 * s^10) - 5757717420 * s^12) + 6263890380 * s^14) - 3653936055 * s^16) + 883631595 * s^18)) / 65536));
           LegArrEx[19, 2] = ((5985.0 * c * c * (7293 * s - 447304 * s^3) + 7827820 * s^5) - 60386040 * s^7) + 243221550 * s^9) - 548354040 * s^11) + 695987820 * s^13) - 463991880 * s^15) + 126233085 * s^17)) / 32768));
           LegArrEx[19, 3] = ((1119195.0 * c^3) * (39 - 7176 * s^2) + 209300 * s^4) - 2260440 * s^6) + 11705850 * s^8) - 32256120 * s^10) + 48384180 * s^12) - 37218600 * s^14) + 11475735 * s^16)) / 32768));
           LegArrEx[19, 4] = (25741485.0 * Math.Pow(c * c, 2) * (-39 * s + 2275 * s^3) - 36855 * s^5) + 254475 * s^7) - 876525 * s^9) + 1577745 * s^11) - 1415925 * s^13) + 498945 * s^15)) / 2048);
           LegArrEx[19, 5] = ((77224455.0 * c^5) * (-13 + 2275 * s^2) - 61425 * s^4) + 593775 * s^6) - 2629575 * s^8) + 5785065 * s^10) - 6135675 * s^12) + 2494725 * s^14)) / 2048));
           LegArrEx[19, 6] = ((1930611375.0 * Math.Pow(c * c, 3) * (91 * s - 4914 * s^3) + 71253 * s^5) - 420732 * s^7) + 1157013 * s^9) - 1472562 * s^11) + 698523 * s^13)) / 1024));
           LegArrEx[19, 7] = ((25097947875.0 * c^7) * (7 - 1134 * s^2) + 27405 * s^4) - 226548 * s^6) + 801009 * s^8) - 1246014 * s^10) + 698523 * s^12)) / 1024));
           LegArrEx[19, 8] = 225881530875.0 / 256 * Math.Pow(c * c, 4) * (-63 * s + 3045 * s^3) - 37758 * s^5) + 178002 * s^7) - 346115 * s^9) + 232841 * s^11));
           LegArrEx[19, 9] = (1581170716125.0 / 256) * c^9) * (-9 + 1305 * s^2) - 26970 * s^4) + 178002 * s^6) - 445005 * s^8) + 365893 * s^10));
           LegArrEx[19, 10] = (45853950767625.0 / 128) * Math.Pow(c * c, 5) * (45 * s - 1860 * s^3) + 18414 * s^5) - 61380 * s^7) + 63085 * s^9));
           LegArrEx[19, 11] = (2063427784543125.0 / 128) * c^11) * (1 - 124 * s^2) + 2046 * s^4) - 9548 * s^6) + 12617 * s^8));
           LegArrEx[19, 12] = 63966261320836875.0 / 16 * Math.Pow(c * c, 6) * (-s + 33 * s^3) - 231 * s^5) + 407 * s^7));
           LegArrEx[19, 13] = (63966261320836875.0 / 16) * c^13) * (-1 + 99 * s^2) - 1155 * s^4) + 2849 * s^6));
           LegArrEx[19, 14] = (2110886623587616875.0 / 8) * Math.Pow(c * c, 7) * (3 * s - 70 * s^3) + 259 * s^5));
           LegArrEx[19, 15] = (2110886623587616875.0 / 8) * c^15) * (3 - 210 * s^2) + 1295 * s^4));
           LegArrEx[19, 16] = 73881031825566590625.0 / 2 * Math.Pow(c * c, 8) * (-3 * s + 37 * s^3));
           LegArrEx[19, 17] = (221643095476699771875.0 / 2) * c^17) * (-1 + 37 * s^2));
           LegArrEx[19, 18] = 8200794532637891559375.0 * s * Math.Pow(c * c, 9);
           LegArrEx[19, 19] = 8200794532637891559375.0 * c^19);

           LegArrEx[20, 0] = (1.0 / 262144) * (46189 - 9699690 * s^2) + 334639305 * s^4) - 4461857400 * s^6) + 30117537450 * s^8) - 116454478140 * s^10) + 273491577450 * s^12) - 396713057400 * s^14) + 347123925225 * s^16) - 167890003050 * s^18) + 34461632205 * s^20));
           LegArrEx[20, 1] = ((105.0 * c * (-46189 * s + 3187041 * s^3) - 63740820 * s^5) + 573667380 * s^7) - 2772725670 * s^9) + 7814045070 * s^11) - 13223768580 * s^13) + 13223768580 * s^15) - 7195285845 * s^17) + 1641030105 * s^19)) / 65536));
           LegArrEx[20, 2] = ((21945.0 * c * c * (-221 + 45747 * s^2) - 1524900 * s^4) + 19213740 * s^6) - 119399670 * s^8) + 411265530 * s^10) - 822531060 * s^12) + 949074300 * s^14) - 585262485 * s^16) + 149184555 * s^18)) / 65536));
           LegArrEx[20, 3] = ((1514205.0 * c^3) * (663 * s - 44200 * s^3) + 835380 * s^5) - 6921720 * s^7) + 29801850 * s^9) - 71524440 * s^11) + 96282900 * s^13) - 67856520 * s^15) + 19458855 * s^17)) / 32768));
           LegArrEx[20, 4] = (77224455.0 * Math.Pow(c * c, 2) * (13 - 2600 * s^2) + 81900 * s^4) - 950040 * s^6) + 5259150 * s^8) - 15426840 * s^10) + 24542700 * s^12) - 19957800 * s^14) + 6486285 * s^16)) / 32768);
           LegArrEx[20, 5] = ((386122275.0 * c^5) * (-65 * s + 4095 * s^3) - 71253 * s^5) + 525915 * s^7) - 1928355 * s^9) + 3681405 * s^11) - 3492615 * s^13) + 1297257 * s^15)) / 2048));
           LegArrEx[20, 6] = ((25097947875.0 * Math.Pow(c * c, 3) * (-1 + 189 * s^2) - 5481 * s^4) + 56637 * s^6) - 267003 * s^8) + 623007 * s^10) - 698523 * s^12) + 299367 * s^14)) / 2048));
           LegArrEx[20, 7] = ((225881530875.0 * c^7) * (21 * s - 1218 * s^3) + 18879 * s^5) - 118668 * s^7) + 346115 * s^9) - 465682 * s^11) + 232841 * s^13)) / 1024));
           LegArrEx[20, 8] = (1581170716125.0 * Math.Pow(c * c, 4) * (3 - 522 * s^2) + 13485 * s^4) - 118668 * s^6) + 445005 * s^8) - 731786 * s^10) + 432419 * s^12)) / 1024);
           LegArrEx[20, 9] = (45853950767625.0 / 256) * c^9) * (-9 * s + 465 * s^3) - 6138 * s^5) + 30690 * s^7) - 63085 * s^9) + 44733 * s^11));
           LegArrEx[20, 10] = (137561852302875.0 / 256) * Math.Pow(c * c, 5) * (-3 + 465 * s^2) - 10230 * s^4) + 71610 * s^6) - 189255 * s^8) + 164021 * s^10));
           LegArrEx[20, 11] = (21322087106945625.0 / 128) * c^11) * (3 * s - 132 * s^3) + 1386 * s^5) - 4884 * s^7) + 5291 * s^9));
           LegArrEx[20, 12] = 63966261320836875.0 / 128 * Math.Pow(c * c, 6) * (1 - 132 * s^2) + 2310 * s^4) - 11396 * s^6) + 15873 * s^8));
           LegArrEx[20, 13] = (2110886623587616875.0 / 16) * c^13) * (-s + 35 * s^3) - 259 * s^5) + 481 * s^7));
           LegArrEx[20, 14] = (2110886623587616875.0 / 16) * Math.Pow(c * c, 7) * (-1 + 105 * s^2) - 1295 * s^4) + 3367 * s^6));
           LegArrEx[20, 15] = (14776206365113318125.0 / 8) * c^15) * (15 * s - 370 * s^3) + 1443 * s^5));
           LegArrEx[20, 16] = 221643095476699771875.0 / 8 * Math.Pow(c * c, 8) * (1 - 74 * s^2) + 481 * s^4));
           LegArrEx[20, 17] = (8200794532637891559375.0 / 2) * c^17) * (-s + 13 * s^3));
           LegArrEx[20, 18] = (8200794532637891559375.0 / 2) * Math.Pow(c * c, 9) * (-1 + 39 * s^2));
           LegArrEx[20, 19] = 319830986772877770815625.0 * s * c^19);
           LegArrEx[20, 20] = 319830986772877770815625.0 * Math.Pow(c * c, 10);

           LegArrEx[21, 0] = (1.0 / 262144) * (969969 * s - 74364290 * s^3) + 1673196525 * s^5) - 17210021400 * s^7) + 97045398450 * s^9) - 328189892940 * s^11) + 694247850450 * s^13) - 925663800600 * s^15) + 755505013725 * s^17) - 344616322050 * s^19) + 67282234305 * s^21));
           LegArrEx[21, 1] = (1.0 / 262144) * 231 * c * (4199 - 965770 * s^2) + 36216375 * s^4) - 521515800 * s^6) + 3780989550 * s^8) - 15628090140 * s^10) + 39070225350 * s^12) - 60108039000 * s^14) + 55599936075 * s^16) - 28345065450 * s^18) + 6116566755 * s^20));
           LegArrEx[21, 2] = ((26565.0 * c * c * (-4199 * s + 314925 * s^3) - 6802380 * s^5) + 65756340 * s^7) - 339741090 * s^9) + 1019223270 * s^11) - 1829375100 * s^13) + 1933910820 * s^15) - 1109154735 * s^17) + 265937685 * s^19)) / 65536));
           LegArrEx[21, 3] = ((504735.0 * c^3) * (-221 + 49725 * s^2) - 1790100 * s^4) + 24226020 * s^6) - 160929990 * s^8) + 590076630 * s^10) - 1251677700 * s^12) + 1526771700 * s^14) - 992401605 * s^16) + 265937685 * s^18)) / 65536));
           LegArrEx[21, 4] = (22713075.0 * Math.Pow(c * c, 2) * (1105 * s - 79560 * s^3) + 1615068 * s^5) - 14304888 * s^7) + 65564070 * s^9) - 166890360 * s^11) + 237497820 * s^13) - 176426952 * s^15) + 53187537 * s^17)) / 32768);
           LegArrEx[21, 5] = ((5019589575.0 * c^5) * (5 - 1080 * s^2) + 36540 * s^4) - 453096 * s^6) + 2670030 * s^8) - 8306760 * s^10) + 13970460 * s^12) - 11974680 * s^14) + 4091349 * s^16)) / 32768));
           LegArrEx[21, 6] = ((15058768725.0 * Math.Pow(c * c, 3) * (-45 * s + 3045 * s^3) - 56637 * s^5) + 445005 * s^7) - 1730575 * s^9) + 3492615 * s^11) - 3492615 * s^13) + 1363783 * s^15)) / 2048));
           LegArrEx[21, 7] = ((225881530875.0 * c^7) * (-3 + 609 * s^2) - 18879 * s^4) + 207669 * s^6) - 1038345 * s^8) + 2561251 * s^10) - 3026933 * s^12) + 1363783 * s^14)) / 2048));
           LegArrEx[21, 8] = (45853950767625.0 * Math.Pow(c * c, 4) * (3 * s - 186 * s^3) + 3069 * s^5) - 20460 * s^7) + 63085 * s^9) - 89466 * s^11) + 47027 * s^13)) / 1024);
           LegArrEx[21, 9] = ((45853950767625.0 * c^9) * (3 - 558 * s^2) + 15345 * s^4) - 143220 * s^6) + 567765 * s^8) - 984126 * s^10) + 611351 * s^12)) / 1024));
           LegArrEx[21, 10] = (4264417421389125.0 / 256) * Math.Pow(c * c, 5) * (-3 * s + 165 * s^3) - 2310 * s^5) + 12210 * s^7) - 26455 * s^9) + 19721 * s^11));
           LegArrEx[21, 11] = (4264417421389125.0 / 256) * c^11) * (-3 + 495 * s^2) - 11550 * s^4) + 85470 * s^6) - 238095 * s^8) + 216931 * s^10));
           LegArrEx[21, 12] = 234542958176401875.0 / 128 * Math.Pow(c * c, 6) * (9 * s - 420 * s^3) + 4662 * s^5) - 17316 * s^7) + 19721 * s^9));
           LegArrEx[21, 13] = (2110886623587616875.0 / 128) * c^13) * (1 - 140 * s^2) + 2590 * s^4) - 13468 * s^6) + 19721 * s^8));
           LegArrEx[21, 14] = (2110886623587616875.0 / 16) * Math.Pow(c * c, 7) * (-35 * s + 1295 * s^3) - 10101 * s^5) + 19721 * s^7));
           LegArrEx[21, 15] = (14776206365113318125.0 / 16) * c^15) * (-5 + 555 * s^2) - 7215 * s^4) + 19721 * s^6));
           LegArrEx[21, 16] = 1640158906527578311875.0 / 8 * Math.Pow(c * c, 8) * (5 * s - 130 * s^3) + 533 * s^5));
           LegArrEx[21, 17] = (8200794532637891559375.0 / 8) * c^17) * (1 - 78 * s^2) + 533 * s^4));
           LegArrEx[21, 18] = (106610328924292590271875.0 / 2) * Math.Pow(c * c, 9) * (-3 * s + 41 * s^3));
           LegArrEx[21, 19] = (319830986772877770815625.0 / 2) * c^19) * (-1 + 41 * s^2));
           LegArrEx[21, 20] = 13113070457687988603440625.0 * s * Math.Pow(c * c, 10);
           LegArrEx[21, 21] = 13113070457687988603440625.0 * c^21);

       end % LegPolyEx





       % ----------------------------------------------------------------------------
       % fukushima method (JG 2018)
       %   for very large spherical harmonic expansions and calcs of unitalized associated
       %   Legendre polynomials
       %
       %   Plm are converted to X-numbers
       %   Clm, Slm treated as F-numbers
       % -----------------------------------------------------------------------------

       % initialize legendre function values
       function pinit
           (
           Int32 n,
           Int32 m,
           ref p
           )

           p = new double[360];

           if (n == 0)
               p(1) = 1.0;
           else if (n == 1)
                   p(1) = 1.7320508075688773;
           else if (n == 2)

                   if (m == 0)

                       p(1) = 0.5590169943749474;
                       p(2) = 1.6770509831248423;
                   end
           else if (m == 1)

                   p(1) = 0.0;
                   p(2) = 1.9364916731037084;
           end
           else if (m == 2)

                   p(1) = 0.9682458365518542;
                   p(2) = -0.9682458365518542;
           end
           else if (n == 3)

                   if (m == 0)

                       p(1) = 0.9921567416492215;
                       p(2) = 1.6535945694153691;
                   end
           else if (m == 1)

                   p(1) = 0.4050462936504913;
                   p(2) = 2.0252314682524563;
           end
           else if (m == 2)

                   p(1) = 1.2808688457449498;
                   p(2) = -1.2808688457449498;
           end
           else if (m == 3)

                   p(1) = 1.5687375497513917;
                   p(2) = -0.5229125165837972;
           end
           end
           else if (n == 4)

                   if (m == 0)

                       p(1) = 0.421875;
                       p(2) = 0.9375;
                       p(3) = 1.640625;
                   end
           else if (m == 1)

                   p(1) = 0.0;
                   p(2) = 0.5929270612815711;
                   p(3) = 2.0752447144854989;
           end
           else if (m == 2)

                   p(1) = 0.6288941186718159;
                   p(2) = 0.8385254915624211;
                   p(3) = -1.4674196102342370;
           end
           else if (m == 3)

                   p(1) = 0.0;
                   p(2) = 1.5687375497513917;
                   p(3) = -0.7843687748756958;
           end
           else if (m == 4)

                   p(1) = 0.8319487194983835;
                   p(2) = -1.1092649593311780;
                   p(3) = 0.2773162398327945;
           end
           end
           end
           end  % pinit


           /* ----------------------------------------------------------------------------
           *      x2f
           *
           *      convert x to f number
           *
           ------------------------------------------------------------------------------*/
           public double x2f
           (
           double x,
           Int32 ix
           )

           double x2fv;
           Int32 IND;
           double BIG, BIGI;

           IND = 960;
           BIG = Math.Pow(2.0, IND);
           BIGI = Math.Pow(2.0, -IND);

           if (ix == 0)
               x2fv = x;
           else if (ix == -1)
                   x2fv = x * BIGI;
           else if (ix == 1)
                   x2fv = x * BIG;
           else if (ix < 0)
                   x2fv = 0.0;
           else if (x < 0)
                   x2fv = -BIG;
           else
               x2fv = BIG;

               return x2fv;
           end


           /* ----------------------------------------------------------------------------
           *                                  xunit
           *
           * uses the 'x' factor approach - value and exponent
           *
           ------------------------------------------------------------------------------*/

           function xunit
               (
               ref double x,
               ref Int32 ix
               )

               Int32 IND = 960;
               double w;

               double BIG = Math.Pow(2, IND);
               double BIGI = Math.Pow(2, -IND);
               double BIGS = Math.Pow(2.0, 480);  % IND / 2
               double BIGSI = Math.Pow(2.0, -480);  % IND / 2

               w = Math.Abs(x);
               if (w >= BIGS)

                   x = x * BIGI;
                   ix = ix + 1;
               end
           else if (w < BIGSI)

                   x = x * BIG;
                   ix = ix - 1;
           end
           end  % xunit


           /* ----------------------------------------------------------------------------
           *                                       xl2sum
           *
           * routine to compute the two-term linear sum of X-numbers
           * with F-number coefficients
           *
           ---------------------------------------------------------------------------- */
           function xlsum2
               (
               double f,
               double g,
               double x,
               double y,
               out double z,
               Int32 ix,
               Int32 iy,
               out Int32 iz)

               Int32 id;
               Int32 IND = 960;
               double BIGI = Math.Pow(2, -IND);

               id = ix - iy;
               if (id == 0)

                   z = f * x + g * y;
                   iz = ix;
               end
           else if (id == 1)

                   z = f * x + g * (y * BIGI);
                   iz = ix;
           end
           else if (id == -1)

                   z = g * y + f * (x * BIGI);
                   iz = iy;
           end
           else if (id > 1)

                   z = f * x;
                   iz = ix;
           end
           else

               z = g * y;
               iz = iy;
           end

           xunit(ref z, ref iz);
           end  % xlsum2


           /* ----------------------------------------------------------------------------
           *                                  dpeven
           *
           * find Pnnj and Pn,n-1,j when degree n is even and n >= 6. the returned values are
           * (xp[j], ip[j]) and (xp1[j], ip1[j]), double X-number vectors representing
           * Pnnj and Pn,n-1,j, respectively. required initial values for Pn-2,n-2,j as
           * (xpold[j], ipold[j]) are needed.
           *
           *  inputs          description                                  range / units
           *    n           - degree
           *
           *
           *
           *  outputs       :
           *    xp1         - value
           *    ip1         - exponent
           *
           *  locals        :
           *                -
           *
           *  coupling      :
           *    xunit
           *    xlsum2
           *
           *  references    :
           * Fukushima (2012a)
           ---------------------------------------------------------------------------- */

           function dpeven
               (
               Int32 n,
               xpold,
               out xp,
               out xp1,
               Int32[] ipold,
               out Int32[] ip,
               out Int32[] ip1
               )

               xpold = new double[360];
               xp = new double[360];
               xp1 = new double[360];
               ipold = new Int32[360];
               ip = new Int32[360];
               ip1 = new Int32[360];

               Int32 jx, jxm2, jxm1, n2, j, itemp, jm1, jp1;
               double gamma, gamma2, xtemp, alpha2;

               jx = n / 2;
               jxm2 = jx - 2;
               jxm1 = jx - 1;
               n2 = n * 2;
               gamma = sqrt(Convert.ToDouble(n2 + 1) * Convert.ToDouble(n2 - 1) / (Convert.ToDouble(n) * Convert.ToDouble(n - 1))) * 0.125;
               gamma2 = gamma * 2.0;
               xlsum2(gamma2, xpold(1), -gamma, xpold(2), out xp(1), ipold(1), ipold(2), out ip(1));
               xlsum2(-gamma2, xpold(1), gamma2, xpold(2), out xtemp, ipold(1), ipold(2), out itemp);
               xlsum2(1.0, xtemp, -gamma, xpold(3), out xp(2), itemp, ipold(3), out ip(2));
               j = 2;
               while (j <= jxm2)

                   jm1 = j - 1;
                   jp1 = j + 1;
                   xlsum2(-gamma, xpold[jm1], gamma2, xpold[j], out xtemp, ipold[jm1], ipold[j], out itemp);
                   xlsum2(1.0, xtemp, -gamma, xpold[jp1], out xp[j], itemp, ipold[jp1], out ip[j]);
                   j = j + 1;
               end
               xlsum2(-gamma, xpold[jxm2], gamma2, xpold[jxm1], out xp[jxm1], ipold[jxm2], ipold[jxm1], out ip[jxm1]);
               xp[jx] = -gamma * xpold[jxm1];
               ip[jx] = ipold[jxm1];
               xunit(ref xp[jx], ref ip[jx]);
               alpha2 = sqrt(2.0 / Convert.ToDouble(n)) * 2.0;
               xp1(1) = 0.0;
               ip1(1) = 0;
               j = 1;
               while (j <= jx)

                   xp1[j] = -Convert.ToDouble(j) * alpha2 * xp[j];
                   ip1[j] = ip[j];
                   xunit(ref xp1[j], ref ip1[j]);
                   j = j + 1;
               end
           end   % dpeven


           /* ----------------------------------------------------------------------------
           *                                 dpodd
           *
           *  routine to return Pnnj and Pn,n-1,j when n is odd and n >= 5. Same as Table 4
           *  but when n is odd and n >= 5.
           ---------------------------------------------------------------------------- */
           function dpodd
               (
               Int32 n,
               xpold,
               out xp,
               out xp1,
               Int32[] ipold,
               out Int32[] ip,
               out Int32[] ip1
               )

               xpold = new double[360];
               xp = new double[360];
               xp1 = new double[360];
               ipold = new Int32[360];
               ip = new Int32[360];
               ip1 = new Int32[360];

               Int32 jx, jxm2, jxm1, n2, j, itemp, jm1, jp1;
               double gamma, gamma2, xtemp, alpha;

               jx = (n - 1) / 2;
               jxm2 = jx - 2;
               jxm1 = jx - 1;
               n2 = n * 2;
               gamma = sqrt(Convert.ToDouble(n2 + 1) * Convert.ToDouble(n2 - 1) / (Convert.ToDouble(n) * Convert.ToDouble(n - 1))) * 0.125;
               gamma2 = gamma * 2.0;
               xlsum2(gamma * 3.0, xpold(1), -gamma, xpold(2), out xp(1), ipold(1), ipold(2), out ip(1));
               j = 1;
               while (j <= jxm2)

                   jm1 = j - 1;
                   jp1 = j + 1;
                   xlsum2(-gamma, xpold[jm1], gamma2, xpold[j], out xtemp, ipold[jm1], ipold[j], out itemp);
                   xlsum2(1.0, xtemp, -gamma, xpold[jp1], out xp[j], itemp, ipold[jp1], out ip[j]);
                   j = j + 1;
               end
               xlsum2(-gamma, xpold[jxm2], gamma2, xpold[jxm1], out xp[jxm1], ipold[jxm2], ipold[jxm1], out ip[jxm1]);
               xp[jx] = -gamma * xpold[jxm1];
               ip[jx] = ipold[jxm1];
               xunit(ref xp[jx], ref ip[jx]);
               alpha = sqrt(2.0 / Convert.ToDouble(n));
               j = 0;
               while (j <= jx)

                   xp1[j] = Convert.ToDouble(2 * j + 1) * alpha * xp[j];
                   ip1[j] = ip[j];
                   xunit(ref xp1[j], ref ip1[j]);
                   j = j + 1;
               end
           end   % dpodd


           % ----------------------------------------------------------------------------
           *                             gpeven
           *
           * routine to return Pnmj when n is even. The returned values are (xp0[j], ip0[j]),
           * a double X-number vector representing Pnmj. We assume that Pn,m+1,j and Pn,m+2,j are
           * externally provided as (xp1[j], ip1[j]) and (xp2[j], ip2[j]), respectively.
           * The routine internally calls xunit and xlsum2 provided in Tables 7 and 8 of
           * Fukushima (2012a).
           % ---------------------------------------------------------------------------- */

           function gpeven
               (
               Int32 jmax,
               Int32 n,
               Int32 m,
               xp2,
               xp1,
               out xp0,
               Int32[] ip2,
               Int32[] ip1,
               out Int32[] ip0
               )

               xp2 = new double[360];
               xp1 = new double[360];
               xp0 = new double[360];
               ip2 = new Int32[360];
               ip1 = new Int32[360];
               ip0 = new Int32[360];

               Int32 j, m1, m2, modd;
               double u, alpha2, beta;

               m1 = m + 1;
               m2 = m + 2;
               modd = m - Convert.ToInt32(m * 0.5) * 2;
               if (m == 0)
                   u = sqrt(0.5 / (Convert.ToDouble(n) * Convert.ToDouble(n + 1)));
               else
                   u = sqrt(1.0 / (Convert.ToDouble(n - m) * Convert.ToDouble(n + m1)));

                   alpha2 = 4.0 * u;
                   beta = sqrt(Convert.ToDouble(n - m1) * Convert.ToDouble(n + m2)) * u;
                   xp0(1) = beta * xp2(1);
                   ip0(1) = ip2(1);
                   xunit(ref xp0(1), ref ip0(1));
                   if (modd == 0)

                       j = 1;
                       while (j <= jmax)

                           xlsum2(Convert.ToDouble(j) * alpha2, xp1[j], beta, xp2[j], out xp0[j], ip1[j], ip2[j], out ip0[j]);
                           j = j + 1;
                       end
                   end
               else

                   j = 1;
                   while (j <= jmax)

                       xlsum2(-Convert.ToDouble(j) * alpha2, xp1[j], beta, xp2[j], out xp0[j], ip1[j], ip2[j], out ip0[j]);
                       j = j + 1;
                   end
               end
           end  % gpeven


           /* ----------------------------------------------------------------------------
           *                                 gpodd
           *
           * Table 7: Fortran routine to return Pnmj when n is odd. Same as
           * Table 6 but when n is odd.
           ---------------------------------------------------------------------------- */
           function gpodd
               (
               Int32 jmax,
               Int32 n,
               Int32 m,
               xp2,
               xp1,
               out xp0,
               Int32[] ip2,
               Int32[] ip1,
               out Int32[] ip0
               )

               xp2 = new double[360];
               xp1 = new double[360];
               xp0 = new double[360];
               ip2 = new Int32[360];
               ip1 = new Int32[360];
               ip0 = new Int32[360];

               Int32 j, m1, m2, modd;
               double u, alpha, beta;

               m1 = m + 1;
               m2 = m + 2;
               modd = m - Convert.ToInt32(m * 0.5) * 2;
               if (m == 0)
                   u = sqrt(0.50 / (Convert.ToDouble(n) * Convert.ToDouble(n + 1)));
               else
                   u = sqrt(1.0 / (Convert.ToDouble(n - m) * Convert.ToDouble(n + m1)));

                   alpha = 2.0 * u;
                   beta = sqrt(Convert.ToDouble(n - m1) * Convert.ToDouble(n + m2)) * u;
                   if (modd == 0)

                       j = 0;
                       while (j <= jmax)

                           xlsum2(Convert.ToDouble(2 * j + 1) * alpha, xp1[j], beta, xp2[j], out xp0[j], ip1[j], ip2[j], out ip0[j]);
                           j = j + 1;
                       end
                   end
               else

                   j = 0;
                   while (j <= jmax)

                       xlsum2(-Convert.ToDouble(2 * j + 1) * alpha, xp1[j], beta, xp2[j], out xp0[j], ip1[j], ip2[j], out ip0[j]);
                       j = j + 1;
                   end
               end
           end  % gpodd



           % Fukushima combined approach to find matrix of unitalized Legendre polynomials
           %
           %

           function LegPolyFF
               (
               recef,
               double latgc,
               Int32 order,
               char unitalized,
               double[,,] unitArr,
               AstroLib.gravityConst gravData,
               out double[,] ALFArr
               )

               Int32 L, m;
               double x, y, z, f, g;

               ALFArr = new double[order + 2, order + 2];
               double magr = mag(recef);

               % initial values
               ALFArr(1, 1) = 1.0;
               ALFArr(1, 2) = 0.0;
               ALFArr(2, 1) = sin(latgc);
               ALFArr(2, 2) = cos(latgc);
               m = 2;
               L = m + 1;
               x = ALFArr(2, 1);
               y = ALFArr(2, 2);

               % find zonal terms
               for (L = 2; L <= order + 1; L++)

                   % find tesseral and sectoral terms
                   %               for (m = 0; m <= order + 1; m++)

                   f = unitArr[L, m, 0] * sin(latgc);
                   g = -unitArr[L, m, 1];
                   z = f * x + g * y;
                   ALFArr[L, m] = z;
                   y = x;
                   x = z;
               end
           end

           end  % LegPolyFF



           /* ----------------------------------------------------------------------------
           *                                   xfsh2f
           *
           *  transfrom the Cnm, Snm, the 4 fully unitalized spherical harmonic coefficients
           *  of a given function depend on the spherical surface, to (Akm, Bkm), the
           *  corresponding Fourier series coefficients of the function. in the program,
           *  (i) x2f and xunit are the Fortran function/routine to handle X-numbers
           *      (Fukushima, 2012a, tables 6 and 7), and
           *  (ii) pinit, dpeven, dpodd, gpeven, and gpodd are the Fortran routines listed
           *  in Tables 3–7, respectively.
           *
           *
           *
           *    Fukushima 2018 table xx
           ---------------------------------------------------------------------------- */

           function xfsh2f
               (
               Int32 nmax,
               AstroLib.gravityConst gravData,
               out double[,] a,
               out double[,] b
               )

               Int32 NX = 100;  % 2200;
               Int32 j, m, k, L, jmax, n1;
               a = new double[NX, NX];
               b = new double[NX, NX];
               %     double[,] pja = new double[NX, NX];  % test to see the values
               jmax = 0;

               Int32[] ipold, ip, ip0;
               Int32[] ip1, ip2;
               xpold, xp, xp0;
               xp1, xp2;
               double pj;
               xpold = new double[NX];
               xp = new double[NX];
               xp0 = new double[NX];
               xp1 = new double[NX];
               xp2 = new double[NX];
               ipold = new Int32[NX];
               ip = new Int32[NX];
               ip0 = new Int32[NX];
               ip1 = new Int32[NX];
               ip2 = new Int32[NX];

               % initialize all to 0
               for (m = 0; m <= nmax; m++)

                   for (k = 0; k <= nmax; k++)

                       a[k, m] = 0.0;
                       b[k, m] = 0.0;
                   end
               end

               % initialize the first 4x4 values
               for (L = 0; L <= 4; L += 2)

                   jmax = Convert.ToInt32(L * 0.5);

                   for (m = 0; m <= L; m++)

                       pinit(L, m, ref xp);

                       for (j = 0; j <= jmax; j++)

                           k = 2 * j;
                           a[k, m] = a[k, m] + xp[j] * gravData.c[L, m];
                           b[k, m] = b[k, m] + xp[j] * gravData.s[L, m];
                       end
                   end
               end

               % even terms
               for (j = 0; j <= jmax; j++)

                   ip[j] = 0;
               end

               for (L = 6; L <= nmax; L += 2)


                   for (j = 0; j <= jmax; j++)

                       xpold[j] = xp[j];
                       ipold[j] = ip[j];
                   end
                   jmax = Convert.ToInt32(L * 0.5);
                   n1 = L - 1;
                   dpeven(L, xpold, out xp, out xp1, ipold, out ip, out ip1);

                   for (j = 0; j <= jmax; j++)

                       k = 2 * j;
                       pj = x2f(xp[j], ip[j]);
                       %       pja[k, n1] = pj;
                       a[k, L] = a[k, L] + pj * gravData.c[L, L];
                       b[k, L] = b[k, L] + pj * gravData.s[L, L];
                       pj = x2f(xp1[j], ip1[j]);
                       a[k, n1] = a[k, n1] + pj * gravData.c[L, n1];
                       b[k, n1] = b[k, n1] + pj * gravData.s[L, n1];
                       xp2[j] = xp[j];
                       ip2[j] = ip[j];
                   end

                   for (m = L - 2; m >= 0; m -= 1)

                       gpeven(jmax, L, m, xp2, xp1, out xp0, ip2, ip1, out ip0);

                       for (j = 0; j <= jmax; j++)

                           k = 2 * j;
                           pj = x2f(xp0[j], ip0[j]);
                           %         pja[k, m] = pj;
                           a[k, m] = a[k, m] + pj * gravData.c[L, m];
                           b[k, m] = b[k, m] + pj * gravData.s[L, m];
                           xp2[j] = xp1[j];
                           ip2[j] = ip1[j];
                           xp1[j] = xp0[j];
                           ip1[j] = ip0[j];
                       end
                   end
               end

               for (L = 1; L <= 3; L += 2)

                   jmax = Convert.ToInt32((L - 1) * 0.5);

                   for (m = 0; m <= L; m++)

                       pinit(L, m, ref xp);

                       for (j = 0; j <= jmax; j++)

                           k = 2 * j + 1;
                           a[k, m] = a[k, m] + xp[j] * gravData.c[L, m];
                           b[k, m] = b[k, m] + xp[j] * gravData.s[L, m];
                       end
                   end
               end

               % odd terms
               for (j = 0; j <= jmax; j++)

                   ip[j] = 0;
               end

               for (L = 5; L <= nmax; L += 2)


                   for (j = 0; j <= jmax; j++)

                       xpold[j] = xp[j];
                       ipold[j] = ip[j];
                   end
                   jmax = Convert.ToInt32((L - 1) * 0.5);
                   n1 = L - 1;
                   dpodd(L, xpold, out xp, out xp1, ipold, out ip, out ip1);

                   for (j = 0; j <= jmax; j++)

                       k = 2 * j + 1;
                       pj = x2f(xp[j], ip[j]);
                       a[k, L] = a[k, L] + pj * gravData.c[L, L];
                       b[k, L] = b[k, L] + pj * gravData.s[L, L];
                       %   pja[k, n] = pj;
                       pj = x2f(xp1[j], ip1[j]);
                       a[k, n1] = a[k, n1] + pj * gravData.c[L, n1];
                       b[k, n1] = b[k, n1] + pj * gravData.s[L, n1];
                       xp2[j] = xp[j];
                       ip2[j] = ip[j];
                   end

                   for (m = L - 2; m >= 0; m -= 1)

                       gpodd(jmax, L, m, xp2, xp1, out xp0, ip2, ip1, out ip0);

                       for (j = 0; j <= jmax; j++)

                           k = 2 * j + 1;
                           pj = x2f(xp0[j], ip0[j]);
                           %     pja[k, m] = pj;
                           a[k, m] = a[k, m] + pj * gravData.c[L, m];
                           b[k, m] = b[k, m] + pj * gravData.s[L, m];
                           xp2[j] = xp1[j];
                           ip2[j] = ip1[j];
                           xp1[j] = xp0[j];
                           ip1[j] = ip0[j];
                       end
                   end
               end
           end  % xfsh2f

           % from 2017 fukishima paper, ALFs
           %        j n = 2j Pn(1=2) d Pn(1=2)
           %1 2 􀀀2.7950849718747371205114670859140954E􀀀01 +4.46E􀀀16
           %2 4 􀀀8.6718750000000000000000000000000019E􀀀01 +1.28E􀀀16
           %3 8 􀀀3.0362102888840987874508856147660683E􀀀01 +4.89E􀀀16
           %4 16 􀀀8.6085221363787000197086857609730105E􀀀01 􀀀2.47E􀀀16
           %5 32 􀀀3.1119962497760147366174972709413071E􀀀01 􀀀1.14E􀀀15
           %6 64 􀀀8.5832418550243444685033693028444350E􀀀01 􀀀1.97E􀀀16
           %7 128 􀀀3.1316449107909472026965626279232704E􀀀01 􀀀2.13E􀀀15
           %8 256 􀀀8.5762286823362136598509949562358587E􀀀01 +4.73E􀀀16
           %9 512 􀀀3.1365884210353617421696699741828314E􀀀01 +1.94E􀀀15
           %10 1024 􀀀8.5744308441362078316451963835453876E􀀀01 􀀀1.12E􀀀15
           %11 2048 􀀀3.1378260213136415436393598399168296E􀀀01 +1.01E􀀀14


           % GMAT Pines approach
           %------------------------------------------------------------------------------
           function FullGeopPines
               (
               double jday,
               pos,
               double latgc,
               Int32 nn, Int32 mm,
               AstroLib.gravityConst gravData,
               out acc
               %out double[,] gradient
               )

               acc = new double(4);

               % Int32 XS = fillgradient ? 2 : 1;
               % calculate vector components ----------------------------------
               double magr = sqrt(pos(1) * pos(1) + pos(2) * pos(2) + pos(3) * pos(3));    % Naming scheme from ref (4)
               double s = pos(1) / magr;
               double t = pos(2) / magr;
               double u = pos(3) / magr; % sin(phi), phi = geocentric latitude

               % Calculate values for A -----------------------------------------
               ord = 750;
               double[,] A = new double[ord, ord];
               double[,] N1 = new double[ord, ord];
               double[,] N2 = new double[ord, ord];
               double[,] V = new double[ord, ord];
               double[,] VR01 = new double[ord, ord];
               double[,] VR11 = new double[ord, ord];
               double[,] VR02 = new double[ord, ord];
               double[,] VR12 = new double[ord, ord];
               double[,] VR22 = new double[ord, ord];
               Re = new double[ord];
               Im = new double[ord];
               double sqrt2 = sqrt(2.0);
               Int32 XS = 2;
               u = sin(latgc);

               % get leg poly unitalization numbers (do once)
               % all 0
               for (Int32 m = 0; m <= mm + 2; ++m)

                   for (Int32 L = m + 2; L <= nn + 2; ++L)

                       N1[L, m] = sqrt(((2.0 * L + 1) * (2 * L - 1)) / ((L - m) * (L + m)));  % double in denom??
                       N2[L, m] = sqrt(((2.0 * L + 1) * (L - m - 1) * (L + m - 1)) / ((2.0 * L - 3) * (L + m) * (L - m)));
                   end
               end

               % NANs
               for (Int32 L = 0; L <= nn + 2; ++L)

                   V[L, 0] = sqrt((2.0 * (2 * L + 1)));   % Temporary, to make following loop work
                   for (Int32 m = 1; m <= L + 2 && m <= mm + 2; ++m)

                       V[L, m] = V[L, m - 1] / sqrt(((L + m) * (L - m + 1)));  % need real on L-m?
                   end
                   V[L, 0] = sqrt((2.0 * L + 1));       % Now set true value
               end

               for (Int32 L = 0; L <= nn; ++L)
                   for (Int32 m = 0; m <= L && m <= mm; ++m)

                       %double nn = L;
                       VR01[L, m] = sqrt(((nn - m) * (nn + m + 1)));  % need real on L-m?
                       VR11[L, m] = sqrt(((2.0 * nn + 1) * (nn + m + 2) * (nn + m + 1)) / ((2.0 * nn + 3)));
                       VR02[L, m] = sqrt(((nn - m) * (nn - m - 1) * (nn + m + 1) * (nn + m + 2)));  % need real on L-m?
                       VR12[L, m] = sqrt((2.0 * nn + 1) / (2.0 * nn + 3) * ((nn - m) * (nn + m + 1) * (nn + m + 2) * (nn + m + 3)));  % need real on L-m?
                       VR22[L, m] = sqrt((2.0 * nn + 1) / (2.0 * nn + 5) * ((nn + m + 1.0) * (nn + m + 2) * (nn + m + 3) * (nn + m + 4)));
                       if (m == 0)

                           VR01[L, m] /= sqrt2;
                           VR11[L, m] /= sqrt2;
                           VR02[L, m] /= sqrt2;
                           VR12[L, m] /= sqrt2;
                           VR22[L, m] /= sqrt2;
                       end
                   end

                   % generate legendre polynomials - the off-diagonal elements
                   A(2, 1) = u * sqrt(3.0);
                   for (Int32 L = 1; L <= nn + XS; ++L)
                       A[L + 1, L] = u * sqrt(2.0 * L + 3) * A[L, L];

                       % apply column-fill recursion formula (Table 2, Row I, Ref.(2))
                       for (Int32 m = 0; m <= mm + XS; ++m)

                           for (Int32 L = m + 2; L <= nn + XS; ++L)
                               A[L, m] = u * N1[L, m] * A[L - 1, m] - N2[L, m] * A[L - 2, m];  % uses anm bnm from fukushima eq 6, 7
                               % Ref.(4), Eq.(24)
                               if (m == 0)
                                   Re[m] = 1;
                               else
                                   Re[m] = s * Re[m - 1] - t * Im[m - 1]; % real part of (s + i*t)^m
                                   if (m == 0)
                                       Im[m] = 0;
                                   else
                                       Im[m] = s * Im[m - 1] + t * Re[m - 1]; % imaginary part of (s + i*t)^m
                                   end

                                   % Now do summation ------------------------------------------------
                                   % initialize recursion
                                   double FieldRadius = gravConst.re;
                                   double rho = FieldRadius / magr;
                                   double Factor = gravConst.mu;
                                   double rho_np1 = -Factor / magr * rho;   % rho(0) ,Ref(4), Eq 26 , factor = mu for gravity
                                   double rho_np2 = rho_np1 * rho;
                                   double a1 = 0;
                                   double a2 = 0;
                                   double a3 = 0;
                                   double a4 = 0;
                                   for (Int32 L = 1; L <= nn; ++L)

                                       rho_np1 *= rho;
                                       rho_np2 *= rho;
                                       double sum1 = 0;
                                       double sum2 = 0;
                                       double sum3 = 0;
                                       double sum4 = 0;

                                       for (Int32 m = 0; m <= L && m <= mm; ++m) % wcs - removed 'm<=L'

                                           double Cval = gravData.c[L, m]; % Cnm(jday, L, m);
                                           double Sval = gravData.s[L, m]; % Snm(jday, L, m);
                                           % Pines Equation 27 (Part of)
                                           double D = (Cval * Re[m] + Sval * Im[m]) * sqrt2;
                                           double E, F;
                                           if (m == 0)
                                               E = 0;
                                           else
                                               E = (Cval * Re[m - 1] + Sval * Im[m - 1]) * sqrt2;
                                               if (m == 0)
                                                   F = 0;
                                               else
                                                   F = (Sval * Re[m - 1] - Cval * Im[m - 1]) * sqrt2;

                                                   % Correct for unitalization
                                                   double Avv00 = A[L, m];
                                                   double Avv01 = VR01[L, m] * A[L, m + 1];
                                                   double Avv11 = VR11[L, m] * A[L + 1, m + 1];
                                                   % Pines Equation 30 and 30b (Part of)
                                                   sum1 += m * Avv00 * E;
                                                   sum2 += m * Avv00 * F;
                                                   sum3 += Avv01 * D;
                                                   sum4 += Avv11 * D;

                                                   % Truncate the gradient at GRADIENT_MAX x GRADIENT_MAX
                                                   %if (fillgradient)
                                                   %
                                                   %    if ((m <= gradientlimit) && (L <= gradientlimit))
                                                   %
                                                   %        % Pines Equation 27 (Part of)
                                                   %        % 2015.09.18 GMT-5295 m<=2  -> m<=1
                                                   %        double G = m <= 1 ? 0 : (Cval * gravConst.[m - 2] + Sval * Im[m - 2]) * sqrt2;
                                                   %        double H = m <= 1 ? 0 : (Sval * gravConst.[m - 2] - Cval * Im[m - 2]) * sqrt2;
                                                   %        % Correct for unitalization
                                                   %        double Avv02 = VR02[L][m] * A[L][m + 2];
                                                   %        double Avv12 = VR12[L][m] * A[L + 1][m + 2];
                                                   %        double Avv22 = VR22[L][m] * A[L + 2][m + 2];
                                                   %        if (GmatMathUtil::IsNaN(Avv02) || GmatMathUtil::IsInf(Avv02))
                                                   %            Avv02 = 0.0;  % ************** wcs added ****

                                                   %        % Pines Equation 36 (Part of)
                                                   %        sum11 += m * (m - 1) * Avv00 * G;
                                                   %        sum12 += m * (m - 1) * Avv00 * H;
                                                   %        sum13 += m * Avv01 * E;
                                                   %        sum14 += m * Avv11 * E;
                                                   %        sum23 += m * Avv01 * F;
                                                   %        sum24 += m * Avv11 * F;
                                                   %        sum33 += Avv02 * D;
                                                   %        sum34 += Avv12 * D;
                                                   %        sum44 += Avv22 * D;
                                                   %    end
                                                   %    else
                                                   %
                                                   %        if (matrixTruncationWasPosted == false)
                                                   %
                                                   %            MessageInterface::ShowMessage('*** WARNING *** Gradient data '

                                                   %                  'for the state transition matrix and A-matrix '

                                                   %                  'computations are truncated at degree and order '

                                                   %                  '<= %d.\L', gradientlimit);
                                                   %            matrixTruncationWasPosted = true;
                                                   %        end
                                                   %    end
                                                   %end
                                               end
                                               % Pines Equation 30 and 30b (Part of)
                                               double rr = rho_np1 / FieldRadius;
                                               a1 += rr * sum1;
                                               a2 += rr * sum2;
                                               a3 += rr * sum3;
                                               a4 -= rr * sum4;
                                               %if (fillgradient)
                                               %
                                               %    % Pines Equation 36 (Part of)
                                               %    a11 += rho_np2 / FieldRadius / FieldRadius * sum11;
                                               %    a12 += rho_np2 / FieldRadius / FieldRadius * sum12;
                                               %    a13 += rho_np2 / FieldRadius / FieldRadius * sum13;
                                               %    a14 -= rho_np2 / FieldRadius / FieldRadius * sum14;
                                               %    a23 += rho_np2 / FieldRadius / FieldRadius * sum23;
                                               %    a24 -= rho_np2 / FieldRadius / FieldRadius * sum24;
                                               %    a33 += rho_np2 / FieldRadius / FieldRadius * sum33;
                                               %    a34 -= rho_np2 / FieldRadius / FieldRadius * sum34;
                                               %    a44 += rho_np2 / FieldRadius / FieldRadius * sum44;
                                               %end
                                           end

                                           % Pines Equation 31
                                           acc(1) = a1 + a4 * s;
                                           acc(2) = a2 + a4 * t;
                                           acc(3) = a3 + a4 * u;
                                           %if (fillgradient)
                                           %
                                           %    % Pines Equation 37
                                           %    gradient(1, 1) = a11 + s * s * a44 + a4 / magr + 2 * s * a14;
                                           %    gradient(2, 2) = -a11 + t * t * a44 + a4 / magr + 2 * t * a24;
                                           %    gradient(3, 3) = a33 + u * u * a44 + a4 / magr + 2 * u * a34;
                                           %    gradient(1, 2) = gradient(2, 1) = a12 + s * t * a44 + s * a24 + t * a14;
                                           %    gradient(1, 3) = gradient(3, 1) = a13 + s * u * a44 + s * a34 + u * a14;
                                           %    gradient(2, 3) = gradient(3, 2) = a23 + t * u * a44 + u * a24 + t * a34;
                                           %end
                                       end  % FullGeopPines


                                       % -----------------------------------------------------------------------------------------------\
                                       % Gottlieb approach for acceleration
                                       % gotpot in his nomenclature
                                       %
                                       % -----------------------------------------------------------------------------------------------\

                                       function FullGeopGot
                                           (
                                           AstroLib.gravityConst gravData,
                                           recef,
                                           double[,,] unitArr,
                                           order,
                                           out double[,] legarrGot,
                                           out G,
                                           out string straccum
                                           )

                                           straccum = '';

                                           legarrGot = new double[order + 2, order + 2];
                                           G = new double(4);

                                           %unitArr = new double[order + 2, order + 2, 7];
                                           zeta, eta, xi;
                                           zeta = new double[order + 1];
                                           eta = new double[order + 1];
                                           xi = new double[order + 1];
                                           ctrigArr = new double[order + 1];
                                           strigArr = new double[order + 1];

                                           double Ri, Xovr, Yovr, Zovr, sinlat, magr;
                                           double muor, muor2, Reor, Reorn;
                                           double Sumh, Sumgam, Sumj, Sumk, Lambda;
                                           double Sumh_N, Sumgam_N, Sumj_N, Sumk_N, Mxpnm;
                                           double BnmVal, pnm, snm, cnm;
                                           Int32 mm1, mp1, nm1, nm2, npmp1, Lim, Sum_Init;
                                           double cn;

                                           magr = mag(recef);
                                           Ri = 1.0 / magr;
                                           Xovr = recef(1) * Ri;
                                           Yovr = recef(2) * Ri;
                                           Zovr = recef(3) * Ri;
                                           sinlat = Zovr;
                                           double coslat = cos(Math.Asin(sinlat));
                                           Reor = gravConst.re * Ri;
                                           Reorn = Reor;
                                           muor = gravConst.mu * Ri;
                                           muor2 = muor * Ri;

                                           % include two-body or not
                                           %if (Want_Central_force == true)
                                           %    Sum_Init = 1;
                                           %else
                                           % note, 1 makes the two body pretty close, except for the 1st component
                                           Sum_Init = 0;

                                           % initial values
                                           % ctrigArr(1) = 1.0;
                                           ctrigArr(2) = Xovr;
                                           %  strigArr(1) = 0.0;
                                           strigArr(2) = Yovr;
                                           Sumh = 0.0;
                                           Sumj = 0.0;
                                           Sumk = 0.0;
                                           Sumgam = Sum_Init;

                                           % unitArr(L, m, 0) xi Gottlieb eta
                                           % unitArr(L, m, 1) eta Gottlieb zeta
                                           % unitArr(L, m, 2) alpha Gottlieb alpha
                                           % unitArr(L, m, 3) beta Gottlieb beta
                                           % unitArr(L, m, 5) delta Gottlieb zn
                                           legarrGot(1, 1) = 1.0;
                                           legarrGot(1, 2) = 0.0;
                                           legarrGot(2, 1) = sqrt(3) * sinlat;
                                           legarrGot(2, 2) = sqrt(3); % * coslat;

                                           for (n = 2; n <= order; n++)

                                               % get the power for each n
                                               Reorn = Reorn * Reor;
                                               %pn = legPoly[n, 0];
                                               cn = gravData.cNor[n, 0];
                                               %sn = gravData.sNor[n, 0];

                                               nm1 = n - 1;
                                               nm2 = n - 2;

                                               % eq 3-17, eq 7-14  alpha(n) beta(n)
                                               legarrGot[n, 0] = sinlat * unitArr[n, 0, 2] * legarrGot[nm1, 0] - unitArr[n, 0, 3] * legarrGot[nm2, 0];
                                               % inner diagonal eq 7-16
                                               % n-1,n-2, 6, not 5, no nm1
                                               legarrGot[n, nm1] = unitArr[n - 1, nm2, 6] * sinlat * legarrGot[n, n];
                                               %      legPoly[n, nm1] = unitArr[n, nm1, 7] * sinlat * legPoly[n, n];
                                               % diagonal eq 7-8
                                               legarrGot[n, n] = unitArr[n, n, 4] * coslat * legarrGot[nm1, nm1];

                                               Sumh_N = unitArr[1, 0, 6] * legarrGot[n, 0] * cn;  % 0 by 2016 paper
                                               Sumgam_N = legarrGot[n, 0] * cn * (n + 1);  % double

                                               if (order > 0)

                                                   for (m = 1; m <= nm2; m++)

                                                       % eq 3-18, eq 7-12   xin(m) eta(m)
                                                       legarrGot[n, m] = unitArr[n, m, 0] * sinlat * legarrGot[nm1, m] - unitArr[n, m, 1] * legarrGot[nm2, m];
                                                   end
                                                   % got all the Legendre functions now

                                                   Sumj_N = 0.0;
                                                   Sumk_N = 0.0;
                                                   ctrigArr[n] = ctrigArr(2) * ctrigArr[nm1] - strigArr(2) * strigArr[nm1]; % mm1????
                                                   strigArr[n] = strigArr(2) * ctrigArr[nm1] + ctrigArr(2) * strigArr[nm1];

                                                   if (n < order)
                                                       Lim = n;
                                                   else
                                                       Lim = order;

                                                       for (m = 1; m <= Lim; m++)

                                                           mm1 = m - 1;
                                                           mp1 = m + 1;
                                                           npmp1 = (n + mp1);  % double
                                                           pnm = legarrGot[n, m];
                                                           cnm = gravData.cNor[n, m];
                                                           snm = gravData.sNor[n, m];
                                                           %ctmm1 = gravData.cNor[n, mm1];
                                                           %stmm1 = gravData.sNor[n, mm1];

                                                           Mxpnm = m * pnm;  % double
                                                           BnmVal = cnm * ctrigArr[m] + snm * strigArr[m];
                                                           Sumh_N = Sumh_N + legarrGot[n, mp1] * BnmVal * unitArr[n, m, 6];  % zn(m)
                                                           Sumgam_N = Sumgam_N + npmp1 * pnm * BnmVal;
                                                           Sumj_N = Sumj_N + Mxpnm * (cnm * ctrigArr[m] + snm * strigArr[m]);
                                                           Sumk_N = Sumk_N - Mxpnm * (cnm * strigArr[m] - snm * ctrigArr[m]);
                                                       end   % for through m

                                                       Sumj = Sumj + Reorn * Sumj_N;
                                                       Sumk = Sumk + Reorn * Sumk_N;
                                                   end  % if order > 0

                                                   % ---- Sums bleow here have values when N m = 0
                                                   Sumh = Sumh + Reorn * Sumh_N;
                                                   Sumgam = Sumgam + Reorn * Sumgam_N;
                                               end  % loop

                                               Lambda = Sumgam + sinlat * Sumh;
                                               G(1) = -muor2 * (Lambda * Xovr - Sumj);
                                               G(2) = -muor2 * (Lambda * Yovr - Sumk);
                                               G(3) = -muor2 * (Lambda * Zovr - Sumh);

                                               % if (show == 'y')

                                               straccum = straccum + 'Gottlieb case nonspherical, no two-body ---------- ' + '\n';
                                               straccum = straccum + 'legarrGot 4 0   ' + legarrGot(5, 1), '  4 1   '
                                               + legarrGot(5, 2), '  4 4   ' + legarrGot(5, 5), '\n';
                                               straccum = straccum + 'legarrGot 5 0   ' + legarrGot(6, 1), '  5 1   '
                                               + ctrigArr(3), '  Tan   ' + strigArr(3), '\n';
                                               straccum = straccum + 'legarrGot' + order + ' 0   ' + legarrGot[order, 0], '  ' + order + ' 1   '
                                               + legarrGot[order, 1], ' + order + ' + legarrGot[order, order], '\n';
                                               %straccum = straccum + 'trigarr ' + order + ' Sin  ' + trigArr[order, 0], '  Cos   '
                                               %    + trigArr[order, 1], '  Tan   ' + trigArr[order, 3], '\n';
                                               straccum = straccum + 'apertGot ecef ' + order, order, G(1), '     '
                                               + G(2), '     ' + G(3), '\n';
                                           end

                                       end  % FullGeopGot;



                                       function testproporbit()

                                           fArgs = new double[14];
                                           reci = new double(4);
                                           veci = new double(4);
                                           aeci = new double(4);
                                           aeci2 = new double(4);
                                           recef = new double(4);
                                           vecef = new double(4);
                                           aecef = new double(4);
                                           rsecef = new double(4);
                                           vsecef = new double(4);
                                           rseci = new double(4);
                                           vseci = new double(4);
                                           double psia, wa, epsa, chia;
                                           double meaneps, deltapsi, deltaeps, trueeps;
                                           omegaearth = new double(4);
                                           rpef = new double(4);
                                           vpef = new double(4);
                                           apef = new double(4);
                                           crossr = new double(4);
                                           tempvec1 = new double(4);
                                           double[,] tm = new double(4, 4);
                                           double[,] prec = new double(4, 4);
                                           double[,] nut = new double(4, 4);
                                           double[,] st = new double(4, 4);
                                           double[,] pm = new double(4, 4);
                                           double[,] precp = new double(4, 4);
                                           double[,] nutp = new double(4, 4);
                                           double[,] stp = new double(4, 4);
                                           double[,] pmp = new double(4, 4);
                                           double[,] temp = new double(4, 4);
                                           double[,] temp1 = new double(4, 4);
                                           double[,] transeci2ecef = new double(4, 4);
                                           double[,] transecef2eci = new double(4, 4);
                                           double[,] convArr = new double[152, 152];

                                           adrag = new double(4);
                                           vrel = new double(4);

                                           rsun = new double(4);
                                           rsatsun = new double(4);
                                           rmoon = new double(4);
                                           rsat3 = new double(4);
                                           rearth3 = new double(4);
                                           a3body = new double(4);
                                           athirdbody = new double(4);
                                           athirdbody1 = new double(4);
                                           athirdbody2 = new double(4);
                                           aPertG = new double(4);
                                           aPertM = new double(4);
                                           aPertM1 = new double(4);

                                           asrp = new double(4);

                                           double ttt, ttdb, xp, yp, lod, jdut1, ddpsi, ddeps, ddx, ddy, dut1, jdtt, jdftt;
                                           year, mon, day, hr, minute, dat, eqeterms;
                                           double second, jdF, jdutc, jdFutc, jdtdb, jdFtdb, jdtdbjplstart, jdFtdbjplstart;

                                           double hellp, latgd, lon;
                                           double cd, cr, area, mass, q, tmptdb;

                                           double latgc, alt;
                                           Int32 degree, order;
                                           double[,] LegArrMU;  % montenbruck
                                           double[,] LegArrMN;
                                           double[,] LegArrGU;  % gtds
                                           double[,] LegArrGN;
                                           double[,] LegArrOU;  % geodyn
                                           double[,] LegArrON;
                                           double[,] LegArrGott; % Gottlieb
                                           double[,] LegArrGotU; % Gottlieb
                                           double[,] LegArrGotN; % Gottlieb
                                           double[,] LegArrEx;  % exact
                                           double[,] LegArrF;   % Fukushima
                                           % 152 is arbitrary
                                           Int32 orderSize = 500;
                                           double[,,] unitArr = new double[orderSize, orderSize, 7];

                                           LegArrF = new double[orderSize, orderSize];

                                           AstroLib.gravityConst gravData;

                                           double rad = 180.0 / pi;              % deg to rad
                                           double conv = pi / (180.0 * 3600.0);  % ' to rad

                                           StringBuilder strbuildall = new StringBuilder();
                                           %  strbuild.Clear();
                                           StringBuilder strbuildplot = new StringBuilder();
                                           strbuildplot.Clear();

                                           % ------------------ BOOK EXAMPLE ----------------------------------------------
                                           % ------------------------------- initial state -------------------------------
                                           reci = [ -605.79079600, -5870.23042200, 3493.05191600 ];
                                           veci = [ -1.568251000, -3.702348000, -6.479485000 ];
                                           % prout initial conditions
                                           strbuildall.AppendLine('reci  ' + reci(1), reci(2), reci(3),
                                           'v  ' + veci(1), veci(2), veci(3));
                                           cd = 2.2;
                                           cr = 1.2;
                                           area = 40.0;     % m^2
                                           mass = 1000.0;   % kg

                                           % ------------------------------- establish time parameters -------------------------------
                                           nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                           [iau80arr] = iau80in(nutLoc);
                                           nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                           [iau06arr] = iau06in(nutLoc);
                                           % now read it in
                                           double jdxysstart, jdfxysstart;
                                           AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

                                           year = 2020;
                                           mon = 2;
                                           day = 18;
                                           hr = 15;
                                           minute = 8;
                                           second = 47.23847;
                                           jday(year, mon, day, hr, minute, second, out jdutc, out jdFutc);  % utc

                                           % these vaues are not consistent wih the EOP files - are they interpolated already????
                                           % no. change to use actual at 0000 values, rerun probelm.
                                           %2020 02 18 58897  0.030655  0.336009 -0.1990725  0.0000639 -0.108041 -0.007459  0.000315 -0.000055  37
                                           %2020 02 19 58898  0.030313  0.337617 - 0.1991016  0.0000235 - 0.107939 - 0.007476  0.000324 - 0.000036  37

                                           xp = 0.030655 * conv;
                                           yp = 0.336009 * conv;
                                           lod = 0.0000639;
                                           ddpsi = -0.108041 * conv;  % ' to rad
                                           ddeps = -0.007459 * conv;
                                           ddx = 0.000315 * conv;     % ' to rad
                                           ddy = 0.000055 * conv;
                                           dut1 = -0.1990725;   % sec
                                           dat = 37;            % sec
                                           opt = '80';
                                           eqeterms = 2;
                                           jdtt = jdutc;
                                           jdftt = jdFutc + (dat + 32.184)/86400.0;

                                           % method to do calculations in
                                           char unitalized = 'y';
                                           strbuildall.AppendLine('unitalized = ' + unitalized);

                                           strbuildall.AppendLine(year.ToString('0000'), mon.ToString('00'), day.ToString('00'), hr.ToString('00') + ':' +
                                           minute.ToString('00') + ':' + second);
                                           strbuildall.AppendLine('dat ' + dat, ' lod ' + lod);
                                           strbuildall.AppendLine('jdutc ' + (jdutc + jdFutc));
                                           strbuildall.AppendLine('xp yp ' + (xp / conv), (yp / conv), ' arcsec');
                                           strbuildall.AppendLine('dpsi deps ' + (ddpsi / conv), (ddeps / conv), ' arcsec');
                                           strbuildall.AppendLine('dx dy ' + (ddx / conv), (ddy / conv), ' arcsec \n');

                                           jdut1 = jdutc + jdFutc + dut1 / 86400.0;
                                           strbuildall.AppendLine('jdut1 ' + jdut1);

                                           % watch if getting tdb that j2000 is also tdb
                                           ttt = (jdutc + jdFutc + (dat + 32.184) / 86400.0 - 2451545.0) / 36525.0;
                                           strbuildall.AppendLine('jdttt ' + (jdutc + jdFutc + (dat + 32.184) / 86400.0), ' ttt ' + ttt, '\n');

                                           fundarg(ttt, opt, out fArgs);

                                           tmptdb = (dat + 32.184 + 0.001657 * sin(628.3076 * ttt + 6.2401)
                                           + 0.000022 * sin(575.3385 * ttt + 4.2970)
                                           + 0.000014 * sin(1256.6152 * ttt + 6.1969)
                                           + 0.000005 * sin(606.9777 * ttt + 4.0212)
                                           + 0.000005 * sin(52.9691 * ttt + 0.4444)
                                           + 0.000002 * sin(21.3299 * ttt + 5.5431)
                                           + 0.000010 * ttt * sin(628.3076 * ttt + 4.2490)) / 86400.0;  % USNO circ(14)
                                           jday(year, mon, day, hr, minute, second + tmptdb, out jdtdb, out jdFtdb);
                                           ttdb = (jdtdb + jdFtdb - 2451545.0) / 36525.0;
                                           strbuildall.AppendLine('jdttb ' + (jdtdb + jdFtdb), ' ttdb ' + ttdb);

                                           % get reduction matrices
                                           deltapsi = 0.0;
                                           meaneps = 0.0;

                                           omegaearth(1) = 0.0;
                                           omegaearth(2) = 0.0;
                                           omegaearth(3) = gravConst.earthrot * (1.0 - lod / 86400.0);

                                           prec = precess(ttt, opt, out psia, out wa, out epsa, out chia);
                                           nut = nutation(ttt, ddpsi, ddeps, iau80arr, opt, fArgs, out deltapsi, out deltaeps, out trueeps, out meaneps);
                                           st = sidereal(jdut1, deltapsi, meaneps, fArgs, lod, eqeterms, opt);
                                           pm = polarm(xp, yp, ttt, opt);

                                           %% ---- perform transformations eci to ecef
                                           pmp = mattrans(pm, 3);
                                           stp = mattrans(st, 3);
                                           nutp = mattrans(nut, 3);
                                           precp = mattrans(prec, 3);
                                           temp = matmult(pmp, stp, 3, 3, 3);
                                           temp1 = matmult(temp, nutp, 3, 3, 3);
                                           transeci2ecef = matmult(temp1, precp, 3, 3, 3);
                                           recef = matvecmult(transeci2ecef, reci, 3);
                                           strbuildall.AppendLine('recef  ' + recef(1), recef(2), recef(3),
                                           'v  ' + vecef(1), vecef(2), vecef(3));

                                           %----perform transformations ecef to eci
                                           % note the rotations occur only for velocity so the full transformation is fine here
                                           transecef2eci = mattrans(transeci2ecef, 3);
                                           reci = matvecmult(transecef2eci, recef, 3);
                                           strbuildall.AppendLine('reci  ' + reci(1), reci(2), reci(3),
                                           'v  ' + veci(1), veci(2), veci(3));

                                           eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
                                           AstroLib.EOpt.e80, iau80arr, iau06arr,
                                           jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);

                                           % prout initial conditions
                                           strbuildall.AppendLine('reci  ' + reci(1), reci(2), reci(3),
                                           'v  ' + veci(1), veci(2), veci(3));
                                           strbuildall.AppendLine('recef  ' + recef(1), recef(2), recef(3),
                                           'v  ' + vecef(1), vecef(2), vecef(3));

                                           ecef2ll(recef, out latgc, out latgd, out lon, out hellp);
                                           % or
                                           latgc = 52.0 / rad;  % 52 and 34
                                           lon = 5.0 / rad;
                                           alt = 6880.0;
                                           site(latgd, lon, alt, out recef, out vecef);
                                           strbuildall.AppendLine('new site loc');
                                           strbuildall.AppendLine('recef  ' + recef(1), recef(2), recef(3),
                                           'v  ' + vecef(1), vecef(2), vecef(3));

                                           % ---------------------------------------------------------------------------------------------
                                           % ------------------------------------ GRAVITY FIELD --------------------------------------
                                           this.opsStatus.Text = 'Status: Reading gravity field EGM-08 test';
                                           Refresh();
                                           % get past text in each file
                                           %if (fname.Contains('GEM'))    % GEM10bununit36.grv, GEMT3unit50.grv
                                           %    startKtr = 17;
                                           %if (fname.Contains('EGM-96')) % EGM-96unit70.grv
                                           %    startKtr = 73;
                                           %if (fname.Contains('EGM-08')) % EGM-08unit100.grv
                                           %startKtr = 83;  % or 21 for the larger file... which has gfc in the first col too
                                           % fully unitalized, 4415, .1363, order 100
                                           %string fname = 'D:/Dataorig/Gravity/EGM-08unit100.grv';  % 83
                                           % fully unitalized, 4415, .1363, order 2190
                                           %startKtr = 21;  % or 21 for the larger file... which has gfc in the first col too
                                           string fname = 'D:/Dataorig/Gravity/EGM2008_to2190_TideFree.txt';
                                           % fully unitalized, 4415, .1363, order 360
                                           %string fname = 'D:/Dataorig/Gravity/GGM03C-Data.txt';

                                           char unital = 'y';  % if file has unitalized coefficients

                                           initGravityField(fname, 0, unital, out order, out gravData, out convArr, out unitArr);
                                           strbuildall.AppendLine('\nread in gravity field ' + fname, order, ' --------------- ');
                                           strbuildall.AppendLine('\ncoefficents --------------- ');
                                           strbuildall.AppendLine('c  2  0  ' + gravData.c(3, 1), ' s ' + gravData.s(3, 1));
                                           strbuildall.AppendLine('c  4  0  ' + gravData.c(5, 1), ' s ' + gravData.s(5, 1));
                                           strbuildall.AppendLine('c  4  4  ' + gravData.c(5, 5), ' s ' + gravData.s(5, 5));
                                           strbuildall.AppendLine('c 21  1 ' + gravData.c[21, 1], ' s ' + gravData.s[21, 1]);
                                           strbuildall.AppendLine('\nunitalized coefficents --------------- ');
                                           strbuildall.AppendLine('c  2  0  ' + gravData.cNor(3, 1), ' s ' + gravData.sNor(3, 1));
                                           strbuildall.AppendLine('c  4  0  ' + gravData.cNor(5, 1), ' s ' + gravData.sNor(5, 1));
                                           strbuildall.AppendLine('c  4  4  ' + gravData.cNor(5, 5), ' s ' + gravData.sNor(5, 5));
                                           strbuildall.AppendLine('c 21  1 ' + gravData.cNor[21, 1], ' s ' + gravData.sNor[21, 1]);
                                           strbuildall.AppendLine('c 500  1 ' + gravData.cNor[500, 1], ' s ' + gravData.sNor[500, 1]);

                                           % --------------------------------------------------------------------------------------------------
                                           % calculate legendre polynomials
                                           this.opsStatus.Text = 'Status: Calculate Legendre polynomial recursions Unn and Nor ';
                                           Refresh();

                                           strbuildall.AppendLine('\nCalculate Legendre polynomial recursions Unn and Nor  --------------- ');
                                           degree = 500;
                                           order = 500;
                                           % GTDS version
                                           % does with  ununitalized elements, then unitalized from there. But ununitalized only go to about 170
                                           LegPolyG(latgc, order, unitalized, convArr, unitArr, out LegArrGU, out LegArrGN);

                                           % Gottlieb version
                                           LegPolyGot(latgc, order, unitalized, convArr, unitArr, out LegArrGotU, out LegArrGotN);

                                           % Montenbruck version
                                           LegPolyM(latgc, order, unitalized, convArr, out LegArrMU, out LegArrMN);

                                           % Geodyn version
                                           geodynlegp(latgc, degree, order, out LegArrOU, out LegArrON);

                                           % Exact values
                                           LegPolyEx(latgc, order, out LegArrEx);

                                           % Fukushima approach do as 1-d arrays for now
                                           LegPolyF(latgc, order, 'y', unitArr, out LegArrF);
                                           %pmm = new double(9);
                                           %psm = new double(9);
                                           %Int32[] ipsm = new Int32(9);
                                           % get the values in X-numbers
                                           %alfsx(cos(latgc), 6, unitArr, out psm, out ipsm);
                                           %alfmx(sin(latgc), 3, 6, unitArr, psm(4), ipsm(4), out pmm);


                                           string errstr = ' ';
                                           double dr1, dr2, dr3, sumdr1, sumdr2, sumdr3;
                                           sumdr1 = 0.0;
                                           sumdr2 = 0.0;
                                           sumdr3 = 0.0;
                                           strbuildall.AppendLine('\nwrite out unitalized Legendre polynomials --------------- ');

                                           % order xxxxxxxxxxxxxxxxxx
                                           for (L = 0; L <= 130; L++)

                                               string tempstr1 = 'MN  ';  % montenbruck
                                               string tempstr2 = 'GN  ';  % gtds
                                               string tempstr3 = 'MU  ';
                                               string tempstr3a = 'LU  ';  % exact
                                               string tempstr4 = 'OU  ';  % geodyn\
                                               string tempstr5 = 'GtN ';  % gottlieb\
                                               string tempstr6 = 'GtU ';  % gottlieb
                                               string tempstr7 = 'FN  ';  % Fukushima, test ones
                                               stopL = L;
                                               for (m = 0; m <= stopL; m++)

                                                   tempstr1 = tempstr1, L, '  ' + m, '   ' + LegArrMN[L, m];
                                                   tempstr2 = tempstr2, L, '  ' + m, '   ' + LegArrGN[L, m];
                                                   tempstr5 = tempstr5, L, '  ' + m, '   ' + LegArrGotN[L, m];
                                                   tempstr7 = tempstr7, L, '  ' + m, '   ' + LegArrF[L, m];
                                                   tempstr3 = tempstr3, L, '  ' + m, '   ' + LegArrMU[L, m];
                                                   tempstr3a = tempstr3a, L, '  ' + m, '   ' + LegArrEx[L, m];
                                                   tempstr6 = tempstr6, L, '  ' + m, '   ' + LegArrGotU[L, m];
                                                   tempstr4 = tempstr4, L, '  ' + m, '   ' + LegArrOU[L + 1, m + 1];
                                                   % check error values
                                                   dr1 = 100.0 * (LegArrF[L, m] - LegArrGotN[L, m]) / LegArrF[L, m];
                                                   dr2 = 100.0 * (LegArrF[L, m] - LegArrGN[L, m]) / LegArrF[L, m];
                                                   dr3 = 100.0 * (LegArrF[L, m] - LegArrMN[L, m]) / LegArrF[L, m];
                                                   sumdr1 = sumdr1 + dr1;
                                                   sumdr2 = sumdr2 + dr2;
                                                   sumdr3 = sumdr3 + dr3;
                                                   errstr = errstr + '\n' + L, '  ' + m, '   ' + dr1
                                                   , dr2, dr3;
                                               end
                                               % unitalized ones
                                               strbuildall.AppendLine(tempstr2);
                                               strbuildall.AppendLine(tempstr1);
                                               strbuildall.AppendLine(tempstr5);
                                               strbuildall.AppendLine(tempstr7 + '\n');
                                               % ununitalized ones
                                               fprintf(1,tempstr3);
                                               fprintf(1,tempstr3a);
                                               fprintf(1,tempstr6);
                                               fprintf(1,tempstr4 + '\n');
                                           end
                                           strbuildplot.AppendLine(errstr);

                                           % -------------------- now accelerations -----------------------------------------------------
                                           strbuildall.AppendLine('\naccelerations --------------- ');
                                           string straccum = '';
                                           this.opsStatus.Text = 'Status: Calculate Accelerations --------------- ';
                                           Refresh();

                                           %order = 4;
                                           order = 120; % 10;
                                           % GTDS acceleration for non-spherical portion
                                           FullGeopG(recef, order, unitalized, convArr, unitArr, gravData, out aPertG, 'y', out straccum);
                                           strbuildall.AppendLine(straccum);
                                           aeci = matvecmult(transecef2eci, aPertG, 3);
                                           straccum = straccum + 'apertG eci  ' + order, order, aeci(1), '     '
                                           + aeci(2), '     ' + aeci(3), '\n';
                                           strbuildall.AppendLine(straccum);

                                           FullGeopG(recef, order, unitalized, convArr, unitArr, gravData, out aPertG, 'n', out straccum);
                                           strbuildall.AppendLine(straccum);

                                           % Montenbruck acceleration
                                           FullGeopM(recef, order, unitalized, convArr, gravData, out aPertM, 'y', out straccum);
                                           strbuildall.AppendLine(straccum);
                                           aeci = matvecmult(transecef2eci, aPertM, 3);
                                           straccum = straccum + 'apertM eci  ' + order, order, aeci(1), '     '
                                           + aeci(2), '     ' + aeci(3), '\n';
                                           strbuildall.AppendLine(straccum);

                                           FullGeopM(recef, order, unitalized, convArr, gravData, out aPertM, 'n', out straccum);
                                           strbuildall.AppendLine(straccum);

                                           % Montenbruck code acceleration
                                           FullGeopMC(recef, order, unitalized, convArr, gravData, out aPertM1, 'y', out straccum);
                                           strbuildall.AppendLine(straccum);
                                           aeci = matvecmult(transecef2eci, aPertM1, 3);
                                           straccum = straccum + 'apertM1 eci ' + order, order, aeci(1), '     '
                                           + aeci(2), '     ' + aeci(3), '\n';
                                           strbuildall.AppendLine(straccum);

                                           FullGeopMC(recef, order, unitalized, convArr, gravData, out aPertM1, 'n', out straccum);
                                           strbuildall.AppendLine(straccum);

                                           % Gottlieb acceleration
                                           strbuildall.AppendLine('Gottlieb acceleration ');
                                           G = new double(4);
                                           aPertGt = new double(4);
                                           FullGeopGot(gravData, recef, unitArr, order, out LegArrGott, out G, out straccum);
                                           strbuildall.AppendLine(straccum);

                                           % Fukushima acceleration
                                           strbuildall.AppendLine('Fukushima acceleration ');
                                           %LegPolyFF(recef, latgc, order, 'y', unitArr, gravData, out LegArrF);
                                           double[,] a = new double[360, 360];
                                           double[,] b = new double[360, 360];
                                           xfsh2f(80, gravData, out a, out b);
                                           strbuildall.AppendLine(a(3, 1));
                                           strbuildall.AppendLine('a  2  0  ' + a(3, 1), ' b ' + b(3, 1));
                                           strbuildall.AppendLine('a  2  1  ' + a(3, 2), ' b ' + b(3, 2));
                                           strbuildall.AppendLine('a  4  0  ' + a(5, 1), ' b ' + b(5, 1));
                                           strbuildall.AppendLine('a  4  1  ' + a(5, 1), ' b ' + b(5, 2));
                                           strbuildall.AppendLine('a  4  4  ' + a(5, 5), ' b ' + b(5, 5));
                                           strbuildall.AppendLine('a 10 10  ' + a[10, 0], ' b ' + b[10, 0]);
                                           strbuildall.AppendLine('a 21  1 ' + a[21, 1], ' b ' + b[21, 1]);

                                           % Pines approach
                                           strbuildall.AppendLine('Pines acceleration ');
                                           FullGeopPines(jdutc, recef, latgc, order, order, gravData, out aeci);
                                           strbuildall.AppendLine('apertP    4 4   ' + aeci(1), '     ' + aeci(2), '     ' + aeci(3));

                                           strbuildall.AppendLine(straccum);
                                           strbuildall.AppendLine('\ngravity field ' + fname, order, ' --------------- ');
                                           strbuildall.AppendLine(' summary accelerations ----------------------------------------------- ');
                                           strbuildall.AppendLine('apertG bf  ' + order, order, aPertG(1), '     ' + aPertG(2), '     ' + aPertG(3));
                                           strbuildall.AppendLine('apertM bf  ' + order, order, aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                           strbuildall.AppendLine('apertMC bf ' + order, order, aPertM1(1), '     ' + aPertM1(2), '     ' + aPertM1(3));
                                           strbuildall.AppendLine('apertGt bf ' + order, order, G(1), '     ' + G(2), '     ' + G(3));

                                           aPertG = matvecmult(transecef2eci, aPertG, 3);
                                           aPertM = matvecmult(transecef2eci, aPertM, 3);
                                           aPertM1 = matvecmult(transecef2eci, aPertM1, 3);
                                           aPertGt = matvecmult(transecef2eci, G, 3);
                                           strbuildall.AppendLine('apertG  eci ' + order, order, aPertG(1), '     ' + aPertG(2), '     ' + aPertG(3));
                                           strbuildall.AppendLine('apertM  eci ' + order, order, aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                           strbuildall.AppendLine('apertMC eci ' + order, order, aPertM1(1), '     ' + aPertM1(2), '     ' + aPertM1(3));
                                           strbuildall.AppendLine('apertGt eci ' + order, order, aPertGt(1), '     ' + aPertGt(2), '     ' + aPertGt(3));

                                           strbuildall.AppendLine('STK ans 4x4         -0.0000003723020	-0.0000031362090   	-0.0000102647170\n');  % no 2-body


                                           % -------------------------- add in two body term since full geop is only disturbing part
                                           eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.efrom, ref recef, ref vecef,
                                           AstroLib.EOpt.e80, iau80arr, iau06arr,
                                           jdtt, jdftt, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
                                           aeci2(1) = -gravConst.mu * reci(1) / (Math.Pow(mag(reci), 3));
                                           aeci2(2) = -gravConst.mu * reci(2) / (Math.Pow(mag(reci), 3));
                                           aeci2(3) = -gravConst.mu * reci(3) / (Math.Pow(mag(reci), 3));
                                           strbuildall.AppendLine('a2body      ' + aeci2(1), '     ' + aeci2(2), '     ' + aeci2(3));

                                           aPertG(1) = aPertG(1) + aeci2(1);
                                           aPertG(2) = aPertG(2) + aeci2(2);
                                           aPertG(3) = aPertG(3) + aeci2(3);

                                           temm = new double(4);
                                           temm(1) = aPertG(1);
                                           temm(2) = aPertG(2);
                                           temm(3) = aPertG(3);

                                           aPertM(1) = aPertM(1) + aeci2(1);
                                           aPertM(2) = aPertM(2) + aeci2(2);
                                           aPertM(3) = aPertM(3) + aeci2(3);

                                           aPertM1(1) = aPertM1(1) + aeci2(1);
                                           aPertM1(2) = aPertM1(2) + aeci2(2);
                                           aPertM1(3) = aPertM1(3) + aeci2(3);

                                           strbuildall.AppendLine(' now with two body included');
                                           strbuildall.AppendLine('apertG ' + order, order, aPertG(1), '     ' + aPertG(2), '     ' + aPertG(3));
                                           strbuildall.AppendLine('apertM ' + order, order, aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                           strbuildall.AppendLine('apertMC ' + order, order, aPertM1(1), '     ' + aPertM1(2), '     ' + aPertM1(3));
                                           strbuildall.AppendLine('STK ans 4x4 w2   0.0007483593980          0.0072522125910         -0.0043275195170\n');  % no 2-body
                                           %                    4x4 j2000   0.00074835849281         0.00725221243453        -0.00432751993509
                                           %                    4x4 icrf    0.00074835939828         0.00725221259059        -0.00432751951698
                                           %                    all j2000   0.00074845403274         0.00725223127396        -0.00432750265312
                                           %                    all icrf    0.00074845493821         0.00725223143002        -0.00432750223499

                                           this.opsStatus.Text = 'Status: Other perts';
                                           Refresh();

                                           strbuildall.AppendLine('------------------ find drag acceleration');
                                           double density = 1.5e-12;  % kg / m3
                                           double magv = mag(vecef);
                                           vrel(1) = vecef(1); % vecef unital is veci to tod, then - wxr
                                           vrel(2) = vecef(2);
                                           vrel(3) = vecef(3);
                                           strbuildall.AppendLine(' vrel ' + vrel(1), vrel(2), vrel(3));
                                           %                 kg / m3        m2  /  kg     km / s  km / s
                                           adrag(1) = -0.5 * density * cd * area / mass * magv * vrel(1) * 1000.0;  % simplify vel, get units to km/s2
                                           adrag(2) = -0.5 * density * cd * area / mass * magv * vrel(2) * 1000.0;  % simplify vel, get units to km/s2
                                           adrag(3) = -0.5 * density * cd * area / mass * magv * vrel(3) * 1000.0;  % simplify vel, get units to km/s2

                                           strbuildall.AppendLine(' adrag ecef' + adrag(1), adrag(2), adrag(3));

                                           strbuildall.AppendLine(' agrav + drag ecef' +(temm(1)+ adrag(1)),
                                           (temm(2) + adrag(2)), (temm(3) + adrag(3)));


                                           transecef2eci = matmult(temp1, pm, 3, 3, 3);
                                           aeci = matvecmult(transecef2eci, adrag, 3);
                                           strbuildall.AppendLine(' adrag eci ' + aeci(1), aeci(2), aeci(3));
                                           strbuildall.AppendLine('ans drag JR spline      0.0000000001040	0.0000000002090	0.0000000003550\n');
                                           strbuildall.AppendLine('ans drag JR daily       0.0000000000840	0.0000000001720	0.0000000002900\n');
                                           strbuildall.AppendLine('ans drag MSIS daily     0.0000000000730	0.0000000001510	0.0000000002530\n');

                                           temmm = new double(4);
                                           temmm(1) = temm(1) + adrag(1);
                                           temmm(2) = temm(2) + adrag(2);
                                           temmm(3) = temm(3) + adrag(3);
                                           aeci = matvecmult(transecef2eci, temmm, 3);
                                           strbuildall.AppendLine(' agrav+drag eci ' + aeci(1), aeci(2), aeci(3));

                                           strbuildall.AppendLine(' ------------------ find third body acceleration');
                                           AstroLib.jpldedataClass[] jpldearr = jpldearr;
                                           double musun, mumoon, rsmag, rmmag;
                                           musun = 1.32712428e11;    % km3 / s2
                                           mumoon = 4902.799;        % km3 / s2
                                           infilename = append('D:\Codes\LIBRARY\DataLib\', 'sunmooneph_430t.txt');
                                           [jpldearr, jdjpldestart, jdjpldestartFrac] = initjplde(infilename);

                                           % sun
                                           findjpldeparam(jdtdb, jdFtdb, 's', jpldearr, jdtdbjplstart, out rsun, out rsmag, out rmoon, out rmmag);
                                           % stk value (chk that tdb is argument)
                                           rsuns = [ 126916355.384390, -69567131.339884, -30163629.424510 ];
                                           % JPL ans  2020  2 18  M          0.6306
                                           rmoonj = [ 14462.2967, -357096.9762, -151599.3021 ];
                                           %JPL ans  2020  2 18 15:08:47.23847 S       0.6306
                                           rsunj = [ 126921698.4134, -69564121.8695, -30156263.9220 ];

                                           addvec(1.0, rsuns, -1.0, rsun, out tempvec1);
                                           strbuildall.AppendLine(' diff rsun stk-mine ' + tempvec1(1), tempvec1(2),
                                           tempvec1(3), mag(tempvec1));
                                           addvec(1.0, rsunj, -1.0, rsun, out tempvec1);
                                           strbuildall.AppendLine(' diff rsun jpl-mine ' + tempvec1(1), tempvec1(2),
                                           tempvec1(3), mag(tempvec1));
                                           addvec(1.0, rsuns, -1.0, rsunj, out tempvec1);
                                           strbuildall.AppendLine(' diff rsun stk-jpl  ' + tempvec1(1), tempvec1(2),
                                           tempvec1(3), mag(tempvec1));
                                           addvec(1.0, rmoonj, -1.0, rmoon, out tempvec1);
                                           strbuildall.AppendLine(' diff rmoon jpl-mine ' + tempvec1(1), tempvec1(2),
                                           tempvec1(3), mag(tempvec1));
                                           strbuildall.AppendLine(' rsun  ' + rsun(1), rsun(2), rsun(3));
                                           strbuildall.AppendLine(' rmoon ' + rmoon(1), rmoon(2), rmoon(3));

                                           double mu3 = musun;
                                           rsat3(1) = rsun(1) - reci(1);
                                           rsat3(2) = rsun(2) - reci(2);
                                           rsat3(3) = rsun(3) - reci(3);
                                           double magrsat3 = mag(rsat3);
                                           rearth3(1) = rsun(1);
                                           rearth3(2) = rsun(2);
                                           rearth3(3) = rsun(3);
                                           double magrearth3 = mag(rearth3);
                                           athirdbody(1) = mu3 * (rsat3(1) / Math.Pow(magrsat3, 3) - rearth3(1) / Math.Pow(magrearth3, 3));
                                           athirdbody(2) = mu3 * (rsat3(2) / Math.Pow(magrsat3, 3) - rearth3(2) / Math.Pow(magrearth3, 3));
                                           athirdbody(3) = mu3 * (rsat3(3) / Math.Pow(magrsat3, 3) - rearth3(3) / Math.Pow(magrearth3, 3));
                                           strbuildall.AppendLine(' a3bodyS  eci ' + athirdbody(1), athirdbody(2), athirdbody(3));
                                           athirdbody2(1) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(1) - 3.0 * rearth3(1) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(1) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           athirdbody2(2) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(2) - 3.0 * rearth3(2) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(2) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           athirdbody2(3) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(3) - 3.0 * rearth3(3) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(3) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           strbuildall.AppendLine(' a3bodyS2 eci' + athirdbody2(1), athirdbody2(2), athirdbody2(3));
                                           q = (Math.Pow(mag(reci), 2) + 2.0 * dot(reci, rsat3)) *
                                           (Math.Pow(magrearth3, 2) + magrearth3 * magrsat3 + Math.Pow(magrsat3, 2)) /
                                           (Math.Pow(magrearth3, 3) * Math.Pow(magrsat3, 3) * (magrearth3 + magrsat3));
                                           athirdbody1(1) = mu3 * (rsat3(1) * q - reci(1) / Math.Pow(magrearth3, 3));
                                           athirdbody1(2) = mu3 * (rsat3(2) * q - reci(2) / Math.Pow(magrearth3, 3));
                                           athirdbody1(3) = mu3 * (rsat3(3) * q - reci(3) / Math.Pow(magrearth3, 3));
                                           strbuildall.AppendLine(' a3bodyS1 eci' + athirdbody1(1), athirdbody1(2), athirdbody1(3));
                                           strbuildall.AppendLine('ans sun        0.0000000001820	0.0000000001620	-0.0000000001800\n');
                                           a3body(1) = athirdbody1(1);
                                           a3body(2) = athirdbody1(2);
                                           a3body(3) = athirdbody1(3);

                                           % moon
                                           mu3 = mumoon;
                                           rsat3(1) = rmoon(1) - reci(1);
                                           rsat3(2) = rmoon(2) - reci(2);
                                           rsat3(3) = rmoon(3) - reci(3);
                                           magrsat3 = mag(rsat3);
                                           rearth3(1) = rmoon(1);
                                           rearth3(2) = rmoon(2);
                                           rearth3(3) = rmoon(3);
                                           magrearth3 = mag(rearth3);
                                           athirdbody(1) = mu3 * (rsat3(1) / Math.Pow(magrsat3, 3) - rearth3(1) / Math.Pow(magrearth3, 3));
                                           athirdbody(2) = mu3 * (rsat3(2) / Math.Pow(magrsat3, 3) - rearth3(2) / Math.Pow(magrearth3, 3));
                                           athirdbody(3) = mu3 * (rsat3(3) / Math.Pow(magrsat3, 3) - rearth3(3) / Math.Pow(magrearth3, 3));
                                           strbuildall.AppendLine(' a3bodyM  eci ' + athirdbody(1), athirdbody(2), athirdbody(3));
                                           athirdbody2(1) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(1) - 3.0 * rearth3(1) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(1) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           athirdbody2(2) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(2) - 3.0 * rearth3(2) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(2) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           athirdbody2(3) = -mu3 / Math.Pow(magrearth3, 3) * (rearth3(3) - 3.0 * rearth3(3) * (dot(reci, rearth3) / Math.Pow(magrearth3, 2))
                                           - 7.5 * rearth3(3) * Math.Pow(((dot(reci, rearth3) / Math.Pow(magrearth3, 2))), 2));
                                           strbuildall.AppendLine(' a3bodyM2 eci' + athirdbody2(1), athirdbody2(2), athirdbody2(3));
                                           q = (Math.Pow(mag(reci), 2) + 2.0 * dot(reci, rsat3)) *
                                           (Math.Pow(magrearth3, 2) + magrearth3 * magrsat3 + Math.Pow(magrsat3, 2)) /
                                           (Math.Pow(magrearth3, 3) * Math.Pow(magrsat3, 3) * (magrearth3 + magrsat3));
                                           athirdbody1(1) = mu3 * (rsat3(1) * q - reci(1) / Math.Pow(magrearth3, 3));
                                           athirdbody1(2) = mu3 * (rsat3(2) * q - reci(2) / Math.Pow(magrearth3, 3));
                                           athirdbody1(3) = mu3 * (rsat3(3) * q - reci(3) / Math.Pow(magrearth3, 3));
                                           strbuildall.AppendLine(' a3bodyM1 eci' + athirdbody1(1), athirdbody1(2), athirdbody1(3));
                                           strbuildall.AppendLine('ans moon        0.0000000000860	-0.0000000004210	-0.0000000006980\n');
                                           a3body(1) = a3body(1) + athirdbody1(1);
                                           a3body(2) = a3body(2) + athirdbody1(2);
                                           a3body(3) = a3body(3) + athirdbody1(3);
                                           strbuildall.AppendLine('ans sun/moon    0.0000000002730	-0.0000000002680	-0.0000000008800\n');


                                           strbuildall.AppendLine(' ------------------ find srp acceleration\n');
                                           double psrp = 4.56e-6;  % N/m2 = kgm/s2 / m2 = kg/ms2
                                           rsatsun(1) = rsun(1) - reci(1);
                                           rsatsun(2) = rsun(2) - reci(2);
                                           rsatsun(3) = rsun(3) - reci(3);
                                           double magrsatsun = mag(rsatsun);
                                           %           kg/ms2      m2      kg      km            km
                                           asrp(1) = -(psrp * cr * area / mass * rsatsun(1) / magrsatsun) / 1000.0;  % result in km/s
                                           asrp(2) = -(psrp * cr * area / mass * rsatsun(2) / magrsatsun) / 1000.0;
                                           asrp(3) = -(psrp * cr * area / mass * rsatsun(3) / magrsatsun) / 1000.0;
                                           strbuildall.AppendLine(' asrp eci ' + asrp(1), asrp(2), asrp(3));
                                           strbuildall.AppendLine('ans srp        -0.0000000001970	0.0000000001150	0.0000000000480\n');

                                           strbuildall.AppendLine(' ------------------ add perturbing accelerations\n');
                                           aecef(1) = adrag(1);  % plus gravity xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                                           aecef(2) = adrag(2);
                                           aecef(3) = adrag(3);
                                           strbuildall.AppendLine(' aecef ' + aecef(1), aecef(2), aecef(3));

                                           % ---- move acceleration from earth fixed coordinates to eci
                                           % there are no cross products here as unital
                                           aeci = matvecmult(transecef2eci, aecef, 3);
                                           strbuildall.AppendLine(' aeci ' + aeci(1), aeci(2), aeci(3));

                                           % find two body component of eci acceleration
                                           aeci2(1) = -gravConst.mu * reci(1) / (Math.Pow(mag(reci), 3));
                                           aeci2(2) = -gravConst.mu * reci(2) / (Math.Pow(mag(reci), 3));
                                           aeci2(3) = -gravConst.mu * reci(3) / (Math.Pow(mag(reci), 3));
                                           strbuildall.AppendLine(' aeci2body ' + aeci2(1), aeci2(2), aeci2(3));

                                           % totla acceleration
                                           aeci(1) = aeci2(1) + a3body(1) + asrp(1) + aeci(1);
                                           aeci(2) = aeci2(2) + a3body(2) + asrp(2) + aeci(2);
                                           aeci(3) = aeci2(3) + a3body(3) + asrp(3) + aeci(3);
                                           strbuildall.AppendLine('total aeci ' + aeci(1), aeci(2), aeci(3));




                                           % ------------------------------------------- timing comparisons
                                           strbuildall.AppendLine('\n ===================================== Timing Comparisons =====================================');
                                           % timing of routines
                                           var watch = System.Diagnostics.Stopwatch.StartNew();

                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 50;
                                               % unitalized calcs, show
                                               FullGeopM(recef, order, 'y', convArr, gravData, out aPertM, 'n', out straccum);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           var elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with Montenbruck calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');

                                           watch = System.Diagnostics.Stopwatch.StartNew();
                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 50;
                                               % unitalized calcs, show
                                               FullGeopG(recef, order, 'y', convArr, unitArr, gravData, out aPertG, 'n', out straccum);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with GTDS calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');


                                           watch = System.Diagnostics.Stopwatch.StartNew();
                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 100;
                                               % unitalized calcs, show
                                               % GTDS version
                                               LegPolyG(latgc, order, 'y', convArr, unitArr, out LegArrGU, out LegArrGN);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with GTDS ALF calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');


                                           watch = System.Diagnostics.Stopwatch.StartNew();
                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 100;
                                               % unitalized calcs, show
                                               % Gottlieb version
                                               LegPolyGot(latgc, order, 'y', convArr, unitArr, out LegArrGotU, out LegArrGotN);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with Gott ALF calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');

                                           watch = System.Diagnostics.Stopwatch.StartNew();
                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 100;
                                               % unitalized calcs, show
                                               % Montenbruck version
                                               LegPolyM(latgc, order, 'y', convArr, out LegArrMU, out LegArrMN);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with Mont ALF calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');


                                           watch = System.Diagnostics.Stopwatch.StartNew();
                                           for (i = 0; i < 500; i++)

                                               straccum = '';
                                               order = 100;
                                               % unitalized calcs, show
                                               % Fukushima version
                                               LegPolyF(latgc, order, 'y', unitArr, out LegArrF);
                                           end
                                           %  stop timer
                                           watch.Stop();
                                           elapsedMs = watch.ElapsedMilliseconds;
                                           strbuildall.AppendLine('Done with Fukushima ALF calcs ' + (watch.ElapsedMilliseconds * 0.001), ' sec  ');



                                           % ------------------------------------------- pole test case comparisons
                                           strbuildall.AppendLine('\n ===================================== Pole Test Comparisons =====================================');

                                           rad = 180.0 / pi;
                                           for (i = 0; i < 500; i++)

                                               lon = 154.0 / rad;
                                               latgc = (89.9 + (i / 1000.0)) / rad;
                                               double magr = 7378.382745;

                                               recef(1) = (magr * cos(latgc) * cos(lon));
                                               recef(2) = (magr * cos(latgc) * sin(lon));
                                               recef(3) = (magr * sin(latgc));

                                               straccum = '';
                                               order = 50;
                                               % unitalized calcs, show
                                               FullGeopG(recef, order, 'y', convArr, unitArr, gravData, out aPertG, 'n', out straccum);

                                               strbuildall.AppendLine('test pole ' + (latgc * rad), (lon * rad), aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                           end


                                           % available files:
                                           % GEM10Bununit36.grv
                                           % GEMT1unit36.grv
                                           % GEMT2unit36.grv
                                           % GEMT3unit36.grv
                                           % GEMT3unit50.grv
                                           % EGM-96unit70.grv
                                           % EGM-96unit254.grv
                                           % EGM-08unit100.grv
                                           % EGM-96unit70.grv
                                           % EGM-96unit70.grv
                                           % EGM-96unit70.grv
                                           % GGM01Cunit90.grv
                                           % GGM02Cunit90.grv
                                           % GGM03Cunit100.grv
                                           % JGM2unit70.grv
                                           % JGM3unit70.grv
                                           % WGS-84_EGM96unit70.grv
                                           % WGS-84Eunit180.grv
                                           % WGS-84unit70.grv
                                           %
                                           %string fname = 'D:\Dataorig\Gravity\EGM96A.TXT';       % unit
                                           %string fname = 'D:\Dataorig\Gravity\egm2008_gfc.txt';  % unit

                                           % --------------------gottlieb 1993 test
                                           strbuildall.AppendLine('===================================== Gottlieb 1993 test case ===================================== ');
                                           strbuildall.AppendLine('GEM-10B ununitalized 36x36 ');
                                           % get past text in each file
                                           %if (fname.Contains('GEM'))    % GEM10bununit36.grv, GEMT3unit50.grv
                                           %    startKtr = 17;
                                           %if (fname.Contains('EGM-96')) % EGM-96unit70.grv
                                           %    startKtr = 73;
                                           %if (fname.Contains('EGM-08')) % EGM-08unit100.grv
                                           %    startKtr = 83;  % or 21 for the larger file... which has gfc in the first col too
                                           fname = 'D:/Dataorig/Gravity/GEM10Bununit36.grv';
                                           unital = 'n';
                                           %double latgc;
                                           %Int32 degree, order;
                                           %double[,] LegArr;  % montenbruck
                                           %double[,] LegArrN;
                                           %double[,] LegArrG;  % gtds
                                           %double[,] LegArrGN;
                                           %%  double[,] LegArrEx;
                                           %double[,] LegArr1;  % geodyn

                                           %AstroLib.gravityModelData gravData;

                                           recef = [ 5489.1500, 802.2220, 3140.9160 ];  % km
                                           strbuildall.AppendLine('recef = ' + recef(1), recef(2), recef(3));
                                           % these are from the vector
                                           latgc = Math.Asin(recef(3) / mag(recef));
                                           double templ = sqrt(recef(1) * recef(1) + recef(2) * recef(2));
                                           double rtasc;
                                           if (Math.Abs(templ) < 0.0000001)
                                               rtasc = Math.Sign(recef(3)) * pi * 0.5;
                                           else
                                               rtasc = atan2(recef(2), recef(1));
                                               lon = rtasc;
                                               strbuildall.AppendLine('latgc lon ' + (latgc * rad), (lon * rad));

                                               this.opsStatus.Text = 'Status: Reading gravity field Gottlieb test';
                                               Refresh();

                                               initGravityField(fname, 17, unital, out order, out gravData, out convArr, out unitArr);
                                               strbuildall.AppendLine('\ncoefficents --------------- ');
                                               strbuildall.AppendLine('c  2  0  ' + gravData.c(3, 1), ' s ' + gravData.s(3, 1));
                                               strbuildall.AppendLine('c  4  0  ' + gravData.c(5, 1), ' s ' + gravData.s(5, 1));
                                               strbuildall.AppendLine('c  4  4  ' + gravData.c(5, 5), ' s ' + gravData.s(5, 5));
                                               strbuildall.AppendLine('c 21  1 ' + gravData.c[21, 1], ' s ' + gravData.s[21, 1]);
                                               strbuildall.AppendLine('\nunitalized coefficents --------------- ');
                                               strbuildall.AppendLine('c  2  0  ' + gravData.cNor(3, 1), ' s ' + gravData.sNor(3, 1));
                                               strbuildall.AppendLine('c  4  0  ' + gravData.cNor(5, 1), ' s ' + gravData.sNor(5, 1));
                                               strbuildall.AppendLine('c  4  4  ' + gravData.cNor(5, 5), ' s ' + gravData.sNor(5, 5));
                                               strbuildall.AppendLine('c 21  1 ' + gravData.cNor[21, 1], ' s ' + gravData.sNor[21, 1]);

                                               this.opsStatus.Text = 'Status: Gottlieb test legpoly calcs';
                                               Refresh();

                                               degree = 36;  % 36
                                               order = 36;
                                               LegPolyG(latgc, order, unitalized, convArr, unitArr, out LegArrGU, out LegArrGN);
                                               LegPolyM(latgc, order, unitalized, convArr, out LegArrMU, out LegArrMN);
                                               % get geodyn version
                                               geodynlegp(latgc, degree, order, out LegArrOU, out LegArrON);
                                               % get exact values
                                               % LegPolyEx(latgc, order, out LegArrEx);

                                               errstr = ' ';
                                               sumdr1 = 0.0;
                                               sumdr2 = 0.0;
                                               strbuildall.AppendLine('\nLegendre polynomials --------------- ');
                                               for (L = 1; L <= 6; L++)  % order xxxxxxxxxxxxxxxxxx

                                                   string tempstr1 = 'MN ';  % montenbruck
                                                   string tempstr2 = 'GN ';  % gtds
                                                   string tempstr3 = 'MU ';
                                                   string tempstr4 = 'OU ';  % geodyn
                                                   for (m = 0; m <= L; m++)

                                                       tempstr1 = tempstr1, L, '  ' + m, '   ' + LegArrMN[L, m];
                                                       tempstr2 = tempstr2, L, '  ' + m, '   ' + LegArrGN[L, m];
                                                       tempstr3 = tempstr3, L, '  ' + m, '   ' + LegArrMU[L, m];
                                                       tempstr4 = tempstr4, L, '  ' + m, '   ' + LegArrOU[L + 1, m + 1];
                                                       %dr1 = 100.0 * (LegArr[L, m] - LegArrEx[L, m]) / LegArrEx[L, m];
                                                       %dr2 = 100.0 * (LegArr1[L, m] - LegArrEx[L, m]) / LegArrEx[L, m];
                                                       %sumdr1 = sumdr1 + dr1;
                                                       %sumdr2 = sumdr2 + dr2;
                                                       %errstr = errstr + '\n' + L, '  ' + m, '   ' + dr1
                                                       %   , dr2;
                                                   end
                                                   strbuildall.AppendLine(tempstr1);
                                                   strbuildall.AppendLine(tempstr2);
                                                   %  fprintf(1,tempstr3);
                                                   strbuildall.AppendLine(tempstr4 + '\n');
                                               end
                                               strbuildall.AppendLine('totals gtds ' + sumdr1, ' montenbruck ' + sumdr2);
                                               strbuildplot.AppendLine(errstr);

                                               strbuildall.AppendLine('\naccelerations --------------- ');
                                               jdutc = 2451573.0;
                                               jdF = 0.1;
                                               straccum = '';
                                               order = 4;
                                               % unitalized calcs, show
                                               FullGeopM(recef, order, 'y', convArr, gravData, out aPertM, 'y', out straccum);
                                               % add in two body term since full geop is only disturbing part
                                               jdut1 = jdutc + jdF;
                                               %eci_ecef(ref reci, ref veci, iau80arr, MathTimeLib.Edirection.efrom, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps, AstroLib.EOpt.e80, ref recef, ref vecef);
                                               % time is not given, so let ecef and eci be =
                                               reci(1) = recef(1);
                                               reci(2) = recef(2);
                                               reci(3) = recef(3);

                                               aeci2(1) = -398600.47 * reci(1) / (Math.Pow(mag(reci), 3));
                                               aeci2(2) = -398600.47 * reci(2) / (Math.Pow(mag(reci), 3));
                                               aeci2(3) = -398600.47 * reci(3) / (Math.Pow(mag(reci), 3));
                                               %aPertG(1) = aPertG(1) + aeci2(1);
                                               %aPertG(2) = aPertG(2) + aeci2(2);
                                               %aPertG(3) = aPertG(3) + aeci2(3);
                                               aPertM(1) = aPertM(1) + aeci2(1);
                                               aPertM(2) = aPertM(2) + aeci2(2);
                                               aPertM(3) = aPertM(3) + aeci2(3);


                                               strbuildall.AppendLine(straccum);
                                               %   fprintf(1,'apertG 4 4   ' + aPertG(1), '     ' + aPertG(2), '     ' + aPertG(3));
                                               strbuildall.AppendLine('apertM 4 4   ' + aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                               strbuildall.AppendLine('ans          -0.00844269212018857E+00 -0.00123393633785485E+00 -0.00484659352346614E+00  km/s2  \n');

                                               straccum = '';
                                               order = 5;
                                               % unitalized calcs, show
                                               FullGeopG(recef, order, 'y', convArr, unitArr, gravData, out aPertG, 'y', out straccum);
                                               strbuildall.AppendLine(straccum);
                                               strbuildall.AppendLine('apertG 5 5   ' + aPertG(1), '     ' + aPertG(2), '     ' + aPertG(3));
                                               % fprintf(1,'apertM 5 5   ' + aPertM(1), '     ' + aPertM(2), '     ' + aPertM(3));
                                               strbuildall.AppendLine('ans          -0.00844260633555472E+00 -0.00123393243051834E+00 -0.00484652486332608E+00  km/s2  \n');



                                               % --------------------fonte 1993 test
                                               % fprintf(1,'\n ===================================== Fonte 1993 test case =====================================');
                                               % fprintf(1,'GEM-10B ununitalized 36x36 ');
                                               % fname = 'D:/Dataorig/Gravity/GEM10Bununit36.grv';
                                               % unital = 'n';
                                               % recef = [ 180.295260378399, -1145.13224944286, -6990.09446227757 ]; % km
                                               % fprintf(1,'recef = ' + recef(1), recef(2), recef(3));
                                               % latgc = -1.40645188850273;
                                               % lon = -4.09449590512370;
                                               % fprintf(1,'latgc lon ' + (latgc * rad), (lon * rad));

                                               % this.opsStatus.Text = 'Status: Reading gravity field Fonte test';
                                               % Refresh();

                                               % % Un-unitalized Polynomial Validation GEM10B
                                               % % GTDS vs Lundberg Truth GTDS (21x21 GEM10B)
                                               % fprintf(1,'\ncoefficients --------------- ');
                                               % initGravityField(fname, unital, out gravData);
                                               % fprintf(1,'c  4  0    ' + gravData.c(5, 1), ' s ' + gravData.s(5, 1));
                                               % fprintf(1,'c 21  0   ' + gravData.c[21, 0], ' s ' + gravData.s[21, 0]);
                                               % fprintf(1,'c 21  5    ' + gravData.c[21, 5], ' s ' + gravData.s[21, 5]);
                                               % fprintf(1,'c 21 20   ' + gravData.c[21, 20], ' s ' + gravData.s[21, 20]);
                                               % fprintf(1,'c 21 21    ' + gravData.c[21, 21], ' s ' + gravData.s[21, 21]);

                                               % % GTDS Emulation vs Lundberg Truth (21x21 GEM10B)
                                               % degree = 21;
                                               % order = 21;
                                               % LegPoly(latgc, order, out LegArr, out LegArrG, out LegArrN, out LegArrGN);
                                               % % get geodyn version
                                               % geodynlegp(latgc, degree, order, out LegArr1);
                                               % % get exact values
                                               % %   LegPolyEx(latgc, order, out LegArrEx);

                                               % dr1 = 0.0;
                                               % dr2 = 0.0;
                                               % sumdr1 = 0.0;
                                               % sumdr2 = 0.0;
                                               % fprintf(1,'\nLegendre polynomials --------------- ');
                                               % for (L = 1; L <= 6; L++)  % order
                                               %
                                               %     string tempstr1 = 'M ';
                                               %     string tempstr2 = 'G ';
                                               %     string tempstr3 = 'E ';
                                               %     string tempstr4 = 'O ';
                                               %     for (m = 0; m <= L; m++)
                                               %
                                               %         tempstr1 = tempstr1, L, '  ' + m, '   ' + LegArrN[L, m];
                                               %         tempstr2 = tempstr2, L, '  ' + m, '   ' + LegArrGN[L, m];
                                               %         % tempstr3 = tempstr3, L, '  ' + m, '   ' + LegArrEx[L, m];
                                               %         tempstr4 = tempstr4, L, '  ' + m, '   ' + LegArr1[L + 1, m + 1];
                                               %         %    dr1 = 100.0 * (LegArr[L, m] - LegArrEx[L, m]) / LegArrEx[L, m];
                                               %         %    dr2 = 100.0 * (LegArr1[L, m] - LegArrEx[L, m]) / LegArrEx[L, m];
                                               %         %sumdr1 = sumdr1 + dr1;
                                               %         %sumdr2 = sumdr2 + dr2;
                                               %         %errstr = errstr + '\n' + L, '  ' + m, '   ' + dr1
                                               %         %   , dr2;
                                               %     end
                                               %     fprintf(1,tempstr1);
                                               %     fprintf(1,tempstr2);
                                               %    % fprintf(1,tempstr3);
                                               %     fprintf(1,tempstr4 + '\n');
                                               % end
                                               %% fprintf(1,'totals gtds ' + sumdr1, ' montenbruck ' + sumdr2);
                                               % fprintf(1,'ans 21  0 0.385389365005720                                                                      21  5   354542.107743601  354542.1077435970657340');
                                               % fprintf(1,'ans 21 20         -2442182686.11423  -2442182686.11409981594');
                                               % fprintf(1,'ans 21 21          405012060.632803  405012060.6327805324689' + '\n');

                                               % fprintf(1,'\naccelerations --------------- ');
                                               % FullGeop(recef, jd, jdF, order, gravData, out aPert, out aPert1);

                                               % fprintf(1,'apertG 21 21   ' + aPert(1), aPert(2), aPert(3));
                                               % fprintf(1,'apertM 21 21   ' + aPert1(1), '     ' + aPert1(2), '     ' + aPert1(3));
                                               % fprintf(1,'ans             8.653210294968294E-7  -6.515584998975128E-6  -1.931032474628621E-5 ');
                                               % fprintf(1,'ans             8.653210294968E-7     -6.5155849989750E-6    -1.931032474628616E-5');

                                               % % --------------------fonte 1993 test
                                               % fprintf(1,'\n===================================== Fonte 1993 test case =====================================');
                                               % fprintf(1,'GEM-T3 unitalized 50x50 ');
                                               % fname = 'D:/Dataorig/Gravity/GEMT3unit50.grv';          % unit only released as 36x36 though...
                                               % unital = 'y';

                                               % this.opsStatus.Text = 'Status: Reading gravity field fonte 93 test';
                                               % Refresh();

                                               % initGravityField(fname, unital, out gravData);
                                               % fprintf(1,'\ncoefficients --------------- ');
                                               % fprintf(1,'c  4  0   ' + gravData.c(5, 1), gravData.s(5, 1));
                                               % fprintf(1,'c 21 20   ' + gravData.c[21, 20], gravData.s[21, 20]);
                                               % fprintf(1,'c 50  0   ' + gravData.c[50, 0], gravData.s[50, 0]);
                                               % fprintf(1,'c 50 50   ' + gravData.c[50, 50], gravData.s[50, 50]);
                                               % fprintf(1,'c 50  5   ' + gravData.c[50, 5], gravData.s[50, 5]);

                                               % fprintf(1,'\nLegendre polynomials --------------- ');
                                               % % GTDS Emulation vs Lundberg Truth (21x21 GEM10B)
                                               % degree = 50;
                                               % order = 50;

                                               % LegPoly(latgc, order, out LegArr, out LegArrG, out LegArrN, out LegArrGN);
                                               % % get geodyn version
                                               % geodynlegp(latgc, degree, order, out LegArr1);
                                               % % get exact
                                               % %  LegPolyEx(latgc, order, out LegArrEx);

                                               % fprintf(1,'legarr4    0   ' + LegArrN(5, 1), LegArrN(5, 2));

                                               % fprintf(1,'50  0          ' + LegArrN[50, 0]);
                                               % fprintf(1,'50  0 alt      ' + LegArrGN[50, 0]);
                                               % fprintf(1,'ans 50  0      0.09634780379822722     9.634780379823085162E-02');
                                               % fprintf(1,'50  0 geody    ' + LegArr1[50, 0], '\n');
                                               % %   fprintf(1,'50  0 exact    ' + LegArrEx[50, 0], '\n');
                                               % %    fprintf(1,'50  0 exact    ' + LegArrEx[50, 0], '\n');

                                               % fprintf(1,'50 21       ' + LegArrN[50, 21]);
                                               % fprintf(1,'50 21 alt   ' + LegArrGN[50, 21]);
                                               % fprintf(1,'ans 50  21  -1.443200082785759E+28  -14432000827857661203015450149.6553');
                                               % fprintf(1,'50 21 geody ' + LegArr1[50, 21], '\n');
                                               % %   fprintf(1,'50 21 exact  ' + LegArrEx[50, 21], '\n');

                                               % fprintf(1,'50 49       ' + LegArrN[50, 49]);
                                               % fprintf(1,'50 49 alt   ' + LegArrGN[50, 49]);
                                               % fprintf(1,'ans 50  49  -8.047341511222794E+39  -8.047341511222872818E+39');
                                               % fprintf(1,'50 49 geody ' + LegArr1[50, 49], '\n');
                                               % % fprintf(1,'50 49 exact ' + ex5049, '\n');

                                               % fprintf(1,'50 50       ' + LegArrN[50, 50]);
                                               % fprintf(1,'50 50 alt   ' + LegArrGN[50, 50]);
                                               % fprintf(1,'ans 50 50      1.334572710963763E+39   1.334572710963775698E+39' + '\n');
                                               % fprintf(1,'50 50 geody ' + LegArr1[50, 50], '\n');
                                               % %fprintf(1,'50 50 exact ' + ex550, '\n');

                                               % fprintf(1,'\naccelerations --------------- ');
                                               % unitalized calcs, show
                                               % FullGeop(recef, order, unitalized, gravData, out aPert, out aPert1);
                                               % fprintf(1,'apert 50 50   ' + aPert(1), aPert(2), aPert(3));
                                               % fprintf(1,'ans           8.683465146150188E-007    -6.519678538340073E-006   -1.931876804829165E-005');
                                               % fprintf(1,'ans           8.68346514615019361E-07   -6.51967853834008023E-06  -1.93187680482916393E-05');

                                               % recef = [ 487.0696937, -5330.5022406, 4505.7372146 ];  % m
                                               % vecef = [ -2.101083975, 4.624581986, 5.688300377 ];

                                               % write out results
                                               string directory = @'d:\codes\library\matlab\';
                                               File.WriteAllText(directory + 'legpoly.txt', strbuildall);

                                               File.WriteAllText(directory + 'legendreAcc.txt', strbuildplot);

                                           end

                                           function testhill()

                                               r, v, rh, vh, rint, vint;
                                               double alt, dts;
                                               r = new double(4);
                                               v = new double(4);
                                               rh = new double(4);
                                               vh = new double(4);
                                               % StringBuilder strbuild = new StringBuilder();

                                               dts = 1400.0; % sec

                                               % circular orbit
                                               alt = 590.0;
                                               r(1) = gravConst.re + alt;
                                               r(2) = 0.0;
                                               r(3) = 0.0;
                                               v(1) = 0.0;
                                               v(2) = sqrt(gravConst.mu / mag(r));
                                               v(3) = 0.0;

                                               rh(1) = 0.0;
                                               rh(2) = 0.0;
                                               rh(3) = 0.0;
                                               vh(1) = -0.1;
                                               vh(2) = -0.04;
                                               vh(3) = -0.02;

                                               for (i = 1; i <= 50; i++)

                                                   dts = i * 60.0;  % sec
                                                   hillsr(rh, vh, alt, dts, out rint, out vint);
                                                   fprintf(1,dts, rint(1), rint(2), rint(3),
                                                   ' ' + vint(1), vint(2), vint(3));
                                               end


                                               hillsv(r, alt, dts, out vint);



                                           end  % test hill


                                           /* ----------------------------------------------------------------------------
                                           *
                                           *                                 function printcov
                                               *
                                               * this function prints a covariance matrix
                                                   *
                                                   * author        : david vallado                  719 - 573 - 2600   23 may 2003
                                                   *
                                                   * revisions
                                                   *
                                                   * inputs description range / units
                                                   *   covin     - 6x6 input covariance matrix
                                                   *   covtype   - type of covariance             'cl','ct','fl','sp','eq',
                                                   *   cu        - covariance units(deg or rad)  't' or 'm'
                                                   *   anom      - anomaly                        'mean' or 'true' or 'tau'
                                                   *
                                                   * outputs       :
                                                   *
                                                   * locals        :
                                                   *
                                                   * references    :
                                                   * none
                                                   *
                                                   * printcov(covin, covtype, cu, anom)
                                                   * ----------------------------------------------------------------------------*/

                                                   function printcov(double[,] covin, string covtype, char cu, string anom, out string strout)

                                                       i;
                                                       string semi = '';
                                                       strout = '';

                                                       if (anom.Equals('truea') || anom.Equals('meana'))
                                                           semi = 'a m  ';
                                                       else

                                                           if (anom.Equals('truen') || anom.Equals('meann'))
                                                               semi = 'n rad';
                                                           end

                                                           if (covtype.Equals('ct'))

                                                               strout = 'cartesian covariance \n';
                                                               strout = strout + '        x  m            y m             z  m           xdot  m/s       ydot  m/s       zdot  m/s  \n';
                                                           end

                                                           if (covtype.Equals('cl'))

                                                               strout = strout + 'classical covariance \n';
                                                               if (cu == 'm')

                                                                   strout = strout + '          ' + semi + '          ecc           incl rad      raan rad         argp rad        ';
                                                                   if (anom.Contains('mean')) % 'meana' 'meann'
                                                                       strout = strout + 'm rad \n';
                                                                   else     % 'truea' 'truen'
                                                                       strout = strout + ' nu rad \n';
                                                                   end
                                                               else

                                                                   strout = strout + '          ' + semi + '           ecc           incl deg      raan deg         argp deg        ';
                                                                   if (anom.Contains('mean')) % 'meana' 'meann'
                                                                       strout = strout + ' m deg \n';
                                                                   else     % 'truea' 'truen'
                                                                       strout = strout + ' nu deg \n';
                                                                   end
                                                               end

                                                               if (covtype.Equals('eq'))

                                                                   strout = strout + 'equinoctial covariance \n';
                                                                   %            if (cu == 'm')
                                                                   if (anom.Contains('mean')) % 'meana' 'meann'
                                                                       strout = strout + '         ' + semi + '           af              ag           chi             psi         meanlonM rad\n';
                                                                   else     % 'truea' 'truen'
                                                                       strout = strout + '         ' + semi + '           af              ag           chi             psi         meanlonNu rad\n';
                                                                   end

                                                                   if (covtype.Equals('fl'))

                                                                       strout = strout + 'flight covariance \n';
                                                                       strout = strout + '       lon  rad      latgc rad        fpa rad         az rad           r  m           v  m/s  \n';
                                                                   end

                                                                   if (covtype.Equals('sp'))

                                                                       strout = strout + 'spherical covariance \n';
                                                                       strout = strout + '      rtasc deg       decl deg        fpa deg         az deg           r  m           v  m/s  \n';
                                                                   end

                                                                   % format strings to show signs 'and' to not round off if trailing 0!!
                                                                   string fmt = '+#.#########0E+00;-#.#########0E+00';
                                                                   for (i = 0; i < 6; i++)
                                                                       strout = strout + covin[i, 0], covin[i, 1], covin[i, 2],
                                                                       covin[i, 3], covin[i, 4], covin[i, 5],'\n';
                                                                   end  % printcov


                                                                   /* ----------------------------------------------------------------------------
                                                                   *
                                                                   *                                  function printdiff
                                                                       *
                                                                       * this function prints a covariance matrix difference
                                                                           *
                                                                           * author        : david vallado                  719 - 573 - 2600   23 may 2003
                                                                           *
                                                                           * revisions
                                                                           *
                                                                           * inputs description range / units
                                                                           *   strin    - title
                                                                           *   mat1     - 6x6 input matrix
                                                                           *   mat2     - 6x6 input matrix
                                                                           *
                                                                           * outputs       :
                                                                           *
                                                                           * locals        :
                                                                           *
                                                                           * ----------------------------------------------------------------------------*/

                                                                           function printdiff(string strin, double[,] mat1, double[,] mat2, out string strout)

                                                                               double small = 1e-18;
                                                                               double[,] dr = new double[6, 6];
                                                                               double[,] diffmm = new double[6, 6];
                                                                               i, j;

                                                                               % format strings to show signs 'and' to not round off if trailing 0!!
                                                                               string fmt = '+#.#########0E+00;-#.#########0E+00';

                                                                               strout = 'diff ' + strin + '\n';
                                                                               for (i = 0; i < 6; i++)

                                                                                   for (j = 0; j < 6; j++)
                                                                                       dr[i, j] = mat1[i, j] - mat2[i, j];
                                                                                       strout = strout + dr[i, 0], dr[i, 1], dr[i, 2],
                                                                                       dr[i, 3], dr[i, 4], dr[i, 5],'\n';
                                                                                   end

                                                                                   strout = strout + 'pctdiff % ' + strin + ' pct over 1e-18  \n';
                                                                                   % fprintf(1, '%14.4f%14.4f%14.4f%14.4f%14.4f%14.4f \n', 100.0 * ((mat1' - mat2') / mat1'));
                                                                                   % fprintf(1, 'Check consistency of both approaches tmct2cl-inv(tmcl2ct) diff pct over 1e-18 \n');
                                                                                   % fprintf(1, '-------- accuracy of tm comparing ct2cl and cl2ct --------- \n');
                                                                                   %tm1 = mat1';
                                                                                   %tm2 = mat2';
                                                                                   fmt = '+0.###0;-0.###0';
                                                                                   for (i = 0; i < 6; i++)

                                                                                       for (j = 0; j < 6; j++)

                                                                                           if (Math.Abs(dr[i, j]) < small || Math.Abs(mat1[i, j]) < small)
                                                                                               diffmm[i, j] = 0.0;
                                                                                           else
                                                                                               diffmm[i, j] = 100.0 * (dr[i, j] / mat1[i, j]);
                                                                                           end
                                                                                           strout = strout + diffmm[i, 0], diffmm[i, 1], diffmm[i, 2],
                                                                                           diffmm[i, 3], diffmm[i, 4], diffmm[i, 5],'\n';
                                                                                       end

                                                                                   end  % printdiff



                                                                                   function testcovct2rsw()

                                                                                       year, mon, day, hr, minute, timezone, dat, terms;
                                                                                       double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
                                                                                       double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
                                                                                       double af, ag, chi, psi, meanlonNu, meanlonM;
                                                                                       double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
                                                                                       Int16 fr;
                                                                                       tm = [  0, 0, 0, 0, 0, 0 ;  0, 0, 0, 0, 0, 0 ;  0, 0, 0, 0, 0, 0 ; ...
                                                                                           0, 0, 0, 0, 0, 0  ; 0, 0, 0, 0, 0, 0  ; 0, 0, 0, 0, 0, 0 ];
                                                                                       string anom = 'meana';  % truea/n, meana/n
                                                                                       string anomflt = 'latlon'; % latlon  radec
                                                                                       cartstate = new double(7);
                                                                                       recef = new double(4);
                                                                                       vecef = new double(4);
                                                                                       avec = new double(4);

                                                                                       double[,] cartcovrsw = new double[6, 6];
                                                                                       double[,] cartcovntw = new double[6, 6];
                                                                                       double[,] tmct2cl = new double[6, 6];
                                                                                       double[,] tmcl2ct = new double[6, 6];
                                                                                       string strout;

                                                                                       reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
                                                                                       veci = [ -1.56825429, -3.70234891, -6.47948395 ];
                                                                                       aeci = [ 0.001, 0.002, 0.003 ];

                                                                                       % StringBuilder strbuild = new StringBuilder();
                                                                                       % strbuild.Clear();

                                                                                       nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                                                                       [iau80arr] = iau80in(nutLoc);
                                                                                       nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                                                                       [iau06arr] = iau06in(nutLoc);
                                                                                       % now read it in
                                                                                       double jdxysstart, jdfxysstart;
                                                                                       AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

                                                                                       year = 2000;
                                                                                       mon = 12;
                                                                                       day = 15;
                                                                                       hr = 16;
                                                                                       minute = 58;
                                                                                       sec = 50.208;
                                                                                       dut1 = 0.10597;
                                                                                       dat = 32;
                                                                                       timezone = 0;
                                                                                       xp = 0.0;
                                                                                       yp = 0.0;
                                                                                       lod = 0.0;
                                                                                       terms = 2;
                                                                                       timezone = 0;
                                                                                       ddpsi = 0.0;
                                                                                       ddeps = 0.0;
                                                                                       ddx = 0.0;
                                                                                       ddy = 0.0;

                                                                                       [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac] ...
                                                                                           = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
                                                                                       convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
                                                                                       out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
                                                                                       out tt, out ttt, out jdtt, out jdttfrac,
                                                                                       out tdb, out ttdb, out jdtdb, out jdtdbfrac);

                                                                                       year = 2004;
                                                                                       mon  =   5;
                                                                                       day  =  14;
                                                                                       hr   =  10;
                                                                                       min  =  43;
                                                                                       sec  =   0.0;
                                                                                       dut1 = -0.463326;
                                                                                       dat  = 32;
                                                                                       xp   =  0.0;
                                                                                       yp   =  0.0;
                                                                                       lod  =  0.0;
                                                                                       timezone= 6;

                                                                                       % -------- convtime    - convert time from utc to all the others
                                                                                       %, tcg, jdtcg,jdtcgfrac, tcb, jdtcb,jdtcbfrac
                                                                                       [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac] ...
                                                                                           = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );

                                                                                       fprintf(1,'ut1 %8.6f tut1 %16.12f jdut1 %18.11f\n',ut1,tut1,jdut1+jdut1frac );
                                                                                       fprintf(1,'utc %8.6f\n',utc );
                                                                                       fprintf(1,'tai %8.6f\n',tai );
                                                                                       fprintf(1,'tt  %8.6f ttt  %16.12f jdtt  %18.11f\n',tt,ttt,jdtt + jdttfrac );
                                                                                       fprintf(1,'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n',tdb,ttdb,jdtdb + jdtdbfrac );


                                                                                       % ---convert the eci state into the various other state formats(classical, equinoctial, etc)
                                                                                       cartcov = [ ...
                                                                                           100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4 ;...
                                                                                           1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4;...
                                                                                           1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4;...
                                                                                           1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6;...
                                                                                           1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6;...
                                                                                           1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001];
                                                                                       cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km


                                                                                       % test position and velocity going back
                                                                                       avec = [ 0.0, 0.0, 0.0 ];

                                                                                       eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
                                                                                       AstroLib.EOpt.e80, iau80arr, iau06arr,
                                                                                       jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);

                                                                                       fprintf(1,'==================== do the sensitivity tests \n');
                                                                                       fprintf(1,'1.  Cartesian Covariance \n');
                                                                                       printcov(cartcov, 'ct', 'm', anom, out strout);
                                                                                       fprintf(1,strout);

                                                                                       fprintf(1,'2.  RSW Covariance from Cartesian #1 above  ------------------- \n');
                                                                                       covct_rsw(ref cartcov, cartstate, MathTimeLib.Edirection.eto, ref cartcovrsw, out tmct2cl);
                                                                                       printcov(cartcovrsw, 'ct', 'm', anom, out strout);
                                                                                       fprintf(1,strout);

                                                                                       fprintf(1,'2.  NTW Covariance from Cartesian #1 above  ------------------- \n');
                                                                                       covct_ntw(ref cartcov, cartstate, MathTimeLib.Edirection.eto, ref cartcovntw, out tmct2cl);
                                                                                       printcov(cartcovntw, 'ct', 'm', anom, out strout);
                                                                                       fprintf(1,strout);
                                                                                       fprintf(1,'\n');
                                                                                   end


                                                                                   function testcovct2ntw()


                                                                                   end


                                                                                   % test eci_ecef too
                                                                                   function testcovct2clmean()

                                                                                       year, mon, day, hr, minute, timezone, dat, terms;
                                                                                       double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
                                                                                       double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
                                                                                       double af, ag, chi, psi, meanlonNu, meanlonM;
                                                                                       double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
                                                                                       Int16 fr;
                                                                                       double[,] tm = new double[,]   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0
                                                                                       0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0 end ];
                                                                                   string anom = 'meana';  % truea/n, meana/n
                                                                                   string anomflt = 'latlon'; % latlon  radec
                                                                                   cartstate = new double(7);
                                                                                   classstate = new double(7);
                                                                                   eqstate = new double(7);
                                                                                   fltstate = new double(7);
                                                                                   recef = new double(4);
                                                                                   vecef = new double(4);
                                                                                   avec = new double(4);

                                                                                   double[,] classcovmeana = new double[6, 6];
                                                                                   double[,] cartcovmeanarev = new double[6, 6];
                                                                                   double[,] tmct2cl = new double[6, 6];
                                                                                   double[,] tmcl2ct = new double[6, 6];
                                                                                   string strout;

                                                                                   reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
                                                                                   veci = [ -1.56825429, -3.70234891, -6.47948395 ];
                                                                                   aeci = [ 0.001, 0.002, 0.003 ];

                                                                                   % StringBuilder strbuild = new StringBuilder();
                                                                                   % strbuild.Clear();

                                                                                   nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                                                                   [iau80arr] = iau80in(nutLoc);
                                                                                   nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                                                                                   [iau06arr] = iau06in(nutLoc);
                                                                                   % now read it in
                                                                                   double jdxysstart, jdfxysstart;
                                                                                   AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

                                                                                   year = 2000;
                                                                                   mon = 12;
                                                                                   day = 15;
                                                                                   hr = 16;
                                                                                   minute = 58;
                                                                                   sec = 50.208;
                                                                                   dut1 = 0.10597;
                                                                                   dat = 32;
                                                                                   timezone = 0;
                                                                                   xp = 0.0;
                                                                                   yp = 0.0;
                                                                                   lod = 0.0;
                                                                                   terms = 2;
                                                                                   timezone = 0;
                                                                                   ddpsi = 0.0;
                                                                                   ddeps = 0.0;
                                                                                   ddx = 0.0;
                                                                                   ddy = 0.0;

                                                                                   convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
                                                                                   out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
                                                                                   out tt, out ttt, out jdtt, out jdttfrac,
                                                                                   out tdb, out ttdb, out jdtdb, out jdtdbfrac);

                                                                                   % ---convert the eci state into the various other state formats(classical, equinoctial, etc)
                                                                                   cartcov = [
                                                                                       100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4 ; ...
                                                                                       1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4; ...
                                                                                       1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4; ...
                                                                                       1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6; ...
                                                                                       1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6; ...
                                                                                       1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001 ];
                                                                                   cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km

                                                                                   % --------convert to a classical orbit state
                                                                                   rv2coe(reci, veci,
                                                                                   out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                                                                                   classstate(1) = a;   % km
                                                                                   classstate(2) = ecc;
                                                                                   classstate(3) = incl;
                                                                                   classstate(4) = raan;
                                                                                   classstate(5) = argp;
                                                                                   if (anom.Contains('mean')) % meann or meana
                                                                                       classstate(6) = m;
                                                                                   else  % truea or truen
                                                                                       classstate(6) = nu;

                                                                                       % -------- convert to an equinoctial orbit state
                                                                                       rv2eq(reci, veci, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
                                                                                       if (anom.Equals('meana') || anom.Equals('truea'))
                                                                                           eqstate(1) = a;  % km
                                                                                       else % meann or truen
                                                                                           eqstate(1) = n;
                                                                                           eqstate(2) = af;
                                                                                           eqstate(3) = ag;
                                                                                           eqstate(4) = chi;
                                                                                           eqstate(5) = psi;
                                                                                           if (anom.Contains('mean')) %  meana or meann
                                                                                               eqstate(6) = meanlonM;
                                                                                           else % truea or truen
                                                                                               eqstate(6) = meanlonNu;

                                                                                               % --------convert to a flight orbit state
                                                                                               rv2flt(reci, veci, jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, terms, ddpsi, ddeps, ddx, ddy,
                                                                                               iau80arr, iau06arr,
                                                                                               out lon, out latgc, out rtasc, out decl, out fpa, out az, out magr, out magv);
                                                                                               if (anomflt.Equals('radec'))

                                                                                                   fltstate(1) = rtasc;
                                                                                                   fltstate(2) = decl;
                                                                                               end
                                                                                           else
                                                                                               if (anomflt.Equals('latlon'))

                                                                                                   fltstate(1) = lon;
                                                                                                   fltstate(2) = latgc;
                                                                                               end
                                                                                               fltstate(3) = fpa;
                                                                                               fltstate(4) = az;
                                                                                               fltstate(5) = magr;  % km
                                                                                               fltstate(6) = magv;

                                                                                               % test position and velocity going back
                                                                                               avec = [ 0.0, 0.0, 0.0 ];

                                                                                               eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
                                                                                               AstroLib.EOpt.e80, iau80arr, iau06arr,
                                                                                               jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
                                                                                               %vx = magv* ( -cos(lon)*sin(latgc)*cos(az)*cos(fpa) - sin(lon)*sin(az)*cos(fpa) + cos(lon)*cos(latgc)*sin(fpa) );
                                                                                               %vy = magv* ( -sin(lon)*sin(latgc)*cos(az)*cos(fpa) + cos(lon)*sin(az)*cos(fpa) + sin(lon)*cos(latgc)*sin(fpa) );
                                                                                               %vz = magv* (sin(latgc) * sin(fpa) + cos(latgc)*cos(az)*cos(fpa) );
                                                                                               %% correct:
                                                                                               %ve1 = magv* ( -cos(rtasc)*sin(decl)*cos(az)*cos(fpa) - sin(rtasc)*sin(az)*cos(fpa) + cos(rtasc)*cos(decl)*sin(fpa) ); % m/s
                                                                                               % ve2 = magv* (-sin(rtasc) * sin(decl) * cos(az) * cos(fpa) + cos(rtasc) * sin(az) * cos(fpa) + sin(rtasc) * cos(decl) * sin(fpa));
                                                                                               %ve3 = magv* (sin(decl) * sin(fpa) + cos(decl)*cos(az)*cos(fpa) );

                                                                                               fprintf(1,'==================== do the sensitivity tests \n');

                                                                                               fprintf(1,'1.  Cartesian Covariance \n');
                                                                                               printcov(cartcov, 'ct', 'm', anom, out strout);
                                                                                               fprintf(1,strout);

                                                                                               fprintf(1,'2.  Classical Covariance from Cartesian #1 above (' + anom + ') ------------------- \n');

                                                                                               covct2cl(cartcov, cartstate, anom, out classcovmeana, out tmct2cl);
                                                                                               printcov(classcovmeana, 'cl', 'm', anom, out strout);
                                                                                               fprintf(1,strout);

                                                                                               fprintf(1,'  Cartesian Covariance from Classical #2 above \n');
                                                                                               covcl2ct(classcovmeana, classstate, anom, out cartcovmeanarev, out tmcl2ct);
                                                                                               printcov(cartcovmeanarev, 'ct', 'm', anom, out strout);
                                                                                               fprintf(1,strout);
                                                                                               fprintf(1,'\n');

                                                                                               printdiff(' cartcov - cartcovmeanarev \n', cartcov, cartcovmeanarev, out strout);
                                                                                               fprintf(1,strout);

                                                                                               double[,] ecefcartcov = new double[6, 6];

                                                                                               %coveci_ecef(ref cartcov, cartstate, MathTimeLib.Edirection.eto,  ref ecefcartcov, out tm, iau80arr,
                                                                                               %            ttt, jdut1, lod, xp, yp, 2, ddpsi, ddeps, AstroLib.EOpt.e80);
                                                                                               %printcov(cartcovmeanarev, 'ct', 'm', anom, out strout);
                                                                                               %fprintf(1,strout);
                                                                                               %fprintf(1,'\n');

  end  % testcovct2clmean


  function testcovct2cltrue()

      year, mon, day, hr, minute, timezone, dat, terms;
      double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
      double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
      double af, ag, chi, psi, meanlonNu, meanlonM;
      double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
      Int16 fr;
      double[,] tm = new double[,]   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0
      0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0 end ];
  string anom = 'truea';  % truea/n, meana/n
  string anomflt = 'latlon'; % latlon  radec
  cartstate = new double(7);
  classstate = new double(7);
  eqstate = new double(7);
  fltstate = new double(7);
  recef = new double(4);
  vecef = new double(4);
  avec = new double(4);

  double[,] classcovtruea = new double[6, 6];
  double[,] cartcovtruearev = new double[6, 6];
  double[,] tmct2cl = new double[6, 6];
  double[,] tmcl2ct = new double[6, 6];
  string strout;

  reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
  veci = [ -1.56825429, -3.70234891, -6.47948395 ];
  aeci = [ 0.001, 0.002, 0.003 ];

  %StringBuilder strbuild = new StringBuilder();
  %strbuild.Clear();

  nutLoc = 'D:\Codes\LIBRARY\DataLib\';
  [iau80arr] = iau80in(nutLoc);
  nutLoc = 'D:\Codes\LIBRARY\DataLib\';
  [iau06arr] = iau06in(nutLoc);
  % now read it in
  double jdxysstart, jdfxysstart;
  AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

  year = 2000;
  mon = 12;
  day = 15;
  hr = 16;
  minute = 58;
  sec = 50.208;
  dut1 = 0.10597;
  dat = 32;
  timezone = 0;
  xp = 0.0;
  yp = 0.0;
  lod = 0.0;
  terms = 2;
  timezone = 0;
  ddpsi = 0.0;
  ddeps = 0.0;
  ddx = 0.0;
  ddy = 0.0;

  convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
  out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
  out tt, out ttt, out jdtt, out jdttfrac,
  out tdb, out ttdb, out jdtdb, out jdtdbfrac);

  % ---convert the eci state into the various other state formats(classical, equinoctial, etc)
  double[,] cartcov = new double[,]
  100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4
  1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4
  1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4
  1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6
  1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6
  1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001end ];
  cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km

  % --------convert to a classical orbit state
  rv2coe(reci, veci,
  out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
  classstate(1) = a;  % in km
  classstate(2) = ecc;
  classstate(3) = incl;
  classstate(4) = raan;
  classstate(5) = argp;
  if (anom.Contains('mean')) % meann or meana
      classstate(6) = m;
  else  % truea or truen
      classstate(6) = nu;

      % -------- convert to an equinoctial orbit state
      rv2eq(reci, veci, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
      if (anom.Equals('meana') || anom.Equals('truea'))
          eqstate(1) = a;  % km
      else % meann or truen
          eqstate(1) = n;
          eqstate(2) = af;
          eqstate(3) = ag;
          eqstate(4) = chi;
          eqstate(5) = psi;
          if (anom.Contains('mean')) %  meana or meann
              eqstate(6) = meanlonM;
          else % truea or truen
              eqstate(6) = meanlonNu;

              % --------convert to a flight orbit state
              rv2flt(reci, veci, jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, terms, ddpsi, ddeps, ddx, ddy,
              iau80arr, iau06arr,
              out lon, out latgc, out rtasc, out decl, out fpa, out az, out magr, out magv);
              if (anomflt.Equals('radec'))

                  fltstate(1) = rtasc;
                  fltstate(2) = decl;
              end
          else
              if (anomflt.Equals('latlon'))

                  fltstate(1) = lon;
                  fltstate(2) = latgc;
              end
              fltstate(3) = fpa;
              fltstate(4) = az;
              fltstate(5) = magr;  % in km
              fltstate(6) = magv;

              % test position and velocity going back
              avec = [ 0.0, 0.0, 0.0 ];

              eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
              AstroLib.EOpt.e80, iau80arr, iau06arr,
              jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
              %vx = magv* ( -cos(lon)*sin(latgc)*cos(az)*cos(fpa) - sin(lon)*sin(az)*cos(fpa) + cos(lon)*cos(latgc)*sin(fpa) );
              %vy = magv* ( -sin(lon)*sin(latgc)*cos(az)*cos(fpa) + cos(lon)*sin(az)*cos(fpa) + sin(lon)*cos(latgc)*sin(fpa) );
              %vz = magv* (sin(latgc) * sin(fpa) + cos(latgc)*cos(az)*cos(fpa) );
              %% correct:
              %ve1 = magv* ( -cos(rtasc)*sin(decl)*cos(az)*cos(fpa) - sin(rtasc)*sin(az)*cos(fpa) + cos(rtasc)*cos(decl)*sin(fpa) ); % m/s
              % ve2 = magv* (-sin(rtasc) * sin(decl) * cos(az) * cos(fpa) + cos(rtasc) * sin(az) * cos(fpa) + sin(rtasc) * cos(decl) * sin(fpa));
              %ve3 = magv* (sin(decl) * sin(fpa) + cos(decl)*cos(az)*cos(fpa) );

              fprintf(1,'==================== do the sensitivity tests \n');

              fprintf(1,'1.  Cartesian Covariance \n');
              printcov(cartcov, 'ct', 'm', anom, out strout);
              fprintf(1,strout);

              fprintf(1,'2.  Classical Covariance from Cartesian #1 above (' + anom + ') ------------------- \n');

              covct2cl(cartcov, cartstate, anom, out classcovtruea, out tmct2cl);
              printcov(classcovtruea, 'cl', 'm', anom, out strout);
              fprintf(1,strout);

              fprintf(1,'  Cartesian Covariance from Classical #2 above \n');
              covcl2ct(classcovtruea, classstate, anom, out cartcovtruearev, out tmcl2ct);
              printcov(cartcovtruearev, 'ct', 'm', anom, out strout);
              fprintf(1,strout);
              fprintf(1,'\n');

              printdiff(' cartcov - cartcovtruearev \n', cartcov, cartcovtruearev, out strout);
              fprintf(1,strout);
          end  % testcovct2cltrue



          function testcovcl2eq(string anom)

              year, mon, day, hr, minute, timezone, dat, terms;
              double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
              double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
              double af, ag, chi, psi, meanlonNu, meanlonM;
              double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
              Int16 fr;
              double[,] tm = new double[,]   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0
              0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0 end ];
          string anomflt = 'latlon'; % latlon  radec
          cartstate = new double(7);
          classstate = new double(7);
          eqstate = new double(7);
          fltstate = new double(7);
          recef = new double(4);
          vecef = new double(4);
          avec = new double(4);

          double[,] classcovmeana = new double[6, 6];
          double[,] cartcovmeanarev = new double[6, 6];
          double[,] eqcovmeana = new double[6, 6];
          double[,] tmct2cl = new double[6, 6];
          double[,] tmcl2ct = new double[6, 6];
          double[,] tmcl2eq = new double[6, 6];
          double[,] tmeq2cl = new double[6, 6];
          string strout;

          reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
          veci = [ -1.56825429, -3.70234891, -6.47948395 ];
          aeci = [ 0.001, 0.002, 0.003 ];

          % StringBuilder strbuild = new StringBuilder();
          % strbuild.Clear();

          nutLoc = 'D:\Codes\LIBRARY\DataLib\';
          [iau80arr] = iau80in(nutLoc);
          nutLoc = 'D:\Codes\LIBRARY\DataLib\';
          [iau06arr] = iau06in(nutLoc);
          % now read it in
          double jdxysstart, jdfxysstart;
          AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

          year = 2000;
          mon = 12;
          day = 15;
          hr = 16;
          minute = 58;
          sec = 50.208;
          dut1 = 0.10597;
          dat = 32;
          timezone = 0;
xp = 0.0;
yp = 0.0;
lod = 0.0;
terms = 2;
timezone = 0;
ddpsi = 0.0;
ddeps = 0.0;
ddx = 0.0;
ddy = 0.0;

convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
out tt, out ttt, out jdtt, out jdttfrac,
out tdb, out ttdb, out jdtdb, out jdtdbfrac);

% ---convert the eci state into the various other state formats(classical, equinoctial, etc)
double[,] cartcov = new double[,]
100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4
1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4
1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4
1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6
1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6
1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001end ];
cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km

% --------convert to a classical orbit state
rv2coe(reci, veci,
out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
classstate(1) = a;   % km
classstate(2) = ecc;
classstate(3) = incl;
classstate(4) = raan;
classstate(5) = argp;
if (anom.Contains('mean')) % meann or meana
    classstate(6) = m;
else  % truea or truen
    classstate(6) = nu;

    % -------- convert to an equinoctial orbit state
    rv2eq(reci, veci, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
    if (anom.Equals('meana') || anom.Equals('truea'))
        eqstate(1) = a;  % km
    else % meann or truen
        eqstate(1) = n;
        eqstate(2) = af;
        eqstate(3) = ag;
        eqstate(4) = chi;
        eqstate(5) = psi;
        if (anom.Contains('mean')) %  meana or meann
            eqstate(6) = meanlonM;
        else % truea or truen
            eqstate(6) = meanlonNu;

            % --------convert to a flight orbit state
            rv2flt(reci, veci, jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, terms, ddpsi, ddeps, ddx, ddy,
            iau80arr, iau06arr,
            out lon, out latgc, out rtasc, out decl, out fpa, out az, out magr, out magv);
            if (anomflt.Equals('radec'))

                fltstate(1) = rtasc;
                fltstate(2) = decl;
            end
        else
            if (anomflt.Equals('latlon'))

                fltstate(1) = lon;
                fltstate(2) = latgc;
            end
            fltstate(3) = fpa;
            fltstate(4) = az;
            fltstate(5) = magr;  % km
            fltstate(6) = magv;

            % test position and velocity going back
            avec = [ 0.0, 0.0, 0.0 ];

            eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
            AstroLib.EOpt.e80, iau80arr, iau06arr,
            jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
            %vx = magv* ( -cos(lon)*sin(latgc)*cos(az)*cos(fpa) - sin(lon)*sin(az)*cos(fpa) + cos(lon)*cos(latgc)*sin(fpa) );
            %vy = magv* ( -sin(lon)*sin(latgc)*cos(az)*cos(fpa) + cos(lon)*sin(az)*cos(fpa) + sin(lon)*cos(latgc)*sin(fpa) );
            %vz = magv* (sin(latgc) * sin(fpa) + cos(latgc)*cos(az)*cos(fpa) );
            %% correct:
            %ve1 = magv* ( -cos(rtasc)*sin(decl)*cos(az)*cos(fpa) - sin(rtasc)*sin(az)*cos(fpa) + cos(rtasc)*cos(decl)*sin(fpa) ); % m/s
            % ve2 = magv* (-sin(rtasc) * sin(decl) * cos(az) * cos(fpa) + cos(rtasc) * sin(az) * cos(fpa) + sin(rtasc) * cos(decl) * sin(fpa));
            %ve3 = magv* (sin(decl) * sin(fpa) + cos(decl)*cos(az)*cos(fpa) );

            fprintf(1,'==================== do the sensitivity tests \n');

            fprintf(1,'1.  Cartesian Covariance \n');
            printcov(cartcov, 'ct', 'm', anom, out strout);
            fprintf(1,strout);

            fprintf(1,'3.  Equinoctial Covariance from Classical (Cartesian) #1 above (' + anom + ') ------------------- \n');
            covct2cl(cartcov, cartstate, anom, out classcovmeana, out tmct2cl);
            covcl2eq(classcovmeana, classstate, anom, anom, fr, out eqcovmeana, out tmcl2eq);

            printcov(eqcovmeana, 'eq', 'm', anom, out strout);
            fprintf(1,strout);

            fprintf(1,'  Cartesian Covariance from Classical #3 above \n');
            coveq2cl(eqcovmeana, eqstate, anom, anom, fr, out classcovmeana, out tmeq2cl);
            printcov(classcovmeana, 'cl', 'm', anom, out strout);
            fprintf(1,strout);

            covcl2ct(classcovmeana, classstate, anom, out cartcovmeanarev, out tmcl2ct);
            printcov(cartcovmeanarev, 'ct', 'm', anom, out strout);
            fprintf(1,strout);
            fprintf(1,'\n');

            printdiff(' cartcov - cartcov' + anom + 'rev \n', cartcov, cartcovmeanarev, out strout);
            fprintf(1,strout);
        end  % testcovcl2eq

        function testcovct2eq(string anom)

            year, mon, day, hr, minute, timezone, dat, terms;
            double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
            double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
            double af, ag, chi, psi, meanlonNu, meanlonM;
            double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
            Int16 fr;
            double[,] tm = new double[,]   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0
            0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0 end ];
        string anomflt = 'latlon'; % latlon  radec
        cartstate = new double(7);
        classstate = new double(7);
        eqstate = new double(7);
        fltstate = new double(7);
        recef = new double(4);
        vecef = new double(4);
        avec = new double(4);

        double[,] classcovmeana = new double[6, 6];
        double[,] cartcovmeanarev = new double[6, 6];
        double[,] eqcovmeana = new double[6, 6];
        double[,] tmct2cl = new double[6, 6];
        double[,] tmcl2ct = new double[6, 6];
        double[,] tmct2eq = new double[6, 6];
        double[,] tmeq2ct = new double[6, 6];
        string strout;

        reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
        veci = [ -1.56825429, -3.70234891, -6.47948395 ];
        aeci = [ 0.001, 0.002, 0.003 ];

        % StringBuilder strbuild = new StringBuilder();
        % strbuild.Clear();

        nutLoc = 'D:\Codes\LIBRARY\DataLib\';
        [iau80arr] = iau80in(nutLoc);
        nutLoc = 'D:\Codes\LIBRARY\DataLib\';
        [iau06arr] = iau06in(nutLoc);
        % now read it in
        double jdxysstart, jdfxysstart;
        AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

        year = 2000;
        mon = 12;
        day = 15;
        hr = 16;
        minute = 58;
        sec = 50.208;
        dut1 = 0.10597;
        dat = 32;
        timezone = 0;
        xp = 0.0;
        yp = 0.0;
        lod = 0.0;
        terms = 2;
        timezone = 0;
        ddpsi = 0.0;
        ddeps = 0.0;
        ddx = 0.0;
        ddy = 0.0;

        convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
        out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
        out tt, out ttt, out jdtt, out jdttfrac,
        out tdb, out ttdb, out jdtdb, out jdtdbfrac);

        % ---convert the eci state into the various other state formats(classical, equinoctial, etc)
        cartcov = [ ...
            100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4 ;...
            1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4;...
            1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4;...
            1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6;...
            1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6;...
            1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001];
        cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km

        % --------convert to a classical orbit state
        rv2coe(reci, veci,
        out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
        classstate(1) = a;   % km
        classstate(2) = ecc;
        classstate(3) = incl;
        classstate(4) = raan;
        classstate(5) = argp;
        if (anom.Contains('mean')) % meann or meana
            classstate(6) = m;
        else  % truea or truen
            classstate(6) = nu;

            % -------- convert to an equinoctial orbit state
            rv2eq(reci, veci, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
            if (anom.Equals('meana') || anom.Equals('truea'))
                eqstate(1) = a;  % km
            else % meann or truen
                eqstate(1) = n;
                eqstate(2) = af;
                eqstate(3) = ag;
                eqstate(4) = chi;
                eqstate(5) = psi;
                if (anom.Contains('mean')) %  meana or meann
                    eqstate(6) = meanlonM;
                else % truea or truen
                    eqstate(6) = meanlonNu;

                    % --------convert to a flight orbit state
                    rv2flt(reci, veci, jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, terms, ddpsi, ddeps, ddx, ddy,
                    iau80arr, iau06arr,
                    out lon, out latgc, out rtasc, out decl, out fpa, out az, out magr, out magv);
                    if (anomflt.Equals('radec'))

                        fltstate(1) = rtasc;
                        fltstate(2) = decl;
                    end
                else
                    if (anomflt.Equals('latlon'))

                        fltstate(1) = lon;
                        fltstate(2) = latgc;
                    end
                    fltstate(3) = fpa;
                    fltstate(4) = az;
                    fltstate(5) = magr;  % km
                    fltstate(6) = magv;

                    % test position and velocity going back
                    avec = [ 0.0, 0.0, 0.0 ];

                    eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
                    AstroLib.EOpt.e80, iau80arr, iau06arr,
                    jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
                    %vx = magv* ( -cos(lon)*sin(latgc)*cos(az)*cos(fpa) - sin(lon)*sin(az)*cos(fpa) + cos(lon)*cos(latgc)*sin(fpa) );
                    %vy = magv* ( -sin(lon)*sin(latgc)*cos(az)*cos(fpa) + cos(lon)*sin(az)*cos(fpa) + sin(lon)*cos(latgc)*sin(fpa) );
                    %vz = magv* (sin(latgc) * sin(fpa) + cos(latgc)*cos(az)*cos(fpa) );
                    %% correct:
                    %ve1 = magv* ( -cos(rtasc)*sin(decl)*cos(az)*cos(fpa) - sin(rtasc)*sin(az)*cos(fpa) + cos(rtasc)*cos(decl)*sin(fpa) ); % m/s
                    % ve2 = magv* (-sin(rtasc) * sin(decl) * cos(az) * cos(fpa) + cos(rtasc) * sin(az) * cos(fpa) + sin(rtasc) * cos(decl) * sin(fpa));
                    %ve3 = magv* (sin(decl) * sin(fpa) + cos(decl)*cos(az)*cos(fpa) );

                    fprintf(1,'==================== do the sensitivity tests \n');

                    fprintf(1,'1.  Cartesian Covariance \n');
                    printcov(cartcov, 'ct', 'm', anom, out strout);
                    fprintf(1,strout);

                    fprintf(1,'3.  Equinoctial Covariance from Cartesian #1 above (' + anom + ') ------------------- \n');
                    covct2eq(cartcov, cartstate, anom, fr, out eqcovmeana, out tmct2eq);

                    printcov(eqcovmeana, 'eq', 'm', anom, out strout);
                    fprintf(1,strout);

                    fprintf(1,'  Cartesian Covariance from Classical #3 above \n');
                    coveq2ct(eqcovmeana, eqstate, anom, fr, out cartcovmeanarev, out tmeq2ct);

                    printcov(cartcovmeanarev, 'ct', 'm', anom, out strout);
                    fprintf(1,strout);
                    fprintf(1,'\n');

                    printdiff(' cartcov - cartcov' + anom + 'rev \n', cartcov, cartcovmeanarev, out strout);
                    fprintf(1,strout);
                end  % testcoveq2clmeann


                function testcovct2fl(string anomflt)

                    year, mon, day, hr, minute, timezone, dat, terms;
                    double sec, dut1, ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac;
                    double p, a, n, ecc, incl, raan, argp, nu, m, arglat, truelon, lonper;
                    double af, ag, chi, psi, meanlonNu, meanlonM;
                    double latgc, lon, rtasc, decl, fpa, lod, xp, yp, ddpsi, ddeps, ddx, ddy, az, magr, magv;
                    Int16 fr;
                    double[,] tm = new double[,]   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0
                    0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0   0, 0, 0, 0, 0, 0 end ];
                string anom = 'meann';
                cartstate = new double(7);
                classstate = new double(7);
                eqstate = new double(7);
                fltstate = new double(7);
                recef = new double(4);
                vecef = new double(4);
                avec = new double(4);

                double[,] classcovmeana = new double[6, 6];
                double[,] cartcovmeanarev = new double[6, 6];
                double[,] fltcovmeana = new double[6, 6];
                double[,] tmct2cl = new double[6, 6];
                double[,] tmcl2ct = new double[6, 6];
                double[,] tmct2fl = new double[6, 6];
                double[,] tmfl2ct = new double[6, 6];
                string strout;

                reci = [ -605.79221660, -5870.22951108, 3493.05319896 ];
                veci = [ -1.56825429, -3.70234891, -6.47948395 ];
                aeci = [ 0.001, 0.002, 0.003 ];

                % StringBuilder strbuild = new StringBuilder();
                % strbuild.Clear();

                nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                [iau80arr] = iau80in(nutLoc);
                nutLoc = 'D:\Codes\LIBRARY\DataLib\';
                [iau06arr] = iau06in(nutLoc);
                % now read it in
                double jdxysstart, jdfxysstart;
                AstroLib.xysdataClass[] xysarr = xysarr;
    [jdxysstart, jdfxysstart, xys06arr] = initxys(infilename);

                year = 2000;
                mon = 12;
                day = 15;
                hr = 16;
                minute = 58;
                sec = 50.208;
                dut1 = 0.10597;
                dat = 32;
                timezone = 0;
                xp = 0.0;
                yp = 0.0;
                lod = 0.0;
                terms = 2;
                timezone = 0;
                ddpsi = 0.0;
                ddeps = 0.0;
                ddx = 0.0;
                ddy = 0.0;

                convtime(year, mon, day, hr, minute, sec, timezone, dut1, dat,
                out ut1, out tut1, out jdut1, out jdut1frac, out utc, out tai,
                out tt, out ttt, out jdtt, out jdttfrac,
                out tdb, out ttdb, out jdtdb, out jdtdbfrac);

                % ---convert the eci state into the various other state formats(classical, equinoctial, etc)
                cartcov = [ ...
                    100.0, 1.0e-2, 1.0e-2, 1.0e-4, 1.0e-4, 1.0e-4 ;...
                    1.0e-2, 100.0,  1.0e-2, 1.0e-4,   1.0e-4,   1.0e-4;...
                    1.0e-2, 1.0e-2, 100.0,  1.0e-4,   1.0e-4,   1.0e-4;...
                    1.0e-4, 1.0e-4, 1.0e-4, 0.0001,   1.0e-6,   1.0e-6;...
                    1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   0.0001,   1.0e-6;...
                    1.0e-4, 1.0e-4, 1.0e-4, 1.0e-6,   1.0e-6,   0.0001];
                cartstate = [ reci(1), reci(2), reci(3), veci(1), veci(2), veci(3) ];  % in km

                % --------convert to a classical orbit state
                rv2coe(reci, veci,
                out p, out a, out ecc, out incl, out raan, out argp, out nu, out m, out arglat, out truelon, out lonper);
                classstate(1) = a;   % km
                classstate(2) = ecc;
                classstate(3) = incl;
                classstate(4) = raan;
                classstate(5) = argp;
                if (anom.Contains('mean')) % meann or meana
                    classstate(6) = m;
                else  % truea or truen
                    classstate(6) = nu;

                    % -------- convert to an equinoctial orbit state
                    rv2eq(reci, veci, out a, out n, out af, out ag, out chi, out psi, out meanlonM, out meanlonNu, out fr);
                    if (anom.Equals('meana') || anom.Equals('truea'))
                        eqstate(1) = a;  % km
                    else % meann or truen
                        eqstate(1) = n;
                        eqstate(2) = af;
                        eqstate(3) = ag;
                        eqstate(4) = chi;
                        eqstate(5) = psi;
                        if (anom.Contains('mean')) %  meana or meann
                            eqstate(6) = meanlonM;
                        else % truea or truen
                            eqstate(6) = meanlonNu;

                            % --------convert to a flight orbit state
                            rv2flt(reci, veci, jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, terms, ddpsi, ddeps, ddx, ddy,
                            iau80arr, iau06arr,
                            out lon, out latgc, out rtasc, out decl, out fpa, out az, out magr, out magv);
                            if (anomflt.Equals('radec'))

                                fltstate(1) = rtasc;
                                fltstate(2) = decl;
                            end
                        else
                            if (anomflt.Equals('latlon'))

                                fltstate(1) = lon;
                                fltstate(2) = latgc;
                            end
                            fltstate(3) = fpa;
                            fltstate(4) = az;
                            fltstate(5) = magr;  % km
                            fltstate(6) = magv;

                            % test position and velocity going back
                            avec = [ 0.0, 0.0, 0.0 ];

                            eci_ecef(ref reci, ref veci, MathTimeLib.Edirection.eto, ref recef, ref vecef,
                            AstroLib.EOpt.e80, iau80arr, iau06arr,
                            jdtt, jdttfrac, jdut1, jdxysstart, lod, xp, yp, ddpsi, ddeps, ddx, ddy);
                            %vx = magv* ( -cos(lon)*sin(latgc)*cos(az)*cos(fpa) - sin(lon)*sin(az)*cos(fpa) + cos(lon)*cos(latgc)*sin(fpa) );
                            %vy = magv* ( -sin(lon)*sin(latgc)*cos(az)*cos(fpa) + cos(lon)*sin(az)*cos(fpa) + sin(lon)*cos(latgc)*sin(fpa) );
                            %vz = magv* (sin(latgc) * sin(fpa) + cos(latgc)*cos(az)*cos(fpa) );
                            %% correct:
                            %ve1 = magv* ( -cos(rtasc)*sin(decl)*cos(az)*cos(fpa) - sin(rtasc)*sin(az)*cos(fpa) + cos(rtasc)*cos(decl)*sin(fpa) ); % m/s
                            % ve2 = magv* (-sin(rtasc) * sin(decl) * cos(az) * cos(fpa) + cos(rtasc) * sin(az) * cos(fpa) + sin(rtasc) * cos(decl) * sin(fpa));
                            %ve3 = magv* (sin(decl) * sin(fpa) + cos(decl)*cos(az)*cos(fpa) );

                            fprintf(1,'==================== do the sensitivity tests \n');

                            fprintf(1,'1.  Cartesian Covariance \n');
                            printcov(cartcov, 'ct', 'm', anomflt, out strout);
                            fprintf(1,strout);

                            fprintf(1,'7.  Flight Covariance from Cartesian #1 above (' + anomflt + ') ------------------- \n');
                            covct2fl(cartcov, cartstate, anomflt, jdtt, jdttfrac, jdut1, jdxysstart,
                            lod, xp, yp, 2, ddpsi, ddeps, ddx, ddy,
                            iau80arr, iau06arr, AstroLib.EOpt.e80, out fltcovmeana, out tmct2fl);

                            if (anomflt.Equals('latlon'))
                                printcov(fltcovmeana, 'fl', 'm', anomflt, out strout);
                            else
                                printcov(fltcovmeana, 'sp', 'm', anomflt, out strout);

                                fprintf(1,strout);

                                fprintf(1,'  Cartesian Covariance from Flight #7 above \n');
                                covfl2ct(fltcovmeana, fltstate, anomflt, jdtt, jdttfrac, jdut1, jdxysstart,
                                lod, xp, yp, 2, ddpsi, ddeps, ddx, ddy,
                                iau80arr, iau06arr, AstroLib.EOpt.e80, out cartcovmeanarev, out tmfl2ct);

                                printcov(cartcovmeanarev, 'ct', 'm', anomflt, out strout);
                                fprintf(1,strout);
                                fprintf(1,'\n');

                                printdiff(' cartcov - cartcov' + anomflt + 'rev \n', cartcov, cartcovmeanarev, out strout);
                                fprintf(1,strout);
                            end  % testcovct2fl





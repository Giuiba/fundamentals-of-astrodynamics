    %     -----------------------------------------------------------------
    %
    %                              ex3_1415.m
    %
    %  this file tests the reduction functions.
    %
    %                          companion code for
    %             fundamentals of astrodynamics and applications
    %                                 2007
    %                            by david vallado
    %
    %     (h)               email dvallado@msn.com
    %     (w) 719-573-2600, email dvallado@agi.com
    %
    %     *****************************************************************
    %
    %  current :
    %            30 mar 07  david vallado
    %                         original
    %  changes :
    %            13 feb 07  david vallado
    %                         original baseline
    %
    %     *****************************************************************
    
    % GEO test
    %        recef = [24796.91929150; -34115.87092340; 10.22606210];
    %        vecef = [-0.0009791780;	-0.0014765380;	-0.0009287760];
    %        aecef = [0.001;0.002;0.003];
    % LEO test
    recef = [-1033.4793830;  7901.2952754;  6380.3565958];
    vecef = [-3.225636520;  -2.872451450;   5.531924446];
    aecef = [0.001;0.002;0.003];
    
    conv = pi / (180.0*3600.0);
    
    year=2004;
    mon = 4;
    day = 6;
    hr =  7;
    min= 51;
    sec= 28.386009;
    
    dut1 = -0.4399619;  % sec
    dat  = 32;         % sec
    xp   = -0.140682 * conv;  % " to rad
    yp   =  0.333309 * conv;
    lod  =  0.0015563;
    ddpsi = -0.052195 * conv;  % " to rad
    ddeps = -0.003875 * conv;
    ddx = -0.000205 * conv;  % " to rad
    ddy = -0.000136 * conv;
    
    fileLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau80arr] = iau80in(fileLoc);

    fileLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(fileLoc);

    fileLoc = 'D:\Codes\LIBRARY\DataLib\';
    [xys06table] = readxys(fileLoc);

    timezone=0;
    order = 106;
    eqeterms = 2; % use the extra eqeq terms in j2000
    opt = 'a'; % specify the iau00 approach
    
    fprintf(1, 'test program for reduction functions \n\n');
    
    fprintf(1, 'input data \n\n');
    fprintf(1, ' year %5i ', year);
    fprintf(1, ' mon %4i ', mon);
    fprintf(1, ' day %3i ', day);
    fprintf(1, ' %3i:%2i:%8.6f\n ', hr, min, sec );
    fprintf(1, ' dut1 %8.6f s', dut1);
    fprintf(1, ' dat %3i s', dat);
    fprintf(1, ' xp %8.6f "', xp / conv);
    fprintf(1, ' yp %8.6f "', yp / conv);
    fprintf(1, ' lod %8.6f s\n', lod);
    fprintf(1, ' ddpsi %8.6f " ddeps  %8.6f\n', ddpsi/conv, ddeps/conv);
    fprintf(1, ' ddx   %8.6f " ddy    %8.6f\n', ddx/conv, ddy/conv);
    fprintf(1, ' order %3i  eqeterms %3i  opt %3s \n', order, eqeterms, opt );
    fprintf(1, 'units are km and km/s and km/s2\n' );
    
    % -------- convtime    - convert time from utc to all the others
    fprintf(1, 'convtime results\n');
    [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, ...
        tdb, ttdb, jdtdb, jdtdbfrac ] ...
        = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    fprintf(1, 'ut1 %8.6f tut1 %16.12f jdut1 %18.11f ', ut1, tut1, jdut1+jdut1frac );
    [h, m, s] = sec2hms( ut1 );
    fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    fprintf(1, 'utc %8.6f ', utc );
    [h, m, s] = sec2hms( utc );
    fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    fprintf(1, 'tai %8.6f', tai );
    [h, m, s] = sec2hms( tai );
    fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    fprintf(1, 'tt  %8.6f ttt  %16.12f jdtt  %18.11f ', tt, ttt, jdtt+jdttfrac );
    [h, m, s] = sec2hms( tt );
    fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    fprintf(1, 'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n', tdb, ttdb, jdtdb+jdtdbfrac );
    
    % -------- precess     - transformation matrix for precession
    fprintf(1, 'precession matrix versions ---------------------- \n');
    [prec, psia, wa, ea, xa] = precess ( ttt, '80' );
    % note matricies print out transposed in Matlab without the ' fix
    fprintf(1, 'precession matrix  \n');
    fprintf(1, '%20.15f %20.15f %20.15f\n', prec' );
    
    [prec00, psia, wa, ea, xa] = precess ( ttt, '6c' );
    fprintf(1, 'precession matrix 00 \n');
    fprintf(1, '%20.15f %20.15f %20.15f\n', prec00' );
    
    
    % -------- nutation    - transformation matrix for nutation
    fprintf(1, 'nutation matrix versions ------------------------ \n');
    [fArgs] = fundarg(ttt, '80');
    [deltapsi, trueeps, meaneps, nut] = nutation  (ttt, ddpsi, ddeps, iau80arr, fArgs);
    fprintf(1, 'nutation matrix ddpsi ddeps \n');
    fprintf(1, '%20.15f %20.15f %20.15f\n', nut' );
    
    % -------- sidereal    - transformation matrix for sidereal time
    fprintf(1, 'sidereal time versions ------------------------- \n');
    [st, stdot] = sidereal(jdut1+jdut1frac, deltapsi, meaneps, fArgs(5), lod, 2, '80');
    fprintf(1, 'sidereal fk5 \n');
    fprintf(1, '%20.15f %20.15f %20.15f\n', st' );
    [st00, stdot00] = sidereal(jdut1+jdut1frac, deltapsi, meaneps, fArgs(5), lod, eqeterms, '80' );
    fprintf(1, 'sidereal iau2010 not right \n');
    fprintf(1, '%20.15f %20.15f %20.15f\n', st00' );
    % note you could also have two calculations with the wo corr nutation values
    
    
    
    % -------- polarm      - transformation matrix for polar motion
    fprintf(1, 'polar motion matrix versions -------------------\n');
    [pm] = polarm(xp, yp, ttt, '80');
    fprintf(1, '%20.15f %20.15f %20.15f\n', pm' );
    
    [pm06] = polarm(xp,yp,ttt,'06');
    fprintf(1, '%20.15f %20.15f %20.15f\n', pm06' );
    
    
    
    %-------------------
    % sample runs for book
    [recigg, vecigg, aecig] = ecef2eci06 ( recef, vecef, aecef, iau06arr, ...
        xys06table, ttt, jdut1+jdut1frac, lod, xp, yp, ddx, ddy, '06c'  );
    fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f', recigg );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecigg );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecig );
    
    [recig, vecig, aecig] = ecef2eci(recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, 2, ddpsi, ddeps );
    fprintf(1, 'GCRF 2 w corr IAU-76/FK5   %14.8f %14.8f %14.8f', recig );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecig );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecig );
    %-------------------
    jdut1 = jdut1 + jdut1frac;
    fid = 1;
    fprintf(1, '\n\n ============== convert various coordinate systems from ecef =================== \n');
    fprintf(fid,'ITRF start    IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recef(1), recef(2), recef(3), vecef(1), vecef(2), vecef(3));

    % PEF
    [rpef, vpef, apef] = ecef2pef ( recef, vecef, aecef, '80', ttt, xp, yp );
    fprintf(fid,'PEF           IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rpef(1), rpef(2), rpef(3), vpef(1), vpef(2), vpef(3));
    [recii, vecii, aecii] = pef2ecef(rpef, vpef, apef, '80', ttt, xp, yp);
    fprintf(fid,'ITRF  rev     IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    [rtirs, vtirs, atirs] = ecef2tirs(recef, vecef, aecef, ttt, xp, yp );
    fprintf(fid,'TIRS          IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rtirs(1), rtirs(2), rtirs(3), vtirs(1), vtirs(2), vtirs(3));
    [recefi, vecefi, aecefi] = tirs2ecef(rtirs, vtirs, atirs, ttt, xp, yp );
    fprintf(fid,'ECI rev       IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % TOD
    [rtod, vtod, atod] = ecef2tod(recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, 0.0, 0.0);
    fprintf(fid,'TOD wo corr   IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    [rtod, vtod, atod] = ecef2tod(recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'TOD w corr    IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    [recefi,vecefi,aecefi] = tod2ecef ( rtod, vtod, atod, iau80arr, jdut1, ttt, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'ITRFi         IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    [rcirs, vcirs, acirs] = ecef2cirs(recef, vecef, aecef, iau06arr, ttt, jdut1, lod, xp, yp, ddx, ddy, '06x' );
    fprintf(fid,'CIRS          IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rcirs(1), rcirs(2), rcirs(3), vcirs(1), vcirs(2), vcirs(3));
    [recefi,vecefi,aecefi] = cirs2ecef(rcirs, vcirs, acirs, iau06arr, ttt, jdut1, lod, xp, yp, ddx, ddy, '06x' );
    fprintf(fid,'ITRF rev      IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % MOD
    [rmod, vmod, amod] = ecef2mod( recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, 0.0, 0.0);
    fprintf(fid,'MOD wo corr   IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    [rmod, vmod, amod] = ecef2mod( recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'MOD  w corr   IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    [recefi,vecefi,aecefi] = mod2ecef( rmod, vmod, amod, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'ITRF  rev     IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));


    % J2000
    [recii, vecii, aecii] = ecef2eci(recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, 0.0, 0.0 );
    fprintf(fid,'J2000 wo corr IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % GCRF
    [reci, veci, aeci] = ecef2eci(recef, vecef, aecef, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'GCRF w corr   IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));
    [recefi, vecefi, aecefi] = eci2ecef(reci, veci, aeci, iau80arr, ttt, jdut1, lod, xp, yp, eqeterms, ddpsi, ddeps );
    fprintf(fid,'ITRF rev      IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    [recii, vecii, aecii] = ecef2eci06(recef, vecef, aecef,   iau06arr, xys06table, ttt, jdut1, lod, xp, yp, ddx, ddy, '06x');
    fprintf(fid,'GCRF          IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));
    [recefi,vecefi,aecefi] = eci2ecef06  ( recii,vecii,aecii, iau06arr, xys06table, ttt, jdut1, lod, xp, yp, ddx, ddy, '06x' );    
    fprintf(fid,'ITRF rev      IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recefi(1), recefi(2), recefi(3), vecefi(1), vecefi(2), vecefi(3));

    % sofa
    fprintf(fid,'SOFA ECI CIO  5102.508959486507   6123.011392959787   6378.136934384333\n');
    fprintf(fid,'SOFA ECI 06a  5102.508965811828   6123.011397147659   6378.136925303720\n');
    fprintf(fid,'SOFA ECI 00a  5102.508965732931   6123.011397847143   6378.136924695331\n');


    % now reverses from eci
    fprintf(fid,'GCRF wco STARTIAU-76/FK5 %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', reci(1), reci(2), reci(3), veci(1), veci(2), veci(3));

    % PEF
    [rpef, vpef, apef] = eci2pef(reci, veci, aeci, iau80arr, ttt, jdut1, lod, eqeterms, ddpsi, ddeps);
    fprintf(fid,'PEF           IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rpef(1), rpef(2), rpef(3), vpef(1), vpef(2), vpef(3));
    [recii, vecii, aecii] = pef2eci(rpef, vpef, apef, iau80arr, ttt, jdut1, lod, eqeterms, ddpsi, ddeps);
    fprintf(fid,'ECI rev       IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    [rtirs, vtirs, atirs] = eci2tirs(recii, vecii, aecii, iau06arr, xys06table, ttt, jdut1, lod, ddx, ddy, '06x' );
    fprintf(fid,'TIRS          IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rtirs(1), rtirs(2), rtirs(3), vtirs(1), vtirs(2), vtirs(3));
    [recii, vecii, aecii] = tirs2eci(rtirs, vtirs, atirs, iau06arr, xys06table, ttt, jdut1, lod, ddx, ddy, '06x' );
    fprintf(fid,'ECI rev       IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % TOD
    [rtod, vtod, atod] = eci2tod(reci, veci, aeci, iau80arr, ttt, ddpsi, ddeps);
    fprintf(fid,'TOD           IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rtod(1), rtod(2), rtod(3), vtod(1), vtod(2), vtod(3));
    [recii, vecii, aecii] = tod2eci(rtod, vtod, atod, iau80arr, ttt, ddpsi, ddeps);
    fprintf(fid,'ECI rev       IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    [rcirs, vcirs, acirs] = eci2cirs( recii, vecii, aecii, iau06arr, xys06table, ttt, ddx, ddy, '06x' );
    fprintf(fid,'CIRS          IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rcirs(1), rcirs(2), rcirs(3), vcirs(1), vcirs(2), vcirs(3));
    [recii, vecii, aecii] = cirs2eci(rcirs, vcirs, acirs, iau06arr,  xys06table, ttt, ddx, ddy, '06x');
    fprintf(fid,'ECI rev       IAU-2006 CIO  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    % MOD
    [rmod, vmod, amod] = eci2mod(reci, veci, aeci, ttt);
    fprintf(fid,'MOD           IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', rmod(1), rmod(2), rmod(3), vmod(1), vmod(2), vmod(3));
    [recii, vecii, aecii] = mod2eci(rmod, vmod, amod, ttt);
    fprintf(fid,'ECI rev       IAU-76/FK5  %15.11f  %15.11f  %15.11f %15.11f  %15.11f  %15.11f\n', recii(1), recii(2), recii(3), vecii(1), vecii(2), vecii(3));

    
    tm = fk4;
    r1950 = tm' * reci;
    v1950 = tm' * veci;
    fprintf(1, 'eci - FK4                  %14.8f %14.8f %14.8f', r1950 );
    fprintf(1, ' v %14.9f %14.9f %14.9f \n', v1950 );
    
    reci20i = tm * r1950;
    veci20i = tm * v1950;
    fprintf(1, 'FK4 - eci                  %14.8f %14.8f %14.8f', reci20i );
    fprintf(1, ' v %14.9f %14.9f %14.9f \n', veci20i );
    
    tm = fk4;
    r1950 = tm' * recig;
    v1950 = tm' * vecig;
    fprintf(1, 'eci - FK4                  %14.8f %14.8f %14.8f', r1950 );
    fprintf(1, ' v %14.9f %14.9f %14.9f \n', v1950 );
    
    reci20i = tm * r1950;
    veci20i = tm * v1950;
    fprintf(1, 'FK4 - eci                  %14.8f %14.8f %14.8f', reci20i );
    fprintf(1, ' v %14.9f %14.9f %14.9f \n', veci20i );
    
    
    
    
    % the 0 terms eqeq may not be needed anymore...
    [reci00, veci00, aeci00] = ecef2eci(recef, vecef, aecef, iau80arr, ttt, jdut1+jdut1frac, lod, xp, yp, 0, 0, 0);
    fprintf(1, 'GCRF 0wo corr IAU-76/FK5   %14.8f %14.8f %14.8f', reci00 );
    fprintf(1, ' v %14.9f %14.9f %14.9f', veci00 );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aeci00 );
    [recef, vecef, aecef] = eci2ecef(reci00, veci00, aeci00, iau80arr, ttt, jdut1+jdut1frac, lod, xp, yp, 0, 0, 0);
    fprintf(1, 'ecef 0 wo corr             %14.8f %14.8f %14.8f', recef );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecef );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecef );
    
    
    % -------- pef2eci     - transform pef to eci vectors
    [reci, veci, aeci] = pef2eci(rpef, vpef, apef, iau80arr, ttt, jdut1+jdut1frac, lod, 2, 0, 0);
    fprintf(1, 'pef-eci 20                 %14.8f %14.8f %14.8f', reci );
    fprintf(1, ' v %14.9f %14.9f %14.9f', veci );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aeci );
    
    % -------- tod2eci     - transform tod to eci vectors
    [reci0, veci0, aeci0] = tod2eci(rtod, vtod, atod, iau80arr, ttt, 0, 0);
    fprintf(1, 'tod-eci wo corr            %14.8f %14.8f %14.8f', reci0 );
    fprintf(1, ' v %14.9f %14.9f %14.9f', veci0 );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aeci0 );
    
    % -------- mod2eci     - transform mod to eci vectors
    [recig, vecig, aecig] = mod2eci(rmod, vmod, amod, ttt);
    fprintf(1, 'mod-eci                    %14.8f %14.8f %14.8f', recig );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecig );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecig );
    
    
    [rtod0, vtod0, atod0] = eci2tod(reci, veci, aeci, iau80arr, ttt, 0, 0);
    fprintf(1, 'eci-TOD wo corr            %14.8f %14.8f %14.8f', rtod0 );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vtod0 );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', atod0 );
    
    [rpef20, vpef20, apef20] = eci2pef(reci, veci, aeci, iau80arr, ttt, jdut1, lod, 2, 0, 0);
    fprintf(1, 'eci-PEF 20,                %14.8f %14.8f %14.8f', rpef20 );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vpef20 );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', apef20 );
    

    
    
    %        % -------- eci2teme    - transform eci to teme vectors
    %        [rteme, vteme, ateme] = eci2teme(reci, veci, aeci, ttt, 4, 0, opt);
    %        fprintf(1, 'order   4  terms   0  opt %3s \n', opt );
    %        fprintf(1, 'eci-teme %14.8f %14.8f %14.8f', rteme );
    %        fprintf(1, ' v %14.9f %14.9f %14.9f', vteme );
    %        fprintf(1, ' a %14.9f %14.9f %14.9f\n', ateme );
    
    
    
    % --------------------------- now do iau2000
    % -------- eci2ecef    - transform iau2000 eci to ecef vectors
    recef=[ -1033.4793830  7901.2952758  6380.3565953]';
    vecef=[    -3.225636520  -2.872451450   5.531924446]';
    fprintf(1, '\n\n\n\n now do iau2000 processing., start from the itrf vector: \n');
    fprintf(1, 'eci-ecef                   %14.8f %14.8f %14.8f', recef );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecef );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecef );
    
    % -------- ecef2eci    - transform iau2000 ecef to eci vectors
    [recigg, vecigg, aecig] = ecef2eci06(recef, vecef, aecef, iau06arr, ...
        xys06table, ttt, jdut1, lod, xp, yp, ddx, ddy, '06' );
    fprintf(1, 'GCRF          IAU-2006a    %14.8f %14.8f %14.8f', recigg );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecigg );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecig );

  
    % -------- ecef2eci    - transform iau2000 ecef to eci vectors
    [recigg, vecigg, aecig] = ecef2eci06 ( recef, vecef, aecef, iau06arr, xys06table, ...
        ttt, jdut1+jdut1frac, lod, xp, yp, ddx, ddy , '06c');
    fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f', recigg );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecigg );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecig );
    
    [recefg, vecefg, aecefg] = eci2ecef06(recigg, vecigg, aeci,iau06arr, xys06table, ...
        ttt, jdut1+jdut1frac, lod, xp, yp, ddx, ddy, '06c' );
    fprintf(1, 'itrf                       %14.8f %14.8f %14.8f', recefg );
    fprintf(1, ' v %14.9f %14.9f %14.9f', vecefg );
    fprintf(1, ' a %14.9f %14.9f %14.9f\n', aecefg );
    
    
    fprintf(1, 'differences \n\n');
    fprintf(1, ' gcrf-fk5  %14.9fm \n', mag(recig-reci)*1000 );
    fprintf(1, ' fk5-mod   %14.9fm \n', mag(reci-rmod)*1000 );
    fprintf(1, ' mod-tod   %14.9fm \n', mag(rmod-rtod)*1000 );
    fprintf(1, ' tod-pef   %14.9fm \n', mag(rtod-rpef)*1000 );
    fprintf(1, ' pef-ecef  %14.9fm \n', mag(rpef-recef)*1000 );
    fprintf(1, ' ggcrf-fk5 %14.9fm \n', mag(recigg-reci)*1000 );
    
    
   
    
    % % do sensitivity tests for paper
    % % GEO tests -----------------------------------------------------------
    % recef = [24796.91929150; -34115.87092340; 10.22606210];
    % vecef = [-0.0009791780;	-0.0014765380;	-0.0009287760];
    % aecef = [0.001;0.002;0.003];
    % ddxerror = 0.0001;
    % 
    % % find answer one time
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigans, vecigans, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % fprintf(1, 'GCRF ans      IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigans, vecigans );
    % 
    % % ---- DAT err of 1 sec
    % dat = 31;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c1 dat 1 s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dat = 32;
    % 
    % % ---- TT off by a min
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % dat = dat - 60.0;
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c2 tt 1 m GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dat = dat + 60.0;
    % 
    % % ---- dpsi corretion off by 0.001 arcsec
    % ddx = ddx - ddxerror * conv;  % " to rad
    % ddy = ddy - ddxerror * conv;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c6 ddxy GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % ddx = ddx + ddxerror * conv;  % " to rad
    % ddy = ddy + ddxerror * conv;
    % 
    % % ---- DUT1 off by 0.01 sec
    % dut1 = dut1-0.01;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c3 dut1 0.01s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dut1 = dut1+0.01;
    % 
    % % ---- DUT1 off by 0.25 sec
    % dut1 = dut1-0.25;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c4 dut1 0.25s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dut1 = dut1+0.25;
    % 
    % % ---- UTC error by 1 sec
    % sec = sec - 1;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c5 utc 1s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % sec = sec + 1;
    % fprintf(1, 'ut1 %8.6f tut1 %16.12f jdut1 %18.11f ', ut1, tut1, jdut1+jdut1frac );
    % [h, m, s] = sec2hms( ut1 );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'utc %8.6f ', utc );
    % [h, m, s] = sec2hms( utc );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tai %8.6f', tai );
    % [h, m, s] = sec2hms( tai );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tt  %8.6f ttt  %16.12f jdtt  %18.11f ', tt, ttt, jdtt+jdttfrac );
    % [h, m, s] = sec2hms( tt );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n', tdb, ttdb, jdtdb+jdtdbfrac );
    % 
    % 
    % % LEO tests -----------------------------------------------------------
    % recef = [-1033.4793830;  7901.2952754;  6380.3565958;];
    % vecef = [-3.225636520;  -2.872451450;   5.531924446;];
    % aecef = [0.001;0.002;0.003];
    % 
    % %           recef = [3961.00354581;  6010.75117182; 4619.30093637 ];
    % %           vecef = [-5.315109071309; 3.96813865785; 1.752758565833 ];
    % 
    % % find answer one time
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigans, vecigans, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % fprintf(1, '\n\nGCRF ans      IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigans, vecigans );
    % 
    % % ---- DAT err of 1 sec
    % dat = 31;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c1 dat 1 s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dat = 32;
    % 
    % % ---- TT off by a min
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % dat = dat - 60.0;
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c2 tt 1 m GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dat = dat + 60.0;
    % 
    % % ---- dpsi corretion off by 0.001 arcsec
    % ddx = ddx - ddxerror * conv;  % " to rad
    % ddy = ddy - ddxerror * conv;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c6 ddxy GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % ddx = ddx + ddxerror * conv;  % " to rad
    % ddy = ddy + ddxerror * conv;
    % 
    % % ---- DUT1 off by 0.01 sec
    % dut1 = dut1-0.01;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c3 dut1 0.01s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dut1 = dut1+0.01;
    % 
    % % ---- DUT1 off by 0.25 sec
    % dut1 = dut1-0.25;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1+jdut1frac, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c4 dut1 0.25s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % dut1 = dut1+0.25;
    % 
    % % ---- UTC error by 1 sec
    % sec = sec - 1;
    % [ut1, tut1, jdut1, jdut1frac, utc, tai, tt, ttt, jdtt, jdttfrac, tdb, ttdb, jdtdb, jdtdbfrac ] = convtime ( year, mon, day, hr, min, sec, timezone, dut1, dat );
    % [recigg, vecigg, aecig] = ecef2eciiau06 ( recef, vecef, aecef, ttt, jdut1, lod, xp, yp, 'c', ddx, ddy );
    % %        fprintf(1, 'GCRF          IAU-2006 CIO %14.8f %14.8f %14.8f  v %14.9f %14.9f %14.9f\n', recigg, vecigg );
    % fprintf(1, ' c5 utc 1s GCRF %14.9fm \n', mag(recigans-recigg)*1000 );
    % sec = sec + 1;
    % fprintf(1, 'ut1 %8.6f tut1 %16.12f jdut1 %18.11f ', ut1, tut1, jdut1+jdut1frac );
    % [h, m, s] = sec2hms( ut1 );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'utc %8.6f ', utc );
    % [h, m, s] = sec2hms( utc );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tai %8.6f', tai );
    % [h, m, s] = sec2hms( tai );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tt  %8.6f ttt  %16.12f jdtt  %18.11f ', tt, ttt, jdtt+jdttfrac );
    % [h, m, s] = sec2hms( tt );
    % fprintf(1, 'hms %3i %3i %8.6f \n', h, m, s);
    % fprintf(1, 'tdb %8.6f ttdb %16.12f jdtdb %18.11f\n', tdb, ttdb, jdtdb+jdtdbfrac );
    % 
    % 
    % 

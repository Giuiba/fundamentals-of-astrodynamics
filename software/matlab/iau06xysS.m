        % ----------------------------------------------------------------------------
        %
        %                           function iau06xysS
        %
        %  this function calculates the XYS parameters for the iau2006 cio theory.
        %
        %  author        : david vallado           davallado@gmail.com   16 jul 2004
        %
        %  revisions
        %    vallado     - consolidate with iau 2000                     14 feb 2005
        %
        %  inputs          description                    range / units
        %    ttt         - julian centuries of tt
        %    ddx         - delta x correction to gcrf                       rad
        %    ddy         - delta y correction to gcrf                       rad
        %    l           - delaunay element               rad
        %    ll          - delaunay element               rad
        %    f           - delaunay element               rad
        %    d           - delaunay element               rad
        %    omega       - delaunay element               rad
        %    interp      - interpolation type (x for full series)           x, n, l, s
        %                  none, linear, spline
        %
        %  outputs       :
        %    x           - coordinate of cip              rad
        %    y           - coordinate of cip              rad
        %    s           - coordinate                     rad
        %
        %  locals        :
        %    iau06arr.axs0        - real coefficients for x        rad
        %    iau06arr.a0xi        - integer coefficients for x
        %    iau06arr.ays0        - real coefficients for y        rad
        %    iau06arr.a0yi        - integer coefficients for y
        %    iau06arr.ass0        - real coefficients for s        rad
        %    iau06arr.a0si        - integer coefficients for siau06arr.a0xi
        %    apn         - real coefficients for nutation rad
        %    apni        - integer coefficients for nutation
        %    appl        - real coefficients for planetary nutation rad
        %    appli       - integer coefficients for planetary nutation
        %    ttt2,ttt3,  - powers of ttt
        %    deltaeps    - change in obliquity            rad
        %    many others
        %
        %  coupling      :
        %    iau00in     - initialize the arrays
        %
        %  references    :
        %     vallado       2022, 214-216
        %
        % [x,y,s] = iau06xysS (jdtt, ttt, ddx, ddy, interp, l, l1, f, d, omega, ...
        %    lonmer, lonven, lonear, lonmar, lonjup, lonsat, lonurn, lonnep, precrate )
        % ----------------------------------------------------------------------------

function [x,y,s] = iau06xysS (ttt, iau06arr, fArgs )

        sethelp;

        % " to rad
        convrt  = pi / (180.0*3600.0);
        deg2rad = pi / 180.0;

        ttt2 = ttt  * ttt;
        ttt3 = ttt2 * ttt;
        ttt4 = ttt2 * ttt2;
        ttt5 = ttt3 * ttt2;

    nutLoc = 'D:\Codes\LIBRARY\DataLib\';
    [iau06arr] = iau06in(nutLoc);

        % ---------------- first find x
        % the iers code puts the constants in here, however
        % don't sum constants in here because they're larger than the last few terms
        xsum0 = 0.0;
        for i = 1306: -1 : 1
            tempval = iau06arr.a0xi(i,1)*l + iau06arr.a0xi(i,2)*l1 + iau06arr.a0xi(i,3)*f + iau06arr.a0xi(i,4)*d + iau06arr.a0xi(i,5)*omega + ...
                iau06arr.a0xi(i,6)*lonmer  + iau06arr.a0xi(i,7)*lonven  + iau06arr.a0xi(i,8)*lonear  + iau06arr.a0xi(i,9)*lonmar + ...
                iau06arr.a0xi(i,10)*lonjup + iau06arr.a0xi(i,11)*lonsat + iau06arr.a0xi(i,12)*lonurn + iau06arr.a0xi(i,13)*lonnep + iau06arr.a0xi(i,14)*precrate;
            xsum0 = xsum0 + iau06arr.axs0(i,1)*sin(tempval) + iau06arr.axs0(i,2) * cos(tempval);
        end
        xsum1 = 0.0;
        % note that the index changes here to j. this is because the iau06arr.a0xi etc
        % indicies go from 1 to 1600, but there are 5 groups. the i index counts through each
        % calculation, and j takes care of the individual summations. note that
        % this same process is used for y and s.
        for j = 253: -1 : 1
            i = 1306 + j;
            tempval = iau06arr.a0xi(i,1)*l + iau06arr.a0xi(i,2)*l1 + iau06arr.a0xi(i,3)*f + iau06arr.a0xi(i,4)*d + iau06arr.a0xi(i,5)*omega + ...
                iau06arr.a0xi(i,6)*lonmer  + iau06arr.a0xi(i,7)*lonven  + iau06arr.a0xi(i,8)*lonear  + iau06arr.a0xi(i,9)*lonmar + ...
                iau06arr.a0xi(i,10)*lonjup + iau06arr.a0xi(i,11)*lonsat + iau06arr.a0xi(i,12)*lonurn + iau06arr.a0xi(i,13)*lonnep + iau06arr.a0xi(i,14)*precrate;
            xsum1 = xsum1 + iau06arr.axs0(i,1)*sin(tempval) + iau06arr.axs0(i,2)*cos(tempval);
        end
        xsum2 = 0.0;
        for j = 36: -1 : 1
            i = 1306 + 253 + j;iau06arr.axs0
            tempval = iau06arr.a0xi(i,1)*l + iau06arr.a0xi(i,2)*l1 + iau06arr.a0xi(i,3)*f + iau06arr.a0xi(i,4)*d + iau06arr.a0xi(i,5)*omega + ...
                iau06arr.a0xi(i,6)*lonmer  + iau06arr.a0xi(i,7)*lonven  + iau06arr.a0xi(i,8)*lonear  + iau06arr.a0xi(i,9)*lonmar + ...
                iau06arr.a0xi(i,10)*lonjup + iau06arr.a0xi(i,11)*lonsat + iau06arr.a0xi(i,12)*lonurn + iau06arr.a0xi(i,13)*lonnep + iau06arr.a0xi(i,14)*precrate;
            xsum2 = xsum2 + iau06arr.axs0(i,1)*sin(tempval) + iau06arr.axs0(i,2)*cos(tempval);
        end
        xsum3 = 0.0;
        for j = 4: -1 : 1
            i = 1306 + 253 + 36 + j;
            tempval = iau06arr.a0xi(i,1)*l + iau06arr.a0xi(i,2)*l1 + iau06arr.a0xi(i,3)*f + iau06arr.a0xi(i,4)*d + iau06arr.a0xi(i,5)*omega + ...
                iau06arr.a0xi(i,6)*lonmer  + iau06arr.a0xi(i,7)*lonven  + iau06arr.a0xi(i,8)*lonear  + iau06arr.a0xi(i,9)*lonmar + ...
                iau06arr.a0xi(i,10)*lonjup + iau06arr.a0xi(i,11)*lonsat + iau06arr.a0xi(i,12)*lonurn + iau06arr.a0xi(i,13)*lonnep + iau06arr.a0xi(i,14)*precrate;
            xsum3 = xsum3 + iau06arr.axs0(i,1)*sin(tempval) + iau06arr.axs0(i,2)*cos(tempval);
        end
        xsum4 = 0.0;
        for j = 1: -1 : 1
            i = 1306 + 253 + 36 + 4 + j;
            tempval = iau06arr.a0xi(i,1)*l + iau06arr.a0xi(i,2)*l1 + iau06arr.a0xi(i,3)*f + iau06arr.a0xi(i,4)*d + iau06arr.a0xi(i,5)*omega + ...
                iau06arr.a0xi(i,6)*lonmer  + iau06arr.a0xi(i,7)*lonven  + iau06arr.a0xi(i,8)*lonear  + iau06arr.a0xi(i,9)*lonmar + ...
                iau06arr.a0xi(i,10)*lonjup + iau06arr.a0xi(i,11)*lonsat + iau06arr.a0xi(i,12)*lonurn + iau06arr.a0xi(i,13)*lonnep + iau06arr.a0xi(i,14)*precrate;
            xsum4 = xsum4 + iau06arr.axs0(i,1)*sin(tempval) + iau06arr.axs0(i,2)*cos(tempval);
        end

        x = -0.016617 + 2004.191898 * ttt - 0.4297829 * ttt2 ...
                - 0.19861834 * ttt3 - 0.000007578 * ttt4 + 0.0000059285 * ttt5; % "
        x = x*convrt + xsum0 + xsum1*ttt + xsum2*ttt2 + xsum3*ttt3 + xsum4*ttt4;  % rad

        if iauhelp == 'y'
            fprintf(1,'x %14.12f  %14.12f  %14.12f  %14.12f  %14.12f \n',xsum0/deg2rad,xsum1/deg2rad,xsum2/deg2rad,xsum3/deg2rad,xsum4/deg2rad );
        end

        % ---------------- now find y
        ysum0 = 0.0;
        for i = 962: -1 : 1
            tempval = iau06arr.a0yi(i,1)*l + iau06arr.a0yi(i,2)*l1 + iau06arr.a0yi(i,3)*f + iau06arr.a0yi(i,4)*d + iau06arr.a0yi(i,5)*omega + ...
                iau06arr.a0yi(i,6)*lonmer  + iau06arr.a0yi(i,7)*lonven  + iau06arr.a0yi(i,8)*lonear  + iau06arr.a0yi(i,9)*lonmar + ...
                iau06arr.a0yi(i,10)*lonjup + iau06arr.a0yi(i,11)*lonsat + iau06arr.a0yi(i,12)*lonurn + iau06arr.a0yi(i,13)*lonnep + iau06arr.a0yi(i,14)*precrate;
            ysum0 = ysum0 + iau06arr.ays0(i,1)*sin(tempval) + iau06arr.ays0(i,2) * cos(tempval);
        end

        ysum1 = 0.0;
        for j = 277: -1 : 1
            i = 962 + j;
            tempval = iau06arr.a0yi(i,1)*l + iau06arr.a0yi(i,2)*l1 + iau06arr.a0yi(i,3)*f + iau06arr.a0yi(i,4)*d + iau06arr.a0yi(i,5)*omega + ...
                iau06arr.a0yi(i,6)*lonmer  + iau06arr.a0yi(i,7)*lonven  + iau06arr.a0yi(i,8)*lonear  + iau06arr.a0yi(i,9)*lonmar + ...
                iau06arr.a0yi(i,10)*lonjup + iau06arr.a0yi(i,11)*lonsat + iau06arr.a0yi(i,12)*lonurn + iau06arr.a0yi(i,13)*lonnep + iau06arr.a0yi(i,14)*precrate;
            ysum1 = ysum1 + iau06arr.ays0(i,1)*sin(tempval) + iau06arr.ays0(i,2)*cos(tempval);
        end
        ysum2 = 0.0;
        for j = 30: -1 : 1
            i = 962 + 277 + j;
            tempval = iau06arr.a0yi(i,1)*l + iau06arr.a0yi(i,2)*l1 + iau06arr.a0yi(i,3)*f + iau06arr.a0yi(i,4)*d + iau06arr.a0yi(i,5)*omega + ...
                iau06arr.a0yi(i,6)*lonmer  + iau06arr.a0yi(i,7)*lonven  + iau06arr.a0yi(i,8)*lonear  + iau06arr.a0yi(i,9)*lonmar + ...
                iau06arr.a0yi(i,10)*lonjup + iau06arr.a0yi(i,11)*lonsat + iau06arr.a0yi(i,12)*lonurn + iau06arr.a0yi(i,13)*lonnep + iau06arr.a0yi(i,14)*precrate;
            ysum2 = ysum2 + iau06arr.ays0(i,1)*sin(tempval) + iau06arr.ays0(i,2)*cos(tempval);
        end
        ysum3 = 0.0;
        for j = 5: -1 : 1
            i = 962 + 277 + 30 + j;
            tempval = iau06arr.a0yi(i,1)*l + iau06arr.a0yi(i,2)*l1 + iau06arr.a0yi(i,3)*f + iau06arr.a0yi(i,4)*d + iau06arr.a0yi(i,5)*omega + ...
                iau06arr.a0yi(i,6)*lonmer  + iau06arr.a0yi(i,7)*lonven  + iau06arr.a0yi(i,8)*lonear  + iau06arr.a0yi(i,9)*lonmar + ...
                iau06arr.a0yi(i,10)*lonjup + iau06arr.a0yi(i,11)*lonsat + iau06arr.a0yi(i,12)*lonurn + iau06arr.a0yi(i,13)*lonnep + iau06arr.a0yi(i,14)*precrate;
            ysum3 = ysum3 + iau06arr.ays0(i,1)*sin(tempval) + iau06arr.ays0(i,2)*cos(tempval);
        end
        ysum4 = 0.0;
        for j = 1: -1 : 1
            i = 962 + 277 + 30 + 5 + j;
            tempval = iau06arr.a0yi(i,1)*l + iau06arr.a0yi(i,2)*l1 + iau06arr.a0yi(i,3)*f + iau06arr.a0yi(i,4)*d + iau06arr.a0yi(i,5)*omega + ...
                iau06arr.a0yi(i,6)*lonmer  + iau06arr.a0yi(i,7)*lonven  + iau06arr.a0yi(i,8)*lonear  + iau06arr.a0yi(i,9)*lonmar + ...
                iau06arr.a0yi(i,10)*lonjup + iau06arr.a0yi(i,11)*lonsat + iau06arr.a0yi(i,12)*lonurn + iau06arr.a0yi(i,13)*lonnep + iau06arr.a0yi(i,14)*precrate;
            ysum4 = ysum4 + iau06arr.ays0(i,1)*sin(tempval) + iau06arr.ays0(i,2)*cos(tempval);
        end

        y = -0.006951 - 0.025896 * ttt - 22.4072747 * ttt2 ...
                + 0.00190059 * ttt3 + 0.001112526 * ttt4 + 0.0000001358 * ttt5;
        y = y*convrt + ysum0 + ysum1*ttt + ysum2*ttt2 + ysum3*ttt3 + ysum4*ttt4;  % rad

        if iauhelp == 'y'
            fprintf(1,'y %14.12f  %14.12f  %14.12f  %14.12f  %14.12f \n',ysum0/deg2rad,ysum1/deg2rad,ysum2/deg2rad,ysum3/deg2rad,ysum4/deg2rad );
        end

        % ---------------- now find s
        ssum0 = 0.0;
        for i = 33: -1 : 1
            tempval = iau06arr.a0si(i,1)*l + iau06arr.a0si(i,2)*l1 + iau06arr.a0si(i,3)*f + iau06arr.a0si(i,4)*d + iau06arr.a0si(i,5)*omega + ...
                iau06arr.a0si(i,6)*lonmer  + iau06arr.a0si(i,7)*lonven  + iau06arr.a0si(i,8)*lonear  + iau06arr.a0si(i,9)*lonmar + ...
                iau06arr.a0si(i,10)*lonjup + iau06arr.a0si(i,11)*lonsat + iau06arr.a0si(i,12)*lonurn + iau06arr.a0si(i,13)*lonnep + iau06arr.a0si(i,14)*precrate;
            ssum0 = ssum0 + iau06arr.ass0(i,1)*sin(tempval) + iau06arr.ass0(i,2)*cos(tempval);
        end
        ssum1 = 0.0;
        for j = 3: -1 : 1
            i = 33 + j;
            tempval = iau06arr.a0si(i,1)*l + iau06arr.a0si(i,2)*l1 + iau06arr.a0si(i,3)*f + iau06arr.a0si(i,4)*d + iau06arr.a0si(i,5)*omega + ...
                iau06arr.a0si(i,6)*lonmer  + iau06arr.a0si(i,7)*lonven  + iau06arr.a0si(i,8)*lonear  + iau06arr.a0si(i,9)*lonmar + ...
                iau06arr.a0si(i,10)*lonjup + iau06arr.a0si(i,11)*lonsat + iau06arr.a0si(i,12)*lonurn + iau06arr.a0si(i,13)*lonnep + iau06arr.a0si(i,14)*precrate;
            ssum1 = ssum1 + iau06arr.ass0(i,1)*sin(tempval) + iau06arr.ass0(i,2)*cos(tempval);
        end
        ssum2 = 0.0;
        for j = 25: -1 : 1
            i = 33 + 3 + j;
            tempval = iau06arr.a0si(i,1)*l + iau06arr.a0si(i,2)*l1 + iau06arr.a0si(i,3)*f + iau06arr.a0si(i,4)*d + iau06arr.a0si(i,5)*omega + ...
                iau06arr.a0si(i,6)*lonmer  + iau06arr.a0si(i,7)*lonven  + iau06arr.a0si(i,8)*lonear  + iau06arr.a0si(i,9)*lonmar + ...
                iau06arr.a0si(i,10)*lonjup + iau06arr.a0si(i,11)*lonsat + iau06arr.a0si(i,12)*lonurn + iau06arr.a0si(i,13)*lonnep + iau06arr.a0si(i,14)*precrate;
            ssum2 = ssum2 + iau06arr.ass0(i,1)*sin(tempval) + iau06arr.ass0(i,2)*cos(tempval);
        end
        ssum3 = 0.0;
        for j = 4: -1 : 1
            i = 33 + 3 + 25 + j;
            tempval = iau06arr.a0si(i,1)*l + iau06arr.a0si(i,2)*l1 + iau06arr.a0si(i,3)*f + iau06arr.a0si(i,4)*d + iau06arr.a0si(i,5)*omega + ...
                iau06arr.a0si(i,6)*lonmer  + iau06arr.a0si(i,7)*lonven  + iau06arr.a0si(i,8)*lonear  + iau06arr.a0si(i,9)*lonmar + ...
                iau06arr.a0si(i,10)*lonjup + iau06arr.a0si(i,11)*lonsat + iau06arr.a0si(i,12)*lonurn + iau06arr.a0si(i,13)*lonnep + iau06arr.a0si(i,14)*precrate;
            ssum3 = ssum3 + iau06arr.ass0(i,1)*sin(tempval) + iau06arr.ass0(i,2)*cos(tempval);
        end
        ssum4 = 0.0;
        for j = 1: -1 : 1
            i = 33 + 3 + 25 + 4 + j;
            tempval = iau06arr.a0si(i,1)*l + iau06arr.a0si(i,2)*l1 + iau06arr.a0si(i,3)*f + iau06arr.a0si(i,4)*d + iau06arr.a0si(i,5)*omega + ...
                iau06arr.a0si(i,6)*lonmer  + iau06arr.a0si(i,7)*lonven  + iau06arr.a0si(i,8)*lonear  + iau06arr.a0si(i,9)*lonmar + ...
                iau06arr.a0si(i,10)*lonjup + iau06arr.a0si(i,11)*lonsat + iau06arr.a0si(i,12)*lonurn + iau06arr.a0si(i,13)*lonnep + iau06arr.a0si(i,14)*precrate;
            ssum4 = ssum4 + iau06arr.ass0(i,1)*sin(tempval) + iau06arr.ass0(i,2)*cos(tempval);
        end

            s = 0.000094 + 0.00380865 * ttt - 0.00012268 * ttt2  ...
                - 0.07257411 * ttt3 + 0.00002798 * ttt4 + 0.00001562 * ttt5; % ...
        %            + 0.00000171*ttt*sin(omega) + 0.00000357*ttt*cos(2.0*omega) ...
        %            + 0.00074353*ttt2*sin(omega) + 0.00005691*ttt2*sin(2.0*(f-d+omega)) ...
        %            + 0.00000984*ttt2*sin(2.0*(f+omega)) - 0.00000885*ttt2*sin(2.0*omega);
        s = -x*y*0.5 + s*convrt + ssum0 + ssum1*ttt + ssum2*ttt2 + ssum3*ttt3 + ssum4*ttt4;  % rad

        if iauhelp == 'y'
            fprintf(1,'s %14.12f  %14.12f  %14.12f  %14.12f  %14.12f \n',ssum0/deg2rad,ssum1/deg2rad,ssum2/deg2rad,ssum3/deg2rad,ssum4/deg2rad );
        end


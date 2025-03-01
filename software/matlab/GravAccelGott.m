%
%        function GravAccelGott
%
% inputs
%    mu       gravitaional paramater
%    xin      position ecef vector of satellite km
%    c, s     gravity coefficients normalized
%    nax      degree
%    max      order
%    rnp      3x3 identity matrix
% 
% outputs
%    accel    eci frame acceeration (km/s^2
%    LegGottN  normalized alfs   does not need to be passed back out - only
%    for debugging.
%
%  References
%    Eckman, Brown, Adamo 2016 NASA report
%

function [LegGottN, accel] = GravAccelGott(recef, gravarr, degree, order)
    constastro;
    
    % calculate partial of acceleration wrt state
    partials = 'n';

    % this can be done ahead of time
    % these are 0 based arrays since they start at 2
    for n = 2:degree+1 %RAE
        norm1(n) = sqrt((2*n+1.0) / (2*n-1.0)); % eq 3-1 RAE
        norm2(n) = sqrt((2*n+1.0) / (2*n-3.0)); % eq 3-2 RAE
        norm11(n) = sqrt((2*n+1.0) / (2*n))/(2*n-1.0); % eq 3-3 RAE
        normn10(n) = sqrt((n+1.0)*n * 0.5); % RAE
        
        for m = 1:n %RAE
            norm1m(n,m) = sqrt((n-m)*(2*n+1.0) / ((n+m)*(2*n-1.0))); % eq 3-4 RAE
            norm2m(n,m) = sqrt((n-m)*(n-m-1.0)*(2*n+1.0) / ((n+m)*(n+m-1.0)*(2*n-3.0))); % eq 3-5 RAE
            normn1(n,m) = sqrt((n+m+1.0)*(n-m)); % part of eq 3-9 RAE
        end %RAE
    end %RAE
    
    %x = rnp*xin; %RAE
    r = sqrt(recef(1)^2 + recef(2)^2 + recef(3)^2);
    ri = 1.0/r;
    xor = recef(1)*ri;
    yor = recef(2)*ri;
    zor = recef(3)*ri;
    sinlat = zor;
    reor = re*ri;
    reorn = reor;
    muor2 = mu*ri*ri;
    
    LegGottN(1,1) = 1.0; %RAE
    LegGottN(1,2) = 0.0; %RAE
    LegGottN(1,3) = 0.0; %RAE
    LegGottN(2,2) = sqrt(3.0); %RAE %norm 
    LegGottN(2,3) = 0.0; %RAE
    LegGottN(2,4) = 0.0; %RAE

    % --------------- sectoral 
    for n = 2:degree %RAE
        ni = n+1; %RAE
        LegGottN(ni,ni) = norm11(n)*LegGottN(n,n)*(2*n-1.0); %eq 3-15 RAE %norm
        LegGottN(ni,ni+1) = 0.0; %RAE
        LegGottN(ni,ni+2) = 0.0; %RAE
    end

    ctil(1) = 1.0; %RAE
    stil(1) = 0.0; %RAE
    ctil(2) = xor; %RAE
    stil(2) = yor; %RAE
    sumh = 0.0;
    sumgm = 1.0;  
    sumj = 0.0;
    sumk = 0.0;
    LegGottN(2,1) = sqrt(3)*sinlat; %RAE %norm 

    for n=2:degree
        ni = n + 1; %RAE
        reorn = reorn*reor;
        n2m1 = n + n - 1;
        nm1 = n - 1;
        np1 = n + 1;

        % --------------- tesserals(ni, m=ni-1) initial value
        LegGottN(ni,n) = normn1(n,n-1)*sinlat*LegGottN(ni,ni); %RAE %norm

        % --------------- zonals (ni, m=1)
        LegGottN(ni,1) = (n2m1*sinlat*norm1(n)*LegGottN(n,1) - nm1*norm2(n)*LegGottN(nm1,1))/n; % eq 3-17 RAE %norm
%fprintf(1,'%11.7f  %11.7f  %11.7f  %11.7f  ',norm1(n),LegGottN(n,1),norm2(n),LegGottN(nm1,1))

        % --------------- tesseral (n,m=2) initial value
        LegGottN(ni,2) = (n2m1*sinlat*norm1m(n,1)*LegGottN(n,2) - n*norm2m(n,1)*LegGottN(nm1,2))/(nm1); %RAE %norm

        sumhn = normn10(n)*LegGottN(ni,2)*gravarr.cNor(ni,1); %norm %RAE
        sumgmn = LegGottN(ni,1)*gravarr.cNor(ni,1)*np1; %RAE

        if partials == 'y'
            sumvn = pn(0) * gravarr.cNor(ni,1);
            summn = pn(2) * gravarr.cNor(ni,1)*upsn(O);
            sumpn = sumhn * np1;
            sumln = sumgamn * (np1 + 1.0);
        end

        if (order>0)
            for m = 2:n-2
                mi = m+1; %RAE
                % --------------- tesseral (n,m)
                LegGottN(ni,mi) = (n2m1*sinlat*norm1m(n,m)*LegGottN(n,mi) - ...
                    (nm1+m)*norm2m(n,m)*LegGottN(nm1,mi)) / (n-m); % eq 3-18 RAE %norm
            end  % for

            sumjn = 0.0;
            sumkn = 0.0;
            if partials == 'y'
                sumnn = 0.0;
                sumon = 0.0;
                sumqn = 0.0;
                sumrn = 0.0;
                sumsn = 0.0;
                sumtn = 0.0;    
            end
            ctil(ni) = ctil(2)*ctil(ni-1) - stil(2)*stil(ni-1); %RAE
            stil(ni) = stil(2)*ctil(ni-1) + ctil(2)*stil(ni-1); %RAE
            if n < order
                lim = n;
            else
                lim = order;
            end

            for m = 1:lim
                mi = m+1; %RAE
                mm1 = mi-1; %RAE
                mp1 = mi+1; %RAE
                mxpnm = m * LegGottN(ni,mi); %RAE
                bnmtil = gravarr.cNor(ni,mi) * ctil(mi) + gravarr.sNor(ni,mi) * stil(mi); %RAE
                sumhn = sumhn + normn1(n,m) * LegGottN(ni,mp1) * bnmtil; %RAE %norm
                sumgmn = sumgmn + (n+m+1) * LegGottN(ni,mi) * bnmtil; %RAE
                bnmtm1 = gravarr.cNor(ni,mi) * ctil(mm1) + gravarr.sNor(ni,mi) * stil(mm1); %RAE
                anmtm1 = gravarr.cNor(ni,mi) * stil(mm1) - gravarr.sNor(ni,mi) * ctil(mm1); %RAE
                sumjn = sumjn + mxpnm * bnmtm1;
                sumkn = sumkn - mxpnm * anmtm1;

                if partials == 'y'
                    npmpl = ni + mp1;
                    pnm = pn(mi);
                    pnmp1 = pn(mp1);
                    cnm = c(mi, 1);
                    snm = s(mi, 1);
                    ctil = ctil(mm1);
                    stil = stil(mm1);

                    bnmtml = cnm * ctil + snm * stil;
                    pnmbnm = pnm * bnmtll;
                    sumvn = sumvn + pnmbnm;
                    if m < n
                        z_pnmpl = zn(m) * pn(mpl);
                        sumhn = sumhn + z_pnmpl * bnmtil;
                        sumpn = sumpn + npmpl * z_pnmpl * bnmtil;
                        sumqn = sumqn + M * z_pnmp1 * bnmtml;
                        sumrn = sumrn- M * z_pnmpl * anmtml;
                    end
                    sumln = sumln + npmpl * (mpl + npl) *pnmbnm;
                    summn = summn + pn(mp2) * bnmtil*upsn(m);
                    sumsn = sumsn + npmpl * mxpnm * bnmtm1;
                    sumtn = sumtn - npmp1 * mxpnm * anmtml;
                    if m >= 2
                        mm2 = m - 2;
                        sumnn = sumnn + mml * mxpnm * (cnm * ctil(mm2) + snm*stil(mm2));
                        sumon = sumon + mml * mxpnm * (cnm * stil(mm2) - snm*ctil(mm2));
                    end
                end

            end  % for

            sumj = sumj + reorn*sumjn;
            sumk = sumk + reorn*sumkn;
            if partials == 'y'
                sumn = sumn + reorn* sumnn;
                sumo = sumo + reorn* sumon;
                sumq = sumq + reorn* sumqn;
                sumr = sumr + reorn* sumrn;
                sums = sums + reorn* sumsn;
                sumt = sumt + reorn* sumtn; 
            end
        end  % if

        % these will have values when m == 0
        sumh = sumh + reorn*sumhn;
        sumgm = sumgm + reorn*sumgmn;
        if partials == 'y'
            sumv = sumv + reorn * sumvn;
            suml = suml + reorn * sumln;
            summ = summ + reorn * summn;
            sump = sump + reorn * sumpn;
        end
    end  % for

    lambda = sumgm + sinlat*sumh;
    % muor2 = -1.0;
    accel(1) = -muor2*(lambda*xor - sumj);
    accel(2) = -muor2*(lambda*yor - sumk);
    accel(3) = -muor2*(lambda*zor - sumh);
    %accel = rnp'*g; %RAE

    if partials == 'y'
        pot = muor * sumv;
        % Need to construct second partial matr1x_3x3
        gg = -(summ * sinlat + sump + sumh);
        ff = suml + lambda + sinlat * (sump + sumh - gg);
        d1 = sinlat * sumq + sums;
        d2 = sinlat * sumr + sumt;
        dgdx (1, 1) = muor3 * ((ff* xovr- 2.0 * d1) * xovr - lambda + sumn);
        dgdx (2, 2) = muor3 * ((ff * yovr - 2.0 * d2) * yovr - lambda - sumn);
        dgdx (3, 3) = muor3 * ((ff * zovr + 2.0 * gg) * zovr - lambda + summ);
        temp = muor3 * ((ff * yovr - d2) * xovr - d1 * yovr - sumo);
        dgdx (1, 2) = temp;
        dgdx (2, 1) = temp;
        temp = muor3 * ((ff* xovr - d1) * zovr + gg * xovr + sumq);
        dgdx (1, 3) = temp;
        dgdx (3, 1) = temp;
        temp = muor3 * ((ff * yovr - d2) * zovr + gg * yovr + sumr);
        dgdx (2, 3) = temp;
        dgdx (3, 2) = temp;
    end

end  % GravAccelGott

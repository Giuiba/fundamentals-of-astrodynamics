% ----------------------------------------------------------------------------
%
%                           function GravAccelGTDS
%
%   this function finds the acceleration for the gravity field.
%
%  author        : david vallado                    719-573-2600  10 oct 2019
%
%  inputs        description                                   range / units
%    recef       - position vector ECEF                          km
%    order       - size of gravity field                         1..360
%    normal      - normalized in file                            'y', 'n'
%    gravData    - gravitational coefficients  
%
%  outputs       :
%    apert       - efc perturbation acceleration                  km / s^2
%
%  locals :
%    conv        - conversion to normalize
%    L, m        - degree and order indices
%    trigArr     - array of trigonometric terms
%    LegArr      - array of Legendre polynomials
%    VArr        - array of trig terms
%    WArr        - array of trig terms
%
%  coupling      :
%   LegPoly      - find the unnormalized Legendre polynomials through recursion
%   TrigPoly     - find the trigonmetric terms through recursion
%
%  references :
%    vallado       2013, 597, Eq 8-57
%
%  [aPert, aPert1, aPert2] = GravAccelGTDS ( recef, gravarr, degree, order);
% ----------------------------------------------------------------------------

function [aPert, aPert1, aPert2] = GravAccelGTDS ( recef, gravarr, degree, order)
    constastro;

    % aPert = zeros(order+3,order+3);
    % aPert1 = zeros(order+3,order+3);

    sumM1 = 0.0;
    sumM2 = 0.0;
    sumM3 = 0.0;

    % --------------------find latgc and lon---------------------- }
    [latgc, latgd, lon, hellp] = ecef2ll(recef);

    % ---------------------Find Legendre polynomials -------------- }
    [legarrMU, legarrGU, legarrMN, legarrGN] = legpolyn(latgc, degree+2);

    [trigarr, VArr, WArr] = trigpoly(recef, latgc, lon, degree+2);

    magr = mag(recef);
    oor = 1.0 / magr;
    ror = re * oor;
    distPartR = 0.0;
    distPartPhi = 0.0;
    distPartLon = 0.0;

    for L = 2: degree
        Li = L + 1;

        % will do the power as each L is found
        temp = ror * ror;
        sumM1 = 0.0;
        sumM2 = 0.0;
        sumM3 = 0.0;

        for m = 0 : L
            mi = m + 1;
            temparg = gravarr.cNor(Li, mi) * trigarr(mi, 1+1) + gravarr.sNor(Li, mi) * trigarr(mi, 0+1);
            sumM1 = sumM1 + legarrGN(Li, mi) * temparg;
            sumM2 = sumM2 + (legarrGN(Li, mi + 1) - trigarr(mi, 2+1) * legarrGN(Li, mi)) * temparg;  % yes m+1 in 1st legp
            sumM3 = sumM3 + m * legarrGN(Li, mi) * (gravarr.sNor(Li, mi) * trigarr(mi, 1+1) - gravarr.cNor(Li, mi) * trigarr(mi, 0+1));
        end % for m

        distPartR = distPartR + temp * (L + 1) * sumM1;  % needs -mu/r^2
        distPartPhi = distPartPhi + temp * sumM2;  % needs mu/r
        distPartLon = distPartLon + temp * sumM3;  % needs mu/r
    end % for L

    muor = mu * oor;
    distPartR = -muor * oor * distPartR;
    distPartPhi = muor * distPartPhi;
    distPartLon = muor * distPartLon;

    %fprintf(1,'----------Non - spherical perturbative acceleration ------------ \n');
    RDelta = sqrt(recef(1) * recef(1) + recef(2) * recef(2));
    oordelta = 1.0 / RDelta;
    temp1 = oor * distPartR - recef(3) * oor * oor * oordelta * distPartPhi;

    % two-body term
    tmp(1) = mu / (magr^3);
    tmp(2) = mu / (magr^3);
    tmp(3) = mu / (magr^3);

    aPert(1) = temp1 * recef(1) - oordelta * oordelta * distPartLon * recef(2);
    aPert(2) = temp1 * recef(2) + oordelta * oordelta * distPartLon * recef(1);
    aPert(3) = oor * distPartR * recef(3) + oor * oor * RDelta * distPartPhi;

    % add in two-body
    % aPert(1) = aPert(1) + tmp(1)*recef(1);
    % aPert(2) = aPert(2) + tmp(2)*recef(2);
    % aPert(3) = aPert(3) + tmp(3)*recef(3);

    % --------------- montenbruck approach
    aPert1(1) = 0.0;
    aPert1(2) = 0.0;
    aPert1(3) = 0.0;
    magrecef = mag(recef);
    for L = 2: degree
        Li = L + 1;
        % will do the power as each L is indexed }
        temp = mu / (magrecef * magrecef);

        for m = 0 : L
            mi = m + 1;
            temp1 = factorial(L - m + 2) / factorial(L - m);

            % unnormalized
            % if (m == 0)
            %     aPert1(1) = aPert1(1) + temp * (-gravData.c(Li, mi) * VArr(L + 1, 1));
            %     aPert1(2) = aPert1(2) + temp * (-gravData.c(Li, mi) * WArr(L + 1, 1));
            % else
            %     aPert1(1) = aPert1(1) + 0.5 * temp * ((-gravData.c(Li, mi) * VArr(L + 1, m + 1) - gravData.s(Li, mi) * WArr(L + 1, m + 1)) +...
            %         temp1 * (gravData.c(Li, mi) * VArr(L + 1, m - 1) + gravData.s(L, m) * WArr(L + 1, m - 1)));
            %     aPert1(2) = aPert1(2) + 0.5 * temp * ((-gravData.c(Li, mi) * WArr(L + 1, m + 1) + gravData.s(Li, mi) * VArr(L + 1, m + 1)) +...
            %         temp1 * (-gravData.c(Li, mi) * WArr(L + 1, m - 1) + gravData.s(Li, mi) * VArr(L + 1, m - 1)));
            % end
            % aPert1(3) = aPert1(3) + temp * ((L - m + 1) * (-gravData.c(Li, mi) * VArr(L + 1, m) - gravData.s(Li, mi) * WArr(L + 1, m)));

            % normalized
            if (m == 0)
                aPert1(1) = aPert1(1) + temp * (-gravarr.cNor(Li, mi) * VArr(Li, 1));
                aPert1(2) = aPert1(2) + temp * (-gravarr.cNor(Li, mi) * WArr(Li, 1));
            else
                aPert1(1) = aPert1(1) + 0.5 * temp * ((-gravarr.cNor(Li, mi) * VArr(Li, mi) - gravarr.sNor(Li, mi) * WArr(Li, mi)) + ...
                    temp1 * (gravarr.cNor(L, m) * VArr(Li, mi - 1) + gravarr.sNor(Li, mi) * WArr(Li, mi - 1)));
                aPert1(2) = aPert1(2) + 0.5 * temp * ((-gravarr.cNor(Li, mi) * WArr(Li, mi) + gravarr.sNor(Li, mi) * VArr(Li, mi)) + ...
                    temp1 * (-gravarr.cNor(Li, mi) * WArr(Li, mi - 1) + gravarr.sNor(Li, mi) * VArr(Li, mi - 1)));
            end
            aPert1(3) = aPert1(3) + temp * ((L - m + 1) * (-gravarr.cNor(Li, mi) * VArr(Li, mi) - gravarr.sNor(Li, mi) * WArr(Li, mi)));
        end % for m
    end
    fprintf(1,'accel apertMont  %14.10f  %14.10f  %14.10f \n',aPert1(1), aPert1(2), aPert1(3));

    %             int n;                           % Loop counters
    %             double r_sqr, rho, Fac;               % Auxiliary quantities
    %             double x0, y0, z0;                      % Normalized coordinates
    %             double ax, ay, az;                      % Acceleration vector
    %             double C, S;                           % Gravitational coefficients
    %             double(,) V = new double(order+2, order + 2);
    %             double(,) W = new double(order+2, order + 2);

    % now try montenbruck code approach
    aPert2(1) = 0.0;
    aPert2(2) = 0.0;
    aPert2(3) = 0.0;
    
    % Body-fixed position
    % r_bf = E * r;
    % Auxiliary quantities
    r_sqr = dot(recef, recef);               % Square of distance
    rho = re * re / r_sqr;
    x0 = re * recef(1) / r_sqr;          % Normalized
    y0 = re * recef(2) / r_sqr;          % coordinates
    z0 = re * recef(3) / r_sqr;

    % Evaluate harmonic functions
    %   V_nm = (R_ref/r)^(n+1) * P_nm(sin(phi)) * cos(m*lambda)
    % and
    %   W_nm = (R_ref/r)^(n+1) * P_nm(sin(phi)) * sin(m*lambda)
    % up to degree and order n_max+1
    % Calculate zonal terms V(n,0); set W(n,0)=0.0

    V(0+1, 0+1) = re / sqrt(r_sqr);
    W(0+1, 0+1) = 0.0;
    V(1+1, 0+1) = z0 * V(0+1, 0+1);
    W(1+1, 0+1) = 0.0;
    for n = 2: degree
        ni = n + 1;
        V(ni, 0+1) = ((2 * n - 1) * z0 * V(ni - 1, 0+1) - (n - 1) * rho * V(ni - 2, 0+1)) / n;
        W(ni, 0+1) = 0.0;
    end

    % Calculate tesseral and sectorial terms
    for m = 1:order+1
        mi = m + 1;
        % Calculate V(m,m) .. V(n_max+1,m)
        V(mi, mi) = (2 * m - 1) * (x0 * V(mi - 1, mi - 1) - y0 * W(mi - 1, mi - 1));
        W(mi, mi) = (2 * m - 1) * (x0 * W(mi - 1, mi - 1) + y0 * V(mi - 1, mi - 1));
        if (m <= order)
            V(mi + 1, mi) = (2 * mi) * z0 * V(mi, mi);
            W(mi + 1, mi) = (2 * mi) * z0 * W(mi, mi);
        end
        for n = m + 2: order + 1
            ni = n + 1;
            V(ni, mi) = ((2 * n - 1) * z0 * V(ni - 1, mi) - (n + m - 1) * rho * V(ni - 2, mi)) / (n - m);
            W(ni, mi) = ((2 * n - 1) * z0 * W(ni - 1, mi) - (n + m - 1) * rho * W(ni - 2, mi)) / (n - m);
        end
    end

    % Calculate accelerations ax,ay,az
    for m = 0:order
        mi = m + 1;
        for (n = m:degree)
            ni = n + 1;
            if (m == 0)
                C = gravarr.cNor(ni, 1);   % = C_n,0
                aPert2(1) = aPert2(1) - C * V(ni, 1);
                aPert2(2) = aPert2(2) - C * W(ni, 1);
                aPert2(3) = aPert2(3) - (n + 1) * C * V(ni, 0+1);
            else
                C = gravarr.cNor(ni, mi);   % = C_n,m
                S = gravarr.sNor(mi - 1, ni); % = S_n,m
                Fac = 0.5 * (n - m + 1) * (n - m + 2);
                aPert2(1) = aPert2(1) + 0.5 * (-C * V(ni, mi) - S * W(ni, mi))...
                    + Fac * (+C * V(ni, mi - 1) + S * W(ni, mi - 1));
                aPert2(2) = aPert2(2) + 0.5 * (-C * W(ni, mi) + S * V(ni, mi))...
                    + Fac * (-C * W(ni, mi - 1) + S * V(ni, mi - 1));
                aPert2(3) = aPert2(3)+(n - m + 1) * (-C * V(ni, mi) - S * W(ni, mi));
            end
        end
    end

    % Body-fixed acceleration
    aPert2(1) = (mu / (re * re)) * aPert2(1);
    aPert2(2) = (mu / (re * re)) * aPert2(2);
    aPert2(3) = (mu / (re * re)) * aPert2(3);

    % Inertial acceleration
    %return Transp(E) * a_bf;

end  % GravAccelGTDS

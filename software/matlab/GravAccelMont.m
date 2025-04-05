% ----------------------------------------------------------------------------
%
%                           function GravAccelMont
%
%   this function finds the acceleration for the gravity field. the acceleration is
%   found in the body fixed frame. rotation back to inertial is done after this
%   routine. this is the montenbruck  approach.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs        description                                   range / units
%    recef       - position vector ECEF                          km
%    gravarr     - gravitational coefficients
%    normArr     - normalization coefficients
%    degree      - degree of gravity field                        1..85
%    order       - order of gravity field                         1..85
%
%  outputs       :
%    apert       - efc perturbation acceleration                  km / s^2
%
%  locals :
%    L, m        - degree and order indices
%    LegArr      - array of Legendre polynomials
%    VArr        - array of trig terms
%    WArr        - array of trig terms
%
%  coupling      :
%   LegPoly      - find the unnormalized Legendre polynomials through recursion
%
%  references :
%    vallado       2022, 600
%
%  [aPert, aPert1] = GravAccelMont ( recef, gravarr, normArr, degree, order);
% ----------------------------------------------------------------------------

function [aPert] = GravAccelMont ( recef, gravarr, normArr, degree, order)
    constastro;

    % find normalized values - can be done ahead of time
    [normArr] = gravnorm(degree + 1);

    % --------------------find latgc and lon----------------------
    [latgc, latgd, lon, hellp] = ecef2ll(recef);

    % ---------------------Find Legendre polynomials --------------
    [legarrMU, legarrMN] = legpolyMont (latgc, normArr, degree, order);

    [VArr, WArr] = trigpolyMont(recef, latgc, degree+2);

    aPert(1) = 0.0;
    aPert(2) = 0.0;
    aPert(3) = 0.0;

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
    for n = 2: degree + 1
        ni = n + 1;
        %conv = unnormArr(L, m);
        V(ni, 0+1) = ((2 * n - 1) * z0 * V(ni - 1, 0+1) - (n - 1) * rho * V(ni - 2, 0+1)) / n;
        W(ni, 0+1) = 0.0;
    end

    % Calculate tesseral and sectorial terms
    for m = 1:order + 1
        mi = m + 1;
        % Calculate V(m,m) .. V(n_max+1,m)
        V(mi, mi) = (2 * m - 1) * (x0 * V(mi - 1, mi - 1) - y0 * W(mi - 1, mi - 1));
        W(mi, mi) = (2 * m - 1) * (x0 * W(mi - 1, mi - 1) + y0 * V(mi - 1, mi - 1));
        if (m <= degree)
            V(mi + 1, mi) = (2 * m + 1) * z0 * V(mi, mi);
            W(mi + 1, mi) = (2 * m + 1) * z0 * W(mi, mi);
        end
        for n = m + 2: degree + 1
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
                aPert(1) = aPert(1) - C * V(ni + 1, 2);
                aPert(2) = aPert(2) - C * W(ni + 1, 2);
                aPert(3) = aPert(3) - (n + 1) * C * V(ni, 0+1);
            else
                C = gravarr.cNor(ni, mi);   % = C_n,m
                S = gravarr.sNor(ni, mi);   % = S_n,m
                Fac = 0.5 * (n - m + 1) * (n - m + 2);
                conv = normArr(ni, mi) / normArr(ni + 1, mi + 1);
                conv1 = normArr(ni, mi) / normArr(ni + 1, mi- 1);

                aPert(1) = aPert(1) + 0.5 * conv * (-C * V(ni + 1, mi + 1) - S * W(ni + 1, mi + 1))...
                    + Fac * conv1 * (+C * V(ni + 1, mi - 1) + S * W(ni + 1, mi - 1));
                aPert(2) = aPert(2) + 0.5 * conv * (-C * W(ni + 1, mi + 1) + S * V(ni + 1, mi + 1))...
                    + Fac * conv1 * (-C * W(ni + 1, mi - 1) + S * V(ni + 1, mi - 1));
                aPert(3) = aPert(3)+(n - m + 1) * (-C * V(ni + 1, mi) - S * W(ni + 1, mi));
            end
        end
    end

    % Body-fixed acceleration
    temp = mu / (re * re);
    aPert(1) = temp * aPert(1);
    aPert(2) = temp * aPert(2);
    aPert(3) = temp * aPert(3);

end  % GravAccelMont

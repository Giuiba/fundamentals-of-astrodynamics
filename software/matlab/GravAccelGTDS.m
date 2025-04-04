% ----------------------------------------------------------------------------
%
%                           function GravAccelGTDS
%
%   this function finds the acceleration for the gravity field using the 
%     GTDS approach.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
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
%  [aPert] = GravAccelGTDS ( recef, gravarr, degree, order);
% ----------------------------------------------------------------------------

function [aPert] = GravAccelGTDS ( recef, gravarr, degree, order)
    constastro;

    % aPert = zeros(order+3,order+3);
    % aPert1 = zeros(order+3,order+3);

    sumM1 = 0.0;
    sumM2 = 0.0;
    sumM3 = 0.0;

    % --------------------find latgc and lon---------------------- 
    [latgc, latgd, lon, hellp] = ecef2ll(recef);

    % ---------------------Find Legendre polynomials -------------- 
    % this could probably be done ahead of time
    [legarrMU, legarrGU, legarrMN, legarrGN, LegGottN] = legpolyn(latgc, degree+2, order+2);

    [trigarr, VArr, WArr] = trigpoly(recef, latgc, lon, degree+2);

    magr = mag(recef);
    oor = 1.0 / magr;
    ror = re * oor;
    dRdr = 0.0;
    dRdlat = 0.0;
    dRdlon = 0.0;

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
%fprintf(1,'%20.14f  %20.14f  %20.14f  %20.14f  %20.14f  \n', sumM2, legarrGN(Li, mi + 1), trigarr(mi, 2+1), legarrGN(Li, mi), temparg);
            sumM3 = sumM3 + m * legarrGN(Li, mi) * (gravarr.sNor(Li, mi) * trigarr(mi, 1+1) - gravarr.cNor(Li, mi) * trigarr(mi, 0+1));
        end % for m

        dRdr = dRdr + temp * (L + 1) * sumM1;  % needs -mu/r^2
        dRdlat = dRdlat + temp * sumM2;  % needs mu/r
        dRdlon = dRdlon + temp * sumM3;  % needs mu/r
    end % for L

    muor = mu * oor;
    dRdr = -muor * oor * dRdr;
    dRdlat = muor * dRdlat;
    dRdlon = muor * dRdlon;

    %fprintf(1,'----------Non - spherical perturbative acceleration ------------ \n');
    RDelta = sqrt(recef(1) * recef(1) + recef(2) * recef(2));
    oordeltasqrt = 1.0 / RDelta;
    temp1 = oor * dRdr - recef(3) * oor * oor * oordeltasqrt * dRdlat;

    % two-body term
    tmp(1) = mu / (magr^3);
    tmp(2) = mu / (magr^3);
    tmp(3) = mu / (magr^3);

    aPert(1) = temp1 * recef(1) - oordeltasqrt * oordeltasqrt * dRdlon * recef(2);
    aPert(2) = temp1 * recef(2) + oordeltasqrt * oordeltasqrt * dRdlon * recef(1);
    aPert(3) = oor * dRdr * recef(3) + oor * oor * RDelta * dRdlat;

    % add in two-body
    % aPert(1) = aPert(1) + tmp(1)*recef(1);
    % aPert(2) = aPert(2) + tmp(2)*recef(2);
    % aPert(3) = aPert(3) + tmp(3)*recef(3);

end  % GravAccelGTDS

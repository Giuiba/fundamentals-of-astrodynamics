% ----------------------------------------------------------------------------
%
%                           function legpolyGott
%
%   this function finds the Legendre polynomials for the gravity field. fortran 
%   and matlab implementations will have indicies of +1 as they start at 1. the 
%   Gottlieb approach is valid for very large gravity fields, but will "not" 
%   match values calulated in the acceleration becuase the recursions are 
%   formulated to be consistent with large gravty fields. 
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs        description                                   range / units
%    latgc       - Geocentric lat of satellite                   pi to pi rad
%    lon         - longitude of satellite                        0 - 2pi rad
%    degree      - degree of gravity field                        1..2160
%    order       - order of gravity field                         1..2160
%
%  outputs       :
%    LegGottN    - array of normalized Legendre polynomials gottlieb
%
%  locals :
%    L,m         - degree and order indices
%
%  coupling      :
%   none
%
%  references :
%    vallado       2022, 600
%
%   [LegGottN] = legpolyGott (latgc, degree, order);
%  ----------------------------------------------------------------------------

function [LegGottN] = legpolyGott (latgc, degree, order)
  
    sinlat = sin(latgc);

    % ------------------------  gottlieb approach ------------------------
    % these are 0 based arrays since they start at 2
    for L = 2:degree+1 %RAE
        norm1(L) = sqrt((2*L+1.0) / (2*L-1.0)); % eq 3-1 RAE
        norm2(L) = sqrt((2*L+1.0) / (2*L-3.0)); % eq 3-2 RAE
        norm11(L) = sqrt((2*L+1.0) / (2*L))/(2*L-1.0); % eq 3-3 RAE
        normn10(L) = sqrt((L+1.0)*L * 0.5); % RAE
        
        for m = 1:L %RAE
            norm1m(L,m) = sqrt((L-m)*(2*L+1.0) / ((L+m)*(2*L-1.0))); % eq 3-4 RAE
            norm2m(L,m) = sqrt((L-m)*(L-m-1.0)*(2*L+1.0) / ((L+m)*(L+m-1.0)*(2*L-3.0))); % eq 3-5 RAE
            normn1(L,m) = sqrt((L+m+1.0)*(L-m)); % part of eq 3-9 RAE
        end %RAE
    end %RAE
    
    LegGottN(1,1) = 1.0; %RAE
    LegGottN(1,2) = 0.0; %RAE
    LegGottN(1,3) = 0.0; %RAE
    LegGottN(2,2) = sqrt(3.0) * cos(latgc); %RAE * coslat if comparing legpoly 
    LegGottN(2,3) = 0.0; %RAE
    LegGottN(2,4) = 0.0; %RAE

    % --------------- sectoral 
    for L = 2:degree %RAE
        Li = L+1; %RAE
        LegGottN(Li,Li) = norm11(L)*LegGottN(L,L)*(2*L-1.0) * cos(latgc); %eq 3-15 * coslat if comparing legpoly 
        LegGottN(Li,Li+1) = 0.0; %RAE
        LegGottN(Li,Li+2) = 0.0; %RAE
    end

    LegGottN(2,1) = sqrt(3)*sinlat; %RAE %norm 

    for L=2:degree
        Li = L + 1; %RAE
        L2m1 = L + L - 1;
        Lm1 = L - 1;
        Lp1 = L + 1;

        % --------------- tesserals(ni, m=ni-1) initial value
        LegGottN(Li,L) = normn1(L,L-1)*sinlat*LegGottN(Li,Li); %RAE %norm

        % --------------- zonals (ni, m=1)
        LegGottN(Li,1) = (L2m1*sinlat*norm1(L)*LegGottN(L,1) - Lm1*norm2(L)*LegGottN(Lm1,1))/L; % eq 3-17 RAE %norm

        % --------------- tesseral (n,m=2) initial value
        LegGottN(Li,2) = (L2m1*sinlat*norm1m(L,1)*LegGottN(L,2) - L*norm2m(L,1)*LegGottN(Lm1,2))/(Lm1); %RAE %norm

        if (order>0)
            for m = 2:L-1 % eckman wrong, should be n-1 to match other legpolys
                mi = m+1; %RAE
                % --------------- tesseral (n,m)
                LegGottN(Li,mi) = (L2m1*sinlat*norm1m(L,m)*LegGottN(L,mi) - ...
                    (Lm1+m)*norm2m(L,m)*LegGottN(Lm1,mi)) / (L-m); % eq 3-18 RAE %norm
            end  % for
        end

    end  % for

end

% ----------------------------------------------------------------------------
%
%                           function legpolyMont
%
%   this function finds the Legendre polynomials for the gravity field. fortran
%   and matlab implementations will have indicies of +1 as they start at 1. note
%   these are valid for normalized and unnormalized expressions, as long as
%   the order is less than about 85 (L + m). 
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs        description                                   range / units
%    latgc       - Geocentric lat of satellite                   pi to pi rad
%    normArr     - normalization coefficients               
%    degree      - degree of gravity field                        1..85
%    order       - order of gravity field                         1..85
%
%  outputs       :
%    LegArrMU    - array of unnormalized Legendre polynomials montenbruck
%    LegArrMN    - array of normalized Legendre polynomials montenbruck
%
%  locals :
%    L,m         - degree and order indices
%
%  coupling      :
%   none
%
%  references :
%    vallado       2022, 602
%
%   [legarrMU, legarrMN] = legpolyMont (latgc, normArr, degree, order);
%  ----------------------------------------------------------------------------

function [legarrMU, legarrMN] = legpolyMont (latgc, normArr, degree, order)

    legarrMU = zeros(degree+3, order+3);
    legarrMN = zeros(degree+3, order+3);

    sinlat = sin(latgc);

    % ----------------------  montenbruck approach ------------------------
    % increment indicies because Matlab always starts at 1!!
    % the +1 is shown to highlight where the indicies are different

    % ------------------------ perform recursions
    legarrMU(0+1, 0+1) = 1.0;
    legarrMU(0+1, 1+1) = 0.0;
    legarrMU(1+1, 0+1) = sinlat;
    legarrMU(1+1, 1+1) = cos(latgc);

    % Legendre functions, zonal
    for L = 2: degree
        Li = L + 1;
        legarrMU(Li, Li) = (2.0*L-1) * legarrMU(2, 2) * legarrMU(Li-1, Li-1);
    end

    % associated Legendre functions
    for L = 2: degree
        Li = L + 1;
        for m = 0: L-1
            mi = m + 1;
            if L == m + 1
                legarrMU(Li, mi) = (2.0*m+1) * legarrMU(2, 1) * legarrMU(mi, mi);
            else
                legarrMU(Li, mi) = 1.0 / (L - m)  ...
                    * ((2.0*L-1) * legarrMU(2, 1) * legarrMU(Li-1, mi) - (L+m-1) * legarrMU(Li-2, mi));
            end
        end
    end

    % normalize the legendre polynomials
    %if degree < 150
    for L = 0 : degree
        Li = L + 1;
        for m = 0 : L
            mi = m + 1;
            % find normalized or unnormalized depending on which is already in file
            % note that above n = 170, the factorial will return 0, thus affecting the results!!!!
            legarrMN(Li, mi) = normArr(Li, mi) * legarrMU(Li, mi);

        end   % for m
    end   % for L
    %end

end

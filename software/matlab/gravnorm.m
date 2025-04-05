% -----------------------------------------------------------------------------
%
%                           function gravnorm
%
%  this function dfns the normalization constants for the gravity field. useful
%  for GTDS, montenbruck
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                              range / units
%    degree      -  degree of gravity field                   2 .. 120
%
%  outputs       :
%    normArr     -  normalization values for gravity
%
%  references    :
%    vallado       2022, 550
%
% [normArr] = gravnorm(degree);
% ------------------------------------------------------------------------------

function [normArr] = gravnorm(degree)

    % ----------------------- normalization values
    for L = 0 : degree
        Li = L + 1;
        for m = 0 : L
            mi = m + 1;
            % simply do in formula
            % if m==0
            %     del = 1;
            % else
            %     del = 2;
            % end

            % note that above n = 170, the factorial will return 0, thus affecting the results!!!!
            if (m == 0)
                normArr(Li, mi) = sqrt((factorial(L) * (2.0 * L + 1)) / factorial(L));
            else
                normArr(Li, mi) = sqrt((factorial(L - m) * 2.0 * (2 * L + 1)) / factorial(L + m));
            end

        end   % for m

    end   % for L
end
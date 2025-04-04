% -----------------------------------------------------------------------------
%
%                           function gibbs
%
%  this function dfns the normalization constants for the gravity field.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                              range / units
%    degree      -  degree of gravity field                   2 .. 120
%
%  outputs       :
%    v2          -  velocity vector for r2                    km / s
%
%  references    :
%    vallado       2022, 550
%
% [unnormArr] = gravnorm(degree);
% ------------------------------------------------------------------------------

function [unnormArr] = gravnorm(degree)

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
                unnormArr(Li, mi) = sqrt((factorial(L - m) * (2.0 * L + 1)) / factorial(L + m));
            else
                unnormArr(Li, mi) = sqrt((factorial(L - m) * 2.0 * (2 * L + 1)) / factorial(L + m));
            end

        end   % for m

    end   % for L
end
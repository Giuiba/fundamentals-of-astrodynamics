% ----------------------------------------------------------------------------
%
%                           function trigpolyGTDS
%
%   this function finds the accumlated trigonmetric terms.
%   matlab/for implementations will have indicies of +1 because they start at 1.
%   beware that the multipliers must retain the original indices values!!
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs        description                                   range / units
%    latgc       - latitude of satellite                         rad
%    lon         - longitude of satellite                        rad
%    degree      - size of gravity field                         1..2160..
%
%  outputs       :
%    trigArr     - array of trigonometric terms
%
%  locals :
%    m           - degree and order indices
%
%  coupling      :
%   none
%
%  references :
%    vallado       2022, 601
%
%  [trigArr] = trigpolyGTDS(latgc, lon, degree);
% ----------------------------------------------------------------------------

function [trigArr] = trigpolyGTDS(latgc, lon, degree)
    constastro;

    % -------------------- gtds approach
    slon = sin(lon);
    clon = cos(lon);
    tlon = tan(latgc);
    trigArr(0+1, 0+1) = 0.0;    % sin terms  
    trigArr(0+1, 1+1) = 1.0;    % cos terms
    trigArr(1+1, 0+1) =  slon;  % initial value
    trigArr(1+1, 1+1) =  clon;

    for m = 2: degree
        mi = m + 1;
        trigArr(mi, 0+1) = 2.0 * clon * trigArr(mi-1, 0+1) - trigArr(mi-2, 0+1);  % sin terms
        trigArr(mi, 1+1) = 2.0 * clon * trigArr(mi-1, 1+1) - trigArr(mi-2, 1+1);  % cos terms
        trigArr(mi, 2+1) = (m-1) * tlon + tlon;  % m tan terms
    end

end

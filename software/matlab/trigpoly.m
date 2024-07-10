% ----------------------------------------------------------------------------
%
%                           function trigpoly
%
%   this function finds the accumlated legendre polynomials and trigonmetric terms.
%   matlab/for implementations will have indicies of +1 because they start at 1.
%   beware that the multipliers must retain the original indices values!!
%
%  author        : david vallado                    719-573-2600  10 oct 2019
%
%  inputs        description                                   range / units
%    recef       - satellite position vector, earth fixed        km
%    lon         - longitude of satellite                        rad
%    order       - size of gravity field                         1..2160..
%
%  outputs       :
%    trigArr     - array of trigonometric terms
%    VArr        - array of trig terms
%    WArr        - array of trig terms
%
%  locals :
%    L,m         - degree and order indices
%
%  coupling      :
%   none
%
%  references :
%    vallado       2013, 597, Eq 8-57
% ----------------------------------------------------------------------------*/

function [trigArr, VArr, WArr] = trigpoly(recef, latgc, lon, order)
    constastro;
    
    magr = mag(recef);
    
    % -------------------- gtds approach
    trigArr(0+1, 0+1) = 0.0;    % sin terms
    trigArr(0+1, 1+1) = 1.0;    % cos terms
    tlon = tan(latgc);
    trigArr(1+1, 0+1) =  sin(lon);  % initial value
    trigArr(1+1, 1+1) =  cos(lon);
    slon = sin(lon);
    clon = cos(lon);
    
    for m = 2: order
        mi = m + 1;
        trigArr(mi, 0+1) = 2.0 * clon * trigArr(mi-1, 0+1) - trigArr(mi-2, 0+1);  % sin terms
        trigArr(mi, 1+1) = 2.0 * clon * trigArr(mi-1, 1+1) - trigArr(mi-2, 1+1);  % cos terms
        trigArr(mi, 2+1) = (m-1) * tlon + tlon;  % m tan
    end
    
    % -------------------- montenbruck approach
    % now form first set of recursions for l=m on V and W
    % initial zonal values
    temp = re / (magr * magr);
    VArr(0+1, 0+1) = re / magr;
    VArr(1+1, 0+1) = VArr(0+1, 0+1) * VArr(0+1, 0+1) * sin(latgc);
    WArr(0+1, 0+1) = 0.0;
    WArr(1+1, 0+1) = 0.0;
    
    for L = 2: order+1
        Li = L + 1;
        mi = 0 + 1;
        %                 if (L == 1)
        %                     VArr(L+1, m+1) = ((2 * L - 1) / L) * recef(2) * temp * VArr(L - 1+1, 0+1);
        %                 else
        VArr(Li, mi) = ((2*L-1) / L) * recef(2) * temp * VArr(Li-1, 0+1) - ((L-1) / L) * temp * re * VArr(Li-2, 0+1);
        WArr(Li, mi) = 0.0;
        %                 end
    end
    
    % now tesseral and sectoral
    for L = 1: order+1
        Li = L + 1;
        m = L;
        mi = m + 1;
        VArr(Li, mi) = (2*m-1) * recef(1) * temp * VArr(Li-1, mi-1) - recef(2) * temp * WArr(Li-1, mi-1);
        WArr(Li, mi) = (2*m-1) * recef(1) * temp * WArr(Li-1, mi-1) - recef(2) * temp * VArr(Li-1, mi-1);
    end
    
    for (m = L + 1: order)
        mi = m + 1;
    
        if (m <= order)
            VArr(Li, mi) = (2*L-1) / (L-m) * recef(2) * temp * VArr(Li-1, mi);
            WArr(Li, mi) = (2*L-1) / (L-m) * recef(2) * temp * WArr(Li-1, mi);
        end
        for (L = m + 2:order+1)
            Li = L + 1;
            VArr(Li, mi) = ((2*L-1) / (L-m)) * recef(2) * temp * VArr(Li-1, mi) - ...
                ((L+m-1) / (L-m)) * temp * re * VArr(Li-2, mi);
            WArr(Li, mi) = ((2*L-1) / (L-m)) * recef(2) * temp * WArr(Li-1, mi) - ...
                ((L+m-1) / (L-m)) * temp * re * WArr(Li-2, mi);
        end
    end


% ----------------------------------------------------------------------------
%
%                           function iau06xys
%
%  this function calulates the transformation matrix that accounts for the
%    effects of precession-nutation in the iau2006 theory.
%
%  author        : david vallado                  719-573-2600   16 jul 2004
%
%  revisions
%    vallado     - consolidate with iau 2000                     14 feb 2005
%
%  inputs          description                    range / units
%    ttt         - julian centuries of tt
%    ddx         - eop correction for x           rad
%    ddy         - eop correction for y           rad
%
%  outputs       :
%    nut         - transformation matrix for tirs-gcrf
%    x           - coordinate of cip              rad
%    y           - coordinate of cip              rad
%    s           - coordinate                     rad
%
%  locals        :
%    axs0        - real coefficients for x        rad
%    a0xi        - integer coefficients for x
%    ays0        - real coefficients for y        rad
%    a0yi        - integer coefficients for y
%    ass0        - real coefficients for s        rad
%    a0si        - integer coefficients for s
%    apn         - real coefficients for nutation rad
%    apni        - integer coefficients for nutation
%    appl        - real coefficients for planetary nutation rad
%    appli       - integer coefficients for planetary nutation
%    ttt2,ttt3,  - powers of ttt
%    l           - delaunay element               rad
%    ll          - delaunay element               rad
%    f           - delaunay element               rad
%    d           - delaunay element               rad
%    omega       - delaunay element               rad
%    deltaeps    - change in obliquity            rad
%    many others
%
%  coupling      :
%    iau00in     - initialize the arrays
%    fundarg     - find the fundamental arguments
%
%  references    :
%    vallado       2022, 214, 221
%
% [x, y, s, pn] = iau06xys (iau06arr, fArgs, ttt, ddx, ddy, opt1)
% ----------------------------------------------------------------------------

function [x, y, s, pn] = iau06xys (iau06arr, fArgs06, xysarr, ttt, ddx, ddy, opt1)

    sethelp;

    rad = 180.0 / pi;

    if (contains(opt1, 's'))
        [x ,y, s] = iau06xysS (iau06arr, fArgs06, ttt );
    else
        % not sure we need to pass this in? or calc
        jdtt = ttt*36525.0 + 2451545.0;
        [x, y, s] = findxysparam(jdtt, 0.0, 's', xysarr);
    end

    % add corrections if available
    x = x + ddx;
    y = y + ddy;

    % ---------------- now find a
    a = 0.5 + 0.125*(x*x + y*y);    % units take on whatever x and y are

    %if iauhelp == 'x'
    fprintf(1,'06xys  x  %14.12f y  %14.12f s %14.12f a %14.12f rad \n',x, y, s, a );
    fprintf(1,'06xys  x  %14.12f y  %14.12f s %14.12f a %14.12f deg \n',x*rad,y*rad,s*rad,a*rad );
    fprintf(1,'06xys  x  %14.12f" y  %14.12f" s %14.12f" a %14.12fdeg \n',x*rad*3600,y*rad*3600,s*rad*3600,a*rad );
    %end;

    % ----------------- find nutation matrix ----------------------
    nut1(1,1) = 1.0 - a*x*x;
    nut1(1,2) = -a*x*y;
    nut1(1,3) = x;
    nut1(2,1) = -a*x*y;
    nut1(2,2) = 1.0 - a*y*y;
    nut1(2,3) = y;
    nut1(3,1) = -x;
    nut1(3,2) = -y;
    nut1(3,3) = 1.0 - a*(x*x + y*y);
    %nut1

    nut2 = eye(3);
    nut2(1,1) =  cos(s);
    nut2(2,2) =  cos(s);
    nut2(1,2) =  sin(s);
    nut2(2,1) = -sin(s);

    pn = nut1 * nut2;

    %       the matrix appears to be orthogonal now, so the extra processing is not needed.
    %        if (x ~= 0.0) && (y ~= 0.0)
    %            e = atan2(y,x);
    %          else
    %            e = 0.0;
    %          end;
    %        d = atan( sqrt((x^2 + y^2) / (1.0-x^2-y^2)) );
    %        nut1 = rot3mat(-e)*rot2mat(-d)*rot3mat(e+s)



%------------------------------------------------------------------------------
%
%                           function rv2q
%
%  this function converts a position and velocity vector to an orbit state
%   quaternion.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                   range / units
%    r           - position vector                 km
%    v           - veocity vector                  km/s
%
%  outputs       :
%    q           - quaternion 4-element vector
%
%  locals        :
%    none
%
%  coupling      :
%    none
%
%  references    :
%    xx
%
% [q] = rv2q(r,v);
%------------------------------------------------------------------------------

function [q] = rv2q(r,v)

    % ---- parse the input vector
    x  = r(1);
    y  = r(2);
    z  = r(3);
    vx = v(1);
    vy = v(2);
    vz = v(3);

    %compute useful quantities
    omegax =(y*vz - z*vy)/(x^2 + y^2 + z^2);
    omegay =(z*vx - x*vz)/(x^2 + y^2 + z^2);
    omegaz =(x*vy - y*vx)/(x^2 + y^2 + z^2);
    magr   = sqrt(x^2 + y^2 + z^2);
    omega  = sqrt(omegax^2 + omegay^2 + omegaz^2);
    dot    = (x*vx + y*vy + z*vz)/magr;

    %compute the components of the transformation matrix
    z1 = -x/magr;
    z2 = -y/magr;
    z3 = -z/magr;
    y1 = -omegax/omega;
    y2 = -omegay/omega;
    y3 = -omegaz/omega;
    x1 = y2*z3 - y3*z2;
    x2 = y3*z1 - y1*z3;
    x3 = y1*z2 - y2*z1;

    % ---- compute the modified trace of the matrix and quaternions based on result
    trc = 1.0 + x1 + y2 + z3;

    if trc >= 0.000001
        q4 = 0.5*sqrt(trc);
        f  = 1.0/(4.0*q4);
        q1 = f*(y3-z2);
        q2 = f*(z1-x3);
        q3 = f*(x2-y1);
    else
        trc = 1.0 + x1 - y2 - z3;
        if trc >= 0.000001
            q1 = 0.5*sqrt(trc);
            f  = 1.0/(4.0*q1);
            q2 = f*(x2+y1);
            q3 = f*(z1+x3);
            q4 = f*(y3-z2);
        else
            trc = 1.0 + y2 - x1 - z3;
            if trc >= 0.000001
                q2 = 0.5*sqrt(trc);
                f  = 1.0/(4.0*q2);
                q1 = f*(x2+y1) ;
                q3 = f*(y3+z2);
                q4 = f*(z1-x3);
            else
                trc = 1.0 + z3 - x1 - y2;
                q3 = 0.5*sqrt(trc);
                f  = 1.0/(4.0*q3);
                q1 = f*(z1+x3);
                q2 = f*(y3+z2);
                q4 = f*(y1-x2);
            end
        end
    end

    %form orbit state quaternion
    q = [q1,q2,q3,q4,magr,dot,omega] ;



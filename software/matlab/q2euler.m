
% ------------------------------------------------------------------------------
%
%                           function q2euler
%
%  this function converts a quaternion to three euler angles.
%    note: this algorithm is only for the convention of a rotation of an angle theta
%    about y, then an angle phi about x, then an angle psi about z.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%    q           - quaternion 4-element vector
%    angmeasure  - output format                   1 - deg 0 - rad
%
%  outputs       :
%    theta, phi, psi - three euler angles
%
%  locals        :
%    none
%
%  coupling      :
%    none
%
% references     :
%   xx
%
% [theta, phi, psi] : q2euler (q, angmeasure);
% ------------------------------------------------------------------------------

function [theta, phi, psi] = q2euler (q, angmeasure)

    rad    = 180.0 / pi;
    halfpi = pi * 0.5;
    twopi  = 2.0 * pi;

    q11 = q(1) * q(1);
    q22 = q(2) * q(2);
    q33 = q(3) * q(3);
    q44 = q(4) * q(4);

    q12 = q(1) * q(2);
    q13 = q(1) * q(3);
    q14 = q(1) * q(4);

    q23 = q(2) * q(3);
    q24 = q(2) * q(4);

    q34 = q(3) * q(4);

    % ---- calculate phi
    phi = asin(2.0*(q14-q23));

    % ---- calculate theta and psi
    if phi == pi/2
        psi   = 0.0;
        theta = atan2(2.0*(q12-q34), q44+q11-q22-q33);
    elseif phi == -pi/2
        psi   = 0.0;
        theta = atan2(-2.0*(q12-q34), q44+q11-q22-q33);
    else
        theta = atan2(2.0*(q24+q13), q33+q44-q11-q22);
        psi   = atan2(2*(q12+q34), q22+q44-q11-q33);
    end

    % ---- adjust quadrant
    if theta < 0.0
        theta = theta + twopi;
    end
    if psi < 0.0
        psi = psi+twopi;
    end

    % ---- convert to degrees if necessary
    if angmeasure==1
        theta = theta*rad;
        phi   = phi*rad;
        psi   = psi*rad;
    end



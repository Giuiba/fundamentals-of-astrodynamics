% ------------------------------------------------------------------------------
%
%                           function dcm2euler
%
%  this function converts a direction cosine matrix to three euler angles.
%    note: this algorithm is only for the convention of a rotation of an angle theta
%    about y, then an angle phi about x, then an angle psi about z.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                        range / units
%    dcm         - direction cosine matrix
%    angmeasure  - output format                      1 - deg 0 - rad
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
%  references    :
%    xx
%
% [theta,phi,psi] = dcm2euler ( dcm, angmeasure );
% ------------------------------------------------------------------------------

function [theta,phi,psi] = dcm2euler ( dcm, angmeasure )

    rad    = 180.0 / pi;
    halfpi = pi * 0.5;
    twopi  = 2.0 * pi;

    % ---- calculate phi.
    phi = asin(-dcm(3,2));

    % ---- calculate theta and psi
    if phi == halfpi
        psi   = 0.0;
        theta = atan2(dcm(2,1), dcm(1,1));
    elseif phi == -halfpi
        psi   = 0.0;
        theta = atan2(-dcm(2,1), dcm(1,1));
    else
        theta = atan2(dcm(3,1), dcm(3,3));
        psi   = atan2(dcm(1,2), dcm(2,2));
    end

    % ---- adjust quadrants
    if theta < 0.0
        theta = theta + twopi;
    end
    if psi < 0.0
        psi = psi + twopi;
    end

    % ---- convert to degrees if necessary
    if angmeasure==1
        theta = theta*rad;
        phi   = phi*rad;
        psi   = psi*rad;
    end




% ------------------------------------------------------------------------------
%
%                           function q2eigen
%
%  this function converts a quaternion to a rotation angle about an eigen-axis.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs         description                      range / units
%    q           - quaternion 4-element vector
%    angmeasure  - rotation angle format           1 - deg 0 - rad
%
%  outputs       :
%    evec        - eigen-axis vector
%    phi         - rotation angle about axis
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
% [evec,phi] = q2eigen ( q,angmeasure );
% ------------------------------------------------------------------------------

function [evec,phi] = q2eigen ( q,angmeasure )

    rad = 180.0/pi;

    % ---- check to make sure that axis is well defined
    if q(4)==1
        display('axis is not well defined because angle is zero.')
        return
    elseif q(4) == -1
        display('axis is not well defined because angle is zero.')
        return
    end

    % ---- compute rotation angle
    phi = 2.0*atan2(sqrt(q(1)^2 + q(2)^2 + q(3)^2), q(4));

    % ---- put rotation angle between 0 and pi
    if phi < 0
        phi = pi + phi;
    end

    % ---- calculate components of eigen-axis
    evec1 = q(1)/sqrt(q(1)^2 + q(2)^2 + q(3)^2);
    evec2 = q(2)/sqrt(q(1)^2 + q(2)^2 + q(3)^2);
    evec3 = q(3)/sqrt(q(1)^2 + q(2)^2 + q(3)^2);

    evec = [evec1,evec2,evec3];

    % ---- normalize axis
    evec(1) = evec1/mag(evec);
    evec(2) = evec2/mag(evec);
    evec(3) = evec3/mag(evec);

    % ---- convert to degrees if necessary
    if angmeasure==1
        phi = phi*rad;
    end



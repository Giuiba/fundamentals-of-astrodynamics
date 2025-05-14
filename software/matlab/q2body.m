
% -----------------------------------------------------------------------------
%
%                           function q2body
%
%  this function finds the unit vectors representing the body axes from a
%    quaternion.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%    q           - quaternion 4-element vector
%
%  outputs       :
%    x,y,z       - body-axis unit vectors
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
% [x,y,z] = q2body (q);
% ------------------------------------------------------------------------------

function [x,y,z] = q2body (q)

       % ---- calculate body unit vectors
       x = [1.0 - 2.0*(q(3)*q(3) + q(2)*q(2)); ...
            2.0*(q(3)*q(4) + q(1)*q(2)); ...
            2.0*(q(1)*q(3) - q(2)*q(4))];
       y = [2.0*(q(1)*q(2) - q(3)*q(4)); ...
            1.0 - 2.0*(q(1)*q(1) + q(3)*q(3)); ...
            2.0*(q(1)*q(4) + q(2)*q(3))];
       z = [2.0*(q(1)*q(3) + q(2)*q(4)); ...
            2.0*(q(2)*q(3) - q(1)*q(4)); ...
            1.0 - 2.0*(q(1)*q(1) + q(2)*q(2))];




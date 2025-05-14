% ------------------------------------------------------------------------------
%
%                           function qtrvec
%
%  this function finds the vector resulting from a quaternion transformation of
%  another vector.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%   q            - quaternion transformation
%   vec          - input vector
%   direc        - forward/reverse indicator       +1 vecout = dcm*vec,
%                                                  -1 vec = dcm*vecout
%
%  outputs
%   vecout       - output vector
%
%  locals
%   t1, t2, t3   - temporary variables
%   q4           - 4th component of quaternion
%
%  coupling
%   none
%
%  references
%
% [vecout]  = qtrvec(q,vec,direc);
% ------------------------------------------------------------------------------

function [vecout] = qtrvec(q,vec,direc)

       % ---- check for error condition and set q4
       if direc == 1
           q4 = q(4);
         elseif direc == -1
           q4 = -q(4);
         else
           display('the direc value may only be +1 or -1 %3i \n',direc);
           return
         end

       % ---- calculate intermediate values
       t1 = q(3)*vec(2) - q(2)*vec(3);
       t2 = q(1)*vec(3) - q(3)*vec(1);
       t3 = q(2)*vec(1) - q(1)*vec(2);

       % ---- calculate output vector components
       vecout(1) = vec(1) + 2.0*(t1*q4 + t2*q(3) - t3*q(2));
       vecout(2) = vec(2) + 2.0*(t2*q4 + t3*q(1) - t1*q(3));
       vecout(3) = vec(3) + 2.0*(t3*q4 + t1*q(2) - t2*q(1));


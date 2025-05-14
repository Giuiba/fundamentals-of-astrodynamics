
% ------------------------------------------------------------------------------
%
%                           function qtimesq
%
%  this function multiplies two quaternions.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%   qa           - first quaternion 4-element vector
%   qb           - second quaternion 4-element vector
%   dira         - direction of first quaternion   1 - direct, -1 - inverse
%   dirb         - direction of second quaternion  1 - direct, -1 - inverse
%
%  outputs
%   q            -
%
%  locals
%   cth          -
%
%  coupling
%   none
%
%  references
%   xx
%
% [q] = qtimesq(qa,qb,dira,dirb);
% ------------------------------------------------------------------------------

function [q] = qtimesq(qa,qb,dira,dirb)

       qa = qa';
       qb = qb';

       qa(4) = dira*qa(4);
       qb(4) = dirb*qb(4);

       q(1) = qb(4)*qa(1) + qb(3)*qa(2) - qb(2)*qa(3) + qb(1)*qa(4);
       q(2) = qb(4)*qa(2) - qb(3)*qa(1) + qb(2)*qa(4) + qb(1)*qa(3);
       q(3) = qb(4)*qa(3) + qb(3)*qa(4) + qb(2)*qa(1) - qb(1)*qa(2);
       q(4) = qb(4)*qa(4) - qb(3)*qa(3) - qb(2)*qa(2) - qb(1)*qa(1);


       if q(4) < 0.0
           q = -q;
       end

       q = q';



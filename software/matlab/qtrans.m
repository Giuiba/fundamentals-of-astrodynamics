%
% ------------------------------------------------------------------------------
%
%                            function qtrans
%
%  this function finds the transformation quaternion that takes an initial
%   quaternion into a final quaternion. note: the transformation is defined
%   as qf = qi*qt
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%   qi           - quaternion representing initial orientation
%   qf           - quaternion representing final orientation
%
%  outputs       :
%   qt           - quaternion that transforms qi into qf
%
%  locals        -
%   dq           - temporary quaternion
%
%  coupling
%   none
%
%  references    :
%    xx
%
%  [qt] = qtrans(qi,qf);
% ------------------------------------------------------------------------------

function [qt] = qtrans(qi,qf)

       % ---- multiply the inverse of qi by qf
       dq1 = qi(4)*qf(1) - qi(1)*qf(4) - qi(2)*qf(3) + qi(3)*qf(2);
       dq2 = qi(4)*qf(2) - qi(2)*qf(4) - qi(3)*qf(1) + qi(1)*qf(3);
       dq3 = qi(4)*qf(3) - qi(3)*qf(4) - qi(1)*qf(2) + qi(2)*qf(1);
       dq4 = qi(1)*qf(1) + qi(2)*qf(2) + qi(3)*qf(3) + qi(4)*qf(4);

       [dq] = [dq1,dq2,dq3,dq4];

       % ---- normalize result
       dq1 = dq1/mag(dq);
       dq2 = dq2/mag(dq);
       dq3 = dq3/mag(dq);
       dq4 = dq4/mag(dq);

       [qt] = [dq1,dq2,dq3,dq4];




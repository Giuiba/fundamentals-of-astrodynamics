% ------------------------------------------------------------------------------
%
%                           function eigen2q
%
%  this function converts a rotation angle about an eigen-axis to a quaternion.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                            range / units
%   evec         - eigen-axis vector
%   phi          - rotation angle about axis
%   angmeasure   - rotation angle format                  1 - deg 0 - rad
%
%  outputs       :
%   q            - quaternion 4-element vector
%
%  locals        :
%   none         
%
%  coupling      :
%   none
%
%  references    :
%   xx
%
% [q] = eigen2q ( evec,phi,angmeasure );
% ------------------------------------------------------------------------

function [q] = eigen2q ( evec,phi,angmeasure )

       rad = 180.0/pi;

       % ---- assure axis vector is a unit vector
       n1 = evec(1)/mag(evec);
       n2 = evec(2)/mag(evec);
       n3 = evec(3)/mag(evec);

       % ---- convert angle to radians if necessary
       if angmeasure == 1
           phi = phi/rad;
       end

       % ---- compute quaternion components
       halfphi = phi * 0.5;
       q1 = n1*sin(halfphi);
       q2 = n2*sin(halfphi);
       q3 = n3*sin(halfphi);
       q4 = cos(halfphi);

       [q] = [q1,q2,q3,q4];



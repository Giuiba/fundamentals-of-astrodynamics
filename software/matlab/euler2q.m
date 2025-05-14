
% ------------------------------------------------------------------------------
%
%                           function euler2q
%
%  this function converts three euler angles to a quaternion.
%    note: this algorithm is only for the convention of a rotation of an angle theta
%    about y, then an angle phi about x, then an angle psi about z.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%    theta, phi, psi - three euler angles
%    angmeasure  - output format                  1 - deg 0 - rad
%
%  outputs       :
%    q           - quaternion 4-element vector
%
%  locals        :
%    cth,sth     - cosine and sine of theta        rad
%    cph,sph     - cosine and sine of phi          rad
%    cps,sps     - cosine and sine of psi          rad
%
%  coupling      :
%    none
%
%  references    :
%    xx
%
% [q] = euler2q (theta, phi, psi, angmeasure);
% ------------------------------------------------------------------------------

function [q] = euler2q (theta, phi, psi, angmeasure)

       rad = 180.0/pi;

       % ---- convert angles to radians if necessary.
       if angmeasure==1
           theta = theta/rad;
           phi   = phi/rad;
           psi   = psi/rad;
         end

       % ---- compute the trigonometric quantities
       cth = cos(theta*0.5);
       sth = sin(theta*0.5);
       cph = cos(phi*0.5);
       sph = sin(phi*0.5);
       cps = cos(psi*0.5);
       sps = sin(psi*0.5);


       % ---- compute the quaternion
       q(1) = cth*sph*cps + sth*cph*sps;
       q(2) = sth*cph*cps - cth*sph*sps;
       q(3) = cth*cph*sps - sth*sph*cps;
       q(4) = cth*cph*cps + sth*sph*sps;




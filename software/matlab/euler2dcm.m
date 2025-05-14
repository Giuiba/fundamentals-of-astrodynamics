
% ------------------------------------------------------------------------------
%
%                            function euler2dcm
%
%  this function converts three euler angles to a direction cosine matrix.
%    note: this algorithm is only for the convention of a rotation of an angle theta
%    about y, then an angle phi about x, then an angle psi about z.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%    theta, phi, psi - three euler angles
%    angmeasure  - output format                   1 - deg 0 - rad
%
%  outputs       :
%    dcm         - direction cosine matrix
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
% [dcm] = euler2dcm ( theta,phi,psi, angmeasure );
% ------------------------------------------------------------------------------

function [dcm] = euler2dcm ( theta,phi,psi, angmeasure )

       rad = 180.0/pi;

       % ---- convert to radians if necessary
       if angmeasure == 1
           theta = theta/rad;
           phi   = phi/rad;
           psi   = psi/rad;
       end

       % ---- calculate the trigonometric functions of the angles
       cth = cos(theta);
       sth = sin(theta);
       cph = cos(phi);
       sph = sin(phi);
       cps = cos(psi);
       sps = sin(psi);

       % ---- calculate the dcm

       dcm(1,1) =  cth*cps + sth*sph*sps;
       dcm(1,2) =  cph*sps;
       dcm(1,3) = -sth*cps + cth*sph*sps;
       dcm(2,1) = -cth*sps + sth*sph*cps;
       dcm(2,2) =  cph*cps;
       dcm(2,3) =  sth*sps + cth*sph*cps;
       dcm(3,1) =  sth*cph;
       dcm(3,2) = -sph;
       dcm(3,3) =  cth*cph;



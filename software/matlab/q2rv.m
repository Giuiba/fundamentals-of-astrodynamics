
% ------------------------------------------------------------------------------
%
%                           function q2rv
%
%  this function converts an orbit state quaternion to a position and velocity
%    vector.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%    q           - quaternion 7-element vector
%
%  outputs       :
%    r           - position vector                 km
%    v           - veocity vector                  km/s
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
% [r,v] = q2rv(q);
% ------------------------------------------------------------------------------

function [r,v] = q2rv(q)

       % ----- form useful quantities
       p = 1.0/(q(1)^2 + q(2)^2 + q(3)^2 + q(4)^2);
       r = [q(1)^2 - q(2)^2 - q(3)^2 + q(4)^2, 2.0*(q(1)*q(2)-q(3)*q(4)), ...
            2.0*(q(1)*q(3)+q(2)*q(4));...
            2.0*(q(1)*q(2) + q(3)*q(4)), -q(1)^2 + q(2)^2 - q(3)^2 + q(4)^2,2*(q(2)*q(3)-q(1)*q(4));...
            2.0*(q(1)*q(3) - q(2)*q(4)), 2.0*(q(2)*q(3) + q(1)*q(4)), -q(1)^2 - q(2)^2 + q(3)^2 + q(4)^2];
       vel = [q(7)*q(5); 0.0;-q(6)];

       % ----- calculate position vector
       x = -2.0*p*q(5)*(q(1)*q(3) + q(2)*q(4));
       y = -2.0*p*q(5)*(q(2)*q(3) - q(1)*q(4));
       z = p*q(5)*(-q(3)^2 - q(4)^2 + q(1)^2 + q(2)^2);

       % ----- calculate velocity vector
       v = r*vel;
       vx = p*v(1);
       vy = p*v(2);
       vz = p*v(3);

       % ----- form orbit state                                                                                                    ~
       r = [x,y,z];
       v = [vx,vy,vz];




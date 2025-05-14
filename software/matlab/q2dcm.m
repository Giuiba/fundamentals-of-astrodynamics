% ------------------------------------------------------------------------------
%
%                           function q2dcm
%
%  this function converts a quaternion to a direction cosine matrix.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%   q            - quaternion 4-element vector
%
%  outputs       :
%   dcm          - direction cosine matrix
%
%  locals        :
%   ql,q2,q3,q4  - quaternion element products
%
%  coupling      :
%     none       -
%
%  references    :
%    xx
%
% [dcm] = q2dcm(q);
% ------------------------------------------------------------------------------

function [dcm] = q2dcm( q )

       % ---- calculate quaternion products
       q11 = q(1) * q(1);
       q22 = q(2) * q(2);
       q33 = q(3) * q(3);
       q44 = q(4) * q(4);

       q12 = q(1) * q(2);
       q13 = q(1) * q(3);
       q14 = q(1) * q(4);

       q23 = q(2) * q(3);
       q24 = q(2) * q(4);

       q34 = q(3) * q(4);

       % ---- compute the direction cosine matrix
       dcm(1,1) = q44 + q11 - q22 - q33;
       dcm(1,2) = 2.0 * (q12 + q34);
       dcm(1,3) = 2.0 * (q13 - q24);

       dcm(2,1) = 2.0 * (q12 - q34);
       dcm(2,2) = q44 - q11 + q22 - q33;
       dcm(2,3) = 2.0 * (q23 + q14);

       dcm(3,1) = 2.0 * (q13 + q24);
       dcm(3,2) = 2.0 * (q23 - q14);
       dcm(3,3) = q44 - q11 - q22 + q33;




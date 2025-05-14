% ------------------------------------------------------------------------------
%
%                          function dcm2q
%
%  this function converts a direction cosine matrix to a quaternion.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                     range / units
%   dcm          - direction cosine matrix
%
%  outputs       :
%   q            - quaternion 4-element vector
%
%  locals        :
%   trc          - modified trace of quaternion
%   f            -
%
%  coupling      :
%   none         -
%
%  references    :
%    xx
%
% [q] = dcm2q(dcm);
% ------------------------------------------------------------------------------

function [q] = dcm2q(dcm)

    % ---- compute the modified trace of the matrix
    trc = 1.0 + dcm(1,1) + dcm(2,2) + dcm(3,3);

    % ---- check trace to make sure it's not too close to zero to be used in a denominator
    % ---- primary computation of quaternion elements
    if trc >= 0.00000001
        q(4) = 0.5*sqrt(trc);
        f    = 1.0/(4.0*q(4));
        q(1) = f*(-dcm(3,2)+dcm(2,3));
        q(2) = f*(-dcm(1,3)+dcm(3,1));
        q(3) = f*(-dcm(2,1)+dcm(1,2));
    else
        %compute quaternion elements by alternate routes if primary condition fails.
        trc = 1.0 + dcm(1,1) - dcm(2,2) - dcm(3,3);
        if trc >= 0.00000001

            q(1) = 0.5*sqrt(trc);
            f    = 1.0/(4.0*q(1));
            q(2) = f*(dcm(1,2)+dcm(2,1))
            q(3) = f*(dcm(1,3)+dcm(3,1))
            q(4) = f*(-dcm(3,2)+dcm(2,3));
        else
            trc = 1.0 + dcm(2,2) - dcm(1,1) - dcm(3,3);
            if trc >= 0.00000001
                q(2) = 0.5*sqrt(trc);
                f    = 1.0/(4.0*q(2));
                q(1) = f*(dcm(1,2)+dcm(2,1));
                q(3) = f*(dcm(2,3)+dcm(3,2));
                q(4) = f*(-dcm(1,3)+dcm(3,1));
            else
                trc  = 1.0 + dcm(3,3) - dcm(1,1) - dcm(2,2);
                q(3) = 0.5*sqrt(trc);
                f    = 1.0/(4.0*q(3));
                q(1) = f*(dcm(1,3)+dcm(3,1));
                q(2) = f*(dcm(2,3)+dcm(3,2));
                q(4) = f*(-dcm(2,1)+dcm(1,2));
            end
        end

    end

    % ---- ensure q is of unit magnitude
    q = q/norm(q);

    if q(4) < 0.0
        q = -q;
    end



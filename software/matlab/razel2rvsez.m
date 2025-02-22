%  ------------------------------------------------------------------------------
%
%                           procedure razel2rvsez
%
%  this procedure converts range, azimuth, and elevation values with slant
%    range and velocity vectors for a satellite from a radar site in the
%    topocentric horizon (sez) system.
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
%  inputs          description                              range / units
%    rho         - satellite range from site                km
%    az          - azimuth                                  0.0 to 2pi rad
%    el          - elevation                                -PI/2 to PI/2 rad
%    drho        - range rate                               km/s
%    daz         - azimuth rate                             rad/s
%    del         - elevation rate                           rad/s
%
%  outputs       :
%    rhovec      - sez satellite range vector               km
%    drhovec     - sez satellite velocity vector            km/s
%
%  locals        :
%    sinel       - variable for Math.Sin( el )
%    cosel       - variable for Math.Cos( el )
%    sinaz       - variable for Math.Sin( az )
%    cosaz       - variable for Math.Cos( az )
%    temp        -
%    temp1       -
%
%  coupling      :
%    mag         - magnitude of a vector
%    sign        - returns the sign of a variable
%    dot         - dot product
%    atan2       - arc tangent function that resolves quadrant ambiguites
%
%  references    :
%    vallado       2022, 269, eq 4-4, eq 4-5
%
%  [rhosez, drhosez] = razel2rvsez (rho, az, el, drho, daz, del);
% ----------------------------------------------------------------------------

function [rhosez, drhosez] = razel2rvsez (rho, az, el, drho, daz, del)
    small = 0.00000001;

    sinel = sin(el);
    cosel = cos(el);
    sinaz = sin(az);
    cosaz = cos(az);

    % ----------------- form sez range vector --------------------
    rhosez(1) = -rho * cosel * cosaz;
    rhosez(2) = rho * cosel * sinaz;
    rhosez(3) = rho * sinel;

    % --------------- form sez velocity vector -------------------
    drhosez(1) = -drho * cosel * cosaz + rhosez(3) * del * cosaz + rhosez(2) * daz;
    drhosez(2) = drho * cosel * sinaz - rhosez(3) * del * sinaz - rhosez(1) * daz;
    drhosez(3) = drho * sinel + rho * del * cosel;

end
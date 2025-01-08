% -----------------------------------------------------------------------------
%
%                           function createXYS
%
%  this function creates the xys data file. the iau-2006/2000 cio series is long
%  and can consume comutational time. this appraoches precalculates the xys parameters
%  and stores in a datafile for very fast efficient use.
%
%  author        : david vallado           davallado@gmail.com   22 jan 2018
%
%  revisions
%
%  inputs          description                             range / units
%    iau06arr    - constants for iau06
%    outfileLoc  - file name
%
%  outputs       :
%    xysdata.dat - file of xys data records
%
%  locals        :
%
%  coupling      :
%
%  references    :
%
%  -------------------------------------------------------------------------- 

function createXYS(iau06arr, outfileLoc)

    fid = 1;
    fid = fopen(strcat(outfileLoc,'xysdata.dat'), 'wt');

    [jdtt, jdftt] = jday(1956, 12, 31, 0, 0, 0.0);
    dt = 1.0;  % time step 1 day

    % create until 2100
    for i = 0 : 142 * 365
        jdtt = jdtt + dt;
        ttt = (jdtt + jdftt - 2451545.0) / 36525.0;

        % create fArgs
        [fArgs06] = fundarg(ttt, '06');

        [x, y, s] = iau06xysS (iau06arr, fArgs06, ttt );

        fprintf(1,'%15.6f  %13.11f  %15.12f  %15.12f  %15.12f \n', jdtt, jdftt, x, y, s);
    end

end  % create XYS



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
        %  inputs          description                           range / units
        %    xysLoc      - location for xys data file  
        %    infilename  - file name
        %
        %  outputs       :
        %    xysarr      - array of xys data records
        %    jdxysstart  - julian date of the start of the xysarr data
        %    jdfxysstart - julian date fraction of the start of the xysarr data
        %
        %  locals        :
        %                -
        %
        %  coupling      :
        %
        %  references    :
        %
        %  -------------------------------------------------------------------------- */


    % create a file of XYS values for interpolation
    function createXYS(iau06arr,fArgs, directory)

        fid = 1;
        fid = fopen(strcat(directory,'xysdata.dat'), 'wt');

        [jdtt, jdftt] = jday(1956, 12, 31, 0, 0, 0.0);
        dt = 1.0;  % time step 1 day

        % create fArgs??


        % create until 2100
        for i = 0 : 142 * 365
            jdtt = jdtt + dt;
            ttt = (jdtt + jdftt - 2451545.0) / 36525.0;
            [x, y, s] = iau06xysS(ttt, iau06arr, fArgs);

            fprintf(1,'%15.6f  %13.11f  %15.12f  %15.12f  %15.12f \n', jdtt, jdftt, x, y, s);
        end

    end  % create XYS



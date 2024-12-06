        % -----------------------------------------------------------------------------
        %
        %                           function readxys
        %
        %  this function initializes the xys iau2006 iau data. the input data files
        %  are from processing the ascii files into a text file of xys calcualtion over
        %  many years.
        %
        %  author        : david vallado           davallado@gmail.com   22 jan 2018
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
        %    pattern     - regex expression format
        %
        %  references    :
        %   [jdxysstart, jdfxysstart, xys06arr] = readxys(infilename)
        % ------------------------------------------------------------------------- */%

    function [xys06arr] = readxys(infilename)
        % 2435839.500000 0.0000000000 -0.004178909517 0.000027601169 0.000000078058
        xys06arr = struct('x',zeros(52000), 'y',zeros(52000), 'z',zeros(52000), ...
            'mjd',zeros(52000), 'jdxysstart', zeros(1), 'jdfxysstart', zeros(1));

        xys06 = load(append(infilename, 'xysdata.dat'));

        %xys06arr.jdtt = xys06(:,1);
        %xys06arr.jdftt = xys06(:,2);
        xys06arr.x = xys06(:,3);
        xys06arr.y = xys06(:,4);
        xys06arr.s = xys06(:,5);
        xys06arr.mjd = xys06(:,1) + xys06(:,2) - 2400000.5;

        % ---- find epoch date
        xys06arr.jdxysstart = xys06(1,1);
        xys06arr.jdfxysstart = xys06(1,2);

    end  % initXYS

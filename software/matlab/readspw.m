% -----------------------------------------------------------------------------
%
%                           function readspw.m
%
%  this function reads the spw coefficients.
%
%  author        : david vallado                              29 nov 2024
%
%  revisions
%                -
%
%  inputs          description                           range / units
%    infilename  - filename
%
%  outputs       :
%    spwarr      - array of spw values
%
%  locals        :
%
%  coupling      :
%    none.
%
%  references    :
%    none.
%
% [spwarr, mjdspwstart, ktrActObs, updDate] = readspw(spwFileName);
% -----------------------------------------------------------------------------

function [spwarr, mjdspwstart, ktrActObs, updDate] = readspw(spwFileName);

    spwarr = struct('xp',zeros(25000), 'xperr',zeros(25000), ...
        'yp',zeros(25000), 'yperr',zeros(25000), ...
        'dut1',zeros(25000), 'dut1err',zeros(25000), 'lod',zeros(25000), ...
        'ddpsi',zeros(25000), 'ddeps',zeros(25000), ...
        'dx',zeros(25000), 'dy',zeros(25000), ...
        'yr',zeros(25000), 'mon',zeros(25000), 'day',zeros(25000), 'mjd',zeros(25000) );
    
    updDate = '';
    infile = fopen(spwFileName, 'r');
    
    while (~feof(infile))
        longstr = fgets(infile);
        while ( (longstr(1) == '#') && (feof(infile) == 0) )str2double
            longstr = fgets(infile);
    
            if (contains(longstr, 'UPDATED'))
                updDate = longstr(8:end);
            end
    
            if (contains(longstr, 'NUM_OBSERVED_POINTS'))
                numrecsobs = str2double(longstr(20:end));
                longstr = fgets(infile);
                % ---- process observed records only
                % 1962 01 01 37665 -0.012700  0.213000  0.0326338  0.0017230  0.064261  0.006067  0.000000  0.000000   2 
                for ktr = 1: numrecsobs + 1

        %  yy mm dd BSRN ND Kp Kp Kp Kp Kp Kp Kp Kp Sum Ap  Ap  Ap  Ap  Ap  Ap  Ap  Ap  Avg Cp C9 ISN F10.7 Q Ctr81 Lst81 F10.7 Ctr81 Lst81
        Dataarr = textscan( fid, '%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %f %d %d %f %d %f %f %f %f %f', 'Headerlines', 0, 'MultipleDelimsAsOne', true );
        fclose(fid);
    
        yr   = cell2mat(Dataarr(:,1));  % yr
        mon   = cell2mat(Dataarr(:,2));  % mon
        day   = cell2mat(Dataarr(:,3));  % day
        ap(1,:)  = cell2mat(Dataarr(:,15));  % ap1
        ap(2,:)  = cell2mat(Dataarr(:,16));  % ap2
        ap(3,:)  = cell2mat(Dataarr(:,17));  % ap3
        ap(4,:)  = cell2mat(Dataarr(:,18));  % ap4
        ap(5,:)  = cell2mat(Dataarr(:,19));  % ap5
        ap(6,:)  = cell2mat(Dataarr(:,20));  % ap6
        ap(7,:)  = cell2mat(Dataarr(:,21));  % ap7
        ap(8,:)  = cell2mat(Dataarr(:,22));  % ap8
        adjf107 = cell2mat(Dataarr(:,27));  % adjf10.7
        ctrf107 = cell2mat(Dataarr(:,29));  % ctrf10.7
    
                    
                    
                    longstr = fgets(infile);
                    spwarr(ktr).yr = str2double(longstr(0)); 
                    spwarr(ktr).mon = str2double(longstr(1));
                    spwarr(ktr).day = str2double(longstr(2));
                    spwarr(ktr).brsn = str2double(longstr(3));
                    spwarr(ktr).nd = str2double(longstr(4));
                    spwarr(ktr).kparr[0] = str2double(longstr(5));
                    spwarr(ktr).kparr[1] = str2double(longstr(6));
                    spwarr(ktr).kparr[2] = str2double(longstr(7));
                    spwarr(ktr).kparr[3] = str2double(longstr(8));
                    spwarr(ktr).kparr[4] = str2double(longstr(9));
                    spwarr(ktr).kparr[5] = str2double(longstr(10));
                    spwarr(ktr).kparr[6] = str2double(longstr(11));
                    spwarr(ktr).kparr[7] = str2double(longstr(12));
                    spwarr(ktr).sumkp = str2double(longstr(13));
                    spwarr(ktr).aparr[0] = str2double(longstr(14));
                    spwarr(ktr).aparr[1] = str2double(longstr(15));
                    spwarr(ktr).aparr[2] = str2double(longstr(16));
                    spwarr(ktr).aparr[3] = str2double(longstr(17));
                    spwarr(ktr).aparr[4] = str2double(longstr(18));
                    spwarr(ktr).aparr[5] = str2double(longstr(19));
                    spwarr(ktr).aparr[6] = str2double(longstr(20));
                    spwarr(ktr).aparr[7] = str2double(longstr(21));
                    spwarr(ktr).avgap = str2double(longstr(22));
                    spwarr(ktr).cp = str2double(longstr(23));
                    spwarr(ktr).c9 = str2double(longstr(24));
                    spwarr(ktr).isn = str2double(longstr(25));
                    spwarr(ktr).adjf10 = str2double(longstr(26));
                    spwarr(ktr).q = str2double(longstr(27));
                    spwarr(ktr).adjctrf81 = str2double(longstr(28));
                    spwarr(ktr).adjlstf81 = str2double(longstr(29));
                    spwarr(ktr).obsf10 = str2double(longstr(30));
                    spwarr(ktr).obsctrf81 = str2double(longstr(31));
                    spwarr(ktr).obslstf81 = str2double(longstr(32));
                    %spwarr(ktr).adjf30 = str2double(longstr(33));
                    %spwarr(ktr).obsf30 = str2double(longstr(34));
                    %spwarr(ktr).adjlstf30f81 = str2double(longstr(35));
                    %spwarr(ktr).obslstf30f81 = str2double(longstr(36));
                    MathTimeLibr.jday(spwarr(ktr).yr, spwarr(ktr).mon, spwarr(ktr).day, 0, 0, 0.0, out jd, out jdFrac);
                    if ktr > 0
                        oldjd = spwarr[ktr - 1].mjd;
                    spwarr(ktr).mjd = str2double(jd + jdFrac - 2400000.5);







                    % ---- find epoch date
                    if (ktr == 1)
                        mjdspwstart = spwarr(ktr).mjd;
                    end
                end  % for through observed
                
                ktrActObs = ktr
            end
       
            % ---- process predicted records
            if (contains(longstr, 'NUM_PREDICTED_POINTS'))
                numrecsobs = str2double(longstr(20:end));
                longstr = fgets(infile);
                % ---- process predicted records only
                % 1962 01 01 37665 -0.012700  0.213000  0.0326338  0.0017230  0.064261  0.006067  0.000000  0.000000   2 
                for i = 1: numrecsobs + 1
                    longstr = fgets(infile);
                    spwarr(ktr+i).year = str2double(longstr(1:4));
                    spwarr(ktr+i).mon = str2double(longstr(5:3));
                    spwarr(ktr+i).day = str2double(longstr(8:3));
                    spwarr(ktr+i).mjd = str2double(longstr(11:6));
                    spwarr(ktr+i).xp = str2double(longstr(17:10));
                    spwarr(ktr+i).xerr = 0.0;
                    spwarr(ktr+i).yp = str2double(longstr(27:10));
                    spwarr(ktr+i).yerr = 0.0;
                    spwarr(ktr+i).dut1 = str2double(longstr(37:11));
                    spwarr(ktr+i).dut1err = 0.0;
                    spwarr(ktr+i).lod = str2double(longstr(48:11));
                    spwarr(ktr+i).ddpsi = str2double(longstr(59:10));
                    spwarr(ktr+i).ddeps = str2double(longstr(69:10));
                    spwarr(ktr+i).dx = str2double(longstr(79:10));
                    spwarr(ktr+i).dy = str2double(longstr(89:10));
                    spwarr(ktr+i).dat = str2double(longstr(99:4));
    
                end  % for through observed
               
            end
    
        end  % while through file


    end


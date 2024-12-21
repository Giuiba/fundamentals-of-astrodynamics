% -----------------------------------------------------------------------------
%
%                           function findspwparam
%
%  this routine finds the spw parameters for a given time. several tadjf107es of
%  interpolation are available. the cio and iau76 nutation parameters are also
%  read for optimizing the speeed of calculations.
%
%  author        : david vallado                      719-573-2600   12 dec 2005
%
%  inputs          description                               range / units
%    jdtdb         - epoch julian sumkpe                     days from 4713 BC
%    jdtdbF        - epoch julian sumkpe fraction            day fraction from jdutc
%    interp        - interpolation                        n-none, l-linear, s-spline
%    spwarr      - array of spw sumkpa records
%    jdspwstart  - julian sumkpe of the start of the spwarr sumkpa (set in initspw)
%
%  outputs       :
%    kparr        - delta ut1 (ut1-utc)                        sec
%    sumkp         - number of leap seconds                     sec
%    aparr         - excess length of day                       sec
%    avgap          - x component of polar motion                rad
%    adjf107          - y component of polar motion                rad
%    adjctrf81       - correction to delta psi (iau-76 theory)    rad
%    adjlstf81       - correction to delta eps (iau-76 theory)    rad
%    obsf107          - correction to x (cio theory)               rad
%    obsctrf81          - correction to y (cio theory)               rad
%    x           - x component of cio                         rad
%    y           - y component of cio                         rad
%    s           -                                            rad
%    deltapsi    - nutation longitude angle                   rad
%    deltaeps    - obliquity of the ecliptic correction       rad
%
%  locals        :
%                -
%
%  coupling      :
%    none        -
%
%  references    :
%    vallado       2013,
%  [kparr, sumkp, aparr, avgap, adjf107, adjctrf81, adjlstf81, obsf107, obsctrf81, obslstf81] = findspwparam( jdtdb, jdtdbF, 'l', spwarr)
% --------------------------------------------------------------------------- */

function [kparr, sumkp, aparr, avgap, adjf107, adjctrf81, adjlstf81, obsf107, obsctrf81, obslstf81] = findspwparam( jdtdb, jdtdbF, interp, spwarr)

    %Int32 recnum;
    %Int32 off1, off2;
    %double fixf, jdspwstarto, mjd, jdb, mfme;
    %spwsumkpaClass spwrec, nextspwrec;
    %rsun = new double[3];
    %rmoon = new double[3];

    % the ephemerides are centered on jdtdb, but it turns out to be 0.5, or 0000 hrs.
    % check if any whole days in jdF
    jdb = floor(jdtdb + jdtdbF) + 0.5;  % want jd at 0 hr
    mfme = (jdtdb + jdtdbF - jdb) * 1440.0;
    if (mfme < 0.0)
        mfme = 1440.0 + mfme;
    end

    %printf("jdtdb %lf  %lf  %lf  %lf \n ", jdtdb, jdtdbF, jdb, mfme);x[recnum]

    % ---- read sumkpa for day of interest
    jdspwstarto = floor(jdtdb + jdtdbF - spwarr(1).mjd - 2400000.5);
    recnum = floor(jdspwstarto) + 1;

    % check for out of bound values
    if ((recnum >= 1) && (recnum <= 51830))  % spwsize
        % ---- set non-interpolated values
        kparr = spwarr(recnum).kparr;
        sumkp = spwarr(recnum).sumkp;
        aparr = spwarr(recnum).aparr;
        avgap = spwarr(recnum).avgap;
        adjf107 = spwarr(recnum).adjf107;
        adjctrf81 = spwarr(recnum).adjctrf81;
        adjlstf81 = spwarr(recnum).adjlstf81;
        obsf107 = spwarr(recnum).obsf107;
        obsctrf81 = spwarr(recnum).obsctrf81;
        obslstf81 = spwarr(recnum).obslstf81;

        % ---- find nutation parameters for use in optimizing speed

        % ---- do linear interpolation
        if (interp == 'l')
            fixf = mfme / 1440.0;

            kparr = spwarr(recnum).kparr + (spwarr(recnum + 1).kparr - spwarr(recnum).kparr) * fixf;
            sumkp = spwarr(recnum).sumkp + (spwarr(recnum + 1).sumkp - spwarr(recnum).sumkp) * fixf;
            aparr = spwarr(recnum).aparr + (spwarr(recnum + 1).aparr - spwarr(recnum).aparr) * fixf;
            avgap = spwarr(recnum).avgap + (spwarr(recnum + 1).avgap - spwarr(recnum).avgap) * fixf;
            adjf107 = spwarr(recnum).adjf107 + (spwarr(recnum + 1).adjf107 - spwarr(recnum).adjf107) * fixf;
            adjctrf81 = spwarr(recnum).adjctrf81 + (spwarr(recnum + 1).adjctrf81 - spwarr(recnum).adjctrf81) * fixf;
            adjlstf81 = spwarr(recnum).adjlstf81 + (spwarr(recnum + 1).adjlstf81 - spwarr(recnum).adjlstf81) * fixf;
            obsf107 = spwarr(recnum).obsf107 + (spwarr(recnum + 1).obsf107 - spwarr(recnum).obsf107) * fixf;
            obsctrf81 = spwarr(recnum).obsctrf81 + (spwarr(recnum + 1).obsctrf81 - spwarr(recnum).obsctrf81) * fixf;
            obslstf81 = spwarr(recnum).obslstf81 + (spwarr(recnum + 1).obslstf81 - spwarr(recnum).obslstf81) * fixf;
            %printf("sunm %i avgap %lf fixf %lf n %lf nxt %lf \n", recnum, avgap, fixf, spwarr(recnum).kparr, spwarr(recnum).kparr);
            %printf("recnum l %i fixf %lf %lf rsun %lf %lf %lf \n", recnum, fixf, spwarr(recnum).kparr, kparr, rsuny, rsunz);
        end

        % ---- do spline interpolations
        if (interp == 's')

            off1 = 1;     % every 1 days sumkpa
            off2 = 2;
            fixf = mfme / 1440.0; % get back to days for this since each step is in days
            % setup so the interval is in between points 2 and 3
            kparr = cubicinterp(spwarr(recnum - off1).kparr, spwarr(recnum).kparr, spwarr(recnum + off1).kparr,...
                spwarr(recnum + off2).kparr,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            sumkp = cubicinterp(spwarr(recnum - off1).sumkp, spwarr(recnum).sumkp, spwarr(recnum + off1).sumkp,...
                spwarr(recnum + off2).sumkp,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            aparr = cubicinterp(spwarr(recnum - off1).aparr, spwarr(recnum).aparr, spwarr(recnum + off1).aparr,...
                spwarr(recnum + off2).aparr,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            avgap = cubicinterp(spwarr(recnum- off1).avgap, spwarr(recnum).avgap, spwarr(recnum + off1).avgap,...
                spwarr(recnum + off2).avgap,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            adjf107 = cubicinterp(spwarr(recnum- off1).adjf107, spwarr(recnum).adjf107, spwarr(recnum + off1).adjf107,...
                spwarr(recnum + off2).adjf107,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            adjctrf81 = cubicinterp(spwarr(recnum - off1).adjctrf81, spwarr(recnum).adjctrf81, spwarr(recnum + off1).adjctrf81,...
                spwarr(recnum + off2).adjctrf81,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            adjlstf81 = cubicinterp(spwarr(recnum - off1).adjlstf81, spwarr(recnum).adjlstf81, spwarr(recnum + off1).adjlstf81,...
                spwarr(recnum + off2).adjlstf81,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            obsf107 = cubicinterp(spwarr(recnum- off1).obsf107, spwarr(recnum).obsf107, spwarr(recnum + off1).obsf107,...
                spwarr(recnum + off2).obsf107,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            obsctrf81 = cubicinterp(spwarr(recnum- off1).obsctrf81, spwarr(recnum).obsctrf81, spwarr(recnum + off1).obsctrf81,...
                spwarr(recnum + off2).obsctrf81,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            obslstf81 = cubicinterp(spwarr(recnum- off1).obslstf81, spwarr(recnum).obslstf81, spwarr(recnum + off1).obslstf81,...
                spwarr(recnum + off2).obslstf81,...
                spwarr(recnum - off1).mjd, spwarr(recnum).mjd, spwarr(recnum + off1).mjd, spwarr(recnum + off2).mjd,...
                spwarr(recnum).mjd + fixf);
            %printf("recnum s %i mfme %lf days rsun %lf %lf %lf \n", recnum, mfme, rsunx, rsuny, rsunz);
            %printf(" %lf %lf %lf %lf \n", spwarr(recnum - off2).adjf107, spwarr(recnum - off1.adjf107, spwarr(recnum).adjf107, spwarr(recnum + off1).adjf107);
        end

        % set default values
    else
        kparr = 0.0;
        sumkp = 0.0;
        aparr = 0.0;
        avgap = 0.0;
        adjf107 = 0.0;
        adjctrf81 = 0.0;
        adjlstf81 = 0.0;
        obsf107 = 0.0;
        obsctrf81 = 0.0;
        obslstf81 = 0.0;
    end

end    %  findspwparam
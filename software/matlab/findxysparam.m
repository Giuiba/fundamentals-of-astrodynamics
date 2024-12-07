        % -----------------------------------------------------------------------------
        %
        %                           function findxysparam
        %
        %  this routine finds the xys parameters for a given time. several types of
        %  interpolation are available. the cio and iau76 nutation parameters are also
        %  read for optimizing the speeed of calculations.
        %
        %  author        : david vallado                      719-573-2600   12 dec 2005
        %
        %  inputs          description                               range / units
        %    jdtdb         - epoch julian ye                     days from 4713 BC
        %    jdtdbF        - epoch julian ye fraction            day fraction from jdutc
        %    interp        - interpolation                        n-none, l-linear, s-spline
        %    xysarr      - array of xys ya records
        %    jdxysstart  - julian ye of the start of the xysarr ya (set in initxys)
        %
        %  outputs       :
        %    x        - delta ut1 (ut1-utc)                        sec
        %    y         - number of leap seconds                     sec
        %    s         - excess length of day                       sec
        %    xp          - x component of polar motion                rad
        %    yp          - y component of polar motion                rad
        %    ddpsi       - correction to delta psi (iau-76 theory)    rad
        %    ddeps       - correction to delta eps (iau-76 theory)    rad
        %    dx          - correction to x (cio theory)               rad
        %    dy          - correction to y (cio theory)               rad
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
        %  [x, y, s] = findxysparam( jdtdb, jdtdbF, interp, xysarr, jdxysstart)
        % --------------------------------------------------------------------------- */

        function [x, y, s] = findxysparam( jdtdb, jdtdbF, interp, xysarr)

        % the ephemerides are centered on jdtdb, but it turns out to be 0.5, or 0000 hrs.
        % check if any whole days in jdF
        jdb = floor(jdtdb + jdtdbF) + 0.5;  % want jd at 0 hr
        mfme = (jdtdb + jdtdbF - jdb) * 1440.0;
        if (mfme < 0.0)
            mfme = 1440.0 + mfme;
        end

        % ---- read ya for day of interest
        jdxysstarto = floor(jdtdb + jdtdbF - xysarr.jdxysstart);
        recnum = floor(jdxysstarto);

        % check for out of bound values
        if ((recnum >= 1) && (recnum <= 51830))  % xyssize
            % ---- set non-interpolated values
            x = xysarr.x(recnum);
            y = xysarr.y(recnum);
            s = xysarr.s(recnum);

            % ---- do linear interpolation
            if (interp == 'l')
                fixf = mfme / 1440.0;

                x = xysarr.x(recnum) + (xysarr.x(recnum + 1) - xysarr.x(recnum)) * fixf;
                y = xysarr.y(recnum) + (xysarr.y(recnum + 1) - xysarr.y(recnum)) * fixf;
                s = xysarr.s(recnum) + (xysarr.s(recnum + 1) - xysarr.s(recnum)) * fixf;
            end

            % ---- do spline interpolations
            if (interp == 's')

                off1 = 1;     % every 1 days ya
                off2 = 2;
                fixf = mfme / 1440.0; % get back to days for this since each step is in days
                % setup so the interval is in between points 2 and 3
                x = cubicinterp(xysarr.x(recnum - off1), xysarr.x(recnum), xysarr.x(recnum + off1),...
                    xysarr.x(recnum + off2),...
                    xysarr.mjd(recnum - off1), xysarr.mjd(recnum), xysarr.mjd(recnum + off1), xysarr.mjd(recnum + off2),...
                    xysarr.mjd(recnum) + fixf);
                y = cubicinterp(xysarr.y(recnum - off1), xysarr.y(recnum), xysarr.y(recnum + off1),...
                    xysarr.y(recnum + off2),...
                    xysarr.mjd(recnum - off1), xysarr.mjd(recnum), xysarr.mjd(recnum + off1), xysarr.mjd(recnum + off2),...
                    xysarr.mjd(recnum) + fixf);
                s = cubicinterp(xysarr.s(recnum - off1), xysarr.s(recnum), xysarr.s(recnum + off1),...
                    xysarr.s(recnum + off2),...
                    xysarr.mjd(recnum - off1), xysarr.mjd(recnum), xysarr.mjd(recnum + off1), xysarr.mjd(recnum + off2),...
                    xysarr.mjd(recnum) + fixf);
            end
        
        % set default values
        else
            x = 0.0;
            y = 0.0;
            s = 0.0;
         end
        
        %  findxysparam
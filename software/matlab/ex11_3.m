%     -----------------------------------------------------------------
%
%                              Ex11_3.m
%
%  this file demonstrates example 11-3.
%
%                          companion code for
%             fundamentals of astrodynamics and applications
%                                 2022
%                            by david vallado
%
%     email davallado@gmail.com
%
%     *****************************************************************
%
%  current :
%            12 Jun 23  david vallado
%                         original
%  changes :
%            30 dec 12 david vallado
%                         original baseline
%
%     *****************************************************************

        constmath;
        constastro;
        j2 = 0.00108263;
        
        % --------  repeat gt desired orbit characteristics
        alt = 160.0; % km
        ecc = 0.006301;
        incl = 45.0/rad;
        
        % location for observations - start point of repeat gt
        latgd = 41.52/rad;
        lon = 12.37/rad;
        salt = 0.152; %km
        
        % sensor charcateristics
        etafov = 20.0/rad;
        etactr = 15.0/rad;
      fprintf(1,'inputs latgd %11.7f  lon %11.7f alt %11.7f  fov %11.7f ctr %11.7f \n', ...
          latgd*rad, lon*rad, salt, etafov*rad, etactr*rad );
        
        
        sinlat      = sin( latgd );
        % ------  find rdel and rk components of site vector  ---------
        cearth= re / sqrt( 1.0 - ( eccearthsqrd*sinlat*sinlat ) );
        rdel  = ( cearth + salt )*cos( latgd );
        rk    = ( (1.0-eccearthsqrd)*cearth + salt )*sinlat;

        % ---------------  find site position vector  -----------------
        rs(1) = rdel * cos( lon );
        rs(2) = rdel * sin( lon );
        rs(3) = rk;

        r = mag(rs);
        rp = r + alt;
      fprintf(1,'rdel %11.7f  rk %11.7f r %11.7f  rpsite %11.7f km \n', rdel, rk, r, rp);
      
        r = re + alt;

        fovmin = 0.5*etafov + etactr;
        gamma   = pi - asin( r*sin(fovmin)/re );  % use larger angle
   fprintf(1,'gamma %11.7f gamma %11.7f rho %11.7f fovmin %11.7f \n', gamma*rad, (pi-gamma)*rad, r, fovmin);
        
        rho  = re*cos( gamma ) + r*cos(fovmin);
   fprintf(1,'fovmin %11.7f gamma %11.7f gamma %11.7f rho %11.7f  \n',fovmin*rad, gamma*rad, (pi-gamma)*rad, rho);

        lambda  = asin(rho * sin(fovmin)/re);
   fprintf(1,'lambda %11.7f  %11.7f km  \n',lambda*rad, lambda*re);
   
        revpday = 16.4;
        n = 16.4*2*pi/86400.0;  % rad/s
        a = (mu*(1/n)^2)^0.33333;
        ecc = (a-rp)/a;
   fprintf(1,'n %11.7f r/d %11.7f rad/s  a %11.7f km ecc %11.7f  \n',revpday, n, a, ecc);
        
        ecc = 0.001;
   fprintf(1,'\n now let ecc = %11.7f \n\n', ecc);

        a = rp/(1.0-ecc);
        n = sqrt(mu/(a*a*a));
   fprintf(1,'\n\n now let incl = %11.7f \n\n', incl*rad);
        omega = n/earthrot;
   fprintf(1,'n %11.7f rad/s  a %11.7f km ecc %11.7f omega  %11.7f \n\n', n, a, ecc, omega);
        

   
   fprintf(1,'now examine drag effects\n');
   
        a = 6535.4713;
        ecc = 0.001;
        pii = 16.387;
        qi = 1;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);
        

        pii = 16.0;
        qi = 1;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);

        pii = 32;
        qi = 2;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);

        pii = 49;
        qi = 3;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);

        pii = 82;
        qi = 5;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);
   
        pii = 213;
        qi = 33;
        p = a*(1.0 - ecc*ecc);
        n = sqrt(mu/(a*a*a));
        raandot = -1.5*j2*(re/p)^2*n*cos(incl);
        nn = pii/qi * (earthrot - raandot) * (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
   
        kepperiod = (2.0 * pi) / n;
        nodalperiodG = (2.0 * pi) / (earthrot - raandot);
        nodalperiod = kepperiod / (1 - 1.5*j2*(re/a)^2*(3.0 - 4.0*sin(incl)*sin(incl)));
        
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/60, nodalperiod/60, kepperiod/60, nn);
   fprintf(1,'p %3i q %3i  pg %11.7f  %11.7f  %11.7f min nn %11.7f rad/s  \n', pii, qi, nodalperiodG/tusec, nodalperiod/tusec, kepperiod/tusec, nn);
   
        

   
      
   % ============================================================================
   % example for rgt iterate to find a for a given change in lon
   % inputs are rev2rep, day2rep, ecc, and incl
   fprintf(1,'Example of iterating to find the change in lon \n');
   day2rep = 16;
   dlonppass = 172;  % km
   rev2rep = twopi*re / dlonppass;
   %ecc = (a-rp) / a;
   ecc = 0.001;
   incl = 45.0 / rad;

   revpday = rev2rep / day2rep;
   dlonprev = twopi*re*day2rep / rev2rep; % in km
   dlonprev = dlonprev / re;  % in rad
   fprintf(1,'day2rep %11.7f rev2rep %11.7f revpday %11.7f dlonprev %11.7f deg \n',day2rep, rev2rep, revpday, dlonprev * rad);

   nrd = revpday * earthrot; % rev / day
   n = nrd * twopi/86400.0/earthrot; % rad / sec
   anew = (mu*(1.0/n)^2)^0.33333;  % in km 
   fprintf(1,'n %11.7f r/d n %11.7f rad/s  a %11.7f km ecc %11.7f  \n',revpday, n, anew, ecc);
   
   ktr = 1;
   while(ktr < 10 && abs(anew-a) > 0.0001)
       a = anew;
       p = a*(1.0 - ecc*ecc);
       
       raandot = -1.5*j2*n*(re/p)^2*cos(incl);
       dlonperiod = twopi/n * raandot;
       
       dlon = (dlonprev + dlonperiod); 
       n = twopi*earthrot / dlon;
       anew = (mu*(1.0/n)^2)^(1.0/3.0);
       
       fprintf(1,'ktr %3i anew %11.7f  n  %11.7f  dlon  %11.7f \n', ktr, anew, n, dlon*rad);
       ktr = ktr + 1;
   end
   
 
   % ============================================================================
   % example for rgt iterate to find a for a given revs per day
   % inputs are rev2rep, day2rep, ecc, and incl
   fprintf(1,'\n\nExample of iterating to find revs per day \n');
   
   day2rep = 16;
   dlonppass = 172;  % km
   rev2rep = twopi*re / dlonppass;
   %ecc = (a-rp) / a;
   ecc = 0.001;
   incl = 45.0 / rad;
   
   revpday = rev2rep / day2rep;  % 
   dlonprev = twopi*re*day2rep / rev2rep; % in km
   dlonprev = dlonprev / re * rad;  % in deg
   fprintf(1,'day2rep %11.7f rev2rep %11.7f revpday %11.7f dlonprev %11.7f deg \n',day2rep, rev2rep, revpday, dlonprev);

   nrd = revpday * earthrot; % rev / day
   n = nrd * twopi/86400.0/earthrot; % rad / sec
   
   a = 0.0;
   anew = (mu*(1.0/n)^2)^0.33333333;
   fprintf(1,'n %11.7f rev/d n %11.7f rad/s  a %11.7f km ecc %11.7f  \n',revpday, n, anew, ecc);
  
   ktr = 1;
   while (ktr < 10 && abs(anew-a) > 0.0001)
       a = anew;
       % e - enew optional
       
       p = a * (1.0 - ecc*ecc);
       
       j2op2   = 1.5*j2*n*(re/p)^2;
       raandot = -j2op2 * cos(incl);
       argpdot =  j2op2 * 2.0-2.5*sin(incl)*sin(incl);
       mdot    =  j2op2 * sqrt(1.0-ecc*ecc) * (1.0 - 1.5*sin(incl)*sin(incl));
     
       n = revpday * earthrot * ((earthrot - raandot) - (mdot + argpdot));
       anew = (mu*(1.0/n)^2)^0.33333333;

       % enew 
       
       fprintf(1,'ktr %3i anew %11.7f  n  %11.7f \n', ktr, anew, n);
       ktr = ktr + 1;
   end
   
   
   



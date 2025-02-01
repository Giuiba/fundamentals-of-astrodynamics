% ------------------------------------------------------------------------------
%
%                              Ex11_5.m
%
%  this file demonstrates example 11-5.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

        constmath;
        constastro;
        j2 = 0.00108263;
        
        % --------  repeat gt calculations
        a = 6570.3358; % km
        ecc = 0.006301;
        
        incl = 45.00/rad;

        p = a * (1.0 - ecc*ecc);
        nanom = sqrt( mu/(a*a*a) );
   
        n = nanom;
   fprintf(1,'n %11.7f  %11.7f \n',n, n/rad);
        
        argprate = 0.75*j2*re^2*n*(4.0 - 5.0*(sin(incl))^2)/(p*p);
   fprintf(1,'argprate %11.7d  %11.7f deg/day \n',argprate, argprate*180*86400/pi);  % raanrate/omegaearthradptu

        dargpmax = sqrt( 2*30/(a*ecc) * ((1.0 + ecc)/(1.0 - ecc)) );
   
        taumax = abs(dargpmax/argprate);

        dv = n*a*ecc/2 * dargpmax;
   fprintf(1,'dargpmax %11.7f %11.7f taumax %11.7f %11.7f  dv %11.7f \n',dargpmax, dargpmax*rad ,taumax/60,taumax/86400, dv);  % raanrate/omegaearthradptu
   
   

        dargpmax = sqrt( 2*10/(a*ecc) * ((1.0 + ecc)/(1.0 - ecc)) );
   
        taumax = abs(dargpmax/argprate);

        dv = n*a*ecc/2 * dargpmax;
   
   fprintf(1,'dargpmax %11.7f %11.7f taumax %11.7f %11.7f  dv %11.7f \n',dargpmax, dargpmax*rad ,taumax/60,taumax/86400, dv);  % raanrate/omegaearthradptu

   
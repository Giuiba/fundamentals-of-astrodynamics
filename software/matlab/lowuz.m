% Sals 
%  uses chebyshev polynomial to find control parameter u
%  from 'Optimal Many-Revolution Orbit Transfer'
%  Journal of Guidance, Vol 8, No. 1, pp155-157, Jan-Feb 1985
%  author        : sal alfano      719-573-2600   12 apr 2012
%
function [ u ] = lowuz( z )

% assign coefficients and starting values
      alpha(1) =    2.467410607;
      alpha(2) =   -1.907470562;
      alpha(3) =   35.892442177;
      alpha(4) = -214.672979624;
      alpha(5) =  947.773273608;
      alpha(6) = -2114.861134906;
      alpha(7) =  2271.240058672;
      alpha(8) = -1127.457440108;
      alpha(9) =  192.953875268;
      alpha(10)=    8.577733773;
      beta(1) =    0.4609698838;
      beta(2) =   13.7756315324;
      beta(3) =  -69.1245316678;
      beta(4) =  279.0671832500;
      beta(5) = -397.6628952136;
      beta(6) =  -70.0139935047;
      beta(7) =  528.0334266841;
      beta(8) = -324.9303836520;
      beta(9) =   20.5838245170;
      beta(10)=   18.8165370778;
      alphasum = 0.0;
      betasum  = 1.0;
      zterm    = 1.0;
      
      for i = 1 : 10
        zterm = z * zterm;
        alphasum = alphasum + zterm * alpha(i);
        betasum = betasum  + zterm * beta(i);
      end
      
      u = abs(alphasum / betasum);
      
      if (u > 0.999999) 
          u = 0.999999;
      end
      if (u < 0.000001) 
          u = 0.000001;
      end

      


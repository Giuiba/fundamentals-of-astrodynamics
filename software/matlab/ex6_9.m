% ------------------------------------------------------------------------------
%
%                              Ex6_9.m
%
%  this file demonstrates example 6-9.
%
%                          companion code for
%             fundamentals of astrodyanmics and applications
%                                 2022
%                            by david vallado
%
%  author        : david vallado             davallado@gmail.com      20 jan 2025
%
% ------------------------------------------------------------------------------

    constastro;

    rad = 180.0 / pi;

    fprintf(1,'-------------------- problem ex 6-9 \n');
    rcs1 = 12756.274 / re;
    rcs3 = 42159.48 / re;
    phasei = -20.0 / rad;
    einit = 0.0;
    efinal = 0.0;
    nuinit = 0.0 / rad;
    nufinal = 0.0 / rad;
    ktgt = 1;
    kint = 1;

    fprintf(1,'\n rendezvous ktgt %i kint %i \n', ktgt, kint);
    [ phasef,waittime,deltav] = rendz(rcs1,rcs3,phasei,einit,efinal,nuinit,nufinal,ktgt,kint);

    fprintf(1,' phasef %11.7f  %11.7f  \n',phasef * rad, phasef);
    fprintf(1,' waittime %11.7f  %11.7f min  \n',waittime, waittime*tumin);
    fprintf(1,' deltav %11.7f  %11.7f km/s \n',deltav, deltav*velkmps);


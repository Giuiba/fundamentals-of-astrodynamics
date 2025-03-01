% ------------------------------------------------------------------------------
%
%                           function fecitoRSWsal
%
%  this function converts finds rotation matrix from eci to RSW
%
%  author        : sal alfano             719-573-2600    11 aug 2010
%
%  rotecitoRSW  =  feci2RSW( reci, veci );
% ------------------------------------------------------------------------------

function rotecitoRSW  =  feci2RSW( reci, veci )

    Runit = reci/norm(reci);
    h = cross(reci,veci);
    Nunit = h/norm(h);
    Tunit = cross(Nunit,Runit);
    rotecitoRSW = horzcat(Runit,Tunit,Nunit)';

end
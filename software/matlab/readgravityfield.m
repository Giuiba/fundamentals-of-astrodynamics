% ----------------------------------------------------------------------------
%
%                           function readgravityfield
%
%   this function reads and stores the gravity field coefficients. the routine can be
%   configured for either normalized or unnormalized values, but that depends on the
%   file under consideration. note that in practice, the factorial can only return
%   results to n = 170 due to precision limits.
%
%  author        : david vallado                    719-573-2600   9 oct 2019
%
%  inputs        description                                     range / units
%    fname       - filename for gravity field
%    order       - Size of gravity field                           1..2160..
%    normal      - normalized in file                              'y', 'n'
%
%  outputs       :
%    gravData.c  - gravitational coefficients (in gravityModelData)
%    gravData.s  - gravitational coefficients (in gravityModelData)
%
%  locals :
%    L, m        - degree and order indices
%    conv        - conversion to un-normalize
%
%  coupling      :
%   none
%
%  references :
%    vallado       2013, 597
%
% [gravarr] = readgravityfield(fname, normal)
% ----------------------------------------------------------------------------*/

function [gravarr] = readgravityfield(fname, normal)

    % read the whole file at once into lines of an array
    filename = fname;
    [fid, message] = fopen(filename,'r');
    fclose(fid);
    %fprintf(1,'%s \n',filename);
    filedat =load(filename);

    for i = 1:size(filedat,1)
        L = filedat(i,1);
        m = filedat(i,2);
        if normal == 'y'
            gravarr.cNor(L+1, m+1) = filedat(i,3);
            gravarr.sNor(L+1, m+1) = filedat(i,4);
        else
            gravarr.c = filedat(i,3);
            gravarr.s = filedat(i,4);
        end
    end  % L

    % % Define the full file path
    % filepath =fname;
    % 
    % % Read the file directly into a table
    % opts = delimitedTextImportOptions('NumVariables', 4);
    % opts.DataLines = [1, Inf];
    % opts.Delimiter = ' ';
    % opts.VariableNames = {'L', 'm', 'cNor', 'sNor'};
    % opts.VariableTypes = {'double', 'double', 'double', 'double'};
    % 
    % gravarr = readtable(filepath, opts);


    % just read it in as it comes, doing the normalization or undoing
    % it gets messed up with large fields
    %sizeL = size(Larr);
    % i = 1;
    % while (Larr(i) < degsize)
    %     %for i = 1:degsize   %sizeL(1)
    %     % find normalized or unnormalized depending on which is already in file
    %     % note that above n = 170, the factorial will return 0, thus affecting the results!!!!
    %     L = Larr(i);
    %     m = marr(i);
    %     Lp1 = Larr(i) + 1;
    %     mp1 = marr(i) + 1;
    %
    %     if (m == 0)
    %         conv = sqrt( 2 * L + 1 );
    %         gravarr.conv(Lp1, mp1) = conv;
    %     else
    %         conv = sqrt( (factorial(L - m) * 2 * (2 * L + 1)) / factorial(L + m) );
    %         gravarr.conv(Lp1, mp1) = conv;
    %     end
    %     if normal == 'n'
    %         temp = 1.0 / conv;
    %         gravarr.cNor(Lp1, mp1) = temp * gravarr.c(i);
    %         gravarr.sNor(Lp1, mp1) = temp * gravarr.s(i);
    %         gravarr.c(Lp1, mp1) = gravarr.c(i);
    %         gravarr.s(Lp1, mp1) = gravarr.s(i);
    %     else
    %         gravarr.c(Lp1, mp1) = conv * gravarr.cNor(i);
    %         gravarr.s(Lp1, mp1) = conv * gravarr.sNor(i);
    %         gravarr.cNor(Lp1, mp1) = gravarr.cNor(i);
    %         gravarr.sNor(Lp1, mp1) = gravarr.sNor(i);
    %     end
    %     i = i + 1;
    % end  % while


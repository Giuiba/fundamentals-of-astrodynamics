% truth values for the test problem
function NormLegPoly = legPoly
    NormLegPoly = zeros(10, 10);
    
    rad = 180.0 / pi;
    latgc = 30.6103084177511/rad;

    order = 5;
    
    % note this omits the condon-shortly -1^m notation
    % we're also using latitude and not co-latitude which some sources use as cos()
    S = sin(latgc);
    C = cos(latgc);
    
    % correction get matlab arrays correct starting at 1
    off = 1;
    
    % ----------------------- associated Legenrde functions
    P(0+off, 0+off) = 1.0;
    P(1+off, 0+off) = S;
    P(1+off, 1+off) = C;
    
    P(2+off, 0+off) = 0.5*(3.0*S^2 - 1);
    P(2+off, 1+off) = 3.0 * S * C;
    P(2+off, 2+off) = 3.0 * C^2;
    
    P(3+off, 0+off) = 0.5 * (5.0*S^3 - 3.0*S);
    P(3+off, 1+off) = 0.5 * C * (15.0 * S^2 -3.0);
    P(3+off, 2+off) = 15.0 * C^2*S;
    P(3+off, 3+off) = 15.0 * C^3;
    
    P(4+off, 0+off) = 1.0 / 8.0 * (35*S^4 - 30.0*S^2 + 3.0);
    P(4+off, 1+off) = 5.0 / 2.0 * C * (7.0*S^3 - 3.0*S);
    P(4+off, 2+off) = 15.0 / 2.0 * C^2 * (7.0*S^2 - 1.0);
    P(4+off, 3+off) = 105.0*C^3*S;
    P(4+off, 4+off) = 105.0*C^4;
    
    P(5+off, 0+off) = 1.0 / 8.0 * S * (15.0 - 70*S^2 + 63.0*C^4);
    P(5+off, 1+off) = 15.0 / 8.0 * C * (1.0 - 14.0*S^2 + 21.0*C^4);
    P(5+off, 2+off) = 105.0 / 2.0 * C^2 * (-S + 3.0*S^3);
    P(5+off, 3+off) = 105.0 / 2.0 * C^3*S * (-1.0 + 9.0 * S^2);
    P(5+off, 4+off) = 945.0*S*C^4;
    P(5+off, 5+off) = 945.0*C^5;
    
    fprintf(1,'\nunnormalized ALF values truth \n');
    fprintf(1,'case 0  %11.7f  \n',P(1,1));
    fprintf(1,'case 1  %11.7f  %11.7f  \n',P(2,1), P(2,2));
    fprintf(1,'case 2  %11.7f  %11.7f  %11.7f  \n',P(3,1), P(3,2), P(3,3));
    fprintf(1,'case 3  %11.7f  %11.7f  %11.7f  %11.7f  \n',P(4,1), P(4,2), P(4,3),P(4,4));
    fprintf(1,'case 4  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  \n',P(5,1), P(5,2), P(5,3),P(5,4),P(5,5));
    
    % ----------------------- normalization values
    for L = 0 : order
        Li = L + 1;
        for m = 0 : L
            mi = m + 1;
            % simply do in formula
            % if m==0
            %     del = 1;
            % else
            %     del = 2;
            % end
    
            % note that above n = 170, the factorial will return 0, thus affecting the results!!!!
            if (m == 0)
                conv(Li, mi) = sqrt((factorial(L - m) * (2.0 * L + 1)) / factorial(L + m));
            else
                conv(Li, mi) = sqrt((factorial(L - m) * 2.0 * (2 * L + 1)) / factorial(L + m));
            end
       
        end   % for m
    
    end   % for L
    
    fprintf(1,'\nnormalizations norm \n');
    fprintf(1,'case 0  %11.7f  \n',conv(1,1));
    fprintf(1,'case 1  %11.7f  %11.7f  \n',conv(2,1), conv(2,2));
    fprintf(1,'case 2  %11.7f  %11.7f  %11.7f  \n',conv(3,1), conv(3,2), conv(3,3));
    fprintf(1,'case 3  %11.7f  %11.7f  %11.7f  %11.7f  \n',conv(4,1), conv(4,2), conv(4,3),conv(4,4));
    fprintf(1,'case 4  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  \n',conv(5,1), conv(5,2), conv(5,3),conv(5,4),conv(5,5));
    
    fprintf(1,'\nnormalizations norm reciprocal \n');
    fprintf(1,'case 0  %11.7f  \n',1.0 /conv(1,1));
    fprintf(1,'case 1  %11.7f  %11.7f  \n',1.0 /conv(2,1), 1.0 /conv(2,2));
    fprintf(1,'case 2  %11.7f  %11.7f  %11.7f  \n',1.0 /conv(3,1), 1.0 /conv(3,2), 1.0 /conv(3,3));
    fprintf(1,'case 3  %11.7f  %11.7f  %11.7f  %11.7f  \n',1.0 /conv(4,1), 1.0 /conv(4,2), 1.0 /conv(4,3),1.0 /conv(4,4));
    fprintf(1,'case 4  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  \n',1.0 /conv(5,1), 1.0 /conv(5,2), 1.0 /conv(5,3),1.0 /conv(5,4),1.0 /conv(5,5));


    % ----------------------- combined normalized coefficients
    for L = 0 : order
        Li = L + 1;
        for m = 0 : L
            mi = m + 1;
    
            NormLegPoly(Li, mi) = conv(Li, mi) * P(Li, mi);
        end   % for m
    
    end   % for L
    
    fprintf(1,'\nnormalized ALF truth \n');
    fprintf(1,'case 0  %11.7f  \n',NormLegPoly(1,1));
    fprintf(1,'case 1  %11.7f  %11.7f  \n',NormLegPoly(2,1), NormLegPoly(2,2));
    fprintf(1,'case 2  %11.7f  %11.7f  %11.7f  \n',NormLegPoly(3,1), NormLegPoly(3,2), NormLegPoly(3,3));
    fprintf(1,'case 3  %11.7f  %11.7f  %11.7f  %11.7f  \n',NormLegPoly(4,1), NormLegPoly(4,2), NormLegPoly(4,3), NormLegPoly(4,4));
    fprintf(1,'case 4  %11.7f  %11.7f  %11.7f  %11.7f  %11.7f  \n',NormLegPoly(5,1), NormLegPoly(5,2), NormLegPoly(5,3), NormLegPoly(5,4), NormLegPoly(5,5));
    

    


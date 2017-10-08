function [p] = ellipsoidgrs(a, f)
% ELLIPSOIDGRS(A, F) parametros del elipsoide geodesico.
%
%   [P] = ELLIPSOIDGRS(A, F) calcula los parametros del elipsoide a partir
%   del semieje mayor (A) y el factor de achatamiento (F).
%       P.b: semieje menor
%       P.c: radio polar
%       P.e: primera excentricidad
%       P.ep: segunda excentricidad
% 
%   author: ahar0n
%     date: 2016.10.23
%
% See also MERIDIONALARC EARTHRADIUS

p.b = a * (1 - f);                      % Polar semiaxis
p.c = a^2 / p.b;                        % Polar radius of curvatura
p.e = sqrt((a^2 - p.b^2) / a^2);        % First excentricity
p.ep = sqrt((a^2 - p.b^2) / p.b^2);     % Second excentricity
p.alph = acos(p.b / a);                 % Angular excentricity
p.E = a * sqrt(p.e);                    % Lineal excentricity
p.m = (a^2 - p.b^2) / (a^2 + p.b^2);
p.n = (a - p.b) / (a + p.b);

end
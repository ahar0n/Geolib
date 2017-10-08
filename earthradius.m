function [n, m, rm, p] = earthradius(phi, a, e)
% EARTHRADIUS radios de curvatura principales.
% 
%   [N, M, RM, P] = EARTHRADIUS(PHI, A, E) calcula los radios de curvaturas 
%   principales para la latitud (PHI): radio de la gran normal o normal 
%   principal (N), radio de la elipse meridiana (M), radio medio de Gauss 
%   (RM) y radio del circulo paralelo (P). Ademas de la latitud, recibe  
%   como argumento el semieje mayor (A) y la primera excentricidad (E) del 
%   elipsoide.
%
%   author: ahar0n
%     date: 2017.10.07
%
% See also MERIDIONALARC ELLIPSOIDGRS

n = a / sqrt(1 - e^2 * (sind(phi))^2);
m = a * (1 - e^2) / (1 - e^2 * (sind(phi))^2)^(3/2);
rm = sqrt(n*m);
p = n * cosd(phi);

end
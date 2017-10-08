function [B, A0] = meridionalarc(phi, ep, c)
% MERIDIONALARC(PHI, EP, C) longitud del arco de meridiano hasta e'10, en 
%   el ecuador para la latitud (PHI).
%
%   Algorithm: Arc Meridional (Conventional formulas)
%   Blachut, T. J., Chrzanowski, A., & Saastamoinen, J. H. (1979). 
%   Urban Surveying and Mapping. New York, NY: Springer New York. pp. 18-20
%
%   [B] = MERIDIONALARC(PHI, EP, C) calcula el arco de meridiano (B) para
%   la latitud (PHI) sobre el elipsoide de parametros, 2da segunda (EP) y
%   radio polar (C).
%
%   [A0] = MERIDIONALARC(PHI, EP, C) retorna la constante A0 de la serie 
%   (A0, A1,..., An) involucrada en el calculo de B, cuando phi = NaN.
%
%
%   author: ahar0n
%     date: 2016.10.23
%
% See also EARTHRADUIS ELLIPSOIDGRS

% Longitud del arco de meridiano (aproximacion de la integral)
A0 = 1 - 3/4 * ep^2 * (1 - 15/16*ep^2 * (1 - 35/36*ep^2 * (1 - 63/64*ep^2 * (1 - 99/100*ep^2))));
A1 = 3/4 * ep^2 * (1 - 25/16*ep^2 * (1 - 77/60*ep^2 * (1 - 837/704*ep^2 * (1 - 2123/1860*ep^2))));
A2 = 5/8 * ep^2 * (1 - 139/144*ep^2 * (1 - 1087/1112*ep^2 * (1 - 513427/521760*ep^2)));
A4 = 35/72 * ep^4 * (1 - 125/64*ep^2 * (1 - 221069/150000*ep^2));
A6 = 105/256 * ep^6 * (1 - 1179/400*ep^2);
A8 = 231/640*ep^8;

if ~isnan(phi)
    B = A0*c*deg2rad(phi) - A1*c*sind(phi)*cosd(phi) * ... 
        (1 + A2*sind(phi)^2 + A4*sind(phi)^4 + A6*sind(phi)^6 +... 
        A8*sind(phi)^8);
else
    B = A0;
end
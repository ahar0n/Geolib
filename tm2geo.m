function [phi, lambda] = tm2geo(n, e, ell, mc, k0, fn, fe)
% TM2GEO coordenadas norte y este Tranverse de Mercator (TM).
%
%   Algorithm: Geographical Coordinates into TM Coordinates
%   Blachut, T. J., Chrzanowski, A., & Saastamoinen, J. H. (1979). 
%   Urban Surveying and Mapping. New York, NY: Springer New York. pp. 24
%
%   [PHI, LB] = TM2GEO(N, E, ELL, MC, K0, FN, FE) retorna las coordenadas
%   geodesicas latitud (PDI) y longitud (LB) sobre el elipsoide (ELL)
%   a partir de las coordenadas TM norte (N) y este (E). Requiere como 
%   argumento los parametros del huso TM: meridiano central (MC) del huso 
%   TM (deg), factor de escala en el meridiano central (K0), falso norte 
%   (FN) y falso este (FE) en metros.
%
%   author: ahar0n
%     date: 2016.10.23
%
% See also GEO2TM ELIPSOIDGRS MERIDIONALARC

% Algoritmo utiliza la formulacion convencional (iterativa)

[a, f] = selectellipsoid(ell);
if a == f
    error('Ellipsoid not found!\nYou could put it in the file elliposid_db.asc');
else
    myell = ellipsoidgrs(a, f);
end

x = (n - fn) / k0;
y = (e - fe) / k0;

A0 = meridionalarc(NaN, myell.ep, myell.c);

phi1 = x / (A0*myell.c);
B1 = meridionalarc(rad2deg(phi1), myell.ep, myell.c);
while abs(B1 - x) > 0.00005             % end with precision of 0.05mm
    phi1 = phi1 + (x - B1)/(A0*myell.c);
    B1 = meridionalarc(rad2deg(phi1), myell.ep, myell.c);
end

[N, M, RM, P1] = earthradius(rad2deg(phi1), a, myell.e);
b1 = 1/P1;
b2 = -1/2*b1^2*sin(phi1)*cos(phi1)*(1 + myell.ep^2*cos(phi1)^2);
b3 = -1/6*b1^3*(2 - cos(phi1)^2 + myell.ep^2*cos(phi1)^4);
b4 = -1/12*b1^2*b2*(3 + (2-9*myell.ep^2)*cos(phi1)^2 + 10*myell.ep^2*cos(phi1)^4 - 4*myell.ep^4*cos(phi1)^6);
b5 = 1/120*b1^5*(24 - 20*cos(phi1)^2 + (1 + 8*myell.ep^2)*cos(phi1)^4 - 2*myell.ep^2*cos(phi1)^6);
b6 = 1/360*b1^4*b2*(45 + 16*cos(phi1)^4);

phi = rad2deg(phi1 + b2*y^2 + b4*y^4 + b6*y^6);
lambda = rad2deg(deg2rad(mc) + b1*y + b3*y^3 + b5*y^5);

end
clear; 
clc;

% Geodesic coordinate
PHI = -27.48952286123;
LBD = -70.38577473231;

% TM parameters
FN = 7000000;
FE = 200000;
MC = -70.25;
K0 = 1.000109752273440;

% Test Geodesic to TM
[N, E] = geo2tm(PHI, LBD, 'WGS84', MC, K0, FN, FE);

% Test TM to Geodesic
[phi, lbd] = tm2geo(N, E, 'WGS84', MC, K0, FN, FE);

% Test Geodesic to TM
[No, Es] = geo2tm(phi, lbd, 'WGS84', MC, K0, FN, FE);
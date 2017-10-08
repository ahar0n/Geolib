function [a, f] = selectellipsoid(name)
%SELECTELIPSOID(N) parametros del elipsoide (a, f)
%
%   [A, F] = SELECTELIPSOID(N) retorna los parametros del elipsoide semieje
%   mayor (A) y achatamiento (F), a partir del nombre (N). El nombre
%   corresponde con el nombre del elipsoide (e.g. WGS84, PSAD56).
%
%   author: ahar0n
%     date: 2016.10.23
%
% See also ELLIPSOIDGRS EARTHRADIUS

fname = 'ellipsoid_db.asc';
formatSpec = '%s %f %f';
fid = fopen(fname);
content = textscan(fid, formatSpec, 'HeaderLines', 1);
fclose(fid);

name_db = content{1};
a_db = content{2};
f_db = content{3};

[qry, idx] = ismember(name_db, name);
if sum(idx)
    a = a_db(qry);
    f = 1/f_db(qry);
else
    a = 1;
    f = 1;
end
end
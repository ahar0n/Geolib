function site2kml(name, lat, lon, color, kmlname)
% site2kml(NAME, LAT, LON, C, KML) genera el archivo de nombre KML con las
% posiciones de los puntos.
% 
% NAME: array cell con N nombres para las N posiciones.
%  LAT: array con N latitudes para los N puntos.
%  LON: array con N longitudes para los N puntos.
%    C: color de los puntos.
%  KML: nombre del archivo kml de salida.

for i=1:length(name)
    point(i).Geometry = 'Point';
    point(i).Name = name{i};
    point(i).Lat = lat(i);
    point(i).Lon = lon(i);
end

gpoints = geopoint(point); % convierte estructura a geopuntos
filename = fullfile(strcat(kmlname, '.kml')); % genera kml

% write kml file
%   help kmlwrite: https://la.mathworks.com/help/map/ref/kmlwrite.html
kmlwrite(filename, gpoints, 'Name', gpoints.Name,... 
    'Description',{}, 'color', color);
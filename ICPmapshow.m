function axObject = ICPmapshow()
% ICPmapshow displays the locations of all ice cores collected by the Byrd
% Polar & Climate Research Center, according to Davidge et al. (2022).
% Requires the MATLAB Mapping Toolbox™
% 
% SYNTAX
%  axObject = ICPmapshow()
%
% EXAMPLES:
% % Show map
%  s = ICPmapshow();
%
% %Change the basemap
%  gx = s.Parent;
%  gx.Basemap = 'satellite'; 
%
% BASEMAPS: 
% 'topographic' (default), 'darkwater', 'grayland', 'bluegreen',
% 'grayterrain', 'colorterrain', 'landcover', 'streets', 'streets-light',
% 'streets-dark', 'satellite', 'none'
%
% REFERENCE:
%  Lindsey Davidge, Hanna L. Brooks, & Merlin L. Mah. (2022). Global ice
%  drilling and archive location data for select ice cores (1.0.1) [Data
%  set]. Zenodo. https://doi.org/10.5281/zenodo.7076469
%
% COPYRIGHT
%  ©Austin M. Weber 2023

%
% FUNCTION BODY:
%
% Get ice core drilling and archive data
davidge_data = readtable('https://zenodo.org/record/7076469/files/ice_archive_data_220913.xlsx');

% Create an index to filter for the Byrd Polar & Climate Research Center
byrd_idx = categorical(davidge_data.ARCHIVE_LOCATION) == 'Byrd Polar Center, Ohio, USA';

% Extract the locations of all Byrd Center ice cores
ice_core_locations = [davidge_data.LATITUDE(byrd_idx),davidge_data.LONGITUDE(byrd_idx)];
ice_core_names = categorical(davidge_data.SITE_NAME);
ice_core_names = ice_core_names(byrd_idx);

% Remove repeat locations from the array
[~,x_idx] = unique(ice_core_locations(:,1)); 
ice_core_locations = ice_core_locations(x_idx,:);
ice_core_names = ice_core_names(x_idx,:);

% Create a new figure and plot the ice core locations on a map
figure('Name','Byrd Polar & Climate Research Center Ice Core Drilling Locations')
warning off
axObject = geoscatter(ice_core_locations(:,1),ice_core_locations(:,2));
axObject.Marker = 'o';
axObject.MarkerEdgeColor = '#f4320c';
axObject.MarkerFaceAlpha = 0.1;
axObject.CData = ice_core_names;
	% Add second set of markers at same locations, but as open circles
	hold on
	geoscatter(ice_core_locations(:,1),ice_core_locations(:,2),'Marker','.','CData',ice_core_names,'MarkerEdgeColor','#f4320c');

gx = axObject.Parent;
gx.Basemap = 'topographic';

% Print that the location data are from Davidge et al. (2022)
disp('')
disp('Citation:')
disp('The ice core location data are from Davidge et al. (2022) at https://doi.org/10.5281/zenodo.7076469')

end
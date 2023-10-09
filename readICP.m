function [data,latitude,longitude,elevation,yrDrilled,citation] = readICP(filename,sheetname)
% readICP imports published datasets from the Byrd Polar & Climate
% Research Center's Ice Core Paleoclimatology (Byrd-ICP) group. Down-
% load the relevant Excel files from https://zenodo.org/record/8353857.
%
% SYNTAX
%  data = readICP(filename)
%  data = readICP(filename,sheetname)
%  [~,latitude] = readICP(...)
%  [~,~,longitude] = readICP(...)
%  [~,~,~,elevation] = readICP(...)
%  [~,~,~,~,yrDrilled] = readICP(...)
%  [~,~,~,~,~,citation] = readICP(...)
%
% DESCRIPTION
%  readICP(filename) extracts the data from an Excel file
%    corresponding to a specific ice core.
%
%  readICP(filename,sheetnam) extracts the data from a specified sheet
%    within an Excel file corresponding to a specific ice core.
%
%  [~,latitude] = readICP(...) extracts the latitude of the ice core from
%    the file metadata (in °N).
%
%  [~,~,longitude] = readICP(...) extracts the longitude of the ice core
%    from the file metadata (in °E).
%
%  [~,~,~,elevation] = readICP(...) extracts the elevation of the ice core
%    from the file metadata (in units of meters above sea level, masl).
%
%  [~,~,~,~,yrDrilled] = readICP(...) extracts the year that the ice core
%    was drilled from the file metadata.
%
%  [~,~,~,~,~,citation] = readICP(...) extracts the original reference
%    citation for the ice core dataset from the file metadata.
%
% DETAILS:
%  This function requires one input argument ('filename') and accepts one
%  optional second input ('sheetname'). If no second input is passed,
%  the function grabs the data from the first 'sheet' in the Excel file
%  specified by 'filename'. If a sheet name is specified, the function
%  will grab the data from that sheet in the Excel file.
%
% EXAMPLES:
% Import data from an Excel file with only one sheet (e.g., Windy Dome)
%   wd = readICP('C:\Directory\windy-dome.xlsx');
% 
% Import latitude, longitude, and elevation only
%   [~,lat,lon,el] = readICP('C:\Directory\windy-dome.xlsx');
% 
% Import data from an Excel file with more than one sheet, and import the
% citation information for that dataset. E.g., the Puruogangri trace
% element data is stored in a sheet called 'puruogangri-TE'
%   [puruoTE,~,~,~,~,cite] = readICP('C:\Directory\puruogangri.xlsx',...
%        'puruogangri-TE');
%
% COPYRIGHT
%  ©Austin M. Weber 2023
% See also
% ICP_get_dataset_names

%
% FUNCTION BODY:
%
% If no second argument is passed, the function grabs the data from
% the first 'sheet' in the Excel file.
 if ~exist('sheetname','var') % The "~" means "not"
     
	% Import file metadata
	md = readcell(filename);
	vars = md(9,:); % Variable names
	units = md(10,:); % Variable units

	% Import ICPdata
	data = readtable(filename,'NumHeaderLines',10);
	data.Properties.VariableNames = vars;
	data.Properties.VariableUnits = units;

	% Remove missing elements in latitude, longitude, and elevation
	lat_idx = ones(1,length(md(4,:))); % latitude array preallocation
	lon_idx = ones(1,length(md(4,:))); % longitude " "
	ele_idx = ones(1,length(md(4,:))); % elevation " "
	yr_idx = ones(1,length(md(4,:)));  % year drilled " "
	for n = 2:length(md(4,:))
		lat_idx(n) = ismissing(md{4,n});
		lon_idx(n) = ismissing(md{5,n});
		ele_idx(n) = ismissing(md{6,n});
		yr_idx(n) = ismissing(md{7,n});
	end
	% Extract non-missing values, save as matrices instead of cells
	latitude = cell2mat(md(4,~lat_idx));
	longitude = cell2mat(md(5,~lon_idx));
	elevation = cell2mat(md(6,~ele_idx));
	yrDrilled = cell2mat(md(7,~yr_idx));

	% Get the citation for the original data study
	citation = md{3,2};

% If a second argument is passed:
 else
	% Import file metadata
	md = readcell(filename,'Sheet',sheetname); 
	vars = md(9,:); % Variable names
	units = md(10,:); % Variable units
		idx = zeros(1,numel(vars));
		for n = 1:numel(vars)
			if ~ischar(vars{n})
				idx(n) = 1;
			end
		end
		idx = logical(idx);
		vars(idx) = [];
		units(idx) = [];

	% Import ICPdata
	data = readtable(filename,'Sheet',sheetname,'NumHeaderLines',10);
	data(:,idx) = [];
	data.Properties.VariableNames = vars;
	data.Properties.VariableUnits = units;

	% Remove missing elements in latitude, longitude, and elevation
	lat_idx = ones(1,length(md(4,:))); % latitude array preallocation
	lon_idx = ones(1,length(md(4,:))); % longitude " "
	ele_idx = ones(1,length(md(4,:))); % elevation " "
	yr_idx = ones(1,length(md(4,:)));  % year drilled " "
	for n = 2:length(md(4,:))
		lat_idx(n) = ismissing(md{4,n});
		lon_idx(n) = ismissing(md{5,n});
		ele_idx(n) = ismissing(md{6,n});
		yr_idx(n) = ismissing(md{7,n});
	end
	% Extract non-missing values, save as matrices instead of cells
	latitude = cell2mat(md(4,~lat_idx));
	longitude = cell2mat(md(5,~lon_idx));
	elevation = cell2mat(md(6,~ele_idx));
	yrDrilled = cell2mat(md(7,~yr_idx));

	% Get the citation for the original data study
	citation = md{3,2};

 end

end
function dataset_names = ICP_get_dataset_names(core_name)
% ICP_get_dataset_names loads the "sheet" names contained within a
%   specified ice core data collection and saves as a cell array. Used in
%   conjunction with readICP() for specifying a second input argument.
%
% SYNTAX
%  dataset_names = ICP_get_dataset_names(core_name)
%
% DESCRIPTION
%  The input 'core_name' is a string containing the name of an ice core
%  location with a data collection in the Byrd-ICP package. The ice core
%  name must be all lower case and include hyphens if there are multiple
%  words in the name.
%
% EXAMPLE
%  % Get the sheet names for the Puncak Jaya ice cores
%  pj_names = ICP_get_dataset_names('puncak-jaya')
%   pj_names
%      7x1 cell array
%          {'coreD1-raw'}
%          {'coreD1-tritium'}
%          {'coreD1B-raw'}
%          {'nino3SST'}
%          {'log-transform'}
%          {'instrumental-tritium'}
%          {'rainfall-isotopes'}
%
%  % Extract the raw data from Puncak Jaya Core D1B
%  pj_data = readICP('C:\Directory\puncak-jaya.xlsx',pj_names{3});
%
%  % Alternatively, you can write the string name manually:
%  pj_data = readICP('C:\Directory\puncak-jaya.xlsx','coreD1B-raw');
%
% ACCEPTABLE CORE NAMES
% 	-> 'bona-churchill'
% 	-> 'bruce-plateau'
% 	-> 'dasuopu'
% 	-> 'dunde'
%	-> 'elbrus'
% 	-> 'guliya'
% 	-> 'interdecadal-pacific-oscillation-index'
% 	-> 'kilimanjaro'
% 	-> 'nevado-huascaran'
% 	-> 'plateau-remote'
% 	-> 'prince-of-wales'
% 	-> 'puncak-jaya'
% 	-> 'puruogangri'
% 	-> 'quelccaya'
% 	-> 'sajama'
% 	-> 'siple-station'
% 	-> 'taylor-dome'
% 	-> 'windy-dome'
%
% Note that spelling is case sensitive; multiple-word inputs require a
% hyphen between words.
%
% COPYRIGHT
%  ©Austin M. Weber 2023
% See also
% readICP

%
% FUNCTION BODY
%
% Import table of ice core names and their corresponding dataset IDs
name_table = readtable('https://zenodo.org/record/10403150/files/2023-ByrdICP-datasets.xlsx','VariableNamingRule','preserve');

% Search for core name that matches the input argument
for n = 1:size(name_table,2) % No. columns in 'names'
	if strcmp(name_table.Properties.VariableNames(n),core_name)
		break
	end
end
sheet_names = name_table(:,n);
sheet_names = rmmissing(sheet_names);

% Output
dataset_names = table2array(sheet_names);

end

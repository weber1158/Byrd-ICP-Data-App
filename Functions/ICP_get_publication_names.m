function publication_names = ICP_get_publication_names(core_name)
% ICP_get_publication_names loads the publication author (year) contained within a
%   specified ice core and saves as a cell array. 
%
% SYNTAX
%  dataset_names = ICP_get_publication_names(core_name)
%
% DESCRIPTION
%  The input 'core_name' is a string containing the name of an ice core
%  location with a data collection in the Byrd-ICP package. The ice core
%  name must be all lower case and include hyphens if there are multiple
%  words in the name.
%
% EXAMPLE
%  % Get the publication names for the Nevado Huascaran ice cores
%  nh_names = ICP_get_publication_names('nevado-huascaran')
%   nh_names
%      2x1 cell array
%          {'Weber et al. (2023)'}
%          {'Thompson et al. (1995)'}
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
% See also
% ICP_get_dataset_names readICP

% COPYRIGHT
%  ©Austin M. Weber 2024


% Import table of ice core names and their corresponding publications
pathname = pwd;
filename = [pathname '/Data/byrd-data-info.xlsx'];
name_table = readtable(filename,...
	'VariableNamingRule','preserve','Sheet','publication');

% Search for core name that matches the input argument
for n = 1:size(name_table,2) % No. columns in 'names'
	if strcmp(name_table.Properties.VariableNames(n),core_name)
		break
	end
end
pub_names = name_table(:,n);
pub_names = rmmissing(pub_names);

% Output
publication_names = table2array(pub_names);

end
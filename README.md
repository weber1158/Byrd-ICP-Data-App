# <span style="color:D7BA7D"> <b> Byrd-ICP Data Analysis Packge </b> </span>

### **Why the Byrd-ICP Data Analysis Pacakge?**
This package is intended to hasten the process of acquiring ice core data from the Byrd Polar & Climate Research Center Ice Core Paleoclimatology Group (Byrd-ICP). All data in this package are available on the NOAA NCEI Paleo Data Search webpage: **https://www.ncei.noaa.gov/access/paleo-search/**

You will need to select the <strong>Ice Cores</strong> data type and choose "Mosley-Thompson, E." and "Thompson, L.G." from under the <strong>Investigators</strong> section of the page. Finally, click **SEARCH**.

Alternatively, a repository of Excel files containing the published data in an unofficial standardized format can be found at **https://zenodo.org/record/8353857** (Weber, 2023).

_____

### **Timeline of Major Changes**
* 09 October 2023 - Updated package to Version 2.0 and removed depreciated functions.

-----
-----
# <span style="color:D7BA7D"> **App DOCUMENTATION** </span>

The Byrd-ICP Data Analysis package includes an interactive MATLAB GUI that allows the user to utilize the package's functionality without having to write any code. Simply call the `ByrdApp` function from the MATLAB prompt and the application will open in a new window.

```matlab
>> ByrdApp
```

The `ByrdApp` function requires that you have the following files stored on your current MATLAB search path:

* <small>`ByrdApp.mlapp`</small>
* <small>`readICP.m`</small>
* <small>`ICP_get_dataset_names.m`</small>
* <small>`ICPmapshow.m`</small>

-----

<big>**Example Guide**</big>

![Screenshot of application window](AppDisplay1.png "Byrd-ICP Data Analysis GUI")

1. Select an ice core from the **Choose a core** drop-down menu.

2. The **Choose dataset** drop-down menu will autopopulate when you complete Step 1.

3. Click the <span style="color:#a86da8"> **Import** </span> button. This will pull the data from a Zenodo repository (Weber, 2023). 

4. The original reference citation for the dataset will be printed **Original reference** text area.

5. The dataset is automatically displayed in a sortable table.

6. The latitude, longitude, and elevation for the ice core will be printed in the **Location** text area.

7. Click the <span style="color:#a8a86d"> **Save as...** </span> button beneath the table. This will open a dialogue box where you can choose to save the raw data as a `.csv`, `.xlsx`, or `.txt` file.

8. Clicking the <span style="color:#a86da8"> **Map View** </span> button will open a new window illustrating the location of the ice core site.

9. Display area for plotting data.

10. Choose the parameters you wish to plot by selecting from the `X-Data`, `Y-Data`, and `Chart Style` drop-down menus.

11. (Optional) Select one of the four predefined color buttons.

12. Click the <span style="color:#a86da8"> **Plot** </span> button to visualize your parameters in the display area.

13. Press the <span style="color:#a86d6d"> **Clear** </span> button to clear the display area.

14. Click the <span style="color:#a8a86d"> **Save as...** </span> button in the bottom right corner. This will open a dialogue box where you can choose to save your plot as a `.jpeg`, `.png`, or `.tif` file.

-----
-----
# <span style="color:D7BA7D"> **Function DOCUMENTATION** </span>

## **`readICP`**
Imports an ice core dataset from the Byrd ICP group as a table. Simply download the desired Excel file from **https://zenodo.org/record/8353857** (Weber, 2023) and then specify your desired input(s) and output(s). 

<u> SYNTAX </u>

`data = readICP(filename)` Extracts the data from the first sheet in the specified Excel file. Output stored as a table.

`data = readICP(filename,sheetname)` Extracts the data from the specified sheet within the specified Excel file. Output stored as a table.

`[~,latitude] = readICP(...)` Extracts the latitude coordinate for the ice core site (in degrees N).

`[~,~,longitude] = readICP(...)` Extracts the longitude coordinate for the ice core site (in degrees E).

`[~,~,~,elevation] = readICP(...)` Extracts the elevation of the ice core site (in meters above sea level, masl).

`[~,~,~,~,yrDrilled] = readICP(...)` Extracts the year that the ice core was drilled.

`[~,~,~,~,~,citation] = readICP(...)` Extracts the original reference citation for the ice core dataset.

<u> EXAMPLES </u>

Import data from an Excel file with only one sheet (e.g., Windy Dome):

```matlab
wd = readICP('C:\...\windy-dome.xlsx');
```

Import the latitude, longitude, and elevation only:

```matlab
[~,lat,lon,el] = readICP('C:\...\windy-dome.xlsx');
```

Import data from an Excel file with more than one sheet, and import the
citation information for that dataset. E.g., the Puruogangri trace
element data is stored in a sheet called 'puruogangri-TE':

```matlab
[puruoTE,~,~,~,~,cite] = readICP('C:\...\puruogangri.xlsx','puruogangri-TE');
```

## **`ICP_get_dataset_names`**
Generates a cell array of dataset names belonging to a specified ice core site.

<u> SYNTAX </u>

`names = ICP_get_dataset_names(core_name)`

<u> DESCRIPTION </u>

The input `core_name`  must be given in single quotes. It can be any of the following: <small>

	-> 'bona-churchill'
	-> 'bruce-plateau'
	-> 'dasuopu'
	-> 'dunde'
	-> 'guliya'
	-> 'interdecadal-pacific-oscillation-index'
	-> 'kilimanjaro'
	-> 'nevado-huascaran'
	-> 'plateau-remote'
	-> 'prince-of-wales'
	-> 'puncak-jaya'
	-> 'puruogangri'
	-> 'quelccaya'
	-> 'sajama'
	-> 'siple-station'
	-> 'taylor-dome'
	-> 'windy-dome'
</small>

Note that spelling must be all lowercase and that mutli-word core names require a hyphen between words.

## **`ICPmapshow`**
Displays the locations of all ice core sites (collected by the Byrd ICP group) according to Davidge et al. (2022).

<u> SYNTAX </u>

`s = ICPmapshow()`

<u> DESCRIPTION </u>

The function takes no input arguments and the output is an axes object. Unfortunately, this function **requires the MATLAB Mapping Toolbox™**. 

<u> EXAMPLE: Changing the basemap </u>

```matlab
% Generate map
map = ICPmapshow();

% Change basemap to satellite
gx = map.Parent;
gx.Basemap = 'satellite';

% Alternative basemaps:
% 'topographic' (default), 'darkwater', 'grayland', 'bluegreen',
% 'grayterrain', 'colorterrain', 'landcover', 'streets', 'streets-light',
% 'streets-dark', 'satellite', 'none'
```

-----

# <span style="color:D7BA7D"> **REFERENCES** </span>

    Lindsey Davidge, Hanna L. Brooks, & Merlin L. Mah. (2022). Global ice drilling and archive location data for select ice cores (1.0.1) [Dataset]. Zenodo. https://doi.org/10.5281/zenodo.7076469
    
    Weber, Austin M. (2023). Byrd Polar and Climate Research Center Ice Core Paleoclimatology Datasets in a Standardized Excel Format (1.0.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.8353857
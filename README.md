# ByrdDIT - The Byrd Data Import Tool

An intuitve graphical user interface (GUI) for ice core researchers to quickly access, visualize, and save data sets published by the Byrd Polar and Climate Research Center.

## Table of Contents ##

- [Why the Byrd Data Import Tool?](#why-byrddit)
- [Timeline of major changes](#timeline-of-major-changes)
- [Using the tool](#use)
   - [Tutorial](#tutorial)
   - [Examples](#examples)
- [How to cite](#how-to-cite)
- [References](#references)

## Why `ByrdDIT`?
For over forty years the Byrd Polar and Climate Research Center (henceforth “the Byrd Center”) has pioneered the drilling of unique high-mountain ice core records from Earth’s low latitude regions ([Thompson et al., 2021](#references)). During this time, the Byrd Center has published a wide range of ice core data sets with a global coverage of more than 16 countries across 6 continents. 

The majority of these datasets have been made freely available through the NOAA World Data Service for Paleoclimatology (https://www.ncei.noaa.gov/access/paleo-search/). However, over the course of many decades the style of data formatting and the diversity of Byrd Center authors has varied considerably, making it a very inefficient process to find, access, download, visualize, and compare the data sets for one or multiple ice core records. 

To improve the accessibility of these crucial data sets for researchers worldwide, a standardized data format has been adopted and applied to 81 data sets across 17 unique ice core records from 29 peer-reviewed publications ([Weber 2023](#references)). All of the data may now be quickly accessed with the the <u>Byrd</u> <u>D</u>ata <u>I</u>mport <u>T</u>ool <small>(`ByrdDIT`)</small>, an elegant and intuitive GUI written for MATLAB.


## Timeline of Major Changes
* **11 August 2024** - Updated <small>`ByrdApp.mlapp`</small> to Version 3.0. Includes a local data repository for significantly faster data import times and a new, scientifically-improved GUI interface with additional features (such as a button for copying citations in the <small>`BibTeX`</small> style).
* **18 December 2023** - Updated <small>`ByrdApp.mlapp`</small> to Version 2.3. Users can now import data for the Elbrus ice core as well as the 41,000 year data for the Guliya plateau ice core. Additional plotting capabilities added.
* **10 October 2023** - Updated <small>`ByrdApp.mlapp`</small> to Version 2.2 in order to reflect changes in the data repository and to provide a fix for plotting ice core locations on a geographic axes.
* **09 October 2023** - Updated package to Version 2.0 and removed depreciated functions.

## Use

<small>`ByrdDIT`</small> is designed so that anyone, regardless of programming knowledge, is able to use it. First, sign up for a free [MathWorks account](https://www.mathworks.com/mwaccount/account/create?cid=getmatlab&wid=&uri=https%3A%2F%2Fmatlab.mathworks.com%2F) and download/open the <small>`ByrdDIT`</small> repository in MATLAB Online. Then, simply type either of the following commands into the Command Window to activate the GUI:

Option 1:
```matlab
ByrdDIT
```

Option 2:
```matlab
ByrdApp
```

That's it!

The latest rendition of the app (Version 3.0) should look like this:

<img alt="Byrd Data Import Tool Appearance" width="600" src="/Screenshots/app-tutorial-image.png">

Use the numbers in the image to as a reference for working with <small>`ByrdDIT`</small> as it is intended.

### Tutorial

1. Choose an `Ice Core`, a related `Publication`, and a `Data Set` from the dropdown menus.

2. `Import` the chosen data set.

3. Area displaying the citation of a imported data set.  Copy the citation to your clipboard using the buttons below—either as `Plain Text` or in `BibTeX` formatting.

4. Interactive table containing the imported data. Save the data to the current folder with the `Save` or `Save as…` buttons. The `Save` button saves the data as a CSV and the `Save as…` button gives the user a choice to save the data as a CSV, Excel, or Text file.

5. Area displaying the latitude, longitude, and elevation of the ice core site. Click the `Map View` button to view the location of the ice core site in a new figure window<sup>**requires the [Mapping Toolbox](https://www.mathworks.com/products/mapping.html)</sup>.

6. User selections for plotting. Choose and x- and y- variable from the dropdown menus as well as a chart style. Optional adjustments can also be made to the line width, line style, and color properties of the chart. Additionally, the user may specify a moving average for the data.

7. Click the `Plot` button to visualize the selections from step 6. The `Clear` button resets the Data Visualization Panel. The `Save as…` button gives the user the choice to save the chart as a PNG, JPEG, or TIF image.

8. Data Visualization Panel. Automatically labels the axes with the correct metadata and gives the plot a descriptive title. TIP: Some chart types (e.g., line charts) are stackable.


### Examples

An example of <small>`ByrdDIT`</small> in action is given below. 

<img alt="Example of the Byrd Data Import Tool" width="600" src="/Screenshots/app-example-image.png">

The screenshot above shows how the user can select a data set for the Nevado Huascarán ice core and visualize the reconstructed water isotope (δ<sup>18</sup>O) data for the mountain Col. Clicking the red <small>`Map View`</small> button will open a new window showing the location of the ice core site:

<img alt="Map View of an Ice Core Site" width="300" src="/Screenshots/map-view-example-image.png">


## How to cite
Weber, Austin M. (2024) ByrdDIT - The Byrd Data Import Tool. Version 3.0.0 [Software]. GitHub. https://github.com/weber1158/Byrd-ICP-Data-App

For BibTeX:
```tex
@software{weber2024byrd
   author = {Weber, Austin M.}, 
   title = {{ByrdDIT} - {Byrd} {Data} {Import} {Tool}}, 
   year = 2024, 
   publisher = {GitHub}, 
   version = {3.0.0}, 
   url = {https://github.com/weber1158/Byrd-ICP-Data-App} 
}
```

## References
* Thompson, Lonnie G., Davis, M. E., Mosley-Thompson, E., Porter, S. E., Corrales, G. V., Shuman, C. A., & Tucker, C. J. (2021). The impacts of warming on rapidly retreating high-altitude, low-latitude glaciers and ice core-derived climate records. Global and Planetary Change, 203, 103538. https://doi.org/10.1016/j.gloplacha.2021.103538

* Weber, Austin M. (2023). Byrd Polar and Climate Research Center Ice Core Paleoclimatology Datasets in a Standardized Excel Format (1.2.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.10403150

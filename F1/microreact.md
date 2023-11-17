<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">Microreact</span></h1>

[Microreact](https://microreact.org/showcase) is a free online tool that will enable you to visualize phylogenetic relationships of isolates linked to geographic locations. This tool allows for dynamic visualization of the data with an interactive map using your own phylogenetic tree and metadata.

<br/>**Citation:** [Argimón et al., Microb Genom(2016)](https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000093).

### File formats
Microreact allows users to upload and visualise their own data, with the user needing only to provide a phylogenetic tree (in .nwk format) and a metadata file (in .csv format). The newick (nwk) file format is a computer readable file produced by most tree-building programs. This text-based file details how to graphically display the relatedness of samples in a phylogenetic tree. To view what the text looks like you can open the file in TextEdit or BBEdit for macOS and notepad for Windows systems.

From the files we have provided [here](https://github.com/sanger-pathogens/bactgen-training-app/releases/download/v0.1.20-data/F1_Training_Data.zip), open the **F1_tree.nwk** file provided. You will see a series of numbers and/or names in brackets/parentheses separated by a comma or colon. The first name (stm8 in this instance), is the name of a node relating to a sample. The colon (:) separates the name from the branch length (with or without a decimal point). Following that is a comma (,) which separates the node and the tree ends with a semicolon (;). More information on the newick file format can be found [here](https://en.wikipedia.org/wiki/Newick_format).

The second file you will need as an input for microreact is the metadata file in csv format. You can create and edit the file in Microsoft Excel if you wish then ‘save as’ a CSV (UTF-8 comma delimited) file. Open the **F1_metadata.xls** file. You will notice, it only contains some very basic information including, ID, year, Month and address. Sometimes this is the only information provided. Before we can use it in microreact, we have to add a few things to display useful information and make it compatible with the software.

### Batch geocoding to obtain Latitude and Longitude
We will first obtain the latitude and longitude using free webtools. There are plenty of ways to get coordinates (e.g. using a simple search on google), however with multiple samples, it is easier to submit this in batches. You can use [Data-flo](https://data-flo.io/run?kvpsi3T8V), which allows you to paste the name your locations, hit 'Run' and it returns a list of geographic coordinates. More information on how to use Data-Flo can be found in the 'info' tab at the top of the page (circled in red).

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/F1/img/Geocoder_1.png"></img>
</div>

After only a few seconds, the software returns the results, which can be downloaded as a CSV file by clicking the link provided (circled in red). You can open this file in Excel using the 'File > Import' function.
 
<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/F1/img/Geocoder_2.png"></img>
</div>

### Customising your metadata
One of the advantages of microreact is being able to display geographical locations along with the phylogenetic information, collectively known as phylogeography.  You can also display other information you find useful and to do so, you need only format your metadata table. We will be forming our data using the [guidelines](https://microreact.org/instructions) provided by microreact.

Open the metadata.xls file you added the lat/long information into. We will be formating this file to display information we find useful. The ‘id’ name will remain unchanged, as this **MUST** match the id’s in the newick tree file. Next is the year, you will notice that these are all the same and would not be interesting to highlight. The months, however may be interesting to visualise in different colours as these may help link temporal data with the phylogenetic distribution, which can be useful when tracking the spread of a particular strain. We will do the same for the institute. The month will be defined by colour by adding a column titled, ’<span style="font-family:papyrus">month__colour</span>’, note that these are **two underscores**. Also note, that to correctly display the timeline, the day, month and year will need to be in numeric form as in the image below.

More instructions on formatting your metadata can be found in the [guidelines](https://microreact.org/instructions) detailed in microreact. Choosing the colours is simple. You can use a website like [colorpicker](https://www.webfx.com/web-design/color-picker/) to obtain the HEX colour codes which all begin with a hash symbol ‘#’ followed by a series of numbers and/or letters. Your metadata table should now look like the figure below.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/F1/img/Image5_V2.png"></img>
</div>

When you are happy with your metadata sheet, we will now save this file as a CSV file, go to _File_ > _Save as_ > _Select_ ‘**CSV UTF-8 (comma delimited) (.csv)**’ from the drop down menu in '_file format_' then '_Save_'. A dialogue box will appear asking if you are sure you want to save it as csv and some formatting may be lost, don’t worry about this, click ‘**yes**’.  We are now ready to view our data in microreact.

### Visualising your data in microreact
Using either [Google Chrome](https://www.google.com/chrome/) or [Firefox](https://www.mozilla.org/en-GB/firefox/new/) internet browsers, go to the microreact [upload](https://microreact.org/showcase) page. Navigate to the folder where you have saved the tree (in _.nwk_ format) and the metadata file (in _.csv_ format). Select both files and drag and drop the files. There will be a check to make sure both files are in the correct format before you can proceed. If you get an error, please check your files again before proceeding. Microreact will also provide you with a list of errors it has detected to help to fix the problem.
Provide a name for your project and a brief description if you like. You may leave the '_project website_' section blank and your email is also optional. Select '_create project_'.

Your project should look something like the picture below. The map panel on the left, the phylogenetic tree on the right panel and the timeline at the bottom. There are many features to microreact and we recommend you watch the microreact [video tutorial](https://microreact.org/introduction) on the full range of functions before proceeding.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/F1/img/Image6_v2.png"></img>
</div>

### Interpreting the georeferenced data
Once you have customised your visual display of the data we can now start to infer the relationship between the samples. Taking a closer look at the tree. How many groups can you see? To help you, you can try looking at the different tree layouts from the tree control toggle. Please watch the microreact [instructional video](https://microreact.org/introduction) for where to find this.

If your answer is 2, then you are correct. These groups are often referred to as ‘clades’ and are separated by where the tree branches. Is there anything unique about the two clades?  **Hint**: look for any these dates and places where samples were isolated. 

Without knowing the biology of the bacteria you are looking at, or the scenario they were collected in, you can only make very vague assumptions that would not stand up to scrutiny.  If we now had information that these samples were collected from hospital patients who displayed symptoms of diarrhoea and belonged to a species known to spread through the fecal-oral route. Would your interpretation change? 

>**<span style="color:#FC8E22; font-size:1.5em">Question 1</span>** 
<br/>In the F1 slack group, comment on how you would interpret what you think is going between the two clades given that you only have the above information? When answering, think about where these samples were isolated and the dates when they were collected?

</br>&copy; [Wellcome Sanger Institute](https://www.sanger.ac.uk/)

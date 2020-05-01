# <span style="color:#246CAA">Welcome to the Fundamental 1 Module</span>

In this training module, we will use three different web-based tools, [Microreact](https://microreact.org/showcase) and [Phandango](https://github.com/jameshadfield/phandango/wiki) to visualise phylogenetic trees and metadata. We will explore [Pathogenwatch](https://pathogen.watch/) as a method of browsing publically available genomes and associated metadata. We will cover the different file types used by the web-based tools, how to customise your data and how to save the figures you generate which can be used in publications.

>**Educators**
<br/>Christine Boinett (Lead educator), Stephanie W. Lo, Dorota Jamrozy

>**Contributors** 
<br/>Christine Boinett, Gareth Peat, Stephanie W. Lo, Dorota Jamrozy, Neil MacAlasdair, Kate Baker, and Stephen Bentley. 

---
## Introduction
Phylogenetic trees based on whole genome data tell us about the relationships of bacterial isolates to each other on a very fine scale. When we combine that high-resolution information about the evolutionary relationships of isolates with geographical data it can inform our understanding of the current distribution of the pathogen and allow us to infer the epidemiological processes that have acted on the bacteria over time. The simplest example of this would be if a phylogeny showed that a pathogen was geographically constrained (e.g. isolates from the same region always cluster together). This might indicate that the pathogen is not rapidly spread. Whereas a pathogen with a phylogeny that shows isolates from distant regions are likely to be related to isolates from nearby, the interpretation is that the pathogen is likely to be spread across regional borders. Geographical referencing of genomic data can also be combined with temporal information to study the movement of pathogens in space and time. This is most useful when done in real time and thus can be useful for outbreak detection and monitoring.


**Data files**
<br/>We have provided data files required for this module, available for download [here](ftp://ftp.sanger.ac.uk/pub/pathogens/bactGen_training/f1/).

**Slack channel**
<br/>Throughout the module, there will be questions referring you to answer or comment on the slack channel. Please note that this is a private slack channel and access is only for Juno and GPS2 project partners. If you are not part of these projects, you are more than welcome to undertake the modules, however there will be no support.


!>**<span style="color:red">DISCALIMER</span>**
<br/>The F1 example denoting sample locations across the UK are fictitious and solely used for educational purposes. These data were never collected from the GPS coordinates quoted.

---
<div class="col-sm-2" style="width: 400px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image1.png"></img>
</div>
<center style="font-size:0.75em">Sketch by Charles Darwin circa 1837. Image source: wikimedia commons</center>

## A short introduction to phylogenetic trees
Phylogeny is the study of genetic relationships between different taxa, or in our case, bacterial samples. Because we can infer relationships between samples collected at different times, sources and places, we can use this tool to trace the evolution and spread of a bacterial pathogen and has been a very useful tool to identify disease outbreaks. 
Phylogenetic trees are referred to as trees because of their likeness to trees in nature, with a root, branches and leaves. The root denotes the common ancestral lineage or strain, the branches is the relationship between the strains and the leaves are the different samples or taxa.

Phylogenetic trees are constructed based on mathematical models that apply the nucleotide (or amino acid) substitution rate and the time in which it has taken to achieve these changes to describe the evolution and estimate the genetic change. The genetic change is the nucleotide substitutions per site, also known as the genetic distance. We use this measurement to construct the branches of the trees. Subsequently a statistical method is used to measure the tree quality known as the ‘likelihood’.

Tree interpretation requires us to first know the elements that make up the tree. There are four main characteristics, _**a)**_ the **topology**, describes the shape of the tree, _**b)**_ the **branches**, describe the genetic change between samples and lastly _**c)**_ the **nodes**, the points at the end of branches (<span style="color:red">red</span>) which can be at the root (<span style="color:orange">orange</span>), internal (<span style="color:blue">blue</span>) or the tip or leaf (<span style="color:purple">purple</span>). You may sometimes see numbers on the nodes of trees, these are the bootstrap values that denote the confidence or accuracy of  the tree.

<div class="col-sm-2" style="width: 400px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image2.png"></img>
</div>

The root of the tree represents the ancestral strain and the tips or leaves are the descendants. The same topology tree can be drawn in different ways with the most popular formats being rectangular, radial and circular. Choosing the format is down to you and how the type of tree you choose best represents your data. For example when you have few samples it may suit to draw a rectangular tree, but when you have hundreds or even thousands, maybe a radial tree would be a better choice.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image3.png"></img>
</div>

When reading the tree, the vertical distance in a rectangular tree doesn't mean anything and the nodes can be freely rotated. It is the branch length (horizontal distance) that will link the rectangular tree to the other type of tree hence the type of tree can be altered without altering the information describing the evolutionary relationship between the different taxa or samples.

### Further resources
<br/>[EMBL-EBI](https://www.ebi.ac.uk/training/online/course/introduction-phylogenetics/what-phylogenetics)
<br/>[Nature education](https://www.nature.com/scitable/topicpage/reading-a-phylogenetic-tree-the-meaning-of-41956/)
<br/>[Evolution](https://evolution.berkeley.edu/evolibrary/article/evo_05) 
<br/>[FutureLearn course](https://www.futurelearn.com/courses/introduction-to-bacterial-genomics/0/steps/45314)
---

## Microreact
[Microreact](https://microreact.org/showcase) is a free online tool that will enable you to visualize phylogenetic relationships of isolates linked to geographic locations. This tool allows for dynamic visualization of the data with an interactive map using your own phylogenetic tree and metadata.
   <br/>**Citation:** [Argimón et al., Microb Genom(2016)](https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000093).

### File formats
<br/>Microreact allows users to upload and visualise their own data, with the user needing only to provide a phylogenetic tree (in .nwk format) and a metadata file (in .csv format). The newick (nwk) file format is a computer readable file produced by most tree-building programs. This text-based file details how to graphically display the relatedness of samples in a phylogenetic tree. To view what the text looks like you can open the file in TextEdit or BBEdit for macOS and notepad for Windows systems.

From the files we have provided from the [repository](ftp://ftp.sanger.ac.uk/pub/pathogens/bactGen_training/f1/), open the **F1_tree.nwk** file provided. You will see a series of numbers and/or names in brackets/parentheses separated by a comma or colon. The first name (stm8 in this instance), is the name of a node relating to a sample. The colon (:) separates the name from the branch length (with or without a decimal point). Following that is a comma (,) which separates the node and the tree ends with a semicolon (;). More information on the newick file format can be found [here](https://en.wikipedia.org/wiki/Newick_format).

The second file you will need as an input for microreact is the metadata file in csv format. You can create and edit the file in Microsoft Excel if you wish then ‘save as’ a CSV (UTF-8 comma delimited) file. Open the **F1_metadata.xls** file. You will notice, it only contains some very basic information including, ID, year, Month and address. Sometimes this is the only information provided. Before we can use it in microreact, we have to add a few things to display useful information and make it compatible with the software.

### Batch geocoding to obtain Latitude and Longitude
<br/>We will first obtain the latitude and longitude using free webtools. There are plenty of ways to get coordinates (e.g. using a simple search on google), however with multiple samples, it is easier to submit this in batches. We will use [localfocus](https://geocode.localfocus.nl/) for this. Copy and paste the ‘address’ column into the box, making sure to Indicate the country to improve search results. Click ‘add to geocoder’. The results should appear in the box below in only a few seconds. Making sure to select the ‘decimals with dots’, you can now copy and paste the coordinates to a spreadsheet. You will notice that some of the geocodes have status ‘doubt’. This can happen. If you are not sure about the address you can confirm other websites e.g. [latlong](https://www.latlong.net/) or google [maps](https://support.google.com/maps/answer/18539?co=GENIE.Platform%3DDesktop&hl=en). 
 
<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image4.png"></img>
</div>

### Customising your metadata
<br/>One of the advantages of microreact is being able to display geographical locations along with the phylogenetic information, collectively known as phylogeography.  You can also display other information you find useful and to do so, you need only format your metadata table. We will be forming our data using the [guidelines](https://microreact.org/instructions) provided by microreact.

Open the metadata.xls file you added the lat/long information into. We will be formating this file to display information we find useful. The ‘id’ name will remain unchanged, as this **MUST** match the id’s in the newick tree file. Next is the year, you will notice that these are all the same and would not be interesting to highlight. The months, however may be interesting to visualise in different colours as these may help link temporal data with the phylogenetic distribution, which can be useful when tracking the spread of a particular strain. We will do the same for the institute. The month will be defined by colour by adding a column titled, ’<span style="font-family:papyrus">month__colour</span>’, note that these are **two underscores**. Also note, that to correctly display the timeline, the day, month and year will need to be in numeric form and the column header denoted with a double underscore as in the image below.

More instructions on formatting your metadata can be found in the [guidelines](https://microreact.org/instructions) detailed in microreact. Choosing the colours is simple. You can use a website like [colorpicker](https://www.webfx.com/web-design/color-picker/) to obtain the HEX colour codes which all begin with a hash symbol ‘#’ followed by a series of numbers and/or letters. Your metadata table should now look like the figure below.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image5.png"></img>
</div>

When you are happy with your metadata sheet, we will now save this file as a CSV file, go to _File_ > _Save as_ > _Select_ ‘**CSV UTF-8 (comma delimited) (.csv)**’ from the drop down menu in '_file format_' then '_Save_'. A dialogue box will appear asking if you are sure you want to save it as csv and some formatting may be lost, don’t worry about this, click ‘**yes**’.  We are now ready to view our data in microreact.

### Visualising your data in microreact
In your favourite internet browser, go to the microreact [upload](https://microreact.org/showcase page. Navigate to the folder where you have saved the tree (in _.nwk_ format) and the metadata file (in _.csv_ format). Select both files and drag and drop the files. There will be a check to make sure both files are in the correct format before you can proceed. If you get an error, please check your files again before proceeding. Microreact will also provide you with a list of errors it has detected to help to fix the problem.
Provide a name for your project and a brief description if you like. You may leave the '_project website_' section blank and your email is also optional. Select '_create project_'.

Your project should look something like the picture below. The map panel on the left, the phylogenetic tree on the right panel and the timeline at the bottom. There are many features to microreact and we recommend you watch the microreact [video tutorial](https://microreact.org/introduction) on the full range of functions before proceeding.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image6.png"></img>
</div>

### Interpreting the georeferenced data
Once you have customised your visual display of the data we can now start to infer the relationship between the samples. Taking a closer look at the tree. How many groups can you see? To help you, you can try looking at the different tree layouts from the tree control toggle. Please watch the microreact [instructional video](https://microreact.org/introduction) for where to find this.

If your answer is 5, then you are correct. These groups are often referred to as ‘clades’ and are separated by where the tree branches. Is there anything unique about Stm8 and Stm10 that belong to their own clade? **Hint**: look at the dates these samples were isolated. Although we cannot definitely say that the collection dates are the sole reason they are in their own clade, we can postulate that because they were collected from the same location about a month apart, separate from any of the other 5 institutes, could indicate these were separate events from the others.

Without knowing the biology of the bacteria you are looking at, or the scenario they were collected in, you can only make very vague assumptions that would not stand up to scrutiny.  If we now had information that these samples were collected from hospital patients who displayed symptoms of diarrhoea and belonged to a species known to spread through the fecal-oral route. Would your interpretation change? 

>**<span style="color:#FC8E22; font-size:1.5em">Question 1</span>** 
<br/>In the F1 slack group, comment on how you would interpret what you think is going on with clade 3 given that you only have the above information? When answering, think about where these samples were isolated and the dates when they were collected?

---
## Phandango
[Phandango](https://jameshadfield.github.io/phandango/#/) is an interactive visualisation tool for phylogenetics trees and can be viewed with other information that would benefit from a visual output such as metadata (e.g. resistance, virulence, serotyping and multi locus sequence typing or MLST data) and genomic structure information (e.g pangenome, recombination blocks, genome wide association studies or GWAS). More information on the examples of data that can be displayed can be found [here](https://jameshadfield.github.io/phandango/#/examples).

Citation: [Hadfield et al., Bioinformatics (2017)](https://doi.org/10.1093/bioinformatics/btx610).

### Loading your data
Phandango, like microreact requires the user to provide a phylogenetic tree file in NEWICK format as before and the accompanying data in specific formats. For the first exercise we will first practise using the data we have from the previous section. Navigate to the [phandango](https://jameshadfield.github.io/phandango/#/) homepage and select **both** the tree file (F1_tree.nwk) and the metadata.csv file that you formatted and saved for microreact and ‘drop’ them onto the page.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image7.png"></img>
</div>

The results should load like in the image below.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image8.png"></img>
</div>

You will notice the colours have been automatically added. We will now work on displaying the data a bit better. You will notice  there are three grey circles on the page. These allow you to resize the panel by just clicking and holding these buttons. Give it a try! 

You will notice that part of the tree is obscured. Use the scroll wheel on your mouse, or the trackpad of your laptop to zoom in and out, making sure to hover over the appropriate panel (in this case the tree). Alternatively you can right click and select ‘Fit in panel’. More information about the layout of the phandango panel display and how to use this tool can be found [here](https://github.com/jameshadfield/phandango/wiki/How%20To%20Use).

In the metadata panel, you will notice we have a few columns showing the same information. We can choose to not display these. Go to settings in the menu bar > _metadata_ > _toggle columns_. Toggle off the columns you do not want to display. You will also notice there are many controls in the setting menu that allow you to further customise your data. Have a go at changing a few of them. Click settings again to return to the main page.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image9.png"></img>
</div>

Another useful piece of information to display is the key. To display the key, press _'k'_ on your keyboard. Your display should look like the image below. Before saving the image we will toggle off the phandango logo, however you **MUST** [cite](https://academic.oup.com/bioinformatics/article/34/2/292/4212949) it properly in any subsequent publication, presentation or use. To toggle the logo off, go to settings and at the bottom of the first column you will find the _'Phandango logo on/off'_ toggle.

When you are ready to save the image you can either take a screenshot or press _'p'_ on your keyboard. This will download an SVG file. This is a scalable vector graphic that allows users to expand and shrink the image without losing the quality. SVG files can be opened in the browser, simply by clicking it (whereby you can take a screenshot) or you can use a free software such as [imagemagick](http://www.imagemagick.org/script/index.php) to convert the SVG file to PDF or PNG. For the more experienced users you can use an image editing program like [Inkscape](https://inkscape.org/) (which is free) or Adobe Illustrator. More on saving phandango data displays can be found [here](https://github.com/jameshadfield/phandango/wiki/FAQ#screenshots).

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image10.png"></img>
</div>

### Visualising grouped data
The advantage of using phandango to visualise metadata, is that you can quickly look at genetic attributes of your samples. In this next section we are going to visualise predicted antimicrobial resistance (AMR) gene data. You will need the **F1_resistance_data.xls** file which you can download from [here](ftp://ftp.sanger.ac.uk/pub/pathogens/bactGen_training/f1/). Included are the resistance profiles for three acquired genes, _aadA2_, _cmlA_ and _sul_, normally found on plasmids and are subject to [horizontal gene transfer](https://en.wikipedia.org/wiki/Horizontal_gene_transfer) (HGT). This means these plasmid located genes can be transferred between other bacterial cells nearby by a process known as conjugation. The remaining gene, _gyrA_, is located on the chromosome of the bacteria. 
We are going to format the table to visualise the AMR data. The resistance profile is denoted by two letters, _R_ and _S_, which stand for resistant, meaning the sample possesses the gene conferring resistance, and sensitive, meaning it lacks the gene. For some information it would be a good idea to group the data to look for similarities in the samples. We will group them by colour. Phandango accepts multiple ways to group samples by colour. More information can be found [here](https://github.com/jameshadfield/phandango/wiki/Input%20data%20formats). However to customise the data we will add HEX values in a separate column as in the example below. You may find this method more useful if you need to transfer the data across to other platforms such as microreact with minimal editing. As with the microreact metadata sheet, the column header must start with the same name and add ‘<span style="font-family:papyrus">:colour</span>’ to the name. Use [colorpicker](https://www.webfx.com/web-design/color-picker/) to select suitable colours to group _R_ and _S_.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image11.png"></img>
</div>

Save the resistance metadata as a CSV file as you did before. Selecting your newly saved CSV file and the F1_tree.nwk  tree file, drag and drop them onto the landing page of phandango.

<div class="col-sm-2" style="width: 600px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image12.png"></img>
</div>

You can now see the relationship of the samples and their resistance profile. The blue colour indicates sensitivity and the orange are resistant. Comparing the genetic relationship of the isolates and the resistance profiles, you can see that some of the isolates that are grouped in the tree have similar grouping in the resistance profile. 
Try combining the resistance data with the metadata. Can you start to postulate which strains may be part of an outbreak and which may not? 
<br/>**Hint**: Look at the dates the samples were collected, the institutes, the resistance profile and where they sit in the phylogenetic tree. Given that _aadA2_, _cmlA_ and _sul_ genes can be subject to HGT, could it explain why stm11, 18, 21, 12 and 20 are closely related but their resistance profile varies?

>**<span style="color:#FC8E22; font-size:1.5em">Question 2</span>**
<br/>In the slack channel, comment on what other data might be useful to have, to improve your hypothesis of which strains may be part of an outbreak. To give you some ideas, we suggest downloading the [microreact metadata](https://microreact.org/project/GPS_tetSM) file from the [Lo et al., 2019](https://academic.oup.com/jac/article/75/3/512/5650366) study.

You may also choose to view the newly combined metadata table in microreact making sure to edit the column headers to the acceptable format outlined by microreact.

<div class="col-sm-2" style="width: 650px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image13.png"></img>
</div>

---
## Pathogenwatch
[Pathogenwatch](https://pathogen.watch/) watch is an interactive online tool that analyses your whole genome (WGS) data and provides a visual output. However, in this module, we will only focus on using existing genomes on the platform to explore and download publicly available genomes.

### Browsing genomes
To beggin, watch the video below. The time stamp you need is till 0:00 to 0:54 where you will learn to select sequences of interest. We will cover the latter half of the video in F2.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Q8bDuZZ3hXg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Exercise
With your new found knowledge on how to browse genomes in pathogen watch. Navigate to the ‘genomes’ tab. Filter for _Streptococcus pneumoniae_. 

>**<span style="color:#FC8E22; font-size:1.5em">Question 3</span>**
<br/>How many genomes are from South Africa?

>**<span style="color:#FC8E22; font-size:1.5em">Question 4</span>**
<br/>How many of these belong to serotype 1 (ser.01)?

>**<span style="color:#FC8E22; font-size:1.5em">Question 5</span>**
<br/>What years did these samples range?

In the slack channel, share your answers with other participants.

### Browsing collections
You can also explore genome collections of several species in the _'collections'_ tab. Although only a limited number are supported, there is a wealth of information contained here. Navigate to the _Salmonella_ Typhi public genome collection. Click _'view collection'_ (you may need to hover over the area to see the link to _'view collection'_). Here you can view the phylogenetic structure of nearly 5000 strains in the collection. You can choose to browse the data and filter it by a particular characteristic in the data. The most powerful use of the collection data, is the ability to download the metadata and other genotypic information as shown in the image below. Give it a try!

<div class="col-sm-2" style="width: 650px; margin-left: auto; margin-right: auto;">
   <img src="/img/Image14.png"></img>
</div>

## End of module
You have now reached the end of Fundamental 1. In Fundamental 2 we will use pathogen watch to analyse sequence data including AMR prediction, cluster analysis (popunk) and serotyping (seroBA) for _Streptococcus pneumoniae_. We hope you enjoyed the module and will join us in Fundamental 2.

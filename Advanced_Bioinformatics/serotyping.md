<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">Serotyping</span></h1>

## Serotyping - *Streptococcus pneumoniae*

Before you begin this section, navigate to the [s.pneumoniae folder](https://drive.google.com/drive/folders/1eaVWldrU35i-XW8jSbaSsdntO9mxFBdT). You will use this folder and its contents to learn and practice this section.

### Overview

To date, there are >100 known serotypes described for *S. pneumoniae* based on differing biochemical and antigenic properties of the capsule. There are a number of in-silico methods to detect the cps locus, which can then be used to predict serotypes from WGS data. Accurate identification of pneumococcal serotypes is important for tracking the distribution and evolution of serotypes following the introduction of effective vaccines.

**Further reading:**
- [SeroBA: rapid high-throughput serotyping of Streptococcus pneumoniae from whole genome sequence data](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6113868/)

### Tool(s)

SeroBA was developed and it makes efficient use of computational resources in addition to accurately detecting the cps locus at low coverage, and it predict serotypes from WGS data using a database adapted from PneumoCaT. SeroBA can predict serotypes, by identifying the cps locus, directly from raw whole genome sequencing read data with 98% concordance using a k-mer based method, can process 10,000 samples in just over 1 day using a standard server and can call serotypes at a coverage as low as 10x. SeroBA is implemented in Python3 and is freely available under an open source GPLv3.

You can download SeroBA from Docker repositories using the commands:
```
docker pull staphb/seroba
```

**Further reading:**
- [SeroBA GitHub Repository](https://github.com/sanger-pathogens/seroba)

### Predicting Serotypes

Explore usage of SeroBA by running:
```
docker_run staphb/seroba seroba -h
```
![SeroBA help page](/img/serotyping_1.png "SeroBA help page")

SeroBA requires only three inputs:
- Database with kmc (utility designed for counting k-mers) and ariba (Antimicrobial Resistance Identification By Assembly)
- Forward and reverse sequence files in FASTQ
- Output prefix

First, you can download the PneumoCaT database using the command:
```
docker_run staphb/seroba seroba getPneumocat PneumoCaT_dir
```

This command downloads PneumoCat and build an `.tsv` formatted metadata file out of it. However, for this module we will use `seroba_k71_14082017` database as it is up to date. 

1. To predict the serotype of a single strain (`17150_4#79`), we will use the command:
   ```
   docker_run staphb/seroba seroba runSerotyping seroba_k71_14082017 17150_4#79_1.fastq.gz 17150_4#79_2.fastq.gz 17150_4#79_output
   ```

    **An explanation of this command is as follows:**

      - `docker_run`: a customised function to start a container. The function runs the following command:
          ```
          docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
          ```
          To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)
      
      - `staphb/seroba`: the Docker image

      - `seroba`: the tool

      - `runSerotypin`: specifies that program will perform serotyping 

      - `seroba_k71_14082017`: specifies where the seroba directory 

      - `17150_4#79_1.fastq.gz` and `17150_4#79_2.fastq.gz`: the forward and reverse FASTQ files
  
      - `17150_4#79_output`: specifies the output prefix

    
  In the output folder, you will find a `pred.tsv` including your predicted serotype.

2. To predict the serotype of multiple strains

     1. We will first create a folder for each pair of compressed FASTQ files and named after the strain id using the command: 
        ```
        for x in *1.fastq.gz; do mkdir ${x%%_1.fastq.gz} ; mv $x ${x%%_1.fastq.gz}; mv ${x%%1.fastq.gz}2.fastq.gz ${x%%_1.fastq.gz}; done
        ```

        **An explanation of this command is as follows:**

        - `for x in *1.fastq.gz; do`: This starts a loop where `x` takes on the value of each file that matches the pattern `*1.fastq.gz` in the current directory.

        - `mkdir ${x%%_1.fastq.gz}`: This creates a directory using the prefix of the file name (i.e., removes `_1.fastq.gz` from the end of the file name).

        - `mv $x ${x%%_1.fastq.gz}`: This moves the file with `1.fastq.gz` to the directory created in the previous step.

        - `mv ${x%%1.fastq.gz}2.fastq.gz ${x%%_1.fastq.gz}`: This moves the corresponding `2.fastq.gz` file to the same directory.

          Here's a brief explanation of the `${x%%_1.fastq.gz}` syntax:

          - `${x}`: This refers to the value of the variable `x`.

          - `%%`: This is a pattern removal operator

          - `_1.fastq.gz`: This is the pattern to be removed.

          So, `${x%%_1.fastq.gz}` removes the trailing `_1.fastq.gz` from the value of `x`.

      2. We will then run SeroBA using the command:
          ```
          for x in *#* ; do docker_run staphb/seroba seroba runSerotyping seroba_k71_14082017 $x/${x}_1.fastq.gz $x/${x}_2.fastq.gz $x"_output"; done
          ```

          **An explanation of this command is as follows:**

          - `for x in *#* ; do`: This starts a loop where `x` takes on the value of each file or directory that contains a `#` in its name.

          - `docker_run staphb/seroba seroba runSerotyping seroba_k71_14082017 $x/${x}_1.fastq.gz $x/${x}_2.fastq.gz $x"_output`: This is the command that runs the Docker container. It appears to be running the `runSerotyping` command from the SeroBA tool inside the Docker container (`staphb/seroba`). The specific parameters passed to the `runSerotyping` command are as follows:

            - `seroba_k71_14082017`:This is an argument passed to runSerotyping
            - `$x/${x}_1.fastq.gz`:The path to the first paired-end FASTQ file.
            - `$x/${x}_2.fastq.gz`:The path to the second paired-end FASTQ file.
            - `$x"_output"`:The output directory for the analysis.

          The use of `$x` suggests that the script expects directories with `#` in their names, and within each directory, there should be paired-end FASTQ files named `${x}_1.fastq.gz` and `${x}_2.fastq.gz`.

      3. We will then compile the results from the runs above using the command: 
          ```
          docker_run staphb/seroba seroba summary ./
          ```

          This command will combine the seroba outputs in one `.tsv` file. 


## Serotyping - *Streptococcus agalactiae*

Before you begin this section, navigate to the [s.agalactiae folder](https://drive.google.com/drive/folders/1eaZKEKqoh3Y9X6wSStBaWLsRGyNT22Kj). You  will use this folder and its contents to learn and practice this section.

### Overview

*Streptococcus agalactiae* (Group B Streptococcus, or GBS) are currently divided into ten serotypes based on type-specific capsular antigens and are designated as Ia, Ib, II, III, IV, V, VI, VII, VIII, and IXs.

**Further reading:**
- [*Streptococcus agalactiae* (group B Streptococcus)](https://www.cdc.gov/streplab/groupb-strep/index.html)

### Tool(s)

Group B Streptococcus Serotyping by Genome Sequencing repository contains a curated reference file which can be used for serotyping *Streptococcus agalactiae* *in silico* with whole genome sequencing data. The reference file (`GBS-SBG.fasta`) is designed to be usable for both short-read mapping and assembly-based strategies.

The FASTA file in this repository is designed to be immediately usable with SRST2. If SRST2 is not installed in your local machine, you can download them from Docker repositories using the commands:
```
docker pull staphb/srst2
```

Further reading: 
- [Group B Streptococcus Serotyping by Genome Sequencing](https://github.com/swainechen/GBS-SBG)

### Predicting Serotypes - Short Reads

1. To predict the serotype of a single strain (`20280_5#33`), we will use the command:
    ```
    docker_run staphb/srst2 srst2 --input_pe 20280_5#33_1.fastq.gz 20280_5#33_2.fastq.gz --output 20280_5#33_test --log --gene_db GBS-SBG.fasta
    ```

    **An explanation of this command is as follows:**

      - `docker_run`: a customised function to start a container. The function runs the following command:
          ```
          docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
          ```
          To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)

      - `staphb/srst2`: the Docker image

      - `srst2`: the tool

      - `--input_pe`: specifies the input file are paired end reads which are `20280_5#33_1.fastq.gz` `20280_5#33_2.fastq.gz`

      - `--output`: specifies the output file `20280_5#33_test`

      - `--log`: switch on logging to file, rather than standard output

      - `--gene_db`: specifies the database `GBS-SBG.fasta`

      Run the command `ls -lh` to check the contents in the folder. You will get this output

      ![srst2 output](/img/serotyping_2.png "srst2 output")

      The output file from the above run is `20280_5#33_test__genes__GBS-SBG__results.txt`. 

      So, `cat "20280_5#33_test__genes__GBS-SBG__results.txt"` to view the contents of this file  

      ![srst2 result](/img/serotyping_3.png "srst2 result")

  2. To execute SRST2 on multiple strains, run the command: 
      ```
      docker_run staphb/srst2 srst2 --input_pe *.fastq.gz --output s.agalactiae --log --gene_db GBS-SBG.fasta
      ```
      `--input_pe *.fastq.gz`: specifies the input file are multiple compressed fastq.gz files. 


<style>body {text-align: justify}</style>
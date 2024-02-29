<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">AMR Profiling</span></h1>

Before you begin this section, navigate to the [AMR folder](https://drive.google.com/drive/folders/1dVlFCDbirDKuAdG5L4Rz0e8JXm9ULGh_). You will use this folder and its contents to learn and practice this section.

## Overview

One of the benefits of whole genome sequencing bacterial pathogens is that you capture the genomic inventory of the organism. This has been capitalised on in clinical microbiology for the in silico prediction of antibiotic resistance directly from whole genome sequencing data. This is being developed as an alternative to phenotypic sensitivity testing of microorganisms in the laboratory, where microorganisms are routinely sequenced.

For many microorganisms the genetic basis of antibiotic resistance has been extensively studied. This means that the genes responsible for resistance have been identified and sequenced, and can be used to compile a database of resistance determinants and used to query an organism's genome and define its resistome. Based on the presence or absence of genes or mutations it is possible to make a prediction of the antibiotic sensitivities of an organism.

## Tool(s)

There are several tools to find antibiotic resistance genes in the (draft) genome. These include [ABRIcate](https://github.com/tseemann/abricate/blob/master/README.md), [ARIBA](https://github.com/sanger-pathogens/ariba), [Resfinder](https://cge.cbs.dtu.dk/services/ResFinder/), [CARD](https://card.mcmaster.ca/analyze/rgi), [SRST2](https://github.com/katholt/srst2), [AMRFinderPlus](https://github.com/ncbi/amr#ncbi-antimicrobial-resistance-gene-finder-amrfinderplus), etc. We will be using ABRIcate and ARIBA in this module.

### 1. ABRicate

ABRicate carries out mass screening of contigs for antimicrobial resistance or virulence genes. It comes bundled with multiple databases: NCBI, CARD, ARG-ANNOT, Resfinder, MEGARES, EcOH, PlasmidFinder, Ecoli_VF and VFDB.

To process with ABRicate, you should have in mind that: 
- It only supports contigs, not FASTQ reads
- It only detects acquired resistance genes, NOT point mutations,
- It uses a DNA sequence database, not protein
- It needs BLAST+ >= 2.7 and any2fasta to be installed
- It's written in Perl 

Run the commands below to download the abricate, blast and any2fasta images from Docker repositories. 
```
docker pull staphb/abricate
docker pull ncbi/blast
docker pull staphb/any2fasta
```
**Further reading:** 
- https://github.com/tseemann/abricate/blob/master/README.md

#### Screening for AMR genes using ABRicate

ABRicate takes any sequence file that the tool any2fasta can convert to FASTA files (eg. Genbank, EMBL), and they can be optionally gzip or bzip2 compressed. ABRicate comes with some pre-downloaded databases which can be viewed using the command:
```
docker_run staphb/abricate abricate --list
```

**An explanation of this command is as follows:**
- `docker_run`: a customised function to start a container. The function runs the following command:
    ```
    docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
    ```
    To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)
- `staphb/abricate`: the Docker image
  - `staphb` - represents the repository
  - `abricate` - represents the container image
- `abricate`: the tool
- `--list`: will show the list pre-downloaded databases

View the output of the above command:

![ABRicate List](/img/amr_1.png "ABRicate List")

The default database is `ncbi` but you can choose a different database using the `--db` option, for example:

```
docker_run staphb/abricate abricate --db ncbi --quiet input file
```

We will run ABRicate on the `contigs.fasta` file in the SPAdes output for the strain `17150_4#79` using the command:

```
docker_run staphb/abricate abricate --db ncbi --quiet contigs.fasta > results.tab
```

**An explanation of this command is as follows:**
- `docker_run`: a customised function to start a container. The function runs the following command:
    ```
    docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
    ```
    To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)
- `staphb/abricate`: the Docker image
  - `staphb` - represents the repository
  - `abricate` - represents the container image

- `abricate`: the tool
- `--db card`: specifies the database
- `--quiet`: no screen output
- `contigs.fasta`: input file
- `> results.tab`: specifies the output file

View the output of the above command (open the `results.tab` file):

![ABRicate Result](/img/amr_2.png "ABRicate Result")

This results indicate that this strain has Tet(M), Msr(D) and mef(A) genes which markers for tetracycline and macrolide resistance, respectively.


### 2. ARIBA

ARIBA (Antimicrobial Resistance Identification By Assembly), uses a combined mapping/alignment and targeted local assembly approach to identify AMR genes and variants efficiently and accurately from paired sequencing reads. Using targeted local assembly considerably reduces the complexity of the assembly process, while providing contiguous gene or nucleotide sequences without the ambiguity of the interpretation of aligned data. ARIBA can easily be provided with custom reference sequence-sets, and includes support for a number of public databases: ARG-ANNOT, CARD, MEGARes and ResFinder.

Run the commands below to download the ariba images from Docker repository.
```
docker pull staphb/ariba
```

**Further reading:**
- https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.000131
- https://github.com/sanger-pathogens/ariba

### Screening for AMR genes using ARIBA

We will use ARIBA and a publicly available curated antibiotic resistance gene database from **card**, to rapidly predict the resistome of `17150_4#79`, `13415_4#10`, `15608_3#13`, `21127_1#30` and `17175_6#87` from the Illumina sequence reads,  and correlate the phenotypic metadata with the genetic information.

We will execute Ariba following these steps: 

1. Download the card database using ARIBA and format it using the command: 
    ```
    docker_run staphb/ariba ariba getref card out.card
    ```

    **An explanation of this command is as follows:**
    - `docker_run`: a customised function to start a container. The function runs the following command:
        ```
        docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
        ```
        To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)
    - `staphb/ariba`: the Docker image
      - `staphb` - represents the repository
      - `ariba` - represents the container image
    - `ariba`: the tool
    - `getref card`: specifies the database
      - `card` is the database
      - Alternative database options that can be used are: `resfinder`, `argannot`, `megares`, `plasmidfinder`, `resfinder`, `srst2_argannot`, `vfdb_core`, `vfdb_full`, `virulencefinder`.
    - `out.card`: is the output name prefix

    Next we will need to format the reference database using the `prepareref` command.

    So type: 
    ```
    docker_run staphb/ariba ariba prepareref -f out.card.fa -m out.card.tsv out.card.prepareref
    ```

    - `-f`: is the file of resistance genes in fasta format
    - `-m`: is a metadata file for the resistance genes
    - `out.card.prepareref`: is a directory that will contain the prepared database files for running ARIBA.

    Explore your directory using `ls` command. You should have the following files in your directory:

    - `out.card.fa`
    - `out.card.prepareref`
    - `out.card.tsv`

2. To execute ARIBA on a single read (`17150_4#79`), we will use the command:
  ```
  docker_run staphb/ariba ariba run out.card.prepareref 17150_4#79_1.fastq.gz 17150_4#79_2.fastq.gz 17150_4#79_out.run
  ```
  - `out.card.prepareref`: is the directory containing the argannot database files
  - `17150_4#79_1.fastq.gz` & `17150_4#79_2.fastq.gz`: `17150_4#79` forward and reverse `fastq.gz` files
  - `17150_4#79_out.run`: is the directory containing the results

  View the detected AMR genes in the `17150_4#79_out.run/report.tsv` file.

3. To execute ARIBA on a multiple reads

     1. We will first  create a folder for each pair of compressed fastq files and named after the strain id using the command:
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

      2. We will then execute ARIBA using the command:
          ```
          for x in *#* ; do docker_run staphb/ariba ariba run out.card.prepareref $x/${x}_1.fastq.gz $x/${x}_2.fastq.gz $x"_output"; done
          ```

          **An explanation of this command is as follows:**
          
          - `for x in *#* ; do`: This starts a loop where `x` takes on the value of each file or directory that contains a `#` in its name.
          - `docker_run staphb/ariba ariba run out.card.prepareref $x/${x}_1.fastq.gz $x/${x}_2.fastq.gz $x"_output"`: This is the command that runs the Docker container (`staphb/ariba`). It appears to be running the `ariba run` command with specific parameters:
            - `out.card.prepareref`: This seems to be the name of the database or reference used for the analysis.
            - `$x/${x}_1.fastq.gz`: The path to the first paired-end FASTQ file.
            - `$x/${x}_2.fastq.gz`: The path to the second paired-end FASTQ file.
            - `$x"_output"` :The output directory for the analysis.

          The use of `$x` suggests that the script expects directories with `#` in their names, and within each directory, there should be paired-end FASTQ files named `${x}_1.fastq.gz` and `${x}_2.fastq.gz`.

      3. We will then compile the results from the runs above using the command:
        ```
        docker_run staphb/ariba ariba summary out.summary *_output/report.tsv
        ```

          - `out.summary`: is the prefix for the output files
          - `*_output/report.tsv`: is the report file made by the runs of ARIBA for the isolates `17150_4#79`, `13415_4#10`, `15608_3#13`, `21127_1#30` and `17175_6#87`. This report file is located in their respective directories.

      4. Visualise output in Phandango

        The ARIBA summary command generates three files:
          
          - `out.summary.csv`: summary of identifying genes and matches in the isolates
          - `out.summary.phandango.csv`: a version of summary file for viewing in Phandango
          - `out.summary.phandango.tre`: tree based on matches in the `out.summary.csv` file

        To visualise the results open up the web browser, and type in the URL: https://jameshadfield.github.io/phandango/#/

        From a file view window drag and drop the two Phandango files, `out.summary.phandango.tre` and `out.summary.phandango.csv`, into the browser window. You will get the output shown in the figure below.

        ![Phandango result](/img/amr_3.png "Phandango result")

<style>body {text-align: justify}</style>
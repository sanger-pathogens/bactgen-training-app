<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">Genome Annotation</span></h1>

Before you begin this section, download the files in the [Genome_annotation folder](https://advanced_bioinformatics_training.cog.sanger.ac.uk/index.html?prefix=Genome_annotation/), save them into a folder named `Genome_annotation` and then navigate to it. You will use this folder and its contents to learn and practice this section.

## Overview

Genome annotation is the process of identifying and labeling all the relevant features on a genome sequence. At minimum, this should include coordinates of predicted coding regions and their putative products, but it is desirable to go beyond this to non-coding RNAs, signal peptides and so on.

### Further Reading
- [Prokka: rapid prokaryotic genome annotation](https://academic.oup.com/bioinformatics/article/30/14/2068/2390517)

## Tool(s)

We will use a software tool called **Prokka** to annotate the draft genome sequence produced after running SPAdes. Prokka is a "wrapper"; it collects together several pieces of software (from various authors), and so avoids "re-inventing the wheel".

Prokka finds and annotates features (both protein coding regions and RNA genes, i.e. tRNA, rRNA) present on on a sequence. Note, Prokka uses a two-step process for the annotation of protein coding regions: first, protein coding regions on the genome are identified using Prodigal; second, the function of the encoded protein is predicted by similarity to proteins in one of many protein or protein domain databases. Prokka is a software tool that can be used to annotate bacterial, archaeal and viral genomes quickly, generating standard output files in GenBank, EMBL and gff formats.

Run the command to download the prokka image from Docker repository.
```
docker pull staphb/prokka
```
### Further reading:
- https://github.com/tseemann/prokka

## Genome Annotation

Run the command in terminal to execute Prokka:

```
docker_run staphb/prokka prokka contigs.fasta
```

**An explanation of this command is as follows:**
- `docker_run`: a customised function to start a container. The function runs the following command:
    ```
    docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
    ```
    To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)

- `staphb/prokka`: the Docker image
  - `staphb` - represents the repository
  - `prokka` - represents the container image

- `prokka`: the tool

- `contigs.fa`: input file (this file is the output from SPAdes)

## Prokka Output

Once Prokka has finished, a new folder with containing Prokka output will be present in your working directory. Examine each of its output files.
- The `.gff` and `.gbk` files contain all of the information about the features annotated (in different formats.)
- The `.txt` file contains a summary of the number of features annotated.
- The `.faa` file contains the protein sequences of the genes annotated.
- The `.ffn` file contains the nucleotide sequences of the genes annotated.

We will visualise Prokka output using IGV

## Viewing Genome Annotation in IGV

You will require the following files to view genome annotation in IGV:
- Reference genome which will be the `.fna` output of Prokka. This sequence will be the reference against which annotations are displayed
- `.gff` file which is an output of Prokka

Launch IGV using methods outlines in the [IGV section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-igv)
1. **Load the reference sequence:** In the toolbar, Click Genome > Load Genome from file > Search and select `PROKKA_12252022.fna` (as an example)
2. **Load the `.gff` file:** Go to File > Load from file > `PROKKA_12252022.gff` (as an example)

![IGV GUI](/img/genome_annotation_1.jpg "IGV GUI")

<style>body {text-align: justify}</style>
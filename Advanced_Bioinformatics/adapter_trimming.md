<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">Adapter Trimming</span></h1>

Before you being this section, navigate to the [adapter trimming folder](https://drive.google.com/drive/folders/1d9K5BNAoP2IpuqRK5InymlPelLgxzDKS). You will use this folder and its contents to learn and practice this section.

## Overview

Trimming of adapter sequences from short read data is a common preprocessing step during NGS data analysis. When performing paired-end sequencing, the overlap between forward and reverse read can be used to identify excess adapter sequences.

Illumina FASTQ file generation pipelines include an adapter trimming option for the removal of adapter sequences from the 3' ends of reads. Adapter sequences should be removed from reads because they interfere with downstream analyses, such as alignment of reads to a reference. The adapters contain the sequencing primer binding sites, the index sequences, and the sites that allow library fragments to attach to the flow cell lawn. Libraries prepared with Illumina library prep kits require adapter trimming only on the 3' ends of reads, because adapter sequences are not found on the 5' ends.

### Further Reading
- [Adapter trimming: Why are adapter sequences trimmed from only the 3' ends of reads](https://knowledge.illumina.com/software/general/software-general-reference_material-list/000002905)
- [SeqPurge: highly-sensitive adapter trimming for paired-end NGS data](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1069-7)

## Tool(s)

We will be using FastQC and trimmomatic tools in this section. If you do not have these tools in your local machine, you can download them from a docker repository using the commands:
```
docker pull staphb/fastqc
docker pull staphb/trimmomatic
```

## QC Before Removal of Adapters

We will assess the quality of `spneumo_R1.fastq.gz` and `spneumo_R2.fastq.gz`. We will run the fastqc program on this read using the command:
```
docker_run staphb/fastqc fastqc *.fastq.gz
```
![QC Before Trimming](/img/adapter_trimming_1.png "QC Before Trimming")

**An explanation of this command is as follows:**
- `docker_run`: a customised function to start a container. The function runs the following command:
    ```
    docker run --rm=True -u $(id -u):$(id -g) -v $(pwd):/data "$@"
    ```
    To understand the `docker_run` function read the [Docker section of Data, Platforms & Tools](Advanced_Bioinformatics/bioinformatics_tools?id=_1-docker)
- `staphb/fastqc`: the docker image
- `fastqc`: the tool
-  `*.fastq.gz`: input files
   -  the `*` sign tells `fastqc` tool to run on files that end with `fastq.gz` in the folder

The `Adapter_trimming` folder will now have the following files

![QC Results](/img/adapter_trimming_2.png "QC Results")

Look at the QC reports `spneumo_R1.fastq.html` and `spneumo_R2.fastq.html`.  Let's explore `spneumo_R2.fastq.html`.

![QC Report](/img/adapter_trimming_3.png "QC Report")

You can see the per base sequence quality and adapter content have failed for this read. This indicates that it contains adapter sequences. We will remove the adapter reads and perform QC on the trimmed read in the following section.


## Adapter trimming: Paired end reads

We use the tool `trimmomatic` to remove adaptors, to trim low quality reads and to remove short sequences.

To execute `trimmomatic`, we will run the command:
```
docker_run staphb/trimmomatic trimmomatic PE spneumo_R1.fastq.gz spneumo_R2.fastq.gz  spneumo_R1.trimmed.fastq.gz /dev/null spneumo_R2.trimmed.fastq.gz /dev/null ILLUMINACLIP:adapters/TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:36
```

**An explanation of this command is as follows:**
- `docker_run`: a customised function to start a container.
- `staphb/trimmomatic`: the docker image
- `trimmomatic`: the tool
- `PE`: indicating input is paired end files
- `spneumo_R1.fastq.gz`: The first input file name
- `spneumo_R2.fastq.gz`: The second input file name
- `spneumo_R1.trimmed.fastq.gz`: The output file for surviving pairs from the `_1` file
- `/dev/null`: Discards the output file for orphaned reads from the `_1` file 
- `/spneumo_R1.trimmed.fastq.gz`: The output file for surviving pairs from the `_2` file 
- `/dev/null`: Discards the output file for orphaned reads from the `_2` file 
- `ILLUMINACLIP:adapters/TruSeq3-PE.fa:2:30:10`: To clip the Illumina adapters from the input file using the adapter sequences listed in `TruSeq3-PE.fa`. The numbers `2:30:10` tell trimmomatic how to handle sequence matches to the `TruSeq3` adapters
- `SLIDINGWINDOW:4:20`: To use a sliding window of size 4 that will remove bases if their phred score is below 20 
- `MINLEN:36`: This will discard and reads that do not have a at least 36 bases remaining after this trimming step 

You will have the following output

![Trimmomatic Output](/img/adapter_trimming_4.png "Trimmomatic Output")

Now run fastqc on the `trimmomatic` output files `*.trimmed.fastq.gz` using the command:
```
docker_run staphb/fastqc fastqc *.trimmed.fastq.gz
```

## Quiz

1. What percent of reads did you discard from your sample?

2. What percent of reads did you keep?

3. How different is the HTML report for the `spneumo_R1.trimmed.fastq.gz` / `spneumo_R2.trimmed.fastq.gz` from the `spneumo_R1.fastq.gz` / `spneumo_R2.fastq.gz`?

<style>body {text-align: justify}</style>
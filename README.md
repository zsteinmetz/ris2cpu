# ris2cpu

This short R script helps to restructure Zotero RIS exports in order to be imported into the joint EndNote file of the Group of Environmental and Soil Chemistry at the University of Koblenz-Landau.

The script reads in the RIS file, deletes the file links of each reference entry (L1 tag) and replaces them by a unique identifier (CN tag) the attached files will be named after.

## Usage

This script requires R available at [CRAN](https://cran.r-project.org/mirrors.html) Repository.

Download the [script]() and run the following command in your terminal:

```shell
Rscript ris2cpu.R <bibname> <prefix> <startno>
```

in which `bibname` is the name of your exported RIS file without file extension, `prefix` is the prefix you want to name your attached files after, and `startno` is the initial value of the serial number added (default = 1).

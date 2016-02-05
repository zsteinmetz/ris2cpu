# ris2cpu

This short R script helps to restructure Zotero RIS exports in order to be imported into the joint EndNote file of the Group of Environmental and Soil Chemistry at the University of Koblenz-Landau.

The script reads in the RIS file, deletes the file links of each reference entry (L1 tag) and replaces them by a unique identifier (CN tag) the attached files will be named after.

## Usage

This script requires R. R can be retrieved from the [CRAN](https://cran.r-project.org/mirrors.html) repository.

Download the [script](https://github.com/zsteinmetz/ris2cpu/blob/master/ris2cpu.R) and run the following command in your terminal:

```shell
Rscript ris2cpu.R <bibname> <prefix> <startno>
```

in which `<bibname>` is the name of your exported RIS file without file extension, `<prefix>` is the prefix you want to name your attached files after, and `<startno>` is the initial value of the serial number added (*default = 1*). On Windows machines you might need to type `Rscript.exe` instead of `Rscript` in your command line.

## License

This bit of code is licensed under a MIT license. Browse the [LICENSE file](https://github.com/zsteinmetz/ris2cpu/blob/master/LICENSE.md) for details.

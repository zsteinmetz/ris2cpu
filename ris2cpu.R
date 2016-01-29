########################################################
#
# ris2cpu.R
#
# Restructure Zotero RIS exports in order to be imported
# into the joint EndNote file of the Group of
# Environmental and Soil Chemistry at the University of
# Koblenz-Landau
#
# Run script in batch mode by typing
# > Rscript ris2cpu.R <bibname> <prefix> <startno>
# into your terminal
#
# Arguments
#
#   bibname: name of your RIS file exported from Zotero
#            without file extension
#   prefix:  prefix to be added to the generated PDF
#            files (e.g. your initials)
#   startno: the initial value of the serial number
#            added
#
########################################################

args <- (commandArgs(trailingOnly = T))

if(length(args) < 2) {
  stop('Number of arguments not sufficient')
} else {
  bibname <- args[1]
  prefix <- args[2]
  startno <- ifelse(is.na(args[3]),
                    1,
                    as.numeric(args[3]))
}

# Read RIS
file <- readLines(
  file.path('.', bibname, paste0(bibname, '.ris'))
  )
L1_list <- grep("L1", file)

dir.create(prefix, showWarnings = FALSE)

message('Moving files')
no <- startno
for(item in L1_list) {
  pdf <- file.path('.', bibname, gsub("L1  - ","",file[item]))
  new <- file.path('.', prefix, paste0(prefix,'-', sprintf("%04d", no), '.pdf'))
  file.rename(pdf, new)

  file[item] <- paste0('CN  - ', prefix,'-', sprintf("%04d", no))
  no <- no + 1
}

message(paste0('Write new file: ', bibname, '_', prefix, '.ris'))
file_con <- file(paste0(bibname, '_', prefix, '.ris'))
writeLines(file, file_con)
close(file_con)

message('DONE')

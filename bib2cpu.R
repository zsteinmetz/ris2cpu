prefix <- 'ZS'
startno <- 1
bibname <- 'plastic_mulch'

file <- readLines(
  file.path('.', bibname, paste0(bibname, '.ris'))
  )

L1_list <- grep("L1", file)

dir.create(prefix, showWarnings = FALSE)

no <- startno
for(item in L1_list) {
  pdf <- file.path('.', bibname, gsub("L1  - ","",file[item]))
  new <- file.path('.', prefix, paste0(prefix,'-', sprintf("%04d", no), '.pdf'))
  file.rename(pdf, new)

  file[item] <- paste0('CN  - ', prefix,'-', sprintf("%04d", no))
  no <- no + 1
}

file_con <- file(paste0(bibname, '_', prefix, '.ris'))
writeLines(file, file_con)
close(file_con)




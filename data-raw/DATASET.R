root <- rprojroot::is_r_package
path <- root$find_file('data-raw')
antiRetroviral <- read.csv(paste(path, 'antiRetroviral.csv', sep = '/'))
antiRetroviral[, c("Series.Name", "Series.Code")] <- NULL
usethis::use_data(antiRetroviral, overwrite = TRUE)

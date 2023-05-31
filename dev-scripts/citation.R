cffr::cff_write()

root <- rprojroot::is_r_package
file <- root$find_file('CITATION.cff')
cffr::write_citation(file)

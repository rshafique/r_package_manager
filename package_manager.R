
# Script for Managing and Installing Required Packages
# solution derived from https://stackoverflow.com/questions/38928326/is-there-something-like-requirements-txt-for-r


pkgLoad <- function( packages = "favourites" ) {
  
  if( length( packages ) == 1L && packages == "favourites" ) {
    packages <- c( "data.table", "chron", "plyr", "dplyr", "shiny",
                   "shinyjs", "parallel", "devtools", "doMC", "utils",
                   "stats", "microbenchmark", "ggplot2", "readxl",
                   "feather", "googlesheets", "readr", "DT", "knitr",
                   "rmarkdown", "Rcpp"
    )
  }
  
  packagecheck <- match( packages, utils::installed.packages()[,1] )
  
  packagestoinstall <- packages[ is.na( packagecheck ) ]
  
  if( length( packagestoinstall ) > 0L ) {
    utils::install.packages( packagestoinstall,
                             repos = "http://cran.csiro.au"
    )
  } else {
    print( "All requested packages already installed" )
  }
  
  for( package in packages ) {
    suppressPackageStartupMessages(
      library( package, character.only = TRUE, quietly = TRUE )
    )
  }
  
}

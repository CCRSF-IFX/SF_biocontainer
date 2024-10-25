install.packages("devtools")
install.packages("pkgbuild")
devtools::install_version("markdown", version = "1.12", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)
devtools::install_version("knitr", version = "0.4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("knitr" %in% installed.packages()[,"Package"])
devtools::install_version("kableExtra", version = "1.4.0", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("kableExtra" %in% installed.packages()[,"Package"])
devtools::install_version("stringr", version = "1.5.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("stringr" %in% installed.packages()[,"Package"])
## List of user-installed R packages and their versions
## https://stackoverflow.com/a/40120266/3327344
ip = as.data.frame(installed.packages()[,c(1,3:4)]); ip = ip[is.na(ip$Priority),1:2,drop=FALSE];ip

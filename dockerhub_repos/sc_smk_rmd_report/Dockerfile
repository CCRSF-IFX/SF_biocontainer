#https://hub.docker.com/r/bioconductor/bioconductor_docker/tags?page=1&ordering=last_updated
FROM bioconductor/bioconductor_docker:RELEASE_3_18

MAINTAINER Shaojun Xie

# This will make apt-get install without question
ENV DEBIAN_FRONTEND noninteractive
COPY ./install_R_pkg.R ./ 
RUN R -e 'source("install_R_pkg.R")'
###RUN R -e 'install.packages("devtools")' 
###RUN R -e 'install.packages("pkgbuild")' 
####markdown
###RUN R -e 'devtools::install_version("markdown", version = "1.12", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
###RUN R -e 'devtools::install_version("knitr", version = "0.4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("knitr" %in% installed.packages()[,"Package"])'
###RUN R -e 'devtools::install_version("kableExtra", version = "1.4.0", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("kableExtra" %in% installed.packages()[,"Package"])'
###RUN R -e 'devtools::install_version("stringr", version = "1.5.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("stringr" %in% installed.packages()[,"Package"])'
###
##### List of user-installed R packages and their versions
##### https://stackoverflow.com/a/40120266/3327344
###RUN R -e 'ip = as.data.frame(installed.packages()[,c(1,3:4)]); ip = ip[is.na(ip$Priority),1:2,drop=FALSE];ip'

RUN useradd -s /bin/bash docker
USER docker
WORKDIR /home/docker/


########################################################################
## docker build -t sc-rmd-report -f Dockerfile .
## docker tag sc-rmd-report:latest ccrsfifx/sc-rmd-report:r1.0.0
## docker push ccrsfifx/sc-rmd-report:r1.0.0

## For test
## docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv sc-rmd-report:latest
## docker exec -it Renv bash 
## docker run -e PASSWORD=password -e USERID=$(id -u)  -d scrna.sc20230928:latest
## The command above will generate an ID. 
## docker container ls
## docker exec -it  1884426c3827 python3
##########################################################################                                                                                                           

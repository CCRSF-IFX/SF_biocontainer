#https://hub.docker.com/r/bioconductor/bioconductor_docker/tags?page=1&ordering=last_updated
FROM bioconductor/bioconductor_docker:RELEASE_3_18


MAINTAINER Shaojun Xie

# This will make apt-get install without question
ENV DEBIAN_FRONTEND noninteractive

RUN R -e 'install.packages("devtools")' 
RUN R -e 'install.packages("pkgbuild")' 
RUN R -e 'devtools::install_version("clusterProfiler", version="4.10.1", repos=c("https://bioconductor.org/packages/3.18/bioc"),upgrade = "never", force = TRUE); stopifnot("clusterProfiler" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_github("YuLab-SMU/createKEGGdb@c7f6308");stopifnot("createKEGGdb" %in% installed.packages()[,"Package"])' 

USER root

RUN rm -rf /usr/bin/pip /usr/bin/python && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip


## List of user-installed R packages and their versions
## https://stackoverflow.com/a/40120266/3327344
RUN R -e 'ip = as.data.frame(installed.packages()[,c(1,3:4)]); ip = ip[is.na(ip$Priority),1:2,drop=FALSE];ip'

RUN useradd -s /bin/bash docker
USER docker
WORKDIR /home/docker/

#ENTRYPOINT ["/usr/bin/docker_helper.0.1.0"]

########################################################################
## docker build -t sc-smk-wl -f Dockerfile .
## docker tag sc-smk-wl:latest ccrsfifx/sc-smk-wl:r1.0.0
## docker push ccrsfifx/sc-smk-wl:r1.0.0

## For test
## docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv sc-smk-wl:latest
## docker exec -it Renv bash 
## docker run -e PASSWORD=password -e USERID=$(id -u)  -d scrna.sc20230928:latest
## The command above will generate an ID. 
## docker container ls
## docker exec -it  1884426c3827 python3
##########################################################################                                                                                                           

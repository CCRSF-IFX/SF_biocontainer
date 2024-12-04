#https://hub.docker.com/r/bioconductor/bioconductor_docker/tags?page=1&ordering=last_updated
FROM bioconductor/bioconductor_docker:RELEASE_3_18

MAINTAINER Shaojun Xie

# This will make apt-get install without question
ENV DEBIAN_FRONTEND noninteractive
COPY ./install_R_pkg.R ./ 
RUN R -e 'source("install_R_pkg.R")'

RUN useradd -s /bin/bash docker
USER docker
WORKDIR /home/docker/


########################################################################
## docker build -t sc-rmd-report -f Dockerfile .
## docker tag sc-rmd-report:latest ccrsfifx/sc-rmd-report:r1.0.0
## docker login
## user name: ccrsfifx
## email: ccrsfifx@gmail.com
## passwd: same as HPC passwd
## create repo on docker hub 
## docker push ccrsfifx/sc-rmd-report:r1.0.0

## For test
## docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv sc-rmd-report:latest
## docker exec -it Renv bash 
## docker run -e PASSWORD=password -e USERID=$(id -u)  -d scrna.sc20230928:latest
## The command above will generate an ID. 
## docker container ls
## docker exec -it  1884426c3827 python3
##########################################################################                                                                                                           

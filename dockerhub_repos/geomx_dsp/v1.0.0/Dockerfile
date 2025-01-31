#https://hub.docker.com/r/bioconductor/bioconductor_docker/tags?page=1&ordering=last_updated
FROM bioconductor/bioconductor_docker:RELEASE_3_20

MAINTAINER Shaojun Xie

# This will make apt-get install without question
ENV DEBIAN_FRONTEND noninteractive

RUN R -e 'install.packages("devtools")' 
RUN R -e 'install.packages("pkgbuild")' 
RUN R -e 'devtools::install_version("dplyr", version = "1.1.4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)' 
RUN R -e 'devtools::install_version("Seurat", version = "5.1.0", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("Seurat" %in% installed.packages()[,"Package"])' 
#markdown
RUN R -e 'devtools::install_version("markdown", version = "1.12", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE);stopifnot("markdown" %in% installed.packages()[,"Package"])'
## Dependencies for URD
RUN R -e 'BiocManager::install("destiny");stopifnot("destiny" %in% installed.packages()[,"Package"])'
#RUN R -e 'devtools::install_version("destiny", version="3.19.0", repos=c("https://bioconductor.org/packages/3.20/bioc"),upgrade = "never", force = TRUE);stopifnot("destiny" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("diptest", version = "0.77-1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("gdata", version = "3.0.0", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("minpack.lm", version = "1.2-4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("gmodels", version = "2.19.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'

RUN R -e 'devtools::install_github(repo="farrellja/URD@0fed8b824644288ba4ec405ddf82a36960e2d4f9");stopifnot("URD" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("optparse", version = "1.7.5", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'BiocManager::install("SingleR");stopifnot("SingleR" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("celldex");stopifnot("celldex" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("AnnotationDbi");stopifnot("AnnotationDbi" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("clusterProfiler");stopifnot("clusterProfiler" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("org.Hs.eg.db");stopifnot("org.Hs.eg.db" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("org.Mm.eg.db");stopifnot("org.Mm.eg.db" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("GenomeInfoDb");stopifnot("GenomeInfoDb" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("EnsDb.Mmusculus.v79");stopifnot("EnsDb.Mmusculus.v79" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("EnsDb.Hsapiens.v86");stopifnot("EnsDb.Hsapiens.v86" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("GeomxTools");stopifnot("GeomxTools" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("SpatialDecon");stopifnot("SpatialDecon" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("readxl", version = "1.4.3", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_github("YuLab-SMU/createKEGGdb@c7f6308");stopifnot("createKEGGdb" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("SpatialExperiment");stopifnot("SpatialExperiment" %in% installed.packages()[,"Package"])'

#RUN pip3 install --upgrade pip && \
#    pip3 install rpy2==3.5.4 && \
#    python3 -m rpy2.situation LD_LIBRARY_PATH && \
#    pip3 install matplotlib==3.5.1  

#RUN apt-get install -y samtools

RUN pip3 install jupyterlab==4.1.1 --break-system-packages
RUN R -e 'devtools::install_version("IRkernel", version = "1.1.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'IRkernel::installspec(name = "R", displayname = "R", user = FALSE)'
USER root

## List of user-installed R packages and their versions
## https://stackoverflow.com/a/40120266/3327344
RUN R -e 'ip = as.data.frame(installed.packages()[,c(1,3:4)]); ip = ip[is.na(ip$Priority),1:2,drop=FALSE];ip'
RUN R -e 'library(createKEGGdb);species <-c("mmu","hsa");create_kegg_db(species);install.packages("./KEGG.db_1.0.tar.gz", repos=NULL)'

RUN useradd -s /bin/bash docker
USER docker
WORKDIR /home/docker/
RUN R -e 'library(celldex); setwd("/home/docker/");saveRDS(HumanPrimaryCellAtlasData(), file = "HumanPrimaryCellAtlasData.rds"); saveRDS(BlueprintEncodeData(), "BlueprintEncodeData.rds"); saveRDS(ImmGenData(), "ImmGenData.rds"); saveRDS(MouseRNAseqData(), "MouseRNAseqData.rds")'
#ENTRYPOINT ["/usr/bin/docker_helper.0.1.0"]

########################################################################
## docker build -t geomxdsp -f Dockerfile . 
## docker tag geomxdsp:latest ccrsfifx/geomxdsp:v1.0.0
## docker push ccrsfifx/geomxdsp:v1.0.0

## For test
## docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv4geomxdsp geomxdsp:latest
## docker exec -it Renv4geomxdsp bash 
## docker exec -it Renv4geomxdsp jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root 
## docker run -e PASSWORD=password -e USERID=$(id -u)  -d scrna.sc20230928:latest
## The command above will generate an ID. 
## docker container ls
## docker exec -it  1884426c3827 python3
##########################################################################                                                                                                           

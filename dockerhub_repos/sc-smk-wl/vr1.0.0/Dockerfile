#https://hub.docker.com/r/bioconductor/bioconductor_docker/tags?page=1&ordering=last_updated
FROM bioconductor/bioconductor_docker:RELEASE_3_18


MAINTAINER Shaojun Xie

# This will make apt-get install without question
ENV DEBIAN_FRONTEND noninteractive

RUN R -e 'install.packages("devtools")' 
RUN R -e 'install.packages("pkgbuild")' 
RUN R -e 'devtools::install_version("dplyr", version = "1.1.4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)' 
RUN R -e 'devtools::install_version("Seurat", version = "5.0.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)' 
RUN R -e 'devtools::install_version("clusterProfiler", version="4.10.1", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)' 
RUN R -e 'devtools::install_version("SingleR", version="2.4.1", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("celda", version="1.18.2", repos=c("https://bioconductor.org/packages/3.18/bioc", "https://bioconductor.org/packages/devel/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("GSVA", version="1.50.2", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("org.Hs.eg.db", version="3.18.0", repos="https://bioconductor.org/packages/3.18/data/annotation", upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("org.Mm.eg.db", version="3.18.0", repos="https://bioconductor.org/packages/3.18/data/annotation", upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("ReactomeGSA", version="1.16.1", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)'
#TeachingDemos
RUN R -e 'devtools::install_version("TeachingDemos", version = "2.13", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
#markdown
RUN R -e 'devtools::install_version("markdown", version = "1.12", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_github("BaderLab/scClustViz@6707c89589c1793ebb7e042d40ce80331e96fe6e");stopifnot("scClustViz" %in% installed.packages()[,"Package"])' 
#RUN R -e 'devtools::install_version("Nozzle.R1", version = "1.1-1.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("base64enc", version = "0.1-3", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
#https://raw.githubusercontent.com/farrellja/URD/master/URD-Install.R
RUN R -e 'devtools::install_version("scRNAseq", version="2.16.0", repos=c("https://bioconductor.org/packages/3.18/data/experiment","http://cran.us.r-project.org"),upgrade = "never", force = TRUE)' 
RUN R -e 'devtools::install_version("Matrix.utils", version = "0.9.8", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
#diptest
RUN R -e 'devtools::install_version("diptest", version = "0.77-1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("gdata", version = "3.0.0", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("minpack.lm", version = "1.2-4", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("gmodels", version = "2.19.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("GenomeInfoDbData", version="1.2.11", repos="https://bioconductor.org/packages/3.18/data/annotation", upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("SummarizedExperiment", version="1.32.0", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("SummarizedExperiment" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("SingleCellExperiment", version="1.24.0", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("SingleCellExperiment" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("destiny", version="3.16.0", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("destiny" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_github(repo="farrellja/URD@0fed8b824644288ba4ec405ddf82a36960e2d4f9");stopifnot("URD" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("optparse", version = "1.7.5", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'devtools::install_version("glmGamPoi", version="1.14.3", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("glmGamPoi" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_github("immunogenomics/presto@7636b3d0465c468c35853f82f1717d3a64b3c8f6");stopifnot("presto" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("ExperimentHub", version="2.10.0", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("ExperimentHub" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("AnnotationHub", version="3.10.1", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("AnnotationHub" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("AnnotationDbi", version="1.64.1", repos=c("https://bioconductor.org/packages/3.18/bioc","http://cran.us.r-project.org"),upgrade = "never", force = TRUE); stopifnot("AnnotationDbi" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("celldex", version="1.12.0", repos=c("https://bioconductor.org/packages/3.18/data/experiment"),upgrade = "never", force = TRUE); stopifnot("celldex" %in% installed.packages()[,"Package"])'
RUN R -e 'devtools::install_version("scater", version="1.30.1", repos=c("https://bioconductor.org/packages/3.18/bioc"),upgrade = "never", force = TRUE); stopifnot("scater" %in% installed.packages()[,"Package"])'

RUN apt-get update && \ 
    apt-get install -y apt-utils \ 
                       libudunits2-dev \ 
                       libhdf5-dev \ 
                       gdal-bin \ 
                       proj-bin \ 
                       libproj-dev \ 
                       libgsl-dev \ 
                       libxml2 \ 
                       libxml2-dev \ 
                       zlib1g-dev \ 
                       libtool \ 
                       bison \ 
                       flex \ 
                       automake \ 
                       autoconf \ 
                       libpng*-dev \ 
                       libglpk-dev \ 
                       xorg \ 
                       libx11-dev \ 
                       libglu1-mesa-dev \ 
                       libfreetype*-dev \ 
                       p7zip \ 
                       build-essential \ 
                       libssl-dev \ 
                       libffi-dev \ 
                       libxslt1-dev \ 
                       python3 \ 
                       python3-dev \ 
                       python3-pip \ 
                       libxt-dev \ 
                       libgtk2.0-dev \ 
                       libcairo2-dev \ 
                       xvfb \ 
                       xauth \ 
                       xfonts-base 
RUN pip3 install --upgrade pip && \
    pip3 install Cython==3.0.6 && \
    pip3 install velocyto==0.17.16 && \
    pip3 install scanpy==1.9.6 && \
    pip3 install anndata2ri==1.3.1 && \
    pip3 install rpy2==3.5.4 && \
    python3 -m rpy2.situation LD_LIBRARY_PATH && \
    pip3 install scvelo==0.2.5 && \
    pip3 install matplotlib==3.5.1  

RUN apt-get install -y samtools

RUN pip3 install jupyterlab==4.1.1
RUN R -e 'devtools::install_version("IRkernel", version = "1.1.1", repos = "https://cran.rstudio.com/",upgrade = "never", force = TRUE)'
RUN R -e 'IRkernel::installspec(name = "R", displayname = "R", user = FALSE)'
RUN pip3 install Jinja2==3.1.3
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
RUN R -e 'library(celldex); setwd("/home/docker/");saveRDS(HumanPrimaryCellAtlasData(), file = "HumanPrimaryCellAtlasData.rds"); saveRDS(BlueprintEncodeData(), "BlueprintEncodeData.rds"); saveRDS(ImmGenData(), "ImmGenData.rds"); saveRDS(MouseRNAseqData(), "MouseRNAseqData.rds")'

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

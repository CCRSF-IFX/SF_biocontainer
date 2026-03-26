FROM bioconductor/bioconductor_docker:RELEASE_3_21

ARG SCFOCAL_REF=1d9ec6b
ARG BIOC_VERSION=3.21
ARG MAST_VERSION=1.32.0
ARG EDGER_VERSION=4.4.2
ARG COMPLEXHEATMAP_VERSION=2.22.0

LABEL org.opencontainers.image.title="scFOCAL" \
      org.opencontainers.image.description="Container image for the scFOCAL Shiny application" \
      org.opencontainers.image.source="https://github.com/AyadLab/scFOCAL"

ENV DEBIAN_FRONTEND=noninteractive \
    CRAN_REPO=https://cloud.r-project.org \
    SHINY_HOST=0.0.0.0 \
    SHINY_PORT=3838

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libgit2-dev \
    libglpk-dev \
    libharfbuzz-dev \
    libjpeg-dev \
    libpng-dev \
    libssl-dev \
    libtiff-dev \
    libudunits2-dev \
    libxml2-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -q -e "install.packages(c('remotes', 'pkgbuild'), repos = Sys.getenv('CRAN_REPO'))"

# RUN R -q -e "repos <- BiocManager::repositories(version = '${BIOC_VERSION}'); \
#     remotes::install_version('MAST', version = '${MAST_VERSION}', repos = repos, upgrade = 'never'); \
#     remotes::install_version('edgeR', version = '${EDGER_VERSION}', repos = repos, upgrade = 'never'); \
#     remotes::install_version('ComplexHeatmap', version = '${COMPLEXHEATMAP_VERSION}', repos = repos, upgrade = 'never')"

RUN R -e 'BiocManager::install("MAST");stopifnot("MAST" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("edgeR");stopifnot("edgeR" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("ComplexHeatmap");stopifnot("ComplexHeatmap" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("EnhancedVolcano");stopifnot("EnhancedVolcano" %in% installed.packages()[,"Package"])'

RUN R -q -e "remotes::install_github('AyadLab/scFOCAL@${SCFOCAL_REF}', dependencies = TRUE, upgrade = 'never')"

WORKDIR /home/rstudio
USER rstudio

EXPOSE 3838

CMD ["R", "-q", "-e", "library(scFOCAL); options(shiny.host = Sys.getenv('SHINY_HOST', '0.0.0.0'), shiny.port = as.integer(Sys.getenv('SHINY_PORT', '3838'))); scFOCAL::runscFOCAL()"]

########################################################################
## docker build -t scfocal -f Dockerfile .
## docker tag scfocal:latest ccrsfifx/scfocal:260117_1d9ec6b
## docker push ccrsfifx/scfocal:260117_1d9ec6b

## For test
## docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv sc-smk-wl:latest
## docker exec -it Renv bash 
## docker run -e PASSWORD=password -e USERID=$(id -u)  -d scrna.sc20230928:latest
## The command above will generate an ID. 
## docker container ls
## docker run --rm -p 3838:3838 scfocal
##########################################################################                                                                                                           

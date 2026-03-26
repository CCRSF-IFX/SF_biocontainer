FROM bioconductor/bioconductor_docker:RELEASE_3_21

ARG SCFOCAL_REF=1d9ec6b

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

RUN R -e 'BiocManager::install("MAST");stopifnot("MAST" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("edgeR");stopifnot("edgeR" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("ComplexHeatmap");stopifnot("ComplexHeatmap" %in% installed.packages()[,"Package"])'
RUN R -e 'BiocManager::install("EnhancedVolcano");stopifnot("EnhancedVolcano" %in% installed.packages()[,"Package"])'

RUN R -q -e "remotes::install_github('AyadLab/scFOCAL@${SCFOCAL_REF}', dependencies = TRUE, upgrade = 'never')"

# Guard Seurat-dependent startup reactives until a .rds object has been uploaded.
RUN R -q -e 'f <- system.file("shiny", "server.R", package = "scFOCAL"); \
    x <- paste(readLines(f, warn = FALSE), collapse = "\n"); \
    patches <- c( \
      "rdsSeurat <- reactive({ req(input$seurobjRDS) readRDS(input$seurobjRDS$datapath) })" = "rdsSeurat <- reactive({ req(input$seurobjRDS$datapath); readRDS(input$seurobjRDS$datapath) })", \
      "seurat_obj_version <- reactive({" = "seurat_obj_version <- reactive({ req(input$seurobjRDS$datapath);", \
      "output$seurat_obj_v5 <- reactive({" = "output$seurat_obj_v5 <- reactive({ req(input$seurobjRDS$datapath);", \
      "isOrthogonAL <- reactive({" = "isOrthogonAL <- reactive({ req(input$seurobjRDS$datapath);", \
      "output$OrthogonAL <- reactive({" = "output$OrthogonAL <- reactive({ req(input$seurobjRDS$datapath);", \
      "sl <- reactive({" = "sl <- reactive({ req(input$seurobjRDS$datapath);", \
      "output$seuratLoaded <- reactive({" = "output$seuratLoaded <- reactive({ req(input$seurobjRDS$datapath);", \
      "output$reductionUseRDS <- renderUI({" = "output$reductionUseRDS <- renderUI({ req(input$seurobjRDS$datapath);", \
      "output$groupByRDS <- renderUI({" = "output$groupByRDS <- renderUI({ req(input$seurobjRDS$datapath);", \
      "output$subject_replicate_ident <- renderUI({" = "output$subject_replicate_ident <- renderUI({ req(input$seurobjRDS$datapath);", \
      "output$normalCellIdentsRDS <- renderUI({" = "output$normalCellIdentsRDS <- renderUI({ req(input$seurobjRDS$datapath);", \
      "output$cancerCellIdentsRDS <- renderUI({" = "output$cancerCellIdentsRDS <- renderUI({ req(input$seurobjRDS$datapath);", \
      "output$splitBySelecterRDS <- renderUI({" = "output$splitBySelecterRDS <- renderUI({ req(input$seurobjRDS$datapath);" \
    ); \
    for (i in seq_along(patches)) { \
      x <- sub(names(patches)[i], unname(patches[i]), x, fixed = TRUE); \
    }; \
    writeLines(x, f)'

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

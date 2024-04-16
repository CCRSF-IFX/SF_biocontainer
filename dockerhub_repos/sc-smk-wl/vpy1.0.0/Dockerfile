# Dockerfile to create container with python envrioment
# Push to ccrsfifx/cellranger:8.0.0

FROM docker.io/continuumio/miniconda3:22.11.1
LABEL authors="Shaoun Xie <xies4@nih.gov>" \
    description="Docker image containing Cell Ranger"
# Disclaimer: this container is not provided nor supported by Illumina or 10x Genomics.

# Install procps and clean apt cache
RUN apt-get update --allow-releaseinfo-change \
    && apt-get install -y \
    cpio \
    procps \
    rpm2cpio \
    unzip \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN conda install -y  -c conda-forge mamba==1.5.8
ADD ./environment.yml .
RUN mamba env update -n base --file ./environment.yml &&\
    conda clean -tipy



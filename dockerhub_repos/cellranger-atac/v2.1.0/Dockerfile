# Dockerfile to create container with Cell Ranger v2.1.0
# Push to ccrsfifx/cellranger-atac:2.1.0
FROM docker.io/continuumio/miniconda3:22.11.1 AS build
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

# Copy pre-downloaded cellranger-atac file
ENV CELLRANGER_VER=2.1.0
COPY cellranger-atac-$CELLRANGER_VER.tar.gz /opt/cellranger-atac-$CELLRANGER_VER.tar.gz


# Install cellranger-atac
RUN \
    cd /opt && \
    tar -xzvf cellranger-atac-$CELLRANGER_VER.tar.gz && \
    export PATH=/opt/cellranger-atac-$CELLRANGER_VER:$PATH && \
    ln -s /opt/cellranger-atac-$CELLRANGER_VER/cellranger-atac /usr/bin/cellranger-atac && \
    rm -rf /opt/cellranger-atac-$CELLRANGER_VER.tar.gz

FROM debian:stable-20240513-slim AS runtime

ENV CELLRANGER_VER=2.1.0

COPY --from=build /opt/cellranger-atac-$CELLRANGER_VER/ /opt/cellranger-atac-$CELLRANGER_VER/
RUN ln -s /opt/cellranger-atac-$CELLRANGER_VER/cellranger-atac /usr/bin/cellranger-atac

# sudo docker build -t cellranger-atac-reduced -f Dockerfile .
# 

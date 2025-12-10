# Dockerfile to create container with Cell Ranger v10.0.0
# Push to ccrsfifx/cellranger:10.0.0

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

# Copy pre-downloaded cellranger file
ENV CELLRANGER_VER=10.0.0
COPY cellranger-$CELLRANGER_VER.tar.gz /opt/cellranger-$CELLRANGER_VER.tar.gz

# Install cellranger
RUN \
    cd /opt && \
    tar -zxvf cellranger-$CELLRANGER_VER.tar.gz && \
    export PATH=/opt/cellranger-$CELLRANGER_VER:$PATH && \
    ln -s /opt/cellranger-$CELLRANGER_VER/cellranger /usr/bin/cellranger && \
    rm -rf /opt/cellranger-$CELLRANGER_VER.tar.gz && \
    cellranger telemetry disable

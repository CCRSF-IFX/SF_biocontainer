# Dockerfile to create container with Cell Ranger v9.0.0
# Push to ccrsfifx/cellranger:9.0.0

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
ENV CELLRANGER_VER=9.0.0
COPY cellranger-$CELLRANGER_VER.tar /opt/cellranger-$CELLRANGER_VER.tar

# Install cellranger
RUN \
    cd /opt && \
    tar -xvf cellranger-$CELLRANGER_VER.tar && \
    export PATH=/opt/cellranger-$CELLRANGER_VER:$PATH && \
    ln -s /opt/cellranger-$CELLRANGER_VER/cellranger /usr/bin/cellranger && \
    rm -rf /opt/cellranger-$CELLRANGER_VER.tar && \
    cellranger telemetry disable

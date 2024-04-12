# Dockerfile to create container with Space Ranger v3.0.0

FROM docker.io/continuumio/miniconda3:22.11.1
LABEL authors="Shaoun Xie <xies4@nih.gov>" \
    description="Docker image containing Space Ranger"
# Disclaimer: this container is not provided nor supported by Illumina or 10x Genomics.

# Install procps and clean apt cache
RUN apt-get update --allow-releaseinfo-change \
    && apt-get install -y \
    cpio \
    procps \
    rpm2cpio \
    unzip \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Copy pre-downloaded spaceranger file
ENV CELLRANGER_VER=3.0.0
COPY spaceranger-$CELLRANGER_VER.tar.gz /opt/spaceranger-$CELLRANGER_VER.tar.gz

# Install spaceranger
RUN \
    cd /opt && \
    tar -xzvf spaceranger-$CELLRANGER_VER.tar.gz && \
    export PATH=/opt/spaceranger-$CELLRANGER_VER:$PATH && \
    ln -s /opt/spaceranger-$CELLRANGER_VER/spaceranger /usr/bin/spaceranger && \
    rm -rf /opt/spaceranger-$CELLRANGER_VER.tar.gz

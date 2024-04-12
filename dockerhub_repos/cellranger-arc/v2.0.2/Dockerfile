# Dockerfile to create container with Cell Ranger ARC v2.0.2

FROM docker.io/continuumio/miniconda3:22.11.1
LABEL authors="Shaoun Xie <xies4@nih.gov>" \
    description="Docker image containing Cell Ranger ARC"
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
ENV CELLRANGERARC_VER=2.0.2
COPY cellranger-arc-$CELLRANGERARC_VER.tar.gz /opt/cellranger-arc-$CELLRANGERARC_VER.tar.gz

# Install cellranger
RUN \
    cd /opt && \
    tar -xzvf /opt/cellranger-arc-$CELLRANGERARC_VER.tar.gz && \
    export PATH=/opt/cellranger-arc-$CELLRANGERARC_VER:$PATH && \
    ln -s /opt/cellranger-arc-$CELLRANGERARC_VER/cellranger-arc /usr/bin/cellranger-arc && \
    rm -rf /opt/cellranger-arc-$CELLRANGERARC_VER.tar.gz

#sudo docker build -t cellranger-arc -f Dockerfile .
#docker tag cellranger-arc:latest ccrsfifx/cellranger-arc:2.0.2
#docker push ccrsfifx/cellranger-arc:2.0.2

FROM continuumio/miniconda3:24.3.0-0

LABEL maintainer="Shaojun Xie"
LABEL description="Biobakery Workflow: A workflow for the analysis of microbiome data using Biobakery tools."
LABEL version="4.0.0a1"
LABEL software="Biobakery Workflow"

# Create a conda environment and install software
RUN conda create -n biobakery_env -y \
    && conda install -n biobakery_env -y conda-forge::libgcc-ng==14.2.0 \
    && conda install -n biobakery_env -y conda-forge::libstdcxx==14.2.0 \
    && conda install -n biobakery_env -y conda-forge::libzlib=1.3.1 \
    && conda install -n biobakery_env -y bioconda::bowtie2==2.5.4 \
    && conda install -n biobakery_env -y biobakery::kneaddata==0.12.2 \
    && conda install -n biobakery_env -y bioconda::metaphlan==4.1.1 \
    && conda install -n biobakery_env -y biobakery::humann==4.0.0a1 \
    && conda install -n biobakery_env -y bioconda::panphlan==3.1 \
    && conda install -n biobakery_env -y bioconda::prokka==1.14.6 \
    && conda install -n biobakery_env -y bioconda::megahit==1.2.9 \
    && conda install -n biobakery_env -y bioconda::seqtk==1.4 \
    && conda install -n biobakery_env -y bioconda::anadama2==0.10.0 \
    && conda clean -a -y

# Download and install Biobakery Workflows from the provided archive
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://github.com/biobakery/biobakery_workflows/archive/refs/tags/4.0.0a1.zip -O /tmp/biobakery_workflows.zip && \
    unzip /tmp/biobakery_workflows.zip -d /tmp && \
    mv /tmp/biobakery_workflfows-4.0.0a1 /opt/biobakery_workflows && \
    rm -rf /tmp/biobakery_workflows.zip && \
    apt-get remove -y wget unzip && apt-get autoremove -y && apt-get clean

# Add Biobakery Workflows to PATH
ENV PATH /opt/biobakery_workflows:$PATH


# Activate the environment and ensure the software is exposed
ENV PATH /opt/conda/envs/biobakery_env/bin:$PATH

# Set the default environment to activate on container start
SHELL ["conda", "run", "-n", "biobakery_env", "/bin/bash", "-c"]



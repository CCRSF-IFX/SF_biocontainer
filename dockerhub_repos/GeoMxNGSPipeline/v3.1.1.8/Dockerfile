# Use an appropriate base image
FROM ubuntu:20.04

# Set environment variables to avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    sudo \
    wget \
    curl \
    unzip \
    bash 

# Create the 'docker' user and add it to the 'sudo' group
RUN adduser --disabled-password --gecos "" docker && \
    adduser docker sudo

# Switch to the 'docker' user
USER docker

# Copy the installation script into the container
COPY GeoMxNGSPipeline_Linux_3.1.1.8.sh /home/docker/GeoMxNGSPipeline_Linux_3.1.1.8.sh
COPY GeoMxNGSPipeline.tgz /home/docker/GeoMxNGSPipeline.tgz

USER root
# Give execute permissions to the script
RUN chmod 755 /home/docker/GeoMxNGSPipeline_Linux_3.1.1.8.sh

# Expose the port (default 5000 or custom one)
#EXPOSE 5000

# Add GeoMxNGSPipeline directory to the PATH
ENV PATH=$PATH:/var/GeoMxNGSPipeline
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# Run the installation script and automatically "press Enter" for default port (5000)
RUN cd /home/docker/ && \
    echo "" | sudo ./GeoMxNGSPipeline_Linux_3.1.1.8.sh && \
    touch /var/GeoMxNGSPipeline/agreement_cli_yes

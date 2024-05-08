# SF_biocontainer

[SF_biocontainer](https://github.com/CCRSF-IFX/SF_biocontainer.git) is a github repo with the Dockerfile used to build containers for CCRSF pipelines.


### Publicly available images

Many of the popular tools have been containerized by the community, including Biocontainer community and different institutes. These resources can be found either on [Docker hub](https://hub.docker.com/) or [Quay](https://quay.io/organization/biocontainers)

### CCRSF maintained images

There are two scenarios that we need to build our own images: 

1. If the tool we want to use is not containerized before, we can build the container ourselves and deposite the image on Docker hub. 

2. For a particular task, multiple packages are required, so a customized environment is needed. For example, for analysis of single cell RNA-seq data, multiple R packages are required (Seurat, SingleR, etc). We can build an image with all the required packages: 
https://github.com/CCRSF-IFX/SF_biocontainer/blob/main/dockerhub_repos/sc-smk-wl/vr1.0.0/Dockerfile 

Here is a diagram to show the current workflow used for containerization:  


![](containerization.png)

CCRSFIFX maintained images can be found [here](https://hub.docker.com/u/ccrsfifx)


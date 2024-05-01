## Create images using Docker 

Docker is not available on FRCE (or any HPC) for a user because docker requires sudo permission. 

But we can run use docker on our own laptop or VM in which we have been granted the root access. 

Common command lines used to create and test an image:

```
## passwd is the same as FRCE password
docker login -u ccrsfifx 
docker build
docker tag
docker push
docker run 
docker images
docker container ls
```

### An example of creating customized image for single cell data

Command lines for creating and pushing images to Docker hub
```
docker build -t sc-smk-wl -f Dockerfile .
docker tag sc-smk-wl:latest ccrsfifx/sc-smk-wl:r1.0.0
docker push ccrsfifx/sc-smk-wl:r1.0.0
```

To test the image, we can create a container using the image we have built above: 
```
docker run -p 8888:8888 -v /Volumes/:/Volumes/ -t -d --name Renv sc-smk-wl:latest
```

Because the image above is built for processing single cell RNA-seq data, we included all the R packages needed:
```
Seurat
SingleR
celldex
scater
etc
```

Then we can aunch a Bash shell inside the container:
```
docker exec -it Renv bash 
```
In the container, we can lauch jupyter lab and test the R code.

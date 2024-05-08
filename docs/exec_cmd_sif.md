
Here we use Seurat analysis as an example. 

Step 1: Build an image file using Singularity: 

```
singularity build r_env_v1.0.0.sif docker://ccrsfifx/sc-smk-wl:r1.0.0
```

The command line above will create a file named `r_env_v1.0.0.sif`. The suffix `sif` is short for singularity image file. This image file contains all the required R packages. 

Using the command line below, you can get the packages installed and the corresponding version information: 

```
singularity build r_env_v1.0.0.sif R -e 'ip = as.data.frame(installed.packages()[,c(1,3:4)]); ip = ip[is.na(ip$Priority),1:2,drop=FALSE];ip'
```

Step 2: Run the command line 
```
singularity exec  \
    --cleanenv --no-home -B /mnt/ccrsf-static/ -B /mnt/ccrsf-ifx/ -B  /scratch/ccrsf_scratch \
    r_env_v1.0.0.sif \
    Rscript sc_seurat.prod.R  --genome=hg38 --data.dir=<absolute_path2mtx> --outdir=<outdir>
```




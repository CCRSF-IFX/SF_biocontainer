# Use the container in Snakemake pipeline

To use container in the snakemake pipeline, we can define a container for each rule to use: 

```
rule NAME:
    input:
        "table.txt"
    output:
        "plots/myplot.pdf"
    container:
        "docker://joseespinosa/docker-r-ggplot2"
    script:
        "scripts/plot-stuff.R"
```


The configuration for singularity can be found in `profile/slurm/config.v8+.yaml`: 

```
use-singularity: True
singularity-args: ' "--cleanenv --no-home -B /scratch/ccrsf_scratch -B /mnt/ccrsf-static -B /mnt/ccrsf-ifx -B /mnt/ccrsf-raw -B /mnt/ccrsf-active" '
```

The option `-B` is used to bind the corresponding storage space into the container. So that the files can be found in the container if needed. 

The `--cleanenv` option is used to exclude passing EBV variables frin the host into the container. 

`--no-home`: no host `$HOME` directory mounting. 

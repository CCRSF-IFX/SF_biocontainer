# Usecontainer in Snakemake pipeline

To use container in the snakemake pipeline, we can define a container for each rule to use: 

```
rule seurat_proc:
    input:
        h5 = rules.count.output 
    params:
        fil_mtx = os.path.join(analysis, "{sample}/outs/filtered_feature_bc_matrix/"),
        outdir = os.path.join(analysis, "{sample}/seurat/"),
    log:
        os.path.join(analysis, "{sample}/seurat/seurat.log")
    output:
        seur = os.path.join(analysis, "{sample}/seurat/seur_10x_cluster_object.rds")
    container:
        "docker://ccrsfifx/sc-smk-wl:r1.0.0"
    shell:
        """
Rscript {analysis}/workflow/scripts/rna/sc_seurat.prod.R --genome={config.ref} --data.dir={params.fil_mtx}  --outdir={params.outdir} > {log} 2>&1
"""
```


The configuration of snakemake command for singularity can be found in `profile/slurm/config.v8+.yaml`: 

```
use-singularity: True
singularity-args: ' "--cleanenv --no-home -B /scratch/ccrsf_scratch -B /mnt/ccrsf-static -B /mnt/ccrsf-ifx -B /mnt/ccrsf-raw -B /mnt/ccrsf-active" '
```

The option `-B` is used to bind the corresponding storage space into the container so that the files from scratch/Qumulo can be accessible from inside the container.  

`--no-home`: no host `$HOME` directory mounting. 
> Auto-binding feature: By default, Singularity automatically binds several directories (e.g.: `$HOME`, `$PWD`) and in particular it binds the home folder of the host. This features simplifies the usage of Singularity for the users, however it can also lead to unexpected behaviours and frustration. For example, if you have different python packages installed in your host home directory and in the container the host packages maybe used instead f the container ones. To avoid this issue, `--no-home` is used. 

The `--cleanenv` option is used to exclude passing EBV variables frin the host into the container.

Similar to `--no-home`, `--cleanenv` is used to disable Singularity passing host environment variables (`$PATH`, `$LD_LIBRARY_PATH`, etc) to the container.  

 

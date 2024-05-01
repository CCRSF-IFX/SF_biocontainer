The configuration of snakemake command for singularity is recommended to be set up in `profile/slurm/config.v8+.yaml`: 

```
use-singularity: True
singularity-args: ' "--cleanenv --no-home -B /scratch/ccrsf_scratch -B /mnt/ccrsf-static -B /mnt/ccrsf-ifx -B /mnt/ccrsf-raw -B /mnt/ccrsf-active" '
```

The option `-B` is used to bind the corresponding storage space into the container so that the files from scratch/Qumulo can be accessible from inside the container.  

`--no-home`: no host `$HOME` directory mounting. 
> Auto-binding feature: By default, Singularity automatically binds several directories (e.g.: `$HOME`, `$PWD`) and in particular it binds the home folder of the host. This features simplifies the usage of Singularity for the users, however it can also lead to unexpected behaviours and frustration. For example, if you have different python packages installed in your host home directory and in the container the host packages maybe used instead f the container ones. To avoid this issue, `--no-home` is used. 

The `--cleanenv` option is used to exclude passing EBV variables frin the host into the container.

Similar to `--no-home`, `--cleanenv` is used to disable Singularity passing host environment variables (`$PATH`, `$LD_LIBRARY_PATH`, etc) to the container.  

 

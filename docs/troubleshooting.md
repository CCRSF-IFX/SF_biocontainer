# Troubleshooting 

## Issue with cache folders and temporary folders

To make download of layers for build and pull faster and less redundant, `singularity` use a caching strategy. By default, the Singularity software will create a set of folders in your $HOME directory for docker layers and metadata, respectively: 

```
$HOME/.singularity
```

Singularity also uses some temporary directories to build the squashfs filesystem, so this temp space needs to be large enough to hold the entire resulting Singularity image. By default this happens in /tmp but can be overridden by setting SINGULARITY_TMPDIR to the full path where you want the squashfs temp files to be stored. 

In many HPC platform, limited space is assigned to `$HOME`. So to make the pipeline more robust, it is recommended to set `SINGULARITY_CACHEDIR` to make sure enough space can be used. 

 

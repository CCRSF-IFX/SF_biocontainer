# Troubleshooting 

## Issue with cache folders and temporary folders

To make download of layers for build and pull faster and less redundant, `singularity` use a caching strategy. By default, the Singularity software will create a set of folders in your $HOME directory for docker layers and metadata, respectively: 

```
$HOME/.singularity
```

Singularity also uses some temporary directories to build the squashfs filesystem, so this temp space needs to be large enough to hold the entire resulting Singularity image. By default this happens in /tmp but can be overridden by setting SINGULARITY_TMPDIR to the full path where you want the squashfs temp files to be stored. 

In many HPC platform, limited space is assigned to `$HOME`. So to make the pipeline more robust, it is recommended to set `SINGULARITY_CACHEDIR` to make sure enough space can be used. 

## BoltDB Corruption Errors

The library that SingularityCE uses to retrieve and cache Docker/OCI layers keeps track of them using a single-file database. If your home directory is on a network filesystem which experiences interruptions, or you run out of storage, it is possible for this database to become inconsistent.

If you observe error messages that mention github.com/etcd-io/bbolt when trying to run SingularityCE, then you should remove the database file:

```
rm ~/.local/share/containers/cache/blob-info-cache-v1.boltdb
```

Here are the discussions useful for this issue: 

https://github.com/apptainer/singularity/issues/5329#issuecomment-637595826
https://docs.sylabs.io/guides/main/user-guide/build_env.html#boltdb-corruption-errors
https://github.com/apptainer/singularity/issues/5329#issuecomment-1062000005


## Issue with NIH VPN 

When the program inside a container needs to connect to a database via API or download some data, the error message below might be threwn out:

> SSL certificate problem: self signed certificate in certificate chain

This is related to VPN setting. Disabling VPN solved the issue. Detailed reason not sure. 


 

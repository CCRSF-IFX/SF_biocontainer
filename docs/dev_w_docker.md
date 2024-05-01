To develop R scripts for single cell sequencing data, docker container can be used. In the docker container, development can be finished using jupyter-lab. 

If the goal is to develop an R script named `sc_singleR.prod.R`, we create two files: 
```
sc_seurat_opt.R
sc_singleR.ipynb
```

1. Record the script path:

```
script_path = getwd()                                # %exclude_jupyterlab%
script_path                                          # %exclude_jupyterlab%
```

2. Invoke `sc_singleR_opt.R` for command line options 

Inside the notebook, we use the cell below to utilize `sc_seurat_opt.R` to read the command line options and save the information in an RDS file named `opt.rds`. 

```
system(paste0('Rscript ', script_path,                # %exclude_jupyterlab%
        '/sc_singleR_opt.R --genome="hg38" --markerList="/Volumes/ccrsf-ifx/Software/scripts/bin/currentsnake/single_cell/gene_lists/human_gene_list.csv" --outdir="/Volumes/ccrsf-static/Analysis/xies4/github_repos/pipeline_dev_test/singleR" --rds="/Volumes/ccrsf-static/Analysis/xies4/github_repos/pipeline_dev_test/test_dir/seur_10x_cluster_object.rds"'),  # %exclude_jupyterlab%
       intern = T) # %exclude_jupyterlab%
```

3. Write the main code

After capturing the options, read them using `readRDS()` and proceed with the main code: 

```
opt = readRDS("/Volumes/ccrsf-static/Analysis/xies4/github_repos/pipeline_dev_test/singleR/opt.rds")         # %exclude_jupyterlab%
# main code  goes here
```

4. Generate production script: `sc_singleR.prod.R`

Combine the necessary scripts and exclude irrelevant lines marked with `exclude_jupyterlab` to create the production script:

```
notebook_prefix = "sc_singleR"                                                         # %exclude_jupyterlab%
notebook_name = paste0(notebook_prefix, ".ipynb")                                     # %exclude_jupyterlab%
notebook_r = paste0(script_path, "/", paste0(notebook_prefix, ".r"))                  # %exclude_jupyterlab%
notebook_path = paste0(script_path, "/", notebook_name)                               # %exclude_jupyterlab%
opt_name = paste0(script_path, "/", sub(".ipynb", "_opt.R", notebook_name))           # %exclude_jupyterlab%
output = paste0(script_path, "/", sub(".ipynb", ".prod.R", notebook_name))            # %exclude_jupyterlab%
cmd1 = paste0("jupyter nbconvert --to script --output ",                              # %exclude_jupyterlab%
             notebook_prefix, ' ', notebook_path, "> /dev/null 2>&1 ")                # %exclude_jupyterlab%
cmd1                                                                                  # %exclude_jupyterlab%
system(cmd1, intern = TRUE)                                                            # %exclude_jupyterlab%
cmd2 = paste0('cat ', opt_name, ' ', notebook_r,                                      # %exclude_jupyterlab%
             ' |grep -v exclude_jupyterlab > ', output,  ' 2>&1')                     # %exclude_jupyterlab%
cmd2                                                                                  # %exclude_jupyterlab%
system(cmd2, intern = T)                                                              # %exclude_jupyterlab%
system(paste0("rm ", notebook_r))                                                     # %exclude_jupyterlab%  
```


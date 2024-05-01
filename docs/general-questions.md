# FAQ 

## What is Docker container? 

A Docker container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings. 

Docker containers are built from images, which are read-only templates containing the application and its dependencies. Images are defined using a Dockerfile, which specifies the configuration and steps needed to create the image.

Once an image is created, it can be instantiated into one or more containers. Each container runs in its own isolated environment but shares the same underlying host operating system with other containers. This allows for efficient resource utilization and easy scaling of applications.


## Why do we use container? 

A container is a technology that provides a consistent computational environment and enables reproducibility, scalability, and security when developing NGS bioinformatics analysis pipelines. Containers can increase the bioinformatics team's productivity by automating and simplifying the maintenance of complex bioinformatics resources, as well as facilitate validation, version control, and documentation necessary for clinical laboratory regulatory compliance. 

## What's the difference between container and VM? 


VMs are great at providing full process isolation for applications: there are very few ways a problem in the host operating system can affect the software running in the guest operating system, and vice-versa. But this isolation comes at great cost — the computational overhead spent virtualizing hardware for a guest OS to use is substantial.

Containers take a different approach: by leveraging the low-level mechanics of the host operating system, containers provide most of the isolation of virtual machines at a fraction of the computing power.





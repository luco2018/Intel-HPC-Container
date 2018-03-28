# Intel-HPC-Container
Welcome to the Intel HPC Container

# Goal:
Create Singularity containers for HPC apps and run them on the cloud for Single and Cluster runs

# Singularity ?
Singularity enables users to have full control of their environment. Singularity containers can be used to package entire scientific workflows, software and libraries, and even data. This means that you don’t have to ask your cluster admin to install anything for you - you can put it in a Singularity container and run. More information are available on the main website Singularity


# Available Containers

* [Amrex](https://github.com/intel/Intel-HPC-Container/blob/master/containers/amrex/README.md)

* [Milc](https://github.com/intel/Intel-HPC-Container/blob/master/containers/milc/README.md)

# Example workflow using Google Cloud Engine:

### Single node setup
  -   Create a GCE [instance](https://cloud.google.com/compute/docs/instances/create-start-instance)
  -   [Install Singularity ](http://singularity.lbl.gov/docs-installation)
  -   Get the container (see one of the "Available Containers: example above)
  -   Run the container
   
          $ ./container.simg


###  Multinode (cluster) setup: 
  
  For more details of how to setup a cluster, see https://github.com/Smahane/HPC-Container/wiki/Create-a-cluster-on-GEC-with-Elasticluster
  
 * In your GCE VM named "elasticlusterinstance", activate your conda envirnment:
 
       $ source activate elasticluster
 
  * ssh to your previously created cluster from your "elasticlusterinstance" :
  
        $ elasticluster ssh mycluster

  * Get the container (see one of the "Available Containers: example above)
  
    	$ singularity pull shub://intel/Intel-HPC-Container:$container
   
   * Run your container (see one of the "Available Containers: example above)
   
         $  mpirun -hostfile nodelist -n 4 -ppn 1 -genv OMP_NUM_THREADS=$NUM_THREADS ./$container.simg
        

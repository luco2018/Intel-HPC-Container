
# Welcome to the Intel HPC Container

# Goal:
Get a single file based [Singularity](http://singularity.lbl.gov/) container image for HPC apps & run it on the cloud or other various compute infrastructures for both Single node and Clusters

# Available Containers

* [Amrex](https://github.com/intel/Intel-HPC-Container/blob/master/containers/amrex/README.md)

* [Milc](https://github.com/intel/Intel-HPC-Container/blob/master/containers/milc/README.md)

# Example workflow using Google Cloud Engine:

### Single node setup
  -   [Create a GCE instance](https://cloud.google.com/compute/docs/instances/create-start-instance)
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
        

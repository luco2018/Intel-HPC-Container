
# Welcome to the Intel HPC Container

Do you in need to run or install an optimized HPC application on your cloud environment? Do you need to get the source code, the right compiler version and any dependencies and go through the challenge of building and compiling the code? Please skip the challenges and reduce the complexity. Browse our available containers, choose the Intel HPC container of your choice, and run it.

# Goal:
Get a single file based [Singularity](http://singularity.lbl.gov/) container image for the HPC app of your choice & run it on the cloud or other various compute infrastructures for both Single node and Clusters

# Available Containers

* [NAMD]

* [LAMMPS]

* [GROMACS]

* [AMREX](https://github.com/intel/Intel-HPC-Container/blob/master/containers/amrex/README.md)

* [MILC](https://github.com/intel/Intel-HPC-Container/blob/master/containers/milc/README.md)

# Example workflow using Google Cloud Engine:

### Single node setup
  -   [Create a GCE instance](https://cloud.google.com/compute/docs/instances/create-start-instance)
  -   [Install Singularity ](http://singularity.lbl.gov/docs-installation)
  -   Choose the container of the application you want (see one of the "Available Containers: example above)
  -   Run the container
   
          $ singularity run shub://intel/Intel-HPC-Container:$APPNAME


###  Multinode (cluster) setup: 
  
  For more details of an example of how to setup a cluster on GEC, see https://github.com/Smahane/HPC-Container/wiki/Create-a-cluster-on-GEC-with-Elasticluster
  
    
 * After your cluster is ready, in your GCE VM named "elasticlusterinstance", activate your conda envirnment:
 
       $ source activate elasticluster
 
  * ssh to your previously created cluster from your "elasticlusterinstance" :
  
        $ elasticluster ssh mycluster

  * Get the container (see one of the "Available Containers: example above)
  
    	$ singularity pull shub://intel/Intel-HPC-Container:$container
   
   * Run your container (see one of the "Available Containers: example above)
   
         $  mpirun -hostfile nodelist -n 4 -ppn 1 -genv OMP_NUM_THREADS=$NUM_THREADS ./$container.simg
        

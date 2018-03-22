# Intel-HPC-Container
Welcome to the Intel HPC Container

# Goal:
Create Singularity containers for HPC apps and run them on the cloud for Single and Cluster runs

# Singularity ?
Singularity enables users to have full control of their environment. Singularity containers can be used to package entire scientific workflows, software and libraries, and even data. This means that you don’t have to ask your cluster admin to install anything for you - you can put it in a Singularity container and run. More information are available on the main website Singularity


# Available Containers

* [Amrex](https://github.com/Smahane/HPC-Container/blob/master/docs/pages/amrex.md)

* [Milc](https://github.com/Smahane/HPC-Container/tree/master/docs/pages)

# Example workflow using Google Cloud Engine:

### Single node setup
  -   Create a GCE
  -   Install Singularity and run time libraries
  -   Get the container
  -   Run the container
   
          $ ./container.simg


###  Multinode (cluster) setup:
 * In your GCE VM named "elasticlusterinstance", activate your conda envirnment:
 
       $ source activate elasticluster
   
  * Copy any needed files and containers from your system to your cloud VM:
  
    	$ gcloud compute scp milc.img user@elasticlusterinstance:/home/$folder/

  * From you "elasticlusterinstance" VM, upload files to your cluster
  
        $ elasticluster sftp mycluster
        $ put /home/$folder/milc.img
        $ exit

  * ssh to your cluster from your "elasticlusterinstance" :
  
        $ elasticluster ssh mycluster

   * Run your container
   
         $  mpirun -hostfile nodes -n 4 -ppn 1 -genv OMP_NUM_THREADS=$NUM_THREADS ./$container.simg
        

# Intel-HPC-Container
Welcome to the Intel-HPC-on-the-Cloud wiki!!

# Goal:
Create Singularity containers for HPC apps and run them on the cloud for Single and Cluster runs

# Singularity ?
Singularity enables users to have full control of their environment. Singularity containers can be used to package entire scientific workflows, software and libraries, and even data. This means that you don’t have to ask your cluster admin to install anything for you - you can put it in a Singularity container and run. More information are available on the main website Singularity

# So why Singularity for HPC  but not Docker?

* Docker emulates a virtual machine in many aspects (e.g. users can escalate to root)
* Non-authorized users having root access to any of our production networks is considered a security breech
* To mitigate this security issue, networks must be isolated for Docker access and thus will preclude access to InfiniBand high performance networks and optimized storage platforms
* People then build a virtual cluster within a cluster trying to navigate a solution
* Additional complexities arise with existing scheduling architectures and workflows which greatly complicate usage models and/or system architecture (especially with parallel MPI job execution.

Additional details are found here: https://tin6150.github.io/psg/blogger_container_hpc.html


# We will cover here:

* [Run a container form Singularity Hub](https://github.com/intel/Intel-HPC-Container/blob/master/docs/README.md)

* [Install Singularity](https://github.com/Smahane/Intel-HPC-Container/wiki/Install-Singularity)

* [Create single HPC app container (MILC) and run on Google Cloud Engine (GEC)](https://github.com/Smahane/Intel-HPC-Container/wiki/Create-single-HPC-app-container-(MILC)-and-run-on-Google-Cloud-Engine-(GEC))

* [Create a container with multiple apps (MILC, HACC)](https://github.com/Smahane/Intel-HPC-Container/wiki/Create-a-container-with-multiple-apps-(MILC,-HACC) )

* [Create an HPC container(AMREX) and run with MPI on a GEC cluster](https://github.com/Smahane/Intel-HPC-Container/wiki/Create-an-HPC-container(AMREX)-and-run-with-MPI-on-a-GEC-cluster) 
* [Create a cluster on GEC with Elasticluster](https://github.com/Smahane/Intel-HPC-Container/wiki/Create-a-cluster-on-GEC-with-Elasticluster)
* [Singularity Hub](https://github.com/Smahane/Intel-HPC-Container/wiki/Singularity-Hub)

# Example workflow:
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

  * pull Singularity container image:
  
   * Run your container
   
        $ ./milc.img

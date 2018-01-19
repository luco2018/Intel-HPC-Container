# Intel-HPC-on-the-Cloud
Welcome to the Intel-HPC-on-the-Cloud wiki!

# Goal:
Create Singularity containers for HPC apps and run them on the cloud for Single and Cluster runs

# Singularity ?
Singularity enables users to have full control of their environment. Singularity containers can be used to package entire scientific workflows, software and libraries, and even data. This means that you don’t have to ask your cluster admin to install anything for you - you can put it in a Singularity container and run. More information are available on the main website Singularity

# So why Singularity for HPC  but not Docker?

* Docker emulates a virtual machine in many aspects (e.g. users can escalate to root)
* Non-authorized users having root access to any of our production networks is considered a security breech
* To mitigate this security issue, networks must be isolated for Docker access and thus will preclude access to InfiniBand high performance networks and optimized storage platforms
* People then build a virtual cluster within a cluster trying to navigate a solution
* Additional complexities arise with existing scheduling architectures and workflows which greatly complicate usage models and/or system architecture (especially with parallel MPI job execution


# We will cover here:

* [Install Singularity](https://github.intel.com/sdouyeb/Intel-on-the-Cloud/wiki/Install-Singularity)

* [Build single HPC app container (MILC) and run on Google Cloud Engine (GEC)](https://github.intel.com/sdouyeb/Intel-on-the-Cloud/wiki/Build-single-HPC-app-container-(MILC)-and-run-on-Google-Cloud-Engine-(GEC))

* [Build a container with multiple apps (MILC, HACC) and run on GCE](https://github.intel.com/sdouyeb/Intel-on-the-Cloud/wiki/Build-a-container-with-multiple-apps-(MILC,-HACC)-and-run-on-GCE)

* Build an HPC container(AMREX) and run on a GEC cluster 
* [Create a cluster on GEC with Elasticluster](https://github.intel.com/sdouyeb/Intel-on-the-Cloud/wiki/Create-a-cluster-on-GEC-with-Elasticluster)

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

   * Run your container
   
        $ ./milc.img

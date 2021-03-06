# NAMD

NAMD is a parallel molecular dynamics code designed for high-performance simulation of large biomolecule systems. Based on Charm++ parallel objects, NAMD scales to hundreds of cores for typical simulations and beyond 500,000 cores for the largest simulations. NAMD uses the popular molecular graphics program VMD for simulation setup and trajectory analysis, but is also file-compatible with AMBER, CHARMM, and X-PLOR.

NAMD is distributed free of charge with source code. You can build NAMD yourself or download binaries for a wide variety of platforms. 

Below are the details of how to get and run NAMD container for best performance on Intel® Xeon® Gold family for single and cluster nodes.

***

> PS: Note that the following prerequisites must be fulfilled before running the container:

   - Intel Xeon processor E5 based system or cluster. Cloud or bare metal 

   - Singularity must be installed and operational

See instructions [here](https://github.com/intel/Intel-HPC-Container/wiki/3.-Documentation-running-CSPs)

# Running instructions:
The NAMD containers provides three NAMD binaries available inside the container at /opt/intel/namd:

	$ namd2_16u4 		# it is binary only for 1 node run 
	$ namd2_mpi_SKX_16u4 	# it is multimode binary with MPI calls
	$ namd2_ofi_SKX 	# it is multimode binary with OFI calls and Multi-EP support( best practices are not available yet)


## Get namd image:

You can pull the namd container image form the Singularity hub as follow:

	$ singularity pull shub://intel/Intel-HPC-Container:namd

OR you can build an image using the base:

        $ sudo singularity build namd.img shub://intel/Intel-HPC-Container:namd
***
## Run namd on single node:

1.  In Detached mode:
	
        $ ./intel-Intel-HPC-Container-master-namd.simg

2.  With the [exec](http://singularity.lbl.gov/docs-exec) command: 

	    $ singularity exec intel-Intel-HPC-Container-master-namd.simg /opt/intel/namd/namd2_16u4 +p 40 apoa1/apoa1.namd +pemap 0-39
	
	
This will run the namd2_16u4 with the provided Apoa1 and Stmv workloads with:

         ppn=40 ,   numsteps: 1000 ,   outputtiming: 20 ,  outputenergies: 600 
  

3.  In Attached mode: 

        $ singularity shell intel-Intel-HPC-Container-master-namd.simg
        $ cd /opt/intel/namd/
        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ ./namd2 +p 40 apoa1.namd +pemap 0-39

> PS. You can choose to run with your preferred workload. The container should have your home directory mounted or you can bind your preferred directory. [See here](https://singularity.lbl.gov/docs-mount) 

Example to run with your custom workload:

	$ singularity shell intel-Intel-HPC-Container-master-namd.simg
        $ cd /opt/intel/namd/
        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ ./namd2 +p $ppn $LocalPath/apoa1/apoa1.namd +pemap 0-($ppn-1)

***
## Run namd on a cluster:

After you setup your cluster, specify host names to run on in “hosts” file. Here is an example:
      
        $ sudo singularity build --writable namd.img shub://intel/Intel-HPC-Container:namd
	$ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ source /opt/intel/psxe_runtime/linux/mpi/intel64/bin/mpivars.sh
	$ mpiexec.hydra -hostfile ./nodelist -n 4 -ppn 2 singularity exec namd.img /opt/intel/namd/namd2_mpi_SKX_16u4 +ppn 39 apoa1/apoa1.namd +pemap 1-39 +commap 0  

***

### Recommended links:
NAMD user's Guide: http://www.ks.uiuc.edu/Research/namd/

NAMD recipe for Intel:
* [Building NAMD on Intel® Xeon® and Intel® Xeon Phi™ Processors on a Single Node](https://software.intel.com/en-us/articles/recipe-building-namd-on-intel-xeon-and-intel-xeon-phi-processors-on-a-single-node)
* [Building NAMD on Intel® Xeon® and Intel® Xeon Phi™ Processors for Multi-node Runs](https://software.intel.com/en-us/articles/recipe-building-namd-on-intel-xeon-and-intel-xeon-phi-processors-for-multi-node-runs)


[Optimization Notice.](https://software.intel.com/en-us/articles/optimization-notice#opt-en)

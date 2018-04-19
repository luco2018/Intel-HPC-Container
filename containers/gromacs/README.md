# GROMACS

GROMACS is a versatile package for performing molecular dynamics, using Newtonian equations of motion, for systems with hundreds to millions of particles. GROMACS is primarily designed for biochemical molecules like proteins, lipids, and nucleic acids that have a multitude of complicated bonded interactions. But, since GROMACS is extremely fast at calculating the non-bonded interactions typically dominating simulations, many researchers use it for research on non-biological systems, such as polymers.

GROMACS supports all the usual algorithms expected from a modern molecular dynamics implementation.

Below are the details of how to get and run GROMACS container for best performance on Intel® Xeon® Gold family for single and cluster nodes.

***
> PS: Note that the following prerequisites must be fulfilled before running the container:

  - Intel® Xeon® Gold family system or cluster. Cloud or bare metal 

  - Singularity must be installed and operational

See instructions [here](https://github.com/intel/Intel-HPC-Container/wiki/3.-Documentation-running-CSPs)

# Running instructions:

 The GROMACS container includes a binary optimized for AVX-512 and Intel MPI (gmx_mpi) and example worloads include lignocellulose (topol_rf.tpr) and adh (topol.tpr).
 
 ## Get GROMACS container:
 
 You can pull the gromacs container image from the Singularity hub as follow:
 
    $ singularity pull shub://intel/Intel-HPC-Container:gromacs
  
  Or you can build a writable image using the base:
    
    $ sudo singularity build --writable gromacs.img shub://intel/Intel-HPC-Container:gromacs
    
 ***
## Run gromcs  on single node: 

1.  In Detached mode:
	
        $ Singularity run gromacs.img
       
 This will run the binary gmx_mpi with topol.tpr workload on single node with all the available threads.    

2.  With the [exec](http://singularity.lbl.gov/docs-exec) command.
 
 For example to run the adh example:
     
     $ singularity exec gromacs.img /opt/intel/gromacs/bin/gmx_mpi mdrun -s /opt/intel/gromacs/samples/adh/topol.tpr -nsteps 2000 -resethway -noconfout
     
3.  In Attached mode: 
       
        $ singularity shell gromacs.img
        $ cd /opt/intel/gromacs/samples
        $ /opt/intel/gromacs/bin/gmx_mpi mdrun -nsteps 2000 -resethway -noconfout

> PS. To run with your own workload, the container should have your home directory mounted or you can bind your preferred directory. [See here](https://singularity.lbl.gov/docs-mount). You can also run with the exec command. 

Example to run with your own workload:

	$ singularity exec gromacs.img /opt/intel/gromacs/bin/gmx_mpi mdrun -s <LOCALDIR>/your_workload -nsteps 2000 -resethway -noconfout

***

## Run gromacs on a cluster:

To run the container on multinode, you need to do the following:

 * Setup your cluster
 * Get the gromacs container
 * Source mpi
 * Specify host names to run on in “hosts” file
 * Select a communication and Nextork fabric at runtime
 
 Here is an example to run interactively on 4 node with 24 cores/socket/node setup on the cloud:
 
	$ cat nodelist 
	compute001
	compute002
	compute003
	compute004
	
	source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
		
	$ export I_MPI_FABRICS=shm:tcp     # Set the tcp fabric to be used for communication between nodes
	$ export I_MPI_DEVICE=ssm          # Set TCP + shared memory (for SMP clusters connected via Ethernet)
	
	# run gromacs on 4  Intel® Xeon® Gold nodes
	$ mpirun -n 160 -hostfile nodelist singularity exec gromacs.img /opt/intel/bin/gmx_mpi mdrun -s /opt/intel/gromacs/samples/lignocellulose/topol_rf.tpr -nsteps 2000 -resethway -noconfout 
***
### Recommended links:

* [Gromacs main site](http://www.gromacs.org/)
* [Gromacs recipe for Intel platforms](https://software.intel.com/en-us/articles/recipe-building-and-running-gromacs-on-intel-processors)



[Optimization Notice.](https://software.intel.com/en-us/articles/optimization-notice#opt-en)

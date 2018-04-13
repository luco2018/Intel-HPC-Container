# LAMMPS

Large-scale Atomic/Molecular Massively Parallel Simulator (LAMMPS) is a classical molecular dynamics code. LAMMPS can be used to simulate solid-state materials (metals, semiconductors), soft matter (biomolecules, polymers), and coarse-grained or mesoscopic systems. LAMMPS can be used to model atoms, or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques with a spatial-decomposition of the simulation domain. The code is designed to be easy to modify or extend with new functionality.

Below are the details of how to get and run LAMMPS container for best performance on Intel Xeon processor E5 family for single and cluster nodes.

***
> PS: Note that the following prerequisites must be fulfilled before running the container:

  - Intel Xeon processor E5 based system or cluster. Cloud or bare metal 

  - Singularity must be installed and operational

See instructions [here](https://github.com/intel/Intel-HPC-Container/wiki/3.-Documentation-running-CSPs)

# Running instructions:
The LAMMPS container includes the following workloads and binary: 
 
    in.intel.airebo  in.intel.eam  in.intel.lj     in.intel.sw       in.intel.water       
    in.intel.dpd     in.intel.lc   in.intel.rhodo  in.intel.tersoff  lmp_intel_cpu_intelmpi

## Get lammps image:

You can pull the lammps container image form the Singularity hub as follow:

	$ singularity pull shub://intel/Intel-HPC-Container:lammps

OR you can build an image using the base:

        $ sudo singularity build lammps.img shub://intel/Intel-HPC-Container:lammps
***
## Run lammps on single node:

1.  In Detached mode:
	
        $ ./lammps.img $NUMCORES

This will run the binary lmp_intel_cpu_intelmpi with all the workloads

2.  With the [exec](http://singularity.lbl.gov/docs-exec) command. For example: 

        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ mpirun -np 40 singularity exec lammps.img /opt/intel/lammps/lmp_intel_cpu_intelmpi -in /opt/intel/lammps/in.intel.lj -log none -pk intel 0 omp 2 -sf intel -v m 0.2 -screen /tmp/in.intel.lj.log
	
3.  In Attached mode: 
       
        $ singularity shell lammps.img
        $ cd /opt/intel/lammps
        $ source /opt/intel/psxe_runtime/linux/bin/compilervars.sh intel64
        $ mpirun -np 40 ./lmp_intel_cpu_intelmpi -in in.intel.lj -log none -pk intel 0 omp 2 -sf intel -v m 0.2 -screen /tmp/in.intel.lj.log

> PS. You can choose to run with your preferred workload. The container should have your home directory mounted or you can bind your preferred directory. [See here](https://singularity.lbl.gov/docs-mount). Or run with the exec command: 

Example to run with your custom workload:

    $ mpirun -np 40 singularity exec lammps.img /opt/intel/lammps/lmp_intel_cpu_intelmpi -in <LOCALDIR>/in.intel.lj -log none -pk intel 0 omp 2 -sf intel -v m 0.2 -screen /tmp/in.intel.lj.log

***

## Run lammps on a cluster:

After you setup your cluster, specify host names to run on in “hosts” file. Here is an example:

### Recommended links:

* [Lammps documentation on Intel platforms](http://lammps.sandia.gov/doc/accelerate_intel.html)
* [Lammps recipe for Intel platforms](https://software.intel.com/en-us/articles/recipe-lammps-for-intel-xeon-phi-processors)



[Optimization Notice.](https://software.intel.com/en-us/articles/optimization-notice#opt-en)

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
    in.intel.dpd     in.intel.lc   in.intel.rhodo  in.intel.tersoff  in.lc_generate_restart
    lmp_intel_cpu_intelmpi

## Get lammps image:

You can pull the lammps container image form the Singularity hub as follow:

	$ singularity pull shub://intel/Intel-HPC-Container:lammps

***
## Run lammps on single node:

1.  In Detached mode:
	
        $ ./intel-Intel-HPC-Container-master-lammps.simg $NUMCORES

This will run the binary lmp_intel_cpu_intelmpi with all the workloads

2.  With the [the exec command](http://singularity.lbl.gov/docs-exec): 

	   $ singularity exec intel-Intel-HPC-Container-master-lammps.simg /opt/intel/lammps ......................
	

***
### Recommended links:

* [Lammps documentation on Intel platforms](http://lammps.sandia.gov/doc/accelerate_intel.html)
* [Lammps recipe for Intel platforms](https://software.intel.com/en-us/articles/recipe-lammps-for-intel-xeon-phi-processors)



[Optimization Notice.](https://software.intel.com/en-us/articles/optimization-notice#opt-en)

# Amrex 

For more information, please visit https://amrex-astro.github.io/Nyx/about.html

## Get amrex image:

		$ singularity pull shub://intel/Intel-HPC-Container:amrex

## Run amrex on single node:

1.  In Detached mode:

		$ source setup.sh
		$ ./intel-Intel-HPC-Container-master-amrex.simg
2.  In Attached mode: 

		$ singularity shell intel-Intel-HPC-Container-master-amrex.simg
		$ cd /temp/

## Run amrex on a cluster

		$ mpirun -hostfile nodes -n 4 -ppn 1 -genv OMP_NUM_THREADS=40 ./intel-Intel-HPC-Container-master-amrex.simg
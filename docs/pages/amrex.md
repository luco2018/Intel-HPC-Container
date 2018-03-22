Amrex

for more information, please visit https://amrex-astro.github.io/Nyx/about.html

1. Get amrex image:
	singularity pull shub://intel/Intel-HPC-Container:amrex

2. Run amrex on single node:

	2.1 In Detached mode:
	source setup.sh
	./intel-Intel-HPC-Container-master-amrex.simg
	2.2 In Attached modeL
	singularity shell intel-Intel-HPC-Container-master-amrex.simg
	cd /temp/

3. Run amrex on a cluster
	mpirun -hostfile nodes -n 4 -ppn 1 -genv OMP_NUM_THREADS=40 ./intel-Intel-HPC-Container-master-amrex.simg

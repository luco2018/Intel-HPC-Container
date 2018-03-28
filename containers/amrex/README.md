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
        $ source /opt/intel/<$runtimecompilerversion>/bin/compilervars.sh intel64
        $./Nyx3d.intel.MPI.OMP.SKLAVX512.ex inputs

## Run amrex on a cluster

        $ mpirun -hostfile nodelist -n 4 -ppn 1 -genv OMP_NUM_THREADS=40 ./intel-Intel-HPC-Container-master-amrex.simg

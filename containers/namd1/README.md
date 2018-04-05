# NAMD

Recommended links:
NAMD user's Guide: http://www.ks.uiuc.edu/Research/namd/2.12/ug/
NAMD recipe for Intel: https://software.intel.com/en-us/articles/recipe-building-namd-on-intel-xeon-and-intel-xeon-phi-processors-on-a-single-node

## Get namd image:

On a system that has Singularity installed:

	$ singularity pull shub://intel/Intel-HPC-Container:namd

## Run namd on single node:

1.  In Detached mode:

        $ ./intel-Intel-HPC-Container-master-namd.simg

2.  In Attached mode: 

        $ singularity shell intel-Intel-HPC-Container-master-namd.simg
        $ cd /temp/
        $ source /opt/intel/<$runtimecompilerversion>/bin/compilervars.sh intel64
        $$BINPATH/namd2 +p 40 $INPUTPATH/apoa1.namd +pemap 0-39

## Run namd on a cluster

        $ mpirun -hostfile nodelist 

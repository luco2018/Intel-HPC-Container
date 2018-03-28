# MILC

For more information, please visit https://github.com/milc-qcd/milc_qcd

## Get milc image:

On a system that has Singularity installed:

          $ singularity pull shub://intel/Intel-HPC-Container:milc

## Run milc on single node:

1.  In Detached mode:

		$ ./intel-Intel-HPC-Container-master-milc.simg
    
2.  In Attached mode: 

        $ singularity shell intel-Intel-HPC-Container-master-milc.simg
        $ cd /temp/
        $ source /opt/intel/<$runtimecompilerversion>/bin/compilervars.sh intel64
        $ mpiexec.hydra -n 8 -env OMP_NUM_THREADS 5 -env KMP_AFFINITY 'granularity=fine,scatter' su3_rhmc_hisq.skx < params.24x24x24x24 
       
See MILC recipe for more details on how to run the binaries: https://software.intel.com/en-us/articles/recipe-building-and-running-milc-on-intel-processors


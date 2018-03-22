# MILC

For more information, please visit https://github.com/milc-qcd/milc_qcd

## Get milc image:

		$ singularity pull shub://intel/Intel-HPC-Container:milc

## Run milc on single node:

1.  In Detached mode:

		$ source setup.sh
		$ ./intel-Intel-HPC-Container-master-milc.simg
    
2.  In Attached mode: 

		$ singularity shell intel-Intel-HPC-Container-master-milc.simg
		$ cd /temp/


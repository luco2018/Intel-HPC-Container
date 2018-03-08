#!/bin/bash

now=`date '+%Y_%m_%d__%H_%M'`
source /opt/intel/compilers_and_libraries_2018.1.163/linux/bin/compilervars.sh
source /opt/intel/impi/2018.1.163/bin64/mpivars.sh

echo "run milc for SKL"
mpiexec.hydra -n 8 $SINGULARITY_ROOTFS/tempdir/su3_rhmd_hisq.skx < $SINGULARITY_ROOTFS/tempdir/params.24x24x24x24 |tee $SINGULARITY_ROOTFS/milc.su3_rhmd_hisq.$now.log

echo "parse milc results to $SINGULARITY_ROOTFS/tempdir"
.$SINGULARITY_ROOTFS/tempdir/parse_milc.sh -l qphix -m flops -r $SINGULARITY_ROOTFS/milc.su3_rhmd_hisq*

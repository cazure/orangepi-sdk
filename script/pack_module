#!/bin/bash
source $PWD/script/orangepi.conf
source $PWD/script/common.sh
message "check kernel soucre ...."
if [ ! -d $OPI_K_source ]
then
	message "soucre not foud !"
	exit 0
fi

message "entry kernel source dir " && cd $OPI_K_source

if [ ! -f .config ]
then 
	message "clear   kernel " && make distclean
	message "config  kernel " && make $OPI_K_config
fi
##build kernel
date
export KERNEL_release=`make -s kernelrelease -C ./`
message "kernel release : $KERNEL_release"
echo ""

##build modules
message "Building modules..." && make  modules
echo ""
##install modules
#message "install modules" && make  headers_install modules_install firmware_install
echo ""

#build mali driver
#message "entry mali driver source dir " && cd $OPI_K_source/modules/mali
#MOD_DIR=$OPI_KERNEL_OUTPUT_DIR/lib/modules/$KERNEL_release
#mkdir -p $MOD_DIR/kernel/drivers/gpu/mali
#mkdir -p $MOD_DIR/kernel/drivers/gpu/ump
#make KERNEL_DIR=$OPI_K_source MOD_DIR=$MOD_DIR  clean 
#make KERNEL_DIR=$OPI_K_source MOD_DIR=$MOD_DIR  build
#make KERNEL_DIR=$OPI_K_source MOD_DIR=$MOD_DIR  install

echo ""
message "build kernel finish,Please to see $OPI_KERNEL_OUTPUT_DIR directories" 
echo "^_^"


#!/bin/bash
#OrangePi linux SDK V3.0
#produced by cazure finish
#Welcome to my website http://www.soilhead.cn/static/orangepi  
##############################################################
VERSION=3
SUBLEVEL=0
#
export OPI_WORK_DIR=$PWD
if [[ ! -f $PWD/board_config ]] ;then
	echo "Please run ./config.sh"
	exit 0
else
	. $PWD/board_config
fi
. $PWD/config/orangepi_sdk_config
. $PWD/script/orangepi_sdk_common

#
if  [[ $1 == "" ]] ; then
	show_help
	exit 0;
fi


# ./orangepi.sh make/build/config/pack/clean
if  [[ $1 == "make" ]] ; then
	case  "$2"  in
	uboot ) 
		echo "+++++build u-boot+++++" | tee  $OPI_OUTPUT_DIR/build_uboot.log
		. $PWD/script/make_uboot 2>&1 | tee -a $OPI_OUTPUT_DIR/build_uboot.log		
		;;
	kernel ) 
		echo "+++++build kernel+++++" | tee  $OPI_OUTPUT_DIR/build_kernel.log
		. $PWD/script/make_kernel 2>&1 | tee -a  $OPI_OUTPUT_DIR/build_kernel.log				
		;;
	busybox ) 
		echo "+++++build busybox+++++" | tee  $OPI_OUTPUT_DIR/build_busybox.log
		. $PWD/script/make_busybox 2>&1 | tee -a  $OPI_OUTPUT_DIR/build_busybox.log				
		;;
	* ) 
		echo "+++++build u-boot+++++" | tee  $OPI_OUTPUT_DIR/build_uboot.log
		. $PWD/script/make_uboot 2>&1 | tee -a $OPI_OUTPUT_DIR/build_uboot.log
		echo "+++++build kernel+++++" | tee  $OPI_OUTPUT_DIR/build_kernel.log
		. $PWD/script/make_kernel 2>&1 | tee -a  $OPI_OUTPUT_DIR/build_kernel.log	
		echo "+++++build busybox+++++" | tee  $OPI_OUTPUT_DIR/build_busybox.log
		. $PWD/script/make_busybox 2>&1 | tee -a  $OPI_OUTPUT_DIR/build_busybox.log				
		;;	
	esac
elif [[ $1 == "config" ]] ; then
	case  "$2"  in
	kernel )
		echo "+++++config kernel+++++" 
		. $PWD/script/config_kernel_source 
		;;
	uboot ) 
		echo "+++++config uboot+++++" 
		. $PWD/script/config_uboot_source
		;; 
	busybox ) 
		echo "+++++config busybox+++++" 
		. $PWD/script/config_busybox_source
		;;
	* ) 
		echo "+++++config uboot ,kernel ,busybox +++++" 
		. $PWD/script/config_kernel_source
		echo ""
		. $PWD/script/config_uboot_source
		echo "" 
		. $PWD/script/config_busybox_source
		;;
	esac
elif [[ $1 == "install" ]] ; then
	case  "$2"  in
	kernel )
		echo "+++++config uboot and kernel +++++" 
		. $PWD/script/config_kernel_source	
		;;
	uboot )
		echo "+++++config uboot and kernel +++++" 
		. $PWD/script/config_kernel_source	
		;;
	rootfs )
		echo "+++++config uboot and kernel +++++" 
		. $PWD/script/config_kernel_source	
		;;
	* )
		echo "+++++config uboot and kernel +++++" 
		. $PWD/script/config_kernel_source	
		;;
	esac
elif [[ $1 == "build" ]] ; then
	case  "$2"  in
	rootfs )
		echo "Script run sudo , Please authorize :"
		. $PWD/script/build_rootfs $OPI_SYSTEM_TYPE $OPI_SYSTEM_VERSION 2>&1 | tee $OPI_OUTPUT_DIR/build_rootfs.log	
		;;
	partition )
		mirror=	
		;;
	* ) 
		mirror=
		;;
	esac
elif [[ $1 == "clean" ]] ; then
	echo "clear sdk..."
	case  "$2"  in
	kernel )
		rm -rf output/kernel/*
		cd $OPI_K_source && make  distclean
		;;
	uboot )
		rm -rf output/dtb/*
		rm -rf output/u-boot/*
		cd $OPI_U_source && make  distclean
		;;
	rootfs ) 
		rm -rf output/rootfs/*
		rm -rf output/sdcard/*
		;;
	busybox ) 
		rm -rf output/busybox/*
		cd $OPI_B_source && make  distclean
		;;
	* )		
		rm -rf output/dtb/*
		rm -rf output/kernel/*
		rm -rf output/u-boot/*
		rm -rf output/busybox/*
		rm -rf output/rootfs/*
		rm -rf output/sdcard/*
		rm -rf output/*.log
		cd $OPI_K_source && make  distclean
		cd $OPI_U_source && make  distclean
		cd $OPI_B_source && make  distclean
		;;
	esac
	echo "clear finish..."
fi



echo ""
exit 0


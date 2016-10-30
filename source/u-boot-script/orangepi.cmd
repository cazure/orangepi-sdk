#gpio set PL10
gpio set PA15
setenv machid 1029
setenv bootm_boot_mode sec

setenv stdout=serial,vga
setenv stderr=serial,vga
#if fatload mmc 0 0x00000000 /.next
#then
#setenv verbosity 7
#else
#setenv verbosity 1
#fi

#setenv bootargs "console=ttyS0,115200 console=tty1 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 cgroup_enable=memory swapaccount=1 sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve=16 hdmi.audio=EDID:0 disp.screen0_output_mode=1920x1080p60 panic=10 consoleblank=0 enforcing=0 loglevel=${verbosity}"

setenv bootargs "console=ttyS0,115200 console=tty1 root=/dev/mmcblk0p2 rootwait rootfstype=ext4 loglevel=7"

#----------------------------------
# Boot loader script to boot with different boot methods for old and new kernel
#----------------------------------
if fatload mmc 0 0x42000000 uInitrd || ext4load mmc 0 0x42000000 /boot/uInitrd || ext4load mmc 0 0x42000000 uInitrd
then
# have uInitrd ,use zImage boot ${fdtfile}
#----------------------------------
	fatload mmc 0 0x46000000 zImage || ext4load mmc 0 0x46000000 /boot/zImage || ext4load mmc 0 0x46000000 zImage
		
	if fatload mmc 0 0x49000000 orangepi.dtb || ext4load mmc 0 0x49000000 /boot/orangepi.dtb || ext4load mmc 0 0x49000000 /orangepi.dtb
	then
		bootz 0x46000000 0x42000000 0x49000000	
	else
		fatload mmc 0 0x43000000 script.bin || ext4load mmc 0 0x43000000 /boot/script.bin || ext4load mmc 0 0x43000000 script.bin
		bootz 0x46000000 0x42000000
	fi
	
#----------------------------------
else
# no uInitrd ,use uImage boot
#----------------------------------
	fatload mmc 0 0x48000000 uImage || ext4load mmc 0 0x48000000 /boot/uImage || ext4load mmc 0 0x48000000 uImage
	
	if fatload mmc 0 0x49000000 orangepi.dtb || ext4load mmc 0 0x49000000 /boot/orangepi.dtb || ext4load mmc 0 0x49000000 /orangepi.dtb
	then
		bootm 0x48000000 - 0x49000000	
	else
		fatload mmc 0 0x43000000 script.bin || ext4load mmc 0 0x43000000 /boot/script.bin || ext4load mmc 0 0x43000000 script.bin
		bootm 0x48000000
	fi
#----------------------------------
fi
# Recompile with:
# mkimage -C none -A arm -T script -d boot.cmd boot.scr
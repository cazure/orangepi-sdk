cmd_/root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi/.install := perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/scsi /root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi xtensa scsi_bsg_fc.h scsi_netlink.h scsi_netlink_fc.h; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/scsi /root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi xtensa ; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/generated/scsi /root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi xtensa ; for F in ; do echo "\#include <asm-generic/$$F>" > /root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi/$$F; done; touch /root/orangepi-sdk-v3.0/output/kernel/usr/include/scsi/.install

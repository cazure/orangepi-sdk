cmd_/root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd/.install := perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/mtd /root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd xtensa inftl-user.h mtd-abi.h mtd-user.h nftl-user.h ubi-user.h; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/mtd /root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd xtensa ; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/generated/mtd /root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd xtensa ; for F in ; do echo "\#include <asm-generic/$$F>" > /root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd/$$F; done; touch /root/orangepi-sdk-v3.0/output/kernel/usr/include/mtd/.install

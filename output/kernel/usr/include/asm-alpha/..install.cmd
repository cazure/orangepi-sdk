cmd_/root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha/.install := perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/arch/alpha/include/asm /root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha alpha a.out.h auxvec.h bitsperlong.h byteorder.h compiler.h console.h errno.h fcntl.h fpu.h gentrap.h ioctl.h ioctls.h ipcbuf.h mman.h msgbuf.h pal.h param.h poll.h posix_types.h ptrace.h reg.h regdef.h resource.h sembuf.h setup.h shmbuf.h sigcontext.h siginfo.h signal.h socket.h sockios.h stat.h statfs.h swab.h sysinfo.h termbits.h termios.h types.h unistd.h; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/arch/alpha/include/asm /root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha alpha ; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/arch/alpha/include/generated/asm /root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha alpha ; for F in ; do echo "\#include <asm-generic/$$F>" > /root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha/$$F; done; touch /root/orangepi-sdk-v3.0/output/kernel/usr/include/asm-alpha/.install

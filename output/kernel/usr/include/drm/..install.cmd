cmd_/root/orangepi-sdk-v3.0/output/kernel/usr/include/drm/.install := perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/drm /root/orangepi-sdk-v3.0/output/kernel/usr/include/drm xtensa drm.h drm_fourcc.h drm_mode.h drm_sarea.h exynos_drm.h i810_drm.h i915_drm.h mga_drm.h nouveau_drm.h r128_drm.h radeon_drm.h savage_drm.h sis_drm.h via_drm.h vmwgfx_drm.h; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/drm /root/orangepi-sdk-v3.0/output/kernel/usr/include/drm xtensa ; perl scripts/headers_install.pl /root/orangepi-sdk-v3.0/source/linux-3.4.112/include/generated/drm /root/orangepi-sdk-v3.0/output/kernel/usr/include/drm xtensa ; for F in ; do echo "\#include <asm-generic/$$F>" > /root/orangepi-sdk-v3.0/output/kernel/usr/include/drm/$$F; done; touch /root/orangepi-sdk-v3.0/output/kernel/usr/include/drm/.install

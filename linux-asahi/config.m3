CONFIG_USB4=m
CONFIG_USB4_APPLE_SOC=m
CONFIG_RESET_APPLE_CIO=m
CONFIG_IIO_AOP_SENSOR_IMU=m
CONFIG_SW_SYNC=y
# CONFIG_DEBUG_PREEMPT is not set
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
CONFIG_VIDEO_APPLE_JPEG=m
CONFIG_VIDEO_APPLE_PRORES=m
CONFIG_VIDEO_APPLE_AVE=m
CONFIG_DRM_ACCEL_APPLE_ANE=m
CONFIG_KPROBE_EVENTS_ON_NOTRACE=y
CONFIG_MAILBOX=y
# trusted keys sealed by the SEP (keyctl add trusted; built in, so the built-in encrypted keys take one as their master)
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_APPLE_SEP=y
# 4 KB processes on the 16 KB kernel (P3S, r207): the personality flag ADDR_PAGE_SIZE_4KB at exec; it needs 47-bit VAs
# CONFIG_ARM64_VA_BITS_48 is not set
CONFIG_ARM64_VA_BITS_47=y
CONFIG_ARM64_PER_PROCESS_PAGE_SIZE=y
# sched_ext, for scx schedulers' A/B (TODO's scx_lavd); idle without one loaded
CONFIG_SCHED_CLASS_EXT=y
# named anonymous mappings (PR_SET_VMA_ANON_NAME): FEX names its allocator's with it, as Arch's kernel allows
CONFIG_ANON_VMA_NAME=y

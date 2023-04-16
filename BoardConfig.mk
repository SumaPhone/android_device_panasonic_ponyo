# inherit from the proprietary version
-include vendor/panasonic/ponyo/BoardConfigVendor.mk

# Call headers from msm-3.0: needed to build libs in hardware/qcom/display
TARGET_SPECIFIC_HEADER_PATH := device/panasonic/ponyo/include

# This define allows a dummy camera device to be built for initial testing. 
USE_CAMERA_STUB := true

#TARGET_BOOTLOADER_BOARD_NAME := ponyo
TARGET_OTA_ASSERT_DEVICE := p01d,ponyo,pana2_1

# Compiler ※linaro gccを使用する場合はex-patchesのdiffファイルを当てるのとlinaro_compilerchecks.mkをbuild/core/にコピーすること
#TARGET_TOOLS_PREFIX := prebuilt/linux-x86/toolchain/gcc-linaro-4.7-2012.10/bin/arm-linux-androideabi-

# SoC defines and Build Flags
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Note about gingerbread compatibility : Require a global cflag,
# several projects use binder's IMemory.h and MemoryHeapBase.h
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT

# Audio
#BOARD_USES_GENERIC_AUDIO := false
#TARGET_PROVIDES_LIBAUDIO := true
#BOARD_USES_QCOM_AUDIO_LPA := true
#BOARD_USES_QCOM_AUDIO_SPEECH := false
#BOARD_USES_QCOM_AUDIO_VOIPMUTE := false
#BOARD_USES_QCOM_AUDIO_RESETALL := false
#BOARD_USES_STEREO_HW_SPEAKER := false
BOARD_USES_QCOM_AUDIO_CALIBRATION := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Qcom Hardware defines and GPS defines
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_QCOM_PMEM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_NO_SECURE_PLAYBACK
BOARD_VENDOR_QCOM_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := qcom
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Graphics
BOARD_EGL_CFG := device/panasonic/ponyo/prebuilt/egl.cfg
#BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
#BOARD_OVERLAY_FORMAT_YCbCr_420_SP := true
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_OVERLAY := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_GENLOCK := true
BOARD_OVERLAY_MINIFICATION_LIMIT := 2

# Webkit
TARGET_FORCE_CPU_UPLOAD := true

#
BOARD_USE_SCREENCAP := true

# Touch screen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# USB Mass Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_UMS_LUNFILE := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p1

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/panasonic/ponyo/recovery/graphics.c
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/panasonic/ponyo/recovery/recovery_keys.c
RECOVERY_RGBX := true

# Sensors
#TARGET_USES_OLD_LIBSENSORS_HAL := true
#TARGET_SENSORS_NO_OPEN_CHECK := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcm4330
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_STA := "/etc/firmware/wlan/sdio.bin"
WIFI_DRIVER_FW_PATH_AP := "/etc/firmware/wlan/sdio.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/etc/firmware/wlan/sdio.bin nvram_path=/data/simcom/nvram.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
TARGET_CUSTOM_WIFI := ../../device/panasonic/ponyo/wifi/wifi.c

# Kernel Boot defines
BOARD_KERNEL_CMDLINE := console=ttyMSM1 androidboot.hardware=qcom
BOARD_KERNEL_BASE := 0x13800000
BOARD_KERNEL_PAGESIZE := 4096

# fix this up by examining /proc/mtd on a running device
#dev:    size   erasesize  name
#mtd0: 00a00000 00040000 "boot"
#mtd1: 15e00000 00040000 "system"
#mtd2: 0c800000 00040000 "cache"
#mtd3: 00100000 00040000 "misc"
#mtd4: 15480000 00040000 "userdata"
#mtd5: 00300000 00040000 "persist"
#mtd6: 00f00000 00040000 "recovery"
#mtd7: 00f00000 00040000 "recovery_m"
#mtd8: 00280000 00040000 "MIBIB"
#mtd9: 00180000 00040000 "SIM_SECURE"
#mtd10: 000c0000 00040000 "FSBL"
#mtd11: 000c0000 00040000 "FSBL_M"
#mtd12: 001c0000 00040000 "OSBL"
#mtd13: 001c0000 00040000 "OSBL_M"
#mtd14: 01a80000 00040000 "AMSS"
#mtd15: 01a80000 00040000 "AMSS_M"
#mtd16: 00c00000 00040000 "EFS2"
#mtd17: 00140000 00040000 "APPSBL"
#mtd18: 00140000 00040000 "APPSBL_M"
#mtd19: 00080000 00040000 "DSP1"
#mtd20: 00740000 00040000 "QDSP_Q5"
#mtd21: 00540000 00040000 "FOTA"
#mtd22: 06200000 00040000 "APPS"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
# HEX(0x00040000) = DEC(262144)
BOARD_FLASH_BLOCK_SIZE := 262144

# Building Kernel
#TARGET_PREBUILT_KERNEL := device/panasonic/ponyo/zImage
TARGET_KERNEL_SOURCE := kernel/panasonic/ponyo_kernel
TARGET_KERNEL_CONFIG := cyanogenmod_ponyo_defconfig

# Building WiFi Kernel Module
KERNEL_EXTERNAL_MODULES:
	make -C device/panasonic/ponyo/bcm4330/dhd/linux/ LINUXDIR=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" dhd-cdc-sdmmc-gpl-debug
	mv device/panasonic/ponyo/bcm4330/dhd/linux/dhd-cdc-sdmmc-gpl-debug-2.6.35.11/dhd.ko $(KERNEL_MODULES_OUT)
TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/alldocube/Zhangwanmini

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
# Check for existing assignment
# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    vbmeta_system \
    odm_dlkm \
    product \
    vbmeta_vendor \
    vendor_dlkm \
    vendor \
    system \
    boot
BOARD_USES_RECOVERY_AS_BOOT :=

#PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_USE_FSCRYPT_POLICY := 2
TW_FORCE_KEYMASTER_VER := true
#TW_SKIP_ADDITIONAL_FSTAB := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += libkeymaster4

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := tb8781p1_64
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 213

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := Zhangwanmini_defconfig
TARGET_KERNEL_SOURCE := kernel/alldocube/Zhangwanmini

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

BOARD_BOOT_HEADER_VERSION = 4

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE=67108864
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := alldocube_dynamic_partitions
BOARD_ALLDOCUBE_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product vendor_dlkm odm_dlkm
BOARD_ALLDOCUBE_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

#PARTITIONS
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_STSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# VNDK
BOARD_VNDK_VERSION := current

# vinf
PRODUCT_ENFORCE_VINTF_MANIFEST := true
PRODUCT_FULL_TREBLE := true

# Platform
TARGET_BOARD_PLATFORM := mt6789

# Enable fastbootd support
TW_INCLUDE_FASTBOOTD := true


# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_NO_RECOVERY := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true


# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

TW_DEVICE_VERSION := OS2-v2 By King-totti85

TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true


TW_INCLUDE_LPTOOLS := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_LPDUMP := true
TW_EXTRA_LANGUAGES := true
TW_FRAMERATE := 60
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_MAX_BRIGHTNESS := 500
TW_DEFAULT_BRIGHTNESS := 40
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_EXCLUDE_TWRPAPP := true
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# MTP
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/usb-ffs/mtp

TW_EXCLUDE_APEX := true
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true

# Resolution
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 1200
TARGET_SCREEN_HEIGHT := 1920

TW_CUSTOM_CPU_TEMP_PATH := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone28/temp"

# Storage
TW_NO_USB_STORAGE := false
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"


# Assertation
TARGET_OTA_ASSERT_DEVICE := iPlay_50_mini_Pro


ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# DTBO
BOARD_KERNEL_SEPARATED_DTBO := true

# Build Hack
BUILD_BROKEN_DUP_RULES := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file


# Example BoardConfig.mk
TARGET_FASTBOOTD_SUPPORT := true

TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

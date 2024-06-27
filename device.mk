#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/alldocube/Zhangwanmini
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true


# Boot control HAL from rom dump
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

# DRM
PRODUCT_PACKAGES += \
	android.hardware.drm@1.4


# Include necessary TWRP components
PRODUCT_PACKAGES += \
    recovery \
    mkbootimg_tools \
    resize2fs_static \
    uncrypt

# device.mk

PRODUCT_PACKAGES += \
    libkeymaster_portable \
    libpuresoftkeymasterdevice

# If there are other dependencies, include them here


# Include Keymint
PRODUCT_PACKAGES += \
    android.hardware.keymint@1.0-service \
    android.hardware.keymint@2.0-service \
    android.hardware.keymint@3.0-service

# Include Keystore2
PRODUCT_PACKAGES += \
    keystore2

# Include Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@4.0-service


# Include lptools in the build
#PRODUCT_PACKAGES += lptools
PRODUCT_PACKAGES += lpverify
#PRODUCT_PACKAGES += mkbootimg
PRODUCT_PACKAGES += sgdisk
# Include necessary libraries for lptools
PRODUCT_PACKAGES += libcutils
PRODUCT_PACKAGES += libbase
PRODUCT_PACKAGES += libandroidfw
PRODUCT_PACKAGES += liblog
PRODUCT_PACKAGES += liblp

#PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_PACKAGES += \
    bootctrl.mt6789

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd



# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service
#PRODUCT_STATIC_BOOT_CONTROL_HAL := \
 #   bootctrl.mt6789 \
  #  libgptutils \
   # libz \
    #libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload


# Add KeyMint HAL and service
PRODUCT_PACKAGES += \
    android.hardware.security.keymint@1.2-impl \
    android.hardware.security.keymint@1.2-service

PRODUCT_USE_DYNAMIC_PARTITIONS := true
#PRODUCT_SHIPPING_API_LEVEL := 32
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
#BOARD_SYSTEMSDK_VERSIONS := 32
# Add keystore2
PRODUCT_PACKAGES += \
    keystore2

# Include the manifest files for VINTF
DEVICE_MANIFEST_FILE := device/alldocube/Zhangwanmini/recovery/root/vendor/vintf/manifest.xml
DEVICE_MATRIX_FILE := device/alldocube/Zhangwanmini/recovery/root/vendor/vintf/compatibility_matrix.xml


# Ensure all dependencies are included
$(call inherit-product-if-exists, vendor/mediatek/build/mt6789/device.mk)

# Include any necessary configurations or additional settings
# Example:
# PRODUCT_COPY_FILES += \
#     device/alldocube/Zhangwanmini/some_config_file:system/etc/some_config_file

# Include any other configurations needed for your device



# Add the library to PRODUCT_PACKAGES
PRODUCT_PACKAGES += libpuresoftkeymasterdevice

# Specify the source location and destination of the library
#PRODUCT_COPY_FILES += \
    recovery/root/vendor/lib/libpuresoftkeymasterdevice.so:system/lib/libpuresoftkeymasterdevice.so

# Include keystore2 and keymint and their dependencies
PRODUCT_PACKAGES += \
    keystore2 \
    android.hardware.security.keymint@1.0-impl \
    android.hardware.security.keymint@1.0-service

# If you have specific paths for keymint or keystore2 dependencies, include them here
#PRODUCT_COPY_FILES += \
 #   device/alldocube/Zhangwanmini/recovery/rooot/vendor/lib64/libkeymint.so:system/lib64/libkeymint.so \
  #  device/alldocube/Zhangwanmini/recovery/rooot/vendor/lib64/libkeystore2_crypto.so:system/lib64/libkeystore2.so \
   # device/alldocube/Zhangwanmini/recovery/rooot/vendor/lib64/libkeystore2_apc_compat.so:system/lib64/libkeystore2.so \
   # device/alldocube/Zhangwanmini/recovery/rooot/vendor/lib64/libkeystore2_aaid:system/lib64/libkeystore2.so

# Add necessary libraries
PRODUCT_PACKAGES += \
    libpuresoftkeymasterdevice \
    keystore2 \
    android.hardware.security.keymint@1.0-impl \
    android.hardware.security.keymint@1.0-service


# Exclude unnecessary components to speed up build


# Disable features not needed in TWRP
BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_WIFI := false
PRODUCT_SUPPORTS_TELEPHONY := false
PRODUCT_SUPPORTS_LOCATION := false
BOARD_HAVE_NFC := false
PRODUCT_SUPPORTS_AUDIO := false

# Limit build to specific architectures
TARGET_ARCH := arm64

# Enable ccache
USE_CCACHE := 1


# Use parallel builds
MAKE_FLAGS += -j$(nproc)

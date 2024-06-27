#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from Zhangwanmini device
$(call inherit-product, device/alldocube/Zhangwanmini/device.mk)

PRODUCT_DEVICE := Zhangwanmini
PRODUCT_NAME := twrp_Zhangwanmini
PRODUCT_BRAND := ALLDOCUBE
PRODUCT_MODEL := Zhangwanmini
PRODUCT_MANUFACTURER := alldocube

PRODUCT_GMS_CLIENTID_BASE := android-alldocube

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Zhangwanmini-user 12 SP1A.210812.016 1706795665 release-keys"

BUILD_FINGERPRINT := SENSETALK/ACM-T01K/ACM-T01K:12/SP1A.210812.016/1706795665:user/release-keys

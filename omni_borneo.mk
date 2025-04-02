#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 720p

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/motorola/borneo/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := omni_borneo
PRODUCT_DEVICE := borneo
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g power (2021)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="borneo_retail-user 11 RZBS31.Q2-143-27-25 418ef release-keys" \
    BuildFingerprint=motorola/borneo_retail/borneo:11/RZBS31.Q2-143-27-25/418ef:user/release-keys \
    DeviceProduct=borneo_retail

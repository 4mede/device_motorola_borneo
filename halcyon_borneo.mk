#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Halcyon Project stuff.
$(call inherit-product, vendor/halcyon/config/common.mk)
TARGET_BOOT_ANIMATION_RES := 720

# Inherit from ViPER4AndroidFX
 $(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

# Inherit from device
$(call inherit-product, device/motorola/borneo/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := halcyon_borneo
PRODUCT_DEVICE := borneo
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g power (2021)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="borneo_retail-user 11 RZBS31.Q2-143-27-25 418ef release-keys" \
    BuildFingerprint=motorola/borneo_retail/borneo:11/RZBS31.Q2-143-27-25/418ef:user/release-keys \
    DeviceProduct=borneo_retail

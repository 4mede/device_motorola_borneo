#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/motorola/borneo/device.mk)

# Inherit some common Flare stuff.
$(call inherit-product, vendor/flare/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := flare_borneo
PRODUCT_DEVICE := borneo
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g power (2021)
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="borneo_retail-user 11 RZBS31.Q2-143-27-25 418ef release-keys" \
    BuildFingerprint=motorola/borneo_retail/borneo:11/RZBS31.Q2-143-27-25/418ef:user/release-keys \
    DeviceProduct=borneo_retail

# Flare Flags
FLARE_BUILD_TYPE := UNOFFICIAL
FLARE_MAINTAINER := b
TARGET_BOOT_ANIMATION_RES := 720
TARGET_ENABLE_BLUR := false
TARGET_FACE_UNLOCK_SUPPORTED := true
WITH_GAPPS := true


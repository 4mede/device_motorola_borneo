#
# SPDX-FileCopyrightText: 2022-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/borneo
KERNEL_PATH := device/motorola/borneo-kernel

# A/B
AB_OTA_PARTITIONS += \
    recovery

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := borneo

# Broken
BUILD_BROKEN_DUP_SYSPROP := true

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
ODM_MANIFEST_SKUS += b f
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/sku/manifest_b.xml
ODM_MANIFEST_F_FILES := $(DEVICE_PATH)/sku/manifest_f.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
TARGET_PREBUILT_KERNEL := device/motorola/borneo-kernel/kernel
PRODUCT_COPY_FILES += \
    $(KERNEL_PATH)/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(KERNEL_PATH)/dtbo.img:$(TARGET_COPY_OUT)/dtbo.img

# Fix prebuilt build
$(shell mkdir -p $(OUT_DIR)/target/product/borneo/obj/KERNEL_OBJ/usr)

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := borneo

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 102400000

BOARD_SUPER_PARTITION_SIZE := 10027008000
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 5009309696 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 70

# Security patch level
BOOT_SECURITY_PATCH := 2023-02-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 20

# Inherit from the proprietary version
include vendor/motorola/borneo/BoardConfigVendor.mk

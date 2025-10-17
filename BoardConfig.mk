#
# SPDX-FileCopyrightText: The LineageOS Project, Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
include device/motorola/sm6225-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/borneo
    
# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := borneo

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
ODM_MANIFEST_SKUS += b f
ODM_MANIFEST_B_FILES := $(DEVICE_PATH)/configs/vintf/manifest_b.xml
ODM_MANIFEST_F_FILES := $(DEVICE_PATH)/configs/vintf/manifest_f.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 2
KERNEL_DEFCONFIG := borneo_defconfig

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := borneo

# Partitions
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 102400000

BOARD_SUPER_PARTITION_SIZE := 10027008000
BOARD_MOTO_DYNAMIC_PARTITIONS_SIZE := 5009309696 # (BOARD_SUPER_PARTITION_SIZE / 2) - 4MB

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/props/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

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

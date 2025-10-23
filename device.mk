#
# SPDX-FileCopyrightText: The LineageOS Project, Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
$(call inherit-product, device/motorola/sm6225-common/common.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota_retrofit.mk)

AB_OTA_PARTITIONS += \
    recovery

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)
    
PRODUCT_ODM_PROPERTIES += \   
    persist.vendor.audio.fluence.voicecall=false

PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.audio.dualmic.config=endfire \
    ro.audio.monitorRotation=true

PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.default_name=Motorola Moto G Power (2021)
    
# Camera
PRODUCT_PACKAGES += \
    libcamera_provider_shim \
    libpiex_shim
  
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.physical.num=4

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.set_idle_timer_ms=1100 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.device.rc \
    init.oem.fingerprint.sh \
    init.oem.fingerprint2.sh \
    init.mmi.overlay.rc \
    init.recovery.touch.rc
    
# Keymaster
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.keystore_desede=true

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage
    
# Moto Camera 4
TARGET_MOTCAMERA3 := borneo
TARGET_USES_MOTCAMERA3 := true

$(call inherit-product, vendor/motorola/MotCamera4-bengal/motcamera4.mk)

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineagePlatformDevice \
    SystemUIResDevice \
    WifiResDevice

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Radio
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.radio.imei.sv=33

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Get non-open-source specific aspects
$(call inherit-product, vendor/motorola/borneo/borneo-vendor.mk)

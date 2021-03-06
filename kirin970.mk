#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product-if-exists, vendor/huawei/kirin970-common/kirin970-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    bootctl \
    vintf

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# Device init scripts
PRODUCT_PACKAGES += \
#    init.bcm43xx.rc \
#    init.hisi.rc \
    init.kirin970.rc \
#    init.kirin970.ab.rc \
    init.kirin970.environ.rc \
    init.kirin970.post_boot.sh
#    init.aptouch.rc

# Display
PRODUCT_PACKAGES += \
    libion

SELINUX_IGNORE_NEVERALLOWS := true

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null \
    ro.vendor.override.security_patch=$(PLATFORM_SECURITY_PATCH) \
    ro.vendor.override.build_display=$(BUILD_ID)

# Radio
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext

# Offline charging
#PRODUCT_PACKAGES += \
#    charger_res_images
# Fix Offline Charging on Huawmeme
PRODUCT_PACKAGES += \
	huawei-charger
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/kirin970-common/huawei_charger/files,system/etc/charger)

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# System-as-Root
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init/apex-setup.rc:system/etc/init/apex-setup.rc

PRODUCT_COPY_FILES += \
    system/core/rootdir/init.zygote32.rc:system/etc/init/zygote/init.zygote32.rc \
    system/core/rootdir/init.zygote32_64.rc:system/etc/init/zygote/init.zygote32_64.rc \
    system/core/rootdir/init.zygote64_32.rc:system/etc/init/zygote/init.zygote64_32.rc \
    system/core/rootdir/init.zygote64.rc:system/etc/init/zygote/init.zygote64.rc

# Release tools
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/releasetools/releasetools.kirin970.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/releasetools.kirin970.sh

# Selinux
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/sepolicy/27.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/27.0.cil

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.kirin970

# VNDK
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/vndk-compat/ld.config.26.txt:system/etc/ld.config.26.txt \
#    $(LOCAL_PATH)/vndk-compat/llndk.libraries.26.txt:system/etc/llndk.libraries.26.txt \
#    $(LOCAL_PATH)/vndk-compat/vndksp.libraries.26.txt:system/etc/vndksp.libraries.26.txt \
#    $(LOCAL_PATH)/vndk-compat/ld.config.27.txt:system/etc/ld.config.27.txt

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk/ld.config.26.txt:system/etc/ld.config.26.txt

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2

PRODUCT_COPY_FILES += \
    frameworks/av/apex/mediaswcodec.rc:system/etc/init/mediaswcodec-treble.rc \
    $(LOCAL_PATH)/rootdir/etc/init.kirin970.environ.rc:system/etc/init/init.kirin970.environ.rc \
    $(LOCAL_PATH)/rootdir/bin/init.kirin970.post_boot.sh:system/bin/init.kirin970.post_boot.sh

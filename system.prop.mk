
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

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.bt.unsupport.features=00000001 \
    persist.sys.bt.unsupport.states=000000000000000000000011111 \
    persist.sys.bt.unsupport.stdfeatures=000001

# GPU
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.profile=true \
    debug.sf.latch_unsignaled=1

# SDCardFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=0

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.ffs.mtp.ready=1 \
    persist.sys.usb.config=adb \
    ro.cust.cdrom=/dev/null

# VNDK
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vndk.version=26 \
    ro.product.first_api_level=26 \

# Override props
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
	ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
	ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
	ro.build.version.release=$(PLATFORM_VERSION) \
	ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
	ro.adb.secure=0 \
	ro.logd.auditd=true

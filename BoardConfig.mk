#
# Copyright (C) 2015 The CyanogenMod Project
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

TARGET_SPECIFIC_HEADER_PATH := device/hp/bowser/include

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bowser
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_FAMILY := t11x
TARGET_TEGRA_VERSION := t114

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=bowser rtl8723bs.ifname=wlan0 rtl8723bs.if2name=p2p0 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME = zImage
LZMA_RAMDISK_TARGETS := boot,recovery
TARGET_KERNEL_CONFIG := tegra11_bowser_android_defconfig
TARGET_KERNEL_SOURCE := kernel/hp/bowser

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVOICE := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/hp/bowser/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/hp/bowser/bluetooth/vnd_bowser.txt
BOARD_GLOBAL_CFLAGS += -DRTL_8723BS_BT_USED
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_RTK := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Display
BOARD_HAS_NVDPS := true
BOARD_HDMI_MIRROR_MODE := Scale

# Graphics
USE_OPENGL_RENDERER := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# HIDL
DEVICE_MANIFEST_FILE := device/hp/bowser/manifest.xml
DEVICE_MATRIX_FILE :=  device/hp/bowser/compatibility_matrix.xml

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Malloc
MALLOC_SVELTE := true

# Partition
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 #8MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 2147483648 #2gb
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 #8MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824 #1GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12614369280 #12GB
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

# Power
#TARGET_POWERHAL_VARIANT := tegra

# Recovery
BOARD_NO_SECURE_DISCARD := true
TARGET_RECOVERY_DENSITY := hdpi
TARGET_RECOVERY_DEVICE_DIRS += device/hp/bowser
TARGET_RECOVERY_FSTAB := device/hp/bowser/rootdir/etc/fstab.bowser

# Secure OS
SECURE_OS_BUILD := y
BOARD_VENDOR_HDCP_ENABLED := true
BOARD_ENABLE_SECURE_HDCP := 1

# SELinux
#BOARD_SEPOLICY_DIRS += \
#    device/hp/bowser/sepolicy

# Wifi
BOARD_WLAN_DEVICE                := rtl
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_rtl
WIFI_DRIVER_FW_PATH_PARAM        := ""

TW_THEME := landscape_hdpi
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/pwm-backlight/brightness"
TW_CUSTOM_BATTERY_PATH := "/sys/devices/platform/tegra11-i2c.0/i2c-0/0-000b/power_supply/sbs-0-000b"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone5/temp"
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_SYNTOUCHPAD := true
TW_NO_SCREEN_TIMEOUT := true

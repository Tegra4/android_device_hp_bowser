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
TARGET_TEGRA_VERSION := t114

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=bowser rtl8723bs.ifname=wlan0 rtl8723bs.if2name=p2p0 androidboot.selinux=permissive
TARGET_KERNEL_SOURCE := kernel/hp/bowser
TARGET_KERNEL_CONFIG := tegra11_bowser_android_defconfig

# Audio
TARGET_TINY_ALSA_IGNORE_SILENCE_SIZE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/hp/bowser/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/hp/bowser/bluetooth/vnd_bowser.txt
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_RTK := true
BLUETOOTH_HCI_USE_RTK_H5 := true

# Graphics
USE_OPENGL_RENDERER := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Malloc
MALLOC_IMPL := dlmalloc

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 #8MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 #8MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824 #1GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12614369280 #12GB
BOARD_FLASH_BLOCK_SIZE := 4096

# Power
TARGET_POWERHAL_VARIANT := tegra

# Pre-L blob support
COMMON_GLOBAL_CFLAGS += \
  -DADD_LEGACY_MEMORY_DEALER_CONSTRUCTOR_SYMBOL \
  -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_CUSTOM_BOOTIMG_MK := device/hp/bowser/shbootimg.mk
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_DEVICE_DIRS += device/hp/bowser
TARGET_RECOVERY_FSTAB := device/hp/bowser/rootdir/etc/fstab.bowser

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/hp/bowser/sepolicy

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

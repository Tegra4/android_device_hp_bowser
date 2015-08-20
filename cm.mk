# Inherit device configuration for bowser.
$(call inherit-product, device/hp/bowser/full_bowser.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := cm_bowser

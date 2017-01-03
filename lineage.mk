# Inherit device configuration for bowser.
$(call inherit-product, device/hp/bowser/full_bowser.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="hp/bowser/200a:4.4.2/4.4.2-17r25.1-11-11/17r25.1-11-11:user/release-keys" \
    PRIVATE_BUILD_DESC="bowser-user 4.4.2 4.4.2-17r25.1-11-11 17r25.1-11-11 release-keys"

PRODUCT_NAME := lineage_bowser

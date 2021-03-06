$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, device/softwinner/astar-common/astar-common.mk)
$(call inherit-product-if-exists, device/softwinner/astar-h7/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/softwinner/astar-h7/overlay \
                           $(DEVICE_PACKAGE_OVERLAYS)

PRODUCT_PACKAGES += \
    ESFileExplorer \
    VideoPlayer \
    Bluetooth

PRODUCT_COPY_FILES += \
    device/softwinner/astar-h7/kernel:kernel \
    device/softwinner/astar-h7/fstab.sun8i:root/fstab.sun8i \
    device/softwinner/astar-h7/init.sun8i.rc:root/init.sun8i.rc \
    device/softwinner/astar-h7/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc \
    device/softwinner/astar-h7/ueventd.sun8i.rc:root/ueventd.sun8i.rc \
    device/softwinner/astar-h7/recovery.fstab:recovery.fstab \
    device/softwinner/astar-h7/modules/modules/nand.ko:root/nand.ko \
    device/softwinner/astar-h7/modules/modules/disp.ko:root/disp.ko \
    device/softwinner/astar-h7/modules/modules/lcd.ko:root/lcd.ko \
    device/softwinner/astar-h7/modules/modules/sunxi-keyboard.ko:obj/sunxi-keyboard.ko \
    device/softwinner/astar-h7/modules/modules/sw-device.ko:obj/sw-device.ko \
    device/softwinner/astar-h7/modules/modules/gt9xxf_ts.ko:obj/gt9xxf_ts.ko

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Low mem(memory <= 512M) device should not copy android.software.managed_users.xml
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml

PRODUCT_COPY_FILES += \
    device/softwinner/astar-h7/configs/camera.cfg:system/etc/camera.cfg \
    device/softwinner/astar-h7/configs/gsensor.cfg:system/usr/gsensor.cfg \
    device/softwinner/astar-h7/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/softwinner/astar-h7/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
    device/softwinner/astar-h7/configs/tp.idc:system/usr/idc/tp.idc

PRODUCT_COPY_FILES += \
    device/softwinner/astar-h7/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf
	
# bootanimation
PRODUCT_COPY_FILES += \
	device/softwinner/astar-h7/media/bootanimation.zip:system/media/bootanimation.zip

# camera config for camera detector
PRODUCT_COPY_FILES += \
        device/softwinner/astar-h7/hawkview/sensor_list_cfg.ini:system/etc/hawkview/sensor_list_cfg.ini

# Radio Packages and Configuration Flie
$(call inherit-product, device/softwinner/common/rild/radio_common.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/huawei/mu509/huawei_mu509.mk)
#$(call inherit-product, device/softwinner/common/ril_modem/Oviphone/em55/oviphone_em55.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.storage_type = emulated

PRODUCT_PROPERTY_OVERRIDES += \
   ro.frp.pst=/dev/block/by-name/frp

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.adb.secure=1 \
    ro.sys.mutedrm=true \
    rw.logger=0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=384m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=64m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m \
    ro.zygote.disable_gl_preload=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=213

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Asia/Shanghai \
    persist.sys.country=CN \
    persist.sys.language=zh

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := tvdpi xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := tvdpi

$(call inherit-product-if-exists, vendor/google/products/gms_base.mk)

PRODUCT_BRAND := Allwinner
PRODUCT_NAME := astar_h7
PRODUCT_DEVICE := astar-h7
PRODUCT_MODEL := QUAD-CORE A33 h7
PRODUCT_MANUFACTURER := Allwinner

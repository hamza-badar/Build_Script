echo "Welcome to Build Script"

cd ~/rom

echo "clonning trees"
https://github.com/hamza-badar/device_motorola_otus -b 7.1.1 device/motorola/otus

echo "clonning common trees"
https://github.com/hamza-badar/android_device_motorola_msm8610-common.git -b aex device/motorola/msm8610-common

echo "clonning vendor"
git clone https://github.com/TheMuppets/proprietary_vendor_motorola.git -b cm-14.1 vendor/motorola

echo "clonning binaries"
git https://github.com/hamza-badar/proprietary_vendor_qcom_binaries -b cm-14.1 vendor/qcom/binaries

echo "clonning kernel"
git clone https://github.com/LineageOS/android_kernel_motorola_msm8610.git -b cm-14.1 kernel/motorola/msm8610

echo"clonning devicesettings"
git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b cm-14.1 packages/resources/devicesettings

echo "clonning qcom/common"
git clone https://github.com/LineageOS/android_device_qcom_common.git -b cm-14.1 device/qcom/common

echo "changing host and user"
export KBUILD_BUILD_USER=Hamza_Badar
export KBUILD_BUILD_HOST=Azazel™

echo "starting compilation"
. build/envsetup.sh
lunch aosp_otus-userdebug
mka aex

echo "build done"

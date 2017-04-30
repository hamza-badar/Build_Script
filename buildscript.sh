echo "Welcome to Build Script"

cd ~/rom

echo "clonning trees"
git clone https://github.com/hamza-badar/device_motorola_otus.git -b pure device/motorola/otus

echo "clonning common trees"
git clone https://github.com/hamza-badar/android_device_motorola_msm8610-common.git -b pure device/motorola/msm8610-common

echo "clonning binaries"
git clone https://github.com/TheMuppets/proprietary_vendor_qcom_binaries.git -b cm-14.1 vendor/qcom/binaries

echo "clonning kernel"
git clone https://github.com/LineageOS/android_kernel_motorola_msm8610.git -b cm-14.1 kernel/motorola/msm8610

echo "removing binaries conflicts"
cd vendor/qcom/binaries
git revert 63fbdf157d98c52a7ad33fde539c841feb566b92
cd ~/rom

echo "fixing developer option struck issue"
cd packages/apps/Settings
git fetch https://github.com/halogenOS/android_packages_apps_Settings XOS-7.1-old
git cherry-pick 2d735d5a056f474afbb0e1e5d5ca353dc0777c4f
cd ~/rom

echo "changing host and user"
export KBUILD_BUILD_USER=Hamza_Badar
export KBUILD_BUILD_HOST=Azazel™

echo "starting compilation"
. build/envsetup.sh
lunch otus-userdebug
mka bacon

echo "build done"
echo "changing directory to ROM zip location"
cd out/target/product/otus

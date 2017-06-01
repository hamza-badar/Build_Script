echo "Welcome to Build Script"

cd ~/rom

echo "debloating vendor"
cd vendor/cm
git fetch https://github.com/hamza-badar/android_vendor_resurrection nougat
git cherry-pick d45d8df06db05f56af45c0f20adf8a4abdbc1411
git cherry-pick 2da5b4e9ef6962801520560fe5b9cf1881042bde
git cherry-pick 22862b11eb2314c88bc59a63aea902263e14da8b
git cherry-pick 508e601b22a2a314a72052808487e4fd1033bb99
cd ~/rom

echo "debloating build"
cd build
git fetch https://github.com/hamza-badar/android_build nougat
git cherry-pick b11f960ba3feec732686f7e0b0367a7ea0cc591d
cd ~/rom

echo "clonning trees"
git clone https://github.com/LineageOS/android_device_motorola_otus.git -b cm-14.1 device/motorola/otus

echo "clonning common trees"
git clone https://github.com/LineageOS/android_device_motorola_msm8610-common.git -b cm-14.1 device/motorola/msm8610-common

echo "clonning vendor"
git clone https://github.com/TheMuppets/proprietary_vendor_motorola.git -b cm-14.1 vendor/motorola

echo "clonning binaries"
git clone https://github.com/TheMuppets/proprietary_vendor_qcom_binaries.git -b cm-14.1 vendor/qcom/binaries

echo "clonning kernel"
git clone https://github.com/LineageOS/android_kernel_motorola_msm8610.git -b cm-14.1 kernel/motorola/msm8610

echo"clonning devicesettings"
git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b cm-14.1 packages/resources/devicesettings

echo "clonning qcom/common"
git clone https://github.com/LineageOS/android_device_qcom_common.git -b cm-14.1 device/qcom/common

echo "removing binaries conflicts"
cd vendor/qcom/binaries
git revert 63fbdf157d98c52a7ad33fde539c841feb566b92
cd ~/rom

echo  "cherry-picking gesture icon"
cd device/motorola/otus
git fetch https://github.com/hamza-badar/device_motorola_otus pure
git cherry-pick 594b342dbdd906c3a79c6cc717e31253d7bfee78
git cherry-pick 5e826409fa0d0c1bf5bebc4ef0fc06167bd6e51f
cd ~/rom

echo "remove snap and fm"
nano device/motorola/msm8610-common/msm8610.mk

echo "changing host and user"
export KBUILD_BUILD_USER=Hamza_Badar
export KBUILD_BUILD_HOST=Azazel™

echo "starting compilation"
. build/envsetup.sh
lunch lineage_otus-userdebug
mka bacon

echo "build done"

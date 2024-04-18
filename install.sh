# /bin/bash

cd /usr/src/app
echo [exe] rm -rfv UnrealEngine-carla
rm -rfv UnrealEngine-carla
echo [exe] unzip cache/UnrealEngine-carla.zip
unzip cache/UnrealEngine-carla.zip

cd /usr/src/app/UnrealEngine-carla
echo [exe] Setup.sh
./Setup.sh
echo [exe] GenerateProjectFiles.sh
./GenerateProjectFiles.sh
echo [exe] make -j 4
make -j 4
echo [exe] bash Engine/Build/BatchFiles/Linux/Build.sh ShaderCompileWorker Linux Development
bash Engine/Build/BatchFiles/Linux/Build.sh ShaderCompileWorker Linux Development

cd /usr/src/app
echo [exe] rm -rfv carla-simulator
rm -rfv carla-simulator
echo [exe] unzip cache/CARLA_0.9.14.zip
unzip cache/CARLA_0.9.14.zip
echo [exe] mv -v carla-0.9.14 carla-simulator
mv -v carla-0.9.14 carla-simulator

export UE4_ROOT=/usr/src/app/UnrealEngine-carla
cd /usr/src/app/carla-simulator
# echo [exe] Update.sh
# ./Update.sh
echo [exe] tar -xvzf ../cache/20221201_5ec9328.tar.gz -C Unreal/CarlaUE4/Content/Carla
tar -xvzf ../cache/20221201_5ec9328.tar.gz -C Unreal/CarlaUE4/Content/Carla
echo [exe] make -j 4 PythonAPI
make -j 4 PythonAPI
echo [exe] make -j 4 launch
make -j 4 launch

echo [exe] cp -v ../cache/AdditionalMaps_0.9.14.tar.gz Import/AdditionalMaps_0.9.14.tar.gz
cp -v ../cache/AdditionalMaps_0.9.14.tar.gz Import/AdditionalMaps_0.9.14.tar.gz
echo [exe] cp -v ../cache/CARLA_0.9.14_RSS.tar.gz Import/CARLA_0.9.14_RSS.tar.gz
cp -v ../cache/CARLA_0.9.14_RSS.tar.gz Import/CARLA_0.9.14_RSS.tar.gz
echo [exe] bash ImportAssets.sh
bash ImportAssets.sh

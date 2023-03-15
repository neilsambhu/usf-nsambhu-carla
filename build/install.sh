# /bin/bash

echo [exe] rm -rf /usr/src/app/UnrealEngine
rm -rf /usr/src/app/UnrealEngine
cd /usr/src/app/
7z x /usr/src/cache/UnrealEngine.zip

cd /usr/src/app/UnrealEngine
echo [exe] Setup.sh
./Setup.sh
echo [exe] GenerateProjectFiles.sh
./GenerateProjectFiles.sh
echo [exe] make -j 4
make -j 4
echo [exe] bash Engine/Build/BatchFiles/Linux/Build.sh ShaderCompileWorker Linux Development
bash Engine/Build/BatchFiles/Linux/Build.sh ShaderCompileWorker Linux Development

rm -rfv /usr/src/app/carla
cd /usr/src/app/
7z x /usr/src/cache/carla.zip

export UE4_ROOT=/usr/src/app/UnrealEngine

cd /usr/src/app/carla
git checkout 0.9.13
git checkout f628f204b44ca5f416e4d54eedfea3f9dc4a86c4 Util/BuildTools/Setup.sh
cp -R /usr/src/cache/Content.tar.gz /usr/src/app/Content.tar.gz
echo [exe] Update.sh
./Update.sh
echo [exe] make -j 4 PythonAPI
make -j 4 PythonAPI
echo [exe] make -j 4 launch
make -j 4 launch

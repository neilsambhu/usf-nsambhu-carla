
# Getting Started


### Building the container enviroment

```
git clone https://github.com/jadorno/usf-nsambhu-carla-source.git
docker build -t usf-nsambhu-carla /mnt/storage00/research/usf-nsambhu-carla
```

### Downloading assets

```
mkdir -v usf-nsambhu-carla/cache
cd usf-nsambhu-carla/cache
wget  -O UnrealEngine-carla.zip "https://github.com/CarlaUnreal/UnrealEngine/archive/refs/heads/carla.zip"
wget -O CARLA_0.9.14.zip "https://github.com/carla-simulator/carla/archive/refs/tags/0.9.14.zip"
wget "https://carla-releases.s3.us-east-005.backblazeb2.com/Linux/AdditionalMaps_0.9.14.tar.gz"
wget "https://carla-releases.s3.us-east-005.backblazeb2.com/Linux/CARLA_0.9.14_RSS.tar.gz"
wget "https://carla-assets.s3.us-east-005.backblazeb2.com/20221201_5ec9328.tar.gz"
```


### Building Carla

```
docker run -it -v /mnt/storage00/research/usf-nsambhu-carla:/usr/src/app --entrypoint="/bin/bash" usf-nsambhu-carla install.sh
```

### Running Carla

```
xhost +
docker run -it --rm --runtime=nvidia --gpus='"device=1","capabilities=graphics,utility,display,video,compute"' -e UE4_ROOT=/usr/src/app/UnrealEngine-carla -e DISPLAY=:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/storage00/research/usf-nsambhu-carla:/usr/src/app --entrypoint='/bin/bash' usf_nsambhu_carla_source -c 'cd /usr/src/app/carla-simulator ; make -j 4 launch'
```

docker stop usf_nsambhu_carla_build
docker rm usf_nsambhu_carla_build
xhost +
docker run -it --rm --runtime=nvidia --gpus='"device=1","capabilities=graphics,utility,display,video,compute"' -e UE4_ROOT=/usr/src/app/UnrealEngine -e DISPLAY=:2.0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/storage00/research/usf-nsambhu/carla-source/workspace:/usr/src/app --entrypoint='/bin/bash' --name=usf_nsambhu_carla_build usf_nsambhu_carla_source -c 'cd /usr/src/app/carla ; make -j 4 launch'

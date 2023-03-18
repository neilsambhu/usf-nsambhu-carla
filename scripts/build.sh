docker stop usf_nsambhu_carla_build
docker rm usf_nsambhu_carla_build

docker build -t usf_nsambhu_carla_source /mnt/storage00/research/usf-nsambhu/carla-source/build/

docker run -itd -v /mnt/storage00/research/usf-nsambhu/carla-source/workspace:/usr/src/app --entrypoint='/bin/bash' --name=usf_nsambhu_carla_build usf_nsambhu_carla_source /usr/src/install/install.sh

docker logs --follow usf_nsambhu_carla_build
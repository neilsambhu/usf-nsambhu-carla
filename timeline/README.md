# CIRCE CARLA
5/6/2024 5:53 PM: install Singularity.  
5/6/2024 5:53 PM: clone usf-nsambhu-carla repository.  
5/6/2024 5:55 PM: build docker image  
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/
```
5/6/2024 5:55 PM: build \*.sif file.  
```
sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:latest
```
5/6/2024 6:05 PM: copy carla.sif to remote.  
```
scp carla.sif nsambhu@circe:~/
```
5/7/2024 12:35 pm: login to circe. add module.  
```
module purge && \
module add apps/singularity/3.5.3
```
5/7/2024 4:47 PM: new copy carla.sif to remote.  
```
scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/7/2024 4:47 PM: run carla.sif
```
singularity run carla.sif
```
## Make container and send to CIRCE
5/7/2024 4:57 PM: pipeline
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && \
sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:latest && \
scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/7/2024 6:40 PM: remove old image
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && \
sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:latest && \
scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
## Use CARLA Docker documentation
5/9/2024 2:49 PM: navigate to directory for Docker CARLA
```
(carla_py3.9) nsambhu@SAMBHU25:~/github/carla$ cd Util/Docker
```
5/9/2024 2:55 PM: docker build
```
docker build --build-arg EPIC_USER=neilsambhu --build-arg EPIC_PASS=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 -t carla-prerequisites -f Prerequisites.Dockerfile .
```
5/10/2024 12:56 PM: TODO: understand docker build  
5/10/2024 1:15 PM: current: build and list current directory. 
next: change build instructions  
5/10/2024 2:11 PM: docker filesystem "/home/"
```
[nsambhu@itn1 usf-nsambhu-carla]$ singularity run carla.sif 
total 0
drwxr-xr-x 3 root    root    78 May 10 11:46 carla
drwxr-xr-x 3 nsambhu usfuser 60 May 10 14:10 n
```
5/10/2023 3:16 PM: create carla user to have .ssh directory. TODO: use nsambhu user.  
5/10/2024 5:20 PM: TODO: copy Unreal Engine directory from SAMBHU25 to docker image.  
5/10/2024 8:00 PM: build command
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:latest && scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 9:28 pm: scp copy Unreal Engine repository to CIRCE
```
scp -r $HOME/UnrealEngine_4.26 nsambhu@circe:~/
```
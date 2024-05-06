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
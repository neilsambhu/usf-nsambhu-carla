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
~5/10/2024 9:46 PM: Docker build instructions with access to home directory~
~5/10/2024 9:53 PM: singularity update option~
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build --update carla.sif docker-daemon://usf-nsambhu-carla:latest && scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 9:53 PM: singularity sandbox option
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build --sandbox carla.sif docker-daemon://usf-nsambhu-carla:latest && scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 10:10 PM: new sandbox update with recursive file transfer
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build --sandbox --update carla docker-daemon://usf-nsambhu-carla:latest && scp -r carla nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 10:16 PM: transferring files from carla directory to circe takes too long
```
sudo docker build -t usf-nsambhu-carla /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:latest && scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 10:20PM: local carla sandbox build
```
sudo docker build -t usf-nsambhu-carla:local /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build --sandbox --update carla docker-daemon://usf-nsambhu-carla:local && singularity run carla
```
5/10/2024 10:26 PM: remote carla build
```
sudo docker build -t usf-nsambhu-carla:remote /home/nsambhu/github/usf-nsambhu-carla-source/ && sudo singularity build carla.sif docker-daemon://usf-nsambhu-carla:remote && scp carla.sif nsambhu@circe:~/github/usf-nsambhu-carla
```
5/10/2024 10:36 PM: carla container keeps printing $HOME. Trying to rebuild without cache.  
5/10/2024 10:40 PM: carla keeps printing $HOME. I will stick to the remote carla build.  
5/11/2024 7:22 PM: TODO: make nsambhu user account in Dockerfile > create Dockerfile in stages 
5/13/2024 9:28 AM: cleanup circe file count
```
rm -rf Algorithms        cp_script.sh      OutputTest1         slurm-11684612.out  slurm-11781289.out Combine_NP_2.py               slurm-11678109.out  slurm-11687476.out  slurm-11781346.out Combine_NP.py     JPEG_to_NP_2.py   slurm-11680211.out  slurm-11691748.out  tar_script.sh Combine_NP.pyc    load_np.py        slurm-11680213.out  slurm-11780784.out   copy_tar.sh       NumpyArrayOutput  slurm-11680779.out  slurm-11780854.out  v2j.sh COT4400_Project3  op_test2          slurm-11683748.out  slurm-11781022.out
```
```
[nsambhu@itn0 ~]$ myquota

RC Filesystem Current Quota Utilization:
Date: Mon May 13 09:30:10 EDT 2024


Filesystem        Space Used  Space Quota  % of Quota  File Count  File Count Quota  % of Quota
CIRCE /home       42.24 GB    2.00 TB      2%          204790      204800            99% 
shares            none                                                                            
CIRCE /work       0 KB        2.00 TB      0%          1           691200            0% 
CIRCE /work_bgfs  0 Byte      2.00 TiB     0%          0           626000            0%


For more information about the data above, please refer to the manual page using the command:  man myquota

[nsambhu@itn0 ~]$ du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

 201575 UnrealEngine_4.26
   1015 .local
    872 OutputTest1
    871 NumpyArrayOutput
    285 .cache
     87 github
     13 .config
     11 COT4400_Project3
      8 .singularity
      5 .ssh
[...]
```
FROM nvidia/vulkan:1.1.121-cuda-10.1--ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --fetch-keys "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub" \
    && apt update && apt upgrade -y \
    && apt-get install -y --no-install-recommends software-properties-common build-essential clang-8 \
     lld-8 g++-7 cmake ninja-build libvulkan1 python python-pip python-dev python3-dev python3-pip \ 
     libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev git \
     libomp5 libsdl2-2.0 xserver-xorg vulkan-utils aria2 wget autotools-dev automake p7zip-full \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 180 \
    && update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-8/bin/clang 180 \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 carla 
RUN useradd -s /bin/bash -m carla -u 1000 -g 1000 

RUN apt-get update && \
    apt-get -y install sudo

RUN sudo apt-get update && \
    sudo apt-get install wget software-properties-common && \
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add

RUN sudo apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic main"
RUN sudo apt-get update
RUN sudo apt-get install build-essential clang-8 lld-8 g++-7 cmake ninja-build libvulkan1 python python-pip python-dev python3-dev python3-pip libpng-dev libtiff5-dev libjpeg-dev tzdata sed curl unzip autoconf libtool rsync libxml2-dev git
RUN sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 180
RUN sudo update-alternatives --install /usr/bin/clang clang /usr/lib/llvm-8/bin/clang 180

RUN pip3 -V
RUN pip3 install --upgrade pip
RUN pip install --user setuptools
RUN pip3 install --user -Iv setuptools==47.3.1
RUN pip install --user distro 
RUN pip3 install --user distro 
RUN pip install --user wheel 
RUN pip3 install --user wheel auditwheel

# new build info below
# get ssh key
ENTRYPOINT eval "$(ssh-agent -s)"
ENTRYPOINT pwd
ENTRYPOINT ssh-add ~/.ssh/id_rsa

# RUN git clone --depth 1 -b carla https://neilsambhu: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@github.com/CarlaUnreal/UnrealEngine.git ~/UnrealEngine_4.26
# RUN git clone --depth 1 -b carla https://github.com/neilsambhu/UnrealEngine.git ~/UnrealEngine_4.26
# RUN cd ~/UnrealEngine_4.26


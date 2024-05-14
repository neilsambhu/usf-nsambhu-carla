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

# Install sudo package
RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*
# Create a new user named 'nsambhu'
RUN useradd -m -s /bin/bash nsambhu
# Add 'nsambhu' to the 'sudo' group
RUN usermod -aG sudo nsambhu
# Set password for 'nsambhu' (change 'password' to your desired password)
RUN echo 'nsambhu:password' | chpasswd
# Set up sudoers file to allow sudo without password prompt
RUN echo 'nsambhu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# Switch to the 'nsambhu' user
USER nsambhu
# Set the working directory to the home directory of 'nsambhu'
#WORKDIR /home/nsambhu

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

COPY UnrealEngine_4.26 $HOME/

#WORKDIR $HOME/UnrealEngine_4.26
# new build info below
#ENTRYPOINT ls 
RUN UnrealEngine_4.26/Setup.sh 
#RUN ./GenerateProjectFiles.sh 
#RUN make
#RUN cd ~/UnrealEngine_4.26/Engine/Binaries/Linux && ./UE4Editor

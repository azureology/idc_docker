FROM linuxserver/webtop:ubuntu-xfce-ff2bbdbe-ls136
ENV DEBIAN_FRONTEND=noninteractive
ADD ./sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y tzdata sudo build-essential vim git cmake python3-pip clang-format \
    mono-runtime openjdk-11-jdk openjdk-8-jre-headless mesa-common-dev freeglut3 \
    freeglut3-dev libgles2-mesa-dev libjpeg-dev libpng-dev libdrm-dev llvm clang \
    libc++1 libc++abi1 zsh wget curl libqt5charts5-dev unzip usrmerge zip sshpass \
    libgtk2.0-dev libtinfo5 checkpolicy lz4 ccache flex bison libyaml-dev libssl-dev \
    qtbase5-dev qt5-qmake libqt5charts5-dev && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 
RUN pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ gitpython atomicwrites numpy ujson pysmb openpyxl requests

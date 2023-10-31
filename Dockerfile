#=======================
# build main images
# base images: ubuntu:18.04
# user:/root
# workdir:/root
#=======================
FROM ubuntu:18.04 as main
USER root
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive

#=======================
# install apt deps
#=======================
RUN apt-get update && apt-get install -y wget git unzip tinyproxy \
                      tini language-pack-zh-hant ffmpeg udev ssh \
                      language-pack-zh-hans fonts-arphic-* make openssl \
                      libssl-dev libpcre3 libpcre3-dev zlib1g-dev gcc g++ \
                      zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
                      git gnupg flex bison gperf build-essential \
                      lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev ccache \
                      libgl1-mesa-dev libxml2-utils xsltproc unzip u-boot-tools python bc device-tree-compiler \
                      && apt autoclean -y \
                      && apt autoremove -y \
                      && rm -rf /var/lib/apt/lists/*

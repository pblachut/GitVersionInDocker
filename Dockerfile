FROM mono:5.12.0-slim

RUN apt-get update &&\ 
    apt-get -y --no-install-recommends install \
        mono-devel \
        libcurl3 \
        wget \
        jq \
        unzip && \
    apt-get -yqq clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/*

RUN wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0/GitVersion-bin-net40-v4.0.0.zip
RUN unzip -d /usr/lib/GitVersion/ GitVersion-bin-net40-v4.0.0.zip && rm GitVersion-bin-net40-v4.0.0.zip
WORKDIR /usr/lib/GitVersion/
RUN sed -i 's|lib/linux/x86_64|/usr/lib/GitVersion/lib/linux/x86_64|g' /usr/lib/GitVersion/LibGit2Sharp.dll.config

WORKDIR /
FROM ubuntu:14.04
MAINTAINER okuisatoshi okuisatoshi@mac.com
RUN sed -i'.bak' -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp/g' /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_DEFRONTEND=noninteractive apt-get install -yq texlive-lang-cjk texlive-fonts-recommended 
RUN apt-get clean -yq
ENV LANG ja_JP.UTF-8
ENV HOME /root
VOLUME ["/data"]
WORKDIR /data
CMD /bin/bash


FROM ubuntu:14.04
MAINTAINER okuisatoshi okuisatoshi@mac.com
RUN DEBIAN_DEFRONTEND=noninteractive echo "Asia/Tokyo" > /etc/timezone \
    && dpkg-reconfigure tzdata
RUN sed -i'.bak' -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp/g' /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_DEFRONTEND=noninteractive apt-get upgrade -yq
RUN DEBIAN_DEFRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    module-assistant build-essential vim emacs24-nox tmux wget curl \
    git ssh language-pack-ja man
##RUN DEBIAN_DEFRONTEND=noninteractive apt-get install -yq texlive-lang-cjk
RUN apt-get clean -yq
ENV LANG ja_JP.UTF-8
ENV HOME /root
CMD /bin/bash


ARG TAG=stream
FROM quay.io/centos/centos:$TAG
LABEL maintainer="opensource@programator.sk"

RUN  dnf update -y && \
     curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
     dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
     dnf module reset nodejs && \
     dnf module enable -y nodejs:20 && \
     dnf install -y python3.11 git zip unzip bzip2 rsync nodejs yarn gcc-c++ make patch jemalloc-devel && \
     dnf clean all -y  && \
     rm -rf /tmp/*


RUN  npm i --force -g yarn && \ 
     mkdir -p ~/.ssh && \
     chmod 700 ~/.ssh && \
     echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

RUN node -v
WORKDIR /root

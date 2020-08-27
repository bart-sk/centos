FROM centos:8
LABEL maintainer="opensource@programator.sk"

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y git zip unzip bzip2 rsync nodejs yarn gcc-c++ make patch jemalloc-devel

RUN  npm i --force -g yarn && \ 
     mkdir -p ~/.ssh && \
     chmod 700 ~/.ssh && \
     echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

# RUN  apk update && apk add --update nodejs nodejs-npm && apk add ca-certificates && apk add rsync openssh-client git bash python make build-base && \
#      npm i -g yarn && \ 
#      mkdir -p ~/.ssh && \
#      chmod 700 ~/.ssh && \
#      echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
# ADD ./assets-version.sh /root

RUN node -v
WORKDIR /root

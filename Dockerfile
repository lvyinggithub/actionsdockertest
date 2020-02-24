FROM centos:centos7
RUN yum -y update
RUN yum -y update
RUN yum install -y expect redis-server ansible java-1.7.0-openjdk wget unzip openssh-clients gcc-c++ make ruby ruby-rdoc ruby-devel jq
RUN yum install -y gcc-c++ make
RUN yum install -y golang

ADD . ./
# Create root2 account
RUN	useradd -d /root2 -m -s /bin/bash -U root2
ADD ./startup.sh  /root2/startup.sh
RUN chown -R root2:root2 /root2/startup.sh
RUN chmod 777 /root2/*
USER	root2
WORKDIR /root2

CMD ["/root2/startup.sh"]

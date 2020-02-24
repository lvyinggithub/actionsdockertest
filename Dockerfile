FROM centos:centos7
ADD . ./
# Create root2 account
RUN	useradd -d /root2 -m -s /bin/bash -U root2
ADD ./startup.sh  /root2/startup.sh
RUN chown -R root2:root2 /root2/startup.sh
RUN chmod 777 /root2/*
USER	root2
WORKDIR /root2

CMD ["/root2/startup.sh"]

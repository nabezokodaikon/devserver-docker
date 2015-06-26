FROM ubuntu:14.04
MAINTAINER nabezokodaikon "nabezoko.dakon@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN echo 'Asia/Tokyo' > /etc/timezone
RUN sed -e 's;UTC=yes;UTC=no;' -i /etc/default/rcS

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get dist-upgrade -y && \
    apt-get autoremove --purge -y && \
    apt-get autoclean -y

RUN apt-get install -y \
    wget

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo 'deb http://pkg.jenkins-ci.org/debian binary/' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y \
    jenkins

RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

ADD ./init.sh /usr/local/bin/jenkins.sh
RUN chmod 744 /usr/local/bin/jenkins.sh

VOLUME /var/lib/jenkins
VOLUME /var/log/jenkins

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

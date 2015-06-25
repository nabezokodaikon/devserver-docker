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
    wget \
    openjdk-7-jre-headless

RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /var/log/gitbucket
RUN mkdir -p /var/run/gitbucket
RUN mkdir -p /opt/gitbucket/data

RUN wget https://github.com/takezoe/gitbucket/releases/download/3.3/gitbucket.war -P /opt/gitbucket

RUN useradd -s /bin/nologin gitbucket

ADD ./init.sh /opt/gitbucket/init.sh
RUN chmod 744 /opt/gitbucket/init.sh

ADD ./start-gitbucket.sh /opt/gitbucket/start-gitbucket.sh
RUN chmod 744 /opt/gitbucket/start-gitbucket.sh
RUN chown gitbucket:gitbucket /opt/gitbucket/start-gitbucket.sh

VOLUME /opt/gitbucket/data
VOLUME /var/log/gitbucket

EXPOSE 8080

ENTRYPOINT ["/opt/gitbucket/init.sh"]

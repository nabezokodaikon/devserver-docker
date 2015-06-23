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

RUN mkdir -p /opt/gitbucket/data

RUN wget https://github.com/takezoe/gitbucket/releases/download/3.3/gitbucket.war -P /opt/gitbucket
# ADD ./gitbucket.conf /opt/gitbucket/data/gitbucket.conf

VOLUME /opt/gitbucket/data
EXPOSE 52201

ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "/opt/gitbucket/gitbucket.war", "--port=52201", "--gitbucket.home=/opt/gitbucket/data"]


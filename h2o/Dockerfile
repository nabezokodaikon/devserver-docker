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
    locate \
    git \
    cmake \
    build-essential \
    checkinstall \
    autoconf \
    pkg-config \
    libtool \
    python-sphinx \
    wget \
    libcunit1-dev \
    nettle-dev \
    libyaml-dev \
    libssl-dev

RUN apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN git clone -b v1.6.1 https://github.com/libuv/libuv.git /usr/local/src/libuv
WORKDIR /usr/local/src/libuv 
RUN sh autogen.sh
RUN ./configure
RUN make
RUN make install
RUN rm -rf /usr/local/src/libuv

RUN git clone -b v1.3.0 https://github.com/h2o/h2o.git /usr/local/src/h2o
WORKDIR /usr/local/src/h2o
RUN cmake -DWITH_BUNDLED_SSL=on .
RUN make
RUN make install
RUN rm -rf /usr/local/src/h2o

RUN mkdir -p /etc/h2o
RUN mkdir -p /var/log/h2o
RUN mkdir -p /var/run/h2o
RUN mkdir -p /var/www/h2o

RUN openssl genrsa -out /etc/h2o/server.key 4096
RUN openssl req -new -newkey rsa:4096 -days 36500 -nodes -subj "/C=/ST=/L=/O=/CN=foo" -keyout /etc/h2o/server.key -out /etc/h2o/server.csr
RUN openssl x509 -req -days 36500 -in /etc/h2o/server.csr -signkey /etc/h2o/server.key -out /etc/h2o/server.crt
ADD ./h2o.conf /etc/h2o/h2o.conf

RUN chmod 600 /etc/h2o/server.key
RUN chmod 600 /etc/h2o/server.csr
RUN chmod 600 /etc/h2o/server.crt
RUN chmod 644 /etc/h2o/h2o.conf

RUN useradd -s /usr/sbin/nologin h2o
RUN chown -R h2o:h2o /etc/h2o
RUN chown -R h2o:h2o /var/log/h2o
RUN chown -R h2o:h2o /var/run/h2o
RUN chown -R h2o:h2o /var/www/h2o

VOLUME ["/var/log/h2o"]

RUN echo hello h2o!!! > /var/www/h2o/index.html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/h2o"] 
CMD ["-c", "/etc/h2o/h2o.conf"]

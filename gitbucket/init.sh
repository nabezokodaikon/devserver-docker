#!/bin/bash

chown -R gitbucket:gitbucket /var/log/gitbucket
chown -R gitbucket:gitbucket /opt/gitbucket

sudo -u gitbucket sh -c "/usr/bin/java -jar /opt/gitbucket/gitbucket.war --port=52201 --gitbucket.home=/opt/gitbucket/data >> /var/log/gitbucket/gitbucket.log 2>&1" &

term() {
    echo 'call kill.' >> /var/log/gitbucket/test.log
}

trap "term; exit 0" SIGKILL

while true; do
    sleep 1
done

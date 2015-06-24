#!/bin/bash

chown -R gitbucket:gitbucket /var/log/gitbucket
chown -R gitbucket:gitbucket /opt/gitbucket

sudo -u gitbucket sh -c "/usr/bin/java -jar /opt/gitbucket/gitbucket.war --port=52201 --gitbucket.home=/opt/gitbucket/data >> /var/log/gitbucket/gitbucket.log 2>&1" &

term() {
    echo samplelog >> /var/log/gitbucket/sample.log
}

trap "term; exit" SIGTERM

while true; do
    sleep 1
done

exit 0

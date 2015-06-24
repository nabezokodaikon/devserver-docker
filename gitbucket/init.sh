#!/bin/bash

chown -R gitbucket:gitbucket /var/log/gitbucket
chown -R gitbucket:gitbucket /var/run/gitbucket
chown -R gitbucket:gitbucket /opt/gitbucket

sudo -u gitbucket sh -c "/opt/gitbucket/start-gitbucket.sh"

term() {
    kill -s SIGTERM `cat /var/run/gitbucket/gitbucket.pid`
}

trap "term; exit 0" SIGTERM

while true; do
    sleep 1s
done

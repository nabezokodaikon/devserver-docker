#!/bin/bash

/usr/bin/java -jar /opt/gitbucket/gitbucket.war --port=52201 --gitbucket.home=/opt/gitbucket/data >> /var/log/gitbucket/gitbucket.log 2>&1 &
echo $! > /var/run/gitbucket/gitbucket.pid

exit 0

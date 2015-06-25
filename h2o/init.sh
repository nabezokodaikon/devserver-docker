#!/bin/bash

sed -ri "s/proxy.reverse.url:\sgitbucket/proxy.reverse.url: 'http:\/\/$GIT_PORT_8080_TCP_ADDR:$GIT_PORT_8080_TCP_PORT\/'/g" /etc/h2o/h2o.conf
/usr/local/bin/h2o -c /etc/h2o/h2o.conf

exit 0

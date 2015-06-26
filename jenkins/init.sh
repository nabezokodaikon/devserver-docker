#!/bin/bash

chown -R jenkins:jenkins /var/lib/jenkins
chown -R jenkins:jenkins /var/log/jenkins

sudo -u jenkins sh -c "/usr/bin/java -jar /usr/share/jenkins/jenkins.war"

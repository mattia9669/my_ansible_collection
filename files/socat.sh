#!/bin/bash
#redirection pour rsyslog sur le port 514
sudo socat TCP4-LISTEN:514,fork,reuseaddr TCP4:logs.xxx.xxx:514 |sudo socat TCP4-LISTEN:9200,fork,reuseaddr TCP4:logs.xxx.xxx:9200

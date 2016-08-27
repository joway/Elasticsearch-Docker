#!/bin/bash
groupadd elasticsearch
useradd elasticsearch -g elasticsearch -p /usr/share/elasticsearch/
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/
su elasticsearch

#!/bin/sh
set -e

rc-service docker start 
rc-service sshd start 
sleep infinity

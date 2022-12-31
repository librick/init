#!/usr/bin/env bash
# Taken from https://stackoverflow.com/questions/8647454/how-can-i-get-a-list-of-repositories-apt-get-is-checking
apt-cache policy | awk '/http.*amd64/{print$2}' | sort -u


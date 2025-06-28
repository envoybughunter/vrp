#!/bin/bash
echo "127.0.0.1"
read IP
ping -c 1 $IP

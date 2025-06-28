#!/bin/bash
echo "Enter IP address to ping:"
read IP
ping -c 1 $IP

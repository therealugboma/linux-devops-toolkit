#!/bin/bash

echo "=============================="
echo " Linux System Information"
echo "=============================="

echo "Hostname: $(hostname)"

echo
echo "Operating System:"
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'

echo
echo "Kernel:"
uname -r

echo
echo "Uptime:"
uptime -p

echo
echo "Current User:"
whoami

echo
echo "CPU:"
lscpu | grep "Model name" | head -1

echo
echo "Memory:"
free -h

echo
echo "Disk Usage:"
df -h /

echo
echo "IP Address:"
hostname -I

echo
echo "=============================="

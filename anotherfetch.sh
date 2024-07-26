#!/bin/bash

# Colors
blue='\e[1m\e[38;5;125m'
reset='\e[0m\e[38;5;102m'

# Gather system information
os=$(lsb_release -ds)
kernel=$(uname -r)
de=$(echo $XDG_CURRENT_DESKTOP)
uptime=$(uptime -p)
packages=$(dpkg -l | grep -c '^ii')
cpu=$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)
memory=$(free -h --si | awk '/Mem:/ {print $3 "/" $2}')
disk=$(df -h / | awk '/\// {print $3 "/" $2 " (" $5 " used)"}')

# Display information
echo -e "${blue}OS: ${reset}$os"
echo -e "${blue}CPU: ${reset}$cpu"
echo -e "${blue}Uptime: ${reset}$uptime"
echo -e "${blue}Kernel: ${reset}$kernel"
echo -e "${blue}Desktop: ${reset}$de"
echo -e "${blue}Packages: ${reset}$packages"
echo -e "${blue}Memory: ${reset}$memory"
echo -e "${blue}Disk: ${reset}$disk"

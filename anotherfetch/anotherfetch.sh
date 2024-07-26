#!/bin/bash

# Colors
red='\e[1m\e[38;5;125m'
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
temp=$(cat /sys/class/thermal/thermal_zone4/temp | awk '{ print ($1 / 1000) "°C" }')

# Display information
echo -e "${red}OS: ${reset}$os"
echo -e "${red}CPU: ${reset}$cpu"
echo -e "${red}Uptime: ${reset}$uptime"
echo -e "${red}Kernel: ${reset}$kernel"
echo -e "${red}Desktop: ${reset}$de"
echo -e "${red}Packages: ${reset}$packages"
echo -e "${red}Temperature: ${reset}$temp"
echo -e "${red}Memory: ${reset}$memory"
echo -e "${red}Disk: ${reset}$disk"

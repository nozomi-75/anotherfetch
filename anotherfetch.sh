#!/bin/sh

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
memory=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
disk=$(df -h / | awk '/\// {print $3 "/" $2 " (" $5 " used)"}')

# Check for Flatpak and count installed applications
if command -v flatpak >/dev/null 2>&1; then
    flatpak=$(flatpak list --app | grep -v '^$' | wc -l)
else
    flatpak=0
fi

# Display information
echo -e "${red}OS: ${reset}$os"
echo -e "${red}CPU: ${reset}$cpu"
echo -e "${red}Uptime: ${reset}$uptime"
echo -e "${red}Kernel: ${reset}$kernel"
echo -e "${red}Desktop: ${reset}$de"
echo -e "${red}Packages: ${reset}$packages"
echo "${red}Flatpak: ${reset}$flatpak"
echo -e "${red}Memory: ${reset}$memory"
echo -e "${red}Disk: ${reset}$disk"

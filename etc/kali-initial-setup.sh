#!/bin/bash

color='\033[1;33;41m'
NC='\033[0m' # No Color

printf "${color}WARNING: About to replace various network settings and create an alcapwn user.${NC}\n"
echo
echo "Generally, this script should only be run on fresh Kali installs.  There's no reason it won't work"
echo "on your existing Kali installation, but it may replace some of your network settings and binaries,"
echo "e.g.:"
echo ""
echo "- hostapd will be replaced, because the Edimax EW-7811Un requires a special build of hostapd to"
echo "   get it running as an access point,"
echo ""
echo "- network-manager no longer run at startup, since it tries to use wlan0 to search for hotspots"
echo "   (whereas we want to use wlan0 as an access point that our phone can connect to),"
echo ""
echo "- ifplugd will be installed and run at startup, and will run \`dhclient eth0\` whenever an"
echo "   ethernet cable is plugged in, so that your kali will try to automatically grab an IP address."
echo ""
echo "But the main issue is that ${color}this is beta software${NC}, and I don't want to be responsible for"
echo "accidentally messing up your Kali image.  I would recommend instead you read this setupfile script,"
echo "think about each step, and then apply the changes yourself by hand.  There aren't very many,"
echo "and I've tried to ensure the script is reasonably well-commented."

echo "To proceed, type the following (without quotes):  \"$DISK is correct\""
echo
read -p "Proceed? (y/N): " -n 1 -r
echo 
if [[ "$REPLY" != "Y" ]] && [[ "$REPLY" != "y" ]]; then
  exit 0
fi

echo "Proceeding with setup..."



#!/bin/bash
dnsConfig="$HOME/dnsConfig.txt"
os=$(uname)

function saveConfiguration {
    if [ "$os" == "Darwin" ]; then 
        wifiName=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
    elif [ "$os" == "Linux" ]; then
        wifiName=$(iwgetid -r)
    fi
    first=$(grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" "/etc/resolv.conf" | sed -n 1p)
    second=$(grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" "/etc/resolv.conf"| sed -n 2p)
    echo -e "\n$wifiName | $first  $second ;" >> "$dnsConfig"  && echo "CDDN has saved your current DNS configuration" && exit 0
}
while getopts lts option
    do
    case "${option}"
    in
    l) echo $(cat "$dnsConfig") && exit 0;;
    t) echo $(dig "www.google.com") && exit 0;;
    s) echo $(saveConfiguration) && exit 0;;
    esac
done


if [[ ! -e "$dnsConfig" ]]; then
    touch "$dnsConfig"  && echo "replace_with_name_of_your_Wifi | 1.1.1.1 1.0.0.1 ;" >> "$dnsConfig" 
    echo "Modify dnsConfig.txt with your custom settings & restart the .sh"
    exit 0
fi


if [ $(wc -l "$dnsConfig" | grep -o "[0-9]\+" ) -eq "0" ]; then
   PATTERN="replace_with_name_of_your_Wifi"
   if [ ! $(cat "$dnsConfig" | grep -q "$PATTERN") ]; then
        echo "Modify $dnsConfig  with your custom settings & restart the .sh"
        exit 1
    fi 
fi

function macOS {
    wifiName=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
    dns=$(cat $dnsConfig | grep "$wifiName" | sed -e 's/\(^.*|\)\(.*\)\(;.*$\)/\2/')
    card=$(networksetup -listallnetworkservices | grep Wi-Fi)
    $(networksetup -setdnsservers Wi-Fi $dns) && echo "I have correctly set the DNS $dns for the network with SSID $wifiName"
    exit 0
}
function linux {
    [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@" 
    wifiName=$(iwgetid -r)
    dns=$(cat $dnsConfig | grep "$wifiName" | sed -e 's/\(^.*|\)\(.*\)\(;.*$\)/\2/')
    sudo -i rm -f "/etc/resolv.conf"
    dns1=$(echo "$dns"  | head -n1 | awk '{print $1;}')
    dns2=$(echo "$dns"  | head -n1 | awk '{print $2;}')
    sudo echo -e  "nameserver $dns1\nnameserver $dns2" >> "/etc/resolv.conf" && echo "I have correctly set the DNS $dns for the network with SSID $wifiName" && exit 0
}

if [ "$os" == "Darwin" ]; then 
    macOS
elif [ "$os" == "Linux" ]; then
    linux
fi



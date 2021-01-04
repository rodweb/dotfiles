#!/usr/bin/env bash

function list_available_vpns() {
    nmcli connection | grep -i vpn | cut -d" " -f1
}

function list_active_vpns() {
    nmcli connection show --active | grep -i vpn | cut -d" " -f1
}

function is_connected() {
    list_active_vpns
}

if [[ $(is_connected) ]];
then
    vpn=$(list_active_vpns | rofi -dmenu -p "Disconnect from VPN")
    [ "$vpn" == "" ] && exit 0

    nmcli connection down $vpn
else
    vpn=$(list_available_vpns | rofi -dmenu -p "Connect to VPN")
    [ "$vpn" == "" ] && exit 0

    nmcli connection up $vpn
fi

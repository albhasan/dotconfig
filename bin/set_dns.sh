#!/bin/bash

# List devices.
nmcli device status

# Set DNS servers to https://quad9.net
nmcli connection modify "Wired connection 1" ipv4.dns "9.9.9.9"
nmcli connection modify "Wired connection 1" ipv6.dns "2620:fe::9"
nmcli connection modify "Auto AP48-5G" ipv4.dns "9.9.9.9"
nmcli connection modify "Auto AP48-5G" ipv6.dns "2620:fe::9"

# Restart.
nmcli connection down "Wired connection 1"
nmcli connection up "Wired connection 1"
nmcli connection down "Auto AP48-5G"
nmcli connection up "Auto AP48-5G"

#!/bin/bash

# First Reform
opkg update
opkg install kmod-nft-socket
opkg install kmod-nft-tproxy
opkg remove dnsmasq
opkg install dnsmasq-full
opkg install


# Function to install a theme
  
curl -LO https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.3.2/luci-theme-argon_2.3.2-r20250207_all.ipk
  
opkg install /tmp/luci-theme-argon.ipk
rm /tmp/luci-theme-argon.ipk

  

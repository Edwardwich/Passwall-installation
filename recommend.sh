#!/bin/bash

# Function to download a recommended file

curl -LO https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.3.2/luci-theme-argon_2.3.2-r20250207_all.ipk

curl -LO
https://github.com/Edwardwich/openwrt-passwall2/releases/download/25.4.22-1/luci-24.10_luci-app-passwall2_25.4.22-r1_all.ipk
#curl -LO
#https://github.com/Edwardwich/openwrt-passwall2/releases/download/25.4.22-1/passwall_packages_ipk_arm_cortex-a7_neon-vfpv4.zip
 
# First Reform
opkg update
opkg install kmod-nft-socket
opkg install kmod-nft-tproxy
opkg remove dnsmasq
opkg install dnsmasq-full
opkg install luci-theme-argon_2.3.2-r20250207_all.ipk
rm luci-theme-argon_2.3.2-r20250207_all.ipk

  

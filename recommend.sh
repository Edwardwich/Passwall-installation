#!/bin/bash

# Function to download a recommended file

#recommend file:

VERSION=$(curl -sL https://github.com/Edwardwich/openwrt-passwall2/releases/latest | sed -n 's|.*href="/Edwardwich/openwrt-passwall2/releases/tag/\([^"]*\)".*|\1|p')

URL="https://github.com/Edwardwich/openwrt-passwall2/releases/download/$VERSION/passwall_packages_ipk_arm_cortex-a7_neon-vfpv4.zip"
curl -LO "$URL"
unzip passwall_packages_ipk_arm_cortex-a7_neon-vfpv4.zip

#passwall2
VERSION=$(curl -sL https://github.com/Edwardwich/openwrt-passwall2/releases/latest | sed -n 's|.*href="/Edwardwich/openwrt-passwall2/releases/tag/\([^"]*\)".*|\1|p')

FILE=$(curl -sL "https://github.com/Edwardwich/openwrt-passwall2/releases/expanded_assets/$VERSION" \
  | grep 'luci-24.10_luci-app-passwall2_.*_all.ipk' \
  | sed -n 's|.*>\(luci-24.10_luci-app-passwall2_.*_all\.ipk\)<.*|\1|p' \
  | head -n1)

URL="https://github.com/Edwardwich/openwrt-passwall2/releases/download/$VERSION/$FILE"

echo "Downloading: $FILE"
curl -LO "$URL"


# First Reform
opkg update
opkg install kmod-nft-socket
opkg install kmod-nft-tproxy
opkg remove dnsmasq
opkg install dnsmasq-full
opkg install *.ipk
rm *

  

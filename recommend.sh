#!/bin/bash

# First Reform
opkg update
opkg install kmod-nft-socket
opkg install kmod-nft-tproxy
opkg remove dnsmasq
opkg install dnsmasq-full
opkg install


# Function to install a theme
install_theme() {
  local REPO_NAME=$1
  local THEME_NAME=$2

  echo "Processing $THEME_NAME..."
  # GitHub repository URL and package name
  LATEST_RELEASE_URL="https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.3.2/luci-theme-argon_2.3.2-r20250207_all.ipk"
  IPK_URL=$(curl -LO $LATEST_RELEASE_URL)

  # Check if the download link is found
  if [ -z "$IPK_URL" ]; then
    echo "Download link for the .ipk file of luci-theme-argon not found."
    return 1
  fi

  
  # Install the .ipk package
  echo "Installing luci-theme-argon..."
  opkg install /tmp/luci-theme-argon.ipk

  # Clean up the downloaded file
  rm /tmp/luci-theme-argon.ipk

  echo "luci-theme-argon installed successfully."
}

# Install luci-theme-peditx
install_theme "luci-theme-argon"




# Get all supported architectures from opkg
arch_list=$(opkg print-architecture | awk '{print $2}')

# Find the first matching architecture in the available package list
pkg_arch=""
for arch in $arch_list; do
    case "$arch" in
        aarch64_cortex-a53|aarch64_cortex-a72|aarch64_generic|\
        arm_cortex-a15_neon-vfpv4|arm_cortex-a5_vfpv4|arm_cortex-a7|\
        arm_cortex-a7_neon-vfpv4|arm_cortex-a8_vfpv3|arm_cortex-a9|\
        arm_cortex-a9_neon|arm_cortex-a9_vfpv3-d16|mipsel_24kc|\
        mipsel_74kc|mipsel_mips32|mips_24kc|mips_4kec|mips_mips32|x86_64)
            pkg_arch="$arch"
            break
            ;;
    esac
done

if [ -z "$pkg_arch" ]; then
    echo "Unsupported CPU architecture detected!"
    exit 1
fi


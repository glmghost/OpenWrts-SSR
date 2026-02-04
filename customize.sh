#!/bin/bash
#===============================================
# Minimal customize.sh for OpenWrt with Helloworld
#===============================================

# Add helloworld feed
if [ -f "openwrt/feeds.conf.default" ] && ! grep -q "helloworld" "openwrt/feeds.conf.default"; then
    echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "openwrt/feeds.conf.default"
    echo "Added helloworld feed to feeds.conf.default"
fi

# Update and install feeds
if [ -d "openwrt" ]; then
    (cd openwrt && ./scripts/feeds update -a)
    (cd openwrt && ./scripts/feeds install -a)
fi

echo "Customization completed!"

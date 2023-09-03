#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.10.1 修改成你想要的就可以了
#sed -i 's/192.168.100.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 添加自定义软件包
echo '

CONFIG_PACKAGE_luci-app-bypass=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Client is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Client is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Shadowsocks_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_ShadowsocksR_Libev_Server is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Simple_obfs is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_V2ray_plugin is not set
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan is not set
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Trojan-Go is not set
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_NaiveProxy=y
# CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Kcptun is not set
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Socks5_Proxy=y
CONFIG_PACKAGE_luci-app-bypass_INCLUDE_Socks_Server=y
CONFIG_PACKAGE_luci-i18n-bypass-zh-cn=y
# CONFIG_PACKAGE_luci-i18n-bypass-zh_Hans is not set

# CONFIG_PACKAGE_luci-app-passwall=y
#CONFIG_PACKAGE_luci-app-passwall=m
#
# Configuration
#
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Server=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Server=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_haproxy=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_dns2socks=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_v2ray-plugin=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_simple-obfs=y
# end of Configuration

CONFIG_DEFAULT_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus=m
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-i18n-ssr-plus-zh-cn=m
# CONFIG_PACKAGE_luci-i18n-ssr-plus-zh_Hans is not set

CONFIG_PACKAGE_luci-app-vssr=m
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_V2ray_plugin=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y

CONFIG_PACKAGE_kmod-pptp=y
CONFIG_PACKAGE_luci-app-pptp-server=y
CONFIG_PACKAGE_pptpd=y
CONFIG_PACKAGE_ppp-mod-pptp=y

CONFIG_PACKAGE_kmod-l2tp=y
CONFIG_PACKAGE_kmod-l2tp-eth=y
CONFIG_PACKAGE_kmod-l2tp-ip=y
CONFIG_PACKAGE_kmod-pppol2tp=y
CONFIG_PACKAGE_xl2tpd=y
CONFIG_PACKAGE_hnet-full-l2tp=y
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
' >> .config
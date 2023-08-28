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
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-openclash=y
#
# Configuration
#
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Server=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_Rust is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_GO is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_NaiveProxy is not set
# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Kcptun is not set
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Haproxy=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ChinaDNS_NG=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Dns2socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray-plugin=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Simple-obfs=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_PDNSD=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_Rust is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray_plugin=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Trojan=y
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Redsocks2 is not set
# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NaiveProxy is not set
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-vpnbypass=y
CONFIG_PACKAGE_vpnbypass=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_luci-i18n-vpnbypass-zh-cn=y
CONFIG_PACKAGE_luci-i18n-webadmin-zh-cn=y

# VPN
#
CONFIG_PACKAGE_chaosvpn=y
CONFIG_PACKAGE_fastd=y
CONFIG_PACKAGE_libreswan=y
CONFIG_PACKAGE_n2n-edge=y
CONFIG_PACKAGE_n2n-supernode=y
CONFIG_PACKAGE_ocserv=y
CONFIG_PACKAGE_openconnect=y
CONFIG_PACKAGE_openfortivpn=y
CONFIG_PACKAGE_openvpn-easy-rsa=y
CONFIG_PACKAGE_openvpn-mbedtls=y
CONFIG_PACKAGE_openvpn-openssl=y
CONFIG_PACKAGE_pptpd=y
CONFIG_PACKAGE_softethervpn-base=y
CONFIG_PACKAGE_softethervpn-bridge=y
CONFIG_PACKAGE_softethervpn-client=y
CONFIG_PACKAGE_softethervpn-server=y
CONFIG_PACKAGE_softethervpn5-bridge=y
CONFIG_PACKAGE_softethervpn5-client=y
CONFIG_PACKAGE_softethervpn5-server=y
CONFIG_PACKAGE_sstp-client=y
CONFIG_PACKAGE_strongswan=y
CONFIG_PACKAGE_ppp-mod-pppoe=y
CONFIG_PACKAGE_ppp-mod-pppol2tp=y
CONFIG_PACKAGE_ppp-mod-pptp=y
# end of Configuration
' >> .config
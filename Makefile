# SPDX-License-Identifier: GPL-3.0-only
#
# Copyright (C) 2022 ImmortalWrt.org

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-bitsrunlogin-go
PKG_VERSION:=1.0

LUCI_TITLE:=LuCI app for BitSrunLoginGo (Bit Srun auto login tool)
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+bitsrunlogin-go
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature

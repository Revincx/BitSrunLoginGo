#
# Copyright (C) 2021 Mmx
#
# This is free software, licensed under the GNU Affero General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=BitSrunLoginGo
PKG_VERSION:=3.4
PKG_RELEASE:=$(AUTORELESE)

PKG_LICENSE:=AGPL-3.0
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Mmx

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/Mmx233/BitSrunLoginGo

GO_PKG_LDFLAGS:=-s -w
GO_PKG_GCFLAGS:=-trimpath=$GOPATH
GO_PKG_ASMFLAGS:=-trimpath=$GOPATH

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/bitsrunlogin-go
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Campus Network
  TITLE:=Bit Srun auto login tool
  URL:=https://github.com/Mmx233/BitSrunLoginGo
  DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/bitsrunlogin-go/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/BitSrunLoginGo $(1)/usr/bin/bitsrunlogin-go

	$(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d
	$(INSTALL_CONF) $(CURDIR)/files/bitsrunlogin-go.config $(1)/etc/config/bitsrunlogin-go
	$(INSTALL_BIN) $(CURDIR)/files/bitsrunlogin-go.init $(1)/etc/init.d/bitsrunlogin-go
endef

$(eval $(call GoBinPackage,bitsrunlogin-go))
$(eval $(call BuildPackage,bitsrunlogin-go))

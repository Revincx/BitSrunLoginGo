#
# Copyright (C) 2021 Mmx
#
# This is free software, licensed under the GNU Affero General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=BitSrunLoginGo
PKG_VERSION:=3.3
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

define BitSrunLoginGo/templates
  define Package/$(1)
    TITLE:=An auto login tool
    URL:=https://github.com/Mmx233/BitSrunLoginGo
    SECTION:=utils
    CATEGORY:=Utilities
    DEPENDS:=$$(GO_ARCH_DEPENDS)
  endef

  define Package/$(1)/description
  There is no description.
  endef

  define Package/$(1)/install
    $(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))
    $(INSTALL_DIR) $(1)/usr/bin/
    $(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/BitSrunLoginGo $(1)/usr/bin/bitsrunlogin-go

    $(INSTALL_DIR) $(1)/etc/config $(1)/etc/init.d
    $(INSTALL_CONF) $(CURDIR)/files/bitsrunlogin-go.yaml $(1)/etc/bitsrunlogin-go/config.yaml
    $(INSTALL_BIN) $(CURDIR)/files/bitsrunlogin-go.init $(1)/etc/init.d/bitsrunlogin-go
  endef
endef

$(eval $(call BitSrunLoginGo/templates,BitSrunLoginGo)) \
$(eval $(call GoBinPackage,BitSrunLoginGo)) \
$(eval $(call BuildPackage,BitSrunLoginGo)) \

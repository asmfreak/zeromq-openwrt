include $(TOPDIR)/rules.mk
PKG_NAME:=zeromq
PKG_VERSION:=4.1.3
PKG_RELEASE:=1
PKG_SOURCE:=zeromq-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.zeromq.org/
PKG_MD5SUM:=d0824317348cfb44b8692e19cc73dc3a
PKG_BUILD_DIR:=$(BUILD_DIR)/zeromq-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/zeromq
  SECTION:=lib
  CATEGORY:=Libraries
  TITLE:=zeromq
  URL:=http://zeromq.org/
endef

define Package/zeromq/description
  Ultimate messaging library
endef

define Build/Configure
	$(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR) --without-libsodium)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/zeromq/install
	$(call Build/Install/Default)
endef

$(eval $(call BuildPackage,zeromq))

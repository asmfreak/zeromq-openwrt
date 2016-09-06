include $(TOPDIR)/rules.mk
PKG_NAME:=zeromq
PKG_VERSION:=4.1.3
PKG_RELEASE:=1
PKG_SOURCE:=zeromq-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/zeromq/zeromq4-1/releases/download/v$(PKG_VERSION)/
PKG_MD5SUM:=d0824317348cfb44b8692e19cc73dc3a
PKG_BUILD_DIR:=$(BUILD_DIR)/zeromq-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/zeromq
  SECTION:=lib
  CATEGORY:=Libraries
  DEPENDS:=+librt +libstdcpp 
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

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/. $(STAGING_DIR)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/libzmq.* $(1)/usr/lib
endef

define Package/zeromq/install
	$(call Build/Install/Default)
	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(1)
endef

$(eval $(call BuildPackage,zeromq))

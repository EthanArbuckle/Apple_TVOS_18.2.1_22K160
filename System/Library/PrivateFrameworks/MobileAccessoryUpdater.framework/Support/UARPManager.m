@interface UARPManager
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5;
- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5;
- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4;
- (UARPAssetManager)assetManager;
- (UARPManager)init;
- (id)copyAssetIDForAccessoryID:(id)a3;
- (id)getAttestationCertificates:(id)a3;
- (id)getSupplementalAssetNameForAccessoryID:(id)a3;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4;
- (int64_t)addAccessory:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5;
- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4;
- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5;
- (int64_t)checkForUpdate:(id)a3;
- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5;
- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4;
- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3;
- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4;
- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5;
- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5;
- (int64_t)removeAccessory:(id)a3;
- (int64_t)requestConsent:(id)a3;
- (int64_t)revokeConsentRequest:(id)a3;
- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5;
- (void)consumeSandboxExtensionToken:(id)a3 url:(id)a4;
- (void)dealloc;
- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5;
- (void)removeSandboxExtensionWithURL:(id)a3;
- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5;
- (void)settingsChangedForSerialNumber:(id)a3;
@end

@implementation UARPManager

- (UARPManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___UARPManager;
  v2 = -[UARPManager init](&v4, "init");
  if (v2)
  {
    v2->_assetManager = -[UARPAssetManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___UARPAssetManager),  "initWithDelegate:",  v2);
    v2->_sandboxExtensions = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPManager;
  -[UARPManager dealloc](&v3, "dealloc");
}

- (int64_t)addAccessory:(id)a3 assetID:(id)a4
{
  return -[UARPAssetManager addAccessoryID:assetID:](self->_assetManager, "addAccessoryID:assetID:", a3, a4);
}

- (int64_t)removeAccessory:(id)a3
{
  return -[UARPAssetManager removeAccessoryID:](self->_assetManager, "removeAccessoryID:", a3);
}

- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4
{
  return -[UARPAssetManager changeAssetLocation:assetID:](self->_assetManager, "changeAssetLocation:assetID:", a3, a4);
}

- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5
{
  return -[UARPAssetManager downloadFirmwareForAccessory:assetID:userIntent:]( self->_assetManager,  "downloadFirmwareForAccessory:assetID:userIntent:",  a3,  a4,  a5);
}

- (int64_t)downloadReleaseNotesForAccessoryID:(id)a3 assetID:(id)a4
{
  return -[UARPAssetManager downloadReleaseNotesForAccessoryID:assetID:]( self->_assetManager,  "downloadReleaseNotesForAccessoryID:assetID:",  a3,  a4);
}

- (int64_t)checkForUpdate:(id)a3
{
  return -[UARPAssetManager checkForUpdate:](self->_assetManager, "checkForUpdate:", a3);
}

- (int64_t)personalizationVectorForAccessoryID:(id)a3 assetTag:(unsigned int)a4 outVector:(unsigned int *)a5
{
  return -[UARPAssetManager personalizationVectorForAccessoryID:assetTag:outVector:]( self->_assetManager,  "personalizationVectorForAccessoryID:assetTag:outVector:",  a3,  *(void *)&a4,  a5);
}

- (void)manifestPropertiesReceivedForAccessoryID:(id)a3 assetTag:(unsigned int)a4 properties:(id)a5
{
}

- (void)sendUpdateFirmwareAnalyticsEventForAccessoryID:(id)a3 assetID:(id)a4 params:(id)a5
{
}

- (int64_t)updateProperty:(unint64_t)a3 value:(id)a4 forAccessory:(id)a5
{
  return -[UARPAssetManager updateProperty:value:forAccessory:]( self->_assetManager,  "updateProperty:value:forAccessory:",  a3,  a4,  a5);
}

- (id)copyAssetIDForAccessoryID:(id)a3
{
  return -[UARPAssetManager copyAssetIDForAccessoryID:](self->_assetManager, "copyAssetIDForAccessoryID:", a3);
}

- (id)getSupplementalAssetNameForAccessoryID:(id)a3
{
  return -[UARPAssetManager getSupplementalAssetNameForAccessoryID:]( self->_assetManager,  "getSupplementalAssetNameForAccessoryID:",  a3);
}

- (BOOL)getFetchedSupportedAccessories:(id)a3 forProductGroup:(id)a4
{
  return -[UARPAssetManager getFetchedSupportedAccessories:forProductGroup:]( self->_assetManager,  "getFetchedSupportedAccessories:forProductGroup:",  a3,  a4);
}

- (int64_t)getSupportedAccessories:(id)a3 assetID:(id)a4 batchRequest:(BOOL)a5
{
  return -[UARPAssetManager getSupportedAccessories:assetID:batchRequest:]( self->_assetManager,  "getSupportedAccessories:assetID:batchRequest:",  a3,  a4,  a5);
}

- (id)getAttestationCertificates:(id)a3
{
  return -[UARPAssetManager getAttestationCertificates:](self->_assetManager, "getAttestationCertificates:", a3);
}

- (int64_t)getAttestationCertificates:(id)a3 assetID:(id)a4
{
  return -[UARPAssetManager getAttestationCertificates:assetID:]( self->_assetManager,  "getAttestationCertificates:assetID:",  a3,  a4);
}

- (int64_t)requestConsent:(id)a3
{
  return 2LL;
}

- (int64_t)revokeConsentRequest:(id)a3
{
  return 2LL;
}

- (int64_t)enableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  return 2LL;
}

- (int64_t)disableTRMSystemAuthenticationForRegistryEntryID:(id)a3
{
  return 2LL;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumber:(id)a4 notifyService:(id)a5
{
  return 0;
}

- (BOOL)dynamicAssetSolicitation:(id)a3 modelNumbers:(id)a4 notifyService:(id)a5
{
  return 0;
}

- (void)removeSandboxExtensionWithURL:(id)a3
{
}

- (void)consumeSandboxExtensionToken:(id)a3 url:(id)a4
{
  if (a3 && a4)
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sandboxExtensions, "objectForKeyedSubscript:", a4))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Duplicate Sandbox Extension Token for URL:%@",  (uint8_t *)&v7,  0xCu);
      }
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_sandboxExtensions,  "setObject:forKeyedSubscript:",  -[UARPSandboxExtension initWithTokenString:]( objc_alloc(&OBJC_CLASS___UARPSandboxExtension),  "initWithTokenString:",  a3),  a4);
  }

- (int64_t)addAccessory:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5
{
  return -[UARPManager addAccessory:assetID:](self, "addAccessory:assetID:", a3, a4);
}

- (int64_t)changeAssetLocation:(id)a3 assetID:(id)a4 sandboxExtensionToken:(id)a5
{
  return -[UARPManager changeAssetLocation:assetID:](self, "changeAssetLocation:assetID:", a3, a4);
}

- (void)settingsChangedForSerialNumber:(id)a3
{
}

- (UARPAssetManager)assetManager
{
  return (UARPAssetManager *)objc_getProperty(self, a2, 16LL, 1);
}

@end
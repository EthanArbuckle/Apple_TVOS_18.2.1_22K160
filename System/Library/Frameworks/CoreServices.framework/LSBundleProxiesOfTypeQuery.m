@interface LSBundleProxiesOfTypeQuery
@end

@implementation LSBundleProxiesOfTypeQuery

void __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v8 = (void *)MEMORY[0x186E2A59C]();
  if ([*(id *)(a1 + 32) bundleUnitMeetsRequirements:a2 bundleData:a3 context:*(void *)(a1 + 48)])
  {
    if ([*(id *)(a1 + 32) type] == 5)
    {
      v9 = (void *)_CSStringCopyCFString();
      if (v9)
      {
        uint64_t v10 = +[LSVPNPluginProxy VPNPluginProxyForIdentifier:withContext:]( &OBJC_CLASS___LSVPNPluginProxy,  "VPNPluginProxyForIdentifier:withContext:",  v9,  *(void *)(a1 + 48));
      }

      else
      {
        uint64_t v10 = 0LL;
      }

      v11 = (void *)v10;
      if (v10) {
        goto LABEL_11;
      }
    }

    else
    {
      v11 = +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyWithBundleUnitID:withContext:",  a2,  *(void *)(a1 + 48));
      if (v11)
      {
LABEL_11:
        *a4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))() ^ 1;
LABEL_12:

        goto LABEL_13;
      }
    }

    _LSDefaultLog();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = a2;
      _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to create bundleProxy for bundle %lu",  (uint8_t *)&v13,  0xCu);
    }

    goto LABEL_12;
  }

@end
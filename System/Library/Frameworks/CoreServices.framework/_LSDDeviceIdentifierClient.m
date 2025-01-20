@interface _LSDDeviceIdentifierClient
- (BOOL)canAccessAdvertisingIdentifier;
- (BOOL)hasEntitlementToClearAllIdentifiersOfType:(int64_t)a3;
- (BOOL)hasUninstallEntitlement;
- (_LSDDeviceIdentifierClient)initWithXPCConnection:(id)a3;
- (unsigned)findAppBundleForExecutableURL:(id)a3 withContext:(LSContext *)a4;
- (void)clearAllIdentifiersOfType:(int64_t)a3;
- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)generateIdentifiersWithVendorName:(id)a3 bundleIdentifier:(id)a4;
- (void)getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:(int64_t)a3 completionHandler:(id)a4;
- (void)getIdentifierOfType:(int64_t)a3 completionHandler:(id)a4;
- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)urlContainsDeviceIdentifierForAdvertising:(id)a3 completionHandler:(id)a4;
@end

@implementation _LSDDeviceIdentifierClient

- (_LSDDeviceIdentifierClient)initWithXPCConnection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSDDeviceIdentifierClient;
  return -[_LSDClient initWithXPCConnection:](&v4, sel_initWithXPCConnection_, a3);
}

- (unsigned)findAppBundleForExecutableURL:(id)a3 withContext:(LSContext *)a4
{
  id v5 = a3;
  unsigned int v11 = 0;
  v6 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", v5, 0LL, 0LL);
  if (v6)
  {
    if (_LSBundleFindWithNode(a4, v6, &v11, 0LL))
    {
      int v10 = 0;
      uint64_t v7 = _LSPluginFindWithInfo(a4->db, 0LL, 0LL, 0, v6, &v10, 0LL);
      if (v7) {
        unsigned int v11 = *(_DWORD *)(v7 + 216);
      }
    }
  }

  unsigned int v8 = v11;
  return v8;
}

- (BOOL)hasUninstallEntitlement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _xpcConnection];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = _LSCheckMIAllowedSPIForXPCConnection(v3, @"UninstallForLaunchServices") != 0;

  return v4;
}

- (BOOL)hasEntitlementToClearAllIdentifiersOfType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 _xpcConnection];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = _LSCheckEntitlementForXPCConnection(v5, @"com.apple.launchservices.clearadvertisingid");
LABEL_8:
      BOOL v7 = v6 != 0;

      return v7;
    }

    return 0;
  }

  else
  {
    if (!-[_LSDDeviceIdentifierClient hasUninstallEntitlement](self, "hasUninstallEntitlement"))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 _xpcConnection];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = _LSCheckEntitlementForXPCConnection(v5, @"com.apple.launchservices.clearvendorid");
      goto LABEL_8;
    }

    return 1;
  }

- (BOOL)canAccessAdvertisingIdentifier
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v3 = +[LSApplicationRestrictionsManager sharedInstance]();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v3) & 1) == 0)
  {
    _LSDefaultLog();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
      buf.val[0] = 67109120;
      buf.val[1] = [v8 processIdentifier];
      _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_INFO,  "Advertising identifier: PID %d access denied because app tracking disabled by device management profile",  (uint8_t *)&buf,  8u);
    }

- (void)getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (a3 == 1
    && (-[_LSDClient XPCConnection](self, "XPCConnection"),
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 _xpcConnection],
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(),
        BOOL v9 = _LSCheckEntitlementForXPCConnectionQuiet(v8, @"com.apple.developer.exposure-notification"),
        v8,
        v7,
        v9))
  {
    _LSDefaultLog();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 138543362;
      v15 = @"com.apple.developer.exposure-notification";
      _os_log_impl( &dword_183E58000,  v10,  OS_LOG_TYPE_DEFAULT,  "Request for IDFA/IDFV from a process that has entitlement %{public}@; ignoring.",
        buf,
        0xCu);
    }

    (*((void (**)(id, void, void, uint64_t))v6 + 2))(v6, 0LL, 0LL, 1LL);
  }

  else
  {
    _LSServer_DatabaseExecutionContext();
    unsigned int v11 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke;
    v12[3] = &unk_189D75988;
    v12[4] = self;
    id v13 = v6;
    -[LSDBExecutionContext syncRead:](v11, v12);
  }
}

- (void)getIdentifierOfType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke;
  v8[3] = &unk_189D759B0;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  -[_LSDDeviceIdentifierClient getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:completionHandler:]( self,  "getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType:completionHandler:",  a3,  v8);
}

- (void)urlContainsDeviceIdentifierForAdvertising:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke;
  v10[3] = &unk_189D759D8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  -[_LSDDeviceIdentifierClient getIdentifierOfType:completionHandler:]( self,  "getIdentifierOfType:completionHandler:",  1LL,  v10);
}

- (void)generateIdentifiersWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    _LSDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v5;
      _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Generating identifiers for vendor %@",  (uint8_t *)&v17,  0xCu);
    }

    +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)getUMUserManagerClass() sharedManager];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 currentPersona];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 cacheForPersona:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 getIdentifierOfType:0 vendorName:v5 bundleIdentifier:v7 completionHandler:0];

    +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)getUMUserManagerClass() sharedManager];
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 currentPersona];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 cacheForPersona:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 getIdentifierOfType:1 vendorName:v5 bundleIdentifier:v7 completionHandler:0];
  }
}

- (void)clearIdentifiersForUninstallationWithVendorName:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (-[_LSDDeviceIdentifierClient hasUninstallEntitlement](self, "hasUninstallEntitlement"))
    {
      _LSDefaultLog();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "Asking to clear identifiers for vendor %@/bundle %@",  (uint8_t *)&v15,  0x16u);
      }

      +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)getUMUserManagerClass() sharedManager];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 currentPersona];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 cacheForPersona:v12];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 clearIdentifiersForUninstallationWithVendorName:v6 bundleIdentifier:v8];
    }

    else
    {
      _LSDefaultLog();
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = 138412802;
        id v16 = v14;
        __int16 v17 = 2112;
        id v18 = v6;
        __int16 v19 = 2112;
        v20 = v8;
        _os_log_impl( &dword_183E58000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "Unentitled request from XPC connection %@ to clear identifiers for vendor %@/bundle %@",  (uint8_t *)&v15,  0x20u);
      }
    }
  }
}

- (void)getIdentifierOfType:(int64_t)a3 vendorName:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (!v10 || !v11)
  {
LABEL_8:
    v12[2](v12, 0LL);
    goto LABEL_9;
  }

  -[_LSDClient XPCConnection](self, "XPCConnection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 _xpcConnection];
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue();
  int v15 = _LSCheckEntitlementForXPCConnection(v14, @"com.apple.lsapplicationproxy.deviceidentifierforvendor");

  if (!v15)
  {
    _LSDefaultLog();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = 138412802;
      v23 = v21;
      __int16 v24 = 1024;
      int v25 = a3;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl( &dword_183E58000,  v20,  OS_LOG_TYPE_DEFAULT,  "Unentitled request from XPC connection %@ for identifier type %i of vendor %@",  (uint8_t *)&v22,  0x1Cu);
    }

    goto LABEL_8;
  }

  +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)getUMUserManagerClass() sharedManager];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 currentPersona];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 cacheForPersona:v18];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 getIdentifierOfType:a3 vendorName:v10 bundleIdentifier:v11 completionHandler:v12];

LABEL_9:
}

- (void)clearAllIdentifiersOfType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  BOOL v5 = -[_LSDDeviceIdentifierClient hasEntitlementToClearAllIdentifiersOfType:]( self,  "hasEntitlementToClearAllIdentifiersOfType:");
  _LSDefaultLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 67109120;
      LODWORD(v13) = a3;
      _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Asking to clear all identifiers of type %i",  (uint8_t *)&v12,  8u);
    }

    +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [(id)getUMUserManagerClass() sharedManager];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 currentPersona];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_log_s cacheForPersona:](v6, "cacheForPersona:", v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 clearAllIdentifiersOfType:a3];
  }

  else if (v7)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = 138412546;
    id v13 = v11;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Unentitled request from XPC connection %@ to clear all identifiers of type %i",  (uint8_t *)&v12,  0x12u);
  }
}

@end
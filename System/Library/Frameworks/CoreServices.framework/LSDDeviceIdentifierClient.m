@interface LSDDeviceIdentifierClient
@end

@implementation LSDDeviceIdentifierClient

void __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v35 = a2;
  id v36 = a3;
  [*(id *)(a1 + 32) XPCConnection];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 _xpcConnection];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = _LSCopyBundleURLForXPCConnection(v6, 0);

  v37 = (void *)v7;
  if (!v7)
  {
    v12 = 0LL;
    v13 = 0LL;
LABEL_23:
    [*(id *)(a1 + 32) XPCConnection];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 _xpcConnection];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFURLRef v23 = _LSCopyExecutableURLForXPCConnection(v22);

    if (v23)
    {
      -[__CFURL lastPathComponent](v23, "lastPathComponent");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        uint64_t v25 = [NSString stringWithFormat:@"Path:%@", v24, v35];

        v12 = (void *)v25;
      }

      uint64_t v26 = -[__CFURL path](v23, "path");

      v13 = (void *)v26;
    }

    else
    {
      _LSDefaultLog();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl( &dword_183E58000,  v24,  OS_LOG_TYPE_DEFAULT,  "Not enough info to create vendorName and bundleIdentifier",  v45,  2u);
      }
    }

    goto LABEL_30;
  }

  id v48 = 0LL;
  *(void *)v45 = 0LL;
  id v46 = 0LL;
  char v47 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v9 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v45, v8, 0LL);

  if (!v9)
  {
    _LSDefaultLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)v45, v16, 0LL);

      if (v17) {
        id v18 = 0LL;
      }
      else {
        id v18 = v48;
      }
      *(_DWORD *)buf = 138543362;
      id v50 = v18;
      _os_log_impl( &dword_183E58000,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to reach database with error %{public}@",  buf,  0xCu);
    }

    LOBYTE(v7) = 0;
    v13 = 0LL;
    v12 = 0LL;
    goto LABEL_17;
  }

  uint64_t v10 = [*(id *)(a1 + 32) findAppBundleForExecutableURL:v7 withContext:v9];
  if ((_DWORD)v10)
  {
    uint64_t v11 = _LSBundleGet(*v9, v10);
    if (v11)
    {
      v12 = +[_LSDDeviceIdentifierService vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:]( &OBJC_CLASS____LSDDeviceIdentifierService,  "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:",  v9,  v10,  v11);
      v13 = (void *)_CSStringCopyCFString();
      [*(id *)(a1 + 32) XPCConnection];
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        -[os_log_s auditToken](v14, "auditToken");
      }

      else
      {
        __int128 v43 = 0u;
        __int128 v44 = 0u;
      }

      LODWORD(v7) = (*(unsigned __int8 *)(v11 + 171) >> 3) & 1;
LABEL_17:

      goto LABEL_18;
    }
  }

  LOBYTE(v7) = 0;
  v13 = 0LL;
  v12 = 0LL;
LABEL_18:
  if (*(void *)v45 && v47) {
    _LSContextDestroy(*(void ***)v45);
  }
  id v19 = v46;
  *(void *)v45 = 0LL;
  id v46 = 0LL;

  char v47 = 0;
  id v20 = v48;
  id v48 = 0LL;

  if (!v12 || !v13) {
    goto LABEL_23;
  }
LABEL_30:
  v27 = +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
  [(id)getUMUserManagerClass() sharedManager];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 currentPersona];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 cacheForPersona:v29];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 queue];
  v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_52;
  block[3] = &unk_189D75960;
  id v32 = *(id *)(a1 + 40);
  id v40 = v13;
  id v41 = v32;
  id v39 = v12;
  char v42 = v7;
  id v33 = v13;
  id v34 = v12;
  dispatch_async(v31, block);
}

uint64_t __120___LSDDeviceIdentifierClient_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler___block_invoke_52( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 56));
}

void __68___LSDDeviceIdentifierClient_getIdentifierOfType_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  int a4)
{
  id v17 = a2;
  id v7 = a3;
  if (a4) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 != 1) {
    goto LABEL_5;
  }
  if (([*(id *)(a1 + 32) canAccessAdvertisingIdentifier] & 1) == 0)
  {
LABEL_11:
    uint64_t v16 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x189607AB8], "_LS_nullUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v12);
    goto LABEL_12;
  }

  uint64_t v8 = *(void *)(a1 + 48);
LABEL_5:
  if (v8 != 2
    || ([*(id *)(a1 + 32) XPCConnection],
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        [v9 _xpcConnection],
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(),
        int v11 = _LSCheckEntitlementForXPCConnection(v10, @"com.apple.lsapplicationproxy.deviceidentifierforvendor"),
        v10,
        v9,
        v11))
  {
    if (v17 && v7)
    {
      v12 = +[_LSDeviceIdentifierManager sharedInstance](&OBJC_CLASS____LSDeviceIdentifierManager, "sharedInstance");
      [(id)getUMUserManagerClass() sharedManager];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 currentPersona];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 cacheForPersona:v14];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 getIdentifierOfType:*(void *)(a1 + 48) vendorName:v17 bundleIdentifier:v7 completionHandler:*(void *)(a1 + 40)];

LABEL_12:
      goto LABEL_13;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_13:
}

void __90___LSDDeviceIdentifierClient_urlContainsDeviceIdentifierForAdvertising_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [a2 UUIDString];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(v3, "containsString:"));
}

@end
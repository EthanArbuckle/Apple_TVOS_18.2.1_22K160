@interface MIHelperServiceFrameworkClient
+ (id)sharedInstance;
- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (BOOL)purgeInstallCoordinationPromiseStagingDirectoryForUUID:(id)a3 keepStagingDirectory:(BOOL)a4 error:(id *)a5;
- (BOOL)removeDeveloperAppAtURL:(id)a3 error:(id *)a4;
- (BOOL)removeWrappedAppWithBundleID:(id)a3 atURL:(id)a4 error:(id *)a5;
- (NSXPCConnection)xpcConnection;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_sharedConnection;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)installMacDeveloperAppAtURL:(id)a3 toURL:(id)a4 targetURLType:(unint64_t)a5 error:(id *)a6;
- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7;
- (void)_invalidateObject;
- (void)dealloc;
- (void)setXpcConnection:(id)a3;
@end

@implementation MIHelperServiceFrameworkClient

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  return (id)sharedInstance_sharedInstance;
}

void __48__MIHelperServiceFrameworkClient_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (void)_invalidateObject
{
  obj = self;
  objc_sync_enter(obj);
  v2 = -[MIHelperServiceFrameworkClient xpcConnection](obj, "xpcConnection");
  [v2 invalidate];

  -[MIHelperServiceFrameworkClient setXpcConnection:](obj, "setXpcConnection:", 0LL);
  objc_sync_exit(obj);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIHelperServiceFrameworkClient;
  -[MIHelperServiceFrameworkClient dealloc](&v3, sel_dealloc);
}

- (id)_sharedConnection
{
  v2 = self;
  objc_sync_enter(v2);
  -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    goto LABEL_4;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
  -[MIHelperServiceFrameworkClient setXpcConnection:](v2, "setXpcConnection:", v4);
  v5 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
  if (v5)
  {
    MobileInstallationHelperServiceProtocolInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    [v7 setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    uint64_t v8 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke;
    v15[3] = &unk_189E41928;
    objc_copyWeak(&v16, &location);
    v9 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    [v9 setInterruptionHandler:v15];

    v13[0] = v8;
    v13[1] = 3221225472LL;
    v13[2] = __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2;
    v13[3] = &unk_189E41928;
    objc_copyWeak(&v14, &location);
    v10 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    [v10 setInvalidationHandler:v13];
    v11 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
    [v11 resume];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
LABEL_4:
    v5 = -[MIHelperServiceFrameworkClient xpcConnection](v2, "xpcConnection");
  }

  objc_sync_exit(v2);

  return v5;
}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

void __51__MIHelperServiceFrameworkClient__sharedConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateObject];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = -[MIHelperServiceFrameworkClient _sharedConnection](self, "_sharedConnection");
  v7 = v5;
  if (v5)
  {
    [v5 remoteObjectProxyWithErrorHandler:v4];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIHelperServiceFrameworkClient _remoteObjectProxyWithErrorHandler:]",  82LL,  (void *)*MEMORY[0x189610040],  4LL,  0LL,  0LL,  @"Failed to get XPC connection",  v6,  v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = -[MIHelperServiceFrameworkClient _sharedConnection](self, "_sharedConnection");
  v7 = v5;
  if (v5)
  {
    [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _CreateAndLogError( (uint64_t)"-[MIHelperServiceFrameworkClient _synchronousRemoteObjectProxyWithErrorHandler:]",  93LL,  (void *)*MEMORY[0x189610040],  4LL,  0LL,  0LL,  @"Failed to get XPC connection",  v6,  v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v9);

    uint64_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)purgeInstallCoordinationPromiseStagingDirectoryForUUID:(id)a3 keepStagingDirectory:(BOOL)a4 error:(id *)a5
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (a5) {
    *a5 = v7;
  }

  return 0;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x189610078];
  uint64_t v13 = *MEMORY[0x1896100D0];
  id v14 = a4;
  id v15 = a3;
  [a5 objectForKey:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 infoDictionaryArrayToBundleRecordArray:v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  v19 = -[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:]( self,  "createWrappedAppForInstalledBundleIdentifier:inTargetDirectory:installationRecords:onBehalfOf:error:",  v15,  v14,  v17,  v21,  a7);
  return v19;
}

- (id)createWrappedAppForInstalledBundleIdentifier:(id)a3 inTargetDirectory:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0LL;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x189610078];
  uint64_t v13 = *MEMORY[0x1896100D0];
  id v14 = a4;
  id v15 = a3;
  [a5 objectForKey:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 infoDictionaryArrayToBundleRecordArray:v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v18 = *(_OWORD *)&a6->var0[4];
  v20[0] = *(_OWORD *)a6->var0;
  v20[1] = v18;
  LOBYTE(a7) = -[MIHelperServiceFrameworkClient createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:]( self,  "createWrappedAppForInstalledBundleIdentifier:atTargetURL:installationRecords:onBehalfOf:error:",  v15,  v14,  v17,  v20,  a7);

  return (char)a7;
}

- (BOOL)createWrappedAppForInstalledBundleIdentifier:(id)a3 atTargetURL:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationInfo:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v12 = (void *)MEMORY[0x189610078];
  uint64_t v13 = *MEMORY[0x1896100D0];
  id v14 = a4;
  id v15 = a3;
  [a5 objectForKey:v13];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 infoDictionaryArrayToBundleRecordArray:v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v18 = *(_OWORD *)&a6->var0[4];
  v21[0] = *(_OWORD *)a6->var0;
  v21[1] = v18;
  v19 = -[MIHelperServiceFrameworkClient updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:]( self,  "updateWrappedAppAt:forInstalledBundleIdentifier:installationRecords:onBehalfOf:error:",  v15,  v14,  v17,  v21,  a7);
  return v19;
}

- (id)updateWrappedAppAt:(id)a3 forInstalledBundleIdentifier:(id)a4 installationRecords:(id)a5 onBehalfOf:(id *)a6 error:(id *)a7
{
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7) {
    *a7 = v9;
  }

  return 0LL;
}

- (BOOL)removeWrappedAppWithBundleID:(id)a3 atURL:(id)a4 error:(id *)a5
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (a5 && v7) {
    *a5 = v7;
  }

  return 0;
}

- (id)installMacDeveloperAppAtURL:(id)a3 toURL:(id)a4 targetURLType:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a6) {
    *a6 = v8;
  }

  return 0LL;
}

- (BOOL)removeDeveloperAppAtURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (a4) {
    *a4 = v6;
  }

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
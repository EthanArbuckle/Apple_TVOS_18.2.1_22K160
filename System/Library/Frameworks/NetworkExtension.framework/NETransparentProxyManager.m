@interface NETransparentProxyManager
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
+ (void)loadEverythingFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isFromMDM;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NETransparentProxyManager)init;
- (void)additionalSetup;
- (void)loadFromPreferencesWithCompletionHandler:(id)a3;
@end

@implementation NETransparentProxyManager

- (NETransparentProxyManager)init
{
  v3 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NETunnelProviderSession), 1);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NETransparentProxyManager;
  v4 = -[NEVPNManager initWithGrade:connection:tunnelType:](&v7, sel_initWithGrade_connection_tunnelType_, 1LL, v3, 2LL);
  v5 = v4;
  if (v4) {
    v4->super._hasLoaded = 1;
  }

  return v5;
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return a3 == 4;
}

- (void)additionalSetup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 VPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 protocol];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [v10 providerBundleIdentifier];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  id v6 = v5;

  [v10 setProviderBundleIdentifier:v6];
  [MEMORY[0x1896077F8] mainBundle];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 bundleIdentifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setPluginType:v8];
  v9 = -[NEVPNManager configuration](self, "configuration");
  if (v9) {
    v9[20] = 0LL;
  }
}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NEVPNManager configurationManager]();
    -[NEVPNManager configuration](self, "configuration");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identifier];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_18A090918;
    v8[4] = self;
    id v9 = v4;
    [v5 loadConfigurationWithID:v7 withCompletionQueue:MEMORY[0x1895F8AE0] handler:v8];
  }
}

- (BOOL)isFromMDM
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 payloadInfo];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    return 0;
  }
  v5 = -[NEVPNManager configuration](self, "configuration");
  [v5 payloadInfo];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = [v6 profileSource] == 2;

  return v7;
}

void __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Got an error while loading a configuration: %@",  (uint8_t *)&v22,  0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();

    goto LABEL_15;
  }

  if (!v5)
  {
    ne_log_obj();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) configuration];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 identifier];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEFAULT,  "No configuration found with ID %@",  (uint8_t *)&v22,  0xCu);
    }

    goto LABEL_14;
  }

  [*(id *)(a1 + 32) setConfiguration:v5];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = +[NEVPNManager loadedManagers]();
  [*(id *)(a1 + 32) configuration];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 identifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v10 forKeyedSubscript:v13];

  [*(id *)(a1 + 32) connection];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    uint64_t v15 = v14[7];

    if (v15)
    {
LABEL_14:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      goto LABEL_15;
    }
  }

  [*(id *)(a1 + 32) connection];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) configuration];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 identifier];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16) {
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v16,  v18,  0LL,  *(void **)(a1 + 40));
  }

LABEL_15:
  objc_sync_exit(v7);
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v3 = completionHandler;
  if (v3)
  {
    id v4 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_18A090850;
    id v7 = v3;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v6];
  }
}

+ (void)loadEverythingFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_opt_self();
  g_noAppFilter = 1;
  +[NETransparentProxyManager loadAllFromPreferencesWithCompletionHandler:]( &OBJC_CLASS___NETransparentProxyManager,  "loadAllFromPreferencesWithCompletionHandler:",  v3);
}

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  id v29 = objc_alloc_init(MEMORY[0x189603FA8]);
  v26 = v4;
  v27 = v5;
  if (!v5)
  {
    v42[0] = 0LL;
    v42[1] = v42;
    v42[2] = 0x3032000000LL;
    v42[3] = __Block_byref_object_copy__131;
    v42[4] = __Block_byref_object_dispose__132;
    id v43 = 0LL;
    group = dispatch_group_create();
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (!v9) {
      goto LABEL_25;
    }
    uint64_t v10 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v12 VPN];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          [v12 VPN];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 protocol];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v15 type] == 4)
          {
            [v12 VPN];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v17 = [v16 tunnelType] == 2;

            if (v17)
            {
              [v12 pluginType];
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((isa_nsstring(v18) & 1) != 0)
              {
                v19 = objc_alloc_init(&OBJC_CLASS___NETransparentProxyManager);
                -[NEVPNManager setConfiguration:](v19, "setConfiguration:", v12);
                [v29 addObject:v19];
                v20 = +[NEVPNManager loadedManagers]();
                [v12 identifier];
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                [v20 setObject:v19 forKeyedSubscript:v21];

                if (v19) {
                  v19->super._hasLoaded = 1;
                }
                dispatch_group_enter(group);
                -[NEVPNManager connection](v19, "connection");
                int v22 = (void *)objc_claimAutoreleasedReturnValue();
                [v12 identifier];
                id v23 = (void *)objc_claimAutoreleasedReturnValue();
                v35[0] = MEMORY[0x1895F87A8];
                v35[1] = 3221225472LL;
                v35[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6;
                v35[3] = &unk_18A090480;
                v35[4] = v12;
                v37 = v42;
                v36 = group;
                if (v22) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v22,  v23,  0LL,  v35);
                }
              }

              else
              {
                ne_log_obj();
                v19 = (NETransparentProxyManager *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
                {
                  [v12 name];
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v45 = v25;
                  _os_log_impl( &dword_1876B1000,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Skipping configuration %@ because it has an invalid plugin type",  buf,  0xCu);
                }
              }

              goto LABEL_23;
            }
          }

          else
          {
          }
        }

        ne_log_obj();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          [v12 name];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_impl( &dword_1876B1000,  (os_log_t)v18,  OS_LOG_TYPE_DEFAULT,  "Skipping configuration %@ because it is of the wrong type",  buf,  0xCu);
        }

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) name];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Error creating connection for configuration %@: %@",  (uint8_t *)&v7,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_8( uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end
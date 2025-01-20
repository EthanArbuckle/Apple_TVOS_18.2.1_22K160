@interface NEAppProxyProviderManager
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (NEAppProxyProviderManager)init;
@end

@implementation NEAppProxyProviderManager

- (NEAppProxyProviderManager)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "MDM must be used to create NEAppProxyProvider configurations",  v5,  2u);
  }

  return 0LL;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEVPNManager loadedManagers]();
    v6 = +[NEVPNManager configurationManager]();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_18A0904D0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v7];
  }
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v29 = a2;
  id v5 = a3;
  uint64_t v27 = a1;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  id v30 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = __Block_byref_object_copy__180;
  v47 = __Block_byref_object_dispose__181;
  id v6 = v5;
  id v48 = v6;
  v26 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v6);
    id v8 = (void *)v44[5];
    v44[5] = v7;

    uint64_t v9 = v44[5];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (!v29 || v9 || !objc_msgSend(v29, "count", v26))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    goto LABEL_29;
  }

  group = dispatch_group_create();
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v10 = v29;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v11) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)v40;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v10);
      }
      v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      [v14 appVPN];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        [v14 appVPN];
        v16 = (NEAppProxyProviderManager *)objc_claimAutoreleasedReturnValue();
        v17 = -[NEVPNManager protocol](v16, "protocol");
        if ([v17 type] == 4)
        {
          [v14 appVPN];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v19 = [v18 tunnelType] == 2;

          if (!v19) {
            continue;
          }
          [v14 pluginType];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v15)
            && !+[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v15))
          {
            v20 = objc_alloc(&OBJC_CLASS___NEAppProxyProviderManager);
            [v14 appVPN];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[NETunnelProviderManager initWithSessionType:tunnelType:]( v20,  "initWithSessionType:tunnelType:",  2,  [v21 tunnelType]);

            -[NEVPNManager setConfiguration:](v16, "setConfiguration:", v14);
            [v30 addObject:v16];
            v22 = +[NEVPNManager loadedManagers]();
            [v14 identifier];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 setObject:v16 forKeyedSubscript:v23];

            if (v16) {
              v16->super.super._hasLoaded = 1;
            }
            dispatch_group_enter(group);
            v24 = -[NEVPNManager connection](v16, "connection");
            [v14 identifier];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x1895F87A8];
            v36[1] = 3221225472LL;
            v36[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4;
            v36[3] = &unk_18A090480;
            v36[4] = v14;
            v38 = &v43;
            v37 = group;
            if (v24) {
              -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v24,  v25,  0LL,  v36);
            }

LABEL_23:
          }

          continue;
        }

        goto LABEL_23;
      }
    }

    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  }

  while (v11);
LABEL_27:

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5;
  block[3] = &unk_18A0904A8;
  v35 = &v43;
  id v33 = v30;
  id v34 = *(id *)(v27 + 32);
  dispatch_group_notify(group, MEMORY[0x1895F8AE0], block);

LABEL_29:
  _Block_object_dispose(&v43, 8);

  objc_sync_exit(obj);
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) identifier];
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

uint64_t __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5( uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end
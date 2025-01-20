@interface NWAppStateHandler
- (BOOL)currentForegroundStateForProcessWithPid:(int)a3;
- (BOOL)identifierShouldBeIgnored:(id)a3;
- (BOOL)rbsProcessStateToForeground:(id)a3;
- (NWAppStateHandler)init;
- (id)trackerForPid:(int)a3;
- (void)_removeStateTracker:(id)a3;
- (void)handleStateUpdate:(id)a3 forProcess:(id)a4;
@end

@implementation NWAppStateHandler

- (id)trackerForPid:(int)a3
{
  uint64_t v8 = 0LL;
  v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0LL;
  appBundlesMonitored = self->_appBundlesMonitored;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __35__NWAppStateHandler_trackerForPid___block_invoke;
  v6[3] = &unk_18A1B62E8;
  int v7 = a3;
  v6[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( appBundlesMonitored,  "enumerateKeysAndObjectsUsingBlock:",  v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__NWAppStateHandler_trackerForPid___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 pid] == *(_DWORD *)(a1 + 40))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v11);
          *a4 = 1;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = self->_appBundlesMonitored;
  objc_sync_enter(v5);
  -[NWAppStateHandler trackerForPid:](self, "trackerForPid:", v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v6 != 0LL;

  objc_sync_exit(v5);
  return v3;
}

- (void)_removeStateTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[NWAppStateHandler _removeStateTracker:].cold.1();
  }
  id v9 = v4;
  uint64_t v5 = [v4 identifier];
  if (!v5) {
    -[NWAppStateHandler _removeStateTracker:].cold.2();
  }
  id v6 = (void *)v5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_appBundlesMonitored, "objectForKeyedSubscript:", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    -[NWAppStateHandler _removeStateTracker:].cold.3();
  }
  uint64_t v8 = v7;
  [v7 removeObject:v9];
  if (![v8 count]) {
    -[NSMutableDictionary removeObjectForKey:](self->_appBundlesMonitored, "removeObjectForKey:", v6);
  }
}

- (BOOL)identifierShouldBeIgnored:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (identifierShouldBeIgnored__onceToken != -1)
  {
    dispatch_once(&identifierShouldBeIgnored__onceToken, &__block_literal_global_0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }

  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  char v5 = [(id)identifierShouldBeIgnored__kIdentifiersToIgnore containsObject:v4];
LABEL_6:

  return v5;
}

void __47__NWAppStateHandler_identifierShouldBeIgnored___block_invoke()
{
  v0 = (void *)identifierShouldBeIgnored__kIdentifiersToIgnore;
  identifierShouldBeIgnored__kIdentifiersToIgnore = (uint64_t)&unk_18A1C6160;
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v7 identity];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 embeddedApplicationIdentifier];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    [v8 xpcServiceIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (![v7 hasConsistentLaunchdJob]
        || ([v7 consistentJobLabel], (id v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        [v7 bundle];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  if (!-[NWAppStateHandler identifierShouldBeIgnored:](self, "identifierShouldBeIgnored:", v9))
  {
    if (!v9)
    {
      NStatGetLog();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v7;
        _os_log_impl( &dword_187FF5000,  v27,  OS_LOG_TYPE_ERROR,  "handleStateUpdate no identifier from process %@",  buf,  0xCu);
      }

      NStatGetLog();
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v6;
        _os_log_impl( &dword_187FF5000,  v12,  OS_LOG_TYPE_ERROR,  "handleStateUpdate failed identifier lookup was from update %@",  buf,  0xCu);
      }

      goto LABEL_33;
    }

    uint64_t v11 = [v7 pid];
    pid_to_uuid(v11);
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v6 state];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v14 = -[NWAppStateHandler rbsProcessStateToForeground:](self, "rbsProcessStateToForeground:", v13);

    obj = self->_appBundlesMonitored;
    objc_sync_enter(obj);
    uint64_t v15 = -[NWAppStateHandler trackerForPid:](self, "trackerForPid:", v11);
    v16 = (NWAppStateTracker *)v15;
    if (!v14)
    {
      if (v15) {
        -[NWAppStateHandler _removeStateTracker:](self, "_removeStateTracker:", v15);
      }
      goto LABEL_32;
    }

    [v6 state];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 taskState];

    if (v18)
    {
      if (!v16)
      {
LABEL_16:
        v25 = objc_alloc_init(&OBJC_CLASS___NWAppStateTracker);

        if (!v25)
        {
          v16 = 0LL;
          goto LABEL_32;
        }

        -[NWAppStateTracker setIdentifier:](v25, "setIdentifier:", v9);
        -[NWAppStateTracker setUuid:](v25, "setUuid:", v12);
        -[NWAppStateTracker setPid:](v25, "setPid:", v11);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appBundlesMonitored, "objectForKeyedSubscript:", v9);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x189603FE0]);
          -[NSMutableDictionary setObject:forKey:](self->_appBundlesMonitored, "setObject:forKey:", v26, v9);
        }

        [v26 addObject:v25];
        goto LABEL_31;
      }
      v19 = -[NWAppStateTracker uuid](v16, "uuid");
      char v20 = [v19 isEqual:v12];

      if ((v20 & 1) != 0)
      {
        v21 = -[NWAppStateTracker identifier](v16, "identifier");
        char v22 = [v21 isEqualToString:v9];

        if ((v22 & 1) != 0)
        {
LABEL_32:

          objc_sync_exit(obj);
LABEL_33:

          goto LABEL_34;
        }
        v23 = -[NWAppStateTracker identifier](v16, "identifier");
        NStatGetLog();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v31 = v11;
          *(_WORD *)&v31[4] = 2112;
          *(void *)&v31[6] = v9;
          __int16 v32 = 2112;
          v33 = v23;
          _os_log_impl( &dword_187FF5000,  v24,  OS_LOG_TYPE_DEFAULT,  "State change notification for pid %d now has bundle %@, not matching previous %@",  buf,  0x1Cu);
        }

        -[NWAppStateHandler _removeStateTracker:](self, "_removeStateTracker:", v16);
        goto LABEL_16;
      }

      NStatGetLog();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        v28 = -[NWAppStateTracker uuid](v16, "uuid");
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v11;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v12;
        __int16 v32 = 2112;
        v33 = v28;
        _os_log_impl( &dword_187FF5000,  (os_log_t)v26,  OS_LOG_TYPE_ERROR,  "State change notification for pid %d has uuid %@, not matching previous %@",  buf,  0x1Cu);
      }
    }

    else
    {
      NStatGetLog();
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v16;
        _os_log_impl(&dword_187FF5000, (os_log_t)v26, OS_LOG_TYPE_ERROR, "Process state is unknown %@", buf, 0xCu);
      }
    }

    v25 = v16;
LABEL_31:

    v16 = v25;
    goto LABEL_32;
  }

- (BOOL)rbsProcessStateToForeground:(id)a3
{
  id v3 = a3;
  int v4 = [v3 taskState];
  if (v4 == 4 || v4 == 2)
  {
    [v3 endowmentNamespaces];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 containsObject:@"com.apple.frontboard.visibility"];
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NWAppStateHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWAppStateHandler;
  v2 = -[NWAppStateHandler init](&v8, sel_init);
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    appBundlesMonitored = v2->_appBundlesMonitored;
    v2->_appBundlesMonitored = v3;

    char v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    appsWithStates = v2->_appsWithStates;
    v2->_appsWithStates = v5;

    if (!v2->_appBundlesMonitored || !v2->_appsWithStates)
    {

      v2 = 0LL;
    }
  }

  objc_storeStrong(&sharedInstance, v2);
  return v2;
}

- (void).cxx_destruct
{
}

- (void)_removeStateTracker:.cold.1()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 84, "stateTracker != nil");
}

- (void)_removeStateTracker:.cold.2()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 86, "identifier != nil");
}

- (void)_removeStateTracker:.cold.3()
{
}

@end
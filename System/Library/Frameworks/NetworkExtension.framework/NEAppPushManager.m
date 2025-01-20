@interface NEAppPushManager
+ (id)loadedManagers;
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)establishSessionManagerConnectionWithConfigurationID:(void *)a1;
- (BOOL)isActive;
- (BOOL)isEnabled;
- (NEAppPushManager)init;
- (NSArray)matchPrivateLTENetworks;
- (NSArray)matchSSIDs;
- (NSDictionary)providerConfiguration;
- (NSString)localizedDescription;
- (NSString)providerBundleIdentifier;
- (id)delegate;
- (void)cancelSessionManagerConnection;
- (void)dealloc;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setMatchPrivateLTENetworks:(NSArray *)matchPrivateLTENetworks;
- (void)setMatchSSIDs:(NSArray *)matchSSIDs;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
@end

@implementation NEAppPushManager

- (NEAppPushManager)init
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!self) {
    return 0LL;
  }
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NEAppPushManager;
  v2 = -[NEAppPushManager init](&v20, sel_init);
  if (v2)
  {
    if (+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
    {
      ne_log_obj();
      v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v2;
        _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "%@ objects cannot be instantiated from NEProvider processes",  buf,  0xCu);
      }

      return 0LL;
    }

    [MEMORY[0x1896077F8] mainBundle];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 infoDictionary];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:*MEMORY[0x189604AA0]];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896077F8] mainBundle];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 bundleIdentifier];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 infoDictionary];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKey:*MEMORY[0x189604E10]];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v11 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v6,  1LL);
    objc_setProperty_atomic_copy(v2, v12, v11, 32LL);

    v13 = objc_alloc_init(&OBJC_CLASS___NEAppPush);
    objc_msgSend(objc_getProperty(v2, v14, 32, 1), "setAppPush:", v13);

    objc_msgSend(objc_getProperty(v2, v15, 32, 1), "setApplication:", v8);
    objc_msgSend(objc_getProperty(v2, v16, 32, 1), "setApplicationName:", v6);
    objc_msgSend(objc_getProperty(v2, v17, 32, 1), "appPush");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setPluginType:v8];

    v2->_nesmConnection = 0LL;
    v2->_active = 0;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEAppPushManager;
  -[NEAppPushManager dealloc](&v3, sel_dealloc);
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    v6 = +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
    if (self) {
      id Property = objc_getProperty(self, v5, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property identifier];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v9[3] = &unk_18A090918;
    v9[4] = self;
    id v10 = v4;
    [v6 loadConfigurationWithID:v8 withCompletionQueue:MEMORY[0x1895F8AE0] handler:v9];
  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5 && objc_getProperty(v5, v6, 32LL, 1))
    {
      id v8 = objc_getProperty(v5, v7, 32LL, 1);
      [v8 identifier];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = (void *)[v9 copy];
      v11 = +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
      id v13 = objc_getProperty(v5, v12, 32LL, 1);
      uint64_t v14 = MEMORY[0x1895F8AE0];
      id v15 = MEMORY[0x1895F8AE0];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v17[3] = &unk_18A08F1A0;
      v17[4] = v5;
      id v16 = v10;
      id v18 = v16;
      id v19 = v4;
      [v11 removeConfiguration:v13 withCompletionQueue:v14 handler:v17];
    }

    else
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_18A090940;
      id v21 = v4;
      dispatch_async(MEMORY[0x1895F8AE0], block);
      id v16 = v21;
    }

    objc_sync_exit(v5);
  }
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  v45[1] = *MEMORY[0x1895F89C0];
  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!v5) {
      goto LABEL_7;
    }
    id v7 = objc_getProperty(v5, v6, 32LL, 1);
    if (!v7) {
      goto LABEL_7;
    }
    v9 = v7;
    id v10 = objc_getProperty(v5, v8, 32LL, 1);
    [v10 appPush];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v14 = objc_getProperty(v5, v13, 32LL, 1);
      char v15 = [v14 checkValidityAndCollectErrors:v12];

      if ((v15 & 1) != 0)
      {
        +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = objc_getProperty(v5, v17, 32LL, 1);
        uint64_t v19 = MEMORY[0x1895F8AE0];
        id v20 = MEMORY[0x1895F8AE0];
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 3221225472LL;
        v30[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_36;
        v30[3] = &unk_18A090968;
        v30[4] = v5;
        id v31 = v4;
        [v16 saveConfiguration:v18 withCompletionQueue:v19 handler:v30];
      }

      else
      {
        if ([v12 count])
        {
          uint64_t v38 = *MEMORY[0x1896075E0];
          [v12 componentsJoinedByString:@"\n"];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v25;
          [MEMORY[0x189603F68] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v26 = 0LL;
        }

        [MEMORY[0x189607870] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:v26];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1895F87A8];
        v32[1] = 3221225472LL;
        v32[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_35;
        v32[3] = &unk_18A0908C8;
        id v34 = v4;
        id v28 = v27;
        id v33 = v28;
        dispatch_async(MEMORY[0x1895F8AE0], v32);
        ne_log_obj();
        v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v5;
          __int16 v42 = 2112;
          id v43 = v28;
          _os_log_error_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_ERROR,  "%@ Failed to save the configuration: %@",  buf,  0x16u);
        }
      }
    }

    else
    {
LABEL_7:
      id v21 = (void *)MEMORY[0x189607870];
      uint64_t v44 = *MEMORY[0x1896075E0];
      v45[0] = @"invalid app push provider configuration";
      [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:v22];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_18A0908C8;
      id v37 = v4;
      id v12 = v23;
      id v36 = v12;
      dispatch_async(MEMORY[0x1895F8AE0], block);
      ne_log_obj();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v5;
        __int16 v42 = 2112;
        id v43 = v12;
        _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "%@ Failed to save the configuration as configuration is nil, %@",  buf,  0x16u);
      }
    }

    objc_sync_exit(v5);
  }
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 appPush];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  selfa = self;
  objc_sync_enter(selfa);
  id Property = selfa;
  if (selfa) {
    id Property = objc_getProperty(selfa, v4, 32LL, 1);
  }
  id v6 = Property;
  [v6 appPush];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (NSArray)matchSSIDs
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 appPush];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 matchSSIDs];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchSSIDs:(NSArray *)matchSSIDs
{
  v9 = matchSSIDs;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appPush];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setMatchSSIDs:v9];

  objc_sync_exit(v4);
}

- (NSArray)matchPrivateLTENetworks
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 appPush];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 matchPrivateLTENetworks];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchPrivateLTENetworks:(NSArray *)matchPrivateLTENetworks
{
  v9 = matchPrivateLTENetworks;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appPush];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setMatchPrivateLTENetworks:v9];

  objc_sync_exit(v4);
}

- (NSDictionary)providerConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 appPush];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 providerConfiguration];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSDictionary *)v7;
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
  v9 = providerConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appPush];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setProviderConfiguration:v9];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 name];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v6;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  id v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 setName:v8];

  objc_sync_exit(v4);
}

- (NSString)providerBundleIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 appPush];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 providerBundleIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v7;
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
  v9 = providerBundleIdentifier;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appPush];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setProviderBundleIdentifier:v9];

  objc_sync_exit(v4);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@: Failed to save the configuration: %@",  buf,  0x16u);
    }

    [MEMORY[0x189607870] errorWithDomain:@"NEAppPushErrorDomain" code:3 userInfo:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
  v9[3] = &unk_18A0908C8;
  id v6 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1895F8AE0], v9);
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEAppPushErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@: failed to remove the configuration: %@",  buf,  0x16u);
    }
  }

  +[NEAppPushManager loadedManagers]();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeObjectForKey:*(void *)(a1 + 40)];

  -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29;
  v9[3] = &unk_18A0908C8;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1895F8AE0], v9);
}

+ (id)loadedManagers
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__NEAppPushManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init != -1) {
    dispatch_once(&loadedManagers_managers_init, block);
  }
  return (id)loadedManagers_loadedManagers;
}

- (void)cancelSessionManagerConnection
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    if (v1[5])
    {
      ne_session_cancel();
      v1[5] = 0LL;
      ne_log_obj();
      id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        id v4 = objc_getProperty(v1, v3, 32LL, 1);
        [v4 identifier];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        int v6 = 138412546;
        id v7 = v1;
        __int16 v8 = 2112;
        v9 = v5;
        _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_INFO,  "%@ cancelled connection with nesessionmanager for configuration id: %@",  (uint8_t *)&v6,  0x16u);
      }
    }

    objc_sync_exit(v1);
  }

uint64_t __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __34__NEAppPushManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v3 = (void *)loadedManagers_loadedManagers;
  loadedManagers_loadedManagers = (uint64_t)v2;

  +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1895F8AE0] andHandler:v5];
}

void __34__NEAppPushManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v22;
    id v5 = (void *)MEMORY[0x1895F8AE0];
    uint64_t v6 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        uint64_t v15 = 0LL;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x3032000000LL;
        id v18 = __Block_byref_object_copy__6426;
        uint64_t v19 = __Block_byref_object_dispose__6427;
        [(id)loadedManagers_loadedManagers objectForKeyedSubscript:v8];
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v9 = (void *)v16[5];
        if (v9)
        {
          v14[0] = v6;
          v14[1] = 3221225472LL;
          v14[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
          v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v14[4] = *(void *)(a1 + 32);
          [v9 loadFromPreferencesWithCompletionHandler:v14];
        }

        else
        {
          +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          id v11 = v5;
          v13[0] = v6;
          v13[1] = 3221225472LL;
          v13[2] = __34__NEAppPushManager_loadedManagers__block_invoke_4;
          v13[3] = &unk_18A08C610;
          v13[4] = v8;
          v13[5] = &v15;
          v13[6] = *(void *)(a1 + 32);
          [v10 loadConfigurationWithID:v8 withCompletionQueue:v5 handler:v13];
        }

        _Block_object_dispose(&v15, 8);

        ++v7;
      }

      while (v3 != v7);
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v3);
  }
}

{
  id v3;
  os_log_s *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  if (v3)
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void *)(a1 + 32);
      uint64_t v6 = 138412546;
      uint64_t v7 = v5;
      uint64_t v8 = 2112;
      v9 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ loadFromPreferencesWithCompletionHandler failed. error: %@",  (uint8_t *)&v6,  0x16u);
    }
  }
}

void __34__NEAppPushManager_loadedManagers__block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)loadedManagers_loadedManagers objectForKeyedSubscript:a1[4]];
  uint64_t v8 = *(void *)(a1[5] + 8LL);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
  {
    if (v6)
    {
LABEL_3:
      ne_log_obj();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[6];
        int v19 = 138412546;
        uint64_t v20 = v18;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "%@ loadConfigurationWithID failed. error: %@",  (uint8_t *)&v19,  0x16u);
      }

      goto LABEL_11;
    }
  }

  else
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___NEAppPushManager);
    uint64_t v13 = *(void *)(a1[5] + 8LL);
    __int16 v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (v6) {
      goto LABEL_3;
    }
  }

  uint64_t v15 = *(void **)(*(void *)(a1[5] + 8LL) + 40LL);
  if (v15
    && (objc_setProperty_atomic_copy(v15, v10, v5, 32LL), (uint64_t v16 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL)) != 0))
  {
    *(_BYTE *)(v16 + 9) = 1;
    uint64_t v17 = *(void *)(*(void *)(a1[5] + 8LL) + 40LL);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  [(id)loadedManagers_loadedManagers setObject:v17 forKeyedSubscript:a1[4]];
LABEL_11:
}

void __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (!v6)
  {
    if (!v5 || ([v5 appPush], v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      ne_log_obj();
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        if (v26) {
          id Property = objc_getProperty(*(id *)(a1 + 32), v25, 32LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v28 = Property;
        [v28 identifier];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        int v32 = 138412546;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        id v35 = v29;
        _os_log_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_INFO,  "%@ No configuration found with ID %@",  (uint8_t *)&v32,  0x16u);
      }

      goto LABEL_24;
    }

    id v11 = *(void **)(a1 + 32);
    if (v11)
    {
      if (v11[5])
      {
LABEL_14:
        uint64_t v17 = *(void **)(a1 + 32);
        if (v17 && (objc_setProperty_atomic_copy(v17, v10, v5, 32LL), (uint64_t v18 = *(void *)(a1 + 32)) != 0))
        {
          *(_BYTE *)(v18 + 9) = 1;
          uint64_t v19 = *(void *)(a1 + 32);
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        +[NEAppPushManager loadedManagers]();
        __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v22 = *(id *)(a1 + 32);
        if (v22) {
          id v22 = objc_getProperty(v22, v20, 32LL, 1);
        }
        id v23 = v22;
        [v23 identifier];
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v19, v24);

LABEL_24:
        id v6 = 0LL;
LABEL_25:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
        goto LABEL_26;
      }

      id v12 = objc_getProperty(*(id *)(a1 + 32), v10, 32LL, 1);
    }

    else
    {
      id v12 = 0LL;
    }

    id v13 = v12;
    [v13 identifier];
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v11, v14);

    if (!v15)
    {
      ne_log_obj();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        int v32 = 138412290;
        uint64_t v33 = v31;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ establishSessionManagerConnectionWithConfigurationID failed.",  (uint8_t *)&v32,  0xCu);
      }

      [MEMORY[0x189607870] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:0];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6) {
        goto LABEL_25;
      }
    }

    goto LABEL_14;
  }

  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = *(void *)(a1 + 32);
    int v32 = 138412546;
    uint64_t v33 = v30;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@ Failed to load the configuration: %@",  (uint8_t *)&v32,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
LABEL_26:
  objc_sync_exit(v7);
}

- (BOOL)establishSessionManagerConnectionWithConfigurationID:(void *)a1
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    -[NEAppPushManager cancelSessionManagerConnection](v4);
    [v3 getUUIDBytes:v16];
    uint64_t v5 = ne_session_create();
    v4[5] = v5;
    BOOL v6 = v5 != 0;
    if (v5)
    {
      id v7 = MEMORY[0x1895F8AE0];
      ne_session_set_event_handler();

      id v8 = v3;
      ne_session_get_info();

      ne_log_obj();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_INFO,  "%@ established connection with nesm for configuration id: %@",  buf,  0x16u);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "%@: failed to create ne_session for configuration id: %@",  buf,  0x16u);
      }
    }

    objc_sync_exit(v4);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke( uint64_t a1,  int a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2 == 2)
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        id Property = objc_getProperty(*(id *)(a1 + 32), v4, 32LL, 1);
      }
      else {
        id Property = 0LL;
      }
      [Property identifier];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@ cancelling nesm connection for [%@]", buf, 0x16u);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      if (*(void *)(v8 + 40))
      {
        ne_session_release();
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          *(void *)(v9 + 40) = 0LL;
        }
      }
    }
  }

  else if (a2 == 1)
  {
    ne_session_get_info();
  }

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_22( uint64_t a1,  void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9250])
  {
    BOOL v5 = xpc_dictionary_get_BOOL(v4, "IsAppPushActive");
    ne_log_obj();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = "[inactive]";
      if (v5) {
        uint64_t v9 = "[active]";
      }
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      id v15 = v9;
      _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_INFO,  "%@ fetched extended status, new active value for [%@] is %s",  (uint8_t *)&v10,  0x20u);
    }

    [*(id *)(a1 + 32) setActive:v5];
  }
}

uint64_t __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_2( uint64_t a1,  xpc_object_t xdict)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "IsAppPushActive");
  ne_log_obj();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 32LL, 1);
    }
    else {
      id Property = 0LL;
    }
    uint64_t v8 = [Property identifier];
    uint64_t v9 = (void *)v8;
    int v10 = "[inactive]";
    int v12 = 138412802;
    uint64_t v13 = v6;
    if (v3) {
      int v10 = "[active]";
    }
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_INFO,  "%@ fetched extended status, new active value for [%@] is %s",  (uint8_t *)&v12,  0x20u);
  }

  return [*(id *)(a1 + 32) setActive:v3];
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEAppPushManager loadedManagers]();
    +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_18A0904D0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v7];
  }
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  uint64_t v33 = v6;
  uint64_t v31 = v5;
  if (v6)
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "%@ Failed to load the configurations: %@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v58 = __Block_byref_object_copy__6426;
    v59 = __Block_byref_object_dispose__6427;
    id v60 = 0LL;
    v54[0] = 0LL;
    v54[1] = v54;
    v54[2] = 0x3032000000LL;
    v54[3] = __Block_byref_object_copy__6426;
    v54[4] = __Block_byref_object_dispose__6427;
    id v55 = 0LL;
    id v8 = dispatch_group_create();
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v13)
          {
            [*(id *)(*((void *)&v50 + 1) + 8 * i) appPush];
            __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v15 = v14 == 0LL;

            if (!v15)
            {
              +[NEAppPushManager loadedManagers]();
              __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
              [v13 identifier];
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
              [v16 objectForKeyedSubscript:v17];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!*(void *)(*(void *)&buf[8] + 40LL))
              {
                id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
                uint64_t v20 = *(void **)(*(void *)&buf[8] + 40LL);
                *(void *)(*(void *)&buf[8] + 40LL) = v19;
              }

              dispatch_group_enter(v8);
              if (v18)
              {
                v38[0] = MEMORY[0x1895F87A8];
                v38[1] = 3221225472LL;
                v38[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26;
                v38[3] = &unk_18A08C688;
                __int16 v21 = v18;
                uint64_t v22 = *(void *)(a1 + 40);
                v41 = buf;
                __int16 v42 = v54;
                uint64_t v43 = v22;
                v39[0] = v21;
                v39[1] = v13;
                v40 = v8;
                -[NEAppPushManager loadFromPreferencesWithCompletionHandler:]( v21,  "loadFromPreferencesWithCompletionHandler:",  v38);

                id v23 = (id *)v39;
              }

              else
              {
                __int128 v24 = objc_alloc_init(&OBJC_CLASS___NEAppPushManager);
                v25 = +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
                [v13 identifier];
                uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v27 = MEMORY[0x1895F8AE0];
                id v28 = MEMORY[0x1895F8AE0];
                v44[0] = MEMORY[0x1895F87A8];
                v44[1] = 3221225472LL;
                v44[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24;
                v44[3] = &unk_18A08C660;
                __int16 v21 = v24;
                uint64_t v29 = *(void *)(a1 + 40);
                v45 = v21;
                uint64_t v49 = v29;
                v47 = v54;
                v48 = buf;
                v46 = v8;
                [v25 loadConfigurationWithID:v26 withCompletionQueue:v27 handler:v44];

                id v23 = (id *)&v45;
              }
            }
          }
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }

      while (v10);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27;
    block[3] = &unk_18A08C6B0;
    uint64_t v36 = v54;
    id v37 = buf;
    id v35 = *(id *)(a1 + 32);
    dispatch_group_notify(v8, MEMORY[0x1895F8AE0], block);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(buf, 8);
  }

  objc_sync_exit(obj);
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      int v22 = 138412546;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "%@ loadConfigurationWithID failed. error: %@",  (uint8_t *)&v22,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
  }

  else
  {
    id v8 = *(void **)(a1 + 32);
    [v5 identifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v8, v9);

    if ((v8 & 1) != 0)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      if (v11 && (objc_setProperty_atomic_copy(v11, v10, v5, 32LL), (uint64_t v12 = *(void *)(a1 + 32)) != 0))
      {
        *(_BYTE *)(v12 + 9) = 1;
        uint64_t v13 = *(void *)(a1 + 32);
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      +[NEAppPushManager loadedManagers]();
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 identifier];
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v13 forKeyedSubscript:v15];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }

    else
    {
      ne_log_obj();
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 64);
        int v22 = 138412290;
        uint64_t v23 = v21;
        _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "%@ establishSessionManagerConnectionWithConfigurationID failed.",  (uint8_t *)&v22,  0xCu);
      }

      uint64_t v17 = [MEMORY[0x189607870] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:0];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8LL);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 72);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@ loadFromPreferencesWithCompletionHandler failed. error: %@",  (uint8_t *)&v10,  0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a2);
    +[NEAppPushManager loadedManagers]();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) identifier];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 removeObjectForKey:v7];

    -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8 && *(void *)(v8 + 40)) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL))
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeAllObjects];
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    BOOL v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;
  }

  (*(void (**)(void))(a1[4] + 16LL))();
  objc_opt_self();
  if (!initCallKitXPCClient_client) {
    dispatch_async(MEMORY[0x1895F8AE0], &__block_literal_global_6454);
  }
}

void __40__NEAppPushManager_initCallKitXPCClient__block_invoke()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___NEAppPushCallKitXPCClient);
  uint64_t v1 = (void *)initCallKitXPCClient_client;
  initCallKitXPCClient_client = (uint64_t)v0;

  -[NEAppPushCallKitXPCClient registerVoIPMessagePayload](initCallKitXPCClient_client);
}

void __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  int v10 = *(void **)(a1 + 32);
  [v9 UUIDString];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = [v10 isEqualToString:v11];

  if ((_DWORD)v10)
  {
    id v12 = v8;
    ne_log_obj();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v20;
        _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "found manager[%@] to deliver incoming call payload to",  buf,  0xCu);
      }

      [v12 delegate];
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_42;
        block[3] = &unk_18A08FB50;
        uint64_t v23 = (os_log_s *)v12;
        id v24 = *(id *)(a1 + 40);
        id v25 = *(id *)(a1 + 48);
        dispatch_async(MEMORY[0x1895F8AE0], block);

        uint64_t v14 = v23;
LABEL_10:

        *a4 = 1;
        goto LABEL_11;
      }

      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v21 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v21;
      uint64_t v17 = "%@ app has not set the delegate to receive the incoming call payload";
      uint64_t v18 = v14;
      uint32_t v19 = 12;
    }

    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v9;
      uint64_t v17 = "%@ failed to find a manager for configuration id [%@]";
      uint64_t v18 = v14;
      uint32_t v19 = 22;
    }

    _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_10;
  }

uint64_t __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_42( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 appPushManager:*(void *)(a1 + 32) didReceiveIncomingCallWithUserInfo:*(void *)(a1 + 40)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

@end
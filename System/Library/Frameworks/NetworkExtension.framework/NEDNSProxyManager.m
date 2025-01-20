@interface NEDNSProxyManager
+ (NEDNSProxyManager)sharedManager;
+ (id)globalConfigurationManager;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (NEConfiguration)configuration;
- (NEDNSProxyManager)init;
- (NEDNSProxyManagerDelegate)delegate;
- (NEDNSProxyProviderProtocol)providerProtocol;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfiguration;
- (void)dealloc;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setProviderProtocol:(NEDNSProxyProviderProtocol *)providerProtocol;
@end

@implementation NEDNSProxyManager

- (NEDNSProxyManager)init
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "MDM must be used to create NEDNSProxyProvider configurations",  v5,  2u);
  }

  return 0LL;
}

- (void)dealloc
{
  if (self && self->_statusObserver)
  {
    [MEMORY[0x189607958] defaultCenter];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = self->_statusObserver;
    [v3 removeObserver:v4 name:@"com.apple.networkextension.statuschanged" object:self->_connection];
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEDNSProxyManager;
  -[NEDNSProxyManager dealloc](&v5, sel_dealloc);
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    if (v5) {
      id Property = objc_getProperty(v5, v6, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v8 = Property;
    uint64_t v9 = MEMORY[0x1895F8AE0];
    id v10 = MEMORY[0x1895F8AE0];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v11[3] = &unk_18A0908F0;
    v11[4] = v5;
    id v12 = v4;
    [v8 loadConfigurationsWithCompletionQueue:v9 handler:v11];

    objc_sync_exit(v5);
  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  objc_super v5 = self;
  objc_sync_enter(v5);
  v6 = -[NEDNSProxyManager configuration](v5, "configuration");
  if (v6)
  {
    v7 = -[NEDNSProxyManager configuration](v5, "configuration");
    [v7 payloadInfo];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (v5) {
        id Property = objc_getProperty(v5, v9, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v14 = Property;
      v15 = -[NEDNSProxyManager configuration](v5, "configuration");
      uint64_t v16 = MEMORY[0x1895F8AE0];
      id v17 = MEMORY[0x1895F8AE0];
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_18A08E748;
      id v19 = v4;
      [v14 removeConfiguration:v15 withCompletionQueue:v16 handler:v18];
      id v10 = &v19;

      goto LABEL_11;
    }

    if (v4)
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v20[3] = &unk_18A090940;
      id v10 = &v21;
      id v21 = v4;
      v11 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      id v12 = v20;
LABEL_7:
      dispatch_async(v11, v12);
LABEL_11:
    }
  }

  else if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v10 = &v23;
    id v23 = v4;
    v11 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    id v12 = block;
    goto LABEL_7;
  }

  objc_sync_exit(v5);
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    v7 = -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
    if (v7)
    {
      -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 providerBundleIdentifier];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      id v6 = v9;

      -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setProviderBundleIdentifier:v6];

      id v12 = objc_getProperty(v5, v11, 16LL, 1);
      [v12 pluginType];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        id v15 = objc_getProperty(v5, v14, 16LL, 1);
        [v15 pluginType];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEDNSProxyManager providerProtocol](v5, "providerProtocol");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setPluginType:v16];
      }
      v18 = -[NEDNSProxyManager configuration](v5, "configuration");
      if (v18) {
        v18[20] = 0LL;
      }

      id v20 = objc_getProperty(v5, v19, 16LL, 1);
      -[NEDNSProxyManager configuration](v5, "configuration");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = MEMORY[0x1895F8AE0];
      id v23 = MEMORY[0x1895F8AE0];
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v24[3] = &unk_18A08E748;
      id v25 = v4;
      [v20 saveConfiguration:v21 withCompletionQueue:v22 handler:v24];

      goto LABEL_13;
    }

    if (v4)
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      v26[3] = &unk_18A090940;
      id v27 = v4;
      dispatch_async(MEMORY[0x1895F8AE0], v26);
      id v6 = v27;
      goto LABEL_13;
    }
  }

  else if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v29 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], block);
    id v6 = v29;
LABEL_13:
  }

  objc_sync_exit(v5);
}

- (NEDNSProxyProviderProtocol)providerProtocol
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEDNSProxyManager configuration](v2, "configuration");
  [v3 dnsProxy];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 protocol];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEDNSProxyProviderProtocol *)v5;
}

- (void)setProviderProtocol:(NEDNSProxyProviderProtocol *)providerProtocol
{
  v7 = providerProtocol;
  v4 = self;
  objc_sync_enter(v4);
  -[NEDNSProxyManager configuration](v4, "configuration");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 dnsProxy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setProtocol:v7];

  objc_sync_exit(v4);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEDNSProxyManager configuration](v2, "configuration");
  [v3 dnsProxy];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 isEnabled];

  objc_sync_exit(v2);
  return v5;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  obj = self;
  objc_sync_enter(obj);
  v4 = -[NEDNSProxyManager configuration](obj, "configuration");
  [v4 dnsProxy];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setEnabled:v3];

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEDNSProxyManager configuration](v2, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  id v6 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  -[NEDNSProxyManager configuration](v4, "configuration");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v7 appendString:@"{"];
  -[NEDNSProxyManager localizedDescription](self, "localizedDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEDNSProxyManager isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEDNSProxyManager providerProtocol](self, "providerProtocol");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"providerProtocol" andIndent:v5 options:a4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (id)description
{
  return -[NEDNSProxyManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (NSUUID)identifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identifier];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)appBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 application];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isFromProfile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 payloadInfo];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (BOOL)isFromMDM
{
  if (!-[NEDNSProxyManager isFromProfile](self, "isFromProfile")) {
    return 0;
  }
  -[NEDNSProxyManager configuration](self, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 payloadInfo];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [v4 profileSource] == 2;

  return v5;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 payloadInfo];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (void)fetchStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self) {
    connection = self->_connection;
  }
  else {
    connection = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_18A0903B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1LL, 0LL, v7);
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NEDNSProxyManagerDelegate)delegate
{
  return (NEDNSProxyManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __54__NEDNSProxyManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    BOOL v3 = *(void **)(v2 + 24);
  }
  else {
    BOOL v3 = 0LL;
  }
  [v3 status];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSProxyErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSProxyErrorDomain" code:1 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    ne_log_obj();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      SEL v11 = "-[NEDNSProxyManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%s: failed to save the new configuration: %@",  buf,  0x16u);
    }
  }

  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_29;
    v7[3] = &unk_18A0908C8;
    id v9 = v6;
    id v8 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v7);
  }
}

void __60__NEDNSProxyManager_saveToPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSProxyErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSProxyErrorDomain" code:4 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[NEDNSProxyManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%s: failed to remove the configuration: %@",  buf,  0x16u);
    }
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_25;
    v6[3] = &unk_18A0908C8;
    id v8 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x1895F8AE0], v6);
  }
}

void __64__NEDNSProxyManager_removeFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v20 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5) {
    goto LABEL_22;
  }
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = v20;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v8)
  {

LABEL_18:
    -[NEDNSProxyManager createEmptyConfiguration](*(void **)(a1 + 32));
    id v9 = 0LL;
    goto LABEL_19;
  }

  id v9 = 0LL;
  uint64_t v10 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      [v12 dnsProxy];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = v13 == 0LL;

      if (!v14)
      {
        [v12 payloadInfo];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v16 = v15 == 0LL;

        if (!v16)
        {
          id v17 = v12;

          id v9 = v17;
          goto LABEL_15;
        }

        if (!v9) {
          id v9 = v12;
        }
      }
    }

    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8) {
      continue;
    }
    break;
  }

- (void)createEmptyConfiguration
{
  if (a1)
  {
    [MEMORY[0x1896077F8] mainBundle];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 infoDictionary];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKey:*MEMORY[0x189604AA0]];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      [MEMORY[0x1896077F8] mainBundle];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 bundleIdentifier];
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v5 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v18,  1LL);
    [a1 setConfiguration:v5];

    id v6 = objc_alloc_init(&OBJC_CLASS___NEDNSProxy);
    [a1 configuration];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setDnsProxy:v6];

    uint64_t v8 = objc_alloc(&OBJC_CLASS___NEDNSProxyProviderProtocol);
    objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v11 = -[NEDNSProxyProviderProtocol initWithPluginType:](v8, "initWithPluginType:", v10);
    [a1 configuration];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 dnsProxy];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setProtocol:v11];

    objc_msgSend(objc_getProperty(a1, v14, 16, 1), "pluginType");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 configuration];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setApplication:v15];

    [a1 configuration];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setApplicationName:v18];
  }

void __62__NEDNSProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  NEDNSProxyMapError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (NEDNSProxyManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1329);
  }
  id v2 = (void *)sharedManager_gDNSProxyManager;
  if (sharedManager_gDNSProxyManager) {
    id v3 = (id)sharedManager_gDNSProxyManager;
  }
  return (NEDNSProxyManager *)v2;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    +[NEDNSProxyManager globalConfigurationManager]();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v5[3] = &unk_18A090850;
    id v6 = v3;
    [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v5];
  }
}

+ (id)globalConfigurationManager
{
  if (globalConfigurationManager_onceToken != -1) {
    dispatch_once(&globalConfigurationManager_onceToken, &__block_literal_global_15);
  }
  return (id)globalConfigurationManager_gConfigurationManager;
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = dispatch_group_create();
  v35 = v5;
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x189603F18]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

  else
  {
    uint64_t v34 = a1;
    id v37 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (v12)
          {
            [*(id *)(*((void *)&v43 + 1) + 8 * i) dnsProxy];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v14 = v13 == 0LL;

            if (!v14)
            {
              dispatch_group_enter(v6);
              id v15 = objc_alloc(&OBJC_CLASS___NEDNSProxyManager);
              id v16 = v12;
              if (v15
                && (v47.receiver = v15,
                    v47.super_class = (Class)&OBJC_CLASS___NEDNSProxyManager,
                    id v17 = (id *)objc_msgSendSuper2(&v47, sel_init),
                    (id v18 = v17) != 0LL))
              {
                objc_storeStrong(v17 + 5, v12);
                uint64_t v19 = +[NEDNSProxyManager globalConfigurationManager]();
                id v20 = v18[2];
                v18[2] = (id)v19;

                id v21 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), 6);
                id v22 = v18[3];
                v18[3] = v21;

                *((_BYTE *)v18 + 8) = 1;
              }

              else
              {

                id v18 = 0LL;
              }

              v41[0] = MEMORY[0x1895F87A8];
              v41[1] = 3221225472LL;
              v41[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v41[3] = &unk_18A08E6F8;
              v41[4] = v16;
              v42 = v6;
              id v23 = v41;
              if (v18)
              {
                objc_initWeak(&location, v18);
                [MEMORY[0x189607958] defaultCenter];
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
                id v25 = v18[3];
                [MEMORY[0x189607988] mainQueue];
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
                v47.receiver = (id)MEMORY[0x1895F87A8];
                v47.super_class = (Class)3221225472LL;
                v48 = __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke;
                v49 = &unk_18A08E720;
                objc_copyWeak(&v50, &location);
                uint64_t v27 = [v24 addObserverForName:@"com.apple.networkextension.statuschanged" object:v25 queue:v26 usingBlock:&v47];
                id v28 = v18[4];
                void v18[4] = (id)v27;

                id v29 = v18[3];
                [v18 configuration];
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                [v30 identifier];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v29,  v31,  0LL,  v23);
                }

                objc_destroyWeak(&v50);
                objc_destroyWeak(&location);
              }

              [v37 addObject:v18];
            }
          }
        }

        uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }

      while (v9);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20;
    block[3] = &unk_18A0908C8;
    id v32 = *(id *)(v34 + 32);
    id v39 = v37;
    id v40 = v32;
    id v33 = v37;
    dispatch_group_notify(v6, MEMORY[0x1895F8AE0], block);
  }
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) name];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) identifier];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create a DNS proxy session for configuration %@ (%@): %@",  (uint8_t *)&v7,  0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __65__NEDNSProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __55__NEDNSProxyManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained delegate];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v2;
    if (v2) {
      [v2 dnsProxyStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

uint64_t __47__NEDNSProxyManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("dns proxy config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue;
  globalConfigurationManager_gChangeQueue = (uint64_t)v1;

  id v3 = -[NEConfigurationManager initForAllUsers](objc_alloc(&OBJC_CLASS___NEConfigurationManager), "initForAllUsers");
  id v4 = (void *)globalConfigurationManager_gConfigurationManager;
  globalConfigurationManager_gConfigurationManager = (uint64_t)v3;

  return [(id)globalConfigurationManager_gConfigurationManager setChangedQueue:globalConfigurationManager_gChangeQueue andHandler:&__block_literal_global_17];
}

void __47__NEDNSProxyManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 postNotificationName:@"com.apple.networkextension.dns-proxy-configuration-changed" object:0];
}

void __34__NEDNSProxyManager_sharedManager__block_invoke()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  dispatch_queue_t v1 = v10;
  if (v10)
  {
    id v2 = objc_alloc(&OBJC_CLASS___NEDNSProxyManager);
    id v3 = v10;
    if (v2)
    {
      v14.receiver = v2;
      v14.super_class = (Class)&OBJC_CLASS___NEDNSProxyManager;
      id v2 = (NEDNSProxyManager *)objc_msgSendSuper2(&v14, sel_init);
      if (v2)
      {
        objc_initWeak(&location, v2);
        id v4 = -[NEConfigurationManager initWithPluginType:]( objc_alloc(&OBJC_CLASS___NEConfigurationManager),  "initWithPluginType:",  v3);
        configurationManager = v2->_configurationManager;
        v2->_configurationManager = v4;

        id v6 = v2->_configurationManager;
        uint64_t v7 = MEMORY[0x1895F8AE0];
        id v8 = MEMORY[0x1895F8AE0];
        v11[0] = MEMORY[0x1895F87A8];
        v11[1] = 3221225472LL;
        v11[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke;
        v11[3] = &unk_18A08FD30;
        objc_copyWeak(&v12, &location);
        -[NEConfigurationManager setChangedQueue:andHandler:](v6, "setChangedQueue:andHandler:", v7, v11);

        -[NEDNSProxyManager createEmptyConfiguration](v2);
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
    }

    __int16 v9 = (void *)sharedManager_gDNSProxyManager;
    sharedManager_gDNSProxyManager = (uint64_t)v2;

    dispatch_queue_t v1 = v10;
  }
}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_18A08F268;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __55__NEDNSProxyManager_initDNSProxyManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.dns-proxy-configuration-changed" object:WeakRetained];
}

@end
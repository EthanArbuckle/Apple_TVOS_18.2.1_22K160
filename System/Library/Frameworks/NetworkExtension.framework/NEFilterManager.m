@interface NEFilterManager
+ (NEFilterManager)sharedManager;
+ (id)appConfigurationManager;
+ (id)globalConfigurationManager;
+ (id)sharedManagerWithSystemFilter;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
+ (void)loadMyFiltersFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)disableEncryptedDNSSettings;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (NEConfiguration)configuration;
- (NEFilterManager)init;
- (NEFilterManagerDelegate)delegate;
- (NEFilterManagerGrade)grade;
- (NEFilterProviderConfiguration)providerConfiguration;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initPrivate;
- (id)initWithConfiguration:(void *)a3 configurationManager:;
- (void)createEmptyConfiguration;
- (void)dealloc;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)initFilterManagerWithPluginType:(void *)a1;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableEncryptedDNSSettings:(BOOL)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setGrade:(NEFilterManagerGrade)grade;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setProviderConfiguration:(NEFilterProviderConfiguration *)providerConfiguration;
- (void)setupSessionWithCompletionHandler:(uint64_t)a1;
@end

@implementation NEFilterManager

- (NEFilterManager)init
{
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
  v5.super_class = (Class)&OBJC_CLASS___NEFilterManager;
  -[NEFilterManager dealloc](&v5, sel_dealloc);
}

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NEFilterManager;
  v2 = -[NEFilterManager init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = +[NEFilterManager appConfigurationManager]();
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = (NEConfigurationManager *)v3;

    -[NEFilterManager createEmptyConfiguration](v2);
    v2->_hasLoaded = 1;
  }

  return v2;
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
    v11[2] = __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke;
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
  -[NEFilterManager configuration](v5, "configuration");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[NEFilterManager configuration](v5, "configuration");
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
      v15 = -[NEFilterManager configuration](v5, "configuration");
      uint64_t v16 = MEMORY[0x1895F8AE0];
      id v17 = MEMORY[0x1895F8AE0];
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
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
      v20[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
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
    block[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke;
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
    -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 filterSockets];

      if (v11)
      {
        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 filterDataProviderBundleIdentifier];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 dataProviderURL];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        id v16 = v13;

        -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setFilterDataProviderBundleIdentifier:v16];
        v18 = -[NEFilterManager configuration](v5, "configuration");
        if (v18) {
          v18[20] = 0LL;
        }
      }

      -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = [v19 filterPackets];

      if (v20)
      {
        v22 = -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        [v22 filterPacketProviderBundleIdentifier];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        [v24 packetProviderURL];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        id v26 = v23;
        v27 = -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        [v27 setFilterPacketProviderBundleIdentifier:v26];
        v28 = -[NEFilterManager configuration](v5, "configuration");
        if (!v28 || (uint64_t v29 = v28[20], v28, !v29))
        {
          v30 = -[NEFilterManager configuration](v5, "configuration");
          if (v30) {
            v30[20] = 0LL;
          }
        }
      }

      id v31 = objc_getProperty(v5, v21, 16LL, 1);
      [v31 pluginType];
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        id v34 = objc_getProperty(v5, v33, 16LL, 1);
        [v34 pluginType];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[NEFilterManager providerConfiguration](v5, "providerConfiguration");
        [v36 setPluginType:v35];
      }

      id v37 = objc_getProperty(v5, v33, 16LL, 1);
      v38 = -[NEFilterManager configuration](v5, "configuration");
      uint64_t v39 = MEMORY[0x1895F8AE0];
      id v40 = MEMORY[0x1895F8AE0];
      v41[0] = MEMORY[0x1895F87A8];
      v41[1] = 3221225472LL;
      v41[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3;
      v41[3] = &unk_18A08E748;
      id v42 = v4;
      [v37 saveConfiguration:v38 withCompletionQueue:v39 handler:v41];
      objc_super v6 = &v42;

      goto LABEL_23;
    }

    if (v4)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_18A090940;
      objc_super v6 = &v44;
      id v44 = v4;
      v7 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      id v8 = block;
      goto LABEL_22;
    }
  }

  else if (v4)
  {
    v45[0] = MEMORY[0x1895F87A8];
    v45[1] = 3221225472LL;
    v45[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke;
    v45[3] = &unk_18A090940;
    objc_super v6 = &v46;
    id v46 = v4;
    v7 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    id v8 = v45;
LABEL_22:
    dispatch_async(v7, v8);
LABEL_23:
  }

  objc_sync_exit(v5);
}

- (NEFilterProviderConfiguration)providerConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 contentFilter];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 provider];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEFilterProviderConfiguration *)v5;
}

- (void)setProviderConfiguration:(NEFilterProviderConfiguration *)providerConfiguration
{
  v7 = providerConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  -[NEFilterManager configuration](v4, "configuration");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 contentFilter];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setProvider:v7];

  objc_sync_exit(v4);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 contentFilter];
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
  v4 = -[NEFilterManager configuration](obj, "configuration");
  [v4 contentFilter];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)disableEncryptedDNSSettings
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 contentFilter];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 disableEncryptedDNSSettings];

  objc_sync_exit(v2);
  return v5;
}

- (void)setDisableEncryptedDNSSettings:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  v4 = -[NEFilterManager configuration](obj, "configuration");
  [v4 contentFilter];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setDisableEncryptedDNSSettings:v3];

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  objc_super v6 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  -[NEFilterManager configuration](v4, "configuration");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v7 appendString:@"{"];
  -[NEFilterManager localizedDescription](self, "localizedDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEFilterManager isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEFilterManager providerConfiguration](self, "providerConfiguration");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"providerConfiguration" andIndent:v5 options:a4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (id)description
{
  return -[NEFilterManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (NEFilterManagerGrade)grade
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEFilterManager configuration](v2, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 contentFilter];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NEFilterManagerGrade v5 = [v4 grade];

  objc_sync_exit(v2);
  return v5;
}

- (void)setGrade:(NEFilterManagerGrade)grade
{
  obj = self;
  objc_sync_enter(obj);
  v4 = -[NEFilterManager configuration](obj, "configuration");
  [v4 contentFilter];
  NEFilterManagerGrade v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setGrade:grade];

  objc_sync_exit(obj);
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
  if (!-[NEFilterManager isFromProfile](self, "isFromProfile")) {
    return 0;
  }
  -[NEFilterManager configuration](self, "configuration");
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
  v7[2] = __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke;
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

- (NEFilterManagerDelegate)delegate
{
  return (NEFilterManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __52__NEFilterManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEFilterErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    NEFilterMapError(v3);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[NEFilterManager saveToPreferencesWithCompletionHandler:]_block_invoke_3";
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%s: failed to save the new configuration: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
    v8[3] = &unk_18A0908C8;
    id v10 = v7;
    id v9 = v5;
    dispatch_async(MEMORY[0x1895F8AE0], v8);
  }
}

uint64_t __58__NEFilterManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEFilterErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEFilterErrorDomain" code:4 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    NEFilterMapError(v3);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v12 = "-[NEFilterManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%s: failed to remove the configuration: %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    BOOL v5 = 0LL;
  }

  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_31;
    v8[3] = &unk_18A0908C8;
    id v10 = v7;
    id v9 = v5;
    dispatch_async(MEMORY[0x1895F8AE0], v8);
  }
}

uint64_t __62__NEFilterManager_removeFromPreferencesWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    NEFilterMapError(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {

LABEL_19:
    -[NEFilterManager createEmptyConfiguration](*(_BYTE **)(a1 + 32));
    id v11 = 0LL;
    goto LABEL_20;
  }

  id v11 = 0LL;
  uint64_t v12 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      [v14 contentFilter];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v16 = v15 == 0LL;

      if (!v16)
      {
        [v14 payloadInfo];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v18 = v17 == 0LL;

        if (!v18)
        {
          id v19 = v14;

          id v11 = v19;
          goto LABEL_16;
        }

        if (!v11) {
          id v11 = v14;
        }
      }
    }

    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10) {
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
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      [MEMORY[0x1896077F8] mainBundle];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 bundleIdentifier];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    if ((a1[9] & 1) != 0) {
      uint64_t v5 = 3LL;
    }
    else {
      uint64_t v5 = 1LL;
    }
    id v6 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v13,  v5);
    [a1 setConfiguration:v6];

    id v7 = objc_alloc_init(&OBJC_CLASS___NEContentFilter);
    [a1 configuration];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setContentFilter:v7];

    objc_msgSend(objc_getProperty(a1, v9, 16, 1), "pluginType");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 configuration];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setApplication:v10];

    [a1 configuration];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setApplicationName:v13];
  }

uint64_t __60__NEFilterManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

+ (id)appConfigurationManager
{
  if (appConfigurationManager_onceToken != -1) {
    dispatch_once(&appConfigurationManager_onceToken, &__block_literal_global_20);
  }
  return (id)appConfigurationManager_gAppConfgurationManager;
}

void __42__NEFilterManager_appConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  [MEMORY[0x1896077F8] mainBundle];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v1 = dispatch_queue_create("filter config app manager change queue", 0LL);
  id v2 = (void *)appConfigurationManager_gChangeQueue;
  appConfigurationManager_gChangeQueue = (uint64_t)v1;

  id v3 = -[NEConfigurationManager initWithPluginType:]( objc_alloc(&OBJC_CLASS___NEConfigurationManager),  "initWithPluginType:",  v5);
  id v4 = (void *)appConfigurationManager_gAppConfgurationManager;
  appConfigurationManager_gAppConfgurationManager = (uint64_t)v3;

  [(id)appConfigurationManager_gAppConfgurationManager setChangedQueue:appConfigurationManager_gChangeQueue andHandler:&__block_literal_global_22];
}

void __42__NEFilterManager_appConfigurationManager__block_invoke_2()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:0];
}

+ (NEFilterManager)sharedManager
{
  if (sharedManager_onceToken_5260 != -1) {
    dispatch_once(&sharedManager_onceToken_5260, &__block_literal_global_5261);
  }
  return (NEFilterManager *)(id)sharedManager_gFilterManager;
}

+ (id)sharedManagerWithSystemFilter
{
  if (sharedManagerWithSystemFilter_onceToken != -1) {
    dispatch_once(&sharedManagerWithSystemFilter_onceToken, &__block_literal_global_16);
  }
  return (id)sharedManagerWithSystemFilter_gFilterManager;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  +[NEFilterManager globalConfigurationManager]();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_18A090850;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v6];
}

+ (void)loadMyFiltersFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  +[NEFilterManager appConfigurationManager]();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_18A090850;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v6];
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = dispatch_group_create();
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x189603F18]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

  else
  {
    id v21 = v5;
    id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v14 contentFilter];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              dispatch_group_enter(v6);
              BOOL v16 = objc_alloc(&OBJC_CLASS___NEFilterManager);
              +[NEFilterManager appConfigurationManager]();
              id v17 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18) {
                *((_BYTE *)v18 + 8) = 1;
              }
              v26[0] = MEMORY[0x1895F87A8];
              v26[1] = 3221225472LL;
              v26[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_18A08E6F8;
              v26[4] = v14;
              __int128 v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              [v22 addObject:v18];
            }
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v11);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_27;
    block[3] = &unk_18A0908C8;
    id v19 = *(id *)(a1 + 32);
    id v24 = v22;
    id v25 = v19;
    id v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1895F8AE0], block);

    id v5 = v21;
  }
}

- (id)initWithConfiguration:(void *)a3 configurationManager:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_CLASS___NEFilterManager;
    id v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 5, a2);
      objc_storeStrong(a1 + 2, a3);
      id v9 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), 4);
      id v10 = a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
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
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create a content filter session for configuration %@ (%@): %@",  (uint8_t *)&v7,  0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)setupSessionWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    [MEMORY[0x189607958] defaultCenter];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = *(id *)(a1 + 24);
    [MEMORY[0x189607988] mainQueue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    id v14 = __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke;
    uint64_t v15 = &unk_18A08E720;
    objc_copyWeak(&v16, &location);
    uint64_t v7 = [v4 addObserverForName:@"com.apple.networkextension.statuschanged" object:v5 queue:v6 usingBlock:&v12];
    id v8 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v7;

    id v9 = *(id *)(a1 + 24);
    objc_msgSend((id)a1, "configuration", v12, v13, v14, v15);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v9, v11, 0LL, v3);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __69__NEFilterManager_loadMyFiltersFromPreferencesWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__NEFilterManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained delegate];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v2;
    if (v2) {
      [v2 filterStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

+ (id)globalConfigurationManager
{
  if (globalConfigurationManager_onceToken_5255 != -1) {
    dispatch_once(&globalConfigurationManager_onceToken_5255, &__block_literal_global_17_5256);
  }
  return (id)globalConfigurationManager_gConfigurationManager_5257;
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = dispatch_group_create();
  if (a3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x189603F18]);
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }

  else
  {
    id v21 = v5;
    id v22 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v14 contentFilter];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              dispatch_group_enter(v6);
              id v16 = objc_alloc(&OBJC_CLASS___NEFilterManager);
              +[NEFilterManager globalConfigurationManager]();
              id v17 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v18 = -[NEFilterManager initWithConfiguration:configurationManager:]((id *)&v16->super.isa, v14, v17);

              if (v18) {
                *((_BYTE *)v18 + 8) = 1;
              }
              v26[0] = MEMORY[0x1895F87A8];
              v26[1] = 3221225472LL;
              v26[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v26[3] = &unk_18A08E6F8;
              v26[4] = v14;
              __int128 v27 = v6;
              -[NEFilterManager setupSessionWithCompletionHandler:]((uint64_t)v18, v26);
              [v22 addObject:v18];
            }
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v11);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_25;
    block[3] = &unk_18A0908C8;
    id v19 = *(id *)(a1 + 32);
    id v24 = v22;
    id v25 = v19;
    id v20 = v22;
    dispatch_group_notify(v6, MEMORY[0x1895F8AE0], block);

    id v5 = v21;
  }
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
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
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create a content filter session for configuration %@ (%@): %@",  (uint8_t *)&v7,  0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __63__NEFilterManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __45__NEFilterManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("filter config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue_5259;
  globalConfigurationManager_gChangeQueue_5259 = (uint64_t)v1;

  id v3 = -[NEConfigurationManager initForAllUsers](objc_alloc(&OBJC_CLASS___NEConfigurationManager), "initForAllUsers");
  id v4 = (void *)globalConfigurationManager_gConfigurationManager_5257;
  globalConfigurationManager_gConfigurationManager_5257 = (uint64_t)v3;

  return [(id)globalConfigurationManager_gConfigurationManager_5257 setChangedQueue:globalConfigurationManager_gChangeQueue_5259 andHandler:&__block_literal_global_19];
}

void __45__NEFilterManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:0];
}

void __48__NEFilterManager_sharedManagerWithSystemFilter__block_invoke()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  if (v3)
  {
    dispatch_queue_t v1 = objc_alloc(&OBJC_CLASS___NEFilterManager);
    if (v1)
    {
      v1->_isSystemGradeFilter = 1;
      dispatch_queue_t v1 = (NEFilterManager *)-[NEFilterManager initFilterManagerWithPluginType:](v1, v3);
    }

    id v2 = (void *)sharedManagerWithSystemFilter_gFilterManager;
    sharedManagerWithSystemFilter_gFilterManager = (uint64_t)v1;
  }
}

- (void)initFilterManagerWithPluginType:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_CLASS___NEFilterManager;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      objc_initWeak(&location, a1);
      id v4 = -[NEConfigurationManager initWithPluginType:]( objc_alloc(&OBJC_CLASS___NEConfigurationManager),  "initWithPluginType:",  v3);
      id v5 = (void *)a1[2];
      a1[2] = v4;

      id v6 = (void *)a1[2];
      uint64_t v7 = MEMORY[0x1895F8AE0];
      id v8 = MEMORY[0x1895F8AE0];
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke;
      v10[3] = &unk_18A08FD30;
      objc_copyWeak(&v11, &location);
      [v6 setChangedQueue:v7 andHandler:v10];

      -[NEFilterManager createEmptyConfiguration](a1);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2;
  v6[3] = &unk_18A08F268;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __51__NEFilterManager_initFilterManagerWithPluginType___block_invoke_2(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.filter-configuration-changed" object:WeakRetained];
}

void __32__NEFilterManager_sharedManager__block_invoke()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  dispatch_queue_t v1 = v4;
  if (v4)
  {
    id v2 = -[NEFilterManager initFilterManagerWithPluginType:](objc_alloc(&OBJC_CLASS___NEFilterManager), v4);
    id v3 = (void *)sharedManager_gFilterManager;
    sharedManager_gFilterManager = (uint64_t)v2;

    dispatch_queue_t v1 = v4;
  }
}

@end
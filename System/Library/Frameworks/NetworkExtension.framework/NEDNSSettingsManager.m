@interface NEDNSSettingsManager
+ (NEDNSSettingsManager)sharedManager;
+ (id)globalConfigurationManager;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isConfigurationGradeEnterprise;
- (BOOL)isEnabled;
- (BOOL)isFromProfile;
- (NEDNSSettings)dnsSettings;
- (NEDNSSettingsManager)init;
- (NEDNSSettingsManagerDelegate)delegate;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NSArray)onDemandRules;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfigurationWithGrade:(void *)a1;
- (void)fetchStatusWithCompletionHandler:(id)a3;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setDelegate:(id)a3;
- (void)setDnsSettings:(NEDNSSettings *)dnsSettings;
- (void)setEnabled:(BOOL)a3;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
@end

@implementation NEDNSSettingsManager

- (NEDNSSettingsManager)init
{
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
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
    v11[2] = __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke;
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
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 40LL, 1))
  {
    id v8 = objc_getProperty(v5, v7, 40LL, 1);
    [v8 payloadInfo];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      id v14 = objc_getProperty(v5, v10, 16LL, 1);
      id v16 = objc_getProperty(v5, v15, 40LL, 1);
      uint64_t v17 = MEMORY[0x1895F8AE0];
      id v18 = MEMORY[0x1895F8AE0];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v19[3] = &unk_18A08E748;
      id v20 = v4;
      [v14 removeConfiguration:v16 withCompletionQueue:v17 handler:v19];
      v11 = &v20;

      goto LABEL_10;
    }

    if (v4)
    {
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v21[3] = &unk_18A090940;
      v11 = &v22;
      id v22 = v4;
      id v12 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      v13 = v21;
LABEL_8:
      dispatch_async(v12, v13);
LABEL_10:
    }
  }

  else if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    v11 = &v24;
    id v24 = v4;
    id v12 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    v13 = block;
    goto LABEL_8;
  }

  objc_sync_exit(v5);
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    id v8 = objc_getProperty(v5, v6, 16LL, 1);
    id v10 = objc_getProperty(v5, v9, 40LL, 1);
    uint64_t v11 = MEMORY[0x1895F8AE0];
    id v12 = MEMORY[0x1895F8AE0];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_18A08E748;
    id v14 = v4;
    [v8 saveConfiguration:v10 withCompletionQueue:v11 handler:v13];
    v7 = &v14;

    goto LABEL_6;
  }

  if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    v7 = &v16;
    id v16 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], block);
LABEL_6:
  }

  objc_sync_exit(v5);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 dnsSettings];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  selfa = self;
  objc_sync_enter(selfa);
  id Property = selfa;
  if (selfa) {
    id Property = objc_getProperty(selfa, v4, 40LL, 1);
  }
  id v6 = Property;
  [v6 dnsSettings];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (NEDNSSettings)dnsSettings
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 dnsSettings];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 settings];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEDNSSettings *)v7;
}

- (void)setDnsSettings:(NEDNSSettings *)dnsSettings
{
  SEL v9 = dnsSettings;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 dnsSettings];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setSettings:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 dnsSettings];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 onDemandRules];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  SEL v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 dnsSettings];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 40LL, 1);
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
    id Property = objc_getProperty(v4, v5, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 setName:v8];

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  -[NEDNSSettingsManager localizedDescription](self, "localizedDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEDNSSettingsManager isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEDNSSettingsManager dnsSettings](self, "dnsSettings");
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"dnsSettings" andIndent:v5 options:a4];

  -[NEDNSSettingsManager onDemandRules](self, "onDemandRules");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NEDNSSettingsManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (NSUUID)identifier
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40LL, 1);
  }
  return -[NEDNSSettingsManager identifier](self, "identifier");
}

- (NSString)appBundleIdentifier
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40LL, 1);
  }
  return (NSString *)-[NEDNSSettingsManager application](self, "application");
}

- (BOOL)isFromProfile
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40LL, 1);
  }
  v2 = -[NEDNSSettingsManager payloadInfo](self, "payloadInfo");
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40LL, 1);
  }
  return (NEProfileIngestionPayloadInfo *)-[NEDNSSettingsManager payloadInfo](self, "payloadInfo");
}

- (BOOL)isConfigurationGradeEnterprise
{
  if (self) {
    self = (NEDNSSettingsManager *)objc_getProperty(self, a2, 40LL, 1);
  }
  return -[NEDNSSettingsManager grade](self, "grade") == 1;
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
  v7[2] = __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_18A0903B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)connection, 1LL, 0LL, v7);
}

- (NEDNSSettingsManagerDelegate)delegate
{
  return (NEDNSSettingsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __57__NEDNSSettingsManager_fetchStatusWithCompletionHandler___block_invoke(uint64_t a1)
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

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[NEDNSSettingsManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%s: failed to save the new configuration: %@",  buf,  0x16u);
    }

    if ([v4 code] == 5)
    {
      uint64_t v6 = [MEMORY[0x189607870] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];

      id v4 = (void *)v6;
    }
  }

  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_26;
    v8[3] = &unk_18A0908C8;
    id v10 = v7;
    id v9 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v8);
  }
}

uint64_t __63__NEDNSSettingsManager_saveToPreferencesWithCompletionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSSettingsErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NEDNSSettingsErrorDomain" code:4 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_3( uint64_t a1,  void *a2)
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
      id v10 = "-[NEDNSSettingsManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%s: failed to remove the configuration: %@",  buf,  0x16u);
    }
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_25;
    v6[3] = &unk_18A0908C8;
    id v8 = v5;
    id v7 = v3;
    dispatch_async(MEMORY[0x1895F8AE0], v6);
  }
}

uint64_t __67__NEDNSSettingsManager_removeFromPreferencesWithCompletionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v22 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (!v5)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v7 = v22;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      id v9 = 0LL;
      uint64_t v10 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v12 dnsSettings];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v14 = v13 == 0LL;

          if (!v14)
          {
            [v12 payloadInfo];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
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

        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }

- (void)createEmptyConfigurationWithGrade:(void *)a1
{
  if (a1)
  {
    [MEMORY[0x1896077F8] mainBundle];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 infoDictionary];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 objectForKey:*MEMORY[0x189604AA0]];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896077F8] mainBundle];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 bundleIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      [MEMORY[0x1896077F8] mainBundle];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 infoDictionary];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKey:*MEMORY[0x189604E10]];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v8 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v14,  2LL);
    objc_setProperty_atomic(a1, v9, v8, 40LL);

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NEDNSSettingsBundle);
    objc_msgSend(objc_getProperty(a1, v11, 40, 1), "setDnsSettings:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 40, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 40, 1), "setApplicationName:", v14);
  }

uint64_t __65__NEDNSSettingsManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

+ (NEDNSSettingsManager)sharedManager
{
  if (sharedManager_onceToken_15952 != -1) {
    dispatch_once(&sharedManager_onceToken_15952, &__block_literal_global_15953);
  }
  id v2 = (void *)sharedManager_gDNSSettingsManager;
  if (sharedManager_gDNSSettingsManager) {
    id v3 = (id)sharedManager_gDNSSettingsManager;
  }
  return (NEDNSSettingsManager *)v2;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  +[NEDNSSettingsManager globalConfigurationManager]();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v6[3] = &unk_18A090850;
  id v7 = v3;
  id v5 = v3;
  [v4 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v6];
}

+ (id)globalConfigurationManager
{
  if (globalConfigurationManager_onceToken_15945 != -1) {
    dispatch_once(&globalConfigurationManager_onceToken_15945, &__block_literal_global_15_15946);
  }
  return (id)globalConfigurationManager_gConfigurationManager_15947;
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  group = dispatch_group_create();
  v36 = v5;
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_alloc_init(MEMORY[0x189603F18]);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }

  else
  {
    uint64_t v35 = a1;
    id v37 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v45;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v8);
          }
          SEL v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v12 dnsSettings];
            SEL v13 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v14 = v13 == 0LL;

            if (!v14)
            {
              dispatch_group_enter(group);
              uint64_t v15 = objc_alloc(&OBJC_CLASS___NEDNSSettingsManager);
              id v16 = v12;
              if (v15
                && (v48.receiver = v15,
                    v48.super_class = (Class)&OBJC_CLASS___NEDNSSettingsManager,
                    id v17 = (id *)objc_msgSendSuper2(&v48, sel_init),
                    (id v18 = v17) != 0LL))
              {
                objc_storeStrong(v17 + 5, v12);
                uint64_t v19 = +[NEDNSSettingsManager globalConfigurationManager]();
                id v20 = v18[2];
                v18[2] = (id)v19;

                v21 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), 7);
                id v22 = v18[3];
                v18[3] = v21;

                *((_BYTE *)v18 + 8) = 1;
              }

              else
              {

                id v18 = 0LL;
              }

              v42[0] = MEMORY[0x1895F87A8];
              v42[1] = 3221225472LL;
              v42[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2;
              v42[3] = &unk_18A08E6F8;
              v42[4] = v16;
              v43 = group;
              v23 = v42;
              if (v18)
              {
                objc_initWeak(&location, v18);
                [MEMORY[0x189607958] defaultCenter];
                id v24 = (void *)objc_claimAutoreleasedReturnValue();
                id v25 = v18[3];
                [MEMORY[0x189607988] mainQueue];
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
                v48.receiver = (id)MEMORY[0x1895F87A8];
                v48.super_class = (Class)3221225472LL;
                v49 = __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke;
                v50 = &unk_18A08E720;
                objc_copyWeak(&v51, &location);
                uint64_t v27 = [v24 addObserverForName:@"com.apple.networkextension.statuschanged" object:v25 queue:v26 usingBlock:&v48];
                id v28 = v18[4];
                v18[4] = (id)v27;

                id v29 = v18[3];
                id v31 = objc_getProperty(v18, v30, 40LL, 1);
                [v31 identifier];
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v29,  v32,  0LL,  v23);
                }

                objc_destroyWeak(&v51);
                objc_destroyWeak(&location);
              }

              [v37 addObject:v18];
            }
          }
        }

        uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }

      while (v9);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20;
    block[3] = &unk_18A0908C8;
    id v33 = *(id *)(v35 + 32);
    id v40 = v37;
    id v41 = v33;
    id v34 = v37;
    dispatch_group_notify(group, MEMORY[0x1895F8AE0], block);
  }
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
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
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to create a DNS settings session for configuration %@ (%@): %@",  (uint8_t *)&v7,  0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__NEDNSSettingsManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithArray:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58__NEDNSSettingsManager_setupSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained delegate];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v2;
    if (v2) {
      [v2 dnsSettingsStatusDidChange:v4];
    }

    id WeakRetained = v4;
  }
}

uint64_t __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("DNS settings config manager change queue", v0);
  id v2 = (void *)globalConfigurationManager_gChangeQueue_15949;
  globalConfigurationManager_gChangeQueue_15949 = (uint64_t)v1;

  id v3 = -[NEConfigurationManager initForAllUsers](objc_alloc(&OBJC_CLASS___NEConfigurationManager), "initForAllUsers");
  id v4 = (void *)globalConfigurationManager_gConfigurationManager_15947;
  globalConfigurationManager_gConfigurationManager_15947 = (uint64_t)v3;

  return [(id)globalConfigurationManager_gConfigurationManager_15947 setChangedQueue:globalConfigurationManager_gChangeQueue_15949 andHandler:&__block_literal_global_17_15951];
}

void __50__NEDNSSettingsManager_globalConfigurationManager__block_invoke_2()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 postNotificationName:@"com.apple.networkextension.dns-settings-configuration-changed" object:0];
}

void __37__NEDNSSettingsManager_sharedManager__block_invoke()
{
  v15[1] = *(id *)MEMORY[0x1895F89C0];
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  id v0 = objc_alloc(&OBJC_CLASS___NEDNSSettingsManager);
  if (!v0)
  {
LABEL_9:
    dispatch_queue_t v1 = 0LL;
    goto LABEL_11;
  }

  v11.receiver = v0;
  v11.super_class = (Class)&OBJC_CLASS___NEDNSSettingsManager;
  dispatch_queue_t v1 = objc_msgSendSuper2(&v11, sel_init);
  if (v1)
  {
    if (!+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
    {
      objc_initWeak(&location, v1);
      id v3 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
      id v4 = (void *)v1[2];
      v1[2] = v3;

      id v5 = (void *)v1[2];
      id v6 = MEMORY[0x1895F8AE0];
      *(void *)&__int128 buf = MEMORY[0x1895F87A8];
      *((void *)&buf + 1) = 3221225472LL;
      uint64_t v13 = __38__NEDNSSettingsManager_initWithGrade___block_invoke;
      BOOL v14 = &unk_18A08FD30;
      objc_copyWeak(v15, &location);
      [v5 setChangedQueue:MEMORY[0x1895F8AE0] andHandler:&buf];

      -[NEDNSSettingsManager createEmptyConfigurationWithGrade:](v1);
      objc_destroyWeak(v15);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }

    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)objc_opt_class();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      id v9 = v8;
      _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "%@ objects cannot be instantiated from NEProvider processes",  (uint8_t *)&buf,  0xCu);
    }

    goto LABEL_9;
  }

void __38__NEDNSSettingsManager_initWithGrade___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __38__NEDNSSettingsManager_initWithGrade___block_invoke_2;
  v6[3] = &unk_18A08F268;
  objc_copyWeak(&v7, v4);
  [WeakRetained loadFromPreferencesWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __38__NEDNSSettingsManager_initWithGrade___block_invoke_2(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"com.apple.networkextension.dns-settings-configuration-changed" object:WeakRetained];
}

@end
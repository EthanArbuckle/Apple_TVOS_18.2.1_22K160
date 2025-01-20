@interface NERelayManager
+ (NERelayManager)sharedManager;
+ (id)configurationManager;
+ (id)loadedManagers;
+ (id)mapError:(uint64_t)a1;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
+ (void)loadAllManagersFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)isEnabled;
- (BOOL)isFromProfile;
- (NERelayManagerDelegate)delegate;
- (NSArray)excludedDomains;
- (NSArray)matchDomains;
- (NSArray)onDemandRules;
- (NSArray)relays;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (_BYTE)initWithGrade:(void *)a1;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)createEmptyConfigurationWithGrade:(void *)a1;
- (void)getLastClientErrors:(double)a3 completionHandler:(id)a4;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setExcludedDomains:(NSArray *)excludedDomains;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setMatchDomains:(NSArray *)matchDomains;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
- (void)setRelays:(NSArray *)relays;
@end

@implementation NERelayManager

- (void)getLastClientErrors:(double)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  if (self) {
    id Property = objc_getProperty(self, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property identifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 getUUIDBytes:v10];

  if (ne_session_create())
  {
    id v9 = v6;
    ne_session_get_info();
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5 && v5->_isShared)
    {
      v7 = +[NERelayManager configurationManager]();
      id v9 = (id)MEMORY[0x1895F8AE0];
      id v14 = MEMORY[0x1895F8AE0];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke;
      v17[3] = &unk_18A0908F0;
      v17[4] = v5;
      id v18 = v4;
      [v7 loadConfigurationsWithCompletionQueue:v9 handler:v17];
      v13 = &v18;
    }

    else
    {
      v7 = +[NERelayManager configurationManager]();
      if (v5) {
        id Property = objc_getProperty(v5, v6, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v9 = Property;
      [v9 identifier];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = MEMORY[0x1895F8AE0];
      id v12 = MEMORY[0x1895F8AE0];
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_18A090918;
      v15[4] = v5;
      id v16 = v4;
      [v7 loadConfigurationWithID:v10 withCompletionQueue:v11 handler:v15];
      v13 = &v16;
    }

    objc_sync_exit(v5);
  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 16LL, 1))
  {
    id v8 = objc_getProperty(v5, v7, 16LL, 1);
    [v8 payloadInfo];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[NERelayManager configurationManager]();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = objc_getProperty(v5, v12, 16LL, 1);
      uint64_t v14 = MEMORY[0x1895F8AE0];
      id v15 = MEMORY[0x1895F8AE0];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v16[3] = &unk_18A090968;
      v16[4] = v5;
      id v17 = v4;
      [v11 removeConfiguration:v13 withCompletionQueue:v14 handler:v16];

      v10 = v17;
      goto LABEL_9;
    }

    if (v4)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_18A090940;
      id v19 = v4;
      dispatch_async(MEMORY[0x1895F8AE0], block);
      v10 = v19;
LABEL_9:
    }
  }

  else if (v4)
  {
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    v20[3] = &unk_18A090940;
    id v21 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v20);
    v10 = v21;
    goto LABEL_9;
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
    id v7 = +[NERelayManager loadedManagers]();
    v5->_notificationSent = 0;
    +[NERelayManager configurationManager]();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = objc_getProperty(v5, v9, 16LL, 1);
    uint64_t v11 = MEMORY[0x1895F8AE0];
    id v12 = MEMORY[0x1895F8AE0];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_18A090968;
    v13[4] = v5;
    id v14 = v4;
    [v8 saveConfiguration:v10 withCompletionQueue:v11 handler:v13];

    id v6 = v14;
    goto LABEL_6;
  }

  if (v4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v16 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], block);
    id v6 = v16;
LABEL_6:
  }

  objc_sync_exit(v5);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 relay];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
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
    id Property = objc_getProperty(selfa, v4, 16LL, 1);
  }
  id v6 = Property;
  [v6 relay];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (NSArray)relays
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 relay];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 relays];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setRelays:(NSArray *)relays
{
  SEL v9 = relays;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 relay];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setRelays:v9];

  objc_sync_exit(v4);
}

- (NSArray)matchDomains
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 relay];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 matchDomains];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
  SEL v9 = matchDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 relay];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setMatchDomains:v9];

  objc_sync_exit(v4);
}

- (NSArray)excludedDomains
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 relay];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 excludedDomains];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
  SEL v9 = excludedDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 relay];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setExcludedDomains:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  [v5 relay];
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
    id Property = objc_getProperty(v4, v5, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 relay];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 16LL, 1);
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
    id Property = objc_getProperty(v4, v5, 16LL, 1);
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
  -[NERelayManager localizedDescription](self, "localizedDescription");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NERelayManager isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NERelayManager relays](self, "relays");
  SEL v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"relays" andIndent:v5 options:a4];

  -[NERelayManager onDemandRules](self, "onDemandRules");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  return -[NERelayManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (NSUUID)identifier
{
  if (self) {
    self = (NERelayManager *)objc_getProperty(self, a2, 16LL, 1);
  }
  return -[NERelayManager identifier](self, "identifier");
}

- (NSString)appBundleIdentifier
{
  if (self) {
    self = (NERelayManager *)objc_getProperty(self, a2, 16LL, 1);
  }
  return (NSString *)-[NERelayManager application](self, "application");
}

- (BOOL)isFromProfile
{
  if (self) {
    self = (NERelayManager *)objc_getProperty(self, a2, 16LL, 1);
  }
  v2 = -[NERelayManager payloadInfo](self, "payloadInfo");
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (NERelayManagerDelegate)delegate
{
  return (NERelayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (id)loadedManagers
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__NERelayManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init_24506 != -1) {
    dispatch_once(&loadedManagers_managers_init_24506, block);
  }
  return (id)loadedManagers_loadedManagers_24507;
}

+ (id)configurationManager
{
  if ((g_noAppFilter_24504 & 1) != 0) {
    +[NEConfigurationManager sharedManagerForAllUsers](&OBJC_CLASS___NEConfigurationManager, "sharedManagerForAllUsers");
  }
  else {
    +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    ne_log_obj();
    SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[NERelayManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      __int16 v19 = 2112;
      v20 = v4;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%s: failed to save the new configuration: %@",  buf,  0x16u);
    }

    if ([v4 code] == 5)
    {
      uint64_t v10 = [MEMORY[0x189607870] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];

      v4 = (void *)v10;
    }

    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      *(_BYTE *)(v11 + 10) = 1;
    }
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5 || (*(_BYTE *)(v5 + 10) & 1) == 0)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v13 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "Post NERelayConfigurationDidChangeNotification to app for manager %@",  buf,  0xCu);
      }

      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        *(_BYTE *)(v7 + 10) = 1;
      }
      [MEMORY[0x189607958] defaultCenter];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
    }
  }

  id v12 = *(void **)(a1 + 40);
  if (v12)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
    v14[3] = &unk_18A0908C8;
    id v16 = v12;
    id v15 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v14);
  }
}

uint64_t __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __32__NERelayManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v3 = (void *)loadedManagers_loadedManagers_24507;
  loadedManagers_loadedManagers_24507 = (uint64_t)v2;
  v4 = +[NERelayManager configurationManager]();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __32__NERelayManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1895F8AE0] andHandler:v5];
}

void __32__NERelayManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = MEMORY[0x1895F87A8];
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [(id)loadedManagers_loadedManagers_24507 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * v8)];
        SEL v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || ([*(id *)(a1 + 32) sharedManager], (SEL v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = v7;
          v14[1] = 3221225472LL;
          v14[2] = __32__NERelayManager_loadedManagers__block_invoke_3;
          v14[3] = &unk_18A0907E8;
          id v15 = v9;
          id v10 = v9;
          [v10 loadFromPreferencesWithCompletionHandler:v14];
        }

        else
        {
          ne_log_obj();
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)id v13 = 0;
            _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "Post NERelayConfigurationDidChangeNotification to app",  v13,  2u);
          }

          [MEMORY[0x189607958] defaultCenter];
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          [v10 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:0];
        }

        ++v8;
      }

      while (v5 != v8);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v5 = v12;
    }

    while (v12);
  }
}

void __32__NERelayManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 10) & 1) == 0)
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_DEBUG,  "Post NERelayConfigurationDidChangeNotification to app for manager %@",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      *(_BYTE *)(v4 + 10) = 1;
    }
    [MEMORY[0x189607958] defaultCenter];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
  }

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NERelayErrorDomain" code:3 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  [MEMORY[0x189607870] errorWithDomain:@"NERelayErrorDomain" code:4 userInfo:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[NERelayManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%s: failed to remove the configuration: %@",  buf,  0x16u);
    }
  }

  uint64_t v6 = *(void **)(a1 + 32);
  if (!v6) {
    goto LABEL_12;
  }
  if (objc_getProperty(v6, v3, 16LL, 1))
  {
    +[NERelayManager loadedManagers]();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 16LL, 1);
    }
    [Property identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 removeObjectForKey:v10];
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (!v11 || (*(_BYTE *)(v11 + 10) & 1) == 0)
  {
LABEL_12:
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int128 v16 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v16;
      _os_log_debug_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_DEBUG,  "Post NERelayConfigurationDidChangeNotification to app for manager %@",  buf,  0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      *(_BYTE *)(v13 + 10) = 1;
    }
    [MEMORY[0x189607958] defaultCenter];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 postNotificationName:@"com.apple.networkextension.relay-configuration-changed" object:*(void *)(a1 + 32)];
  }

  id v15 = *(void **)(a1 + 40);
  if (v15)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_36;
    v17[3] = &unk_18A0908C8;
    id v19 = v15;
    id v18 = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v17);
  }
}

uint64_t __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v28 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5) {
    goto LABEL_26;
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v7 = v28;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    id v9 = 0LL;
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v12 relay];
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

      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v6;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to load the configuration: %@",  (uint8_t *)&v23,  0xCu);
    }

    +[NERelayManager mapError:]((uint64_t)&OBJC_CLASS___NERelayManager, v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    id v11 = *(id *)(a1 + 32);
    if (v5)
    {
      if (v11)
      {
        objc_setProperty_atomic(v11, v8, v5, 16LL);
        uint64_t v12 = *(void *)(a1 + 32);
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      +[NERelayManager loadedManagers]();
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v13, 16LL, 1);
      }
      id v16 = Property;
      [v16 identifier];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:v12 forKeyedSubscript:v17];
    }

    else
    {
      if (v11) {
        id v11 = objc_getProperty(v11, v8, 16LL, 1);
      }
      id v18 = v11;
      [v18 relay];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setEnabled:0];

      +[NERelayManager loadedManagers]();
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v20, 16LL, 1);
      }
      id v16 = v21;
      [v16 identifier];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 removeObjectForKey:v17];
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v10 = 0LL;
    if (v22) {
      *(_BYTE *)(v22 + 9) = 1;
    }
  }

  objc_sync_exit(v7);
}

+ (id)mapError:(uint64_t)a1
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v2 = a2;
  objc_opt_self();
  [v2 domain];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqual:@"NEConfigurationErrorDomain"];

  if (v4)
  {
    switch([v2 code])
    {
      case 1LL:
      case 2LL:
      case 3LL:
      case 4LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 10LL:
      case 11LL:
      case 12LL:
      case 20LL:
      case 21LL:
        [v2 localizedDescription];
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      case 5LL:
        [v2 localizedDescription];
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = 3LL;
        goto LABEL_6;
      case 9LL:
        ne_log_obj();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "The configuration was not saved because it was unchanged from the previously saved version",  buf,  2u);
        }

        id v9 = 0LL;
        break;
      default:
        id v11 = (void *)NSString;
        [v2 localizedDescription];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringWithFormat:@"Unknown: %@", v12];
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
    }
  }

  else
  {
    id v5 = (os_log_s *)@"Unknown.";
LABEL_5:
    uint64_t v6 = 1LL;
LABEL_6:
    id v7 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x1896075E0];
    v15[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:@"NERelayErrorDomain" code:v6 userInfo:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
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
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 bundleIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      [MEMORY[0x1896077F8] mainBundle];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 infoDictionary];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKey:*MEMORY[0x189604E10]];
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v8 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v14,  2LL);
    objc_setProperty_atomic(a1, v9, v8, 16LL);

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NERelayConfiguration);
    objc_msgSend(objc_getProperty(a1, v11, 16, 1), "setRelay:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 16, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 16, 1), "setApplicationName:", v14);
  }

uint64_t __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9250])
  {
    v7[0] = 0LL;
    v7[1] = v7;
    v7[2] = 0x3032000000LL;
    v7[3] = __Block_byref_object_copy__24527;
    v7[4] = __Block_byref_object_dispose__24528;
    id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
    xpc_dictionary_get_array(v4, "SortedRelayErrors");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_20;
    v6[3] = &unk_18A090878;
    v6[5] = *(void *)(a1 + 40);
    v6[4] = v7;
    xpc_array_apply(v5, v6);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();

    _Block_object_dispose(v7, 8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_20( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || MEMORY[0x1895ADD58](v4) != MEMORY[0x1895F9250])
  {
LABEL_18:
    uint64_t v13 = 1LL;
    goto LABEL_19;
  }

  double v6 = xpc_dictionary_get_double(v5, "TimeEpoch");
  [MEMORY[0x189603F50] now];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 timeIntervalSince1970];
  double v9 = v8 - v6;
  double v10 = *(double *)(a1 + 40);

  if (v9 <= v10)
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "LastCause");
    switch(int64)
    {
      case 17LL:
        uint64_t v12 = 2LL;
        break;
      case 18LL:
      case 19LL:
      case 22LL:
      case 23LL:
      case 26LL:
      case 29LL:
        goto LABEL_9;
      case 20LL:
        uint64_t v12 = 3LL;
        break;
      case 21LL:
        uint64_t v12 = 4LL;
        break;
      case 24LL:
        uint64_t v12 = 5LL;
        break;
      case 25LL:
        uint64_t v12 = 6LL;
        break;
      case 27LL:
        uint64_t v12 = 7LL;
        break;
      case 28LL:
        uint64_t v12 = 8LL;
        break;
      case 30LL:
        uint64_t v12 = 9LL;
        break;
      default:
        if (int64) {
LABEL_9:
        }
          uint64_t v12 = 10LL;
        else {
          uint64_t v12 = 1LL;
        }
        break;
    }

    id v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    [MEMORY[0x189607870] errorWithDomain:@"NERelayErrorDomain" code:v12 userInfo:0];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 addObject:v15];

    goto LABEL_18;
  }

  uint64_t v13 = 0LL;
LABEL_19:

  return v13;
}

- (_BYTE)initWithGrade:(void *)a1
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_CLASS___NERelayManager;
  uint64_t v1 = objc_msgSendSuper2(&v6, sel_init);
  if (v1)
  {
    if (!+[NEProvider isRunningInProvider](&OBJC_CLASS___NEProvider, "isRunningInProvider"))
    {
      v1[10] = 0;
      -[NERelayManager createEmptyConfigurationWithGrade:](v1);
      return v1;
    }

    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v4 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      double v8 = v4;
      id v5 = v4;
      _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "%@ objects cannot be instantiated from NEProvider processes",  buf,  0xCu);
    }

    return 0LL;
  }

  return v1;
}

+ (NERelayManager)sharedManager
{
  if (sharedManager_onceToken_24543 != -1) {
    dispatch_once(&sharedManager_onceToken_24543, &__block_literal_global_24544);
  }
  id v2 = (void *)sharedManager_gRelayManager;
  if (sharedManager_gRelayManager) {
    id v3 = (id)sharedManager_gRelayManager;
  }
  return (NERelayManager *)v2;
}

+ (void)loadAllManagersFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  id v4 = +[NERelayManager loadedManagers]();
  +[NERelayManager configurationManager]();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke;
  v7[3] = &unk_18A090850;
  id v8 = v3;
  id v6 = v3;
  [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v7];
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  objc_opt_self();
  g_noAppFilter_24504 = 1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v5[3] = &unk_18A090850;
  id v6 = v3;
  id v4 = v3;
  +[NERelayManager loadAllManagersFromPreferencesWithCompletionHandler:]( &OBJC_CLASS___NERelayManager,  "loadAllManagersFromPreferencesWithCompletionHandler:",  v5);
}

uint64_t __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (a3)
  {
    +[NERelayManager mapError:]((uint64_t)&OBJC_CLASS___NERelayManager, a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x189603F18]);
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v6);
  }

  else
  {
    id v24 = v5;
    id v25 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v14 relay];
            id v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              id v16 = objc_alloc(&OBJC_CLASS___NERelayManager);
              id v17 = v14;
              if (v16
                && (v30.receiver = v16,
                    v30.super_class = (Class)&OBJC_CLASS___NERelayManager,
                    (id v18 = objc_msgSendSuper2(&v30, sel_init)) != 0))
              {
                id v19 = v18;
                objc_storeStrong((id *)v18 + 2, v14);

                v19[9] = 1;
              }

              else
              {

                id v19 = 0LL;
              }

              [v25 addObject:v19];
              +[NERelayManager loadedManagers]();
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v17 identifier];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v20 setObject:v19 forKeyedSubscript:v21];
            }
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v11);
    }

    uint64_t v22 = *(void *)(a1 + 32);
    int v23 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithArray:v25];
    (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0LL);

    id v5 = v24;
  }
}

id __31__NERelayManager_sharedManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  uint64_t v0 = -[NERelayManager initWithGrade:](objc_alloc(&OBJC_CLASS___NERelayManager));
  uint64_t v1 = (void *)sharedManager_gRelayManager;
  sharedManager_gRelayManager = (uint64_t)v0;

  if (sharedManager_gRelayManager) {
    *(_BYTE *)(sharedManager_gRelayManager + 8) = 1;
  }
  return +[NERelayManager loadedManagers]();
}

@end
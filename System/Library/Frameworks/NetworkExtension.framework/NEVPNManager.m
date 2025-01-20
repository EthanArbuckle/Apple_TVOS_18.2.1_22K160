@interface NEVPNManager
+ (NEVPNManager)sharedManager;
+ (id)configurationManager;
+ (id)create;
+ (id)loadedManagers;
+ (id)mapError:(uint64_t)a1;
+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isFromMDM;
- (BOOL)isFromProfile;
- (BOOL)isOnDemandEnabled;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NEConfiguration)configuration;
- (NEProfileIngestionPayloadInfo)configurationPayloadInfo;
- (NEVPNConnection)connection;
- (NEVPNManager)init;
- (NEVPNManager)initWithGrade:(int64_t)a3 connection:(id)a4 tunnelType:(int64_t)a5;
- (NEVPNProtocol)protocolConfiguration;
- (NSArray)onDemandRules;
- (NSString)appBundleIdentifier;
- (NSString)localizedDescription;
- (NSUUID)identifier;
- (id)copyCurrentUserStartOptions;
- (id)createL2TPUserPreferencesWithName:(id)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)additionalSetup;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setConfiguration:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setOnDemandEnabled:(BOOL)onDemandEnabled;
- (void)setOnDemandRules:(NSArray *)onDemandRules;
- (void)setProtocolConfiguration:(NEVPNProtocol *)protocolConfiguration;
@end

@implementation NEVPNManager

- (NEVPNManager)init
{
}

- (NEVPNManager)initWithGrade:(int64_t)a3 connection:(id)a4 tunnelType:(int64_t)a5
{
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NEVPNManager;
  v10 = -[NEVPNManager init](&v26, sel_init);
  if (v10)
  {
    [MEMORY[0x1896077F8] mainBundle];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 infoDictionary];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectForKey:*MEMORY[0x189604AA0]];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896077F8] mainBundle];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 bundleIdentifier];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      [MEMORY[0x1896077F8] mainBundle];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 infoDictionary];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 objectForKey:*MEMORY[0x189604E10]];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v18 = -[NEConfiguration initWithName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  "initWithName:grade:",  v13,  a3);
    configuration = v10->_configuration;
    v10->_configuration = v18;

    if (v9 && v9[3] == 1)
    {
      v20 = objc_alloc_init(&OBJC_CLASS___NEVPN);
      -[NEConfiguration setVPN:](v10->_configuration, "setVPN:", v20);
      v21 = -[NEConfiguration VPN](v10->_configuration, "VPN");
    }

    else
    {
      v22 = objc_alloc_init(&OBJC_CLASS___NEVPNApp);
      -[NEConfiguration setAppVPN:](v10->_configuration, "setAppVPN:", v22);
      v21 = -[NEConfiguration appVPN](v10->_configuration, "appVPN");
    }

    v23 = v21;
    [v21 setTunnelType:a5];

    -[NEConfiguration setApplication:](v10->_configuration, "setApplication:", v15);
    -[NEConfiguration setApplicationName:](v10->_configuration, "setApplicationName:", v13);
    objc_storeStrong((id *)&v10->_connection, a4);
    connection = v10->_connection;
    if (connection) {
      objc_storeWeak((id *)&connection->_weakmanager, v10);
    }
    *(_WORD *)&v10->_hasLoaded = 1;
  }

  return v10;
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    v5 = +[NEVPNManager configurationManager]();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_18A0908F0;
    v6[4] = self;
    id v7 = v4;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v6];
  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v4 = completionHandler;
  v5 = -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  uint64_t v6 = [v5 type];

  if (v6 == 2)
  {
    -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    [v7 userPreferences];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v18 + 1) + 8 * v12)) {
            SCUserPreferencesRemove();
          }
          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    [v7 setUserPreferences:0];
  }

  if (self) {
    self->_notificationSent = 0;
  }
  v13 = +[NEVPNManager configurationManager]();
  v14 = -[NEVPNManager configuration](self, "configuration");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke;
  v16[3] = &unk_18A090968;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v13 removeConfiguration:v14 withCompletionQueue:MEMORY[0x1895F8AE0] handler:v16];
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return (a3 == 5) | g_noAppFilter & 1;
}

- (void)additionalSetup
{
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v3 = v48;
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v48;
    [v4 setDisconnectOnWake:0];
    if (v4 && !v4[10])
    {
      [v4 passwordReference];
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        uint64_t v6 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
        [v4 passwordReference];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v6,  "initWithPersistentReference:domain:accessGroup:",  v7,  1LL,  0LL);

        id v9 = -[NEKeychainItem copyData](v8, "copyData");
        if (v9)
        {
          uint64_t v10 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          uint64_t v11 = v4[10];
          id v13 = objc_getProperty(v4, v12, 88LL, 1);
          v14 = -[NEKeychainItem initWithData:domain:accessGroup:]( v10,  "initWithData:domain:accessGroup:",  v9,  v11,  v13);
          [v4 setPasswordKeychainItem:v14];
        }
      }

      [v4 sharedSecretReference];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
        [v4 sharedSecretReference];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v18 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v16,  "initWithPersistentReference:domain:accessGroup:",  v17,  1LL,  0LL);

        id v19 = -[NEKeychainItem copyData](v18, "copyData");
        if (v19)
        {
          __int128 v20 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          uint64_t v21 = v4[10];
          id v23 = objc_getProperty(v4, v22, 88LL, 1);
          v24 = -[NEKeychainItem initWithData:domain:accessGroup:]( v20,  "initWithData:domain:accessGroup:",  v19,  v21,  v23);
          [v4 setSharedSecretKeychainItem:v24];
        }
      }

      [v4 identityDataPassword];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        [v4 identityDataPasswordKeychainItem];
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          [v4 identityDataPassword];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 identityDataPasswordKeychainItem];
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          [v28 setPassword:v27];
        }

        else
        {
          v29 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          [v4 identityDataPassword];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = v4[10];
          id v28 = objc_getProperty(v4, v31, 88LL, 1);
          v32 = -[NEKeychainItem initWithPassword:domain:accessGroup:]( v29,  "initWithPassword:domain:accessGroup:",  v27,  v30,  v28);
          [v4 setIdentityDataPasswordKeychainItem:v32];
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = v4;
        [v33 ppkConfiguration];
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
          [v33 ppkConfiguration];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v36 keychainReference];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[NEKeychainItem initWithPersistentReference:domain:accessGroup:]( v35,  "initWithPersistentReference:domain:accessGroup:",  v37,  1LL,  0LL);

          id v39 = -[NEKeychainItem copyData](v38, "copyData");
          if (v39)
          {
            v40 = objc_alloc(&OBJC_CLASS___NEKeychainItem);
            uint64_t v41 = v4[10];
            id v43 = objc_getProperty(v33, v42, 88LL, 1);
            v44 = -[NEKeychainItem initWithData:domain:accessGroup:]( v40,  "initWithData:domain:accessGroup:",  v39,  v41,  v43);
            [v33 ppkConfiguration];
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v45;
            if (v45) {
              objc_setProperty_atomic_copy(v45, v46, v44, 32LL);
            }
          }
        }
      }
    }

    v3 = v48;
  }
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v95 = *MEMORY[0x1895F89C0];
  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5 || !v5->_hasLoaded)
  {
    [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:4 userInfo:0];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      goto LABEL_41;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_18A0908C8;
    id v7 = block;
    id v85 = v4;
    id v6 = v6;
    id v84 = v6;
    dispatch_async(MEMORY[0x1895F8AE0], block);

LABEL_39:
    v45 = (__CFError *)v7[5];
    goto LABEL_40;
  }
  v8 = -[NEVPNManager configuration](v5, "configuration");
  if (!v8) {
    goto LABEL_37;
  }
  -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_37;
  }

  -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = -[NEVPNManager isProtocolTypeValid:](v5, "isProtocolTypeValid:", [v10 type]);

  if (!v11)
  {
LABEL_37:
    id v43 = (void *)MEMORY[0x189607870];
    uint64_t v89 = *MEMORY[0x1896075E0];
    v90 = @"Missing protocol or protocol has invalid type";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:v44];
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v4) {
      goto LABEL_41;
    }
    v80[0] = MEMORY[0x1895F87A8];
    v80[1] = 3221225472LL;
    v80[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v80[3] = &unk_18A0908C8;
    id v7 = v80;
    id v82 = v4;
    id v6 = v6;
    id v81 = v6;
    dispatch_async(MEMORY[0x1895F8AE0], v80);

    goto LABEL_39;
  }

  -[NEVPNManager additionalSetup](v5, "additionalSetup");
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NEVPNManager configuration](v5, "configuration");
  SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = [v12 checkValidityAndCollectErrors:v6];

  if ((v13 & 1) == 0)
  {
    if ([v6 count])
    {
      uint64_t v87 = *MEMORY[0x1896075E0];
      [v6 componentsJoinedByString:@"\n"];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v46;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v47 = 0LL;
    }

    [MEMORY[0x189607870] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:v47];
    v45 = (__CFError *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v94 = v45;
      _os_log_error_impl( &dword_1876B1000,  v48,  OS_LOG_TYPE_ERROR,  "Failed to save the new configuration: %@",  buf,  0xCu);
    }

    if (v4)
    {
      v77[0] = MEMORY[0x1895F87A8];
      v77[1] = 3221225472LL;
      v77[2] = __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_38;
      v77[3] = &unk_18A0908C8;
      id v79 = v4;
      v78 = v45;
      dispatch_async(MEMORY[0x1895F8AE0], v77);
    }

    goto LABEL_40;
  }
  v63 = -[NEVPNManager protocolConfiguration](v5, "protocolConfiguration");
  if ([v63 type] != 2) {
    goto LABEL_53;
  }
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v61 = v63;
  [v61 userPreferences];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v73 objects:v86 count:16];
  id obj = v14;
  if (!v15)
  {

LABEL_51:
    v49 = -[NEVPNManager configuration](v5, "configuration");
    +[NEL2TPUserPreferences clearCurrentForConfiguration:]((uint64_t)&OBJC_CLASS___NEL2TPUserPreferences, v49);

    goto LABEL_52;
  }

  char v16 = 0;
  uint64_t v65 = *(void *)v74;
  while (2)
  {
    uint64_t v64 = v15;
    for (uint64_t i = 0LL; i != v64; ++i)
    {
      if (*(void *)v74 != v65) {
        objc_enumerationMutation(obj);
      }
      __int128 v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
      char v66 = [v18 isCurrent];
      if (!v18) {
        goto LABEL_69;
      }
      [v18 name];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = v19 == 0LL;

      if (!v20)
      {
        [v18 name];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v22 = SCUserPreferencesSetName() == 0;

        if (v22)
        {
          Error = SCCopyLastError();
          ne_log_obj();
          oslog = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
          *(_DWORD *)buf = 138412290;
          CFErrorRef v94 = Error;
          v55 = "Failed to set the user preferences name: %@";
LABEL_64:
          _os_log_error_impl(&dword_1876B1000, oslog, OS_LOG_TYPE_ERROR, v55, buf, 0xCu);
          goto LABEL_68;
        }
      }

      if ([v18 isCurrent] && !SCUserPreferencesSetCurrent())
      {
        Error = SCCopyLastError();
        ne_log_obj();
        oslog = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 138412290;
        CFErrorRef v94 = Error;
        v55 = "Failed to set the current user preferences: %@";
        goto LABEL_64;
      }

      [v18 settings];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = v23 == 0LL;

      if (!v24)
      {
        [v18 settings];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 passwordKeychainItem];
        objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 setDomain:1];

        [v18 settings];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 sharedSecretKeychainItem];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 setDomain:1];

        id v29 = objc_alloc(MEMORY[0x189607AB8]);
        [v18 identifier];
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        Error = (__CFError *)[v29 initWithUUIDString:v30];

        oslog = (os_log_s *)-[NEConfiguration initWithIdentifier:]( (id *)objc_alloc(&OBJC_CLASS___NEConfiguration),  Error);
        [v18 name];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s setName:](oslog, "setName:", v32);

        [v18 settings];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 syncWithKeychainInDomain:1 configuration:oslog suffix:0];

        [v18 settings];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        id v35 = (id)[v34 copyLegacyDictionaryComplete:0];

        if (!v35) {
          id v35 = objc_alloc_init(MEMORY[0x189603F68]);
        }
        if (!SCUserPreferencesSetInterfaceTypeConfiguration())
        {
          CFErrorRef v37 = SCCopyLastError();
          ne_log_obj();
          v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CFErrorRef v94 = v37;
            _os_log_error_impl( &dword_1876B1000,  v56,  OS_LOG_TYPE_ERROR,  "Failed to set the PPP settings in the user preferences: %@",  buf,  0xCu);
          }

- (NEVPNProtocol)protocolConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEVPNManager configuration](v2, "configuration");
  [v3 appVPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEVPNManager configuration](v2, "configuration");
  if (v4) {
    [v5 appVPN];
  }
  else {
    [v5 VPN];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 protocol];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NEVPNProtocol *)v7;
}

- (void)setProtocolConfiguration:(NEVPNProtocol *)protocolConfiguration
{
  id v9 = protocolConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NEVPNManager configuration](v4, "configuration");
  [v5 appVPN];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v4, "configuration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v7 appVPN];
  }
  else {
    [v7 VPN];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setProtocol:v9];

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEVPNManager configuration](v2, "configuration");
  [v3 appVPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEVPNManager configuration](v2, "configuration");
  if (v4) {
    [v5 appVPN];
  }
  else {
    [v5 VPN];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 onDemandRules];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  id v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NEVPNManager configuration](v4, "configuration");
  [v5 appVPN];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](v4, "configuration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v7 appVPN];
  }
  else {
    [v7 VPN];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setOnDemandRules:v9];

  objc_sync_exit(v4);
}

- (BOOL)isOnDemandEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEVPNManager configuration](v2, "configuration");
  [v3 appVPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEVPNManager configuration](v2, "configuration");
  if (v4) {
    [v5 appVPN];
  }
  else {
    [v5 VPN];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isOnDemandEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setOnDemandEnabled:(BOOL)onDemandEnabled
{
  BOOL v3 = onDemandEnabled;
  id obj = self;
  objc_sync_enter(obj);
  v4 = -[NEVPNManager configuration](obj, "configuration");
  [v4 appVPN];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](obj, "configuration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [v6 appVPN];
  }
  else {
    [v6 VPN];
  }
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setOnDemandEnabled:v3];

  objc_sync_exit(obj);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appVPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEVPNManager configuration](v2, "configuration");
  if (v4) {
    [v5 appVPN];
  }
  else {
    [v5 VPN];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  id obj = self;
  objc_sync_enter(obj);
  v4 = -[NEVPNManager configuration](obj, "configuration");
  [v4 appVPN];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NEVPNManager configuration](obj, "configuration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [v6 appVPN];
  }
  else {
    [v6 VPN];
  }
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setEnabled:v3];

  objc_sync_exit(obj);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  -[NEVPNManager configuration](v2, "configuration");
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
  v5 = -[NEVPNManager configuration](v4, "configuration");
  [v5 setName:v6];

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  char v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = -[NEVPNManager localizedDescription](self, "localizedDescription");
  [v7 appendPrettyObject:v8 withName:@"localizedDescription" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNManager isEnabled](self, "isEnabled"),  @"enabled",  v5,  a4);
  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v9 withName:@"protocolConfiguration" andIndent:v5 options:a4];

  objc_msgSend( v7,  "appendPrettyBOOL:withName:andIndent:options:",  -[NEVPNManager isOnDemandEnabled](self, "isOnDemandEnabled"),  @"onDemandEnabled",  v5,  a4);
  -[NEVPNManager onDemandRules](self, "onDemandRules");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendPrettyObject:v10 withName:@"onDemandRules" andIndent:v5 options:a4];

  return v7;
}

- (id)description
{
  v2 = (void *)NSString;
  -[NEVPNManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"{%@\n}", v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 payloadInfo];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v3 profileSource] == 2;

  return v4;
}

- (NEProfileIngestionPayloadInfo)configurationPayloadInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 payloadInfo];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NEProfileIngestionPayloadInfo *)v3;
}

- (id)copyCurrentUserStartOptions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 type];

  if (v4 != 2) {
    return 0LL;
  }
  -[NEVPNManager protocolConfiguration](self, "protocolConfiguration");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 userPreferences];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_65_23492];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    started = 0LL;
  }

  else
  {
    [v5 userPreferences];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectAtIndexedSubscript:v7];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11) {
      started = (void *)SCUserPreferencesCopyStartOptions();
    }
    else {
      started = 0LL;
    }
  }

  id v9 = started;

  return v9;
}

- (id)createL2TPUserPreferencesWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NEL2TPUserPreferences);
  -[NEVPNManager configuration](self, "configuration");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[NEL2TPUserPreferences initWithConfiguration:](v5, "initWithConfiguration:", v6);

  -[NEL2TPUserPreferences setName:](v7, "setName:", v4);
  v8 = objc_alloc_init(&OBJC_CLASS___NEVPNProtocolL2TP);
  -[NEL2TPUserPreferences setSettings:](v7, "setSettings:", v8);

  -[NEL2TPUserPreferences settings](v7, "settings");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    v9[10] = 1LL;
  }

  return v7;
}

- (NEVPNConnection)connection
{
  return (NEVPNConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (NEConfiguration)configuration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __43__NEVPNManager_copyCurrentUserStartOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrent];
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

+ (id)loadedManagers
{
  uint64_t v0 = objc_opt_self();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__NEVPNManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init_23533 != -1) {
    dispatch_once(&loadedManagers_managers_init_23533, block);
  }
  return (id)loadedManagers_loadedManagers_23534;
}

+ (id)configurationManager
{
  if ((g_noAppFilter & 1) != 0) {
    +[NEConfigurationManager sharedManagerForAllUsers](&OBJC_CLASS___NEConfigurationManager, "sharedManagerForAllUsers");
  }
  else {
    +[NEConfigurationManager sharedManager](&OBJC_CLASS___NEConfigurationManager, "sharedManager");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

void __55__NEVPNManager_saveToPreferencesWithCompletionHandler___block_invoke_2_41(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      ne_log_obj();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        uint64_t v15 = v5;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to save configuration: %@",  (uint8_t *)&v14,  0xCu);
      }
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      *(_BYTE *)(v7 + 9) = 1;
    }
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!v8 || (*(_BYTE *)(v8 + 9) & 1) == 0)
    {
      ne_log_obj();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        char v13 = *(void **)(a1 + 32);
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "Post NEVPNConfigurationChangeNotification to app for manager %@",  (uint8_t *)&v14,  0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        *(_BYTE *)(v10 + 9) = 1;
      }
      [MEMORY[0x189607958] defaultCenter];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
    }

    uint64_t v5 = 0LL;
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
  }
  objc_sync_exit(v4);
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
      case 7LL:
        [v2 localizedDescription];
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = 1LL;
        goto LABEL_7;
      case 5LL:
        [v2 localizedDescription];
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = 4LL;
        goto LABEL_7;
      case 6LL:
      case 8LL:
      case 10LL:
      case 11LL:
      case 12LL:
      case 20LL:
      case 21LL:
        [v2 localizedDescription];
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = 5LL;
        goto LABEL_7;
      case 9LL:
        ne_log_obj();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "The configuration was not saved because it was unchanged from the previously saved version",  buf,  2u);
        }

        id v9 = 0LL;
        break;
      default:
        BOOL v11 = (void *)NSString;
        [v2 localizedDescription];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringWithFormat:@"Unknown: %@", v12];
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
    }
  }

  else
  {
    uint64_t v5 = (os_log_s *)@"Unknown.";
LABEL_5:
    uint64_t v6 = 6LL;
LABEL_7:
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v14 = *MEMORY[0x1896075E0];
    v15[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:@"NEVPNErrorDomain" code:v6 userInfo:v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __30__NEVPNManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v3 = (void *)loadedManagers_loadedManagers_23534;
  loadedManagers_loadedManagers_23534 = (uint64_t)v2;

  +[NEVPNManager configurationManager]();
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __30__NEVPNManager_loadedManagers__block_invoke_2;
  v6[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v6[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1895F8AE0] andHandler:v6];

  +[NEVPNManager configurationManager]();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setIncomingMessageHandler:&__block_literal_global_23536];
}

void __30__NEVPNManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
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
        [(id)loadedManagers_loadedManagers_23534 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * v8)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || ([*(id *)(a1 + 32) sharedManager], (id v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = v7;
          v14[1] = 3221225472LL;
          v14[2] = __30__NEVPNManager_loadedManagers__block_invoke_3;
          v14[3] = &unk_18A0907E8;
          id v15 = v9;
          id v10 = v9;
          [v10 loadFromPreferencesWithCompletionHandler:v14];
        }

        else
        {
          ne_log_obj();
          BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)char v13 = 0;
            _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "Post NEVPNConfigurationChangeNotification to app",  v13,  2u);
          }

          [MEMORY[0x189607958] defaultCenter];
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          [v10 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:0];
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

void __30__NEVPNManager_loadedManagers__block_invoke_10(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!xdict
    || MEMORY[0x1895ADD58]() != MEMORY[0x1895F9250]
    || xpc_dictionary_get_int64(xdict, "config-operation") != 8)
  {
    BOOL v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v4 = (void *)loadedManagers_configurationClient;
  if (!loadedManagers_configurationClient)
  {
    uint64_t v5 = objc_alloc(&OBJC_CLASS___NEProviderAppConfigurationClient);
    if (v5)
    {
      v17.receiver = v5;
      v17.super_class = (Class)&OBJC_CLASS___NEProviderAppConfigurationClient;
      id v6 = objc_msgSendSuper2(&v17, sel_init);
      if (v6)
      {
        uint64_t v7 = [MEMORY[0x189607B50] anonymousListener];
        uint64_t v8 = (void *)*((void *)v6 + 9);
        *((void *)v6 + 9) = v7;

        [*((id *)v6 + 9) setDelegate:v6];
        [*((id *)v6 + 9) resume];
        *((_BYTE *)v6 + 64) = 1;
        [MEMORY[0x189607958] defaultCenter];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 addObserver:v6 selector:sel_handleConfigChanged_ name:@"com.apple.networkextension.app-configuration-changed" object:0];
      }
    }

    else
    {
      id v6 = 0LL;
    }

    id v10 = (void *)loadedManagers_configurationClient;
    loadedManagers_configurationClient = (uint64_t)v6;

    uint64_t v4 = (void *)loadedManagers_configurationClient;
  }

  -[NEProviderAppConfigurationClient listenerEndpoint](v4, v3);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_13:
    int64_t v14 = 22LL;
    if (!reply) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }

  -[NEProviderAppConfigurationClient listenerEndpoint]((void *)loadedManagers_configurationClient, v12);
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 _endpoint];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

  int64_t v14 = 0LL;
  if (!reply) {
    goto LABEL_17;
  }
LABEL_14:
  xpc_dictionary_set_int64(reply, "result-code", v14);
  if (v11) {
    xpc_dictionary_set_value(reply, "result-data", v11);
  }
  xpc_dictionary_get_remote_connection(xdict);
  id v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v15, reply);

LABEL_17:
}

void __30__NEVPNManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 9) & 1) == 0)
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_DEBUG,  "Post NEVPNConfigurationChangeNotification to app for manager %@",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      *(_BYTE *)(v4 + 9) = 1;
    }
    [MEMORY[0x189607958] defaultCenter];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
  }

void __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (v3)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v3;
      _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "Failed to remove the configuration: %@", buf, 0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  [*(id *)(a1 + 32) configuration];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v7 == 0LL;

  if (!v8)
  {
    +[NEVPNManager loadedManagers]();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) configuration];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 removeObjectForKey:v11];
  }

  [*(id *)(a1 + 32) connection];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEVPNConnection destroySession](v12);

  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13 || (*(_BYTE *)(v13 + 9) & 1) == 0)
  {
    ne_log_obj();
    int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int128 v18 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v23 = v18;
      _os_log_debug_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEBUG,  "Post NEVPNConfigurationChangeNotification to app for manager %@",  buf,  0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      *(_BYTE *)(v15 + 9) = 1;
    }
    [MEMORY[0x189607958] defaultCenter];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 postNotificationName:@"com.apple.networkextension.app-configuration-changed" object:*(void *)(a1 + 32)];
  }

  objc_super v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_27;
    v19[3] = &unk_18A0908C8;
    id v21 = v17;
    id v20 = v6;
    dispatch_async(MEMORY[0x1895F8AE0], v19);
  }

  objc_sync_exit(v4);
}

uint64_t __59__NEVPNManager_removeFromPreferencesWithCompletionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __57__NEVPNManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v31 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v5);
    int v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_20:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      goto LABEL_21;
    }

    ne_log_obj();
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v37 = v7;
      _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", buf, 0xCu);
    }

+ (id)create
{
  uint64_t v2 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), 1);
  id v3 = -[NEVPNManager initWithGrade:connection:tunnelType:]( objc_alloc(&OBJC_CLASS___NEVPNManager),  "initWithGrade:connection:tunnelType:",  1LL,  v2,  1LL);

  return v3;
}

+ (NEVPNManager)sharedManager
{
  if (sharedManager_vpn_init != -1) {
    dispatch_once(&sharedManager_vpn_init, &__block_literal_global_25);
  }
  return (NEVPNManager *)(id)sharedManager_g_nevpn;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_self();
    g_noAppFilter = 1;
    id v5 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_18A0904D0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v7];
  }
}

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v47 = a2;
  id v5 = a3;
  uint64_t v45 = a1;
  id v46 = *(id *)(a1 + 40);
  objc_sync_enter(v46);
  id v49 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v73 = 0LL;
  __int128 v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  __int128 v76 = __Block_byref_object_copy__23563;
  v77 = __Block_byref_object_dispose__23564;
  id v6 = v5;
  id v78 = v6;
  v44 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v6);
    id v8 = (void *)v74[5];
    v74[5] = v7;

    uint64_t v9 = v74[5];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (v47 && !v9 && objc_msgSend(v47, "count", v44))
  {
    group = dispatch_group_create();
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    id obj = v47;
    uint64_t v54 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v70;
      do
      {
        for (uint64_t i = 0LL; i != v54; ++i)
        {
          if (*(void *)v70 != v53) {
            objc_enumerationMutation(obj);
          }
          id v61 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          [v61 VPN];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10) {
            [v61 VPN];
          }
          else {
            [v61 appVPN];
          }
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            objc_opt_class();
            int v11 = objc_opt_isKindOfClass() & 1;
            int v12 = v11 ? 2 : 1;
            if (v11
              || [v60 tunnelType] != 2
              || ([v60 protocol],
                  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
                  BOOL v14 = [v13 type] == 4,
                  v13,
                  !v14))
            {
              v56 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), v12);
              uint64_t v15 = -[NEVPNManager initWithGrade:connection:tunnelType:]( [NEVPNManager alloc],  "initWithGrade:connection:tunnelType:",  [v61 grade],  v56,  objc_msgSend(v60, "tunnelType"));
              -[NEVPNManager setConfiguration:](v15, "setConfiguration:", v61);
              v58 = v15;
              v57 = -[NEVPNManager protocolConfiguration](v15, "protocolConfiguration");
              if ([v57 type] == 2)
              {
                id v50 = v57;
                id v51 = v61;
                objc_opt_self();
                SCNetworkConnectionRef v16 = +[NEL2TPUserPreferences createConnectionForConfiguration:]( (uint64_t)&OBJC_CLASS___NEL2TPUserPreferences,  v51);
                objc_super v17 = (void *)SCNetworkConnectionCopyAllUserPreferences();
                CFTypeRef cf = (CFTypeRef)SCNetworkConnectionCopyCurrentUserPreferences();
                CFRelease(v16);
                if (cf)
                {
                  SCUserPreferencesGetUniqueID();
                  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  __int128 v18 = 0LL;
                }

                id v19 = 0LL;
                if ([v17 count])
                {
                  uint64_t v20 = 0LL;
                  while (1)
                  {
                    [v17 objectAtIndexedSubscript:v20];
                    id v21 = (void *)objc_claimAutoreleasedReturnValue();

                    uint64_t v22 = objc_alloc(&OBJC_CLASS___NEL2TPUserPreferences);
                    if (v22) {
                      break;
                    }
                    uint64_t v24 = 0LL;
                    if (v18) {
                      goto LABEL_45;
                    }
LABEL_47:
                    if (!v19) {
                      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
                    }
                    [v19 addObject:v24];
                  }

                  v79.receiver = v22;
                  v79.super_class = (Class)&OBJC_CLASS___NEL2TPUserPreferences;
                  id v23 = (CFTypeRef *)objc_msgSendSuper2(&v79, sel_init);
                  uint64_t v24 = v23;
                  if (v23)
                  {
                    v23[5] = v21;
                    uint64_t v25 = SCUserPreferencesCopyName();
                    objc_super v26 = (void *)v24[3];
                    v24[3] = (CFTypeRef)v25;

                    uint64_t v27 = SCUserPreferencesGetUniqueID();
                    id v28 = (void *)v24[2];
                    v24[2] = (CFTypeRef)v27;

                    CFRetain(v24[5]);
                    id v29 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v29))
                    {
                      uint64_t v30 = (void *)[v29 mutableCopy];
                      [v30 setObject:&unk_18A0CF8A0 forKeyedSubscript:@"__NEVPNKeychainDomain"];
                      id v31 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v30];

                      id v32 = -[NEVPNProtocolPPP initFromLegacyDictionary:]( objc_alloc(&OBJC_CLASS___NEVPNProtocolL2TP),  "initFromLegacyDictionary:",  v31);
                      if (v32)
                      {
                        __int128 v33 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                      }

                      __int128 v34 = (void *)v24[4];
                      v24[4] = v32;
                    }

                    else
                    {
                      id v31 = v29;
                    }

                    __int128 v35 = (void *)SCUserPreferencesCopyInterfaceTypeConfiguration();
                    if (isa_nsdictionary(v35))
                    {
                      [v35 objectForKeyedSubscript:@"TLSIdentityHandle"];
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      CFErrorRef v37 = (void *)v24[4];
                      if (v37) {
                        [v37 setIdentityReference:v36];
                      }
                    }
                  }

                  if (!v18) {
                    goto LABEL_47;
                  }
LABEL_45:
                  v38 = -[CFTypeRef identifier](v24, "identifier");
                  int v39 = [v18 isEqualToString:v38];

                  if (v39) {
                    -[CFTypeRef setCurrent:](v24, "setCurrent:", 1LL);
                  }
                  goto LABEL_47;
                }

void __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_62(uint64_t a1, void *a2)
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

uint64_t __60__NEVPNManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_63(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id __29__NEVPNManager_sharedManager__block_invoke()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
  }
  uint64_t v0 = objc_alloc(&OBJC_CLASS___NEVPNManager);
  v1 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NEVPNConnection), 1);
  uint64_t v2 = -[NEVPNManager initWithGrade:connection:tunnelType:](v0, "initWithGrade:connection:tunnelType:", 2LL, v1, 1LL);
  id v3 = (void *)sharedManager_g_nevpn;
  sharedManager_g_nevpn = v2;

  return +[NEVPNManager loadedManagers]();
}

@end
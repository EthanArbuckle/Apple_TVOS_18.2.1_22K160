@interface NEProfileIngestion
+ (id)getServiceIDForPayload:(id)a3;
- (BOOL)createConfigurationFromPayload:(id)a3 payloadType:(id)a4;
- (BOOL)enableAlwaysOnVpn;
- (BOOL)isInstalled:(id)a3;
- (BOOL)loadConfigurationsForceReloadFromDisk;
- (BOOL)lockConfigurations;
- (BOOL)removeConfiguration:(id)a3;
- (BOOL)removeConfigurationWithIdentifier:(id)a3;
- (BOOL)removeIngestedConfiguration;
- (BOOL)saveConfiguration:(void *)a3 returnError:;
- (BOOL)saveIngestedConfiguration;
- (BOOL)saveIngestedConfiguration:(id *)a3;
- (BOOL)updateAccountIdentifiers:(id)a3;
- (BOOL)updateAppLayerVPNMappingRules:(id)a3;
- (BOOL)updateDefaultAfterAddingConfiguration;
- (BOOL)updateDefaultAfterDeletingConfiguration;
- (BOOL)updateManagedAppRules:(id)a3;
- (BOOL)updatePerAppMappingRules:(id)a3;
- (NEConfiguration)ingestedConfiguration;
- (NEConfigurationManager)manager;
- (NEProfileIngestion)initWithName:(id)a3;
- (NEProfileIngestion)initWithNameAndType:(id)a3 payloadType:(id)a4;
- (NSMutableArray)currentConfigurations;
- (NSString)clientName;
- (NSString)payloadType;
- (id)copyManagedConfigurationIDs;
- (id)findConfigurationByConfigurationID:(id)a3;
- (id)findConfigurationByName:(id)a3;
- (id)findConfigurationByPayloadUUID:(id)a3;
- (id)getCertificatesForConfigurationWithIdentifier:(id)a3;
- (id)setAsideConfigurationName:(id)a3 unsetAside:(BOOL)a4;
- (uint64_t)enableAlwaysOnVpnInternal:(void *)a1;
- (uint64_t)matchConfigAppUUID:(void *)a3 configUUIDType:(void *)a4 configAppUUID:;
- (void)dealloc;
- (void)enableDefaultService;
- (void)removeAllConfigurationsWithPayload:(id)a3 profile:(id)a4;
- (void)setCurrentConfigurations:(id)a3;
- (void)setIngestedConfiguration:(id)a3;
- (void)unlockConfigurations;
@end

@implementation NEProfileIngestion

- (NEProfileIngestion)initWithNameAndType:(id)a3 payloadType:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___NEProfileIngestion;
  v8 = -[NEProfileIngestion init](&v19, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientName = v8->_clientName;
    v8->_clientName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    payloadType = v8->_payloadType;
    v8->_payloadType = (NSString *)v11;

    v13 = -[NEConfigurationManager initSynchronous](objc_alloc(&OBJC_CLASS___NEConfigurationManager), "initSynchronous");
    manager = v8->_manager;
    v8->_manager = v13;

    if (!v8->_manager)
    {

      v8 = 0LL;
    }
  }

  ne_log_obj();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v21 = v17;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    id v18 = v17;
    _os_log_debug_impl(&dword_1876B1000, v15, OS_LOG_TYPE_DEBUG, "%@ initWithNameAndType name %@, type %@", buf, 0x20u);
  }

  return v8;
}

- (NEProfileIngestion)initWithName:(id)a3
{
  return -[NEProfileIngestion initWithNameAndType:payloadType:](self, "initWithNameAndType:payloadType:", a3, 0LL);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NEProfileIngestion;
  -[NEProfileIngestion dealloc](&v2, sel_dealloc);
}

- (BOOL)loadConfigurationsForceReloadFromDisk
{
  objc_super v2 = self;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (self)
  {
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 1;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    v3 = -[NEProfileIngestion manager](v2, "manager");
    uint64_t v4 = MEMORY[0x1895F8AE0];
    id v5 = MEMORY[0x1895F8AE0];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke;
    v12[3] = &unk_18A08F620;
    v12[4] = v2;
    v12[5] = &v13;
    [v3 loadConfigurationsWithCompletionQueue:v4 handler:v12];

    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (id)objc_opt_class();
      int v9 = *((unsigned __int8 *)v14 + 24);
      v10 = -[NEProfileIngestion currentConfigurations](v2, "currentConfigurations");
      uint64_t v11 = [v10 count];
      *(_DWORD *)buf = 138413058;
      id v18 = v8;
      __int16 v19 = 1024;
      int v20 = 1;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "%@ loadConfigurationsWithRefreshOption (refresh = %d) done, error = %d, #configs loaded %lu",  buf,  0x22u);
    }

    LOBYTE(v2) = *((_BYTE *)v14 + 24) == 0;
    _Block_object_dispose(&v13, 8);
  }

  return (char)v2;
}

- (id)findConfigurationByName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v6);
          }
          int v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          [v9 name];
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v5 = v9;
            goto LABEL_12;
          }
        }

        id v5 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (id)setAsideConfigurationName:(id)a3 unsetAside:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[NEProfileIngestion findConfigurationByConfigurationID:](self, "findConfigurationByConfigurationID:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412802;
    *(void *)v27 = v6;
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v4;
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEBUG,  "setAsideConfigurationName: configID %@, unset %d, configurations %@",  (uint8_t *)&v26,  0x1Cu);
  }

  if (!v7)
  {
    ne_log_obj();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      *(void *)v27 = v6;
      _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "setAsideConfigurationName can't find configuration of ID  %@",  (uint8_t *)&v26,  0xCu);
    }

    goto LABEL_16;
  }

  [v7 name];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v4)
  {
    uint64_t v18 = [v9 stringByAppendingString:v6];
    goto LABEL_12;
  }

  int v11 = [v9 hasSuffix:v6];

  if (v11)
  {
    [v7 name];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 length];
    uint64_t v14 = [v6 length];

    uint64_t v15 = v13 - v14;
    if (v13 == v14)
    {
      ne_log_obj();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        *(void *)v27 = v6;
        v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' would be empty after unset-aside";
LABEL_26:
        _os_log_error_impl(&dword_1876B1000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, 0xCu);
        goto LABEL_16;
      }

      goto LABEL_16;
    }

    [v7 name];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v10 substringToIndex:v15];
LABEL_12:
    __int128 v16 = (os_log_s *)v18;

    -[NEProfileIngestion findConfigurationByName:](self, "findConfigurationByName:", v16);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      ne_log_obj();
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_16;
      }

      int v26 = 67109378;
      *(_DWORD *)v27 = v4;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v16;
      uint64_t v25 = "setAsideConfigurationName failed (unSetAside = %d), name '%@' in use.";
    }

    else
    {
      [v7 payloadInfo];
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        [v7 payloadInfo];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 setIsSetAside:!v4];

        [v7 setName:v16];
        -[NEProfileIngestion saveConfiguration:returnError:](self, v7, 0LL);
        id v21 = v7;
        goto LABEL_17;
      }

      ne_log_obj();
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v26 = 67109378;
      *(_DWORD *)v27 = v4;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v16;
      uint64_t v25 = "setAsideConfigurationName failed (unSetAside = %d), configuration '%@' is missing payload info.";
    }

    _os_log_error_impl(&dword_1876B1000, (os_log_t)v20, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x12u);
    goto LABEL_14;
  }

  ne_log_obj();
  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v26 = 138412290;
    *(void *)v27 = v6;
    v17 = "setAsideConfigurationName: unset-aside failed. Name '%@' is not a set-aside name";
    goto LABEL_26;
  }

- (id)findConfigurationByPayloadUUID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "findConfigurationByPayloadUUID for payloadUUID %@",  buf,  0xCu);
  }

  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        int v9 = 0LL;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v9);
          ne_log_obj();
          int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            [v10 payloadInfo];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              [v10 payloadInfo];
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 payloadUUID];
              __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              id v28 = v19;
              _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "findConfigurationByPayloadUUID check config with payloadUUID %@",  buf,  0xCu);
            }

            else
            {
              *(_DWORD *)buf = 138412290;
              id v28 = 0LL;
              _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "findConfigurationByPayloadUUID check config with payloadUUID %@",  buf,  0xCu);
            }
          }

          uint64_t v12 = [v10 payloadInfo];
          if (v12)
          {
            uint64_t v13 = (void *)v12;
            [v10 payloadInfo];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 payloadUUID];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            char v16 = [v15 isEqualToString:v4];

            if ((v16 & 1) != 0)
            {
              id v6 = v10;
              goto LABEL_21;
            }
          }

          int v9 = (char *)v9 + 1;
        }

        while (v6 != v9);
        uint64_t v20 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        id v6 = (id)v20;
      }

      while (v20);
    }

- (id)findConfigurationByConfigurationID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEBUG,  "findConfigurationByConfigurationID failed: empty identifier",  buf,  2u);
    }

    id v6 = 0LL;
LABEL_16:

    goto LABEL_17;
  }

  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v6 = (id)-[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    if (v6)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          [v10 identifier];
          int v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 UUIDString];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = [v12 isEqualToString:v5];

          if ((v13 & 1) != 0)
          {
            id v6 = v10;
            goto LABEL_16;
          }
        }

        id v6 = (id)-[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
        if (v6) {
          continue;
        }
        break;
      }
    }

    goto LABEL_16;
  }

- (BOOL)isInstalled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0LL;
}

- (void)removeAllConfigurationsWithPayload:(id)a3 profile:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (isa_nsstring(v6) && (isa_nsstring(v7) & 1) != 0)
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v7;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Removing existing configurations with payload UUID %@ and profile UUID %@",  buf,  0x16u);
    }

    int v9 = (void *)MEMORY[0x1896079C8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke;
    v33[3] = &unk_18A08F648;
    id v28 = v6;
    v34 = (os_log_s *)v6;
    id v27 = v7;
    id v35 = v7;
    uint64_t v10 = [v9 predicateWithBlock:v33];
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = (void *)v10;
    [v11 filteredArrayUsingPredicate:v10];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          __int128 v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
          BOOL v19 = -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v18);
          ne_log_obj();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = v20;
          if (v19)
          {
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_15;
            }
            [v18 name];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 identifier];
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            id v38 = v22;
            __int16 v39 = 2112;
            id v40 = v23;
            _os_log_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_DEFAULT,  "Removed duplicate configuration %@ (%@)",  buf,  0x16u);
            goto LABEL_13;
          }

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            [v18 name];
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 identifier];
            __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            id v38 = v22;
            __int16 v39 = 2112;
            id v40 = v23;
            _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to remove duplicate configuration %@ (%@)",  buf,  0x16u);
LABEL_13:
          }

- (BOOL)createConfigurationFromPayload:(id)a3 payloadType:(id)a4
{
  uint64_t v162 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 payloadAtom];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"UserDefinedName"];
  int v9 = (char *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"VPNSubType"];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    [v8 objectForKeyedSubscript:@"PayloadDisplayName"];
    int v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if ([v7 isEqualToString:@"com.apple.webcontent-filter"])
      {
        int v11 = kNECFPluginBundleIDKey;
      }

      else
      {
        int v12 = [v7 isEqualToString:@"com.apple.dnsProxy.managed"];
        int v11 = kNEVPNTypeKey;
        if (v12) {
          int v11 = &kNEDNSProxyAppBundleIdentifierKey;
        }
      }

      [v8 objectForKeyedSubscript:*v11];
      int v9 = (char *)objc_claimAutoreleasedReturnValue();
    }
  }

  ne_log_obj();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v157 = v7;
    __int16 v158 = 2112;
    v159 = v9;
    _os_log_debug_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEBUG,  "createConfigurationFromPayload type %@, name '%@'",  buf,  0x16u);
  }

  uint64_t v14 = -[NEProfileIngestion findConfigurationByName:](self, "findConfigurationByName:", v9);
  uint64_t v15 = (void *)v14;
  v128 = self;
  id v127 = v6;
  if (!v14) {
    goto LABEL_130;
  }
  v121 = (void *)v14;
  v124 = v10;
  v119 = v8;
  uint64_t v16 = v9;
  uint64_t v17 = self;
  __int128 v18 = v16;
  if (v17)
  {
    [v16 componentsSeparatedByString:@" "];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v20 = [v19 count];
    unint64_t v21 = v20 - 1;
    if (v20 > 1)
    {
      id v24 = v7;
      [v19 objectAtIndex:v21];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v25 length];
      [MEMORY[0x189607810] characterSetWithCharactersInString:@"0123456789 "];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 stringByTrimmingCharactersInSet:v27];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v28 length])
      {
        __int128 v22 = v18;
        uint64_t v23 = 0LL;
      }

      else
      {
        [v19 objectAtIndex:v21];
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = (int)[v29 intValue];

        objc_msgSend(v18, "substringToIndex:", objc_msgSend(v18, "length") - v26);
        __int128 v22 = (char *)objc_claimAutoreleasedReturnValue();
      }

      id v7 = v24;
    }

    else
    {
      __int128 v22 = v18;
      uint64_t v23 = 0LL;
    }

    -[NEProfileIngestion currentConfigurations](v128, "currentConfigurations");
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      __int128 v31 = 0LL;
      uint64_t v32 = v23 + 1;
      do
      {
        objc_msgSend(v22, "stringByAppendingFormat:", @" %ld", v32);
        int v9 = (char *)objc_claimAutoreleasedReturnValue();
        v33 = -[NEProfileIngestion findConfigurationByName:](v128, "findConfigurationByName:", v9);
        ++v32;
        __int128 v31 = v9;
      }

      while (v33);
    }

    else
    {
      ne_log_obj();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v34,  OS_LOG_TYPE_ERROR,  "resolveConfigurationNameConflict system configurations disappeared",  buf,  2u);
      }

      int v9 = 0LL;
    }
  }

  else
  {
    int v9 = 0LL;
  }

  ne_log_obj();
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v119;
  id v6 = v127;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    v82 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412802;
    id v157 = v82;
    __int16 v158 = 2112;
    v159 = v18;
    __int16 v160 = 2112;
    v161 = v9;
    id v83 = v82;
    _os_log_debug_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_DEBUG,  "%@ createConfigurationFromPayload: rename %@ to %@",  buf,  0x20u);
  }

  uint64_t v15 = v121;
  uint64_t v10 = v124;
  self = v128;
  if (v9)
  {
LABEL_130:
    if (isa_nsstring(v10)
      && +[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v10))
    {
      v36 = -[NEProfileIngestion manager](self, "manager");
      v149[0] = MEMORY[0x1895F87A8];
      v149[1] = 3221225472LL;
      v149[2] = __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke;
      v149[3] = &unk_18A08F6A8;
      id v150 = v6;
      [v36 fetchUpgradeInfoForPluginType:v10 completionQueue:MEMORY[0x1895F8AE0] handler:v149];
    }

    if ([v7 isEqualToString:@"com.apple.vpn.managed"])
    {
      [v8 objectForKeyedSubscript:@"VPNType"];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      int v38 = [v37 isEqualToString:@"PPTP"];

      if (v38)
      {
        ne_log_obj();
        __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1876B1000, v39, OS_LOG_TYPE_DEBUG, "ingesting PPTP not supported", buf, 2u);
        }

        -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", 0LL);
        BOOL v40 = 1;
LABEL_115:

        goto LABEL_116;
      }

      v54 = (os_log_s *)-[NEConfiguration initWithVPNPayload:configurationName:grade:]( objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v9,  1LL);
      goto LABEL_52;
    }

    if ([v7 isEqualToString:@"com.apple.vpn.managed.alwayson"])
    {
      -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v122 = v15;
        v125 = v10;
        v42 = v8;
        id v43 = v7;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        __int128 v145 = 0u;
        __int128 v146 = 0u;
        v44 = -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        uint64_t v45 = [v44 countByEnumeratingWithState:&v145 objects:v155 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v146;
          while (2)
          {
            for (uint64_t i = 0LL; i != v46; ++i)
            {
              if (*(void *)v146 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*((void *)&v145 + 1) + 8 * i);
              uint64_t v50 = [v49 alwaysOnVPN];
              if (v50)
              {
                v51 = (void *)v50;
                [v49 payloadInfo];
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                char v53 = [v52 isSetAside];

                if ((v53 & 1) == 0)
                {
                  ne_log_obj();
                  v81 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    v115 = (void *)objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    id v157 = v115;
                    id v116 = v115;
                    _os_log_error_impl( &dword_1876B1000,  v81,  OS_LOG_TYPE_ERROR,  "%@ createConfigurationFromPayload: installations of multiple Always-On VPN configs are not allowed.",  buf,  0xCu);
                  }

                  BOOL v40 = 0;
                  id v7 = v43;
                  uint64_t v8 = v42;
                  uint64_t v15 = v122;
                  uint64_t v10 = v125;
                  goto LABEL_114;
                }
              }
            }

            uint64_t v46 = [v44 countByEnumeratingWithState:&v145 objects:v155 count:16];
            if (v46) {
              continue;
            }
            break;
          }
        }

        id v7 = v43;
        uint64_t v8 = v42;
        uint64_t v15 = v122;
        uint64_t v10 = v125;
        self = v128;
        id v6 = v127;
      }

      v54 = (os_log_s *)-[NEConfiguration initWithAlwaysOnVPNPayload:configurationName:grade:]( (__CFString *)objc_alloc(&OBJC_CLASS___NEConfiguration),  v6,  v9,  1LL);
      goto LABEL_52;
    }

    if ([v7 isEqualToString:@"com.apple.vpn.managed.applayer"])
    {
      ne_log_obj();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v157 = v7;
        _os_log_error_impl( &dword_1876B1000,  v55,  OS_LOG_TYPE_ERROR,  "%@ payloads are not supported on TV",  buf,  0xCu);
      }

- (BOOL)saveIngestedConfiguration
{
  objc_super v2 = self;
  v3 = -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  LOBYTE(v2) = -[NEProfileIngestion saveConfiguration:returnError:](v2, v3, 0LL);

  return (char)v2;
}

- (BOOL)saveIngestedConfiguration:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[NEProfileIngestion saveConfiguration:returnError:](self, v5, a3);

  return (char)a3;
}

- (BOOL)removeConfiguration:(id)a3
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 payloadInfo];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v38 = [v5 isSetAside];

  uint64_t v42 = 0LL;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 0;
  if (v4)
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v29 = (id)objc_opt_class();
      [v4 name];
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v47 = v29;
      __int16 v48 = 2112;
      v49 = v30;
      _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration: '%@'", buf, 0x16u);
    }

    -[NEProfileIngestion manager](self, "manager");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = MEMORY[0x1895F8AE0];
    id v9 = MEMORY[0x1895F8AE0];
    v39[0] = MEMORY[0x1895F87A8];
    v39[1] = 3221225472LL;
    v39[2] = __42__NEProfileIngestion_removeConfiguration___block_invoke;
    v39[3] = &unk_18A08FE50;
    uint64_t v10 = (os_log_s *)v4;
    BOOL v40 = v10;
    uint64_t v41 = &v42;
    [v7 removeConfiguration:v10 withCompletionQueue:v8 handler:v39];

    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v31 = (id)objc_opt_class();
      -[os_log_s name](v10, "name");
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      int v33 = *((unsigned __int8 *)v43 + 24);
      *(_DWORD *)buf = 138412802;
      id v47 = v31;
      __int16 v48 = 2112;
      v49 = v32;
      __int16 v50 = 1024;
      int v51 = v33;
      _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ removeConfiguration '%@', ouint64_t k = %d", buf, 0x1Cu);
    }

    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      for (unint64_t i = 0LL; ; ++i)
      {
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v16 = i < [v15 count];

        if (!v16) {
          break;
        }
        -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 objectAtIndex:i];
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

        [v18 identifier];
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 UUIDString];
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s identifier](v10, "identifier");
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 UUIDString];
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = [v20 isEqualToString:v22];

        if (v23)
        {
          -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 removeObjectAtIndex:i];

          ne_log_obj();
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v36 = (id)objc_opt_class();
            v37 = -[os_log_s name](v10, "name");
            *(_DWORD *)buf = 138412546;
            id v47 = v36;
            __int16 v48 = 2112;
            v49 = v37;
            _os_log_debug_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_DEBUG,  "%@ removeConfiguration '%@' from cached list",  buf,  0x16u);
          }

          break;
        }
      }
    }

    if (v38) {
      -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 0);
    }
    BOOL v25 = *((_BYTE *)v43 + 24) != 0;
    id v24 = v40;
  }

  else
  {
    ne_log_obj();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v47 = v34;
      id v35 = v34;
      _os_log_debug_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_DEBUG,  "%@ removeConfiguration skipped: empty configuration.",  buf,  0xCu);
    }

    BOOL v25 = 1;
  }

  _Block_object_dispose(&v42, 8);
  return v25;
}

- (BOOL)removeConfigurationWithIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEProfileIngestion findConfigurationByConfigurationID:](self, "findConfigurationByConfigurationID:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v5);
  }

  else
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2112;
      id v12 = v4;
      id v8 = v10;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "%@ removeConfigurationWithIdentifier failed: no configuration found with id %@",  (uint8_t *)&v9,  0x16u);
    }
  }

  return 1;
}

- (id)getCertificatesForConfigurationWithIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 getCertificates];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)removeIngestedConfiguration
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v3 = -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  if (!v3)
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v8 = v10;
      _os_log_debug_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEBUG,  "%@ removeIngestedConfiguration skipped: current configuration does not exist",  (uint8_t *)&v9,  0xCu);
    }

    return 1;
  }

  -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = -[NEProfileIngestion removeConfiguration:](self, "removeConfiguration:", v4);

  if (v5)
  {
    -[NEProfileIngestion setIngestedConfiguration:](self, "setIngestedConfiguration:", 0LL);
    return 1;
  }

  return 0;
}

- (BOOL)updateDefaultAfterAddingConfiguration
{
  objc_super v2 = self;
  uint64_t v65 = *MEMORY[0x1895F89C0];
  v3 = -[NEProfileIngestion ingestedConfiguration](self, "ingestedConfiguration");
  [v3 name];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __int16 v48 = v4;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    -[NEProfileIngestion currentConfigurations](v2, "currentConfigurations");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v57;
      __int16 v50 = v5;
      int v51 = v2;
      uint64_t v49 = *(void *)v57;
LABEL_4:
      uint64_t v9 = 0LL;
      uint64_t v55 = v7;
      while (1)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
        uint64_t v11 = [v10 payloadInfo];
        if (!v11) {
          goto LABEL_13;
        }
        id v12 = (void *)v11;
        [v10 payloadInfo];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 identifier];
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v14 isEqual:v16]) {
          break;
        }
        [v10 payloadInfo];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        [v54 profileIdentifier];
        uint64_t v52 = v14;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEProfileIngestion ingestedConfiguration](v2, "ingestedConfiguration");
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 payloadInfo];
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 profileIdentifier];
        unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v53 = [v17 isEqualToString:v20];

        BOOL v5 = v50;
        uint64_t v8 = v49;

        objc_super v2 = v51;
        uint64_t v7 = v55;
        if (!v53) {
          goto LABEL_13;
        }
        -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 name];
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v10 identifier];
        [(id)v23 UUIDString];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 stringByAppendingString:v24];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        [v10 name];
        BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = [v25 isEqualToString:v12];

        if ((v23 & 1) != 0)
        {
          id v27 = v10;

          objc_super v2 = v51;
          if (!v27) {
            goto LABEL_25;
          }
          [v27 VPN];
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30) {
            [v27 VPN];
          }
          else {
            [v27 appVPN];
          }
          int v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
          [v34 VPN];
          id v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
          id v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (v35) {
            [v36 VPN];
          }
          else {
            [v36 appVPN];
          }
          int v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33
            && v38
            && (__int16 v39 = (void *)objc_opt_class(), [v39 isEqual:objc_opt_class()]))
          {
            ne_log_obj();
            BOOL v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
              uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
              [v41 name];
              uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
              int v43 = [v33 isOnDemandEnabled];
              *(_DWORD *)buf = 138412546;
              uint64_t v61 = v42;
              __int16 v62 = 1024;
              int v63 = v43;
              _os_log_impl( &dword_1876B1000,  v40,  OS_LOG_TYPE_DEFAULT,  "%@: Using onDemandEnabled setting from set-aside configuration (%d)",  buf,  0x12u);
            }

            objc_msgSend(v38, "setOnDemandEnabled:", objc_msgSend(v33, "isOnDemandEnabled"));
          }

          else
          {
            ne_log_obj();
            uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              -[NEProfileIngestion ingestedConfiguration](v51, "ingestedConfiguration");
              char v45 = (void *)objc_claimAutoreleasedReturnValue();
              [v45 name];
              uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              uint64_t v61 = v46;
              _os_log_impl( &dword_1876B1000,  v44,  OS_LOG_TYPE_DEFAULT,  "%@: VPN type mis-match with set-aside configuration",  buf,  0xCu);
            }
          }

          goto LABEL_41;
        }

        BOOL v5 = v50;
        objc_super v2 = v51;
        uint64_t v8 = v49;
LABEL_12:

LABEL_13:
        if (v7 == ++v9)
        {
          uint64_t v26 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
          uint64_t v7 = v26;
          if (v26) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }

      uint64_t v7 = v55;
LABEL_11:

      goto LABEL_12;
    }

- (BOOL)updateDefaultAfterDeletingConfiguration
{
  objc_super v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEBUG,  "To-DO: updateDefaultAfterDeletingConfiguration",  v4,  2u);
  }

  return 1;
}

- (id)copyManagedConfigurationIDs
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    -[NEProfileIngestion currentConfigurations](self, "currentConfigurations", 0LL);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v10 payloadInfo];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 payloadUUID];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            [v10 identifier];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 UUIDString];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 addObject:v14];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v7);
    }
  }

  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (BOOL)enableAlwaysOnVpn
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@ enableAlwaysOnVpn", (uint8_t *)&v6, 0xCu);
  }

  return -[NEProfileIngestion enableAlwaysOnVpnInternal:](self, 1);
}

- (BOOL)lockConfigurations
{
  objc_super v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: lockConfigurations", v4, 2u);
  }

  return 1;
}

- (void)unlockConfigurations
{
  objc_super v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "TO-DO: unlockConfigurations", v3, 2u);
  }
}

- (void)enableDefaultService
{
  objc_super v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEBUG,  "TO-DO: enableDefaultService: activate last service after removing current service",  v3,  2u);
  }
}

- (BOOL)updatePerAppMappingRules:(id)a3
{
  uint64_t v178 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v168 = (id)objc_opt_class();
    __int16 v169 = 2112;
    id v170 = v4;
    id v108 = v168;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@ updatePerAppMappingRules %@", buf, 0x16u);
  }

  __int128 v133 = self;

  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v159 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  __int128 v162 = 0u;
  obuint64_t j = v4;
  uint64_t v129 = [obj countByEnumeratingWithState:&v159 objects:v177 count:16];
  if (v129)
  {
    uint64_t v126 = *(void *)v160;
    do
    {
      for (uint64_t i = 0LL; i != v129; ++i)
      {
        if (*(void *)v160 != v126) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v159 + 1) + 8 * i);
        [obj objectForKey:v8];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v155 = 0u;
        __int128 v156 = 0u;
        __int128 v157 = 0u;
        __int128 v158 = 0u;
        __int128 v131 = v9;
        [v9 allValues];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v155 objects:v176 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v156;
          do
          {
            for (uint64_t j = 0LL; j != v12; ++j)
            {
              if (*(void *)v156 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v155 + 1) + 8 * j);
              [v6 objectForKeyedSubscript:v15];
              BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v16)
              {
                [MEMORY[0x189603FE0] set];
                BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
                [v6 setObject:v16 forKeyedSubscript:v15];
              }

              [v16 addObject:v8];
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v155 objects:v176 count:16];
          }

          while (v12);
        }
      }

      uint64_t v129 = [obj countByEnumeratingWithState:&v159 objects:v177 count:16];
    }

    while (v129);
  }

  ne_log_obj();
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int128 v18 = v133;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v109 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v168 = v109;
    __int16 v169 = 2112;
    id v170 = v6;
    id v110 = v109;
    _os_log_debug_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_DEBUG,  "%@ updatePerAppMappingRules appIDsByPerAppUUID %@",  buf,  0x16u);
  }

  __int128 v153 = 0u;
  __int128 v154 = 0u;
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  -[NEProfileIngestion currentConfigurations](v133, "currentConfigurations");
  id v116 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v116 countByEnumeratingWithState:&v151 objects:v175 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v152;
    *(void *)&__int128 v20 = 138413058LL;
    __int128 v111 = v20;
    uint64_t v112 = *(void *)v152;
    do
    {
      uint64_t v23 = 0LL;
      uint64_t v114 = v21;
      do
      {
        if (*(void *)v152 != v22) {
          objc_enumerationMutation(v116);
        }
        id v24 = *(void **)(*((void *)&v151 + 1) + 8 * v23);
        objc_msgSend(v24, "externalIdentifier", v111);
        __int128 v130 = (void *)objc_claimAutoreleasedReturnValue();
        if (v130)
        {
          [MEMORY[0x189603FA8] array];
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 appVPN];
          BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();

          id v118 = v24;
          if (v25)
          {
            [v24 appVPN];
            uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            id v27 = @"VPNUUID";
            v124 = 0LL;
            id v127 = @"VPNUUID";
            id v28 = v26;
          }

          else
          {
            [v24 relay];
            id v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              [v24 relay];
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v30 perApp];
              uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

              id v31 = @"RelayUUID";
              id v28 = 0LL;
              v124 = v26;
              id v127 = @"RelayUUID";
            }

            else
            {
              uint64_t v32 = v23;
              [v24 contentFilter];
              int v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v33 perApp];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if (v34) {
                [v24 contentFilter];
              }
              else {
                [v24 dnsProxy];
              }
              id v35 = (void *)objc_claimAutoreleasedReturnValue();
              [v35 perApp];
              uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

              [v24 contentFilter];
              id v36 = (void *)objc_claimAutoreleasedReturnValue();
              [v36 perApp];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              int v38 = @"ContentFilterUUID";
              if (!v37) {
                int v38 = @"DNSProxyUUID";
              }
              id v127 = v38;

              id v28 = 0LL;
              v124 = v26;
              __int128 v18 = v133;
              uint64_t v23 = v32;
            }
          }

          uint64_t v39 = -[__CFString copyAppRuleIDs](v26, "copyAppRuleIDs");
          if (v39)
          {
            BOOL v40 = (void *)v39;
            uint64_t v120 = v23;
            ne_log_obj();
            uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              int v63 = (void *)objc_opt_class();
              id v64 = v63;
              [v118 name];
              uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v111;
              id v168 = v63;
              __int16 v169 = 2112;
              id v170 = v65;
              __int16 v171 = 2112;
              v172 = v130;
              __int16 v173 = 2112;
              v174 = v40;
              _os_log_debug_impl( &dword_1876B1000,  v41,  OS_LOG_TYPE_DEBUG,  "%@ updatePerAppMappingRules config %@ perAppUUID %@, existing appRules %@",  buf,  0x2Au);
            }

            __int128 v149 = 0u;
            __int128 v150 = 0u;
            __int128 v147 = 0u;
            __int128 v148 = 0u;
            uint64_t v42 = v40;
            uint64_t v43 = -[__CFString countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v147,  v166,  16LL);
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v45 = *(void *)v148;
              do
              {
                uint64_t v46 = 0LL;
                do
                {
                  if (*(void *)v148 != v45) {
                    objc_enumerationMutation(v42);
                  }
                  id v47 = *(id *)(*((void *)&v147 + 1) + 8 * v46);
                  __int16 v48 = v47;
                  if (!v18)
                  {

LABEL_49:
                    [obj objectForKey:v48];
                    __int16 v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]( (uint64_t)v18,  v50,  v127,  v130) & 1) == 0) {
                      [v122 addObject:v48];
                    }

                    goto LABEL_52;
                  }

                  if (isAutoCreatedRule__onceToken != -1) {
                    dispatch_once(&isAutoCreatedRule__onceToken, &__block_literal_global_19040);
                  }
                  char v49 = [(id)isAutoCreatedRule__autoRuleIdentifiers containsObject:v48];

                  if ((v49 & 1) == 0) {
                    goto LABEL_49;
                  }
LABEL_52:
                  ++v46;
                }

                while (v44 != v46);
                uint64_t v51 = -[__CFString countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v147,  v166,  16LL);
                uint64_t v44 = v51;
              }

              while (v51);
            }

            __int128 v145 = 0u;
            __int128 v146 = 0u;
            __int128 v143 = 0u;
            __int128 v144 = 0u;
            id v52 = v122;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v143 objects:v165 count:16];
            if (v53)
            {
              uint64_t v54 = v53;
              char v55 = 0;
              uint64_t v56 = *(void *)v144;
              do
              {
                for (uint64_t k = 0LL; k != v54; ++k)
                {
                  if (*(void *)v144 != v56) {
                    objc_enumerationMutation(v52);
                  }
                  __int128 v58 = *(void **)(*((void *)&v143 + 1) + 8 * k);
                  ne_log_obj();
                  __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v168 = v58;
                    _os_log_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_DEFAULT,  "updatePerAppMappingRules: Removing PerApp rule for identifier %@.",  buf,  0xCu);
                  }

                  if (v28) {
                    v60 = v28;
                  }
                  else {
                    v60 = v124;
                  }
                  if ((-[__CFString removeAppRuleByID:](v60, "removeAppRuleByID:", v58) & 1) != 0)
                  {
                    char v55 = 1;
                  }

                  else
                  {
                    ne_log_obj();
                    uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v168 = v58;
                      _os_log_error_impl( &dword_1876B1000,  v61,  OS_LOG_TYPE_ERROR,  "updatePerAppMappingRules: Could not remove perApp rule for identifier %@.",  buf,  0xCu);
                    }
                  }
                }

                uint64_t v54 = [v52 countByEnumeratingWithState:&v143 objects:v165 count:16];
              }

              while (v54);

              __int128 v18 = v133;
              if ((v55 & 1) != 0) {
                -[NEProfileIngestion saveConfiguration:returnError:](v133, v118, 0LL);
              }
            }

            else
            {
            }

            __int16 v62 = v124;
            uint64_t v22 = v112;
            uint64_t v21 = v114;
            uint64_t v23 = v120;
          }

          else
          {
            uint64_t v42 = v28;
            id v28 = v124;
            __int16 v62 = v127;
          }
        }

        ++v23;
      }

      while (v23 != v21);
      uint64_t v21 = [v116 countByEnumeratingWithState:&v151 objects:v175 count:16];
    }

    while (v21);
  }

  __int128 v141 = 0u;
  __int128 v142 = 0u;
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  -[NEProfileIngestion currentConfigurations](v18, "currentConfigurations");
  id v117 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v66 = [v117 countByEnumeratingWithState:&v139 objects:v164 count:16];
  if (!v66) {
    goto LABEL_132;
  }
  uint64_t v67 = v66;
  uint64_t v68 = *(void *)v140;
  uint64_t v113 = *(void *)v140;
  do
  {
    uint64_t v69 = 0LL;
    uint64_t v115 = v67;
    do
    {
      if (*(void *)v140 != v68) {
        objc_enumerationMutation(v117);
      }
      v70 = *(void **)(*((void *)&v139 + 1) + 8 * v69);
      [v70 externalIdentifier];
      id v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        [v6 objectForKeyedSubscript:v71];
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        [v70 appVPN];
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          uint64_t v132 = [v70 appVPN];
          uint64_t v73 = @"VPNUUID";
          uint64_t v74 = @"VPNUUID";
        }

        else
        {
          uint64_t v132 = 0LL;
          uint64_t v73 = 0LL;
        }

        [v70 contentFilter];
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
        {
          [v70 contentFilter];
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          [v76 perApp];
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v77)
          {
            v78 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
            [v70 contentFilter];
            id v79 = (void *)objc_claimAutoreleasedReturnValue();
            [v79 setPerApp:v78];
          }

          v80 = v70;
          [v70 contentFilter];
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = @"ContentFilterUUID";
          goto LABEL_102;
        }

        [v70 dnsProxy];
        id v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          [v70 dnsProxy];
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          [v84 perApp];
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v85)
          {
            v86 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
            [v70 dnsProxy];
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            [v87 setPerApp:v86];
          }

          v80 = v70;
          [v70 dnsProxy];
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = @"DNSProxyUUID";
          goto LABEL_102;
        }

        [v70 relay];
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (v88)
        {
          [v70 relay];
          uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
          [v89 perApp];
          uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v90)
          {
            uint64_t v91 = objc_alloc_init(&OBJC_CLASS___NEPerApp);
            [v70 relay];
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            [v92 setPerApp:v91];
          }

          v80 = v70;
          [v70 relay];
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = @"RelayUUID";
LABEL_102:
          uint64_t v93 = [v81 perApp];

          uint64_t v94 = v82;
          uint64_t v73 = v94;
          v70 = v80;
        }

        else
        {
          uint64_t v93 = 0LL;
        }

        if (v132 | v93)
        {
          uint64_t v119 = v69;
          __int128 v137 = 0u;
          __int128 v138 = 0u;
          __int128 v135 = 0u;
          __int128 v136 = 0u;
          id v95 = v121;
          uint64_t v96 = [v95 countByEnumeratingWithState:&v135 objects:v163 count:16];
          if (v96)
          {
            uint64_t v97 = v96;
            v125 = (void *)v93;
            v128 = v70;
            char v123 = 0;
            uint64_t v98 = *(void *)v136;
            do
            {
              for (uint64_t m = 0LL; m != v97; ++m)
              {
                if (*(void *)v136 != v98) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v100 = *(void **)(*((void *)&v135 + 1) + 8 * m);
                [obj objectForKey:v100];
                uint64_t v101 = (void *)objc_claimAutoreleasedReturnValue();
                if ((-[NEProfileIngestion matchConfigAppUUID:configUUIDType:configAppUUID:]( (uint64_t)v133,  v101,  v73,  v71) & 1) != 0)
                {
                  uint64_t v102 = (void *)v132;
                  if (!v132) {
                    uint64_t v102 = v125;
                  }
                  v103 = (os_log_s *)[v102 copyAppRuleByID:v100];
                  if (!v103)
                  {
                    ne_log_obj();
                    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v168 = v100;
                      _os_log_impl( &dword_1876B1000,  v104,  OS_LOG_TYPE_DEFAULT,  "updatePerAppMappingRules: Adding PerApp rule for identifier %@.",  buf,  0xCu);
                    }

                    if ([v128 setPerAppRuleSettings:MEMORY[0x189604A60] withAppIdentifier:v100])
                    {
                      v103 = 0LL;
                      char v123 = 1;
                    }

                    else
                    {
                      ne_log_obj();
                      v105 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v168 = v100;
                        _os_log_error_impl( &dword_1876B1000,  v105,  OS_LOG_TYPE_ERROR,  "updatePerAppMappingRules: Could not set PerApp rule for identifier %@",  buf,  0xCu);
                      }

                      v103 = 0LL;
                    }
                  }
                }

                else
                {
                  ne_log_obj();
                  v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v168 = v100;
                    _os_log_impl( &dword_1876B1000,  v103,  OS_LOG_TYPE_DEFAULT,  "updatePerAppMappingRules: Add for appID %@ failed - UUID/type mismatch ",  buf,  0xCu);
                  }
                }
              }

              uint64_t v97 = [v95 countByEnumeratingWithState:&v135 objects:v163 count:16];
            }

            while (v97);

            uint64_t v68 = v113;
            uint64_t v67 = v115;
            uint64_t v69 = v119;
            uint64_t v93 = (uint64_t)v125;
            if ((v123 & 1) != 0) {
              -[NEProfileIngestion saveConfiguration:returnError:](v133, v128, 0LL);
            }
          }

          else
          {

            uint64_t v67 = v115;
            uint64_t v69 = v119;
          }
        }
      }

      ++v69;
    }

    while (v69 != v67);
    uint64_t v106 = [v117 countByEnumeratingWithState:&v139 objects:v164 count:16];
    uint64_t v67 = v106;
  }

  while (v106);
LABEL_132:

  return 1;
}

- (BOOL)updateAppLayerVPNMappingRules:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412802;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2080;
    uint64_t v12 = "-[NEProfileIngestion updateAppLayerVPNMappingRules:]";
    __int16 v13 = 2112;
    id v14 = v4;
    id v8 = v10;
    _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "%@ %s %@", (uint8_t *)&v9, 0x20u);
  }

  BOOL v6 = -[NEProfileIngestion updatePerAppMappingRules:](self, "updatePerAppMappingRules:", v4);
  return v6;
}

- (BOOL)updateAccountIdentifiers:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v29 = a3;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v31 = self;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v32 = *(void *)v38;
    int v6 = 1;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v8 appVPN];
        int v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          uint64_t v10 = [&unk_18A0CFDC0 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v34;
            do
            {
              for (uint64_t j = 0LL; j != v11; ++j)
              {
                if (*(void *)v34 != v12) {
                  objc_enumerationMutation(&unk_18A0CFDC0);
                }
                uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                [v8 appVPN];
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
                [v15 removeAppRuleByID:v14];
              }

              uint64_t v11 = [&unk_18A0CFDC0 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v11);
          }

          [v8 externalIdentifier];
          BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            [v8 externalIdentifier];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 objectForKeyedSubscript:v17];
            __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();

            [v18 mailAccountIdentifiers];
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v19 count];

            if (v20)
            {
              [v18 mailAccountIdentifiers];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setMailDomains:0 accountIdentifiers:v21];
            }

            [v18 calendarAccountIdentifiers];
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v23 = [v22 count];

            if (v23)
            {
              [v18 calendarAccountIdentifiers];
              id v24 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setCalendarDomains:0 accountIdentifiers:v24];
            }

            [v18 contactsAccountIdentifiers];
            BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v26 = [v25 count];

            if (v26)
            {
              [v18 contactsAccountIdentifiers];
              id v27 = (void *)objc_claimAutoreleasedReturnValue();
              [v8 setContactsDomains:0 accountIdentifiers:v27];
            }
          }

          v6 &= -[NEProfileIngestion saveConfiguration:returnError:](v31, v8, 0LL);
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v5);
  }

  else
  {
    LOBYTE(v6) = 1;
  }

  return v6 & 1;
}

- (BOOL)updateManagedAppRules:(id)a3
{
  uint64_t v117 = *MEMORY[0x1895F89C0];
  id v67 = a3;
  ne_log_obj();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v112 = (id)objc_opt_class();
    __int16 v113 = 2112;
    id v114 = v67;
    id v65 = v112;
    _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%@ updateManagedAppRules %@", buf, 0x16u);
  }

  __int128 v97 = 0u;
  __int128 v98 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  -[NEProfileIngestion currentConfigurations](self, "currentConfigurations");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v70 = [obj countByEnumeratingWithState:&v95 objects:v109 count:16];
  if (v70)
  {
    uint64_t v69 = *(void *)v96;
    *(void *)&__int128 v5 = 138412802LL;
    __int128 v66 = v5;
    uint64_t v73 = self;
    do
    {
      for (uint64_t i = 0LL; i != v70; ++i)
      {
        if (*(void *)v96 != v69) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        if (objc_msgSend(v7, "grade", v66) != 1) {
          continue;
        }
        uint64_t v71 = i;
        [v7 pathController];
        Property = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = Property;
        if (Property) {
          Property = objc_getProperty(Property, v9, 32LL, 1);
        }
        id v11 = Property;
        int v12 = isa_nsarray(v11);

        uint64_t i = v71;
        if (!v12) {
          continue;
        }
        [MEMORY[0x189603FA8] array];
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v94 = 0u;
        id v75 = v67;
        uint64_t v79 = [v75 countByEnumeratingWithState:&v91 objects:v108 count:16];
        if (!v79) {
          goto LABEL_70;
        }
        uint64_t v78 = *(void *)v92;
        uint64_t v74 = v7;
        do
        {
          uint64_t v13 = 0LL;
          do
          {
            if (*(void *)v92 != v78) {
              objc_enumerationMutation(v75);
            }
            uint64_t v14 = *(void **)(*((void *)&v91 + 1) + 8 * v13);
            if (isa_nsstring(v14))
            {
              id v15 = v14;
              id v16 = v7;
              id v85 = v15;
              if (self)
              {
                [MEMORY[0x189607810] characterSetWithCharactersInString:@"*"];
                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
                __int128 v103 = 0u;
                __int128 v104 = 0u;
                __int128 v105 = 0u;
                __int128 v106 = 0u;
                [v16 pathController];
                __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v20 = v18;
                if (v18) {
                  __int128 v18 = objc_getProperty(v18, v19, 32LL, 1);
                }
                id v76 = v16;
                uint64_t v77 = v13;
                id v21 = v18;

                uint64_t v22 = [v21 countByEnumeratingWithState:&v103 objects:buf count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  unint64_t v24 = 0LL;
                  id v25 = 0LL;
                  uint64_t v26 = *(void *)v104;
                  uint64_t v80 = *(void *)v104;
                  id v81 = v21;
                  do
                  {
                    uint64_t v27 = 0LL;
                    uint64_t v82 = v23;
                    do
                    {
                      if (*(void *)v104 != v26)
                      {
                        uint64_t v28 = v27;
                        objc_enumerationMutation(v21);
                        uint64_t v27 = v28;
                      }

                      uint64_t v84 = v27;
                      id v29 = *(void **)(*((void *)&v103 + 1) + 8 * v27);
                      if (isa_nsdictionary(v29))
                      {
                        [v29 objectForKeyedSubscript:@"AppIdentifierMatches"];
                        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v30)
                        {
                          v86 = v29;
                          id v31 = v30;
                          if (isa_nsarray(v30))
                          {
                            __int128 v101 = 0u;
                            __int128 v102 = 0u;
                            __int128 v99 = 0u;
                            __int128 v100 = 0u;
                            id v83 = v31;
                            id v32 = v31;
                            uint64_t v33 = [v32 countByEnumeratingWithState:&v99 objects:v110 count:16];
                            if (v33)
                            {
                              uint64_t v34 = v33;
                              uint64_t v35 = *(void *)v100;
                              do
                              {
                                for (uint64_t j = 0LL; j != v34; ++j)
                                {
                                  if (*(void *)v100 != v35) {
                                    objc_enumerationMutation(v32);
                                  }
                                  __int128 v37 = *(void **)(*((void *)&v99 + 1) + 8 * j);
                                  if (isa_nsstring(v37))
                                  {
                                    [v37 stringByTrimmingCharactersInSet:v17];
                                    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    if ([v15 hasPrefix:v38])
                                    {
                                      unint64_t v39 = [v38 length];
                                      unint64_t v40 = v39;
                                      if (!v25 || v24 < v39)
                                      {
                                        id v41 = v86;

                                        unint64_t v24 = v40;
                                        id v25 = v41;
                                        id v15 = v85;
                                      }
                                    }
                                  }
                                }

                                uint64_t v34 = [v32 countByEnumeratingWithState:&v99 objects:v110 count:16];
                              }

                              while (v34);
                            }

                            uint64_t v26 = v80;
                            id v21 = v81;
                            uint64_t v23 = v82;
                            __int128 v30 = v83;
                          }

                          else
                          {
                            __int128 v30 = v31;
                          }
                        }

                        else if (!v25)
                        {
                          id v25 = v29;
                          __int128 v30 = 0LL;
                          unint64_t v24 = 0LL;
                        }
                      }

                      uint64_t v27 = v84 + 1;
                    }

                    while (v84 + 1 != v23);
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v103 objects:buf count:16];
                  }

                  while (v23);
                }

                else
                {
                  id v25 = 0LL;
                }

                self = v73;
                id v7 = v74;
                id v16 = v76;
                uint64_t v13 = v77;
              }

              else
              {
                id v25 = 0LL;
              }

              if (isa_nsdictionary(v25))
              {
                [v25 objectForKeyedSubscript:@"AllowRoamingCellularData"];
                uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
                [v25 objectForKeyedSubscript:@"AllowCellularData"];
                uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (isa_nsnumber(v42))
                {
                  char v44 = [v42 BOOLValue];
                  if ((isa_nsnumber(v43) & 1) == 0)
                  {
                    if ((v44 & 1) == 0)
                    {
                      uint64_t v45 = 0LL;
                      goto LABEL_61;
                    }

                    goto LABEL_64;
                  }
                }

                else
                {
                  char v44 = 1;
                }

                uint64_t v45 = [v43 BOOLValue] ^ 1;
                if ((v45 & 1) != 0 || (v44 & 1) == 0)
                {
LABEL_61:
                  uint64_t v46 = -[NEAppRule initWithSigningIdentifier:]( objc_alloc(&OBJC_CLASS___NEPathRule),  "initWithSigningIdentifier:",  v85);
                  -[NEPathRule setCellularBehavior:](v46, "setCellularBehavior:", v45);
                  if (v46) {
                    [v72 addObject:v46];
                  }
                }

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)payloadType
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NEConfigurationManager)manager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSMutableArray)currentConfigurations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCurrentConfigurations:(id)a3
{
}

- (NEConfiguration)ingestedConfiguration
{
  return (NEConfiguration *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIngestedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)saveConfiguration:(void *)a3 returnError:
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  int v6 = v5;
  if (a1)
  {
    uint64_t v39 = 0LL;
    unint64_t v40 = &v39;
    uint64_t v41 = 0x2020000000LL;
    char v42 = 0;
    uint64_t v33 = 0LL;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000LL;
    __int128 v36 = __Block_byref_object_copy__18969;
    __int128 v37 = __Block_byref_object_dispose__18970;
    id v38 = 0LL;
    if (!v5
      || ([v5 name],
          id v7 = (void *)objc_claimAutoreleasedReturnValue(),
          BOOL v8 = [v7 length] == 0,
          v7,
          v8))
    {
      ne_log_obj();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v44 = v23;
        id v24 = v23;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%@ saveConfigurationByConfiguration failed: empty configuration or configuration name",  buf,  0xCu);
      }
    }

    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v18 = (id)objc_opt_class();
      [v6 name];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      id v44 = v18;
      __int16 v45 = 2112;
      uint64_t v46 = v19;
      _os_log_debug_impl(&dword_1876B1000, v10, OS_LOG_TYPE_DEBUG, "%@ saveConfiguration: '%@'", buf, 0x16u);
    }

    [a1 manager];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = MEMORY[0x1895F8AE0];
    id v13 = MEMORY[0x1895F8AE0];
    uint64_t v25 = MEMORY[0x1895F87A8];
    uint64_t v26 = 3221225472LL;
    uint64_t v27 = __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke;
    uint64_t v28 = &unk_18A08F700;
    id v29 = a1;
    id v14 = v6;
    id v30 = v14;
    id v31 = &v33;
    id v32 = &v39;
    [v11 saveConfiguration:v14 withCompletionQueue:v12 handler:&v25];

    ne_log_obj();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v20 = (id)objc_opt_class();
      objc_msgSend(v14, "name", v25, v26, v27, v28, v29);
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = *((unsigned __int8 *)v40 + 24);
      *(_DWORD *)buf = 138413058;
      id v44 = v20;
      __int16 v45 = 2112;
      uint64_t v46 = v21;
      __int16 v47 = 1024;
      int v48 = v22;
      __int16 v49 = 2112;
      id v50 = v14;
      _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "%@ saveConfiguration '%@', ouint64_t k = %d, configuration %@",  buf,  0x26u);
    }

    if (a3) {
      *a3 = (id) v34[5];
    }
    BOOL v16 = *((_BYTE *)v40 + 24) != 0;

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v39, 8);
  }

  else
  {
    BOOL v16 = 0LL;
  }

  return v16;
}

void __52__NEProfileIngestion_saveConfiguration_returnError___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = (void *)objc_opt_class();
      id v15 = (void *)a1[5];
      id v16 = v14;
      [v15 name];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v4);
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = 138412802;
      id v20 = v14;
      __int16 v21 = 2112;
      int v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "%@ Error occurred when saving configuration '%@': %@",  (uint8_t *)&v19,  0x20u);
    }

    uint64_t v12 = *(void *)(a1[6] + 8LL);
    id v13 = v4;
    id v5 = *(os_log_s **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = (void *)objc_opt_class();
      id v7 = (void *)a1[5];
      id v8 = v6;
      [v7 name];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v4);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v19 = 138412802;
      id v20 = v6;
      __int16 v21 = 2112;
      int v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "%@ saved configuration '%@': %@",  (uint8_t *)&v19,  0x20u);
    }
  }
}

- (uint64_t)matchConfigAppUUID:(void *)a3 configUUIDType:(void *)a4 configAppUUID:
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v14, (void)v17);
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v14 isEqual:v8] && objc_msgSend(v15, "isEqual:", v9))
          {

            uint64_t v11 = 1LL;
            goto LABEL_13;
          }
        }

        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

void __40__NEProfileIngestion_isAutoCreatedRule___block_invoke()
{
  v0 = (void *)isAutoCreatedRule__autoRuleIdentifiers;
  isAutoCreatedRule__autoRuleIdentifiers = (uint64_t)&unk_18A0CFDA8;
}

- (uint64_t)enableAlwaysOnVpnInternal:(void *)a1
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v3 = a1;
  ne_log_obj();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = (id)objc_opt_class();
    __int16 v56 = 1024;
    LODWORD(v57[0]) = a2;
    id v41 = v55;
    _os_log_debug_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEBUG,  "%@ enableAlwaysOnVpnInternal with sanityCheck %d",  buf,  0x12u);
  }

  [v3 loadConfigurationsForceReloadFromDisk];
  [v3 currentConfigurations];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    [v3 currentConfigurations];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v48 = a2;
      id v9 = 0LL;
      int v10 = 0;
      int v11 = 0;
      uint64_t v12 = *(void *)v51;
      __int16 v49 = v3;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v6);
          }
          id v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          [v14 alwaysOnVPN];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            id v16 = v14;

            [v16 payloadInfo];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
            int v18 = [v17 isSetAside];

            ne_log_obj();
            __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              __int128 v20 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v55 = v20;
              __int16 v56 = 2112;
              v57[0] = v16;
              id v21 = v20;
              _os_log_debug_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEBUG,  "%@ enableAlwaysOnVpnInternal: Always-On VPN configs found %@",  buf,  0x16u);

              id v3 = v49;
            }

            ++v11;
            v10 += v18;

            id v9 = v16;
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }

      while (v8);

      if (v11 >= 2)
      {
        if (v48)
        {
          ne_log_obj();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          __int16 v23 = v22;
          if (v11 == 2 && v10 == 1)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
LABEL_28:

              goto LABEL_30;
            }

            id v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v55 = v24;
            __int16 v56 = 1024;
            LODWORD(v57[0]) = 2;
            WORD2(v57[0]) = 1024;
            *(_DWORD *)((char *)v57 + 6) = 1;
            id v25 = v24;
            uint64_t v26 = "%@ enableAlwaysOnVpnInternal: Sanity check OK, %d Always-On VPN configs found (%d set aside).";
            uint64_t v27 = (os_log_s *)v23;
            uint32_t v28 = 24;
LABEL_42:
            _os_log_debug_impl(&dword_1876B1000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);

            goto LABEL_28;
          }

          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
LABEL_38:

            uint64_t v35 = 0LL;
            goto LABEL_31;
          }

          __int16 v47 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v55 = v47;
          __int16 v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          id v38 = v47;
          uint64_t v39 = "%@ enableAlwaysOnVpnInternal: Sanity check failed. %d Always-On VPN configs found (%d set aside). Enabli"
                "ng will be disallowed.";
        }

        else
        {
          ne_log_obj();
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          __int128 v37 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v55 = v37;
          __int16 v56 = 1024;
          LODWORD(v57[0]) = v11;
          WORD2(v57[0]) = 1024;
          *(_DWORD *)((char *)v57 + 6) = v10;
          id v38 = v37;
          uint64_t v39 = "%@ enableAlwaysOnVpnInternal: %d Always-On VPN configs found (%d set aside), skip enabling new AOVpn configs.";
        }

        _os_log_error_impl(&dword_1876B1000, (os_log_t)v23, OS_LOG_TYPE_ERROR, v39, buf, 0x18u);

        goto LABEL_38;
      }

      if (v9)
      {
        [v9 alwaysOnVPN];
        id v32 = (void *)objc_claimAutoreleasedReturnValue();
        char v33 = [v32 isEnabled];

        ne_log_obj();
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v34 = os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG);
        if ((v33 & 1) == 0)
        {
          if (v34)
          {
            id v44 = (void *)objc_opt_class();
            __int16 v45 = "";
            if (v48) {
              __int16 v45 = " anyway";
            }
            *(_DWORD *)buf = 138412546;
            id v55 = v44;
            __int16 v56 = 2080;
            v57[0] = v45;
            id v46 = v44;
            _os_log_debug_impl( &dword_1876B1000,  (os_log_t)v23,  OS_LOG_TYPE_DEBUG,  "%@ enableAlwaysOnVpnInternal: enable the only Always-On VPN config%s.",  buf,  0x16u);
          }

          [v9 alwaysOnVPN];
          unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v35 = 1LL;
          [v40 setEnabled:1];

          -[NEProfileIngestion saveConfiguration:returnError:](v3, v9, 0LL);
          goto LABEL_31;
        }

        if (!v34) {
          goto LABEL_28;
        }
        uint64_t v43 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v55 = v43;
        id v25 = v43;
        uint64_t v26 = "%@ enableAlwaysOnVpnInternal: the only Always-On VPN config is already enabled.";
        uint64_t v27 = (os_log_s *)v23;
        uint32_t v28 = 12;
        goto LABEL_42;
      }
    }

    else
    {
    }

    ne_log_obj();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_30;
    }
    char v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v55 = v42;
    id v30 = v42;
    id v31 = "%@ enableAlwaysOnVpnInternal: no Always-On VPN configs to enable";
LABEL_40:
    _os_log_debug_impl(&dword_1876B1000, (os_log_t)v9, OS_LOG_TYPE_DEBUG, v31, buf, 0xCu);

    goto LABEL_30;
  }

  ne_log_obj();
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
  {
    id v29 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v55 = v29;
    id v30 = v29;
    id v31 = "%@ enableAlwaysOnVpnInternal: empty configuration database";
    goto LABEL_40;
  }

void __42__NEProfileIngestion_removeConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) name];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      convert_error_to_string(v3);
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      int v10 = v6;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Error occurred when removing configurations '%@': %@",  (uint8_t *)&v7,  0x16u);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t __65__NEProfileIngestion_createConfigurationFromPayload_payloadType___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) setPluginUpgradeInfo:a2];
}

uint64_t __65__NEProfileIngestion_removeAllConfigurationsWithPayload_profile___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 payloadInfo];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      [v3 payloadInfo];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 payloadUUID];
      int v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 isEqualToString:*(void *)(a1 + 32)])
      {
        [v3 payloadInfo];
        int v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 profileUUID];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v8 isEqualToString:*(void *)(a1 + 40)];
      }

      else
      {
        uint64_t v9 = 0LL;
      }
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

void __58__NEProfileIngestion_loadConfigurationsWithRefreshOption___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    ne_log_obj();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      convert_error_to_string(v6);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      id v16 = v14;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "loadConfigurationsWithRefreshOption Failed to load the current configurations: %@",  (uint8_t *)&v15,  0xCu);
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }

  uint64_t v8 = (void *)[v5 mutableCopy];
  [*(id *)(a1 + 32) setCurrentConfigurations:v8];

  [*(id *)(a1 + 32) ingestedConfiguration];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [*(id *)(a1 + 32) ingestedConfiguration];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 identifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) findConfigurationByConfigurationID:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      [*(id *)(a1 + 32) setIngestedConfiguration:v13];
    }
  }
}

+ (id)getServiceIDForPayload:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"PayloadType"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = (uint64_t)v3;
    _os_log_debug_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEBUG,  "getServiceIDForPayload start with payload stub %@",  buf,  0xCu);
  }

  if (([v4 isEqualToString:@"com.apple.vpn.managed"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.vpn.managed.applayer"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.vpn.managed.alwayson"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.webcontent-filter"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.networkusagerules"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.dnsSettings.managed"] & 1) == 0
    && ([v4 isEqualToString:@"com.apple.relay.managed"] & 1) == 0)
  {
    ne_log_obj();
    log = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_1876B1000,  log,  OS_LOG_TYPE_DEBUG,  "getServiceIDForPayload: ignore non-NetworkExtension payload",  buf,  2u);
    }

    goto LABEL_40;
  }

  [v3 objectForKeyedSubscript:@"PayloadUUID"];
  log = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!log)
  {
    ne_log_obj();
    log = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  log,  OS_LOG_TYPE_ERROR,  "getServiceIDForPayload payload stub has no payload UUID",  buf,  2u);
    }

    goto LABEL_40;
  }

  id v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"NEProfileIngestion Migrator", 0LL);
  if (!v6)
  {
    ne_log_obj();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "getServiceIDForPayload failed to create SCPreference",  buf,  2u);
    }

LABEL_40:
    uint64_t v22 = 0LL;
    goto LABEL_49;
  }

  int v7 = v6;
  CFArrayRef v8 = SCNetworkServiceCopyAll(v6);
  if (!v8)
  {
    uint64_t v22 = 0LL;
    goto LABEL_46;
  }

  CFArrayRef v9 = v8;
  ne_log_obj();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = -[__CFArray count](v9, "count");
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v27;
    _os_log_debug_impl(&dword_1876B1000, v10, OS_LOG_TYPE_DEBUG, "getServiceIDForPayload found %lu services", buf, 0xCu);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  uint64_t v11 = v9;
  uint64_t v12 = -[__CFArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
  if (!v12)
  {
    uint64_t v22 = 0LL;
    goto LABEL_45;
  }

  uint64_t v13 = v12;
  uint32_t v28 = v4;
  id v29 = v3;
  uint64_t v14 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0LL; i != v13; ++i)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(const __SCNetworkService **)(*((void *)&v31 + 1) + 8 * i);
      if (!v16
        || (uint64_t v17 = SCNetworkServiceCopyProtocol( *(SCNetworkServiceRef *)(*((void *)&v31 + 1) + 8 * i),  @"com.apple.payload")) == 0LL)
      {
        __int128 v20 = 0LL;
        id v21 = 0LL;
        goto LABEL_32;
      }

      int v18 = v17;
      SCNetworkProtocolGetConfiguration(v17);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v20 = v19;
      if (!v19)
      {
        id v21 = 0LL;
LABEL_31:
        CFRelease(v18);
        goto LABEL_32;
      }

      [v19 objectForKeyedSubscript:@"PayloadUUID"];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = (void *)[objc_alloc(NSString) initWithString:SCNetworkServiceGetServiceID(v16)];
      ne_log_obj();
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = (uint64_t)v22;
        _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEFAULT,  "getServiceIDForPayload found matching service '%@'",  buf,  0xCu);
      }

      CFRelease(v18);
      if (v22)
      {

        goto LABEL_43;
      }

@end
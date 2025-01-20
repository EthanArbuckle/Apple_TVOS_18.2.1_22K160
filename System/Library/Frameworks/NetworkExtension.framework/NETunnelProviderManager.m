@interface NETunnelProviderManager
+ (NETunnelProviderManager)forPerAppVPN;
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NETunnelProviderManager)init;
- (NETunnelProviderManager)initWithSessionType:(int)a3 tunnelType:(int64_t)a4;
- (NETunnelProviderRoutingMethod)routingMethod;
- (NSArray)appRules;
- (NSArray)associatedDomains;
- (NSArray)calendarDomains;
- (NSArray)contactsDomains;
- (NSArray)copyAppRules;
- (NSArray)excludedDomains;
- (NSArray)mailDomains;
- (NSArray)safariDomains;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)additionalSetup;
- (void)loadAppRules;
- (void)loadFromPreferencesWithCompletionHandler:(id)a3;
- (void)setAppRules:(NSArray *)appRules;
- (void)setAssociatedDomains:(NSArray *)associatedDomains;
- (void)setCalendarDomains:(NSArray *)calendarDomains;
- (void)setContactsDomains:(NSArray *)contactsDomains;
- (void)setExcludedDomains:(NSArray *)excludedDomains;
- (void)setMailDomains:(NSArray *)mailDomains;
- (void)setSafariDomains:(NSArray *)safariDomains;
@end

@implementation NETunnelProviderManager

- (NETunnelProviderManager)initWithSessionType:(int)a3 tunnelType:(int64_t)a4
{
  v6 = -[NEVPNConnection initWithType:](objc_alloc(&OBJC_CLASS___NETunnelProviderSession), a3);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NETunnelProviderManager;
  v7 = -[NEVPNManager initWithGrade:connection:tunnelType:](&v21, sel_initWithGrade_connection_tunnelType_, 1LL, v6, a4);

  if (v7)
  {
    *(_WORD *)&v7->super._hasLoaded = 1;
    v8 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    mailDomains = v7->_mailDomains;
    v7->_mailDomains = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    calendarDomains = v7->_calendarDomains;
    v7->_calendarDomains = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    contactsDomains = v7->_contactsDomains;
    v7->_contactsDomains = v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    safariDomains = v7->_safariDomains;
    v7->_safariDomains = v14;

    v16 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    excludedDomains = v7->_excludedDomains;
    v7->_excludedDomains = v16;

    v18 = (NSArray *)objc_alloc_init(MEMORY[0x189603F18]);
    associatedDomains = v7->_associatedDomains;
    v7->_associatedDomains = v18;
  }

  return v7;
}

- (NETunnelProviderManager)init
{
  return -[NETunnelProviderManager initWithSessionType:tunnelType:](self, "initWithSessionType:tunnelType:", 1LL, 1LL);
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)additionalSetup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 appVPN];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NEVPNManager configuration](self, "configuration");
  v6 = v5;
  if (v4)
  {
    [v5 appVPN];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 protocol];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[NEVPNManager configuration](self, "configuration");
    [v8 appVPN];
  }

  else
  {
    [v5 VPN];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 protocol];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[NEVPNManager configuration](self, "configuration");
    [v8 VPN];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 tunnelType];

  if ((unint64_t)(v11 - 1) <= 1)
  {
    [v16 providerBundleIdentifier];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    [v16 setProviderBundleIdentifier:v12];
    v13 = -[NEVPNManager configuration](self, "configuration");
    if (v13) {
      v13[20] = 0LL;
    }
  }

  [MEMORY[0x1896077F8] mainBundle];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 bundleIdentifier];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setPluginType:v15];
}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NEVPNManager configurationManager]();
    v6 = -[NEVPNManager configuration](self, "configuration");
    [v6 identifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_18A090918;
    v8[4] = self;
    id v9 = v4;
    [v5 loadConfigurationWithID:v7 withCompletionQueue:MEMORY[0x1895F8AE0] handler:v8];
  }
}

- (NSArray)copyAppRules
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEVPNManager configuration](v2, "configuration");
  [v3 appVPN];
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[NEVPNManager configuration](v2, "configuration");
    [v5 appVPN];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 appRules];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      id v4 = 0LL;
      goto LABEL_6;
    }

    id v8 = objc_alloc(MEMORY[0x189603F18]);
    v3 = -[NEVPNManager configuration](v2, "configuration");
    [v3 appVPN];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 appRules];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = (NSArray *)[v8 initWithArray:v10 copyItems:1];
  }

LABEL_6:
  objc_sync_exit(v2);

  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x189607940]);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NETunnelProviderManager;
  -[NEVPNManager descriptionWithIndent:options:](&v14, sel_descriptionWithIndent_options_, v5, a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v7 initWithString:v8];
  v10 = -[NEVPNManager configuration](self, "configuration");
  [v10 appVPN];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 appRules];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 appendPrettyObject:v12 withName:@"appRules" andIndent:v5 options:a4];

  return v9;
}

- (NETunnelProviderRoutingMethod)routingMethod
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NEVPNManager configuration](v2, "configuration");
  [v3 appVPN];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    NETunnelProviderRoutingMethod v5 = NETunnelProviderRoutingMethodSourceApplication;
  }
  else {
    NETunnelProviderRoutingMethod v5 = NETunnelProviderRoutingMethodDestinationIP;
  }

  objc_sync_exit(v2);
  return v5;
}

- (NSArray)safariDomains
{
  return (NSArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSafariDomains:(NSArray *)safariDomains
{
}

- (NSArray)mailDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMailDomains:(NSArray *)mailDomains
{
}

- (NSArray)calendarDomains
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCalendarDomains:(NSArray *)calendarDomains
{
}

- (NSArray)contactsDomains
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setContactsDomains:(NSArray *)contactsDomains
{
}

- (NSArray)appRules
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setAppRules:(NSArray *)appRules
{
}

- (NSArray)excludedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
}

- (NSArray)associatedDomains
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAssociatedDomains:(NSArray *)associatedDomains
{
}

- (void).cxx_destruct
{
}

void __68__NETunnelProviderManager_loadFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412290;
      id v29 = v6;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to load the configuration: %@",  (uint8_t *)&v28,  0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    goto LABEL_16;
  }

  v10 = *(void **)(a1 + 32);
  if (!v5)
  {
    [v10 configuration];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 appVPN];
    objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) configuration];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21) {
      [v22 appVPN];
    }
    else {
      [v22 VPN];
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setEnabled:0];
    v24 = +[NEVPNManager loadedManagers]();
    [*(id *)(a1 + 32) configuration];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 identifier];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 removeObjectForKey:v26];

    [*(id *)(a1 + 32) connection];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNConnection destroySession](v27);

    goto LABEL_15;
  }

  [v10 setConfiguration:v5];
  -[NETunnelProviderManager loadAppRules](*(void **)(a1 + 32));
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = +[NEVPNManager loadedManagers]();
  [*(id *)(a1 + 32) configuration];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 identifier];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setObject:v11 forKeyedSubscript:v14];

  [*(id *)(a1 + 32) connection];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    uint64_t v16 = v15[7];

    if (v16)
    {
LABEL_15:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      id v9 = 0LL;
      goto LABEL_16;
    }
  }

  [*(id *)(a1 + 32) connection];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) configuration];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 identifier];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17) {
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v17,  v19,  0LL,  *(void **)(a1 + 40));
  }

  id v9 = 0LL;
LABEL_16:
  objc_sync_exit(v7);
}

- (void)loadAppRules
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [a1 configuration];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 appVPN];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appRules];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setMailDomains:v6];

      id v7 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setCalendarDomains:v7];

      id v8 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setContactsDomains:v8];

      id v9 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setSafariDomains:v9];

      id v10 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setExcludedDomains:v10];

      id v11 = objc_alloc_init(MEMORY[0x189603F18]);
      [a1 setAssociatedDomains:v11];

      id v58 = objc_alloc_init(MEMORY[0x189603FA8]);
      v59 = a1;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      [a1 configuration];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 appVPN];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 appRules];
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();

      id obj = v14;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v62;
        do
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v62 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v61 + 1) + 8 * v18);
            [v19 matchSigningIdentifier];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v20 isEqualToString:@"com.apple.mobilemail"]) {
              goto LABEL_13;
            }
            [v19 matchSigningIdentifier];
            objc_super v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v21 isEqualToString:@"com.apple.email.maild"]) {
              goto LABEL_12;
            }
            [v19 matchSigningIdentifier];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v22 isEqualToString:@"com.apple.datausage.dataaccess.activesync"])
            {

LABEL_12:
LABEL_13:

LABEL_14:
              [v19 matchSigningIdentifier];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v23 isEqualToString:@"com.apple.mobilemail"])
              {
                [v19 matchDomains];
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v25 = [v24 count];

                if (!v25) {
                  goto LABEL_40;
                }
                [v19 matchDomains];
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                [v59 setMailDomains:v26];
                goto LABEL_17;
              }

+ (NETunnelProviderManager)forPerAppVPN
{
  return  -[NETunnelProviderManager initWithSessionType:tunnelType:]( objc_alloc(&OBJC_CLASS___NETunnelProviderManager),  "initWithSessionType:tunnelType:",  2LL,  1LL);
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_18A0904D0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1895F8AE0] handler:v7];
  }
}

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v32 = a2;
  id v5 = a3;
  uint64_t v30 = a1;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  id v33 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = __Block_byref_object_copy__20871;
  v50 = __Block_byref_object_dispose__20872;
  id v6 = v5;
  id v51 = v6;
  id v29 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)&OBJC_CLASS___NEVPNManager, v6);
    id v8 = (void *)v47[5];
    v47[5] = v7;

    uint64_t v9 = v47[5];
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  if (!v32 || v9 || !objc_msgSend(v32, "count", v29))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    goto LABEL_35;
  }

  group = dispatch_group_create();
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v10 = v32;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (!v11) {
    goto LABEL_33;
  }
  uint64_t v12 = *(void *)v43;
  do
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v10);
      }
      objc_super v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      [v14 VPN];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        [v14 VPN];
      }
      else {
        [v14 appVPN];
      }
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        [v16 protocol];
        uint64_t v17 = (NETunnelProviderManager *)objc_claimAutoreleasedReturnValue();
        if (-[NETunnelProviderManager type](v17, "type") == 4)
        {
          BOOL v18 = [v16 tunnelType] == 1;

          if (!v18) {
            goto LABEL_31;
          }
          [v14 pluginType];
          v19 = (NETunnelProviderManager *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            if (+[NETunnelProviderProtocol isLegacyPluginType:]( &OBJC_CLASS___NETunnelProviderProtocol,  "isLegacyPluginType:",  v19))
            {
              uint64_t v17 = v19;
            }

            else
            {
              [v14 VPN];
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v21 = v20 == 0LL;

              if (v21)
              {
                v22 = objc_alloc(&OBJC_CLASS___NETunnelProviderManager);
                uint64_t v23 = [v16 tunnelType];
                uint64_t v24 = 2LL;
              }

              else
              {
                v22 = objc_alloc(&OBJC_CLASS___NETunnelProviderManager);
                uint64_t v23 = [v16 tunnelType];
                uint64_t v24 = 1LL;
              }

              uint64_t v17 = -[NETunnelProviderManager initWithSessionType:tunnelType:]( v22,  "initWithSessionType:tunnelType:",  v24,  v23);
              -[NEVPNManager setConfiguration:](v17, "setConfiguration:", v14);
              -[NETunnelProviderManager loadAppRules](v17);
              [v33 addObject:v17];
              +[NEVPNManager loadedManagers]();
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v14 identifier];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 setObject:v17 forKeyedSubscript:v26];

              if (v17) {
                v17->super._hasLoaded = 1;
              }
              dispatch_group_enter(group);
              v27 = -[NEVPNManager connection](v17, "connection");
              [v14 identifier];
              char v28 = (void *)objc_claimAutoreleasedReturnValue();
              v39[0] = MEMORY[0x1895F87A8];
              v39[1] = 3221225472LL;
              v39[2] = __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_33;
              v39[3] = &unk_18A090480;
              v39[4] = v14;
              v41 = &v46;
              v40 = group;
              if (v27) {
                -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]( v27,  v28,  0LL,  v39);
              }
            }
          }

          else
          {
            uint64_t v17 = 0LL;
          }
        }
      }

void __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_33( uint64_t a1,  void *a2)
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

uint64_t __71__NETunnelProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_35( uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

@end
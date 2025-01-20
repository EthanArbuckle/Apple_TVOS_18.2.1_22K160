@interface NEConfigurationManager
+ (id)networkPrivacyConfigurationName;
+ (id)sharedManager;
+ (id)sharedManagerForAllUsers;
+ (void)disableConfiguration:(uint64_t)a1 onDemandOnly:(void *)a2;
+ (void)updateFlags:(void *)a3 withConfiguration:;
- (BOOL)appGroupsChanged;
- (BOOL)hasVPNAPIEntitlement;
- (NEConfigurationManager)init;
- (NEConfigurationManager)initWithPluginType:(id)a3;
- (NSString)pluginType;
- (NSUUID)userUUID;
- (_BYTE)removeConfigurationFromDisk:(const __SCPreferences *)a3 updateSCPreferences:;
- (char)initWithUserUUID:(char *)a1;
- (id)copyAppGroupMapDidChange:(BOOL *)a3;
- (id)copyCurrentIndexWithConfigurationIDsExpunged:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)errorWithCode:(void *)a3 specifics:;
- (id)filterIndexWithFilter:(void *)a1;
- (id)getCurrentUserUUIDForConfigurationID:(id)a3 fromIndex:(id)a4;
- (id)incomingMessageHandler;
- (id)initForAllUsers;
- (id)initSynchronous;
- (id)makeMutableCopyOfIndex:(id)a1;
- (id)saveConfigurationToDisk:(const __SCPreferences *)a3 updateSCPreferences:(void *)a4 currentSignature:(void *)a5 userUUID:(int)a6 notifyNow:(char)a7 isUpgrade:;
- (int64_t)configurationChangeSource;
- (uint64_t)configurationHasChanged:(void *)a1;
- (void)addGroups:(id)a3 forApp:(id)a4;
- (void)clearLoadedConfigurationsWithIDs:(void *)a1;
- (void)copyChangedConfigurationIDs:(void *)a1;
- (void)copyIdentities:(id)a3 fromDomain:(int64_t)a4 withCompletionQueue:(id)a5 handler:(id)a6;
- (void)dealloc;
- (void)didLoadConfiguration:(void *)a1;
- (void)executeCallbackOnQueue:(void *)a3 callback:;
- (void)fetchClientListenerWithBundleID:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)fetchUpgradeInfoForPluginType:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)getCurrentIndexWithCompletionHandler:(_BYTE *)a1;
- (void)handleApplicationsRemoved:(id)a3 completionQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)handleFileRemovedWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)loadConfigurationAndUserWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)loadConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)loadConfigurations:(id)a3 withFilter:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)loadConfigurationsInternal:(void *)a3 withCompletionHandler:;
- (void)loadConfigurationsWithCompletionQueue:(id)a3 handler:(id)a4;
- (void)loadIndexWithFilter:(id)a3 completionQueue:(id)a4 handler:(id)a5;
- (void)notifyChanges;
- (void)postChangeNotificationWithGeneration:(uint64_t)a3 andFlags:(int)a4 onlyIfChanged:;
- (void)postGeneration;
- (void)registerForChangeNotifications;
- (void)removeConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)removeConfigurationFromDisk:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)removeGroupsForApp:(uint64_t)a1;
- (void)repopulateNetworkPrivacyConfigurationResetAll:(BOOL)a3;
- (void)saveConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)saveConfigurationToDisk:(id)a3 currentSignature:(id)a4 userUUID:(id)a5 isUpgrade:(BOOL)a6 completionQueue:(id)a7 completionHandler:(id)a8;
- (void)sendRequest:(void *)a3 responseHandler:;
- (void)setAppGroupMap:(uint64_t)a1;
- (void)setAppGroupsChanged:(BOOL)a3;
- (void)setChangedQueue:(id)a3 andHandler:(id)a4;
- (void)setConfigurationChangeSource:(int64_t)a3;
- (void)setHasVPNAPIEntitlement:(BOOL)a3;
- (void)setIncomingMessageHandler:(id)a3;
- (void)showLocalNetworkAlertForApp:(id)a3 pid:(int)a4 uuid:(id)a5 query:(id)a6 hasEntitlement:(BOOL)a7 completionQueue:(id)a8 handler:(id)a9;
- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 query:(id)a5 hasEntitlement:(BOOL)a6 handler:(id)a7;
- (void)syncConfigurationsWithSC:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)triggerLocalAuthenticationForConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5;
@end

@implementation NEConfigurationManager

- (NEConfigurationManager)init
{
  uid_t v3 = geteuid();
  NECopyUserUUIDSimple(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[NEConfigurationManager initWithUserUUID:]((char *)self, v4);
    v5 = self;
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (NEConfigurationManager)initWithPluginType:(id)a3
{
  id v5 = a3;
  v6 = -[NEConfigurationManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pluginType, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)initForAllUsers
{
  return -[NEConfigurationManager initWithUserUUID:]((char *)self, 0LL);
}

- (id)initSynchronous
{
  v2 = -[NEConfigurationManager init](self, "init");
  v4 = v2;
  if (v2)
  {
    v2->_isSynchronous = 1;
    objc_msgSend(objc_getProperty(v2, v3, 112, 1), "setIsSynchronous:", 1);
    v4->_lock._os_unfair_lock_opaque = 0;
  }

  return v4;
}

- (void)dealloc
{
  v2 = self;
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___NEConfigurationManager;
  -[NEConfigurationManager dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (void)setIncomingMessageHandler:(id)a3
{
  id v6 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 112LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property setIncomingMessageHandler:v6];
}

- (id)incomingMessageHandler
{
  if (self) {
    self = (NEConfigurationManager *)objc_getProperty(self, a2, 112LL, 1);
  }
  return -[NEConfigurationManager incomingMessageHandler](self, "incomingMessageHandler");
}

- (void)postGeneration
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __40__NEConfigurationManager_postGeneration__block_invoke;
  v2[3] = &unk_18A0907E8;
  v2[4] = self;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0LL, v2);
}

- (id)copyCurrentIndexWithConfigurationIDsExpunged:(id)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 56LL, 1);
    v7 = self;
  }

  else
  {
    v7 = 0LL;
    id Property = 0LL;
  }
  v8 = -[NEConfigurationManager makeMutableCopyOfIndex:](v7, Property);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v46 + 1) + 8 * v12);
        [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 removeObjectForKey:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v10);
  }

  [v8 objectForKeyedSubscript:@"UserMap"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 allKeys];
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v33 = v16;
  uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v43;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = v17;
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * v17);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v19 = obj;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v39;
          do
          {
            uint64_t v23 = 0LL;
            do
            {
              if (*(void *)v39 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v38 + 1) + 8 * v23);
              [v8 objectForKeyedSubscript:@"UserMap"];
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 objectForKeyedSubscript:v18];
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              [v26 removeObject:v24];

              ++v23;
            }

            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }

          while (v21);
        }

        [v8 objectForKeyedSubscript:@"UserMap"];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 objectForKeyedSubscript:v18];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v28 count];

        if (!v29)
        {
          [v8 objectForKeyedSubscript:@"UserMap"];
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 removeObjectForKey:v18];
        }

        uint64_t v17 = v37 + 1;
      }

      while (v37 + 1 != v35);
      uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }

    while (v35);
  }

  v31 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v8];
  return v31;
}

- (void)saveConfigurationToDisk:(id)a3 currentSignature:(id)a4 userUUID:(id)a5 isUpgrade:(BOOL)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (self) {
    outerQueue = (dispatch_queue_s *)self->_outerQueue;
  }
  else {
    outerQueue = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_18A08B9B8;
  block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  BOOL v31 = a6;
  id v29 = v17;
  id v30 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(outerQueue, block);
}

- (void)removeConfigurationFromDisk:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    outerQueue = (dispatch_queue_s *)self->_outerQueue;
  }
  else {
    outerQueue = 0LL;
  }
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_18A08F2B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(outerQueue, v15);
}

- (void)syncConfigurationsWithSC:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)a4;
  id v10 = a5;
  if (v8 && MEMORY[0x1895ADD58](v8) == MEMORY[0x1895F9220] && xpc_array_get_count(v8))
  {
    if (self) {
      outerQueue = (dispatch_queue_s *)self->_outerQueue;
    }
    else {
      outerQueue = 0LL;
    }
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2;
    v15[3] = &unk_18A08F2B8;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    id v14 = v10;
    dispatch_async(outerQueue, v15);

    id v12 = v16;
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_18A090940;
    id v20 = v10;
    id v11 = v10;
    dispatch_async(v9, block);
    id v12 = v20;
  }
}

- (void)loadIndexWithFilter:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke;
  v14[3] = &unk_18A08BA08;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);
}

- (void)loadConfigurations:(id)a3 withFilter:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke;
  v18[3] = &unk_18A08FE20;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v16, v18);
}

- (void)loadConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    id v24 = v8;
    [MEMORY[0x189603F18] arrayWithObjects:&v24 count:1];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_18A08BA08;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    id v14 = v21;
  }

  else
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7LL, 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_18A0908C8;
    id v18 = v15;
    id v19 = v10;
    id v16 = v10;
    id v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    id v14 = v19;
  }
}

- (void)loadConfigurationAndUserWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_INFO, "Loading configuration with identifier %@", buf, 0xCu);
    }

    id v24 = v8;
    [MEMORY[0x189603F18] arrayWithObjects:&v24 count:1];
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke;
    v20[3] = &unk_18A08BA08;
    v20[4] = self;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    id v13 = v10;
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, v12, v20);

    id v14 = v21;
  }

  else
  {
    -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 7LL, 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2;
    v17[3] = &unk_18A0908C8;
    id v18 = v15;
    id v19 = v10;
    id v16 = v10;
    id v12 = v15;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v9, v17);

    id v14 = v19;
  }
}

- (void)loadConfigurationsWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "Loading all configurations", buf, 2u);
  }

  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke;
  v11[3] = &unk_18A08F1A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](self, 0LL, v11);
}

- (void)saveConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v104 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:0];
  if (([v9 checkValidityAndCollectErrors:v12] & 1) == 0)
  {
    [v12 componentsJoinedByString:@"\n"];
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)self, 2LL, v49);
    ne_log_obj();
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      [v9 name];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v99 = self;
      __int16 v100 = 2112;
      id v101 = v60;
      __int16 v102 = 2112;
      v103 = v50;
      _os_log_error_impl( &dword_1876B1000,  v51,  OS_LOG_TYPE_ERROR,  "%@ Failed to save configuration %@ because it is invalid: %@",  buf,  0x20u);
    }

    v94[0] = MEMORY[0x1895F87A8];
    v94[1] = 3221225472LL;
    v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke;
    v94[3] = &unk_18A0908C8;
    id v95 = v50;
    id v96 = v11;
    id v52 = v50;
    -[NEConfigurationManager executeCallbackOnQueue:callback:]((uint64_t)self, v10, v94);

    goto LABEL_52;
  }

  [v9 externalIdentifier];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
  }

  else
  {
    [v9 contentFilter];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v58)
    {
      [v9 dnsProxy];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5) {
        goto LABEL_44;
      }
    }

    [v9 payloadInfo];
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {

      if (!v59) {
        goto LABEL_44;
      }
    }

    else
    {

      if (!v59) {
        goto LABEL_44;
      }
    }
  }

  if (self) {
    id Property = objc_getProperty(self, v14, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [Property allKeys];
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v76 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (!v76)
  {
LABEL_43:

LABEL_44:
    v77[0] = MEMORY[0x1895F87A8];
    v77[1] = 3221225472LL;
    v77[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_165;
    v77[3] = &unk_18A08BA08;
    v77[4] = self;
    id v78 = v9;
    id v79 = v10;
    id v80 = v11;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v77);

    goto LABEL_52;
  }

  v71 = v12;
  v72 = v11;
  v73 = v10;
  id v18 = 0LL;
  uint64_t v75 = *(void *)v91;
  id v74 = v9;
LABEL_8:
  uint64_t v19 = 0LL;
  while (1)
  {
    id v20 = v18;
    if (*(void *)v91 != v75) {
      objc_enumerationMutation(v16);
    }
    uint64_t v21 = *(void *)(*((void *)&v90 + 1) + 8 * v19);
    if (self) {
      id v22 = objc_getProperty(self, v17, 88LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    [v22 objectForKeyedSubscript:v21];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18) {
      goto LABEL_27;
    }
    id v23 = v16;
    id v24 = self;
    [v9 contentFilter];
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      [v18 contentFilter];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }

    [v9 dnsProxy];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27) {
      break;
    }
LABEL_22:
    [v18 payloadInfo];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v30 isSetAside] & 1) == 0)
    {
      [v18 identifier];
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 identifier];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v31 isEqual:v32])
      {
        [v18 externalIdentifier];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 externalIdentifier];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        int v35 = [v33 isEqual:v34];

        id v9 = v74;
        self = v24;
        id v16 = v23;
        if (v35)
        {
          ne_log_obj();
          uint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v65 = (NEConfigurationManager *)objc_opt_class();
            v66 = v65;
            [v18 externalIdentifier];
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 name];
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v99 = v65;
            __int16 v100 = 2112;
            id v101 = v67;
            __int16 v102 = 2112;
            v103 = v68;
            _os_log_error_impl( &dword_1876B1000,  v53,  OS_LOG_TYPE_ERROR,  "%@ saveConfiguration: failed to save - perApp UUID %@ already assigned to another configuration - %@",  buf,  0x20u);

            id v9 = v74;
          }
          v54 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 2LL, @"Duplicate perApp UUID");
          v81[0] = MEMORY[0x1895F87A8];
          v81[1] = 3221225472LL;
          v81[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_164;
          v81[3] = &unk_18A0908C8;
          id v11 = v72;
          id v82 = v54;
          id v83 = v72;
          id v55 = v54;
          uint64_t v56 = (uint64_t)v24;
          id v10 = v73;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v56, v73, v81);

          id v57 = v83;
          goto LABEL_51;
        }

        goto LABEL_27;
      }
    }

    self = v24;
    id v16 = v23;
LABEL_27:
    if (v76 == ++v19)
    {
      uint64_t v48 = [v16 countByEnumeratingWithState:&v90 objects:v97 count:16];
      uint64_t v76 = v48;
      if (!v48)
      {

        id v11 = v72;
        id v10 = v73;
        id v12 = v71;
        goto LABEL_43;
      }

      goto LABEL_8;
    }
  }

  [v18 dnsProxy];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  id v28 = v26;

  if (!v28) {
    goto LABEL_22;
  }
  [v18 externalIdentifier];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 || ([v9 externalIdentifier], (id v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_22;
  }

  [v18 identifier];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identifier];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v36 isEqual:v37])
  {

    goto LABEL_22;
  }

  [v18 payloadInfo];
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38) {
    goto LABEL_22;
  }
  [v9 contentFilter];
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39) {
    __int128 v40 = "Content Filter";
  }
  else {
    __int128 v40 = "DNS proxy";
  }

  [v18 payloadInfo];
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 profileIdentifier];
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 payloadInfo];
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 profileIdentifier];
  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
  char v45 = [v42 isEqualToString:v44];

  if ((v45 & 1) != 0)
  {
    if (v24) {
      id v47 = objc_getProperty(v24, v46, 40LL, 1);
    }
    else {
      id v47 = 0LL;
    }
    id v9 = v74;
    v84[0] = MEMORY[0x1895F87A8];
    v84[1] = 3221225472LL;
    v84[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2;
    v84[3] = &unk_18A08BA58;
    v84[4] = v24;
    v86 = v40;
    id v85 = v18;
    -[NEConfigurationManager removeConfiguration:withCompletionQueue:handler:]( v24,  "removeConfiguration:withCompletionQueue:handler:",  v85,  v47,  v84);

    goto LABEL_22;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"multiple system-wide %s configurations are not allowed",  v40);
  id v55 = (id)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v16 = v23;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    v69 = (NEConfigurationManager *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v99 = v69;
    __int16 v100 = 2112;
    id v101 = v55;
    v70 = v69;
    _os_log_error_impl(&dword_1876B1000, v61, OS_LOG_TYPE_ERROR, "%@ saveConfiguration: %@", buf, 0x16u);
  }
  v62 = -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v24, 10LL, v55);
  v87[0] = MEMORY[0x1895F87A8];
  v87[1] = 3221225472LL;
  v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_161;
  v87[3] = &unk_18A0908C8;
  id v11 = v72;
  id v63 = v72;
  id v88 = v62;
  id v89 = v63;
  id v57 = v62;
  uint64_t v64 = (uint64_t)v24;
  id v10 = v73;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v64, v73, v87);

  id v9 = v74;
LABEL_51:
  id v12 = v71;

LABEL_52:
}

- (void)removeConfiguration:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_18A08BA08;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](self, v14);
}

- (void)setChangedQueue:(id)a3 andHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v7, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke;
  block[3] = &unk_18A08FB50;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_sync(Property, block);
}

- (void)handleFileRemovedWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v7, 40LL, 1);
  }
  else {
    id Property = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_18A08FB50;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

- (void)handleApplicationsRemoved:(id)a3 completionQueue:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (self) {
    outerQueue = (dispatch_queue_s *)self->_outerQueue;
  }
  else {
    outerQueue = 0LL;
  }
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke;
  v16[3] = &unk_18A08F2B8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(outerQueue, v16);
}

- (void)copyIdentities:(id)a3 fromDomain:(int64_t)a4 withCompletionQueue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = (dispatch_queue_s *)a5;
  id v12 = a6;
  id v13 = v12;
  if (a4)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2;
    block[3] = &unk_18A0908C8;
    id v18 = v12;
    id v17 = v10;
    dispatch_async(v11, block);

    xpc_object_t v14 = v18;
  }

  else
  {
    xpc_object_t v14 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v14, "config-operation", 5LL);
    if (v10)
    {
      id v15 = v10;
      xpc_dictionary_set_data( v14,  "identity-reference",  (const void *)[v15 bytes],  objc_msgSend(v15, "length"));
    }

    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke;
    v19[3] = &unk_18A08BAA8;
    v19[4] = self;
    id v20 = v11;
    id v21 = v13;
    -[NEConfigurationManager sendRequest:responseHandler:](self, v14, v19);
  }
}

- (void)triggerLocalAuthenticationForConfigurationWithID:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v11, "config-operation", 7LL);
  uuid_clear(uu);
  [v10 getUUIDBytes:uu];

  xpc_dictionary_set_uuid(v11, "config-identifier", uu);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke;
  v14[3] = &unk_18A08C790;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v14);
}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 handler:(id)a5
{
}

- (void)showLocalNetworkAlertForApp:(id)a3 withCompletionQueue:(id)a4 query:(id)a5 hasEntitlement:(BOOL)a6 handler:(id)a7
{
}

- (void)showLocalNetworkAlertForApp:(id)a3 pid:(int)a4 uuid:(id)a5 query:(id)a6 hasEntitlement:(BOOL)a7 completionQueue:(id)a8 handler:(id)a9
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v15 = a5;
  id v16 = a6;
  id v17 = (dispatch_queue_s *)a8;
  id v18 = a9;
  id v19 = a3;
  xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v20, "config-operation", 16LL);
  id v21 = v19;
  id v22 = (const char *)[v21 UTF8String];

  uint64_t v23 = MEMORY[0x1895F87A8];
  if (v22)
  {
    xpc_dictionary_set_string(v20, "bundle-id", v22);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  ne_log_obj();
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uuid = 0;
    _os_log_error_impl(&dword_1876B1000, v30, OS_LOG_TYPE_ERROR, "Failed to extract bundle ID string", uuid, 2u);
  }

  block[0] = v23;
  block[1] = 3221225472LL;
  block[2] = __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke;
  block[3] = &unk_18A090940;
  id v37 = v18;
  dispatch_async(v17, block);

  if (a4) {
LABEL_3:
  }
    xpc_dictionary_set_int64(v20, "pid", a4);
LABEL_4:
  if (v15)
  {
    *(_OWORD *)uuid = 0uLL;
    [v15 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v20, "uuid", uuid);
  }

  if (!v16)
  {
    ne_log_obj();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uuid = 0;
      uint64_t v27 = "No query string provided";
      id v28 = v26;
      uint32_t v29 = 2;
      goto LABEL_18;
    }

- (void)repopulateNetworkPrivacyConfigurationResetAll:(BOOL)a3
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(xdict, "config-operation", 17LL);
  xpc_dictionary_set_BOOL(xdict, "reset-all", a3);
  -[NEConfigurationManager sendRequest:responseHandler:](self, xdict, 0LL);
}

- (void)fetchClientListenerWithBundleID:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v11, "config-operation", 8LL);
  id v12 = v10;
  id v13 = (const char *)[v12 UTF8String];

  xpc_dictionary_set_string(v11, "client-name", v13);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke;
  v16[3] = &unk_18A08C790;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);
}

- (void)fetchUpgradeInfoForPluginType:(id)a3 completionQueue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v11, "config-operation", 9LL);
  id v12 = v10;
  id v13 = (const char *)[v12 UTF8String];

  xpc_dictionary_set_string(v11, "config-plugin-type", v13);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke;
  v16[3] = &unk_18A08BAA8;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  -[NEConfigurationManager sendRequest:responseHandler:](self, v11, v16);
}

- (id)getCurrentUserUUIDForConfigurationID:(id)a3 fromIndex:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", @"UserMap", 0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        [v6 objectForKeyedSubscript:@"UserMap"];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 objectForKeyedSubscript:v12];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (isa_nsarray(v14) && ([v14 containsObject:v5] & 1) != 0)
        {
          id v15 = v12;

          goto LABEL_12;
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = 0LL;
LABEL_12:

  return v15;
}

- (id)copyAppGroupMapDidChange:(BOOL *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    id v6 = 0LL;
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:self->_appGroupMap];
  if (a3) {
LABEL_4:
  }
    *a3 = -[NEConfigurationManager appGroupsChanged](self, "appGroupsChanged");
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addGroups:(id)a3 forApp:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (!self || !self->_appGroupMap)
  {
    id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[NEConfigurationManager setAppGroupMap:]((uint64_t)self, v8);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
        if (self) {
          appGroupMap = self->_appGroupMap;
        }
        else {
          appGroupMap = 0LL;
        }
        -[NSMutableDictionary objectForKeyedSubscript:]( appGroupMap,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v20 + 1) + 8 * v13),  (void)v20);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v17 = v16;
        if (!v16 || ([v16 isEqualToString:v7] & 1) == 0) {
          -[NEConfigurationManager setAppGroupsChanged:](self, "setAppGroupsChanged:", 1LL);
        }
        if (self) {
          __int128 v18 = self->_appGroupMap;
        }
        else {
          __int128 v18 = 0LL;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v7, v14);

        ++v13;
      }

      while (v11 != v13);
      uint64_t v19 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v11 = v19;
    }

    while (v19);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)debugDescription
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v3 appendString:@"{"];
  os_unfair_lock_lock(&self->_lock);
  if (self) {
    appGroupMap = self->_appGroupMap;
  }
  else {
    appGroupMap = 0LL;
  }
  [v3 appendPrettyObject:appGroupMap withName:@"app-group-map" andIndent:0 options:0];
  os_unfair_lock_unlock(&self->_lock);
  [v3 appendString:@"\n}"];
  return v3;
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)hasVPNAPIEntitlement
{
  return self->_hasVPNAPIEntitlement;
}

- (void)setHasVPNAPIEntitlement:(BOOL)a3
{
  self->_hasVPNAPIEntitlement = a3;
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 136LL, 1);
}

- (int64_t)configurationChangeSource
{
  return self->_configurationChangeSource;
}

- (void)setConfigurationChangeSource:(int64_t)a3
{
  self->_configurationChangeSource = a3;
}

- (BOOL)appGroupsChanged
{
  return self->_appGroupsChanged;
}

- (void)setAppGroupsChanged:(BOOL)a3
{
  self->_appGroupsChanged = a3;
}

- (void).cxx_destruct
{
}

- (void)setAppGroupMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

void __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v5 = a4;
  id v6 = v5;
  if (v5 && MEMORY[0x1895ADD58](v5) == MEMORY[0x1895F9250]) {
    id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v7 = 0LL;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2;
  v12[3] = &unk_18A0908C8;
  id v10 = *(id *)(a1 + 48);
  id v13 = v7;
  id v14 = v10;
  id v11 = v7;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v8, v9, v12);
}

- (void)sendRequest:(void *)a3 responseHandler:
{
  xpc_object_t xdict = a2;
  if (a1)
  {
    id v5 = a3;
    [a1 pluginType];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      id v8 = [a1 pluginType];
      xpc_dictionary_set_string(xdict, "config-plugin-type", (const char *)[v8 UTF8String]);
    }

    objc_msgSend(objc_getProperty(a1, v7, 112, 1), "sendRequest:responseHandler:", xdict, v5);
  }
}

uint64_t __80__NEConfigurationManager_fetchUpgradeInfoForPluginType_completionQueue_handler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)executeCallbackOnQueue:(void *)a3 callback:
{
  queue = a2;
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24)) {
      v5[2](v5);
    }
    else {
      dispatch_async(queue, v5);
    }
  }
}

void __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v5 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2;
  v9[3] = &unk_18A0908C8;
  id v6 = *(dispatch_queue_s **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __82__NEConfigurationManager_fetchClientListenerWithBundleID_completionQueue_handler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke( uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Calling handler with failure: %u", (uint8_t *)v4, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_196( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEBUG,  "Got response, result_code: %llu, response_data: %@",  buf,  0x16u);
  }

  if (a3 == 36)
  {
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v10 = "Alert was blocked, defaulting to no";
LABEL_13:
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
    }

uint64_t __108__NEConfigurationManager_showLocalNetworkAlertForApp_pid_uuid_query_hasEntitlement_completionQueue_handler___block_invoke_197( uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_INFO,  "Calling handler with newly allowed state: %u",  (uint8_t *)v5,  8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __103__NEConfigurationManager_triggerLocalAuthenticationForConfigurationWithID_withCompletionQueue_handler___block_invoke( uint64_t a1)
{
}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v18 = v9;
    __int16 v19 = 1024;
    int v20 = a2;
    __int16 v21 = 2048;
    uint64_t v22 = a3;
    __int16 v23 = 2048;
    id v24 = v7;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_INFO,  "%@ Loaded identities from nehelper, ipc_success = %d, result_code = %lld, response_data = %p",  buf,  0x26u);
  }

  if (v7 && MEMORY[0x1895ADD58](v7) == MEMORY[0x1895F9220]) {
    id v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v10 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_187;
  v14[3] = &unk_18A0908C8;
  id v11 = *(dispatch_queue_s **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v15 = v10;
  id v16 = v12;
  id v13 = v10;
  dispatch_async(v11, v14);
}

void __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[NEIdentityKeychainItem copyIdentities:fromDomain:]( &OBJC_CLASS___NEIdentityKeychainItem,  "copyIdentities:fromDomain:",  *(void *)(a1 + 32),  1LL);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __80__NEConfigurationManager_copyIdentities_fromDomain_withCompletionQueue_handler___block_invoke_187( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke( uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  int v3 = *(_BYTE **)(a1 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  _DWORD v5[2] = __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_18A08FE20;
  v5[4] = v3;
  uint64_t v6 = v2;
  id v9 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v3, 0LL, v5);
}

void __90__NEConfigurationManager_handleApplicationsRemoved_completionQueue_withCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4) {
    goto LABEL_83;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 88LL, 1);
  }
  [Property allValues];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"NEConfigurationManager remove prefs", 0LL);
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  SCPreferencesRef prefs = v6;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v66 = SCError();
      *(_DWORD *)buf = 136315394;
      id v85 = SCErrorString(v66);
      __int16 v86 = 1024;
      LODWORD(v87) = SCError();
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "SCPreferencesCreate failed while handling application removal: %s (%d)",  buf,  0x12u);
    }

    goto LABEL_81;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
    __int16 v86 = 1024;
    LODWORD(v87) = 2571;
    _os_log_debug_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
  }

  if (!SCPreferencesLock(v6, 1u))
  {
    ne_log_obj();
    v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      int v67 = SCError();
      v68 = SCErrorString(v67);
      int v69 = SCError();
      *(_DWORD *)buf = 136315394;
      id v85 = v68;
      __int16 v86 = 1024;
      LODWORD(v87) = v69;
      _os_log_error_impl( &dword_1876B1000,  v65,  OS_LOG_TYPE_ERROR,  "SCPreferencesLock failed while handling application removal: %s (%d)",  buf,  0x12u);
    }

    CFRelease(prefs);
LABEL_81:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    goto LABEL_82;
  }

  v70 = 0LL;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id obj = v71;
  uint64_t v9 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (!v9) {
    goto LABEL_72;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v81;
  uint64_t v79 = a1;
  uint64_t v72 = *(void *)v81;
  do
  {
    uint64_t v12 = 0LL;
    uint64_t v75 = v10;
    do
    {
      if (*(void *)v81 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v80 + 1) + 8 * v12);
      objc_msgSend(v13, "pluginType", v70);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 payloadInfo];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        goto LABEL_32;
      }
      uint64_t v16 = [v13 application];
      if (v16)
      {
        id v15 = (void *)v16;
        __int16 v17 = *(void **)(a1 + 48);
        [v13 application];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v17 containsObject:v18])
        {

          goto LABEL_22;
        }

        if (v14)
        {
          char v19 = [*(id *)(a1 + 48) containsObject:v14];

          if ((v19 & 1) == 0) {
            goto LABEL_33;
          }
LABEL_22:
          ne_log_obj();
          int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            [v13 name];
            __int16 v21 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            id v85 = v21;
            _os_log_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_INFO,  "Removing configuration %@ because the corresponding VPN application has been removed",  buf,  0xCu);
          }

          if (v14) {
            -[NEConfigurationManager removeGroupsForApp:](*(void *)(a1 + 32), v14);
          }
          [v13 applicationIdentifier];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            uint64_t v23 = *(void *)(a1 + 32);
            [v13 applicationIdentifier];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEConfigurationManager removeGroupsForApp:](v23, v24);
          }

          uint64_t v25 = *(_BYTE **)(a1 + 32);
          [v13 identifier];
          id v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:](v25, v26, prefs);
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            ne_log_obj();
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
            {
              [v13 name];
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              id v85 = "-[NEConfigurationManager handleApplicationsRemoved:completionQueue:withCompletionHandler:]_block_invoke";
              __int16 v86 = 2112;
              v87 = v61;
              __int16 v88 = 2112;
              id v89 = v15;
              _os_log_error_impl( &dword_1876B1000,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%s: failed to remove configuration %@: %@",  buf,  0x20u);
            }

            goto LABEL_31;
          }
        }

        else
        {
LABEL_31:
        }

- (void)loadConfigurationsInternal:(void *)a3 withCompletionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke;
    v7[3] = &unk_18A08F1A0;
    v7[4] = a1;
    id v8 = v5;
    id v9 = v6;
    -[NEConfigurationManager getCurrentIndexWithCompletionHandler:](a1, v7);
  }
}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke( id *a1,  void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4 || (id v11 = a1[4]) == 0LL || !objc_getProperty(v11, v3, 56LL, 1))
  {
    id v5 = a1[4];
    if (v5 && objc_getProperty(v5, v3, 80LL, 1))
    {
      id v7 = a1[4];
      if (v7) {
        id Property = objc_getProperty(a1[4], v6, 80LL, 1);
      }
      else {
        id Property = 0LL;
      }
      [Property allKeys];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v7, v9);
    }

    if (v4)
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v21 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to load configurations: %@", buf, 0x16u);
      }
    }

    goto LABEL_11;
  }

  uint64_t v12 = a1[4];
  if (!v12)
  {

LABEL_11:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_12;
  }

  if ((v12[20] & 1) != 0) {
    goto LABEL_11;
  }
  if ((v12[23] & 1) != 0) {
    goto LABEL_11;
  }
  id v13 = -[NEConfigurationManager copyChangedConfigurationIDs:](v12, a1[5]);
  if (!v13) {
    goto LABEL_11;
  }
  BOOL v14 = v13;
  xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
  ne_log_obj();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEFAULT, "Sending load command to nehelper", buf, 2u);
  }

  [v16 encodeObject:v14 forKey:@"config-identifiers"];
  [v16 finishEncoding];
  [v16 encodedData];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v19 = xpc_data_create((const void *)[v18 bytes], objc_msgSend(v18, "length"));
  -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](a1[4], v14);
  xpc_dictionary_set_int64(v15, "config-operation", 2LL);
  xpc_dictionary_set_value(v15, "config-ids-data", v19);
  id v20 = a1[4];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_148;
  v22[3] = &unk_18A08C790;
  v22[4] = v20;
  id v23 = a1[6];
  -[NEConfigurationManager sendRequest:responseHandler:](v20, v15, v22);

LABEL_12:
}

- (void)getCurrentIndexWithCompletionHandler:(_BYTE *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = MEMORY[0x1895F87A8];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    uint64_t v12 = __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke;
    id v13 = &unk_18A0908C8;
    BOOL v14 = a1;
    id v15 = v3;
    id v6 = v11;
    id v8 = v6;
    if (a1[24])
    {
      if ((a1[25] & 1) != 0)
      {
        v12((uint64_t)v6);
      }

      else
      {
        id Property = (dispatch_queue_s *)objc_getProperty(a1, v7, 40LL, 1);
        block[0] = v5;
        block[1] = 3221225472LL;
        block[2] = __39__NEConfigurationManager_executeBlock___block_invoke;
        block[3] = &unk_18A0908C8;
        void block[4] = a1;
        id v17 = v8;
        dispatch_sync(Property, block);
      }
    }

    else
    {
      uint64_t v10 = (dispatch_queue_s *)objc_getProperty(a1, v7, 40LL, 1);
      dispatch_async(v10, v8);
    }
  }
}

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v154 = *MEMORY[0x1895F89C0];
  -[NEConfigurationManager registerForChangeNotifications](*(id *)(a1 + 32));
  uint64_t v122 = a1;
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_84;
  }
  id v4 = objc_getProperty(v3, v2, 56LL, 1);
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    int v7 = *(_DWORD *)(v6 + 28);

    if (v7 == -1) {
      goto LABEL_25;
    }
  }

  else
  {
  }

  state64[0] = 0LL;
  uint64_t v8 = *(void *)(v122 + 32);
  if (v8) {
    int v9 = *(_DWORD *)(v8 + 28);
  }
  else {
    int v9 = 0;
  }
  uint32_t state = notify_get_state(v9, state64);
  uint32_t v11 = state;
  if (state == 9)
  {
    ne_log_obj();
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(v122 + 32);
      if (v17) {
        LODWORD(v17) = *(_DWORD *)(v17 + 28);
      }
      *(_DWORD *)buf = 136315394;
      v151 = "com.apple.neconfigurationchanged";
      __int16 v152 = 1024;
      *(_DWORD *)v153 = v17;
      uint64_t v16 = "Failed to get the current %s (token %u) notification state because the server is not found";
      goto LABEL_22;
    }

uint64_t __39__NEConfigurationManager_executeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(_BYTE *)(v2 + 25) = 1;
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    *(_BYTE *)(v4 + 25) = 0;
  }
  return result;
}

- (void)registerForChangeNotifications
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (val && *((_DWORD *)val + 7) == -1)
  {
    int out_token = -1;
    objc_initWeak(&location, val);
    id v3 = (dispatch_queue_s *)objc_getProperty(val, v2, 40LL, 1);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke;
    handler[3] = &unk_18A08FAA0;
    objc_copyWeak(&v7, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.neconfigurationchanged", &out_token, v3, handler);

    if (v4)
    {
      ne_log_obj();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v11 = v4;
        _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed: %d", buf, 8u);
      }
    }

    else
    {
      *((_DWORD *)val + 7) = out_token;
    }

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

void __63__NEConfigurationManager_getCurrentIndexWithCompletionHandler___block_invoke_88( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  xpc_object_t xdata = a4;
  if (xdata && MEMORY[0x1895ADD58](xdata) == MEMORY[0x1895F9240])
  {
    id v7 = (void *)MEMORY[0x189603F48];
    bytes_ptr = xpc_data_get_bytes_ptr(xdata);
    [v7 dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(xdata) freeWhenDone:0];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v9 error:0];
    uint32_t v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 decodeObjectOfClasses:v16 forKey:@"config-index"];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [v10 decodeInt64ForKey:@"config-generation"];
    if (isa_nsdictionary(v17))
    {
      id v20 = *(void **)(a1 + 32);
      if (v20) {
        objc_setProperty_atomic(v20, v19, v17, 56LL);
      }
    }

    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      *(void *)(v21 + 104) = v18;
    }
  }

  if (a2) {
    uint64_t v22 = a3;
  }
  else {
    uint64_t v22 = 11LL;
  }
  if (v22)
  {
    -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v22, 0LL);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v23 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)errorWithCode:(void *)a3 specifics:
{
  v12[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = @"configuration is corrupted";
    switch(a2)
    {
      case 1LL:
        break;
      case 2LL:
        [NSString stringWithFormat:@"configuration is invalid: %@", v5];
        goto LABEL_14;
      case 3LL:
        uint64_t v6 = @"configuration type is wrong";
        break;
      case 4LL:
        uint64_t v6 = @"configuration owner application is wrong";
        break;
      case 5LL:
        uint64_t v6 = @"configuration is stale";
        break;
      case 6LL:
        uint64_t v6 = @"failed to write configuration to disk";
        break;
      case 7LL:
        uint64_t v6 = @"configuration does not exist";
        break;
      case 8LL:
        uint64_t v6 = @"invalid configuration operation request";
        break;
      case 9LL:
        uint64_t v6 = @"configuration is unchanged";
        break;
      case 10LL:
        uint64_t v6 = @"permission denied";
        break;
      case 11LL:
        uint64_t v6 = @"IPC failed";
        break;
      case 12LL:
        [NSString stringWithFormat:@"failed to make changes in SCPreferences: %@", v5];
LABEL_14:
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 13LL:
        uint64_t v6 = @"failed to copy keychain items";
        break;
      case 14LL:
        uint64_t v6 = @"failed into import certificates into keychain";
        break;
      case 15LL:
        uint64_t v6 = @"unknown certificate format";
        break;
      case 16LL:
        uint64_t v6 = @"failed to import certificate";
        break;
      case 17LL:
        uint64_t v6 = @"internal failure with certificate installation";
        break;
      case 18LL:
        uint64_t v6 = @"file not found";
        break;
      case 20LL:
        uint64_t v6 = @"total NetworkExtension configuration size limit exceeded";
        break;
      case 21LL:
        uint64_t v6 = @"MDM required";
        break;
      default:
        uint64_t v6 = @"<unknown>";
        break;
    }

    id v7 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896075E0];
    v12[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:@"NEConfigurationErrorDomain" code:a2 userInfo:v8];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v9 = 0LL;
  }

  return v9;
}

- (id)filterIndexWithFilter:(void *)a1
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1 || !objc_getProperty(a1, v3, 56LL, 1))
  {
    uint64_t v51 = 0LL;
    goto LABEL_57;
  }

  if (!v4
    || ([v4 objectForKeyedSubscript:@"user-uuid"],
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(),
        int v7 = isa_nsuuid(v6),
        v6,
        !v7))
  {
    id v8 = (id)objc_msgSend(objc_getProperty(a1, v5, 56, 1), "mutableCopy");
    [v8 removeObjectForKey:@"AppGroupMap"];
    uint64_t v51 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v8];
    goto LABEL_56;
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
  [v4 objectForKeyedSubscript:@"plugin-types"];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"application-id"];
  SEL v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(objc_getProperty(a1, v9, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"user-uuid"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 addObjectsFromArray:v12];

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  self = a1;
  objc_msgSend(objc_getProperty(a1, v13, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  NEGetNullUUID();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 objectForKeyedSubscript:v15];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v17 = [v16 countByEnumeratingWithState:&v67 objects:v77 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v68;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        if (([v8 containsObject:v21] & 1) == 0) {
          [v8 addObject:v21];
        }
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v67 objects:v77 count:16];
    }

    while (v18);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  objc_msgSend(objc_getProperty(self, v22, 56, 1), "objectForKeyedSubscript:", @"UserMap");
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  NEGetRootUUID();
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 objectForKeyedSubscript:v24];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v64;
    do
    {
      for (uint64_t j = 0LL; j != v27; ++j)
      {
        if (*(void *)v64 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v63 + 1) + 8 * j);
        if (([v8 containsObject:v30] & 1) == 0) {
          [v8 addObject:v30];
        }
      }

      uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v76 count:16];
    }

    while (v27);
  }

  if (!v8)
  {
    uint64_t v51 = 0LL;
    goto LABEL_55;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v31 = v8;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v75 count:16];
  if (!v32)
  {
    uint64_t v51 = 0LL;
LABEL_53:

    goto LABEL_55;
  }

  uint64_t v34 = v32;
  uint64_t v53 = v4;
  id v57 = 0LL;
  id v35 = @"ConfigurationProperties";
  uint64_t v36 = *(void *)v60;
  int v37 = self;
  do
  {
    uint64_t v38 = 0LL;
    uint64_t v55 = v34;
    do
    {
      if (*(void *)v60 != v36) {
        objc_enumerationMutation(v31);
      }
      uint64_t v39 = *(void *)(*((void *)&v59 + 1) + 8 * v38);
      objc_msgSend(objc_getProperty(v37, v33, 56, 1), "objectForKeyedSubscript:", v35);
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 objectForKeyedSubscript:v39];
      int v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (isa_nsdictionary(v41))
      {
        unint64_t v42 = v35;
        id v43 = v31;
        objc_msgSend(v41, "objectForKeyedSubscript:", @"PluginType", v53);
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 objectForKeyedSubscript:@"ApplicationID"];
        char v45 = (void *)objc_claimAutoreleasedReturnValue();
        else {
          int v46 = 0;
        }
        if (isa_nsstring(v56)
          && isa_nsstring(v45)
          && [v56 isEqualToString:v45])
        {

          int v37 = self;
          goto LABEL_41;
        }

        int v37 = self;
        if (v46)
        {
LABEL_41:
          id v47 = v57;
          if (!v57) {
            id v47 = objc_alloc_init(MEMORY[0x189603FC8]);
          }
          id v57 = v47;
          objc_msgSend(v47, "setObject:forKeyedSubscript:", v41, v39, v53);
        }

        id v31 = v43;
        id v35 = v42;
        uint64_t v34 = v55;
      }

      ++v38;
    }

    while (v34 != v38);
    uint64_t v34 = [v31 countByEnumeratingWithState:&v59 objects:v75 count:16];
  }

  while (v34);

  if (v57)
  {
    v73[0] = @"UserMap";
    id v4 = v53;
    [v53 objectForKeyedSubscript:@"user-uuid"];
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v48;
    [v57 allKeys];
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v72 = v49;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v35;
    v74[0] = v50;
    v74[1] = v57;
    [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:2];
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

    id v31 = v57;
    goto LABEL_53;
  }

  uint64_t v51 = 0LL;
  id v4 = v53;
LABEL_55:

LABEL_56:
LABEL_57:

  return v51;
}

- (void)notifyChanges
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 64LL, 1);
    if (v3)
    {
      id v5 = v3;
      id Property = objc_getProperty(a1, v4, 72LL, 1);

      if (Property)
      {
        id v8 = -[NEConfigurationManager copyChangedConfigurationIDs:](a1, 0LL);
        if (v8)
        {
          SEL v9 = (dispatch_queue_s *)objc_getProperty(a1, v7, 40LL, 1);
          v10[0] = MEMORY[0x1895F87A8];
          v10[1] = 3221225472LL;
          v10[2] = __39__NEConfigurationManager_notifyChanges__block_invoke;
          v10[3] = &unk_18A08F098;
          v10[4] = a1;
          id v11 = v8;
          dispatch_async(v9, v10);
        }
      }
    }
  }

- (void)clearLoadedConfigurationsWithIDs:(void *)a1
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          ne_log_obj();
          id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v10;
            _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Clearing %@ from the loaded configurations",  buf,  0xCu);
          }
        }

        uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }

      while (v7);
    }

    objc_msgSend(objc_getProperty(a1, v6, 88, 1), "removeObjectsForKeys:", v4);
    objc_msgSend(objc_getProperty(a1, v12, 80, 1), "removeObjectsForKeys:", v4);
  }
}

- (void)didLoadConfiguration:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v3 = a2;
    objc_msgSend(objc_getProperty(a1, v4, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    [v3 identifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 objectForKeyedSubscript:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:@"Signature"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v3;
    id v9 = v7;
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v8 identifier];
        SEL v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v25 = v12;
        _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEFAULT, "Adding %@ to the loaded configurations", buf, 0xCu);
      }

      if (!objc_getProperty(a1, v13, 80LL, 1))
      {
        __int128 v15 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
        objc_setProperty_atomic(a1, v16, v15, 80LL);

        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
        objc_setProperty_atomic(a1, v18, v17, 88LL);
      }

      id v19 = objc_getProperty(a1, v14, 80LL, 1);
      [v8 identifier];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v9 forKeyedSubscript:v20];

      id v22 = objc_getProperty(a1, v21, 88LL, 1);
      [v8 identifier];
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      [v22 setObject:v8 forKeyedSubscript:v11];
    }

    else
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      [v8 identifier];
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v25 = v22;
      _os_log_fault_impl(&dword_1876B1000, v11, OS_LOG_TYPE_FAULT, "Missing a signature for %@", buf, 0xCu);
    }

LABEL_10:
  }

- (void)copyChangedConfigurationIDs:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v6 = v4;
    if (v3)
    {
      [v4 addObjectsFromArray:v3];
    }

    else
    {
      if (objc_getProperty(a1, v5, 56LL, 1))
      {
        objc_msgSend(objc_getProperty(a1, v7, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 allKeys];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 addObjectsFromArray:v9];
      }

      if (objc_getProperty(a1, v7, 80LL, 1))
      {
        objc_msgSend(objc_getProperty(a1, v10, 80, 1), "allKeys");
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 addObjectsFromArray:v11];
      }
    }

    if (v6)
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        __int128 v15 = 0LL;
        uint64_t v16 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v12);
            }
            SEL v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (-[NEConfigurationManager configurationHasChanged:](a1, v18))
            {
              if (!v15)
              {
                id v19 = objc_alloc(MEMORY[0x189603FA8]);
                __int128 v15 = (void *)objc_msgSend(v19, "initWithCapacity:", 0, (void)v21);
              }

              objc_msgSend(v15, "addObject:", v18, (void)v21);
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v14);

        if (v15)
        {
          [MEMORY[0x189603F18] arrayWithArray:v15];
          a1 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

          goto LABEL_26;
        }

void __39__NEConfigurationManager_notifyChanges__block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 64LL, 1);
    if (v4)
    {
      id v15 = v4;
      uint64_t v6 = *(void **)(a1 + 32);
      if (v6)
      {
        id Property = objc_getProperty(v6, v5, 72LL, 1);

        if (Property)
        {
          id v9 = *(id *)(a1 + 32);
          if (v9) {
            id v9 = objc_getProperty(v9, v8, 72LL, 1);
          }
          id v11 = v9;
          id v12 = *(void **)(a1 + 32);
          if (v12) {
            uint64_t v13 = (dispatch_queue_s *)objc_getProperty(v12, v10, 64LL, 1);
          }
          else {
            uint64_t v13 = 0LL;
          }
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __39__NEConfigurationManager_notifyChanges__block_invoke_2;
          block[3] = &unk_18A0908C8;
          id v18 = v11;
          id v17 = *(id *)(a1 + 40);
          id v14 = v11;
          dispatch_async(v13, block);
        }
      }

      else
      {
      }
    }
  }

uint64_t __39__NEConfigurationManager_notifyChanges__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (uint64_t)configurationHasChanged:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (!a1)
  {
    uint64_t v11 = 0LL;
    goto LABEL_22;
  }

  if (objc_getProperty(a1, v3, 56LL, 1))
  {
    objc_msgSend(objc_getProperty(a1, v5, 56, 1), "objectForKeyedSubscript:", @"ConfigurationProperties");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKeyedSubscript:v4];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 objectForKeyedSubscript:@"Signature"];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (objc_getProperty(a1, v5, 80LL, 1))
  {
    uint64_t v10 = objc_msgSend(objc_getProperty(a1, v9, 80, 1), "objectForKeyedSubscript:", v4);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  if (!(v8 | v10)) {
    goto LABEL_11;
  }
  if (!v8)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      uint64_t v13 = "Configuration %@ was removed";
LABEL_19:
      _os_log_impl(&dword_1876B1000, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v16, 0xCu);
    }

void __56__NEConfigurationManager_registerForChangeNotifications__block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "com.apple.neconfigurationchanged";
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "Received a %s notification with token %d", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_getProperty(WeakRetained, v6, 72LL, 1);
    if (v8)
    {
      uint64_t v10 = v8;
      id Property = objc_getProperty(v7, v9, 64LL, 1);

      if (Property)
      {
        uint64_t v12 = MEMORY[0x1895F87A8];
        uint64_t v13 = 3221225472LL;
        BOOL v14 = __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_99;
        id v15 = &unk_18A0907E8;
        id v16 = v7;
        -[NEConfigurationManager getCurrentIndexWithCompletionHandler:]();
      }
    }
  }
}

void __56__NEConfigurationManager_registerForChangeNotifications__block_invoke_99(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v4 = *(_BYTE **)(a1 + 32);
    if (v4)
    {
      if ((v4[20] & 1) == 0)
      {
        -[NEConfigurationManager notifyChanges](v4, 0LL);
        id v3 = 0LL;
      }
    }
  }
}

void __75__NEConfigurationManager_loadConfigurationsInternal_withCompletionHandler___block_invoke_148( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = v7;
  if (v7 && MEMORY[0x1895ADD58](v7) == MEMORY[0x1895F9240])
  {
    id v10 = objc_alloc(MEMORY[0x189607908]);
    uint64_t v11 = (void *)MEMORY[0x189603F48];
    bytes_ptr = xpc_data_get_bytes_ptr(v8);
    [v11 dataWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v8) freeWhenDone:0];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (void *)[v10 initForReadingFromData:v13 error:0];

    BOOL v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 decodeObjectOfClasses:v16 forKey:@"config-objects"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (isa_nsarray(v17))
    {
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          uint64_t v22 = 0LL;
          do
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v18);
            }
            -[NEConfigurationManager didLoadConfiguration:]( *(void **)(a1 + 32),  *(void **)(*((void *)&v25 + 1) + 8 * v22++));
          }

          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }

        while (v20);
      }
    }
  }

  else
  {
    ne_log_obj();
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1876B1000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "No response data", buf, 2u);
    }
  }

  if ((a2 & 1) != 0)
  {
    if (!a3) {
      goto LABEL_24;
    }
  }

  else
  {
    ne_log_obj();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, "IPC with nehelper failed", buf, 2u);
    }

    a3 = 11LL;
  }

  ne_log_obj();
  __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = a3;
    _os_log_error_impl(&dword_1876B1000, v24, OS_LOG_TYPE_ERROR, "load failed with error: %lld", buf, 0xCu);
  }

  a3 = -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), a3, 0LL);
LABEL_24:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)removeGroupsForApp:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = *(id *)(a1 + 128);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [*(id *)(a1 + 128) objectForKeyedSubscript:v10];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v12 = [v11 isEqualToString:v3];

          if (v12) {
            [v4 addObject:v10];
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    if ([v4 count])
    {
      [(id)a1 setAppGroupsChanged:1];
      [*(id *)(a1 + 128) removeObjectsForKeys:v4];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (_BYTE)removeConfigurationFromDisk:(const __SCPreferences *)a3 updateSCPreferences:
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  if (a1)
  {
    uint64_t v84 = 0LL;
    char v83 = 0;
    if ((a1[23] & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 10LL, 0LL);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }

    id Property = objc_getProperty(a1, v5, 56LL, 1);
    -[NEConfigurationManager makeMutableCopyOfIndex:](a1, Property);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = isa_nsdictionary(v10);

    if ((v11 & 1) == 0)
    {
      -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)a1, 7LL, 0LL);
      a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
LABEL_54:

      goto LABEL_55;
    }

    SCPreferencesRef prefs = a3;
    uint64_t v74 = (uint64_t)a1;
    [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 removeObjectForKey:v6];

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    [v8 objectForKeyedSubscript:@"UserMap"];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v79 objects:v87 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v80;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v80 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v79 + 1) + 8 * i);
          [v8 objectForKeyedSubscript:@"UserMap"];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 objectForKeyedSubscript:v18];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

          [v20 removeObject:v6];
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v79 objects:v87 count:16];
      }

      while (v15);
    }

    uint64_t v21 = (void *)v74;
    uint64_t v22 = [(id)v74 copyAppGroupMapDidChange:&v83];
    if (v22 && v83)
    {
      [v8 setObject:v22 forKeyedSubscript:@"AppGroupMap"];
      os_unfair_lock_lock((os_unfair_lock_t)(v74 + 16));
      [(id)v74 setAppGroupsChanged:0];
      os_unfair_lock_unlock((os_unfair_lock_t)(v74 + 16));
    }

    SEL v72 = (void *)v22;
    unint64_t v23 = *(void *)(v74 + 104);
    if (v23 <= 0x1FFFFFFFFFFFFELL) {
      uint64_t v24 = v23 + 1;
    }
    else {
      uint64_t v24 = 1LL;
    }
    __int128 v25 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    v71 = (const char *)v24;
    [v25 encodeInt64:v24 forKey:@"Generation"];
    [v25 encodeInt64:1 forKey:@"Version"];
    [v25 encodeObject:v8 forKey:@"Index"];
    if (objc_getProperty((id)v74, v26, 56LL, 1))
    {
      objc_msgSend(objc_getProperty((id)v74, v27, 88, 1), "objectForKeyedSubscript:", v6);
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
      uint32_t v29 = v28;
      if (v28) {
        [v28 clearSystemKeychain];
      }
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      __int128 v75 = 0u;
      __int128 v76 = 0u;
      [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v30 countByEnumeratingWithState:&v75 objects:v86 count:16];
      if (v31)
      {
        uint64_t v33 = v31;
        uint64_t v34 = *(void *)v76;
        do
        {
          uint64_t v35 = 0LL;
          uint64_t v36 = v29;
          do
          {
            if (*(void *)v76 != v34) {
              objc_enumerationMutation(v30);
            }
            objc_msgSend( objc_getProperty(v21, v32, 88, 1),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v75 + 1) + 8 * v35));
            uint32_t v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              [v29 identifier];
              int v37 = (void *)objc_claimAutoreleasedReturnValue();
              [v37 UUIDString];
              uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
              [v25 encodeObject:v29 forKey:v38];

              uint64_t v21 = (void *)v74;
              +[NEConfigurationManager updateFlags:withConfiguration:]( (uint64_t)&OBJC_CLASS___NEConfigurationManager,  (unint64_t *)&v84,  v29);
            }

            ++v35;
            uint64_t v36 = v29;
          }

          while (v33 != v35);
          uint64_t v33 = [v30 countByEnumeratingWithState:&v75 objects:v86 count:16];
        }

        while (v33);
      }
    }

    if (!prefs) {
      goto LABEL_43;
    }
    id v39 = v6;
    objc_opt_self();
    __int128 v40 = (const __CFString *)[v39 UUIDString];

    SCNetworkServiceRef v41 = SCNetworkServiceCopy(prefs, v40);
    if (!v41) {
      goto LABEL_43;
    }
    CFRelease(v41);
    id v42 = v39;
    objc_opt_self();
    id v43 = SCNetworkServiceCopy(prefs, (CFStringRef)[v42 UUIDString]);
    if (v43)
    {
      uint64_t v44 = v43;
      if (!SCNetworkServiceRemove(v43))
      {
        ne_log_obj();
        __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          [v42 UUIDString];
          __int128 v65 = (void *)objc_claimAutoreleasedReturnValue();
          int v66 = SCError();
          __int128 v67 = SCErrorString(v66);
          *(_DWORD *)buf = 138412546;
          id v89 = v65;
          __int16 v90 = 2080;
          uint64_t v91 = v67;
          _os_log_error_impl( &dword_1876B1000,  v59,  OS_LOG_TYPE_ERROR,  "SCNetworkServiceRemove failed for configuration %@: %s",  buf,  0x16u);
        }

        CFRelease(v44);
        __int128 v60 = (void *)NSString;
        int v61 = SCError();
        [v60 stringWithCString:SCErrorString(v61) encoding:4];
        __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEConfigurationManager errorWithCode:specifics:]((uint64_t)v21, 12LL, v62);
        a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();

        goto LABEL_53;
      }

      CFRelease(v44);
    }

    char v45 = prefs;
    if (SCPreferencesCommitChanges(prefs))
    {
      if (!SCPreferencesApplyChanges(prefs))
      {
        ne_log_obj();
        id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          [v42 UUIDString];
          __int128 v68 = (void *)objc_claimAutoreleasedReturnValue();
          int v69 = SCError();
          __int128 v70 = SCErrorString(v69);
          *(_DWORD *)buf = 138412546;
          id v89 = v68;
          __int16 v90 = 2080;
          uint64_t v91 = v70;
          _os_log_error_impl( &dword_1876B1000,  v47,  OS_LOG_TYPE_ERROR,  "SCPreferencesApplyChanges failed while removing configuration %@: %s",  buf,  0x16u);
        }

        char v45 = prefs;
      }

      if (objc_getProperty(v21, v46, 120LL, 1))
      {
        CFDataRef Signature = SCPreferencesGetSignature(v45);
        objc_setProperty_atomic(v21, v49, Signature, 120LL);
      }

- (id)saveConfigurationToDisk:(const __SCPreferences *)a3 updateSCPreferences:(void *)a4 currentSignature:(void *)a5 userUUID:(int)a6 notifyNow:(char)a7 isUpgrade:
{
  uint64_t v469 = *MEMORY[0x1895F89C0];
  uint64_t v12 = a2;
  id v13 = a4;
  id v14 = a5;
  v415 = (void *)v12;
  v416 = v14;
  v417 = v13;
  if (!a1)
  {
    uint64_t v32 = 0LL;
    goto LABEL_412;
  }

  uint64_t v15 = v14;
  int v407 = a6;
  [(id)v12 pluginType];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v445 = 0LL;
  id v17 = (id)v12;
  objc_opt_self();
  [v17 alwaysOnVPN];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v418 = a1;
  if (!v18
    || ([v17 alwaysOnVPN],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        ([(id)v12 isEnabled] & 1) == 0))
  {
    [v17 VPN];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      [v17 VPN];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v7 isEnabled])
      {
        char v432 = 1;
LABEL_41:

LABEL_42:
        a1 = v418;
        if (!v18) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
    }

    [v17 appVPN];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      [v17 appVPN];
      v429 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v429 isEnabled])
      {
        char v432 = 1;
LABEL_39:

LABEL_40:
        id v13 = v417;
        if (!v19) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }

    [v17 contentFilter];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      [v17 contentFilter];
      v425 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v425 isEnabled])
      {
        char v432 = 1;
LABEL_37:

LABEL_38:
        if (!v20) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }

      v355 = v16;
    }

    else
    {
      v355 = v16;
    }

    [v17 dnsProxy];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      [v17 dnsProxy];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v15 isEnabled])
      {
        char v432 = 1;
LABEL_35:

LABEL_36:
        uint64_t v15 = v416;
        uint64_t v16 = v355;
        if (!v21) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }

    uint64_t v423 = [v17 dnsSettings];
    if (v423)
    {
      [v17 dnsSettings];
      v419 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v419 isEnabled])
      {
        char v432 = 1;
        unint64_t v23 = (void *)v423;
LABEL_33:

LABEL_34:
        if (!v22) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }

    [v17 appPush];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      [v17 appPush];
      v411 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v411 isEnabled])
      {
        char v432 = 1;
        goto LABEL_31;
      }

      v413 = v15;
    }

    else
    {
      v413 = v15;
    }

    uint64_t v25 = [v17 relay];
    SEL v26 = v17;
    if (v25)
    {
      __int128 v27 = (void *)v25;
      [v26 relay];
      v409 = v24;
      __int128 v28 = v7;
      uint32_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      char v432 = [v29 isEnabled];

      uint64_t v7 = v28;
      uint64_t v24 = v409;
    }

    else
    {
      char v432 = 0;
    }

    id v17 = v26;
    uint64_t v15 = v413;
    if (!v24)
    {
LABEL_32:
      unint64_t v23 = (void *)v423;
      if (!v423) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }

- (id)makeMutableCopyOfIndex:(id)a1
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_19;
  }
  if ((isa_nsdictionary(v3) & 1) == 0)
  {
    a1 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v6 = 0LL;
    id v5 = 0LL;
LABEL_7:
    id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
    goto LABEL_8;
  }

  [v4 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:@"UserMap"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  a1 = (id)[v4 mutableCopy];
  id v7 = (id)[v5 mutableCopy];
LABEL_8:
  uint64_t v8 = v7;
  [a1 setObject:v7 forKeyedSubscript:@"ConfigurationProperties"];

  int v9 = isa_nsdictionary(v6);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v9)
  {
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16, v20, v21, (void)v22);
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v18 = (void *)[v17 mutableCopy];
          [v10 setObject:v18 forKeyedSubscript:v16];
        }

        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v13);
    }

    [a1 setObject:v10 forKeyedSubscript:@"UserMap"];
    id v6 = v20;
    id v5 = v21;
  }

  else
  {
    [a1 setObject:v10 forKeyedSubscript:@"UserMap"];
  }

LABEL_19:
  return a1;
}

+ (void)disableConfiguration:(uint64_t)a1 onDemandOnly:(void *)a2
{
  id v18 = a2;
  objc_opt_self();
  [v18 VPN];
  SEL v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [v18 VPN];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setEnabled:0];
  }

  [v18 appVPN];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    [v18 appVPN];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 setEnabled:0];
  }

  [v18 alwaysOnVPN];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v18 alwaysOnVPN];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setEnabled:0];
  }

  [v18 contentFilter];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v18 contentFilter];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setEnabled:0];
  }

  [v18 dnsProxy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v18 dnsProxy];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setEnabled:0];
  }

  [v18 dnsSettings];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v18 dnsSettings];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setEnabled:0];
  }

  [v18 appPush];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [v18 appPush];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setEnabled:0];
  }

  [v18 relay];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    [v18 relay];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setEnabled:0];
  }
}

+ (void)updateFlags:(void *)a3 withConfiguration:
{
  id v60 = a3;
  objc_opt_self();
  [v60 VPN];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v60;
  if (!v5) {
    goto LABEL_13;
  }
  [v60 VPN];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v7 isEnabled] & 1) == 0)
  {
LABEL_12:

    id v6 = v60;
    goto LABEL_13;
  }

  [v60 VPN];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 isOnDemandEnabled];
  if ((v9 & 1) == 0)
  {
    [v60 VPN];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v3 isDisconnectOnDemandEnabled])
    {

      goto LABEL_12;
    }
  }

  [v60 VPN];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 onDemandRules];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v9 & 1) == 0) {
  id v6 = v60;
  }
  if (v11)
  {
    *a2 |= 0x8000000000000000LL;
    [v60 VPN];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 isOnDemandEnabled];

    id v6 = v60;
    if (v13)
    {
      [v60 VPN];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 onDemandRules];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 indexOfObjectPassingTest:&__block_literal_global_73];

      id v6 = v60;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        *a2 |= 0x40000000000000uLL;
      }
    }
  }

- (void)postChangeNotificationWithGeneration:(uint64_t)a3 andFlags:(int)a4 onlyIfChanged:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  -[NEConfigurationManager registerForChangeNotifications](a1);
  int v8 = a1[7];
  if (v8 == -1) {
    return;
  }
  if (a4)
  {
    uint64_t state64 = 0LL;
    if (!notify_get_state(v8, &state64) && (a3 & 0xFFE0000000000000LL | (unint64_t)a2) == state64)
    {
      ne_log_obj();
      char v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        return;
      }

      *(_DWORD *)buf = 134217984;
      unint64_t v30 = (const char *)state64;
      id v10 = "Not posting a change notification because the current notify state is equal to the new notify state (%llx)";
      id v11 = (os_log_s *)v9;
      uint32_t v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_13;
    }

    int v8 = a1[7];
  }

  uint32_t v13 = notify_set_state(v8, a3 & 0xFFE0000000000000LL | (unint64_t)a2);
  if (v13)
  {
    uint32_t v14 = v13;
    ne_log_obj();
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
    {
      int v27 = a1[7];
      *(_DWORD *)buf = 136315650;
      unint64_t v30 = "com.apple.neconfigurationchanged";
      __int16 v31 = 1024;
      int v32 = v27;
      __int16 v33 = 1024;
      uint32_t v34 = v14;
      _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v9,  OS_LOG_TYPE_FAULT,  "Failed to set the %s (token %u) notification state: %u",  buf,  0x18u);
    }

    goto LABEL_13;
  }

  uint32_t v15 = notify_post("com.apple.neconfigurationchanged");
  ne_log_obj();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v30 = "com.apple.neconfigurationchanged";
      _os_log_fault_impl(&dword_1876B1000, v17, OS_LOG_TYPE_FAULT, "Failed to post the %s notification", buf, 0xCu);
    }

    return;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = a2;
    _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEFAULT, "Successfully posted generation %lld", buf, 0xCu);
  }

  if (a3 < 0)
  {
    ne_log_obj();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1876B1000, v18, OS_LOG_TYPE_DEFAULT, "On Demand configuration is enabled", buf, 2u);
    }

    if ((a3 & 0x80000000000000LL) == 0)
    {
LABEL_23:
      if ((a3 & 0x4000000000000000LL) == 0) {
        goto LABEL_24;
      }
      goto LABEL_38;
    }
  }

  else if ((a3 & 0x80000000000000LL) == 0)
  {
    goto LABEL_23;
  }

  ne_log_obj();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1876B1000, v19, OS_LOG_TYPE_DEFAULT, "VPN IncludeAllNetworks configuration is enabled", buf, 2u);
  }

  if ((a3 & 0x4000000000000000LL) == 0)
  {
LABEL_24:
    if ((a3 & 0x2000000000000000LL) == 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }

uint64_t __56__NEConfigurationManager_updateFlags_withConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __81__NEConfigurationManager_handleFileRemovedWithCompletionQueue_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    unint64_t v3 = *(void *)(v2 + 104);
  }
  else {
    unint64_t v3 = 0LL;
  }
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "handleFileRemoved\n", v6, 2u);
  }

  if (v3 <= 0x1FFFFFFFFFFFFELL) {
    uint64_t v5 = v3 + 1;
  }
  else {
    uint64_t v5 = 1LL;
  }

  -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]( *(_DWORD **)(a1 + 32),  (const char *)v5,  0LL,  0);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), *(dispatch_block_t *)(a1 + 48));
}

void __53__NEConfigurationManager_setChangedQueue_andHandler___block_invoke(uint64_t a1, const char *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 64LL);
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5) {
      objc_setProperty_atomic_copy(v5, v4, *(id *)(a1 + 48), 72LL);
    }
  }

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke( uint64_t a1,  void *a2)
{
  v32[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      char v29 = v17;
      __int16 v30 = 2112;
      id v31 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@: Failed to get the configuration index while removing configuration %@: %@",  buf,  0x20u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_185;
    v18[3] = &unk_18A0908C8;
    id v6 = *(void **)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v19 = v3;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v18);
  }

  else
  {
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    ne_log_obj();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      char v29 = v10;
      _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: Removing configuration %@", buf, 0x16u);
    }

    id v11 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) identifier];
    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    [MEMORY[0x189603F18] arrayWithObjects:v32 count:1];
    uint32_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEConfigurationManager clearLoadedConfigurationsWithIDs:](v11, v13);

    [*(id *)(a1 + 40) identifier];
    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 getUUIDBytes:buf];

    xpc_dictionary_set_int64(v7, "config-operation", 4LL);
    xpc_dictionary_set_uuid(v7, "config-identifier", buf);
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_183;
    v21[3] = &unk_18A08BA80;
    uint32_t v15 = *(void **)(a1 + 40);
    int v22 = *(void **)(a1 + 32);
    id v23 = v15;
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 56);
    -[NEConfigurationManager sendRequest:responseHandler:](v22, v7, v21);
  }
}

void __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_183( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (a2) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 11LL;
  }
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v8, 0LL),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = v21;
      __int16 v29 = 2112;
      __int16 v30 = v10;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "%@: Failed to remove configuration %@: %@",  buf,  0x20u);
    }
  }

  else
  {
    ne_log_obj();
    uint32_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v13;
      __int16 v27 = 2112;
      __int16 v28 = v14;
      _os_log_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEFAULT, "%@: Successfully removed configuration %@", buf, 0x16u);
    }

    uint32_t v15 = *(void **)(a1 + 40);
    if (v15) {
      -[NEConfiguration clearKeychainInDomain:](v15, 1LL);
    }
    id v10 = 0LL;
  }

  uint64_t v16 = *(void *)(a1 + 32);
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_184;
  v22[3] = &unk_18A0908C8;
  uint64_t v17 = *(void **)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v23 = v10;
  id v24 = v18;
  id v19 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v16, v17, v22);
}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_185( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __74__NEConfigurationManager_removeConfiguration_withCompletionQueue_handler___block_invoke_184( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (void *)objc_opt_class();
      uint64_t v8 = a1 + 40;
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(v8 + 8);
      id v9 = v5;
      [v6 name];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138413058;
      uint32_t v12 = v5;
      __int16 v13 = 2080;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ saveConfiguration: failed to remove old %s config: %@: %@",  (uint8_t *)&v11,  0x2Au);
    }
  }
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_161( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_164( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_165( uint64_t a1,  void *a2)
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v110 = v34;
      __int16 v111 = 2112;
      unint64_t v112 = v35;
      __int16 v113 = 2112;
      uint64_t v114 = (uint64_t)v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@: Failed to get the configuration index while saving configuration %@: %@",  buf,  0x20u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    v87[0] = MEMORY[0x1895F87A8];
    v87[1] = 3221225472LL;
    v87[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_181;
    v87[3] = &unk_18A0908C8;
    uint64_t v7 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    id v88 = v4;
    id v89 = v8;
    id v9 = v4;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v6, v7, v87);

    id v10 = v89;
    goto LABEL_56;
  }

  int v11 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) identifier];
  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = -[NEConfigurationManager configurationHasChanged:](v11, v12);

  if (!(_DWORD)v11)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v13, 80LL, 1);
    }
    uint64_t v20 = *(void **)(a1 + 40);
    id v21 = Property;
    [v20 identifier];
    int v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 objectForKeyedSubscript:v22];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    ne_log_obj();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v110 = v24;
      __int16 v111 = 2112;
      unint64_t v112 = v25;
      __int16 v113 = 2112;
      uint64_t v114 = (uint64_t)v9;
      _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ Saving configuration %@ with existing signature %@",  buf,  0x20u);
    }

    uint64_t v26 = *(void **)(a1 + 40);
    if (v26)
    {
      -[NEConfiguration syncWithKeychainInDomain:](v26, 1LL);
      uint64_t v26 = *(void **)(a1 + 40);
    }

    [v26 generateSignature];
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v27;
    __int16 v28 = *(void **)(a1 + 40);
    if (v28)
    {
      uint64_t v29 = [*(id *)(a1 + 40) VPN];
      if (!v29) {
        goto LABEL_21;
      }
      __int16 v30 = (void *)v29;
      [v28 VPN];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 protocol];
      int v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        [v28 VPN];
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
LABEL_21:
        uint64_t v36 = [v28 appVPN];
        if (!v36) {
          goto LABEL_26;
        }
        int v37 = (void *)v36;
        [v28 appVPN];
        int v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 protocol];
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
LABEL_26:
          [v28 alwaysOnVPN];
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            __int128 v107 = 0u;
            __int128 v108 = 0u;
            __int128 v105 = 0u;
            __int128 v106 = 0u;
            [v28 alwaysOnVPN];
            id v44 = (void *)objc_claimAutoreleasedReturnValue();
            [v44 interfaceProtocolMapping];
            id v45 = (void *)objc_claimAutoreleasedReturnValue();

            id obj = v45;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v105 objects:buf count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v106;
              while (2)
              {
                for (uint64_t i = 0LL; i != v47; ++i)
                {
                  if (*(void *)v106 != v48) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v50 = *(void *)(*((void *)&v105 + 1) + 8 * i);
                  uint64_t v51 = [v28 alwaysOnVPN];
                  [(id)v51 interfaceProtocolMapping];
                  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
                  [v52 objectForKeyedSubscript:v50];
                  SEL v53 = (void *)objc_claimAutoreleasedReturnValue();

                  LOBYTE(v51) = [v53 needToUpdateKeychain];
                  if ((v51 & 1) != 0)
                  {

                    goto LABEL_40;
                  }
                }

                uint64_t v47 = [obj countByEnumeratingWithState:&v105 objects:buf count:16];
                if (v47) {
                  continue;
                }
                break;
              }
            }
          }

          goto LABEL_36;
        }

        [v28 appVPN];
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      __int128 v40 = v33;
      [v33 protocol];
      SCNetworkServiceRef v41 = (void *)objc_claimAutoreleasedReturnValue();
      char v42 = [v41 needToUpdateKeychain];

      if ((v42 & 1) != 0)
      {
LABEL_40:
        id v60 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
        [v60 encodeObject:*(void *)(a1 + 40) forKey:@"config-object"];
        [v60 finishEncoding];
        [v60 encodedData];
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)[v63 length] <= 0x80000)
        {
          if ((unint64_t)[v63 length] <= 0x80000)
          {
            xpc_object_t v69 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_int64(v69, "config-operation", 3LL);
            xpc_dictionary_set_data( v69,  "config-data",  (const void *)[v63 bytes],  objc_msgSend(v63, "length"));
            if (v9)
            {
              id v76 = v9;
              xpc_dictionary_set_data( v69,  "config-signature",  (const void *)[v76 bytes],  objc_msgSend(v76, "length"));
            }

            uint64_t v77 = *(void **)(a1 + 40);
            if (v77)
            {
              int64_t v78 = v77[20];
              if (v78)
              {
                xpc_dictionary_set_int64(v69, "permission-type", v78);
                uint64_t v77 = *(void **)(a1 + 40);
              }
            }

            uint64_t v79 = *(void **)(a1 + 32);
            v90[0] = MEMORY[0x1895F87A8];
            v90[1] = 3221225472LL;
            v90[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_177;
            v90[3] = &unk_18A08BA80;
            v90[4] = v79;
            id v91 = v77;
            id v92 = *(id *)(a1 + 48);
            id v93 = *(id *)(a1 + 56);
            -[NEConfigurationManager sendRequest:responseHandler:](v79, v69, v90);

            __int128 v70 = v91;
          }

          else
          {
            ne_log_obj();
            id v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              uint64_t v83 = *(void *)(a1 + 32);
              [*(id *)(a1 + 40) identifier];
              uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v85 = [v63 length];
              *(_DWORD *)buf = 138412802;
              uint64_t v110 = v83;
              __int16 v111 = 2112;
              unint64_t v112 = v84;
              __int16 v113 = 2048;
              uint64_t v114 = v85;
              _os_log_error_impl( &dword_1876B1000,  v71,  OS_LOG_TYPE_ERROR,  "%@ Configuration %@ is too large (%lu)",  buf,  0x20u);
            }

            uint64_t v72 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"The configuration is too large (%lu bytes). The maximum size is %d bytes",  objc_msgSend(v63, "length"),  0x80000);
            uint64_t v73 = *(void *)(a1 + 32);
            v94[0] = MEMORY[0x1895F87A8];
            v94[1] = 3221225472LL;
            v94[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_173;
            v94[3] = &unk_18A08FB50;
            uint64_t v74 = *(void **)(a1 + 48);
            id v75 = *(id *)(a1 + 56);
            id v95 = v72;
            id v96 = v75;
            void v94[4] = *(void *)(a1 + 32);
            xpc_object_t v69 = v72;
            -[NEConfigurationManager executeCallbackOnQueue:callback:](v73, v74, v94);

            __int128 v70 = v96;
          }
        }

        else
        {
          ne_log_obj();
          __int128 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            uint64_t v80 = *(void *)(a1 + 32);
            [*(id *)(a1 + 40) identifier];
            __int128 v81 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v82 = [v63 length];
            *(_DWORD *)buf = 138412802;
            uint64_t v110 = v80;
            __int16 v111 = 2112;
            unint64_t v112 = v81;
            __int16 v113 = 2048;
            uint64_t v114 = v82;
            _os_log_error_impl( &dword_1876B1000,  v64,  OS_LOG_TYPE_ERROR,  "%@ Configuration %@ is too large (%lu)",  buf,  0x20u);
          }

          __int128 v65 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"The configuration is too large (%lu bytes). The maximum size is %d bytes",  objc_msgSend(v63, "length"),  0x80000);
          uint64_t v66 = *(void *)(a1 + 32);
          v97[0] = MEMORY[0x1895F87A8];
          v97[1] = 3221225472LL;
          v97[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_172;
          v97[3] = &unk_18A08FB50;
          id v67 = *(void **)(a1 + 48);
          id v68 = *(id *)(a1 + 56);
          id v98 = v65;
          id v99 = v68;
          v97[4] = *(void *)(a1 + 32);
          xpc_object_t v69 = v65;
          -[NEConfigurationManager executeCallbackOnQueue:callback:](v66, v67, v97);

          __int128 v70 = v99;
        }

LABEL_55:
        goto LABEL_56;
      }
    }

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_166( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_167( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 9LL, 0LL);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_172( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 2LL, *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_173( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 2LL, *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_2_177( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (a2) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = 11LL;
  }
  if (v8
    && (-[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), v8, 0LL),
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = (void *)v9;
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      uint64_t v34 = v23;
      __int16 v35 = 2112;
      uint64_t v36 = v24;
      __int16 v37 = 2112;
      int v38 = v10;
      _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to save configuration %@: %@", buf, 0x20u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    v29[0] = MEMORY[0x1895F87A8];
    v29[1] = 3221225472LL;
    v29[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_178;
    v29[3] = &unk_18A0908C8;
    __int16 v13 = *(void **)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v30 = v10;
    id v31 = v14;
    id v15 = v10;
    -[NEConfigurationManager executeCallbackOnQueue:callback:](v12, v13, v29);
  }

  else
  {
    ne_log_obj();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v18;
      _os_log_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEFAULT, "%@ Successfully saved configuration %@", buf, 0x16u);
    }

    uint64_t v19 = *(_BYTE **)(a1 + 32);
    [*(id *)(a1 + 40) identifier];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    int v32 = v20;
    [MEMORY[0x189603F18] arrayWithObjects:&v32 count:1];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_179;
    v25[3] = &unk_18A08BA08;
    int v22 = *(void **)(a1 + 40);
    v25[4] = *(void *)(a1 + 32);
    id v26 = v22;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v19, v21, v25);
  }
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_181( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_178( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_179( uint64_t a1,  void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) name];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 40) identifier];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ Failed to load %@ (%@) after saving it: %@",  buf,  0x2Au);
    }
  }

  uint64_t v5 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_180;
  v10[3] = &unk_18A090940;
  uint64_t v6 = *(void **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v5, v6, v10);
}

uint64_t __72__NEConfigurationManager_saveConfiguration_withCompletionQueue_handler___block_invoke_180( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v5 || !objc_getProperty(v5, v3, 88LL, 1)) {
    goto LABEL_7;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 88LL, 1);
  }
  uint64_t v8 = [Property allValues];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithArray:v8];
  }

  else
  {
LABEL_7:
    id v10 = 0LL;
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2;
  v16[3] = &unk_18A08FB50;
  id v13 = *(id *)(a1 + 48);
  id v18 = v4;
  id v19 = v13;
  id v17 = v10;
  id v14 = v4;
  id v15 = v10;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v11, v12, v16);
}

uint64_t __72__NEConfigurationManager_loadConfigurationsWithCompletionQueue_handler___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = *(id *)(a1 + 32);
  if (v5)
  {
    if (objc_getProperty(v5, v3, 88LL, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 88LL, 1);
      }
      [Property objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        uint64_t v36 = a1;
        id v37 = v4;
        uint64_t v9 = *(void **)(a1 + 32);
        id v11 = v8;
        if (v9)
        {
          objc_msgSend(objc_getProperty(v9, v10, 56, 1), "objectForKeyedSubscript:", @"UserMap");
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v44;
            do
            {
              for (uint64_t i = 0LL; i != v16; ++i)
              {
                if (*(void *)v44 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                objc_msgSend(v14, "objectForKeyedSubscript:", v19, v36, v37);
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
                [v11 identifier];
                id v21 = (void *)objc_claimAutoreleasedReturnValue();
                int v22 = [v20 containsObject:v21];

                if (v22) {
                  [v13 addObject:v19];
                }
              }

              uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:buf count:16];
            }

            while (v16);
          }

          if ([v13 count]) {
            uint64_t v23 = v13;
          }
          else {
            uint64_t v23 = 0LL;
          }
          id v24 = v23;
        }

        else
        {
          id v24 = 0LL;
        }

        a1 = v36;
        id v4 = v37;
        goto LABEL_28;
      }
    }

    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 56LL, 1);
    }
  }

  [v5 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 objectForKeyedSubscript:@"Signature"];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    ne_log_obj();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      uint64_t v35 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = v35;
      __int16 v49 = 2112;
      id v50 = v4;
      _os_log_fault_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_FAULT,  "Failed to load configuration with identifier %@: %@",  buf,  0x16u);
    }
  }

  id v11 = 0LL;
  id v24 = 0LL;
LABEL_28:

  uint64_t v29 = *(void *)(a1 + 32);
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_154;
  v38[3] = &unk_18A08F2B8;
  id v30 = *(void **)(a1 + 48);
  id v31 = *(id *)(a1 + 56);
  id v39 = v11;
  id v40 = v24;
  id v41 = v4;
  id v42 = v31;
  id v32 = v4;
  id v33 = v24;
  id v34 = v11;
  -[NEConfigurationManager executeCallbackOnQueue:callback:](v29, v30, v38);
}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __85__NEConfigurationManager_loadConfigurationAndUserWithID_withCompletionQueue_handler___block_invoke_154( void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16LL))(a1[7], a1[4], a1[5], a1[6]);
}

void __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = *(id *)(a1 + 32);
  if (!v5)
  {
LABEL_8:
    [v5 objectForKeyedSubscript:@"ConfigurationProperties"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"Signature"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ne_log_obj();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        id v26 = v4;
        _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "Failed to load configuration with identifier %@: %@",  buf,  0x16u);
      }
    }

    uint64_t v8 = 0LL;
    goto LABEL_13;
  }

  if (!objc_getProperty(v5, v3, 88LL, 1)) {
    goto LABEL_6;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v6, 88LL, 1);
  }
  [Property objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_6:
    id v5 = *(id *)(a1 + 32);
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 56LL, 1);
    }
    goto LABEL_8;
  }

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

uint64_t __78__NEConfigurationManager_loadConfigurationWithID_withCompletionQueue_handler___block_invoke_153( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (!v5)
  {
    uint64_t v6 = 0LL;
LABEL_33:
    int v38 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_34;
  }

  uint64_t v6 = v5[13];
  if (!objc_getProperty(v5, v3, 88LL, 1)) {
    goto LABEL_33;
  }
  uint64_t v7 = -[NEConfigurationManager filterIndexWithFilter:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (!v7) {
    goto LABEL_33;
  }
  uint64_t v8 = (void *)v7;
  [*(id *)(a1 + 40) objectForKeyedSubscript:@"filtering-only"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 BOOLValue];

  id v11 = *(id *)(a1 + 48);
  __int128 v44 = v8;
  [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 allKeys];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v14, 88LL, 1);
    }
    [Property allKeys];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v45 = v6;
  id v46 = v4;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v17)
  {
    uint64_t v19 = 0LL;
    goto LABEL_31;
  }

  uint64_t v18 = v17;
  uint64_t v19 = 0LL;
  uint64_t v20 = *(void *)v55;
  uint64_t v47 = v13;
  do
  {
    for (uint64_t i = 0LL; i != v18; ++i)
    {
      if (*(void *)v55 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
      if ([v13 containsObject:v22])
      {
        id v24 = *(id *)(a1 + 32);
        if (v24) {
          id v24 = objc_getProperty(v24, v23, 88LL, 1);
        }
        [v24 objectForKeyedSubscript:v22];
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = v25;
        if (!v25) {
          goto LABEL_26;
        }
        if ((_DWORD)v10)
        {
          id v27 = v16;
          id v28 = v19;
          uint64_t v29 = a1;
          uint64_t v30 = v10;
          uint64_t v31 = [v25 contentFilter];
          if (!v31) {
            goto LABEL_21;
          }
          id v32 = (void *)v31;
          [v26 VPN];
          id v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {

LABEL_21:
            uint64_t v10 = v30;
            a1 = v29;
            uint64_t v19 = v28;
            id v16 = v27;
            uint64_t v13 = v47;
LABEL_26:

            continue;
          }

          [v26 appVPN];
          id v34 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v10 = v30;
          a1 = v29;
          uint64_t v19 = v28;
          id v16 = v27;
          uint64_t v13 = v47;
          if (v34) {
            goto LABEL_26;
          }
        }

        if (!v19)
        {
          id v35 = objc_alloc(MEMORY[0x189603FA8]);
          uint64_t v36 = [*(id *)(a1 + 48) count];
          id v37 = v35;
          uint64_t v13 = v47;
          uint64_t v19 = (void *)[v37 initWithCapacity:v36];
        }

        [v19 addObject:v26];
        goto LABEL_26;
      }
    }

    uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  }

  while (v18);
LABEL_31:

  uint64_t v6 = v45;
  id v4 = v46;
  int v38 = v44;
LABEL_34:
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2;
  block[3] = &unk_18A08BA30;
  id v39 = *(dispatch_queue_s **)(a1 + 56);
  id v40 = *(id *)(a1 + 64);
  id v49 = v19;
  id v50 = v4;
  id v52 = v40;
  uint64_t v53 = v6;
  id v51 = v38;
  id v41 = v38;
  id v42 = v4;
  id v43 = v19;
  dispatch_async(v39, block);
}

uint64_t __90__NEConfigurationManager_loadConfigurations_withFilter_completionQueue_completionHandler___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16LL))( a1[7],  a1[4],  a1[5],  a1[8],  a1[6]);
}

void __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 104);
  }
  else {
    uint64_t v4 = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2;
  block[3] = &unk_18A08FCA0;
  id v5 = *(dispatch_queue_s **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v9 = v2;
  id v10 = v6;
  uint64_t v11 = v4;
  id v7 = v2;
  dispatch_async(v5, block);
}

uint64_t __70__NEConfigurationManager_loadIndexWithFilter_completionQueue_handler___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16LL))(a1[5], a1[4], a1[6]);
}

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_2( uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  _DWORD v5[2] = __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3;
  v5[3] = &unk_18A08FE20;
  uint64_t v3 = *(void **)(a1 + 40);
  id v6 = *(_BYTE **)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v2;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  uint64_t v4 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v6, 0LL, v5);
}

void __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  id v63 = a2;
  if (v63)
  {
    ne_log_obj();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v88 = "-[NEConfigurationManager syncConfigurationsWithSC:completionQueue:completionHandler:]_block_invoke_3";
      __int16 v89 = 2112;
      id v90 = v63;
      _os_log_error_impl(&dword_1876B1000, v3, OS_LOG_TYPE_ERROR, "%s failed to load configurations: %@", buf, 0x16u);
    }

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_142( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  xpc_object_t v4 = (objc_class *)MEMORY[0x189607AB8];
  id v5 = a3;
  id v6 = objc_alloc(v4);
  bytes = xpc_uuid_get_bytes(v5);

  uint64_t v8 = (void *)[v6 initWithUUIDBytes:bytes];
  id v9 = *(const __SCPreferences **)(a1 + 56);
  [v8 UUIDString];
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = SCNetworkServiceCopy(v9, v10);

  CFTypeID TypeID = SCNetworkServiceGetTypeID();
  if (v11 && CFGetTypeID(v11) == TypeID && _SCNetworkServiceIsVPN())
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v13, 80LL, 1);
    }
    [Property objectForKeyedSubscript:v8];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v17 = *(id *)(a1 + 32);
      if (v17) {
        id v17 = objc_getProperty(v17, v15, 88LL, 1);
      }
      [v17 objectForKeyedSubscript:v8];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = (NEConfiguration *)[v18 copy];

      if (!v19) {
        goto LABEL_41;
      }
      ne_log_obj();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[NEConfiguration name](v19, "name");
        id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int v39 = 138412290;
        Name = v21;
        _os_log_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_INFO,  "Updating configuration %@ from the corresponding SCNetworkService",  (uint8_t *)&v39,  0xCu);
      }

      int v22 = -[NEConfiguration updateFromSCService:](v19, v11);
    }

    else
    {
      ne_log_obj();
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412290;
        Name = (__CFString *)SCNetworkServiceGetName(v11);
        uint64_t v29 = Name;
        _os_log_impl( &dword_1876B1000,  v28,  OS_LOG_TYPE_INFO,  "Creating a new configuration corresponding to SCNetworkService \"%@\"",  (uint8_t *)&v39,  0xCu);
      }

      uint64_t v19 = objc_alloc(&OBJC_CLASS___NEConfiguration);
      if (v19)
      {
        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:SCNetworkServiceGetServiceID(v11)];
        SEL v31 = -[NEConfiguration initWithIdentifier:]((id *)&v19->super.isa, v30);
        id v32 = v31;
        else {
          uint64_t v19 = v32;
        }
      }

      int v22 = v19 != 0LL;
      if (!v19) {
        goto LABEL_41;
      }
    }

    if (v22)
    {
      -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:]( *(void *)(a1 + 32),  v19,  0LL,  v16,  *(void **)(a1 + 40),  0,  0);
      SEL v33 = (NEConfiguration *)objc_claimAutoreleasedReturnValue();
      id v34 = v33;
      if (v33)
      {
        if (-[NEConfiguration code](v33, "code") != 9)
        {
          ne_log_obj();
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            -[NEConfiguration name](v19, "name");
            int v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            int v39 = 138412546;
            Name = v38;
            __int16 v41 = 2112;
            id v42 = v34;
            _os_log_error_impl( &dword_1876B1000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to save configuration %@: %@",  (uint8_t *)&v39,  0x16u);
          }
        }
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      }
    }

uint64_t __85__NEConfigurationManager_syncConfigurationsWithSC_completionQueue_completionHandler___block_invoke_144( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke( uint64_t a1)
{
  id v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_18A08FE20;
  uint64_t v3 = *(void **)(a1 + 40);
  id v7 = *(_BYTE **)(a1 + 32);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  id v10 = v2;
  id v11 = v4;
  id v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v7, 0LL, v6);
}

void __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  SCPreferencesRef v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"NEConfigurationManager remove prefs", 0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      LODWORD(v25) = 1795;
      _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u)) {
      goto LABEL_13;
    }
    uint64_t v5 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v5), v5);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "SCPreferencesLock failed while removing a configuration: %@",  buf,  0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }

  else
  {
    uint64_t v9 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v9), v9);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
LABEL_18:
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(const char **)(a1 + 32);
      [*(id *)(a1 + 40) UUIDString];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      id v23 = v13;
      __int16 v24 = 2112;
      __int16 v25 = v14;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "%@ Failed to remove configuration %@ from disk: %@",  buf,  0x20u);
    }

    goto LABEL_23;
  }

  uint64_t v3 = 0LL;
LABEL_13:
  -[NEConfigurationManager removeConfigurationFromDisk:updateSCPreferences:]( *(_BYTE **)(a1 + 32),  *(void **)(a1 + 40),  v3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[NEConfigurationManager removeConfigurationFromDisk:completionQueue:completionHandler:]_block_invoke";
      __int16 v24 = 1024;
      LODWORD(v25) = 1811;
      _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }

  if (v8) {
    goto LABEL_18;
  }
  ne_log_obj();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(const char **)(a1 + 32);
    [*(id *)(a1 + 40) UUIDString];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v23 = v15;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_INFO,  "%@ Successfully removed configuration %@ from disk",  buf,  0x16u);
  }

  id v8 = 0LL;
LABEL_23:

  id v17 = *(dispatch_queue_s **)(a1 + 48);
  if (v17)
  {
    uint64_t v18 = *(void **)(a1 + 64);
    if (v18)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_138;
      block[3] = &unk_18A0908C8;
      id v21 = v18;
      id v20 = v8;
      dispatch_async(v17, block);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __88__NEConfigurationManager_removeConfigurationFromDisk_completionQueue_completionHandler___block_invoke_138( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke( uint64_t a1)
{
  SCPreferencesRef v2 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2;
  v6[3] = &unk_18A08B990;
  uint64_t v3 = *(void **)(a1 + 40);
  id v7 = *(_BYTE **)(a1 + 32);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  char v14 = *(_BYTE *)(a1 + 80);
  id v11 = *(id *)(a1 + 64);
  id v4 = *(id *)(a1 + 72);
  uint64_t v12 = v2;
  id v13 = v4;
  uint64_t v5 = v2;
  -[NEConfigurationManager loadConfigurationsInternal:withCompletionHandler:](v7, 0LL, v6);
}

void __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  SCPreferencesRef v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"NEConfigurationManager save prefs", 0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 1024;
      LODWORD(v31) = 1626;
      _os_log_debug_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEBUG, "%s:%d: Locking SCPreferences", buf, 0x12u);
    }

    if (SCPreferencesLock(v3, 1u)) {
      goto LABEL_13;
    }
    uint64_t v5 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v5), v5);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "SCPreferencesLock failed while saving a configuration: %@",  buf,  0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }

  else
  {
    uint64_t v9 = SCError();
    objc_msgSend(NSString, "stringWithFormat:", @"%s (%d)", SCErrorString(v9), v9);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = v6;
      _os_log_error_impl(&dword_1876B1000, v10, OS_LOG_TYPE_ERROR, "SCPreferencesCreate failed: %@", buf, 0xCu);
    }

    -[NEConfigurationManager errorWithCode:specifics:](*(void *)(a1 + 32), 12LL, v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8) {
    goto LABEL_18;
  }
  uint64_t v3 = 0LL;
LABEL_13:
  -[NEConfigurationManager saveConfigurationToDisk:updateSCPreferences:currentSignature:userUUID:notifyNow:isUpgrade:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v3,  *(void **)(a1 + 48),  *(void **)(a1 + 56),  1,  *(_BYTE *)(a1 + 88));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "-[NEConfigurationManager saveConfigurationToDisk:currentSignature:userUUID:isUpgrade:completionQueue:complet"
            "ionHandler:]_block_invoke";
      __int16 v30 = 1024;
      LODWORD(v31) = 1642;
      _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%s:%d: Unlocking SCPreferences", buf, 0x12u);
    }

    SCPreferencesUnlock(v3);
    CFRelease(v3);
  }

  if (!v8)
  {
    ne_log_obj();
    char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v20 = *(const char **)(a1 + 32);
      [*(id *)(a1 + 40) identifier];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 UUIDString];
      int v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      SEL v31 = v22;
      _os_log_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_INFO,  "%@ Successfully saved configuration %@ to disk",  buf,  0x16u);
    }

    id v8 = 0LL;
    goto LABEL_27;
  }

uint64_t __120__NEConfigurationManager_saveConfigurationToDisk_currentSignature_userUUID_isUpgrade_completionQueue_completionHandler___block_invoke_135( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __40__NEConfigurationManager_postGeneration__block_invoke(uint64_t a1, void *a2)
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
      *(void *)&uint8_t buf[4] = "-[NEConfigurationManager postGeneration]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%s: failed to load the configurations: %@",  buf,  0x16u);
    }

    goto LABEL_22;
  }

  *(void *)buf = 0LL;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v3, 88LL, 1);
  }
  id v7 = Property;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = *(id *)(a1 + 32);
        if (v13) {
          id v13 = objc_getProperty(v13, v8, 88LL, 1);
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", v12, (void)v16);
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NEConfigurationManager updateFlags:withConfiguration:]( (uint64_t)&OBJC_CLASS___NEConfigurationManager,  (unint64_t *)buf,  v14);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }

    while (v9);
    uint64_t v9 = *(void *)buf;

    if ((v9 & 0x3080000000000000LL) != 0) {
      goto LABEL_20;
    }
  }

  else
  {
  }

  NEPolicySetDropPriorityLevel(0LL, 1);
LABEL_20:
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    -[NEConfigurationManager postChangeNotificationWithGeneration:andFlags:onlyIfChanged:]( (_DWORD *)v15,  *(const char **)(v15 + 104),  v9,  1);
  }
LABEL_22:
}

- (char)initWithUserUUID:(char *)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_20;
  }
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_CLASS___NEConfigurationManager;
  a1 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (!a1) {
    goto LABEL_20;
  }
  id v4 = SecTaskCreateFromSelf(0LL);
  uint64_t v5 = [v3 copy];
  id v6 = (void *)*((void *)a1 + 17);
  *((void *)a1 + 17) = v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v8 = dispatch_queue_create("NEConfigurationManager_inner", v7);
  uint64_t v9 = (void *)*((void *)a1 + 5);
  *((void *)a1 + 5) = v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v11 = dispatch_queue_create("NEConfigurationManager_outer", v10);
  uint64_t v12 = (void *)*((void *)a1 + 6);
  *((void *)a1 + 6) = v11;

  *((_DWORD *)a1 + 7) = -1;
  id v13 = (void *)*((void *)a1 + 1);
  *((void *)a1 + 1) = &stru_18A0915E8;

  *(_WORD *)(a1 + 21) = 0;
  char v14 = a1 + 21;
  *((_DWORD *)a1 + 4) = 0;
  if (v4)
  {
    CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.developer.networking.vpn.api", 0LL);
    if (!v15)
    {
      CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.developer.networking.networkextension", 0LL);
      if (!v15)
      {
        CFTypeRef v15 = SecTaskCopyValueForEntitlement(v4, @"com.apple.private.AuthorizationServices", 0LL);
        if (!v15)
        {
LABEL_9:
          CFTypeRef v16 = SecTaskCopyValueForEntitlement(v4, @"com.apple.private.neconfiguration-write-access", 0LL);
          CFTypeID TypeID = CFBooleanGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == TypeID && CFBooleanGetValue((CFBooleanRef)v16)) {
              a1[23] = 1;
            }
            CFRelease(v16);
          }

          CFRelease(v4);
          goto LABEL_15;
        }

        char v14 = a1 + 22;
      }
    }

    _BYTE *v14 = 1;
    CFRelease(v15);
    goto LABEL_9;
  }

+ (id)sharedManager
{
  if (sharedManager_init_manager != -1) {
    dispatch_once(&sharedManager_init_manager, &__block_literal_global_1072);
  }
  return (id)sharedManager_g_manager;
}

+ (id)sharedManagerForAllUsers
{
  if (sharedManagerForAllUsers_init_manager != -1) {
    dispatch_once(&sharedManagerForAllUsers_init_manager, &__block_literal_global_21);
  }
  return (id)sharedManagerForAllUsers_g_manager;
}

+ (id)networkPrivacyConfigurationName
{
  return @"com.apple.preferences.networkprivacy";
}

void __50__NEConfigurationManager_sharedManagerForAllUsers__block_invoke()
{
  v0 = -[NEConfigurationManager initWithUserUUID:]((char *)objc_alloc(&OBJC_CLASS___NEConfigurationManager), 0LL);
  uint64_t v1 = (void *)sharedManagerForAllUsers_g_manager;
  sharedManagerForAllUsers_g_manager = (uint64_t)v0;
}

void __39__NEConfigurationManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NEConfigurationManager);
  uint64_t v1 = (void *)sharedManager_g_manager;
  sharedManager_g_manager = (uint64_t)v0;
}

@end
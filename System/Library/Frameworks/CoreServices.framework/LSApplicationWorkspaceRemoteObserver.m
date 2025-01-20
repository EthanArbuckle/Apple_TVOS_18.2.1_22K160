@interface LSApplicationWorkspaceRemoteObserver
+ (BOOL)supportsSecureCoding;
- (BOOL)isObservinglsd;
- (BOOL)messageObserversWithSelector:(SEL)a3;
- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4;
- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4 filterLaunchProhibited:(BOOL)a5;
- (LSApplicationWorkspaceRemoteObserver)init;
- (LSApplicationWorkspaceRemoteObserver)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (id)localObservers;
- (unint64_t)currentObserverCount;
- (void)addLocalObserver:(id)a3;
- (void)applicationIconDidChange:(id)a3;
- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidPrioritize:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationInstallsDidUpdateIcon:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidChangePersonas:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)databaseWasRebuilt;
- (void)deviceManagementPolicyDidChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)networkUsageChanged:(BOOL)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsDidUninstall:(id)a3;
- (void)pluginsWillUninstall:(id)a3;
- (void)removeLocalObserver:(id)a3;
- (void)setObservinglsd:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation LSApplicationWorkspaceRemoteObserver

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[LSApplicationWorkspaceRemoteObserver uuid](self, "uuid");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"uuid"];
}

- (LSApplicationWorkspaceRemoteObserver)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSApplicationWorkspaceRemoteObserver;
  id v5 = -[LSApplicationWorkspaceRemoteObserver init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"uuid");
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;
  }

  return v5;
}

- (LSApplicationWorkspaceRemoteObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSApplicationWorkspaceRemoteObserver;
  v2 = -[LSApplicationWorkspaceRemoteObserver init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x189607AB8]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

    v2->_observinglsd = 0;
    uint64_t v5 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v9 = dispatch_queue_create("LSApplicationWorkspaceRemoteObserver.progress.subscriptions", v8);
    progressSubscriptionsQueue = v2->_progressSubscriptionsQueue;
    v2->_progressSubscriptionsQueue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)addLocalObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5) {
    -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  }
  objc_sync_exit(v4);
}

- (void)removeLocalObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v5) {
    -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  }
  objc_sync_exit(v4);
}

- (id)localObservers
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSHashTable allObjects](v2->_observers, "allObjects");
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)currentObserverCount
{
  v2 = self;
  objc_sync_enter(v2);
  observers = v2->_observers;
  if (observers) {
    unint64_t v4 = -[NSHashTable count](observers, "count");
  }
  else {
    unint64_t v4 = 0LL;
  }
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4 filterLaunchProhibited:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  v23 = v8;
  if (a5)
  {
    [MEMORY[0x189603F18] arrayByFilteringLaunchProhibitedAppsFrom:v8];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = v8;
  }

  v10 = v9;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v11 = -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers");
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v17 valueForKey:@"observeLaunchProhibitedApps"],
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                char v20 = [v19 BOOLValue],
                v19,
                v18 = v23,
                (v20 & 1) != 0)
            || (uint64_t v21 = objc_msgSend(v10, "count", v18), v18 = v10, v21))
          {
            objc_msgSend(v17, a3, v18);
          }

          char v14 = 1;
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }

  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)messageObserversWithSelector:(SEL)a3 andApps:(id)a4
{
  return -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:filterLaunchProhibited:]( self,  "messageObserversWithSelector:andApps:filterLaunchProhibited:",  a3,  a4,  1LL);
}

- (BOOL)messageObserversWithSelector:(SEL)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0LL);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [v10 a3];
          char v7 = 1;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidStart", v6);
}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: InstallsStarted %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  if ([*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationInstallsDidStart_ andApps:*(void *)(a1 + 32)])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = *(dispatch_queue_s **)(*(void *)(a1 + 40) + 24LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_572;
    block[3] = &unk_189D72BF0;
    id v9 = v4;
    dispatch_async(v5, block);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 messageObserversWithSelector:sel_helperPlaceholdersInstalled_ andApps:v7 filterLaunchProhibited:0];
}

void __68__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidStart___block_invoke_572(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "installProgress", (void)v6);

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }

    while (v3);
  }
}

- (void)applicationInstallsDidUpdateIcon:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  __int128 v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidUpdateIcon", v6);
}

uint64_t __73__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidUpdateIcon___block_invoke( uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: IconsUpdated %@",  (uint8_t *)&v5,  0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationInstallsDidUpdateIcon_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  __int128 v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationInstallsDidChange", v6);
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1();
  }

  [MEMORY[0x189603FA8] array];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v14 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(*((void *)&v15 + 1) + 8 * v8),  1LL);
        __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          [v9 appState];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v11 isValid])
          {
            [v10 appState];
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            int v13 = [v12 isPlaceholder];

            if (v13) {
              [v3 addObject:v10];
            }
          }

          else
          {
          }
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  _LSContextInvalidate();
  if ([v3 count]) {
    [*(id *)(v14 + 40) messageObserversWithSelector:sel_applicationInstallsDidChange_ andApps:v3];
  }
}

- (void)applicationsWillInstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillInstall", v6);
}

uint64_t __64__LSApplicationWorkspaceRemoteObserver_applicationsWillInstall___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Will install %@",  (uint8_t *)&v5,  0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsWillInstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "Received applicationsDidInstall:%@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke;
  v7[3] = &unk_189D72430;
  id v8 = v4;
  __int128 v9 = self;
  id v6 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidInstall", v7);
}

void __63__LSApplicationWorkspaceRemoteObserver_applicationsDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  _LSContextInvalidate();
  +[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v45 = 0LL;
  id v46 = 0LL;
  [v2 getKnowledgeUUID:&v46 andSequenceNumber:&v45];
  id v3 = v46;
  id v4 = v45;

  [NSString stringWithFormat:@"LaunchServices observer: Installed %@ {%@ %@}", *(void *)(a1 + 32), v3, v4];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v4;
  v38 = v3;
  if (_LSLoggingQueue_onceToken != -1) {
    dispatch_once(&_LSLoggingQueue_onceToken, &__block_literal_global_884);
  }
  id v6 = (dispatch_queue_s *)_LSLoggingQueue_logQueue;
  *(void *)&__int128 block = MEMORY[0x1895F87A8];
  *((void *)&block + 1) = 3221225472LL;
  v49 = ___LSSetCrashMessage_block_invoke;
  v50 = &unk_189D72BF0;
  id v51 = v5;
  id v7 = v5;
  dispatch_sync(v6, &block);

  v36 = v7;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  uint64_t v39 = a1;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
        [v13 bundleIdentifier];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          [v13 bundleIdentifier];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v15,  0LL);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            [v16 appState];
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ([v17 isInstalled])
            {
              [v16 bundleURL];
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 path];
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                id v20 = [v16 bundleURL];
                uint64_t v21 = (const char *)[v20 fileSystemRepresentation];

                if (v21 && access(v21, 0) && *__error() == 2)
                {
                  _LSDefaultLog();
                  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(block) = 138412290;
                    *(void *)((char *)&block + 4) = v16;
                    _os_log_error_impl( &dword_183E58000,  v22,  OS_LOG_TYPE_ERROR,  "App validation Failed: bundle path does not exist %@",  (uint8_t *)&block,  0xCu);
                  }

                  [v16 bundleIdentifier];
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  _LSLogStepAsync( 8LL,  0LL,  v23,  @"App validation failed, ignoring didInstall notification for %@",  v24,  v25,  v26,  v27,  (uint64_t)v16);
                }

                else
                {
                  [v13 bundleIdentifier];
                  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                  _LSLogStepAsync(8LL, 1LL, v29, @"applicationsDidInstall %@", v30, v31, v32, v33, (uint64_t)v16);

                  [v40 addObject:v16];
                }

                goto LABEL_24;
              }
            }

            else
            {
            }
          }

          _LSDefaultLog();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v16;
            _os_log_error_impl( &dword_183E58000,  v28,  OS_LOG_TYPE_ERROR,  "LSApplicationProxy %@ is invalid",  (uint8_t *)&block,  0xCu);
          }
        }

        else
        {
          _LSDefaultLog();
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v13;
            _os_log_error_impl( &dword_183E58000,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "LSApplicationProxy %@ is invalid (has nil identifier)",  (uint8_t *)&block,  0xCu);
          }
        }

- (void)pluginsDidInstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: Installed plugins %@", buf, 0xCu);
  }

  _LSContextInvalidate();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v11 pluginsDidInstall:v4];
        }
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToInstall", v6);
}

uint64_t __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1();
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidFailToInstall_ andApps:*(void *)(a1 + 32)];
}

- (void)pluginsWillUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Plugins will be removed: %@",  buf,  0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v11 pluginsWillUninstall:v4];
        }
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)applicationsWillUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsWillUninstall", v6);
}

uint64_t __66__LSApplicationWorkspaceRemoteObserver_applicationsWillUninstall___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Will uninstall %@",  (uint8_t *)&v5,  0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsWillUninstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidUninstall", v6);
}

void __65__LSApplicationWorkspaceRemoteObserver_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Uninstalled %@",  (uint8_t *)&v6,  0xCu);
  }

  _LSContextInvalidate();
  [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidUninstall_ andApps:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  filterProxiesForHelperPlaceholders(*(void **)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 messageObserversWithSelector:sel_helperPlaceholdersUninstalled_ andApps:v5 filterLaunchProhibited:0];
}

- (void)pluginsDidUninstall:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: Uninstalled plugins %@",  buf,  0xCu);
  }

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0LL);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v11 pluginsDidUninstall:v4];
        }
        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidFailToUninstall", v6);
}

uint64_t __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidFailToUninstall_ andApps:*(void *)(a1 + 32)];
}

- (void)applicationInstallsArePrioritized:(id)a3 arePaused:(id)a4
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  _LSInstallLog();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.3();
  }

  _LSInstallLog();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.2();
  }

  _LSInstallLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationWorkspaceRemoteObserver applicationInstallsArePrioritized:arePaused:].cold.1();
  }

  id v46 = (void *)objc_opt_new();
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v46 addObject:v16];
        }
      }

      uint64_t v13 = [v11 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }

    while (v13);
  }

  if ([v46 count])
  {
    id v45 = v7;
    __int128 v17 = (void *)objc_opt_new();
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v44 = v6;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v56;
      do
      {
        for (uint64_t j = 0LL; j != v20; ++j)
        {
          if (*(void *)v56 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v55 + 1) + 8 * j);
          +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v23,  v44);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v24 appState];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          char v26 = [v25 isValid];

          if ((v26 & 1) != 0)
          {
            [v17 addObject:v24];
          }

          else
          {
            _LSInstallLog();
            uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v66 = v23;
              __int16 v67 = 2112;
              v68 = v24;
              _os_log_error_impl( &dword_183E58000,  v27,  OS_LOG_TYPE_ERROR,  "Couldn't instantiate valid proxy for %@ when processing active installs, got %@",  buf,  0x16u);
            }
          }
        }

        uint64_t v20 = [v18 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }

      while (v20);
    }

    v28 = (void *)objc_opt_new();
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v29 = v45;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      do
      {
        for (uint64_t k = 0LL; k != v31; ++k)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v51 + 1) + 8 * k);
          +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v34,  v44);
          dispatch_time_t v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 appState];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          char v37 = [v36 isValid];

          if ((v37 & 1) != 0)
          {
            [v28 addObject:v35];
          }

          else
          {
            _LSInstallLog();
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v66 = v34;
              __int16 v67 = 2112;
              v68 = v35;
              _os_log_error_impl( &dword_183E58000,  v38,  OS_LOG_TYPE_ERROR,  "Couldn't instantiate valid proxy for %@ when processing active installs, got %@",  buf,  0x16u);
            }
          }
        }

        uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v64 count:16];
      }

      while (v31);
    }

    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v39 = v46;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v47 objects:v63 count:16];
    id v6 = v44;
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v48;
      do
      {
        for (uint64_t m = 0LL; m != v41; ++m)
        {
          if (*(void *)v48 != v42) {
            objc_enumerationMutation(v39);
          }
          objc_msgSend( *(id *)(*((void *)&v47 + 1) + 8 * m),  "applicationInstallsArePrioritized:arePaused:",  v17,  v28,  v44);
        }

        uint64_t v41 = [v39 countByEnumeratingWithState:&v47 objects:v63 count:16];
      }

      while (v41);
    }

    id v7 = v45;
  }
}

- (void)applicationInstallsDidPause:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: PAUSE %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationInstallsDidPause_,  v4);
}

- (void)applicationInstallsDidResume:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: RESUME %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationInstallsDidResume_,  v4);
}

- (void)applicationInstallsDidCancel:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: CANCEL %@", (uint8_t *)&v6, 0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationInstallsDidCancel_,  v4);
}

- (void)applicationInstallsDidPrioritize:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: PRIORITIZE %@",  (uint8_t *)&v6,  0xCu);
  }

  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationInstallsDidPrioritize_,  v4);
}

- (void)applicationStateDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: StateChange %@",  (uint8_t *)&v6,  0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationStateDidChange_,  v4);
}

- (void)applicationIconDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: IconChange %@",  (uint8_t *)&v6,  0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_applicationIconDidChange_,  v4);
}

- (void)networkUsageChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = @"NO";
    if (v3) {
      int v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v6;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: NetworkUsageChanged using network: %@",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[LSApplicationWorkspaceRemoteObserver localObservers](self, "localObservers", 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v12 networkUsageChanged:v3];
        }
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)deviceManagementPolicyDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSInstallLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: deviceManagementPolicyDidChange %@",  (uint8_t *)&v6,  0xCu);
  }

  _LSContextInvalidate();
  -[LSApplicationWorkspaceRemoteObserver messageObserversWithSelector:andApps:]( self,  "messageObserversWithSelector:andApps:",  sel_deviceManagementPolicyDidChange_,  v4);
}

- (void)applicationsDidChangePersonas:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke;
  v6[3] = &unk_189D72430;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.applicationsDidChangePersonas", v6);
}

uint64_t __70__LSApplicationWorkspaceRemoteObserver_applicationsDidChangePersonas___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSInstallLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LaunchServices observer: applicationsDidChangePersonas %@",  (uint8_t *)&v5,  0xCu);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 40) messageObserversWithSelector:sel_applicationsDidChangePersonas_ andApps:*(void *)(a1 + 32)];
}

- (void)databaseWasRebuilt
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke;
  v2[3] = &unk_189D72BF0;
  v2[4] = self;
  dispatchAsyncToCallbackQueueWithTransaction((uint64_t)"com.apple.launchservices.databaserebuilt", v2);
}

uint64_t __58__LSApplicationWorkspaceRemoteObserver_databaseWasRebuilt__block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices observer: databaseWasRebuilt", v4, 2u);
  }

  _LSContextInvalidate();
  return [*(id *)(a1 + 32) messageObserversWithSelector:sel_databaseWasRebuilt];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isObservinglsd
{
  return self->_observinglsd;
}

- (void)setObservinglsd:(BOOL)a3
{
  self->_observinglsd = a3;
}

- (void).cxx_destruct
{
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationInstallsDidChange___block_invoke_cold_1()
{
}

void __69__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToInstall___block_invoke_cold_1()
{
}

void __71__LSApplicationWorkspaceRemoteObserver_applicationsDidFailToUninstall___block_invoke_cold_1()
{
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.1()
{
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.2()
{
}

- (void)applicationInstallsArePrioritized:arePaused:.cold.3()
{
}

@end
@interface LSInstallProgressService
@end

@implementation LSInstallProgressService

void __43___LSInstallProgressService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS____LSInstallProgressService);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
}

void __43___LSInstallProgressService_beginListening__block_invoke()
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 performJournalRecovery];
  [v4 loadProportions];
  id v0 = objc_alloc(MEMORY[0x189607B50]);
  [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:5];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 initWithMachServiceName:v1];
  v3 = (void *)beginListening_listener_0;
  beginListening_listener_0 = v2;

  [(id)beginListening_listener_0 setDelegate:v4];
  [(id)beginListening_listener_0 resume];
}

uint64_t __33___LSInstallProgressService_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) restoreInactiveInstalls];
}

void __33___LSInstallProgressService_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_suspend(WeakRetained[13]);
  -[dispatch_object_t saveProportions](WeakRetained, "saveProportions");
}

void __59___LSInstallProgressService__LSFindPlaceholderApplications__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (*(_DWORD *)(a3 + 160) == 2 && (*(_BYTE *)(a3 + 166) & 4) != 0 && (*(_DWORD *)(a3 + 316) - 7) >= 3)
  {
    uint64_t v4 = _CSStringCopyCFString();
    if (v4)
    {
      id v6 = (id)v4;
      v5 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v4,  1LL);
      [*(id *)(a1 + 32) addObject:v5];
    }
  }

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _LSFindPlaceholderApplications];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    _LSProgressLog();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199_cold_1();
    }
  }
}

void __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  _LSProgressLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "LSInstallProgress: Connection invalidated or interupted %@",  (uint8_t *)&v5,  0xCu);
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 removeObserver:*(void *)(a1 + 32)];
}

uint64_t __41___LSInstallProgressService_addObserver___block_invoke(void *a1)
{
  *(_BYTE *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 8) containsObject:a1[5]] ^ 1;
  return [*(id *)(a1[4] + 8) addObject:a1[5]];
}

void __41___LSInstallProgressService_addObserver___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x186E2A59C]();
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    uint64_t v3 = *(_BYTE **)(a1 + 32);
    if (v3[96]) {
      [v3 dispatchJournalledNotificationsToObserver:*(void *)(a1 + 40)];
    }
  }

  [*(id *)(a1 + 40) connection];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_201_0];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 applicationInstallsArePrioritized:*(void *)(a1 + 48) arePaused:*(void *)(a1 + 56)];

  objc_autoreleasePoolPop(v2);
}

void __41___LSInstallProgressService_addObserver___block_invoke_3()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl( &dword_183E58000,  v0,  OS_LOG_TYPE_DEFAULT,  "Failed to send catchup callback after adding observer",  v1,  2u);
  }
}

uint64_t __44___LSInstallProgressService_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1)
{
  uint64_t v2 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(a1 + 32),  1LL);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x186E2A59C]();
  objc_setAssociatedObject(v3, &_block_invoke_publishingStringKey, *(id *)(a1 + 32), (void *)0x301);
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"userInfo.installState" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"fractionCompleted" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"cancellable" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"pausable" options:3 context:*(void *)(a1 + 32)];
  [v3 addObserver:*(void *)(a1 + 40) forKeyPath:@"prioritizable" options:3 context:*(void *)(a1 + 32)];
  id v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 40) + 16) progressForBundleID:*(void *)(a1 + 48)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [v3 installState];
    if (v7 != 5) {
      [v6 setInstallState:v7];
    }
    objc_msgSend(v6, "setPausable:", objc_msgSend(v3, "isPausable", v7));
    objc_msgSend(v6, "setCancellable:", objc_msgSend(v3, "isCancellable"));
    objc_msgSend(v6, "setPrioritizable:", objc_msgSend(v3, "isPrioritizable"));
  }

  else
  {
    _LSProgressLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1();
    }
  }

  objc_sync_exit(v5);
  objc_initWeak(&location, v3);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_234;
  v13[3] = &unk_189D79F28;
  id v14 = *(id *)(a1 + 32);
  objc_copyWeak(&v17, &location);
  v9 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v9;
  v10 = (void *)[v13 copy];
  v11 = (void *)MEMORY[0x186E2A7B8]();

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v4);

  return v11;
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_234( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  _LSProgressLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "unsubscribing from %@ as it was unpublished",  (uint8_t *)&v10,  0xCu);
  }

  id v4 = (void *)MEMORY[0x186E2A59C]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained removeObserver:*(void *)(a1 + 40) forKeyPath:@"userInfo.installState"];

  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  [v6 removeObserver:*(void *)(a1 + 40) forKeyPath:@"fractionCompleted"];

  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  [v7 removeObserver:*(void *)(a1 + 40) forKeyPath:@"cancellable"];

  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  [v8 removeObserver:*(void *)(a1 + 40) forKeyPath:@"pausable"];

  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  [v9 removeObserver:*(void *)(a1 + 40) forKeyPath:@"prioritizable"];

  [*(id *)(*(void *)(a1 + 40) + 16) removeSubscriberForPublishingKey:*(void *)(a1 + 32) andBundleID:*(void *)(a1 + 48)];
  objc_autoreleasePoolPop(v4);
}

void __62___LSInstallProgressService_installationFailedForApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  *(void *)(a1 + 32),  1LL);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __86___LSInstallProgressService_detachAndSendNotification_forApplicationExtensionRecords___block_invoke( uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        addPluginDataToNotificationDict(v2, *(void **)(*((void *)&v11 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }

    while (v5);
  }

  _LSInstallLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    v18 = v2;
    _os_log_impl(&dword_183E58000, v8, OS_LOG_TYPE_DEFAULT, "posting %@ with %@", buf, 0x16u);
  }

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions( DistributedCenter,  *(CFNotificationName *)(a1 + 40),  0LL,  (CFDictionaryRef)v2,  2uLL);
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke( uint64_t a1)
{
  v1 = -[LSProgressNotificationTimer initWithQueue:]( objc_alloc(&OBJC_CLASS___LSProgressNotificationTimer),  "initWithQueue:",  *(void *)(*(void *)(a1 + 32) + 72LL));
  uint64_t v2 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
  sendNotification_forAppProxies_Plugins_completion__sProgressTimer = (uint64_t)v1;
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v135 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96)
    && *(void *)(v2 + 88)
    && +[_LSInstallNotificationJournaller shouldJournalNotificationType:]( &OBJC_CLASS____LSInstallNotificationJournaller,  "shouldJournalNotificationType:",  *(unsigned int *)(a1 + 80)))
  {
    id v3 = -[_LSStartupJournalledInstallNotification initWithNotification:appProxies:plugins:]( objc_alloc(&OBJC_CLASS____LSStartupJournalledInstallNotification),  "initWithNotification:appProxies:plugins:",  *(unsigned int *)(v1 + 80),  *(void *)(v1 + 40),  *(unsigned __int8 *)(v1 + 84));
    [*(id *)(*(void *)(v1 + 32) + 88) addObject:v3];
  }

  v99 = (const char *)[*(id *)(v1 + 32) observerSelectorForNotification:*(unsigned int *)(v1 + 80)];
  uint64_t v4 = (id *)(v1 + 48);
  id v100 = *(id *)(v1 + 48);
  uint64_t v5 = 0LL;
  char v6 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  switch(*(_DWORD *)(v1 + 80))
  {
    case 0:
      _LSProgressLog();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2();
      }
      goto LABEL_60;
    case 1:
      _LSProgressLog();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v30;
        _os_log_impl( &dword_183E58000,  v29,  OS_LOG_TYPE_DEFAULT,  "Sending applicationInstallsDidStart: for %@",  buf,  0xCu);
      }

      __int128 v112 = 0u;
      __int128 v113 = 0u;
      __int128 v110 = 0u;
      __int128 v111 = 0u;
      id v31 = *v4;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v110 objects:v134 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v111;
        do
        {
          for (uint64_t i = 0LL; i != v33; ++i)
          {
            if (*(void *)v111 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if ([v36 installType] != 7
              && [v36 installType] != 8
              && [v36 installType] != 9)
            {
              [*(id *)(v1 + 32) parentProgressForApplication:v36 andPhase:3 isActive:1];
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              [v37 setInstallState:5];
            }
          }

          uint64_t v33 = [v31 countByEnumeratingWithState:&v110 objects:v134 count:16];
        }

        while (v33);
      }

      uint64_t v38 = *(void *)(v1 + 56);
      v132[0] = @"bundleIDs";
      v132[1] = @"isPlaceholder";
      v133[0] = v38;
      v133[1] = MEMORY[0x189604A88];
      uint64_t v16 = (void *)MEMORY[0x189603F68];
      __int16 v17 = v133;
      v18 = v132;
      goto LABEL_36;
    case 2:
      _LSProgressLog();
      __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v12;
        _os_log_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending applicationInstallsDidUpdateIcon: for %@",  buf,  0xCu);
      }

      __int128 v13 = *(void **)(v1 + 32);
      [*(id *)(v1 + 48) objectAtIndex:0];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 _placeholderIconUpdatedForApp:v14];

      uint64_t v15 = *(void *)(v1 + 56);
      v130[0] = @"bundleIDs";
      v130[1] = @"isPlaceholder";
      v131[0] = v15;
      v131[1] = MEMORY[0x189604A88];
      uint64_t v16 = (void *)MEMORY[0x189603F68];
      __int16 v17 = v131;
      v18 = v130;
LABEL_36:
      [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
      uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      char v6 = 0;
      uint64_t v5 = 0LL;
      uint64_t v8 = 1LL;
      uint64_t v9 = @"com.apple.LaunchServices.applicationRegistered";
      goto LABEL_62;
    case 3:
      _LSProgressLog();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1();
      }

      v40 = (void *)sendNotification_forAppProxies_Plugins_completion__sProgressTimer;
      [*(id *)(*(void *)(v1 + 32) + 8) allObjects];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 notifyObservers:v41 withApplications:*(void *)(v1 + 48)];

      goto LABEL_61;
    case 4:
      _LSProgressLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      v42 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v42;
      v21 = "Sending applicationsWillInstall: for %@";
      goto LABEL_42;
    case 5:
      _LSProgressLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      uint64_t v20 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v20;
      v21 = "Sending applicationsWillUninstall: for %@";
LABEL_42:
      _os_log_impl(&dword_183E58000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
LABEL_43:

      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      char v6 = 1;
      uint64_t v5 = @"com.apple.LaunchServices.pluginswillberemoved";
      goto LABEL_62;
    case 6:
      goto LABEL_62;
    case 7:
      _LSProgressLog();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v44 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v44;
        _os_log_impl(&dword_183E58000, v43, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      uint64_t v45 = *(void *)(v1 + 56);
      v128[0] = @"bundleIDs";
      v128[1] = @"isPlaceholder";
      v129[0] = v45;
      v129[1] = MEMORY[0x189604A80];
      [MEMORY[0x189603F68] dictionaryWithObjects:v129 forKeys:v128 count:2];
      uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = @"com.apple.LaunchServices.applicationRegistered";
      char v6 = 1;
      uint64_t v8 = 1LL;
      uint64_t v5 = @"com.apple.LaunchServices.pluginsregistered";
      goto LABEL_62;
    case 8:
      _LSProgressLog();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v47;
        _os_log_impl(&dword_183E58000, v46, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      uint64_t v48 = *(void *)(v1 + 56);
      v124[0] = @"bundleIDs";
      v124[1] = @"isPlaceholder";
      v125[0] = v48;
      v125[1] = MEMORY[0x189604A80];
      [MEMORY[0x189603F68] dictionaryWithObjects:v125 forKeys:v124 count:2];
      uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = @"com.apple.LaunchServices.applicationUnregistered";
      char v6 = 1;
      uint64_t v8 = 1LL;
      uint64_t v5 = @"com.apple.LaunchServices.pluginsunregistered";
      goto LABEL_62;
    case 9:
      _LSProgressLog();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v50;
        _os_log_impl(&dword_183E58000, v49, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidUninstall: for %@", buf, 0xCu);
      }

      [*(id *)(v1 + 32) _placeholdersUninstalled:*(void *)(v1 + 48)];
      uint64_t v51 = *(void *)(v1 + 56);
      v122[0] = @"bundleIDs";
      v122[1] = @"isPlaceholder";
      v123[0] = v51;
      v123[1] = MEMORY[0x189604A88];
      v52 = (void *)MEMORY[0x189603F68];
      v53 = v123;
      v54 = v122;
      goto LABEL_56;
    case 0xA:
      _LSProgressLog();
      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v56;
        _os_log_impl(&dword_183E58000, v55, OS_LOG_TYPE_DEFAULT, "Sending applicationsDidInstall: for %@", buf, 0xCu);
      }

      [*(id *)(v1 + 32) _placeholdersUninstalled:*(void *)(v1 + 48)];
      uint64_t v57 = *(void *)(v1 + 56);
      v120[0] = @"bundleIDs";
      v120[1] = @"isPlaceholder";
      v121[0] = v57;
      v121[1] = MEMORY[0x189604A88];
      v52 = (void *)MEMORY[0x189603F68];
      v53 = v121;
      v54 = v120;
LABEL_56:
      [v52 dictionaryWithObjects:v53 forKeys:v54 count:2];
      uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      char v6 = 0;
      uint64_t v5 = 0LL;
      uint64_t v8 = 1LL;
      uint64_t v9 = @"com.apple.LaunchServices.applicationUnregistered";
      goto LABEL_62;
    case 0xB:
      _LSProgressLog();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      v22 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v22;
      v23 = "Sending applicationsDidFailToInstall: for %@";
      break;
    case 0xC:
      _LSProgressLog();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      v24 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v24;
      v23 = "Sending applicationsDidFailToUninstall: for %@";
      break;
    case 0xD:
      _LSProgressLog();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (const __CFString *)*v4;
        *(_DWORD *)buf = 138412290;
        v116 = v26;
        _os_log_impl(&dword_183E58000, v25, OS_LOG_TYPE_DEFAULT, "Sending applicationIconDidChange: for %@", buf, 0xCu);
      }

      uint64_t v126 = *MEMORY[0x189604E00];
      [*(id *)(v1 + 56) objectAtIndex:0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v27;
      uint64_t v8 = 1LL;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      uint64_t v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      char v6 = 0;
      uint64_t v5 = 0LL;
      uint64_t v9 = @"com.apple.LaunchServices.applicationIconChanged";
      goto LABEL_62;
    case 0xE:
      _LSProgressLog();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      v28 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v28;
      v23 = "Sending applicationsDidChangePersonas: for %@";
      break;
    case 0xF:
      _LSProgressLog();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      v58 = (const __CFString *)*v4;
      *(_DWORD *)buf = 138412290;
      v116 = v58;
      v23 = "Sending applicationInstallsDidChange: due to postprocessing ready for %@";
      break;
    default:
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      goto LABEL_62;
  }

  _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
LABEL_60:

LABEL_61:
  char v6 = 0;
  uint64_t v5 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
LABEL_62:
  cf1 = v5;
  if (v99)
  {
    uint64_t v91 = v8;
    v92 = v9;
    char v93 = v6;
    v94 = v7;
    uint64_t v96 = v1;
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    id v59 = *(id *)(*(void *)(v1 + 32) + 8LL);
    uint64_t v60 = [v59 countByEnumeratingWithState:&v106 objects:v119 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v107;
      uint64_t v63 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t j = 0LL; j != v61; ++j)
        {
          if (*(void *)v107 != v62) {
            objc_enumerationMutation(v59);
          }
          v65 = *(void **)(*((void *)&v106 + 1) + 8 * j);
          v66 = (void *)MEMORY[0x186E2A59C]();
          [v65 connection];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v63;
          v105[1] = 3221225472LL;
          v105[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_277;
          v105[3] = &unk_189D73308;
          v105[4] = v65;
          [v67 remoteObjectProxyWithErrorHandler:v105];
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v68, v99, v100);
          objc_autoreleasePoolPop(v66);
        }

        uint64_t v61 = [v59 countByEnumeratingWithState:&v106 objects:v119 count:16];
      }

      while (v61);
    }

    uint64_t v7 = v94;
    uint64_t v1 = v96;
    char v6 = v93;
    LODWORD(v8) = v91;
    uint64_t v9 = v92;
  }

  if (v7) {
    int v69 = v8;
  }
  else {
    int v69 = 0;
  }
  if (v69 == 1)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotificationWithOptions(DistributedCenter, v9, 0LL, v7, 3uLL);
    _LSProgressLog();
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v116 = v9;
      __int16 v117 = 2112;
      v118 = v7;
      _os_log_impl( &dword_183E58000,  v71,  OS_LOG_TYPE_DEFAULT,  "Sent distributed notification %@ with payload %@",  buf,  0x16u);
    }
  }

  char v72 = v6 ^ 1;
  if (!*(_BYTE *)(v1 + 84)) {
    char v72 = 1;
  }
  if ((v72 & 1) == 0)
  {
    v73 = *(void **)(v1 + 64);
    if (v73)
    {
      if ([v73 count])
      {
        v95 = v7;
        objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(*(id *)(v1 + 64), "count"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        __int128 v103 = 0u;
        __int128 v104 = 0u;
        uint64_t v97 = v1;
        id v75 = *(id *)(v1 + 64);
        uint64_t v76 = [v75 countByEnumeratingWithState:&v101 objects:v114 count:16];
        if (!v76) {
          goto LABEL_97;
        }
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v102;
        while (1)
        {
          for (uint64_t k = 0LL; k != v77; ++k)
          {
            if (*(void *)v102 != v78) {
              objc_enumerationMutation(v75);
            }
            id v80 = *(id *)(*((void *)&v101 + 1) + 8 * k);
            if (!CFEqual(cf1, @"com.apple.LaunchServices.pluginsregistered")
              || ([v80 bundleIdentifier],
                  v81 = (void *)objc_claimAutoreleasedReturnValue(),
                  BOOL v82 = _LSIsNewsWidgetBundleIdentifier(v81),
                  v81,
                  !v82))
            {

LABEL_94:
              objc_msgSend(v80, "correspondingApplicationExtensionRecord", v91, v92);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              addPluginDataToNotificationDict(v74, v86);
              goto LABEL_95;
            }
            v83 = +[LSApplicationRestrictionsManager sharedInstance]();
            [v80 bundleIdentifier];
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v85 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((BOOL)v83, v84);

            if (!v85) {
              goto LABEL_94;
            }
            _LSProgressLog();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v86, OS_LOG_TYPE_DEFAULT))
            {
              [v80 bundleIdentifier];
              v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v116 = v87;
              _os_log_impl( &dword_183E58000,  (os_log_t)v86,  OS_LOG_TYPE_DEFAULT,  "notification for restricted plugin %@ not being sent",  buf,  0xCu);
            }

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_277( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSProgressLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke( uint64_t a1,  void *a2)
{
  id v2 = a2;
  _LSProgressLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1();
  }
}

void __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 96))
  {
    id v3 = *(void **)(v2 + 88);
    if (v3)
    {
      +[_LSStartupJournalledDatabaseRebuiltNotification sharedNotification]( &OBJC_CLASS____LSStartupJournalledDatabaseRebuiltNotification,  "sharedNotification");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 addObject:v4];

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = *(id *)(v2 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend( *(id *)(a1 + 32),  "sendDatabaseRebuiltNotificationToObserver:",  *(void *)(*((void *)&v10 + 1) + 8 * v9++),  (void)v10);
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

void __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke( uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 48)) {
          +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v7,  1LL);
        }
        else {
          +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v7,  (void)v10);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
          if (*(_BYTE *)(a1 + 49)) {
            id v9 = (id)[v8 plugInKitPlugins];
          }
          objc_msgSend(v8, "detach", (void)v10);
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v4);
  }
}

void __44___LSInstallProgressService_loadProportions__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v20;
    *(void *)&__int128 v3 = 138412290LL;
    __int128 v16 = v3;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7, v16);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = (void *)objc_opt_class();
        __int128 v10 = (void *)objc_opt_class();
        if (_LSIsDictionaryWithKeysAndValuesOfClass(v8, v9, v10))
        {
          __int128 v11 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
          id v18 = 0LL;
          id v12 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:]( v11,  "initForInstallMachineryWithBundleIdentifier:placeholder:error:",  v7,  1LL,  &v18);
          __int128 v13 = (os_log_s *)v18;
          _LSProgressLog();
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v15)
            {
              *(_DWORD *)buf = v16;
              uint64_t v24 = v7;
              _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "Found placeholder for %@, loading progress proportions",  buf,  0xCu);
            }

            [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
            __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            [*(id *)(*(void *)(a1 + 40) + 120) setObject:v14 forKeyedSubscript:v7];
          }

          else if (v15)
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v7;
            _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "No placeholder for %@, not loading progress proportions",  buf,  0xCu);
          }
        }

        else
        {
          _LSProgressLog();
          __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            uint64_t v24 = v7;
            _os_log_error_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_ERROR,  "Invalid progress proportion entry for %@!",  buf,  0xCu);
          }
        }
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v4);
  }
}

void __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0LL;
  id v4 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:]( v2,  "initForInstallMachineryWithBundleIdentifier:placeholder:error:",  v3,  1LL,  &v7);
  id v5 = v7;
  id v6 = v7;
  if (!v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v5);
  }
}

void __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1895F89C0];
  id v4 = @"usingNetwork";
  [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification( DistributedCenter,  @"com.lsinstallprogress.networkusagechanged",  0LL,  v2,  1u);
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke( void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[4] + 8LL) + 40LL);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1[4] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0LL;

    id v5 = *(dispatch_source_s **)(*(void *)(a1[5] + 8LL) + 40LL);
    if (v5)
    {
      dispatch_source_cancel(v5);
      uint64_t v6 = *(void *)(a1[5] + 8LL);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0LL;
    }

    uint64_t v9 = a1[6];
    uint64_t v8 = (uint64_t)(a1 + 6);
    if ([*(id *)(*(void *)(v9 + 8) + 40) count])
    {
      _LSInstallLog();
      __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1(v8, v10);
      }
    }

    uint64_t v11 = *(void *)(*(void *)v8 + 8LL);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0LL;
  }

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_290( uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = dispatch_group_create();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v8 = [v7 pid];
        uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
        [MEMORY[0x189607968] numberWithInt:v8];
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 addObject:v10];

        dispatch_group_enter(v2);
        [v7 connection];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1895F87A8];
        v14[1] = 3221225472LL;
        v14[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2;
        v14[3] = &unk_189D7A040;
        uint64_t v12 = *(void *)(a1 + 48);
        v14[4] = *(void *)(a1 + 32);
        uint64_t v16 = v12;
        int v17 = v8;
        BOOL v15 = v2;
        [v11 addBarrierBlock:v14];
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v4);
  }

  dispatch_group_notify(v2, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 72LL), *(dispatch_block_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_2( uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 72LL);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3;
  v3[3] = &unk_189D7A018;
  v3[4] = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(a1 + 56);
  dispatch_sync(v2, v3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_3( uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 40)];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 removeObject:v2];
}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v3 = a3;
  [v3 domain];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqual:*MEMORY[0x189607688]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 2)
    {
      _LSInstallLog();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "install journal directory does not exist.", v9, 2u);
      }

      uint64_t v7 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
  }

  _LSInstallLog();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1();
  }
  uint64_t v7 = 1LL;
LABEL_10:

  return v7;
}

uint64_t __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_294( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }

  else
  {
    uint64_t v9 = -1LL;
  }

  return v9;
}

uint64_t __51___LSInstallProgressService_performJournalRecovery__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) loadJournalledNotificationsFromDisk];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  uint64_t result = [*(id *)(a1 + 32) dispatchJournalledNotificationsToConnectedClients];
  *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 1;
  return result;
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 10000000000LL);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(dispatch_queue_s **)(v3 + 72);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_3;
  block[3] = &unk_189D72BF0;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

void __51___LSInstallProgressService_performJournalRecovery__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_183E58000, v2, OS_LOG_TYPE_DEFAULT, "jettisoning notification journal", v7, 2u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 96LL) = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = 0LL;

  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = 0LL;
}

void __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSProgressLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSProgressLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "Error %@ connecting to observer %@", (uint8_t *)&v6, 0x16u);
  }
}

void __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199_cold_1()
{
}

void __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke_cold_1()
{
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v0, v1, "Sending applicationInstallsDidChange: for %@", v2);
  OUTLINED_FUNCTION_1();
}

void __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2_cold_2()
{
}

void __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke_cold_1()
{
}

void __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) allObjects];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_183E58000, a2, OS_LOG_TYPE_ERROR, "Clients tardy on draining notifications: %@", v4, 0xCu);

  OUTLINED_FUNCTION_5_0();
}

void __64___LSInstallProgressService_loadJournalledNotificationsFromDisk__block_invoke_cold_1()
{
}

@end
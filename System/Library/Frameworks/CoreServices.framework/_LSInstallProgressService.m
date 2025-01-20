@interface _LSInstallProgressService
+ (id)sharedInstance;
+ (int)notificationTypeForOperation:(unint64_t)a3;
+ (void)beginListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SEL)observerSelectorForNotification:(int)a3;
- (_LSInstallProgressService)init;
- (id)_LSFindPlaceholderApplications;
- (id)_prepareApplicationProxiesForNotification:(int)a3 identifiers:(id)a4 withPlugins:(BOOL)a5;
- (id)loadJournalledNotificationsFromDisk;
- (id)parentProgressForApplication:(id)a3 andPhase:(unint64_t)a4 isActive:(BOOL)a5;
- (id)progressProportionsForBundleID:(id)a3;
- (unint64_t)finalInstallPhaseForAppProxy:(id)a3;
- (void)_placeholderIconUpdatedForApp:(id)a3;
- (void)_placeholdersUninstalled:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSendNotificationFenceWithTimeout:(double)a3 fenceBlock:(id)a4;
- (void)coalesceProportionsSave;
- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6;
- (void)detachAndSendNotification:(id)a3 forApplicationExtensionRecords:(id)a4;
- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserver:(id)a5;
- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserverProxy:(id)a5;
- (void)discardProportionsForBundleID:(id)a3;
- (void)dispatchJournalledNotificationsToConnectedClients;
- (void)dispatchJournalledNotificationsToObserver:(id)a3;
- (void)getMaxProgressPhaseUnitsForLoading:(int *)a3 restoring:(int *)a4 installing:(int *)a5 essentialAssets:(int *)a6 forAppProxy:(id)a7;
- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4;
- (void)installationFailedForApplication:(id)a3;
- (void)loadProportions;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performJournalRecovery;
- (void)rebuildInstallIndexes;
- (void)removeObserver:(id)a3;
- (void)restoreInactiveInstalls;
- (void)saveProportions;
- (void)sendDatabaseRebuiltNotification;
- (void)sendDatabaseRebuiltNotificationToObserver:(id)a3;
- (void)sendNetworkUsageChangedNotification;
- (void)sendNotification:(id)a3 ForPlugins:(id)a4;
- (void)sendNotification:(int)a3 forAppProxies:(id)a4 Plugins:(BOOL)a5 completion:(id)a6;
- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 completion:(id)a6;
- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5;
@end

@implementation _LSInstallProgressService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_188);
  }
  return (id)sharedInstance_sharedInstance_2;
}

+ (void)beginListening
{
  if (beginListening_once_0 != -1) {
    dispatch_once(&beginListening_once_0, &__block_literal_global_189);
  }
}

+ (int)notificationTypeForOperation:(unint64_t)a3
{
  if (a3 > 8) {
    return 1;
  }
  else {
    return dword_183FBF6E4[a3];
  }
}

- (_LSInstallProgressService)init
{
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS____LSInstallProgressService;
  id v2 = -[_LSInstallProgressService init](&v38, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:0];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___LSInstallProgressList);
    v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    id v7 = objc_alloc_init(MEMORY[0x189603FE0]);
    v8 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x189603FD0]) initWithCapacity:0];
    v10 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
    v12 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:0];
    v14 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
    v16 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.lsd.appcontrols", 0LL);
    v18 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.lsd.observers", v19);
    v21 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v20;

    *((_BYTE *)v2 + 128) = 0;
    [v2 sendNetworkUsageChangedNotification];
    v22 = (dispatch_queue_s *)*((void *)v2 + 9);
    uint64_t v23 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __33___LSInstallProgressService_init__block_invoke;
    block[3] = &unk_189D72BF0;
    v24 = (dispatch_source_s **)v2;
    v37 = v24;
    dispatch_async(v22, block);
    v25 = (dispatch_source_s *)objc_alloc_init(MEMORY[0x189603FA8]);
    v26 = v24[11];
    v24[11] = v25;

    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *((dispatch_queue_t *)v2 + 9));
    v28 = v24[13];
    v24[13] = v27;

    objc_initWeak(&location, v24);
    v29 = v24[13];
    handler[0] = v23;
    handler[1] = 3221225472LL;
    handler[2] = __33___LSInstallProgressService_init__block_invoke_2;
    handler[3] = &unk_189D72B78;
    objc_copyWeak(&v34, &location);
    dispatch_source_set_event_handler(v29, handler);
    dispatch_resume(v24[13]);
    v30 = (dispatch_source_s *)objc_alloc_init(MEMORY[0x189603FC8]);
    v31 = v24[15];
    v24[15] = v30;

    *((_DWORD *)v24 + 28) = 0;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return (_LSInstallProgressService *)v2;
}

- (id)_LSFindPlaceholderApplications
{
  v6 = 0LL;
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (!_LSContextInit(&v6))
  {
    v5 = v6;
    id v4 = v2;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(&v6);
  }

  return v2;
}

- (void)restoreInactiveInstalls
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = __Block_byref_object_copy__47;
  dispatch_source_t v27 = __Block_byref_object_dispose__47;
  id v28 = 0LL;
  _LSDatabaseGetSeedingGroup();
  uint64_t v3 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  _LSServer_DatabaseExecutionContext();
  id v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke;
  v22[3] = &unk_189D722F0;
  v22[4] = self;
  v22[5] = &v23;
  -[LSDBExecutionContext syncRead:](v4, v22);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)v24[5];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v19;
    *(void *)&__int128 v6 = 138412546LL;
    __int128 v15 = v6;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1896079E0];
        objc_msgSend(v9, "bundleIdentifier", v15);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 publishingKeyForApp:v11 withPhase:0];
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _LSProgressLog();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          [v9 installFailureReason];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v30 = v9;
          __int16 v31 = 2112;
          v32 = v14;
          _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "Restoring progress for %@ with failure state %@",  buf,  0x16u);
        }

        v17[0] = MEMORY[0x1895F87A8];
        v17[1] = 3221225472LL;
        v17[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199;
        v17[3] = &unk_189D73308;
        v17[4] = v9;
        -[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]( self,  "createInstallProgressForApplication:withPhase:andPublishingString:reply:",  v9,  0LL,  v12,  v17);
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v33 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v23, 8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ((int)softLinkMKBDeviceUnlockedSinceBoot() <= 0)
  {
    [v7 _xpcConnection];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFURLRef v9 = _LSCopyExecutableURLForXPCConnection(v8);
    v10 = -[__CFURL lastPathComponent](v9, "lastPathComponent");
    _LSDefaultLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      id v13 = v12;
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      __int16 v30 = 2112;
      __int16 v31 = v10;
      __int16 v32 = 2048;
      uint64_t v33 = (int)[v7 processIdentifier];
      _os_log_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "Service %@ being accessed by %@ (%lu) before first unlock.",  buf,  0x20u);
    }
  }

  installProgressInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setExportedInterface:v14];

  workspaceObserverInterface();
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setRemoteObjectInterface:v15];

  v16 = -[LSInstallProgressObserver initWithConnection:]( objc_alloc(&OBJC_CLASS___LSInstallProgressObserver),  "initWithConnection:",  v7);
  [v7 setExportedObject:v16];
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  uint64_t v20 = MEMORY[0x1895F87A8];
  uint64_t v21 = 3221225472LL;
  v22 = __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke;
  uint64_t v23 = &unk_189D79E90;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, (id *)buf);
  dispatch_queue_t v17 = v16;
  v24 = v17;
  __int128 v18 = (void *)MEMORY[0x186E2A7B8](&v20);
  objc_msgSend(v7, "setInvalidationHandler:", v18, v20, v21, v22, v23);
  [v7 setInterruptionHandler:v18];
  [v7 resume];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41___LSInstallProgressService_addObserver___block_invoke;
  block[3] = &unk_189D79EB8;
  v24 = v25;
  void block[4] = self;
  id v7 = v4;
  id v23 = v7;
  dispatch_sync(observersQueue, block);
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableOrderedSet array](v8->_orderedInstalls, "array");
  CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[v9 copy];

  -[NSMutableSet allObjects](v8->_inactiveInstalls, "allObjects");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)[v11 copy];

  objc_sync_exit(v8);
  id v13 = (dispatch_queue_s *)self->_observersQueue;
  v17[0] = v6;
  v17[1] = 3221225472LL;
  v17[2] = __41___LSInstallProgressService_addObserver___block_invoke_2;
  v17[3] = &unk_189D79F00;
  id v20 = v12;
  uint64_t v21 = v25;
  v17[4] = v8;
  id v18 = v7;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v7;
  dispatch_async(v13, v17);

  _Block_object_dispose(v25, 8);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44___LSInstallProgressService_removeObserver___block_invoke;
  block[3] = &unk_189D72430;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observersQueue, block);
}

- (void)getMaxProgressPhaseUnitsForLoading:(int *)a3 restoring:(int *)a4 installing:(int *)a5 essentialAssets:(int *)a6 forAppProxy:(id)a7
{
  id v11 = a7;
  uint64_t v12 = [v11 installType];
  if (v12 == 2) {
    unint64_t v13 = 35LL;
  }
  else {
    unint64_t v13 = 40LL;
  }
  if (v12 == 2) {
    unint64_t v14 = 10LL;
  }
  else {
    unint64_t v14 = 0LL;
  }
  if (v12 == 2) {
    unint64_t v15 = 55LL;
  }
  else {
    unint64_t v15 = 60LL;
  }
  objc_msgSend(v11, "bundleIdentifier", a6);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LSInstallProgressService progressProportionsForBundleID:](self, "progressProportionsForBundleID:", v16);
  id v36 = (id)objc_claimAutoreleasedReturnValue();

  unint64_t v17 = (unint64_t)v36;
  if (v36)
  {
    [v36 objectForKeyedSubscript:&unk_189DA8248];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 doubleValue];
    double v20 = v19;
    [v36 objectForKeyedSubscript:&unk_189DA8260];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 doubleValue];
    double v23 = v20 + v22;
    [v36 objectForKeyedSubscript:&unk_189DA8278];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 doubleValue];
    double v26 = v23 + v25;
    [v36 objectForKeyedSubscript:&unk_189DA8290];
    dispatch_source_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 doubleValue];
    double v29 = v26 + v28;

    unint64_t v15 = computeEffectiveUnitsForPhase(0LL, v15, v36, v29);
    unint64_t v14 = computeEffectiveUnitsForPhase(2LL, v14, v36, v29);
    unint64_t v13 = computeEffectiveUnitsForPhase(1LL, v13, v36, v29);
    unint64_t v17 = computeEffectiveUnitsForPhase(4LL, v13, v36, v29);
  }

  double v30 = 100.0 / (double)(v13 + v15 + v17 + v14);
  unint64_t v31 = (unint64_t)(v30 * (double)v14);
  unint64_t v32 = (unint64_t)(v30 * (double)v13);
  unint64_t v33 = (unint64_t)(v30 * (double)v17);
  if (a3) {
    *a3 = 100 - v33 - (v32 + v31);
  }
  if (a4) {
    *a4 = v31;
  }
  if (a5) {
    *a5 = v32;
  }
  if (v35) {
    _DWORD *v35 = v33;
  }
}

- (unint64_t)finalInstallPhaseForAppProxy:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    unint64_t v4 = 1LL;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  v10 = (os_log_s *)a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = (void *)MEMORY[0x186E2A59C]();
  [v12 objectForKey:*MEMORY[0x1896075C0]];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKey:*MEMORY[0x1896075B8]];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = a6;
  if (v16 && _NSIsNSString() && [v16 length])
  {
    uint64_t v17 = [v16 rangeOfString:@"." options:4];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _LSProgressLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.1();
      }
      goto LABEL_9;
    }

    uint64_t v19 = v17;
    [v16 substringToIndex:v17];
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    [v16 substringFromIndex:v19 + 1];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || !_NSIsNSString() || !-[os_log_s length](v18, "length"))
    {
      _LSProgressLog();
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v10;
        _os_log_impl( &dword_183E58000,  v34,  OS_LOG_TYPE_DEFAULT,  "Received kvo for %@ notification with invalid bundleID",  buf,  0xCu);
      }

      goto LABEL_28;
    }

    _LSProgressLog();
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v73 = v18;
      __int16 v74 = 2112;
      *(void *)v75 = v16;
      *(_WORD *)&v75[8] = 2112;
      *(void *)&v75[10] = v10;
      *(_WORD *)&v75[18] = 2112;
      id v76 = v12;
      _os_log_debug_impl( &dword_183E58000,  v20,  OS_LOG_TYPE_DEBUG,  "Received kvo for %@ <%@:%@> with change %@",  buf,  0x2Au);
    }

    uint64_t v65 = 0LL;
    v66 = &v65;
    uint64_t v67 = 0x3032000000LL;
    v68 = __Block_byref_object_copy__47;
    v69 = __Block_byref_object_dispose__47;
    id v70 = 0LL;
    _LSServer_DatabaseExecutionContext();
    uint64_t v21 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1895F87A8];
    v62[1] = 3221225472LL;
    v62[2] = __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v62[3] = &unk_189D722F0;
    v64 = &v65;
    v53 = v18;
    v63 = v53;
    -[LSDBExecutionContext syncRead:](v21, v62);

    if (!v66[5])
    {
      _LSProgressLog();
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.2();
      }
      goto LABEL_37;
    }

    double v22 = self;
    objc_sync_enter(v22);
    id obj = v22;
    v56 = -[LSInstallProgressList progressForBundleID:](v22->_progresses, "progressForBundleID:", v53);
    if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v56 installPhaseString];
      double v23 = (void *)objc_claimAutoreleasedReturnValue();
      char v24 = [v57 isEqualToString:v23];

      if ((v24 & 1) != 0)
      {
        if (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"fractionCompleted"))
        {
          [v14 doubleValue];
          double v26 = v25;
          [v15 doubleValue];
          double v28 = v27;
          [v15 doubleValue];
          double v30 = v29;
          [v14 doubleValue];
          if (v30 < v31) {
            goto LABEL_36;
          }
          [v15 doubleValue];
          if (v32 > 1.0 || v28 == v26) {
            goto LABEL_36;
          }
          -[_LSInstallProgressService getMaxProgressPhaseUnitsForLoading:restoring:installing:essentialAssets:forAppProxy:]( obj,  "getMaxProgressPhaseUnitsForLoading:restoring:installing:essentialAssets:forAppProxy:",  &v61,  &v60,  &v59,  &v58,  v66[5]);
          int v33 = 0;
          uint64_t v51 = 0LL;
          int v54 = 0;
          switch([v56 installPhase])
          {
            case 0LL:
              int v33 = 0;
              uint64_t v51 = 0LL;
              int v54 = (int)(v28 * (double)v61);
              break;
            case 1LL:
              int v54 = v61;
              uint64_t v51 = v60;
              int v33 = (int)(v28 * (double)v59);
              break;
            case 2LL:
              int v33 = 0;
              int v54 = v61;
              LODWORD(v51) = (int)(v28 * (double)v60);
              HIDWORD(v51) = 0;
              break;
            case 3LL:
              break;
            case 4LL:
              int v54 = v61;
              int v33 = v59;
              LODWORD(v51) = v60;
              HIDWORD(v51) = (int)(v28 * (double)v58);
              break;
            default:
              uint64_t v51 = 0LL;
              int v54 = 0;
              break;
          }

          _LSProgressLog();
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v48 = (os_log_s *)(HIDWORD(v51) + v33 + (int)v51 + v54);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            int v50 = [v56 installPhase];
            *(_DWORD *)buf = 134219522;
            v73 = v48;
            __int16 v74 = 1024;
            *(_DWORD *)v75 = v50;
            *(_WORD *)&v75[4] = 2112;
            *(void *)&v75[6] = v16;
            *(_WORD *)&v75[14] = 1024;
            *(_DWORD *)&v75[16] = v61;
            LOWORD(v76) = 1024;
            *(_DWORD *)((char *)&v76 + 2) = v60;
            HIWORD(v76) = 1024;
            int v77 = v59;
            __int16 v78 = 1024;
            int v79 = v58;
            _os_log_debug_impl( &dword_183E58000,  v47,  OS_LOG_TYPE_DEBUG,  "setting completed unit count to %llu for progress in phase %d (ps %@). maxes: %d %d %d %d",  buf,  0x34u);
          }

          [v56 setCompletedUnitCount:v48];
        }

        else
        {
          if (!-[os_log_s isEqualToString:](v10, "isEqualToString:", @"userInfo.installState"))
          {
            if (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"pausable"))
            {
              int v43 = [v15 BOOLValue];
            }

            else if (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"cancellable"))
            {
              int v44 = [v15 BOOLValue];
            }

            else if (-[os_log_s isEqualToString:](v10, "isEqualToString:", @"prioritizable"))
            {
              int v45 = [v15 BOOLValue];
            }

            goto LABEL_36;
          }

          int v37 = [v14 intValue];
          _LSProgressLog();
          objc_super v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v56, "installPhase"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v73 = v55;
            __int16 v74 = 2112;
            *(void *)v75 = v49;
            _os_log_debug_impl( &dword_183E58000,  v38,  OS_LOG_TYPE_DEBUG,  "LSInstallProgress: Got update for userInfo.installState: newVal = %@, parentPhase = %@",  buf,  0x16u);
          }

          if ([v15 integerValue] == 5
            && (uint64_t v39 = [v56 installPhase],
                v39 != -[_LSInstallProgressService finalInstallPhaseForAppProxy:]( obj,  "finalInstallPhaseForAppProxy:",  v66[5])))
          {
            int v42 = 0;
          }

          else
          {
            objc_msgSend(v56, "setInstallState:", (int)objc_msgSend(v15, "intValue"));
            _LSProgressLog();
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v15, "intValue"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.4( v41,  (uint64_t)buf,  v40);
            }

            int v42 = 1;
          }

          if ([v15 intValue] == 4
            || [v15 intValue] == 2
            || ![v15 intValue])
          {
            [v56 setPausable:1];
            [v56 setCancellable:1];
            [v56 setPrioritizable:1];
          }

          if (!v42)
          {
LABEL_36:

            id v36 = (os_log_s *)obj;
            objc_sync_exit(obj);
LABEL_37:

            _Block_object_dispose(&v65, 8);
LABEL_28:

            goto LABEL_9;
          }
        }

        uint64_t v71 = v66[5];
        objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v71, 1, v51);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:]( obj,  "sendNotification:forAppProxies:Plugins:completion:",  3LL,  v35,  0LL,  0LL);
      }

      else
      {
        _LSProgressLog();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          [v56 installPhaseString];
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v73 = (os_log_s *)v16;
          __int16 v74 = 2112;
          *(void *)v75 = v46;
          *(_WORD *)&v75[8] = 2112;
          *(void *)&v75[10] = v57;
          _os_log_debug_impl( &dword_183E58000,  v35,  OS_LOG_TYPE_DEBUG,  "LSInstallProgress: Got update for %@ but parent phase %@ does not match %@",  buf,  0x20u);
        }
      }
    }

    else
    {
      _LSProgressLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.3();
      }
    }

    goto LABEL_36;
  }

  _LSProgressLog();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = v10;
    _os_log_impl( &dword_183E58000,  v18,  OS_LOG_TYPE_DEFAULT,  "Received kvo for %@ notification with invalid context",  buf,  0xCu);
  }

- (id)parentProgressForApplication:(id)a3 andPhase:(unint64_t)a4 isActive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  context = (void *)MEMORY[0x186E2A59C]();
  [v8 bundleIdentifier];
  CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[LSInstallProgressList progressForBundleID:](v10->_progresses, "progressForBundleID:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_installIndexes, "objectForKeyedSubscript:", v9);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_installTypes, "objectForKeyedSubscript:", v9);
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 unsignedIntegerValue];
      if (v13 && ((uint64_t v15 = [v8 installType], (unint64_t)(v14 - 7) > 2) || v14 == v15))
      {
        if ((-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v9) & v5) == 1)
        {
          _LSProgressLog();
          char v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            [v11 _LSDescription];
            double v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(void *)int v37 = v25;
            _os_log_impl( &dword_183E58000,  v24,  OS_LOG_TYPE_DEFAULT,  "Updating installState for %@ to LSInstallStateWaiting",  buf,  0xCu);
          }

          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          double v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_installTypes,  "setObject:forKeyedSubscript:",  v26,  v9);

          -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v9);
          -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
          -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
          [v11 setInstallState:0];
        }
      }

      else
      {
        _LSProgressLog();
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)int v37 = [v8 installType];
          *(_WORD *)&v37[4] = 1024;
          *(_DWORD *)&v37[6] = v14;
          *(_WORD *)objc_super v38 = 2112;
          *(void *)&v38[2] = v8;
          _os_log_debug_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_DEBUG,  "Updating install type to %u from %u from: %@",  buf,  0x18u);
        }

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v17, v9);

        if (!v12)
        {
          -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v9);
          if (v5)
          {
            -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
            [v11 setInstallState:0];
          }

          else
          {
            -[NSMutableSet addObject:](v10->_inactiveInstalls, "addObject:", v9);
          }
        }

        -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
      }

      if (a4 == 3 && [v11 installPhase] != 2) {
        goto LABEL_37;
      }
      _LSProgressLog();
      double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        [v11 _LSDescription];
        double v30 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
        double v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)int v37 = v30;
        *(_WORD *)&v37[8] = 2112;
        *(void *)objc_super v38 = v31;
        _os_log_impl(&dword_183E58000, v29, OS_LOG_TYPE_DEFAULT, "Updating installPhase for %@ to %@", buf, 0x16u);
      }

      [v11 setInstallPhase:a4];
      if (a4 <= 4 && ((1LL << a4) & 0x19) != 0)
      {
LABEL_37:
        [v11 setPausable:1];
        BOOL v32 = 1LL;
        [v11 setCancellable:1];
      }

      else
      {
        [v11 setPausable:0];
        [v11 setCancellable:0];
        BOOL v32 = a4 == 1;
      }

      [v11 setPrioritizable:v32];
    }

    else
    {
      if (v5)
      {
        if ((-[NSMutableOrderedSet containsObject:](v10->_orderedInstalls, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          double v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v10->_installTypes,  "setObject:forKeyedSubscript:",  v22,  v9);

          objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[NSMutableOrderedSet indexOfObject:](v10->_orderedInstalls, "indexOfObject:", v9));
          double v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v10->_installIndexes, "setObject:forKey:", v23, v9);
        }

        if (!v10->_usingNetwork)
        {
          v10->_usingNetwork = 1;
          -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
        }
      }

      else if ((-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v9) & 1) == 0)
      {
        -[NSMutableSet addObject:](v10->_inactiveInstalls, "addObject:", v9);
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        double v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v27, v9);
      }

      id v11 = (void *)[objc_alloc(MEMORY[0x1896079E0]) initWithParent:0 bundleID:v9 andPhase:a4];
      -[LSInstallProgressList setProgress:forBundleID:](v10->_progresses, "setProgress:forBundleID:", v11, v9);
      objc_msgSend( v11,  "ls_setExpectedFinalInstallPhase:",  -[_LSInstallProgressService finalInstallPhaseForAppProxy:](v10, "finalInstallPhaseForAppProxy:", v8));
      [v11 _publish];
      _LSProgressLog();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [v11 _LSDescription];
        double v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)int v37 = v28;
        _os_log_impl(&dword_183E58000, v12, OS_LOG_TYPE_DEFAULT, "Created parent progress %@", buf, 0xCu);
      }
    }

    objc_sync_exit(v10);
    objc_autoreleasePoolPop(context);
    _LSProgressLog();
    int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[_LSInstallProgressService parentProgressForApplication:andPhase:isActive:].cold.1(v11, (uint64_t)v8, v33);
    }
  }

  else
  {
    _LSProgressLog();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
      double v20 = (void *)v19;
      uint64_t v21 = @"INACTIVE";
      *(_DWORD *)buf = 138412802;
      *(void *)int v37 = v8;
      *(_WORD *)&v37[8] = 2112;
      if (v5) {
        uint64_t v21 = @"ACTIVE";
      }
      *(void *)objc_super v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      uint64_t v39 = v21;
      _os_log_impl( &dword_183E58000,  v18,  OS_LOG_TYPE_DEFAULT,  "Invalid bundleID, failed to create parent progress for %@ {%@-%@}",  buf,  0x20u);
    }

    objc_autoreleasePoolPop(context);
    id v11 = 0LL;
  }

  return v11;
}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  unint64_t v13 = (void (**)(id, void *))a6;
  uint64_t v14 = (void *)MEMORY[0x186E2A59C]();
  if (v12)
  {
    uint64_t v15 = self->_publishingStrings;
    objc_sync_enter(v15);
    -[NSMutableSet member:](self->_publishingStrings, "member:", v12);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }

    else
    {
      _LSProgressLog();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v12;
        _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_DEFAULT,  "Using publishing string %{public}@ for the first time",  buf,  0xCu);
      }

      -[NSMutableSet addObject:](self->_publishingStrings, "addObject:", v12);
      -[NSMutableSet member:](self->_publishingStrings, "member:", v12);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        [MEMORY[0x1896077D8] currentHandler];
        int v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 handleFailureInMethod:a2, self, @"_LSInstallProgressService.m", 1023, @"Failed to get back value %@ we just inserted into an NSMutableSet.", 0 object file lineNumber description];

        id v18 = 0LL;
      }
    }

    objc_sync_exit(v15);
  }

  else
  {
    id v18 = 0LL;
  }

  _LSProgressLog();
  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    id v47 = v11;
    __int16 v48 = 2112;
    v49 = v36;
    __int16 v50 = 2112;
    id v51 = v18;
    _os_log_debug_impl( &dword_183E58000,  v20,  OS_LOG_TYPE_DEBUG,  "createInstallProgressForApplication:%@ withPhase:%@ andPublishingString:%@",  buf,  0x20u);
  }

  [v11 bundleIdentifier];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _LSProgressLog();
    double v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = 0LL;
      _os_log_impl( &dword_183E58000,  v31,  OS_LOG_TYPE_DEFAULT,  "Cannot create install progress for app, invalid app proxy %@",  buf,  0xCu);
    }

    uint64_t v44 = *MEMORY[0x189607490];
    int v45 = @"invalid application proxy";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]",  1034LL,  v32);
    int v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v33);

    goto LABEL_29;
  }

  if (!v18)
  {
    _LSProgressLog();
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v11;
      __int16 v48 = 2112;
      v49 = 0LL;
      _os_log_impl( &dword_183E58000,  v34,  OS_LOG_TYPE_DEFAULT,  "Cannot create install progress for app %@, missing publishing key %@",  buf,  0x16u);
    }

    uint64_t v42 = *MEMORY[0x189607490];
    int v43 = @"no publishing key";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]",  1040LL,  v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v35);

    goto LABEL_29;
  }

  -[_LSInstallProgressService parentProgressForApplication:andPhase:isActive:]( self,  "parentProgressForApplication:andPhase:isActive:",  v11,  a4,  1LL);
  double v22 = (void *)objc_claimAutoreleasedReturnValue();
  _LSProgressLog();
  double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    [v22 _LSDescription];
    char v24 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
    double v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v47 = v24;
    __int16 v48 = 2112;
    v49 = v25;
    _os_log_impl( &dword_183E58000,  v23,  OS_LOG_TYPE_DEFAULT,  "Parent progress for installation %@, adding phase %@",  buf,  0x16u);
  }

  if (!v22)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10810LL,  (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]",  1048LL,  0LL);
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v32);
LABEL_29:

    objc_autoreleasePoolPop(v14);
    goto LABEL_30;
  }

  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke;
  v38[3] = &unk_189D79F50;
  id v26 = v18;
  id v39 = v26;
  uint64_t v40 = self;
  id v27 = v21;
  id v41 = v27;
  double v28 = (void *)MEMORY[0x186E2A7B8](v38);
  [MEMORY[0x1896079E0] _addSubscriberForCategory:v26 usingPublishingHandler:v28];
  double v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29) {
    -[LSInstallProgressList addSubscriber:forPublishingKey:andBundleID:]( self->_progresses,  "addSubscriber:forPublishingKey:andBundleID:",  v29,  v26,  v27);
  }
  _LSProgressLog();
  double v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v26;
    _os_log_impl(&dword_183E58000, v30, OS_LOG_TYPE_DEFAULT, "Subscribing to %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v14);
  v13[2](v13, 0LL);
LABEL_30:
}

- (void)rebuildInstallIndexes
{
  if (-[NSMutableOrderedSet count](self->_orderedInstalls, "count"))
  {
    unint64_t v3 = 0LL;
    do
    {
      -[NSMutableOrderedSet objectAtIndex:](self->_orderedInstalls, "objectAtIndex:", v3);
      unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithInt:v3];
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_installIndexes, "setObject:forKey:", v5, v4);

      ++v3;
    }

    while (-[NSMutableOrderedSet count](self->_orderedInstalls, "count") > v3);
  }

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x186E2A59C]();
  _LSProgressLog();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:a4];
    CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_DEFAULT,  "Installation ended for %@ with state %@",  (uint8_t *)&v14,  0x16u);
  }

  v10 = self;
  objc_sync_enter(v10);
  -[LSInstallProgressList progressForBundleID:](v10->_progresses, "progressForBundleID:", v6);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v11)
  {
    if (a4 == 5) {
      [v11 setCompletedUnitCount:100];
    }
    [v12 setInstallState:a4];
    if (-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v6))
    {
      -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v6);
    }

    else
    {
      -[NSMutableOrderedSet removeObject:](v10->_orderedInstalls, "removeObject:", v6);
      -[NSMutableDictionary removeObjectForKey:](v10->_installIndexes, "removeObjectForKey:", v6);
      -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
    }

    -[NSMutableDictionary removeObjectForKey:](v10->_installTypes, "removeObjectForKey:", v6);
    if (!-[NSMutableOrderedSet count](v10->_orderedInstalls, "count") && v10->_usingNetwork)
    {
      v10->_usingNetwork = 0;
      -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
    }

    [v12 _unpublish];
    -[LSInstallProgressList removeProgressForBundleID:](v10->_progresses, "removeProgressForBundleID:", v6);
    -[_LSInstallProgressService discardProportionsForBundleID:](v10, "discardProportionsForBundleID:", v6);
  }

  else
  {
    _LSProgressLog();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "Could not find parent progress for %@, it may have been removed",  (uint8_t *)&v14,  0xCu);
    }
  }

  objc_sync_exit(v10);
  objc_autoreleasePoolPop(v7);
}

- (void)installationFailedForApplication:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x186E2A59C]();
  _LSProgressLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_LSInstallProgressService installationFailedForApplication:].cold.2();
  }

  id v7 = self;
  objc_sync_enter(v7);
  -[LSInstallProgressList progressForBundleID:](v7->_progresses, "progressForBundleID:", v4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = __Block_byref_object_copy__47;
    double v20 = __Block_byref_object_dispose__47;
    id v21 = 0LL;
    _LSServer_DatabaseExecutionContext();
    CFURLRef v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __62___LSInstallProgressService_installationFailedForApplication___block_invoke;
    v13[3] = &unk_189D722F0;
    p___int128 buf = &buf;
    id v10 = v4;
    id v14 = v10;
    -[LSDBExecutionContext syncRead:](v9, v13);

    -[NSMutableSet addObject:](v7->_inactiveInstalls, "addObject:", v10);
    -[NSMutableOrderedSet removeObject:](v7->_orderedInstalls, "removeObject:", v10);
    -[_LSInstallProgressService rebuildInstallIndexes](v7, "rebuildInstallIndexes");
    if (!-[NSMutableOrderedSet count](v7->_orderedInstalls, "count") && v7->_usingNetwork)
    {
      v7->_usingNetwork = 0;
      -[_LSInstallProgressService sendNetworkUsageChangedNotification](v7, "sendNetworkUsageChangedNotification");
    }

    [v8 setCompletedUnitCount:0];
    [v8 setInstallState:4];
    [v8 setCancellable:1];
    [v8 setPausable:1];
    if (*(void *)(*((void *)&buf + 1) + 40LL))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40LL);
      [MEMORY[0x189603F18] arrayWithObjects:&v16 count:1];
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:]( v7,  "sendNotification:forAppProxies:Plugins:completion:",  3LL,  v11,  0LL,  0LL);
    }

    else
    {
      _LSProgressLog();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_LSInstallProgressService installationFailedForApplication:].cold.1();
      }
    }

    [v8 _unpublish];
    -[LSInstallProgressList removeProgressForBundleID:](v7->_progresses, "removeProgressForBundleID:", v10);
    -[_LSInstallProgressService discardProportionsForBundleID:](v7, "discardProportionsForBundleID:", v10);

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    _LSProgressLog();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEFAULT,  "Could not find parent progress for %@, it may have been removed",  (uint8_t *)&buf,  0xCu);
    }
  }

  objc_sync_exit(v7);
  objc_autoreleasePoolPop(v5);
}

- (void)_placeholderIconUpdatedForApp:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  inactiveInstalls = v4->_inactiveInstalls;
  [v12 bundleIdentifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(inactiveInstalls) = -[NSMutableSet containsObject:](inactiveInstalls, "containsObject:", v6);

  if ((inactiveInstalls & 1) == 0)
  {
    installIndexes = v4->_installIndexes;
    [v12 bundleIdentifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](installIndexes, "objectForKeyedSubscript:", v8);
    CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      orderedInstalls = v4->_orderedInstalls;
      [v12 bundleIdentifier];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet addObject:](orderedInstalls, "addObject:", v11);

      -[_LSInstallProgressService rebuildInstallIndexes](v4, "rebuildInstallIndexes");
    }
  }

  objc_sync_exit(v4);
}

- (void)_placeholdersUninstalled:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v15;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v13 = v6;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleIdentifier", v13, (void)v14);
        CFURLRef v9 = (void *)objc_claimAutoreleasedReturnValue();
        id v10 = self;
        objc_sync_enter(v10);
        if ((-[NSMutableSet containsObject:](self->_inactiveInstalls, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_installIndexes, "objectForKey:", v9);
        }

        _LSProgressLog();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = v13;
          uint64_t v19 = v9;
          _os_log_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "Placeholder for %@ uninstalled; removing progress tracking",
            buf,
            0xCu);
        }

        -[LSInstallProgressList progressForBundleID:](self->_progresses, "progressForBundleID:", v9);
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](self->_inactiveInstalls, "removeObject:", v9);
        -[NSMutableOrderedSet removeObject:](self->_orderedInstalls, "removeObject:", v9);
        -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
        if (!-[NSMutableOrderedSet count](self->_orderedInstalls, "count") && self->_usingNetwork)
        {
          self->_usingNetwork = 0;
          -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
        }

        -[NSMutableDictionary removeObjectForKey:](self->_installTypes, "removeObjectForKey:", v9);
        [v12 _unpublish];
        -[LSInstallProgressList removeProgressForBundleID:](self->_progresses, "removeProgressForBundleID:", v9);
        -[_LSInstallProgressService discardProportionsForBundleID:](v10, "discardProportionsForBundleID:", v9);

        objc_sync_exit(v10);
      }

      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v5);
  }
}

- (void)sendNotification:(id)a3 ForPlugins:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "correspondingApplicationExtensionRecord", (void)v15);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 addObject:v14];

          ++v13;
        }

        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v11);
    }

    -[_LSInstallProgressService detachAndSendNotification:forApplicationExtensionRecords:]( self,  "detachAndSendNotification:forApplicationExtensionRecords:",  v6,  v8);
  }
}

- (void)detachAndSendNotification:(id)a3 forApplicationExtensionRecords:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 count])
  {
    uint64_t v21 = self;
    uint64_t v22 = v6;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(id *)(*((void *)&v26 + 1) + 8 * v13);
          if (recordSelectorsForPluginNotification_onceToken != -1) {
            dispatch_once(&recordSelectorsForPluginNotification_onceToken, &__block_literal_global_475);
          }
          __int128 v15 = (const char *)recordSelectorsForPluginNotification_registeredSels_body;
          if (recordSelectorsForPluginNotification_registeredSels_init == 1
            && recordSelectorsForPluginNotification_registeredSels_body != 0)
          {
            __int128 v17 = &qword_18C6710E8;
            do
            {
              id v18 = [v14 v15];
              uint64_t v19 = (const char *)*v17++;
              __int128 v15 = v19;
            }

            while (v19);
          }

          [v14 detach];

          ++v13;
        }

        while (v13 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v11);
    }

    installControlsQueue = (dispatch_queue_s *)v21->_installControlsQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __86___LSInstallProgressService_detachAndSendNotification_forApplicationExtensionRecords___block_invoke;
    block[3] = &unk_189D72430;
    id v24 = v9;
    id v6 = v22;
    id v25 = v22;
    dispatch_async(installControlsQueue, block);
  }
}

- (SEL)observerSelectorForNotification:(int)a3
{
  SEL result = 0LL;
  switch(a3)
  {
    case 1:
      SEL result = sel_applicationInstallsDidStart_;
      break;
    case 2:
      SEL result = sel_applicationInstallsDidUpdateIcon_;
      break;
    case 4:
      SEL result = sel_applicationsWillInstall_;
      break;
    case 5:
      SEL result = sel_applicationsWillUninstall_;
      break;
    case 7:
    case 10:
      SEL result = sel_applicationsDidInstall_;
      break;
    case 8:
    case 9:
      SEL result = sel_applicationsDidUninstall_;
      break;
    case 11:
      SEL result = sel_applicationsDidFailToInstall_;
      break;
    case 12:
      SEL result = sel_applicationsDidFailToUninstall_;
      break;
    case 13:
      SEL result = sel_applicationIconDidChange_;
      break;
    case 14:
      SEL result = sel_applicationsDidChangePersonas_;
      break;
    case 15:
      SEL result = sel_applicationInstallsDidChange_;
      break;
    default:
      return result;
  }

  return result;
}

- (void)sendNotification:(int)a3 forAppProxies:(id)a4 Plugins:(BOOL)a5 completion:(id)a6
{
  BOOL v32 = a5;
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  uint64_t v10 = (uint64_t (**)(void))a6;
  MEMORY[0x186E2AFD4]();
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke;
  v46[3] = &unk_189D72BF0;
  v46[4] = self;
  double v30 = v10;
  int v29 = a3;
  __int128 v28 = self;
  if (sendNotification_forAppProxies_Plugins_completion__onceToken != -1) {
    dispatch_once(&sendNotification_forAppProxies_Plugins_completion__onceToken, v46);
  }
  int v33 = (void *)objc_opt_new();
  uint64_t v31 = (void *)objc_opt_new();
  uint64_t v11 = (void *)objc_opt_new();
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        __int128 v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v17 bundleType];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        char v19 = [v18 isEqualToString:@"Hidden"];

        if ((v19 & 1) == 0)
        {
          [v17 bundleIdentifier];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 addObject:v20];

          [v17 bundleType];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          char v22 = [v21 isEqualToString:@"VPNPlugin"];

          if ((v22 & 1) == 0)
          {
            [v33 addObject:v17];
            if (v32)
            {
              [v17 plugInKitPlugins];
              double v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 addObjectsFromArray:v23];
            }
          }
        }

        [v17 detach];
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v14);
  }

  uint64_t v24 = [v33 count];
  if (v24)
  {
    observersQueue = (dispatch_queue_s *)v28->_observersQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2;
    block[3] = &unk_189D79F78;
    void block[4] = v28;
    int v40 = v29;
    id v35 = v12;
    BOOL v41 = v32;
    id v36 = v33;
    id v37 = v11;
    __int128 v26 = v31;
    id v38 = v31;
    __int128 v27 = v30;
    id v39 = v30;
    dispatch_async(observersQueue, block);
  }

  else
  {
    __int128 v27 = v30;
    __int128 v26 = v31;
    if (v30) {
      uint64_t v24 = v30[2](v30);
    }
    MEMORY[0x186E2AFE0](v24);
  }
}

- (void)sendDatabaseRebuiltNotificationToObserver:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x186E2A59C]();
  [v3 connection];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke;
  v8[3] = &unk_189D73308;
  id v6 = v3;
  id v9 = v6;
  [v5 remoteObjectProxyWithErrorHandler:v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 databaseWasRebuilt];

  objc_autoreleasePoolPop(v4);
}

- (void)sendDatabaseRebuiltNotification
{
  id v3 = (void *)os_transaction_create();
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke;
  v6[3] = &unk_189D72430;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(observersQueue, v6);
}

- (id)_prepareApplicationProxiesForNotification:(int)a3 identifiers:(id)a4 withPlugins:(BOOL)a5
{
  id v7 = a4;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy__47;
  double v23 = __Block_byref_object_dispose__47;
  id v24 = (id)objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  id v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = a3 == 15 || (a3 - 1) < 3;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke;
  v14[3] = &unk_189D79FA0;
  id v11 = v7;
  BOOL v17 = v10;
  id v15 = v11;
  __int128 v16 = &v19;
  BOOL v18 = a5;
  -[LSDBExecutionContext syncRead:](v8, v14);

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v13 = a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x186E2A59C]();
  -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:]( self,  "_prepareApplicationProxiesForNotification:identifiers:withPlugins:",  v8,  v13,  v7);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:]( self,  "sendNotification:forAppProxies:Plugins:completion:",  v8,  v12,  v7,  v10);

  objc_autoreleasePoolPop(v11);
}

- (void)loadProportions
{
}

- (void)saveProportions
{
}

- (void)coalesceProportionsSave
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_183E58000, v3, OS_LOG_TYPE_INFO, "Coalescing progress proportions save", v6, 2u);
  }

  progressProportionsSaveTimerSource = self->_progressProportionsSaveTimerSource;
  dispatch_time_t v5 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer( (dispatch_source_t)progressProportionsSaveTimerSource,  v5,  0xFFFFFFFFFFFFFFFFLL,  0x3B9ACA00uLL);
}

- (void)discardProportionsForBundleID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  _LSProgressLog();
  dispatch_time_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "Discarding proportions for %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_progressProportions, "removeObjectForKey:", v4);
  -[_LSInstallProgressService coalesceProportionsSave](self, "coalesceProportionsSave");
  os_unfair_lock_unlock(&self->_progressProportionsLock);
}

- (id)progressProportionsForBundleID:(id)a3
{
  p_progressProportionsLock = &self->_progressProportionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_progressProportionsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressProportions, "objectForKeyedSubscript:", v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(p_progressProportionsLock);
  return v7;
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = __Block_byref_object_copy__47;
  __int128 v27 = __Block_byref_object_dispose__47;
  id v28 = 0LL;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  _LSServer_DatabaseExecutionContext();
  id v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke;
  uint64_t v20 = &unk_189D79FC8;
  id v13 = v9;
  id v21 = v13;
  char v22 = &v23;
  -[LSDBExecutionContext syncRead:](v12, &v17);

  _LSProgressLog();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v24[5];
    *(_DWORD *)__int128 buf = 138412802;
    id v30 = v13;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "Setting progress proportions for %@ to %@, error is %@",  buf,  0x20u);
  }

  if (!v24[5])
  {
    __int128 v16 = (void *)objc_msgSend(v8, "copy", v17, v18, v19, v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_progressProportions,  "setObject:forKeyedSubscript:",  v16,  v13);

    -[_LSInstallProgressService coalesceProportionsSave](self, "coalesceProportionsSave");
  }

  os_unfair_lock_unlock(&self->_progressProportionsLock);
  v10[2](v10, v24[5]);
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v11);
}

- (void)sendNetworkUsageChangedNotification
{
  installControlsQueue = (dispatch_queue_s *)self->_installControlsQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke;
  block[3] = &unk_189D72BF0;
  void block[4] = self;
  dispatch_async(installControlsQueue, block);
}

- (void)addSendNotificationFenceWithTimeout:(double)a3 fenceBlock:(id)a4
{
  id v6 = a4;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = __Block_byref_object_copy__288;
  v29[4] = __Block_byref_object_dispose__289;
  id v30 = (id)MEMORY[0x186E2A7B8]();
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  __int128 v26 = __Block_byref_object_copy__47;
  __int128 v27 = __Block_byref_object_dispose__47;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = __Block_byref_object_copy__47;
  v21[4] = __Block_byref_object_dispose__47;
  id v22 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v7 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke;
  v20[3] = &unk_189D79FF0;
  v20[4] = v29;
  v20[5] = &v23;
  v20[6] = v21;
  id v8 = (void *)MEMORY[0x186E2A7B8](v20);
  if (a3 >= 0.0 && ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 <= 0x3FE
    || (unint64_t)(*(void *)&a3 - 1LL) <= 0xFFFFFFFFFFFFELL)
  {
    dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_observersQueue);
    id v12 = (void *)v24[5];
    v24[5] = (uint64_t)v11;

    id v13 = (dispatch_source_s *)v24[5];
    dispatch_time_t v14 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    dispatch_source_set_event_handler((dispatch_source_t)v24[5], v8);
    dispatch_resume((dispatch_object_t)v24[5]);
  }

  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  v17[0] = v7;
  v17[1] = 3221225472LL;
  v17[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_290;
  v17[3] = &unk_189D7A068;
  id v18 = v8;
  uint64_t v19 = v21;
  v17[4] = self;
  id v16 = v8;
  dispatch_async(observersQueue, v17);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v29, 8);
}

- (id)loadJournalledNotificationsFromDisk
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  unint64_t v2 = 0x189607000uLL;
  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)__LSDefaultsGetSharedInstance() installJournalDirectoryURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:&__block_literal_global_293];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = (void *)objc_opt_new();
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v34 = v6;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v41;
    unint64_t v11 = 0x189603000uLL;
    while (1)
    {
      uint64_t v12 = 0LL;
      uint64_t v35 = v8;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        dispatch_time_t v14 = *(void **)(v11 + 3912);
        id v39 = v9;
        [v14 dataWithContentsOfURL:v13 options:8 error:&v39];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        id v16 = v39;

        if (!v16)
        {
          uint64_t v18 = v10;
          unint64_t v19 = v11;
          unint64_t v20 = v2;
          id v21 = (void *)MEMORY[0x189607908];
          uint64_t v22 = objc_opt_class();
          id v38 = 0LL;
          objc_msgSend(v21, "ls_unarchivedObjectOfClass:fromData:error:", v22, v15, &v38);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = v38;
          _LSInstallLog();
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          id v24 = v23;
          if (v16)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412546;
              __int128 v45 = v13;
              __int16 v46 = 2112;
              uint64_t v47 = (uint64_t)v16;
              _os_log_error_impl( &dword_183E58000,  v24,  OS_LOG_TYPE_ERROR,  "Error unarchiving notification journal %@: %@",  buf,  0x16u);
            }

            goto LABEL_12;
          }

          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            [v17 primaryBundleID];
            id v28 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v29 = [v17 installOperation];
            *(_DWORD *)__int128 buf = 138412546;
            __int128 v45 = v28;
            __int16 v46 = 2048;
            uint64_t v47 = v29;
            _os_log_impl( &dword_183E58000,  v24,  OS_LOG_TYPE_DEFAULT,  "Loaded notification journaller for %@, install op %lu",  buf,  0x16u);
          }

          if ([v17 applicableForCurrentDatabase])
          {
            [v34 addObject:v17];
          }

          else
          {
            _LSInstallLog();
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              [v17 primaryBundleID];
              id v30 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v31 = [v17 installOperation];
              *(_DWORD *)__int128 buf = 138412546;
              __int128 v45 = v30;
              __int16 v46 = 2048;
              uint64_t v47 = v31;
              _os_log_impl( &dword_183E58000,  v24,  OS_LOG_TYPE_DEFAULT,  "Notification journaller for %@, install op %lu, not applicable for current database",  buf,  0x16u);
            }

- (void)performJournalRecovery
{
  uint64_t v3 = MEMORY[0x1895F87A8];
  observersQueue = (dispatch_queue_s *)self->_observersQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke;
  block[3] = &unk_189D72BF0;
  void block[4] = self;
  dispatch_sync(observersQueue, block);
  id v5 = (dispatch_queue_s *)self->_observersQueue;
  v6[0] = v3;
  v6[1] = 3221225472LL;
  v6[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_2;
  v6[3] = &unk_189D72BF0;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)dispatchJournalledNotificationsToConnectedClients
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = self->_journalledNotificationsToReplay;
  uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v36,  16LL);
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v3;
        id v4 = *(void **)(*((void *)&v25 + 1) + 8 * v3);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        [v4 journalledNotifications];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v22;
          do
          {
            for (uint64_t i = 0LL; i != v7; ++i)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v11 = [v10 notification];
              [v10 bundleIDs];
              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:]( self,  "_prepareApplicationProxiesForNotification:identifiers:withPlugins:",  v11,  v12,  [v10 includePlugins]);
              id v13 = (void *)objc_claimAutoreleasedReturnValue();

              _LSInstallLog();
              dispatch_time_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                int v15 = [v10 notification];
                int v16 = [v10 includePlugins];
                *(_DWORD *)__int128 buf = 67109634;
                int v30 = v15;
                __int16 v31 = 2112;
                uint64_t v32 = v13;
                __int16 v33 = 1024;
                int v34 = v16;
                _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "dispatching journalled notification: %d for %@ (plugins: %d)",  buf,  0x18u);
              }

              -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:]( self,  "sendNotification:forAppProxies:Plugins:completion:",  [v10 notification],  v13,  objc_msgSend(v10, "includePlugins"),  0);
            }

            uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v35 count:16];
          }

          while (v7);
        }

        uint64_t v3 = v20 + 1;
      }

      while (v20 + 1 != v19);
      uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v36,  16LL);
    }

    while (v19);
  }
}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserverProxy:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v22 = a5;
  id v9 = -[_LSInstallProgressService observerSelectorForNotification:](self, "observerSelectorForNotification:", v6);
  if (v9)
  {
    uint64_t v10 = v9;
    [MEMORY[0x189603FA8] array];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v20 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(obj);
          }
          int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "bundleType", v20);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v17 isEqualToString:@"Hidden"])
          {
          }

          else
          {
            [v16 bundleType];
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            char v19 = [v18 isEqualToString:@"VPNPlugin"];

            if ((v19 & 1) == 0) {
              [v11 addObject:v16];
            }
          }

          objc_msgSend(v22, v10, v11);
        }

        uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v13);
    }

    id v8 = v20;
  }
}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserver:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  [v8 connection];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke;
  v13[3] = &unk_189D73308;
  id v14 = v8;
  id v11 = v8;
  [v10 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LSInstallProgressService directlySendNotification:withProxies:toObserverProxy:]( self,  "directlySendNotification:withProxies:toObserverProxy:",  v6,  v9,  v12);
}

- (void)dispatchJournalledNotificationsToObserver:(id)a3
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  _LSProgressLog();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    unint64_t v48 = (unint64_t)v4;
    _os_log_impl( &dword_183E58000,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending journalled notifications to newly connecting observer %@",  buf,  0xCu);
  }

  [v4 connection];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke;
  v44[3] = &unk_189D73308;
  id v27 = v4;
  id v45 = v27;
  [v6 remoteObjectProxyWithErrorHandler:v44];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = self->_journalledNotificationsToReplay;
  uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
  if (v30)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v8;
        id v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        [v9 journalledNotifications];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v37;
          do
          {
            for (uint64_t i = 0LL; i != v12; ++i)
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              _LSProgressLog();
              int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                unint64_t v17 = [v15 notification];
                [v15 bundleIDs];
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)__int128 buf = 134218242;
                unint64_t v48 = v17;
                __int16 v49 = 2112;
                __int16 v50 = v18;
                _os_log_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_INFO,  "Sending notification %lu for bundles %@ to observer.",  buf,  0x16u);
              }

              uint64_t v19 = [v15 notification];
              [v15 bundleIDs];
              id v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:]( self,  "_prepareApplicationProxiesForNotification:identifiers:withPlugins:",  v19,  v20,  [v15 includePlugins]);
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[_LSInstallProgressService directlySendNotification:withProxies:toObserverProxy:]( self,  "directlySendNotification:withProxies:toObserverProxy:",  [v15 notification],  v21,  v7);
            }

            uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v51 count:16];
          }

          while (v12);
        }

        uint64_t v8 = v31 + 1;
      }

      while (v31 + 1 != v30);
      uint64_t v30 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v52,  16LL);
    }

    while (v30);
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v22 = self->_startupJournalledNotifications;
  uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v46,  16LL);
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t j = 0LL; j != v24; ++j)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * j) dispatchToObserver:v27 forInstallProgressService:self];
      }

      uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v32,  v46,  16LL);
    }

    while (v24);
  }
}

- (void).cxx_destruct
{
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
}

- (void)observeValueForKeyPath:(os_log_s *)a3 ofObject:change:context:.cold.4( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a3,  (uint64_t)a3,  "LSInstallProgress: setting parent installState to %@",  (uint8_t *)a2);
}

- (void)parentProgressForApplication:(void *)a1 andPhase:(uint64_t)a2 isActive:(os_log_s *)a3 .cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a1 _LSDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_183E58000, a3, OS_LOG_TYPE_DEBUG, "Got parent progress %@ for app %@, ", v6, 0x16u);

  OUTLINED_FUNCTION_18_0();
}

- (void)installationFailedForApplication:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  v0,  v1,  "Could not find applicationProxy for %@ in installationFailedForApplication:",  v2);
  OUTLINED_FUNCTION_1();
}

- (void)installationFailedForApplication:.cold.2()
{
}

@end
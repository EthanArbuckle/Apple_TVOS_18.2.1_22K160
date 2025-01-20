@interface MADAutoSetLocker
+ (BOOL)additionalLockedByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 lockError:(id *)a7;
+ (BOOL)continuedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 continueError:(id *)a7;
+ (BOOL)endedAllPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6;
+ (BOOL)endedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6;
+ (BOOL)endedPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7;
+ (BOOL)lockedByClient:(id)a3 forAssetSetIdentifier:(id)a4 forAtomicInstance:(id)a5 forLockReason:(id)a6 withUsagePolicy:(id)a7 lockError:(id *)a8;
+ (id)autoAssetLocker;
+ (id)copyOfLocksBySelector;
+ (id)lockedSelectorsForEliminate:(id)a3;
+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5;
+ (id)newCurrentLockUsageForSelector:(id)a3;
+ (void)copyOfLocksBySelector;
+ (void)forceGlobalUnlock:(id)a3;
+ (void)resumeFromPersistedWithDownloadedSelectors:(id)a3;
- (BOOL)_anyCurrentLocksForEliminate:(id)a3;
- (BOOL)_endLockDecideUnlocked:(id)a3;
- (BOOL)_endLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7;
- (BOOL)_persistAssetLock:(id)a3 operation:(id)a4 forAssetLock:(id)a5 message:(id)a6;
- (MADAutoAssetPersisted)persistedState;
- (MADAutoSetLocker)init;
- (NSMutableDictionary)eliminateSelectors;
- (NSMutableDictionary)locksBySelector;
- (OS_dispatch_queue)lockerQueue;
- (SUCoreLog)logger;
- (id)_assetIDOfLock:(id)a3;
- (id)_newAssetLockSummaryWithoutSelectorOrAttributes:(id)a3;
- (id)_refreshFilesystemMetadataLastInterest:(id)a3;
- (id)summary;
- (int64_t)_currentLockCountOfLock:(id)a3;
- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingAssetLock:(id)a5 forSelector:(id)a6 message:(id)a7;
- (void)_logPersistedRemovedEntry:(id)a3 removedAssetLock:(id)a4 forSelector:(id)a5 message:(id)a6;
- (void)_logPersistedTableOfContents:(id)a3;
- (void)_mergeAddedLock:(id)a3 intoExistingLock:(id)a4;
- (void)_mergeContinuedLock:(id)a3 intoExistingLock:(id)a4;
- (void)_persistRemoveAssetLock:(id)a3 removedAssetLock:(id)a4 message:(id)a5;
- (void)_removeAssetLock:(id)a3 lastClient:(id)a4 forSelector:(id)a5 message:(id)a6;
- (void)setEliminateSelectors:(id)a3;
- (void)setLocksBySelector:(id)a3;
@end

@implementation MADAutoSetLocker

- (MADAutoSetLocker)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MADAutoSetLocker;
  v2 = -[MADAutoSetLocker init](&v20, "init");
  if (v2)
  {
    v3 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"AUTO-LOCKER");
    logger = v2->_logger;
    v2->_logger = v3;

    v5 = (const char *)[@"com.apple.MobileAsset.daemon.autoassetlocker" UTF8String];
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    lockerQueue = v2->_lockerQueue;
    v2->_lockerQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    locksBySelector = v2->_locksBySelector;
    v2->_locksBySelector = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    eliminateSelectors = v2->_eliminateSelectors;
    v2->_eliminateSelectors = v12;

    v14 = -[MADAutoAssetPersisted initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:]( objc_alloc(&OBJC_CLASS___MADAutoAssetPersisted),  "initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:",  @"AutoAssetLocker",  @"1.0",  v2->_lockerQueue,  v2->_logger,  0LL,  &__block_literal_global_10);
    persistedState = v2->_persistedState;
    v2->_persistedState = v14;

    v16 = (dispatch_queue_s *)v2->_lockerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __24__MADAutoSetLocker_init__block_invoke_2;
    block[3] = &unk_34DBC0;
    v19 = v2;
    dispatch_sync(v16, block);
  }

  return v2;
}

NSDictionary *__cdecl __24__MADAutoSetLocker_init__block_invoke(id a1, NSString *a2, NSString *a3, NSDictionary *a4)
{
  return (NSDictionary *)+[MADAutoSetLocker migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:]( &OBJC_CLASS___MADAutoSetLocker,  "migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:",  a2,  a3,  a4);
}

id __24__MADAutoSetLocker_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) flushPersistedStateCacheAndSetCachingBehaviour:1];
}

+ (id)autoAssetLocker
{
  if (autoAssetLocker_dispatchOnceAutoAssetLocker != -1) {
    dispatch_once(&autoAssetLocker_dispatchOnceAutoAssetLocker, &__block_literal_global_618);
  }
  return (id)autoAssetLocker___autoAssetLocker;
}

void __35__MADAutoSetLocker_autoAssetLocker__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoSetLocker);
  v2 = (void *)autoAssetLocker___autoAssetLocker;
  autoAssetLocker___autoAssetLocker = (uint64_t)v1;
}

+ (BOOL)lockedByClient:(id)a3 forAssetSetIdentifier:(id)a4 forAtomicInstance:(id)a5 forLockReason:(id)a6 withUsagePolicy:(id)a7 lockError:(id *)a8
{
  return 0;
}

+ (BOOL)additionalLockedByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 lockError:(id *)a7
{
  return 0;
}

+ (BOOL)continuedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 continueError:(id *)a7
{
  return 0;
}

+ (BOOL)endedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6
{
  return 0;
}

+ (BOOL)endedPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7
{
  return 0;
}

+ (BOOL)endedAllPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6
{
  return 0;
}

- (BOOL)_endLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7
{
  return 0;
}

- (int64_t)_currentLockCountOfLock:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lockReasons", 0));
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    int64_t v9 = 0LL;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);
        id v15 = [v14 safeObjectForKey:v12 ofClass:objc_opt_class(MANAutoAssetSetLockTracker)];
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        if (v16) {
          v9 += (int64_t)[v16 activeLockCount];
        }

        objc_autoreleasePoolPop(v13);
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  else
  {
    int64_t v9 = 0LL;
  }

  return v9;
}

- (id)_assetIDOfLock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fullAssetSelector]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetAttributes]);

  AssetIdFromDict = getAssetIdFromDict(v5, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(AssetIdFromDict);

  return v8;
}

+ (id)newCurrentLockUsageForSelector:(id)a3
{
  id v3 = a3;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy__8;
  v30 = __Block_byref_object_dispose__8;
  v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoSetLocker autoAssetLocker](&OBJC_CLASS___MADAutoSetLocker, "autoAssetLocker"));
  v5 = v4;
  if (v4)
  {
    dispatch_queue_attr_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __51__MADAutoSetLocker_newCurrentLockUsageForSelector___block_invoke;
    block[3] = &unk_34E790;
    v23 = (os_log_s *)v3;
    id v24 = v5;
    v25 = &v26;
    dispatch_sync(v6, block);

    id v7 = v23;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker newCurrentLockUsageForSelector:].cold.1();
    }
  }

  if (![(id)v27[5] count])
  {
    int64_t v9 = (void *)v27[5];
    v27[5] = 0LL;
  }

  uint64_t v10 = (void *)v27[5];
  if (v10)
  {
    v11 = (char *)[v10 count];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v3 summary]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([(id)v27[5] safeSummary]);
      v16 = (void *)v15;
      v17 = @"s";
      *(_DWORD *)buf = 138544130;
      __int16 v34 = 2048;
      id v33 = v14;
      if (v11 == (_BYTE *)&dword_0 + 1) {
        v17 = &stru_355768;
      }
      id v35 = v11;
      __int16 v36 = 2114;
      v37 = v17;
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentLockUsageForSelector} | assetSelector:%{public}@ | %ld current lock-reason%{public}@:%{public}@",  buf,  0x2Au);
    }
  }

  else
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      *(_DWORD *)buf = 138543362;
      id v33 = v19;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentLockUsageForSelector} | assetSelector:%{public}@ | no current lock-reasons",  buf,  0xCu);
    }
  }

  id v20 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __51__MADAutoSetLocker_newCurrentLockUsageForSelector___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetVersion]);

  if (!v2)
  {
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) locksBySelector]);
    id v76 = [v7 countByEnumeratingWithState:&v92 objects:v102 count:16];
    if (!v76) {
      goto LABEL_46;
    }
    uint64_t v33 = *(void *)v93;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v74 = *(void *)v93;
    v75 = v7;
LABEL_19:
    uint64_t v35 = 0LL;
    while (1)
    {
      if (*(void *)v93 != v33) {
        objc_enumerationMutation(v7);
      }
      uint64_t v77 = v35;
      uint64_t v36 = *(void *)(*((void *)&v92 + 1) + 8 * v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) locksBySelector]);
      id v38 = [v37 safeObjectForKey:v36 ofClass:objc_opt_class(MANAutoAssetSetLock)];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

      v40 = p_ivars[155];
      v41 = (void *)objc_claimAutoreleasedReturnValue([v39 fullAssetSelector]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 assetType]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) assetType]);
      v44 = p_ivars[155];
      v45 = (void *)objc_claimAutoreleasedReturnValue([v39 fullAssetSelector]);
      v79 = v39;
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 assetSpecifier]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) assetSpecifier]);
      LODWORD(v44) = -[__objc2_ivar_list stringIsEqual:to:](v44, "stringIsEqual:to:", v46, v47);

      p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
      uint64_t v39 = v79;
      v48 = &MobileAssetKeyManager__metaData.ivars;

      id v7 = v75;
      if ((_DWORD)v44)
      {
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue([v79 lockReasons]);
        id v49 = [obja countByEnumeratingWithState:&v88 objects:v101 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v83 = *(void *)v89;
          v51 = obja;
          do
          {
            for (i = 0LL; i != v50; i = (char *)i + 1)
            {
              if (*(void *)v89 != v83) {
                objc_enumerationMutation(v51);
              }
              uint64_t v53 = *(void *)(*((void *)&v88 + 1) + 8LL * (void)i);
              v54 = objc_autoreleasePoolPush();
              v55 = (void *)objc_claimAutoreleasedReturnValue([v39 lockReasons]);
              id v56 = [v55 safeObjectForKey:v53 ofClass:objc_opt_class(v48[246])];
              v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

              if (v57)
              {
                v58 = (void *)objc_claimAutoreleasedReturnValue([v57 clientLockReason]);
                v59 = (void *)objc_claimAutoreleasedReturnValue([v58 lockReason]);

                if (v59)
                {
                  uint64_t v60 = v1;
                  v61 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8LL) + 40LL);
                  v62 = (void *)objc_claimAutoreleasedReturnValue([v57 clientLockReason]);
                  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 lockReason]);
                  id v64 = [v61 safeObjectForKey:v63 ofClass:objc_opt_class(NSNumber)];
                  v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

                  v66 = objc_alloc(&OBJC_CLASS___NSNumber);
                  if (v65)
                  {
                    v67 = -[NSNumber initWithLong:]( v66,  "initWithLong:",  (char *)[v57 activeLockCount] + (int)objc_msgSend(v65, "intValue"));
                  }

                  else
                  {
                    v67 = -[NSNumber initWithLong:](v66, "initWithLong:", [v57 activeLockCount]);
                  }

                  v68 = *(void **)(*(void *)(*(void *)(v60 + 48) + 8LL) + 40LL);
                  v69 = (void *)objc_claimAutoreleasedReturnValue([v57 clientLockReason]);
                  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 lockReason]);
                  [v68 setSafeObject:v67 forKey:v70];

                  uint64_t v1 = v60;
                  v48 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                  uint64_t v39 = v79;
                  v51 = obja;
                }
              }

              objc_autoreleasePoolPop(v54);
            }

            id v50 = [v51 countByEnumeratingWithState:&v88 objects:v101 count:16];
          }

          while (v50);
          uint64_t v33 = v74;
          id v7 = v75;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        }

        goto LABEL_39;
      }

+ (id)copyOfLocksBySelector
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__8;
  id v17 = __Block_byref_object_dispose__8;
  __int128 v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoSetLocker autoAssetLocker](&OBJC_CLASS___MADAutoSetLocker, "autoAssetLocker"));
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 lockerQueue]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __41__MADAutoSetLocker_copyOfLocksBySelector__block_invoke;
    v10[3] = &unk_34DEB0;
    uint64_t v11 = v3;
    uint64_t v12 = &v13;
    dispatch_sync(v4, v10);

    v5 = v11;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker copyOfLocksBySelector].cold.1();
    }
  }

  if (![(id)v14[5] count])
  {
    id v7 = (void *)v14[5];
    v14[5] = 0LL;
  }

  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __41__MADAutoSetLocker_copyOfLocksBySelector__block_invoke(uint64_t a1)
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locksBySelector]);
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      v5 = 0LL;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v5);
        id v7 = objc_autoreleasePoolPush();
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locksBySelector]);
        id v9 = [v8 safeObjectForKey:v6 ofClass:objc_opt_class(MANAutoAssetSetLock)];
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        if (v11)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSafeObject:v10 forKey:v6];
        }

        else
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
            uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 summary]);
            *(_DWORD *)buf = 138543874;
            v23 = v14;
            __int16 v24 = 2114;
            uint64_t v25 = v6;
            __int16 v26 = 2114;
            uint64_t v27 = v15;
            v16 = (void *)v15;
            _os_log_error_impl( &dword_0,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@ | {copyOfLocksBySelector} assetLock on locksBySelector with nil fullAssetSelector | selectorNam e:%{public}@ | assetLock:%{public}@",  buf,  0x20u);
          }
        }

        objc_autoreleasePoolPop(v7);
        v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    }

    while (v3);
  }
}

+ (id)lockedSelectorsForEliminate:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  __int128 v19 = __Block_byref_object_copy__8;
  __int128 v20 = __Block_byref_object_dispose__8;
  __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoSetLocker autoAssetLocker](&OBJC_CLASS___MADAutoSetLocker, "autoAssetLocker"));
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __48__MADAutoSetLocker_lockedSelectorsForEliminate___block_invoke;
    block[3] = &unk_34E790;
    uint64_t v13 = v5;
    id v14 = v3;
    uint64_t v15 = &v16;
    dispatch_sync(v6, block);

    id v7 = v13;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker lockedSelectorsForEliminate:].cold.1();
    }
  }

  if (![(id)v17[5] count])
  {
    id v9 = (void *)v17[5];
    v17[5] = 0LL;
  }

  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __48__MADAutoSetLocker_lockedSelectorsForEliminate___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locksBySelector]);
  id v2 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v59;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
    uint64_t v54 = *(void *)v59;
    uint64_t v51 = v1;
    do
    {
      id v7 = 0LL;
      id v55 = v3;
      do
      {
        if (*(void *)v59 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v7);
        v57 = objc_autoreleasePoolPush();
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) locksBySelector]);
        id v10 = [v9 safeObjectForKey:v8 ofClass:objc_opt_class(p_ivars[247])];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

        if (!v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
            uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
            v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) summary]);
            *(_DWORD *)buf = 138543874;
            v63 = v35;
            __int16 v64 = 2114;
            v65 = v36;
            __int16 v66 = 2114;
            v67 = v37;
            _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ | {lockedSelectorsForEliminate} assetLock on locksBySelector with nil fullAssetSelector | asset Lock:%{public}@ | eliminateSelector:%{public}@",  buf,  0x20u);

            uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          }

          goto LABEL_31;
        }

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) summary]);
          *(_DWORD *)buf = 138543874;
          v63 = v15;
          __int16 v64 = 2114;
          v65 = v16;
          __int16 v66 = 2114;
          v67 = v17;
          _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {lockedSelectorsForEliminate} considering current lock | assetLock:%{public}@ | eliminateSelector:%{public}@",  buf,  0x20u);

          uint64_t v6 = &MobileAssetKeyManager__metaData.ivars;
        }

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetVersion]);
        if (v18)
        {
          __int128 v19 = v6[155];
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s assetType](v14, "assetType"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetType]);
          if ((-[__objc2_ivar_list stringIsEqual:to:](v19, "stringIsEqual:to:", v20, v21) & 1) == 0)
          {

            uint64_t v4 = v54;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            goto LABEL_31;
          }

          v22 = v6[155];
          v23 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetSpecifier]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetSpecifier]);
          if (!-[__objc2_ivar_list stringIsEqual:to:](v22, "stringIsEqual:to:", v24, v25))
          {

            uint64_t v4 = v54;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            goto LABEL_30;
          }

          v52 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v52 assetVersion]);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetVersion]);
          unsigned int v53 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v26, v27);

          uint64_t v1 = v51;
          uint64_t v4 = v54;
          id v3 = v55;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          uint64_t v28 = v57;
          if (!v53) {
            goto LABEL_33;
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v51 + 32) logger]);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v51 + 32) summary]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v51 + 40) summary]);
            *(_DWORD *)buf = 138543618;
            v63 = v31;
            __int16 v64 = 2114;
            v65 = v32;
            uint64_t v33 = v30;
            __int16 v34 = "%{public}@ | {lockedSelectorsForEliminate} eliminate-selector for asset-type + asset-specifier + asset"
                  "-version associated with current lock | eliminateSelector:%{public}@";
LABEL_27:
            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0x16u);

            id v3 = v55;
          }
        }

        else
        {
          id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetSpecifier]);

          uint64_t v39 = v6[155];
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s assetType](v14, "assetType"));
          v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetType]);
          unsigned int v42 = -[__objc2_ivar_list stringIsEqual:to:](v39, "stringIsEqual:to:", v40, v41);
          unsigned int v43 = v42;
          if (!v38)
          {

            id v3 = v55;
            uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            uint64_t v28 = v57;
            if (!v43) {
              goto LABEL_33;
            }
            id v49 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 oslog]);

            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) summary]);
            *(_DWORD *)buf = 138543618;
            v63 = v31;
            __int16 v64 = 2114;
            v65 = v32;
            uint64_t v33 = v30;
            __int16 v34 = "%{public}@ | {lockedSelectorsForEliminate} eliminate-selector for asset-type associated with current l"
                  "ock | eliminateSelector:%{public}@";
            goto LABEL_27;
          }

          if ((v42 & 1) == 0)
          {

LABEL_30:
            id v3 = v55;
            uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
LABEL_31:
            uint64_t v28 = v57;
            goto LABEL_32;
          }

          v44 = (void *)objc_claimAutoreleasedReturnValue([v11 fullAssetSelector]);
          v45 = (void *)objc_claimAutoreleasedReturnValue([v44 assetSpecifier]);
          v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) assetSpecifier]);
          unsigned int v47 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v45, v46);

          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          uint64_t v4 = v54;

          uint64_t v6 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          id v3 = v55;
          uint64_t v28 = v57;
          if (!v47) {
            goto LABEL_33;
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
            v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) summary]);
            *(_DWORD *)buf = 138543618;
            v63 = v31;
            __int16 v64 = 2114;
            v65 = v32;
            uint64_t v33 = v30;
            __int16 v34 = "%{public}@ | {lockedSelectorsForEliminate} eliminate-selector for asset-type + asset-specifier associa"
                  "ted with current lock | eliminateSelector:%{public}@";
            goto LABEL_27;
          }
        }

- (void)_removeAssetLock:(id)a3 lastClient:(id)a4 forSelector:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);
  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker locksBySelector](self, "locksBySelector"));
    [v16 removeObjectForKey:v15];

    -[MADAutoSetLocker _persistRemoveAssetLock:removedAssetLock:message:]( self,  "_persistRemoveAssetLock:removedAssetLock:message:",  @"_removeAssetLock",  v10,  v13);
    else {
      uint64_t v17 = 302LL;
    }
    int64_t v18 = -[MADAutoSetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v10);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v10));
    if (v11) {
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v17,  1LL,  v11,  v18,  v19,  v12);
    }
    else {
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:forAssetID:withSelector:",  v17,  1LL,  3LL,  v18,  v19,  v12);
    }
  }

  else
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](self, "summary"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      int v25 = 138544130;
      __int16 v26 = v22;
      __int16 v27 = 2114;
      id v28 = v13;
      __int16 v29 = 2114;
      v30 = v23;
      __int16 v31 = 2114;
      v32 = v24;
      _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ | {_removeAssetLock} | %{public}@: | no entry ID for fullAssetSelector:%{public}@ | assetLock:%{public}@",  (uint8_t *)&v25,  0x2Au);
    }
  }
}

+ (void)resumeFromPersistedWithDownloadedSelectors:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoSetLocker autoAssetLocker](&OBJC_CLASS___MADAutoSetLocker, "autoAssetLocker"));
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_633;
    v8[3] = &unk_34DB98;
    id v9 = v5;
    id v10 = v3;
    dispatch_async(v6, v8);
  }

  else
  {
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
    dispatch_async(v7, &__block_literal_global_632);
  }
}

void __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke(id a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 oslog]);

  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_cold_1();
  }

  +[MADAutoAssetControlManager lockerResumed](&OBJC_CLASS___MADAutoAssetControlManager, "lockerResumed");
}

void __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_633(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  [v2 loadPersistedState:@"resumeFromPersistedWithDownloadedSelectors"];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistedEntryIDs:@"resumeFromPersistedWithDownloadedSelectors"]);

  if ([v4 count])
  {
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    v45 = v4;
    id obj = v4;
    id v50 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (!v50) {
      goto LABEL_25;
    }
    uint64_t v49 = *(void *)v53;
    uint64_t v47 = v1;
    while (1)
    {
      for (i = 0LL; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v53 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        id v7 = objc_autoreleasePoolPush();
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 persistedEntry:v6 fromLocation:@"resumeFromPersistedWithDownloadedSelectors"]);

        if (v9)
        {
          v48 = v6;
          uint64_t v51 = v7;
          id v10 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetLock);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetLockTracker);
          uint64_t v15 = v9;
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetPolicy);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSURL);
          uint64_t v44 = v16;
          id v9 = v15;
          __int128 v19 = -[NSSet initWithObjects:]( v10,  "initWithObjects:",  v11,  v12,  v13,  v14,  v44,  v17,  v18,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
          id v20 = [v15 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MANAutoAssetSetLock) encodeClasses:v19];
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = v21;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);

            uint64_t v1 = v47;
            if (v23)
            {
              __int16 v24 = *(void **)(v47 + 40);
              int v25 = (void *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
              LOBYTE(v24) = [v24 containsObject:v25];

              __int16 v26 = *(void **)(v47 + 32);
              if ((v24 & 1) != 0)
              {
                __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
                [v26 _logPersistedEntry:@"resumeFromPersistedWithDownloadedSelectors" operation:@"ENTRY_LOAD" persistingAssetLock:v22 forSelector:v27 message:@"resumed from persisted-state for currently downloaded selector"];

                id v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v47 + 32) locksBySelector]);
                [v28 setSafeObject:v22 forKey:v48];
              }

              else
              {
                __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v47 + 32) logger]);
                uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v57 = v48;
                  _os_log_error_impl( &dword_0,  v35,  OS_LOG_TYPE_ERROR,  "{resumeFromPersistedWithDownloadedSelectors} | downloaded asset selector does not contain persisted entry:%{public}@",  buf,  0xCu);
                }

                uint64_t v36 = *(void **)(v47 + 32);
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
                [v36 _removeAssetLock:v22 lastClient:0 forSelector:v28 message:@"downloaded asset selector does not contain persisted entry"];
              }

              goto LABEL_22;
            }

            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v47 + 32) logger]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v33 oslog]);

            if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v57 = v48;
              __int16 v31 = (os_log_s *)v28;
              v32 = "{resumeFromPersistedWithDownloadedSelectors} | missing asset selector for entry:%{public}@";
LABEL_18:
              _os_log_error_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
            }
          }

          else
          {
            uint64_t v1 = v47;
            v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v47 + 32) logger]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v30 oslog]);

            if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v57 = v48;
              __int16 v31 = (os_log_s *)v28;
              v32 = "{resumeFromPersistedWithDownloadedSelectors} | no asset-lock entry found for entry:%{public}@";
              goto LABEL_18;
            }
          }

void __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_649(id a1)
{
}

- (BOOL)_persistAssetLock:(id)a3 operation:(id)a4 forAssetLock:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 fullAssetSelector]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistedEntryID]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 persistedEntry:v16 fromLocation:v10]);

  if (v18)
  {
    [v18 persistSecureCodedObject:v12 forKey:@"assetLock"];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
    [v19 storePersistedEntry:v16 withEntrySummary:v20 fromLocation:v10];

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 fullAssetSelector]);
    -[MADAutoSetLocker _logPersistedEntry:operation:persistingAssetLock:forSelector:message:]( self,  "_logPersistedEntry:operation:persistingAssetLock:forSelector:message:",  v10,  v11,  v12,  v21,  v13);
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MADAutoSetLocker _persistAssetLock:operation:forAssetLock:message:].cold.1((uint64_t)v10, v12);
    }
  }

  return v18 != 0LL;
}

- (void)_persistRemoveAssetLock:(id)a3 removedAssetLock:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 persistedEntry:v13 fromLocation:v8]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
    [v16 removePersistedEntry:v13 fromLocation:v8];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
    -[MADAutoSetLocker _logPersistedRemovedEntry:removedAssetLock:forSelector:message:]( self,  "_logPersistedRemovedEntry:removedAssetLock:forSelector:message:",  v8,  v9,  v17,  v10);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MADAutoSetLocker _persistRemoveAssetLock:removedAssetLock:message:].cold.1((uint64_t)v8, v9);
    }
  }
}

- (void)_mergeAddedLock:(id)a3 intoExistingLock:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v12 lockUsagePolicy]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 lockUsagePolicy]);
    [v6 setLockUsagePolicy:v9];
  }

  objc_msgSend(v6, "setActiveLockCount:", (char *)objc_msgSend(v6, "activeLockCount") + 1);
  id v10 = [v6 activeLockCount];
  objc_msgSend(v6, "setTotalLockCount:", (char *)objc_msgSend(v6, "totalLockCount") + 1);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setLastRefreshTimestamp:v11];
}

- (void)_mergeContinuedLock:(id)a3 intoExistingLock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 lockUsagePolicy]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 lockUsagePolicy]);
    [v6 setLockUsagePolicy:v9];
  }

  objc_msgSend(v6, "setContinueCount:", (char *)objc_msgSend(v6, "continueCount") + 1);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setLastRefreshTimestamp:v10];
}

- (BOOL)_endLockDecideUnlocked:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (uint64_t)[v4 activeLockCount] < 1;
  return v6;
}

+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5
{
  return 0LL;
}

- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingAssetLock:(id)a5 forSelector:(id)a6 message:(id)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (__CFString *)a7;
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  v13));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v15 persistedEntryID]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
      id v23 = -[MADAutoSetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v14);
      *(_DWORD *)buf = 138546434;
      id v28 = @"PERSISTED";
      __int16 v29 = 2114;
      v30 = @"AUTO-LOCKER";
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      __int16 v34 = @"LOCKR";
      __int16 v35 = 2114;
      uint64_t v36 = @">----->";
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v12;
      __int16 v39 = 2114;
      v40 = v16;
      __int16 v41 = 2114;
      unsigned int v42 = @"LOCKR";
      __int16 v43 = 2114;
      uint64_t v44 = v18;
      __int16 v45 = 2114;
      v46 = v22;
      __int16 v47 = 2114;
      id v48 = v23;
      __int16 v49 = 2114;
      id v50 = @"LOCKR";
      __int16 v51 = 2114;
      __int128 v52 = @"<-----<";
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@] | %{public}@\n #_%{public}@:%{public}@",  buf,  0x84u);
    }
  }

  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](self, "summary"));
    *(_DWORD *)buf = 138544642;
    id v28 = v26;
    __int16 v29 = 2114;
    v30 = v12;
    __int16 v31 = 2114;
    id v32 = v13;
    __int16 v33 = 2114;
    __int16 v34 = v16;
    __int16 v35 = 2114;
    __int16 v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
    uint64_t v36 = v24;
    __int16 v37 = 2114;
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v14 summary]);
    int v25 = (void *)v38;
    _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedEntry} %{public}@ | no fullAssetSelectorKey | %{public}@ | fullAssetSelector :%{public}@ | assetLock:%{public}@",  buf,  0x3Eu);
  }
}

- (void)_logPersistedRemovedEntry:(id)a3 removedAssetLock:(id)a4 forSelector:(id)a5 message:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (__CFString *)a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  @"ENTRY_REMOVE"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

  if (!v16)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    __int128 v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](self, "summary"));
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    __int128 v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
    int v22 = 138544386;
    id v23 = v19;
    __int16 v24 = 2114;
    int v25 = v10;
    __int16 v26 = 2114;
    __int16 v27 = v13;
    __int16 v28 = 2114;
    __int16 v29 = v20;
    __int16 v30 = 2114;
    __int16 v31 = v21;
    _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedRemovedEntry} | no fullAssetSelectorKey to remove | %{public}@ | fullAssetSe lector:%{public}@ | assetLock:%{public}@",  (uint8_t *)&v22,  0x34u);

    goto LABEL_4;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v19 = -[MADAutoSetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v11);
    int v22 = 138546434;
    id v23 = @"PERSISTED";
    __int16 v24 = 2114;
    int v25 = @"AUTO-LOCKER";
    __int16 v26 = 2114;
    __int16 v27 = @"ENTRY_REMOVE";
    __int16 v28 = 2114;
    __int16 v29 = @"LOCKR";
    __int16 v30 = 2114;
    __int16 v31 = @">----->";
    __int16 v32 = 2114;
    __int16 v33 = v10;
    __int16 v34 = 2114;
    __int16 v35 = v13;
    __int16 v36 = 2114;
    __int16 v37 = @"LOCKR";
    __int16 v38 = 2114;
    __int16 v39 = v15;
    __int16 v40 = 2114;
    __int16 v41 = v16;
    __int16 v42 = 2114;
    __int16 v43 = v19;
    __int16 v44 = 2114;
    __int16 v45 = @"LOCKR";
    __int16 v46 = 2114;
    __int16 v47 = @"<-----<";
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@] | %{public}@\n #_%{public}@:%{public}@",  (uint8_t *)&v22,  0x84u);
LABEL_4:
  }

- (void)_logPersistedTableOfContents:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  if (+[MADAutoAssetControlManager preferencePersistedTableLoggingEnabled]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferencePersistedTableLoggingEnabled"))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryIDs:v4]);

    if ([v7 count])
    {
      id v8 = (const __CFString *)[v7 count];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544642;
        __int16 v42 = @"PERSISTED";
        __int16 v43 = 2114;
        __int16 v44 = @"AUTO-LOCKER";
        __int16 v45 = 2114;
        __int16 v46 = @"ENTRY_LOAD";
        __int16 v47 = 2114;
        id v48 = @"LOCKR";
        __int16 v49 = 2114;
        id v50 = @">----->";
        __int16 v51 = 2114;
        __int128 v52 = v4;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} table-of-contents...",  buf,  0x3Eu);
      }

      if ((uint64_t)v8 >= 1)
      {
        uint64_t v11 = 0LL;
        __int16 v36 = v7;
        __int16 v37 = v4;
        do
        {
          id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v11]);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker persistedState](self, "persistedState"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntry:v12 fromLocation:v4]);

          if (v14)
          {
            __int16 v40 = objc_alloc(&OBJC_CLASS___NSSet);
            uint64_t v39 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetLock);
            uint64_t v38 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetLockTracker);
            uint64_t v17 = v8;
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___MANAutoAssetSetPolicy);
            uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString);
            uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSURL);
            uint64_t v33 = v18;
            id v8 = v17;
            __int128 v19 = -[NSSet initWithObjects:]( v40,  "initWithObjects:",  v39,  v38,  v15,  v16,  v33,  v34,  v35,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
            id v20 = [v14 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MANAutoAssetSetLock) encodeClasses:v19];
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            int v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v24 = -[MADAutoSetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v21);
              *(_DWORD *)buf = 138544642;
              __int16 v42 = @"LOCKR";
              __int16 v43 = 2114;
              __int16 v44 = @"E_LOD";
              __int16 v45 = 2048;
              __int16 v46 = (const __CFString *)(v11 + 1);
              __int16 v47 = 2048;
              id v48 = v8;
              __int16 v49 = 2114;
              id v50 = v12;
              __int16 v51 = 2114;
              __int128 v52 = v24;
              _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "\n#_%{public}@:%{public}@ (%ld of %ld) [%{public}@] | %{public}@",  buf,  0x3Eu);
            }

            id v7 = v36;
            id v4 = v37;
          }

          else
          {
            int v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
            __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](self, "summary"));
              *(_DWORD *)buf = 138543874;
              __int16 v42 = v4;
              __int16 v43 = 2114;
              __int16 v44 = v26;
              __int16 v45 = 2114;
              __int16 v46 = v12;
              _os_log_error_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "{%{public}@:_logPersistedTableOfContents} | %{public}@ | unable to load entry:%{public}@",  buf,  0x20u);
            }
          }

          ++v11;
        }

        while (v8 != (const __CFString *)v11);
      }

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138544642;
      __int16 v42 = @"PERSISTED";
      __int16 v43 = 2114;
      __int16 v44 = @"AUTO-LOCKER";
      __int16 v45 = 2114;
      __int16 v46 = @"ENTRY_LOAD";
      __int16 v47 = 2114;
      id v48 = @"LOCKR";
      __int16 v49 = 2114;
      id v50 = @"<-----<";
      __int16 v51 = 2114;
      __int128 v52 = v4;
      __int16 v29 = "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} ...table-of-contents";
      __int16 v30 = v28;
      uint32_t v31 = 62;
    }

    else
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }

      *(_DWORD *)buf = 138545410;
      __int16 v42 = @"PERSISTED";
      __int16 v43 = 2114;
      __int16 v44 = @"AUTO-LOCKER";
      __int16 v45 = 2114;
      __int16 v46 = @"ENTRY_LOAD";
      __int16 v47 = 2114;
      id v48 = @"LOCKR";
      __int16 v49 = 2114;
      id v50 = @">----->";
      __int16 v51 = 2114;
      __int128 v52 = v4;
      __int16 v53 = 2114;
      __int128 v54 = @"empty table-of-contents";
      __int16 v55 = 2114;
      id v56 = @"LOCKR";
      __int16 v57 = 2114;
      __int16 v58 = @"<-----<";
      __int16 v29 = "[%{public}@][%{public}@][%{public}@]\n"
            "#_%{public}@:%{public}@ {%{public}@} %{public}@\n"
            "#_%{public}@:%{public}@";
      __int16 v30 = v28;
      uint32_t v31 = 92;
    }

    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_19;
  }

- (id)_refreshFilesystemMetadataLastInterest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);

  if (!v4)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MADAutoSetLocker _refreshFilesystemMetadataLastInterest:].cold.1(v3);
    }

    uint64_t v17 = @"asset-lock refresh without local content URL";
    uint64_t v18 = 6101LL;
    goto LABEL_17;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned __int8 v8 = [v5 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MADAutoSetLocker _refreshFilesystemMetadataLastInterest:].cold.3(v3);
    }

    uint64_t v17 = @"asset-lock refresh attempted with no content at URL";
    goto LABEL_16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
  int updated = updateClientUsageDate(v9);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

  if (!updated)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MADAutoSetLocker _refreshFilesystemMetadataLastInterest:].cold.2(v3);
    }

    uint64_t v17 = @"asset-lock refresh failed to update usage date";
LABEL_16:
    uint64_t v18 = 6111LL;
LABEL_17:
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v18,  @"AUTO-LOCKER:_refreshFilesystemMetadataLastInterest",  0LL,  v17));
    goto LABEL_18;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
    int v22 = 138543362;
    id v23 = v13;
    _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refreshed | asset-lock:%{public}@",  (uint8_t *)&v22,  0xCu);
  }

  id v14 = 0LL;
LABEL_18:

  return v14;
}

- (BOOL)_anyCurrentLocksForEliminate:(id)a3
{
  id v4 = a3;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker locksBySelector](self, "locksBySelector"));
  id v54 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (!v54) {
    goto LABEL_24;
  }
  uint64_t v52 = *(void *)v56;
  __int16 v47 = v4;
  __int16 v53 = self;
  do
  {
    v5 = 0LL;
    do
    {
      if (*(void *)v56 != v52) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)v5);
      id v7 = objc_autoreleasePoolPush();
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker locksBySelector](self, "locksBySelector"));
      id v9 = [v8 safeObjectForKey:v6 ofClass:objc_opt_class(MANAutoAssetSetLock)];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](self, "logger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](self, "summary"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
        uint64_t v15 = v10;
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
        *(_DWORD *)buf = 138543874;
        __int128 v60 = v13;
        __int16 v61 = 2114;
        v62 = v14;
        __int16 v63 = 2114;
        __int16 v64 = v16;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {_anyCurrentLocksForEliminate} considering current lock | assetLock:%{public}@ | eliminateSelector:%{public}@",  buf,  0x20u);

        id v10 = v15;
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 assetVersion]);
      if (v17)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assetType]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
        __int16 v51 = v7;
        id v50 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v50 assetSpecifier]);
        int v22 = (void *)objc_claimAutoreleasedReturnValue([v4 assetSpecifier]);
        if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v21, v22))
        {

LABEL_18:
          goto LABEL_19;
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetVersion]);
        int v25 = (void *)objc_claimAutoreleasedReturnValue([v4 assetVersion]);
        unsigned int v48 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v24, v25);

        id v4 = v47;
        id v7 = v51;
        if (v48)
        {
          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](v53, "logger"));
          __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](v53, "summary"));
            __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v47 summary]);
            *(_DWORD *)buf = 138543618;
            __int128 v60 = v39;
            __int16 v61 = 2114;
            v62 = v40;
            __int16 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type + asset-specifier + asse"
                  "t-version associated with current lock | eliminateSelector:%{public}@";
            goto LABEL_31;
          }

          goto LABEL_32;
        }
      }

      else
      {
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 assetSpecifier]);

        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assetType]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
        unsigned int v27 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v19, v20);
        unsigned int v28 = v27;
        if (v26)
        {
          if (!v27) {
            goto LABEL_18;
          }
          __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
          __int16 v30 = v7;
          uint32_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 assetSpecifier]);
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v4 assetSpecifier]);
          unsigned int v33 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v31, v32);

          id v4 = v47;
          id v7 = v30;

          if (v33)
          {
            __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](v53, "logger"));
            __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](v53, "summary"));
              __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v47 summary]);
              *(_DWORD *)buf = 138543618;
              __int128 v60 = v39;
              __int16 v61 = 2114;
              v62 = v40;
              __int16 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type + asset-specifier asso"
                    "ciated with current lock | eliminateSelector:%{public}@";
LABEL_31:
              _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
            }

            goto LABEL_32;
          }
        }

        else
        {

          if (v28)
          {
            __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker logger](v53, "logger"));
            __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker summary](v53, "summary"));
              __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
              *(_DWORD *)buf = 138543618;
              __int128 v60 = v39;
              __int16 v61 = 2114;
              v62 = v40;
              __int16 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type associated with curren"
                    "t lock | eliminateSelector:%{public}@";
              goto LABEL_31;
            }

- (id)summary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker locksBySelector](self, "locksBySelector"));
  id v4 = [v3 count];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker eliminateSelectors](self, "eliminateSelectors"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"locksBySelector:%ld|eliminateSelectors:%ld",  v4,  [v5 count]));

  return v6;
}

- (id)_newAssetLockSummaryWithoutSelectorOrAttributes:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoSetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_alloc(&OBJC_CLASS___NSString);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localContentURL]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  else {
    id v9 = @"N";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeSummary]);
  id v12 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"localURL:%@|inhibitedRemoval:%@|reasons:%@",  v8,  v9,  v11);

  return v12;
}

+ (void)forceGlobalUnlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoSetLocker autoAssetLocker](&OBJC_CLASS___MADAutoSetLocker, "autoAssetLocker"));
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __38__MADAutoSetLocker_forceGlobalUnlock___block_invoke;
    v9[3] = &unk_34DB98;
    id v10 = v5;
    id v11 = v3;
    dispatch_sync(v6, v9);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker forceGlobalUnlock:].cold.1();
    }
  }
}

void __38__MADAutoSetLocker_forceGlobalUnlock___block_invoke(uint64_t a1)
{
  BOOL v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locksBySelector]);
  id v39 = [v2 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v39)
  {
    uint64_t v3 = *(void *)v46;
    uint64_t v33 = *(void *)v46;
    id v34 = v2;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v46 != v3) {
          objc_enumerationMutation(v2);
        }
        uint64_t v5 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v4);
        uint64_t v6 = objc_autoreleasePoolPush();
        id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locksBySelector]);
        uint64_t v40 = v5;
        id v8 = [v7 safeObjectForKey:v5 ofClass:objc_opt_class(MANAutoAssetSetLock)];
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetType]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetType]);
        LODWORD(v7) = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v11, v12);

        if ((_DWORD)v7)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);
          if (v13)
          {
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
            uint64_t v14 = objc_claimAutoreleasedReturnValue([v38 assetSpecifier]);
            __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);
            __int16 v37 = (void *)v14;
            if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14))
            {
              LOBYTE(v19) = 0;
              goto LABEL_15;
            }
          }

          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetVersion", v33, v34));
          if (!v15)
          {

            if (v13)
            {
              LOBYTE(v19) = 1;
              goto LABEL_15;
            }

            goto LABEL_16;
          }

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetVersion]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetVersion]);
          unsigned int v19 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v17, v18);

          if (v13)
          {
            uint64_t v3 = v33;
            id v2 = v34;
LABEL_15:

            if ((v19 & 1) == 0) {
              goto LABEL_17;
            }
LABEL_16:
            -[NSMutableDictionary setSafeObject:forKey:](v35, "setSafeObject:forKey:", v9, v40, v33, v34);
            goto LABEL_17;
          }

          uint64_t v3 = v33;
          id v2 = v34;
          if (v19) {
            goto LABEL_16;
          }
        }

- (SUCoreLog)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)lockerQueue
{
  return self->_lockerQueue;
}

- (MADAutoAssetPersisted)persistedState
{
  return self->_persistedState;
}

- (NSMutableDictionary)locksBySelector
{
  return self->_locksBySelector;
}

- (void)setLocksBySelector:(id)a3
{
}

- (NSMutableDictionary)eliminateSelectors
{
  return self->_eliminateSelectors;
}

- (void)setEliminateSelectors:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)newCurrentLockUsageForSelector:.cold.1()
{
}

+ (void)copyOfLocksBySelector
{
}

+ (void)lockedSelectorsForEliminate:.cold.1()
{
}

void __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_cold_1()
{
}

- (void)_persistAssetLock:(uint64_t)a1 operation:(void *)a2 forAssetLock:message:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 fullAssetSelector]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 summary]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "{AUTO-LOCKER:%{public}@:_persistAssetLock} | unable to record lock (no persisted-state) for selector:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistRemoveAssetLock:(uint64_t)a1 removedAssetLock:(void *)a2 message:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 fullAssetSelector]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 summary]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "{AUTO-LOCKER:%{public}@:_persistRemoveAssetLock} | unable to remove lock tracker (no persisted-state) for selector:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh without local content URL | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_10();
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh failed to update usage date | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_10();
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh attempted with no content at URL | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  2u);

  OUTLINED_FUNCTION_10();
}

+ (void)forceGlobalUnlock:.cold.1()
{
}

@end
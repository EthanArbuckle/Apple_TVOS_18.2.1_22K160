@interface MADAutoAssetLocker
+ (BOOL)continuedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 continueError:(id *)a7;
+ (BOOL)continuedSetLockByClient:(id)a3 forSetDescriptor:(id)a4 forLockReason:(id)a5 withSetUsagePolicy:(id)a6 continueError:(id *)a7;
+ (BOOL)endedAllPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6;
+ (BOOL)endedAllPreviousLocksByClientProcessName:(id)a3 withClientProcessID:(int64_t)a4 forAssetSelector:(id)a5 endError:(id *)a6;
+ (BOOL)endedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6;
+ (BOOL)endedPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7;
+ (BOOL)endedPreviousSetLocksByClient:(id)a3 forSetDescriptor:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7;
+ (BOOL)lockedByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 forAssetSelector:(id)a6 forLockReason:(id)a7 withUsagePolicy:(id)a8 withLocalContentURL:(id)a9 withAssetAttributes:(id)a10 lockError:(id *)a11;
+ (BOOL)lockedSetByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingSetDescriptor:(id)a6 forLockReason:(id)a7 withSetUsagePolicy:(id)a8 lockError:(id *)a9;
+ (id)autoAssetLocker;
+ (id)copyOfLocksBySelector;
+ (id)copyOfSetLocksByDescriptor;
+ (id)currentSetLockUsageEliminatingOtherThanSetAtomicInstances:(id)a3;
+ (id)eliminateAllPreviousSetLocksByClient:(id)a3 forSetDescriptor:(id)a4;
+ (id)eliminateAllPreviousSetLocksNoLongerTracked:(id)a3;
+ (id)lockedSelectorsForEliminate:(id)a3;
+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5;
+ (id)newCurrentLockUsageForSelector:(id)a3;
+ (id)newCurrentSetLockUsageForDescriptor:(id)a3;
+ (int64_t)persistedLocksCount;
+ (void)addClientLockReasons:(id)a3 basedOnControl:(id)a4;
+ (void)forceGlobalUnlock:(id)a3;
+ (void)persistedLocksCount;
+ (void)resumeFromPersistedWithDownloadedSelectors:(id)a3;
+ (void)setPersistedStateCaching:(BOOL)a3;
- (BOOL)_anyCurrentLocksForEliminate:(id)a3;
- (BOOL)_endLockDecideUnlocked:(id)a3;
- (BOOL)_endLocksByClient:(id)a3 forAllClientNames:(BOOL)a4 forClientProcessName:(id)a5 withClientProcessID:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAssetSelector:(id)a9 forSetAtomicInstance:(id)a10 forLockReason:(id)a11 removingLockCount:(int64_t)a12 endError:(id *)a13;
- (BOOL)_isSetAssetLock:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5;
- (BOOL)_isUntrackedSetAssetLock:(id)a3 forTrackedSetDescriptors:(id)a4;
- (BOOL)_persistAssetLock:(id)a3 operation:(id)a4 forAssetLock:(id)a5 message:(id)a6;
- (BOOL)isAssetLockSetAtomicInstanceLock:(id)a3;
- (MADAutoAssetLocker)init;
- (MADAutoAssetPersisted)persistedState;
- (NSMutableDictionary)eliminateSelectors;
- (OS_dispatch_queue)lockerQueue;
- (SUCoreLog)logger;
- (id)_assetIDOfLock:(id)a3;
- (id)_autoAssetLockPolicyFromSetPolicy:(id)a3;
- (id)_continuedLockByClient:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetAtomicInstance:(id)a7 forLockReason:(id)a8 withUsagePolicy:(id)a9;
- (id)_endAllSetLocks:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5;
- (id)_endAllSetLocksByClient:(id)a3 forSetDescriptor:(id)a4;
- (id)_endAllSetLocksNoLongerTracked:(id)a3;
- (id)_endedLockByClient:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetAtomicInstance:(id)a7 forLockReason:(id)a8;
- (id)_lockAutoAssetByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 forClientDomainName:(id)a6 forAssetSetIdentifier:(id)a7 forAssetSelector:(id)a8 forSetAtomicInstance:(id)a9 forLockReason:(id)a10 withUsagePolicy:(id)a11 withLocalContentURL:(id)a12 withAssetAttributes:(id)a13;
- (id)_newAssetLockSummaryWithoutSelectorOrAttributes:(id)a3;
- (id)_refreshFilesystemMetadataLastInterest:(id)a3;
- (id)_setClientDomainNameForAssetLock:(id)a3;
- (id)atomicInstanceUUIDForLockTracker:(id)a3;
- (id)locateLockBySelector:(id)a3;
- (id)locateLocksNewAllBySelector;
- (id)newSetClientNameForDomain:(id)a3 withAutoAssetClientName:(id)a4 forSetAtomicInstance:(id)a5;
- (id)setAtomicInstanceForUUID:(id)a3 fromSetAtomicInstances:(id)a4;
- (id)summary;
- (int64_t)_currentLockCountOfLock:(id)a3;
- (int64_t)locateLocksCurrentLocksCount;
- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingAssetLock:(id)a5 forSelector:(id)a6 message:(id)a7;
- (void)_logPersistedRemovedEntry:(id)a3 removedAssetLock:(id)a4 forSelector:(id)a5 message:(id)a6;
- (void)_logPersistedTableOfContents:(id)a3;
- (void)_mergeAddedLock:(id)a3 intoExistingLock:(id)a4;
- (void)_mergeContinuedLock:(id)a3 intoExistingLock:(id)a4;
- (void)_persistRemoveAssetLock:(id)a3 removedAssetLock:(id)a4 message:(id)a5;
- (void)_removeAssetLock:(id)a3 lastClient:(id)a4 forSelector:(id)a5 message:(id)a6;
- (void)setEliminateSelectors:(id)a3;
@end

@implementation MADAutoAssetLocker

+ (id)autoAssetLocker
{
  if (autoAssetLocker_dispatchOnceAutoAssetLocker_0 != -1) {
    dispatch_once(&autoAssetLocker_dispatchOnceAutoAssetLocker_0, &__block_literal_global_618_0);
  }
  return (id)autoAssetLocker___autoAssetLocker_0;
}

- (OS_dispatch_queue)lockerQueue
{
  return self->_lockerQueue;
}

- (id)newSetClientNameForDomain:(id)a3 withAutoAssetClientName:(id)a4 forSetAtomicInstance:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@_%@_%@",  v9,  v8,  v7);

  return v10;
}

- (id)locateLockBySelector:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 persistedEntryID]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
  unsigned int v6 = [v5 persistedEntryAlreadyExists:v4 fromLocation:@"locateLockBySelector"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 persistedEntry:v4 fromLocation:@"locateLockBySelector"]);

    if (!v8)
    {
      id v21 = 0LL;
LABEL_14:

      goto LABEL_15;
    }

    v26 = objc_alloc(&OBJC_CLASS___NSSet);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLock);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockTracker);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSURL);
    v16 = -[NSSet initWithObjects:]( v26,  "initWithObjects:",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
    id v17 = [v8 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MAAutoAssetLock) encodeClasses:v16];
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v18)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v18 fullAssetSelector]);

      if (v20)
      {
        id v21 = v19;
LABEL_13:

        goto LABEL_14;
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetLocker locateLockBySelector:].cold.2();
      }
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetLocker locateLockBySelector:].cold.1();
      }
    }

    id v21 = 0LL;
    goto LABEL_13;
  }

  id v21 = 0LL;
LABEL_15:

  return v21;
}

- (MADAutoAssetPersisted)persistedState
{
  return self->_persistedState;
}

- (BOOL)_persistAssetLock:(id)a3 operation:(id)a4 forAssetLock:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 fullAssetSelector]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistedEntryID]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 persistedEntry:v16 fromLocation:v10]);

  if (v18)
  {
    [v18 persistSecureCodedObject:v12 forKey:@"assetLock"];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
    [v19 storePersistedEntry:v16 withEntrySummary:v20 fromLocation:v10];

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 fullAssetSelector]);
    -[MADAutoAssetLocker _logPersistedEntry:operation:persistingAssetLock:forSelector:message:]( self,  "_logPersistedEntry:operation:persistingAssetLock:forSelector:message:",  v10,  v11,  v12,  v21,  v13);
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:].cold.1((uint64_t)v10, v12, v23);
    }
  }

  return v18 != 0LL;
}

- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingAssetLock:(id)a5 forSelector:(id)a6 message:(id)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (__CFString *)a7;
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  v13));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 persistedEntryID]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

  if (v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
      id v23 = -[MADAutoAssetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v14);
      *(_DWORD *)buf = 138546434;
      v28 = @"PERSISTED";
      __int16 v29 = 2114;
      v30 = @"AUTO-LOCKER";
      __int16 v31 = 2114;
      id v32 = v13;
      __int16 v33 = 2114;
      v34 = @"LOCKR";
      __int16 v35 = 2114;
      v36 = @">----->";
      __int16 v37 = 2114;
      uint64_t v38 = (uint64_t)v12;
      __int16 v39 = 2114;
      v40 = v16;
      __int16 v41 = 2114;
      v42 = @"LOCKR";
      __int16 v43 = 2114;
      v44 = v18;
      __int16 v45 = 2114;
      v46 = v22;
      __int16 v47 = 2114;
      id v48 = v23;
      __int16 v49 = 2114;
      v50 = @"LOCKR";
      __int16 v51 = 2114;
      v52 = @"<-----<";
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@] | %{public}@\n #_%{public}@:%{public}@",  buf,  0x84u);
    }
  }

  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](self, "summary"));
    *(_DWORD *)buf = 138544642;
    v28 = v26;
    __int16 v29 = 2114;
    v30 = v12;
    __int16 v31 = 2114;
    id v32 = v13;
    __int16 v33 = 2114;
    v34 = v16;
    __int16 v35 = 2114;
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v15 summary]);
    v36 = v24;
    __int16 v37 = 2114;
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v14 summary]);
    v25 = (void *)v38;
    _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedEntry} %{public}@ | no fullAssetSelectorKey | %{public}@ | fullAssetSelector :%{public}@ | assetLock:%{public}@",  buf,  0x3Eu);
  }
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (id)_newAssetLockSummaryWithoutSelectorOrAttributes:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = objc_alloc(&OBJC_CLASS___NSString);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 localContentURL]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
  else {
    uint64_t v9 = @"N";
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeSummary]);
  id v12 = -[NSString initWithFormat:]( v6,  "initWithFormat:",  @"localURL:%@|inhibitedRemoval:%@|reasons:%@",  v8,  v9,  v11);

  return v12;
}

- (id)_refreshFilesystemMetadataLastInterest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);

  if (!v4)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _refreshFilesystemMetadataLastInterest:].cold.1(v3);
    }

    id v17 = @"asset-lock refresh without local content URL";
    uint64_t v18 = 6101LL;
    goto LABEL_17;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  unsigned __int8 v8 = [v5 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _refreshFilesystemMetadataLastInterest:].cold.3(v3);
    }

    id v17 = @"asset-lock refresh attempted with no content at URL";
    goto LABEL_16;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
  int updated = updateClientUsageDate(v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

  if (!updated)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _refreshFilesystemMetadataLastInterest:].cold.2(v3);
    }

    id v17 = @"asset-lock refresh failed to update usage date";
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

- (int64_t)_currentLockCountOfLock:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lockReasons", 0));
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
        id v13 = objc_autoreleasePoolPush();
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);
        id v15 = [v14 safeObjectForKey:v12 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
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
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v3 assetAttributes]);

  AssetIdFromDict = getAssetIdFromDict(v5, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(AssetIdFromDict);

  return v8;
}

+ (BOOL)endedPreviousSetLocksByClient:(id)a3 forSetDescriptor:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7
{
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = __Block_byref_object_copy__16;
  v53 = __Block_byref_object_dispose__16;
  id v54 = 0LL;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  if (v11 && v12)
  {
    if (a6 == -1 || a6 > 0)
    {
      __int128 v21 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      v16 = v21;
      if (v21)
      {
        int v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v21, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __110__MADAutoAssetLocker_endedPreviousSetLocksByClient_forSetDescriptor_forLockReason_removingLockCount_endError___block_invoke;
        block[3] = &unk_350D20;
        id v38 = v12;
        v16 = v16;
        __int16 v39 = v16;
        v40 = v11;
        __int16 v41 = v13;
        v42 = &v49;
        __int16 v43 = &v45;
        int64_t v44 = a6;
        dispatch_sync(v22, block);

        id v23 = v38;
        goto LABEL_21;
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endedPreviousSetLocksByClient",  0LL,  @"no auto-asset-locker"));
    }

    else
    {
      id v14 = objc_alloc(&OBJC_CLASS___NSString);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      v16 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"set-locks not ended (invalid endLockCount:%ld) | client:%@, lockedSetDescriptor:%@, endReason:%@",  a6,  v11,  v15,  v13);

      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedPreviousSetLocksByClient",  0LL,  v16));
    }
  }

  else
  {
    __int128 v18 = objc_alloc(&OBJC_CLASS___NSString);
    if (v11) {
      __int128 v19 = v11;
    }
    else {
      __int128 v19 = @"MISSING";
    }
    if (v12) {
      __int128 v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    }
    else {
      __int128 v20 = @"MISSING";
    }
    if (v13) {
      v24 = v13;
    }
    else {
      v24 = @"MISSING";
    }
    v16 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"set-locks not ended (missing required) | client:%@, lockedSetDescriptor:%@, endReason:%@",  v19,  v20,  v24);
    if (v12) {

    }
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedPreviousSetLocksByClient",  0LL,  v16));
  }

  id v23 = (void *)v50[5];
  v50[5] = v17;
LABEL_21:

  if (v50[5])
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      int64_t v36 = v50[5];
      *(_DWORD *)buf = 138544130;
      v56 = v11;
      __int16 v57 = 2114;
      v58 = v35;
      __int16 v59 = 2114;
      v60 = v13;
      __int16 v61 = 2114;
      int64_t v62 = v36;
      _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedPreviousSetLocksByClient} failed end-set-lock(s) | client:%{public}@, lockedSetDescriptor:%{pu blic}@, reason:%{public}@ | error:%{public}@",  buf,  0x2Au);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDomainName]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 assetSetIdentifier]);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v12 latestDownloadedAtomicInstance]);
    +[MADAutoAssetHistory recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  502LL,  v11,  v27,  v28,  v29,  v50[5]);

    if (a7) {
      *a7 = (id) v50[5];
    }
  }

  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      *(_DWORD *)buf = 138544130;
      v56 = v11;
      __int16 v57 = 2114;
      v58 = v32;
      __int16 v59 = 2114;
      v60 = v13;
      __int16 v61 = 2048;
      int64_t v62 = a6;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:endedPreviousSetLocksByClient} successful end-set-lock(s) | client:%{public}@, lockedSetDescriptor: %{public}@, reason:%{public}@, ended locks:%ld",  buf,  0x2Au);
    }

    *((_BYTE *)v46 + 24) = 1;
  }

  BOOL v33 = *((_BYTE *)v46 + 24) != 0;
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v33;
}

- (MADAutoAssetLocker)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADAutoAssetLocker;
  v2 = -[MADAutoAssetLocker init](&v18, "init");
  if (v2)
  {
    id v3 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"AUTO-LOCKER");
    logger = v2->_logger;
    v2->_logger = v3;

    v5 = (const char *)[@"com.apple.MobileAsset.daemon.autoassetlocker" UTF8String];
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    lockerQueue = v2->_lockerQueue;
    v2->_lockerQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    eliminateSelectors = v2->_eliminateSelectors;
    v2->_eliminateSelectors = v10;

    id v12 = -[MADAutoAssetPersisted initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:]( objc_alloc(&OBJC_CLASS___MADAutoAssetPersisted),  "initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:",  @"AutoAssetLocker",  @"1.0",  v2->_lockerQueue,  v2->_logger,  0LL,  &__block_literal_global_28);
    persistedState = v2->_persistedState;
    v2->_persistedState = v12;

    id v14 = (dispatch_queue_s *)v2->_lockerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __26__MADAutoAssetLocker_init__block_invoke_2;
    block[3] = &unk_34DBC0;
    uint64_t v17 = v2;
    dispatch_sync(v14, block);
  }

  return v2;
}

NSDictionary *__cdecl __26__MADAutoAssetLocker_init__block_invoke(id a1, NSString *a2, NSString *a3, NSDictionary *a4)
{
  return (NSDictionary *)+[MADAutoAssetLocker migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:]( &OBJC_CLASS___MADAutoAssetLocker,  "migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:",  a2,  a3,  a4);
}

id __26__MADAutoAssetLocker_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) flushPersistedStateCacheAndSetCachingBehaviour:1];
}

void __37__MADAutoAssetLocker_autoAssetLocker__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetLocker);
  v2 = (void *)autoAssetLocker___autoAssetLocker_0;
  autoAssetLocker___autoAssetLocker_0 = (uint64_t)v1;
}

+ (BOOL)lockedByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 forAssetSelector:(id)a6 forLockReason:(id)a7 withUsagePolicy:(id)a8 withLocalContentURL:(id)a9 withAssetAttributes:(id)a10 lockError:(id *)a11
{
  v16 = (__CFString *)a3;
  id v47 = a4;
  id v17 = a6;
  objc_super v18 = (__CFString *)a7;
  id v48 = a8;
  id v19 = a9;
  id v20 = a10;
  uint64_t v61 = 0LL;
  int64_t v62 = &v61;
  uint64_t v63 = 0x3032000000LL;
  v64 = __Block_byref_object_copy__16;
  v65 = __Block_byref_object_dispose__16;
  id v66 = 0LL;
  uint64_t v49 = v20;
  if (v16 && v17 && v18 && v19 && v20)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 assetVersion]);
    BOOL v22 = v21 == 0LL;

    if (v22)
    {
      v34 = objc_alloc(&OBJC_CLASS___NSString);
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v17 summary]);
      v24 = -[NSString initWithFormat:]( v34,  "initWithFormat:",  @"lock not tracked (selector missing asset-version) | client:%@, selector:%@, reason:%@",  v16,  v35,  v18);

      uint64_t v33 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:lockedByClient",  0LL,  v24));
    }

    else
    {
      id v23 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      v24 = v23;
      if (v23)
      {
        v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v23, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __175__MADAutoAssetLocker_lockedByClient_forClientProcessName_withClientProcessID_forAssetSelector_forLockReason_withUsagePolicy_withLocalContentURL_withAssetAttributes_lockError___block_invoke;
        block[3] = &unk_350BC8;
        __int16 v59 = &v61;
        v24 = v24;
        uint64_t v51 = v24;
        v52 = v16;
        id v53 = v47;
        int64_t v60 = a5;
        id v54 = v17;
        v55 = v18;
        id v56 = v48;
        id v57 = v19;
        id v58 = v49;
        dispatch_sync(v25, block);

        v26 = v51;
        goto LABEL_31;
      }

      uint64_t v33 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:lockedByClient",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    v27 = objc_alloc(&OBJC_CLASS___NSString);
    if (v16) {
      v28 = v16;
    }
    else {
      v28 = @"MISSING";
    }
    if (v17) {
      __int16 v29 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 summary]);
    }
    else {
      __int16 v29 = @"MISSING";
    }
    if (v18) {
      v30 = v18;
    }
    else {
      v30 = @"MISSING";
    }
    if (v19) {
      __int16 v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v19 path]);
    }
    else {
      __int16 v31 = @"MISSING";
    }
    id v32 = @"provided";
    if (!v49) {
      id v32 = @"MISSING";
    }
    v24 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"lock not tracked (missing required) | client:%@, selector:%@, reason:%@, localURL:%@, attributes:%@",  v28,  v29,  v30,  v31,  v32,  v47);
    if (v19) {

    }
    if (v17) {
    uint64_t v33 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:lockedByClient",  0LL,  v24));
    }
  }

  v26 = (NSString *)v62[5];
  v62[5] = v33;
LABEL_31:

  uint64_t v36 = v62[5];
  if (v36)
  {
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v44 = (id)objc_claimAutoreleasedReturnValue([v17 summary]);
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v48 summary]);
      uint64_t v46 = v62[5];
      *(_DWORD *)buf = 138544386;
      v68 = v16;
      __int16 v69 = 2114;
      id v70 = v44;
      __int16 v71 = 2114;
      v72 = v18;
      __int16 v73 = 2114;
      v74 = v45;
      __int16 v75 = 2114;
      uint64_t v76 = v46;
      _os_log_error_impl( &dword_0,  v38,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:lockedByClient} failed lock | client:%{public}@, selector:%{public}@, reason:%{public}@, policy:%{p ublic}@ | error:%{public}@",  buf,  0x34u);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  101LL,  v16,  @"UNKNOWN",  v17,  v62[5]);
    if (a11) {
      *a11 = (id) v62[5];
    }
  }

  else
  {
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = (id)objc_claimAutoreleasedReturnValue([v17 summary]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v48 summary]);
      *(_DWORD *)buf = 138544130;
      v68 = v16;
      __int16 v69 = 2114;
      id v70 = v41;
      __int16 v71 = 2114;
      v72 = v18;
      __int16 v73 = 2114;
      v74 = v42;
      _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:lockedByClient} successful lock | client:%{public}@, selector:%{public}@, reason:%{public}@, policy:%{public}@",  buf,  0x2Au);
    }
  }

  _Block_object_dispose(&v61, 8);

  return v36 == 0;
}

void __175__MADAutoAssetLocker_lockedByClient_forClientProcessName_withClientProcessID_forAssetSelector_forLockReason_withUsagePolicy_withLocalContentURL_withAssetAttributes_lockError___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _lockAutoAssetByClient:*(void *)(a1 + 40) forClientProcessName:*(void *)(a1 + 48) withClientProcessID:*(void *)(a1 + 104) forClientDomainName:0 forAssetSetIdentifier:0 for AssetSelector:*(void *)(a1 + 56) forSetAtomicInstance:0 forLockReason:*(void *)(a1 + 64) withUsagePolicy:*(void *)(a1 + 72) withLocalContentURL:*(void *)(a1 + 80) withAssetAttributes:*(void *)(a1 + 88)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 96) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)continuedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 withUsagePolicy:(id)a6 continueError:(id *)a7
{
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  uint64_t v46 = 0LL;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = __Block_byref_object_copy__16;
  v50 = __Block_byref_object_dispose__16;
  id v51 = 0LL;
  if (v11 && v12 && v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
    BOOL v16 = v15 == 0LL;

    if (v16)
    {
      v26 = objc_alloc(&OBJC_CLASS___NSString);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      objc_super v18 = -[NSString initWithFormat:]( v26,  "initWithFormat:",  @"lock not tracked (selector missing asset-version) | client:%@, selector:%@, reason:%@",  v11,  v27,  v13);

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  v18));
    }

    else
    {
      id v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      objc_super v18 = v17;
      if (v17)
      {
        id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v17, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __105__MADAutoAssetLocker_continuedLockByClient_forAssetSelector_forLockReason_withUsagePolicy_continueError___block_invoke;
        block[3] = &unk_350BF0;
        uint64_t v45 = &v46;
        objc_super v18 = v18;
        v40 = v18;
        id v41 = v11;
        id v42 = v12;
        __int16 v43 = v13;
        id v44 = v14;
        dispatch_sync(v19, block);

        id v20 = v40;
        goto LABEL_22;
      }

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    __int128 v21 = objc_alloc(&OBJC_CLASS___NSString);
    if (v11) {
      BOOL v22 = v11;
    }
    else {
      BOOL v22 = @"MISSING";
    }
    if (v12) {
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    }
    else {
      id v23 = @"MISSING";
    }
    if (v13) {
      v24 = v13;
    }
    else {
      v24 = @"MISSING";
    }
    objc_super v18 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"lock not tracked (missing required) | client:%@, selector:%@, reason:%@",  v22,  v23,  v24);
    if (v12) {

    }
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  v18));
  }

  id v20 = (NSString *)v47[5];
  v47[5] = v25;
LABEL_22:

  uint64_t v28 = v47[5];
  if (v28)
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v36 = (id)objc_claimAutoreleasedReturnValue([v12 summary]);
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
      uint64_t v38 = v47[5];
      *(_DWORD *)buf = 138544386;
      id v53 = v11;
      __int16 v54 = 2114;
      id v55 = v36;
      __int16 v56 = 2114;
      id v57 = v13;
      __int16 v58 = 2114;
      __int16 v59 = v37;
      __int16 v60 = 2114;
      uint64_t v61 = v38;
      _os_log_error_impl( &dword_0,  v30,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:continuedLockByClient} failed continue-lock | client:%{public}@, selector:%{public}@, reason:%{publ ic}@, policy:%{public}@ | error:%{public}@",  buf,  0x34u);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  501LL,  v11,  @"UNKNOWN",  v12,  v47[5]);
    if (a7) {
      *a7 = (id) v47[5];
    }
  }

  else
  {
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (id)objc_claimAutoreleasedReturnValue([v12 summary]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
      *(_DWORD *)buf = 138544130;
      id v53 = v11;
      __int16 v54 = 2114;
      id v55 = v33;
      __int16 v56 = 2114;
      id v57 = v13;
      __int16 v58 = 2114;
      __int16 v59 = v34;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:continuedLockByClient} successful continue-lock | client:%{public}@, selector:%{public}@, reason:%{ public}@, policy:%{public}@",  buf,  0x2Au);
    }
  }

  _Block_object_dispose(&v46, 8);

  return v28 == 0;
}

void __105__MADAutoAssetLocker_continuedLockByClient_forAssetSelector_forLockReason_withUsagePolicy_continueError___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _continuedLockByClient:*(void *)(a1 + 40) forClientDomainName:0 forAssetSetIdentifier:0 forAssetSelector:*(void *)(a1 + 48) forSetAtomicInstance:0 forLoc kReason:*(void *)(a1 + 56) withUsagePolicy:*(void *)(a1 + 64)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)endedLockByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6
{
  int64_t v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  id v12 = v11;
  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = __Block_byref_object_copy__16;
  uint64_t v45 = __Block_byref_object_dispose__16;
  id v46 = 0LL;
  if (v9 && v10 && v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
    BOOL v14 = v13 == 0LL;

    if (v14)
    {
      v24 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      BOOL v16 = -[NSString initWithFormat:]( v24,  "initWithFormat:",  @"lock not ended (selector missing asset-version) | client:%@, selector:%@, reason:%@",  v9,  v25,  v12);

      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedLockByClient",  0LL,  v16));
    }

    else
    {
      id v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      BOOL v16 = v15;
      if (v15)
      {
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v15, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __80__MADAutoAssetLocker_endedLockByClient_forAssetSelector_forLockReason_endError___block_invoke;
        block[3] = &unk_350C18;
        v40 = &v41;
        BOOL v16 = v16;
        id v36 = v16;
        __int16 v37 = v9;
        id v38 = v10;
        __int16 v39 = v12;
        dispatch_sync(v17, block);

        objc_super v18 = v36;
        goto LABEL_22;
      }

      uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endedLockByClient",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    id v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (v9) {
      id v20 = v9;
    }
    else {
      id v20 = @"MISSING";
    }
    if (v10) {
      __int128 v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 summary]);
    }
    else {
      __int128 v21 = @"MISSING";
    }
    if (v12) {
      BOOL v22 = v12;
    }
    else {
      BOOL v22 = @"MISSING";
    }
    BOOL v16 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"lock not ended (missing required) | client:%@, selector:%@, reason:%@",  v20,  v21,  v22);
    if (v10) {

    }
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedLockByClient",  0LL,  v16));
  }

  objc_super v18 = (NSString *)v42[5];
  v42[5] = v23;
LABEL_22:

  uint64_t v26 = v42[5];
  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      uint64_t v34 = v42[5];
      *(_DWORD *)buf = 138544130;
      uint64_t v48 = v9;
      __int16 v49 = 2114;
      v50 = v33;
      __int16 v51 = 2114;
      v52 = v12;
      __int16 v53 = 2114;
      uint64_t v54 = v34;
      _os_log_error_impl( &dword_0,  v28,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedLockByClient} failed end-lock | client:%{public}@, selector:%{public}@, reason:%{public}@ | error:%{public}@",  buf,  0x2Au);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  502LL,  v9,  @"UNKNOWN",  v10,  v42[5]);
    if (a6) {
      *a6 = (id) v42[5];
    }
  }

  else
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v9;
      __int16 v49 = 2114;
      v50 = v31;
      __int16 v51 = 2114;
      v52 = v12;
      _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:endedLockByClient} successful end-lock | client:%{public}@, selector:%{public}@, reason:%{public}@",  buf,  0x20u);
    }
  }

  _Block_object_dispose(&v41, 8);

  return v26 == 0;
}

void __80__MADAutoAssetLocker_endedLockByClient_forAssetSelector_forLockReason_endError___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _endedLockByClient:*(void *)(a1 + 40) forClientDomainName:0 forAssetSetIdentifier:0 forAssetSelector:*(void *)(a1 + 48) forSetAtomicInstance:0 forLockReason:*(void *)(a1 + 56)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)endedPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 removingLockCount:(int64_t)a6 endError:(id *)a7
{
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  BOOL v14 = v13;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  uint64_t v54 = __Block_byref_object_copy__16;
  id v55 = __Block_byref_object_dispose__16;
  id v56 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  if (v11 && v12 && v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
    BOOL v16 = v15 == 0LL;

    if (v16)
    {
      uint64_t v26 = objc_alloc(&OBJC_CLASS___NSString);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      objc_super v18 = -[NSString initWithFormat:]( v26,  "initWithFormat:",  @"locks not ended (selector missing asset-version) | client:%@, selector:%@, reason:%@",  v11,  v27,  v14);

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedPreviousLocksByClient",  0LL,  v18));
    }

    else if (a6 <= 0)
    {
      uint64_t v28 = objc_alloc(&OBJC_CLASS___NSString);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      objc_super v18 = -[NSString initWithFormat:]( v28,  "initWithFormat:",  @"locks not ended (invalid endLockCount:%ld) | client:%@, selector:%@, reason:%@",  a6,  v11,  v29,  v14);

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedPreviousLocksByClient",  0LL,  v18));
    }

    else
    {
      id v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      objc_super v18 = v17;
      if (v17)
      {
        id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v17, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __107__MADAutoAssetLocker_endedPreviousLocksByClient_forAssetSelector_forLockReason_removingLockCount_endError___block_invoke;
        block[3] = &unk_350C40;
        id v44 = &v47;
        objc_super v18 = v18;
        v40 = v18;
        uint64_t v41 = v11;
        id v42 = v12;
        uint64_t v43 = v14;
        uint64_t v45 = &v51;
        int64_t v46 = a6;
        dispatch_sync(v19, block);

        id v20 = v40;
        goto LABEL_24;
      }

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endedPreviousLocksByClient",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    __int128 v21 = objc_alloc(&OBJC_CLASS___NSString);
    if (v11) {
      BOOL v22 = v11;
    }
    else {
      BOOL v22 = @"MISSING";
    }
    if (v12) {
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    }
    else {
      uint64_t v23 = @"MISSING";
    }
    if (v14) {
      v24 = v14;
    }
    else {
      v24 = @"MISSING";
    }
    objc_super v18 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"locks not ended (missing required) | client:%@, selector:%@, reason:%@",  v22,  v23,  v24);
    if (v12) {

    }
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedPreviousLocksByClient",  0LL,  v18));
  }

  id v20 = (NSString *)v52[5];
  v52[5] = v25;
LABEL_24:

  if (v52[5])
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v37 = (id)objc_claimAutoreleasedReturnValue([v12 summary]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([(id)v52[5] checkedSummary]);
      *(_DWORD *)buf = 138544130;
      __int16 v58 = v11;
      __int16 v59 = 2114;
      id v60 = v37;
      __int16 v61 = 2114;
      int64_t v62 = v14;
      __int16 v63 = 2114;
      int64_t v64 = (int64_t)v38;
      _os_log_error_impl( &dword_0,  v31,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedPreviousLocksByClient} failed end-lock(s) | client:%{public}@, selector:%{public}@, reason:%{p ublic}@ | error:%{public}@",  buf,  0x2Au);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  502LL,  v11,  @"UNKNOWN",  v12,  v52[5]);
    if (a7) {
      *a7 = (id) v52[5];
    }
  }

  else
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      *(_DWORD *)buf = 138544130;
      __int16 v58 = v11;
      __int16 v59 = 2114;
      id v60 = v34;
      __int16 v61 = 2114;
      int64_t v62 = v14;
      __int16 v63 = 2048;
      int64_t v64 = a6;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:endedPreviousLocksByClient} successful end-lock(s) | client:%{public}@, selector:%{public}@, reason :%{public}@, ended locks:%ld",  buf,  0x2Au);
    }

    *((_BYTE *)v48 + 24) = 1;
  }

  BOOL v35 = *((_BYTE *)v48 + 24) != 0;
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v35;
}

void __107__MADAutoAssetLocker_endedPreviousLocksByClient_forAssetSelector_forLockReason_removingLockCount_endError___block_invoke( void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8LL);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v2 _endLocksByClient:v3 forAllClientNames:0 forClientProcessName:0 withClientProcessID:0 forClientDomainNa me:0 forAssetSetIdentifier:0 forAssetSelector:v4 forSetAtomicInstance:0 forLockReason:v5 removingLockCount:v6 endError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = v8;
}

+ (BOOL)endedAllPreviousLocksByClient:(id)a3 forAssetSelector:(id)a4 forLockReason:(id)a5 endError:(id *)a6
{
  int64_t v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  uint64_t v46 = 0LL;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  uint64_t v49 = __Block_byref_object_copy__16;
  char v50 = __Block_byref_object_dispose__16;
  id v51 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 0;
  if (v9 && v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      BOOL v22 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v23 = objc_claimAutoreleasedReturnValue([v10 summary]);
      v24 = (void *)v23;
      uint64_t v25 = @"ALL-REASONS";
      if (v11) {
        uint64_t v25 = v11;
      }
      id v15 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"locks not ended (selector missing asset-version) | client:%@, selector:%@, reason:%@",  v9,  v23,  v25);

      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClient",  0LL,  v15));
    }

    else
    {
      BOOL v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      id v15 = v14;
      if (v14)
      {
        BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v14, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __92__MADAutoAssetLocker_endedAllPreviousLocksByClient_forAssetSelector_forLockReason_endError___block_invoke;
        block[3] = &unk_350C68;
        v40 = &v42;
        id v15 = v15;
        id v36 = v15;
        id v37 = v9;
        id v38 = v10;
        __int16 v39 = v11;
        uint64_t v41 = &v46;
        dispatch_sync(v16, block);

        id v17 = v36;
        goto LABEL_19;
      }

      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClient",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    objc_super v18 = objc_alloc(&OBJC_CLASS___NSString);
    id v19 = @"MISSING";
    if (v9) {
      id v20 = v9;
    }
    else {
      id v20 = @"MISSING";
    }
    if (v10) {
      id v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 summary]);
    }
    id v15 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"locks not ended (missing required) | client:%@, selector:%@",  v20,  v19);
    if (v10) {

    }
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClient",  0LL,  v15));
  }

  id v17 = (NSString *)v47[5];
  v47[5] = v21;
LABEL_19:

  if (v47[5])
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      uint64_t v34 = v47[5];
      *(_DWORD *)buf = 138544130;
      uint64_t v53 = v9;
      __int16 v54 = 2114;
      id v55 = v33;
      __int16 v56 = 2114;
      id v57 = v11;
      __int16 v58 = 2114;
      uint64_t v59 = v34;
      _os_log_error_impl( &dword_0,  v27,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedAllPreviousLocksByClient} failed end-all-locks | client:%{public}@, selector:%{public}@, reaso n:%{public}@ | error:%{public}@",  buf,  0x2Au);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  502LL,  v9,  @"UNKNOWN",  v10,  v47[5]);
    if (a6) {
      *a6 = (id) v47[5];
    }
  }

  else
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      *(_DWORD *)buf = 138543874;
      uint64_t v53 = v9;
      __int16 v54 = 2114;
      id v55 = v30;
      __int16 v56 = 2114;
      id v57 = v11;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:endedAllPreviousLocksByClient} successful end-all-locks | client:%{public}@, selector:%{public}@, r eason:%{public}@",  buf,  0x20u);
    }

    *((_BYTE *)v43 + 24) = 1;
  }

  BOOL v31 = *((_BYTE *)v43 + 24) != 0;
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v31;
}

void __92__MADAutoAssetLocker_endedAllPreviousLocksByClient_forAssetSelector_forLockReason_endError___block_invoke( void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v2 _endLocksByClient:v3 forAllClientNames:0 forClientProcessName:0 withClientProcessID:0 forClientDomainNa me:0 forAssetSetIdentifier:0 forAssetSelector:v4 forSetAtomicInstance:0 forLockReason:v5 removingLockCount:-1 endError:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(void *)(a1[8] + 8LL) + 24LL) = v7;
}

+ (BOOL)endedAllPreviousLocksByClientProcessName:(id)a3 withClientProcessID:(int64_t)a4 forAssetSelector:(id)a5 endError:(id *)a6
{
  int64_t v9 = (__CFString *)a3;
  id v10 = a5;
  id v11 = v10;
  uint64_t v48 = 0LL;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  id v51 = __Block_byref_object_copy__16;
  v52 = __Block_byref_object_dispose__16;
  id v53 = 0LL;
  uint64_t v44 = 0LL;
  char v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  if (v9 && v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      BOOL v22 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      id v15 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"locks not ended (selector missing asset-version) | clientProcessName:%@, selector:%@",  v9,  v23);

      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClientProcessName",  0LL,  v15));
    }

    else
    {
      BOOL v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
      id v15 = v14;
      if (v14)
      {
        BOOL v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v14, "lockerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __109__MADAutoAssetLocker_endedAllPreviousLocksByClientProcessName_withClientProcessID_forAssetSelector_endError___block_invoke;
        block[3] = &unk_350C90;
        uint64_t v41 = &v44;
        id v15 = v15;
        id v38 = v15;
        __int16 v39 = v9;
        int64_t v43 = a4;
        id v40 = v11;
        uint64_t v42 = &v48;
        dispatch_sync(v16, block);

        id v17 = v38;
        goto LABEL_17;
      }

      uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClientProcessName",  0LL,  @"no auto-asset-locker"));
    }
  }

  else
  {
    objc_super v18 = objc_alloc(&OBJC_CLASS___NSString);
    id v19 = @"MISSING";
    if (v9) {
      id v20 = v9;
    }
    else {
      id v20 = @"MISSING";
    }
    if (v11) {
      id v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
    }
    id v15 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"locks not ended (missing required) | clientProcessName:%@, selector:%@",  v20,  v19);
    if (v11) {

    }
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:endedAllPreviousLocksByClientProcessName",  0LL,  v15));
  }

  id v17 = (NSString *)v49[5];
  v49[5] = v21;
LABEL_17:

  if (v49[5])
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_claimAutoreleasedReturnValue([v11 summary]);
      uint64_t v34 = (void *)v33;
      BOOL v35 = @"N";
      if (v9) {
        BOOL v35 = v9;
      }
      uint64_t v36 = v49[5];
      *(_DWORD *)buf = 138543874;
      id v55 = v35;
      __int16 v56 = 2114;
      uint64_t v57 = v33;
      __int16 v58 = 2114;
      uint64_t v59 = v36;
      _os_log_error_impl( &dword_0,  v25,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedAllPreviousLocksByClientProcessName} failed end-all-locks | clientProcessName:%{public}@, sele ctor:%{public}@ | error:%{public}@",  buf,  0x20u);
    }

    +[MADAutoAssetHistory recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forAssetID:withSelector:failingWithError:",  502LL,  v9,  @"UNKNOWN",  v11,  v49[5]);
    if (a6) {
      *a6 = (id) v49[5];
    }
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = objc_claimAutoreleasedReturnValue([v11 summary]);
      __int16 v29 = (void *)v28;
      v30 = @"N";
      if (v9) {
        v30 = v9;
      }
      *(_DWORD *)buf = 138543618;
      id v55 = v30;
      __int16 v56 = 2114;
      uint64_t v57 = v28;
      _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:endedAllPreviousLocksByClientProcessName} successful end-all-locks | clientProcessName:%{public}@, selector:%{public}@",  buf,  0x16u);
    }

    *((_BYTE *)v45 + 24) = 1;
  }

  BOOL v31 = *((_BYTE *)v45 + 24) != 0;
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v31;
}

void __109__MADAutoAssetLocker_endedAllPreviousLocksByClientProcessName_withClientProcessID_forAssetSelector_endError___block_invoke( void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8LL);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v2 _endLocksByClient:v3 forAllClientNames:0 forClientProcessName:v3 withClientProcessID:v5 forClientDomainNa me:0 forAssetSetIdentifier:0 forAssetSelector:v4 forSetAtomicInstance:0 forLockReason:0 removingLockCount:-1 endError:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = v7;
}

- (BOOL)_endLocksByClient:(id)a3 forAllClientNames:(BOOL)a4 forClientProcessName:(id)a5 withClientProcessID:(int64_t)a6 forClientDomainName:(id)a7 forAssetSetIdentifier:(id)a8 forAssetSelector:(id)a9 forSetAtomicInstance:(id)a10 forLockReason:(id)a11 removingLockCount:(int64_t)a12 endError:(id *)a13
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v24);

  if (v22) {
    id v25 = -[MADAutoAssetLocker newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:]( self,  "newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:",  v19,  v17,  v22);
  }
  else {
    id v25 = v17;
  }
  v170 = v25;
  v165 = v21;
  v158 = self;
  v163 = v22;
  v164 = v23;
  if (v18)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v21));
    if (v26)
    {
      if (a12 == -1)
      {
        id v146 = v20;
        v150 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v187 = 0u;
        __int128 v188 = 0u;
        __int128 v189 = 0u;
        __int128 v190 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
        id v41 = [obj countByEnumeratingWithState:&v187 objects:v203 count:16];
        if (v41)
        {
          id v42 = v41;
          uint64_t v167 = *(void *)v188;
          int64_t v43 = &selRef_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forSetInfoInstance_asSubAtomicFrom_;
          uint64_t v44 = &selRef_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forSetInfoInstance_asSubAtomicFrom_;
          id v148 = v17;
          id v162 = v18;
          id v153 = v19;
LABEL_19:
          uint64_t v45 = 0LL;
          uint64_t v46 = v43[257];
          char v47 = v44[256];
          while (1)
          {
            if (*(void *)v188 != v167) {
              objc_enumerationMutation(obj);
            }
            uint64_t v48 = *(void *)(*((void *)&v187 + 1) + 8 * v45);
            uint64_t v49 = objc_autoreleasePoolPush();
            uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
            id v51 = [v50 safeObjectForKey:v48 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
            v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

            if ((objc_opt_respondsToSelector(v52, v46) & 1) == 0 || (objc_opt_respondsToSelector(v52, v47) & 1) == 0) {
              break;
            }
            id v53 = (void *)objc_claimAutoreleasedReturnValue([v52 clientProcessName]);
            if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v53, v162))
            {
              id v54 = [v52 clientProcessID];

              if (v54 == (id)a6) {
                -[NSMutableDictionary setSafeObject:forKey:](v150, "setSafeObject:forKey:", v52, v48);
              }
            }

            else
            {
            }

            objc_autoreleasePoolPop(v49);
            if (v42 == (id)++v45)
            {
              id v42 = [obj countByEnumeratingWithState:&v187 objects:v203 count:16];
              id v17 = v148;
              id v18 = v162;
              id v19 = v153;
              int64_t v43 = &selRef_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forSetInfoInstance_asSubAtomicFrom_;
              uint64_t v44 = &selRef_atomicInstanceNewSetAtomicInstance_recordingHistoryOperation_forSetInfoInstance_asSubAtomicFrom_;
              if (v42) {
                goto LABEL_19;
              }
              goto LABEL_30;
            }
          }

          id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endLocksByClient",  0LL,  @"cannot accept ended locks by process name since not supported by installed OS version"));

          objc_autoreleasePoolPop(v49);
          id v17 = v148;
          id v18 = v162;
          id v19 = v153;
          if (!v39) {
            goto LABEL_47;
          }
          int v40 = 0;
        }

        else
        {
LABEL_30:

LABEL_47:
          __int128 v185 = 0u;
          __int128 v186 = 0u;
          __int128 v183 = 0u;
          __int128 v184 = 0u;
          v74 = v150;
          id v75 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v183,  v202,  16LL);
          if (v75)
          {
            id v76 = v75;
            uint64_t v77 = *(void *)v184;
            do
            {
              for (i = 0LL; i != v76; i = (char *)i + 1)
              {
                if (*(void *)v184 != v77) {
                  objc_enumerationMutation(v74);
                }
                uint64_t v79 = *(void *)(*((void *)&v183 + 1) + 8LL * (void)i);
                v80 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
                [v80 removeObjectForKey:v79];
              }

              id v76 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v74,  "countByEnumeratingWithState:objects:count:",  &v183,  v202,  16LL);
            }

            while (v76);
          }

          v81 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
          id v82 = [v81 count];

          if (v82)
          {
            v83 = objc_alloc(&OBJC_CLASS___NSString);
            v84 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
            v85 = -[NSString initWithFormat:]( v83,  "initWithFormat:",  @"client ended specified number of locks (or all locks) for all lock-reasons | assetLock.lockReasons:%ld",  [v84 count]);
            -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( v158,  "_persistAssetLock:operation:forAssetLock:message:",  @"_endLocksByClient",  @"ENTRY_MODIFY",  v26,  v85);

            else {
              uint64_t v86 = 250LL;
            }
            id v87 = -[MADAutoAssetLocker _currentLockCountOfLock:](v158, "_currentLockCountOfLock:", v26);
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](v158, "_assetIDOfLock:", v26));
            int v40 = 1;
            +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v86,  1LL,  v170,  v87,  v88,  v165);

            id v39 = 0LL;
          }

          else
          {
            -[MADAutoAssetLocker _removeAssetLock:lastClient:forSelector:message:]( v158,  "_removeAssetLock:lastClient:forSelector:message:",  v26,  v170,  v165,  @"endedLock for all reasons [specific count] (all locks have ended)");
            id v39 = 0LL;
            int v40 = 1;
          }
        }

        id v20 = v146;
        goto LABEL_66;
      }

      v27 = @"cannot accept ended locks by process name unless ending all locks by the given process";
      uint64_t v28 = 6108LL;
    }

    else
    {
      v27 = @"cannot accept ended locks when no existing lock for auto-specific-asset";
      uint64_t v28 = 6501LL;
    }

    id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v28,  @"AUTO-LOCKER:endLocksByClient",  0LL,  v27));
    int v40 = 0;
LABEL_66:

    char v89 = v40 != 0;
    goto LABEL_122;
  }

  if (v23)
  {
    id v29 = -[MAAutoAssetLockReason initForClientName:forLockReason:]( objc_alloc(&OBJC_CLASS___MAAutoAssetLockReason),  "initForClientName:forLockReason:",  v25,  v23);
    if (!v29)
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:endLocksByClient",  0LL,  @"unable to allocate client-lock-reason"));
      char v89 = 0;
LABEL_121:

      goto LABEL_122;
    }

    id v152 = v19;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v21));
    BOOL v31 = v30;
    if (!v30)
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:endLocksByClient",  0LL,  @"cannot accept ended locks when no existing lock for auto-specific-asset"));
      char v89 = 0;
LABEL_120:

      id v19 = v152;
      goto LABEL_121;
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 lockReasons]);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v29 summary]);
    id v34 = [v32 safeObjectForKey:v33 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
    BOOL v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    uint64_t v36 = v35;
    if (v35)
    {
      if (a12 != -1)
      {
        if ((uint64_t)[v35 activeLockCount] < a12)
        {
          id v37 = @"cannot accept ended locks (for specific lock-reason) when fewer locks exist than requested unlock count";
          uint64_t v38 = 6109LL;
LABEL_63:
          id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v38,  @"AUTO-LOCKER:endLocksByClient",  0LL,  v37));
          char v89 = 0;
LABEL_119:

          goto LABEL_120;
        }

        if ((uint64_t)[v35 activeLockCount] > a12)
        {
          objc_msgSend(v35, "setActiveLockCount:", (char *)objc_msgSend(v35, "activeLockCount") - a12);
          v121 = objc_alloc(&OBJC_CLASS___NSString);
          v168 = v35;
          v122 = (void *)objc_claimAutoreleasedReturnValue([v31 lockReasons]);
          v123 = -[NSString initWithFormat:]( v121,  "initWithFormat:",  @"client ended specified number of locks (other locks by client remain for client-lock-reason) | assetLock.lockReasons:%ld",  [v122 count]);
          -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( self,  "_persistAssetLock:operation:forAssetLock:message:",  @"_endLocksByClient",  @"ENTRY_MODIFY",  v31,  v123);

          else {
            uint64_t v124 = 250LL;
          }
          int64_t v125 = -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v31);
          id v126 = v20;
          v127 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v31));
          char v89 = 1;
          uint64_t v128 = v124;
          uint64_t v36 = v168;
          +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v128,  1LL,  v170,  v125,  v127,  v21);

          id v20 = v126;
          id v39 = 0LL;
          goto LABEL_119;
        }
      }

      v169 = v35;
      v129 = (void *)objc_claimAutoreleasedReturnValue([v31 lockReasons]);
      v130 = (void *)objc_claimAutoreleasedReturnValue([v29 summary]);
      [v129 removeObjectForKey:v130];

      v131 = (void *)objc_claimAutoreleasedReturnValue([v31 lockReasons]);
      id v132 = [v131 count];

      if (v132)
      {
        v133 = objc_alloc(&OBJC_CLASS___NSString);
        v134 = (void *)objc_claimAutoreleasedReturnValue([v31 lockReasons]);
        v135 = -[NSString initWithFormat:]( v133,  "initWithFormat:",  @"client ended all locks for specified reason (other locks remain) | assetLock.lockReasons:%ld",  [v134 count]);
        -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( self,  "_persistAssetLock:operation:forAssetLock:message:",  @"_endLocksByClient",  @"ENTRY_MODIFY",  v31,  v135);

        else {
          uint64_t v136 = 250LL;
        }
        int64_t v137 = -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v31);
        id v138 = v20;
        v139 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v31));
        char v89 = 1;
        +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v136,  1LL,  v170,  v137,  v139,  v165);

        id v20 = v138;
        id v39 = 0LL;
      }

      else
      {
        -[MADAutoAssetLocker _removeAssetLock:lastClient:forSelector:message:]( self,  "_removeAssetLock:lastClient:forSelector:message:",  v31,  v170,  v21,  @"endedLock for specific lock-reason (all locks have ended)");
        id v39 = 0LL;
        char v89 = 1;
      }

      uint64_t v36 = v169;
      goto LABEL_119;
    }

    id v37 = @"cannot accept ended locks when no existing lock for client-lock-reason";
    uint64_t v38 = 6501LL;
    goto LABEL_63;
  }

  id v154 = v19;
  id v149 = v17;
  id v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v21));
  __int16 v56 = v55;
  if (!v55)
  {
    id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:endLocksByClient",  0LL,  @"cannot accept ended locks when no existing lock for auto-specific-asset"));
    goto LABEL_72;
  }

  int64_t v57 = a12;
  id v147 = v20;
  if (a12 != -1)
  {
    __int128 v181 = 0u;
    __int128 v182 = 0u;
    __int128 v179 = 0u;
    __int128 v180 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue([v55 lockReasons]);
    id v39 = [obja countByEnumeratingWithState:&v179 objects:v201 count:16];
    int64_t v58 = 0LL;
    if (v39)
    {
      uint64_t v59 = *(void *)v180;
      p_ivars = &MobileAssetKeyManager__metaData.ivars;
      while (2)
      {
        for (j = 0LL; j != v39; j = (char *)j + 1)
        {
          if (*(void *)v180 != v59) {
            objc_enumerationMutation(obja);
          }
          uint64_t v62 = *(void *)(*((void *)&v179 + 1) + 8LL * (void)j);
          __int16 v63 = objc_autoreleasePoolPush();
          int64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v56 lockReasons]);
          id v65 = [v64 safeObjectForKey:v62 ofClass:objc_opt_class(p_ivars[316])];
          id v66 = (void *)objc_claimAutoreleasedReturnValue(v65);

          if (!v66)
          {
            id v39 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6111LL,  @"AUTO-LOCKER:endLocksByClient",  0LL,  @"cannot accept ended locks due to missing internal lock reference"));
            objc_autoreleasePoolPop(v63);
            goto LABEL_68;
          }

          v67 = (void *)objc_claimAutoreleasedReturnValue([v66 clientLockReason]);
          v68 = v67;
          if (a4) {
            goto LABEL_41;
          }
          int64_t v160 = v58;
          id v69 = v39;
          uint64_t v70 = v59;
          __int16 v71 = p_ivars;
          v72 = (void *)objc_claimAutoreleasedReturnValue([v67 autoAssetClientName]);
          unsigned int v73 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v170, v72);

          p_ivars = v71;
          uint64_t v59 = v70;
          id v39 = v69;
          int64_t v58 = v160;
          if (v73) {
LABEL_41:
          }
            v58 += (int64_t)[v66 activeLockCount];

          objc_autoreleasePoolPop(v63);
        }

        id v39 = [obja countByEnumeratingWithState:&v179 objects:v201 count:16];
        if (v39) {
          continue;
        }
        break;
      }

+ (id)newCurrentLockUsageForSelector:(id)a3
{
  id v3 = a3;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  BOOL v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __53__MADAutoAssetLocker_newCurrentLockUsageForSelector___block_invoke;
    block[3] = &unk_34E790;
    id v23 = (os_log_s *)v3;
    id v24 = v5;
    id v25 = &v26;
    dispatch_sync(v6, block);

    unsigned __int8 v7 = v23;
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker newCurrentLockUsageForSelector:].cold.1();
    }
  }

  if (![(id)v27[5] count])
  {
    int64_t v9 = (void *)v27[5];
    v27[5] = 0LL;
  }

  id v10 = (void *)v27[5];
  if (v10)
  {
    id v11 = (char *)[v10 count];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v3 summary]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([(id)v27[5] safeSummary]);
      BOOL v16 = (void *)v15;
      id v17 = @"s";
      *(_DWORD *)buf = 138544130;
      __int16 v34 = 2048;
      id v33 = v14;
      if (v11 == (_BYTE *)&dword_0 + 1) {
        id v17 = &stru_355768;
      }
      id v35 = v11;
      __int16 v36 = 2114;
      id v37 = v17;
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentLockUsageForSelector} | assetSelector:%{public}@ | %ld current lock-reason%{public}@:%{public}@",  buf,  0x2Au);
    }
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      *(_DWORD *)buf = 138543362;
      id v33 = v19;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentLockUsageForSelector} | assetSelector:%{public}@ | no current lock-reasons",  buf,  0xCu);
    }
  }

  id v20 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __53__MADAutoAssetLocker_newCurrentLockUsageForSelector___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetVersion]);

  id v3 = *(void **)(a1 + 40);
  if (!v2)
  {
    uint64_t v77 = a1;
    __int128 v90 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    uint64_t v28 = (os_log_s *)(id)objc_claimAutoreleasedReturnValue([v3 locateLocksNewAllBySelector]);
    id v75 = -[os_log_s countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v90,  v100,  16LL);
    if (!v75) {
      goto LABEL_43;
    }
    uint64_t v29 = *(void *)v91;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v31 = v77;
    uint64_t v72 = *(void *)v91;
    id obja = v28;
    while (1)
    {
      for (i = 0LL; i != v75; i = (char *)i + 1)
      {
        if (*(void *)v91 != v29) {
          objc_enumerationMutation(v28);
        }
        id v33 = -[os_log_s safeObjectForKey:ofClass:]( v28,  "safeObjectForKey:ofClass:",  *(void *)(*((void *)&v90 + 1) + 8LL * (void)i),  objc_opt_class(&OBJC_CLASS___MAAutoAssetLock));
        __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        id v35 = p_ivars[155];
        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v34 fullAssetSelector]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 assetType]);
        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v31 + 32) assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v35, "stringIsEqual:to:", v37, v38) & 1) != 0)
        {
          uint64_t v39 = p_ivars[155];
          id v76 = i;
          int v40 = (void *)objc_claimAutoreleasedReturnValue([v34 fullAssetSelector]);
          uint64_t v79 = v34;
          id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 assetSpecifier]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v31 + 32) assetSpecifier]);
          LODWORD(v39) = -[__objc2_ivar_list stringIsEqual:to:](v39, "stringIsEqual:to:", v41, v42);

          __int16 v34 = v79;
          int64_t v43 = v28;
          uint64_t v44 = v29;
          uint64_t v45 = v36;
          uint64_t v46 = &MobileAssetKeyManager__metaData.ivars;

          i = v76;
          uint64_t v29 = v44;
          uint64_t v28 = v43;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          if (!(_DWORD)v39) {
            goto LABEL_41;
          }
          __int128 v88 = 0u;
          __int128 v89 = 0u;
          __int128 v86 = 0u;
          __int128 v87 = 0u;
          id v81 = (id)objc_claimAutoreleasedReturnValue([v79 lockReasons]);
          id v47 = [v81 countByEnumeratingWithState:&v86 objects:v99 count:16];
          if (v47)
          {
            id v48 = v47;
            uint64_t v49 = *(void *)v87;
            do
            {
              for (j = 0LL; j != v48; j = (char *)j + 1)
              {
                if (*(void *)v87 != v49) {
                  objc_enumerationMutation(v81);
                }
                uint64_t v51 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)j);
                v52 = objc_autoreleasePoolPush();
                id v53 = (void *)objc_claimAutoreleasedReturnValue([v34 lockReasons]);
                id v54 = [v53 safeObjectForKey:v51 ofClass:objc_opt_class(v46[316])];
                id v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

                if (v55)
                {
                  __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 clientLockReason]);
                  int64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v56 lockReason]);

                  if (v57)
                  {
                    int64_t v58 = *(void **)(*(void *)(*(void *)(v31 + 48) + 8LL) + 40LL);
                    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v55 clientLockReason]);
                    id v60 = (void *)objc_claimAutoreleasedReturnValue([v59 lockReason]);
                    id v61 = [v58 safeObjectForKey:v60 ofClass:objc_opt_class(NSNumber)];
                    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(v61);

                    __int16 v63 = objc_alloc(&OBJC_CLASS___NSNumber);
                    if (v62)
                    {
                      int64_t v64 = -[NSNumber initWithLong:]( v63,  "initWithLong:",  (char *)[v55 activeLockCount] + (int)objc_msgSend(v62, "intValue"));
                    }

                    else
                    {
                      int64_t v64 = -[NSNumber initWithLong:](v63, "initWithLong:", [v55 activeLockCount]);
                    }

                    uint64_t v31 = v77;
                    id v65 = *(void **)(*(void *)(*(void *)(v77 + 48) + 8LL) + 40LL);
                    id v66 = (void *)objc_claimAutoreleasedReturnValue([v55 clientLockReason]);
                    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 lockReason]);
                    [v65 setSafeObject:v64 forKey:v67];

                    uint64_t v46 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                    __int16 v34 = v79;
                  }
                }

                objc_autoreleasePoolPop(v52);
              }

              id v48 = [v81 countByEnumeratingWithState:&v86 objects:v99 count:16];
            }

            while (v48);
            uint64_t v29 = v72;
            uint64_t v28 = obja;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            i = v76;
          }

          __int16 v36 = v81;
        }

        else
        {
        }

LABEL_41:
      }

      id v75 = -[os_log_s countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v90,  v100,  16LL);
      if (!v75)
      {
LABEL_43:
        uint64_t v5 = v28;
        goto LABEL_47;
      }
    }
  }

  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 locateLockBySelector:*(void *)(a1 + 32)]);
  uint64_t v5 = v4;
  if (v4)
  {
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[os_log_s lockReasons](v4, "lockReasons"));
    id v6 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v83;
      uint64_t v78 = *(void *)v83;
      do
      {
        int64_t v9 = 0LL;
        id v80 = v7;
        do
        {
          if (*(void *)v83 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)v9);
          id v11 = objc_autoreleasePoolPush();
          id v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s lockReasons](v5, "lockReasons"));
          id v13 = [v12 safeObjectForKey:v10 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          if (v14)
          {
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientLockReason]);
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lockReason]);

            if (v16)
            {
              id v17 = v5;
              id v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 clientLockReason]);
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lockReason]);
              id v21 = [v18 safeObjectForKey:v20 ofClass:objc_opt_class(NSNumber)];
              id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

              id v23 = objc_alloc(&OBJC_CLASS___NSNumber);
              if (v22)
              {
                id v24 = -[NSNumber initWithLong:]( v23,  "initWithLong:",  (char *)[v14 activeLockCount] + (int)objc_msgSend(v22, "intValue"));
              }

              else
              {
                id v24 = -[NSNumber initWithLong:](v23, "initWithLong:", [v14 activeLockCount]);
              }

              id v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v14 clientLockReason]);
              v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReason]);
              [v25 setSafeObject:v24 forKey:v27];

              uint64_t v5 = v17;
              uint64_t v8 = v78;
              id v7 = v80;
            }
          }

          objc_autoreleasePoolPop(v11);
          int64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
      }

      while (v7);
    }

    uint64_t v28 = (os_log_s *)obj;
  }

  else
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v69 = (os_log_s *)objc_claimAutoreleasedReturnValue([v68 oslog]);

    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      __int16 v71 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
      *(_DWORD *)buf = 138543618;
      v96 = v70;
      __int16 v97 = 2114;
      id v98 = v71;
      _os_log_impl( &dword_0,  v69,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {newCurrentLockUsageForSelector} no assetLock on locksBySelector for fullAssetSelector:%{public}@",  buf,  0x16u);
    }

    uint64_t v28 = v69;
  }

+ (id)copyOfLocksBySelector
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  BOOL v16 = __Block_byref_object_copy__16;
  id v17 = __Block_byref_object_dispose__16;
  id v18 = 0LL;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 lockerQueue]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __43__MADAutoAssetLocker_copyOfLocksBySelector__block_invoke;
    v10[3] = &unk_34DB48;
    id v12 = &v13;
    id v11 = v3;
    dispatch_sync(v4, v10);

    uint64_t v5 = v11;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

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

void __43__MADAutoAssetLocker_copyOfLocksBySelector__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateLocksNewAllBySelector]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)lockedSelectorsForEliminate:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__16;
  id v20 = __Block_byref_object_dispose__16;
  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __50__MADAutoAssetLocker_lockedSelectorsForEliminate___block_invoke;
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
    int64_t v9 = (void *)v17[5];
    v17[5] = 0LL;
  }

  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __50__MADAutoAssetLocker_lockedSelectorsForEliminate___block_invoke(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateLocksNewAllBySelector]);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v2 = v1;
  id v52 = [v2 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v52)
  {
    uint64_t v3 = *(void *)v55;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v5 = &MobileAssetKeyManager__metaData.ivars;
    id v49 = v2;
    uint64_t v50 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v55 != v3) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
        id v8 = objc_autoreleasePoolPush();
        id v9 = [v2 safeObjectForKey:v7 ofClass:objc_opt_class(p_ivars[324])];
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);

        if (!v11)
        {
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
            id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
            *(_DWORD *)buf = 138543874;
            uint64_t v59 = v30;
            __int16 v60 = 2114;
            id v61 = v31;
            __int16 v62 = 2114;
            __int16 v63 = v32;
            _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ | {lockedSelectorsForEliminate} assetLock on locksBySelector with nil fullAssetSelector | asset Lock:%{public}@ | eliminateSelector:%{public}@",  buf,  0x20u);

            uint64_t v5 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            id v2 = v49;
          }

          goto LABEL_29;
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetVersion]);

        if (!v12)
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);

          __int16 v34 = v5[155];
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
          id v35 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s assetType](v14, "assetType"));
          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetType]);
          unsigned int v37 = -[__objc2_ivar_list stringIsEqual:to:](v34, "stringIsEqual:to:", v35, v36);
          unsigned int v38 = v37;
          if (v33)
          {
            if ((v37 & 1) == 0)
            {

              id v2 = v49;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              uint64_t v5 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              goto LABEL_29;
            }

            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
            int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 assetSpecifier]);
            id v41 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);
            unsigned int v42 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v40, v41);

            uint64_t v3 = v50;
            uint64_t v5 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);

            id v2 = v49;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            if (!v42) {
              goto LABEL_30;
            }
            int64_t v43 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 oslog]);

            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
              *(_DWORD *)buf = 138543618;
              uint64_t v59 = v25;
              __int16 v60 = 2114;
              id v61 = v26;
              v27 = v24;
              uint64_t v28 = "%{public}@ | {lockedSelectorsForEliminate} eliminate-selector for asset-type + asset-specifier assoc"
                    "iated with current lock | eliminateSelector:%{public}@";
              goto LABEL_26;
            }
          }

          else
          {

            id v2 = v49;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            uint64_t v5 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            if (!v38) {
              goto LABEL_30;
            }
            uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
              *(_DWORD *)buf = 138543618;
              uint64_t v59 = v25;
              __int16 v60 = 2114;
              id v61 = v26;
              v27 = v24;
              uint64_t v28 = "%{public}@ | {lockedSelectorsForEliminate} eliminate-selector for asset-type associated with current"
                    " lock | eliminateSelector:%{public}@";
LABEL_26:
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);

              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            }
          }

- (void)_removeAssetLock:(id)a3 lastClient:(id)a4 forSelector:(id)a5 message:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);
  if (v15)
  {
    -[MADAutoAssetLocker _persistRemoveAssetLock:removedAssetLock:message:]( self,  "_persistRemoveAssetLock:removedAssetLock:message:",  @"_removeAssetLock",  v10,  v13);
    else {
      uint64_t v16 = 302LL;
    }
    int64_t v17 = -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v10);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v10));
    if (v11) {
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v16,  1LL,  v11,  v17,  v18,  v12);
    }
    else {
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:forAssetID:withSelector:",  v16,  1LL,  3LL,  v17,  v18,  v12);
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](self, "summary"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      int v24 = 138544130;
      id v25 = v21;
      __int16 v26 = 2114;
      id v27 = v13;
      __int16 v28 = 2114;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      uint64_t v31 = v23;
      _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "%{public}@ | {_removeAssetLock} | %{public}@: | no entry ID for fullAssetSelector:%{public}@ | assetLock:%{public}@",  (uint8_t *)&v24,  0x2Au);
    }
  }
}

+ (void)resumeFromPersistedWithDownloadedSelectors:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __65__MADAutoAssetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_718;
    v8[3] = &unk_34DB98;
    id v9 = v5;
    id v10 = v3;
    dispatch_async(v6, v8);
  }

  else
  {
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
    dispatch_async(v7, &__block_literal_global_717);
  }
}

void __65__MADAutoAssetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 oslog]);

  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__MADAutoSetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_cold_1();
  }

  +[MADAutoAssetControlManager lockerResumed](&OBJC_CLASS___MADAutoAssetControlManager, "lockerResumed");
}

void __65__MADAutoAssetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_718(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  [v2 loadPersistedState:@"resumeFromPersistedWithDownloadedSelectors"];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistedEntryIDs:@"resumeFromPersistedWithDownloadedSelectors"]);

  uint64_t v46 = v4;
  if ([v4 count])
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = v4;
    id v51 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (!v51) {
      goto LABEL_25;
    }
    uint64_t v50 = *(void *)v54;
    uint64_t v48 = v1;
    while (1)
    {
      for (i = 0LL; i != v51; i = (char *)i + 1)
      {
        if (*(void *)v54 != v50) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v7 = objc_autoreleasePoolPush();
        id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 persistedEntry:v6 fromLocation:@"resumeFromPersistedWithDownloadedSelectors"]);

        if (v9)
        {
          id v49 = v6;
          id v52 = v7;
          id v10 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLock);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockTracker);
          uint64_t v15 = v9;
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSURL);
          uint64_t v45 = v16;
          id v9 = v15;
          id v19 = -[NSSet initWithObjects:]( v10,  "initWithObjects:",  v11,  v12,  v13,  v14,  v45,  v17,  v18,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
          id v20 = [v15 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MAAutoAssetLock) encodeClasses:v19];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          id v22 = v21;
          if (v21)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);

            uint64_t v1 = v48;
            if (v23)
            {
              int v24 = *(void **)(v48 + 40);
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
              LOBYTE(v24) = [v24 containsObject:v25];

              __int16 v26 = *(void **)(v48 + 32);
              if ((v24 & 1) != 0)
              {
                id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
                [v26 _logPersistedEntry:@"resumeFromPersistedWithDownloadedSelectors" operation:@"ENTRY_LOAD" persistingAssetLock:v22 forSelector:v27 message:@"resumed from persisted-state for currently downloaded selector"];
              }

              else
              {
                id v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v48 + 32) logger]);
                __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v58 = v49;
                  _os_log_error_impl( &dword_0,  v34,  OS_LOG_TYPE_ERROR,  "{resumeFromPersistedWithDownloadedSelectors} | downloaded asset selector does not contain persisted entry:%{public}@",  buf,  0xCu);
                }

                id v35 = *(void **)(v48 + 32);
                id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 fullAssetSelector]);
                [v35 _removeAssetLock:v22 lastClient:0 forSelector:v27 message:@"downloaded asset selector does not contain persisted entry"];
              }

              goto LABEL_22;
            }

            id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v48 + 32) logger]);
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v49;
              __int16 v30 = v27;
              uint64_t v31 = "{resumeFromPersistedWithDownloadedSelectors} | missing asset selector for entry:%{public}@";
LABEL_18:
              _os_log_error_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
            }
          }

          else
          {
            uint64_t v1 = v48;
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v48 + 32) logger]);
            id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v49;
              __int16 v30 = v27;
              uint64_t v31 = "{resumeFromPersistedWithDownloadedSelectors} | no asset-lock entry found for entry:%{public}@";
              goto LABEL_18;
            }
          }

void __65__MADAutoAssetLocker_resumeFromPersistedWithDownloadedSelectors___block_invoke_732(id a1)
{
}

+ (int64_t)persistedLocksCount
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  id v3 = v2;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = -1LL;
  if (v2)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 lockerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __41__MADAutoAssetLocker_persistedLocksCount__block_invoke;
    v9[3] = &unk_34DB48;
    uint64_t v11 = &v12;
    id v10 = v3;
    dispatch_sync(v4, v9);

    uint64_t v5 = v10;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLocker persistedLocksCount].cold.1();
    }
  }

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __41__MADAutoAssetLocker_persistedLocksCount__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 persistedEntryCount:@"AUTO-LOCKER"];
}

- (void)_persistRemoveAssetLock:(id)a3 removedAssetLock:(id)a4 message:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 persistedEntry:v13 fromLocation:v8]);

  if (v15)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
    [v16 removePersistedEntry:v13 fromLocation:v8];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
    -[MADAutoAssetLocker _logPersistedRemovedEntry:removedAssetLock:forSelector:message:]( self,  "_logPersistedRemovedEntry:removedAssetLock:forSelector:message:",  v8,  v9,  v17,  v10);
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _persistRemoveAssetLock:removedAssetLock:message:].cold.1((uint64_t)v8, v9, v19);
    }
  }
}

- (void)_mergeAddedLock:(id)a3 intoExistingLock:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
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
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v6 setLastRefreshTimestamp:v11];
}

- (void)_mergeContinuedLock:(id)a3 intoExistingLock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
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
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (uint64_t)[v4 activeLockCount] < 1;
  return v6;
}

+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5
{
  return 0LL;
}

- (void)_logPersistedRemovedEntry:(id)a3 removedAssetLock:(id)a4 forSelector:(id)a5 message:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (__CFString *)a6;
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  @"ENTRY_REMOVE"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedEntryID]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

  if (!v16)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](self, "summary"));
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 summary]);
    int v22 = 138544386;
    id v23 = v19;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v20;
    __int16 v30 = 2114;
    uint64_t v31 = v21;
    _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedRemovedEntry} | no fullAssetSelectorKey to remove | %{public}@ | fullAssetSe lector:%{public}@ | assetLock:%{public}@",  (uint8_t *)&v22,  0x34u);

    goto LABEL_4;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = -[MADAutoAssetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v11);
    int v22 = 138546434;
    id v23 = @"PERSISTED";
    __int16 v24 = 2114;
    id v25 = @"AUTO-LOCKER";
    __int16 v26 = 2114;
    id v27 = @"ENTRY_REMOVE";
    __int16 v28 = 2114;
    uint64_t v29 = @"LOCKR";
    __int16 v30 = 2114;
    uint64_t v31 = @">----->";
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v13;
    __int16 v36 = 2114;
    unsigned int v37 = @"LOCKR";
    __int16 v38 = 2114;
    uint64_t v39 = v15;
    __int16 v40 = 2114;
    id v41 = v16;
    __int16 v42 = 2114;
    int64_t v43 = v19;
    __int16 v44 = 2114;
    uint64_t v45 = @"LOCKR";
    __int16 v46 = 2114;
    id v47 = @"<-----<";
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@] | %{public}@\n #_%{public}@:%{public}@",  (uint8_t *)&v22,  0x84u);
LABEL_4:
  }

- (void)_logPersistedTableOfContents:(id)a3
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  if (+[MADAutoAssetControlManager preferencePersistedTableLoggingEnabled]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferencePersistedTableLoggingEnabled"))
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryIDs:v4]);

    if ([v7 count])
    {
      id v8 = (const __CFString *)[v7 count];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
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
        uint64_t v48 = @"LOCKR";
        __int16 v49 = 2114;
        uint64_t v50 = @">----->";
        __int16 v51 = 2114;
        id v52 = v4;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} table-of-contents...",  buf,  0x3Eu);
      }

      if ((uint64_t)v8 >= 1)
      {
        uint64_t v11 = 0LL;
        __int16 v36 = v7;
        unsigned int v37 = v4;
        do
        {
          id v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v11]);
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntry:v12 fromLocation:v4]);

          if (v14)
          {
            __int16 v40 = objc_alloc(&OBJC_CLASS___NSSet);
            uint64_t v39 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLock);
            uint64_t v38 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
            uint64_t v16 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockTracker);
            uint64_t v17 = v8;
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
            uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSString);
            uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSURL);
            uint64_t v33 = v18;
            id v8 = v17;
            id v19 = -[NSSet initWithObjects:]( v40,  "initWithObjects:",  v39,  v38,  v15,  v16,  v33,  v34,  v35,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
            id v20 = [v14 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MAAutoAssetLock) encodeClasses:v19];
            id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            int v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v24 = -[MADAutoAssetLocker _newAssetLockSummaryWithoutSelectorOrAttributes:]( self,  "_newAssetLockSummaryWithoutSelectorOrAttributes:",  v21);
              *(_DWORD *)buf = 138544642;
              __int16 v42 = @"LOCKR";
              __int16 v43 = 2114;
              __int16 v44 = @"E_LOD";
              __int16 v45 = 2048;
              __int16 v46 = (const __CFString *)(v11 + 1);
              __int16 v47 = 2048;
              uint64_t v48 = v8;
              __int16 v49 = 2114;
              uint64_t v50 = v12;
              __int16 v51 = 2114;
              id v52 = v24;
              _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "\n#_%{public}@:%{public}@ (%ld of %ld) [%{public}@] | %{public}@",  buf,  0x3Eu);
            }

            int64_t v7 = v36;
            id v4 = v37;
          }

          else
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](self, "summary"));
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

      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
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
      uint64_t v48 = @"LOCKR";
      __int16 v49 = 2114;
      uint64_t v50 = @"<-----<";
      __int16 v51 = 2114;
      id v52 = v4;
      uint64_t v29 = "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} ...table-of-contents";
      __int16 v30 = v28;
      uint32_t v31 = 62;
    }

    else
    {
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
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
      uint64_t v48 = @"LOCKR";
      __int16 v49 = 2114;
      uint64_t v50 = @">----->";
      __int16 v51 = 2114;
      id v52 = v4;
      __int16 v53 = 2114;
      __int128 v54 = @"empty table-of-contents";
      __int16 v55 = 2114;
      __int128 v56 = @"LOCKR";
      __int16 v57 = 2114;
      id v58 = @"<-----<";
      uint64_t v29 = "[%{public}@][%{public}@][%{public}@]\n"
            "#_%{public}@:%{public}@ {%{public}@} %{public}@\n"
            "#_%{public}@:%{public}@";
      __int16 v30 = v28;
      uint32_t v31 = 92;
    }

    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_19;
  }

- (id)locateLocksNewAllBySelector
{
  id v2 = self;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](v2, "persistedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistedEntryIDs:@"locateLocksNewAllBySelector"]);

  uint64_t v33 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if ([v5 count])
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int16 v32 = v5;
    id obj = v5;
    id v38 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (!v38) {
      goto LABEL_23;
    }
    uint64_t v37 = *(void *)v41;
    uint64_t v35 = v2;
    while (1)
    {
      BOOL v6 = 0LL;
      do
      {
        if (*(void *)v41 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v6);
        id v8 = objc_autoreleasePoolPush();
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](v2, "persistedState"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistedEntry:v7 fromLocation:@"locateLocksNewAllBySelector"]);

        if (v10)
        {
          uint64_t v36 = v7;
          uint64_t v39 = v8;
          uint64_t v11 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLock);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockTracker);
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
          uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSURL);
          id v19 = -[NSSet initWithObjects:]( v11,  "initWithObjects:",  v12,  v13,  v14,  v15,  v16,  v17,  v18,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
          id v20 = [v10 secureCodedObjectForKey:@"assetLock" ofClass:objc_opt_class(MAAutoAssetLock) encodeClasses:v19];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          int v22 = v21;
          if (v21)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);

            id v2 = v35;
            if (v23)
            {
              -[NSMutableDictionary setSafeObject:forKey:](v33, "setSafeObject:forKey:", v22, v36);
LABEL_17:
              id v8 = v39;

              goto LABEL_18;
            }

            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v35, "logger"));
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v29 oslog]);

            if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
            {
LABEL_16:

              goto LABEL_17;
            }

            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v36;
            id v27 = (os_log_s *)v26;
            __int16 v28 = "{locateLocksNewAllBySelector} | missing asset selector for entry:%{public}@";
          }

          else
          {
            id v2 = v35;
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v35, "logger"));
            __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 oslog]);

            if (!os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
              goto LABEL_16;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v45 = v36;
            id v27 = (os_log_s *)v26;
            __int16 v28 = "{locateLocksNewAllBySelector} | no asset-lock entry found for entry:%{public}@";
          }

          _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
          goto LABEL_16;
        }

        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v2, "logger"));
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v45 = v7;
          _os_log_error_impl( &dword_0,  v19,  OS_LOG_TYPE_ERROR,  "{locateLocksNewAllBySelector} | unable to determine previous status for entry:%{public}@",  buf,  0xCu);
        }

- (int64_t)locateLocksCurrentLocksCount
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker persistedState](self, "persistedState"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 persistedEntryIDs:@"locateLocksCurrentLocksCount"]);

  id v6 = [v5 count];
  return (int64_t)v6;
}

- (BOOL)_anyCurrentLocksForEliminate:(id)a3
{
  id v54 = a3;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLocksNewAllBySelector](self, "locateLocksNewAllBySelector"));
  id v52 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (!v52) {
    goto LABEL_22;
  }
  __int16 v47 = self;
  uint64_t v4 = *(void *)v56;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  uint64_t v50 = *(void *)v56;
  do
  {
    id v6 = 0LL;
    do
    {
      if (*(void *)v56 != v4) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)v6);
      id v8 = objc_autoreleasePoolPush();
      id v9 = [obj safeObjectForKey:v7 ofClass:objc_opt_class(MAAutoAssetLock)];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v54 assetVersion]);

      if (v11)
      {
        uint64_t v12 = p_ivars[155];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v54 assetType]);
        context = v8;
        uint64_t v16 = p_ivars[155];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        uint64_t v18 = v10;
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSpecifier]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v54 assetSpecifier]);
        if (!-[__objc2_ivar_list stringIsEqual:to:](v16, "stringIsEqual:to:", v19, v20))
        {

          uint64_t v4 = v50;
          id v8 = context;
          id v10 = v18;
LABEL_16:

          goto LABEL_17;
        }

        uint64_t v48 = p_ivars[155];
        __int16 v49 = v18;
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 fullAssetSelector]);
        int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assetVersion]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v54 assetVersion]);
        LODWORD(v48) = -[__objc2_ivar_list stringIsEqual:to:](v48, "stringIsEqual:to:", v22, v23);

        uint64_t v4 = v50;
        id v8 = context;
        id v10 = v49;
        if ((_DWORD)v48)
        {
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v47, "logger"));
          uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](v47, "summary"));
            __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v54 summary]);
            *(_DWORD *)buf = 138543618;
            __int16 v60 = v39;
            __int16 v61 = 2114;
            __int16 v62 = v40;
            __int128 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type + asset-specifier + asse"
                  "t-version associated with current lock | eliminateSelector:%{public}@";
            goto LABEL_29;
          }

          goto LABEL_30;
        }
      }

      else
      {
        __int16 v24 = p_ivars;
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v54 assetSpecifier]);

        __int16 v26 = v24[155];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v54 assetType]);
        unsigned int v27 = -[__objc2_ivar_list stringIsEqual:to:](v26, "stringIsEqual:to:", v14, v15);
        unsigned int v28 = v27;
        if (v25)
        {
          if (!v27) {
            goto LABEL_16;
          }
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 fullAssetSelector]);
          id v30 = v10;
          uint32_t v31 = (void *)objc_claimAutoreleasedReturnValue([v29 assetSpecifier]);
          __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v54 assetSpecifier]);
          unsigned int v33 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v31, v32);

          id v10 = v30;
          uint64_t v4 = v50;

          if (v33)
          {
            context = v8;
            __int16 v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v47, "logger"));
            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](v47, "summary"));
              __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v54 summary]);
              *(_DWORD *)buf = 138543618;
              __int16 v60 = v39;
              __int16 v61 = 2114;
              __int16 v62 = v40;
              __int128 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type + asset-specifier asso"
                    "ciated with current lock | eliminateSelector:%{public}@";
LABEL_29:
              _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, v41, buf, 0x16u);
            }

            goto LABEL_30;
          }
        }

        else
        {

          if (v28)
          {
            context = v8;
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](v47, "logger"));
            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](v47, "summary"));
              __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v54 summary]);
              *(_DWORD *)buf = 138543618;
              __int16 v60 = v39;
              __int16 v61 = 2114;
              __int16 v62 = v40;
              __int128 v41 = "%{public}@ | {_anyCurrentLocksForEliminate} eliminate-selector for asset-type associated with curren"
                    "t lock | eliminateSelector:%{public}@";
              goto LABEL_29;
            }

- (id)summary
{
  int64_t v3 = -[MADAutoAssetLocker locateLocksCurrentLocksCount](self, "locateLocksCurrentLocksCount");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker eliminateSelectors](self, "eliminateSelectors"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"locksBySelector:%ld|eliminateSelectors:%ld",  v3,  [v4 count]));

  return v5;
}

+ (void)addClientLockReasons:(id)a3 basedOnControl:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  id v8 = v7;
  if (v7)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __58__MADAutoAssetLocker_addClientLockReasons_basedOnControl___block_invoke;
    block[3] = &unk_34DB70;
    id v13 = v8;
    id v14 = v6;
    id v15 = v5;
    dispatch_sync(v9, block);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLocker addClientLockReasons:basedOnControl:].cold.1();
    }
  }
}

void __58__MADAutoAssetLocker_addClientLockReasons_basedOnControl___block_invoke(uint64_t a1)
{
  __int128 v41 = (id *)(a1 + 32);
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateLocksNewAllBySelector]);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v2 = v1;
  id v3 = [v2 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v52;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v7 = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v36 = *(void *)v52;
    id v37 = v2;
    do
    {
      id v8 = 0LL;
      id v38 = v4;
      do
      {
        uint64_t v9 = v5;
        if (*(void *)v52 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)v8);
        uint64_t v11 = objc_autoreleasePoolPush();
        uint64_t v43 = v10;
        id v12 = [v2 safeObjectForKey:v10 ofClass:objc_opt_class(MAAutoAssetLock)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        id v14 = p_ivars[174];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 fullAssetSelector]);
        LODWORD(v14) = -[__objc2_ivar_list selectorToBeIncluded:basedOnControl:]( v14,  "selectorToBeIncluded:basedOnControl:",  v15,  *(void *)(a1 + 40));

        uint64_t v5 = v9;
        if ((_DWORD)v14)
        {
          uint64_t v39 = v11;
          __int128 v40 = v8;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue([v13 lockReasons]);
          id v16 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v48;
            uint64_t v42 = *(void *)v48;
            do
            {
              id v19 = 0LL;
              id v45 = v17;
              do
              {
                if (*(void *)v48 != v18) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)v19);
                id v21 = objc_autoreleasePoolPush();
                int v22 = (void *)objc_claimAutoreleasedReturnValue([v13 lockReasons]);
                id v23 = [v22 safeObjectForKey:v20 ofClass:objc_opt_class(v7[316])];
                __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                if (v24)
                {
                  id v25 = [v24 copy];
                  if (v25)
                  {
                    __int16 v26 = v7;
                    unsigned int v27 = objc_alloc(&OBJC_CLASS___NSString);
                    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v25 clientLockReason]);
                    uint64_t v29 = v13;
                    id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 autoAssetClientName]);
                    uint32_t v31 = -[NSString initWithFormat:](v27, "initWithFormat:", @"(%@)%@", v43, v30);
                    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v25 clientLockReason]);
                    [v32 setAutoAssetClientName:v31];

                    id v13 = v29;
                    if ([v29 inhibitedFromEmergencyRemoval])
                    {
                      unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v25 lockUsagePolicy]);
                      [v33 setLockInhibitsEmergencyRemoval:1];

                      id v13 = v29;
                    }

                    [*(id *)(a1 + 48) addObject:v25];
                    uint64_t v7 = v26;
                    uint64_t v18 = v42;
                    id v17 = v45;
                  }

                  else
                  {
                    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
                    BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                      __58__MADAutoAssetLocker_addClientLockReasons_basedOnControl___block_invoke_cold_1( v55,  v41,  &v56,  v35);
                    }
                  }
                }

                objc_autoreleasePoolPop(v21);
                id v19 = (char *)v19 + 1;
              }

              while (v17 != v19);
              id v17 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
            }

            while (v17);
          }

          uint64_t v5 = v36;
          id v2 = v37;
          id v4 = v38;
          uint64_t v11 = v39;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          id v8 = v40;
        }

        objc_autoreleasePoolPop(v11);
        id v8 = (char *)v8 + 1;
      }

      while (v8 != v4);
      id v4 = [v2 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v4);
  }
}

+ (void)forceGlobalUnlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __40__MADAutoAssetLocker_forceGlobalUnlock___block_invoke;
    v9[3] = &unk_34DB98;
    id v10 = v5;
    id v11 = v3;
    dispatch_sync(v6, v9);
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MADAutoSetLocker forceGlobalUnlock:].cold.1();
    }
  }
}

void __40__MADAutoAssetLocker_forceGlobalUnlock___block_invoke(uint64_t a1)
{
  __int16 v32 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) locateLocksNewAllBySelector]);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v3 = v2;
  uint64_t v38 = a1;
  uint64_t v39 = v3;
  id v37 = [v3 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v45;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(v3);
        }
        uint64_t v5 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v4);
        id v6 = objc_autoreleasePoolPush();
        id v7 = [v3 safeObjectForKey:v5 ofClass:objc_opt_class(MAAutoAssetLock)];
        id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fullAssetSelector]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetType]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetType]);
        unsigned int v12 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v10, v11);

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);
          if (v13)
          {
            BOOL v35 = (void *)objc_claimAutoreleasedReturnValue([v8 fullAssetSelector]);
            uint64_t v14 = objc_claimAutoreleasedReturnValue([v35 assetSpecifier]);
            unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetSpecifier]);
            id v34 = (void *)v14;
            if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14))
            {
              LOBYTE(v19) = 0;
              goto LABEL_15;
            }
          }

          id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetVersion]);
          if (!v15)
          {

            if (v13)
            {
              LOBYTE(v19) = 1;
              goto LABEL_15;
            }

            goto LABEL_16;
          }

          id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 fullAssetSelector]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetVersion]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetVersion]);
          unsigned int v19 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v17, v18);

          if (v13)
          {
            a1 = v38;
            id v3 = v39;
LABEL_15:

            if ((v19 & 1) == 0) {
              goto LABEL_17;
            }
LABEL_16:
            -[NSMutableDictionary setSafeObject:forKey:](v32, "setSafeObject:forKey:", v8, v5);
            goto LABEL_17;
          }

          a1 = v38;
          id v3 = v39;
          if (v19) {
            goto LABEL_16;
          }
        }

+ (id)currentSetLockUsageEliminatingOtherThanSetAtomicInstances:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = __Block_byref_object_copy__16;
  unsigned int v19 = __Block_byref_object_dispose__16;
  id v20 = 0LL;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __80__MADAutoAssetLocker_currentSetLockUsageEliminatingOtherThanSetAtomicInstances___block_invoke;
    block[3] = &unk_34E790;
    unsigned int v12 = v5;
    id v13 = v3;
    uint64_t v14 = &v15;
    dispatch_sync(v6, block);

    id v7 = v12;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLocker currentSetLockUsageEliminatingOtherThanSetAtomicInstances:].cold.1();
    }
  }

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __80__MADAutoAssetLocker_currentSetLockUsageEliminatingOtherThanSetAtomicInstances___block_invoke( uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 persistedEntryIDs:@"currentSetLockUsageEliminatingOtherThanSetAtomicInstances"]);

  if (![v3 count]) {
    goto LABEL_69;
  }
  id v104 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLock);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MAAutoAssetSelector);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockReason);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MAAutoAssetLockTracker);
  __int128 v92 = v3;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MAAutoAssetPolicy);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSURL);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v91 = v11;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  uint64_t v90 = v9;
  id v3 = v92;
  uint64_t v14 = v5;
  uint64_t v15 = &MobileAssetKeyManager__metaData.ivars;
  v94 = -[NSSet initWithObjects:](v4, "initWithObjects:", v14, v6, v7, v8, v90, v10, v91, v12, 0LL);
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  id obj = v92;
  id v98 = [obj countByEnumeratingWithState:&v116 objects:v127 count:16];
  if (!v98) {
    goto LABEL_66;
  }
  uint64_t v97 = *(void *)v117;
  uint64_t v101 = v1;
  do
  {
    id v16 = 0LL;
    do
    {
      if (*(void *)v117 != v97) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v116 + 1) + 8LL * (void)v16);
      uint64_t v18 = objc_autoreleasePoolPush();
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
      v100 = v17;
      id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 persistedEntry:v17 fromLocation:@"currentSetLockUsageEliminatingOtherThanSetAtomicInstances"]);

      v99 = v20;
      if (!v20)
      {
        __int128 v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v82 oslog]);

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v121 = v100;
          _os_log_error_impl( &dword_0,  v23,  OS_LOG_TYPE_ERROR,  "{currentSetLockUsageEliminatingOtherThanSetAtomicInstances} | unable to determine previous status for entry:%{public}@",  buf,  0xCu);
        }

+ (BOOL)lockedSetByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingSetDescriptor:(id)a6 forLockReason:(id)a7 withSetUsagePolicy:(id)a8 lockError:(id *)a9
{
  uint64_t v14 = (__CFString *)a3;
  id v15 = a4;
  id v16 = a6;
  uint64_t v17 = (__CFString *)a7;
  id v18 = a8;
  uint64_t v51 = 0LL;
  __int128 v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  __int128 v54 = __Block_byref_object_copy__16;
  __int128 v55 = __Block_byref_object_dispose__16;
  id v56 = 0LL;
  if (v14 && v16 && v17)
  {
    unsigned int v19 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
    id v20 = v19;
    if (v19)
    {
      id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v19, "lockerQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __145__MADAutoAssetLocker_lockedSetByClient_forClientProcessName_withClientProcessID_lockingSetDescriptor_forLockReason_withSetUsagePolicy_lockError___block_invoke;
      block[3] = &unk_350CF8;
      id v20 = v20;
      id v43 = v20;
      id v44 = v18;
      id v45 = v16;
      __int128 v49 = &v51;
      __int128 v46 = v14;
      id v47 = v15;
      int64_t v50 = a5;
      __int128 v48 = v17;
      dispatch_sync(v21, block);

      id v22 = v43;
      goto LABEL_20;
    }

    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:lockedSetByClient",  0LL,  @"no auto-asset-locker"));
  }

  else
  {
    id v23 = objc_alloc(&OBJC_CLASS___NSString);
    if (v14) {
      uint64_t v24 = v14;
    }
    else {
      uint64_t v24 = @"MISSING";
    }
    if (v16) {
      id v25 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 summary]);
    }
    else {
      id v25 = @"MISSING";
    }
    if (v17) {
      uint64_t v26 = v17;
    }
    else {
      uint64_t v26 = @"MISSING";
    }
    id v20 = -[NSString initWithFormat:]( v23,  "initWithFormat:",  @"set-lock not tracked (missing required) | autoAssetClientName:%@, lockedSetDescriptor:%@, lockReason:%@",  v24,  v25,  v26);
    if (v16) {

    }
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:lockedSetByClient",  0LL,  v20));
  }

  id v22 = (NSString *)v52[5];
  v52[5] = v27;
LABEL_20:

  uint64_t v28 = v52[5];
  if (v28)
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v39 = (id)objc_claimAutoreleasedReturnValue([v16 summary]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
      uint64_t v41 = v52[5];
      *(_DWORD *)buf = 138544386;
      __int128 v58 = v14;
      __int16 v59 = 2112;
      id v60 = v39;
      __int16 v61 = 2114;
      __int16 v62 = v17;
      __int16 v63 = 2114;
      int64_t v64 = v40;
      __int16 v65 = 2114;
      uint64_t v66 = v41;
      _os_log_error_impl( &dword_0,  v30,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:lockedSetByClient} failed set-lock | client:%{public}@, lockedSetDescriptor:%@, reason:%{public}@, policy:%{public}@ | error:%{public}@",  buf,  0x34u);
    }

    uint32_t v31 = (void *)objc_claimAutoreleasedReturnValue([v16 clientDomainName]);
    __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSetIdentifier]);
    unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v16 latestDownloadedAtomicInstance]);
    +[MADAutoAssetHistory recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  101LL,  v14,  v31,  v32,  v33,  v52[5]);

    if (a9) {
      *a9 = (id) v52[5];
    }
  }

  else
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    BOOL v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = (id)objc_claimAutoreleasedReturnValue([v16 summary]);
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
      *(_DWORD *)buf = 138544130;
      __int128 v58 = v14;
      __int16 v59 = 2112;
      id v60 = v36;
      __int16 v61 = 2114;
      __int16 v62 = v17;
      __int16 v63 = 2114;
      int64_t v64 = v37;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:lockedSetByClient} successful set-lock | client:%{public}@, lockedSetDescriptor:%@, reason:%{public }@, policy:%{public}@",  buf,  0x2Au);
    }
  }

  _Block_object_dispose(&v51, 8);

  return v28 == 0;
}

void __145__MADAutoAssetLocker_lockedSetByClient_forClientProcessName_withClientProcessID_lockingSetDescriptor_forLockReason_withSetUsagePolicy_lockError___block_invoke( uint64_t a1)
{
  uint32_t v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _autoAssetLockPolicyFromSetPolicy:*(void *)(a1 + 40)]);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) latestDowloadedAtomicInstanceEntries]);
  id v29 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v44;
LABEL_3:
    uint64_t v2 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v28) {
        objc_enumerationMutation(obj);
      }
      id v3 = *(void **)(*((void *)&v43 + 1) + 8 * v2);
      uint64_t v35 = *(void *)(a1 + 64);
      id v37 = *(void **)(a1 + 32);
      id v33 = *(id *)(a1 + 88);
      uint64_t v32 = *(void *)(a1 + 56);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) clientDomainName]);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetSetIdentifier]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 fullAssetSelector]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) latestDownloadedAtomicInstance]);
      uint64_t v8 = *(void *)(a1 + 72);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 localContentURL]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 assetAttributes]);
      uint64_t v11 = objc_claimAutoreleasedReturnValue( [v37 _lockAutoAssetByClient:v32 forClientProcessName:v35 withClientProcessID:v33 forClientDomainName:v4 forAssetSetIdentifie r:v5 forAssetSelector:v6 forSetAtomicInstance:v7 forLockReason:v8 withUsagePolicy:v30 withLocalContentURL:v9 withAssetAttributes:v10]);
      uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8LL);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL)) {
        break;
      }
      -[NSMutableArray addObject:](v31, "addObject:", v3);
      if (v29 == (id)++v2)
      {
        id v29 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v29) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 40LL))
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v34 = v31;
    id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v39,  v51,  16LL);
    if (v38)
    {
      uint64_t v36 = *(void *)v40;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v40 != v36) {
            objc_enumerationMutation(v34);
          }
          id v15 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)v14);
          id v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)(a1 + 56);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) clientDomainName]);
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetSetIdentifier]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 fullAssetSelector]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) latestDownloadedAtomicInstance]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue( [v16 _endedLockByClient:v17 forClientDomainName:v18 forAssetSetIdentifier:v19 forAssetSelector:v20 forSetAtomicIn stance:v21 forLockReason:*(void *)(a1 + 72)]);

          if (v22)
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
            uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 checkedSummary]);
              *(_DWORD *)buf = 138543618;
              __int128 v48 = v25;
              __int16 v49 = 2114;
              int64_t v50 = v26;
              _os_log_error_impl( &dword_0,  v24,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:lockedSetByClient} | unable to end auto-asset lock after failure to lock entire set | setAt omicEntry:%{public}@ | endLockError:%{public}@",  buf,  0x16u);
            }
          }

          uint64_t v14 = (char *)v14 + 1;
        }

        while (v38 != v14);
        id v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v34,  "countByEnumeratingWithState:objects:count:",  &v39,  v51,  16LL);
      }

      while (v38);
    }
  }
}

+ (BOOL)continuedSetLockByClient:(id)a3 forSetDescriptor:(id)a4 forLockReason:(id)a5 withSetUsagePolicy:(id)a6 continueError:(id *)a7
{
  uint64_t v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  uint64_t v44 = 0LL;
  __int128 v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  id v47 = __Block_byref_object_copy__16;
  __int128 v48 = __Block_byref_object_dispose__16;
  id v49 = 0LL;
  if (v11 && v12 && v13)
  {
    id v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
    id v16 = v15;
    if (v15)
    {
      uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NSString lockerQueue](v15, "lockerQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __111__MADAutoAssetLocker_continuedSetLockByClient_forSetDescriptor_forLockReason_withSetUsagePolicy_continueError___block_invoke;
      block[3] = &unk_34DED8;
      id v39 = v12;
      id v16 = v16;
      __int128 v40 = v16;
      __int128 v41 = v11;
      __int128 v42 = v13;
      __int128 v43 = &v44;
      dispatch_sync(v17, block);

      id v18 = v39;
      goto LABEL_20;
    }

    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:continuedSetLockByClient",  0LL,  @"no auto-asset-locker"));
  }

  else
  {
    unsigned int v19 = objc_alloc(&OBJC_CLASS___NSString);
    if (v11) {
      id v20 = v11;
    }
    else {
      id v20 = @"MISSING";
    }
    if (v12) {
      id v21 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 summary]);
    }
    else {
      id v21 = @"MISSING";
    }
    if (v13) {
      id v23 = v13;
    }
    else {
      id v23 = @"MISSING";
    }
    id v16 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"set-lock not tracked (missing required) | client:%@, lockedSetDescriptor:%@, continueReason:%@",  v20,  v21,  v23);
    if (v12) {

    }
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"AUTO-LOCKER:continuedSetLockByClient",  0LL,  v16));
  }

  id v18 = (void *)v45[5];
  v45[5] = v22;
LABEL_20:

  uint64_t v24 = v45[5];
  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v35 = (id)objc_claimAutoreleasedReturnValue([v12 summary]);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
      uint64_t v37 = v45[5];
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = v11;
      __int16 v52 = 2114;
      id v53 = v35;
      __int16 v54 = 2114;
      __int128 v55 = v13;
      __int16 v56 = 2114;
      id v57 = v36;
      __int16 v58 = 2114;
      uint64_t v59 = v37;
      _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:continuedSetLockByClient} failed continue-set-lock | client:%{public}@, lockedSetDescriptor:%{publi c}@, reason:%{public}@, policy:%{public}@ | error:%{public}@",  buf,  0x34u);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDomainName]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v12 assetSetIdentifier]);
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 latestDownloadedAtomicInstance]);
    +[MADAutoAssetHistory recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromClient:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  501LL,  v11,  v27,  v28,  v29,  v45[5]);

    if (a7) {
      *a7 = (id) v45[5];
    }
  }

  else
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint32_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = (id)objc_claimAutoreleasedReturnValue([v12 summary]);
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = v11;
      __int16 v52 = 2114;
      id v53 = v32;
      __int16 v54 = 2114;
      __int128 v55 = v13;
      __int16 v56 = 2114;
      id v57 = v33;
      _os_log_impl( &dword_0,  v31,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:continuedSetLockByClient} successful continue-set-lock | client:%{public}@, lockedSetDescriptor:%{p ublic}@, reason:%{public}@, policy:%{public}@",  buf,  0x2Au);
    }
  }

  _Block_object_dispose(&v44, 8);

  return v24 == 0;
}

void __111__MADAutoAssetLocker_continuedSetLockByClient_forSetDescriptor_forLockReason_withSetUsagePolicy_continueError___block_invoke( uint64_t a1)
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latestDowloadedAtomicInstanceEntries]);
  id v2 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v21 = *(void *)v23;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v4);
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientDomainName]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetSetIdentifier]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fullAssetSelector]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latestDownloadedAtomicInstance]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 _continuedLockByClient:v6 forClientDomainName:v8 forAssetSetIdentifier:v9 forAssetSelector:v10 forSetAtomic Instance:v11 forLockReason:*(void *)(a1 + 56) withUsagePolicy:0]);

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
            unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v12 checkedSummary]);
            *(_DWORD *)buf = 138543618;
            uint64_t v27 = v18;
            __int16 v28 = 2114;
            id v29 = v19;
            _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:continuedSetLockByClient} | unable to continue auto-asset lock of the set | setAtomicEntry:%{ public}@ | continueError:%{public}@",  buf,  0x16u);
          }

          uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8LL);
          uint64_t v17 = *(void *)(v15 + 40);
          id v16 = (id *)(v15 + 40);
          if (!v17) {
            objc_storeStrong(v16, v12);
          }
        }

        id v4 = (char *)v4 + 1;
      }

      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }

    while (v3);
  }
}

void __110__MADAutoAssetLocker_endedPreviousSetLocksByClient_forSetDescriptor_forLockReason_removingLockCount_endError___block_invoke( uint64_t a1)
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latestDowloadedAtomicInstanceEntries]);
  id v2 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v24 = *(void *)v27;
    do
    {
      id v4 = 0LL;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v4);
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) clientDomainName]);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetSetIdentifier]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fullAssetSelector]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latestDownloadedAtomicInstance]);
        uint64_t v12 = *(void *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 80);
        id v25 = 0LL;
        [v7 _endLocksByClient:v6 forAllClientNames:0 forClientProcessName:0 withClientProcessID:0 forClientDomainName:v8 forAssetSetId entifier:v9 forAssetSelector:v10 forSetAtomicInstance:v11 forLockReason:v12 removingLockCount:v13 endError:&v25];
        id v14 = v25;
        id v15 = v25;

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v15 checkedSummary]);
            *(_DWORD *)buf = 138543618;
            uint32_t v31 = v21;
            __int16 v32 = 2114;
            id v33 = v22;
            _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:endedPreviousSetLocksByClient} | unable to end auto-asset lock-count of the set | setAtomicEn try:%{public}@ | endedLocksAutoAssetError:%{public}@",  buf,  0x16u);
          }

          uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8LL);
          uint64_t v20 = *(void *)(v18 + 40);
          unsigned int v19 = (id *)(v18 + 40);
          if (!v20) {
            objc_storeStrong(v19, v14);
          }
        }

        id v4 = (char *)v4 + 1;
      }

      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v3);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }
}

+ (id)eliminateAllPreviousSetLocksByClient:(id)a3 forSetDescriptor:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  __int128 v27 = __Block_byref_object_copy__16;
  __int128 v28 = __Block_byref_object_dispose__16;
  id v29 = 0LL;
  if (v5 && v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 lockerQueue]);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = __76__MADAutoAssetLocker_eliminateAllPreviousSetLocksByClient_forSetDescriptor___block_invoke;
      v19[3] = &unk_34E2E0;
      __int128 v23 = &v24;
      uint64_t v20 = v9;
      uint64_t v21 = v5;
      id v22 = v7;
      dispatch_sync(v10, v19);

      uint64_t v11 = v20;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        +[MADAutoAssetLocker eliminateAllPreviousSetLocksByClient:forSetDescriptor:].cold.1( (uint64_t)v5,  v16,  (uint64_t)buf,  v11);
      }
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = @"MISSING";
      if (v5) {
        id v14 = v5;
      }
      else {
        id v14 = @"MISSING";
      }
      if (v7) {
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
      }
      *(_DWORD *)buf = 138543618;
      uint32_t v31 = v14;
      __int16 v32 = 2114;
      id v33 = v13;
      _os_log_error_impl( &dword_0,  (os_log_t)v9,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:eliminateAllPreviousSetLocksByClient} set-locks not eliminated (missing required) | client:%{public }@, lockedSetDescriptor:%{public}@",  buf,  0x16u);
      if (v7) {
    }
      }
  }

  id v17 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v17;
}

void __76__MADAutoAssetLocker_eliminateAllPreviousSetLocksByClient_forSetDescriptor___block_invoke( uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _endAllSetLocksByClient:*(void *)(a1 + 40) forSetDescriptor:*(void *)(a1 + 48)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)eliminateAllPreviousSetLocksNoLongerTracked:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  unsigned int v19 = __Block_byref_object_copy__16;
  uint64_t v20 = __Block_byref_object_dispose__16;
  id v21 = 0LL;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __66__MADAutoAssetLocker_eliminateAllPreviousSetLocksNoLongerTracked___block_invoke;
      block[3] = &unk_34DE88;
      id v15 = &v16;
      uint64_t v13 = v5;
      id v14 = v3;
      dispatch_sync(v6, block);

      uint64_t v7 = v13;
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetLocker eliminateAllPreviousSetLocksNoLongerTracked:].cold.2();
      }
    }
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLocker eliminateAllPreviousSetLocksNoLongerTracked:].cold.1();
    }
  }

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __66__MADAutoAssetLocker_eliminateAllPreviousSetLocksNoLongerTracked___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _endAllSetLocksNoLongerTracked:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)newCurrentSetLockUsageForDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v26 = 0LL;
  __int128 v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__16;
  id v30 = __Block_byref_object_dispose__16;
  uint32_t v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __58__MADAutoAssetLocker_newCurrentSetLockUsageForDescriptor___block_invoke;
    block[3] = &unk_34E790;
    __int128 v23 = (os_log_s *)v3;
    id v24 = v5;
    id v25 = &v26;
    dispatch_sync(v6, block);

    uint64_t v7 = v23;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLocker newCurrentSetLockUsageForDescriptor:].cold.1();
    }
  }

  if (![(id)v27[5] count])
  {
    uint64_t v9 = (void *)v27[5];
    v27[5] = 0LL;
  }

  id v10 = (void *)v27[5];
  if (v10)
  {
    uint64_t v11 = (char *)[v10 count];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue([v3 summary]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([(id)v27[5] safeSummary]);
      uint64_t v16 = (void *)v15;
      id v17 = @"s";
      *(_DWORD *)buf = 138544130;
      __int16 v34 = 2048;
      id v33 = v14;
      if (v11 == (_BYTE *)&dword_0 + 1) {
        id v17 = &stru_355768;
      }
      id v35 = v11;
      __int16 v36 = 2114;
      uint64_t v37 = v17;
      __int16 v38 = 2114;
      uint64_t v39 = v15;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentSetLockUsageForDescriptor} | lockedSetDescriptor:%{public}@ | %ld current lock-reason%{pu blic}@:%{public}@",  buf,  0x2Au);
    }
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v3 summary]);
      *(_DWORD *)buf = 138543362;
      id v33 = v19;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:newCurrentSetLockUsageForDescriptor} | lockedSetDescriptor:%{public}@ | no current lock-reasons",  buf,  0xCu);
    }
  }

  id v20 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __58__MADAutoAssetLocker_newCurrentSetLockUsageForDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) latestDowloadedAtomicInstanceEntries]);
  id v2 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v54;
    *(void *)&__int128 v3 = 138543618LL;
    __int128 v41 = v3;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v42 = *(void *)v54;
    do
    {
      uint64_t v7 = 0LL;
      id v43 = v4;
      do
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_autoreleasePoolPush();
        id v10 = *(void **)(v1 + 40);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 fullAssetSelector]);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 locateLockBySelector:v11]);

        id v47 = v12;
        if (v12)
        {
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v48 = (id)objc_claimAutoreleasedReturnValue([v12 lockReasons]);
          id v13 = [v48 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v13)
          {
            id v14 = v13;
            __int128 v45 = v9;
            uint64_t v46 = v7;
            uint64_t v15 = *(void *)v50;
            uint64_t v16 = v12;
            do
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v50 != v15) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
                unsigned int v19 = objc_autoreleasePoolPush();
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v16 lockReasons]);
                id v21 = [v20 safeObjectForKey:v18 ofClass:objc_opt_class(p_ivars[316])];
                id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

                if (v22)
                {
                  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 clientLockReason]);
                  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 lockReason]);

                  if (v24)
                  {
                    id v25 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8LL) + 40LL);
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v22 clientLockReason]);
                    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReason]);
                    id v28 = [v25 safeObjectForKey:v27 ofClass:objc_opt_class(NSNumber)];
                    id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

                    id v30 = objc_alloc(&OBJC_CLASS___NSNumber);
                    if (v29)
                    {
                      uint32_t v31 = -[NSNumber initWithLong:]( v30,  "initWithLong:",  (char *)[v22 activeLockCount] + (int)objc_msgSend(v29, "intValue"));
                    }

                    else
                    {
                      uint32_t v31 = -[NSNumber initWithLong:](v30, "initWithLong:", [v22 activeLockCount]);
                    }

                    __int16 v32 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8LL) + 40LL);
                    id v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "clientLockReason", v41));
                    uint64_t v34 = v1;
                    id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 lockReason]);
                    [v32 setSafeObject:v31 forKey:v35];

                    uint64_t v1 = v34;
                    p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                    uint64_t v16 = v47;
                  }
                }

                objc_autoreleasePoolPop(v19);
              }

              id v14 = [v48 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }

            while (v14);
            uint64_t v5 = v42;
            id v4 = v43;
            uint64_t v9 = v45;
            uint64_t v7 = v46;
          }

          __int16 v36 = (os_log_s *)v48;
        }

        else
        {
          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) logger]);
          __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 40) summary]);
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v8 fullAssetSelector]);
            __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 summary]);
            *(_DWORD *)buf = v41;
            uint64_t v59 = v38;
            __int16 v60 = 2114;
            __int16 v61 = v40;
            _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {newCurrentLockUsageForSelector} no assetLock on locksBySelector for fullAssetSelector:%{public}@",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v9);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v7 != v4);
      id v4 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }

    while (v4);
  }
}

+ (id)copyOfSetLocksByDescriptor
{
  return 0LL;
}

- (BOOL)isAssetLockSetAtomicInstanceLock:(id)a3
{
  id v4 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lockReasons", 0));
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);
        id v13 = [v12 safeObjectForKey:v11 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetLocker atomicInstanceUUIDForLockTracker:]( self,  "atomicInstanceUUIDForLockTracker:",  v14));
        v8 |= v15 != 0LL;
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }

  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (id)atomicInstanceUUIDForLockTracker:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLockReason]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 autoAssetClientName]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLockReason]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 autoAssetClientName]);
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@"_"]);

    uint64_t v9 = (char *)[v8 count];
    if ((uint64_t)v9 < 3)
    {
      id v5 = 0LL;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v9 - 1]);
      if ([v10 length] == &stru_20.cmdsize) {
        id v5 = v10;
      }
      else {
        id v5 = 0LL;
      }
    }
  }

  return v5;
}

- (id)setAtomicInstanceForUUID:(id)a3 fromSetAtomicInstances:(id)a4
{
  id v5 = a3;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MADAutoSetAtomicInstance);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeObjectForKey:ofClass:", v11, v12, (void)v17));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 atomicInstanceUUID]);
      unsigned __int8 v15 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v5, v14);

      if ((v15 & 1) != 0) {
        break;
      }

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    id v13 = 0LL;
  }

  return v13;
}

- (id)_lockAutoAssetByClient:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 forClientDomainName:(id)a6 forAssetSetIdentifier:(id)a7 forAssetSelector:(id)a8 forSetAtomicInstance:(id)a9 forLockReason:(id)a10 withUsagePolicy:(id)a11 withLocalContentURL:(id)a12 withAssetAttributes:(id)a13
{
  id v17 = a3;
  id v61 = a4;
  id v18 = a6;
  id v62 = a8;
  id v19 = a9;
  id v20 = a11;
  id v60 = a12;
  id v59 = a13;
  id v21 = a10;
  id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v22);

  if (v19) {
    id v23 = -[MADAutoAssetLocker newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:]( self,  "newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:",  v18,  v17,  v19);
  }
  else {
    id v23 = v17;
  }
  id v24 = v23;
  id v25 = -[MAAutoAssetLockReason initForClientName:forLockReason:]( objc_alloc(&OBJC_CLASS___MAAutoAssetLockReason),  "initForClientName:forLockReason:",  v23,  v21);

  if ((objc_opt_respondsToSelector( &OBJC_CLASS___MAAutoAssetLockTracker,  "initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:") & 1) != 0)
  {
    id v26 = v18;
    int isPlatformVersionAtLeast = __isPlatformVersionAtLeast(3, 18, 0, 0);
    id v28 = objc_alloc(&OBJC_CLASS___MAAutoAssetLockTracker);
    if (isPlatformVersionAtLeast) {
      id v29 = [v28 initForClientLockReason:v25 forClientProcessName:v61 withClientProcessID:a5 lockingWithUsagePolicy:v20];
    }
    else {
      id v29 = [v28 initForClientLockReason:v25 lockingWithUsagePolicy:v20];
    }
    id v30 = v29;
    id v18 = v26;
  }

  else
  {
    id v30 = [[MAAutoAssetLockTracker alloc] initForClientLockReason:v25 lockingWithUsagePolicy:v20];
  }

  __int16 v58 = v24;
  if (!v25 || !v30)
  {
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:_lockAutoAssetByClient",  0LL,  @"unable to allocate auto-asset-lock-tracker"));
    goto LABEL_40;
  }

  uint32_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v62));
  id v54 = v18;
  id v55 = v17;
  if (v31)
  {
    __int16 v32 = v31;
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v31 lockReasons]);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
    id v35 = [v33 safeObjectForKey:v34 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
    __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

    if (v36)
    {
      -[MADAutoAssetLocker _mergeAddedLock:intoExistingLock:](self, "_mergeAddedLock:intoExistingLock:", v30, v36);
      uint64_t v37 = @"existing lock of auto-specific-asset locked again for given reason";
    }

    else
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue([v32 lockReasons]);
      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
      [v43 setSafeObject:v30 forKey:v44];

      uint64_t v37 = @"existing lock of auto-specific-asset locked for new reason";
    }

    __int16 v38 = 0LL;
    int v42 = 0;
    id v17 = v55;
    if (v20)
    {
LABEL_21:
    }
  }

  else
  {
    id v39 = [[MAAutoAssetLock alloc] initForSelector:v62 withLocalContentURL:v60 withAssetAttributes:v59];
    __int16 v32 = v39;
    if (v39)
    {
      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 lockReasons]);
      __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
      [v40 setSafeObject:v30 forKey:v41];

      __int16 v38 = 0LL;
      uint64_t v37 = @"first lock of auto-specific-asset";
      int v42 = 1;
      if (v20) {
        goto LABEL_21;
      }
    }

    else
    {
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:_lockAutoAssetByClient",  0LL,  @"unable to allocate auto-asset-lock"));
      int v42 = 0;
      uint64_t v37 = @"locked by client for specified reason";
      if (v20) {
        goto LABEL_21;
      }
    }
  }

  if (!v38)
  {
    __int128 v45 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v32 lockReasons]);
    id v47 = -[NSString initWithFormat:]( v45,  "initWithFormat:",  @"%@ | assetLock.lockReasons:%ld",  v37,  [v46 count]);

    if (v42) {
      id v48 = @"ENTRY_ADD";
    }
    else {
      id v48 = @"ENTRY_MODIFY";
    }
    -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( self,  "_persistAssetLock:operation:forAssetLock:message:",  @"_lockAutoAssetByClient",  v48,  v32,  v47);
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetLocker _refreshFilesystemMetadataLastInterest:]( self,  "_refreshFilesystemMetadataLastInterest:",  v32));
    if (v38)
    {
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v32 fullAssetSelector]);
      id v17 = v55;
      -[MADAutoAssetLocker _removeAssetLock:lastClient:forSelector:message:]( self,  "_removeAssetLock:lastClient:forSelector:message:",  v32,  v55,  v49,  @"unable to refresh filesystem metadata on initial lock (lock considered invalid)");
    }

    else
    {
      unsigned int v50 = [v32 inhibitedFromEmergencyRemoval];
      uint64_t v51 = 101LL;
      if (v50) {
        uint64_t v51 = 102LL;
      }
      uint64_t v52 = 250LL;
      if (v50) {
        uint64_t v52 = 251LL;
      }
      if (!v42) {
        uint64_t v51 = v52;
      }
      uint64_t v57 = v51;
      -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v32);
      __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v32));
      id v17 = v55;
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v57,  1LL);
    }
  }

  id v18 = v54;
LABEL_40:

  return v38;
}

- (id)_continuedLockByClient:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetAtomicInstance:(id)a7 forLockReason:(id)a8 withUsagePolicy:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a8;
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v20);

  if (v17) {
    id v21 = -[MADAutoAssetLocker newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:]( self,  "newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:",  v15,  v14,  v17);
  }
  else {
    id v21 = v14;
  }
  id v55 = v21;
  id v22 = -[MAAutoAssetLockReason initForClientName:forLockReason:]( objc_alloc(&OBJC_CLASS___MAAutoAssetLockReason),  "initForClientName:forLockReason:",  v21,  v19);

  id v23 = [[MAAutoAssetLockTracker alloc] initForClientLockReason:v22 lockingWithUsagePolicy:v18];
  id v24 = v23;
  __int128 v56 = v16;
  if (v22 && v23)
  {
    id v53 = v15;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v16));
    id v26 = v25;
    if (v25)
    {
      id v52 = v14;
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 lockReasons]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v22 summary]);
      id v29 = [v27 safeObjectForKey:v28 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
      id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

      if (v30)
      {
        -[MADAutoAssetLocker _mergeContinuedLock:intoExistingLock:]( self,  "_mergeContinuedLock:intoExistingLock:",  v24,  v30);
        uint32_t v31 = objc_alloc(&OBJC_CLASS___NSString);
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReasons]);
        id v33 = -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"client continued lock of auto-specific-asset | assetLock.lockReasons:%ld",  [v32 count]);
        -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( self,  "_persistAssetLock:operation:forAssetLock:message:",  @"continuedLockByClient",  @"ENTRY_MODIFY",  v26,  v33);

        uint64_t v34 = objc_claimAutoreleasedReturnValue( -[MADAutoAssetLocker _refreshFilesystemMetadataLastInterest:]( self,  "_refreshFilesystemMetadataLastInterest:",  v26));
        if (v34)
        {
          id v35 = (void *)v34;
          __int16 v36 = (NSString *)objc_claimAutoreleasedReturnValue([v26 fullAssetSelector]);
          -[MADAutoAssetLocker _removeAssetLock:lastClient:forSelector:message:]( self,  "_removeAssetLock:lastClient:forSelector:message:",  v26,  v14,  v36,  @"unable to refresh filesystem metadata on continue lock (lock considered invalid)");
LABEL_22:

LABEL_23:
          id v15 = v53;
          if (!v35) {
            goto LABEL_27;
          }
          goto LABEL_24;
        }
      }

      else
      {
        id v39 = objc_alloc(&OBJC_CLASS___NSString);
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v22 summary]);
        __int128 v41 = -[NSString initWithFormat:]( v39,  "initWithFormat:",  @"cannot accept continue lock when no existing lock for client-lock-reason:%@",  v40);
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  v41));

        if (v35)
        {
          id v14 = v52;
          goto LABEL_23;
        }
      }

      else {
        uint64_t v42 = 250LL;
      }
      int64_t v43 = -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v26);
      __int16 v36 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v26));
      uint64_t v44 = v42;
      id v14 = v52;
      +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v44,  1LL,  v52,  v43,  v36,  v56);
      id v35 = 0LL;
      goto LABEL_22;
    }

    uint64_t v37 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v16 summary]);
    __int16 v36 = -[NSString initWithFormat:]( v37,  "initWithFormat:",  @"cannot accept continue lock when no existing lock for auto-specific-asset:%@",  v38);
    id v30 = (void *)v38;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  v36));
    goto LABEL_22;
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"AUTO-LOCKER:continuedLockByClient",  0LL,  @"unable to allocate auto-asset-lock-tracker"));
  if (!v35) {
    goto LABEL_27;
  }
LABEL_24:
  __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker logger](self, "logger"));
  uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 oslog]);

  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker summary](self, "summary"));
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue([v56 summary]);
    id v54 = v15;
    id v50 = v14;
    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v35 checkedSummary]);
    *(_DWORD *)buf = 138543874;
    __int16 v58 = v48;
    __int16 v59 = 2114;
    id v60 = v49;
    __int16 v61 = 2114;
    id v62 = v51;
    _os_log_error_impl( &dword_0,  v46,  OS_LOG_TYPE_ERROR,  "%{public}@ | {_continuedLockByClient} unable to continue lock | fullAssetSelector:%{public}@ | continueError:%{public}@",  buf,  0x20u);

    id v14 = v50;
    id v15 = v54;
  }

LABEL_27:
  return v35;
}

- (id)_endAllSetLocksByClient:(id)a3 forSetDescriptor:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v7);

  id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 latestDowloadedAtomicInstanceEntries]);
  id v29 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (!v29) {
    goto LABEL_14;
  }
  uint64_t v26 = *(void *)v32;
  __int128 v27 = self;
  do
  {
    for (i = 0LL; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v32 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
      uint64_t v10 = objc_autoreleasePoolPush();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientDomainName]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 assetSetIdentifier]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDownloadedAtomicInstance]);
      id v30 = 0LL;
      -[MADAutoAssetLocker _endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:]( self,  "_endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetIden tifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:",  v28,  1LL,  0LL,  0LL,  v11,  v12,  v13,  v14,  0LL,  -1LL,  &v30);
      id v15 = v30;

      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 checkedSummary]);
        *(_DWORD *)buf = 138543874;
        __int16 v36 = v18;
        __int16 v37 = 2114;
        uint64_t v38 = v19;
        __int16 v39 = 2114;
        __int128 v40 = v20;
        _os_log_error_impl( &dword_0,  v17,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:eliminateAllPreviousSetLocksByClient} | unable to end auto-asset all-lock for the set | lockedSet Descriptor:%{public}@ | nextEntry:%{public}@ | endedLocksAutoAssetError:%{public}@",  buf,  0x20u);
      }

      else
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v21));

        if (v17) {
          goto LABEL_12;
        }
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
        -[NSMutableArray addObject:](v24, "addObject:", v18);
      }

LABEL_12:
      objc_autoreleasePoolPop(v10);
      self = v27;
    }

    id v29 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  }

  while (v29);
LABEL_14:

  if (-[NSMutableArray count](v24, "count")) {
    id v22 = v24;
  }
  else {
    id v22 = 0LL;
  }

  return v22;
}

- (id)_endAllSetLocksNoLongerTracked:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLocksNewAllBySelector](self, "locateLocksNewAllBySelector"));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v14 = objc_autoreleasePoolPush();
        id v15 = [v8 safeObjectForKey:v13 ofClass:objc_opt_class(MAAutoAssetLock)];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (-[MADAutoAssetLocker _isUntrackedSetAssetLock:forTrackedSetDescriptors:]( self,  "_isUntrackedSetAssetLock:forTrackedSetDescriptors:",  v16,  v4))
        {
          -[NSMutableArray addObject:](v7, "addObject:", v16);
        }

        objc_autoreleasePoolPop(v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }

    while (v10);
  }

  __int128 v32 = v8;
  __int128 v33 = v4;

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v7;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
        id v22 = objc_autoreleasePoolPush();
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);
        id v36 = 0LL;
        -[MADAutoAssetLocker _endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:]( self,  "_endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetId entifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:",  @"_endAllSetLocksNoLongerTracked",  1LL,  0LL,  0LL,  @"_endAllSetLocksNoLongerTracked",  0LL,  v23,  0LL,  0LL,  -1LL,  &v36);
        id v24 = v36;

        if (v24)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

          if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            goto LABEL_21;
          }
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v21 summary]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v24 checkedSummary]);
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v27;
          __int16 v47 = 2114;
          id v48 = v28;
          _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:_endAllSetLocksNoLongerTracked} | unable to end auto-asset all-locks not tracked in sets | untr ackedLock:%{public}@ |  endedLocksAutoAssetError:%{public}@",  buf,  0x16u);
        }

        else
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v29));

          if (v26) {
            goto LABEL_21;
          }
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v21 fullAssetSelector]);
          -[NSMutableArray addObject:](v34, "addObject:", v27);
        }

LABEL_21:
        objc_autoreleasePoolPop(v22);
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
    }

    while (v18);
  }

  if (-[NSMutableArray count](v34, "count")) {
    id v30 = v34;
  }
  else {
    id v30 = 0LL;
  }

  return v30;
}

- (id)_endAllSetLocks:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5
{
  id v39 = a3;
  id v8 = a4;
  id v40 = a5;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLocksNewAllBySelector](self, "locateLocksNewAllBySelector"));
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        id v18 = objc_autoreleasePoolPush();
        id v19 = [v12 safeObjectForKey:v17 ofClass:objc_opt_class(MAAutoAssetLock)];
        id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        if (-[MADAutoAssetLocker _isSetAssetLock:forClientDomainName:forAssetSetIdentifier:]( self,  "_isSetAssetLock:forClientDomainName:forAssetSetIdentifier:",  v20,  v8,  v40))
        {
          -[NSMutableArray addObject:](v11, "addObject:", v20);
        }

        objc_autoreleasePoolPop(v18);
      }

      id v14 = [v12 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }

    while (v14);
  }

  id v36 = v12;

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v11;
  id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (j = 0LL; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)j);
        uint64_t v26 = objc_autoreleasePoolPush();
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v25 fullAssetSelector]);
        id v41 = 0LL;
        id v28 = v8;
        -[MADAutoAssetLocker _endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:]( self,  "_endLocksByClient:forAllClientNames:forClientProcessName:withClientProcessID:forClientDomainName:forAssetSetId entifier:forAssetSelector:forSetAtomicInstance:forLockReason:removingLockCount:endError:",  v39,  1LL,  0LL,  0LL,  v8,  v40,  v27,  0LL,  0LL,  -1LL,  &v41);
        id v29 = v41;

        if (v29)
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v29 checkedSummary]);
            *(_DWORD *)buf = 138543618;
            uint64_t v51 = v32;
            __int16 v52 = 2114;
            id v53 = v33;
            _os_log_error_impl( &dword_0,  v31,  OS_LOG_TYPE_ERROR,  "{AUTO-LOCKER:_endAllSetLocks} | unable to end auto-asset all-locks for set-identifier | orphanedLock:%{pub lic}@ |  endedLocksAutoAssetError:%{public}@",  buf,  0x16u);
          }
        }

        else
        {
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 fullAssetSelector]);
          -[NSMutableArray addObject:](v37, "addObject:", v31);
        }

        objc_autoreleasePoolPop(v26);
        id v8 = v28;
      }

      id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
    }

    while (v22);
  }

  if ([0 count]) {
    __int128 v34 = v37;
  }
  else {
    __int128 v34 = 0LL;
  }

  return v34;
}

- (id)_endedLockByClient:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5 forAssetSelector:(id)a6 forSetAtomicInstance:(id)a7 forLockReason:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v18);

  if (v16) {
    id v19 = -[MADAutoAssetLocker newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:]( self,  "newSetClientNameForDomain:withAutoAssetClientName:forSetAtomicInstance:",  v14,  v13,  v16);
  }
  else {
    id v19 = v13;
  }
  id v20 = v19;
  id v21 = -[MAAutoAssetLockReason initForClientName:forLockReason:]( objc_alloc(&OBJC_CLASS___MAAutoAssetLockReason),  "initForClientName:forLockReason:",  v19,  v17);
  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker locateLockBySelector:](self, "locateLockBySelector:", v15));
    uint64_t v23 = v22;
    if (!v22)
    {
      __int128 v38 = objc_alloc(&OBJC_CLASS___NSString);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
      __int128 v37 = -[NSString initWithFormat:]( v38,  "initWithFormat:",  @"cannot accept ended lock when no existing lock for auto-specific-asset | client:%@, selector:%@, reason:%@",  v13,  v39,  v17);

      id v31 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:endedLockByClient",  0LL,  v37));
LABEL_20:

      goto LABEL_21;
    }

    id v48 = v14;
    __int128 v49 = v20;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 lockReasons]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v21 summary]);
    id v26 = [v24 safeObjectForKey:v25 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    if (v27)
    {
      if (!-[MADAutoAssetLocker _endLockDecideUnlocked:](self, "_endLockDecideUnlocked:"))
      {
        __int128 v42 = objc_alloc(&OBJC_CLASS___NSString);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v23 lockReasons]);
        __int128 v34 = -[NSString initWithFormat:]( v42,  "initWithFormat:",  @"ended lock when other locks for client-lock-reason remain | assetLock.lockReasons:%ld",  [v33 count]);
        goto LABEL_14;
      }

      id v28 = (void *)objc_claimAutoreleasedReturnValue([v23 lockReasons]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v21 summary]);
      [v28 removeObjectForKey:v29];

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v23 lockReasons]);
      id v31 = [v30 count];

      if (v31)
      {
        __int128 v32 = objc_alloc(&OBJC_CLASS___NSString);
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v23 lockReasons]);
        __int128 v34 = -[NSString initWithFormat:]( v32,  "initWithFormat:",  @"all locks have ended for specific client-lock-reason | assetLock.lockReasons:%ld",  [v33 count]);
LABEL_14:
        __int128 v43 = v34;
        -[MADAutoAssetLocker _persistAssetLock:operation:forAssetLock:message:]( self,  "_persistAssetLock:operation:forAssetLock:message:",  @"endedLockByClient",  @"ENTRY_MODIFY",  v23,  v34);

        else {
          uint64_t v44 = 250LL;
        }
        int64_t v45 = -[MADAutoAssetLocker _currentLockCountOfLock:](self, "_currentLockCountOfLock:", v23);
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _assetIDOfLock:](self, "_assetIDOfLock:", v23));
        +[MADAutoAssetHistory recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromClient:usageCount:forAssetID:withSelector:",  v44,  1LL,  v13,  v45,  v46,  v15);

        __int128 v37 = 0LL;
        id v31 = 0LL;
        goto LABEL_19;
      }

      -[MADAutoAssetLocker _removeAssetLock:lastClient:forSelector:message:]( self,  "_removeAssetLock:lastClient:forSelector:message:",  v23,  v13,  v15,  @"endedLock (all locks have ended)");
      __int128 v37 = 0LL;
    }

    else
    {
      __int128 v27 = 0LL;
      id v40 = objc_alloc(&OBJC_CLASS___NSString);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
      __int128 v37 = -[NSString initWithFormat:]( v40,  "initWithFormat:",  @"cannot accept ended lock when no existing lock for client-lock-reason | client:%@, selector:%@, reason:%@",  v13,  v41,  v17);

      id v31 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"AUTO-LOCKER:endedLockByClient",  0LL,  v37));
    }

- (BOOL)_isUntrackedSetAssetLock:(id)a3 forTrackedSetDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker _setClientDomainNameForAssetLock:](self, "_setClientDomainNameForAssetLock:", v6));
  if (v9)
  {
    id v29 = v9;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v10 = v7;
    id v27 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v27)
    {
      uint64_t v11 = *(void *)v36;
      id v28 = v7;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v10);
          }
          id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          context = objc_autoreleasePoolPush();
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 latestDowloadedAtomicInstanceEntries]);
          id v15 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v32;
            while (2)
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v14);
                }
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 fullAssetSelector]);
                unsigned int v21 = [v19 isEqual:v20];

                if (v21)
                {

                  objc_autoreleasePoolPop(context);
                  BOOL v24 = 0;
                  id v7 = v28;
                  goto LABEL_21;
                }
              }

              id v16 = [v14 countByEnumeratingWithState:&v31 objects:v41 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          objc_autoreleasePoolPop(context);
          id v7 = v28;
          uint64_t v11 = v26;
        }

        id v27 = [v10 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }

      while (v27);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v10 = (id)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
      *(_DWORD *)buf = 138543362;
      id v40 = v23;
      _os_log_impl( &dword_0,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOCKER:_isUntrackedSetAssetLock} | untracked set-asset-lock | assetLock:%{public}@",  buf,  0xCu);
    }

    BOOL v24 = 1;
LABEL_21:

    id v9 = v29;
  }

  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_isSetAssetLock:(id)a3 forClientDomainName:(id)a4 forAssetSetIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v34 = a5;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v10);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 lockReasons]);
  id v36 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v36)
  {
    uint64_t v12 = *(void *)v38;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    id v35 = v8;
    while (2)
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 lockReasons]);
        id v17 = [v16 safeObjectForKey:v15 ofClass:objc_opt_class(p_ivars[316])];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 clientLockReason]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lockReason]);
        unsigned int v21 = [v20 containsString:v9];

        if (v21)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 clientLockReason]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lockReason]);
          id v24 = [v23 rangeOfString:@"_"];

          if (v24 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v25 = v11;
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v18 clientLockReason]);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lockReason]);
            id v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "substringWithRange:", 0, v24));

            if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v28, v9))
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue([v18 clientLockReason]);
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 lockReason]);
              unsigned __int8 v31 = [v30 containsString:v34];

              if ((v31 & 1) != 0)
              {

                BOOL v32 = 1;
                uint64_t v11 = v25;
                id v8 = v35;
                goto LABEL_15;
              }
            }

            uint64_t v11 = v25;
            id v8 = v35;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          }
        }
      }

      id v36 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }

  BOOL v32 = 0;
LABEL_15:

  return v32;
}

- (id)_setClientDomainNameForAssetLock:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetLocker lockerQueue](self, "lockerQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 lockReasons]);
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 lockReasons]);
        id v12 = [v11 safeObjectForKey:v10 ofClass:objc_opt_class(MAAutoAssetLockTracker)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientLockReason]);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lockReason]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 clientLockReason]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 autoAssetClientName]);
        unsigned int v18 = [v15 containsString:v17];

        if (v18)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v13 clientLockReason]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 lockReason]);
          id v21 = [v20 rangeOfString:@"_"];

          if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 clientLockReason]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lockReason]);
            id v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", 0, v21));

            if (v24)
            {

              goto LABEL_13;
            }
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v24 = 0LL;
LABEL_13:

  return v24;
}

- (id)_autoAssetLockPolicyFromSetPolicy:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_7:
    id v5 = 0LL;
    goto LABEL_8;
  }

  id v4 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetPolicy);
  if (!v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetLocker _autoAssetLockPolicyFromSetPolicy:].cold.1(v3);
    }

    goto LABEL_7;
  }

  id v5 = v4;
  -[MAAutoAssetPolicy setUserInitiated:](v4, "setUserInitiated:", [v3 userInitiated]);
  -[MAAutoAssetPolicy setLockInhibitsEmergencyRemoval:]( v5,  "setLockInhibitsEmergencyRemoval:",  [v3 lockInhibitsEmergencyRemoval]);
LABEL_8:

  return v5;
}

+ (void)setPersistedStateCaching:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetLocker autoAssetLocker](&OBJC_CLASS___MADAutoAssetLocker, "autoAssetLocker"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lockerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __47__MADAutoAssetLocker_setPersistedStateCaching___block_invoke;
  block[3] = &unk_34E4B8;
  id v8 = v4;
  BOOL v9 = a3;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __47__MADAutoAssetLocker_setPersistedStateCaching___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  [v2 flushPersistedStateCacheAndSetCachingBehaviour:*(unsigned __int8 *)(a1 + 40)];
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

+ (void)persistedLocksCount
{
}

- (void)_persistAssetLock:(os_log_s *)a3 operation:forAssetLock:message:.cold.1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 fullAssetSelector]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v6,  "{AUTO-LOCKER:%{public}@:_persistAssetLock} | unable to record lock (no persisted-state) for selector:%{public}@",  v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistRemoveAssetLock:(uint64_t)a1 removedAssetLock:(void *)a2 message:(os_log_s *)a3 .cold.1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 fullAssetSelector]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v6,  "{AUTO-LOCKER:%{public}@:_persistRemoveAssetLock} | unable to remove lock tracker (no persisted-state) for selector:%{public}@",  v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)locateLockBySelector:.cold.1()
{
}

- (void)locateLockBySelector:.cold.2()
{
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh without local content URL | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh failed to update usage date | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)_refreshFilesystemMetadataLastInterest:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_refreshFilesystemMetadataLastInterest} asset-lock refresh attempted with no content at URL | asset-lock:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

+ (void)addClientLockReasons:basedOnControl:.cold.1()
{
}

void __58__MADAutoAssetLocker_addClientLockReasons_basedOnControl___block_invoke_cold_1( uint8_t *a1,  id *a2,  void *a3,  os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*a2 summary]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl( &dword_0,  a4,  OS_LOG_TYPE_ERROR,  "%{public}@ {addClientLockReasons} | unable to copy MAAutoAssetLockTracker summaryEntry",  a1,  0xCu);
}

+ (void)currentSetLockUsageEliminatingOtherThanSetAtomicInstances:.cold.1()
{
}

+ (void)eliminateAllPreviousSetLocksByClient:(uint64_t)a3 forSetDescriptor:(os_log_s *)a4 .cold.1( uint64_t a1,  void *a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_1( &dword_0,  a4,  a3,  "{AUTO-LOCKER:eliminateAllPreviousSetLocksByClient} no auto-asset-locker | client:%{public}@, lockedSetDescriptor:%{public}@",  (uint8_t *)a3);
}

+ (void)eliminateAllPreviousSetLocksNoLongerTracked:.cold.1()
{
}

+ (void)eliminateAllPreviousSetLocksNoLongerTracked:.cold.2()
{
}

+ (void)newCurrentSetLockUsageForDescriptor:.cold.1()
{
}

- (void)_autoAssetLockPolicyFromSetPolicy:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-LOCKER:_autoAssetLockPolicyFromSetPolicy} | unable to allocate lockUsagePolicy | lockSetUsagePolicy:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

@end
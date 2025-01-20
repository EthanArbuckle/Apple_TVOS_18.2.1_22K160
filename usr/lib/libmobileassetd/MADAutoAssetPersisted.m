@interface MADAutoAssetPersisted
+ (id)entryFileIDForModule:(id)a3 fromFilename:(id)a4;
+ (id)persistedComponentSymbol:(id)a3;
+ (id)persistedEntryStatusName:(int64_t)a3;
+ (id)persistedOperationSymbol:(id)a3;
+ (id)persistedStateFilename:(id)a3 forFileID:(id)a4 ofEntryName:(id)a5;
+ (int64_t)persistedEntryStatusValue:(id)a3;
- (BOOL)_preExistingPersistedStateValid:(id)a3 fromLocation:(id)a4;
- (BOOL)_verifyEntryFileExists:(id)a3 fromLocation:(id)a4 expectingExists:(BOOL)a5;
- (BOOL)_verifyPersistedDirectoryExistsOrCreate:(id)a3;
- (BOOL)cachingEnabled;
- (BOOL)persistedEntryAlreadyExists:(id)a3 fromLocation:(id)a4;
- (NSCache)knownPersistedFiles;
- (NSCache)knownPersistedStates;
- (NSMutableArray)currentEntryIDs;
- (NSString)latestSafeSummary;
- (NSString)logLeader;
- (NSString)moduleCurrentVersion;
- (NSString)moduleName;
- (OS_dispatch_queue)persistedQueue;
- (SUCoreLog)logger;
- (SUCorePersistedState)entryTableOfContents;
- (SUCorePersistedState)persistedConfig;
- (id)_contentsOfModulePersistedPath:(id)a3 fromLocation:(id)a4;
- (id)_loadPersistedEntry:(id)a3 forEntryName:(id)a4 withEntryStatus:(int64_t)a5;
- (id)_summary;
- (id)_summaryLeader:(id)a3 fromLocation:(id)a4;
- (id)initForModule:(id)a3 ofModuleVersion:(id)a4 usingDispatchQueue:(id)a5 usingLogger:(id)a6 loggingByName:(id)a7 withVersionMigrator:(id)a8;
- (id)moduleVersionMigrator;
- (id)persistedEntry:(id)a3 fromLocation:(id)a4;
- (id)persistedEntryIDs:(id)a3;
- (int64_t)_validateLoadedEntry:(id)a3 fromLocation:(id)a4 forEntryName:(id)a5 loadedWithEntryStatus:(int64_t)a6;
- (int64_t)persistedEntryCount:(id)a3;
- (void)_persistStatusChange:(id)a3 ofEntryName:(id)a4 withEntrySummary:(id)a5 currentStatus:(int64_t)a6 fromLocation:(id)a7;
- (void)_persistTableOfContents:(id)a3 forEntryName:(id)a4 withEntryStatus:(int64_t)a5;
- (void)_removeEntriesMissingFromTableOfContents:(id)a3;
- (void)_removeEntryFile:(id)a3 reason:(id)a4 fromLocation:(id)a5;
- (void)flushPersistedStateCacheAndSetCachingBehaviour:(BOOL)a3;
- (void)loadPersistedState:(id)a3;
- (void)removeAllPersistedEntries:(id)a3;
- (void)removePersistedEntry:(id)a3 fromLocation:(id)a4;
- (void)setCachingEnabled:(BOOL)a3;
- (void)setCurrentEntryIDs:(id)a3;
- (void)setKnownPersistedFiles:(id)a3;
- (void)setKnownPersistedStates:(id)a3;
- (void)setLatestSafeSummary:(id)a3;
- (void)storePersistedEntry:(id)a3 withEntrySummary:(id)a4 fromLocation:(id)a5;
@end

@implementation MADAutoAssetPersisted

- (void)removeAllPersistedEntries:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        if (*(void *)(*((void *)&v26 + 1) + 8LL * (void)v11)) {
          -[NSMutableArray addObject:](v6, "addObject:");
        }
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v9);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v12 = v6;
  id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v32,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16);
        v18 = objc_autoreleasePoolPush();
        -[MADAutoAssetPersisted removePersistedEntry:fromLocation:]( self,  "removePersistedEntry:fromLocation:",  v17,  v4,  (void)v22);
        objc_autoreleasePoolPop(v18);
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v22,  v32,  16LL);
    }

    while (v14);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"removeAllPersistedEntries",  v4));
    *(_DWORD *)buf = 138543362;
    v31 = v21;
    _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | removed all entries from table-of-contents and from filesystem",  buf,  0xCu);
  }
}

- (OS_dispatch_queue)persistedQueue
{
  return self->_persistedQueue;
}

- (NSMutableArray)currentEntryIDs
{
  return self->_currentEntryIDs;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (id)_summaryLeader:(id)a3 fromLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logLeader](self, "logLeader"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  id v12 = [v11 count];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted _summary](self, "_summary"));
  id v14 = -[NSString initWithFormat:](v9, "initWithFormat:", @"{%@(%ld)%@:%@} [%@]", v10, v12, v6, v7, v13);

  return v14;
}

- (NSString)logLeader
{
  return self->_logLeader;
}

- (id)_summary
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
  if (v7) {
    id v8 = @"Y";
  }
  else {
    id v8 = @"N";
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  uint64_t v10 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"module:%@|version:%@|config:%@|entries:%ld",  v5,  v6,  v8,  [v9 count]);
  -[MADAutoAssetPersisted setLatestSafeSummary:](self, "setLatestSafeSummary:", v10);

  return -[MADAutoAssetPersisted latestSafeSummary](self, "latestSafeSummary");
}

- (NSString)moduleName
{
  return self->_moduleName;
}

- (NSString)moduleCurrentVersion
{
  return self->_moduleCurrentVersion;
}

- (SUCorePersistedState)persistedConfig
{
  return self->_persistedConfig;
}

- (void)setLatestSafeSummary:(id)a3
{
}

- (NSString)latestSafeSummary
{
  return self->_latestSafeSummary;
}

+ (id)persistedOperationSymbol:(id)a3
{
  id v3 = a3;
  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"CONFIG_LOAD") & 1) != 0)
  {
    id v4 = @"C_LOD";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"CONFIG_SET") & 1) != 0)
  {
    id v4 = @"C_SET";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"ENTRY_LOAD") & 1) != 0)
  {
    id v4 = @"E_LOD";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"ENTRY_ADD") & 1) != 0)
  {
    id v4 = @"E_ADD";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"ENTRY_REMOVE") & 1) != 0)
  {
    id v4 = @"E_RMV";
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"ENTRY_MODIFY"))
  {
    id v4 = @"E_MOD";
  }

  else
  {
    id v4 = @"?";
  }

  return (id)v4;
}

- (id)persistedEntryIDs:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue", a3));
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v12 + 1) + 8LL * (void)v10)) {
          -[NSMutableArray addObject:](v5, "addObject:");
        }
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)persistedEntry:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _loadPersistedEntry:forEntryName:withEntryStatus:]( self,  "_loadPersistedEntry:forEntryName:withEntryStatus:",  @"persistedEntry",  v6,  3LL));
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetPersisted persistedEntry:fromLocation:].cold.1(self, (uint64_t)v7);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (id)_loadPersistedEntry:(id)a3 forEntryName:(id)a4 withEntryStatus:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v11,  @"Entry",  v9));

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastPathComponent]);
  if (-[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled"))
  {
    if (v13)
    {
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedStates](self, "knownPersistedStates"));
      __int128 v15 = (SUCorePersistedState *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

      if (v15) {
        goto LABEL_48;
      }
    }
  }

  int64_t v71 = a5;
  v72 = v13;
  v73 = v12;
  id v16 = v9;
  id v17 = v8;
  v18 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
  char v19 = objc_opt_respondsToSelector( v18,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:");

  v20 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  v74 = v16;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v22,  @"Entry",  v16));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
  if ((v19 & 1) != 0) {
    __int128 v25 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:]( v20,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:",  v21,  v23,  v24,  0LL);
  }
  else {
    __int128 v25 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( v20,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v21,  v23,  v24);
  }
  __int128 v26 = v25;

  if (!v26)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

    id v8 = v17;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_loadPersistedEntry",  v17));
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v71));
      *(_DWORD *)buf = 138544130;
      v76 = v61;
      __int16 v77 = 2114;
      __int128 v12 = v73;
      id v9 = v74;
      v78 = v73;
      __int16 v79 = 2114;
      v80 = v74;
      __int16 v81 = 2114;
      v82 = v62;
      _os_log_error_impl( &dword_0,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@ | unable to create persisted-state for file:%{public}@ | %{public}@[%{public}@]",  buf,  0x2Au);

      __int128 v15 = 0LL;
    }

    else
    {
      __int128 v15 = 0LL;
      __int128 v12 = v73;
      id v9 = v74;
    }

    goto LABEL_47;
  }

  id v8 = v17;
  if (-[SUCorePersistedState loadPersistedState](v26, "loadPersistedState"))
  {
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePersistedState stringForKey:](v26, "stringForKey:", @"entryStatus"));
    int64_t v28 = +[MADAutoAssetPersisted persistedEntryStatusValue:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusValue:",  v27);
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
    id v9 = v74;
    unsigned int v30 = [v29 containsObject:v74];

    if (!v30)
    {
      if (v71 != 2)
      {
        __int128 v12 = v73;
        if (v71 == 3)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
          [v47 addObject:v74];

          -[MADAutoAssetPersisted _persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:]( self,  "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:",  v26,  v74,  @"table-of-contents place holder | no previously persisted entry",  0LL,  v8);
          -[MADAutoAssetPersisted _persistTableOfContents:forEntryName:withEntryStatus:]( self,  "_persistTableOfContents:forEntryName:withEntryStatus:",  v8,  v74,  0LL);
        }

        else
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 oslog]);

          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v69 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_loadPersistedEntry",  v8));
            v70 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v71));
            *(_DWORD *)buf = 138544130;
            v76 = v69;
            __int16 v77 = 2114;
            v78 = v73;
            __int16 v79 = 2114;
            v80 = v74;
            __int16 v81 = 2114;
            v82 = v70;
            _os_log_error_impl( &dword_0,  v60,  OS_LOG_TYPE_ERROR,  "%{public}@ | entry not in table-of-contents for path:%{public}@ | %{public}@[%{public}@]",  buf,  0x2Au);
          }

          __int128 v26 = 0LL;
        }

        goto LABEL_42;
      }

      int64_t v42 = -[MADAutoAssetPersisted _validateLoadedEntry:fromLocation:forEntryName:loadedWithEntryStatus:]( self,  "_validateLoadedEntry:fromLocation:forEntryName:loadedWithEntryStatus:",  v26,  v8,  v74,  +[MADAutoAssetPersisted persistedEntryStatusValue:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusValue:",  v27));
      if (v42 != 2)
      {
        int64_t v54 = v42;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v55 oslog]);

        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_loadPersistedEntry",  v8));
          v68 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v54));
          *(_DWORD *)buf = 138544130;
          v76 = v67;
          __int16 v77 = 2114;
          v78 = v73;
          __int16 v79 = 2114;
          v80 = v74;
          __int16 v81 = 2114;
          v82 = v68;
          _os_log_error_impl( &dword_0,  v56,  OS_LOG_TYPE_ERROR,  "%{public}@ | entry not in table-of-contents (when not loading persisted state) for path:%{public}@ | %{public}@[%{public}@]",  buf,  0x2Au);
        }

        goto LABEL_40;
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
      [v43 addObject:v74];

      -[MADAutoAssetPersisted _persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:]( self,  "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:",  v26,  v74,  @"loading persisted state",  2LL,  v8);
      -[MADAutoAssetPersisted _persistTableOfContents:forEntryName:withEntryStatus:]( self,  "_persistTableOfContents:forEntryName:withEntryStatus:",  v8,  v74,  2LL);
LABEL_41:
      __int128 v13 = v72;
      __int128 v12 = v73;
LABEL_42:

      __int128 v15 = v26;
      goto LABEL_43;
    }

    if (v27)
    {
      int64_t v31 = -[MADAutoAssetPersisted _validateLoadedEntry:fromLocation:forEntryName:loadedWithEntryStatus:]( self,  "_validateLoadedEntry:fromLocation:forEntryName:loadedWithEntryStatus:",  v26,  v8,  v74,  +[MADAutoAssetPersisted persistedEntryStatusValue:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusValue:",  v27));
      if (v31 == v28)
      {
LABEL_32:
        if ((v28 | 2) != 2)
        {
LABEL_40:

          __int128 v26 = 0LL;
          goto LABEL_41;
        }

        goto LABEL_41;
      }
    }

    else
    {
      int64_t v28 = 0LL;
      int64_t v31 = 2LL;
    }

    v48 = objc_alloc(&OBJC_CLASS___NSString);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v28));
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v31));
    v51 = -[NSString initWithFormat:](v48, "initWithFormat:", @"changing entry status | %@ >-> %@", v49, v50);
    -[MADAutoAssetPersisted _persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:]( self,  "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:",  v26,  v74,  v51,  v31,  v8);

    int64_t v28 = v31;
    goto LABEL_32;
  }

  if (v71 != 3)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

    __int128 v12 = v73;
    id v9 = v74;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_loadPersistedEntry",  v8));
      v64 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  v71));
      *(_DWORD *)buf = 138544130;
      v76 = v63;
      __int16 v77 = 2114;
      v78 = v73;
      __int16 v79 = 2114;
      v80 = v74;
      __int16 v81 = 2114;
      v82 = v64;
      _os_log_error_impl( &dword_0,  v45,  OS_LOG_TYPE_ERROR,  "%{public}@ | entry not on filesystem at path:%{public}@ | %{public}@[%{public}@]",  buf,  0x2Au);
    }

    __int128 v15 = 0LL;
    goto LABEL_27;
  }

  v34 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
  char v35 = objc_opt_respondsToSelector( v34,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:");

  v36 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  v39 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v38,  @"Entry",  v74));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
  if ((v35 & 1) != 0) {
    v41 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:]( v36,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:",  v37,  v39,  v40,  0LL);
  }
  else {
    v41 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( v36,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v37,  v39,  v40);
  }
  __int128 v15 = v41;

  if (v15)
  {
    -[SUCorePersistedState loadPersistedState](v15, "loadPersistedState");
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
    [v46 addObject:v74];

    id v8 = v17;
    id v9 = v74;
    -[MADAutoAssetPersisted _persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:]( self,  "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:",  v15,  v74,  @"table-of-contents place holder | no previously persisted ToC",  0LL,  v8);
    -[MADAutoAssetPersisted _persistTableOfContents:forEntryName:withEntryStatus:]( self,  "_persistTableOfContents:forEntryName:withEntryStatus:",  v8,  v74,  0LL);
    __int128 v12 = v73;
LABEL_27:
    __int128 v13 = v72;
    goto LABEL_43;
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
  v53 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 oslog]);

  id v8 = v17;
  __int128 v12 = v73;
  id v9 = v74;
  __int128 v13 = v72;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_loadPersistedEntry",  v8));
    v66 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  3LL));
    *(_DWORD *)buf = 138544130;
    v76 = v65;
    __int16 v77 = 2114;
    v78 = v73;
    __int16 v79 = 2114;
    v80 = v74;
    __int16 v81 = 2114;
    v82 = v66;
    _os_log_error_impl( &dword_0,  v53,  OS_LOG_TYPE_ERROR,  "%{public}@ | unable to create persisted-state for new entry file:%{public}@ | %{public}@[%{public}@]",  buf,  0x2Au);
  }

  __int128 v15 = 0LL;
LABEL_43:
  unsigned int v57 = -[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled");
  if (v15 && v57 && v13)
  {
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedStates](self, "knownPersistedStates"));
    -[os_log_s setObject:forKey:](v33, "setObject:forKey:", v15, v13);
LABEL_47:
  }

+ (id)persistedStateFilename:(id)a3 forFileID:(id)a4 ofEntryName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___NSString);
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(RepositoryPath);
  __int128 v13 = (void *)v12;
  if (v7) {
    __int128 v14 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@/%@/%@_%@_%@.state", v12, v9, v9, v8, v7);
  }
  else {
    __int128 v14 = -[NSString initWithFormat:](v10, "initWithFormat:", @"%@/%@/%@_%@.state", v12, v9, v9, v8, v17);
  }
  __int128 v15 = v14;

  return v15;
}

- (BOOL)_verifyEntryFileExists:(id)a3 fromLocation:(id)a4 expectingExists:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v12 = [v11 fileExistsAtPath:v8];
  if ((v12 & 1) == 0 && v5)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_verifyEntryFileExists",  v9));
      int v17 = 138543618;
      v18 = v16;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ | entry file in table-of-contents does not exist at path:%{public}@",  (uint8_t *)&v17,  0x16u);
    }
  }

  return v12;
}

+ (int64_t)persistedEntryStatusValue:(id)a3
{
  id v3 = a3;
  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"CREATED") & 1) != 0)
  {
    int64_t v4 = 0LL;
  }

  else if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"STORED") & 1) != 0)
  {
    int64_t v4 = 1LL;
  }

  else if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"LOADED") & 1) != 0)
  {
    int64_t v4 = 2LL;
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"LOAD_OR_CREATE") & 1) != 0)
  {
    int64_t v4 = 3LL;
  }

  else if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"DELETED"))
  {
    int64_t v4 = 4LL;
  }

  else
  {
    int64_t v4 = 5LL;
  }

  return v4;
}

- (int64_t)_validateLoadedEntry:(id)a3 fromLocation:(id)a4 forEntryName:(id)a5 loadedWithEntryStatus:(int64_t)a6
{
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue", a3, a4, a5));
  dispatch_assert_queue_V2(v7);

  else {
    return qword_27E668[a6];
  }
}

- (BOOL)persistedEntryAlreadyExists:(id)a3 fromLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v9,  @"Entry",  v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
  if (-[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled"))
  {
    if (v11)
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedFiles](self, "knownPersistedFiles"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

      if (v13) {
        goto LABEL_8;
      }
    }
  }

  BOOL v14 = -[MADAutoAssetPersisted _verifyEntryFileExists:fromLocation:expectingExists:]( self,  "_verifyEntryFileExists:fromLocation:expectingExists:",  v10,  v6,  0LL);
  if (-[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled") && v11 && v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedFiles](self, "knownPersistedFiles"));
    [v15 setObject:&__kCFBooleanTrue forKey:v11];

LABEL_8:
    LOBYTE(v14) = 1;
  }

  return v14;
}

+ (id)persistedEntryStatusName:(int64_t)a3
{
  else {
    return *(&off_34E7F0 + a3);
  }
}

- (void)_persistStatusChange:(id)a3 ofEntryName:(id)a4 withEntrySummary:(id)a5 currentStatus:(int64_t)a6 fromLocation:(id)a7
{
  id v9 = a3;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (id)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedEntryStatusName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedEntryStatusName:",  a6));
  [v9 persistString:v11 forKey:@"entryStatus" shouldPersist:1];
}

- (void)storePersistedEntry:(id)a3 withEntrySummary:(id)a4 fromLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedEntry:fromLocation:](self, "persistedEntry:fromLocation:", v8, v10));
  if (v12)
  {
    -[MADAutoAssetPersisted _persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:]( self,  "_persistStatusChange:ofEntryName:withEntrySummary:currentStatus:fromLocation:",  v12,  v8,  v9,  1LL,  v10);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v13,  @"Entry",  v8));

    if (-[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled"))
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastPathComponent]);
      if (v15)
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedStates](self, "knownPersistedStates"));
        [v16 setObject:v12 forKey:v15];
      }
    }
  }

  else
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"storePersistedEntry",  v10));
      int v19 = 138543874;
      id v20 = v18;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_error_impl( &dword_0,  (os_log_t)v14,  OS_LOG_TYPE_ERROR,  "%{public}@ | unable to locate entry | %{public}@[%{public}@]",  (uint8_t *)&v19,  0x20u);
    }
  }
}

- (id)initForModule:(id)a3 ofModuleVersion:(id)a4 usingDispatchQueue:(id)a5 usingLogger:(id)a6 loggingByName:(id)a7 withVersionMigrator:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v52 = a5;
  id v51 = a6;
  id v17 = a7;
  id v18 = a8;
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___MADAutoAssetPersisted;
  int v19 = -[MADAutoAssetPersisted init](&v53, "init");
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_logger, a6);
    __int16 v21 = objc_alloc(&OBJC_CLASS___NSString);
    if (v17) {
      id v22 = -[NSString initWithFormat:](v21, "initWithFormat:", @"AUTO-PERSISTED(%@)[%@]", v15, v17);
    }
    else {
      id v22 = -[NSString initWithFormat:](v21, "initWithFormat:", @"AUTO-PERSISTED(%@)", v15, v50);
    }
    logLeader = v20->_logLeader;
    v20->_logLeader = v22;

    objc_storeStrong((id *)&v20->_moduleName, a3);
    objc_storeStrong((id *)&v20->_moduleCurrentVersion, a4);
    latestSafeSummary = v20->_latestSafeSummary;
    v20->_latestSafeSummary = (NSString *)@"INIT";

    objc_storeStrong((id *)&v20->_persistedQueue, a5);
    __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSCache);
    knownPersistedFiles = v20->_knownPersistedFiles;
    v20->_knownPersistedFiles = v25;

    __int128 v27 = objc_alloc_init(&OBJC_CLASS___NSCache);
    knownPersistedStates = v20->_knownPersistedStates;
    v20->_knownPersistedStates = v27;

    v20->_cachingEnabled = 0;
    __int128 v29 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
    char v30 = objc_opt_respondsToSelector( v29,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:");

    int64_t v31 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
    persistedQueue = v20->_persistedQueue;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v20->_moduleName,  @"Config",  0LL));
    if ((v30 & 1) != 0)
    {
      v34 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:]( v31,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:",  persistedQueue,  v33,  v16,  0LL);
      persistedConfig = v20->_persistedConfig;
      v20->_persistedConfig = v34;

      v36 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
      v37 = v20->_persistedQueue;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v20->_moduleName,  @"TableOfContents",  0LL));
      v39 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:]( v36,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:issuingDefaultLevelLogging:",  v37,  v38,  v16,  0LL);
    }

    else
    {
      v40 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( v31,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  persistedQueue,  v33,  v16);
      v41 = v20->_persistedConfig;
      v20->_persistedConfig = v40;

      int64_t v42 = objc_alloc(&OBJC_CLASS___SUCorePersistedState);
      v43 = v20->_persistedQueue;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v20->_moduleName,  @"TableOfContents",  0LL));
      v39 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( v42,  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v43,  v38,  v16);
    }

    entryTableOfContents = v20->_entryTableOfContents;
    v20->_entryTableOfContents = v39;

    v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentEntryIDs = v20->_currentEntryIDs;
    v20->_currentEntryIDs = v45;

    id v47 = objc_retainBlock(v18);
    id moduleVersionMigrator = v20->_moduleVersionMigrator;
    v20->_id moduleVersionMigrator = v47;
  }

  return v20;
}

- (void)loadPersistedState:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetPersisted _verifyPersistedDirectoryExistsOrCreate:]( self,  "_verifyPersistedDirectoryExistsOrCreate:",  v4))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
    [v6 loadPersistedState];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 stringForKey:@"duplicatedModuleVersion"]);

    id v66 = v4;
    v64 = (void *)v8;
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
      if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v8, v9) & 1) != 0)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 versionPolicyLayer]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
        unsigned int v13 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v11, v12);

        if (v13)
        {
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"loadPersistedState",  v4));
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 versionPolicyLayer]);
            int v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
            *(_DWORD *)buf = 138543874;
            __int16 v77 = v16;
            __int16 v78 = 2114;
            __int16 v79 = v18;
            __int16 v80 = 2114;
            __int16 v81 = v19;
            _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | persisted-state version(%{public}@) = current module version(%{public}@), processing persisted-state",  buf,  0x20u);
          }

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
          [v20 loadPersistedState];

          __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
          id v22 = [v21 objectForKey:@"currentEntries" ofClass:objc_opt_class(NSArray)];
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

          id v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          id v25 = v23;
          id v26 = [v25 countByEnumeratingWithState:&v71 objects:v86 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v72;
            do
            {
              __int128 v29 = 0LL;
              do
              {
                if (*(void *)v72 != v28) {
                  objc_enumerationMutation(v25);
                }
                char v30 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)v29);
                int64_t v31 = objc_autoreleasePoolPush();
                if (v30)
                {
                  if (-[NSMutableArray containsObject:](v24, "containsObject:", v30))
                  {
                    v32 = v24;
                    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
                    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      v38 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"loadPersistedState",  v66));
                      *(_DWORD *)buf = 138543618;
                      __int16 v77 = v38;
                      __int16 v78 = 2114;
                      __int16 v79 = v30;
                      _os_log_error_impl( &dword_0,  v34,  OS_LOG_TYPE_ERROR,  "%{public}@ | duplicate entry dropped | %{public}@",  buf,  0x16u);
                    }

                    id v24 = v32;
                  }

                  else if (-[MADAutoAssetPersisted _preExistingPersistedStateValid:fromLocation:]( self,  "_preExistingPersistedStateValid:fromLocation:",  v30,  @"loadPersistedState"))
                  {
                    -[NSMutableArray addObject:](v24, "addObject:", v30);
                  }
                }

                else
                {
                  char v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    v37 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"loadPersistedState",  v66));
                    *(_DWORD *)buf = 138543618;
                    __int16 v77 = v37;
                    __int16 v78 = 2114;
                    __int16 v79 = 0LL;
                    _os_log_error_impl( &dword_0,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@ | nil entryFileID encountered on previousEntries | %{public}@",  buf,  0x16u);
                  }
                }

                objc_autoreleasePoolPop(v31);
                __int128 v29 = (char *)v29 + 1;
              }

              while (v27 != v29);
              id v27 = [v25 countByEnumeratingWithState:&v71 objects:v86 count:16];
            }

            while (v27);
          }

          -[MADAutoAssetPersisted setCurrentEntryIDs:](self, "setCurrentEntryIDs:", v24);
LABEL_36:
          id v4 = v66;

          -[MADAutoAssetPersisted _removeEntriesMissingFromTableOfContents:]( self,  "_removeEntriesMissingFromTableOfContents:",  v66);
          -[MADAutoAssetPersisted _persistTableOfContents:forEntryName:withEntryStatus:]( self,  "_persistTableOfContents:forEntryName:withEntryStatus:",  @"loadPersistedState",  @"ALL-LOADED-AND-VALIDATED",  2LL);

          goto LABEL_37;
        }
      }

      else
      {
      }
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"loadPersistedState",  v4));
      int64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 versionPolicyLayer]);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](self, "moduleCurrentVersion"));
      *(_DWORD *)buf = 138544386;
      __int16 v77 = v41;
      __int16 v78 = 2114;
      __int16 v79 = v43;
      __int16 v80 = 2114;
      __int16 v81 = v44;
      __int16 v82 = 2114;
      uint64_t v83 = v8;
      __int16 v84 = 2114;
      v85 = v45;
      _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | persisted-state version(%{public}@) != current module version(%{public}@) OR duplicatedModuleVersio n(%{public}@) != current module version(%{public}@) | dropped stale persisted-state",  buf,  0x34u);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](self, "persistedConfig"));
    [v46 removePersistedState];

    id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
    [v47 loadPersistedState];

    v48 = self;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
    id v50 = [v49 objectForKey:@"currentEntries" ofClass:objc_opt_class(NSArray)];
    id v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id obj = v51;
    id v52 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v68 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v56 = *(void *)(*((void *)&v67 + 1) + 8LL * (void)i);
          unsigned int v57 = objc_autoreleasePoolPush();
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](v48, "moduleName"));
          v59 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedStateFilename:forFileID:ofEntryName:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedStateFilename:forFileID:ofEntryName:",  v58,  @"Entry",  v56));

          -[MADAutoAssetPersisted _removeEntryFile:reason:fromLocation:]( v48,  "_removeEntryFile:reason:fromLocation:",  v59,  @"persisted-version-mismatch",  v66);
          objc_autoreleasePoolPop(v57);
        }

        id v53 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
      }

      while (v53);
    }

    id v25 = obj;

    self = v48;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](v48, "entryTableOfContents"));
    [v60 removePersistedState];

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](v48, "persistedConfig"));
    [v61 loadPersistedState];

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedConfig](v48, "persistedConfig"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleCurrentVersion](v48, "moduleCurrentVersion"));
    [v62 persistString:v63 forKey:@"duplicatedModuleVersion"];

    id v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
    -[NSMutableArray loadPersistedState](v24, "loadPersistedState");
    goto LABEL_36;
  }

- (void)removePersistedEntry:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetPersisted removePersistedEntry:fromLocation:].cold.1(self, (uint64_t)v7);
    }
    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  id v10 = [v9 count];

  if (!v10)
  {
LABEL_6:
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"removePersistedEntry",  v7));
      int v27 = 138543618;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_error_impl( &dword_0,  v18,  OS_LOG_TYPE_ERROR,  "%{public}@ | table-of-contents missing entry | %{public}@",  (uint8_t *)&v27,  0x16u);
    }

- (void)flushPersistedStateCacheAndSetCachingBehaviour:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logLeader](self, "logLeader"));
    id v9 = (void *)v8;
    id v10 = @"disabling";
    if (v3) {
      id v10 = @"enabling";
    }
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {flushPersistedStateCacheAndSetCachingBehaviour} | Flushing persisted state in memory cache and %{publi c}@ future caching",  (uint8_t *)&v13,  0x16u);
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedFiles](self, "knownPersistedFiles"));
  [v11 removeAllObjects];

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedStates](self, "knownPersistedStates"));
  [v12 removeAllObjects];

  -[MADAutoAssetPersisted setCachingEnabled:](self, "setCachingEnabled:", v3);
}

- (int64_t)persistedEntryCount:(id)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue", a3));
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (void)_persistTableOfContents:(id)a3 forEntryName:(id)a4 withEntryStatus:(int64_t)a5
{
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue", a3, a4, a5));
  dispatch_assert_queue_V2(v6);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted entryTableOfContents](self, "entryTableOfContents"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
  [v8 persistObject:v7 forKey:@"currentEntries" shouldPersist:1];
}

- (BOOL)_preExistingPersistedStateValid:(id)a3 fromLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _loadPersistedEntry:forEntryName:withEntryStatus:]( self,  "_loadPersistedEntry:forEntryName:withEntryStatus:",  v6,  v7,  2LL));
  return v9 != 0LL;
}

- (BOOL)_verifyPersistedDirectoryExistsOrCreate:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v7 = objc_alloc(&OBJC_CLASS___NSString);
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  unint64_t v11 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@/%@", v9, v10);

  if ([v6 fileExistsAtPath:v11])
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_verifyPersistedDirectoryExistsOrCreate",  v4));
      *(_DWORD *)buf = 138543618;
      id v24 = v14;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | pre-existing persisted directory for modulePersistedPath:%{public}@",  buf,  0x16u);
    }

- (id)_contentsOfModulePersistedPath:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v18 = 0LL;
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:v6 error:&v18]);
  id v11 = v18;
  if (v11)
  {
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_contentsOfModulePersistedPath",  v7));
      *(_DWORD *)buf = 138543874;
      id v20 = v17;
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_error_impl( &dword_0,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@ | unable to determine directory contents at path:%{public}@, error:%{public}@",  buf,  0x20u);
    }
  }

  else
  {
    if (v10) {
      goto LABEL_7;
    }
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_contentsOfModulePersistedPath",  v7));
      *(_DWORD *)buf = 138543618;
      id v20 = v16;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_error_impl( &dword_0,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ | empty persisted directory at path:%{public}@",  buf,  0x16u);
    }
  }

  id v10 = 0LL;
LABEL_7:

  return v10;
}

- (void)_removeEntryFile:(id)a3 reason:(id)a4 fromLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v17 = 0LL;
  [v12 removeItemAtPath:v8 error:&v17];
  id v13 = v17;
  if (v13)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_removeEntryFile",  v10));
      *(_DWORD *)buf = 138544130;
      BOOL v19 = v16;
      __int16 v20 = 2114;
      id v21 = v9;
      __int16 v22 = 2114;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ | failed to remove %{public}@ entry from filesystem path:%{public}@, error:%{public}@",  buf,  0x2Au);
LABEL_7:

      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (-[MADAutoAssetPersisted cachingEnabled](self, "cachingEnabled"))
  {
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted knownPersistedFiles](self, "knownPersistedFiles"));
      [v16 removeObjectForKey:v15];
      goto LABEL_7;
    }

- (void)_removeEntriesMissingFromTableOfContents:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted persistedQueue](self, "persistedQueue"));
  dispatch_assert_queue_V2(v5);

  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  id v7 = objc_alloc(&OBJC_CLASS___NSString);
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
  id v11 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@/%@", v9, v10);

  v43 = v11;
  v39 = v4;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _contentsOfModulePersistedPath:fromLocation:]( self,  "_contentsOfModulePersistedPath:fromLocation:",  v11,  v4));
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
    unsigned int v15 = -[NSString initWithFormat:](v13, "initWithFormat:", @"%@_%@", v14, @"Config");

    id v16 = objc_alloc(&OBJC_CLASS___NSString);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
    id v18 = -[NSString initWithFormat:](v16, "initWithFormat:", @"%@_%@", v17, @"TableOfContents");

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    v38 = v12;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v20) {
      goto LABEL_24;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v46;
    v41 = v18;
    int64_t v42 = v15;
    id v40 = v19;
    while (1)
    {
      id v23 = 0LL;
      do
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        __int16 v24 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)v23);
        id v25 = objc_autoreleasePoolPush();
        if (([v24 hasPrefix:v15] & 1) == 0
          && ([v24 hasPrefix:v18] & 1) == 0)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted moduleName](self, "moduleName"));
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted entryFileIDForModule:fromFilename:]( &OBJC_CLASS___MADAutoAssetPersisted,  "entryFileIDForModule:fromFilename:",  v26,  v24));

          id v44 = [objc_alloc((Class)p_ivars[137]) initWithFormat:@"%@/%@", v43, v24];
          if (v27)
          {
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted currentEntryIDs](self, "currentEntryIDs"));
            unsigned int v29 = [v28 containsObject:v27];

            id v30 = self;
            int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

            if (v29)
            {
              self = v30;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( v30,  "_summaryLeader:fromLocation:",  @"_removeEntriesMissingFromTableOfContents",  v39));
                *(_DWORD *)buf = 138543618;
                id v50 = v33;
                __int16 v51 = 2114;
                id v52 = v27;
                _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | valid entry in table-of-contents | %{public}@",  buf,  0x16u);
                goto LABEL_13;
              }

              goto LABEL_15;
            }

            self = v30;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( v30,  "_summaryLeader:fromLocation:",  @"_removeEntriesMissingFromTableOfContents",  v39));
              *(_DWORD *)buf = 138543618;
              id v50 = v36;
              __int16 v51 = 2114;
              id v52 = v24;
              _os_log_error_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "%{public}@ | stale entry on filesystem (not in table-of-contents) for file:%{public}@",  buf,  0x16u);
            }

            char v35 = v44;
            -[MADAutoAssetPersisted _removeEntryFile:reason:fromLocation:]( v30,  "_removeEntryFile:reason:fromLocation:",  v44,  @"stale-on-filesystem",  v39);
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            id v18 = v41;
          }

          else
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetPersisted logger](self, "logger"));
            v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetPersisted _summaryLeader:fromLocation:]( self,  "_summaryLeader:fromLocation:",  @"_removeEntriesMissingFromTableOfContents",  v39));
              *(_DWORD *)buf = 138543618;
              id v50 = v33;
              __int16 v51 = 2114;
              id v52 = v24;
              _os_log_error_impl( &dword_0,  v32,  OS_LOG_TYPE_ERROR,  "%{public}@ | unable to form entryFileID for file:%{public}@",  buf,  0x16u);
LABEL_13:
            }

+ (id)entryFileIDForModule:(id)a3 fromFilename:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@_%@",  v6,  @"Entry");

  NSUInteger v8 = -[NSString length](v7, "length");
  id v9 = (char *)[@".state" length] + v8 + 1;
  if ([v5 length] > v9
    && [v5 hasPrefix:v7]
    && [v5 hasSuffix:@".state"])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "substringWithRange:",  (char *)-[NSString length](v7, "length") + 1,  (_BYTE *)objc_msgSend(v5, "length") - v9));
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)persistedComponentSymbol:(id)a3
{
  id v3 = a3;
  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v3, @"ACTIVE-JOBS") & 1) != 0)
  {
    id v4 = @"AJOBS";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"KNOWN_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"KDESC";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"DOWNLOADED_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"DDESC";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"JOB_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"JDESC";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"INVALID_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"IDESC";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-SCHEDULER") & 1) != 0)
  {
    id v4 = @"SCHED";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-LOCKER") & 1) != 0)
  {
    id v4 = @"LOCKR";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-STAGER") & 1) != 0)
  {
    id v4 = @"STAGR";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-STAGER-SET-LOOKUP-RESULTS") & 1) != 0)
  {
    id v4 = @"SSLUP";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-STAGER-TARGET-LOOKUP-RESULTS") & 1) != 0)
  {
    id v4 = @"STLUP";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"AUTO-STAGER-TARGET-AVAILABLE") & 1) != 0)
  {
    id v4 = @"STGAV";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_CONFIGURATIONS") & 1) != 0)
  {
    id v4 = @"SCONF";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_ATOMIC_INSTANCES") & 1) != 0)
  {
    id v4 = @"SATOM";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_ACTIVE_JOB_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"SJOBS";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_DOWNLOADED_DESCRIPTORS") & 1) != 0)
  {
    id v4 = @"SDESC";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_TARGETS") & 1) != 0)
  {
    id v4 = @"STARG";
  }

  else if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v3,  @"SET_LOOKUP_RESULTS"))
  {
    id v4 = @"SLKUP";
  }

  else
  {
    id v4 = @"?????";
  }

  return (id)v4;
}

- (SUCorePersistedState)entryTableOfContents
{
  return self->_entryTableOfContents;
}

- (void)setCurrentEntryIDs:(id)a3
{
}

- (id)moduleVersionMigrator
{
  return self->_moduleVersionMigrator;
}

- (NSCache)knownPersistedFiles
{
  return self->_knownPersistedFiles;
}

- (void)setKnownPersistedFiles:(id)a3
{
}

- (NSCache)knownPersistedStates
{
  return self->_knownPersistedStates;
}

- (void)setKnownPersistedStates:(id)a3
{
}

- (BOOL)cachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (void).cxx_destruct
{
}

- (void)persistedEntry:(void *)a1 fromLocation:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _summaryLeader:@"persistedEntry" fromLocation:a2]);
  OUTLINED_FUNCTION_1_1(&dword_0, v3, v4, "%{public}@ | nil entryName provided by caller", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_10();
}

- (void)removePersistedEntry:(void *)a1 fromLocation:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _summaryLeader:@"removePersistedEntry" fromLocation:a2]);
  OUTLINED_FUNCTION_1_1(&dword_0, v3, v4, "%{public}@ | nil entryName provided", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_10();
}

@end
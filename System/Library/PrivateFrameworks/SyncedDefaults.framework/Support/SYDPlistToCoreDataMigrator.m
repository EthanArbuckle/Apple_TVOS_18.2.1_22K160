@interface SYDPlistToCoreDataMigrator
+ (BOOL)isSharedIPad;
+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 error:(id *)a5;
+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6;
+ (BOOL)migrateAllPlistsToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6;
+ (BOOL)migratePlist:(id)a3 forStoreWithIdentifier:(id)a4 toCoreDataStore:(id)a5 error:(id *)a6;
+ (BOOL)shouldIncrementFailureCountForError:(id)a3;
+ (BOOL)shouldStopMigrationAfterError:(id)a3;
+ (BOOL)shouldUseTransactionForPlistAtURL:(id)a3;
+ (id)allPossibleStorePlistURLsWithLibraryDirectoryURL:(id)a3;
+ (id)keyValueStorePlistFromURL:(id)a3 error:(id *)a4;
+ (id)knownDaemons;
+ (void)addPlistURLsAndStoreIdentifiersForBundleRecord:(id)a3 toDictionary:(id)a4 uncontainerizedSyncedPreferencesDirectoryURL:(id)a5;
+ (void)addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:(id)a3 uncontainerizedSyncedPreferencesDirectoryURL:(id)a4;
+ (void)addPlistURLsForBundleIdentifier:(id)a3 defaultStoreIdentifier:(id)a4 additionalStoreIdentifiers:(id)a5 toDictionary:(id)a6 syncedPreferencesDirectoryURL:(id)a7;
@end

@implementation SYDPlistToCoreDataMigrator

+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v16 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:&v16]);
  id v11 = v16;

  if (v10)
  {
    unsigned __int8 v12 = [a1 migrateAllPlistsIfNecessaryToCoreDataStore:v8 deleteMigratedPlists:v6 libraryDirectoryURL:v10 error:a5];
  }

  else
  {
    id v13 = SYDGetMigrationLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_1000317DC();
    }

    unsigned __int8 v12 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  return v12;
}

+ (BOOL)migrateAllPlistsIfNecessaryToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/migrate-if-necessary",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);
  id v13 = SYDGetMigrationLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100031BF8();
  }

  id v54 = 0LL;
  unsigned int v15 = [v10 didMigrateFromPlistsWithError:&v54];
  id v16 = v54;
  if (!v16)
  {
    if (v15)
    {
      id v21 = SYDGetMigrationLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10003183C();
      }
LABEL_30:
      v17 = 0LL;
      BOOL v20 = 1;
      goto LABEL_31;
    }

    if ([a1 isSharedIPad])
    {
      id v22 = SYDGetMigrationLog();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100031868();
      }
      goto LABEL_30;
    }

    id v23 = SYDGetMigrationLog();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100031B6C();
    }

    id v53 = 0LL;
    unsigned int v25 = [a1 migrateAllPlistsToCoreDataStore:v10 deleteMigratedPlists:v8 libraryDirectoryURL:v11 error:&v53];
    id v26 = v53;
    v17 = v26;
    if (v25)
    {
      id v52 = v26;
      [v10 setDidMigrateFromPlists:1 error:&v52];
      v19 = (os_log_s *)v52;

      if (v19)
      {
        id v27 = SYDGetMigrationLog();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          sub_1000318C0();
        }
      }

      else
      {
        id v36 = SYDGetMigrationLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_100031894();
        }
      }

      goto LABEL_30;
    }

    id v29 = SYDGetMigrationLog();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      sub_100031B0C();
    }

    if (![a1 shouldIncrementFailureCountForError:v17])
    {
      BOOL v20 = 0;
      goto LABEL_32;
    }

    id v51 = 0LL;
    unsigned __int16 v31 = (unsigned __int16)[v10 failedMigrationCountWithError:&v51];
    v32 = (os_log_s *)v51;
    if (v32)
    {
      v33 = v32;
      id v34 = SYDGetMigrationLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100031AAC();
      }
    }

    else
    {
      int v38 = (__int16)(v31 + 1);
      id v50 = 0LL;
      unsigned __int8 v39 = [v10 setFailedMigrationCount:v38 error:&v50];
      v19 = (os_log_s *)v50;
      if ((v39 & 1) == 0)
      {
        id v47 = SYDGetMigrationLog();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_100031A4C();
        }
        BOOL v20 = 0;
        v33 = v19;
        goto LABEL_48;
      }

      id v40 = SYDGetMigrationLog();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        sub_1000319D8(v38, v41);
      }

      if (v38 < 10) {
        goto LABEL_6;
      }
      id v42 = SYDGetMigrationLog();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        sub_1000319AC();
      }

      v49 = v19;
      unsigned __int8 v44 = [v10 setDidMigrateFromPlists:1 error:&v49];
      v33 = v49;

      if ((v44 & 1) != 0)
      {
        id v45 = SYDGetMigrationLog();
        v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          sub_100031920();
        }

        BOOL v20 = 1;
        v35 = (os_log_s *)v17;
        v17 = 0LL;
        goto LABEL_48;
      }

      id v48 = SYDGetMigrationLog();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10003194C();
      }
    }

    BOOL v20 = 0;
LABEL_48:

    v19 = v33;
    goto LABEL_31;
  }

  v17 = v16;
  id v18 = SYDGetMigrationLog();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100031B98();
  }
LABEL_6:
  BOOL v20 = 0;
LABEL_31:

LABEL_32:
  if (a6) {
    *a6 = v17;
  }

  os_activity_scope_leave(&state);
  return v20;
}

+ (BOOL)migrateAllPlistsToCoreDataStore:(id)a3 deleteMigratedPlists:(BOOL)a4 libraryDirectoryURL:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = _os_activity_create( (void *)&_mh_execute_header,  "kvs/migrate-all-plists",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v12, &state);
  if (sub_10000BF78())
  {
    id v13 = SYDGetMigrationLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100031C24();
    }

    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    v55 = @"Cannot migrate the non-personal persona";
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"SyncedDefaults",  1025LL,  v15));

    if (a6)
    {
      id v16 = v16;
      BOOL v17 = 0;
      *a6 = v16;
    }

    else
    {
      BOOL v17 = 0;
    }
  }

  else
  {
    id v18 = SYDGetMigrationLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100031D08();
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v46 = 0LL;
    v47[0] = &v46;
    v47[1] = 0x2020000000LL;
    v47[2] = 0LL;
    uint64_t v40 = 0LL;
    v41 = &v40;
    uint64_t v42 = 0x3032000000LL;
    v43 = sub_10001EA88;
    unsigned __int8 v44 = sub_10001EA98;
    id v45 = 0LL;
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([a1 allPossibleStorePlistURLsWithLibraryDirectoryURL:v11]);
    id v21 = SYDGetMigrationLog();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100031CCC((uint64_t)v53, (uint64_t)[v20 count], v22);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10001EAA0;
    v34[3] = &unk_10004D420;
    id v38 = a1;
    id v36 = &v40;
    id v35 = v10;
    v37 = &v46;
    BOOL v39 = a4;
    [v20 enumerateKeysAndObjectsUsingBlock:v34];
    [v16 timeIntervalSinceNow];
    double v24 = v23;
    id v25 = SYDGetMigrationLog();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    double v27 = -v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100031C50((uint64_t)v47, v26, v28, v27);
    }

    id v29 = (void *)v41[5];
    if (v29)
    {
      id v51 = @"errorDomainAndCode";
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 domain]);
      unsigned __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@_%ld",  v30,  [(id)v41[5] code]));
      id v52 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
      AnalyticsSendEvent(@"com.apple.kvs.migrationFailed", v32);
    }

    else
    {
      v49[0] = @"storeCount";
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(v47[0] + 24LL)));
      v50[0] = v30;
      v49[1] = @"duration";
      unsigned __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27));
      v50[1] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL));
      AnalyticsSendEvent(@"com.apple.kvs.migrationCompleted", v32);
    }

    if (a6) {
      *a6 = (id) v41[5];
    }
    BOOL v17 = v41[5] == 0;

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);
  }

  os_activity_scope_leave(&state);
  return v17;
}

+ (BOOL)migratePlist:(id)a3 forStoreWithIdentifier:(id)a4 toCoreDataStore:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = SYDGetMigrationLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000320D4();
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = sub_10001EA88;
  unsigned __int16 v31 = sub_10001EA98;
  id v32 = 0LL;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"values"]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10001F070;
  v23[3] = &unk_10004D448;
  id v16 = v10;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  id v26 = &v27;
  [v15 enumerateKeysAndObjectsUsingBlock:v23];
  id v18 = SYDGetMigrationLog();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    [v14 timeIntervalSinceNow];
    sub_100032080((uint64_t)v16, (uint64_t)v33, v19, v20);
  }

  if (a6) {
    *a6 = (id) v28[5];
  }
  BOOL v21 = v28[5] == 0;

  _Block_object_dispose(&v27, 8);
  return v21;
}

+ (id)keyValueStorePlistFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v5));
  [v6 open];
  id v21 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v6,  0LL,  0LL,  &v21));
  id v8 = v21;
  [v6 close];
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v9 isEqualToString:NSCocoaErrorDomain])
    {
      id v10 = [v8 code];

      if (v10 != (id)3842) {
        goto LABEL_9;
      }
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      if ([v12 isEqualToString:NSPOSIXErrorDomain])
      {
        id v13 = [v9 code];

        if (v13 == (id)2)
        {

          id v8 = 0LL;
LABEL_11:

          goto LABEL_12;
        }
      }

      else
      {
      }
    }

LABEL_9:
    id v14 = SYDGetMigrationLog();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_100032020();
    }
    goto LABEL_11;
  }

+ (BOOL)shouldStopMigrationAfterError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((sub_10000B3A4(v3) & 1) != 0) {
      char v5 = 1;
    }
    else {
      char v5 = sub_10000B470(v4);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldIncrementFailureCountForError:(id)a3
{
  id v3 = a3;
  if ((sub_10000B3A4(v3) & 1) != 0) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = sub_10000B470(v3) ^ 1;
  }

  return v4;
}

+ (BOOL)shouldUseTransactionForPlistAtURL:(id)a3
{
  id v3 = a3;
  id v15 = 0LL;
  id v14 = 0LL;
  unsigned __int8 v4 = [v3 getResourceValue:&v15 forKey:NSURLFileSizeKey error:&v14];
  id v5 = v15;
  id v6 = v14;
  if ((v4 & 1) != 0)
  {
    id v7 = [v5 unsignedLongValue];
    BOOL v8 = (unint64_t)v7 < 0x500000;
    id v9 = SYDGetMigrationLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
      *(_DWORD *)buf = 138412802;
      id v17 = v11;
      __int16 v18 = 1024;
      BOOL v19 = (unint64_t)v7 < 0x500000;
      __int16 v20 = 2048;
      id v21 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Plist %@: useTransaction=%d size=%ld KB",  buf,  0x1Cu);
    }
  }

  else
  {
    id v12 = SYDGetMigrationLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000324E4();
    }
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isSharedIPad
{
  return 0;
}

+ (id)allPossibleStorePlistURLsWithLibraryDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetMigrationLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100032544();
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        [a1 addPlistURLsAndStoreIdentifiersForBundleRecord:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13) toDictionary:v7 uncontainerizedSyncedPreferencesDirectoryURL:v8];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v11);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationExtensionRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "enumeratorWithOptions:",  0LL));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      __int16 v18 = 0LL;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [a1 addPlistURLsAndStoreIdentifiersForBundleRecord:*(void *)(*((void *)&v20 + 1) + 8 * (void)v18) toDictionary:v7 uncontainerizedSyncedPreferencesDirectoryURL:v8];
        __int16 v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v16);
  }

  [a1 addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:v7 uncontainerizedSyncedPreferencesDirectoryURL:v8];

  return v7;
}

+ (void)addPlistURLsAndStoreIdentifiersForBundleRecord:(id)a3 toDictionary:(id)a4 uncontainerizedSyncedPreferencesDirectoryURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SYDGetMigrationLog();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000326F8(v8, v12);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 entitlements]);
  id v14 = [v13 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier" ofClass:objc_opt_class(NSString)];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
  id v17 = [v13 objectForKey:@"com.apple.private.ubiquity-additional-kvstore-identifiers" ofClass:v16 valuesOfClass:objc_opt_class(NSString)];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
  if ((objc_opt_isKindOfClass(v8) & 1) != 0
    || (objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord), (objc_opt_isKindOfClass(v8) & 1) == 0))
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 effectiveBundleIdentifier]);
  }

  __int128 v20 = (void *)v19;
  if (v15 || [v18 count])
  {
    if (v20)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 dataContainerURL]);
      __int128 v22 = v21;
      id v31 = v9;
      id v23 = a1;
      if (v21)
      {
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 URLByAppendingPathComponent:@"Library" isDirectory:1]);
        __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v24 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1]);
      }

      else
      {
        id v27 = SYDGetMigrationLog();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100032678(v8, v28);
        }

        __int128 v25 = (os_log_s *)v10;
      }

      uint64_t v29 = v23;
      id v9 = v31;
      [v29 addPlistURLsForBundleIdentifier:v20 defaultStoreIdentifier:v15 additionalStoreIdentifiers:v18 toDictionary:v31 syncedPreferencesDirectoryURL:v25];
    }

    else
    {
      id v26 = SYDGetMigrationLog();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_1000325F0(v8, v25);
      }
    }
  }

  else
  {
    id v30 = SYDGetMigrationLog();
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100032570(v8, v25);
    }
  }
}

+ (void)addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:(id)a3 uncontainerizedSyncedPreferencesDirectoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SYDGetMigrationLog();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100032778();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 knownDaemons]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001FEAC;
  v13[3] = &unk_10004D470;
  id v15 = v7;
  id v16 = a1;
  id v14 = v6;
  id v11 = v7;
  id v12 = v6;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];
}

+ (void)addPlistURLsForBundleIdentifier:(id)a3 defaultStoreIdentifier:(id)a4 additionalStoreIdentifiers:(id)a5 toDictionary:(id)a6 syncedPreferencesDirectoryURL:(id)a7
{
  id v35 = a3;
  id v11 = a4;
  id v12 = a5;
  id v34 = a6;
  id v33 = a7;
  id v13 = SYDGetMigrationLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", @", "));
    *(_DWORD *)buf = 138412802;
    id v42 = v35;
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2112;
    uint64_t v46 = v30;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Adding plist URLs for bundle identifier %@ with defaultStoreIdentifier=(%@) additionalStoreIdentifiers=[%@]",  buf,  0x20u);
  }

  if (v11)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:v35]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 URLByAppendingPathExtension:@"plist"]);

    [v34 setObject:v11 forKeyedSubscript:v16];
  }

  id v17 = (char *)[v12 count];
  if (v11) {
    __int16 v18 = v17 + 1;
  }
  else {
    __int16 v18 = v17;
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v18));
  __int128 v20 = v19;
  if (v11) {
    [v19 addObject:v11];
  }
  id v32 = v11;
  if (v12) {
    [v20 addObjectsFromArray:v12];
  }
  id v31 = v12;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v35,  v26));
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathExtension:@"plist"]);

        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:v28]);
        [v34 setObject:v26 forKeyedSubscript:v29];
      }

      id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }

    while (v23);
  }
}

+ (id)knownDaemons
{
  v3[0] = @"com.apple.sbd";
  v3[1] = @"com.apple.security.cloudkeychainproxy3";
  v4[0] = &off_10004FD28;
  v4[1] = &off_10004FD50;
  v3[2] = @"accountsd";
  v3[3] = @"com.apple.finder";
  v4[2] = &off_10004FD78;
  v4[3] = &off_10004FDA0;
  v3[4] = @"com.apple.accessibility.AccessibilityUIServer";
  v3[5] = @"com.apple.VoiceOverTouch";
  v4[4] = &off_10004FDC8;
  v4[5] = &off_10004FDF0;
  v3[6] = @"com.apple.TextInput.kbd";
  v3[7] = @"com.apple.nanoweatherprefsd";
  v4[6] = &off_10004FE18;
  v4[7] = &off_10004FE40;
  v3[8] = @"com.apple.springboard";
  v3[9] = @"com.apple.backboardd";
  v4[8] = &off_10004FE68;
  v4[9] = &off_10004FE90;
  v3[10] = @"com.apple.datamigrator";
  v3[11] = @"com.apple.CoreSuggestions";
  v4[10] = &off_10004FEB8;
  v4[11] = &off_10004FEE0;
  v3[12] = @"com.apple.cmfsyncagent";
  v3[13] = @"com.apple.accessibility.heard";
  v4[12] = &off_10004FF08;
  v4[13] = &off_10004FF30;
  v3[14] = @"com.apple.wifid";
  v3[15] = @"com.apple.coretelephony";
  v4[14] = &off_10004FF58;
  v4[15] = &off_10004FF80;
  v3[16] = @"com.apple.cloudrecents.CloudRecentsAgent";
  v3[17] = @"com.apple.mediaaccessibilityd";
  v4[16] = &off_10004FFA8;
  v4[17] = &off_10004FFD0;
  v3[18] = @"com.apple.email.maild";
  v3[19] = @"com.apple.tipsd";
  v4[18] = &off_10004FFF8;
  v4[19] = &off_100050020;
  v3[20] = @"com.apple.touristd";
  v4[20] = &off_100050048;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  21LL));
}

  ;
}

@end
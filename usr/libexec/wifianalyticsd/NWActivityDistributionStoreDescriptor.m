@interface NWActivityDistributionStoreDescriptor
+ (id)withGroupAndOptions:(int64_t)a3 groupTarget:(id)a4;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (id)_initWithGroupAndOptions:(int64_t)a3 groupTarget:(id)a4;
- (void)findInterpolatedPercentileFromWiFiStats:(id)a3 andReply:(id)a4;
@end

@implementation NWActivityDistributionStoreDescriptor

+ (id)withGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5 = a4;
  id v6 = WALogCategoryDefaultHandle();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446978;
    v11 = "+[NWActivityDistributionStoreDescriptor withGroupAndOptions:groupTarget:]";
    __int16 v12 = 1024;
    int v13 = 58;
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Initiating store descriptor for %ld and options %@",  (uint8_t *)&v10,  0x26u);
  }

  id v8 = -[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]( objc_alloc(&OBJC_CLASS___NWActivityDistributionStoreDescriptor),  "_initWithGroupAndOptions:groupTarget:",  a3,  v5);
  return v8;
}

- (id)_initWithGroupAndOptions:(int64_t)a3 groupTarget:(id)a4
{
  id v5 = a4;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___NWActivityDistributionStoreDescriptor;
  id v6 = -[NWActivityDistributionStoreDescriptor init](&v48, "init");
  if (!v6) {
    goto LABEL_29;
  }
  v7 = objc_autoreleasePoolPush();
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[WAUtil resourcePath](&OBJC_CLASS___WAUtil, "resourcePath"));
  v9 = NSSQLiteStoreType;
  int v10 = NSFileProtectionNone;
  id v11 = WALogCategoryDefaultHandle();
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v51 = "_Bool createPolicy(_Bool, _Bool, NSString *__autoreleasing *, NSString *__autoreleasing *)";
    __int16 v52 = 1024;
    int v53 = 29;
    __int16 v54 = 2112;
    v55 = @"LEGACY";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:NWActivityDistributionStoreDescriptor is running in %@ MODE",  buf,  0x1Cu);
  }

  int v13 = v9;
  __int16 v14 = v10;
  if (!v8)
  {
    id v35 = WALogCategoryDefaultHandle();
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v52 = 1024;
      int v53 = 79;
      __int16 v54 = 2112;
      v55 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to access bundle path %@",  buf,  0x1Cu);
    }

    goto LABEL_39;
  }

  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 contentsOfDirectoryAtPath:v8 error:0]);

  if (!-[os_log_s count](v16, "count"))
  {
    id v36 = WALogCategoryDefaultHandle();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v52 = 1024;
      int v53 = 83;
      __int16 v54 = 2112;
      v55 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Found no files in %@",  buf,  0x1Cu);
    }

LABEL_39:
    int v30 = 0;
    LODWORD(v17) = 0;
    goto LABEL_26;
  }

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int16 v16 = v16;
  id v17 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
  if (v17)
  {
    v38 = v14;
    v39 = v13;
    v40 = v8;
    v41 = v7;
    v42 = v6;
    uint64_t v18 = *(void *)v45;
    while (2)
    {
      for (i = 0LL; i != v17; i = (os_log_s *)((char *)i + 1))
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "componentsSeparatedByString:", @".", v38, v39, v40, v41));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

        if ([v20 hasSuffix:@"sqlite"]
          && -[__CFString hasPrefix:](v22, "hasPrefix:", @"NWActivity_"))
        {
          if (a3)
          {
            id v23 = WALogCategoryDefaultHandle();
            v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              __int16 v52 = 1024;
              int v53 = 106;
              __int16 v54 = 2048;
              v55 = (const __CFString *)a3;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unsupported Group %ld",  buf,  0x1Cu);
            }
          }

          else if (-[__CFString hasSuffix:](v22, "hasSuffix:", @"cdf_allActivities"))
          {
            id v25 = WALogCategoryDefaultHandle();
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446722;
              v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
              __int16 v52 = 1024;
              int v53 = 99;
              __int16 v54 = 2112;
              v55 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Found file %@",  buf,  0x1Cu);
            }

            uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v20));
            id v6 = v42;
            backingStore = v42->backingStore;
            v42->backingStore = (NSString *)v26;

            uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v22));
            sqlTable = v42->sqlTable;
            v42->sqlTable = (NSString *)v28;

            LODWORD(v17) = 1;
            goto LABEL_24;
          }
        }
      }

      id v17 = (os_log_s *)-[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
      if (v17) {
        continue;
      }
      break;
    }

    id v6 = v42;
LABEL_24:
    id v8 = v40;
    v7 = v41;
    __int16 v14 = v38;
    int v13 = v39;
  }

  int v30 = 1;
LABEL_26:

  objc_autoreleasePoolPop(v7);
  if (!v30)
  {
LABEL_32:
    v31 = 0LL;
    goto LABEL_33;
  }

  if (!(_DWORD)v17)
  {
LABEL_29:
    id v32 = WALogCategoryDefaultHandle();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v51 = "-[NWActivityDistributionStoreDescriptor _initWithGroupAndOptions:groupTarget:]";
      __int16 v52 = 1024;
      int v53 = 112;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to find distribution",  buf,  0x12u);
    }

    goto LABEL_32;
  }

  v31 = v6;
LABEL_33:

  return v31;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", self->backingStore));
  [v3 addEntriesFromDictionary:&off_1000DFF30];
  storeProt = self->storeProt;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  id v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  NSSQLitePragmasOption,  storeProt,  NSPersistentStoreFileProtectionKey,  v5,  NSMigratePersistentStoresAutomaticallyOption,  v6,  NSInferMappingModelAutomaticallyOption,  v7,  NSReadOnlyPersistentStoreOption,  0LL));

  storeKind = self->storeKind;
  id v16 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [0 addPersistentStoreWithType:storeKind configuration:0 URL:v15 options:v9 error:&v16]);
  id v12 = v16;

  if (v11)
  {
    persistentStoreCoordinator = self->__persistentStoreCoordinator;
    self->__persistentStoreCoordinator = 0LL;
  }

  return 0LL;
}

- (void)findInterpolatedPercentileFromWiFiStats:(id)a3 andReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  ppDb = 0LL;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v9 = &AnalyticsSendEventLazy_ptr;
  id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/System/Library/PrivateFrameworks/WiFiAnalytics.framework/%@", self->backingStore));
  if (sqlite3_open_v2((const char *)[v10 UTF8String], &ppDb, 1, 0))
  {
    sqlite3_close_v2(ppDb);
    id v11 = WALogCategoryDefaultHandle();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = sqlite3_errmsg(ppDb);
      id v14 = [v10 UTF8String];
      *(_DWORD *)buf = 136446978;
      v63 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
      __int16 v64 = 1024;
      int v65 = 166;
      __int16 v66 = 2080;
      v67 = v13;
      __int16 v68 = 2080;
      id v69 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Failed to open database with message '%s' for file %s",  buf,  0x26u);
    }

    NSErrorUserInfoKey v71 = NSLocalizedFailureReasonErrorKey;
    v72 = @"WAErrorCodeSQLiteNotOK";
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v72,  &v71,  1LL));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifi.analytics.errordomain",  9020LL,  v15));

    v7[2](v7, 0LL, v16);
  }

  else
  {
    id v38 = v10;
    v39 = v7;
    context = objc_autoreleasePoolPush();
    bzero(buf, 0x320uLL);
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v40 = v6;
    id v17 = v6;
    id v42 = [v17 countByEnumeratingWithState:&v43 objects:v61 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(v17);
          }
          uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v19]);
          [v20 doubleValue];
          double v22 = v21;
          id v23 = v9;
          v24 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v9[115],  "stringWithFormat:",  @"SELECT %@ from %@;",
                            v19,
                            self->sqlTable));
          id v25 = ppDb;
          id v26 = v24;
          int v27 = sqlite3_prepare_v2(v25, (const char *)[v26 UTF8String], -1, &ppStmt, 0);
          if (v27)
          {
            int v28 = v27;
            id v29 = WALogCategoryDefaultHandle();
            int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              backingStore = self->backingStore;
              sqlTable = self->sqlTable;
              *(_DWORD *)v49 = 136447490;
              v50 = "-[NWActivityDistributionStoreDescriptor findInterpolatedPercentileFromWiFiStats:andReply:]";
              __int16 v51 = 1024;
              int v52 = 187;
              __int16 v53 = 2112;
              uint64_t v54 = v19;
              __int16 v55 = 2112;
              v56 = backingStore;
              __int16 v57 = 2112;
              v58 = sqlTable;
              __int16 v59 = 1024;
              int v60 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Parameter %@ not found in file %@ table %@ returned %d",  v49,  0x36u);
            }

            v9 = v23;
          }

          else
          {
            uint64_t v33 = 0LL;
            while (sqlite3_step(ppStmt) == 100)
            {
              double v34 = sqlite3_column_double(ppStmt, 0);
              *(double *)&v70[8 * v33] = v34;
              if (v22 >= v34)
              {
                double v35 = 99.0;
                if ((v33 + 100) <= 0x63) {
                id v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
                }
                -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v36, v19);

                break;
              }

              if (--v33 == -99) {
                break;
              }
            }

            sqlite3_finalize(ppStmt);
          }
        }

        id v42 = [v17 countByEnumeratingWithState:&v43 objects:v61 count:16];
      }

      while (v42);
    }

    objc_autoreleasePoolPop(context);
    v7 = v39;
    ((void (**)(id, NSMutableDictionary *, void *))v39)[2](v39, v8, 0LL);
    id v6 = v40;
    id v10 = v38;
  }
}

- (void).cxx_destruct
{
}

@end
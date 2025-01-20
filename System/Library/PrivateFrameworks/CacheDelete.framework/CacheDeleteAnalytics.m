@interface CacheDeleteAnalytics
+ (id)buildType;
+ (id)currentSystemInfo;
+ (id)getLowDiskLevelFromPurgeResult:(id)a3;
- (BOOL)isRootVolume:(id)a3;
- (CDPurgeableResultCache)purgeableResultCache;
- (CacheDeleteAnalytics)initWithServiceProvider:(id)a3 withPurgeableResultCache:(id)a4;
- (CacheDeleteServiceProvider)serviceProvider;
- (NSMutableDictionary)dailyStats;
- (OS_dispatch_queue)serialQueue;
- (PowerLogger)powerLogger;
- (PurgeStatsReporter)purgeStatReporter;
- (const)stringForTime:(double)a3;
- (const)stringForUrgency:(int)a3;
- (double)machTimeToSeconds:(unint64_t)a3;
- (double)round:(double)a3 toSignificantDigits:(int)a4;
- (double)secondsFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)cacheManagementUsageStats;
- (id)dailyPurgeableStats:(BOOL)a3;
- (id)fetchAdditionalStats;
- (id)fetchApplicationUsageStats;
- (id)fetchLowDiskStats;
- (id)fetchStorageStats;
- (id)fetchTimingStats:(id)a3;
- (id)persistPath;
- (id)roundNumber:(id)a3 toSignificantDigits:(int)a4;
- (id)systemUsageStats;
- (unint64_t)nandSize;
- (void)_addDailyStats:(id)a3;
- (void)_postDailyStats:(id)a3;
- (void)_reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)_reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5;
- (void)_reportPurgeTimingInfo:(id)a3;
- (void)_reportPurgeableTimingInfo:(id)a3;
- (void)_reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)addDailyStats:(id)a3;
- (void)addDailyValueForKey:(id)a3 value:(double)a4;
- (void)anonymizeAndFlush:(id)a3 name:(id)a4;
- (void)clear;
- (void)incrementDailyValueForKey:(id)a3;
- (void)load:(id)a3;
- (void)postDailyStats:(id)a3;
- (void)processPeriodicOperationResult:(id)a3;
- (void)processPurgeOperationResult:(id)a3;
- (void)processPurgeableOperationResult:(id)a3;
- (void)reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5;
- (void)reportPeriodic:(id)a3;
- (void)reportPurge:(id)a3;
- (void)reportPurgeTimingInfo:(id)a3;
- (void)reportPurgeable:(id)a3;
- (void)reportPurgeableTimingInfo:(id)a3;
- (void)reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4;
- (void)save;
- (void)sendAppCacheStats:(id)a3;
- (void)sendCAEvent:(id)a3 key:(id)a4 value:(id)a5 value2:(id)a6;
- (void)sendPurgeableAmountStats;
- (void)setDailyStats:(id)a3;
- (void)setPowerLogger:(id)a3;
- (void)setPurgeStatReporter:(id)a3;
- (void)setPurgeableResultCache:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServiceProvider:(id)a3;
@end

@implementation CacheDeleteAnalytics

- (CacheDeleteAnalytics)initWithServiceProvider:(id)a3 withPurgeableResultCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CacheDeleteAnalytics;
  v8 = -[CacheDeleteAnalytics init](&v26, "init");
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[CacheDeleteAnalytics setDailyStats:](v8, "setDailyStats:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](v8, "dailyStats"));
    [v11 setObject:v10 forKeyedSubscript:@"DateStarted"];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cache_delete.analytics", 0LL);
    -[CacheDeleteAnalytics setSerialQueue:](v8, "setSerialQueue:", v12);

    -[CacheDeleteAnalytics setPurgeableResultCache:](v8, "setPurgeableResultCache:", v7);
    -[CacheDeleteAnalytics setServiceProvider:](v8, "setServiceProvider:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PowerLogger sharedLogger](&OBJC_CLASS___PowerLogger, "sharedLogger"));
    -[CacheDeleteAnalytics setPowerLogger:](v8, "setPowerLogger:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics powerLogger](v8, "powerLogger"));
    if (!v14)
    {
      uint64_t v15 = CDGetLogHandle("daemon");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No power log support.", v25, 2u);
      }
    }

    v17 = objc_alloc(&OBJC_CLASS___PurgeStatsReporter);
    uint64_t v19 = cdCachesPath(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:@"CDPurgeStats"]);
    v22 = -[PurgeStatsReporter initWithPath:](v17, "initWithPath:", v21);
    -[CacheDeleteAnalytics setPurgeStatReporter:](v8, "setPurgeStatReporter:", v22);

    v8->_nandSize = copyNANDSizeBytes(v23);
  }

  return v8;
}

- (id)persistPath
{
  uint64_t v2 = cdCachesPath(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"CacheDeleteAnalytics.plist"]);
  }

  else
  {
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Unable to get persistPath to save analytics!",  v9,  2u);
    }

    v5 = 0LL;
  }

  return v5;
}

- (void)save
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __28__CacheDeleteAnalytics_save__block_invoke;
  block[3] = &unk_100058BB0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __28__CacheDeleteAnalytics_save__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistPath]);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dailyStats]);
    unsigned __int8 v4 = [v3 writeToFile:v2 atomically:0];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = CDGetLogHandle("daemon");
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed to persist CacheDelete analytic data!",  v7,  2u);
      }
    }
  }
}

- (void)load:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __29__CacheDeleteAnalytics_load___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __29__CacheDeleteAnalytics_load___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistPath]);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v2));
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 mutableCopy];
      [*(id *)(a1 + 32) setDailyStats:v5];

      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dailyStats]);
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DateStarted"]);

      if (!v7
        || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v7, v8) & 1) == 0)
        || (v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
            [v9 timeIntervalSinceDate:v7],
            double v11 = v10,
            v9,
            v11 >= 86400.0))
      {
        [*(id *)(a1 + 32) _postDailyStats:*(void *)(a1 + 40)];
      }
    }

    else
    {
      uint64_t v12 = CDGetLogHandle("daemon");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Did not load CacheDelete analytic data",  v16,  2u);
      }

      v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      [*(id *)(a1 + 32) setDailyStats:v14];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dailyStats]);
      [v15 setObject:v7 forKeyedSubscript:@"DateStarted"];
    }
  }
}

- (void)clear
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics persistPath](self, "persistPath"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v18 = 0LL;
    unsigned int v6 = [v5 removeItemAtPath:v4 error:&v18];
    id v7 = v18;

    if (v6) {
      BOOL v8 = v7 == 0LL;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      goto LABEL_14;
    }
    NSErrorDomain v9 = (NSErrorDomain)objc_claimAutoreleasedReturnValue([v7 domain]);
    NSErrorDomain v10 = v9;
    if (v9 == NSPOSIXErrorDomain)
    {
      id v11 = [v7 code];

      if (v11 == (id)2)
      {
        uint64_t v12 = CDGetLogHandle("daemon");
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "No file to remove at %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }

    else
    {
    }

    uint64_t v14 = CDGetLogHandle("daemon");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to remove file at %@: %@",  buf,  0x16u);
    }

- (void)addDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __38__CacheDeleteAnalytics_addDailyStats___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __38__CacheDeleteAnalytics_addDailyStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDailyStats:*(void *)(a1 + 40)];
}

- (void)postDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__CacheDeleteAnalytics_postDailyStats___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

id __39__CacheDeleteAnalytics_postDailyStats___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postDailyStats:*(void *)(a1 + 40)];
}

- (void)reportPurgeTimingInfo:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __46__CacheDeleteAnalytics_reportPurgeTimingInfo___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

id __46__CacheDeleteAnalytics_reportPurgeTimingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportPurgeTimingInfo:*(void *)(a1 + 40)];
}

- (void)reportPurgeableTimingInfo:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__CacheDeleteAnalytics_reportPurgeableTimingInfo___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

id __50__CacheDeleteAnalytics_reportPurgeableTimingInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportPurgeableTimingInfo:*(void *)(a1 + 40)];
}

+ (id)currentSystemInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__CacheDeleteAnalytics_currentSystemInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_11 != -1) {
    dispatch_once(&_MergedGlobals_11, block);
  }
  return (id)qword_100066780;
}

void __41__CacheDeleteAnalytics_currentSystemInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist"));
  v8[0] = @"systemBuildVersion";
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ProductBuildVersion"]);
  v9[0] = v3;
  v8[1] = @"systemProductName";
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"ProductName"]);
  v9[1] = v4;
  v8[2] = @"systemBuildType";
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) buildType]);
  v9[2] = v5;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  3LL));
  id v7 = (void *)qword_100066780;
  qword_100066780 = v6;
}

+ (id)buildType
{
  else {
    return @"Release";
  }
}

- (id)fetchLowDiskStats
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v37 = [&off_10005D2F8 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v52;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(&off_10005D2F8);
        }
        uint64_t v38 = v4;
        uint64_t v5 = *(void *)(*((void *)&v51 + 1) + 8 * v4);
        __int128 v47 = 0u;
        __int128 v48 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v6 = [&off_10005D310 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v6)
        {
          id v7 = v6;
          id v8 = 0LL;
          uint64_t v9 = *(void *)v48;
          do
          {
            NSErrorDomain v10 = 0LL;
            id v11 = v8;
            do
            {
              if (*(void *)v48 != v9) {
                objc_enumerationMutation(&off_10005D310);
              }
              id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  *(void *)(*((void *)&v47 + 1) + 8LL * (void)v10),  v5));

              uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
              v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

              if (v13)
              {
                uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v8]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, v8);
              }

              NSErrorDomain v10 = (char *)v10 + 1;
              id v11 = v8;
            }

            while (v7 != v10);
            id v7 = [&off_10005D310 countByEnumeratingWithState:&v47 objects:v57 count:16];
          }

          while (v7);
        }

        else
        {
          id v8 = 0LL;
        }

        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v16 = [&off_10005D328 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            uint64_t v19 = 0LL;
            v20 = v8;
            do
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(&off_10005D328);
              }
              id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)v19),  v5));

              __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v8]);

              if (v22)
              {
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v8]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v24, v8);
              }

              uint64_t v19 = (char *)v19 + 1;
              v20 = v8;
            }

            while (v17 != v19);
            id v17 = [&off_10005D328 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }

          while (v17);
        }

        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        id v26 = [v25 countByEnumeratingWithState:&v39 objects:v55 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v40;
          do
          {
            for (i = 0LL; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v25);
              }
              v30 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              if ([v30 hasPrefix:@"lowDiskFunctionalFailure"])
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v30]);

                if (v32)
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:v30]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v34, v30);
                }
              }
            }

            id v27 = [v25 countByEnumeratingWithState:&v39 objects:v55 count:16];
          }

          while (v27);
        }

        uint64_t v4 = v38 + 1;
      }

      while ((id)(v38 + 1) != v37);
      id v37 = [&off_10005D2F8 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }

    while (v37);
  }

  return v3;
}

- (id)fetchStorageStats
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyPurgeableStats:](self, "dailyPurgeableStats:", 1LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);

  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v104 = 0u;
  __int128 v105 = 0u;
  id v102 = [&off_10005D340 countByEnumeratingWithState:&v104 objects:v108 count:16];
  if (v102)
  {
    uint64_t v101 = *(void *)v105;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v105 != v101) {
          objc_enumerationMutation(&off_10005D340);
        }
        id v6 = 0LL;
        uint64_t v103 = v5;
        id v7 = *(void **)(*((void *)&v104 + 1) + 8 * v5);
        uint64_t v8 = 1LL;
        do
        {
          uint64_t v9 = -[CacheDeleteAnalytics stringForUrgency:](self, "stringForUrgency:", v8);
          id v10 = v7;
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgeReqs%s%s",  [v10 UTF8String],  v9));

          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

          if (v13)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v11]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, v11);
          }

          id v16 = v10;
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgeSuccess%s%s",  [v16 UTF8String],  v9));

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v17]);

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
            __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v17]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v21, v17);
          }

          id v22 = v16;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyFSPurgeSuccess%s%s",  [v22 UTF8String],  v9));

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:v23]);

          if (v25)
          {
            id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v23]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v27, v23);
          }

          id v28 = v22;
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgedBytes%s%s",  [v28 UTF8String],  v9));

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v29]);

          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
            v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v29]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v33, v29);
          }

          id v34 = v28;
          id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgedReportedBytes%s%s",  [v34 UTF8String],  v9));

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v6]);

          if (v36)
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
            uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v6]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v38, v6);
          }

          uint64_t v8 = (v8 + 1);
        }

        while ((_DWORD)v8 != 4);
        id v39 = v34;
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgeReqs%s%s",  [v39 UTF8String],  "Tot"));

        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v40]);

        if (v42)
        {
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v40]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v44, v40);
        }

        id v45 = v39;
        __int128 v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgeSuccess%s%s",  [v45 UTF8String],  "Tot"));

        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v46]);

        if (v48)
        {
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKeyedSubscript:v46]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v50, v46);
        }

        id v51 = v45;
        __int128 v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyFSPurgeSuccess%s%s",  [v51 UTF8String],  "Tot"));

        __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        __int128 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKeyedSubscript:v52]);

        if (v54)
        {
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v52]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v56, v52);
        }

        id v57 = v51;
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyPurgedBytes%s%s",  [v57 UTF8String],  "Tot"));

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        v60 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v58]);

        if (v60)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v62 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v58]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v62, v58);
        }

        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"dailyPurgedReportedBytes%s%s", [v57 UTF8String], "Tot"));

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
        v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:v63]);

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:v63]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v67, v63);
        }

        uint64_t v5 = v103 + 1;
      }

      while ((id)(v103 + 1) != v102);
      id v102 = [&off_10005D340 countByEnumeratingWithState:&v104 objects:v108 count:16];
    }

    while (v102);
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:@"dailyActiveTimeS"]);

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:@"dailyActiveTimeS"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v71,  @"dailyActiveTimeS");
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"dailyActiveTimePurgingS"]);

  if (v73)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKeyedSubscript:@"dailyActiveTimePurgingS"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v75,  @"dailyActiveTimePurgingS");
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"dailyNumLowDiskPurges%s"]);

  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKeyedSubscript:@"dailyNumLowDiskPurges%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v79,  @"dailyNumLowDiskPurges%s");
  }

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKeyedSubscript:@"dailyNumLowDiskSuccess%s"]);

  if (v81)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v83 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKeyedSubscript:@"dailyNumLowDiskSuccess%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v83,  @"dailyNumLowDiskSuccess%s");
  }

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:@"dailyNumVeryLowDiskPurges%s"]);

  if (v85)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v87 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:@"dailyNumVeryLowDiskPurges%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v87,  @"dailyNumVeryLowDiskPurges%s");
  }

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKeyedSubscript:@"dailyNumVeryLowDiskSuccess%s"]);

  if (v89)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v91 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKeyedSubscript:@"dailyNumVeryLowDiskSuccess%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v91,  @"dailyNumVeryLowDiskSuccess%s");
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v93 = (void *)objc_claimAutoreleasedReturnValue([v92 objectForKeyedSubscript:@"dailyNumNearLowDiskPurges%s"]);

  if (v93)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v95 = (void *)objc_claimAutoreleasedReturnValue([v94 objectForKeyedSubscript:@"dailyNumNearLowDiskPurges%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v95,  @"dailyNumNearLowDiskPurges%s");
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  v97 = (void *)objc_claimAutoreleasedReturnValue([v96 objectForKeyedSubscript:@"dailyNumNearLowDiskSuccess%s"]);

  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKeyedSubscript:@"dailyNumNearLowDiskSuccess%s"]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v99,  @"dailyNumNearLowDiskSuccess%s");
  }

  return v3;
}

- (id)fetchTimingStats:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyPurgeableStats:](self, "dailyPurgeableStats:", 0LL));
  v35 = v5;
  -[NSMutableDictionary addEntriesFromDictionary:](v5, "addEntriesFromDictionary:", v6);

  v30 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  id v9 = [v8 mutableCopy];

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  id v10 = 0LL;
  if (v33)
  {
    uint64_t v32 = *(void *)v41;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v11;
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        id v13 = [&off_10005D358 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v37;
          do
          {
            id v16 = 0LL;
            do
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(&off_10005D358);
              }
              id v17 = *(id *)(*((void *)&v36 + 1) + 8LL * (void)v16);
              id v18 = [v17 UTF8String];
              id v19 = v12;
              v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purge_time_%s_%s",  v18,  [v19 UTF8String]));

              __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v20]);

              if (v22)
              {
                uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v20]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v24, v20);
              }

              id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"purgeable_time_%s_%s", [v17 UTF8String], objc_msgSend(v19, "UTF8String")));

              v25 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v10]);

              if (v26)
              {
                id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v10]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v28, v10);
              }

              id v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [&off_10005D358 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }

          while (v14);
        }

        uint64_t v11 = v34 + 1;
      }

      while ((id)(v34 + 1) != v33);
      id v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v33);
  }

  return v35;
}

- (id)fetchApplicationUsageStats
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyPurgeableStats:](self, "dailyPurgeableStats:", 0LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);

  return v3;
}

- (id)fetchAdditionalStats
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyPurgeableStats:](self, "dailyPurgeableStats:", 0LL));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics systemUsageStats](self, "systemUsageStats"));
  if (v5) {
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v5);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics cacheManagementUsageStats](self, "cacheManagementUsageStats"));
  if (v6) {
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v6);
  }

  return v3;
}

- (void)sendCAEvent:(id)a3 key:(id)a4 value:(id)a5 value2:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  2LL));
  [v13 setObject:v12 forKey:@"name"];

  if (v10) {
    [v13 setObject:v10 forKey:@"value"];
  }
  if (v11) {
    [v13 setObject:v11 forKey:@"value_level4"];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __53__CacheDeleteAnalytics_sendCAEvent_key_value_value2___block_invoke;
  v15[3] = &unk_1000593D8;
  id v16 = v13;
  id v14 = v13;
  AnalyticsSendEventLazy(v9, v15);
}

id __53__CacheDeleteAnalytics_sendCAEvent_key_value_value2___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendPurgeableAmountStats
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  id v3 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v3)
  {
    id v4 = v3;
    v35 = 0LL;
    uint64_t v5 = 0LL;
    id v6 = @"dailyPurgeReqs";
    uint64_t v7 = *(void *)v39;
    uint64_t v8 = @"dailyPurgeableAmount";
    do
    {
      id v9 = 0LL;
      id v33 = v4;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v9);
        if (([v10 containsString:v6] & 1) != 0
          || ([v10 containsString:@"dailyPurgedBytes"] & 1) != 0
          || [v10 containsString:@"dailyPurgedReportedBytes"])
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);
          -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  v10,  v12,  0LL);
        }

        if ([v10 containsString:v8])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v10]);
          uint64_t v15 = v7;
          id v16 = v8;
          id v17 = v6;
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"LEVEL3"]);

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v10]);
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"LEVEL4"]);

          -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  v10,  v18,  v21);
          v35 = (void *)v21;
          uint64_t v5 = (void *)v18;
          id v6 = v17;
          uint64_t v8 = v16;
          uint64_t v7 = v15;
          id v4 = v33;
        }

        id v9 = (char *)v9 + 1;
      }

      while (v4 != v9);
      id v4 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }

    while (v4);
  }

  else
  {
    v35 = 0LL;
    uint64_t v5 = 0LL;
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
  unsigned int v24 = [v23 containsObject:@"dailyPurgeableAmountTotal"];

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CacheDeleteAnalytics nandSize](self, "nandSize")));
    -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  @"deviceNandSize",  v25,  0LL);

    uint64_t RootVolume = getRootVolume(v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithPath:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithPath:",  v28));

    if (v29)
    {
      uint64_t v36 = 0LL;
      uint64_t v37 = 0LL;
      [v29 containerTotalSize:&v36 andFreespace:&v37];
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v36));
      -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  @"dailyContainerSize",  v30,  0LL);

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v37));
      -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  @"dailyContainerFreespace",  v31,  0LL);

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v29 freespace]));
      -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  @"dailyFreeBytesRoot",  v32,  0LL);
    }
  }
}

- (void)sendAppCacheStats:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (([v9 containsString:@"cacheDir_outHardlinks"] & 1) != 0
          || [v9 containsString:@"cacheDir_size"])
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
          -[CacheDeleteAnalytics sendCAEvent:key:value:value2:]( self,  "sendCAEvent:key:value:value2:",  @"com.apple.cachedelete.purgeablestats",  v9,  v10,  0LL);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }
}

- (void)_addDailyStats:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  [v5 addEntriesFromDictionary:v4];
}

- (void)_postDailyStats:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  [v4 removeObjectForKey:@"DateStarted"];

  -[CacheDeleteAnalytics sendPurgeableAmountStats](self, "sendPurgeableAmountStats");
  if (+[CacheDeleteAnalytics isDataCollectionEnabled](&OBJC_CLASS___CacheDeleteAnalytics, "isDataCollectionEnabled"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics purgeStatReporter](self, "purgeStatReporter"));
    [v5 sendAndResetStats];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics fetchStorageStats](self, "fetchStorageStats"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics fetchTimingStats:](self, "fetchTimingStats:", v10));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics fetchAdditionalStats](self, "fetchAdditionalStats"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics fetchLowDiskStats](self, "fetchLowDiskStats"));
    [v6 addEntriesFromDictionary:v9];
    [v7 addEntriesFromDictionary:v9];
    [v8 addEntriesFromDictionary:v9];
    -[CacheDeleteAnalytics anonymizeAndFlush:name:]( self,  "anonymizeAndFlush:name:",  v6,  @"cacheDeleteDailyStorageReport");
    -[CacheDeleteAnalytics anonymizeAndFlush:name:]( self,  "anonymizeAndFlush:name:",  v7,  @"cacheDeleteDailyTimingReport");
    -[CacheDeleteAnalytics anonymizeAndFlush:name:]( self,  "anonymizeAndFlush:name:",  v8,  @"cacheDeleteDailyAdditionalReport");
  }

  -[CacheDeleteAnalytics clear](self, "clear");
}

- (void)anonymizeAndFlush:(id)a3 name:(id)a4
{
  id v5 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke;
  v12[3] = &unk_100059400;
  v12[4] = self;
  id v6 =  -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
  __int128 v13 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  id v7 = [(id)objc_opt_class(self) currentSystemInfo];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableDictionary addEntriesFromDictionary:](v6, "addEntriesFromDictionary:", v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke_148;
  v10[3] = &unk_100059428;
  __int128 v11 = v6;
  id v9 = v6;
  AnalyticsSendEventLazy(@"com.apple.cachedelete", v10);
}

void __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) roundNumber:v6 toSignificantDigits:2]);
    [v8 doubleValue];
    [*(id *)(a1 + 40) setObject:v8 forKey:v5];
  }

  else
  {
    uint64_t v9 = CDGetLogHandle("daemon");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Not sending %@ to CA as it's not an NSNumber",  (uint8_t *)&v10,  0xCu);
    }
  }
}

id __47__CacheDeleteAnalytics_anonymizeAndFlush_name___block_invoke_148(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_reportPurgeTimingInfo:(id)a3
{
  id v9 = a3;
  -[CacheDeleteAnalytics secondsFrom:to:]( self,  "secondsFrom:to:",  [v9 monotonicBegin],  objc_msgSend(v9, "monotonicEnd"));
  id v4 = -[CacheDeleteAnalytics stringForTime:](self, "stringForTime:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  unsigned __int8 v6 = [v5 isEqualToString:@"OK"];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v9 serviceName]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purge_time_%s_%s",  v4,  [v7 UTF8String]));

    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v8);
  }
}

- (void)_reportPurgeableTimingInfo:(id)a3
{
  id v9 = a3;
  -[CacheDeleteAnalytics secondsFrom:to:]( self,  "secondsFrom:to:",  [v9 monotonicBegin],  objc_msgSend(v9, "monotonicEnd"));
  id v4 = -[CacheDeleteAnalytics stringForTime:](self, "stringForTime:");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
  unsigned __int8 v6 = [v5 isEqualToString:@"OK"];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_claimAutoreleasedReturnValue([v9 serviceName]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purgeable_time_%s_%s",  v4,  [v7 UTF8String]));

    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v8);
  }
}

- (void)reportPurge:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __36__CacheDeleteAnalytics_reportPurge___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __36__CacheDeleteAnalytics_reportPurge___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPurgeOperationResult:*(void *)(a1 + 40)];
}

- (void)reportPurgeable:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __40__CacheDeleteAnalytics_reportPurgeable___block_invoke;
  v7[3] = &unk_100058AA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __40__CacheDeleteAnalytics_reportPurgeable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPurgeableOperationResult:*(void *)(a1 + 40)];
}

- (void)reportPeriodic:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__CacheDeleteAnalytics_reportPeriodic___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

id __39__CacheDeleteAnalytics_reportPeriodic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPeriodicOperationResult:*(void *)(a1 + 40)];
}

- (double)round:(double)a3 toSignificantDigits:(int)a4
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    double v7 = log10(fabs(a3));
    double v8 = __exp10((double)a4 - ceil(v7));
    return round(v8 * a3) / v8;
  }

  return result;
}

- (id)roundNumber:(id)a3 toSignificantDigits:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 doubleValue];
  -[CacheDeleteAnalytics round:toSignificantDigits:](self, "round:toSignificantDigits:", v4);
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
}

- (double)machTimeToSeconds:(unint64_t)a3
{
  if (qword_100066790 != -1) {
    dispatch_once(&qword_100066790, &__block_literal_global_1);
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  a3 / 0x3B9ACA00));
  [v4 doubleValue];
  LODWORD(v5) = dword_100066788;
  LODWORD(v6) = *(_DWORD *)algn_10006678C;
  double v8 = v7 * (double)v5 / (double)v6;

  return v8;
}

void __42__CacheDeleteAnalytics_machTimeToSeconds___block_invoke(id a1)
{
}

- (double)secondsFrom:(unint64_t)a3 to:(unint64_t)a4
{
  return result;
}

- (void)incrementDailyValueForKey:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  unint64_t v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);

  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {

    unint64_t v5 = &off_10005D448;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  (char *)[v5 longValue] + 1));

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)addDailyValueForKey:(id)a3 value:(double)a4
{
  id v13 = a3;
  if (a4 < 0.0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"addDailyValueForKey: Negative value (%f) for total measured bytes in: \"%@\"",  *(void *)&a4,  v13));
    CDSimulateCrash(195890386LL, v6);
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  double v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);

  if (!v8 || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {

    double v8 = &off_10005D4F0;
  }

  [v8 doubleValue];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 + a4));

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics dailyStats](self, "dailyStats"));
  [v12 setObject:v11 forKeyedSubscript:v13];
}

- (const)stringForUrgency:(int)a3
{
  else {
    return (&off_100059530)[a3];
  }
}

- (const)stringForTime:(double)a3
{
  else {
    id v3 = "Verylate";
  }
  else {
    return "Late";
  }
}

- (BOOL)isRootVolume:(id)a3
{
  id v3 = a3;
  uint64_t RootVolume = getRootVolume(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned __int8 v6 = [v3 isEqualToString:v5];

  return v6;
}

- (id)dailyPurgeableStats:(BOOL)a3
{
  BOOL v83 = a3;
  uint64_t RootVolume = getRootVolume(self);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteDaemonVolume volumeWithPath:]( &OBJC_CLASS___CacheDeleteDaemonVolume,  "volumeWithPath:",  v5));

  double v7 = (char *)[v6 freespace];
  id v8 = [v6 size];
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v77 = (unint64_t)v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v8));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  @"dailyTotalBytesRoot");

  v78 = v7;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v11,  @"dailyFreeBytesRoot");

  v88 = self;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CacheDeleteAnalytics nandSize](self, "nandSize")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, @"deviceNandSize");

  unint64_t v13 = 0LL;
  uint64_t v14 = 1LL;
  uint64_t v15 = v6;
  v79 = v6;
  v87 = v9;
  do
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics purgeableResultCache](v88, "purgeableResultCache"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recentInfoForVolume:v15 atUrgency:v14]);

    uint64_t v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"]);
    v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dailyPurgeableBytes%s",  -[CacheDeleteAnalytics stringForUrgency:](v88, "stringForUrgency:", v14)));
    if (v83)
    {
      unint64_t v82 = v13;
      v80 = v19;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v19, v85);
      __int128 v104 = 0u;
      __int128 v105 = 0u;
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      v81 = v18;
      id v20 = v18;
      id v21 = [v20 countByEnumeratingWithState:&v102 objects:v109 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v103;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v103 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v102 + 1) + 8LL * (void)i);
            if (([v25 isEqualToString:@"CACHE_DELETE_VOLUME"] & 1) == 0
              && ([v25 isEqualToString:@"CACHE_DELETE_TOTAL_AVAILABLE"] & 1) == 0)
            {
              uint64_t v26 = -[CacheDeleteAnalytics stringForUrgency:](v88, "stringForUrgency:", v14);
              id v27 = v25;
              uint64_t v9 = v87;
              id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"dailyItemizedPurgeableBytes%s_%s",  v26,  [v27 UTF8String]));
              v29 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v27]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v87, "setObject:forKeyedSubscript:", v29, v28);
            }
          }

          id v22 = [v20 countByEnumeratingWithState:&v102 objects:v109 count:16];
        }

        while (v22);
      }

      uint64_t v15 = v79;
      id v19 = v80;
      uint64_t v18 = v81;
      unint64_t v13 = v82;
    }

    uint64_t v14 = (v14 + 1);
  }

  while ((_DWORD)v14 != 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v30,  @"dailyPurgeableBytesTot");

  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v7[v13]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v31,  @"dailyEffectiveFreeBytesRoot");

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)v13 / (double)v77));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v32,  @"dailyPurgeableOverTotalRatioRoot");

  id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v13 / (double)(v77 - (unint64_t)v78)));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v33,  @"dailyPurgeableOverUsedRatioRoot");

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (double)v13 / (double)(unint64_t)&v78[v13]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v34,  @"dailyPurgeableOverEffectiveFreeRatioRoot");

  uint64_t v35 = lowSpaceVolumes();
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"CD_NEAR_LOW_DISK_EVENT"]);
  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v98 = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v39 = v37;
  id v40 = [v39 countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v99;
    do
    {
      for (j = 0LL; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v99 != v42) {
          objc_enumerationMutation(v39);
        }
        __int128 v44 = *(void **)(*((void *)&v98 + 1) + 8LL * (void)j);
        id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);

        if (v45)
        {
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
          [v38 addObject:v46];
        }
      }

      id v41 = [v39 countByEnumeratingWithState:&v98 objects:v108 count:16];
    }

    while (v41);
  }

  v89 = v38;
  v84 = v39;

  __int128 v47 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"CD_LOWDISK_EVENT"]);
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  id v49 = v47;
  id v50 = [v49 countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v50)
  {
    id v51 = v50;
    uint64_t v52 = *(void *)v95;
    do
    {
      for (k = 0LL; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v95 != v52) {
          objc_enumerationMutation(v49);
        }
        __int128 v54 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)k);
        v55 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);

        if (v55)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
          [v48 addObject:v56];
        }
      }

      id v51 = [v49 countByEnumeratingWithState:&v94 objects:v107 count:16];
    }

    while (v51);
  }

  v86 = v36;
  id v57 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"CD_VERYLOWDISK_EVENT"]);
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  id v59 = v57;
  id v60 = [v59 countByEnumeratingWithState:&v90 objects:v106 count:16];
  if (v60)
  {
    id v61 = v60;
    uint64_t v62 = *(void *)v91;
    do
    {
      for (m = 0LL; m != v61; m = (char *)m + 1)
      {
        if (*(void *)v91 != v62) {
          objc_enumerationMutation(v59);
        }
        v64 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)m);
        v65 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);

        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue([v64 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
          [v58 addObject:v66];
        }
      }

      id v61 = [v59 countByEnumeratingWithState:&v90 objects:v106 count:16];
    }

    while (v61);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue([v79 mountPoint]);
  unsigned int v68 = [v89 containsObject:v67];

  if (v68) {
    v69 = &off_10005D500;
  }
  else {
    v69 = &off_10005D4F0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v87,  "setObject:forKeyedSubscript:",  v69,  @"dailyIsNearLowDiskRoot");
  v70 = (void *)objc_claimAutoreleasedReturnValue([v79 mountPoint]);
  unsigned int v71 = [v48 containsObject:v70];

  if (v71) {
    v72 = &off_10005D500;
  }
  else {
    v72 = &off_10005D4F0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v87,  "setObject:forKeyedSubscript:",  v72,  @"dailyIsLowDiskRoot");
  v73 = (void *)objc_claimAutoreleasedReturnValue([v79 mountPoint]);
  unsigned int v74 = [v58 containsObject:v73];

  if (v74) {
    v75 = &off_10005D500;
  }
  else {
    v75 = &off_10005D4F0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v87,  "setObject:forKeyedSubscript:",  v75,  @"dailyIsVeryLowDiskRoot");

  return v87;
}

- (id)systemUsageStats
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serviceProvider](self, "serviceProvider"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceWithID:@"com.apple.mobile.cache_delete_daily"]);

  if (v32)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    dispatch_time_t v4 = dispatch_time(0LL, 120000000000LL);
    *(void *)__int128 v48 = 0LL;
    id v49 = v48;
    uint64_t v50 = 0x3032000000LL;
    id v51 = __Block_byref_object_copy__0;
    uint64_t v52 = __Block_byref_object_dispose__0;
    id v53 = 0LL;
    uint64_t v5 = CDGetLogHandle("daemon");
    unsigned __int8 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Requesting analytic data from daily service",  buf,  2u);
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = __40__CacheDeleteAnalytics_systemUsageStats__block_invoke;
    v45[3] = &unk_100059470;
    __int128 v47 = v48;
    double v7 = v3;
    __int128 v46 = v7;
    [v32 serviceCallback:&off_10005D110 replyBlock:v45];
    oslog = (os_log_s *)v7;
    if (dispatch_semaphore_wait(v7, v4))
    {
      uint64_t v35 = (NSMutableDictionary *)&off_10005D138;
LABEL_17:

      _Block_object_dispose(v48, 8);
      goto LABEL_18;
    }

    uint64_t v9 = (void *)*((void *)v49 + 5);
    if (!v9)
    {
      uint64_t v35 = 0LL;
      goto LABEL_17;
    }

    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
    if (v10)
    {
    }

    else
    {
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v49 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"]);
      BOOL v14 = v13 == 0LL;

      if (!v14)
      {
        uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v49 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"]);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id obj = v15;
        id v31 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
        if (v31)
        {
          uint64_t v29 = *(void *)v42;
          do
          {
            id v33 = 0LL;
            do
            {
              if (*(void *)v42 != v29) {
                objc_enumerationMutation(obj);
              }
              id v16 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v33);
              __int128 v37 = 0u;
              __int128 v38 = 0u;
              __int128 v39 = 0u;
              __int128 v40 = 0u;
              id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v16, v29, oslog));
              id v18 = [v17 countByEnumeratingWithState:&v37 objects:v56 count:16];
              if (v18)
              {
                uint64_t v19 = *(void *)v38;
                id v34 = v17;
                do
                {
                  id v20 = 0LL;
                  do
                  {
                    if (*(void *)v38 != v19) {
                      objc_enumerationMutation(v34);
                    }
                    id v21 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v20);
                    id v22 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v16]);
                    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v21]);
                    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v16 capitalizedString]);
                    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingString:@"_"]);
                    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 capitalizedString]);
                    id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 stringByAppendingString:v26]);
                    -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v23, v27);

                    id v20 = (char *)v20 + 1;
                  }

                  while (v18 != v20);
                  id v17 = v34;
                  id v18 = [v34 countByEnumeratingWithState:&v37 objects:v56 count:16];
                }

                while (v18);
              }

              id v33 = (char *)v33 + 1;
            }

            while (v33 != v31);
            id v31 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
          }

          while (v31);
        }

        goto LABEL_15;
      }
    }

    uint64_t v11 = CDGetLogHandle("daemon");
    id obj = (id)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)obj, OS_LOG_TYPE_ERROR))
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v49 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ERROR"]);
      *(_DWORD *)buf = 138412290;
      v55 = v28;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)obj,  OS_LOG_TYPE_ERROR,  "Failed to get system usage stats! %@",  buf,  0xCu);
    }

    uint64_t v35 = 0LL;
LABEL_15:

    goto LABEL_17;
  }

  uint64_t v8 = CDGetLogHandle("daemon");
  oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__int128 v48 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Cannot find cache_delete_daily service!",  v48,  2u);
  }

  uint64_t v35 = 0LL;
LABEL_18:

  return v35;
}

void __40__CacheDeleteAnalytics_systemUsageStats__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received response from daily service analytics data request",  v9,  2u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)cacheManagementUsageStats
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serviceProvider](self, "serviceProvider"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serviceWithID:@"com.apple.mobile.cache_delete_managed_assets"]);

  if (v3)
  {
    v43[0] = @"CACHE_DELETE_OPERATIONS";
    __int128 v41 = @"CACHE_DELETE_ANALYTICS_REPORT";
    __int128 v39 = @"CACHE_DELETE_VOLUME";
    uint64_t RootVolume = getRootVolume(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
    __int128 v40 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    __int128 v42 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    v43[1] = @"CACHE_DELETE_QOS";
    v44[0] = v8;
    v44[1] = &off_10005D460;
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    dispatch_time_t v11 = dispatch_time(0LL, 120000000000LL);
    *(void *)id v31 = 0LL;
    uint64_t v32 = v31;
    uint64_t v33 = 0x3032000000LL;
    id v34 = __Block_byref_object_copy__0;
    uint64_t v35 = __Block_byref_object_dispose__0;
    id v36 = 0LL;
    uint64_t v12 = CDGetLogHandle("daemon");
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Requesting analytic data from cache management service",  buf,  2u);
    }

    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    id v27 = __49__CacheDeleteAnalytics_cacheManagementUsageStats__block_invoke;
    id v28 = &unk_100059470;
    v30 = v31;
    BOOL v14 = v10;
    uint64_t v29 = v14;
    [v3 serviceCallback:v9 replyBlock:&v25];
    if (dispatch_semaphore_wait(v14, v11))
    {
      uint64_t v15 = &off_10005D160;
    }

    else
    {
      id v17 = (void *)*((void *)v32 + 5);
      if (v17)
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", @"CACHE_DELETE_ERROR", v25, v26, v27, v28));
        if (v18)
        {
        }

        else
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v32 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"]);
          BOOL v21 = v20 == 0LL;

          if (!v21)
          {
            uint64_t v22 = CDGetLogHandle("daemon");
            uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue( [*((id *)v32 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"]);
              *(_DWORD *)buf = 138412290;
              __int128 v38 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received %@", buf, 0xCu);
            }

            uint64_t v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( [*((id *)v32 + 5) objectForKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"]);
            goto LABEL_13;
          }
        }
      }

      uint64_t v15 = 0LL;
    }

void __49__CacheDeleteAnalytics_cacheManagementUsageStats__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CDGetLogHandle("daemon");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received response from cache management service analytics data request",  v9,  2u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)getLowDiskLevelFromPurgeResult:(id)a3
{
  id v3 = a3;
  if ([v3 isVeryLowDisk])
  {
    uint64_t v4 = 3LL;
  }

  else if ([v3 isLowDisk])
  {
    uint64_t v4 = 2LL;
  }

  else
  {
    uint64_t v4 = (uint64_t)[v3 isNearLowDisk];
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));

  return v5;
}

- (void)processPurgeOperationResult:(id)a3
{
  id v4 = a3;
  __int128 v97 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics purgeStatReporter](self, "purgeStatReporter"));
  id v96 = [v5 generationNumber];

  id v82 = [v4 monotonicEnd];
  id v81 = [v4 monotonicBegin];
  double v6 = gTimebaseConversion;
  id v7 = [v4 monotonicEnd];
  id v8 = [v4 monotonicBegin];
  double v9 = gTimebaseConversion;
  __int128 v114 = 0u;
  __int128 v115 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeNames]);
  id v11 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v115;
    __int128 v94 = "Root";
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v115 != v12) {
          objc_enumerationMutation(v10);
        }
        if (-[CacheDeleteAnalytics isRootVolume:]( v97,  "isRootVolume:",  *(void *)(*((void *)&v114 + 1) + 8LL * (void)i)))
        {
          char v80 = 1;
          goto LABEL_12;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v114 objects:v125 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    char v80 = 0;
    __int128 v94 = "Ext";
  }

  else
  {
    char v80 = 0;
    __int128 v94 = "Ext";
  }

void __52__CacheDeleteAnalytics_processPurgeOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (double)(unint64_t)[v3 monotonicEnd];
  id v5 = [v3 monotonicBegin];
  double v6 = gTimebaseConversion * (v4 - (double)(unint64_t)v5) / 1000000.0;
  double v7 = v6 / 1000.0;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v3, "urgency"));
  id v9 = objc_claimAutoreleasedReturnValue([v3 serviceName]);
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purge_time_%s_%s",  v8,  [v9 UTF8String]));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6 / 1000.0));
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];

  id v12 = objc_claimAutoreleasedReturnValue([v3 serviceName]);
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purgeRequestedBytes%s%s",  v8,  [v12 UTF8String]));

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 requestedBytes]));
  __int128 v38 = (void *)v13;
  [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v13];

  id v15 = objc_claimAutoreleasedReturnValue([v3 serviceName]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purgeReportedBytes%s%s",  v8,  [v15 UTF8String]));

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 reportedBytes]));
  [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v16];

  id v18 = objc_claimAutoreleasedReturnValue([v3 serviceName]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purgePercentReported%s%s",  v8,  [v18 UTF8String]));

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  round( (double)(unint64_t)[v3 reportedBytes]
  [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:v19];

  if (*(_BYTE *)(a1 + 72) && ([v3 reportedBytes] || v7 > 1.0))
  {
    v39[0] = @"purgeClientProcName";
    double v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) clientProcName]);
    v40[0] = v36;
    v39[1] = @"purgeReportedBytes";
    unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v3 reportedBytes]));
    v40[1] = v35;
    v39[2] = @"purgeLevel";
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 urgency]));
    v40[2] = v21;
    v39[3] = @"purgeTime";
    __int128 v37 = v10;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
    v40[3] = v22;
    v39[4] = @"purgeServiceName";
    id v23 = objc_claimAutoreleasedReturnValue([v3 serviceName]);
    double v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v23 UTF8String]));
    v40[4] = v24;
    v39[5] = @"purgeAttempt";
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(a1 + 64)));
    v40[5] = v25;
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  6LL));
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8LL);
    unsigned int v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    dispatch_semaphore_t v10 = v37;
    if (+[CacheDeleteAnalytics isDataCollectionEnabled](&OBJC_CLASS___CacheDeleteAnalytics, "isDataCollectionEnabled"))
    {
      double v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) purgeStatReporter]);
      [v29 appendAndSaveStats:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v3, "monotonicBegin"));
  double v31 = v30;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerLogger]);
  id v33 = [v3 urgency];
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceName]);
  objc_msgSend( v32,  "logCacheDuetEvent:urgencyLevel:serviceName:startFromUptime:duration:requestedBytes:purgedBytes:",  1,  v33,  v34,  objc_msgSend(v3, "requestedBytes"),  objc_msgSend(v3, "reportedBytes"),  v31,  v7);
}

- (void)processPurgeableOperationResult:(id)a3
{
  id v4 = a3;
  -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", @"dailyPurgeableReqs");
  -[CacheDeleteAnalytics secondsFrom:to:]( self,  "secondsFrom:to:",  [v4 monotonicBegin],  objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  -[CacheDeleteAnalytics addDailyValueForKey:value:]( self,  "addDailyValueForKey:value:",  @"dailyActiveTimePurgeableS");
  -[CacheDeleteAnalytics addDailyValueForKey:value:](self, "addDailyValueForKey:value:", @"dailyActiveTimeS", v6);
  double v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __56__CacheDeleteAnalytics_processPurgeableOperationResult___block_invoke;
  v11[3] = &unk_1000594C0;
  v11[4] = self;
  id v12 = v7;
  dispatch_semaphore_t v10 = v7;
  [v8 enumerateObjectsUsingBlock:v11];

  -[CacheDeleteAnalytics postStatsDictionary:summarize:](self, "postStatsDictionary:summarize:", v10, 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics powerLogger](self, "powerLogger"));
  [v9 flush];
}

void __56__CacheDeleteAnalytics_processPurgeableOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "secondsFrom:to:", objc_msgSend(v4, "monotonicBegin"), objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v8 = objc_claimAutoreleasedReturnValue([v4 serviceName]);
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"purgeable_time_%s_%s",  v7,  [v8 UTF8String]));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v15];

  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v4, "monotonicBegin"));
  double v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerLogger]);
  id v13 = [v4 urgency];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);

  [v12 logCacheDuetEvent:2 urgencyLevel:v13 serviceName:v14 startFromUptime:0 duration:0 requestedBytes:v11 purgedBytes:v6];
}

- (void)processPeriodicOperationResult:(id)a3
{
  id v4 = a3;
  -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", @"dailyPeriodicReqs");
  -[CacheDeleteAnalytics secondsFrom:to:]( self,  "secondsFrom:to:",  [v4 monotonicBegin],  objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  -[CacheDeleteAnalytics addDailyValueForKey:value:]( self,  "addDailyValueForKey:value:",  @"dailyActiveTimePeriodicS");
  -[CacheDeleteAnalytics addDailyValueForKey:value:](self, "addDailyValueForKey:value:", @"dailyActiveTimeS", v6);
  id v7 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
  id v9 = -[NSMutableDictionary initWithCapacity:](v7, "initWithCapacity:", [v8 count]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __55__CacheDeleteAnalytics_processPeriodicOperationResult___block_invoke;
  v13[3] = &unk_1000594E8;
  v13[4] = self;
  BOOL v14 = v9;
  id v12 = v9;
  [v10 enumerateObjectsUsingBlock:v13];

  -[CacheDeleteAnalytics postStatsDictionary:summarize:](self, "postStatsDictionary:summarize:", v12, 1LL);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics powerLogger](self, "powerLogger"));
  [v11 flush];
}

void __55__CacheDeleteAnalytics_processPeriodicOperationResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "secondsFrom:to:", objc_msgSend(v4, "monotonicBegin"), objc_msgSend(v4, "monotonicEnd"));
  double v6 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v8 = objc_claimAutoreleasedReturnValue([v4 serviceName]);
  id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"periodicTimeS%s%s",  v7,  [v8 UTF8String]));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v20];

  id v10 = objc_msgSend(*(id *)(a1 + 32), "stringForUrgency:", objc_msgSend(v4, "urgency"));
  id v11 = objc_claimAutoreleasedReturnValue([v4 serviceName]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"periodicReportedBytes%s%s",  v10,  [v11 UTF8String]));

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v4 reportedPurgedBytes]));
  [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];

  objc_msgSend(*(id *)(a1 + 32), "machTimeToSeconds:", objc_msgSend(v4, "monotonicBegin"));
  double v15 = v14;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) powerLogger]);
  id v17 = [v4 urgency];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceName]);
  id v19 = [v4 reportedPurgedBytes];

  [v16 logCacheDuetEvent:0 urgencyLevel:v17 serviceName:v18 startFromUptime:0 duration:v19 requestedBytes:v15 purgedBytes:v6];
}

- (void)reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __68__CacheDeleteAnalytics_reportReceivedLowDiskNotification_forVolume___block_invoke;
  block[3] = &unk_100058F28;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __68__CacheDeleteAnalytics_reportReceivedLowDiskNotification_forVolume___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportReceivedLowDiskNotification:*(void *)(a1 + 40) forVolume:*(void *)(a1 + 48)];
}

- (void)_reportReceivedLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t RootVolume = getRootVolume(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10) {
    id v11 = "Root";
  }
  else {
    id v11 = "Ext";
  }
  if ([v6 isEqualToString:@"CD_VERYLOWDISK_EVENT"])
  {
    id v12 = @"dailyNumVeryLowDiskEvents";
LABEL_12:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%s", v12, v11));
    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v13);
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%s",  v12,  "All"));
    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v14);

    goto LABEL_13;
  }

  if ([v6 isEqualToString:@"CD_LOWDISK_EVENT"])
  {
    id v12 = @"dailyNumLowDiskEvents";
    goto LABEL_12;
  }

  if ([v6 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"])
  {
    id v12 = @"dailyNumNearLowDiskEvents";
    goto LABEL_12;
  }

  if ([v6 isEqualToString:@"CD_DESIRED_EVENT"])
  {
    id v12 = @"dailyNumDesiredDiskEvents";
    goto LABEL_12;
  }

  uint64_t v15 = CDGetLogHandle("daemon");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unknown low disk event: %@", buf, 0xCu);
  }

LABEL_13:
}

- (void)reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __69__CacheDeleteAnalytics_reportBroadcastLowDiskNotification_forVolume___block_invoke;
  block[3] = &unk_100058F28;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

id __69__CacheDeleteAnalytics_reportBroadcastLowDiskNotification_forVolume___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportBroadcastLowDiskNotification:*(void *)(a1 + 40) forVolume:*(void *)(a1 + 48)];
}

- (void)_reportBroadcastLowDiskNotification:(id)a3 forVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t RootVolume = getRootVolume(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10) {
    id v11 = "Root";
  }
  else {
    id v11 = "Ext";
  }
  if ([v6 isEqualToString:@"CD_VERYLOWDISK_EVENT"])
  {
    id v12 = @"dailyNumVeryLowDiskBroadcasts";
LABEL_12:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%s", v12, v11));
    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v13);
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%s",  v12,  "All"));
    -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v14);

    goto LABEL_13;
  }

  if ([v6 isEqualToString:@"CD_LOWDISK_EVENT"])
  {
    id v12 = @"dailyNumLowDiskBroadcasts";
    goto LABEL_12;
  }

  if ([v6 isEqualToString:@"CD_NEAR_LOW_DISK_EVENT"])
  {
    id v12 = @"dailyNumNearLowDiskBroadcasts";
    goto LABEL_12;
  }

  if ([v6 isEqualToString:@"CD_DESIRED_EVENT"])
  {
    id v12 = @"dailyNumDesiredDiskBroadcasts";
    goto LABEL_12;
  }

  uint64_t v15 = CDGetLogHandle("daemon");
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unknown low disk event: %@", buf, 0xCu);
  }

LABEL_13:
}

- (void)reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CacheDeleteAnalytics serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __74__CacheDeleteAnalytics_reportLowDiskFunctionalFailure_failureType_isRoot___block_invoke;
  block[3] = &unk_100059510;
  block[4] = self;
  id v12 = v8;
  int v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_sync(v9, block);
}

id __74__CacheDeleteAnalytics_reportLowDiskFunctionalFailure_failureType_isRoot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportLowDiskFunctionalFailure:*(void *)(a1 + 40) failureType:*(unsigned int *)(a1 + 48) isRoot:*(unsigned __int8 *)(a1 + 52)];
}

- (void)_reportLowDiskFunctionalFailure:(id)a3 failureType:(int)a4 isRoot:(BOOL)a5
{
  if (a5) {
    id v6 = "Root";
  }
  else {
    id v6 = "Ext";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"lowDiskFunctionalFailure_%d_%s_%s", *(void *)&a4, v6, [a3 UTF8String]));
  uint64_t v8 = CDGetLogHandle("daemon");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_reportLowDiskFunctionalFailure key: %@",  buf,  0xCu);
  }

  -[CacheDeleteAnalytics incrementDailyValueForKey:](self, "incrementDailyValueForKey:", v7);
}

- (CDPurgeableResultCache)purgeableResultCache
{
  return self->_purgeableResultCache;
}

- (void)setPurgeableResultCache:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSMutableDictionary)dailyStats
{
  return self->_dailyStats;
}

- (void)setDailyStats:(id)a3
{
}

- (CacheDeleteServiceProvider)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setServiceProvider:(id)a3
{
}

- (unint64_t)nandSize
{
  return self->_nandSize;
}

- (PurgeStatsReporter)purgeStatReporter
{
  return self->_purgeStatReporter;
}

- (void)setPurgeStatReporter:(id)a3
{
}

- (PowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (void)setPowerLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
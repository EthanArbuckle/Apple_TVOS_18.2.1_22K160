@interface PurgeStatsReporter
+ (BOOL)sendPurgeStatsEventWithKey:(id)a3;
+ (id)statKeys;
- (BOOL)statsAreStale;
- (NSURL)persistenceURL;
- (OS_dispatch_queue)persistenceQueue;
- (PurgeStatsReporter)initWithPath:(id)a3;
- (id)load;
- (unint64_t)generationNumber;
- (void)appendAndSaveStats:(id)a3;
- (void)resetPurgeStats;
- (void)save:(id)a3;
- (void)sendAndResetStats;
- (void)setPersistenceQueue:(id)a3;
@end

@implementation PurgeStatsReporter

- (PurgeStatsReporter)initWithPath:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PurgeStatsReporter;
  v5 = -[PurgeStatsReporter init](&v27, "init");
  if (!v5) {
    goto LABEL_14;
  }
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.CacheDelete.purgeStatReporter", 0LL);
  persistenceQueue = v5->_persistenceQueue;
  v5->_persistenceQueue = (OS_dispatch_queue *)v6;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v4));
  persistenceURL = v5->_persistenceURL;
  v5->_persistenceURL = (NSURL *)v8;

  v10 = v5->_persistenceURL;
  if (!v10)
  {
    uint64_t v17 = CDGetLogHandle("daemon");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to initialize purge stats' persistence path!",  buf,  2u);
    }

    goto LABEL_19;
  }

  id v11 = objc_claimAutoreleasedReturnValue(-[NSURL path](v10, "path"));
  int v12 = access((const char *)[v11 UTF8String], 0);

  if (!v12)
  {
    if (-[PurgeStatsReporter statsAreStale](v5, "statsAreStale"))
    {
      uint64_t v19 = CDGetLogHandle("daemon");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Purge stat reporter found stale stats",  buf,  2u);
      }

      -[PurgeStatsReporter resetPurgeStats](v5, "resetPurgeStats");
    }

    goto LABEL_14;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  &__NSDictionary0__struct,  1LL,  0LL));
  if (!v13)
  {
    id v16 = 0LL;
    goto LABEL_16;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5->_persistenceURL, "path"));
  id v26 = 0LL;
  unsigned __int8 v15 = [v13 writeToFile:v14 options:0 error:&v26];
  id v16 = v26;

  if ((v15 & 1) == 0)
  {
LABEL_16:
    uint64_t v22 = CDGetLogHandle("daemon");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v5->_persistenceURL, "path"));
      *(_DWORD *)buf = 138412802;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "unable to write results to cache file. Data: %@, Path: %@, Error: %@",  buf,  0x20u);
    }

LABEL_19:
    v21 = 0LL;
    goto LABEL_20;
  }

LABEL_14:
  v21 = v5;
LABEL_20:

  return v21;
}

- (void)save:(id)a3
{
  id v4 = a3;
  persistenceQueue = self->_persistenceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __27__PurgeStatsReporter_save___block_invoke;
  block[3] = &unk_100058AA0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)persistenceQueue, block);
}

void __27__PurgeStatsReporter_save___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8LL))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  *(void *)(a1 + 40),  1LL,  0LL));
    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) path]);
      id v9 = 0LL;
      unsigned __int8 v4 = [v2 writeToFile:v3 options:0 error:&v9];
      v5 = (os_log_s *)v9;

      if ((v4 & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      v5 = 0LL;
    }

    uint64_t v7 = CDGetLogHandle("daemon");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to persist purge stats, deleting persistence file if it exists. Error : %@",  buf,  0xCu);
    }

    unlink((const char *)[*(id *)(*(void *)(a1 + 32) + 8) fileSystemRepresentation]);
    goto LABEL_11;
  }

  uint64_t v6 = CDGetLogHandle("daemon");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Weird... no purge stats path to persist to.",  buf,  2u);
  }

- (id)load
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__3;
  int v12 = __Block_byref_object_dispose__3;
  id v13 = 0LL;
  persistenceQueue = self->_persistenceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __26__PurgeStatsReporter_load__block_invoke;
  v7[3] = &unk_100059788;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync((dispatch_queue_t)persistenceQueue, v7);
  v3 = (void *)v9[5];
  if (v3) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = objc_opt_new(&OBJC_CLASS___NSDictionary);
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __26__PurgeStatsReporter_load__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) path]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v2));

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v15 = 0LL;
  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v7,  v3,  &v15));
  id v9 = v15;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (v9 || !*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    uint64_t v12 = CDGetLogHandle("daemon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v3;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to read in purge stats - deleting persistence file. Error: %@, Data: %@, Loaded Stats: %@",  buf,  0x20u);
    }

    unlink((const char *)[*(id *)(*(void *)(a1 + 32) + 8) fileSystemRepresentation]);
  }
}

- (BOOL)statsAreStale
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PurgeStatsReporter load](self, "load"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v2));

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  double v5 = v4;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v6, "setNumberStyle:", 1LL);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    double v9 = v5 + -172800.0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "substringToIndex:",  objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)i), "rangeOfString:", @"_")));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v6, "numberFromString:", v12));

        [v13 doubleValue];
        double v15 = v14;

        if (v15 < v9)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)resetPurgeStats
{
}

- (void)appendAndSaveStats:(id)a3
{
  id v4 = a3;
  if (-[PurgeStatsReporter statsAreStale](self, "statsAreStale")) {
    -[PurgeStatsReporter resetPurgeStats](self, "resetPurgeStats");
  }
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[PurgeStatsReporter load](self, "load"));
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));

  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  uint64_t v7 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lf_%@", v7, v8));

  [v10 setObject:v4 forKeyedSubscript:v9];
  -[PurgeStatsReporter save:](self, "save:", v10);
}

+ (id)statKeys
{
  return &off_10005D370;
}

- (unint64_t)generationNumber
{
  return generationNumber_generation++;
}

- (void)sendAndResetStats
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[PurgeStatsReporter load](self, "load"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v16 allValues]);
  id v20 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    while (2)
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        v3 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v5 = v3;
        id v6 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v22;
          do
          {
            for (j = 0LL; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
              id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PurgeStatsReporter statKeys](&OBJC_CLASS___PurgeStatsReporter, "statKeys"));
              unsigned int v12 = [v11 containsObject:v10];

              if (v12)
              {
                id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, v10);
              }
            }

            id v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
          }

          while (v7);
        }

        if (!+[PurgeStatsReporter sendPurgeStatsEventWithKey:]( &OBJC_CLASS___PurgeStatsReporter,  "sendPurgeStatsEventWithKey:",  v4))
        {
          uint64_t v14 = CDGetLogHandle("daemon");
          double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v30 = "-[PurgeStatsReporter sendAndResetStats]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s : sending of stats to CA seems to have failed (or is not enabled).",  buf,  0xCu);
          }

          goto LABEL_22;
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

+ (BOOL)sendPurgeStatsEventWithKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CDGetLogHandle("daemon");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v12 = "+[PurgeStatsReporter sendPurgeStatsEventWithKey:]";
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s : %@", buf, 0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __49__PurgeStatsReporter_sendPurgeStatsEventWithKey___block_invoke;
  v9[3] = &unk_1000593D8;
  id v10 = v3;
  id v6 = v3;
  char v7 = AnalyticsSendEventLazy(@"com.apple.cacheDelete.purgeStats", v9);

  return v7;
}

id __49__PurgeStatsReporter_sendPurgeStatsEventWithKey___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (void)setPersistenceQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
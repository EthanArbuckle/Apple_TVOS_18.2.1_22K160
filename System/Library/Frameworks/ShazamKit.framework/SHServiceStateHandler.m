@interface SHServiceStateHandler
+ (NSMapTable)globallyScopedWorkers;
+ (OS_dispatch_queue)globalQueue;
- (BOOL)hasRegisteredWorkers;
- (BOOL)service:(id)a3 registerWorker:(id)a4 watchdogTimeout:(double)a5 error:(id *)a6;
- (NSLock)lock;
- (NSMapTable)workers;
- (SHClientCredentials)clientCredentials;
- (SHServiceStateHandler)initWithClientCredentials:(id)a3;
- (id)allWorkersForService:(id)a3;
- (id)registeredWorkerForWorkerID:(id)a3;
- (void)service:(id)a3 unregisterWorker:(id)a4;
- (void)unregisterAllWorkersForService:(id)a3;
@end

@implementation SHServiceStateHandler

- (SHServiceStateHandler)initWithClientCredentials:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SHServiceStateHandler;
  v6 = -[SHServiceStateHandler init](&v18, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v6->_lock;
    v6->_lock = v7;

    objc_storeStrong((id *)&v6->_clientCredentials, a3);
    v9 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  512LL,  0LL);
    workers = v6->_workers;
    v6->_workers = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials attribution](v6->_clientCredentials, "attribution"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    unsigned int v13 = +[SHAttribution requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:]( &OBJC_CLASS___SHAttribution,  "requiresMusicRecognitionSensorActivityAttributionForBundleIdentifier:",  v12);

    if (v13)
    {
      +[SHServiceStateHandlerUtilities registerMusicRecognitionBundleAttribution]( &OBJC_CLASS___SHServiceStateHandlerUtilities,  "registerMusicRecognitionBundleAttribution");
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHClientCredentials attribution](v6->_clientCredentials, "attribution"));
      v15 = v14;
      if (v14) {
        [v14 auditToken];
      }
      else {
        memset(v17, 0, sizeof(v17));
      }
      +[SHServiceStateHandlerUtilities registerBundleAttributionForAuditToken:]( &OBJC_CLASS___SHServiceStateHandlerUtilities,  "registerBundleAttributionForAuditToken:",  v17);
    }
  }

  return v6;
}

+ (NSMapTable)globallyScopedWorkers
{
  if (qword_100088920 != -1) {
    dispatch_once(&qword_100088920, &stru_10006CB68);
  }
  return (NSMapTable *)(id)qword_100088918;
}

+ (OS_dispatch_queue)globalQueue
{
  if (qword_100088930 != -1) {
    dispatch_once(&qword_100088930, &stru_10006CB88);
  }
  return (OS_dispatch_queue *)(id)qword_100088928;
}

- (BOOL)service:(id)a3 registerWorker:(id)a4 watchdogTimeout:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 workerID]);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler registeredWorkerForWorkerID:](self, "registeredWorkerForWorkerID:", v12));

  if (v13)
  {
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[SHCoreError errorWithCode:underlyingError:]( &OBJC_CLASS___SHCoreError,  "errorWithCode:underlyingError:",  106LL,  0LL));
    }
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
    [v14 lock];

    v15 = objc_alloc_init(&OBJC_CLASS___SHWatchdogTimer);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
    [v16 setObject:v15 forKey:v11];

    if (a5 > 0.0)
    {
      id inited = objc_initWeak(&location, v11);
      uint64_t v19 = sh_log_object(inited, v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v30 = v11;
        __int16 v31 = 2048;
        double v32 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Worker %@ started watchdog timer for %f seconds",  buf,  0x16u);
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100003620;
      v26[3] = &unk_10006CBB0;
      objc_copyWeak(&v27, &location);
      -[SHWatchdogTimer startWatchdogTimerForInterval:firedCompletion:]( v15,  "startWatchdogTimerForInterval:firedCompletion:",  v26,  a5);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }

    if ([v11 executionScope] == (id)1)
    {
      v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[SHServiceStateHandler globalQueue]( &OBJC_CLASS___SHServiceStateHandler,  "globalQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000364C;
      block[3] = &unk_10006CBD8;
      id v25 = v11;
      dispatch_sync(v21, block);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
    [v22 unlock];
  }

  return v13 == 0LL;
}

- (void)service:(id)a3 unregisterWorker:(id)a4
{
  id v11 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v5 lock];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);

  [v7 stopWatchdogTimer];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  [v8 removeObjectForKey:v11];

  if ([v11 executionScope] == (id)1)
  {
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SHServiceStateHandler globalQueue](&OBJC_CLASS___SHServiceStateHandler, "globalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000037D8;
    block[3] = &unk_10006CBD8;
    id v13 = v11;
    dispatch_sync(v9, block);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v10 unlock];
}

- (void)unregisterAllWorkersForService:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock", a3));
  [v4 lock];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  [v5 removeAllObjects];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v6 unlock];
}

- (id)allWorkersForService:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock", a3));
  [v4 lock];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  id v6 = [v5 copy];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v7 unlock];

  return v6;
}

- (id)registeredWorkerForWorkerID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v5 lock];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 workerID]);
        unsigned __int8 v12 = [v11 isEqual:v4];

        if ((v12 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
          [v16 unlock];

          id v15 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v13 unlock];

  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_100003B6C;
  id v25 = sub_100003B7C;
  id v26 = 0LL;
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[SHServiceStateHandler globalQueue](&OBJC_CLASS___SHServiceStateHandler, "globalQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100003B84;
  v18[3] = &unk_10006CC00;
  v20 = &v21;
  id v19 = v4;
  dispatch_sync(v14, v18);

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

LABEL_11:
  return v15;
}

- (BOOL)hasRegisteredWorkers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v3 lock];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler workers](self, "workers"));
  BOOL v5 = [v4 count] != 0;

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHServiceStateHandler lock](self, "lock"));
  [v6 unlock];

  return v5;
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (NSMapTable)workers
{
  return self->_workers;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end
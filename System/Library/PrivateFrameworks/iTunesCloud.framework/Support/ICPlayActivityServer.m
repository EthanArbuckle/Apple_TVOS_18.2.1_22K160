@interface ICPlayActivityServer
+ (id)PlayActivityStorageDirectoryPath;
+ (id)sharedInstance;
- (BOOL)_isValidTimeInterval:(double)a3;
- (BOOL)hasPendingPlayEvents;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICPlayActivityServer)init;
- (id)_criteriaDictionaryWithPostFrequency:(double)a3;
- (id)_init;
- (void)_dispatchCompletionHandler:(id)a3 withError:(id)a4;
- (void)_handleFlushRequestNotification:(id)a3;
- (void)_scheduleNextPlayActivityFlushOperationWithCriteria:(id)a3;
- (void)_timeIntervalForNextFlushOperationWithReplyBlock:(id)a3;
- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3;
- (void)insertPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation ICPlayActivityServer

- (ICPlayActivityServer)init
{
  return 0LL;
}

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICPlayActivityServer;
  v2 = -[ICPlayActivityServer init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_flushOperationCount = 0LL;
    v2->_nextFlushPlayActivityFireSyncInterval = 0.0;
    v2->_testNextFlushPlayActivityFireSyncInterval = 0.0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.itunescloudd.playactivityserver", 0LL);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    flushOperationQueue = v3->_flushOperationQueue;
    v3->_flushOperationQueue = v6;

    -[NSOperationQueue setName:]( v3->_flushOperationQueue,  "setName:",  @"com.apple.itunescloudd.CloudPlayActivityServer.flushOperationQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:]( v3->_flushOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
    -[NSOperationQueue setQualityOfService:](v3->_flushOperationQueue, "setQualityOfService:", 17LL);
    v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.itunescloudd.playactivity");
    listener = v3->_listener;
    v3->_listener = v8;

    -[NSXPCListener setDelegate:](v3->_listener, "setDelegate:", v3);
    v10 = objc_alloc_init(&OBJC_CLASS___ICPlayActivityTable);
    table = v3->_table;
    v3->_table = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
    [v12 addObserver:v3 selector:"_handleFlushRequestNotification:" name:@"com.apple.itunescloud.ICPlayActivityFlushInternalTestRequestNotification" object:0];
  }

  return v3;
}

- (void)start
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ....", (uint8_t *)&v4, 0xCu);
  }

  -[NSXPCListener resume](self->_listener, "resume");
  -[ICPlayActivityServer _scheduleNextPlayActivityFlushOperationWithCriteria:]( self,  "_scheduleNextPlayActivityFlushOperationWithCriteria:",  0LL);
}

- (void)stop
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ....", (uint8_t *)&v4, 0xCu);
  }

  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

- (void)flushPendingPlayActivityEventsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  ++self->_flushOperationCount;
  v5 = -[ICFlushPlayActivityEventsOperation initWithPlayActivityTable:]( objc_alloc(&OBJC_CLASS___ICFlushPlayActivityEventsOperation),  "initWithPlayActivityTable:",  self->_table);
  objc_initWeak(&location, v5);
  v6 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t flushOperationCount = self->_flushOperationCount;
    double nextFlushPlayActivityFireSyncInterval = self->_nextFlushPlayActivityFireSyncInterval;
    double testNextFlushPlayActivityFireSyncInterval = self->_testNextFlushPlayActivityFireSyncInterval;
    *(_DWORD *)buf = 138544130;
    v20 = self;
    __int16 v21 = 2048;
    int64_t v22 = flushOperationCount;
    __int16 v23 = 2048;
    double v24 = nextFlushPlayActivityFireSyncInterval;
    __int16 v25 = 2048;
    double v26 = testNextFlushPlayActivityFireSyncInterval;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ starting operation for flush play activity events pendingOperationCount %lld, nextFlushPlayActivityFire SyncInterval %f, _testNextFlushPlayActivityFireSyncInterval %f ",  buf,  0x2Au);
  }

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_1000B8F88;
  objc_super v14 = &unk_1001A4D70;
  objc_copyWeak(&v17, &location);
  v15 = self;
  id v10 = v4;
  id v16 = v10;
  -[ICFlushPlayActivityEventsOperation setCompletionBlock:](v5, "setCompletionBlock:", &v11);
  -[NSOperationQueue addOperation:](self->_flushOperationQueue, "addOperation:", v5, v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)insertPlayActivityEvents:(id)a3 shouldFlush:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%{public}@ Recording play activity events: %@",  buf,  0x16u);
  }

  if ([v8 count])
  {
    v11 = self->_table;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v28 = sub_1000B8AF0;
    v29 = sub_1000B8B00;
    id v30 = 0LL;
    v25[0] = 0LL;
    v25[1] = v25;
    v25[2] = 0x2020000000LL;
    char v26 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000B8D28;
    v20[3] = &unk_1001A4D98;
    id v12 = v8;
    id v21 = v12;
    __int16 v23 = v25;
    v13 = v11;
    int64_t v22 = v13;
    double v24 = buf;
    -[ICPlayActivityTable performTransactionWithBlock:](v13, "performTransactionWithBlock:", v20);
    if (CFPreferencesGetAppBooleanValue( @"ShouldDebugLogRecordedEvents",  @"com.apple.PlayActivityFeed",  0LL))
    {
      debugLogOperationQueue = self->_debugLogOperationQueue;
      if (!debugLogOperationQueue)
      {
        v15 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
        id v16 = self->_debugLogOperationQueue;
        self->_debugLogOperationQueue = v15;

        -[NSOperationQueue setMaxConcurrentOperationCount:]( self->_debugLogOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
        -[NSOperationQueue setName:]( self->_debugLogOperationQueue,  "setName:",  @"com.apple.iTunesCloud.ICPlayActivityController.debugLogOperationQueue");
        -[NSOperationQueue setQualityOfService:](self->_debugLogOperationQueue, "setQualityOfService:", 17LL);
        debugLogOperationQueue = self->_debugLogOperationQueue;
      }

      id v17 = debugLogOperationQueue;
      v18 = objc_alloc_init(&OBJC_CLASS___ICPlayActivityDebugLogOperation);
      -[ICPlayActivityDebugLogOperation setPlayActivityEvents:](v18, "setPlayActivityEvents:", v12);
      -[NSOperationQueue addOperation:](v17, "addOperation:", v18);
    }

    if (v6)
    {
      -[ICPlayActivityServer flushPendingPlayActivityEventsWithCompletionHandler:]( self,  "flushPendingPlayActivityEventsWithCompletionHandler:",  v9);
    }

    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000B8EDC;
      v19[3] = &unk_1001A4D48;
      v19[4] = self;
      -[ICPlayActivityServer _timeIntervalForNextFlushOperationWithReplyBlock:]( self,  "_timeIntervalForNextFlushOperationWithReplyBlock:",  v19);
      if (v9) {
        v9[2](v9, 0LL);
      }
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    -[ICPlayActivityServer _dispatchCompletionHandler:withError:]( self,  "_dispatchCompletionHandler:withError:",  v9,  0LL);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  BOOL v7 = sub_1000B1A6C(v5, @"com.apple.itunesstored.private");
  if (v7)
  {
    os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICPlayActivityServerProtocol));
    [v5 setExportedInterface:v8];
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
    id v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  objc_opt_class(&OBJC_CLASS___ICPlayActivityEvent, v11),  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v8,  "setClasses:forSelector:argumentIndex:ofReply:",  v13,  "insertPlayActivityEvents:shouldFlush:withCompletionHandler:",  0LL,  0LL);

    [v5 setExportedObject:self];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000B8BA8;
    v19[3] = &unk_1001A6D98;
    v19[4] = self;
    unsigned int v20 = v6;
    [v5 setInterruptionHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000B8C68;
    v17[3] = &unk_1001A6D98;
    v17[4] = self;
    unsigned int v18 = v6;
    [v5 setInvalidationHandler:v17];
    [v5 resume];
  }

  else
  {
    os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      int64_t v22 = self;
      __int16 v23 = 1024;
      unsigned int v24 = v6;
      __int16 v25 = 2080;
      char v26 = "com.apple.itunescloudd.playactivity";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ pid %i is not entitled to connect to %s",  buf,  0x1Cu);
    }
  }

  objc_super v14 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = "will not";
    *(_DWORD *)buf = 138543874;
    int64_t v22 = self;
    if (v7) {
      v15 = "will";
    }
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    __int16 v25 = 2080;
    char v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ connection from pid %i %s be accepted",  buf,  0x1Cu);
  }

  return v7;
}

- (void)_handleFlushRequestNotification:(id)a3
{
  if (MSVDeviceOSIsInternalInstall(self)) {
    -[ICPlayActivityServer flushPendingPlayActivityEventsWithCompletionHandler:]( self,  "flushPendingPlayActivityEventsWithCompletionHandler:",  0LL);
  }
}

- (void)_dispatchCompletionHandler:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000B8B64;
    v9[3] = &unk_1001A6BB8;
    id v11 = v6;
    id v10 = v7;
    dispatch_async(queue, v9);
  }
}

- (BOOL)hasPendingPlayEvents
{
  v2 = self->_table;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_1000B8AF0;
  v10[4] = sub_1000B8B00;
  id v11 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000B8B08;
  v6[3] = &unk_1001A4DC0;
  v3 = v2;
  id v7 = v3;
  os_log_t v8 = &v12;
  uint64_t v9 = v10;
  -[ICPlayActivityTable performTransactionWithBlock:](v3, "performTransactionWithBlock:", v6);
  char v4 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v4;
}

- (void)_timeIntervalForNextFlushOperationWithReplyBlock:(id)a3
{
  char v4 = (void (**)(void, double))a3;
  uint64_t v13 = 0LL;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0x408C200000000000LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  if (v5)
  {
    id v6 = -[ICStoreRequestContext initWithIdentity:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithIdentity:",  v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000B890C;
    v10[3] = &unk_1001A4DE8;
    uint64_t v12 = &v13;
    v10[4] = self;
    id v11 = v4;
    [v7 getBagForRequestContext:v6 withCompletionHandler:v10];
  }

  else
  {
    os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *((void *)v14 + 3);
      *(_DWORD *)buf = 138543618;
      unsigned int v18 = self;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ No active user identity - using default value (%f) to update the criteria to flush play activity events",  buf,  0x16u);
    }

    if (v4) {
      v4[2](v4, v14[3]);
    }
  }

  _Block_object_dispose(&v13, 8);
}

- (id)_criteriaDictionaryWithPostFrequency:(double)a3
{
  if (self->_nextFlushPlayActivityFireSyncInterval == 0.0 && self->_testNextFlushPlayActivityFireSyncInterval == 0.0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    os_log_t v6 = (os_log_t)objc_claimAutoreleasedReturnValue([v5 dateByAddingTimeInterval:a3]);

    -[os_log_s timeIntervalSinceNow](v6, "timeIntervalSinceNow");
    double v8 = v7;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:", 900.0));
    [v9 timeIntervalSince1970];
    self->_double testNextFlushPlayActivityFireSyncInterval = v10;

    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REPEATING, 0);
    xpc_dictionary_set_int64(v11, XPC_ACTIVITY_DELAY, (uint64_t)v8);
    xpc_dictionary_set_int64(v11, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_15_MIN);
    xpc_dictionary_set_string(v11, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_double( v11,  "CloudPlayActivityListenerNextFlushPlayActivityFireDateKey",  (double)(uint64_t)self->_testNextFlushPlayActivityFireSyncInterval);
    uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  self->_testNextFlushPlayActivityFireSyncInterval));
      int v17 = 138543874;
      unsigned int v18 = self;
      __int16 v19 = 2114;
      double v20 = *(double *)&v6;
      __int16 v21 = 2114;
      double v22 = *(double *)&v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Creating new criteria to fire on %{public}@ with grace period till %{public}@",  (uint8_t *)&v17,  0x20u);
    }
  }

  else
  {
    os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "PlayActivity");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double nextFlushPlayActivityFireSyncInterval = self->_nextFlushPlayActivityFireSyncInterval;
      double testNextFlushPlayActivityFireSyncInterval = self->_testNextFlushPlayActivityFireSyncInterval;
      int v17 = 138543874;
      unsigned int v18 = self;
      __int16 v19 = 2048;
      double v20 = nextFlushPlayActivityFireSyncInterval;
      __int16 v21 = 2048;
      double v22 = testNextFlushPlayActivityFireSyncInterval;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Not creating a new criteria for flush play activity events nextFlushPlayActivityFireSyncInterval (%f) , testNextFlushPlayActivityFireSyncInterval (%f)",  (uint8_t *)&v17,  0x20u);
    }

    xpc_object_t v11 = 0LL;
  }

  return v11;
}

- (BOOL)_isValidTimeInterval:(double)a3
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v4 timeIntervalSince1970];
  BOOL v6 = v5 < a3;

  return v6;
}

- (void)_scheduleNextPlayActivityFlushOperationWithCriteria:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B8400;
  v5[3] = &unk_1001A4E10;
  id v6 = a3;
  double v7 = self;
  id v4 = v6;
  xpc_activity_register("com.apple.itunescloudd.flushPlayactivityEventsBackgroundTask", XPC_ACTIVITY_CHECK_IN, v5);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1001DB768 != -1) {
    dispatch_once(&qword_1001DB768, &stru_1001A4CF8);
  }
  return (id)qword_1001DB770;
}

+ (id)PlayActivityStorageDirectoryPath
{
  v2 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v4 = -[NSMutableArray initWithObjects:]( v2,  "initWithObjects:",  CPSharedResourcesDirectory(v2, v3),  @"Library",  @"com.apple.iTunesCloud",  @"play_activity",  0LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v4));

  return v5;
}

@end
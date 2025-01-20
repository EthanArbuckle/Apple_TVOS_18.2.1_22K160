@interface KTOctagonActualOperations
- (BOOL)ckksViewReady:(id)a3 error:(id *)a4;
- (BOOL)getCachedOctagonStatus;
- (KTCKKSProtocol)ckksControlInterface;
- (KTNSDistributedNotificationCenter)notificationCenter;
- (KTNearFutureScheduler)ckksCheckerNFS;
- (KTNearFutureScheduler)nfs;
- (KTOctagonActualOperations)initWithDistributedNotificationCenter:(id)a3 octagonControl:(id)a4 ckksControl:(id)a5 logger:(id)a6;
- (KTOctagonProtocol)octagonControl;
- (NSMutableSet)views;
- (OS_dispatch_queue)queue;
- (TransparencyAnalytics)logger;
- (double)ckksTimeout;
- (id)ckksControl:(id *)a3;
- (id)ckksViewObserver;
- (id)octagonObserver;
- (int)octagonToken;
- (unint64_t)ckksGetKnownBadState:(id)a3;
- (unint64_t)octagonStatus:(id *)a3;
- (unint64_t)octagonTrusted;
- (void)addPassiveMonitorForView:(id)a3;
- (void)checkAllCKKSMonitoredViews;
- (void)checkCKKSAvailable:(id)a3;
- (void)ckksNotify:(id)a3;
- (void)ckksRequestViewSync:(id)a3 complete:(id)a4;
- (void)dealloc;
- (void)manateeChanged;
- (void)setCkksCheckerNFS:(id)a3;
- (void)setCkksControlInterface:(id)a3;
- (void)setCkksTimeout:(double)a3;
- (void)setCkksViewObserver:(id)a3;
- (void)setLogger:(id)a3;
- (void)setNfs:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setOctagonControl:(id)a3;
- (void)setOctagonObserver:(id)a3;
- (void)setOctagonToken:(int)a3;
- (void)setOctagonTrusted:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setViews:(id)a3;
- (void)shutdown;
- (void)triggerActiveMonitorForView:(id)a3;
@end

@implementation KTOctagonActualOperations

- (KTOctagonActualOperations)initWithDistributedNotificationCenter:(id)a3 octagonControl:(id)a4 ckksControl:(id)a5 logger:(id)a6
{
  id v10 = a3;
  v11 = (KTOctagonActualOperations *)a4;
  id v12 = a5;
  id v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___KTOctagonActualOperations;
  v14 = -[KTOctagonActualOperations init](&v39, "init");
  if (v14)
  {
    id location = 0LL;
    objc_initWeak(&location, v14);
    -[KTOctagonActualOperations setCkksTimeout:](v14, "setCkksTimeout:", 2.0);
    -[KTOctagonActualOperations setOctagonToken:](v14, "setOctagonToken:", 0xFFFFFFFFLL);
    -[KTOctagonActualOperations setOctagonTrusted:](v14, "setOctagonTrusted:", 2LL);
    -[KTOctagonActualOperations setLogger:](v14, "setLogger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[KTOctagonActualOperations setViews:](v14, "setViews:", v15);

    dispatch_queue_t v16 = dispatch_queue_create("KTOctagonActualOperations", 0LL);
    -[KTOctagonActualOperations setQueue:](v14, "setQueue:", v16);

    v17 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10018C034;
    v36[3] = &unk_100276D20;
    objc_copyWeak(&v37, &location);
    v18 = -[KTNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v17,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"OctagonPoller",  1000000000LL,  0LL,  0LL,  v36);
    -[KTOctagonActualOperations setNfs:](v14, "setNfs:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations nfs](v14, "nfs"));
    [v13 addNFSReporting:v19];

    v20 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10018C060;
    v34[3] = &unk_100276D20;
    objc_copyWeak(&v35, &location);
    v21 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v20,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"ckksCheckerNFS",  2000000000LL,  3600000000000LL,  0LL,  0LL,  v34,  1.5);
    -[KTOctagonActualOperations setCkksCheckerNFS:](v14, "setCkksCheckerNFS:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](v14, "ckksCheckerNFS"));
    [v13 addNFSReporting:v22];

    -[KTOctagonActualOperations setNotificationCenter:](v14, "setNotificationCenter:", v10);
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](v14, "queue"));
    handler = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    v31 = sub_10018C08C;
    v32 = &unk_100279278;
    objc_copyWeak(&v33, &location);
    notify_register_dispatch("com.apple.security.octagon.trust-status-change", &v14->_octagonToken, v23, &handler);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations notificationCenter](v14, "notificationCenter"));
    [v24 addObserver:v14 selector:"ckksNotify:" name:@"com.apple.security.view-become-ready" object:0];

    if (v11) {
      v25 = v11;
    }
    else {
      v25 = v14;
    }
    -[KTOctagonActualOperations setOctagonControl:](v14, "setOctagonControl:", v25, &v37, handler, v30, v31, v32);
    -[KTOctagonActualOperations setCkksControlInterface:](v14, "setCkksControlInterface:", v12);
    v26 = v14;
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (void)shutdown
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations nfs](self, "nfs"));
  [v3 cancel];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](self, "ckksCheckerNFS"));
  [v4 cancel];

  if (-[KTOctagonActualOperations octagonToken](self, "octagonToken") != -1)
  {
    notify_cancel(-[KTOctagonActualOperations octagonToken](self, "octagonToken"));
    -[KTOctagonActualOperations setOctagonToken:](self, "setOctagonToken:", 0xFFFFFFFFLL);
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations notificationCenter](self, "notificationCenter"));
  [v5 removeObserver:self name:@"com.apple.security.view-become-ready" object:0];
}

- (void)ckksNotify:(id)a3
{
  id v4 = a3;
  if (qword_1002EEC88 != -1) {
    dispatch_once(&qword_1002EEC88, &stru_100286B28);
  }
  id v5 = (os_log_s *)qword_1002EEC90;
  if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View become ready: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"view"]);

  if (v7)
  {
    v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018C37C;
    block[3] = &unk_100278EC8;
    p___int128 buf = &buf;
    block[4] = self;
    id v10 = v7;
    dispatch_sync(v8, block);
  }

  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
    -[KTOctagonActualOperations checkAllCKKSMonitoredViews](self, "checkAllCKKSMonitoredViews");
  }

  _Block_object_dispose(&buf, 8);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KTOctagonActualOperations;
  -[KTOctagonActualOperations dealloc](&v3, "dealloc");
}

- (void)manateeChanged
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations octagonControl](self, "octagonControl"));
  id v4 = [v3 octagonStatus:0];

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10018C4AC;
  v6[3] = &unk_100279400;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(v5, v6);

  if (v4) {
    -[KTOctagonActualOperations checkAllCKKSMonitoredViews](self, "checkAllCKKSMonitoredViews");
  }
}

- (BOOL)getCachedOctagonStatus
{
  if ((id)-[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted") == (id)2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018C794;
    block[3] = &unk_1002777A0;
    block[4] = self;
    v6 = v3;
    id v12 = v6;
    dispatch_async(v5, block);

    if (dispatch_semaphore_wait(v6, 0x3B9ACA00uLL))
    {
      if (qword_1002EEC88 != -1) {
        dispatch_once(&qword_1002EEC88, &stru_100286B68);
      }
      v7 = (os_log_s *)qword_1002EEC90;
      if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "getCachedOctagonStatus: Fetching octagon status timed out",  v10,  2u);
      }
    }

    unint64_t v8 = -[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted");
  }

  else
  {
    unint64_t v8 = -[KTOctagonActualOperations octagonTrusted](self, "octagonTrusted");
  }

  return v8 == 1;
}

- (unint64_t)octagonStatus:(id *)a3
{
  id v3 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
  [v3 setContext:OTDefaultContext];
  id v4 = [[OTClique alloc] initWithContextData:v3];
  id v5 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  [v5 setTimeoutWaitForCKAccount:2000000000];
  id v10 = 0LL;
  id v6 = [v4 fetchCliqueStatus:v5 error:&v10];
  id v7 = v10;
  if (qword_1002EEC88 != -1) {
    dispatch_once(&qword_1002EEC88, &stru_100286B88);
  }
  unint64_t v8 = (os_log_s *)qword_1002EEC90;
  if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    BOOL v12 = v6 == 0LL;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Manatee status is: %{BOOL}d: %@", buf, 0x12u);
  }

  return v6 == 0LL;
}

- (id)ckksControl:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  if (v4)
  {
    id v5 = 0LL;
  }

  else
  {
    id v11 = 0LL;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSControl controlObject:](&OBJC_CLASS___CKKSControl, "controlObject:", &v11));
    id v5 = v11;
    -[KTOctagonActualOperations setCkksControlInterface:](self, "setCkksControlInterface:", v6);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEC98);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  if (!v7)
  {
    if (qword_1002EEC88 != -1) {
      dispatch_once(&qword_1002EEC88, &stru_100286BA8);
    }
    unint64_t v8 = (os_log_s *)qword_1002EEC90;
    if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CKKS have no control: %@", buf, 0xCu);
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControlInterface](self, "ckksControlInterface"));

  return v9;
}

- (BOOL)ckksViewReady:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v24 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v24));
  id v7 = v24;
  if (v6)
  {
    *(void *)v27 = 0LL;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x2020000000LL;
    char v28 = 0;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_10018CE90;
    v20 = &unk_100286C10;
    unint64_t v8 = dispatch_semaphore_create(0LL);
    v21 = v8;
    v23 = v27;
    id v9 = v5;
    id v22 = v9;
    [v6 rpcFastStatus:v9 reply:&v17];
    -[KTOctagonActualOperations ckksTimeout](self, "ckksTimeout", v17, v18, v19, v20);
    dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v11))
    {
      if (qword_1002EEC88 != -1) {
        dispatch_once(&qword_1002EEC88, &stru_100286C30);
      }
      BOOL v12 = (os_log_s *)qword_1002EEC90;
      if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", buf, 2u);
      }
    }

    if (*(_BYTE *)(*(void *)&v27[8] + 24LL))
    {
      BOOL v13 = 1;
    }

    else
    {
      if (qword_1002EEC88 != -1) {
        dispatch_once(&qword_1002EEC88, &stru_100286C50);
      }
      v15 = (os_log_s *)qword_1002EEC90;
      if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v26 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Setting up a new monitor for CKKS: %@",  buf,  0xCu);
      }

      -[KTOctagonActualOperations triggerActiveMonitorForView:](self, "triggerActiveMonitorForView:", v9);
      BOOL v13 = *(_BYTE *)(*(void *)&v27[8] + 24LL) != 0;
    }

    _Block_object_dispose(v27, 8);
  }

  else
  {
    if (qword_1002EEC88 != -1) {
      dispatch_once(&qword_1002EEC88, &stru_100286BC8);
    }
    id v14 = (os_log_s *)qword_1002EEC90;
    if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 138412546;
      *(void *)&v27[4] = v5;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "CKKS have no control, starting watcher: %@: %@",  v27,  0x16u);
    }

    -[KTOctagonActualOperations triggerActiveMonitorForView:](self, "triggerActiveMonitorForView:", v5);
    BOOL v13 = 0;
  }

  return v13;
}

- (void)addPassiveMonitorForView:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D1C8;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)triggerActiveMonitorForView:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D2B8;
  block[3] = &unk_1002777A0;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v5, block);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksCheckerNFS](self, "ckksCheckerNFS"));
  [v6 trigger];
}

- (void)checkAllCKKSMonitoredViews
{
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10018D550;
  v20 = sub_10018D560;
  id v21 = 0LL;
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018D568;
  block[3] = &unk_100284458;
  block[4] = self;
  void block[5] = &v16;
  dispatch_sync(v3, block);

  if (qword_1002EEC88 != -1) {
    dispatch_once(&qword_1002EEC88, &stru_100286C70);
  }
  id v4 = (os_log_s *)(id)qword_1002EEC90;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)v17[5] allObjects]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsJoinedByString:@","]);
    *(_DWORD *)__int128 buf = 138412290;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CKKS checking if views are now available %@",  buf,  0xCu);
  }

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v7 = (id)v17[5];
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[KTOctagonActualOperations checkCKKSAvailable:]( self,  "checkCKKSAvailable:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)i),  (void)v11);
      }

      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }

    while (v8);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)checkCKKSAvailable:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations octagonControl](self, "octagonControl"));
  id v23 = 0LL;
  id v6 = [v5 octagonStatus:&v23];
  id v7 = v23;

  if (v6)
  {
    id v22 = 0LL;
    unsigned __int8 v8 = -[KTOctagonActualOperations ckksViewReady:error:](self, "ckksViewReady:error:", v4, &v22);
    id v9 = v22;
    if ((v8 & 1) != 0)
    {
      double v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations queue](self, "queue"));
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472LL;
      uint64_t v18 = sub_10018D8A4;
      v19 = &unk_1002777A0;
      v20 = self;
      id v11 = v4;
      id v21 = v11;
      dispatch_sync(v10, &v16);

      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksViewObserver](self, "ckksViewObserver", v16, v17, v18, v19, v20));
      if (v12)
      {
        __int128 v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[KTOctagonActualOperations ckksViewObserver]( self,  "ckksViewObserver"));
        ((void (**)(void, id))v13)[2](v13, v11);
      }
    }

    else
    {
      if (qword_1002EEC88 != -1) {
        dispatch_once(&qword_1002EEC88, &stru_100286CB0);
      }
      v15 = (os_log_s *)qword_1002EEC90;
      if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CKKS not available: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    if (qword_1002EEC88 != -1) {
      dispatch_once(&qword_1002EEC88, &stru_100286C90);
    }
    __int128 v14 = (os_log_s *)qword_1002EEC90;
    if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Octagon no longer available, stopping to monitor: %@",  buf,  0xCu);
    }
  }
}

- (void)ckksRequestViewSync:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = 0LL;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v12));
  id v9 = v12;
  if (v8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10018D9C4;
    v10[3] = &unk_100279428;
    id v11 = v7;
    [v8 rpcFetchAndProcessChanges:v6 reply:v10];
  }

  else
  {
    (*((void (**)(id, id, double))v7 + 2))(v7, v9, 600.0);
  }
}

- (unint64_t)ckksGetKnownBadState:(id)a3
{
  id v4 = a3;
  id v23 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTOctagonActualOperations ckksControl:](self, "ckksControl:", &v23));
  id v6 = v23;
  if (v5)
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v22 = 0LL;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10018DCC4;
    v15[3] = &unk_100286D18;
    uint64_t v18 = &v19;
    id v16 = v4;
    unsigned __int8 v8 = v7;
    uint64_t v17 = v8;
    [v5 rpcKnownBadState:v16 reply:v15];
    -[KTOctagonActualOperations ckksTimeout](self, "ckksTimeout");
    dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(v9 * 1000000000.0));
    if (dispatch_semaphore_wait(v8, v10))
    {
      if (qword_1002EEC88 != -1) {
        dispatch_once(&qword_1002EEC88, &stru_100286D38);
      }
      id v11 = (os_log_s *)qword_1002EEC90;
      if (os_log_type_enabled((os_log_t)qword_1002EEC90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CKKS query timed out", v14, 2u);
      }
    }

    unint64_t v12 = v20[3];

    _Block_object_dispose(&v19, 8);
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  return v12;
}

- (double)ckksTimeout
{
  return self->ckksTimeout;
}

- (void)setCkksTimeout:(double)a3
{
  self->ckksTimeout = a3;
}

- (id)octagonObserver
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOctagonObserver:(id)a3
{
}

- (id)ckksViewObserver
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCkksViewObserver:(id)a3
{
}

- (KTNSDistributedNotificationCenter)notificationCenter
{
  return (KTNSDistributedNotificationCenter *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (KTNearFutureScheduler)nfs
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setNfs:(id)a3
{
}

- (KTNearFutureScheduler)ckksCheckerNFS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCkksCheckerNFS:(id)a3
{
}

- (NSMutableSet)views
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setViews:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (KTOctagonProtocol)octagonControl
{
  return (KTOctagonProtocol *)objc_loadWeakRetained((id *)&self->_octagonControl);
}

- (void)setOctagonControl:(id)a3
{
}

- (KTCKKSProtocol)ckksControlInterface
{
  return (KTCKKSProtocol *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCkksControlInterface:(id)a3
{
}

- (int)octagonToken
{
  return self->_octagonToken;
}

- (void)setOctagonToken:(int)a3
{
  self->_octagonToken = a3;
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLogger:(id)a3
{
}

- (unint64_t)octagonTrusted
{
  return self->_octagonTrusted;
}

- (void)setOctagonTrusted:(unint64_t)a3
{
  self->_octagonTrusted = a3;
}

- (void).cxx_destruct
{
}

@end
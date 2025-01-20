@interface KTReachabilityTracker
+ (BOOL)isNetworkError:(id)a3;
+ (BOOL)isNetworkFailureError:(id)a3;
- (BOOL)currentReachability;
- (BOOL)haveNetwork;
- (BOOL)isNetworkError:(id)a3;
- (KTReachabilityTracker)init;
- (KTResultOperation)reachabilityDependency;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_nw_path_monitor)networkMonitor;
- (id)description;
- (void)_onQueueResetReachabilityDependency;
- (void)_onQueueRunReachabilityDependency;
- (void)_onqueueSetNetworkReachability:(BOOL)a3;
- (void)setHaveNetwork:(BOOL)a3;
- (void)setNetworkMonitor:(id)a3;
- (void)setNetworkReachability:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityDependency:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation KTReachabilityTracker

- (KTReachabilityTracker)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___KTReachabilityTracker;
  id v2 = -[KTReachabilityTracker init](&v22, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("reachabiltity-tracker", v4);
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    v8 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v7;

    v9 = (dispatch_queue_s *)*((void *)v2 + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100191CF0;
    block[3] = &unk_100276740;
    v10 = v2;
    id v21 = v10;
    dispatch_sync(v9, block);
    id location = 0LL;
    objc_initWeak(&location, v10);
    nw_path_monitor_t v11 = nw_path_monitor_create();
    v12 = (void *)v10[5];
    v10[5] = v11;

    v13 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue([v10 networkMonitor]);
    nw_path_monitor_set_queue(v13, *((dispatch_queue_t *)v2 + 3));

    v14 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue([v10 networkMonitor]);
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472LL;
    update_handler[2] = sub_100191CF8;
    update_handler[3] = &unk_1002870F0;
    objc_copyWeak(&v18, &location);
    nw_path_monitor_set_update_handler(v14, update_handler);

    v15 = (nw_path_monitor *)objc_claimAutoreleasedReturnValue([v10 networkMonitor]);
    nw_path_monitor_start(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return (KTReachabilityTracker *)v2;
}

- (id)description
{
  unsigned int v2 = -[KTReachabilityTracker haveNetwork](self, "haveNetwork");
  dispatch_queue_attr_t v3 = @"offline";
  if (v2) {
    dispatch_queue_attr_t v3 = @"online";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTReachabilityTracker: %@>",  v3);
}

- (BOOL)currentReachability
{
  unsigned int v2 = self;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100191F00;
  v5[3] = &unk_100284458;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_onQueueRunReachabilityDependency
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (v4)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker operationQueue](self, "operationQueue"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
    [v5 addOperation:v6];

    -[KTReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", 0LL);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));

  if (v7)
  {
    uint64_t v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    dispatch_source_cancel(v8);

    -[KTReachabilityTracker setTimer:](self, "setTimer:", 0LL);
  }

- (void)_onQueueResetReachabilityDependency
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency"));
  if (!v4
    || (dispatch_queue_t v5 = (void *)v4,
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker reachabilityDependency](self, "reachabilityDependency")),
        unsigned __int8 v7 = [v6 isPending],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id location = 0LL;
    objc_initWeak(&location, self);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Network unavailable",  buf,  2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100192280;
    v20[3] = &unk_100276D20;
    objc_copyWeak(&v21, &location);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[KTResultOperation named:withBlock:]( &OBJC_CLASS___KTResultOperation,  "named:withBlock:",  @"network-available-dependency",  v20));
    -[KTReachabilityTracker setReachabilityDependency:](self, "setReachabilityDependency:", v8);

    char v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v9);
    -[KTReachabilityTracker setTimer:](self, "setTimer:", v10);

    nw_path_monitor_t v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_1001923C0;
    id v18 = &unk_100276D20;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v11, &v15);

    v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer", v15, v16, v17, v18));
    dispatch_time_t v13 = dispatch_time(0LL, 43200000000000LL);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

    v14 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker timer](self, "timer"));
    dispatch_resume(v14);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

- (void)_onqueueSetNetworkReachability:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = -[KTReachabilityTracker haveNetwork](self, "haveNetwork");
  -[KTReachabilityTracker setHaveNetwork:](self, "setHaveNetwork:", v3);
  if ((_DWORD)v5 != -[KTReachabilityTracker haveNetwork](self, "haveNetwork"))
  {
    if (-[KTReachabilityTracker haveNetwork](self, "haveNetwork")) {
      -[KTReachabilityTracker _onQueueRunReachabilityDependency](self, "_onQueueRunReachabilityDependency");
    }
    else {
      -[KTReachabilityTracker _onQueueResetReachabilityDependency](self, "_onQueueResetReachabilityDependency");
    }
  }

- (void)setNetworkReachability:(BOOL)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTReachabilityTracker queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100192528;
  v6[3] = &unk_100285EB0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)isNetworkError:(id)a3
{
  return +[KTReachabilityTracker isNetworkError:](&OBJC_CLASS___KTReachabilityTracker, "isNetworkError:", a3);
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_12;
  }
  if (!+[KTReachabilityTracker isNetworkFailureError:]( &OBJC_CLASS___KTReachabilityTracker,  "isNetworkFailureError:",  v3))
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v5 isEqualToString:CKErrorDomain])
    {
      id v6 = [v3 code];

      if (v6 == (id)3) {
        goto LABEL_3;
      }
    }

    else
    {
    }

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v7 isEqualToString:NSURLErrorDomain])
    {
      id v8 = [v3 code];

      if (v8 == (id)-1001LL) {
        goto LABEL_3;
      }
    }

    else
    {
    }

+ (BOOL)isNetworkFailureError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if (![v5 isEqualToString:CKErrorDomain])
  {

    goto LABEL_6;
  }

  id v6 = [v4 code];

  if (v6 != (id)4)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }

  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (KTResultOperation)reachabilityDependency
{
  return (KTResultOperation *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReachabilityDependency:(id)a3
{
}

- (BOOL)haveNetwork
{
  return self->_haveNetwork;
}

- (void)setHaveNetwork:(BOOL)a3
{
  self->_haveNetwork = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_nw_path_monitor)networkMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNetworkMonitor:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
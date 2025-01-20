@interface BTNetworkMonitor
- (BOOL)cachedIsNetworkUp;
- (BOOL)isMonitoring;
- (BOOL)isNetworkUp;
- (NWPathEvaluator)evaluator;
- (OS_dispatch_queue)callbackQueue;
- (id)block;
- (void)notifyNetworkStateChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBlock:(id)a3;
- (void)setCachedIsNetworkUp:(BOOL)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setEvaluator:(id)a3;
- (void)startMonitoringWithCallback:(id)a3;
- (void)stopMonitoring;
@end

@implementation BTNetworkMonitor

- (void)startMonitoringWithCallback:(id)a3
{
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = a3;
  dispatch_queue_t v8 = dispatch_queue_create("BTNetworkMonitor", v6);
  -[BTNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", v8);

  -[BTNetworkMonitor setBlock:](self, "setBlock:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NWPathEvaluator sharedDefaultEvaluator](&OBJC_CLASS___NWPathEvaluator, "sharedDefaultEvaluator"));
  -[BTNetworkMonitor setEvaluator:](self, "setEvaluator:", v9);

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  [v10 addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (void)stopMonitoring
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  [v3 removeObserver:self forKeyPath:@"path" context:0];

  -[BTNetworkMonitor setCallbackQueue:](self, "setCallbackQueue:", 0LL);
  -[BTNetworkMonitor setBlock:](self, "setBlock:", 0LL);
  -[BTNetworkMonitor setEvaluator:](self, "setEvaluator:", 0LL);
}

- (BOOL)isMonitoring
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)isNetworkUp
{
  BOOL v3 = -[BTNetworkMonitor isMonitoring](self, "isMonitoring");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor evaluator](self, "evaluator"));
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    unint64_t v6 = (unint64_t)[v5 status];

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }

  return v3;
}

- (void)setCachedIsNetworkUp:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_cachedIsNetworkUp != v3)
  {
    self->_cachedIsNetworkUp = v3;
    -[BTNetworkMonitor notifyNetworkStateChange](self, "notifyNetworkStateChange");
  }

- (void)notifyNetworkStateChange
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
  dispatch_assert_queue_V2(v3);

  os_log_t v4 = sub_100060178("NetworkMonitor");
  dispatch_queue_attr_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[BTNetworkMonitor cachedIsNetworkUp](self, "cachedIsNetworkUp");
    id v7 = @"DOWN";
    if (v6) {
      id v7 = @"UP";
    }
    *(_DWORD *)buf = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network state changed: %@", buf, 0xCu);
  }

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004E7B4;
  activity_block[3] = &unk_100206058;
  activity_block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "Network state changed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"path"])
  {
    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[BTNetworkMonitor callbackQueue](self, "callbackQueue"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004E9F0;
    v10[3] = &unk_100206358;
    v10[4] = self;
    id v11 = v8;
    dispatch_async(v9, v10);
  }
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (BOOL)cachedIsNetworkUp
{
  return self->_cachedIsNetworkUp;
}

- (void).cxx_destruct
{
}

@end
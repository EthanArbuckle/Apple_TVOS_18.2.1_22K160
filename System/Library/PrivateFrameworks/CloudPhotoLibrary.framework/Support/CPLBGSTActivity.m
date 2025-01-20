@interface CPLBGSTActivity
+ (BOOL)isLargeUploadSize:(int64_t)a3;
+ (BOOL)isVeryLargeUploadSize:(int64_t)a3;
+ (double)estimatedRunningTimeFromPrediction:(id)a3 minimumRuntime:(double)a4 minimumRuntimeWithExtendedTime:(double)a5 minimumRuntimeWithVeryLongExtendedTime:(double)a6;
+ (int64_t)_minimumUploadSizeForLargeSession;
+ (int64_t)_minimumUploadSizeForVeryLargeSession;
- (BGNonRepeatingSystemTask)task;
- (BGNonRepeatingSystemTaskRequest)request;
- (BOOL)shouldDefer;
- (CPLBGSTActivity)initWithTask:(id)a3 request:(id)a4 rescheduler:(id)a5;
- (CPLBGSTRescheduler)rescheduler;
- (id)addDeferHandler:(id)a3;
- (id)description;
- (void)_activityHasExpired;
- (void)attachToCKOperationConfiguration:(id)a3;
- (void)removeDeferHandler:(id)a3;
@end

@implementation CPLBGSTActivity

- (CPLBGSTActivity)initWithTask:(id)a3 request:(id)a4 rescheduler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CPLBGSTActivity;
  v12 = -[CPLBGSTActivity init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_task, a3);
    objc_storeStrong((id *)&v13->_request, a4);
    id v14 = objc_storeWeak((id *)&v13->_rescheduler, v11);
    v13->_shouldDeferLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = CPLCopyDefaultSerialQueueAttributes(v14);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.cpl.bgst.activity", v16);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v13);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000159CC;
    v20[3] = &unk_10023E850;
    objc_copyWeak(&v21, &location);
    -[BGNonRepeatingSystemTask setExpirationHandler:](v13->_task, "setExpirationHandler:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self->_task);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTask identifier](self->_task, "identifier"));
  v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"[%@ for %@]", v4, v5);

  return v6;
}

- (BOOL)shouldDefer
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  p_shouldDeferLock = &self->_shouldDeferLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v6 = sub_100015B68;
  v7 = &unk_10023DD58;
  v8 = self;
  id v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_shouldDeferLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_shouldDeferLock);

  LOBYTE(p_shouldDeferLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_shouldDeferLock;
}

- (id)addDeferHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015CA8;
  v15[3] = &unk_10023E878;
  v15[4] = self;
  id v17 = v4;
  id v7 = v5;
  id v16 = v7;
  v8 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016514;
  block[3] = &unk_10023DBC8;
  id v19 = v8;
  id v9 = queue;
  id v10 = v4;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);

  uint64_t v12 = v16;
  id v13 = v7;

  return v13;
}

- (void)removeDeferHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100015E44;
  v10[3] = &unk_10023DDE8;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016514;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_activityHasExpired
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100015F18;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016514;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)attachToCKOperationConfiguration:(id)a3
{
}

+ (int64_t)_minimumUploadSizeForLargeSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"CPLMinimumUploadSizeForLargeSession"]);

  if (v3 && (objc_opt_respondsToSelector(v3, "longLongValue") & 1) != 0) {
    int64_t v4 = (int64_t)[v3 integerValue];
  }
  else {
    int64_t v4 = 209715200LL;
  }

  return v4;
}

+ (int64_t)_minimumUploadSizeForVeryLargeSession
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"CPLMinimumUploadSizeForVeryLargeSession"]);

  if (v4 && (objc_opt_respondsToSelector(v4, "longLongValue") & 1) != 0) {
    uint64_t v5 = (uint64_t)[v4 integerValue];
  }
  else {
    uint64_t v5 = 0x40000000LL;
  }
  uint64_t v6 = (uint64_t)[a1 _minimumUploadSizeForLargeSession];
  if (v6 >= v5) {
    int64_t v7 = 2 * v6;
  }
  else {
    int64_t v7 = v5;
  }

  return v7;
}

+ (BOOL)isLargeUploadSize:(int64_t)a3
{
  return (uint64_t)[a1 _minimumUploadSizeForLargeSession] < a3;
}

+ (BOOL)isVeryLargeUploadSize:(int64_t)a3
{
  return (uint64_t)[a1 _minimumUploadSizeForVeryLargeSession] < a3;
}

+ (double)estimatedRunningTimeFromPrediction:(id)a3 minimumRuntime:(double)a4 minimumRuntimeWithExtendedTime:(double)a5 minimumRuntimeWithVeryLongExtendedTime:(double)a6
{
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CPLSyncSessionPredictionTypeLargestResourceSize]);
  [v10 doubleValue];
  double v12 = v11;

  if (([a1 isVeryLargeUploadSize:(uint64_t)v12] & 1) == 0)
  {
    else {
      a5 = 0.0;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CPLSyncSessionPredictionTypeUploadResourceSize]);
  [v13 doubleValue];
  double v15 = v14;

  if (v15 > 0.0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CPLSyncSessionPredictionTypeUploadSpeed]);
    [v16 doubleValue];
    double v18 = v17;

    double v19 = 10485760.0;
    if (v18 != 0.0) {
      double v19 = v18;
    }
    double v20 = v15 * 1.29999995 / v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:CPLSyncSessionPredictionTypeDerivativesGenerationSpeed]);
    [v21 doubleValue];
    if (v22 == 0.0) {
      double v23 = 1572864.0;
    }
    else {
      double v23 = v22;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:CPLSyncSessionPredictionTypeLargeDerivativesGenerationSpeed]);
    [v24 doubleValue];
    double v26 = v25;

    double v27 = 0.0;
    double v28 = 5242880.0;
    if (v26 != 0.0) {
      double v28 = v26;
    }
    double v29 = v12 / v28 + 0.0;
    if (v12 > 0.0) {
      double v27 = v29;
    }
    double v30 = v20 + (v15 - v12) / v23 + v27;
    if (a5 < v30) {
      a5 = v30;
    }
  }

  return ceil(a5 / 60.0) * 60.0;
}

- (BGNonRepeatingSystemTask)task
{
  return self->_task;
}

- (BGNonRepeatingSystemTaskRequest)request
{
  return self->_request;
}

- (CPLBGSTRescheduler)rescheduler
{
  return (CPLBGSTRescheduler *)objc_loadWeakRetained((id *)&self->_rescheduler);
}

- (void).cxx_destruct
{
}

@end
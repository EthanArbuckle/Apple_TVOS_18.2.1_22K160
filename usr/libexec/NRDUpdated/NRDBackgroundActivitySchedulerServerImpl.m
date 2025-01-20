@interface NRDBackgroundActivitySchedulerServerImpl
- (NRDBackgroundActivitySchedulerServerImpl)initWithIdentifier:(id)a3;
- (NSBackgroundActivityScheduler)scheduler;
- (void)_isAppRefresh:(id)a3;
- (void)_setAdditionalXPCActivityProperties:(id)a3;
- (void)dealloc;
- (void)delay:(id)a3;
- (void)identifier:(id)a3;
- (void)interval:(id)a3;
- (void)invalidate;
- (void)preregistered:(id)a3;
- (void)qualityOfService:(id)a3;
- (void)repeats:(id)a3;
- (void)scheduleWithRemoteableBlock:(id)a3;
- (void)setCheckInHandler:(id)a3;
- (void)setDelay:(double)a3;
- (void)setInterval:(double)a3;
- (void)setPreregistered:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setTolerance:(double)a3;
- (void)set_appRefresh:(BOOL)a3;
- (void)shouldDefer:(id)a3;
- (void)tolerance:(id)a3;
@end

@implementation NRDBackgroundActivitySchedulerServerImpl

- (NRDBackgroundActivitySchedulerServerImpl)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = -[NRDBackgroundActivitySchedulerServerImpl init](self, "init");
  if (v5)
  {
    v6 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  v4);
    scheduler = v5->_scheduler;
    v5->_scheduler = v6;
  }

  return v5;
}

- (void)dealloc
{
  scheduler = self->_scheduler;
  self->_scheduler = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NRDBackgroundActivitySchedulerServerImpl;
  -[NRDBackgroundActivitySchedulerServerImpl dealloc](&v4, "dealloc");
}

- (void)identifier:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](scheduler, "identifier"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)qualityOfService:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, NSQualityOfService))a3 + 2))( v5,  -[NSBackgroundActivityScheduler qualityOfService](scheduler, "qualityOfService"));
}

- (void)setQualityOfService:(int64_t)a3
{
}

- (void)repeats:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, -[NSBackgroundActivityScheduler repeats](scheduler, "repeats"));
}

- (void)interval:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  -[NSBackgroundActivityScheduler interval](scheduler, "interval");
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setRepeats:(BOOL)a3
{
}

- (void)setInterval:(double)a3
{
}

- (void)tolerance:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  -[NSBackgroundActivityScheduler tolerance](scheduler, "tolerance");
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setTolerance:(double)a3
{
}

- (void)scheduleWithRemoteableBlock:(id)a3
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](self->_scheduler, "identifier"));
    v8 = "NO";
    else {
      v9 = "NO";
    }
    NSQualityOfService v10 = -[NSBackgroundActivityScheduler qualityOfService](self->_scheduler, "qualityOfService");
    if (-[NSBackgroundActivityScheduler repeats](self->_scheduler, "repeats")) {
      v8 = "YES";
    }
    -[NSBackgroundActivityScheduler interval](self->_scheduler, "interval");
    uint64_t v12 = v11;
    -[NSBackgroundActivityScheduler delay](self->_scheduler, "delay");
    uint64_t v14 = v13;
    -[NSBackgroundActivityScheduler tolerance](self->_scheduler, "tolerance");
    *(_DWORD *)buf = 138545154;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v7;
    __int16 v24 = 2082;
    v25 = v9;
    __int16 v26 = 2048;
    NSQualityOfService v27 = v10;
    __int16 v28 = 2082;
    v29 = v8;
    __int16 v30 = 2048;
    uint64_t v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = v14;
    __int16 v34 = 2048;
    uint64_t v35 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Scheduling Activity %{public}@ = {\n \tidentifier = %{public}@\n \tpreregistered = %{public}s\n \tqualityOfService = %ld\n \trepeats = %{public}s\n \tinterval = %f\n \tdelay = %f\n \ttolerance = %f\n }",  buf,  0x52u);
  }

  scheduler = self->_scheduler;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke;
  v18[3] = &unk_100014740;
  v18[4] = self;
  id v19 = v4;
  id v17 = v4;
  -[NSBackgroundActivityScheduler scheduleWithBlock:](scheduler, "scheduleWithBlock:", v18);
}

void __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scheduler]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ fired.",  buf,  0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2;
  v11[3] = &unk_100014718;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v10 = v3;
  [v9 execute:v11];
}

uint64_t __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2( uint64_t a1,  int a2)
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scheduler]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    if (a2 == 1LL)
    {
      v9 = @"NSBackgroundActivityResultFinished";
    }

    else if (a2 == 2LL)
    {
      v9 = @"NSBackgroundActivityResultDeferred";
    }

    else
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", a2));
    }

    *(_DWORD *)buf = 138543874;
    id v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ result: %{public}@",  buf,  0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)invalidate
{
}

- (void)shouldDefer:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))( v5,  -[NSBackgroundActivityScheduler shouldDefer](scheduler, "shouldDefer"));
}

- (void)preregistered:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, id))a3 + 2))( v5,  -[NSBackgroundActivityScheduler isPreregistered](scheduler, "isPreregistered"));
}

- (void)setPreregistered:(BOOL)a3
{
}

- (void)delay:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  -[NSBackgroundActivityScheduler delay](scheduler, "delay");
  (*((void (**)(id))a3 + 2))(v5);
}

- (void)setDelay:(double)a3
{
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  id v4 = (id)_CFXPCCreateXPCObjectFromCFObject(a3, a2);
  -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:]( self->_scheduler,  "_setAdditionalXPCActivityProperties:",  v4);
}

- (void)setCheckInHandler:(id)a3
{
  id v4 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  char v16 = 0;
  scheduler = self->_scheduler;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](scheduler, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](self->_scheduler, "description"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke;
    v10[3] = &unk_100014790;
    id v8 = v7;
    id v11 = v8;
    id v9 = v6;
    id v12 = v9;
    id v13 = v4;
    uint64_t v14 = v15;
    -[NSBackgroundActivityScheduler setCheckInHandler:](self->_scheduler, "setCheckInHandler:", v10);
  }

  else
  {
    -[NSBackgroundActivityScheduler setCheckInHandler:](scheduler, "setCheckInHandler:", 0LL);
  }

  _Block_object_dispose(v15, 8);
}

void __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke(void *a1)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in.",  buf,  0x16u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5;
  v27[3] = &unk_100014768;
  id v6 = (void *)a1[6];
  v27[4] = a1[7];
  [v6 execute:v27];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  __int16 v24 = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2;
  v25 = &unk_100014598;
  uint64_t v26 = a1[7];
  v7 = v23;
  id v8 = objc_autoreleasePoolPush();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  do
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingTimeInterval:0.02]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    [v12 runUntilDate:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v13 timeIntervalSinceDate:v10];
    double v15 = v14;

    if (v15 < 0.02)
    {
      *(void *)buf = (uint64_t)(0.02 - v15);
      *(void *)&buf[8] = (uint64_t)((0.02 - v15 - (double)*(uint64_t *)buf) * 1000000000.0);
      nanosleep((const timespec *)buf, 0LL);
    }

    char v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v16 timeIntervalSinceDate:v9];
    BOOL v18 = v17 < 3.1536e10;
  }

  while (v18);

  objc_autoreleasePoolPop(v8);
  id v19 = nrdSharedLogger();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = a1[4];
    uint64_t v22 = a1[5];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in complete.",  buf,  0x16u);
  }
}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

- (void)_isAppRefresh:(id)a3
{
  scheduler = self->_scheduler;
  id v5 = a3;
  (*((void (**)(id, id))a3 + 2))( v5,  -[NSBackgroundActivityScheduler _isAppRefresh](scheduler, "_isAppRefresh"));
}

- (void)set_appRefresh:(BOOL)a3
{
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
}

@end
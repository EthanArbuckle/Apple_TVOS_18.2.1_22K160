@interface MSDDemoUpdateTimeKeeper
+ (id)sharedInstance;
- (BOOL)canceled;
- (BOOL)shouldCleanUp:(id *)a3;
- (NSDate)date;
- (NSTimer)timer;
- (NSTimer)timerForFatalError;
- (id)setCompletionTime:(int)a3 reserveTimeForCleanup:(BOOL)a4;
- (id)setCompletionTimeForFatalError:(int)a3;
- (int64_t)timeIntervalReservedForCleanup;
- (void)canceledByUser;
- (void)forceSwitchToDemoMode:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setTimeIntervalReservedForCleanup:(int64_t)a3;
- (void)setTimer:(id)a3;
- (void)setTimerForFatalError:(id)a3;
@end

@implementation MSDDemoUpdateTimeKeeper

+ (id)sharedInstance
{
  if (qword_100125420 != -1) {
    dispatch_once(&qword_100125420, &stru_1000F9FD8);
  }
  return (id)qword_100125418;
}

- (id)setCompletionTime:(int)a3 reserveTimeForCleanup:(BOOL)a4
{
  BOOL v4 = a4;
  -[MSDDemoUpdateTimeKeeper setCanceled:](self, "setCanceled:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper timer](self, "timer"));

  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004AFEC;
    block[3] = &unk_1000F9768;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  id v8 = -[MSDDemoUpdateTimeKeeper setCompletionTimeForFatalError:](self, "setCompletionTimeForFatalError:", 0LL);
  if (a3 < 1)
  {
    -[MSDDemoUpdateTimeKeeper setDate:](self, "setDate:", 0LL);
LABEL_12:
    v22 = 0LL;
    return v22;
  }

  if (v4)
  {
    -[MSDDemoUpdateTimeKeeper setTimeIntervalReservedForCleanup:](self, "setTimeIntervalReservedForCleanup:", 1800LL);
    a3 -= 600;
  }

  else
  {
    -[MSDDemoUpdateTimeKeeper setTimeIntervalReservedForCleanup:](self, "setTimeIntervalReservedForCleanup:", 0LL);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)a3));
  -[MSDDemoUpdateTimeKeeper setDate:](self, "setDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
  [v10 timeIntervalSinceNow];
  double v12 = v11;
  double v13 = (double)-[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");

  id v14 = sub_10003A95C();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12 > v13)
  {
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
      [v17 timeIntervalSinceNow];
      v19 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
      int64_t v21 = -[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");
      *(_DWORD *)buf = 134218498;
      v30 = v19;
      __int16 v31 = 2114;
      v32 = v20;
      __int16 v33 = 2048;
      int64_t v34 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "The operation needs to complete in %lf seconds (or by %{public}@). Will indicate system to clean up %td second b efore that. If no clean up action is taken then the device will be forced to demo mode by then (if possible).",  buf,  0x20u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10004B078;
    v27[3] = &unk_1000F9768;
    v27[4] = self;
    dispatch_async(&_dispatch_main_q, v27);
    goto LABEL_12;
  }

  if (v16)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    [v24 timeIntervalSinceNow];
    *(_DWORD *)buf = 138543618;
    v30 = v23;
    __int16 v31 = 2048;
    v32 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Already time for clean up: %{public}@ (in %lf seconds)",  buf,  0x16u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741184LL,  @"Cannot finish update within given time."));
  return v22;
}

- (id)setCompletionTimeForFatalError:(int)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper timerForFatalError](self, "timerForFatalError"));

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004B1C0;
    block[3] = &unk_1000F9768;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  if (a3 >= 1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004B24C;
    v7[3] = &unk_1000FA000;
    int v8 = a3;
    v7[4] = self;
    dispatch_async(&_dispatch_main_q, v7);
  }

  return 0LL;
}

- (void)canceledByUser
{
  id v3 = -[MSDDemoUpdateTimeKeeper setCompletionTimeForFatalError:](self, "setCompletionTimeForFatalError:", 0LL);
}

- (BOOL)shouldCleanUp:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUpdateTimeKeeper date](self, "date"));
    [v6 timeIntervalSinceNow];
    double v8 = v7;
    double v9 = (double)-[MSDDemoUpdateTimeKeeper timeIntervalReservedForCleanup](self, "timeIntervalReservedForCleanup");

    if (v8 <= v9)
    {
      double v12 = @"Cannot finish update within given time.";
      uint64_t v11 = 3727741184LL;
      goto LABEL_6;
    }
  }

  BOOL v10 = -[MSDDemoUpdateTimeKeeper canceled](self, "canceled");
  if (v10)
  {
    uint64_t v11 = 3727741185LL;
    double v12 = @"Operation canceled.";
LABEL_6:
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  v11,  v12));
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)forceSwitchToDemoMode:(id)a3
{
  id v3 = sub_10003A95C();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Time is up, has to force the device into demo mode.",  v6,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  [v5 forceSwitchToDemoModeIfNeeded];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (int64_t)timeIntervalReservedForCleanup
{
  return self->_timeIntervalReservedForCleanup;
}

- (void)setTimeIntervalReservedForCleanup:(int64_t)a3
{
  self->_timeIntervalReservedForCleanup = a3;
}

- (NSTimer)timerForFatalError
{
  return self->_timerForFatalError;
}

- (void)setTimerForFatalError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
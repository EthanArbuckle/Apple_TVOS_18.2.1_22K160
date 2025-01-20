@interface UATimedPowerAssertions
+ (id)statusString;
- (BOOL)active;
- (BOOL)needToCallBlock;
- (NSDate)timerExpiration;
- (NSString)name;
- (NSUUID)uuid;
- (OS_dispatch_queue)mainDispatchQ;
- (OS_dispatch_source)timerSource;
- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 activityUUID:(id)a5 queue:(id)a6 runAtCompletion:(id)a7;
- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 queue:(id)a5;
- (id)block;
- (unint64_t)nextTimer;
- (unsigned)assertion;
- (void)_releaseAssertion:(BOOL)a3;
- (void)dealloc;
- (void)releaseAssertion;
- (void)releaseAssertion:(BOOL)a3;
- (void)setBlock:(id)a3;
- (void)setNeedToCallBlock:(BOOL)a3;
- (void)setNextTimer:(unint64_t)a3;
- (void)setTimerExpiration:(id)a3;
- (void)updateTimeUntilAssertionRelease:(double)a3;
@end

@implementation UATimedPowerAssertions

- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 activityUUID:(id)a5 queue:(id)a6 runAtCompletion:(id)a7
{
  v12 = (__CFString *)a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___UATimedPowerAssertions;
  v16 = -[UATimedPowerAssertions init](&v32, "init");
  if (v16)
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v19 = @"-";
    if (v12) {
      v20 = v12;
    }
    else {
      v20 = @"-";
    }
    if (v13) {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 description]);
    }
    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v20, v19));
    name = v16->_name;
    v16->_name = (NSString *)v21;

    if (v13) {
    objc_storeStrong((id *)&v16->_mainDispatchQ, a6);
    }
    -[UATimedPowerAssertions setNeedToCallBlock:](v16, "setNeedToCallBlock:", 1LL);
    -[UATimedPowerAssertions setBlock:](v16, "setBlock:", v15);
    timerExpiration = v16->_timerExpiration;
    v16->_timerExpiration = 0LL;

    objc_initWeak(&location, v16);
    id v24 = sub_10002F358();
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002F398;
    block[3] = &unk_1000BD630;
    objc_copyWeak(&v30, &location);
    v26 = v16;
    v29 = v26;
    dispatch_sync(v25, block);

    -[UATimedPowerAssertions updateTimeUntilAssertionRelease:](v26, "updateTimeUntilAssertionRelease:", a4);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (UATimedPowerAssertions)initWithName:(id)a3 delta:(double)a4 queue:(id)a5
{
  return -[UATimedPowerAssertions initWithName:delta:activityUUID:queue:runAtCompletion:]( self,  "initWithName:delta:activityUUID:queue:runAtCompletion:",  a3,  0LL,  a5,  0LL,  a4);
}

- (void)dealloc
{
  os_log_t v3 = sub_100039584(0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions uuid](self, "uuid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543618;
    v28 = v5;
    __int16 v29 = 2114;
    unint64_t v30 = (unint64_t)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "-dealloc for power assertion %{public}@/%{public}@",  buf,  0x16u);
  }

  id v8 = sub_10002F358();
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F77C;
  block[3] = &unk_1000BCC58;
  void block[4] = self;
  dispatch_sync(v9, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](self, "timerSource"));
  if (v10)
  {
    v11 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](self, "timerSource"));
    dispatch_source_cancel(v11);
  }

  if (-[UATimedPowerAssertions needToCallBlock](self, "needToCallBlock"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions block](self, "block"));

    if (v12)
    {
      os_log_t v13 = sub_100039584(0LL);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](self, "name"));
        *(_DWORD *)buf = 138543362;
        v28 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Calling block with NO, in -dealloc",  buf,  0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions block](self, "block"));
      -[UATimedPowerAssertions setBlock:](self, "setBlock:", 0LL);
      uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions mainDispatchQ](self, "mainDispatchQ"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10002F7D0;
      v24[3] = &unk_1000BCDE0;
      id v25 = v16;
      id v18 = v16;
      dispatch_async(v17, v24);
    }
  }

  if (-[UATimedPowerAssertions assertion](self, "assertion"))
  {
    os_log_t v19 = sub_100039584(0LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](self, "name"));
      unsigned int v22 = -[UATimedPowerAssertions assertion](self, "assertion");
      *(_DWORD *)buf = 138543618;
      v28 = v21;
      __int16 v29 = 2048;
      unint64_t v30 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Releasing assertion %ld, in -dealloc",  buf,  0x16u);
    }

    IOPMAssertionRelease(-[UATimedPowerAssertions assertion](self, "assertion"));
    self->_assertion = 0;
  }

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___UATimedPowerAssertions;
  -[UATimedPowerAssertions dealloc](&v23, "dealloc");
}

- (BOOL)active
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[UATimedPowerAssertions assertion](v2, "assertion") != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)updateTimeUntilAssertionRelease:(double)a3
{
  if (a3 <= 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](self, "timerSource"));

    if (!v12)
    {
      if (-[UATimedPowerAssertions needToCallBlock](self, "needToCallBlock"))
      {
        os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions block](self, "block"));

        if (v13)
        {
          -[UATimedPowerAssertions setNeedToCallBlock:](self, "setNeedToCallBlock:", 0LL);
          id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions mainDispatchQ](self, "mainDispatchQ"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10002FF90;
          block[3] = &unk_1000BCC58;
          void block[4] = self;
          dispatch_async(v14, block);
        }
      }
    }
  }

  else
  {
    unint64_t v5 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
    v6 = self;
    objc_sync_enter(v6);
    if (v6->_timerSource)
    {
      if (-[UATimedPowerAssertions nextTimer](v6, "nextTimer")
        && -[UATimedPowerAssertions nextTimer](v6, "nextTimer") >= v5)
      {
        os_log_t v32 = sub_100039584(0LL);
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v33 = (char *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
          *(_DWORD *)buf = 138543874;
          v44 = v33;
          __int16 v45 = 2048;
          double v46 = a3;
          __int16 v47 = 2048;
          double v48 = (double)(v5 - -[UATimedPowerAssertions nextTimer](v6, "nextTimer")) / 1000000000.0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ No need to update assertion; request for %g seconds is less than current expiration, in %.2g seconds.",
            buf,
            0x20u);
        }
      }

      else
      {
        os_log_t v7 = sub_100039584(0LL);
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = (char *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
          *(_DWORD *)buf = 138543874;
          v44 = v9;
          __int16 v45 = 2048;
          double v46 = a3;
          __int16 v47 = 2048;
          double v48 = (double)(v5 - -[UATimedPowerAssertions nextTimer](v6, "nextTimer")) / 1000000000.0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Rescheduling assertion for %g seconds (was %.2g seconds from now).",  buf,  0x20u);
        }

        -[UATimedPowerAssertions setNextTimer:](v6, "setNextTimer:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  a3));
        -[UATimedPowerAssertions setTimerExpiration:](v6, "setTimerExpiration:", v10);

        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](v6, "timerSource"));
        dispatch_source_set_timer((dispatch_source_t)v11, v5, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
      }

      -[UATimedPowerAssertions setNeedToCallBlock:](v6, "setNeedToCallBlock:", 1LL);
    }

    else
    {
      os_log_t v15 = sub_100039584(0LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
        *(_DWORD *)buf = 138543618;
        v44 = v17;
        __int16 v45 = 2048;
        double v46 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Scheduling assertion for %g seconds.",  buf,  0x16u);
      }

      id v18 = sub_10002FEE4();
      os_log_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
      dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v19);
      timerSource = v6->_timerSource;
      v6->_timerSource = (OS_dispatch_source *)v20;

      objc_initWeak((id *)buf, v6);
      unsigned int v22 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](v6, "timerSource"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10002FF24;
      handler[3] = &unk_1000BCE50;
      objc_copyWeak(&v40, (id *)buf);
      dispatch_source_set_event_handler(v22, handler);

      objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
      -[UATimedPowerAssertions setTimerExpiration:](v6, "setTimerExpiration:", v23);

      id v24 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](v6, "timerSource"));
      dispatch_source_set_timer(v24, v5, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);

      id v25 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions timerSource](v6, "timerSource"));
      dispatch_resume(v25);

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
    }

    if (!v6->_assertion)
    {
      IOPMAssertionID AssertionID = 0;
      v41[0] = @"FrameworkBundleID";
      v41[1] = @"AssertType";
      v42[0] = @"com.apple.useractivityd";
      v42[1] = @"PreventUserIdleSystemSleep";
      v41[2] = @"AssertName";
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
      v42[2] = v26;
      v41[3] = @"TimeoutSeconds";
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 60.0));
      v41[4] = @"TimeoutAction";
      v42[3] = v27;
      v42[4] = @"TimeoutActionTurnOff";
      v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  5LL));

      IOReturn v29 = IOPMAssertionCreateWithProperties(v28, &AssertionID);
      if (v29)
      {
        os_log_t v30 = sub_100039584(0LL);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[UATimedPowerAssertions updateTimeUntilAssertionRelease:]";
          __int16 v45 = 1024;
          LODWORD(v46) = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "%s, IOPMAssertionCreateWithProperties returned %x",  buf,  0x12u);
        }
      }

      else
      {
        v6->_assertion = AssertionID;
        os_log_t v34 = sub_100039584(0LL);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v35 = (char *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
          unsigned int v36 = -[UATimedPowerAssertions assertion](v6, "assertion");
          *(_DWORD *)buf = 138543618;
          v44 = v35;
          __int16 v45 = 2048;
          *(void *)&double v46 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Power assertion /%ld created.",  buf,  0x16u);
        }
      }
    }

    objc_sync_exit(v6);
  }

- (void)_releaseAssertion:(BOOL)a3
{
  id v4 = sub_10002FEE4();
  unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  v6 = self;
  objc_sync_enter(v6);
  if (-[UATimedPowerAssertions assertion](v6, "assertion"))
  {
    os_log_t v7 = sub_100039584(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
      *(_DWORD *)buf = 138543618;
      id v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = -[UATimedPowerAssertions assertion](v6, "assertion");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Power assertion %ld released.",  buf,  0x16u);
    }

    IOPMAssertionRelease(v6->_assertion);
    v6->_assertion = 0;
  }

  if (-[UATimedPowerAssertions needToCallBlock](v6, "needToCallBlock"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions block](v6, "block"));
    BOOL v11 = v10 == 0LL;

    if (!v11)
    {
      os_log_t v12 = sub_100039584(0LL);
      os_log_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions name](v6, "name"));
        *(_DWORD *)buf = 138543362;
        id v18 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "ASSERTION: %{public}@ Updating needToCallBlock => NO",  buf,  0xCu);
      }

      -[UATimedPowerAssertions setNeedToCallBlock:](v6, "setNeedToCallBlock:", 0LL);
      -[UATimedPowerAssertions setNextTimer:](v6, "setNextTimer:", 0LL);
      os_log_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UATimedPowerAssertions mainDispatchQ](v6, "mainDispatchQ"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100030204;
      block[3] = &unk_1000BCC58;
      void block[4] = v6;
      dispatch_async(v15, block);
    }
  }

  objc_sync_exit(v6);
}

- (void)releaseAssertion:(BOOL)a3
{
  id v5 = sub_10002FEE4();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030360;
  v7[3] = &unk_1000BD700;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(v6, v7);
}

- (void)releaseAssertion
{
  id v3 = sub_10002FEE4();
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000303DC;
  block[3] = &unk_1000BCC58;
  void block[4] = self;
  dispatch_sync(v4, block);
}

+ (id)statusString
{
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_1000304A4;
  BOOL v11 = sub_1000304B4;
  id v12 = 0LL;
  id v2 = sub_10002F358();
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000304BC;
  block[3] = &unk_1000BD728;
  void block[4] = &v7;
  dispatch_sync(v3, block);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (unsigned)assertion
{
  return self->_assertion;
}

- (OS_dispatch_queue)mainDispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (BOOL)needToCallBlock
{
  return self->_needToCallBlock;
}

- (void)setNeedToCallBlock:(BOOL)a3
{
  self->_needToCallBlock = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBlock:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSDate)timerExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTimerExpiration:(id)a3
{
}

- (unint64_t)nextTimer
{
  return self->_nextTimer;
}

- (void)setNextTimer:(unint64_t)a3
{
  self->_nextTimer = a3;
}

- (void).cxx_destruct
{
}

@end
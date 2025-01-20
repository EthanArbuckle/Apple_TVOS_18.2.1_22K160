@interface SDSharedRemoteTextInputClient
+ (id)sharedClient;
- (NSDictionary)currentPayload;
- (OS_dispatch_queue)dispatchQueue;
- (SDSharedRemoteTextInputClient)init;
- (id)_updatedSessionInfoWithAppIcon:(id)a3;
- (void)_ensureStarted;
- (void)_logEvent:(unint64_t)a3 stopClock:(BOOL)a4;
- (void)_rtiHandleEventWithData:(id)a3;
- (void)_rtiHandleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)_rtiHandleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)_startClockWithResetIfNeeded;
- (void)_stopClock:(unint64_t)a3;
- (void)activate;
- (void)addDelegate:(id)a3;
- (void)handleTextInputData:(id)a3;
- (void)handleUsername:(id)a3 password:(id)a4;
- (void)invalidate;
- (void)removeAllDelegates;
- (void)removeDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation SDSharedRemoteTextInputClient

+ (id)sharedClient
{
  if (qword_100656FD8 != -1) {
    dispatch_once(&qword_100656FD8, &stru_1005CD290);
  }
  return (id)qword_100656FE0;
}

- (SDSharedRemoteTextInputClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDSharedRemoteTextInputClient;
  v2 = -[SDSharedRemoteTextInputClient init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)_ensureStarted
{
  if (!self->_rtiClient)
  {
    if (dword_1006428D8 <= 30
      && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL)))
    {
      LogPrintF(&dword_1006428D8, "-[SDSharedRemoteTextInputClient _ensureStarted]", 30LL, "RTI client start\n");
    }

    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SFRemoteTextInputClient);
    rtiClient = self->_rtiClient;
    self->_rtiClient = v3;

    -[SFRemoteTextInputClient setDispatchQueue:](self->_rtiClient, "setDispatchQueue:", self->_dispatchQueue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10009EE70;
    v7[3] = &unk_1005CD2B8;
    v7[4] = self;
    -[SFRemoteTextInputClient setEventHandler:](self->_rtiClient, "setEventHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10009EE7C;
    v6[3] = &unk_1005CD2E0;
    v6[4] = self;
    -[SFRemoteTextInputClient setTextInputDidBegin:](self->_rtiClient, "setTextInputDidBegin:", v6);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10009EEC8;
    v5[3] = &unk_1005CD2E0;
    v5[4] = self;
    -[SFRemoteTextInputClient setTextInputDidEnd:](self->_rtiClient, "setTextInputDidEnd:", v5);
    -[SFRemoteTextInputClient activate](self->_rtiClient, "activate");
  }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009EF30;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (NSDictionary)currentPayload
{
  return (NSDictionary *)-[SFRemoteTextInputClient currentPayload](self->_rtiClient, "currentPayload");
}

- (void)invalidate
{
  if (self->_rtiClient)
  {
    if (dword_1006428D8 <= 30
      && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL)))
    {
      LogPrintF(&dword_1006428D8, "-[SDSharedRemoteTextInputClient invalidate]", 30LL, "RTI client stop\n");
    }

    -[SFRemoteTextInputClient invalidate](self->_rtiClient, "invalidate");
    rtiClient = self->_rtiClient;
    self->_rtiClient = 0LL;
  }

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  delegates = self->_delegates;
  if (!delegates)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }

  -[NSMutableSet addObject:](delegates, "addObject:", v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (dword_1006428D8 <= 30)
  {
    if (dword_1006428D8 != -1 || (v5 = _LogCategory_Initialize(&dword_1006428D8, 30LL), id v4 = v6, v5))
    {
      LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient removeDelegate:]",  30LL,  "Removing delegate: %{ptr}\n",  v4);
      id v4 = v6;
    }
  }

  -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v4);
}

- (void)removeAllDelegates
{
  delegates = self->_delegates;
  self->_delegates = 0LL;
}

- (void)handleTextInputData:(id)a3
{
}

- (void)handleUsername:(id)a3 password:(id)a4
{
}

- (void)_rtiHandleEventWithData:(id)a3
{
  id v4 = a3;
  if (dword_1006428D8 <= 30 && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL)))
  {
    uint64_t v5 = SFTextInputDataLogString(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient _rtiHandleEventWithData:]",  30LL,  "RTI: event with data (%@)\n",  v6);
  }

  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009F2B8;
  v9[3] = &unk_1005CD308;
  id v10 = v4;
  id v8 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);
}

- (void)_rtiHandleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6 = a4;
  if (dword_1006428D8 <= 30 && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL))) {
    LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient _rtiHandleInputDidBeginWithFlags:sessionInfo:]",  30LL,  "RTI: input did begin with flags: %d",  a3);
  }
  -[SDSharedRemoteTextInputClient _startClockWithResetIfNeeded](self, "_startClockWithResetIfNeeded");
  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009F3EC;
  v9[3] = &unk_1005CD330;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);
}

- (void)_rtiHandleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v6 = a4;
  if (dword_1006428D8 <= 30 && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL))) {
    LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient _rtiHandleInputDidEndWithFlags:sessionInfo:]",  30LL,  "RTI: input did end with flags: %d",  a3);
  }
  -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 2LL);
  delegates = self->_delegates;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009F524;
  v9[3] = &unk_1005CD330;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](delegates, "enumerateObjectsUsingBlock:", v9);
}

- (void)_logEvent:(unint64_t)a3 stopClock:(BOOL)a4
{
  sessionClock = self->_sessionClock;
  if (sessionClock)
  {
    BOOL v6 = a4;
    -[NSDate timeIntervalSinceNow](sessionClock, "timeIntervalSinceNow");
    double v9 = v8;
    -[NSDate timeIntervalSinceNow](self->_sessionClock, "timeIntervalSinceNow");
    if (v9 < 0.0) {
      double v10 = -v10;
    }
    uint64_t v11 = (uint64_t)(v10 * 1000.0);
    if (v6)
    {
      if (dword_1006428D8 <= 30
        && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL)))
      {
        if (a3 > 5) {
          v12 = @"?";
        }
        else {
          v12 = *(&off_1005CD350 + a3);
        }
        LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient _logEvent:stopClock:]",  30LL,  "Stopping session clock: %ld ms, event: %@\n",  v11,  v12);
      }

      v13 = self->_sessionClock;
      self->_sessionClock = 0LL;

      overrunTimer = self->_overrunTimer;
      if (overrunTimer)
      {
        v15 = overrunTimer;
        dispatch_source_cancel(v15);
        v16 = self->_overrunTimer;
        self->_overrunTimer = 0LL;
      }
    }

    v20[0] = @"durationMS";
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v11));
    v20[1] = @"event";
    v21[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    v21[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
    SFMetricsLog(@"com.apple.sharing.RTI", v19);
  }

- (void)_startClockWithResetIfNeeded
{
  if (self->_sessionClock) {
    -[SDSharedRemoteTextInputClient _stopClock:](self, "_stopClock:", 4LL);
  }
  if (dword_1006428D8 <= 30 && (dword_1006428D8 != -1 || _LogCategory_Initialize(&dword_1006428D8, 30LL))) {
    LogPrintF( &dword_1006428D8,  "-[SDSharedRemoteTextInputClient _startClockWithResetIfNeeded]",  30LL,  "Starting session clock\n");
  }
  uint64_t v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  sessionClock = self->_sessionClock;
  self->_sessionClock = v3;

  overrunTimer = self->_overrunTimer;
  if (overrunTimer)
  {
    BOOL v6 = overrunTimer;
    dispatch_source_cancel(v6);
    id v7 = self->_overrunTimer;
    self->_overrunTimer = 0LL;
  }

  double v8 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  double v9 = self->_overrunTimer;
  self->_overrunTimer = v8;

  double v10 = self->_overrunTimer;
  dispatch_time_t v11 = dispatch_time(0LL, 3600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
  v12 = self->_overrunTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10009F898;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
  dispatch_resume((dispatch_object_t)self->_overrunTimer);
}

- (void)_stopClock:(unint64_t)a3
{
}

- (id)_updatedSessionInfoWithAppIcon:(id)a3
{
  id v3 = [a3 mutableCopy];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v3, @"remoteBundleID", TypeID, 0LL);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v6)
  {
    id v7 = (UIImage *)objc_claimAutoreleasedReturnValue( +[UIImage tvsui_applicationIconImageForBundleIdentifier:]( &OBJC_CLASS___UIImage,  "tvsui_applicationIconImageForBundleIdentifier:",  v6));
    double v8 = UIImageJPEGRepresentation(v7, 0.5);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [v3 setObject:v9 forKeyedSubscript:@"remoteAppIconData"];
  }

  id v10 = [v3 copy];
  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface SUControllerManagerServer
+ (id)sharedManager;
- (NSString)persistencePath;
- (NSTimer)activityBackupTimer;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)stateQueue;
- (SUAutoInstallManager)autoInstallManager;
- (SUControllerAdmissionController)admissionController;
- (SUControllerAttachedClients)attachedClients;
- (SUControllerConfig)config;
- (SUControllerManagerServer)initWithPersistencePath:(id)a3;
- (SUControllerStatus)status;
- (id)currentReleaseTypeName;
- (int64_t)activityAdvanceTicker;
- (int64_t)currentReleaseType;
- (int64_t)managerState;
- (void)_activityAdvancement;
- (void)_activityAndBackupRestart;
- (void)_activityBackupTimerStart;
- (void)_activityBackupTimerTick:(id)a3;
- (void)_activityRestart:(id)a3;
- (void)_activitySetCriteria:(id)a3 forDelay:(double)a4 withGracePeriod:(double)a5;
- (void)_activityTrigger:(id)a3;
- (void)_issueConfigCallback:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_logReason:(id)a3 loggingSuccess:(BOOL)a4 withError:(id)a5;
- (void)_modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5;
- (void)_trackAsyncEvent:(int64_t)a3 withError:(id)a4 forReason:(id)a5;
- (void)_trackAsyncEvent:(int64_t)a3 withMoreToCome:(BOOL)a4 withError:(id)a5 forReason:(id)a6;
- (void)_trackAsyncEvent:(int64_t)a3 withProceed:(BOOL)a4 withError:(id)a5 forReason:(id)a6;
- (void)_trackStateEvent:(int64_t)a3 withError:(id)a4 forReason:(id)a5;
- (void)activityBackupTimerStart;
- (void)activityMetadataUpdate;
- (void)activityRegister;
- (void)activityUnregister;
- (void)forwardMessage:(id)a3;
- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5;
- (void)resetLocale;
- (void)setActivityAdvanceTicker:(int64_t)a3;
- (void)setActivityBackupTimer:(id)a3;
- (void)setAdmissionController:(id)a3;
- (void)setAttachedClients:(id)a3;
- (void)setAutoInstallManager:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCurrentReleaseType:(int64_t)a3;
- (void)setPersistencePath:(id)a3;
- (void)setStateQueue:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation SUControllerManagerServer

+ (id)sharedManager
{
  if (qword_100079688 != -1) {
    dispatch_once(&qword_100079688, &stru_100065CD8);
  }
  return (id)qword_100079680;
}

- (SUControllerManagerServer)initWithPersistencePath:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SUControllerManagerServer;
  v6 = -[SUControllerManagerServer init](&v24, "init");
  if (v6)
  {
    v7 = (void *)MGCopyAnswer(@"ReleaseType", 0LL);
    if ([v7 isEqualToString:@"Internal"])
    {
      v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s", "SapphireC");
      unsigned int v9 = -[NSString isEqualToString:](v8, "isEqualToString:", @"$RC_RELEASE");

      if (v9) {
        uint64_t v10 = 1LL;
      }
      else {
        uint64_t v10 = 2LL;
      }
    }

    else
    {
      uint64_t v10 = 3LL;
    }

    v6->_currentReleaseType = v10;
    v11 = -[SUControllerConfig initFromDefaults:]( objc_alloc(&OBJC_CLASS___SUControllerConfig),  "initFromDefaults:",  v6->_currentReleaseType);
    config = v6->_config;
    v6->_config = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___SUControllerStatus);
    status = v6->_status;
    v6->_status = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerManagerServer.state", 0LL);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerManagerServer.callbacks", 0LL);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v6->_persistencePath, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 addObserver:v6 selector:"resetLocale" name:NSCurrentLocaleDidChangeNotification object:0];

    activityBackupTimer = v6->_activityBackupTimer;
    v6->_activityAdvanceTicker = 0LL;
    v6->_activityBackupTimer = 0LL;

    autoInstallManager = v6->_autoInstallManager;
    v6->_autoInstallManager = 0LL;

    admissionController = v6->_admissionController;
    v6->_admissionController = 0LL;
  }

  return v6;
}

- (void)resetLocale
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v2 logAtLevel:1 label:"-[SUControllerManagerServer resetLocale]" format:@"received NSCurrentLocaleDidChangeNotification (ignored)"];
}

- (void)_logReason:(id)a3 loggingSuccess:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v7 = a5;
  if (v7 || v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    unsigned int v9 = v8;
    if (v7) {
      [v8 logAtLevel:0, "-[SUControllerManagerServer _logReason:loggingSuccess:withError:]", @"%@ ERROR: %@", v11, v7 label format];
    }
    else {
      [v8 logAtLevel:1, "-[SUControllerManagerServer _logReason:loggingSuccess:withError:]", @"%@", v11, v10 label format];
    }
  }
}

- (void)_issueConfigCallback:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUControllerManagerServer _logReason:loggingSuccess:withError:]( self,  "_logReason:loggingSuccess:withError:",  @"config",  0LL,  v9);
  if (v10)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer callbackQueue](self, "callbackQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003C540;
    block[3] = &unk_1000648B0;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v11, block);
  }
}

- (void)_trackAsyncEvent:(int64_t)a3 withError:(id)a4 forReason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v8, &v13);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  id v11 = v10;
  if (v7) {
    [v10 logAtLevel:0, "-[SUControllerManagerServer _trackAsyncEvent:withError:forReason:]", @"SUC-MANAGER A~%@: (%@) ERROR: %@", *(&off_100065C90 + a3), v9, v7 label format];
  }
  else {
    [v10 logAtLevel:1, "-[SUControllerManagerServer _trackAsyncEvent:withError:forReason:]", @"SUC-MANAGER A~%@: (%@)", *(&off_100065C90 + a3), v9, v12 label format];
  }
}

- (void)_trackAsyncEvent:(int64_t)a3 withMoreToCome:(BOOL)a4 withError:(id)a5 forReason:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v10,  &v17);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  uint64_t v13 = v12;
  uint64_t v14 = (uint64_t)*(&off_100065C90 + a3);
  id v15 = @"no more";
  if (v7) {
    id v15 = @"more to come";
  }
  if (v9) {
    [v12 logAtLevel:0, "-[SUControllerManagerServer _trackAsyncEvent:withMoreToCome:withError:forReason:]", @"SUC-MANAGER A~%@: [%@] (%@) ERROR: %@", v14, v15, v11, v9 label format];
  }
  else {
    [v12 logAtLevel:1, "-[SUControllerManagerServer _trackAsyncEvent:withMoreToCome:withError:forReason:]", @"SUC-MANAGER A~%@: [%@] (%@)", v14, v15, v11, v16 label format];
  }
}

- (void)_trackAsyncEvent:(int64_t)a3 withProceed:(BOOL)a4 withError:(id)a5 forReason:(id)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v10,  &v17);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  uint64_t v13 = v12;
  uint64_t v14 = (uint64_t)*(&off_100065C90 + a3);
  id v15 = @"can't proceed";
  if (v7) {
    id v15 = @"can proceed";
  }
  if (v9) {
    [v12 logAtLevel:0, "-[SUControllerManagerServer _trackAsyncEvent:withProceed:withError:forReason:]", @"SUC-MANAGER A~%@: [%@] (%@) ERROR: %@", v14, v15, v11, v9 label format];
  }
  else {
    [v12 logAtLevel:1, "-[SUControllerManagerServer _trackAsyncEvent:withProceed:withError:forReason:]", @"SUC-MANAGER A~%@: [%@] (%@)", v14, v15, v11, v16 label format];
  }
}

- (void)_trackStateEvent:(int64_t)a3 withError:(id)a4 forReason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v8, &v15);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  id v11 = v10;
  uint64_t v12 = (uint64_t)*(&off_100065CB0 + a3);
  if (v7)
  {
    id v13 = [v7 code];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    [v11 logAtLevel:0, "-[SUControllerManagerServer _trackStateEvent:withError:forReason:]", @"SUC-MANAGER %@ => %@ error[%ld(%@)] error:%@", v12, v9, v13, v14, v7 label format];
  }

  else
  {
    [v10 logAtLevel:1, "-[SUControllerManagerServer _trackStateEvent:withError:forReason:]", @"SUC-MANAGER %@ => %@", *(&off_100065CB0 + a3), v9 label format];
  }
}

- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 changeSummary:a4]);
  -[SUControllerManagerServer _trackAsyncEvent:withError:forReason:]( self,  "_trackAsyncEvent:withError:forReason:",  1LL,  0LL,  @"modify config | changes: %@",  v10);

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003CA58;
  block[3] = &unk_100065D00;
  void block[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, block);
}

- (void)_modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5
{
  id v32 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
  id v10 = [v9 copy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
  [v11 modify:v8 usingMask:a4];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v12 changeSummary:a4]);
  -[SUControllerManagerServer _trackStateEvent:withError:forReason:]( self,  "_trackStateEvent:withError:forReason:",  2LL,  0LL,  @"modify config (mask=0x%llX) changes: %@");

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
  id v14 = [v13 copy];

  if (v14 && v10)
  {
    if ((a4 & 0x10) != 0)
    {
      -[SUControllerManagerServer _trackStateEvent:withError:forReason:]( self,  "_trackStateEvent:withError:forReason:",  2LL,  0LL,  @"auto-activity check period specified - restarting");
      -[SUControllerManagerServer _activityAndBackupRestart](self, "_activityAndBackupRestart");
    }

    id v19 = [v14 autoInstallForceMaxWait];
    if (v19 != [v10 autoInstallForceMaxWait]) {
      goto LABEL_14;
    }
    unsigned int v20 = [v14 hideIndicationMayReboot];
    if (v20 != [v10 hideIndicationMayReboot]
      || (id v21 = [v14 autoInstallWindowBeginHour], v21 != objc_msgSend(v10, "autoInstallWindowBeginHour"))
      || (id v22 = [v14 autoInstallWindowBeginMinute],
          v22 != [v10 autoInstallWindowBeginMinute])
      || (id v23 = [v14 autoInstallWindowEndHour], v23 != objc_msgSend(v10, "autoInstallWindowEndHour"))
      || (id v24 = [v14 autoInstallWindowEndMinute], v24 != objc_msgSend(v10, "autoInstallWindowEndMinute"))
      || (unsigned int v25 = [v14 useSpecifiedInstallWindow],
          v25 != [v10 useSpecifiedInstallWindow])
      || (unsigned int v26 = [v14 expiredSpecifiedAsExpired],
          v26 != [v10 expiredSpecifiedAsExpired])
      || (unsigned int v27 = [v14 installWindowAsDeltas],
          v27 != [v10 installWindowAsDeltas]))
    {
LABEL_14:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer autoInstallManager](self, "autoInstallManager"));
      [v28 modifyConfig:v14];
    }

    -[SUControllerManagerServer _issueConfigCallback:withError:completion:]( self,  "_issueConfigCallback:withError:completion:",  v14,  0LL,  v32);
  }

  else
  {
    id v29 = sub_1000382D8( @"SUControllerError",  36LL,  0LL,  @"Unable to copy configuration after being modified",  v15,  v16,  v17,  v18,  a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    -[SUControllerManagerServer _issueConfigCallback:withError:completion:]( self,  "_issueConfigCallback:withError:completion:",  0LL,  v30,  v32);
  }
}

- (void)forwardMessage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer attachedClients](self, "attachedClients"));
  [v5 broadcastMessage:v4];
}

- (void)activityRegister
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10003CE54;
  handler[3] = &unk_1000653F8;
  handler[4] = self;
  xpc_activity_register("com.apple.sucontrollerd.auto-update", XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)activityUnregister
{
}

- (void)activityBackupTimerStart
{
}

- (void)activityMetadataUpdate
{
}

- (void)_activityBackupTimerStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
  unsigned int v4 = [v3 autoActivityCheckPeriod];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer activityBackupTimer](self, "activityBackupTimer"));
  if (v5)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v6 logAtLevel:2 label:"-[SUControllerManagerServer _activityBackupTimerStart]" format:@"activity backup timer stop"];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer activityBackupTimer](self, "activityBackupTimer"));
    [v7 invalidate];

    -[SUControllerManagerServer setActivityBackupTimer:](self, "setActivityBackupTimer:", 0LL);
  }

  if (v4)
  {
    uint64_t v8 = (float)((float)((float)((float)v4 + (float)((float)((float)v4 * 0.05) * 2.0)) * 60.0) / 5.0);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_activityBackupTimerTick:",  0LL,  1LL,  (double)v8));
    -[SUControllerManagerServer setActivityBackupTimer:](self, "setActivityBackupTimer:", v9);

    id v10 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    objc_msgSend( v10,  "logAtLevel:label:format:",  2,  "-[SUControllerManagerServer _activityBackupTimerStart]",  @"activity backup timer start (interval = %lld secs)",  v8);
  }

- (void)_activityBackupTimerTick:(id)a3
{
  if (-[SUControllerManagerServer activityAdvanceTicker](self, "activityAdvanceTicker") < 5)
  {
    int64_t v4 = -[SUControllerManagerServer activityAdvanceTicker](self, "activityAdvanceTicker");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v7 = v5;
    BOOL v6 = @"s";
    if (v4 == 4) {
      BOOL v6 = &stru_100066480;
    }
    [v5 logAtLevel:2, "-[SUControllerManagerServer _activityBackupTimerTick:]", @"%d tick%@ before activity check", (5 - v4), v6 label format];
  }

  else
  {
    -[SUControllerManagerServer _trackAsyncEvent:withError:forReason:]( self,  "_trackAsyncEvent:withError:forReason:",  3LL,  0LL,  @"auto-activity backup check trigger");
    -[SUControllerManagerServer _activityAdvancement](self, "_activityAdvancement");
  }

- (void)_activityRestart:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer config](self, "config"));
    uint64_t v5 = (uint64_t)[v4 autoActivityCheckPeriod];

    if (v5)
    {
      double v6 = (double)(60 * v5);
      double v7 = v6 * 0.0500000007;
      if (v5 < 1) {
        double v6 = 60.0;
      }
      if (v7 < 5.0) {
        double v7 = 5.0;
      }
      -[SUControllerManagerServer _activitySetCriteria:forDelay:withGracePeriod:]( self,  "_activitySetCriteria:forDelay:withGracePeriod:",  v9,  v6,  v7);
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v8 logAtLevel:1 label:"-[SUControllerManagerServer _activityRestart:]" format:@"auto-activity check has been disabled"];

      -[SUControllerManagerServer activityUnregister](self, "activityUnregister");
    }
  }

  else
  {
    -[SUControllerManagerServer activityRegister](self, "activityRegister");
  }
}

- (void)_activityAndBackupRestart
{
}

- (void)_activityTrigger:(id)a3
{
  activity = (_xpc_activity_s *)a3;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state != 2)
  {
    xpc_activity_state_t v5 = state;
    if (!state)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v6 logAtLevel:1 label:"-[SUControllerManagerServer _activityTrigger:]" format:@"auto-activity registration check-in"];

      -[SUControllerManagerServer _activityRestart:](self, "_activityRestart:", activity);
LABEL_10:
      id v9 = activity;
      goto LABEL_11;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v11 = v10;
    xpc_activity_state_t v14 = v5;
    id v12 = @"Not handling auto-activity with state: %d";
    uint64_t v13 = 1LL;
LABEL_8:
    objc_msgSend(v10, "logAtLevel:label:format:", v13, "-[SUControllerManagerServer _activityTrigger:]", v12, v14);

    goto LABEL_10;
  }

  if (!xpc_activity_should_defer(activity))
  {
    -[SUControllerManagerServer _trackAsyncEvent:withError:forReason:]( self,  "_trackAsyncEvent:withError:forReason:",  3LL,  0LL,  @"auto-activity check trigger");
    -[SUControllerManagerServer _activityAdvancement](self, "_activityAdvancement");
    goto LABEL_10;
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  objc_msgSend( v7,  "logAtLevel:label:format:",  1,  "-[SUControllerManagerServer _activityTrigger:]",  @"auto-activity fired, but activity was deferred.");

  BOOL v8 = xpc_activity_set_state(activity, 3LL);
  id v9 = activity;
  if (!v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v11 = v10;
    id v12 = @"auto-activity fired, activity was deferred, but fail to set state defer";
    uint64_t v13 = 0LL;
    goto LABEL_8;
  }

- (void)_activitySetCriteria:(id)a3 forDelay:(double)a4 withGracePeriod:(double)a5
{
  double v7 = (_xpc_activity_s *)a3;
  activity = v7;
  if (v7)
  {
    xpc_object_t v8 = xpc_activity_copy_criteria(v7);
    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      [v9 logAtLevel:1 label:"-[SUControllerManagerServer _activitySetCriteria:forDelay:withGracePeriod:]" format:@"no base criteria provided in activity"];

      xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    }

    xpc_dictionary_set_uint64(v8, XPC_ACTIVITY_DELAY, (unint64_t)a4);
    xpc_dictionary_set_uint64(v8, XPC_ACTIVITY_GRACE_PERIOD, (unint64_t)a5);
    xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v8, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    objc_msgSend( v10,  "logAtLevel:label:format:",  1,  "-[SUControllerManagerServer _activitySetCriteria:forDelay:withGracePeriod:]",  @"auto-update: scheduling activity check in %llu seconds with %llu second grace period",  (unint64_t)a4,  (unint64_t)a5);

    xpc_activity_set_criteria(activity, v8);
  }

  else
  {
    xpc_object_t v8 = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v8 logAtLevel:0 label:"-[SUControllerManagerServer _activitySetCriteria:forDelay:withGracePeriod:]" format:@"no activity provided when attempting to set criteria"];
  }
}

- (void)_activityAdvancement
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerTransactionManager sharedManager]( &OBJC_CLASS___SUControllerTransactionManager,  "sharedManager"));
  [v3 beginTransaction:@"AutoUpdateActivityTask"];
  int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SUControllerManagerServer stateQueue](self, "stateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003D5A4;
  v6[3] = &unk_100065250;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (id)currentReleaseTypeName
{
  if (-[SUControllerManagerServer currentReleaseType](self, "currentReleaseType") < 0
    || -[SUControllerManagerServer currentReleaseType](self, "currentReleaseType") > 3)
  {
    v3 = @"NotDetermined";
  }

  else
  {
    v3 = *(&off_100065C70 + -[SUControllerManagerServer currentReleaseType](self, "currentReleaseType"));
  }

  return v3;
}

- (SUControllerConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (int64_t)managerState
{
  return self->_managerState;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (NSString)persistencePath
{
  return self->_persistencePath;
}

- (void)setPersistencePath:(id)a3
{
}

- (int64_t)activityAdvanceTicker
{
  return self->_activityAdvanceTicker;
}

- (void)setActivityAdvanceTicker:(int64_t)a3
{
  self->_activityAdvanceTicker = a3;
}

- (NSTimer)activityBackupTimer
{
  return self->_activityBackupTimer;
}

- (void)setActivityBackupTimer:(id)a3
{
}

- (int64_t)currentReleaseType
{
  return self->_currentReleaseType;
}

- (void)setCurrentReleaseType:(int64_t)a3
{
  self->_currentReleaseType = a3;
}

- (SUControllerAttachedClients)attachedClients
{
  return self->_attachedClients;
}

- (void)setAttachedClients:(id)a3
{
}

- (SUControllerStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (SUAutoInstallManager)autoInstallManager
{
  return self->_autoInstallManager;
}

- (void)setAutoInstallManager:(id)a3
{
}

- (SUControllerAdmissionController)admissionController
{
  return self->_admissionController;
}

- (void)setAdmissionController:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
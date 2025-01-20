@interface SUBackgroundTaskAgent
- (SUBackgroundTaskAgent)initWithAutoInstallManager:(id)a3;
- (void)_handleAutoInstallExpirationTask:(id)a3 parameters:(id)a4;
- (void)_handleAutoInstallStartInstall:(id)a3 parameters:(id)a4;
- (void)_initBackgroundTaskAgent;
- (void)cancelAutoInstallExpirationTask;
- (void)cancelAutoInstallStartInstallTask;
- (void)handleBTACallback:(const char *)a3 jobParameters:(id)a4;
- (void)handleDuetCallback:(id)a3 criteria:(id)a4 activity:(id)a5;
- (void)scheduleAutoInstallExpirationTaskWithDate:(id)a3 windowName:(id)a4;
- (void)scheduleAutoInstallStartInstallTaskWithDate:(id)a3 windowName:(id)a4 indicatingUpdate:(BOOL)a5;
- (void)scheduleAutoInstallTaskAtDate:(id)a3 jobName:(const char *)a4 windowName:(id)a5 needsNetwork:(BOOL)a6 needsPower:(BOOL)a7;
@end

@implementation SUBackgroundTaskAgent

- (SUBackgroundTaskAgent)initWithAutoInstallManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUBackgroundTaskAgent;
  v6 = -[SUBackgroundTaskAgent init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_autoInstallManager, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerBackgroundTaskAgent.notification", 0LL);
    notificationQueue = v7->_notificationQueue;
    v7->_notificationQueue = (OS_dispatch_queue *)v8;

    -[SUBackgroundTaskAgent _initBackgroundTaskAgent](v7, "_initBackgroundTaskAgent");
  }

  return v7;
}

- (void)_initBackgroundTaskAgent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100036870;
  v2[3] = &unk_100065B18;
  v2[4] = self;
  BackgroundTaskAgentInit( [@"com.apple.sucontrollerd.backgroundTaskAgent" UTF8String],  &_dispatch_main_q,  v2);
}

- (void)handleBTACallback:(const char *)a3 jobParameters:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3 && v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerTransactionManager sharedManager]( &OBJC_CLASS___SUControllerTransactionManager,  "sharedManager"));
    [v9 beginTransaction:@"BackgroundTask"];
    notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000369A0;
    v11[3] = &unk_100065B40;
    v14 = a3;
    v11[4] = self;
    id v12 = v7;
    id v13 = v9;
    id v8 = v9;
    dispatch_async(notificationQueue, v11);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v8 logAtLevel:0 label:"-[SUBackgroundTaskAgent handleBTACallback:jobParameters:]" format:@"BTA (Background Task Agent) invoked the callback with unsupported parameters"];
  }
}

- (void)scheduleAutoInstallTaskAtDate:(id)a3 jobName:(const char *)a4 windowName:(id)a5 needsNetwork:(BOOL)a6 needsPower:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = a5;
  [a3 timeIntervalSinceReferenceDate];
  double v12 = v11;
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v7)
  {
    xpc_dictionary_set_BOOL(xdict, kBackgroundTaskAgentNetworkRequired, 1);
    xpc_dictionary_set_BOOL(xdict, kBackgroundTaskAgentCellularAllowed, 1);
  }

  xpc_dictionary_set_double(xdict, kBackgroundTaskAgentJobWindowStartTime, v12);
  xpc_dictionary_set_double(xdict, kBackgroundTaskAgentJobWindowEndTime, v12);
  xpc_dictionary_set_BOOL(xdict, kBackgroundTaskAgentJobWindowAdjustTime, 0);
  BackgroundTaskAgentRemoveJob(a4, v13);
  BackgroundTaskAgentAddJob(a4, xdict);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:]( &OBJC_CLASS___NSDateFormatter,  "localizedStringFromDate:dateStyle:timeStyle:",  v15,  1LL,  1LL));
  [v14 logAtLevel:1, "-[SUBackgroundTaskAgent scheduleAutoInstallTaskAtDate:jobName:windowName:needsNetwork:needsPower:]", @"scheduled auto-install task at date: %@ (window %@)", v16, v10 label format];
}

- (void)scheduleAutoInstallStartInstallTaskWithDate:(id)a3 windowName:(id)a4 indicatingUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  double v11 = v10;
  double v12 = @"NO";
  if (v5) {
    double v12 = @"YES";
  }
  [v10 logAtLevel:2, "-[SUBackgroundTaskAgent scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:]", @"schedule auto-install with date:%@, window:%@, indicateUpdate:%@", v8, v9, v12 label format];

  if (v8)
  {
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    v15 = v14;
    if (v13)
    {
      [v8 timeIntervalSinceNow];
      objc_msgSend( v15,  "logAtLevel:label:format:",  2,  "-[SUBackgroundTaskAgent scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:]",  @"Start of activity will be delayed for %d seconds",  (uint64_t)v16);

      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_GRACE_PERIOD, 0LL);
      [v8 timeIntervalSinceNow];
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, (uint64_t)v17);
      if (v5)
      {
        xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_MAY_REBOOT_DEVICE, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        v19 = v18;
        v20 = @"scheduling auto-install task with indication that callback may reboot device";
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        v19 = v18;
        v20 = @"scheduling auto-install task WITHOUT indication that callback may reboot device [TEST MODE]";
      }

      [v18 logAtLevel:1 label:"-[SUBackgroundTaskAgent scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:]" format:v20];

      xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100036E7C;
      handler[3] = &unk_100065B68;
      handler[4] = self;
      id v22 = v9;
      id v23 = v13;
      xpc_activity_register("com.apple.softwareupdate.autoinstall.startInstall", v23, handler);
    }

    else
    {
      [v14 logAtLevel:0 label:"-[SUBackgroundTaskAgent scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:]" format:@"Failed to schedule AutoInstall start task"];
    }
  }
}

- (void)handleDuetCallback:(id)a3 criteria:(id)a4 activity:(id)a5
{
  BOOL v7 = (_xpc_activity_s *)a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v9 logAtLevel:1, "-[SUBackgroundTaskAgent handleDuetCallback:criteria:activity:]", @"scheduled background task [AutoInstallStartInstallJob] has fired (window=%@)", v8 label format];

  xpc_activity_state_t state = xpc_activity_get_state(v7);
  if (state != 2)
  {
    xpc_activity_state_t v17 = state;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v15 = v14;
    xpc_activity_state_t v20 = v17;
    double v16 = @"xpc activity in state other than RUN (state=%d)";
    goto LABEL_6;
  }

  BOOL should_defer = xpc_activity_should_defer(v7);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  xpc_object_t v13 = v12;
  if (!should_defer)
  {
    [v12 logAtLevel:1 label:"-[SUBackgroundTaskAgent handleDuetCallback:criteria:activity:]" format:@"Duet criteria met - starting install transaction"];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[SUControllerTransactionManager sharedManager]( &OBJC_CLASS___SUControllerTransactionManager,  "sharedManager"));
    [v18 beginTransaction:@"BackgroundTask"];
    notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100037060;
    block[3] = &unk_100065250;
    block[4] = self;
    id v22 = v18;
    id v15 = v18;
    dispatch_async(notificationQueue, block);

    goto LABEL_8;
  }

  [v12 logAtLevel:1 label:"-[SUBackgroundTaskAgent handleDuetCallback:criteria:activity:]" format:@"Duet wants to defer"];

  if (!xpc_activity_set_state(v7, 3LL))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v15 = v14;
    double v16 = @"fail to set defer XPC activity state defer";
LABEL_6:
    objc_msgSend( v14,  "logAtLevel:label:format:",  1,  "-[SUBackgroundTaskAgent handleDuetCallback:criteria:activity:]",  v16,  v20);
LABEL_8:
  }
}

- (void)scheduleAutoInstallExpirationTaskWithDate:(id)a3 windowName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v7 logAtLevel:2, "-[SUBackgroundTaskAgent scheduleAutoInstallExpirationTaskWithDate:windowName:]", @"schedule auto-install expiration at date:%@, window:%@", v8, v6 label format];

  if (v8) {
    -[SUBackgroundTaskAgent scheduleAutoInstallTaskAtDate:jobName:windowName:needsNetwork:needsPower:]( self,  "scheduleAutoInstallTaskAtDate:jobName:windowName:needsNetwork:needsPower:",  v8,  "com.apple.softwareupdate.autoinstall.installWindowEnd",  v6,  0LL,  0LL);
  }
}

- (void)cancelAutoInstallStartInstallTask
{
}

- (void)cancelAutoInstallExpirationTask
{
}

- (void)_handleAutoInstallStartInstall:(id)a3 parameters:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100037238;
  v6[3] = &unk_100065250;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)_handleAutoInstallExpirationTask:(id)a3 parameters:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100037318;
  v6[3] = &unk_100065250;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void).cxx_destruct
{
}

@end
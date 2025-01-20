@interface TPSWelcome
+ (void)resetWelcomeNotifications;
- (BOOL)isReminderCompleted;
- (BOOL)setupCompleted;
- (BOOL)shouldShowWelcomeNotification;
- (BOOL)stopWelcomeNotification;
- (BOOL)welcomeXPCActivityScheduleInProgress;
- (TPSNotificationController)notificationController;
- (TPSTipsManager)tipsManager;
- (TPSWelcome)initWithDelegate:(id)a3 tipsManager:(id)a4 notificationController:(id)a5;
- (TPSWelcomeDelegate)delegate;
- (id)getCurrentWelcomeActivityCriteria;
- (unint64_t)reminderState;
- (void)createWelcomeXPCActivity;
- (void)reconnectWelcomeIfNeeded:(BOOL)a3;
- (void)registerToNotifyWelcome;
- (void)scheduleWelcomeNotificationActivity;
- (void)setDelegate:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)setTipsManager:(id)a3;
- (void)setWelcomeXPCActivityScheduleInProgress:(BOOL)a3;
- (void)welcomeNotificationDisplayed;
@end

@implementation TPSWelcome

+ (void)resetWelcomeNotifications
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setObject:&off_10001DAF8 forKey:@"TPSWelcomeNotificationViewedVersion"];
  [v4 synchronize];
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 appGroupDefaults]);

  [v3 removeObjectForKey:@"collectionStatusMap"];
  [v3 synchronize];
}

- (TPSWelcome)initWithDelegate:(id)a3 tipsManager:(id)a4 notificationController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TPSWelcome;
  v11 = -[TPSWelcome init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    -[TPSWelcome setDelegate:](v11, "setDelegate:", v8);
    objc_storeStrong((id *)&v12->_tipsManager, a4);
    objc_storeStrong((id *)&v12->_notificationController, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if (+[TPSDefaultsManager resetDaemonData](&OBJC_CLASS___TPSDefaultsManager, "resetDaemonData"))
    {
      [v13 setObject:&off_10001DAF8 forKey:@"TPSWelcomeNotificationViewedVersion"];
      [v13 removeObjectForKey:@"TPSWelcomeNotificationReminderState"];
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appGroupDefaults]);

      [v15 removeObjectForKey:@"collectionStatusMap"];
    }
  }

  return v12;
}

- (unint64_t)reminderState
{
  if (!+[TPSNotificationController supportsWelcomeNotification]( &OBJC_CLASS___TPSNotificationController,  "supportsWelcomeNotification")) {
    return 1LL;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"TPSWelcomeNotificationReminderState"]);
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (void)reconnectWelcomeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification")
    && -[TPSWelcome setupCompleted](self, "setupCompleted"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if ([v5 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"])
    {
      -[TPSWelcome registerToNotifyWelcome](self, "registerToNotifyWelcome");
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"]);
      if (v6 && !-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress"))
      {
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Re-register for xpc_activity to show welcome notification",  buf,  2u);
        }

        -[TPSWelcome setWelcomeXPCActivityScheduleInProgress:](self, "setWelcomeXPCActivityScheduleInProgress:", 1LL);
        id v8 = v6;
        id v9 = (const char *)[v8 UTF8String];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472LL;
        v10[2] = sub_100001DFC;
        v10[3] = &unk_10001C960;
        v10[4] = self;
        id v11 = v8;
        xpc_activity_register(v9, XPC_ACTIVITY_CHECK_IN, v10);
      }

      else if (v3)
      {
        -[TPSWelcome scheduleWelcomeNotificationActivity](self, "scheduleWelcomeNotificationActivity");
      }
    }
  }

- (BOOL)isReminderCompleted
{
  return (id)-[TPSWelcome reminderState](self, "reminderState") == (id)1;
}

- (BOOL)shouldShowWelcomeNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"TPSWelcomeNotificationViewedVersion"]);
  unsigned int v5 = [v4 intValue];

  if ((v5 & 0x80000000) != 0)
  {
LABEL_7:
    int v9 = 0;
    goto LABEL_8;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 majorVersion]);
  unsigned int v8 = [v7 intValue];

  if (v5 != v8)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Major version changed", v15, 2u);
    }

    [v2 setObject:&off_10001DB10 forKey:@"TPSWelcomeNotificationViewedVersion"];
    [v2 setObject:&off_10001DB28 forKey:@"TPSWelcomeNotificationReminderState"];
    [v2 removeObjectForKey:@"TPSNoMoreTipsContent"];
    [v2 removeObjectForKey:@"TPSWaitingToShowWelcomeNotification"];
    [v2 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
    [v2 removeObjectForKey:@"TPSWelcomeNotificationStartDate"];
    [v2 synchronize];
    goto LABEL_7;
  }

  int v9 = 1;
LABEL_8:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSDefaultsManager notificationDocument](&OBJC_CLASS___TPSDefaultsManager, "notificationDocument"));

  if (v11
    || ((v9 | +[TPSNotificationController supportsWelcomeNotification]( &OBJC_CLASS___TPSNotificationController,  "supportsWelcomeNotification") ^ 1) & 1) != 0)
  {
    BOOL v12 = 0;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"TPSWelcomeNotificationReminderState"]);
    BOOL v12 = [v14 unsignedIntegerValue] == 0;
  }

  return v12;
}

- (id)getCurrentWelcomeActivityCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  +[TPSDefaultsManager welcomeNotificationDelay](&OBJC_CLASS___TPSDefaultsManager, "welcomeNotificationDelay");
  else {
    int64_t v4 = 3 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  +[TPSDefaultsManager welcomeNotificationGracePeriod]( &OBJC_CLASS___TPSDefaultsManager,  "welcomeNotificationGracePeriod");
  double v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"TPSWelcomeNotificationStartDate"]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceDate:v8];
    double v12 = v11;

    int64_t v4 = (uint64_t)((double)v4 - v12);
  }

  else {
    int64_t v13 = 2 * XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  if (v4 >= 1) {
    int64_t v14 = v4;
  }
  else {
    int64_t v14 = XPC_ACTIVITY_INTERVAL_30_MIN;
  }
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_DELAY, v14);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, v13);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);

  return v2;
}

- (void)scheduleWelcomeNotificationActivity
{
  if (!-[TPSWelcome reminderState](self, "reminderState")
    && !-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress")
    && -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = [v3 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"];

    if (v4)
    {
      -[TPSWelcome registerToNotifyWelcome](self, "registerToNotifyWelcome");
    }

    else
    {
      unsigned int v5 = -[TPSWelcome setupCompleted](self, "setupCompleted");
      double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "User is not in setup, proceed to schedule welcome notification",  buf,  2u);
        }

        -[TPSWelcome createWelcomeXPCActivity](self, "createWelcomeXPCActivity");
      }

      else
      {
        if (v7)
        {
          *(_WORD *)unsigned int v8 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "User currently in Setup, wait before registering for welcome notification",  v8,  2u);
        }
      }
    }
  }

- (void)createWelcomeXPCActivity
{
  if (!-[TPSWelcome welcomeXPCActivityScheduleInProgress](self, "welcomeXPCActivityScheduleInProgress")
    && -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"]);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"TPSWelcomeNotificationReminderState"]);
    uint64_t v6 = (int)[v5 intValue];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.tipsd.showWelcomeNotification.reminderCount-%zd",  v6));
    if ([v7 isEqualToString:v4])
    {
      -[TPSWelcome reconnectWelcomeIfNeeded:](self, "reconnectWelcomeIfNeeded:", 0LL);
    }

    else
    {
      -[TPSWelcome setWelcomeXPCActivityScheduleInProgress:](self, "setWelcomeXPCActivityScheduleInProgress:", 1LL);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome delegate](self, "delegate"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10000263C;
      v9[3] = &unk_10001C9B0;
      id v10 = v3;
      id v11 = v7;
      double v12 = self;
      [v8 welcome:self contentAvailableRemotelyWithCompletionHandler:v9];
    }
  }

- (BOOL)setupCompleted
{
  int HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun(self, a2);
  if (HasCompletedInitialRun) {
    LOBYTE(HasCompletedInitialRun) = BYSetupAssistantNeedsToRun() ^ 1;
  }
  return HasCompletedInitialRun;
}

- (void)registerToNotifyWelcome
{
  if (-[TPSWelcome setupCompleted](self, "setupCompleted"))
  {
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if (-[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification"))
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome tipsManager](self, "tipsManager"));
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 welcomeDocumentFromContentPackage:0]);

      if (v5)
      {
        if (([v3 BOOLForKey:@"TPSWaitingToShowWelcomeNotification"] & 1) == 0)
        {
          [v3 setBool:1 forKey:@"TPSWaitingToShowWelcomeNotification"];
          [v3 synchronize];
        }

        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v8 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Register for empty lock screen for welcome notification",  v8,  2u);
        }

        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSWelcome delegate](self, "delegate"));
        [v7 welcome:self notifyWelcomeDocument:v5];
      }
    }

    else
    {
      [v3 setBool:0 forKey:@"TPSWaitingToShowWelcomeNotification"];
      [v3 synchronize];
    }
  }

- (void)welcomeNotificationDisplayed
{
  unint64_t v3 = -[TPSWelcome reminderState](self, "reminderState");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 setBool:0 forKey:@"TPSWaitingToShowWelcomeNotification"];

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v3 + 1));
  [v5 setObject:v6 forKey:@"TPSWelcomeNotificationReminderState"];

  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3 == -1LL)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification", buf, 2u);
    }

    -[TPSWelcome scheduleWelcomeNotificationActivity](self, "scheduleWelcomeNotificationActivity");
  }

  else
  {
    if (v8)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notification reminder ended", v15, 2u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v9 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 majorVersion]);
    [v10 setObject:v12 forKey:@"TPSWelcomeNotificationViewedVersion"];

    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v13 synchronize];
  }

  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v14 synchronize];
}

- (BOOL)stopWelcomeNotification
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"]);
  unsigned int v5 = v4;
  if (v4) {
    xpc_activity_unregister((const char *)[v4 UTF8String]);
  }
  BOOL v6 = -[TPSWelcome shouldShowWelcomeNotification](self, "shouldShowWelcomeNotification");
  if (v6)
  {
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](&OBJC_CLASS___TPSLogger, "welcome"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stop any welcome reminder flow.", v11, 2u);
    }
  }

  [v3 setObject:&off_10001DB40 forKey:@"TPSWelcomeNotificationReminderState"];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](&OBJC_CLASS___TPSCommonDefines, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 majorVersion]);
  [v3 setObject:v9 forKey:@"TPSWelcomeNotificationViewedVersion"];

  [v3 removeObjectForKey:@"TPSWaitingToShowWelcomeNotification"];
  [v3 removeObjectForKey:@"TPSCurrentWelcomeXPCActivityIdentifier"];
  [v3 synchronize];

  return v6;
}

- (TPSWelcomeDelegate)delegate
{
  return (TPSWelcomeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)welcomeXPCActivityScheduleInProgress
{
  return self->_welcomeXPCActivityScheduleInProgress;
}

- (void)setWelcomeXPCActivityScheduleInProgress:(BOOL)a3
{
  self->_welcomeXPCActivityScheduleInProgress = a3;
}

- (TPSTipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
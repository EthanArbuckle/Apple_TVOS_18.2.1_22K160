@interface PBWhatsNewService
+ (id)sharedInstance;
- (BOOL)_isHeadBoardAppFocused;
- (double)checkTimeInterval;
- (void)_presentWhatsNewDialog;
- (void)_scheduleWhatsNewCheckTaskWithInterval:(double)a3;
- (void)dealloc;
- (void)noteGoodTimeToShowWhatsNew;
- (void)setCheckTimeInterval:(double)a3;
- (void)startWhatsNewMonitoring;
@end

@implementation PBWhatsNewService

+ (id)sharedInstance
{
  if (qword_100470878 != -1) {
    dispatch_once(&qword_100470878, &stru_1003D4908);
  }
  return (id)qword_100470870;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_whatsNewNotifyToken)) {
    notify_cancel(self->_whatsNewNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBWhatsNewService;
  -[PBWhatsNewService dealloc](&v3, "dealloc");
}

- (void)startWhatsNewMonitoring
{
  id v3 = sub_1000F7A14();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Start monitoring What's New", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:TVWNServiceDefaultsAlwaysShowOverrideKey];

  if (v6)
  {
    id v7 = sub_1000F7A14();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Showing What's New because of defaults override",  (uint8_t *)buf,  2u);
    }

    -[PBWhatsNewService _presentWhatsNewDialog](self, "_presentWhatsNewDialog");
  }

  if (!self->_monitoringStarted)
  {
    objc_initWeak(buf, self);
    v9 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10009DC20;
    handler[3] = &unk_1003D2CA8;
    objc_copyWeak(&v11, buf);
    notify_register_dispatch( "com.apple.TVWhatsNew.needsBecomeActive",  &self->_whatsNewNotifyToken,  &_dispatch_main_q,  handler);

    -[PBWhatsNewService checkTimeInterval](self, "checkTimeInterval");
    -[PBWhatsNewService _scheduleWhatsNewCheckTaskWithInterval:](self, "_scheduleWhatsNewCheckTaskWithInterval:");
    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }

  self->_monitoringStarted = 1;
}

- (void)noteGoodTimeToShowWhatsNew
{
  if (self->_shouldRetryShowingWhatsNew)
  {
    self->_shouldRetryShowingWhatsNew = 0;
    id v3 = sub_1000F7A14();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Good time to show What's New!", v5, 2u);
    }

    -[PBWhatsNewService _presentWhatsNewDialog](self, "_presentWhatsNewDialog");
  }

- (void)setCheckTimeInterval:(double)a3
{
  self->_checkTimeInterval = a3;
  if (!self->_monitoringStarted || self->_currentCheckTimeInterval == a3)
  {
    id v4 = sub_1000F7A14();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Will NOT update What's New schedule. Service has not started or time interval is the same",  v6,  2u);
    }
  }

  else
  {
    -[PBWhatsNewService checkTimeInterval](self, "checkTimeInterval");
    -[PBWhatsNewService _scheduleWhatsNewCheckTaskWithInterval:](self, "_scheduleWhatsNewCheckTaskWithInterval:");
  }

- (double)checkTimeInterval
{
  double result = self->_checkTimeInterval;
  if (result <= 0.0) {
    return 68400.0;
  }
  return result;
}

- (BOOL)_isHeadBoardAppFocused
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 focusedSceneHandle]);
  unsigned __int8 v4 = [v3 isDefaultKioskAppScene];

  return v4;
}

- (void)_scheduleWhatsNewCheckTaskWithInterval:(double)a3
{
  id v5 = sub_1000F7A14();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "scheduling What's New with interval: %f.",  buf,  0xCu);
  }

  self->_currentCheckTimeInterval = a3;
  if (self->_whatsNewCheckTask)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
    [v7 unregisterBackgroundTask:self->_whatsNewCheckTask];

    whatsNewCheckTask = self->_whatsNewCheckTask;
    self->_whatsNewCheckTask = 0LL;
  }

  v9 = -[TVSBackgroundTask initWithType:interval:delay:async:]( objc_alloc(&OBJC_CLASS___TVSBackgroundTask),  "initWithType:interval:delay:async:",  1LL,  1LL,  a3,  a3);
  v10 = self->_whatsNewCheckTask;
  self->_whatsNewCheckTask = v9;

  objc_initWeak((id *)buf, self);
  id v11 = self->_whatsNewCheckTask;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10009DF98;
  v13[3] = &unk_1003D0890;
  objc_copyWeak(&v14, (id *)buf);
  -[TVSBackgroundTask setPerformBlock:](v11, "setPerformBlock:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSBackgroundTaskManager sharedInstance](&OBJC_CLASS___TVSBackgroundTaskManager, "sharedInstance"));
  [v12 registerBackgroundTask:self->_whatsNewCheckTask];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_presentWhatsNewDialog
{
  id v3 = sub_1000F7A14();
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Determining whether to launch What's New",  buf,  2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v6 = [v5 shouldLaunchCRD];

  if (v6)
  {
    id v7 = sub_1000F7A14();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "What's New will not be shown. CRD mode enabled.",  buf,  2u);
    }
  }

  else
  {
    if (self->_presentingWhatsNew) {
      return;
    }
    self->_presentingWhatsNew = 1;
    v12[0] = TVWNServiceOptionShouldShowWallpaperKey;
    v12[1] = TVWNServiceOptionShouldDismissOnMenuEventKey;
    v13[0] = &__kCFBooleanTrue;
    v13[1] = &__kCFBooleanTrue;
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009E1F8;
    v10[3] = &unk_1003D4930;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009E424;
    v9[3] = &unk_1003D4958;
    +[TVWNService shouldShowWhatsNewWithOptions:reply:dismissHandler:]( &OBJC_CLASS___TVWNService,  "shouldShowWhatsNewWithOptions:reply:dismissHandler:",  v8,  v10,  v9);
  }
}

- (void).cxx_destruct
{
}

@end
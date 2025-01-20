@interface ManagedConfiguration
+ (ManagedConfiguration)sharedInstance;
- (BOOL)coredata_diagnostic_metrics_enabled;
- (BOOL)disable_dps_wd;
- (BOOL)megawifiprofile_diagnostic_metrics_before_first_assoc;
- (BOOL)megawifiprofile_diagnostic_metrics_enabled;
- (BOOL)megawifiprofile_diagnostic_metrics_while_unassoc;
- (BOOL)monitoring;
- (BOOL)profileLoaded;
- (ManagedConfiguration)init;
- (NSDictionary)profileConfiguration;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)megaProfileInstalledTransaction;
- (WADiagDBDelegate)dbDelegate;
- (int)profileNoticeToken;
- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms;
- (void)MCSettingsDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileChangedCallback:(int)a3;
- (void)scheduleWithQueue:(id)a3;
- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setDbDelegate:(id)a3;
- (void)setMegaProfileInstalledTransaction:(id)a3;
- (void)setMegawifiprofile_diagnostic_metrics_before_first_assoc:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3;
- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3;
- (void)setMegawifiprofile_diagnostic_metrics_while_unassoc:(BOOL)a3;
- (void)setMonitoring:(BOOL)a3;
- (void)setProfileConfiguration:(id)a3;
- (void)setProfileLoaded:(BOOL)a3;
- (void)setProfileNoticeToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation ManagedConfiguration

+ (ManagedConfiguration)sharedInstance
{
  if (qword_1000ECF90 != -1) {
    dispatch_once(&qword_1000ECF90, &stru_1000CCF68);
  }
  return (ManagedConfiguration *)(id)qword_1000ECF88;
}

- (ManagedConfiguration)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ManagedConfiguration;
  v2 = -[ManagedConfiguration init](&v15, "init");
  id v3 = WALogCategoryDefaultHandle();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "-[ManagedConfiguration init]";
      __int16 v18 = 1024;
      int v19 = 104;
      __int16 v20 = 2112;
      v21 = @"com.apple.wifianalyticsd";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:starting id %@", buf, 0x1Cu);
    }

    -[ManagedConfiguration setMonitoring:](v2, "setMonitoring:", 0LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s persistentDomainForName:]( v5,  "persistentDomainForName:",  @"com.apple.wifianalyticsd"));
    id v7 = WALogCategoryDefaultHandle();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v17 = "-[ManagedConfiguration init]";
      __int16 v18 = 1024;
      int v19 = 114;
      __int16 v20 = 2112;
      v21 = @"com.apple.wifianalyticsd";
      __int16 v22 = 2112;
      v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:RecommendationPreferences bundleIdentifier %@ defaults %@",  buf,  0x26u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unsigned int v10 = +[WAUtil isWiFiFragmentSamplingEnabled](&OBJC_CLASS___WAUtil, "isWiFiFragmentSamplingEnabled");
    if (v10) {
      v11 = &__kCFBooleanTrue;
    }
    else {
      v11 = &__kCFBooleanFalse;
    }
    if (v10) {
      v12 = &off_1000E0030;
    }
    else {
      v12 = &off_1000E0048;
    }
    [v9 setObject:v11 forKey:@"megawifiprofile_diagnostic_metrics_enabled"];
    [v9 setObject:v12 forKey:@"megawifiprofile_diagnostic_metrics_period_ms"];
    [v9 setObject:v11 forKey:@"coredata_diagnostic_metrics_enabled"];
    [v9 setObject:&__kCFBooleanFalse forKey:@"megawifiprofile_diagnostic_metrics_before_first_assoc"];
    [v9 setObject:&__kCFBooleanTrue forKey:@"megawifiprofile_diagnostic_metrics_while_unassoc"];
    -[os_log_s setPersistentDomain:forName:](v5, "setPersistentDomain:forName:", v6, @"com.apple.wifianalyticsd");
    -[os_log_s registerDefaults:](v5, "registerDefaults:", v9);
    -[os_log_s addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v2,  @"megawifiprofile_diagnostic_metrics_enabled",  5LL,  0LL);
    -[os_log_s addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v2,  @"megawifiprofile_diagnostic_metrics_period_ms",  5LL,  0LL);
    -[os_log_s addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v2,  @"coredata_diagnostic_metrics_enabled",  5LL,  0LL);
    -[os_log_s addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v2,  @"megawifiprofile_diagnostic_metrics_before_first_assoc",  5LL,  0LL);
    -[os_log_s addObserver:forKeyPath:options:context:]( v5,  "addObserver:forKeyPath:options:context:",  v2,  @"megawifiprofile_diagnostic_metrics_while_unassoc",  5LL,  0LL);
    v13 = v2;
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[ManagedConfiguration init]";
    __int16 v18 = 1024;
    int v19 = 102;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
  }

  return v2;
}

- (void)dealloc
{
  if (-[ManagedConfiguration monitoring](self, "monitoring")) {
    -[ManagedConfiguration stopMonitoring](self, "stopMonitoring");
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_period_ms"];
  [v3 removeObserver:self forKeyPath:@"coredata_diagnostic_metrics_enabled"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_before_first_assoc"];
  [v3 removeObserver:self forKeyPath:@"megawifiprofile_diagnostic_metrics_while_unassoc"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ManagedConfiguration;
  -[ManagedConfiguration dealloc](&v4, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a5 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    v11 = v9;
  }
  else {
    v11 = 0LL;
  }
  id v12 = v11;
  if (![v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_enabled"])
  {
    if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_period_ms"])
    {
      if (!v12) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_period_ms:]( self,  "setMegawifiprofile_diagnostic_metrics_period_ms:",  [v12 unsignedIntValue]);
      id v18 = WALogCategoryDefaultHandle();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v24 = 1024;
      int v25 = 192;
      __int16 v26 = 2112;
      v27 = @"megawifiprofile_diagnostic_metrics_period_ms";
      __int16 v28 = 2048;
      unint64_t v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_period_ms]( self,  "megawifiprofile_diagnostic_metrics_period_ms");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }

    else if ([v8 isEqualToString:@"coredata_diagnostic_metrics_enabled"])
    {
      if (!v12) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setCoredata_diagnostic_metrics_enabled:]( self,  "setCoredata_diagnostic_metrics_enabled:",  [v12 BOOLValue]);
      id v19 = WALogCategoryDefaultHandle();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v24 = 1024;
      int v25 = 197;
      __int16 v26 = 2112;
      v27 = @"coredata_diagnostic_metrics_enabled";
      __int16 v28 = 2048;
      unint64_t v29 = -[ManagedConfiguration coredata_diagnostic_metrics_enabled](self, "coredata_diagnostic_metrics_enabled");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }

    else if ([v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_before_first_assoc"])
    {
      if (!v12) {
        goto LABEL_28;
      }
      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_before_first_assoc:]( self,  "setMegawifiprofile_diagnostic_metrics_before_first_assoc:",  [v12 BOOLValue]);
      id v20 = WALogCategoryDefaultHandle();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v24 = 1024;
      int v25 = 202;
      __int16 v26 = 2112;
      v27 = @"megawifiprofile_diagnostic_metrics_before_first_assoc";
      __int16 v28 = 2048;
      unint64_t v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_before_first_assoc]( self,  "megawifiprofile_diagnostic_metrics_before_first_assoc");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }

    else
    {
      if (![v8 isEqualToString:@"megawifiprofile_diagnostic_metrics_while_unassoc"]
        || !v12)
      {
        goto LABEL_28;
      }

      -[ManagedConfiguration setMegawifiprofile_diagnostic_metrics_while_unassoc:]( self,  "setMegawifiprofile_diagnostic_metrics_while_unassoc:",  [v12 BOOLValue]);
      id v21 = WALogCategoryDefaultHandle();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v22 = 136446978;
      v23 = "-[ManagedConfiguration observeValueForKeyPath:ofObject:change:context:]";
      __int16 v24 = 1024;
      int v25 = 207;
      __int16 v26 = 2112;
      v27 = @"megawifiprofile_diagnostic_metrics_while_unassoc";
      __int16 v28 = 2048;
      unint64_t v29 = -[ManagedConfiguration megawifiprofile_diagnostic_metrics_while_unassoc]( self,  "megawifiprofile_diagnostic_metrics_while_unassoc");
      v17 = "%{public}s::%d:%@ Preference is %lu";
    }

- (void)MCSettingsDidChange:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "-[ManagedConfiguration MCSettingsDidChange:]";
    __int16 v10 = 1024;
    int v11 = 215;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:MCNotification received",  (uint8_t *)&v8,  0x12u);
  }

  -[ManagedConfiguration profileChangedCallback:](self, "profileChangedCallback:", 0LL);
  objc_autoreleasePoolPop(v5);
}

- (void)scheduleWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  -[ManagedConfiguration setQueue:](self, "setQueue:", v4);
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v11 = "-[ManagedConfiguration scheduleWithQueue:]";
    __int16 v12 = 1024;
    int v13 = 226;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:scheduleWithQueue", buf, 0x12u);
  }

  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ManagedConfiguration queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000343DC;
  block[3] = &unk_1000CCD80;
  block[4] = self;
  dispatch_async(v8, block);

  objc_autoreleasePoolPop(v5);
}

- (void)unscheduleFromQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_autoreleasePoolPush();
  id v6 = WALogCategoryDefaultHandle();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    v9 = "-[ManagedConfiguration unscheduleFromQueue:]";
    __int16 v10 = 1024;
    int v11 = 238;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:unscheduleFromQueue",  (uint8_t *)&v8,  0x12u);
  }

  -[ManagedConfiguration stopMonitoring](self, "stopMonitoring");
  -[ManagedConfiguration setQueue:](self, "setQueue:", 0LL);
  objc_autoreleasePoolPop(v5);
}

- (void)startMonitoring
{
  p_profileNoticeToken = &self->_profileNoticeToken;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100034768;
  handler[3] = &unk_1000CCF90;
  handler[4] = self;
  uint32_t v6 = notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileNoticeToken, v5, handler);

  id v7 = WALogCategoryDefaultHandle();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "-[ManagedConfiguration startMonitoring]";
    __int16 v18 = 1024;
    int v19 = 256;
    __int16 v20 = 1024;
    uint32_t v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:notify_register_dispatch for PROFILE_SERVICE_IDENTIFIER %d",  buf,  0x18u);
  }

  v9 = objc_autoreleasePoolPush();
  id v10 = WALogCategoryDefaultHandle();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[ManagedConfiguration startMonitoring]";
    __int16 v18 = 1024;
    int v19 = 267;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Adding DarwinNotifyCenter Observer",  buf,  0x12u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  int v13 = DarwinNotifyCenter;
  if (DarwinNotifyCenter)
  {
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_100034774,  @"CCDaemonProfile Changed",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v5, &stru_1000CCFD0);
  }

  else
  {
    id v14 = WALogCategoryDefaultHandle();
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[ManagedConfiguration startMonitoring]";
      __int16 v18 = 1024;
      int v19 = 270;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%{public}s::%d:Unable to get DarwinNotifyCenter",  buf,  0x12u);
    }
  }

  -[ManagedConfiguration setMonitoring:](self, "setMonitoring:", v13 != 0LL);
  objc_autoreleasePoolPop(v9);
}

- (void)profileChangedCallback:(int)a3
{
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ManagedConfiguration queue](self, "queue", *(void *)&a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000349E4;
  block[3] = &unk_1000CCD80;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)stopMonitoring
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = WALogCategoryDefaultHandle();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[ManagedConfiguration stopMonitoring]";
    __int16 v8 = 1024;
    int v9 = 414;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:removing observer",  (uint8_t *)&v6,  0x12u);
  }

  -[ManagedConfiguration setMonitoring:](self, "setMonitoring:", 0LL);
  objc_autoreleasePoolPop(v3);
}

- (WADiagDBDelegate)dbDelegate
{
  return (WADiagDBDelegate *)objc_loadWeakRetained((id *)&self->_dbDelegate);
}

- (void)setDbDelegate:(id)a3
{
}

- (BOOL)disable_dps_wd
{
  return self->_disable_dps_wd;
}

- (BOOL)megawifiprofile_diagnostic_metrics_enabled
{
  return self->_megawifiprofile_diagnostic_metrics_enabled;
}

- (void)setMegawifiprofile_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_enabled = a3;
}

- (unint64_t)megawifiprofile_diagnostic_metrics_period_ms
{
  return self->_megawifiprofile_diagnostic_metrics_period_ms;
}

- (void)setMegawifiprofile_diagnostic_metrics_period_ms:(unint64_t)a3
{
  self->_megawifiprofile_diagnostic_metrics_period_ms = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_before_first_assoc
{
  return self->_megawifiprofile_diagnostic_metrics_before_first_assoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_before_first_assoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_before_first_assoc = a3;
}

- (BOOL)megawifiprofile_diagnostic_metrics_while_unassoc
{
  return self->_megawifiprofile_diagnostic_metrics_while_unassoc;
}

- (void)setMegawifiprofile_diagnostic_metrics_while_unassoc:(BOOL)a3
{
  self->_megawifiprofile_diagnostic_metrics_while_unassoc = a3;
}

- (BOOL)coredata_diagnostic_metrics_enabled
{
  return self->_coredata_diagnostic_metrics_enabled;
}

- (void)setCoredata_diagnostic_metrics_enabled:(BOOL)a3
{
  self->_coredata_diagnostic_metrics_enabled = a3;
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (void)setMonitoring:(BOOL)a3
{
  self->_monitoring = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)profileConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setProfileConfiguration:(id)a3
{
}

- (BOOL)profileLoaded
{
  return self->_profileLoaded;
}

- (void)setProfileLoaded:(BOOL)a3
{
  self->_profileLoaded = a3;
}

- (OS_os_transaction)megaProfileInstalledTransaction
{
  return self->_megaProfileInstalledTransaction;
}

- (void)setMegaProfileInstalledTransaction:(id)a3
{
}

- (int)profileNoticeToken
{
  return self->_profileNoticeToken;
}

- (void)setProfileNoticeToken:(int)a3
{
  self->_profileNoticeToken = a3;
}

- (void).cxx_destruct
{
}

@end
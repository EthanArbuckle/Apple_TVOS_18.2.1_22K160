@interface PBRetailDemoModeObserver
+ (id)sharedInstance;
- (NSString)lastTriggerValue;
- (PBRetailDemoModeObserver)init;
- (id)_currentTriggerValue;
- (void)_configureForDemoMode:(unint64_t)a3;
- (void)_demoModeTriggerDidChange;
- (void)dealloc;
- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setLastTriggerValue:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation PBRetailDemoModeObserver

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001CABAC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471368 != -1) {
    dispatch_once(&qword_100471368, block);
  }
  return (id)qword_100471360;
}

- (PBRetailDemoModeObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRetailDemoModeObserver;
  v2 = -[PBRetailDemoModeObserver init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[PBRetailDemoModeObserver _currentTriggerValue](v2, "_currentTriggerValue"));
    lastTriggerValue = v3->_lastTriggerValue;
    v3->_lastTriggerValue = (NSString *)v4;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBRetailDemoModeObserver;
  -[PBRetailDemoModeObserver dealloc](&v3, "dealloc");
}

- (void)startObserving
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RetailDemoMode: Start observing",  v4,  2u);
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 registerObserver:self];
}

- (void)stopObserving
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RetailDemoMode: Stop observing",  v4,  2u);
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v3 unregisterObserver:self];
}

- (id)_currentTriggerValue
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"com.apple.appletv.demo.trigger", @"com.apple.demo-settings");
  if (v2)
  {
    objc_super v3 = (void *)v2;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v3)) {
      id v5 = [v3 copy];
    }
    else {
      id v5 = 0LL;
    }
    CFRelease(v3);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (void)_demoModeTriggerDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBRetailDemoModeObserver _currentTriggerValue](self, "_currentTriggerValue"));
  if ([v3 isEqual:@"Apple"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RetailDemoMode: Will configure for Apple Store",  buf,  2u);
    }

    uint64_t v4 = 1LL;
    goto LABEL_5;
  }

  if ([v3 isEqual:@"Channel"])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      uint64_t v4 = 2LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RetailDemoMode: Will configure for Channel",  v6,  2u);
    }

    else
    {
      uint64_t v4 = 2LL;
    }

- (void)_configureForDemoMode:(unint64_t)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplication tvsui_defaultIdleScreenEntriesConfigurationURL]( &OBJC_CLASS___UIApplication,  "tvsui_defaultIdleScreenEntriesConfigurationURL"));
  +[UIApplication tvsui_setIdleScreenEntriesConfigurationURL:]( &OBJC_CLASS___UIApplication,  "tvsui_setIdleScreenEntriesConfigurationURL:",  v3);
  +[UIApplication tvsui_setVideoPlaybackTimeout:](&OBJC_CLASS___UIApplication, "tvsui_setVideoPlaybackTimeout:", 120.0);
  +[UIApplication tvsui_setBundleIDsWithVideoRestriction:]( &OBJC_CLASS___UIApplication,  "tvsui_setBundleIDsWithVideoRestriction:",  0LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "RetailDemoMode: Relaunch",  v4,  2u);
  }

  dispatch_async(&_dispatch_main_q, &stru_1003DBD08);
}

- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = self->_lastTriggerValue;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[PBRetailDemoModeObserver _currentTriggerValue](self, "_currentTriggerValue"));
  objc_super v7 = (void *)v6;
  if (!v5)
  {
    if (!v6) {
      goto LABEL_8;
    }
LABEL_7:
    -[PBRetailDemoModeObserver _demoModeTriggerDidChange](self, "_demoModeTriggerDidChange");
    goto LABEL_8;
  }

  if (!v6
    || !-[NSString isEqualToString:](v5, "isEqualToString:", v6)
    && !-[NSString isEqualToString:](v5, "isEqualToString:", v7))
  {
    goto LABEL_7;
  }

- (NSString)lastTriggerValue
{
  return self->_lastTriggerValue;
}

- (void)setLastTriggerValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
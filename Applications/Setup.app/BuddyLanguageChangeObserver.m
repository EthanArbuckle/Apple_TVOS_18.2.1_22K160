@interface BuddyLanguageChangeObserver
- (BOOL)isObserving;
- (BuddyLanguageChangeObserverDelegate)delegate;
- (NSTimer)localeTimer;
- (void)dealloc;
- (void)languageDidChange;
- (void)localeDidChange;
- (void)localeTimerFired:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleTimer:(id)a3;
- (void)setObserving:(BOOL)a3;
- (void)startLocaleTimer;
- (void)startObservingLanguageChanges;
- (void)stopObservingLanguageChanges;
- (void)subscribeToLanguageChangeNotification;
- (void)subscribeToLocaleChangeNotification;
- (void)unsubscribeFromLanguageChangeNotification;
- (void)unsubscribeFromLocaleChangeNotification;
@end

@implementation BuddyLanguageChangeObserver

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___BuddyLanguageChangeObserver;
  -[BuddyLanguageChangeObserver dealloc](&v3, "dealloc");
}

- (void)startObservingLanguageChanges
{
  if (!-[BuddyLanguageChangeObserver isObserving](self, "isObserving"))
  {
    -[BuddyLanguageChangeObserver subscribeToLanguageChangeNotification](self, "subscribeToLanguageChangeNotification");
    -[BuddyLanguageChangeObserver subscribeToLocaleChangeNotification](self, "subscribeToLocaleChangeNotification");
    -[BuddyLanguageChangeObserver setObserving:](self, "setObserving:", 1LL);
  }

- (void)stopObservingLanguageChanges
{
  if (-[BuddyLanguageChangeObserver isObserving](self, "isObserving"))
  {
    -[BuddyLanguageChangeObserver unsubscribeFromLanguageChangeNotification]( self,  "unsubscribeFromLanguageChangeNotification");
    -[BuddyLanguageChangeObserver unsubscribeFromLocaleChangeNotification]( self,  "unsubscribeFromLocaleChangeNotification");
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));
    [v3 invalidate];

    -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", 0LL);
    -[BuddyLanguageChangeObserver setObserving:](self, "setObserving:", 0LL);
  }

- (void)subscribeToLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000320D4,  @"com.apple.language.changed",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLanguageChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.language.changed", 0LL);
}

- (void)languageDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"LockdownSetLanguage"]);

  if (v4)
  {
    id v5 = sub_10002AF94();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Language observer: Lockdown changed the language",  v7,  2u);
    }

    -[BuddyLanguageChangeObserver startLocaleTimer](self, "startLocaleTimer");
  }

- (void)startLocaleTimer
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));

  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Language observer: Restarting locale timer",  buf,  2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));
    [v7 invalidate];

    -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", 0LL);
  }

  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Language observer: Starting locale timer",  v9,  2u);
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "localeTimerFired:",  0LL,  0LL,  8.0));
  -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", v8);
}

- (void)localeTimerFired:(id)a3
{
  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Language observer: Locale didn't change in time, reporting only a language change to our delegate",  v8,  2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));
  [v6 invalidate];

  -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", 0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver delegate](self, "delegate"));
  [v7 observer:self didObserveLanguageChange:1 localeChange:0];
}

- (void)subscribeToLocaleChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10003240C,  @"AppleDatePreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLocaleChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AppleDatePreferencesChangedNotification", 0LL);
}

- (void)localeDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"LockdownSetLocale"]);

  if (v4)
  {
    id v5 = sub_10002AF94();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Language observer: Lockdown changed the locale",  v11,  2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));
    BOOL v8 = v7 != 0LL;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver localeTimer](self, "localeTimer"));
    [v9 invalidate];

    -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BuddyLanguageChangeObserver delegate](self, "delegate"));
    [v10 observer:self didObserveLanguageChange:v8 localeChange:1];
  }

- (BuddyLanguageChangeObserverDelegate)delegate
{
  return (BuddyLanguageChangeObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSTimer)localeTimer
{
  return self->_localeTimer;
}

- (void)setLocaleTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVSetupController
+ (id)sharedSetupController;
- (BOOL)deviceHasWiFi;
- (id)navigationController;
- (void)_createNav;
- (void)_finishBuddy;
- (void)_finishBuddyWhenReady;
- (void)_localeChanged;
- (void)_refreshLanguage;
- (void)dealloc;
- (void)didEnterBackground;
- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5;
- (void)resign;
- (void)respring;
- (void)run;
- (void)setBuddyComplete;
- (void)suspendApp;
@end

@implementation TVSetupController

+ (id)sharedSetupController
{
  v2 = (void *)qword_1001097C0;
  if (!qword_1001097C0)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSetupController);
    v4 = (void *)qword_1001097C0;
    qword_1001097C0 = (uint64_t)v3;

    v2 = (void *)qword_1001097C0;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[BuddyLanguageChangeObserver stopObservingLanguageChanges](self->_languageObserver, "stopObservingLanguageChanges");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSetupController;
  -[TVSetupController dealloc](&v4, "dealloc");
}

- (void)setBuddyComplete
{
  id v2 = sub_10002AF94();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Buddy Complete", (uint8_t *)v12, 2u);
  }

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v4 persist];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v5 setObject:&__kCFBooleanTrue forKey:BYBuddyDoneKey];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  BYBuddyTVOSCurrentVersion));
  [v5 setObject:v6 forKey:BYBuddyTVOSVersionKey];

  [v5 setObject:&__kCFBooleanTrue forKey:BYBuddyFinishedInitialRunKey];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 setObject:v7 forKey:BYBuddyLastExitKey];

  [v5 setObject:&__kCFBooleanTrue forKey:@"TVBuddyCompletedSuccessfully"];
  unsigned int v8 = [v5 synchronize];
  CFPreferencesSetValue( @"BuddySetupDone",  kCFBooleanTrue,  @"com.apple.keyboard",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  CFPreferencesSynchronize(@"com.apple.keyboard", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  int v9 = CFPreferencesSynchronize(BYSetupAssistantBundleIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v10 = sub_10002AF94();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109376;
    v12[1] = v8;
    __int16 v13 = 1024;
    int v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Preferences Sync Status: Buddy = %d BYSetupAssistantPrefs = %d",  (uint8_t *)v12,  0xEu);
  }
}

- (void)_finishBuddyWhenReady
{
  dispatch_time_t earliestCompletionTime = self->_earliestCompletionTime;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017BD8;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_after(earliestCompletionTime, &_dispatch_main_q, block);
}

- (void)_finishBuddy
{
  id v3 = sub_10002AF94();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posting Buddy finished", v15, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](&OBJC_CLASS___BYSetupStateNotifier, "sharedNotifier"));
  [v5 notifyStateChangedTo:2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](&OBJC_CLASS___BYSetupStateNotifier, "sharedNotifier"));
  [v6 notifyStateChangedTo:3];

  uint64_t v7 = lockdown_connect();
  if (v7)
  {
    uint64_t v8 = v7;
    lockdown_set_value(v7, @"com.apple.purplebuddy", @"SetupState", @"SetupUsingAssistant");
    lockdown_disconnect(v8);
  }

  +[VSMetricsManagerObjC sendCache](&OBJC_CLASS___VSMetricsManagerObjC, "sendCache");
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"VSProviderAppInstallMetadata"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
    [v9 removeObjectForKey:@"VSProviderAppInstallMetadata"];
    [v9 synchronize];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 videoSubscriberAccountServiceProxy]);
    [v14 installAppWithMetadata:v10];
  }

  -[TVSetupController suspendApp](self, "suspendApp");
}

- (id)navigationController
{
  return self->_nav;
}

- (void)_createNav
{
  windowView = self->_windowView;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UIView setBackgroundColor:](windowView, "setBackgroundColor:", v4);

  v5 = (TVSKNavigationController *)objc_claimAutoreleasedReturnValue( +[TVSKNavigationController sharedToplevelAnimatingNavigationController]( &OBJC_CLASS___TVSKNavigationController,  "sharedToplevelAnimatingNavigationController"));
  nav = self->_nav;
  self->_nav = v5;

  id v7 = sub_10002AF94();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v19 = +[BYLicenseAgreement versionOfAcceptedAgreement]( &OBJC_CLASS___BYLicenseAgreement,  "versionOfAcceptedAgreement");
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Version of newest accepted iOS SLA: %lu",  buf,  0xCu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  [v9 reloadHomeConfiguration];

  id v10 = sub_10002AF94();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Kicking off buddy flow...", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  uint64_t v12 = objc_alloc(&OBJC_CLASS___SATVFlowManager);
  __int16 v13 = self->_nav;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100017FB0;
  v16[3] = &unk_1000C93A0;
  objc_copyWeak(&v17, (id *)buf);
  int v14 = -[SATVFlowManager initWithNavigationController:completion:]( v12,  "initWithNavigationController:completion:",  v13,  v16);
  flowManager = self->_flowManager;
  self->_flowManager = v14;

  -[SATVWindow setRootViewController:](self->_window, "setRootViewController:", self->_nav);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)run
{
  self->_dispatch_time_t earliestCompletionTime = dispatch_time(0LL, 5000000000LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
  id v4 = sub_10002AF94();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138412290;
    v35 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Buddy can complete any time after %@",  (uint8_t *)&v34,  0xCu);
  }

  uint64_t v6 = WiFiManagerClientCreate(kCFAllocatorDefault, 0LL);
  if (v6)
  {
    id v7 = (const void *)v6;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop(v7, Current, kCFRunLoopDefaultMode);
    int v9 = (void *)WiFiManagerClientCopyDevices(v7);
    if ([v9 count])
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);

      if (!WiFiDeviceClientGetPower(v10))
      {
        id v11 = sub_10002AF94();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v34) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  " Wifi is off ! turning it on!",  (uint8_t *)&v34,  2u);
        }

        WiFiManagerClientSetPower(v7, 1LL);
      }
    }

    CFRunLoopRef v13 = CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop(v7, v13, kCFRunLoopDefaultMode);
    CFRelease(v7);
  }

  id v14 =  +[BYLocationController sharedBuddyLocationController]( &OBJC_CLASS___BYLocationController,  "sharedBuddyLocationController");
  v15 = objc_alloc_init(&OBJC_CLASS___SATVWindow);
  window = self->_window;
  self->_window = v15;

  id v17 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  windowView = self->_windowView;
  self->_windowView = v17;

  id v19 = self->_windowView;
  -[SATVWindow bounds](self->_window, "bounds");
  -[UIView setSize:](v19, "setSize:", v20, v21);
  -[SATVWindow addSubview:](self->_window, "addSubview:", self->_windowView);
  -[UIView setAutoresizingMask:](self->_windowView, "setAutoresizingMask:", 18LL);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](&OBJC_CLASS___BYSetupStateNotifier, "sharedNotifier"));
  [v22 notifyStateChangedTo:1];

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SATVFirstBootKernelSemaphoreToken token](&OBJC_CLASS___SATVFirstBootKernelSemaphoreToken, "token"));
  unsigned int v24 = [v23 isTokenSet];

  if (v24)
  {
    id v25 = sub_10002AF94();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "First launch after boot. Clearing any saved TTSU data",  (uint8_t *)&v34,  2u);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v27 removeObjectForKey:@"TapToSetupDeviceInfo"];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[SATVFirstBootKernelSemaphoreToken token](&OBJC_CLASS___SATVFirstBootKernelSemaphoreToken, "token"));
    [v28 unsetToken];
  }

  -[TVSetupController _createNav](self, "_createNav");
  -[SATVWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_1000183FC,  @"AppleDatePreferencesChangedNotification",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
  v30 = objc_alloc_init(&OBJC_CLASS___BuddyLanguageChangeObserver);
  languageObserver = self->_languageObserver;
  self->_languageObserver = v30;

  -[BuddyLanguageChangeObserver setDelegate:](self->_languageObserver, "setDelegate:", self);
  -[BuddyLanguageChangeObserver startObservingLanguageChanges](self->_languageObserver, "startObservingLanguageChanges");
  +[BuddyWifiAutoJoiner beginAutojoiningWiFiNetworks](&OBJC_CLASS___BuddyWifiAutoJoiner, "beginAutojoiningWiFiNetworks");
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v33 = [v32 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/FirstTime"];
  if ((_DWORD)v33)
  {
    if (![v32 createFileAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" contents:0 attributes:0]
      || ![v32 createFileAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing" contents:0 attributes:0]
      || (id v33 = [v32 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/FirstTime" error:0],  (v33 & 1) == 0))
    {
      [v32 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowLicense" error:0];
      id v33 = [v32 removeItemAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowMarketing" error:0];
    }
  }

  PBSLifecycleSetupEnd(v33);
}

- (void)resign
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 synchronize];
}

- (void)suspendApp
{
  self->_buddyDone = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[BuddyLanguageChangeObserver stopObservingLanguageChanges](self->_languageObserver, "stopObservingLanguageChanges");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  if ([v4 applicationState] == (id)2)
  {
    id v5 = sub_10002AF94();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Not active. terminateWithSuccess!";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"TVBuddyAvoidSuspension",  BYSetupAssistantBundleIdentifier,  0LL);
  id v9 = sub_10002AF94();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (AppBooleanValue)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      id v7 = "No Suspension! Terminating!";
      goto LABEL_7;
    }

- (void)respring
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, off_100108420, 0LL, 0LL, 1u);
}

- (void)didEnterBackground
{
  if (self->_buddyDone)
  {
    id v2 = sub_10002AF94();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "didEnterBackground and done: terminateWithSuccess!",  v5,  2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v4 terminateWithSuccess];
  }

- (void)observer:(id)a3 didObserveLanguageChange:(BOOL)a4 localeChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    id v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    id v8 = v11;
  }

  if (v5)
  {
    id v11 = v8;
    BOOL v10 = (void *)CFPreferencesCopyValue( @"AppleLocale",  kCFPreferencesAnyApplication,  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
    if (-[NSString isEqualToString:](self->_localeIdentifierAtStartup, "isEqualToString:", v10))
    {
LABEL_7:

      id v8 = v11;
      goto LABEL_8;
    }

- (void)_refreshLanguage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  languageAtStartup = self->_languageAtStartup;
  self->_languageAtStartup = v4;

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  BOOL v6 = (NSString *)objc_claimAutoreleasedReturnValue([v8 localeIdentifier]);
  localeIdentifierAtStartup = self->_localeIdentifierAtStartup;
  self->_localeIdentifierAtStartup = v6;
}

- (BOOL)deviceHasWiFi
{
  char v2 = MGGetBoolAnswer(@"wi-fi");
  if ((v2 & 1) == 0)
  {
    id v3 = sub_10002AF94();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = MGGetBoolAnswer(@"wi-fi");
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cannot show WiFi settings. GSCapability = %d",  (uint8_t *)v6,  8u);
    }
  }

  return v2;
}

- (void)_localeChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v2 synchronize];
}

- (void).cxx_destruct
{
}

@end
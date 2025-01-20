@interface MTAppDelegate_ATV
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (NSDictionary)launchOptions;
- (NSURL)urlToOpenWhenApplicationHasFinishedLaunching;
- (TVSUser)currentActiveUser;
- (TVStoreApplicationSetupHelper)setupHelper;
- (id)createWindowWithScene:(id)a3;
- (id)rootViewController;
- (void)_handleAccountsChangedOnMainQueue;
- (void)_loadWithBootURL:(id)a3 withLaunchOptions:(id)a4;
- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4;
- (void)_showUserSwitchSpinnerUserSwitchState:(int64_t)a3 completion:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentActiveUser:(id)a3;
- (void)setLaunchOptions:(id)a3;
- (void)setSetupHelper:(id)a3;
- (void)setUrlToOpenWhenApplicationHasFinishedLaunching:(id)a3;
- (void)setupAfterBecomingActive;
- (void)subscriptionSyncCompleted;
- (void)systemServicePresentNowPlayingUI;
- (void)willConnectScene;
@end

@implementation MTAppDelegate_ATV

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"MTSyncControllerSubscriptionSyncCompleted" object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
  -[MTAppDelegate_Shared dealloc](&v4, "dealloc");
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MTAppDelegate_ATV setLaunchOptions:](self, "setLaunchOptions:", v6);
  v8 = objc_opt_new(&OBJC_CLASS___MTPlayerController_ATV);
  +[MTPlayerController setDefaultInstance:](&OBJC_CLASS___MTPlayerController, "setDefaultInstance:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSCacheDelete sharedInstance](&OBJC_CLASS___TVSCacheDelete, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTConstants sharedCacheDirectory](&OBJC_CLASS___MTConstants, "sharedCacheDirectory"));
  [v9 registerCacheAtURL:v10 ofType:0 urgency:2 requiresAppTermination:1 withCompletion:&stru_100240F20];

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
  -[MTAppDelegate_Shared application:willFinishLaunchingWithOptions:]( &v12,  "application:willFinishLaunchingWithOptions:",  v7,  v6);

  +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", &stru_100240F40);
  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
  -[MTAppDelegate_Shared application:didFinishLaunchingWithOptions:]( &v13,  "application:didFinishLaunchingWithOptions:",  a3,  a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:ACDAccountStoreDidChangeNotification object:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v6 setOverscanCompensation:2];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 systemServiceProxy]);
  [v8 registerNowPlayingDelegate:self];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSUser activeUsers](&OBJC_CLASS___TVSUser, "activeUsers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  -[MTAppDelegate_ATV setCurrentActiveUser:](self, "setCurrentActiveUser:", v10);

  +[TVSUser addObserver:forKeyPath:options:context:]( &OBJC_CLASS___TVSUser,  "addObserver:forKeyPath:options:context:",  self,  @"activeUsers",  0LL,  off_1002B27D0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 addObserver:self selector:"subscriptionSyncCompleted" name:@"MTSyncControllerSubscriptionSyncCompleted" object:0];

  return 1;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared appController](self, "appController"));
  unsigned int v12 = [v11 isTabBarLoaded];

  if (v12)
  {
    -[MTAppDelegate_ATV setUrlToOpenWhenApplicationHasFinishedLaunching:]( self,  "setUrlToOpenWhenApplicationHasFinishedLaunching:",  0LL);
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
    BOOL v13 = -[MTAppDelegate_Shared application:openURL:options:](&v15, "application:openURL:options:", v8, v9, v10);
  }

  else
  {
    -[MTAppDelegate_ATV setUrlToOpenWhenApplicationHasFinishedLaunching:]( self,  "setUrlToOpenWhenApplicationHasFinishedLaunching:",  v9);
    BOOL v13 = 1;
  }

  return v13;
}

- (void)applicationDidBecomeActive:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
  -[MTAppDelegate_Shared applicationDidBecomeActive:](&v8, "applicationDidBecomeActive:", a3);
  -[MTAppDelegate_ATV setupAfterBecomingActive](self, "setupAfterBecomingActive");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared appController](self, "appController"));
  [v4 updateNowPlayingTabVisibility];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared window](self, "window"));
  [v5 makeKeyAndVisible];

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v7, &stru_100240F60);
}

- (void)systemServicePresentNowPlayingUI
{
}

- (void)setupAfterBecomingActive
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
  -[MTAppDelegate_Shared setupAfterBecomingActive](&v4, "setupAfterBecomingActive");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageDownloader sharedInstance](&OBJC_CLASS___MTImageDownloader, "sharedInstance"));
  [v2 cleanupTemporaryResourcesDirectoryIfNecessary];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  [v3 restorePlayerManifestWithCompletion:0];
}

- (id)rootViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared appController](self, "appController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);

  return v3;
}

- (void)willConnectScene
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared window](self, "window"));
  objc_super v4 = objc_alloc_init(&OBJC_CLASS___UINavigationController);
  [v3 setRootViewController:v4];

  +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
  if ((+[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable") & 1) != 0)
  {
    v5 = -[TVStoreApplicationSetupHelper initWithDefaultBootURL:]( objc_alloc(&OBJC_CLASS___TVStoreApplicationSetupHelper),  "initWithDefaultBootURL:",  0LL);
    -[MTAppDelegate_ATV setSetupHelper:](self, "setSetupHelper:", v5);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_ATV setupHelper](self, "setupHelper"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002CCD8;
    v7[3] = &unk_100240FA8;
    v7[4] = self;
    [v6 obtainBootURLWithCompletion:v7];
  }

  else
  {
    -[MTAppDelegate_ATV _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", 2LL, 0LL);
  }

- (id)createWindowWithScene:(id)a3
{
  id v3 = a3;
  objc_super v4 = -[UIWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithWindowScene:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.01));
  -[UIWindow setBackgroundColor:](v4, "setBackgroundColor:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor appTintColor](&OBJC_CLASS___UIColor, "appTintColor"));
  -[UIWindow setTintColor:](v4, "setTintColor:", v6);

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1002B27D0 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002CF04;
    block[3] = &unk_100240290;
    objc_copyWeak(&v8, &location);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___MTAppDelegate_ATV;
    -[MTAppDelegate_ATV observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_handleAccountsChangedOnMainQueue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSUser activeUsers](&OBJC_CLASS___TVSUser, "activeUsers"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_ATV currentActiveUser](self, "currentActiveUser"));
  if (v5 || !v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_ATV currentActiveUser](self, "currentActiveUser"));

    if (!v10 || v4)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_ATV currentActiveUser](self, "currentActiveUser"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 iTunesAltDSID]);
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4 iTunesAltDSID]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0)
      {
        -[MTAppDelegate_ATV setCurrentActiveUser:](self, "setCurrentActiveUser:", v4);
        goto LABEL_7;
      }

      uint64_t v18 = _MTLogCategoryDefault(v17);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Accounts changed: User switched.",  (uint8_t *)buf,  2u);
      }

      uint64_t v9 = 3LL;
    }

    else
    {
      uint64_t v12 = _MTLogCategoryDefault(v11);
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        uint64_t v9 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Accounts changed: User signed out.",  (uint8_t *)buf,  2u);
      }

      else
      {
        uint64_t v9 = 2LL;
      }
    }
  }

  else
  {
    uint64_t v7 = _MTLogCategoryDefault(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Accounts changed: User signed in.",  (uint8_t *)buf,  2u);
    }

    uint64_t v9 = 1LL;
  }

  -[MTAppDelegate_ATV setCurrentActiveUser:](self, "setCurrentActiveUser:", v4);
  objc_initWeak(buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002D198;
  v19[3] = &unk_100240290;
  objc_copyWeak(&v20, buf);
  -[MTAppDelegate_ATV _showUserSwitchSpinnerUserSwitchState:completion:]( self,  "_showUserSwitchSpinnerUserSwitchState:completion:",  v9,  v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
LABEL_7:
}

- (void)_showUserSwitchSpinnerUserSwitchState:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVUserSwitchLoadingView loadingScreen](&OBJC_CLASS___MTTVUserSwitchLoadingView, "loadingScreen"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002D264;
  v8[3] = &unk_1002400E8;
  id v9 = v5;
  id v7 = v5;
  [v6 showOverKeyWindowUserSwitchState:a3 completion:v8];
}

- (void)subscriptionSyncCompleted
{
}

- (void)_loadWithBootURL:(id)a3 withLaunchOptions:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (v15)
  {
    id v7 = [v6 mutableCopy];
    [v7 removeObjectForKey:UIApplicationLaunchOptionsURLKey];
    id v8 = [v7 copy];

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVStoreApplicationSetupHelper launchContextWithLaunchOptions:bootURL:]( &OBJC_CLASS___TVStoreApplicationSetupHelper,  "launchContextWithLaunchOptions:bootURL:",  v8,  v15));
    id v10 = objc_alloc(&OBJC_CLASS___MTTVApplicationController);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared window](self, "window"));
    uint64_t v12 = -[MTTVApplicationController initWithContext:window:](v10, "initWithContext:window:", v9, v11);
    -[MTAppDelegate_Shared setAppController:](self, "setAppController:", v12);

    id v6 = v8;
  }

  else
  {
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v13 stringForKey:@"boot-url"]);

    if ([v7 length]) {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));
    }
    else {
      id v15 = 0LL;
    }
    else {
      uint64_t v14 = 2LL;
    }
    -[MTAppDelegate_ATV _presetDialogWithError:appController:](self, "_presetDialogWithError:appController:", v14, 0LL);
  }
}

- (void)_presetDialogWithError:(int64_t)a3 appController:(id)a4
{
  id v10 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVApplicationController alertControllerForError:]( &OBJC_CLASS___MTTVApplicationController,  "alertControllerForError:",  a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared window](self, "window"));
  [v7 makeKeyAndVisible];

  if (v10)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 navigationController]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared window](self, "window"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 rootViewController]);
  }

  [v8 presentViewController:v6 animated:1 completion:0];
}

- (NSURL)urlToOpenWhenApplicationHasFinishedLaunching
{
  return self->_urlToOpenWhenApplicationHasFinishedLaunching;
}

- (void)setUrlToOpenWhenApplicationHasFinishedLaunching:(id)a3
{
}

- (TVStoreApplicationSetupHelper)setupHelper
{
  return self->_setupHelper;
}

- (void)setSetupHelper:(id)a3
{
}

- (TVSUser)currentActiveUser
{
  return self->_currentActiveUser;
}

- (void)setCurrentActiveUser:(id)a3
{
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVSettingsAppDelegate
- (BOOL)_openURLConfiguration:(id)a3;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (UIWindow)window;
- (id)_findFirstViewOfClass:(Class)a3 inViewHierarchy:(id)a4 depth:(int)a5;
- (void)_connectToIMAgent;
- (void)_handleAuthKitURLIfNeededFromResourceDictionary:(id)a3 overViewController:(id)a4;
- (void)_presentRegionsAlertController;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
- (void)startLogTest:(id)a3;
- (void)startScrollTestForScrollViewClass:(Class)a3 fromViewHierarchy:(id)a4 testName:(id)a5 axis:(unint64_t)a6 options:(id)a7;
@end

@implementation TVSettingsAppDelegate

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSettingsAppDelegate runTest: %@",  buf,  0xCu);
  }

  if ([v9 isEqualToString:@"LogTest"])
  {
    -[TVSettingsAppDelegate startLogTest:](self, "startLogTest:", v10);
LABEL_9:
    BOOL v18 = 1;
    goto LABEL_10;
  }

  if ([v9 isEqualToString:@"RegionsScrollTest"])
  {
    -[TVSettingsAppDelegate _presentRegionsAlertController](self, "_presentRegionsAlertController");
    Class v11 = NSClassFromString(@"TSKTableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 delegate]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 window]);

    -[TVSettingsAppDelegate startScrollTestForScrollViewClass:fromViewHierarchy:testName:axis:options:]( self,  "startScrollTestForScrollViewClass:fromViewHierarchy:testName:axis:options:",  v11,  v14,  v9,  2LL,  v10);
    goto LABEL_9;
  }

  if ([v9 isEqualToString:@"PushPopTest"])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"iterations"]);
    unsigned int v16 = [v15 intValue];

    dispatch_time_t v17 = dispatch_time(0LL, 100000000LL);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100054E68;
    v20[3] = &unk_100190AB0;
    v20[4] = self;
    unsigned int v21 = v16;
    dispatch_after(v17, &_dispatch_main_q, v20);
    goto LABEL_9;
  }

  BOOL v18 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSettingsAppDelegate did not recognize test: %@",  buf,  0xCu);
    BOOL v18 = 0;
  }

- (void)startLogTest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v4 startedTest:@"LogTest"];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "LogTest running with %@",  (uint8_t *)&v6,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v5 finishedTest:@"LogTest" extraResults:0];
}

- (void)startScrollTestForScrollViewClass:(Class)a3 fromViewHierarchy:(id)a4 testName:(id)a5 axis:(unint64_t)a6 options:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"offset"]);
  unsigned int v15 = [v14 intValue];

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"duration"]);
  [v16 floatValue];
  int v18 = v17;

  dispatch_time_t v19 = dispatch_time(0LL, 3000000000LL);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100055134;
  v23[3] = &unk_100190AD8;
  id v26 = v13;
  Class v27 = a3;
  v23[4] = self;
  id v24 = v11;
  id v25 = v12;
  unsigned int v28 = v15;
  int v29 = v18;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  dispatch_after(v19, &_dispatch_main_q, v23);
}

- (void)_presentRegionsAlertController
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"com.apple.TVSettings:/GeneralTitle/RegionFormatTitle"));
  -[TVSettingsAppDelegate application:openURL:options:]( self,  "application:openURL:options:",  v4,  v3,  &__NSDictionary0__struct);
}

- (id)_findFirstViewOfClass:(Class)a3 inViewHierarchy:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  if ([v8 isMemberOfClass:a3])
  {
    id v9 = v8;
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_claimAutoreleasedReturnValue( -[TVSettingsAppDelegate _findFirstViewOfClass:inViewHierarchy:depth:]( self,  "_findFirstViewOfClass:inViewHierarchy:depth:",  a3,  *(void *)(*((void *)&v17 + 1) + 8LL * (void)v14),  v5));
          if (v15)
          {
            id v9 = (id)v15;

            goto LABEL_13;
          }

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v9 = 0LL;
  }

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = +[TVSBluetoothManager sharedInstance](&OBJC_CLASS___TVSBluetoothManager, "sharedInstance");
  id v6 = +[TVSettingsHomeKitFacade sharedInstance](&OBJC_CLASS___TVSettingsHomeKitFacade, "sharedInstance");
  id v7 = objc_alloc_init(&OBJC_CLASS___TVSettingsMainViewController);
  id v8 = -[UINavigationController initWithRootViewController:]( objc_alloc(&OBJC_CLASS___UINavigationController),  "initWithRootViewController:",  v7);
  navigationController = self->_navigationController;
  self->_navigationController = v8;

  id v10 = -[_TSKSplitViewController initWithNavigationController:]( objc_alloc(&OBJC_CLASS____TSKSplitViewController),  "initWithNavigationController:",  self->_navigationController);
  -[TVSettingsAppDelegate _connectToIMAgent](self, "_connectToIMAgent");
  id v11 = objc_alloc(&OBJC_CLASS___UIWindow);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v12 bounds];
  uint64_t v13 = -[UIWindow initWithFrame:](v11, "initWithFrame:");
  window = self->_window;
  self->_window = v13;

  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v10);
  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  backgroundedDate = self->_backgroundedDate;
  self->_backgroundedDate = v4;

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController viewControllers](self->_navigationController, "viewControllers"));
  id v6 = [v8 indexOfObjectPassingTest:&stru_100194CF8];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v6));
    -[UINavigationController dismissViewControllerAnimated:completion:]( self->_navigationController,  "dismissViewControllerAnimated:completion:",  0LL,  0LL);
    -[UINavigationController setViewControllers:animated:]( self->_navigationController,  "setViewControllers:animated:",  v7,  0LL);
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  if (self->_backgroundedDate)
  {
    id v4 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    backgroundedDate = self->_backgroundedDate;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar components:fromDate:toDate:options:]( v4,  "components:fromDate:toDate:options:",  64LL,  backgroundedDate,  v6,  0LL));

    if ((uint64_t)[v7 minute] < 8)
    {
      id v10 = self->_backgroundedDate;
      self->_backgroundedDate = 0LL;
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[UINavigationController presentedViewController]( self->_navigationController,  "presentedViewController"));

      navigationController = self->_navigationController;
      if (v8)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_1000E01DC;
        v12[3] = &unk_10018E440;
        v12[4] = self;
        -[UINavigationController dismissViewControllerAnimated:completion:]( navigationController,  "dismissViewControllerAnimated:completion:",  0LL,  v12);
      }

      else
      {
        id v11 =  -[UINavigationController popToRootViewControllerAnimated:]( navigationController,  "popToRootViewControllerAnimated:",  0LL);
      }
    }
  }

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000E0438();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412546;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received deep link URL. {url=%@ options=%@}",  (uint8_t *)&v25,  0x16u);
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 scheme]);
  unsigned int v14 = [v13 isEqual:@"com.apple.TVSettings"];

  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_TVSettingsOpenURLConfig configWithSettingsURL:]( &OBJC_CLASS____TVSettingsOpenURLConfig,  "configWithSettingsURL:",  v9));
  }

  else
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v9 scheme]);
    unsigned int v17 = [v16 isEqual:@"prefs"];

    if (v17)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_TVSettingsOpenURLConfig configWithPrefsURL:options:]( &OBJC_CLASS____TVSettingsOpenURLConfig,  "configWithPrefsURL:options:",  v9,  v10));
    }

    else
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 scheme]);
      unsigned int v19 = [v18 isEqual:@"app-prefs"];

      if (v19)
      {
        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_TVSettingsOpenURLConfig configWithAppSettingsURL:]( &OBJC_CLASS____TVSettingsOpenURLConfig,  "configWithAppSettingsURL:",  v9));
      }

      else
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 scheme]);
        unsigned int v21 = [v20 isEqual:@"prefs-tvprovider"];

        if (!v21) {
          goto LABEL_13;
        }
        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_TVSettingsOpenURLConfig configWithTVProviderURL:]( &OBJC_CLASS____TVSettingsOpenURLConfig,  "configWithTVProviderURL:",  v9));
      }
    }
  }

  id v22 = (void *)v15;
  if (v15)
  {
    unsigned __int8 v23 = -[TVSettingsAppDelegate _openURLConfiguration:](self, "_openURLConfiguration:", v15);

    goto LABEL_16;
  }

- (BOOL)_openURLConfiguration:(id)a3
{
  id v4 = a3;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_1000E06EC;
  v34[4] = sub_1000E06FC;
  id v35 = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_1000E06EC;
  v32[4] = sub_1000E06FC;
  id v33 = 0LL;
  unsigned __int8 v5 = [v4 shouldActivateLastComponent];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 parsedPathComponents]);
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000E0704;
  v25[3] = &unk_100194D70;
  int v29 = v32;
  id v8 = v4;
  id v26 = v8;
  v30 = v34;
  unsigned __int8 v31 = v5;
  id v9 = v6;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  [v9 enumerateObjectsUsingBlock:v25];
  id v11 = -[NSMutableArray count](v10, "count");
  if (v11)
  {
    unsigned int v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    unsigned int v19 = sub_1000E0B24;
    __int128 v20 = &unk_100190E10;
    unsigned int v21 = v10;
    id v22 = v8;
    unsigned __int8 v23 = self;
    id v24 = v34;
    id v12 = objc_retainBlock(&v17);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController", v17, v18, v19, v20));
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 presentedViewController]);

    if (v14)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));
      [v15 dismissViewControllerAnimated:0 completion:v12];
    }

    else
    {
      ((void (*)(void ***))v12[2])(v12);
    }
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  return v11 != 0LL;
}

- (void)_handleAuthKitURLIfNeededFromResourceDictionary:(id)a3 overViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"notifyAuthKit"]);
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"authKitContextID"]);
    id v10 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  0LL,  0LL);
    -[UITapGestureRecognizer setAllowedPressTypes:](v10, "setAllowedPressTypes:", &off_1001AF2C8);
    -[UITapGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &__NSArray0__struct);
    id v11 = objc_alloc_init(&OBJC_CLASS___TVSettingsActivityIndicatorViewController);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [v12 localizedStringForKey:@"AccountSigningInTitle" value:&stru_100195DD8 table:0]);
    -[TVSettingsActivityIndicatorViewController setActivityText:](v11, "setActivityText:", v13);

    -[TVSettingsActivityIndicatorViewController setActivityIndicatorDelay:](v11, "setActivityIndicatorDelay:", 0.3);
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsActivityIndicatorViewController view](v11, "view"));
    [v14 addGestureRecognizer:v10];

    id v15 = sub_1000E0438();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v23 = v9;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received surrogate UI authentication request. {contextID=%{public}@, parameters=%@}",  buf,  0x16u);
    }

    id v17 = [[AKAppleIDAuthenticationTVUISurrogateContext alloc] initWithSurrogateID:v9];
    [v17 setPresentingViewController:v11];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000E10B0;
    v19[3] = &unk_10018E468;
    id v20 = v17;
    id v21 = v6;
    id v18 = v17;
    [v21 presentViewController:v11 animated:1 completion:v19];
  }
}

- (void)_connectToIMAgent
{
  uint64_t v2 = kFZListenerCapManageStatus | kFZListenerCapFileTransfers | kFZListenerCapChats | kFZListenerCapMessageHistory | (kFZListenerCapIDQueries | kFZListenerCapAccounts);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](&OBJC_CLASS___IMDaemonController, "sharedInstance"));
  unsigned __int8 v4 = [v3 hasListenerForID:@"tvSettingsToken"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMDaemonController sharedInstance](&OBJC_CLASS___IMDaemonController, "sharedInstance"));
  id v6 = v5;
  if ((v4 & 1) != 0)
  {
    unsigned __int8 v7 = [v5 setCapabilities:v2 forListenerID:@"tvSettingsToken"];

    if ((v7 & 1) != 0) {
      return;
    }
    id v8 = sub_1000E0438();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FD358(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  else
  {
    unsigned __int8 v17 = [v5 addListenerID:@"tvSettingsToken" capabilities:v2];

    if ((v17 & 1) != 0) {
      return;
    }
    id v18 = sub_1000E0438();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000FD38C(v9, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
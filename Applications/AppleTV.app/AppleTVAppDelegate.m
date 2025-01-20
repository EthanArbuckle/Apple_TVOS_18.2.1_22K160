@interface AppleTVAppDelegate
- (AppleTVAppDelegate)init;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)isDeviceAsleepAndSleptManually:(BOOL *)a3;
- (UIWindow)window;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)dealloc;
- (void)setWindow:(id)a3;
@end

@implementation AppleTVAppDelegate

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ATAPPTController sharedInstance](&OBJC_CLASS___ATAPPTController, "sharedInstance"));
  unsigned int v9 = [v8 canHandleTest:v7];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ATAPPTController sharedInstance](&OBJC_CLASS___ATAPPTController, "sharedInstance"));
    [v10 runTest:v7 app:v6];
  }

  return v9;
}

- (AppleTVAppDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppleTVAppDelegate;
  v2 = -[AppleTVAppDelegate init](&v5, "init");
  if (v2) {
    id v3 = +[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance");
  }
  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  [v3 cleanUp];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTVAppDelegate;
  -[AppleTVAppDelegate dealloc](&v4, "dealloc");
}

- (BOOL)isDeviceAsleepAndSleptManually:(BOOL *)a3
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  if (a3) {
    *a3 = 0;
  }
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemServiceProxy]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100003A1C;
  v10[3] = &unk_100014848;
  v12 = &v18;
  v13 = &v14;
  id v7 = v4;
  v11 = v7;
  [v6 fetchDeviceIsAsleepWithResult:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = *((_BYTE *)v15 + 24);
  }
  char v8 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  uint64_t v5 = VUISignpostLogObject();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Launch.Main",  "",  buf,  2u);
  }

  uint64_t v7 = VUISignpostLogObject();
  char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Launch.WillFinishLaunch",  "",  v15,  2u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  unsigned __int8 v10 = [v9 applicationWillFinishLaunchingWithOptions:v4];

  uint64_t v11 = VUISignpostLogObject();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Launch.WillFinishLaunch",  "",  v14,  2u);
  }

  return v10;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  uint64_t v6 = VUISignpostLogObject();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Launch.DidFinishLaunch",  "",  buf,  2u);
  }

  uint64_t v8 = VUISignpostLogObject();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Launch.MainWindow",  "",  v30,  2u);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  v19 = -[UIWindow initWithFrame:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithFrame:", v12, v14, v16, v18);
  -[AppleTVAppDelegate setWindow:](self, "setWindow:", v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  [v20 setMainWindow:v19];

  uint64_t v21 = VUISignpostLogObject();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Launch.MainWindow",  "",  v29,  2u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  unsigned __int8 v24 = [v23 applicationDidFinishLaunchingWithOptions:v5];

  uint64_t v25 = VUISignpostLogObject();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Launch.DidFinishLaunch",  "",  v28,  2u);
  }

  return v24;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = VUIDefaultLogObject();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "AppleTVAppDelegate openURL -- url %@",  (uint8_t *)&v13,  0xCu);
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](&OBJC_CLASS___VUITVAppLauncher, "sharedInstance"));
  unsigned __int8 v11 = [v10 openURL:v6 options:v7];

  return v11;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  return 30LL;
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
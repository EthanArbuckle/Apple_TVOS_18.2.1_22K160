@interface SRAppDelegate
+ (id)sharedApplication;
+ (id)sharedDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (SRApplicationDataSource)dataSource;
- (UIScene)currentScene;
- (UIWindow)appWindow;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (void)_updateDeferral;
- (void)_windowDidCreateContext:(id)a3;
- (void)_windowWillDestroyContext:(id)a3;
- (void)didBecomeActiveHandler;
- (void)invalidateKeyboardWindowIfNeeded;
- (void)setAppWindow:(id)a3;
- (void)setCurrentScene:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setUpViews;
- (void)tearDownViews;
- (void)willEnterForegroundHandler;
- (void)willResignActiveHandler;
@end

@implementation SRAppDelegate

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
}

+ (id)sharedDelegate
{
  return [UIApp delegate];
}

- (void)_windowDidCreateContext:(id)a3
{
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue([a3 object]);
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    -[SRAppDelegate _updateDeferral](self, "_updateDeferral");
    v4 = v5;
  }
}

- (void)_windowWillDestroyContext:(id)a3
{
  v4 = (UIWindow *)objc_claimAutoreleasedReturnValue([a3 object]);
  if (v4 == self->_appWindow)
  {
    v5 = v4;
    -[SRAppDelegate _updateDeferral](self, "_updateDeferral");
    v4 = v5;
  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3, a4));
  [v5 addObserver:self selector:"_windowDidCreateContext:" name:UIWindowDidCreateWindowContextNotification object:0];
  [v5 addObserver:self selector:"_windowWillDestroyContext:" name:UIWindowWillDestroyWindowContextNotification object:0];
  +[SRAssetsUtilities setupBackgroundAssetCheck](&OBJC_CLASS___SRAssetsUtilities, "setupBackgroundAssetCheck");
  v6 = objc_alloc_init(&OBJC_CLASS___SRViewController);
  v7 = objc_alloc_init(&OBJC_CLASS___SRSecureWindow);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[SRSecureWindow setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[SRSecureWindow setRootViewController:](v7, "setRootViewController:", v6);
  -[SRSecureWindow makeKeyAndVisible](v7, "makeKeyAndVisible");
  v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    int v12 = 136316162;
    v13 = "-[SRAppDelegate application:didFinishLaunchingWithOptions:]";
    __int16 v14 = 1024;
    pid_t v15 = getpid();
    __int16 v16 = 2048;
    v17 = v6;
    __int16 v18 = 2048;
    v19 = v7;
    __int16 v20 = 1024;
    unsigned int v21 = -[SRSecureWindow _contextId](v7, "_contextId");
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s (%u) Creating initial viewController (%p) and window (%p) and contextID %u",  (uint8_t *)&v12,  0x2Cu);
  }

  -[SRAppDelegate setAppWindow:](self, "setAppWindow:", v7);

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "configuration", a3));
  *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___SRWindowSceneDelegate, v6).n128_u64[0];
  objc_msgSend(v5, "setDelegateClass:", v8, v7);
  return v5;
}

- (void)_updateDeferral
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScene _FBSScene](self->_currentScene, "_FBSScene"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100049DE0;
  v4[3] = &unk_1000BB240;
  objc_copyWeak(&v5, &location);
  [v3 updateClientSettingsWithBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)invalidateKeyboardWindowIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyboard activeKeyboard](&OBJC_CLASS___UIKeyboard, "activeKeyboard"));
  id v4 = (id)objc_claimAutoreleasedReturnValue([v3 window]);
  Class v5 = NSClassFromString(@"UIRemoteKeyboardWindow");
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0LL;
  }
  if (!v6)
  {
    Class v7 = v5;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:]( &OBJC_CLASS___UIWindow,  "allWindowsIncludingInternalWindows:onlyVisibleWindows:",  1LL,  0LL));
    id v4 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v4)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v8);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ((objc_opt_isKindOfClass(v11, v7) & 1) != 0)
          {
            id v4 = v11;
            goto LABEL_15;
          }
        }

        id v4 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

- (void)setUpViews
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);
  [v2 setUpViews];
}

- (void)tearDownViews
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);
  [v2 tearDownViews];
}

- (void)didBecomeActiveHandler
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);
  [v2 didBecomeActiveHandler];
}

- (void)willResignActiveHandler
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 rootViewController]);
  [v2 willResignActiveHandler];
}

- (void)willEnterForegroundHandler
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
  [v3 willEnterForegroundHandler];
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

- (void)setAppWindow:(id)a3
{
}

- (UIScene)currentScene
{
  return self->_currentScene;
}

- (void)setCurrentScene:(id)a3
{
}

- (SRApplicationDataSource)dataSource
{
  return (SRApplicationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
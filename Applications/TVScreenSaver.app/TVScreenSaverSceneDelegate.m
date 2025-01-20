@interface TVScreenSaverSceneDelegate
- (UIWindow)window;
- (int64_t)state;
- (void)_assetsLibraryDidInitialize;
- (void)_initializeAssetsLibrary;
- (void)_presentWindowIfNeeded;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVScreenSaverSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIWindowScene, v9);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
  {
    id v11 = v7;
    v12 = -[UIWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithWindowScene:", v11);
    window = self->_window;
    self->_window = v12;

    v14 = self->_window;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIWindow setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UIWindow setAlpha:](self->_window, "setAlpha:", 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 sourceApplication]);
    LOBYTE(v15) = [v16 isEqual:@"com.apple.PineBoard"];

    if ((v15 & 1) == 0)
    {
      -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
      -[TVScreenSaverSceneDelegate _initializeAssetsLibrary](self, "_initializeAssetsLibrary");
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: scene connected",  v17,  2u);
    }

    -[TVScreenSaverSceneDelegate setState:](self, "setState:", 2LL);
  }
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: scene foregrounded",  v4,  2u);
  }

  -[TVScreenSaverSceneDelegate setState:](self, "setState:", 3LL);
  -[TVScreenSaverSceneDelegate _presentWindowIfNeeded](self, "_presentWindowIfNeeded");
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void)_initializeAssetsLibrary
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100002858;
  v4[3] = &unk_10000C488;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_assetsLibraryDidInitialize
{
  unsigned __int8 v3 = -[TVScreenSaverSceneDelegate state](self, "state");
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 2) != 0)
  {
    if (v4)
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: setting up root view controller",  v10,  2u);
    }

    id v5 = objc_alloc_init(&OBJC_CLASS___TVSSMarimbaViewController);
    -[UIWindow setRootViewController:](self->_window, "setRootViewController:", v5);
    id v6 = [[PBUIScreenSaverPreparedAction alloc] initWithInfo:0 responder:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow windowScene](self->_window, "windowScene"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _FBSScene]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
    [v8 sendActions:v9];

    -[TVScreenSaverSceneDelegate _presentWindowIfNeeded](self, "_presentWindowIfNeeded");
  }

  else if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: scene is not connected",  buf,  2u);
  }

- (void)_presentWindowIfNeeded
{
  if ((id)-[TVScreenSaverSceneDelegate state](self, "state") == (id)3)
  {
    unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIWindow rootViewController](self->_window, "rootViewController"));

    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "TVSS: presenting content",  buf,  2u);
      }

      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_100002B88;
      v4[3] = &unk_10000C4B0;
      void v4[4] = self;
      +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v4, 0.2);
    }
  }

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end
@interface TVHMainSceneDelegate
- (TVHDefaultRootViewController)defaultRootViewController;
- (TVHRootViewController)rootViewController;
- (UIWindow)window;
- (UIWindowScene)scene;
- (id)_mediaLibrariesManager;
- (void)_deactivateApplication;
- (void)_updateRootViewControllerWithURL:(id)a3;
- (void)rootViewControllerDidFinish:(id)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setDefaultRootViewController:(id)a3;
- (void)setScene:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation TVHMainSceneDelegate

- (TVHRootViewController)rootViewController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 rootViewController]);
  objc_opt_class(&OBJC_CLASS___TVHRootViewController);
  uint64_t v5 = v4;
  id v6 = v3;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      v8 = v7;
    }
    else {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  id v9 = v8;

  return (TVHRootViewController *)v9;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100079D68();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Processing willConnectToSession: %@. options=%@",  (uint8_t *)&v18,  0x16u);
  }

  id v13 = v8;
  -[TVHMainSceneDelegate setScene:](self, "setScene:", v13);
  v14 = -[UIWindow initWithWindowScene:](objc_alloc(&OBJC_CLASS___UIWindow), "initWithWindowScene:", v13);

  -[TVHMainSceneDelegate setWindow:](self, "setWindow:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 URLContexts]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anyObject]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 URL]);

  -[TVHMainSceneDelegate _updateRootViewControllerWithURL:](self, "_updateRootViewControllerWithURL:", v17);
  -[UIWindow makeKeyAndVisible](v14, "makeKeyAndVisible");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = sub_100079D68();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing sceneWillEnterForeground", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootViewController]);

  if (!v7)
  {
    id v8 = sub_100079D68();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No root view controller. Will use default.",  v10,  2u);
    }

    -[TVHMainSceneDelegate _updateRootViewControllerWithURL:](self, "_updateRootViewControllerWithURL:", 0LL);
  }

  [v6 makeKeyWindow];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = sub_100079D68();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing sceneDidEnterBackground", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rootViewController]);
  objc_opt_class(&OBJC_CLASS___TVHDefaultRootViewController);
  uint64_t v9 = v8;
  id v10 = v7;
  id v11 = v10;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0) {
      v12 = v11;
    }
    else {
      v12 = 0LL;
    }
  }

  else
  {
    v12 = 0LL;
  }

  id v13 = v12;

  if (!v13)
  {
    id v14 = sub_100079D68();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "The root view controller is not the default. Will reset to nil.",  v16,  2u);
    }

    [v6 setRootViewController:0];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  id v6 = sub_100079D68();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Processing openURLContexts. Will delay further processing.",  (uint8_t *)buf,  2u);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___UIViewController);
  [v8 setRootViewController:v9];

  objc_initWeak(buf, self);
  dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100090F40;
  v12[3] = &unk_1000FD360;
  id v13 = v5;
  id v11 = v5;
  objc_copyWeak(&v14, buf);
  dispatch_after(v10, &_dispatch_main_q, v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(buf);
}

- (void)rootViewControllerDidFinish:(id)a3
{
}

- (void)_updateRootViewControllerWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVHURL URLFromURL:](&OBJC_CLASS___TVHURL, "URLFromURL:", v4));
  if ([v5 action] == (id)3)
  {
    id v6 = sub_100079D68();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting screen save picker as root view controller",  (uint8_t *)&v24,  2u);
    }

    uint64_t v8 = objc_alloc(&OBJC_CLASS___TVHMediaLibrariesEnviroment);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate _mediaLibrariesManager](self, "_mediaLibrariesManager"));
    dispatch_time_t v10 = -[TVHMediaLibrariesEnviroment initWithMediaLibrariesManager:](v8, "initWithMediaLibrariesManager:", v9);

    id v11 = -[TVHScreenSaverPickerRootViewController initWithMediaLibrariesEnviroment:]( objc_alloc(&OBJC_CLASS___TVHScreenSaverPickerRootViewController),  "initWithMediaLibrariesEnviroment:",  v10);
    -[TVHRootViewController setDelegate:](v11, "setDelegate:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHAnalyticsController sharedController](&OBJC_CLASS___TVHAnalyticsController, "sharedController"));
    [v12 sendScreensaverPickerDisplayedEvent];
  }

  else
  {
    dispatch_time_t v10 = (TVHDefaultRootViewController *)objc_claimAutoreleasedReturnValue( -[TVHMainSceneDelegate defaultRootViewController]( self,  "defaultRootViewController"));
    if (!v10)
    {
      id v13 = objc_alloc(&OBJC_CLASS___TVHMediaLibrariesEnviroment);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate _mediaLibrariesManager](self, "_mediaLibrariesManager"));
      v15 = -[TVHMediaLibrariesEnviroment initWithMediaLibrariesManager:](v13, "initWithMediaLibrariesManager:", v14);

      dispatch_time_t v10 = -[TVHDefaultRootViewController initWithMediaLibrariesEnviroment:]( objc_alloc(&OBJC_CLASS___TVHDefaultRootViewController),  "initWithMediaLibrariesEnviroment:",  v15);
      -[TVHMainSceneDelegate setDefaultRootViewController:](self, "setDefaultRootViewController:", v10);
      -[TVHRootViewController setDelegate:](v10, "setDelegate:", self);
    }

    if (v4)
    {
      id v16 = sub_100079D68();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Updating default root view controller with URL: %@",  (uint8_t *)&v24,  0xCu);
      }

      -[TVHRootViewController handleURL:](v10, "handleURL:", v4);
      int v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVHAnalyticsController sharedController]( &OBJC_CLASS___TVHAnalyticsController,  "sharedController"));
      objc_msgSend(v18, "sendTopShelfItemDisplayedEventWithMediaCategoryType:", objc_msgSend(v5, "mediaCategoryType"));
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
    __int16 v20 = (TVHDefaultRootViewController *)objc_claimAutoreleasedReturnValue([v19 rootViewController]);

    if (v10 == v20)
    {
      id v11 = 0LL;
    }

    else
    {
      id v21 = sub_100079D68();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Setting default root view controller as root view controller",  (uint8_t *)&v24,  2u);
      }

      dispatch_time_t v10 = v10;
      id v11 = (TVHScreenSaverPickerRootViewController *)v10;
    }
  }

  if (v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMainSceneDelegate window](self, "window"));
    [v23 setRootViewController:v11];
  }
}

- (id)_mediaLibrariesManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mediaLibrariesManager]);
  return v4;
}

- (void)_deactivateApplication
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 systemServiceProxy]);
  [v2 deactivateApplication];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIWindowScene)scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
}

- (TVHDefaultRootViewController)defaultRootViewController
{
  return self->_defaultRootViewController;
}

- (void)setDefaultRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVMusicJSAppController
+ (id)_manageSubscriptionsURL;
+ (id)_urlForBagKey:(id)a3 bagSubkey:(id)a4;
+ (id)subscriptionsAppController;
+ (void)initialize;
- (NSURL)applicationURL;
- (TVApplicationController)appController;
- (TVMusicJSAppController)initWithApplicationURL:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (void)_closeApp;
- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (void)appController:(id)a3 didStopWithOptions:(id)a4;
- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4;
- (void)launchApplicationWithNavigationController:(id)a3 launchOptions:(id)a4;
- (void)setAppController:(id)a3;
- (void)setApplicationURL:(id)a3;
@end

@implementation TVMusicJSAppController

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicJSAppController");
  v3 = (void *)qword_1002BE758;
  qword_1002BE758 = (uint64_t)v2;
}

+ (id)subscriptionsAppController
{
  id v3 = objc_alloc((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _manageSubscriptionsURL]);
  id v5 = [v3 initWithApplicationURL:v4];

  return v5;
}

- (TVMusicJSAppController)initWithApplicationURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicJSAppController;
  v6 = -[TVMusicJSAppController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationURL, a3);
  }

  return v7;
}

- (void)launchApplicationWithNavigationController:(id)a3 launchOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController appController](self, "appController"));

  if (v8)
  {
    objc_super v9 = (void *)qword_1002BE758;
    if (os_log_type_enabled((os_log_t)qword_1002BE758, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController appController](self, "appController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 context]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 javaScriptApplicationURL]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Stopping existing JS app at URL [%@]",  (uint8_t *)&buf,  0xCu);
    }

    -[TVMusicJSAppController _closeApp](self, "_closeApp");
  }

  v14 = (void *)qword_1002BE758;
  if (os_log_type_enabled((os_log_t)qword_1002BE758, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController applicationURL](self, "applicationURL"));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Opening JS app at url [%@]",  (uint8_t *)&buf,  0xCu);
  }

  id v17 = objc_alloc_init(&OBJC_CLASS___TVApplicationControllerContext);
  [v17 setLaunchOptions:v7];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController applicationURL](self, "applicationURL"));
  [v17 setJavaScriptApplicationURL:v18];

  [v17 setStorageIdentifier:@"itms_subscriptions"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000F1A0;
  v22[3] = &unk_1002691D8;
  v22[4] = self;
  id v23 = v17;
  id v24 = v6;
  v19 = v22;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  v26 = sub_10000F8C4;
  v27 = &unk_100268D60;
  id v28 = v19;
  id v20 = v6;
  id v21 = v17;
  dispatch_async(&_dispatch_main_q, &buf);
}

- (void)appController:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = (void *)qword_1002BE758;
  if (os_log_type_enabled((os_log_t)qword_1002BE758, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController applicationURL](self, "applicationURL"));
    int v8 = 138412290;
    objc_super v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "JS App finished launching: %@",  (uint8_t *)&v8,  0xCu);
  }

- (void)appController:(id)a3 didStopWithOptions:(id)a4
{
  id v5 = (void *)qword_1002BE758;
  if (os_log_type_enabled((os_log_t)qword_1002BE758, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController applicationURL](self, "applicationURL"));
    int v8 = 138412290;
    objc_super v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "JS App stopped: %@", (uint8_t *)&v8, 0xCu);
  }

- (void)appController:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v4 = a4;
  id v5 = objc_alloc(&OBJC_CLASS___TVJSITunesStore);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IKAppContext currentAppContext](&OBJC_CLASS___IKAppContext, "currentAppContext"));
  id v7 = -[TVJSITunesStore initWithAppContext:](v5, "initWithAppContext:", v6);

  [v4 setObject:v7 forKeyedSubscript:@"itms"];
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController appController](self, "appController", a3));

  if (v4)
  {
    id v5 = (void *)qword_1002BE758;
    if (os_log_type_enabled((os_log_t)qword_1002BE758, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController applicationURL](self, "applicationURL"));
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "JS App is closing because view controller is being dismissed: %@",  (uint8_t *)&v9,  0xCu);
    }

    -[TVMusicJSAppController _closeApp](self, "_closeApp");
  }

  return 0LL;
}

- (void)_closeApp
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAppController appController](self, "appController"));
  [v3 stop];

  -[TVMusicJSAppController setAppController:](self, "setAppController:", 0LL);
}

+ (id)_manageSubscriptionsURL
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _urlForBagKey:@"itml-app-urls" bagSubkey:@"subscription-mgmt"]);
  if (!v2)
  {
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://apps.mzstatic.com/content/atv-subscription-mgmt-app/"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412802;
      id v5 = @"itml-app-urls";
      __int16 v6 = 2112;
      id v7 = @"subscription-mgmt";
      __int16 v8 = 2112;
      int v9 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No URL specified for bag key %@/%@. Using URL [%@]",  (uint8_t *)&v4,  0x20u);
    }
  }

  return v2;
}

+ (id)_urlForBagKey:(id)a3 bagSubkey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:v5]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0 && [v11 length])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Found URL for bag key %@/%@: [%@]",  (uint8_t *)&v16,  0x20u);
      }
    }

    else
    {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (NSURL)applicationURL
{
  return self->_applicationURL;
}

- (void)setApplicationURL:(id)a3
{
}

- (TVApplicationController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
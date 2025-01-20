@interface RPBroadcastActivityExtensionViewController
- (NSMutableArray)streamingActivities;
- (OS_dispatch_queue)replyQueue;
- (UIAlertController)alertController;
- (id)_autoOptedInExtensionBundleIdentifiers;
- (id)preferredFocusEnvironments;
- (void)_autoOptInExtensionIfNeverOptedIn:(id)a3;
- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6;
- (void)loadHostAppInfo:(id)a3;
- (void)loadItems:(id)a3 withHandler:(id)a4;
- (void)loadStreamingActivitiesWithHandler:(id)a3;
- (void)loadView;
- (void)setAlertController:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setStreamingActivities:(id)a3;
- (void)showNotInstalledAlert:(id)a3 appName:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RPBroadcastActivityExtensionViewController

- (void)loadView
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPBroadcastActivityExtensionViewController loadView]";
    __int16 v6 = 1024;
    int v7 = 71;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPBroadcastActivityExtensionViewController;
  -[RPBroadcastActivityExtensionViewController loadView](&v3, "loadView");
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v8 = "-[RPBroadcastActivityExtensionViewController viewWillAppear:]";
    __int16 v9 = 1024;
    int v10 = 76;
    __int16 v11 = 2048;
    v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPBroadcastActivityExtensionViewController;
  -[RPBroadcastActivityExtensionViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004128;
  block[3] = &unk_10000C440;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v11 = "-[RPBroadcastActivityExtensionViewController viewDidAppear:]";
    __int16 v12 = 1024;
    int v13 = 88;
    __int16 v14 = 2048;
    v15 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPBroadcastActivityExtensionViewController;
  -[RPBroadcastActivityExtensionViewController viewDidAppear:](&v9, "viewDidAppear:", v3);
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ReplayKit.RPBroadcastActivityExtension.replyQueue", 0LL);
  replyQueue = self->_replyQueue;
  self->_replyQueue = v5;

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004344;
  v7[3] = &unk_10000C530;
  v7[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  -[RPBroadcastActivityExtensionViewController loadHostAppInfo:](self, "loadHostAppInfo:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)showNotInstalledAlert:(id)a3 appName:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_TITLE"));
  if (v10) {
    id v13 = v10;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v9));
  }
  __int16 v14 = v13;
  if (v11) {
    id v15 = v11;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_NOT_INSTALLED_ALERT_MESSAGE"));
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004A8C;
  block[3] = &unk_10000C4B8;
  id v19 = v14;
  id v20 = v15;
  v21 = self;
  id v16 = v15;
  id v17 = v14;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)loadItems:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v16 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[RPBroadcastActivityExtensionViewController loadItems:withHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 435;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  int v7 = (id)kUTTypeData;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100005044;
  v38 = sub_100005054;
  id v39 = 0LL;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = sub_100005044;
  v34[4] = sub_100005054;
  id v35 = &__NSDictionary0__struct;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_100005044;
  v32[4] = sub_100005054;
  id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSData data](&OBJC_CLASS___NSData, "data"));
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x3032000000LL;
  v30[3] = sub_100005044;
  v30[4] = sub_100005054;
  id v31 = 0LL;
  id v8 = [v6 count];
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  v29[3] = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 attachments]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);

        if ([v15 hasItemConformingToTypeIdentifier:v7])
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472LL;
          v17[2] = sub_10000505C;
          v17[3] = &unk_10000C580;
          v17[4] = v13;
          id v19 = buf;
          id v20 = v34;
          v21 = v32;
          v22 = v30;
          v23 = v29;
          id v24 = v8;
          id v18 = v16;
          [v15 loadItemForTypeIdentifier:v7 options:0 completionHandler:v17];
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }

    while (v10);
  }

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(buf, 8);
}

- (void)viewDidLoad
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v6 = "-[RPBroadcastActivityExtensionViewController viewDidLoad]";
    __int16 v7 = 1024;
    int v8 = 488;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPBroadcastActivityExtensionViewController;
  -[RPBroadcastActivityExtensionViewController viewDidLoad](&v4, "viewDidLoad");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000053FC;
  block[3] = &unk_10000C440;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)loadHostAppInfo:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[RPBroadcastActivityExtensionViewController loadHostAppInfo:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 496;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100005044;
  v22 = sub_100005054;
  id v23 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_100005044;
  v19[4] = sub_100005054;
  id v20 = 0LL;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionViewController extensionContext](self, "extensionContext"));
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 inputItems]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000056D8;
  v15[3] = &unk_10000C5D0;
  int v8 = v5;
  id v16 = v8;
  id v17 = buf;
  id v18 = v19;
  [v7 enumerateObjectsUsingBlock:v15];

  __int16 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionViewController replyQueue](self, "replyQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000059C4;
  v11[3] = &unk_10000C5F8;
  id v12 = v4;
  id v13 = buf;
  __int16 v14 = v19;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(buf, 8);
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionViewController alertController](self, "alertController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  if (v4)
  {
    dispatch_group_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionViewController alertController](self, "alertController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    __int16 v9 = v6;
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    __int16 v7 = &__NSArray0__struct;
  }

  return v7;
}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[RPBroadcastActivityExtensionViewController broadcastExtensionContext](self, "broadcastExtensionContext"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 extensionObjectProxy]);
  [v13 extensionDidFinishWithLaunchURL:v12 broadcastURL:v11 extensionBundleID:v10 cancelled:v6];
}

- (void)loadStreamingActivitiesWithHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v8 = "-[RPBroadcastActivityExtensionViewController loadStreamingActivitiesWithHandler:]";
    __int16 v9 = 1024;
    int v10 = 564;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p Loading streaming activities",  buf,  0x1Cu);
  }

  if (self->_streamingActivities)
  {
    v4[2](v4);
  }

  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100005DD4;
    v5[3] = &unk_10000C648;
    v5[4] = self;
    BOOL v6 = v4;
    +[NSExtension extensionsWithMatchingPointName:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingPointName:completion:",  @"com.apple.broadcast-services-setupui",  v5);
  }
}

- (id)_autoOptedInExtensionBundleIdentifiers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"autoOptedInExtensions"]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  dispatch_group_t v5 = v4;

  return v5;
}

- (void)_autoOptInExtensionIfNeverOptedIn:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _extensionBundle]);
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);

  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue( -[RPBroadcastActivityExtensionViewController _autoOptedInExtensionBundleIdentifiers]( self,  "_autoOptedInExtensionBundleIdentifiers"));
  unsigned __int8 v8 = [v7 containsObject:v6];

  if ((v8 & 1) == 0 && v6)
  {
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( -[RPBroadcastActivityExtensionViewController _autoOptedInExtensionBundleIdentifiers]( self,  "_autoOptedInExtensionBundleIdentifiers"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObject:v6]);

    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v11 setObject:v10 forKey:@"autoOptedInExtensions"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v12 synchronize];

    id v14 = 0LL;
    [v4 attemptOptIn:&v14];
    id v13 = v14;
    if (v13 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006A3C();
    }
  }
}

- (NSMutableArray)streamingActivities
{
  return self->_streamingActivities;
}

- (void)setStreamingActivities:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
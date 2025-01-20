@interface MTApplication
+ (BOOL)handleTextViewURL:(id)a3 interaction:(int64_t)a4;
+ (BOOL)localLibraryUpdatesDisabled;
+ (id)appController;
+ (id)sharedApplication;
- (MTApplication)init;
- (UIApplicationDelegate)strongDelegate;
- (id)_extendLaunchTest;
- (id)delegate;
- (void)completeOpenURLWithSuccess:(BOOL)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)openURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setStrongDelegate:(id)a3;
@end

@implementation MTApplication

+ (id)sharedApplication
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTApplication;
  id v2 = objc_msgSendSuper2(&v4, "sharedApplication");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)appController
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedApplication]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appController]);

  return v4;
}

+ (BOOL)handleTextViewURL:(id)a3 interaction:(int64_t)a4
{
  if (!a4)
  {
    id v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v6 openURL:v5 options:&__NSDictionary0__struct completionHandler:0];
  }

  return a4 != 0;
}

- (MTApplication)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTApplication;
  id v2 = -[MTApplication init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTApplication subscribeToLifecycleEventNotifications](v2, "subscribeToLifecycleEventNotifications");
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTApplication;
  -[MTApplication dealloc](&v3, "dealloc");
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTApplication;
  id v2 = -[MTApplication delegate](&v4, "delegate");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  -[MTApplication setStrongDelegate:](self, "setStrongDelegate:", v4);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTApplication;
  -[MTApplication setDelegate:](&v5, "setDelegate:", v4);
}

+ (BOOL)localLibraryUpdatesDisabled
{
  id v2 = +[UIApplication isRunningInStoreDemoMode](&OBJC_CLASS___UIApplication, "isRunningInStoreDemoMode");
  uint64_t v3 = _MTLogCategoryDefault(v2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = (_DWORD)v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Local library updates disabled: %d",  (uint8_t *)v6,  8u);
  }

  return (char)v2;
}

- (void)openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTApplication delegate](self, "delegate"));
  unsigned int v12 = [v11 canOpenURL:v8];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]);
    if ([v13 isEqualToString:@"http"])
    {
    }

    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 scheme]);
      unsigned int v15 = [v14 isEqualToString:@"https"];

      if (!v15)
      {
        char v17 = 0;
LABEL_10:
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_10002BD54;
        v21[3] = &unk_100240EB8;
        char v24 = v17;
        v21[4] = self;
        id v22 = v8;
        id v23 = v10;
        v20.receiver = self;
        v20.super_class = (Class)&OBJC_CLASS___MTApplication;
        -[MTApplication openURL:options:completionHandler:](&v20, "openURL:options:completionHandler:", v22, v9, v21);

        goto LABEL_11;
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:UIApplicationOpenURLOptionUniversalLinksOnly]);

    if (v16)
    {
      char v17 = 1;
    }

    else
    {
      id v18 = [v9 mutableCopy];
      [v18 setObject:&__kCFBooleanTrue forKey:UIApplicationOpenURLOptionUniversalLinksOnly];

      char v17 = 1;
      id v9 = v18;
    }

    goto LABEL_10;
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MTApplication;
  -[MTApplication openURL:options:completionHandler:](&v19, "openURL:options:completionHandler:", v8, v9, v10);
LABEL_11:
}

- (void)completeOpenURLWithSuccess:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002BE38;
    v7[3] = &unk_100240EE0;
    id v8 = v5;
    BOOL v9 = a3;
    +[NSThread mainThread:](&OBJC_CLASS___NSThread, "mainThread:", v7);
  }
}

- (id)_extendLaunchTest
{
  return @"ResponsiveLaunchTest";
}

- (UIApplicationDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void)setStrongDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
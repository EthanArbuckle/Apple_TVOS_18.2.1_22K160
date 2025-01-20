@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)destroyScene:(id)a3;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int64_t)defaultSceneAttemptCount;
- (int64_t)preferredSceneAttemptCount;
- (void)requestSceneForSceneClientIdentifier:(id)a3 scenePreferredLevel:(double)a4 spatialConfiguration:(id)a5;
- (void)setDefaultSceneAttemptCount:(int64_t)a3;
- (void)setPreferredSceneAttemptCount:(int64_t)a3;
@end

@implementation AppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIServiceManager sharedServiceManager]( &OBJC_CLASS___AXUIServiceManager,  "sharedServiceManager",  a3,  a4));
  [v5 _applicationDidFinishLaunching];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIServiceManager sharedServiceManager](&OBJC_CLASS___AXUIServiceManager, "sharedServiceManager"));
  [v6 setDelegate:self];

  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a5 userActivities]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activityType]);
  if ([v9 length]) {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 activityType]);
  }
  else {
    v10 = @"Default Configuration";
  }

  uint64_t v11 = AXLogUI();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Creating configurationName: %@",  (uint8_t *)&v17,  0xCu);
  }

  id v13 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 role]);

  id v15 = [v13 initWithName:v10 sessionRole:v14];
  [v15 setDelegateClass:objc_opt_class(SceneDelegate)];

  return v15;
}

- (void)requestSceneForSceneClientIdentifier:(id)a3 scenePreferredLevel:(double)a4 spatialConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = AXLogUI();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    *(_DWORD *)buf = 138412546;
    id v31 = v8;
    __int16 v32 = 2112;
    v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "requestSceneForSceneClientIdentifier: %@, scenePreferredLevel: %@",  buf,  0x16u);
  }

  if (([v8 isEqualToString:@"kAXVOTMainSceneClientIdentifier"] & 1) != 0
    || ([v8 isEqualToString:@"kAXVOTScreenCurtainSceneClientIdentifier"] & 1) != 0
    || [v8 isEqualToString:@"kAXZoomSceneClientIdentifier"])
  {
    id v13 = -[NSUserActivity initWithActivityType:](objc_alloc(&OBJC_CLASS___NSUserActivity), "initWithActivityType:", v8);
    v28 = @"AXUIServerPreferredLevelKey";
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
    v29 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    -[NSUserActivity setUserInfo:](v13, "setUserInfo:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100003A8C;
    v24[3] = &unk_1000082F0;
    v24[4] = self;
    id v25 = v8;
    double v27 = a4;
    id v26 = v9;
    id v17 = v9;
    id v18 = v8;
    [v16 requestSceneSessionActivation:0 userActivity:v13 options:0 errorHandler:v24];
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100003C10;
    v20[3] = &unk_1000082F0;
    v20[4] = self;
    id v21 = v8;
    double v23 = a4;
    id v22 = v9;
    id v18 = v9;
    id v13 = (NSUserActivity *)v8;
    [v19 requestSceneSessionActivation:0 userActivity:0 options:0 errorHandler:v20];
  }
}

- (BOOL)destroyScene:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  unsigned __int8 v5 = [v4 supportsMultipleScenes];

  uint64_t v6 = AXLogUI();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "requestSceneSessionDestruction for scene: %@",  (uint8_t *)&v13,  0xCu);
    }

    if (!v3)
    {
      uint64_t v9 = AXLogUI();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_100004A8C(v10);
      }
    }

    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 session]);
    -[os_log_s requestSceneSessionDestruction:options:errorHandler:]( v7,  "requestSceneSessionDestruction:options:errorHandler:",  v11,  0LL,  &stru_100008330);
  }

  else if (v8)
  {
    int v13 = 138412290;
    id v14 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Multiple scenes is not supported, Can't destroy scene: %@",  (uint8_t *)&v13,  0xCu);
  }

  return v5;
}

- (int64_t)defaultSceneAttemptCount
{
  return self->_defaultSceneAttemptCount;
}

- (void)setDefaultSceneAttemptCount:(int64_t)a3
{
  self->_defaultSceneAttemptCount = a3;
}

- (int64_t)preferredSceneAttemptCount
{
  return self->_preferredSceneAttemptCount;
}

- (void)setPreferredSceneAttemptCount:(int64_t)a3
{
  self->_preferredSceneAttemptCount = a3;
}

@end
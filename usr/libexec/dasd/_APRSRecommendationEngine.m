@interface _APRSRecommendationEngine
+ (id)sharedInstance;
- (BOOL)freezerDisabled;
- (BOOL)isAppRunning:(id)a3;
- (BOOL)prewarmDisabled;
- (BOOL)wasAppForegrounded:(id)a3;
- (NSArray)prewarmRecommendations;
- (NSMutableDictionary)foregroundedApps;
- (NSMutableDictionary)runningApps;
- (NSString)name;
- (OS_os_log)log;
- (RBSProcessMonitor)appMonitor;
- (_APRSPrewarmRecommendation)prewarmRecommender;
- (_APRSRecommendationEngine)init;
- (double)version;
- (void)evaluatePrewarmRecommendations;
- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4;
- (void)registerForTrial;
- (void)setAppMonitor:(id)a3;
- (void)setForegroundedApps:(id)a3;
- (void)setFreezerDisabled:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmDisabled:(BOOL)a3;
- (void)setPrewarmRecommendations:(id)a3;
- (void)setPrewarmRecommender:(id)a3;
- (void)setRunningApps:(id)a3;
- (void)updateCurrentRecommendations;
- (void)updateTrialParameters;
@end

@implementation _APRSRecommendationEngine

- (NSString)name
{
  return (NSString *)@"recommendationEngine1.0";
}

- (double)version
{
  return 1.0;
}

- (_APRSRecommendationEngine)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____APRSRecommendationEngine;
  v2 = -[_APRSRecommendationEngine init](&v22, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_freezerDisabled = 0;
    os_log_t v4 = os_log_create("com.apple.aprs", "appResume.RecomEngine");
    log = v3->_log;
    v3->_log = v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[_APRSPrewarmRecommendation sharedInstance](&OBJC_CLASS____APRSPrewarmRecommendation, "sharedInstance"));
    prewarmRecommender = v3->_prewarmRecommender;
    v3->_prewarmRecommender = (_APRSPrewarmRecommendation *)v6;

    -[_APRSRecommendationEngine registerForTrial](v3, "registerForTrial");
    -[_APRSRecommendationEngine updateTrialParameters](v3, "updateTrialParameters");
    v8 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    byte_100157B20 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", @"prewarmOnAppDeath");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](&OBJC_CLASS___RBSProcessStateDescriptor, "descriptor"));
    [v9 setValues:1];
    [v9 setEndowmentNamespaces:&off_100122538];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    foregroundedApps = v3->_foregroundedApps;
    v3->_foregroundedApps = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    runningApps = v3->_runningApps;
    v3->_runningApps = (NSMutableDictionary *)v12;

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100059720;
    v19[3] = &unk_100116470;
    id v20 = v9;
    v14 = v3;
    v21 = v14;
    id v15 = v9;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[RBSProcessMonitor monitorWithConfiguration:]( &OBJC_CLASS___RBSProcessMonitor,  "monitorWithConfiguration:",  v19));
    appMonitor = v14->_appMonitor;
    v14->_appMonitor = (RBSProcessMonitor *)v16;
  }

  return v3;
}

- (BOOL)wasAppForegrounded:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_foregroundedApps, "allKeys"));
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)isAppRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_runningApps, "allKeys"));
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)handleStateTransitionForProcess:(id)a3 withUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
    unsigned __int8 v12 = [v11 isRunning];

    runningApps = v8->_runningApps;
    if ((v12 & 1) == 0)
    {
      -[NSMutableDictionary removeObjectForKey:](runningApps, "removeObjectForKey:", v10);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v10));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleExecutable]);

      if (v18) {
        -[NSMutableDictionary removeObjectForKey:](v8->_foregroundedApps, "removeObjectForKey:", v18);
      }
      if (byte_100157B20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](&OBJC_CLASS____APRSPrewarmInterface, "sharedInstance"));
        id v22 = [v21 prewarmLaunchAppFromBundleID:v10];
      }

      goto LABEL_14;
    }

    -[NSMutableDictionary setObject:forKey:](runningApps, "setObject:forKey:", v6, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 state]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 endowmentNamespaces]);
    unsigned int v16 = [v15 containsObject:@"com.apple.frontboard.visibility"];

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v10));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleExecutable]);

      if (v18)
      {
        -[NSMutableDictionary setObject:forKey:](v8->_foregroundedApps, "setObject:forKey:", v6, v18);
      }

      else
      {
        log = v8->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          sub_1000B4FD8((uint64_t)v10, log);
        }
      }

+ (id)sharedInstance
{
  if (qword_100157B30 != -1) {
    dispatch_once(&qword_100157B30, &stru_100116490);
  }
  return (id)qword_100157B28;
}

- (void)evaluatePrewarmRecommendations
{
}

- (void)updateCurrentRecommendations
{
  if (self->_prewarmDisabled)
  {
    prewarmRecommendations = self->_prewarmRecommendations;
    self->_prewarmRecommendations = (NSArray *)&__NSArray0__struct;
  }

  else
  {
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[_APRSPrewarmRecommendation recommendations](self->_prewarmRecommender, "recommendations"));
    prewarmRecommendations = self->_prewarmRecommendations;
    self->_prewarmRecommendations = v4;
  }
}

- (void)registerForTrial
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 factorWithName:off_100156A38]);
  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = log;
      int v16 = 67109120;
      unsigned int v17 = [v4 BOOLeanValue];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Trial: freezerDisabled set to %d",  (uint8_t *)&v16,  8u);
    }

    self->_BOOL freezerDisabled = [v4 BOOLeanValue];
  }

  else if (v6)
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load freezerDisabled",  (uint8_t *)&v16,  2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 factorWithName:off_100156A40]);
  v9 = self->_log;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      unsigned int v12 = [v8 BOOLeanValue];
      int v16 = 67109120;
      unsigned int v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Trial: prewarmDisabled set to %d",  (uint8_t *)&v16,  8u);
    }

    self->_BOOL prewarmDisabled = [v8 BOOLeanValue];
  }

  else if (v10)
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load prewarmDisabled",  (uint8_t *)&v16,  2u);
  }

  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL freezerDisabled = self->_freezerDisabled;
    BOOL prewarmDisabled = self->_prewarmDisabled;
    int v16 = 67109376;
    unsigned int v17 = freezerDisabled;
    __int16 v18 = 1024;
    BOOL v19 = prewarmDisabled;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Freezer Disabled: %d, Prewarm Disabled: %d",  (uint8_t *)&v16,  0xEu);
  }
}

- (RBSProcessMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
}

- (_APRSPrewarmRecommendation)prewarmRecommender
{
  return self->_prewarmRecommender;
}

- (void)setPrewarmRecommender:(id)a3
{
}

- (NSArray)prewarmRecommendations
{
  return self->_prewarmRecommendations;
}

- (void)setPrewarmRecommendations:(id)a3
{
}

- (NSMutableDictionary)runningApps
{
  return self->_runningApps;
}

- (void)setRunningApps:(id)a3
{
}

- (NSMutableDictionary)foregroundedApps
{
  return self->_foregroundedApps;
}

- (void)setForegroundedApps:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)freezerDisabled
{
  return self->_freezerDisabled;
}

- (void)setFreezerDisabled:(BOOL)a3
{
  self->_BOOL freezerDisabled = a3;
}

- (BOOL)prewarmDisabled
{
  return self->_prewarmDisabled;
}

- (void)setPrewarmDisabled:(BOOL)a3
{
  self->_BOOL prewarmDisabled = a3;
}

- (void).cxx_destruct
{
}

@end
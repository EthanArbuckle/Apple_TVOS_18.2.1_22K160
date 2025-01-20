@interface _APRSPrewarmInterface
+ (id)sharedInstance;
- (BOOL)hasPrewarmAssertionForApplication:(id)a3;
- (NSMutableDictionary)prewarmedAssertions;
- (OS_os_log)log;
- (_APRSPrewarmInterface)init;
- (id)closureBuildLaunchAppFromBundleID:(id)a3;
- (id)prelaunchAppFromBundleID:(id)a3 isClosure:(BOOL)a4;
- (id)prewarmLaunchAppFromBundleID:(id)a3;
- (int64_t)userDrainBehavior;
- (os_unfair_lock_s)lock;
- (void)appendPrewarmAssertion:(id)a3 withAssertion:(id)a4;
- (void)invalidatePrewarmAssertionForApplication:(id)a3;
- (void)invalidatePrewarmAssertionForApplication:(id)a3 onInvalidation:(id)a4;
- (void)prewarmRecommendations:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmedAssertions:(id)a3;
- (void)setUserDrainBehavior:(int64_t)a3;
@end

@implementation _APRSPrewarmInterface

- (_APRSPrewarmInterface)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____APRSPrewarmInterface;
  v2 = -[_APRSPrewarmInterface init](&v16, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.prewarmInterface");
    log = v2->_log;
    v2->_log = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    prewarmedAssertions = v2->_prewarmedAssertions;
    v2->_prewarmedAssertions = (NSMutableDictionary *)v5;

    v7 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.aprs");
    v2->_userDrainBehavior = -[NSUserDefaults integerForKey:](v7, "integerForKey:", @"drainBehavior");
    dispatch_time_t v8 = dispatch_time(0LL, 300000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000410D4;
    v13[3] = &unk_100115148;
    v14 = v2;
    v15 = v7;
    v11 = v7;
    dispatch_after(v8, v10, v13);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001578D0 != -1) {
    dispatch_once(&qword_1001578D0, &stru_100115DE8);
  }
  return (id)qword_1001578C8;
}

- (void)prewarmRecommendations:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Prewarm recommendations: %@", buf, 0xCu);
  }

  int v6 = 3;
  if (_os_feature_enabled_impl("PowerUI", "ambrosia"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](&OBJC_CLASS____DASLowPowerModePolicy, "policyInstance"));
    unsigned int v8 = [v7 isChallengedForBatteryLife];

    if (v8) {
      int v6 = 1;
    }
    else {
      int v6 = 3;
    }
  }

  char v9 = self->_userDrainBehavior == 1;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v13 = v11;
    int v14 = 0;
    int v15 = v6 << v9;
    uint64_t v16 = *(void *)v23;
    *(void *)&__int128 v12 = 138412290LL;
    __int128 v21 = v12;
LABEL_9:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v16) {
        objc_enumerationMutation(v10);
      }
      if (v14 >= v15) {
        break;
      }
      v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v21;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting prewarm for %@", buf, 0xCu);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue( -[_APRSPrewarmInterface prewarmLaunchAppFromBundleID:]( self,  "prewarmLaunchAppFromBundleID:",  v18,  v21,  (void)v22));
      if (!v20) {
        ++v14;
      }

      if (v13 == (id)++v17)
      {
        id v13 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
}

- (void)appendPrewarmAssertion:(id)a3 withAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prewarmedAssertions,  "objectForKeyedSubscript:",  v6));

  if (v8)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prewarmedAssertions,  "objectForKeyedSubscript:",  v6));
    [v9 invalidate];
  }

  -[NSMutableDictionary setObject:forKey:](self->_prewarmedAssertions, "setObject:forKey:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);
  dispatch_time_t v10 = dispatch_time(0LL, 500000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int128 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100041568;
  v14[3] = &unk_100115148;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_after(v10, v12, v14);
}

- (BOOL)hasPrewarmAssertionForApplication:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prewarmedAssertions,  "objectForKeyedSubscript:",  v5));

  os_unfair_lock_unlock(p_lock);
  return v6 != 0LL;
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3
{
}

- (void)invalidatePrewarmAssertionForApplication:(id)a3 onInvalidation:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, BOOL))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Requesting prewarm termination for %@",  (uint8_t *)&v13,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_prewarmedAssertions,  "objectForKeyedSubscript:",  v6));
  dispatch_time_t v10 = v9;
  if (v9)
  {
    [v9 invalidateSyncWithError:0];
    -[NSMutableDictionary removeObjectForKey:](self->_prewarmedAssertions, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_lock);
    id v11 = self->_log;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v13 = 138412290;
    id v14 = v6;
    __int128 v12 = "Prewarm terminated for %@";
  }

  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v11 = self->_log;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v13 = 138412290;
    id v14 = v6;
    __int128 v12 = "Prewarm assertion lost for %@";
  }

  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
LABEL_9:
  if (v7) {
    v7[2](v7, v10 != 0LL);
  }
}

- (id)prelaunchAppFromBundleID:(id)a3 isClosure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___RBSLaunchContext);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForEmbeddedApplicationIdentifier:",  v6));
  [v7 setIdentity:v8];

  char v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSDomainAttribute attributeWithDomain:name:]( &OBJC_CLASS___RBSDomainAttribute,  "attributeWithDomain:name:",  @"com.apple.dasd",  @"DYLDLaunch"));
  v35 = v9;
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  [v7 setAttributes:v10];

  if (v4) {
    id v11 = @"DAS DYLD3 Closure Generation";
  }
  else {
    id v11 = @"DAS Prewarm launch";
  }
  if (v4) {
    __int128 v12 = &off_100122470;
  }
  else {
    __int128 v12 = &off_100122498;
  }
  [v7 setExplanation:v11];
  [v7 _setAdditionalEnvironment:v12];
  id v13 = [[RBSLaunchRequest alloc] initWithContext:v7];
  id v29 = 0LL;
  id v30 = 0LL;
  id v28 = 0LL;
  unsigned __int8 v14 = [v13 execute:&v30 assertion:&v29 error:&v28];
  id v15 = v30;
  id v16 = v29;
  id v17 = v28;
  log = self->_log;
  BOOL v19 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v32 = v6;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)&v32[10] = v4;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Prelaunched app: %@ (%u)", buf, 0x12u);
    }

    if (v16)
    {
      __int128 v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472LL;
      __int128 v25 = sub_100041A90;
      v26 = &unk_100115E10;
      id v27 = v15;
      [v27 monitorForDeath:&v23];
      -[_APRSPrewarmInterface appendPrewarmAssertion:withAssertion:]( self,  "appendPrewarmAssertion:withAssertion:",  v6,  v16,  v23,  v24,  v25,  v26);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSMetricRecorder sharedInstance](&OBJC_CLASS____APRSMetricRecorder, "sharedInstance"));
    objc_msgSend(v20, "startLoggingForApp:pid:forEvent:", v6, objc_msgSend(v15, "pid"), 0);
  }

  else if (v19)
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v32 = v4;
    *(_WORD *)&v32[4] = 2112;
    *(void *)&v32[6] = v6;
    __int16 v33 = 2112;
    id v34 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Encountered error with prelaunch (%u) of %@: %@",  buf,  0x1Cu);
  }

  id v21 = v17;

  return v21;
}

- (id)closureBuildLaunchAppFromBundleID:(id)a3
{
  return -[_APRSPrewarmInterface prelaunchAppFromBundleID:isClosure:]( self,  "prelaunchAppFromBundleID:isClosure:",  a3,  1LL);
}

- (id)prewarmLaunchAppFromBundleID:(id)a3
{
  return -[_APRSPrewarmInterface prelaunchAppFromBundleID:isClosure:]( self,  "prelaunchAppFromBundleID:isClosure:",  a3,  0LL);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)prewarmedAssertions
{
  return self->_prewarmedAssertions;
}

- (void)setPrewarmedAssertions:(id)a3
{
}

- (int64_t)userDrainBehavior
{
  return self->_userDrainBehavior;
}

- (void)setUserDrainBehavior:(int64_t)a3
{
  self->_userDrainBehavior = a3;
}

- (void).cxx_destruct
{
}

@end
@interface _DASActivityRateLimitManager
+ (id)sharedLimiter;
- (BOOL)executeActivity:(id)a3;
- (BOOL)isActivityRateLimited:(id)a3 atSubmission:(BOOL)a4;
- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4;
- (BOOL)limitsApplyToActivity:(id)a3;
- (BOOL)rateManagementApplyToActivity:(id)a3;
- (NSMutableDictionary)rateLimitConfigurations;
- (NSMutableDictionary)submittedConfigurations;
- (NSString)limitationName;
- (NSUserDefaults)defaults;
- (OS_dispatch_source)cleanupTimer;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASActivityRateLimitManager)init;
- (id)evaluateActivityAtSubmission:(id)a3;
- (id)evaluateRateLimitedActivity:(id)a3;
- (id)evaluationResultsAtExecution:(id)a3;
- (id)loadSubmittedRateLimitConfiguration;
- (id)shouldLimitActivity:(id)a3 withEvaluationResults:(id)a4 atDate:(id)a5;
- (id)unprotectedEvaluateRateLimitedActivity:(id)a3 forIdentifier:(id)a4;
- (os_unfair_lock_s)submittedConfigurationLock;
- (void)cleanupTimerHandler;
- (void)completeActivity:(id)a3;
- (void)initializeRateLimitWithActivity:(id)a3 withIdentifier:(id)a4;
- (void)logSubmittedActivity:(id)a3 asRateLimited:(BOOL)a4;
- (void)recalculateStartDates;
- (void)replaceExistingRateLimitsForConfiguration:(id)a3;
- (void)saveSubmittedRateLimitConfiguration;
- (void)setCleanupTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLimitationName:(id)a3;
- (void)setLog:(id)a3;
- (void)setRateLimitConfigurations:(id)a3;
- (void)setSubmittedConfigurationLock:(os_unfair_lock_s)a3;
- (void)setSubmittedConfigurations:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitRateLimitConfiguration:(id)a3;
@end

@implementation _DASActivityRateLimitManager

- (_DASActivityRateLimitManager)init
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS____DASActivityRateLimitManager;
  v2 = -[_DASActivityRateLimitManager init](&v37, "init");
  v3 = v2;
  if (v2)
  {
    v2->_submittedConfigurationLock._os_unfair_lock_opaque = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[_DASActivityRateLimitManager setRateLimitConfigurations:](v3, "setRateLimitConfigurations:", v4);

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    objc_storeStrong((id *)&v3->_defaults, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities getCurrentBootSessionUUID]( &OBJC_CLASS____DASRateLimiterUtilities,  "getCurrentBootSessionUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults stringForKey:](v5, "stringForKey:", @"previousBootUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager loadSubmittedRateLimitConfiguration]( v3,  "loadSubmittedRateLimitConfiguration"));
    v9 = v8;
    if (v8 && [v8 count]) {
      unsigned int v10 = [v6 isEqualToString:v7];
    }
    else {
      unsigned int v10 = 0;
    }
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v3->_context;
    v3->_context = (_CDContext *)v11;

    os_log_t v13 = os_log_create("com.apple.duetactivityscheduler", "processRateLimiter");
    log = v3->_log;
    v3->_log = v13;

    os_unfair_lock_lock(&v3->_submittedConfigurationLock);
    if (v10) {
      id v15 = [v9 mutableCopy];
    }
    else {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    v16 = v15;
    -[_DASActivityRateLimitManager setSubmittedConfigurations:](v3, "setSubmittedConfigurations:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
    uint64_t v18 = _DASCKRateLimitConfigurationName;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:_DASCKRateLimitConfigurationName]);

    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities ckRateLimitConfiguration]( &OBJC_CLASS____DASRateLimiterUtilities,  "ckRateLimitConfiguration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
      [v21 setObject:v20 forKeyedSubscript:v18];
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
    uint64_t v23 = _DASPECRateLimitConfigurationName;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:_DASPECRateLimitConfigurationName]);

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities pecRateLimitConfiguration]( &OBJC_CLASS____DASRateLimiterUtilities,  "pecRateLimitConfiguration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](v3, "submittedConfigurations"));
      [v26 setObject:v25 forKeyedSubscript:v23];
    }

    os_unfair_lock_unlock(&v3->_submittedConfigurationLock);
    -[_DASActivityRateLimitManager saveSubmittedRateLimitConfiguration](v3, "saveSubmittedRateLimitConfiguration");
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v28);
    cleanupTimer = v3->_cleanupTimer;
    v3->_cleanupTimer = (OS_dispatch_source *)v29;

    v31 = (dispatch_source_s *)v3->_cleanupTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000C518;
    handler[3] = &unk_1001150D0;
    v36 = v3;
    dispatch_source_set_event_handler(v31, handler);
    v32 = (dispatch_source_s *)v3->_cleanupTimer;
    dispatch_time_t v33 = dispatch_walltime(0LL, 14400000000000LL);
    dispatch_source_set_timer(v32, v33, 0xD18C2E28000uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)v3->_cleanupTimer);
    -[NSUserDefaults setObject:forKey:](v3->_defaults, "setObject:forKey:", v6, @"previousBootUUID");
  }

  return v3;
}

+ (id)sharedLimiter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000C594;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001574E0 != -1) {
    dispatch_once(&qword_1001574E0, block);
  }
  return (id)qword_1001574E8;
}

- (void)cleanupTimerHandler
{
  id obj = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  id v5 = [v4 copy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v11]);
        if ([v12 isInactiveAtDate:v3])
        {
          os_log_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
          [v13 removeObjectForKey:v11];

          [v6 addObject:v11];
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v8);
  }

  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager log](self, "log"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    __int16 v23 = 2112;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Removed rate limits %@. Now: %@", buf, 0x16u);
  }

  objc_sync_exit(obj);
}

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v4 = a3;
  if (!-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4)
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetID]), v5, v5)
    || (v6 = (void *)objc_claimAutoreleasedReturnValue([v4 rateLimitConfigurationName]),
        unsigned __int8 v7 = [v6 containsString:_DASPECRateLimitConfigurationName],
        v6,
        (v7 & 1) != 0))
  {
    char v8 = 0;
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned __int8 v11 = [v10 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

    char v8 = v11 ^ 1;
  }

  return v8;
}

- (BOOL)rateManagementApplyToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  if (!v5) {
    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  unsigned __int8 v7 = [v6 containsOverrideForActivity:v3 withLimitation:kDASProcessRateLimitationName];

  if ((v7 & 1) != 0) {
    goto LABEL_4;
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
  if ([v10 containsString:@"com.apple.ckdiscretionaryd"])
  {
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
    if ([v11 containsObject:@"com.apple.mediaanalysisd-service"])
    {

      unsigned __int8 v8 = 0;
LABEL_9:

      goto LABEL_5;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
    unsigned __int8 v13 = [v12 containsObject:@"com.apple.mediaanalysisd"];

    if ((v13 & 1) != 0) {
      goto LABEL_4;
    }
  }

  else
  {
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
  if ([v14 containsString:@"com.apple.ckdiscretionaryd"])
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
    unsigned __int8 v16 = [v15 containsObject:@"com.apple.TVPhotos"];

    if ((v16 & 1) != 0) {
      goto LABEL_4;
    }
  }

  else
  {
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:_DASNonRateLimitedLaunchKey]);
  unsigned __int8 v19 = [v18 BOOLValue];

  if ((v19 & 1) == 0)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:_DASOverrideRateLimitingKey]);
    unsigned __int8 v22 = [v21 BOOLValue];

    if ((v22 & 1) == 0)
    {
      if (![v3 requestsApplicationLaunch]
        || (__int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]),
            unsigned __int8 v24 = [v23 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification],
            v23,
            (v24 & 1) == 0))
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v3 rateLimitConfigurationName]);
        if (v25)
        {
          v26 = (void *)v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue([v3 rateLimitConfigurationName]);
          v28 = (void *)_DASDefaultConfigurationName;

          if (v27 != v28)
          {
            unsigned __int8 v8 = 1;
            goto LABEL_5;
          }
        }

        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
        unsigned __int8 v8 = [v10 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];
        goto LABEL_9;
      }
    }
  }

- (void)submitActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:")) {
    -[_DASActivityRateLimitManager isActivityRateLimited:atSubmission:]( self,  "isActivityRateLimited:atSubmission:",  v4,  1LL);
  }
}

- (BOOL)executeActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4)) {
    unsigned int v5 = !-[_DASActivityRateLimitManager isActivityRateLimited:atSubmission:]( self,  "isActivityRateLimited:atSubmission:",  v4,  0LL);
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isActivityRateLimited:(id)a3 atSubmission:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v6))
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    if (v4) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager evaluateActivityAtSubmission:](self, "evaluateActivityAtSubmission:", v6));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager evaluationResultsAtExecution:](self, "evaluationResultsAtExecution:", v6));
    }
    unsigned int v10 = (void *)v8;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager shouldLimitActivity:withEvaluationResults:atDate:]( self,  "shouldLimitActivity:withEvaluationResults:atDate:",  v6,  v8,  v7));
    v12 = (void *)v11;
    if (v11)
    {
      uint64_t v19 = v11;
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
      unsigned int v14 = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  5LL,  v13);

      if (v14)
      {
        __int128 v18 = v12;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
        -[_DASActivityRateLimitManager limitedActivity:withLimitsResponses:]( self,  "limitedActivity:withLimitsResponses:",  v6,  v15);
      }
    }

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 maxedRateLimits]);
    BOOL v9 = [v16 count] != 0;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)completeActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  v4));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

      if (v8)
      {
        [v8 removePendingActivity:v4];
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_1000B0F18();
      }

      objc_sync_exit(v6);
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "No group name for %@",  (uint8_t *)&v10,  0xCu);
      }
    }
  }
}

- (void)recalculateStartDates
{
  unsigned int v18 = +[_DASRateLimiterUtilities consideredInLPMWithState:]( &OBJC_CLASS____DASRateLimiterUtilities,  "consideredInLPMWithState:",  self->_context);
  id obj = (id)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(obj);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = v4;
  id v19 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v16);
        }
        unsigned int v5 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "evaluationResultsWithLPMState:", v18, obj));
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pendingActivities]);
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v22;
          do
          {
            for (j = 0LL; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v6 nextEvaluationDate]);
              +[_DASRateLimiterUtilities adjustStartAfterDate:forActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "adjustStartAfterDate:forActivity:",  v12,  v11);

              unsigned __int8 v13 = self->_log;
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 nextEvaluationDate]);
                *(_DWORD *)buf = 138412546;
                uint64_t v30 = v11;
                __int16 v31 = 2112;
                v32 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Adjust activity %@ startAfter date to be %@",  buf,  0x16u);
              }
            }

            id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }

          while (v8);
        }
      }

      id v19 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }

    while (v19);
  }

  objc_sync_exit(obj);
}

- (void)replaceExistingRateLimitsForConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  id v6 = [v5 copy];

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v50;
    *(void *)&__int128 v9 = 138412546LL;
    __int128 v36 = v9;
    v12 = &OBJC_IVAR____DASActivityDurationTracker__log;
    id v38 = v7;
    id v39 = v4;
    uint64_t v37 = *(void *)v50;
    do
    {
      unsigned __int8 v13 = 0LL;
      id v40 = v10;
      do
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v7);
        }
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v49 + 1) + 8 * (void)v13),  v36));
        id v15 = v14;
        if (v14)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 configurationName]);
          v43 = v15;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          unsigned int v18 = [v16 isEqualToString:v17];

          id v15 = v43;
          if (v18)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              v54 = v43;
              __int16 v55 = 2112;
              id v56 = v4;
              _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Replacing configuration %@ with %@",  buf,  0x16u);
            }

            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 rateLimits]);

            v42 = v13;
            if (v20)
            {
              [v43 replaceRateLimitConfiguration:v4];
              id v21 = [v12 + 60 consideredInLPMWithState:self->_context];
              if ((_DWORD)v21)
              {
                __int128 v22 = self->_log;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Rate Limits are subjected to LPM Windows",  buf,  2u);
                }
              }

              v41 = (void *)objc_claimAutoreleasedReturnValue([v43 evaluationResultsWithLPMState:v21]);
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v41 nextEvaluationDate]);
              __int128 v45 = 0u;
              __int128 v46 = 0u;
              __int128 v47 = 0u;
              __int128 v48 = 0u;
              id obj = (id)objc_claimAutoreleasedReturnValue([v43 pendingActivities]);
              id v24 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v46;
                do
                {
                  for (i = 0LL; i != v25; i = (char *)i + 1)
                  {
                    if (*(void *)v46 != v26) {
                      objc_enumerationMutation(obj);
                    }
                    __int128 v28 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
                    dispatch_source_t v29 = self->_log;
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v30 = v29;
                      __int16 v31 = self;
                      v32 = v12;
                      dispatch_time_t v33 = (void *)objc_claimAutoreleasedReturnValue([v28 description]);
                      v34 = (void *)objc_claimAutoreleasedReturnValue([v43 configurationName]);
                      *(_DWORD *)buf = 138412802;
                      v54 = v33;
                      __int16 v55 = 2112;
                      id v56 = v23;
                      __int16 v57 = 2112;
                      v58 = v34;
                      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Modified rate limit! Adjusted activity %@ start date to %@ configuration %@",  buf,  0x20u);

                      v12 = v32;
                      self = v31;
                    }

                    [v12 + 60 adjustStartAfterDate:v23 forActivity:v28];
                  }

                  id v25 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
                }

                while (v25);
              }

              id v7 = v38;
              id v4 = v39;
              uint64_t v11 = v37;
              id v10 = v40;
              v35 = v41;
              id v15 = v43;
            }

            else
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v43 configurationName]);
              [v35 removeObjectForKey:v23];
            }

            unsigned __int8 v13 = v42;
          }
        }

        unsigned __int8 v13 = (char *)v13 + 1;
      }

      while (v13 != v10);
      id v10 = [v7 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }

    while (v10);
  }
}

- (void)saveSubmittedRateLimitConfiguration
{
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
  if (v4
    && (unsigned int v5 = (void *)v4,
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations")),
        id v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v8));

    id v13 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  &v13));
    id v11 = v13;
    if (v10)
    {
      -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", v10, @"rateLimitConfigurations");
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000B0F94();
    }

    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager loadSubmittedRateLimitConfiguration]( self,  "loadSubmittedRateLimitConfiguration"));
    if (v12) {
      -[NSUserDefaults removeObjectForKey:]( self->_defaults,  "removeObjectForKey:",  @"rateLimitConfigurations",  v12);
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }

- (id)loadSubmittedRateLimitConfiguration
{
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", @"rateLimitConfigurations"));
  if (v4)
  {
    v11[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
    v11[1] = objc_opt_class(&OBJC_CLASS___NSString);
    v11[2] = objc_opt_class(&OBJC_CLASS____DASActivityRateLimitConfiguration);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 3LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

    id v10 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v6,  v4,  &v10));
    id v8 = v10;
    if (!v7 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000B0FF4();
    }
    os_unfair_lock_unlock(p_submittedConfigurationLock);
  }

  else
  {
    os_unfair_lock_unlock(p_submittedConfigurationLock);
    id v7 = 0LL;
  }

  return v7;
}

- (void)submitRateLimitConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
  objc_sync_enter(v5);
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[_DASActivityRateLimitManager setSubmittedConfigurations:](self, "setSubmittedConfigurations:", v8);
  }

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  if (v11 && (id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 rateLimits]), v12, !v12))
  {
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    [v14 removeObjectForKey:v15];
  }

  else
  {
    if ([v11 isEqual:v4])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Submitted rate limit %@ already exists",  (uint8_t *)&v19,  0xCu);
      }

      goto LABEL_13;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    [v14 setObject:v4 forKeyedSubscript:v15];
  }

  os_unfair_lock_unlock(&self->_submittedConfigurationLock);
  -[_DASActivityRateLimitManager saveSubmittedRateLimitConfiguration](self, "saveSubmittedRateLimitConfiguration");
  -[_DASActivityRateLimitManager replaceExistingRateLimitsForConfiguration:]( self,  "replaceExistingRateLimitsForConfiguration:",  v4);
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  id v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 allKeys]);
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    __int128 v22 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Submitted rate limit %@. Submitted rate limits %@",  (uint8_t *)&v19,  0x16u);
  }

LABEL_13:
  os_unfair_lock_unlock(p_submittedConfigurationLock);

  objc_sync_exit(v5);
}

- (void)logSubmittedActivity:(id)a3 asRateLimited:(BOOL)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 widgetID]);

  if (!v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000DC94;
    v7[3] = &unk_1001150F8;
    BOOL v9 = a4;
    id v8 = v5;
    AnalyticsSendEventLazy(@"com.apple.dasd.rateLimitedAtSubmit", v7);
  }
}

- (void)initializeRateLimitWithActivity:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 rateLimitConfigurationName]);
  p_submittedConfigurationLock = &self->_submittedConfigurationLock;
  os_unfair_lock_lock(&self->_submittedConfigurationLock);
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v8]);

    if (v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager submittedConfigurations](self, "submittedConfigurations"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

LABEL_12:
      os_unfair_lock_unlock(&self->_submittedConfigurationLock);
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitConfiguration_Internal rateLimitConfiguration:withIdentifier:]( &OBJC_CLASS____DASActivityRateLimitConfiguration_Internal,  "rateLimitConfiguration:withIdentifier:",  v13,  v7));
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      [v21 setObject:v20 forKeyedSubscript:v7];

      goto LABEL_13;
    }
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  unsigned int v15 = [v14 containsString:@"assetsd.backgroundjobservice.lowprioritysearchbattery"];

  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities assetsRateLimitConfiguration]( &OBJC_CLASS____DASRateLimiterUtilities,  "assetsRateLimitConfiguration"));
LABEL_11:
    id v13 = (void *)v16;
    goto LABEL_12;
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 limitationResponse]);
  unsigned int v18 = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  2LL,  v17);

  if (!v18)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities defaultRateLimiterConfiguration]( &OBJC_CLASS____DASRateLimiterUtilities,  "defaultRateLimiterConfiguration"));
    goto LABEL_11;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Not rate limiting activity %@, already rate limited at submission",  (uint8_t *)&v22,  0xCu);
  }

  os_unfair_lock_unlock(p_submittedConfigurationLock);
LABEL_13:
}

- (id)evaluateActivityAtSubmission:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  v4));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

      if (v8)
      {
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:]( self,  "unprotectedEvaluateRateLimitedActivity:forIdentifier:",  v4,  v5));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 maxedRateLimits]);
        BOOL v11 = [v10 count] != 0;

        -[_DASActivityRateLimitManager logSubmittedActivity:asRateLimited:]( self,  "logSubmittedActivity:asRateLimited:",  v4,  v11);
      }

      else
      {
        -[_DASActivityRateLimitManager initializeRateLimitWithActivity:withIdentifier:]( self,  "initializeRateLimitWithActivity:withIdentifier:",  v4,  v5);
        -[_DASActivityRateLimitManager logSubmittedActivity:asRateLimited:]( self,  "logSubmittedActivity:asRateLimited:",  v4,  0LL);
        BOOL v9 = 0LL;
      }

      objc_sync_exit(v6);
    }

    else
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000B1054();
      }
      BOOL v9 = 0LL;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  return v9;
}

- (id)evaluationResultsAtExecution:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  v4));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:]( self,  "unprotectedEvaluateRateLimitedActivity:forIdentifier:",  v4,  v5));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 maxedRateLimits]);
      id v9 = [v8 count];

      if (v9)
      {
        id v10 = v7;
      }

      else
      {
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v5]);

        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
        [v12 executeActivity:v4 atDate:v13];

        id v10 = 0LL;
      }

      objc_sync_exit(v6);
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (id)evaluateRateLimitedActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v4))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "rateLimitIdentifierForActivity:",  v4));
    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
      objc_sync_enter(v6);
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRateLimitManager unprotectedEvaluateRateLimitedActivity:forIdentifier:]( self,  "unprotectedEvaluateRateLimitedActivity:forIdentifier:",  v4,  v5));
      objc_sync_exit(v6);
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)unprotectedEvaluateRateLimitedActivity:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[_DASActivityRateLimitManager rateManagementApplyToActivity:](self, "rateManagementApplyToActivity:", v6))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitManager rateLimitConfigurations](self, "rateLimitConfigurations"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);

    if (!v9) {
      -[_DASActivityRateLimitManager initializeRateLimitWithActivity:withIdentifier:]( self,  "initializeRateLimitWithActivity:withIdentifier:",  v6,  v7);
    }
    BOOL v10 = +[_DASRateLimiterUtilities consideredInLPMWithState:]( &OBJC_CLASS____DASRateLimiterUtilities,  "consideredInLPMWithState:",  self->_context);
    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Rate Limits are subjected to LPM Windows",  (uint8_t *)&v25,  2u);
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 evaluationResultsWithLPMState:v10]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 maxedRateLimits]);
    id v14 = [v13 count];

    if (v14)
    {
      [v9 addPendingActivity:v6];
      unsigned int v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v15;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 nextEvaluationDate]);
        int v19 = (void *)objc_claimAutoreleasedReturnValue([v12 maxedRateLimits]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
        int v25 = 138413570;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v18;
        __int16 v29 = 2114;
        id v30 = v6;
        __int16 v31 = 2114;
        id v32 = v7;
        __int16 v33 = 2112;
        v34 = v19;
        __int16 v35 = 2112;
        __int128 v36 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Adjusting original start date %@ to start date %@ for activity '%{public}@' with identifier %{public}@ and rat e limit %@ while device LPM state is %@",  (uint8_t *)&v25,  0x3Eu);
      }

      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 nextEvaluationDate]);
      +[_DASRateLimiterUtilities adjustStartAfterDate:forActivity:]( &OBJC_CLASS____DASRateLimiterUtilities,  "adjustStartAfterDate:forActivity:",  v21,  v6);
    }

    else
    {
      int v22 = self->_log;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      __int16 v21 = v22;
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
      int v25 = 138543874;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v24;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "'%{public}@' is timewise eligible for rate limit configuration %@ while device LPM state is %@",  (uint8_t *)&v25,  0x20u);
    }

LABEL_14:
    goto LABEL_15;
  }

  id v12 = 0LL;
LABEL_15:

  return v12;
}

- (id)shouldLimitActivity:(id)a3 withEvaluationResults:(id)a4 atDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (-[_DASActivityRateLimitManager limitsApplyToActivity:](self, "limitsApplyToActivity:", a3)
    && (BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 maxedRateLimits]),
        id v11 = [v10 count],
        v10,
        v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 nextEvaluationDate]);
    [v12 timeIntervalSinceDate:v9];
    double v14 = v13;

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 maxedRateLimits]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 lastObject]);

    uint64_t v17 = kDASProcessRateLimitationName;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DASLimiterResponse limitResponseWithDecision:withLimiter:validityDuration:rationale:]( &OBJC_CLASS____DASLimiterResponse,  "limitResponseWithDecision:withLimiter:validityDuration:rationale:",  5LL,  v17,  v18,  v14));
  }

  else
  {
    int v19 = 0LL;
  }

  return v19;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[_DASActivityRateLimitManager limitsApplyToActivity:](self, "limitsApplyToActivity:", v6)
    && +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  5LL,  v7))
  {
    +[_DASLimiterResponse updateActivity:withLimitResponse:]( &OBJC_CLASS____DASLimiterResponse,  "updateActivity:withLimitResponse:",  v6,  v7);
    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)rateLimitConfigurations
{
  return self->_rateLimitConfigurations;
}

- (void)setRateLimitConfigurations:(id)a3
{
}

- (NSMutableDictionary)submittedConfigurations
{
  return self->_submittedConfigurations;
}

- (void)setSubmittedConfigurations:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (os_unfair_lock_s)submittedConfigurationLock
{
  return self->_submittedConfigurationLock;
}

- (void)setSubmittedConfigurationLock:(os_unfair_lock_s)a3
{
  self->_submittedConfigurationLock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
}

- (OS_dispatch_source)cleanupTimer
{
  return self->_cleanupTimer;
}

- (void)setCleanupTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _APRSPrewarmRecommendation
+ (BOOL)appHasContinuousBackgroundModeWithRecord:(id)a3;
+ (BOOL)appPrefersUnoptimizedLaunchesWithRecord:(id)a3;
+ (BOOL)appPreventsPrewarm:(id)a3;
+ (BOOL)isPrewarmAllowed;
+ (BOOL)isPrewarmAllowedForApp:(id)a3;
+ (id)appActivationTimeScores:(id)a3;
+ (id)candidatesFromTimeline:(id)a3;
+ (id)evaluateRecommendationsFromTimeline:(id)a3;
+ (id)scoresToConfidenceLevels:(id)a3;
+ (id)sharedInstance;
- (BOOL)classCUnlocked;
- (NSArray)recommendations;
- (OS_os_log)log;
- (_APRSPrewarmRecommendation)init;
- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)appPredictionTimeline;
- (unint64_t)prewarmCount;
- (void)evaluateRecommendations;
- (void)registerForTrial;
- (void)setClassCUnlocked:(BOOL)a3;
- (void)setDataProtectionStateMonitor:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setPrewarmCount:(unint64_t)a3;
- (void)setRecommendations:(id)a3;
- (void)updateTrialParameters;
@end

@implementation _APRSPrewarmRecommendation

- (_APRSPrewarmRecommendation)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____APRSPrewarmRecommendation;
  v2 = -[_APRSPrewarmRecommendation init](&v19, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
    log = v2->_log;
    v2->_log = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](&OBJC_CLASS____DASPredictionManager, "sharedKnowledgeStore"));
    knowledgeStore = v2->_knowledgeStore;
    v2->_knowledgeStore = (_DKKnowledgeQuerying *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    recommendations = v2->_recommendations;
    v2->_recommendations = (NSArray *)v7;

    -[_APRSPrewarmRecommendation registerForTrial](v2, "registerForTrial");
    -[_APRSPrewarmRecommendation updateTrialParameters](v2, "updateTrialParameters");
    v9 = objc_alloc_init(&OBJC_CLASS____DASDataProtectionStateMonitor);
    dataProtectionStateMonitor = v2->_dataProtectionStateMonitor;
    v2->_dataProtectionStateMonitor = v9;

    objc_initWeak(&location, v2);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100008814;
    v16[3] = &unk_100115008;
    objc_copyWeak(&v17, &location);
    -[_DASDataProtectionStateMonitor setChangeHandler:](v2->_dataProtectionStateMonitor, "setChangeHandler:", v16);
    v11 = v2->_dataProtectionStateMonitor;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
    LODWORD(v11) = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v11, "isDataAvailableFor:", v12);

    if ((_DWORD)v11)
    {
      v2->_classCUnlocked = 1;
    }

    else
    {
      v13 = v2->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Class C not yet available.", v15, 2u);
      }
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001574D8 != -1) {
    dispatch_once(&qword_1001574D8, &stru_100115048);
  }
  return (id)qword_1001574D0;
}

+ (BOOL)appPreventsPrewarm:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = 1;
  id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  return v5;
}

+ (BOOL)appHasContinuousBackgroundModeWithRecord:(id)a3
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 UIBackgroundModes]);
  unsigned __int8 v4 = [v3 containsObject:@"continuous"];

  return v4;
}

+ (BOOL)appPrefersUnoptimizedLaunchesWithRecord:(id)a3
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 infoDictionary]);
  id v4 = [v3 objectForKey:@"SBPrefersUnoptimizedLaunch" ofClass:objc_opt_class(NSNumber)];
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  BOOL v6 = v5 && ([v5 BOOLValue] & 1) != 0;
  return v6;
}

- (void)evaluateRecommendations
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_APRSPrewarmRecommendation appPredictionTimeline](self, "appPredictionTimeline"));
  os_log_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmRecommendation evaluateRecommendationsFromTimeline:]( &OBJC_CLASS____APRSPrewarmRecommendation,  "evaluateRecommendationsFromTimeline:",  v5));
  recommendations = self->_recommendations;
  self->_recommendations = v3;
}

+ (BOOL)isPrewarmAllowedForApp:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"com.apple.purplebuddy"] & 1) != 0
    || ([v4 containsString:@"UIService"] & 1) != 0
    || ([v4 containsString:@".widget"] & 1) != 0
    || ([v4 containsString:@"com.apple.Reality"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.MTLReplayer"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.Health"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.camera"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.ContinuityCaptureShieldUI"] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }

  else
  {
    unsigned int v5 = [(id)objc_opt_class(a1) appPreventsPrewarm:v4] ^ 1;
  }

  return v5;
}

+ (BOOL)isPrewarmAllowed
{
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  unsigned __int8 v4 = [v3 isLowPowerModeEnabled];

  if ((v4 & 1) != 0 || (DMIsMigrationNeeded() & 1) != 0) {
    return 0;
  }
  id v6 = [(id)objc_opt_class(a1) sharedInstance];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned __int8 v8 = [v7 classCUnlocked];

  return v8;
}

+ (id)candidatesFromTimeline:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)os_transaction_create("com.apple.dasd.appResume.PrewarmRecommendations");
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ([v3 isUnavailable])
  {
    id v7 = 0LL;
  }

  else
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 startDate]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 valueAtDate:v8]);

    [v5 addEntriesFromDictionary:v9];
    id v10 = [v5 count];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmRecommendation sharedInstance]( &OBJC_CLASS____APRSPrewarmRecommendation,  "sharedInstance"));
    id v12 = [v11 prewarmCount];

    if (v10 < v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v3 transitionDates]);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v3 valueAtDate:v14]);
        [v5 addEntriesFromDictionary:v15];
      }
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000B0E10((uint64_t)v5, v6, v16, v17, v18, v19, v20, v21);
    }
    id v7 = v5;
  }

  return v7;
}

+ (id)appActivationTimeScores:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", a3));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSBiomeEventAnalyzer sharedInstance](&OBJC_CLASS____APRSBiomeEventAnalyzer, "sharedInstance"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 meanDeltaTimeBetweenColdLaunchAndResume]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100008ECC;
  v8[3] = &unk_100115070;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

+ (id)scoresToConfidenceLevels:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008FF4;
  v6[3] = &unk_100115070;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

+ (id)evaluateRecommendationsFromTimeline:(id)a3
{
  id v4 = a3;
  unsigned int v5 = os_log_create("com.apple.aprs", "appResume.PrewarmRecommendations");
  if ([(id)objc_opt_class(a1) isPrewarmAllowed])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmRecommendation candidatesFromTimeline:]( &OBJC_CLASS____APRSPrewarmRecommendation,  "candidatesFromTimeline:",  v4));
    id v8 = [v7 mutableCopy];

    if ([v8 count])
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmRecommendation scoresToConfidenceLevels:]( &OBJC_CLASS____APRSPrewarmRecommendation,  "scoresToConfidenceLevels:",  v8));
      id v10 = [v9 mutableCopy];

      v11 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmRecommendation appActivationTimeScores:]( &OBJC_CLASS____APRSPrewarmRecommendation,  "appActivationTimeScores:",  0LL));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000B0E10((uint64_t)v10, v5, v12, v13, v14, v15, v16, v17);
      }
      id v38 = v4;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_100009438;
      v43[3] = &unk_100115098;
      id v37 = v10;
      id v44 = v37;
      id v36 = v11;
      id v45 = v36;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sortedArrayUsingComparator:v43]);

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000B0E74((uint64_t)v19, v5, v20, v21, v22, v23, v24, v25);
      }
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v26 = v19;
      id v27 = [v26 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v40;
        do
        {
          for (i = 0LL; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v40 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
            v32 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSRecommendationEngine sharedInstance]( &OBJC_CLASS____APRSRecommendationEngine,  "sharedInstance"));
            unsigned int v33 = [v32 isAppRunning:v31];

            if (v33)
            {
              if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "BundleID %@ is already running. Skipping from Prewarm",  buf,  0xCu);
              }
            }

            else if (+[_APRSPrewarmRecommendation isPrewarmAllowedForApp:]( &OBJC_CLASS____APRSPrewarmRecommendation,  "isPrewarmAllowedForApp:",  v31))
            {
              [v6 addObject:v31];
            }
          }

          id v28 = [v26 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }

        while (v28);
      }

      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "DASDPREWARM prewarm choice list: %@",  buf,  0xCu);
      }

      id v34 = v6;

      id v8 = v37;
      id v4 = v38;
    }

    else
    {
      id v34 = 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prewarm not yet allowed.", buf, 2u);
    }

    id v34 = &__NSArray0__struct;
  }

  return v34;
}

- (id)appPredictionTimeline
{
  id v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](&OBJC_CLASS____DKSystemEventStreams, "appUsageStream"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:]( &OBJC_CLASS____DKPredictionQuery,  "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:",  v4,  0LL,  50LL,  0.0));

  [v5 setSlotDuration:7200];
  [v5 setMinimumDaysOfHistory:1];
  knowledgeStore = self->_knowledgeStore;
  id v12 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v5, &v12));
  id v8 = v12;
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B0ED8(log);
    }
  }

  id v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Timeline %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (void)registerForTrial
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 factorWithName:@"APRS_PrewarmCount"]);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v8 = 134217984;
      id v9 = [v4 longValue];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Trial: Prewarm count set to %lld",  (uint8_t *)&v8,  0xCu);
    }

    unint64_t v7 = (unint64_t)[v4 longValue];
  }

  else
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load prewarmCount",  (uint8_t *)&v8,  2u);
    }

    unint64_t v7 = 3LL;
  }

  self->_prewarmCount = v7;
}

- (NSArray)recommendations
{
  return self->_recommendations;
}

- (void)setRecommendations:(id)a3
{
}

- (unint64_t)prewarmCount
{
  return self->_prewarmCount;
}

- (void)setPrewarmCount:(unint64_t)a3
{
  self->_prewarmCount = a3;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (_DASDataProtectionStateMonitor)dataProtectionStateMonitor
{
  return self->_dataProtectionStateMonitor;
}

- (void)setDataProtectionStateMonitor:(id)a3
{
}

- (BOOL)classCUnlocked
{
  return self->_classCUnlocked;
}

- (void)setClassCUnlocked:(BOOL)a3
{
  self->_classCUnlocked = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
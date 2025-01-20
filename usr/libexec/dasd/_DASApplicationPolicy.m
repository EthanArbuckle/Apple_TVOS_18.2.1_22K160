@interface _DASApplicationPolicy
+ (id)focalApplicationsWithContext:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isDaemon:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSMutableDictionary)lastApplicationTimelineUpdate;
- (NSMutableDictionary)timelines;
- (NSMutableSet)daemons;
- (NSMutableSet)recentlyUsedApplications;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASApplicationPolicy)init;
- (_DASPredictor)predictor;
- (_DKPredictionTimeline)topNPrediction;
- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4;
- (double)scoreForActivity:(id)a3 atDate:(id)a4 withRationale:(id)a5;
- (double)scoreForAnyAppActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setDaemons:(id)a3;
- (void)setLastApplicationTimelineUpdate:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setRecentlyUsedApplications:(id)a3;
- (void)setTimelines:(id)a3;
- (void)setTopNPrediction:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateAppLaunchedRecently:(id)a3;
- (void)updatePredictionsAtDate:(id)a3;
- (void)updateRecentApplications;
@end

@implementation _DASApplicationPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.das.apppolicy.appchanged";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121AE0;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASApplicationPolicy)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____DASApplicationPolicy;
  v2 = -[_DASApplicationPolicy init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Application Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](&OBJC_CLASS____DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DASPredictor *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    timelines = v3->_timelines;
    v3->_timelines = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    lastApplicationTimelineUpdate = v3->_lastApplicationTimelineUpdate;
    v3->_lastApplicationTimelineUpdate = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    daemons = v3->_daemons;
    v3->_daemons = (NSMutableSet *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[_DASApplicationPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    recentlyUsedApplications = v3->_recentlyUsedApplications;
    v3->_recentlyUsedApplications = (NSMutableSet *)v15;

    -[_DASApplicationPolicy updateRecentApplications](v3, "updateRecentApplications");
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CC1C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157678 != -1) {
    dispatch_once(&qword_100157678, block);
  }
  return (id)qword_100157680;
}

- (void)updateRecentApplications
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager predictionGenerationQueue]( &OBJC_CLASS____DASPredictionManager,  "predictionGenerationQueue"));
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
  uint64_t v5 = (void *)qword_100157688;
  qword_100157688 = (uint64_t)v4;

  v6 = (dispatch_source_s *)qword_100157688;
  dispatch_time_t v7 = dispatch_walltime(0LL, 0LL);
  dispatch_source_set_timer(v6, v7, 0x1A3185C5000uLL, 0x29E8D60800uLL);
  dispatch_set_qos_class_fallback(qword_100157688, 17LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002CD30;
  handler[3] = &unk_1001150D0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100157688, handler);
  dispatch_resume((dispatch_object_t)qword_100157688);
}

+ (id)focalApplicationsWithContext:(id)a3
{
  id v3 = a3;
  dispatch_source_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v5]);

  if (v6) {
    [v4 addObject:v6];
  }
  id v7 = [v4 copy];

  return v7;
}

- (void)updateAppLaunchedRecently:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_recentlyUsedApplications;
  objc_sync_enter(v5);
  id v6 = -[NSMutableSet count](self->_recentlyUsedApplications, "count");
  recentlyUsedApplications = self->_recentlyUsedApplications;
  if ((unint64_t)v6 >= 0x19)
  {
    v8 = self->_recentlyUsedApplications;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](v8, "anyObject"));
    -[NSMutableSet removeObject:](v8, "removeObject:", v9);

    recentlyUsedApplications = self->_recentlyUsedApplications;
  }

  -[NSMutableSet addObject:](recentlyUsedApplications, "addObject:", v4);
LABEL_5:
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_recentlyUsedApplications;
    int v12 = 138412290;
    uint64_t v13 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Recent Applications: %@",  (uint8_t *)&v12,  0xCu);
  }

  objc_sync_exit(v5);
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (BOOL)isDaemon:(id)a3
{
  id v3 = a3;
  id v4 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 compatibilityObject]);
  return v5 == 0LL;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.das.apppolicy.appchanged"])
  {
    id v7 = [(id)objc_opt_class(self) focalApplicationsWithContext:v6];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = [v8 count] == 0;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (double)weightForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requestsApplicationLaunch])
  {
    double v4 = 50.0;
  }

  else
  {
    id v5 = [v3 schedulingPriority];
    else {
      double v4 = 5.0;
    }
  }

  return v4;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundProcessing])
  {
    BOOL v5 = 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
    if ([v6 isEqualToString:_DASLaunchReasonHealthResearch])
    {
      BOOL v5 = 0;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
      if ([v7 isEqualToString:_DASLaunchReasonHealthKit])
      {
        BOOL v5 = 0;
      }

      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v3 widgetID]);
        if (v8)
        {
          BOOL v5 = 0;
        }

        else if (([v3 supportsAnyApplication] & 1) != 0 {
               || ([v3 requestsApplicationLaunch] & 1) != 0)
        }
        {
          BOOL v5 = 1;
        }

        else
        {
          BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
          BOOL v5 = [v9 count] != 0;
        }
      }
    }
  }

  return v5;
}

- (void)updatePredictionsAtDate:(id)a3
{
  id v5 = a3;
  id v6 = (void *)os_transaction_create("com.apple.dasd.updatetopnprediction");
  id v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPredictor launchLikelihoodForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:]( self->_predictor,  "launchLikelihoodForTopNApplications:withLikelihoodGreaterThan:withTemporalResolution:",  10LL,  3600LL,  0.142857143));
  -[_DASApplicationPolicy setTopNPrediction:](self, "setTopNPrediction:", v8);

  objc_storeStrong((id *)&self->_lastPredictionTimelineUpdate, a3);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASApplicationPolicy topNPrediction](self, "topNPrediction"));
  +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v9,  @"application.topN");

  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000B2370(self, v10);
  }

  objc_autoreleasePoolPop(v7);
}

- (double)scoreForAnyAppActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 dateByAddingTimeInterval:450.0]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10002DB40;
  v41 = sub_10002DB50;
  id v42 = 0LL;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager predictionGenerationQueue]( &OBJC_CLASS____DASPredictionManager,  "predictionGenerationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DB58;
  block[3] = &unk_1001152D8;
  block[4] = self;
  id v9 = v7;
  id v35 = v9;
  v36 = &v37;
  dispatch_sync(v8, block);

  v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v38[5] valueAtDate:v29]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
  if ([v11 count]) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 allKeys]);
  }
  uint64_t v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v31;
    double v18 = 1.0;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v20]);
        v22 = v21;
        if (v21)
        {
          [v21 doubleValue];
          double v24 = v23;
          [v14 addObject:v20];
          double v18 = v18 * (1.0 - v24);
        }
      }

      id v16 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }

    while (v16);
  }

  else
  {
    double v18 = 1.0;
  }

  v25 = objc_autoreleasePoolPush();
  if ([v14 count])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v14));
    [v6 setSchedulerRecommendedApplications:v26];
  }

  objc_autoreleasePoolPop(v25);

  _Block_object_dispose(&v37, 8);
  return fmax(sqrt(1.0 - v18), 0.01);
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4 withRationale:(id)a5
{
  id v62 = a3;
  id v56 = a4;
  id v60 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = self;
  objc_sync_enter(v9);
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

  if (!qword_100157698 || (objc_msgSend(obj, "timeIntervalSinceDate:"), v10 >= 300.0)) {
    dword_100157690 = arc4random_uniform(0x546u);
  }
  objc_storeStrong((id *)&qword_100157698, obj);
  objc_sync_exit(v9);

  if ([v62 supportsAnyApplication])
  {
    -[_DASApplicationPolicy scoreForAnyAppActivity:atDate:](v9, "scoreForAnyAppActivity:atDate:", v62, v56);
    double v13 = v12;
    goto LABEL_73;
  }

  LODWORD(v11) = dword_100157690;
  v57 = (void *)objc_claimAutoreleasedReturnValue([v56 dateByAddingTimeInterval:(double)v11 + 450.0]);
  v59 = (void *)os_transaction_create("com.apple.dasd.apppolicy.score");
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v62 relatedApplications]);
  id v15 = [v14 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (!v15)
  {
    double v17 = 1.0;
    goto LABEL_40;
  }

  uint64_t v16 = *(void *)v78;
  double v17 = 1.0;
  v58 = v9;
  do
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v78 != v16) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v77 + 1) + 8LL * (void)i);
      uint64_t v20 = v9->_timelines;
      objc_sync_enter(v20);
      if (!-[NSMutableSet containsObject:](v9->_daemons, "containsObject:", v19))
      {
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v88 = 0x3032000000LL;
        v89 = sub_10002DB40;
        v90 = sub_10002DB50;
        id v91 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v9->_timelines, "objectForKeyedSubscript:", v19));
        v25 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v9->_lastApplicationTimelineUpdate,  "objectForKeyedSubscript:",  v19));
        if (+[_DASPredictionManager predictionNeedsUpdating:atDate:lastUpdatedAt:]( &OBJC_CLASS____DASPredictionManager,  "predictionNeedsUpdating:atDate:lastUpdatedAt:",  *(void *)(*((void *)&buf + 1) + 40LL),  obj,  v25))
        {
          if (-[_DASApplicationPolicy isDaemon:](v9, "isDaemon:", v19))
          {
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v83) = 138412290;
              *(void *)((char *)&v83 + 4) = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%@ is a daemon. Ignoring prediction",  (uint8_t *)&v83,  0xCu);
            }

            -[NSMutableSet addObject:](v9->_daemons, "addObject:", v19);
            double v24 = 0.0001;
            double v17 = v17 * 0.9999;
            int v23 = 3;
LABEL_33:

            _Block_object_dispose(&buf, 8);
            goto LABEL_34;
          }

          dispatch_semaphore_t v61 = dispatch_semaphore_create(0LL);
          *(void *)&__int128 v83 = 0LL;
          *((void *)&v83 + 1) = &v83;
          uint64_t v84 = 0x2810000000LL;
          v85 = &unk_10010A1B3;
          int v86 = 0;
          uint64_t v73 = 0LL;
          v74 = &v73;
          uint64_t v75 = 0x2020000000LL;
          char v76 = 0;
          predictor = v9->_predictor;
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472LL;
          v64[2] = sub_10002E5B0;
          v64[3] = &unk_100115910;
          id v28 = v59;
          v71 = &v73;
          p___int128 buf = &buf;
          id v65 = v28;
          v66 = v9;
          v70 = &v83;
          uint64_t v67 = v19;
          id v68 = obj;
          v29 = v61;
          v69 = v29;
          -[_DASPredictor launchLikelihoodPredictionForApp:withHandler:]( predictor,  "launchLikelihoodPredictionForApp:withHandler:",  v19,  v64);
          dispatch_time_t v30 = dispatch_time(0LL, 5000000000LL);
          if (dispatch_semaphore_wait(v29, v30))
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*((void *)&v83 + 1) + 32LL));
            *((_BYTE *)v74 + 24) = 1;
            os_unfair_lock_unlock((os_unfair_lock_t)(*((void *)&v83 + 1) + 32LL));
            +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  @"com.apple.das.timeout.cdapppredictionquery");
            __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v81 = 138412290;
              uint64_t v82 = v19;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Timed out querying for prediction: %@",  v81,  0xCu);
            }
          }

          id v9 = v58;
          _Block_object_dispose(&v73, 8);
          _Block_object_dispose(&v83, 8);
        }

        __int128 v32 = *(void **)(*((void *)&buf + 1) + 40LL);
        if (v32 && ([v32 isUnavailable] & 1) == 0)
        {
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&buf + 1) + 40) valueAtDate:v57]);
          [v33 doubleValue];
          double v24 = v34;

          if (v60)
          {
            id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24));
            v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%@.likelihood == %@",  v19,  v35));
            [v60 addRationaleWithCondition:v36];
          }

          int v23 = 0;
        }

        else
        {
          int v23 = 0;
          double v24 = 0.0025;
        }

        goto LABEL_33;
      }

      id v21 = [v62 schedulingPriority];
      double v17 = v17 * 0.99;
      if ((unint64_t)v21 > _DASSchedulingPriorityUtility)
      {
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Daemon %@ doing high-priority work!",  (uint8_t *)&buf,  0xCu);
        }
      }

      int v23 = 3;
      double v24 = 0.01;
LABEL_34:
      objc_sync_exit(v20);

      double v37 = 1.0 - v24;
      if (v23) {
        double v37 = 1.0;
      }
      double v17 = v17 * v37;
    }

    id v15 = [v14 countByEnumeratingWithState:&v77 objects:v92 count:16];
  }

  while (v15);
LABEL_40:

  unsigned __int8 v38 = [v62 requestsApplicationLaunch];
  double v39 = sqrt(1.0 - v17);
  if ((v38 & (v39 > 0.25)) != 0) {
    double v40 = 1.0;
  }
  else {
    double v40 = v39;
  }
  if (v40 > 2.22044605e-16 && [v62 requestsApplicationLaunch])
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue([v62 relatedApplications]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    id v44 = [v43 requestCountForApplication:v42];

    if (v44) {
      double v40 = v40 + (double)((unint64_t)v44 - 1) * 0.1;
    }
  }

  else {
    double v45 = 0.01;
  }
  if ([v62 requestsApplicationLaunch])
  {
    [v56 timeIntervalSinceDate:obj];
    if (v46 < 0.0)
    {
      v47 = v9->_recentlyUsedApplications;
      objc_sync_enter(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v62 relatedApplications]);
      v49 = (void *)objc_claimAutoreleasedReturnValue([v48 firstObject]);

      double v40 = v40 * 0.65;
      objc_sync_exit(v47);
    }

    if (v40 > 0.5) {
      double v40 = 1.0;
    }
    id v50 = [v62 schedulingPriority];
    if ((unint64_t)v50 >= _DASSchedulingPriorityUserInitiated
      || (unsigned int v51 = [v62 requestsNewsstandLaunch], v52 = 0.0, v51))
    {
      double v52 = v45;
    }

    double v53 = 1.0;
    if (v40 <= 1.0) {
      double v53 = v40;
    }
    if (v52 >= v53) {
      double v13 = v52;
    }
    else {
      double v13 = v53;
    }
  }

  else
  {
    double v54 = 1.0;
    if (v40 <= 1.0) {
      double v54 = v40;
    }
    if (v45 >= v54) {
      double v13 = v45;
    }
    else {
      double v13 = v54;
    }
  }

LABEL_73:
  return v13;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 requestsApplicationLaunch])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    if ([v8 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
    {
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
      unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonBackgroundNewsstand];

      if (!v10) {
        goto LABEL_8;
      }
    }

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 barScheduler]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
    unsigned __int8 v15 = [v12 pushLaunchAllowedForApp:v14 immediately:&v45];

    if (v45)
    {
      uint64_t v16 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Application Policy");
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v16,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"appIsForeground",  1.0,  1.0);
      -[_DASPolicyResponseRationale setResponseOptions:]( v16,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v16, "responseOptions") | 2);
      uint64_t v17 = 200LL;
LABEL_35:
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v17,  v16,  10800.0));
      goto LABEL_36;
    }

    if ((v15 & 1) == 0)
    {
      uint64_t v16 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Application Policy");
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v16,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"pushDisallowed",  0.0,  1.0);
      uint64_t v17 = 100LL;
      goto LABEL_35;
    }
  }

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  return result;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (NSMutableDictionary)timelines
{
  return self->_timelines;
}

- (void)setTimelines:(id)a3
{
}

- (_DKPredictionTimeline)topNPrediction
{
  return self->_topNPrediction;
}

- (void)setTopNPrediction:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (NSMutableDictionary)lastApplicationTimelineUpdate
{
  return self->_lastApplicationTimelineUpdate;
}

- (void)setLastApplicationTimelineUpdate:(id)a3
{
}

- (NSMutableSet)daemons
{
  return self->_daemons;
}

- (void)setDaemons:(id)a3
{
}

- (NSMutableSet)recentlyUsedApplications
{
  return self->_recentlyUsedApplications;
}

- (void)setRecentlyUsedApplications:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
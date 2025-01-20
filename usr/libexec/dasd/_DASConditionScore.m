@interface _DASConditionScore
+ (BOOL)isPremiumClient:(id)a3;
+ (double)getScoreForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4 activityScore:(double)a5;
+ (double)preOptimalRelaxationFactor:(unint64_t)a3;
+ (double)relaxationFactorForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4;
+ (double)scoreForActivity:(id)a3 withState:(id)a4 response:(int64_t *)a5;
+ (double)thresholdScoreForActivity:(id)a3;
+ (id)getBucketForDate:(id)a3 withBucketDuration:(int)a4;
+ (id)getMetricsTimer;
+ (id)getPriorityToBlockingPolicies;
+ (id)getResponseStringForPolicy:(id)a3 response:(id)a4 appliesToActivity:(BOOL)a5 weightForActivity:(double)a6;
+ (id)lastDenialResponses:(id)a3;
+ (int64_t)getTimeSlotForActivity:(id)a3;
+ (void)computeOptimalScoreAndDateForActivity:(id)a3;
+ (void)initialize;
+ (void)reportBlockingAnalyticsAndReset;
+ (void)setActivityShouldBypassPredictions:(id)a3;
- (NSDate)date;
@end

@implementation _DASConditionScore

+ (void)initialize
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  _DASSchedulingPriorityMaintenance));
  v22[0] = v3;
  v23[0] = @"maintenanceBlocked";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  _DASSchedulingPriorityUtility));
  v22[1] = v4;
  v23[1] = @"utilityBlocked";
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  v6 = (void *)qword_100157A40;
  qword_100157A40 = v5;

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v8 = (void *)qword_100157A48;
  qword_100157A48 = (uint64_t)v7;

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v10 = (void *)qword_100157A48;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  _DASSchedulingPriorityMaintenance));
  [v10 setObject:v9 forKeyedSubscript:v11];

  v12 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v13 = (void *)qword_100157A48;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  _DASSchedulingPriorityUtility));
  [v13 setObject:v12 forKeyedSubscript:v14];

  dispatch_queue_t v15 = dispatch_queue_create("com.apple.das.conditionscore.metricsqueue", 0LL);
  v16 = (void *)qword_100157A50;
  qword_100157A50 = (uint64_t)v15;

  dispatch_source_t v17 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100157A50);
  v18 = (void *)qword_100157A58;
  qword_100157A58 = (uint64_t)v17;

  dispatch_set_qos_class_fallback(qword_100157A58, 17LL);
  v19 = (dispatch_source_s *)qword_100157A58;
  dispatch_time_t v20 = dispatch_walltime(0LL, 900000000000LL);
  dispatch_source_set_timer(v19, v20, 0xD18C2E2800uLL, 0x3B9ACA00uLL);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10004F790;
  v21[3] = &unk_100114FE0;
  v21[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_100157A58, v21);
  dispatch_activate((dispatch_object_t)qword_100157A58);
}

+ (void)reportBlockingAnalyticsAndReset
{
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([a1 getBucketForDate:v3 withBucketDuration:10800]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASTrialManager sharedInstanceForNamespace:]( &OBJC_CLASS____DASTrialManager,  "sharedInstanceForNamespace:",  @"COREOS_DAS"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)qword_100157A48;
  id v19 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v6;
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A40 objectForKeyedSubscript:v7]);
        v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A48 objectForKeyedSubscript:v7]);
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v10 = v18;
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472LL;
              v21[2] = sub_10004FA7C;
              v21[3] = &unk_1001160F8;
              id v22 = v4;
              uint64_t v23 = v15;
              id v24 = v8;
              id v25 = v9;
              id v26 = v5;
              AnalyticsSendEventLazy(@"com.apple.dasd.policyBlockMetrics", v21);
            }

            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }

          while (v12);
        }

        [v9 removeAllObjects];
        uint64_t v6 = v20 + 1;
      }

      while ((id)(v20 + 1) != v19);
      id v19 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }

    while (v19);
  }
}

+ (id)getBucketForDate:(id)a3 withBucketDuration:(int)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 components:28 fromDate:v5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dateFromComponents:v7]);
  [v5 timeIntervalSinceDate:v8];
  double v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", floor(v10 / (double)a4)));
  return v11;
}

+ (id)getPriorityToBlockingPolicies
{
  return (id)qword_100157A48;
}

+ (id)getMetricsTimer
{
  return (id)qword_100157A58;
}

+ (BOOL)isPremiumClient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v3)
    || ([v3 requiresSignificantUserInactivity] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);
    if (v7)
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
      unsigned __int8 v5 = [v8 containsString:@"apple.backupd."];
    }
  }

  return v5;
}

+ (void)setActivityShouldBypassPredictions:(id)a3
{
  id v9 = a3;
  id v3 = [v9 schedulingPriority];
  if ((unint64_t)v3 >= _DASSchedulingPriorityUserInitiated
    || +[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v9))
  {
    BOOL v4 = 1LL;
    unsigned __int8 v5 = v9;
  }

  else
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v9 launchReason]);
    unsigned __int8 v7 = [v6 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification];

    unsigned __int8 v5 = v9;
    if ((v7 & 1) != 0)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v9 fastPass]);

      unsigned __int8 v5 = v9;
      BOOL v4 = v8 != 0LL;
    }
  }

  [v5 setBypassesPredictions:v4];
}

+ (double)scoreForActivity:(id)a3 withState:(id)a4 response:(int64_t *)a5
{
  id v6 = a3;
  id v64 = a4;
  v59 = (void *)os_transaction_create("com.apple.dasd.scoreForActivity");
  context = objc_autoreleasePoolPush();
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  id v8 = v6;
  objc_sync_enter(v8);
  id v9 = v8;
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 policyResponseMetadata]);
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:"));

  [v9 setPolicyResponseMetadata:0];
  [v9 setLastDenialValue:0];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 policyResponseMetadata]);
  [v11 removeAllObjects];

  objc_sync_exit(v9);
  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  id obj = v7;
  id v68 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
  if (v68)
  {
    uint64_t v66 = *(void *)v78;
    int64_t v67 = 0LL;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      for (i = 0LL; i != v68; i = (char *)i + 1)
      {
        if (*(void *)v78 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
        v16 = objc_autoreleasePoolPush();
        unsigned __int8 v17 = objc_msgSend(v15, "appliesToActivity:", v9, v59);
        [v15 weightForActivity:v9];
        double v19 = v18;
        if ((v17 & 1) != 0)
        {
          uint64_t v20 = objc_autoreleasePoolPush();
          v21 = (void *)objc_claimAutoreleasedReturnValue([v15 responseForActivity:v9 withState:v64]);
          objc_autoreleasePoolPop(v20);
          if ([v21 policyDecision] == (id)33 || objc_msgSend(v21, "policyDecision") == (id)100)
          {
            id v22 = (dispatch_queue_s *)qword_100157A50;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100050714;
            block[3] = &unk_100115148;
            id v75 = v9;
            v76 = v15;
            dispatch_async(v22, block);
          }

          id v23 = [v21 policyDecision];
          int64_t v24 = v67;
          int64_t v67 = v24;
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[_DASConditionScore getResponseStringForPolicy:response:appliesToActivity:weightForActivity:]( &OBJC_CLASS____DASConditionScore,  "getResponseStringForPolicy:response:appliesToActivity:weightForActivity:",  v25,  v21,  1LL,  v19));

          if ([v21 policyDecision])
          {
            __int128 v27 = v69;
          }

          else
          {
            [v21 score];
            double v13 = v13 + v19 * v28;
            double v12 = v12 + v19;
            __int128 v27 = v63;
          }

          [v27 addObject:v26];
          [v21 score];
          if (v29 <= 0.0)
          {
            id v30 = v9;
            objc_sync_enter(v30);
            __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
            objc_msgSend( v30,  "setLastDenialValue:",  (unint64_t)objc_msgSend(v30, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:]( _DASPolicyManager,  "bitmaskForPolicy:",  v31));

            objc_sync_exit(v30);
          }

          id v32 = v9;
          objc_sync_enter(v32);
          id v33 = objc_alloc(&OBJC_CLASS____DASInternalPolicyEvaluationMetadata);
          [v21 score];
          double v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue([v21 rationale]);
          id v37 = objc_msgSend( v33,  "initWithScore:reason:decision:",  objc_msgSend(v36, "responseOptions"),  objc_msgSend(v21, "policyDecision"),  v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue([v32 policyResponseMetadata]);
          v39 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
          [v38 setObject:v37 forKeyedSubscript:v39];

          objc_sync_exit(v32);
        }

        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v15 policyName]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[_DASConditionScore getResponseStringForPolicy:response:appliesToActivity:weightForActivity:]( &OBJC_CLASS____DASConditionScore,  "getResponseStringForPolicy:response:appliesToActivity:weightForActivity:",  v21,  0LL,  0LL,  v19));
          [v69 addObject:v26];
        }

        objc_autoreleasePoolPop(v16);
      }

      id v68 = [obj countByEnumeratingWithState:&v77 objects:v94 count:16];
    }

    while (v68);
  }

  else
  {
    int64_t v67 = 0LL;
    double v12 = 0.0;
    double v13 = 0.0;
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 setLastScored:v40];

  if (a5) {
    *a5 = v67;
  }
  double v41 = 0.0;
  if (v67 != 100 && v67 != 33)
  {
    if (v67 || v12 == 0.0) {
      double v41 = 1.0;
    }
    else {
      double v41 = v13 / v12;
    }
  }

  id v42 = v9;
  objc_sync_enter(v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v42 policyResponseMetadata]);
  [v43 setObject:v62 forKeyedSubscript:@"scoreWhenRun"];

  objc_sync_exit(v42);
  if (v67)
  {
    id v44 = objc_claimAutoreleasedReturnValue([v69 componentsJoinedByString:&stru_100118C98]);
    id v45 = [v44 UTF8String];

    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse abbreviatedDecision:]( &OBJC_CLASS____DASPolicyResponse,  "abbreviatedDecision:",  v67));
      *(_DWORD *)buf = 138543874;
      id v82 = v42;
      __int16 v83 = 2082;
      id v84 = v45;
      __int16 v85 = 2114;
      double v86 = *(double *)&v47;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@:[\n%{public}s ], Decision: %{public}@}",  buf,  0x20u);
    }

    goto LABEL_48;
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id v48 = v63;
  id v49 = [v48 countByEnumeratingWithState:&v70 objects:v93 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v71;
    do
    {
      for (j = 0LL; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v71 != v50) {
          objc_enumerationMutation(v48);
        }
        objc_msgSend(v69, "addObject:", *(void *)(*((void *)&v70 + 1) + 8 * (void)j), v59);
      }

      id v49 = [v48 countByEnumeratingWithState:&v70 objects:v93 count:16];
    }

    while (v49);
  }

  id v52 = objc_claimAutoreleasedReturnValue([v69 componentsJoinedByString:&stru_100118C98]);
  id v53 = [v52 UTF8String];

  if (v12 == 0.0)
  {
    double v55 = 0.0;
  }

  else
  {
    float v54 = v13 / v12;
    double v55 = v54;
    if (v54 != 0.0)
    {
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse abbreviatedDecision:]( &OBJC_CLASS____DASPolicyResponse,  "abbreviatedDecision:",  0LL));
        *(_DWORD *)buf = 138544130;
        id v82 = v42;
        __int16 v83 = 2082;
        id v84 = v53;
        __int16 v85 = 2114;
        double v86 = *(double *)&v56;
        __int16 v87 = 2048;
        double v88 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@:[\n%{public}s ], Decision: %{public}@ Score: %f}",  buf,  0x2Au);
      }

      goto LABEL_48;
    }
  }

  v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring",  v59));
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse abbreviatedDecision:]( &OBJC_CLASS____DASPolicyResponse,  "abbreviatedDecision:",  0LL));
    *(_DWORD *)buf = 138544642;
    id v82 = v42;
    __int16 v83 = 2082;
    id v84 = v53;
    __int16 v85 = 2048;
    double v86 = v13;
    __int16 v87 = 2048;
    double v88 = v12;
    __int16 v89 = 2114;
    v90 = v57;
    __int16 v91 = 2048;
    double v92 = v55;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@:[\n%{public}s ], sumScores:%lf denominator:%f Decision: %{public}@ Score: %f}",  buf,  0x3Eu);
  }

+ (void)computeOptimalScoreAndDateForActivity:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)os_transaction_create("com.apple.dasd.scoreForActivity");
  if (qword_100157A60 != -1) {
    dispatch_once(&qword_100157A60, &stru_100116118);
  }
  unsigned __int8 v5 = objc_autoreleasePoolPush();
  if ([v3 bypassesPredictions])
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000B4590((uint64_t)v3, v6);
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v3 startAfter]);
    [v3 setPredictedOptimalStartDate:v7];

    [v3 setPredictedOptimalScore:0.01];
    goto LABEL_60;
  }

  id v8 = (id)objc_claimAutoreleasedReturnValue([v3 startAfter]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:v9];
  if (v10 > 75600.0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 startAfter]);
    [v3 setPredictedOptimalStartDate:v11];

    [v3 setPredictedOptimalScore:0.01];
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@ start beyond the 21 hour interval",  buf,  0xCu);
    }

    goto LABEL_59;
  }

  id v64 = v8;
  v61 = v4;
  v62 = v9;
  v60 = v5;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v14 count]));

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  double v12 = v13;
  id v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v70,  v83,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v71;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(v12);
        }
        id v22 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
        if ([v22 appliesToActivity:v3])
        {
          if ([v22 conformsToProtocol:&OBJC_PROTOCOL____DASActivityPolicyPredicting])
          {
            [v15 addObject:v22];
          }

          else
          {
            [v22 weightForActivity:v3];
            double v24 = v23;
            if ((objc_opt_respondsToSelector(v22, "baselineScoreForActivity:") & 1) != 0)
            {
              [v22 baselineScoreForActivity:v3];
              double v20 = v20 + v24 * v25;
            }

            else
            {
              double v20 = v20 + v24;
            }

            double v19 = v19 + v24;
          }
        }
      }

      id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v70,  v83,  16LL);
    }

    while (v17);
  }

  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
  }

  id v9 = v62;
  [v64 timeIntervalSinceDate:v62];
  if (v26 <= 0.0) {
    __int128 v27 = v62;
  }
  else {
    __int128 v27 = v64;
  }
  id v8 = v27;

  if (![v15 count])
  {
    [v3 setPredictedOptimalStartDate:v8];
    double v33 = v20 / v19;
    if (v19 < 0.001) {
      double v33 = 0.01;
    }
    [v3 setPredictedOptimalScore:v33];
    double v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      [v3 predictedOptimalScore];
      double v36 = v35;
      id v37 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A68 stringFromDate:v8]);
      *(_DWORD *)buf = 138412802;
      id v75 = v3;
      __int16 v76 = 2048;
      double v77 = v36;
      __int16 v78 = 2112;
      __int128 v79 = v37;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "WARNING NO POLICIES APPLY TO Activity %@: Optimal Score %.4f at %@",  buf,  0x20u);
    }

    goto LABEL_58;
  }

  double v28 = (void *)objc_claimAutoreleasedReturnValue([v3 startBefore]);
  [v28 timeIntervalSinceDate:v8];
  double v30 = v29;

  double v31 = fmax(fmin(v30, 86400.0), 0.0);
  double v32 = 900.0;
  if (v31 <= 900.0)
  {
    double v32 = 300.0;
  }

  else if (v31 > 14400.0)
  {
    else {
      double v32 = 1800.0;
    }
  }

  id v38 = v8;
  double v39 = 0.01;
  double v59 = v31;
  v63 = v38;
  while (1)
  {
    v40 = objc_autoreleasePoolPush();
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    id v41 = v15;
    id v42 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
    if (!v42)
    {

      goto LABEL_54;
    }

    id v43 = v42;
    v65 = v40;
    uint64_t v44 = *(void *)v67;
    double v45 = 0.0;
    double v46 = 0.0;
    do
    {
      for (j = 0LL; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v67 != v44) {
          objc_enumerationMutation(v41);
        }
        id v48 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)j);
        id v49 = objc_autoreleasePoolPush();
        [v48 weightForActivity:v3];
        double v51 = v50;
        [v48 predictedScoreForActivity:v3 atDate:v38];
        double v45 = v45 + v51 * v52;
        double v46 = v46 + v51;
        objc_autoreleasePoolPop(v49);
      }

      id v43 = [v41 countByEnumeratingWithState:&v66 objects:v82 count:16];
    }

    while (v43);

    if (v46 == 0.0)
    {
      v40 = v65;
      goto LABEL_54;
    }

    double v53 = (v20 + v45) / (v19 + v46);
    v40 = v65;
    if (v39 < v53) {
      break;
    }
LABEL_54:
    id v8 = (id)objc_claimAutoreleasedReturnValue([v38 dateByAddingTimeInterval:v32]);

    double v31 = v31 - v32;
    objc_autoreleasePoolPop(v40);
    id v38 = v8;
    if (v31 < 0.0) {
      goto LABEL_55;
    }
  }

  id v8 = v38;

  if (v53 <= 0.9)
  {
    v63 = v8;
    double v39 = v53;
    goto LABEL_54;
  }

  objc_autoreleasePoolPop(v65);
  v63 = v8;
  double v39 = v53;
LABEL_55:
  [v3 setPredictedOptimalScore:v39];
  [v3 setPredictedOptimalStartDate:v63];
  float v54 = (void *)objc_claimAutoreleasedReturnValue([v3 startAfter]);
  double v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v54,  v59));

  v56 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A68 stringFromDate:v63]);
    v58 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100157A68 stringFromDate:v55]);
    *(_DWORD *)buf = 138413058;
    id v75 = v3;
    __int16 v76 = 2048;
    double v77 = v39;
    __int16 v78 = 2112;
    __int128 v79 = v57;
    __int16 v80 = 2112;
    v81 = v58;
    _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%@: Optimal Score %.4f at %@ (Valid Until: %@)",  buf,  0x2Au);
  }

  id v9 = v62;
  double v34 = (os_log_s *)v63;
LABEL_58:

  unsigned __int8 v5 = v60;
  BOOL v4 = v61;
LABEL_59:

LABEL_60:
  objc_autoreleasePoolPop(v5);
}

+ (double)thresholdScoreForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 bypassesPredictions])
  {
    double v4 = 0.01;
  }

  else
  {
    int64_t v5 = +[_DASConditionScore getTimeSlotForActivity:](&OBJC_CLASS____DASConditionScore, "getTimeSlotForActivity:", v3);
    id v6 = [v3 schedulingPriority];
    [v3 predictedOptimalScore];
    +[_DASConditionScore getScoreForTimeSlot:activityPriority:activityScore:]( &OBJC_CLASS____DASConditionScore,  "getScoreForTimeSlot:activityPriority:activityScore:",  v5,  v6);
    double v4 = v7;
  }

  return v4;
}

+ (int64_t)getTimeSlotForActivity:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 predictedOptimalStartDate]);
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 startBefore]);

  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:v4];
  double v10 = v9;

  if (v7 >= 0.01) {
    uint64_t v11 = (uint64_t)(v10 / (v7 / 10.0) + 1.0);
  }
  else {
    uint64_t v11 = 10LL;
  }
  unint64_t v12 = v11 & ~(v11 >> 63);
  if (v12 >= 0xA) {
    int64_t v13 = 10LL;
  }
  else {
    int64_t v13 = v12;
  }

  return v13;
}

+ (double)getScoreForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4 activityScore:(double)a5
{
  return v6 * a5;
}

+ (double)relaxationFactorForTimeSlot:(int64_t)a3 activityPriority:(unint64_t)a4
{
  double v7 = v6;
  if (a3)
  {
    if (_DASSchedulingPriorityUserInitiated <= a4)
    {
      double v8 = 100.0;
      double v9 = 1.0;
    }

    else if (_DASSchedulingPriorityUtility == a4)
    {
      double v8 = 110.0;
      double v9 = 1.35;
    }

    else if (_DASSchedulingPriorityDefault == a4)
    {
      double v8 = 105.0;
      double v9 = 1.2;
    }

    else if (_DASSchedulingPriorityBackground == a4)
    {
      double v9 = 1.5;
      double v8 = 120.0;
    }

    else
    {
      double v9 = 1.0;
      double v8 = 100.0;
    }

    return v7 * (1.0 - pow((double)(10 * a3) / v8, v9));
  }

  return v7;
}

+ (double)preOptimalRelaxationFactor:(unint64_t)a3
{
  double result = 0.75;
  if (_DASSchedulingPriorityUserInitiated > a3)
  {
    if (_DASSchedulingPriorityUtility == a3)
    {
      return 0.925;
    }

    else if (_DASSchedulingPriorityDefault == a3)
    {
      return 0.9;
    }

    else if (_DASSchedulingPriorityBackground == a3)
    {
      return 0.95;
    }

    else
    {
      double result = 0.975;
    }
  }

  return result;
}

+ (id)lastDenialResponses:(id)a3
{
  id v3 = a3;
  if ([v3 lastDenialValue])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unint64_t v5 = (unint64_t)[v3 lastDenialValue];
    for (uint64_t i = 0LL; i != 64; ++i)
    {
      if ((v5 & 1) != 0)
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager policyForBitIndex:](&OBJC_CLASS____DASPolicyManager, "policyForBitIndex:", i));
        if (v7) {
          [v4 addObject:v7];
        }
      }

      v5 >>= 1;
    }
  }

  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
}

+ (id)getResponseStringForPolicy:(id)a3 response:(id)a4 appliesToActivity:(BOOL)a5 weightForActivity:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v10 && ([v10 policyDecision] || (objc_msgSend(v11, "score"), v12 < 0.9)))
  {
    int64_t v13 = objc_opt_new(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v13, "appendFormat:", @"\t{name: %@, ", v9);
    if (a5)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      -[NSMutableString appendFormat:]( v13,  "appendFormat:",  @"policyWeight: %2.3lf, response: %@}\n",  *(void *)&a6,  v14);
    }

    else
    {
      -[NSMutableString appendString:](v13, "appendString:", @"response: N/A}\n");
    }
  }

  else
  {
    int64_t v13 = (NSMutableString *)&stru_100118C98;
  }

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end
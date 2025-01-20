@interface _DASDataCollectionSUTask
+ (id)taskWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5;
- (BOOL)isEligibleNow;
- (NSDate)currentEligibilityWindowEnd;
- (NSDate)currentEligibilityWindowStart;
- (NSMutableSet)blockReasonsSoFar;
- (NSMutableSet)persistentBlockers;
- (OS_dispatch_source)timer;
- (OS_os_log)logger;
- (_DASActivity)activity;
- (_DASDataCollectionSUTask)initWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5;
- (double)interval;
- (int64_t)currentEligibilityState;
- (void)addExperimentInformationWithDictionary:(id)a3;
- (void)evaluateActivityOnTick;
- (void)evaluatePolicies;
- (void)handleTaskExpiration;
- (void)handleTaskExpirationNeverEligible;
- (void)markAsCompleted;
- (void)reportBlockersOnEvaluation:(id)a3;
- (void)reportBlockersStatisticsOnExpiration;
- (void)reportSuccessOnEvaluation;
- (void)reportTaskBecomingEligible;
- (void)reportTaskExpiration;
- (void)resetCurrentEligibilityWindow;
- (void)setActivity:(id)a3;
- (void)setBlockReasonsSoFar:(id)a3;
- (void)setCurrentEligibilityState:(int64_t)a3;
- (void)setCurrentEligibilityWindowEnd;
- (void)setCurrentEligibilityWindowEnd:(id)a3;
- (void)setCurrentEligibilityWindowStart;
- (void)setCurrentEligibilityWindowStart:(id)a3;
- (void)setInterval:(double)a3;
- (void)setLogger:(id)a3;
- (void)setPersistentBlockers:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASDataCollectionSUTask

- (_DASDataCollectionSUTask)initWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____DASDataCollectionSUTask;
  id v10 = -[_DASDataCollectionSUTask init](&v32, "init");
  if (v10)
  {
    uint64_t v11 = _DASSchedulingPriorityMaintenance;
    uint64_t v12 = _DASActivityDurationShort;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:86400.0]);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:]( &OBJC_CLASS____DASActivity,  "activityWithName:priority:duration:startingAfter:startingBefore:",  v8,  v11,  v12,  v13,  v15));
    v17 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = v16;

    [*((id *)v10 + 3) setTriggersRestart:1];
    *((double *)v10 + 2) = a4;
    objc_storeStrong((id *)v10 + 9, a5);
    *((void *)v10 + 4) = 0LL;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v19 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v21 = (void *)*((void *)v10 + 8);
    *((void *)v10 + 8) = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v22 evaluationQueue]);
    dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v23);
    v25 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v24;

    v26 = (dispatch_source_s *)*((void *)v10 + 1);
    dispatch_time_t v27 = dispatch_walltime(0LL, (uint64_t)(*((double *)v10 + 2) * 1000000000.0));
    dispatch_source_set_timer(v26, v27, (unint64_t)(*((double *)v10 + 2) * 1000000000.0), 0x3B9ACA00uLL);
    v28 = (dispatch_source_s *)*((void *)v10 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10006B7DC;
    handler[3] = &unk_1001150D0;
    id v31 = v10;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_activate(*((dispatch_object_t *)v10 + 1));
  }

  return (_DASDataCollectionSUTask *)v10;
}

+ (id)taskWithName:(id)a3 intervalDuration:(double)a4 withLogger:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithName:v9 intervalDuration:v8 withLogger:a4];

  return v10;
}

- (BOOL)isEligibleNow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASRequiresRestartPolicy policyInstance](&OBJC_CLASS____DASRequiresRestartPolicy, "policyInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getRebootForecastPeriod]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B68C4(logger, v4);
  }
  unsigned __int8 v7 = [v4 contains:v5];

  return v7;
}

- (void)evaluateActivityOnTick
{
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6A98();
  }
  if (self->_currentEligibilityState == 1)
  {
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B6A6C();
    }
    -[_DASDataCollectionSUTask evaluatePolicies](self, "evaluatePolicies");
  }

  unsigned int v3 = -[_DASDataCollectionSUTask isEligibleNow](self, "isEligibleNow");
  int64_t currentEligibilityState = self->_currentEligibilityState;
  if (!currentEligibilityState && v3)
  {
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B6A40();
    }
    -[_DASDataCollectionSUTask reportTaskBecomingEligible](self, "reportTaskBecomingEligible");
    self->_int64_t currentEligibilityState = 1LL;
    -[_DASDataCollectionSUTask setCurrentEligibilityWindowStart](self, "setCurrentEligibilityWindowStart");
    -[_DASDataCollectionSUTask evaluatePolicies](self, "evaluatePolicies");
    return;
  }

  if (currentEligibilityState == 1) {
    char v5 = v3;
  }
  else {
    char v5 = 1;
  }
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B6A14();
    }
    self->_int64_t currentEligibilityState = 3LL;
    -[_DASDataCollectionSUTask setCurrentEligibilityWindowEnd](self, "setCurrentEligibilityWindowEnd");
    -[_DASDataCollectionSUTask handleTaskExpiration](self, "handleTaskExpiration");
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B69E8();
    }
    goto LABEL_34;
  }

  if (currentEligibilityState == 2) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B69BC();
    }
LABEL_34:
    self->_int64_t currentEligibilityState = 0LL;
    -[_DASDataCollectionSUTask resetCurrentEligibilityWindow](self, "resetCurrentEligibilityWindow");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[_DASActivity setStartAfter:](self->_activity, "setStartAfter:", v16);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startAfter](self->_activity, "startAfter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingTimeInterval:86400.0]);
    -[_DASActivity setStartBefore:](self->_activity, "setStartBefore:", v14);
    goto LABEL_35;
  }

  if (currentEligibilityState) {
    char v7 = 1;
  }
  else {
    char v7 = v3;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](self->_activity, "startBefore"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 earlierDate:v8]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startBefore](self->_activity, "startBefore"));
    unsigned int v12 = [v10 isEqualToDate:v11];

    if (!v12)
    {
LABEL_36:

      return;
    }

    -[_DASDataCollectionSUTask handleTaskExpirationNeverEligible](self, "handleTaskExpirationNeverEligible");
    if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_1000B6990();
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[_DASActivity setStartAfter:](self->_activity, "setStartAfter:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivity startAfter](self->_activity, "startAfter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:86400.0]);
    -[_DASActivity setStartBefore:](self->_activity, "setStartBefore:", v15);

LABEL_35:
    goto LABEL_36;
  }

- (void)evaluatePolicies
{
  v2 = self;
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6AC4();
  }
  id v31 = (void *)os_transaction_create("com.apple.dasd.evaluatePoliciesForSUTelemetryActivity");
  context = objc_autoreleasePoolPush();
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      id v8 = 0LL;
      id v32 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v8);
        id v10 = objc_autoreleasePoolPush();
        if ([v9 appliesToActivity:v2->_activity])
        {
          uint64_t v11 = objc_autoreleasePoolPush();
          unsigned int v12 = v2;
          activity = v2->_activity;
          v14 = v4;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v9 responseForActivity:activity withState:v16]);

          v4 = v14;
          objc_autoreleasePoolPop(v11);
          if ([v17 policyDecision] == (id)33 || objc_msgSend(v17, "policyDecision") == (id)100)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 policyName]);
            [v14 addObject:v18];

            if ((objc_opt_respondsToSelector(v9, "blockReasons:") & 1) != 0)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue([v9 blockReasons:v17]);
              [v14 addObjectsFromArray:v19];
            }
          }

          v2 = v12;
          id v6 = v32;
        }

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }

    while (v6);
  }

  id v20 = [v4 count];
  logger = v2->_logger;
  BOOL v22 = os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      v23 = logger;
      id v24 = [v4 count];
      *(_DWORD *)buf = 134217984;
      id v39 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "SUTelemetryTask: found %lu blockers.",  buf,  0xCu);
    }

    -[_DASDataCollectionSUTask reportBlockersOnEvaluation:](v2, "reportBlockersOnEvaluation:", v4);
    blockReasonsSoFar = v2->_blockReasonsSoFar;
    v26 = v4;
    dispatch_time_t v27 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    -[NSMutableSet addObjectsFromArray:](blockReasonsSoFar, "addObjectsFromArray:", v27);

    id v28 = -[NSMutableSet count](v2->_persistentBlockers, "count");
    persistentBlockers = v2->_persistentBlockers;
    if (v28) {
      -[NSMutableSet intersectSet:](persistentBlockers, "intersectSet:", v26);
    }
    else {
      -[NSMutableSet unionSet:](persistentBlockers, "unionSet:", v26);
    }
    v4 = v26;
  }

  else
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  logger,  OS_LOG_TYPE_DEFAULT,  "SUTelemetryTask: no blocking policies.",  buf,  2u);
    }

    -[_DASDataCollectionSUTask markAsCompleted](v2, "markAsCompleted");
    -[_DASDataCollectionSUTask reportSuccessOnEvaluation](v2, "reportSuccessOnEvaluation");
  }

  objc_autoreleasePoolPop(context);
}

- (void)markAsCompleted
{
  self->_int64_t currentEligibilityState = 2LL;
  -[_DASDataCollectionSUTask setCurrentEligibilityWindowEnd](self, "setCurrentEligibilityWindowEnd");
  -[NSMutableSet removeAllObjects](self->_blockReasonsSoFar, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_persistentBlockers, "removeAllObjects");
}

- (void)handleTaskExpiration
{
}

- (void)setCurrentEligibilityWindowStart
{
  unsigned int v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  currentEligibilityWindowStart = self->_currentEligibilityWindowStart;
  self->_currentEligibilityWindowStart = v3;
}

- (void)setCurrentEligibilityWindowEnd
{
  unsigned int v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  currentEligibilityWindowEnd = self->_currentEligibilityWindowEnd;
  self->_currentEligibilityWindowEnd = v3;
}

- (void)resetCurrentEligibilityWindow
{
  currentEligibilityWindowStart = self->_currentEligibilityWindowStart;
  self->_currentEligibilityWindowStart = 0LL;

  currentEligibilityWindowEnd = self->_currentEligibilityWindowEnd;
  self->_currentEligibilityWindowEnd = 0LL;
}

- (void)addExperimentInformationWithDictionary:(id)a3
{
  id v8 = a3;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentID]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 experimentID]);
    [v8 setObject:v5 forKeyedSubscript:@"ExperimentID"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 treatmentID]);
    [v8 setObject:v6 forKeyedSubscript:@"TreatmentID"];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 deploymentID]));
    [v8 setObject:v7 forKeyedSubscript:@"DeploymentID"];
  }
}

- (void)handleTaskExpirationNeverEligible
{
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6AF0();
  }
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v3);
  [v3 setObject:@"NeverEligible" forKeyedSubscript:@"Decision"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10006C268;
  v11[3] = &unk_1001153D8;
  id v4 = v3;
  id v12 = v4;
  AnalyticsSendEventLazy(@"com.apple.das.SU.BlockedReasonCounts_v2", v11);
  [v4 setObject:@"NeverEligible" forKeyedSubscript:@"BlockReason"];
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  id v8 = sub_10006C270;
  id v9 = &unk_1001153D8;
  id v10 = v4;
  id v5 = v4;
  AnalyticsSendEventLazy(@"com.apple.das.SU.PersistentBlocker_v2", &v6);
  -[NSMutableSet removeAllObjects](self->_blockReasonsSoFar, "removeAllObjects", v6, v7, v8, v9);
  -[NSMutableSet removeAllObjects](self->_persistentBlockers, "removeAllObjects");
}

- (void)reportBlockersOnEvaluation:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6B1C(logger);
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v11);
        [v11 setObject:v10 forKeyedSubscript:@"Decision"];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10006C438;
        v14[3] = &unk_1001153D8;
        id v15 = v11;
        id v12 = v11;
        AnalyticsSendEventLazy(@"com.apple.das.SU.BlockedReasonCounts_v2", v14);
      }

      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }
}

- (void)reportSuccessOnEvaluation
{
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6B94();
  }
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v3);
  [v3 setObject:@"Success" forKeyedSubscript:@"Decision"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](&OBJC_CLASS____CDDateRange, "periodWithStart:end:"));
    [v4 duration];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v3 setObject:v5 forKeyedSubscript:@"WindowDuration"];
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006C5CC;
  v10[3] = &unk_1001153D8;
  id v6 = v3;
  id v11 = v6;
  AnalyticsSendEventLazy(@"com.apple.das.SU.BlockedReasonCounts_v2", v10);
  [v6 setObject:@"Success" forKeyedSubscript:@"BlockReason"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006C5D4;
  v8[3] = &unk_1001153D8;
  id v9 = v6;
  id v7 = v6;
  AnalyticsSendEventLazy(@"com.apple.das.SU.PersistentBlocker_v2", v8);
}

- (void)reportTaskBecomingEligible
{
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6BC0();
  }
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v3);
  [v3 setObject:@"Eligible" forKeyedSubscript:@"Decision"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006C70C;
  v8[3] = &unk_1001153D8;
  id v4 = v3;
  id v9 = v4;
  AnalyticsSendEventLazy(@"com.apple.das.SU.BlockedReasonCounts_v2", v8);
  [v4 setObject:@"Eligible" forKeyedSubscript:@"BlockReason"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10006C714;
  v6[3] = &unk_1001153D8;
  id v7 = v4;
  id v5 = v4;
  AnalyticsSendEventLazy(@"com.apple.das.SU.PersistentBlocker_v2", v6);
}

- (void)reportTaskExpiration
{
  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6BEC();
  }
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v3);
  [v3 setObject:@"Expired" forKeyedSubscript:@"Decision"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](&OBJC_CLASS____CDDateRange, "periodWithStart:end:"));
    [v4 duration];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v3 setObject:v5 forKeyedSubscript:@"WindowDuration"];
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10006C8A8;
  v10[3] = &unk_1001153D8;
  id v6 = v3;
  id v11 = v6;
  AnalyticsSendEventLazy(@"com.apple.das.SU.BlockedReasonCounts_v2", v10);
  [v6 setObject:@"Expired" forKeyedSubscript:@"BlockReason"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006C8B0;
  v8[3] = &unk_1001153D8;
  id v9 = v6;
  id v7 = v6;
  AnalyticsSendEventLazy(@"com.apple.das.SU.PersistentBlocker_v2", v8);
}

- (void)reportBlockersStatisticsOnExpiration
{
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6C44((uint64_t)self, logger);
  }
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = self->_persistentBlockers;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
  id v5 = &AnalyticsSendEventLazy_ptr;
  id v6 = _NSConcreteStackBlock;
  id v7 = &unk_1001153D8;
  if (v4)
  {
    id v8 = v4;
    uint64_t v9 = *(void *)v36;
    uint64_t v10 = @"BlockReason";
    v29 = self;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v5[84] dictionary]);
        -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v13);
        [v13 setObject:v12 forKeyedSubscript:v10];
        if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
        {
          id v14 = v8;
          uint64_t v15 = v9;
          __int128 v16 = v10;
          __int128 v17 = v5;
          __int128 v18 = v6;
          __int128 v19 = v7;
          id v20 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](&OBJC_CLASS____CDDateRange, "periodWithStart:end:"));
          [v20 duration];
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v13 setObject:v21 forKeyedSubscript:@"WindowDuration"];

          id v7 = v19;
          id v6 = v18;
          id v5 = v17;
          uint64_t v10 = v16;
          uint64_t v9 = v15;
          id v8 = v14;
          self = v29;
        }

        v33[0] = v6;
        v33[1] = 3221225472LL;
        v33[2] = sub_10006CC4C;
        v33[3] = v7;
        id v34 = v13;
        id v22 = v13;
        AnalyticsSendEventLazy(@"com.apple.das.SU.PersistentBlocker_v2", v33);
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    }

    while (v8);
  }

  if (os_log_type_enabled(self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_1000B6C18();
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v5[84] dictionary]);
  -[_DASDataCollectionSUTask addExperimentInformationWithDictionary:]( self,  "addExperimentInformationWithDictionary:",  v23);
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableSet count](self->_blockReasonsSoFar, "count")));
  [v23 setObject:v24 forKeyedSubscript:@"NumberOfBlockers"];

  [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:@"Expired"];
  if (self->_currentEligibilityWindowStart && self->_currentEligibilityWindowEnd)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](&OBJC_CLASS____CDDateRange, "periodWithStart:end:"));
    [v25 duration];
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v23 setObject:v26 forKeyedSubscript:@"WindowDuration"];
  }

  v31[0] = v6;
  v31[1] = 3221225472LL;
  v31[2] = sub_10006CC54;
  v31[3] = v7;
  id v32 = v23;
  id v27 = v23;
  AnalyticsSendEventLazy(@"com.apple.das.SU.BlockReasonsCardinality_v2", v31);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (int64_t)currentEligibilityState
{
  return self->_currentEligibilityState;
}

- (void)setCurrentEligibilityState:(int64_t)a3
{
  self->_int64_t currentEligibilityState = a3;
}

- (NSDate)currentEligibilityWindowStart
{
  return self->_currentEligibilityWindowStart;
}

- (void)setCurrentEligibilityWindowStart:(id)a3
{
}

- (NSDate)currentEligibilityWindowEnd
{
  return self->_currentEligibilityWindowEnd;
}

- (void)setCurrentEligibilityWindowEnd:(id)a3
{
}

- (NSMutableSet)blockReasonsSoFar
{
  return self->_blockReasonsSoFar;
}

- (void)setBlockReasonsSoFar:(id)a3
{
}

- (NSMutableSet)persistentBlockers
{
  return self->_persistentBlockers;
}

- (void)setPersistentBlockers:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
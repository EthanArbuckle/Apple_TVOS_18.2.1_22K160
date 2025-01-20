@interface _DASDeviceActivityPolicy
+ (BOOL)isDeviceInUse:(id)a3;
+ (id)policyInstance;
+ (void)printLowLikelihoodRegions;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRequiredFileProtection:(id)a4 withRationale:(id)a5 withState:(id)a6;
- (BOOL)considerAlwaysActive;
- (BOOL)requiresDeviceInactivityForActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (_CDContextualKeyPath)inUseStatus;
- (_DASDeviceActivityPolicy)init;
- (_DKPredictionTimeline)deviceActivityTimeline;
- (_DKPredictor)predictor;
- (double)scoreForActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDeviceActivity;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)initializeTimelines;
- (void)setConsiderAlwaysActive:(BOOL)a3;
- (void)setDeviceActivityTimeline:(id)a3;
- (void)setInUseStatus:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4;
@end

@implementation _DASDeviceActivityPolicy

+ (void)printLowLikelihoodRegions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager lowLikelihoodPeriodStartForPredictionWithKey:]( &OBJC_CLASS____DASPredictionManager,  "lowLikelihoodPeriodStartForPredictionWithKey:",  @"deviceActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager lowLikelihoodPeriodEndForPredictionWithKey:]( &OBJC_CLASS____DASPredictionManager,  "lowLikelihoodPeriodEndForPredictionWithKey:",  @"deviceActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v2 descriptionWithLocale:v4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 descriptionWithLocale:v4]);
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Low Likelihood is from %@ to %@",  (uint8_t *)&v8,  0x16u);
  }
}

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_inUseStatus));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121C30;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  int v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (_DASDeviceActivityPolicy)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS____DASDeviceActivityPolicy;
  v2 = -[_DASDeviceActivityPolicy init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Device Activity Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](&OBJC_CLASS____DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.duet.activityscheduler.deviceactivitypolicy.queue", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[_DASDeviceActivityPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v15 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    v3->_considerAlwaysActive = -[NSUserDefaults BOOLForKey:](v15, "BOOLForKey:", @"deviceInUse");

    -[_DASDeviceActivityPolicy initializeTimelines](v3, "initializeTimelines");
  }

  return v3;
}

- (void)initializeTimelines
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035D54;
  block[3] = &unk_1001150D0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)predictionForDeviceActivity
{
  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.deviceActivity");
  v4 = objc_autoreleasePoolPush();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPredictor deviceActivityLikelihood](self->_predictor, "deviceActivityLikelihood"));
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035EE8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157768 != -1) {
    dispatch_once(&qword_100157768, block);
  }
  return (id)qword_100157770;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.deviceactivitypolicy.inusestatus"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    unsigned __int8 v8 = [v7 BOOLValue];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fileProtection]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
  if ([v4 isEqual:v5])
  {
    BOOL v6 = 0;
  }

  else
  {
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);
    BOOL v6 = v7 == 0LL;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  id v4 = a3;
  double v5 = 20.0;
  if (!-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:]( self,  "requiresDeviceInactivityForActivity:",  v4))
  {
    else {
      double v5 = 10.0;
    }
  }

  return v5;
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_100036218;
  v24 = &unk_100115148;
  v25 = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v26 = v8;
  +[_DASPredictionManager asyncDo:](&OBJC_CLASS____DASPredictionManager, "asyncDo:", &v21);
  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[_DASDeviceActivityPolicy deviceActivityTimeline]( self,  "deviceActivityTimeline",  v21,  v22,  v23,  v24,  v25));
  id v10 = [v6 duration];
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 valueAtDate:v7]);
    [v18 doubleValue];
    double v13 = 1.0 - v19;

    objc_super v17 = v7;
  }

  else
  {
    double v11 = (double)(unint64_t)v10;
    double v12 = 0.0;
    double v13 = 1.0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v9 valueAtDate:v7]);
      [v14 doubleValue];
      double v16 = v15;

      double v13 = v13 * (1.0 - v16);
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:900.0]);

      double v12 = v12 + 900.0;
      id v7 = v17;
    }

    while (v12 < v11);
  }

  return v13;
}

+ (BOOL)isDeviceInUse:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  LOBYTE(v4) = ((unint64_t)[v5 unsignedLongLongValue] & 5) != 0;
  return (char)v4;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRequiredFileProtection:(id)a4 withRationale:(id)a5 withState:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v10 isEqualToString:_DASLaunchReasonBackgroundProcessing] & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
    if ([v11 isEqual:v14])
    {
      BOOL v16 = 1;
      goto LABEL_7;
    }

    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](&OBJC_CLASS____DASFileProtection, "completeUnlessOpen"));
    unsigned __int8 v18 = [v11 isEqual:v17];

    if ((v18 & 1) != 0) {
      goto LABEL_9;
    }
  }

  if (![(id)objc_opt_class(self) isDeviceInUse:v13])
  {
LABEL_9:
    BOOL v16 = 1;
    goto LABEL_10;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"launchType == PROCESSING AND deviceActive == %@",  v14));
  [v12 addRationaleWithCondition:v15];

  BOOL v16 = 0;
LABEL_7:

LABEL_10:
  return v16;
}

- (BOOL)requiresDeviceInactivityForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresDeviceInactivity])
  {
    BOOL v4 = 1;
  }

  else if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v3) {
         && [v3 transferSizeType] == (id)30)
  }
  {
    id v5 = [v3 schedulingPriority];
    BOOL v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4
{
  id v5 = a3;
  if ([a4 transferSizeType] == (id)30) {
    objc_msgSend(v5, "setResponseOptions:", (unint64_t)objc_msgSend(v5, "responseOptions") | 1);
  }
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Device Activity Policy");
  if (!self->_considerAlwaysActive
    || !-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:]( self,  "requiresDeviceInactivityForActivity:",  v6))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v11]);

    if (-[_DASDeviceActivityPolicy requiresDeviceInactivityForActivity:]( self,  "requiresDeviceInactivityForActivity:",  v6)
      && +[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"deviceActivity == %@",  v12));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v13);

      -[_DASDeviceActivityPolicy updateRationaleForTransferSize:withActivity:]( self,  "updateRationaleForTransferSize:withActivity:",  v8,  v6);
LABEL_7:
      double v14 = (double)0x384uLL;
LABEL_19:
      uint64_t v19 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v8,  v14));
      goto LABEL_20;
    }

    if ([v6 requestsApplicationLaunch]
      && ([v6 isContactTracingBackgroundActivity] & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
      unsigned __int8 v22 = -[_DASDeviceActivityPolicy backgroundTaskAllowedWithType:withRequiredFileProtection:withRationale:withState:]( self,  "backgroundTaskAllowedWithType:withRequiredFileProtection:withRationale:withState:",  v20,  v21,  v8,  v7);

      if ((v22 & 1) == 0)
      {
        double v14 = 10800.0;
        goto LABEL_19;
      }

      if (([v12 unsignedIntValue] & 4) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"deviceActivity == %@",  v12));
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v25);

        goto LABEL_7;
      }

      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[_DASDeviceActivityPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v16);
      double v18 = 1.0 - v23;
    }

    else
    {
      else {
        double v15 = 0.5;
      }
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[_DASDeviceActivityPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v16);
      double v18 = v15 + v17 * 0.5;
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  0LL,  fmax(v18, 0.05),  (double)0x384uLL));
LABEL_20:
    id v10 = (void *)v19;

    goto LABEL_21;
  }

  dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"considerAlwaysActive == YES && requiresDeviceInactivity == YES"));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v9);

  -[_DASDeviceActivityPolicy updateRationaleForTransferSize:withActivity:]( self,  "updateRationaleForTransferSize:withActivity:",  v8,  v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v8,  (double)0x384uLL));
LABEL_21:

  return v10;
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

- (_DKPredictor)predictor
{
  return self->_predictor;
}

- (void)setPredictor:(id)a3
{
}

- (_DKPredictionTimeline)deviceActivityTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeviceActivityTimeline:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
}

- (BOOL)considerAlwaysActive
{
  return self->_considerAlwaysActive;
}

- (void)setConsiderAlwaysActive:(BOOL)a3
{
  self->_considerAlwaysActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
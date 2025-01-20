@interface _DASRequiresPluggedInPolicy
+ (BOOL)isWirelessCharger:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)requiresPluginForActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)batteryStatusKeyPath;
- (_CDContextualKeyPath)watchIsPluggedInKeyPath;
- (_DASRequiresPluggedInPolicy)init;
- (_DKPredictionTimeline)pluginTimeline;
- (_DKPredictor)predictor;
- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4;
- (double)scoreForActivity:(id)a3 isPluggedIn:(BOOL)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDevicePluggedIn;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setBatteryStatusKeyPath:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPluginTimeline:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWatchIsPluggedInKeyPath:(id)a3;
- (void)updateRationaleForTransferSize:(id)a3 withActivity:(id)a4;
@end

@implementation _DASRequiresPluggedInPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121D20;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASRequiresPluggedInPolicy)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASRequiresPluggedInPolicy;
  v2 = -[_DASRequiresPluggedInPolicy init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Charger Plugged In Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryStateDataDictionary]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryStateDataDictionary"));
    batteryStatusKeyPath = v3->_batteryStatusKeyPath;
    v3->_batteryStatusKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDevicePluginStatus"));
    watchIsPluggedInKeyPath = v3->_watchIsPluggedInKeyPath;
    v3->_watchIsPluggedInKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](&OBJC_CLASS____DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy predictionForDevicePluggedIn](v3, "predictionForDevicePluggedIn"));
    objc_storeStrong((id *)&v3->_pluginTimeline, v11);
    +[_DASPredictionManager setPrediction:forKey:]( &OBJC_CLASS____DASPredictionManager,  "setPrediction:forKey:",  v11,  @"plugin");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"predictions"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000B3658((uint64_t)v11, v12, v13);
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v16;
  }

  return v3;
}

- (id)predictionForDevicePluggedIn
{
  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.watchNearby");
  v4 = objc_autoreleasePoolPush();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DKPredictor pluginLikelihood](self->_predictor, "pluginLikelihood"));
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_100157960 != -1) {
    dispatch_once(&qword_100157960, &stru_100115EF0);
  }
  return (id)qword_100157968;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
  {
    self = (_DASRequiresPluggedInPolicy *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForPluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForPluginStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self]);
    unsigned __int8 v9 = [v8 BOOLValue];

    LOBYTE(self) = v9 ^ 1;
  }

  else if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.watchispluggedin"])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_watchIsPluggedInKeyPath]);
    LODWORD(self) = [v10 BOOLValue] ^ 1;
  }

  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);

  if (v4)
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"pluggedinpolicy"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000B36C4(v5);
    }

    LOBYTE(v5) = 0;
  }

  else
  {
    LODWORD(v5) = [v3 beforeDaysFirstActivity] ^ 1;
  }

  return (char)v5;
}

- (double)weightForActivity:(id)a3
{
  id v4 = a3;
  double v5 = 20.0;
  if (!-[_DASRequiresPluggedInPolicy requiresPluginForActivity:](self, "requiresPluginForActivity:", v4))
  {
    if (([v4 requestsApplicationLaunch] & 1) != 0
      || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]),
          id v7 = [v6 count],
          v6,
          v7))
    {
      double v5 = 2.0;
    }

    else
    {
      double v5 = 10.0;
    }
  }

  return v5;
}

- (double)scoreForActivity:(id)a3 isPluggedIn:(BOOL)a4
{
  double result = 1.0;
  if (!a4)
  {
    unsigned int v5 = -[_DASRequiresPluggedInPolicy requiresPluginForActivity:](self, "requiresPluginForActivity:", a3, 1.0);
    double result = 0.5;
    if (v5) {
      return 0.0;
    }
  }

  return result;
}

- (BOOL)requiresPluginForActivity:(id)a3
{
  id v3 = a3;
  if ([v3 requiresPlugin])
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

+ (BOOL)isWirelessCharger:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries batteryAdapterIsWirelessKey]( &OBJC_CLASS____CDContextQueries,  "batteryAdapterIsWirelessKey"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  [v6 targetDevice];
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);

  id v11 = [v10 BOOLValue];
  -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, v11);
  double v13 = v12;
  if (v12 == 0.0)
  {
    -[_DASRequiresPluggedInPolicy updateRationaleForTransferSize:withActivity:]( self,  "updateRationaleForTransferSize:withActivity:",  v8,  v6);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%@ == %@",  v9,  v14));

    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v15);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v8,  v13,  (double)0x384uLL));

  return v16;
}

- (double)predictedScoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.5;
  if ([v6 targetDevice] != (id)1 && objc_msgSend(v6, "targetDevice") != (id)2)
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_10004527C;
    v21 = &unk_100115148;
    v22 = self;
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v9 = v23;
    +[_DASPredictionManager asyncDo:](&OBJC_CLASS____DASPredictionManager, "asyncDo:", &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresPluggedInPolicy pluginTimeline](self, "pluginTimeline", v18, v19, v20, v21, v22));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueAtDate:v7]);
    double v12 = v11;
    if (v11)
    {
      [v11 doubleValue];
      double v14 = v13;
      -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, v13 > 0.0);
      double v8 = v14 * v15;
    }

    else
    {
      -[_DASRequiresPluggedInPolicy scoreForActivity:isPluggedIn:](self, "scoreForActivity:isPluggedIn:", v6, 0LL);
      double v8 = v16;
    }
  }

  return v8;
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

- (_CDContextualKeyPath)batteryStatusKeyPath
{
  return self->_batteryStatusKeyPath;
}

- (void)setBatteryStatusKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)watchIsPluggedInKeyPath
{
  return self->_watchIsPluggedInKeyPath;
}

- (void)setWatchIsPluggedInKeyPath:(id)a3
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

- (_DKPredictionTimeline)pluginTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPluginTimeline:(id)a3
{
}

- (NSDate)lastPredictionTimelineUpdate
{
  return self->_lastPredictionTimelineUpdate;
}

- (void)setLastPredictionTimelineUpdate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
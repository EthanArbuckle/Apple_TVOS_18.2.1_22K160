@interface _DASDefaultPairedPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)lastPredictionTimelineUpdate;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASDefaultPairedPolicy)init;
- (_DKPredictionTimeline)deviceNearbyTimeline;
- (_DKPredictor)predictor;
- (double)scoreForActivity:(id)a3 atDate:(id)a4;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)predictionForDeviceNearby;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setDeviceNearbyTimeline:(id)a3;
- (void)setLastPredictionTimelineUpdate:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASDefaultPairedPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDeviceNearbyStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121C18;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASDefaultPairedPolicy)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASDefaultPairedPolicy;
  v2 = -[_DASDefaultPairedPolicy init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Default Paired Nearby Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedPredictor](&OBJC_CLASS____DASPredictionManager, "sharedPredictor"));
    predictor = v3->_predictor;
    v3->_predictor = (_DKPredictor *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy predictionForDeviceNearby](v3, "predictionForDeviceNearby"));
    deviceNearbyTimeline = v3->_deviceNearbyTimeline;
    v3->_deviceNearbyTimeline = (_DKPredictionTimeline *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastPredictionTimelineUpdate = v3->_lastPredictionTimelineUpdate;
    v3->_lastPredictionTimelineUpdate = (NSDate *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;
  }

  return v3;
}

- (id)predictionForDeviceNearby
{
  v3 = (void *)os_transaction_create("com.apple.dasd.prediction.watchNearby");
  v4 = objc_autoreleasePoolPush();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartInDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartInDateRangeFrom:to:",  v5,  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithIntegerValue:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithIntegerValue:",  1LL));
  v13[0] = v7;
  v13[1] = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v9));

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DKPredictor predictionForStreamWithName:withPredicate:withPredictionType:]( self->_predictor,  "predictionForStreamWithName:withPredicate:withPredictionType:",  @"/defaultPaired/nearby",  v10,  1LL));
  objc_autoreleasePoolPop(v4);

  return v11;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.defaultpairedpolicy.nearbystatus"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDeviceNearbyStatus"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    unsigned int v8 = [v7 BOOLValue] ^ 1;
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035468;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157758 != -1) {
    dispatch_once(&qword_100157758, block);
  }
  return (id)qword_100157760;
}

- (double)scoreForActivity:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  v23 = sub_10003561C;
  v24 = &unk_100115148;
  v25 = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v26 = v8;
  +[_DASPredictionManager asyncDo:](&OBJC_CLASS____DASPredictionManager, "asyncDo:", &v21);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDefaultPairedPolicy deviceNearbyTimeline](self, "deviceNearbyTimeline", v21, v22, v23, v24, v25));
  id v10 = [v6 duration];
  if ((unint64_t)v10 <= _DASActivityDurationModerate)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 valueAtDate:v7]);
    [v18 doubleValue];
    double v13 = v19;

    v17 = v7;
  }

  else
  {
    double v11 = (double)(unint64_t)v10;
    double v12 = 0.0;
    double v13 = 1.0;
    do
    {
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v9 valueAtDate:v7]);
      [v14 doubleValue];
      double v16 = v15;

      double v13 = v13 * v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:900.0]);

      double v12 = v12 + 900.0;
      id v7 = v17;
    }

    while (v12 < v11);
  }

  return v13;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDeviceNearbyStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDeviceNearbyStatus"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

  LOBYTE(v7) = [v9 BOOLValue];
  if ((v7 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[_DASDefaultPairedPolicy scoreForActivity:atDate:](self, "scoreForActivity:atDate:", v6, v10);
    double v12 = v11;

    double v13 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Default Paired Nearby Policy");
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"defaultPaired.likelihood == %@",  v14));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v13, "addRationaleWithCondition:", v15);

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  0LL,  fmax(v12, 0.01),  (double)0x384uLL));
  }

  else
  {
    double v13 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Default Paired Nearby Policy");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"defaultPairedIsNearby == %@",  v17));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v13, "addRationaleWithCondition:", v18);

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v13,  (double)0x384uLL));
  }

  double v19 = (void *)v16;

  return v19;
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

- (_DKPredictionTimeline)deviceNearbyTimeline
{
  return (_DKPredictionTimeline *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDeviceNearbyTimeline:(id)a3
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
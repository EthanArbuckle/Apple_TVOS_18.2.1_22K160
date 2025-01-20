@interface _DASBatteryLevelPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRationale:(id)a4 withBatteryLevel:(double)a5 isPluggedIn:(BOOL)a6;
- (BOOL)isiPad;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)batteryLevelKeyPath;
- (_CDContextualKeyPath)defaultPairedBatteryKeyPath;
- (_CDContextualKeyPath)defaultPairedPluginKeyPath;
- (_CDContextualKeyPath)pluginStatusKeyPath;
- (_DASBatteryLevelPolicy)init;
- (double)baselineScoreForActivity:(id)a3;
- (double)getScoreForActivity:(id)a3 forBatteryLevel:(double)a4 isPluggedIn:(BOOL)a5;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)lastSavedBatteryLevel;
- (void)setBatteryLevelKeyPath:(id)a3;
- (void)setDefaultPairedBatteryKeyPath:(id)a3;
- (void)setDefaultPairedPluginKeyPath:(id)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setLastSavedBatteryLevel:(int64_t)a3;
- (void)setPluginStatusKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASBatteryLevelPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_batteryLevelKeyPath));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.das.batterylevelpolicy.batterylevelchange";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121AF8;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (_DASBatteryLevelPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____DASBatteryLevelPolicy;
  v2 = -[_DASBatteryLevelPolicy init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Battery Level Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDeviceBatteryLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDeviceBatteryLevel"));
    defaultPairedBatteryKeyPath = v3->_defaultPairedBatteryKeyPath;
    v3->_defaultPairedBatteryKeyPath = (_CDContextualKeyPath *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDefaultPairedDevicePluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDefaultPairedDevicePluginStatus"));
    defaultPairedPluginKeyPath = v3->_defaultPairedPluginKeyPath;
    v3->_defaultPairedPluginKeyPath = (_CDContextualKeyPath *)v11;

    v3->_isiPad = +[_DASConfig isiPad](&OBJC_CLASS____DASConfig, "isiPad");
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[_DASBatteryLevelPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;

    v3->_lastSavedBatteryLevel = 0LL;
  }

  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001576A0 != -1) {
    dispatch_once(&qword_1001576A0, &stru_100115930);
  }
  return (id)qword_1001576A8;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:self->_batteryLevelKeyPath]);
  uint64_t v4 = (uint64_t)[v3 integerValue];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  id v6 = v5;
  if (v4 > 9)
  {
    else {
      [v5 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    }
    [v6 removeConstraint:1 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }

  else
  {
    [v5 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
    [v6 addConstraint:1 forSchedulingPriority:_DASSchedulingPriorityUtility];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.das.batterylevelpolicy.batterylevelchange"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:self->_batteryLevelKeyPath]);
    id v8 = [v7 integerValue];

    -[_DASBatteryLevelPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);
    int64_t lastSavedBatteryLevel = self->_lastSavedBatteryLevel;
    BOOL v10 = (uint64_t)v8 - lastSavedBatteryLevel < 5;
    else {
      BOOL v10 = 1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 allowsUnrestrictedBackgroundLaunches])
  {
    BOOL v4 = 0;
  }

  else
  {
    id v5 = [v3 schedulingPriority];
    BOOL v4 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiated;
  }

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (double)getScoreForActivity:(id)a3 forBatteryLevel:(double)a4 isPluggedIn:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:_DASCTSMinBatteryLevelKey]);
  id v10 = [v9 integerValue];

  double v11 = 0.0;
  if ((double)(uint64_t)v10 <= a4)
  {
    id v12 = objc_msgSend(v7, "schedulingPriority", (double)(uint64_t)v10);
    if ((unint64_t)v12 >= _DASSchedulingPriorityUserInitiated)
    {
      double v15 = 5.0;
      double v14 = 0.25;
    }

    else
    {
      id v13 = [v7 schedulingPriority];
      double v14 = 0.5;
      double v15 = 10.0;
    }

    double v16 = pow((a4 - v15) / (100.0 - v15), v14);
    if (v5) {
      double v16 = v16 * 1.2;
    }
    if (v16 > 1.0) {
      double v16 = 1.0;
    }
    double v11 = fmax(v16, 0.0);
  }

  return v11;
}

- (BOOL)backgroundTaskAllowedWithType:(id)a3 withRationale:(id)a4 withBatteryLevel:(double)a5 isPluggedIn:(BOOL)a6
{
  id v10 = a4;
  unsigned int v11 = [a3 isEqualToString:_DASLaunchReasonBackgroundProcessing];
  BOOL v12 = 1;
  if (v11 && !a6 && (a5 < 75.0 || !self->_isiPad))
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a5));
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"launchType == PROCESSING AND batteryLevel == %@",  v14));
    [v10 addRationaleWithCondition:v15];

    BOOL v12 = 0;
  }

  return v12;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F7E4;
  block[3] = &unk_100115148;
  block[4] = self;
  id v7 = a4;
  id v36 = v7;
  if (qword_1001576B0 != -1) {
    dispatch_once(&qword_1001576B0, block);
  }
  id v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_batteryLevelKeyPath]);
  [v9 doubleValue];
  if (v10 == 0.0)
  {
    double v11 = (double)0x384uLL;
    uint64_t v12 = 0LL;
    id v13 = 0LL;
LABEL_5:
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v12,  v13,  v11));
    goto LABEL_17;
  }

  id v15 = [v9 unsignedIntegerValue];
  double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"batteryLevel == %ld",  v15));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_pluginStatusKeyPath]);
  id v18 = [v17 BOOLValue];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"pluggedIn == %@",  v19));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v20);

  if ([v6 requestsApplicationLaunch])
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    double v22 = (double)(unint64_t)v15;
    unsigned __int8 v23 = -[_DASBatteryLevelPolicy backgroundTaskAllowedWithType:withRationale:withBatteryLevel:isPluggedIn:]( self,  "backgroundTaskAllowedWithType:withRationale:withBatteryLevel:isPluggedIn:",  v21,  v8,  v18,  (double)(unint64_t)v15);

    if ((v23 & 1) == 0)
    {
      double v11 = (double)0x384uLL;
      uint64_t v12 = 33LL;
      id v13 = v8;
      goto LABEL_5;
    }
  }

  else
  {
    double v22 = (double)(unint64_t)v15;
  }

  -[_DASBatteryLevelPolicy getScoreForActivity:forBatteryLevel:isPluggedIn:]( self,  "getScoreForActivity:forBatteryLevel:isPluggedIn:",  v6,  v18,  v22);
  double v25 = v24;
  if ([v6 targetDevice] == (id)1 || objc_msgSend(v6, "targetDevice") == (id)2)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_defaultPairedBatteryKeyPath]);
    v27 = v26;
    if (v26)
    {
      id v28 = [v26 unsignedIntegerValue];
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"watchBatteryLevel == %ld",  v28));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_defaultPairedPluginKeyPath]);
      id v31 = [v30 BOOLValue];

      -[_DASBatteryLevelPolicy getScoreForActivity:forBatteryLevel:isPluggedIn:]( self,  "getScoreForActivity:forBatteryLevel:isPluggedIn:",  v6,  v31,  (double)(unint64_t)v28);
      if (v25 >= v32) {
        double v25 = v32;
      }
    }
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v8,  v25,  (double)0x384uLL));
LABEL_17:
  v33 = (void *)v14;

  return v33;
}

- (double)baselineScoreForActivity:(id)a3
{
  return 0.5;
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

- (_CDContextualKeyPath)batteryLevelKeyPath
{
  return self->_batteryLevelKeyPath;
}

- (void)setBatteryLevelKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pluginStatusKeyPath
{
  return self->_pluginStatusKeyPath;
}

- (void)setPluginStatusKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)defaultPairedBatteryKeyPath
{
  return self->_defaultPairedBatteryKeyPath;
}

- (void)setDefaultPairedBatteryKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)defaultPairedPluginKeyPath
{
  return self->_defaultPairedPluginKeyPath;
}

- (void)setDefaultPairedPluginKeyPath:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (int64_t)lastSavedBatteryLevel
{
  return self->_lastSavedBatteryLevel;
}

- (void)setLastSavedBatteryLevel:(int64_t)a3
{
  self->_int64_t lastSavedBatteryLevel = a3;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (void).cxx_destruct
{
}

@end
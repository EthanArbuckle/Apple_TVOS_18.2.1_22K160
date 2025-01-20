@interface _DASLowPowerModePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isChallengedForBatteryLife;
- (BOOL)isLowPowerModeEnabledWithContext:(id)a3;
- (BOOL)isLowPowerModePolicyEnforced:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)notifyQueue;
- (_CDContextualKeyPath)batteryLevelKeyPath;
- (_CDContextualKeyPath)lpmKeyPath;
- (_CDContextualKeyPath)pluginStatusKeyPath;
- (_DASLowPowerModePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)notifyToken;
- (int64_t)lastSavedBatteryLevel;
- (void)setBatteryLevelKeyPath:(id)a3;
- (void)setLastSavedBatteryLevel:(int64_t)a3;
- (void)setLpmKeyPath:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPluginStatusKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASLowPowerModePolicy

- (id)initializeTriggers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_batteryLevelKeyPath));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_lpmKeyPath));
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.das.batterylevelpolicy.batterylevelchange";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100121AB0;
  v12[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
  v13[0] = v5;
  v9[0] = @"identifier";
  v9[1] = @"predicate";
  v10[0] = @"com.apple.das.lpmchange";
  v10[1] = v4;
  v9[2] = @"deviceSet";
  v9[3] = @"mustWake";
  v10[2] = &off_100121AB0;
  v10[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));

  return v7;
}

- (_DASLowPowerModePolicy)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____DASLowPowerModePolicy;
  v2 = -[_DASLowPowerModePolicy init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Low Power Mode Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
    batteryLevelKeyPath = v3->_batteryLevelKeyPath;
    v3->_batteryLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForLowPowerModeStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForLowPowerModeStatus"));
    lpmKeyPath = v3->_lpmKeyPath;
    v3->_lpmKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
    pluginStatusKeyPath = v3->_pluginStatusKeyPath;
    v3->_pluginStatusKeyPath = (_CDContextualKeyPath *)v9;

    v3->_lastSavedBatteryLevel = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_DASLowPowerModePolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.duetActivityScheduler.lowPowerModePolicy.notify", 0LL);
    notifyQueue = v3->_notifyQueue;
    v3->_notifyQueue = (OS_dispatch_queue *)v13;

    uint32_t v15 = notify_register_check( (const char *)[@"com.apple.powerui.nudge.LPM" UTF8String],  &v3->_notifyToken);
    if (v15)
    {
      int v16 = v15;
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000B1FF0(v16, v17);
      }
    }
  }

  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (BOOL)isChallengedForBatteryLife
{
  int v3 = _os_feature_enabled_impl("PowerUI", "ambrosia");
  if (v3)
  {
    notify_get_state(self->_notifyToken, &state64);
    LOBYTE(v3) = state64 != 0;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_1001575E8 != -1) {
    dispatch_once(&qword_1001575E8, &stru_100115608);
  }
  return (id)qword_1001575F0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.das.batterylevelpolicy.batterylevelchange"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:self->_batteryLevelKeyPath]);
    id v8 = [v7 integerValue];

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

- (BOOL)isLowPowerModeEnabledWithContext:(id)a3
{
  return 0;
}

- (BOOL)isLowPowerModePolicyEnforced:(id)a3
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  BOOL v4 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  v4,  (double)0x384uLL));

  return v5;
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

- (_CDContextualKeyPath)lpmKeyPath
{
  return self->_lpmKeyPath;
}

- (void)setLpmKeyPath:(id)a3
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

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
}

@end
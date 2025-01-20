@interface _DASEnvironmentalPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASEnvironmentalPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASEnvironmentalPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.environmentpolicy.ispluggedin";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121B10;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASEnvironmentalPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASEnvironmentalPolicy;
  v2 = -[_DASEnvironmentalPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Environmental Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASEnvironmentalPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002FFE8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001576D0 != -1) {
    dispatch_once(&qword_1001576D0, block);
  }
  return (id)qword_1001576D8;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if (([v3 backlogged] & 1) != 0 || !objc_msgSend(v3, "requiresPlugin"))
  {
    BOOL v5 = 0;
  }

  else
  {
    id v4 = [v3 schedulingPriority];
    BOOL v5 = (unint64_t)v4 <= _DASSchedulingPriorityBackground;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  BOOL v5 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Environmental Policy");
  if (+[_DASConfig hasRecentlyUpdated](&OBJC_CLASS____DASConfig, "hasRecentlyUpdated")) {
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASGridDataManager sharedInstance](&OBJC_CLASS____DASGridDataManager, "sharedInstance"));
  if (([v6 isHighCarbonImpactWindow] & 1) == 0)
  {

    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);

  if (v7)
  {
LABEL_8:
    uint64_t v10 = 0LL;
    goto LABEL_9;
  }

  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v5,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"isInHighCarbonImpactWindow",  0.0,  1.0);
  if (+[_DASActivityDurationTracker shouldTrackActivity:]( &OBJC_CLASS____DASActivityDurationTracker,  "shouldTrackActivity:",  v4))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDurationTracker sharedInstance]( &OBJC_CLASS____DASActivityDurationTracker,  "sharedInstance"));
    unsigned __int8 v9 = [v8 activityHadEnoughRuntime:v4];

    if ((v9 & 1) == 0)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v5,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"hadEnoughRuntime",  1.0,  0.0);
      goto LABEL_8;
    }
  }

  uint64_t v10 = 33LL;
LABEL_9:
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v10,  v5,  (double)0x384uLL));

  return v11;
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

- (void).cxx_destruct
{
}

@end
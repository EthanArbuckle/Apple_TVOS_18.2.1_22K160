@interface _DASCPUUsagePolicy
+ (id)initializeTriggers;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCPUUsagePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCPUUsagePolicy

+ (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCPUUsageLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForCPUUsageLevel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121BE8;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASCPUUsagePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASCPUUsagePolicy;
  v2 = -[_DASCPUUsagePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"CPU Usage Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASCPUUsagePolicy initializeTriggers](&OBJC_CLASS____DASCPUUsagePolicy, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157730 != -1) {
    dispatch_once(&qword_100157730, &stru_100115A38);
  }
  return (id)qword_100157738;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCPUUsageLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForCPUUsageLevel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    id v8 = [v7 integerValue];

    BOOL v9 = v8 != (id)qword_100157DF0;
  }

  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated
    || ([v3 triggersRestart] & 1) != 0
    || ([v3 isIntensive] & 1) != 0)
  {
    BOOL v5 = 0;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 startBefore]);
    [v7 timeIntervalSinceNow];
    BOOL v5 = v8 >= 0.0;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  [v9 timeIntervalSinceNow];
  double v11 = v10;

  if (v11 < 0.0)
  {
    double v12 = (double)0x384uLL;
    uint64_t v13 = 0LL;
LABEL_15:
    v18 = v8;
    goto LABEL_16;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCPUUsageLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForCPUUsageLevel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
  id v16 = [v15 integerValue];

  unsigned int v17 = +[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7);
  if ((v17 & 1) != 0 || !+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    uint64_t v19 = qword_100157DF0;
    id v20 = [v6 schedulingPriority];
    if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
    {
      v23 = (uint64_t *)&unk_1001569B0;
      if (!v17) {
        v23 = &qword_1001569C0;
      }
      unint64_t v22 = *v23;
    }

    else
    {
      id v21 = [v6 schedulingPriority];
      else {
        unint64_t v22 = v19;
      }
    }

    if ((unint64_t)v16 <= v22)
    {
      double v27 = (double)(100 - (uint64_t)v16) / 100.0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v16));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"cpuLevel == %@",  v28));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

      uint64_t v24 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v8,  v27,  (double)0x384uLL));
      goto LABEL_17;
    }

    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"Max allowed CPU Usage level",  (double)v22,  (double)(uint64_t)v16);
    double v12 = (double)0x384uLL;
    uint64_t v13 = 33LL;
    goto LABEL_15;
  }

  double v12 = (double)0x384uLL;
  uint64_t v13 = 0LL;
  v18 = 0LL;
LABEL_16:
  uint64_t v24 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v13,  v18,  v12));
LABEL_17:
  v25 = (void *)v24;

  return v25;
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
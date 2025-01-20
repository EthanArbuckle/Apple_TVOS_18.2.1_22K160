@interface _DASActivityRateLimitPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASActivityRateLimitPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASActivityRateLimitPolicy

- (id)initializeTriggers
{
  v8 = @"identifier";
  v9 = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v10[0] = v2;
  v6 = @"identifier";
  v7 = @"com.apple.das.lpmchange";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));

  return v4;
}

- (_DASActivityRateLimitPolicy)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____DASActivityRateLimitPolicy;
  v2 = -[_DASActivityRateLimitPolicy init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"ActivityRateLimitPolicy";

    policyDescription = v3->_policyDescription;
    v3->_policyDescription = (NSString *)@"Blocks rate limited activities if rate limit configuration group is at capacity.";

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[_DASActivityRateLimitPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v6;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157618 != -1) {
    dispatch_once(&qword_100157618, &stru_100115760);
  }
  return (id)qword_100157620;
}

- (BOOL)appliesToActivity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 rateLimitConfigurationName]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 rateLimitConfigurationName]);
  if (v7 && (v8 = (void *)objc_claimAutoreleasedReturnValue([v5 startDate]), v8, !v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitManager sharedLimiter]( &OBJC_CLASS____DASActivityRateLimitManager,  "sharedLimiter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 evaluateRateLimitedActivity:v5]);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 maxedRateLimits]);
    id v13 = [v12 count];

    if (v13)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v6,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"ratelimited",  1.0,  0.0);
      uint64_t v14 = 33LL;
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v14,  v6,  (double)0x384uLL));
  }

  else
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  v6,  (double)0x384uLL));
  }

  return v9;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((([v5 isEqualToString:@"com.apple.das.lpmchange"] & 1) != 0
     || [v5 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"])
    && !+[_DASRateLimiterUtilities consideredInLPMWithState:]( &OBJC_CLASS____DASRateLimiterUtilities,  "consideredInLPMWithState:",  v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitManager sharedLimiter]( &OBJC_CLASS____DASActivityRateLimitManager,  "sharedLimiter"));
    [v8 recalculateStartDates];

    BOOL v7 = 1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
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
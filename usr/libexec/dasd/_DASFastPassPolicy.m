@interface _DASFastPassPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)fastPassShallYield;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASFastPassPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)rationaleWithAllSystemConditions;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)makeDecisionBasedOnSystemConstraints;
- (void)setFastPassShallYield:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateFastPassShallYield:(BOOL)a3;
@end

@implementation _DASFastPassPolicy

+ (id)policyInstance
{
  if (qword_100157808 != -1) {
    dispatch_once(&qword_100157808, &stru_100115B00);
  }
  return (id)qword_100157810;
}

- (_DASFastPassPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASFastPassPolicy;
  v2 = -[_DASFastPassPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Fast Pass Policy";

    v3->_fastPassShallYield = 0;
  }

  return v3;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl("DAS", "fastpass_yield"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);
    BOOL v5 = v4 != 0LL;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)updateFastPassShallYield:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl("DAS", "fastpass_yield"))
  {
    self->_fastPassShallYield = v3;
    if (v3)
    {
      dispatch_time_t v5 = dispatch_time(0LL, 900000000000LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10003B490;
      block[3] = &unk_1001150D0;
      block[4] = self;
      dispatch_after(v5, v7, block);
    }
  }

  else
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"fastpasspolicy"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000B30EC(v8);
    }
  }

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  int64_t v5 = -[_DASFastPassPolicy makeDecisionBasedOnSystemConstraints](self, "makeDecisionBasedOnSystemConstraints", a3, a4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASFastPassPolicy rationaleWithAllSystemConditions](self, "rationaleWithAllSystemConditions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v5,  v6,  900.0));

  return v7;
}

- (int64_t)makeDecisionBasedOnSystemConstraints
{
  if (self->_fastPassShallYield) {
    return 100LL;
  }
  else {
    return 0LL;
  }
}

- (id)rationaleWithAllSystemConditions
{
  BOOL v3 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Fast Pass Policy");
  v4 = v3;
  double v5 = 1.0;
  if (!self->_fastPassShallYield) {
    double v5 = 0.0;
  }
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v3,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"fastPassShallYield",  0.0,  v5);
  return v4;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.001;
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (BOOL)fastPassShallYield
{
  return self->_fastPassShallYield;
}

- (void)setFastPassShallYield:(BOOL)a3
{
  self->_fastPassShallYield = a3;
}

- (void).cxx_destruct
{
}

@end
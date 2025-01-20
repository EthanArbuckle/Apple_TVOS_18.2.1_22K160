@interface _DASRemoteWidgetBudgetPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)unavailableToday;
- (NSArray)triggers;
- (NSDate)actualUnavailableDate;
- (NSDate)unavailableDate;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_os_log)log;
- (_DASRemoteWidgetBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setActualUnavailableDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUnavailableDate:(id)a3;
- (void)setUnavailableToday:(BOOL)a3;
@end

@implementation _DASRemoteWidgetBudgetPolicy

- (id)initializeTriggers
{
  return 0LL;
}

- (_DASRemoteWidgetBudgetPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASRemoteWidgetBudgetPolicy;
  return -[_DASRemoteWidgetBudgetPolicy init](&v3, "init");
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000649BC;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B98 != -1) {
    dispatch_once(&qword_100157B98, block);
  }
  return (id)qword_100157BA0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 <= _DASSchedulingPriorityUtility && [v3 targetDevice] == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 widgetID]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  BOOL v6 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  unsigned __int8 v7 = +[_DASRemoteWidgetBudgetPolicy isBudgetAvailable:]( &OBJC_CLASS____DASRemoteWidgetBudgetPolicy,  "isBudgetAvailable:",  v5);

  if ((v7 & 1) != 0)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v6,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"remoteWidgetBudget",  1.0,  0.0);
    uint64_t v8 = 100LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v8,  v6,  (double)0x384uLL));

  return v9;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
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

- (NSDate)unavailableDate
{
  return self->_unavailableDate;
}

- (void)setUnavailableDate:(id)a3
{
}

- (NSDate)actualUnavailableDate
{
  return self->_actualUnavailableDate;
}

- (void)setActualUnavailableDate:(id)a3
{
}

- (BOOL)unavailableToday
{
  return self->_unavailableToday;
}

- (void)setUnavailableToday:(BOOL)a3
{
  self->_unavailableToday = a3;
}

- (void).cxx_destruct
{
}

@end
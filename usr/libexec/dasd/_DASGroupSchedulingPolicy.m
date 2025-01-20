@interface _DASGroupSchedulingPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASGroupSchedulingPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASGroupSchedulingPolicy

- (_DASGroupSchedulingPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASGroupSchedulingPolicy;
  v2 = -[_DASGroupSchedulingPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Activity Group Policy";
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D8C0;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157838 != -1) {
    dispatch_once(&qword_100157838, block);
  }
  return (id)qword_100157840;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupName]);
  if (v4)
  {
    id v5 = [v3 schedulingPriority];
    BOOL v6 = (unint64_t)v5 < _DASSchedulingPriorityUserInitiatedOvercommit;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 0.5;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 groupName]);
  uint64_t v7 = (uint64_t)[v5 additionalCapacityForActivity:v4 inGroupWithName:v6 shouldTryToSuspend:1];

  if (v7 < 1)
  {
    v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Activity Group Policy");
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%@.currentAvailableLimit == %ld",  v6,  v7));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v10);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v9,  (double)0x384uLL));
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  0LL,  (double)0x384uLL));
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
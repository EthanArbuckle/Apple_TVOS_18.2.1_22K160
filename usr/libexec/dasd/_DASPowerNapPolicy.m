@interface _DASPowerNapPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASPowerNapPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPowerNapPolicy

- (_DASPowerNapPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASPowerNapPolicy;
  v2 = -[_DASPowerNapPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Power Nap Policy";
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000445EC;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157950 != -1) {
    dispatch_once(&qword_100157950, block);
  }
  return (id)qword_100157958;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASSleepWakeMonitor sharedMonitorWithDaemon:]( &OBJC_CLASS____DASSleepWakeMonitor,  "sharedMonitorWithDaemon:",  v5));

  v7 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Power Nap Policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 inADarkWake]));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"inADarkWake == %@",  v8));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v9);

  if (([v4 darkWakeEligible] & 1) != 0
    && [v4 beforeDaysFirstActivity])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 beforeDaysFirstActivity]));
    v11 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"appRefresh == %@",  v10);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 darkWakeEligible]));
    v11 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"darkWakeEligible == %@",  v10);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v12);

  if ([v6 canRunInCurrentWakeState:v4])
  {
    if (![v4 darkWakeEligible]
      || ([v4 beforeDaysFirstActivity] & 1) != 0
      || (v13 = (void *)objc_claimAutoreleasedReturnValue([v4 name]),
          unsigned int v14 = [v6 hasFinishedRunningSinceLastWake:v13],
          v13,
          !v14))
    {
      uint64_t v17 = 0LL;
      goto LABEL_14;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"runSinceLastWake == YES"));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v15);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 wakeStateDescription]);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"wakeState == (%@)",  v15));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v7, "addRationaleWithCondition:", v16);
    }
  }

  uint64_t v17 = 33LL;
LABEL_14:
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v17,  v7,  (double)0x384uLL));

  return v18;
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
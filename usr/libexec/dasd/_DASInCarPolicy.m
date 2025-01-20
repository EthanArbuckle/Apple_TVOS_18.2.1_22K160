@interface _DASInCarPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)inCarKeyPath;
- (_CDContextualKeyPath)navigationKeyPath;
- (_DASInCarPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setInCarKeyPath:(id)a3;
- (void)setNavigationKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASInCarPolicy

- (id)initializeTriggers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_inCarKeyPath));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_navigationKeyPath));
  v11[0] = @"identifier";
  v11[1] = @"predicate";
  v12[0] = @"com.apple.duetactivityscheduler.incarpolicy.incar";
  v12[1] = v3;
  v11[2] = @"deviceSet";
  v11[3] = @"mustWake";
  v12[2] = &off_100121C78;
  v12[3] = &__kCFBooleanFalse;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
  v13[0] = v5;
  v9[0] = @"identifier";
  v9[1] = @"predicate";
  v10[0] = @"com.apple.duetactivityscheduler.incarpolicy.nav";
  v10[1] = v4;
  v9[2] = @"deviceSet";
  v9[3] = @"mustWake";
  v10[2] = &off_100121C78;
  v10[3] = &__kCFBooleanFalse;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));

  return v7;
}

- (_DASInCarPolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASInCarPolicy;
  v2 = -[_DASInCarPolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"In Car Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/car/isConnected"));
    inCarKeyPath = v3->_inCarKeyPath;
    v3->_inCarKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/maps/navigationInProgress"));
    navigationKeyPath = v3->_navigationKeyPath;
    v3->_navigationKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_DASInCarPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v9;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DDA0;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157848 != -1) {
    dispatch_once(&qword_100157848, block);
  }
  return (id)qword_100157850;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.incarpolicy.incar"])
  {
    uint64_t v8 = 4LL;
  }

  else
  {
    if (![v6 isEqualToString:@"com.apple.duetactivityscheduler.incarpolicy.nav"])
    {
      unsigned __int8 v10 = 0;
      goto LABEL_7;
    }

    uint64_t v8 = 5LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:(&self->super.isa)[v8]]);
  unsigned __int8 v10 = [v9 BOOLValue];

LABEL_7:
  return v10;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 2.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  inCarKeyPath = self->_inCarKeyPath;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:inCarKeyPath]);
  unsigned int v10 = [v9 BOOLValue];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:self->_navigationKeyPath]);
  unsigned int v12 = [v11 BOOLValue];

  if ((v10 & 1) != 0 || (v12 & 1) != 0)
  {
    unsigned int v14 = [v6 isIntensive];
    unsigned int v15 = [v6 requiresDeviceInactivity];
    v16 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"In Car Policy");
    if (v12)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"navigationInProgress == YES"));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v17);

      if (v14)
      {
LABEL_9:
        v20 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isIntensive == %u",  1LL);
LABEL_15:
        v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v25);

        uint64_t v26 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v16,  (double)0x384uLL));
LABEL_17:
        v13 = (void *)v26;

        goto LABEL_18;
      }

      if (v15)
      {
        v20 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requiresInactive == %u",  1LL);
        goto LABEL_15;
      }

      id v21 = [v6 schedulingPriority];
      double v18 = 0.1;
      if ((unint64_t)v21 < _DASSchedulingPriorityUtility)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
        [v22 timeIntervalSinceNow];
        double v24 = v23;

        if (v24 > 0.0)
        {
          v20 = +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"priority == %llu && timeUntilDeadline > 0",  [v6 schedulingPriority]);
          goto LABEL_15;
        }
      }
    }

    else
    {
      double v18 = 1.0;
      if (v10)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"inCar == YES"));
        -[_DASPolicyResponseRationale addRationaleWithCondition:](v16, "addRationaleWithCondition:", v19);

        double v18 = 0.5;
        if (v14) {
          goto LABEL_9;
        }
      }
    }

    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v16,  v18,  (double)0x384uLL));
    goto LABEL_17;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  0LL,  (double)0x384uLL));
LABEL_18:

  return v13;
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

- (_CDContextualKeyPath)inCarKeyPath
{
  return self->_inCarKeyPath;
}

- (void)setInCarKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)navigationKeyPath
{
  return self->_navigationKeyPath;
}

- (void)setNavigationKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
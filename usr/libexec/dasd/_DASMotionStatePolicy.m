@interface _DASMotionStatePolicy
+ (id)initializeTriggers;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASMotionStatePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASMotionStatePolicy

+ (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](&OBJC_CLASS____CDContextQueries, "keyPathForMotionState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.motionstatepolicy.motionstatechange";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121CC0;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASMotionStatePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASMotionStatePolicy;
  v2 = -[_DASMotionStatePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Motion State Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASMotionStatePolicy initializeTriggers](&OBJC_CLASS____DASMotionStatePolicy, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100041E98;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001578E8 != -1) {
    dispatch_once(&qword_1001578E8, block);
  }
  return (id)qword_1001578F0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 motionState];
  if (v4 == (id)_DASMotionStateAny)
  {
    id v5 = [v3 schedulingPriority];
    if ((unint64_t)v5 >= _DASSchedulingPriorityUserInitiated)
    {
      unsigned __int8 v6 = 0;
      goto LABEL_8;
    }

    if (([v3 requiresNetwork] & 1) == 0
      && ([v3 isIntensive] & 1) == 0)
    {
      unsigned __int8 v6 = [v3 requiresSignificantUserInactivity];
      goto LABEL_8;
    }
  }

  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](&OBJC_CLASS____CDContextQueries, "keyPathForMotionState"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  id v9 = [v8 integerValue];
  v10 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Motion State Policy");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"motionState = %@",  v11));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v12);

  id v13 = [v5 motionState];
  if (v13 != (id)_DASMotionStateAny)
  {
    if (v9 == [v5 motionState]) {
      uint64_t v21 = 0LL;
    }
    else {
      uint64_t v21 = 33LL;
    }
    double v20 = (double)0x384uLL;
    goto LABEL_15;
  }

  if (v9 == v13 || v9 == (id)_DASMotionStateStationary) {
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 startBefore]);
  [v14 timeIntervalSinceNow];
  double v16 = v15;

  if (v16 > 0.0
    && (([v5 isIntensive] & 1) != 0
     || [v5 requiresSignificantUserInactivity]))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 requiresSignificantUserInactivity]));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 isIntensive]));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requiresSignificantUserInactivity == %@ AND isIntensive == %@",  v17,  v18));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v19);

    double v20 = (double)0x384uLL;
    uint64_t v21 = 33LL;
LABEL_15:
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v21,  v10,  v20));
    goto LABEL_16;
  }

  if (![v5 requiresNetwork])
  {
LABEL_14:
    double v20 = (double)0x384uLL;
    uint64_t v21 = 0LL;
    goto LABEL_15;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requiresNetwork == YES"));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v22);

  uint64_t v23 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v10,  0.1,  (double)0x384uLL));
LABEL_16:
  v24 = (void *)v23;

  return v24;
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
@interface _DASCarPlayPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASCarPlayPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASCarPlayPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCarplayConnectedStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCarplayConnectedStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.carplaypolicy.carplayconnected";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121BD0;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASCarPlayPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASCarPlayPolicy;
  v2 = -[_DASCarPlayPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Carplay Connected Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASCarPlayPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100033F5C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157720 != -1) {
    dispatch_once(&qword_100157720, block);
  }
  return (id)qword_100157728;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.carplaypolicy.carplayconnected"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCarplayConnectedStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCarplayConnectedStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    unsigned __int8 v8 = [v7 BOOLValue];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCarplayConnectedStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCarplayConnectedStatus"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  unsigned int v9 = [v8 BOOLValue];

  v10 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Carplay Connected Policy");
  if (!v9) {
    goto LABEL_5;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"carplayConnected = %@",  v11));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v10, "addRationaleWithCondition:", v12);

  if (([v5 requiresDeviceInactivity] & 1) != 0
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](&OBJC_CLASS____DASThermalPolicy, "policyInstance")),
        unsigned int v14 = [v13 thermalPressureWithState:v6],
        v13,
        v14 >= 0x14))
  {
    uint64_t v15 = 33LL;
  }

  else
  {
LABEL_5:
    uint64_t v15 = 0LL;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v15,  v10,  (double)0x384uLL));

  return v16;
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
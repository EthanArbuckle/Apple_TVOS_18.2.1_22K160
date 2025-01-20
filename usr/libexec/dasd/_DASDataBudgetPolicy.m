@interface _DASDataBudgetPolicy
+ (BOOL)budget:(id)a3 isPositive:(id)a4;
+ (BOOL)budgetIsPositive:(id)a3;
+ (BOOL)isBudgetAvailable:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4 rationale:(id)a5;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASDataBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASDataBudgetPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"com.apple.duetactivityscheduler.databudgetpolicy.status";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121C00;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (_DASDataBudgetPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASDataBudgetPolicy;
  v2 = -[_DASDataBudgetPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Data Budget Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASDataBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157740 != -1) {
    dispatch_once(&qword_100157740, &stru_100115A60);
  }
  return (id)qword_100157748;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3 = a3;
  if ((uint64_t)+[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", v3) <= 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus"));
    BOOL v4 = +[_DASDataBudgetPolicy budget:isPositive:](&OBJC_CLASS____DASDataBudgetPolicy, "budget:isPositive:", v5, v3);
  }

  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus"));
  LOBYTE(a1) = [a1 budget:v5 isPositive:v4];

  return (char)a1;
}

+ (BOOL)budget:(id)a3 isPositive:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:a3]);
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(id)objc_opt_class(self) isBudgetAvailable:v4];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  id v6 = v5;
  if ((_DWORD)self) {
    [v5 removeConstraint:8 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
  else {
    [v5 addConstraint:8 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.databudgetpolicy.status"])
  {
    -[_DASDataBudgetPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);
    unsigned int v7 = !+[_DASDataBudgetPolicy budgetIsPositive:](&OBJC_CLASS____DASDataBudgetPolicy, "budgetIsPositive:", v6);
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 widgetID]);
  if (!v4 || (id v5 = [v3 schedulingPriority], (unint64_t)v5 >= _DASSchedulingPriorityUserInitiated))
  {
    if (![v3 requiresNetwork])
    {
      unsigned __int8 v6 = 0;
      goto LABEL_8;
    }

    if (([v3 budgeted] & 1) == 0)
    {
      unsigned __int8 v6 = [v3 dataBudgeted];
      goto LABEL_8;
    }
  }

  unsigned __int8 v6 = 1;
LABEL_8:

  return v6;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4 rationale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
    unsigned __int8 v12 = [v11 unsignedIntegerValue];

    if ((v12 & 1) != 0)
    {
      v13 = @"shouldOverrideBudget == YES";
      goto LABEL_7;
    }
  }

  if ([v7 deferred])
  {
    v13 = @"deferred == YES";
LABEL_7:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v13));
    [v9 addRationaleWithCondition:v15];

    BOOL v14 = 1;
    goto LABEL_8;
  }

  BOOL v14 = 0;
LABEL_8:

  return v14;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100034F9C;
  v18 = &unk_100115148;
  v19 = self;
  id v7 = a4;
  id v20 = v7;
  if (qword_100157750 != -1) {
    dispatch_once(&qword_100157750, &v15);
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus",  v15,  v16,  v17,  v18,  v19));
  id v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  if (-[_DASDataBudgetPolicy shouldIgnoreBudgetForActivity:withState:rationale:]( self,  "shouldIgnoreBudgetForActivity:withState:rationale:",  v6,  v7,  v9)
    || +[_DASDataBudgetPolicy budget:isPositive:](&OBJC_CLASS____DASDataBudgetPolicy, "budget:isPositive:", v8, v7))
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 key]);
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  v11,  1.0,  0.0);

    uint64_t v10 = 33LL;
  }

  uint64_t v12 = (uint64_t)+[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", v7);
  if (v12 >= 1)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"wifiQuality",  20.0,  (double)v12);
    uint64_t v10 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v10,  v9,  (double)0x384uLL));

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

- (void).cxx_destruct
{
}

@end
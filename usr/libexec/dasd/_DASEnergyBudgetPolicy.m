@interface _DASEnergyBudgetPolicy
+ (BOOL)budgetIsPositive:(id)a3;
+ (BOOL)isBudgetAvailable:(id)a3;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASEnergyBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
@end

@implementation _DASEnergyBudgetPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForEnergyBudgetRemainingStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v10[0] = @"identifier";
  v10[1] = @"predicate";
  v11[0] = @"com.apple.duetactivityscheduler.energybudgetpolicy.status";
  v11[1] = v3;
  v10[2] = @"deviceSet";
  v10[3] = @"mustWake";
  v11[2] = &off_100121C48;
  v11[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));
  v12[0] = v4;
  v8 = @"identifier";
  v9 = @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin";
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v12[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));

  return v6;
}

- (_DASEnergyBudgetPolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASEnergyBudgetPolicy;
  v2 = -[_DASEnergyBudgetPolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Energy Budget Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASEnergyBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;
  }

  return v3;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

+ (id)policyInstance
{
  if (qword_1001577E0 != -1) {
    dispatch_once(&qword_1001577E0, &stru_100115AD0);
  }
  return (id)qword_1001577E8;
}

+ (BOOL)isBudgetAvailable:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = +[_DASEnergyBudgetPolicy budgetIsPositive:](&OBJC_CLASS____DASEnergyBudgetPolicy, "budgetIsPositive:", v3);
  }

  return v7;
}

+ (BOOL)budgetIsPositive:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForEnergyBudgetRemainingStatus"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if (v5) {
    unsigned __int8 v6 = [v5 BOOLValue];
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
    [v5 removeConstraint:4 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
  else {
    [v5 addConstraint:4 forSchedulingPriority:_DASSchedulingPriorityMaintenance];
  }
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((([v6 isEqualToString:@"com.apple.duetactivityscheduler.energybudgetpolicy.status"] & 1) != 0 || objc_msgSend( v6,  "isEqualToString:",  @"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"))
    && ((-[_DASEnergyBudgetPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v7),
         unsigned int v8 = +[_DASEnergyBudgetPolicy budgetIsPositive:](&OBJC_CLASS____DASEnergyBudgetPolicy, "budgetIsPositive:", v7),
         v9 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForPluginStatus]( _CDContextQueries,  "keyPathForPluginStatus")),  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]),  unsigned int v11 = objc_msgSend(v10, "BOOLValue"),  v10,  v9,  !objc_msgSend( v6,  "isEqualToString:",  @"com.apple.duetactivityscheduler.energybudgetpolicy.status"))
     || !v8
     || v11))
  {
    unsigned int v12 = [v6 isEqualToString:@"com.apple.duetactivityscheduler.pluggedinpolicy.ispluggedin"] ^ 1 | v8 | v11 ^ 1;
  }

  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldIgnoreBudgetForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  BOOL v9 = 0;
  if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", a3))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    unsigned __int8 v8 = [v7 unsignedIntegerValue];

    if ((v8 & 2) != 0) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  v19 = sub_10003A8BC;
  v20 = &unk_100115148;
  v21 = self;
  id v7 = a4;
  id v22 = v7;
  if (qword_1001577F0 != -1) {
    dispatch_once(&qword_1001577F0, &v17);
  }
  unsigned __int8 v8 = objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale);
  BOOL v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( v8,  "initWithPolicyName:",  self->_policyName,  v17,  v18,  v19,  v20,  v21);
  if (+[_DASEnergyBudgetPolicy budgetIsPositive:](&OBJC_CLASS____DASEnergyBudgetPolicy, "budgetIsPositive:", v7)) {
    goto LABEL_6;
  }
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"energyBudget",  1.0,  0.0);
  if (-[_DASEnergyBudgetPolicy shouldIgnoreBudgetForActivity:withState:]( self,  "shouldIgnoreBudgetForActivity:withState:",  v6,  v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"shouldOverrideBudget == YES"));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v10);

LABEL_6:
    uint64_t v11 = 0LL;
    goto LABEL_8;
  }

  uint64_t v11 = 33LL;
LABEL_8:
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);
  unsigned int v14 = [v13 BOOLValue];

  if (v14)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"pluggedInStatus",  1.0,  1.0);
    uint64_t v11 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v11,  v9,  (double)0x384uLL));

  return v15;
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
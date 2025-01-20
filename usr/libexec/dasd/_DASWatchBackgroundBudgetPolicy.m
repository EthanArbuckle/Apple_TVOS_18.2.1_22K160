@interface _DASWatchBackgroundBudgetPolicy
+ (id)policyInstance;
- (BOOL)applicationForActivity:(id)a3 isDisallowedWithContext:(id)a4;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)sessionInProgress:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)ineligibleAppsKeyPath;
- (_CDContextualKeyPath)launchBudgetKeyPath;
- (_CDContextualKeyPath)queriesKeyPath;
- (_CDContextualKeyPath)sessionInProgressKeyPath;
- (_CDContextualKeyPath)snapshotBudgetKeyPath;
- (_DASWatchBackgroundBudgetPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setIneligibleAppsKeyPath:(id)a3;
- (void)setLaunchBudgetKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueriesKeyPath:(id)a3;
- (void)setSessionInProgressKeyPath:(id)a3;
- (void)setSnapshotBudgetKeyPath:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASWatchBackgroundBudgetPolicy

- (id)initializeTriggers
{
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_snapshotBudgetKeyPath));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_launchBudgetKeyPath));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_queriesKeyPath));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_sessionInProgressKeyPath));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_ineligibleAppsKeyPath));
  v23[0] = @"identifier";
  v23[1] = @"predicate";
  v24[0] = @"com.apple.duetactivityscheduler.backgroundbudget.snapshot";
  v24[1] = v14;
  v23[2] = @"deviceSet";
  v23[3] = @"mustWake";
  v24[2] = &off_100121DF8;
  v24[3] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  4LL));
  v25[0] = v12;
  v21[0] = @"identifier";
  v21[1] = @"predicate";
  v22[0] = @"com.apple.duetactivityscheduler.backgroundbudget.launch";
  v22[1] = v13;
  v21[2] = @"deviceSet";
  v21[3] = @"mustWake";
  v22[2] = &off_100121DF8;
  v22[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
  v25[1] = v3;
  v19[0] = @"identifier";
  v19[1] = @"predicate";
  v20[0] = @"/watch/launch/queries";
  v20[1] = v11;
  v19[2] = @"deviceSet";
  v19[3] = @"mustWake";
  v20[2] = &off_100121DF8;
  v20[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  v25[2] = v4;
  v17[0] = @"identifier";
  v17[1] = @"predicate";
  v18[0] = @"com.apple.duetactivityscheduler.session.inprogress";
  v18[1] = v9;
  v17[2] = @"deviceSet";
  v17[3] = @"mustWake";
  v18[2] = &off_100121DF8;
  v18[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  4LL));
  v25[3] = v5;
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.dasd.watch.ineligibleApps";
  v16[1] = v10;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100121DF8;
  v16[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  4LL));
  v25[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 5LL));

  return v7;
}

- (_DASWatchBackgroundBudgetPolicy)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____DASWatchBackgroundBudgetPolicy;
  v2 = -[_DASWatchBackgroundBudgetPolicy init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Watch Background Budget Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/watch/budget/snapshots"));
    snapshotBudgetKeyPath = v3->_snapshotBudgetKeyPath;
    v3->_snapshotBudgetKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/watch/budget/launches"));
    launchBudgetKeyPath = v3->_launchBudgetKeyPath;
    v3->_launchBudgetKeyPath = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/watch/launch/queries"));
    queriesKeyPath = v3->_queriesKeyPath;
    v3->_queriesKeyPath = (_CDContextualKeyPath *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/session/inProgress"));
    sessionInProgressKeyPath = v3->_sessionInProgressKeyPath;
    v3->_sessionInProgressKeyPath = (_CDContextualKeyPath *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/watch/launch/ineligibleApps"));
    ineligibleAppsKeyPath = v3->_ineligibleAppsKeyPath;
    v3->_ineligibleAppsKeyPath = (_CDContextualKeyPath *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[_DASWatchBackgroundBudgetPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v15;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004E3AC;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157A20 != -1) {
    dispatch_once(&qword_100157A20, block);
  }
  return (id)qword_100157A28;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.session.inprogress"])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBacklightOnStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForBacklightOnStatus"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
    unsigned __int8 v8 = [v7 BOOLValue];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:_DASBudgetDictionaryKey]);

  if (v5) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v3 requestsApplicationLaunch];
  }

  return v6;
}

- (BOOL)sessionInProgress:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:self->_sessionInProgressKeyPath]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)applicationForActivity:(id)a3 isDisallowedWithContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:self->_ineligibleAppsKeyPath]);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relatedApplications", 0));
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([v7 containsObject:*(void *)(*((void *)&v13 + 1) + 8 * (void)i)])
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Watch Background Budget Policy");
  unsigned int v9 = -[_DASWatchBackgroundBudgetPolicy applicationForActivity:isDisallowedWithContext:]( self,  "applicationForActivity:isDisallowedWithContext:",  v6,  v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
  uint64_t v11 = v10;
  if (!v9)
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:_DASBudgetDictionaryKey]);

    if ([v19 isEqualToString:@"/watch/launch/queries"])
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_queriesKeyPath]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v13]);
      unsigned int v22 = [v21 intValue];

      if (!v22)
      {
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"queriesBudgetValue",  1.0,  0.0);
        uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_launchBudgetKeyPath]);

        v20 = (void *)v23;
      }
    }

    else
    {
      if ([v19 isEqualToString:@"/watch/budget/snapshots"])
      {
        snapshotBudgetKeyPath = self->_snapshotBudgetKeyPath;
      }

      else
      {
        if (![v19 isEqualToString:@"/watch/budget/launches"])
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"budgetKey == nil"));
          -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v29);

          v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  v8,  (double)0x384uLL));
LABEL_15:

          goto LABEL_16;
        }

        snapshotBudgetKeyPath = self->_launchBudgetKeyPath;
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:snapshotBudgetKeyPath]);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v13]);
    int v26 = [v25 intValue];

    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"budgetValue",  1.0,  (double)v26);
    if (v26 <= 0) {
      uint64_t v27 = 33LL;
    }
    else {
      uint64_t v27 = 0LL;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v27,  v8,  (double)0x384uLL));

    goto LABEL_15;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByReplacingOccurrencesOfString:@"\n" withString:@","]);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is disallowed",  v13));
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  v14,  0.0,  1.0);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
  [v15 cancelActivities:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  100LL,  v8,  (double)0x384uLL));
LABEL_16:

  return v17;
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

- (_CDContextualKeyPath)snapshotBudgetKeyPath
{
  return self->_snapshotBudgetKeyPath;
}

- (void)setSnapshotBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)launchBudgetKeyPath
{
  return self->_launchBudgetKeyPath;
}

- (void)setLaunchBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)queriesKeyPath
{
  return self->_queriesKeyPath;
}

- (void)setQueriesKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)sessionInProgressKeyPath
{
  return self->_sessionInProgressKeyPath;
}

- (void)setSessionInProgressKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)ineligibleAppsKeyPath
{
  return self->_ineligibleAppsKeyPath;
}

- (void)setIneligibleAppsKeyPath:(id)a3
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
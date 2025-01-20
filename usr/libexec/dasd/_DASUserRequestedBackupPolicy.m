@interface _DASUserRequestedBackupPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)userRequestedBackup;
- (_DASUserRequestedBackupPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUserRequestedBackup:(id)a3;
@end

@implementation _DASUserRequestedBackupPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_userRequestedBackup));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.das.userRequestedBackup";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121DE0;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (_DASUserRequestedBackupPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASUserRequestedBackupPolicy;
  v2 = -[_DASUserRequestedBackupPolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"User Requested Backup Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath]( &OBJC_CLASS____DASUserRequestedBackupTaskManager,  "userRequestedBackupKeyPath"));
    userRequestedBackup = v3->_userRequestedBackup;
    v3->_userRequestedBackup = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASUserRequestedBackupPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157A00 != -1) {
    dispatch_once(&qword_100157A00, &stru_1001160B0);
  }
  return (id)qword_100157A08;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated)
  {
    unsigned __int8 v5 = 0;
  }

  else if ([v3 userRequestedBackupTask])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    unsigned __int8 v5 = [v3 requiresNetwork];
  }

  return v5;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  BOOL v9 = 1;
  if ([a3 isEqualToString:@"com.apple.das.userRequestedBackup"])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:self->_userRequestedBackup]);
    unsigned __int8 v8 = [v7 BOOLValue];

    if ((v8 & 1) != 0) {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (double)weightForActivity:(id)a3
{
  return 0.1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:self->_userRequestedBackup]);
  id v8 = [v7 BOOLValue];

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 backupTaskManager]);

  v11 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"User Requested Backup Policy");
  unsigned int v12 = [v6 userRequestedBackupTask];
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
    if (v13)
    {
    }

    else if (([v10 activityEligibleForRunning:v6] & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"eligibleForRunning == %@",  &__kCFBooleanFalse));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v11, "addRationaleWithCondition:", v17);

      uint64_t v16 = 33LL;
      goto LABEL_15;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"userRequestedBackup == %@",  v14));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v11, "addRationaleWithCondition:", v15);

  if ((_DWORD)v8)
  {
    if ((v12 & 1) != 0)
    {
      uint64_t v16 = 67LL;
    }

    else if ([v6 requiresNetwork])
    {
      uint64_t v16 = 67LL;
    }

    else
    {
      uint64_t v16 = 33LL;
    }
  }

  else if (v12)
  {
    uint64_t v16 = 33LL;
  }

  else
  {
    uint64_t v16 = 0LL;
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

- (_CDContextualKeyPath)userRequestedBackup
{
  return self->_userRequestedBackup;
}

- (void)setUserRequestedBackup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
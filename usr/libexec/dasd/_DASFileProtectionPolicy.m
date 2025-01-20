@interface _DASFileProtectionPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)deviceRecentlyLocked:(id)a3 since:(id)a4;
- (BOOL)isClassCLocked;
- (BOOL)passwordConfigured;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)handleUnlockQueue;
- (_DASFileProtectionPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)classCLockedToken;
- (void)setClassCLockedToken:(int)a3;
- (void)setHandleUnlockQueue:(id)a3;
- (void)setIsClassCLocked:(BOOL)a3;
- (void)setPasswordConfigured:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASFileProtectionPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDeviceLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDeviceLockStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForKeybagLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForKeybagLockStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v4));

  v12[0] = @"identifier";
  v12[1] = @"predicate";
  v13[0] = @"com.apple.das.fileprotectionpolicy.statuschanged";
  v13[1] = v3;
  v12[2] = @"deviceSet";
  v12[3] = @"mustWake";
  v13[2] = &off_100121C60;
  v13[3] = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  4LL));
  v14[0] = v6;
  v10[0] = @"identifier";
  v10[1] = @"predicate";
  v11[0] = @"com.apple.das.fileprotectionpolicy.kbstatuschanged";
  v11[1] = v5;
  v10[2] = @"deviceSet";
  v10[3] = @"mustWake";
  v11[2] = &off_100121C60;
  v11[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));

  return v8;
}

- (_DASFileProtectionPolicy)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____DASFileProtectionPolicy;
  v2 = -[_DASFileProtectionPolicy init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"File Protection Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[_DASFileProtectionPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.duetactivityscheduler.fileprotectionpolicy.queue", 0LL);
    handleUnlockQueue = v3->_handleUnlockQueue;
    v3->_handleUnlockQueue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v3->_handleUnlockQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003AC24;
    handler[3] = &unk_100115388;
    v10 = v3;
    v17 = v10;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v3->_classCLockedToken, v9, handler);
    v11 = (const __CFBoolean *)MGCopyAnswer(@"PasswordConfigured", 0LL);
    v13 = v11;
    if (v11) {
      CFRelease(v11);
    }
    BOOL v14 = kCFBooleanTrue == v13 && MKBDeviceUnlockedSinceBoot(v11, v12) == 0;
    v10->_isClassCLocked = v14;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003AD20;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001577F8 != -1) {
    dispatch_once(&qword_1001577F8, block);
  }
  return (id)qword_100157800;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)deviceRecentlyLocked:(id)a3 since:(id)a4
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDeviceLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDeviceLockStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);
  unsigned __int8 v7 = [v6 BOOLValue];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForKeybagLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForKeybagLockStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v8]);

  LOBYTE(v4) = [v9 BOOLValue];
  return v7 & (v4 ^ 1);
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (BOOL)appliesToActivity:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 fileProtection]);
  unsigned __int8 v4 = [v3 indicatesProtection];

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL isClassCLocked = self->_isClassCLocked;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForKeybagLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForKeybagLockStatus"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
  id v11 = [v10 BOOLValue];

  uint64_t v12 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"File Protection Policy");
  if ((_DWORD)v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
    unsigned int v15 = [v13 isEqual:v14];

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
      objc_super v18 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"classALocked == %@ && activityFileProtection == %@",  v16,  v17);
LABEL_7:
      v22 = (void *)objc_claimAutoreleasedReturnValue(v18);
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v12, "addRationaleWithCondition:", v22);
      goto LABEL_8;
    }
  }

  if (isClassCLocked)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUntilFirstUserAuthentication]( &OBJC_CLASS____DASFileProtection,  "completeUntilFirstUserAuthentication"));
    unsigned int v21 = [v19 isEqual:v20];

    if (v21)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
      objc_super v18 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"classCLocked == %@ && activityFileProtection == %@",  v16,  v17);
      goto LABEL_7;
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](&OBJC_CLASS____DASFileProtection, "completeUnlessOpen"));
  unsigned int v27 = [v25 isEqual:v26];

  if (!v27)
  {
    uint64_t v23 = 0LL;
    v24 = 0LL;
    goto LABEL_15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if (-[_DASFileProtectionPolicy deviceRecentlyLocked:since:](self, "deviceRecentlyLocked:since:", v7, v16)
    || (v28 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]), v28, v28)
    || (v11 & 1) == 0 && ([v6 overdueAtDate:v16] & 1) != 0)
  {
    uint64_t v23 = 0LL;
    v24 = 0LL;
    goto LABEL_13;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
  [v31 timeIntervalSinceDate:v16];
  double v33 = v32;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 fileProtection]);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v33));
  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"classALocked == %@ && activityFileProtection == %@ && timeUntilDeadline == %@",  v17,  v22,  v34));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v12, "addRationaleWithCondition:", v35);

LABEL_8:
  uint64_t v23 = 100LL;
  v24 = v12;
LABEL_13:

LABEL_15:
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v23,  v24,  (double)0x384uLL));

  return v29;
}

- (BOOL)isClassCLocked
{
  return self->_isClassCLocked;
}

- (void)setIsClassCLocked:(BOOL)a3
{
  self->_BOOL isClassCLocked = a3;
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

- (BOOL)passwordConfigured
{
  return self->_passwordConfigured;
}

- (void)setPasswordConfigured:(BOOL)a3
{
  self->_passwordConfigured = a3;
}

- (int)classCLockedToken
{
  return self->_classCLockedToken;
}

- (void)setClassCLockedToken:(int)a3
{
  self->_classCLockedToken = a3;
}

- (OS_dispatch_queue)handleUnlockQueue
{
  return self->_handleUnlockQueue;
}

- (void)setHandleUnlockQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
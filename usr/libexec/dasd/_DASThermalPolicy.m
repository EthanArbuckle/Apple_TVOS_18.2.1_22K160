@interface _DASThermalPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isRestoreInProgressWithContext:(id)a3;
- (BOOL)shouldIgnoreThermalsForActivity:(id)a3 withState:(id)a4;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)thermalPressureLevelKeyPath;
- (_DASThermalPolicy)init;
- (_DASTrialManager)trialManager;
- (double)getScoreForThermalLevel:(int)a3;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int)levelFromTrialLevel:(unsigned int)a3;
- (int)maintenanceInUseMax;
- (int)maintenanceMax;
- (int)maintenanceNWMax;
- (int)maintenanceSignificantInactivityMax;
- (int)maxAllowableThermalPressureForActivity:(id)a3 restoreInProgress:(BOOL)a4 deviceInUse:(BOOL)a5;
- (int)thermalPressureWithState:(id)a3;
- (int)utilityInUseMax;
- (int)utilityMax;
- (int)utilitySignificantInactivityMax;
- (int64_t)getReasonForThermalLevel:(int)a3;
- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4;
- (void)setMaintenanceInUseMax:(int)a3;
- (void)setMaintenanceMax:(int)a3;
- (void)setMaintenanceNWMax:(int)a3;
- (void)setMaintenanceSignificantInactivityMax:(int)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setThermalPressureLevelKeyPath:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUtilityInUseMax:(int)a3;
- (void)setUtilityMax:(int)a3;
- (void)setUtilitySignificantInactivityMax:(int)a3;
- (void)updateSystemConstraintsWithContext:(id)a3;
- (void)updateTrialParameters;
@end

@implementation _DASThermalPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_thermalPressureLevelKeyPath));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121D50;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (_DASThermalPolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASThermalPolicy;
  v2 = -[_DASThermalPolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Thermal Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForThermalPressureLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForThermalPressureLevel"));
    thermalPressureLevelKeyPath = v3->_thermalPressureLevelKeyPath;
    v3->_thermalPressureLevelKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASThermalPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_DASTrialManager sharedInstanceForNamespace:]( &OBJC_CLASS____DASTrialManager,  "sharedInstanceForNamespace:",  @"COREOS_DAS"));
    trialManager = v3->_trialManager;
    v3->_trialManager = (_DASTrialManager *)v9;

    -[_DASTrialManager addDelegate:](v3->_trialManager, "addDelegate:", v3);
    -[_DASThermalPolicy updateTrialParameters](v3, "updateTrialParameters");
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157980 != -1) {
    dispatch_once(&qword_100157980, &stru_100115F40);
  }
  return (id)qword_100157988;
}

- (int)levelFromTrialLevel:(unsigned int)a3
{
  return a3;
}

- (void)dasTrialManager:(id)a3 hasUpdatedParametersForNamespace:(id)a4
{
}

- (void)updateTrialParameters
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalUtilityMaxAllowable"));
  id v4 = [v3 longValue];

  self->_int utilityMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v4);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int utilityMax = self->_utilityMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalUtilityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilityMax;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalUtilityInUseMaxAllowable"));
  id v8 = [v7 longValue];

  self->_int utilityInUseMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v8);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int utilityInUseMax = self->_utilityInUseMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalUtilityInUseMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilityInUseMax;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalUtilityInactivityMaxAllowable"));
  id v12 = [v11 longValue];

  self->_int utilitySignificantInactivityMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v12);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int utilitySignificantInactivityMax = self->_utilitySignificantInactivityMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalUtilityInactivityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = utilitySignificantInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalMaintenanceMaxAllowable"));
  id v16 = [v15 longValue];

  self->_int maintenanceMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v16);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceMax = self->_maintenanceMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalMaintenanceMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceMax;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalMaintenanceInUseMaxAllowable"));
  id v20 = [v19 longValue];

  self->_int maintenanceInUseMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v20);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceInUseMax = self->_maintenanceInUseMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalMaintenanceInUseMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceInUseMax;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalMaintenanceInactivityMaxAllowable"));
  id v24 = [v23 longValue];

  self->_int maintenanceSignificantInactivityMax = -[_DASThermalPolicy levelFromTrialLevel:]( self,  "levelFromTrialLevel:",  v24);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceSignificantInactivityMax = self->_maintenanceSignificantInactivityMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalMaintenanceInactivityMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceSignificantInactivityMax;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"PolicyThermalMaintenanceNetworkMaxAllowable"));
  id v28 = [v27 longValue];

  self->_int maintenanceNWMax = -[_DASThermalPolicy levelFromTrialLevel:](self, "levelFromTrialLevel:", v28);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"trial"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    int maintenanceNWMax = self->_maintenanceNWMax;
    int v31 = 138412546;
    v32 = @"PolicyThermalMaintenanceNetworkMaxAllowable";
    __int16 v33 = 1024;
    int v34 = maintenanceNWMax;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ is %u", (uint8_t *)&v31, 0x12u);
  }
}

- (void)updateSystemConstraintsWithContext:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath]);
  unsigned int v4 = [v3 unsignedIntValue];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  v6 = v5;
  if (!v4)
  {
    [v5 removeConstraint:2 forSchedulingPriority:_DASSchedulingPriorityUtility];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    uint64_t v8 = _DASSchedulingPriorityMaintenance;
    id v9 = v7;
    goto LABEL_5;
  }

  [v5 addConstraint:2 forSchedulingPriority:_DASSchedulingPriorityMaintenance];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  uint64_t v8 = _DASSchedulingPriorityUtility;
  id v9 = v7;
  if (v4 < 0x15)
  {
LABEL_5:
    [v7 removeConstraint:2 forSchedulingPriority:v8];
    goto LABEL_6;
  }

  [v7 addConstraint:2 forSchedulingPriority:_DASSchedulingPriorityUtility];
LABEL_6:
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange"])
  {
    -[_DASThermalPolicy updateSystemConstraintsWithContext:](self, "updateSystemConstraintsWithContext:", v6);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath]);
    unsigned int v8 = [v7 unsignedIntValue];

    BOOL v9 = v8 != 0;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldIgnoreThermalsForActivity:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if (!+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", a3)) {
    goto LABEL_5;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosBudgetOverride]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosBudgetOverride"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  unsigned __int16 v9 = (unsigned __int16)[v8 unsignedIntegerValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath]);
  unsigned int v11 = [v10 unsignedIntValue];

  if ((v9 & 0x800) == 0) {
    goto LABEL_5;
  }
  if (v11 < 0x15) {
    BOOL v12 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v12 = 0;

  return v12;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (double)getScoreForThermalLevel:(int)a3
{
  double result = 1.0;
  if (a3 <= 29)
  {
    if (a3 == 10)
    {
      return 0.6;
    }

    else if (a3 == 20)
    {
      return 0.2;
    }
  }

  else if (a3 == 30)
  {
    return 0.1;
  }

  else if (a3 == 40 || a3 == 50)
  {
    return 0.0;
  }

  return result;
}

- (int64_t)getReasonForThermalLevel:(int)a3
{
  int64_t result = 1LL;
  if (a3 <= 29)
  {
    int64_t v4 = 4LL;
    if (a3 != 20) {
      int64_t v4 = 1LL;
    }
    if (a3 == 10) {
      return 2LL;
    }
    else {
      return v4;
    }
  }

  else if (a3 == 30)
  {
    return 8LL;
  }

  else if (a3 == 40 || a3 == 50)
  {
    return 16LL;
  }

  return result;
}

- (int)maxAllowableThermalPressureForActivity:(id)a3 restoreInProgress:(BOOL)a4 deviceInUse:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [v7 schedulingPriority];
  if ((unint64_t)v8 >= _DASSchedulingPriorityUserInitiated)
  {
    int v11 = 30;
  }

  else
  {
    id v9 = [v7 schedulingPriority];
    if ((unint64_t)v9 >= _DASSchedulingPriorityUtility)
    {
      if (v5)
      {
        uint64_t v10 = 12LL;
        goto LABEL_13;
      }

      int v11 = 20;
    }

    else
    {
      if ([v7 requiresNetwork])
      {
        uint64_t v10 = 32LL;
LABEL_13:
        int v11 = *(_DWORD *)((char *)&self->super.isa + v10);
        goto LABEL_14;
      }

      if (([v7 triggersRestart] & 1) == 0)
      {
        uint64_t v10 = 20LL;
        if (v5) {
          uint64_t v10 = 24LL;
        }
        goto LABEL_13;
      }

      int v11 = 10;
    }
  }

- (BOOL)isRestoreInProgressWithContext:(id)a3
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047E34;
  block[3] = &unk_100115148;
  block[4] = self;
  id v7 = a4;
  id v24 = v7;
  if (qword_100157990 != -1) {
    dispatch_once(&qword_100157990, block);
  }
  id v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  BOOL v9 = -[_DASThermalPolicy isRestoreInProgressWithContext:](self, "isRestoreInProgressWithContext:", v7);
  unsigned int v10 = -[_DASThermalPolicy maxAllowableThermalPressureForActivity:restoreInProgress:deviceInUse:]( self,  "maxAllowableThermalPressureForActivity:restoreInProgress:deviceInUse:",  v6,  v9,  +[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7));
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath]);
  id v12 = [v11 unsignedIntValue];

  -[_DASPolicyResponseRationale setResponseOptions:]( v8,  "setResponseOptions:",  -[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | -[_DASThermalPolicy getReasonForThermalLevel:]( self,  "getReasonForThermalLevel:",  v12));
  if (v12 <= v10)
  {
    -[_DASThermalPolicy getScoreForThermalLevel:](self, "getScoreForThermalLevel:", v12);
    if (v16 > 0.0)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v8));
LABEL_13:
      v21 = (void *)v17;
      goto LABEL_14;
    }

    uint64_t v15 = 100LL;
    double v14 = (double)0x384uLL;
LABEL_12:
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v15,  v8,  v14));
    goto LABEL_13;
  }

  if (-[_DASThermalPolicy shouldIgnoreThermalsForActivity:withState:]( self,  "shouldIgnoreThermalsForActivity:withState:",  v6,  v7))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"shouldOverrideModerateThermals == YES"));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v13);

    double v14 = (double)0x384uLL;
    uint64_t v15 = 67LL;
    goto LABEL_12;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"thermalLevel > %ld",  v10));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v18);
  if (v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"restoreInProgress == %@",  v19));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v20);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  100LL,  v8,  (double)0x384uLL));

LABEL_14:
  return v21;
}

- (int)thermalPressureWithState:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:self->_thermalPressureLevelKeyPath]);
  int v4 = [v3 unsignedIntValue];

  return v4;
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

- (_CDContextualKeyPath)thermalPressureLevelKeyPath
{
  return self->_thermalPressureLevelKeyPath;
}

- (void)setThermalPressureLevelKeyPath:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (int)utilityMax
{
  return self->_utilityMax;
}

- (void)setUtilityMax:(int)a3
{
  self->_int utilityMax = a3;
}

- (int)utilityInUseMax
{
  return self->_utilityInUseMax;
}

- (void)setUtilityInUseMax:(int)a3
{
  self->_int utilityInUseMax = a3;
}

- (int)utilitySignificantInactivityMax
{
  return self->_utilitySignificantInactivityMax;
}

- (void)setUtilitySignificantInactivityMax:(int)a3
{
  self->_int utilitySignificantInactivityMax = a3;
}

- (int)maintenanceMax
{
  return self->_maintenanceMax;
}

- (void)setMaintenanceMax:(int)a3
{
  self->_int maintenanceMax = a3;
}

- (int)maintenanceInUseMax
{
  return self->_maintenanceInUseMax;
}

- (void)setMaintenanceInUseMax:(int)a3
{
  self->_int maintenanceInUseMax = a3;
}

- (int)maintenanceSignificantInactivityMax
{
  return self->_maintenanceSignificantInactivityMax;
}

- (void)setMaintenanceSignificantInactivityMax:(int)a3
{
  self->_int maintenanceSignificantInactivityMax = a3;
}

- (int)maintenanceNWMax
{
  return self->_maintenanceNWMax;
}

- (void)setMaintenanceNWMax:(int)a3
{
  self->_int maintenanceNWMax = a3;
}

- (void).cxx_destruct
{
}

@end
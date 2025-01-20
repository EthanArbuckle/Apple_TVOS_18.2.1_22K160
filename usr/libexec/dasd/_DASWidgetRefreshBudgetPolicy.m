@interface _DASWidgetRefreshBudgetPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)overrideListWidgets;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_os_log)log;
- (_CDContextualKeyPath)widgetOverrideKeypath;
- (_DASBudgetManager)budgetManager;
- (_DASWidgetRefreshBudgetPolicy)init;
- (double)baselineScoreForActivity:(id)a3;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setBudgetManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setOverrideListWidgets:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWidgetOverrideKeypath:(id)a3;
@end

@implementation _DASWidgetRefreshBudgetPolicy

- (_DASWidgetRefreshBudgetPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____DASWidgetRefreshBudgetPolicy;
  v2 = -[_DASWidgetRefreshBudgetPolicy init](&v16, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](&OBJC_CLASS____DASBudgetManager, "sharedInstance"));
    budgetManager = v2->_budgetManager;
    v2->_budgetManager = (_DASBudgetManager *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  kDASWidgetOverrideKeyPath));
    widgetOverrideKeypath = v2->_widgetOverrideKeypath;
    v2->_widgetOverrideKeypath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASWidgetRefreshBudgetPolicy initializeTriggers](v2, "initializeTriggers"));
    triggers = v2->_triggers;
    v2->_triggers = (NSArray *)v7;

    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Widget Refresh Policy";

    v10 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.widgetRefreshBudgets");
    -[NSUserDefaults doubleForKey:](v10, "doubleForKey:", @"usageDelay");
    if (v11 > 1.0) {
      qword_1001574A0 = *(void *)&v11;
    }
    -[NSUserDefaults doubleForKey:](v10, "doubleForKey:", @"infrequentCadence");
    if (v12 > 1.0) {
      qword_1001574A8 = *(void *)&v12;
    }
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"widgetRefreshPolicy"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v13;
  }

  return v2;
}

- (BOOL)appliesToActivity:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 widgetBudgetID]);

  return v3 != 0LL;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B03C4;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157DD8 != -1) {
    dispatch_once(&qword_100157DD8, block);
  }
  return (id)qword_100157DE0;
}

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_widgetOverrideKeypath));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.widget.overridelist";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_1001223E0;
  v7[3] = &__kCFBooleanTrue;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Widget Refresh Policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);
  unsigned __int8 v12 = [v11 unsignedLongLongValue];

  if ((v12 & 0xD) != 0)
  {
LABEL_6:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudgetManager widgetRefreshBudgetManager](self->_budgetManager, "widgetRefreshBudgetManager"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 widgetBudgetID]);
    [v24 balanceForWidgetBudgetID:v25];
    double v27 = v26;

    if (v27 == -INFINITY)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"IndividualBalance=%d",  0x80000000LL));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v28);

      v23 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v9,  (double)0x384uLL));
      goto LABEL_17;
    }

    LODWORD(v4) = vcvtmd_s64_f64(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:self->_widgetOverrideKeypath]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v7 widgetBudgetID]);
    unsigned int v31 = [v29 containsObject:v30];

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"onOverrideList=%d",  1LL));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v32);
    }

    if ((int)v4 < 1)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForPluginStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForPluginStatus"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v34]);
      unsigned int v36 = [v35 BOOLValue];

      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"IndividualBalance=%d",  v4));
      -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v37);

      uint64_t v38 = 33LL;
      if (!v36 || (_DWORD)v4) {
        goto LABEL_16;
      }
      v33 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isPluggedIn=%d",  1LL);
    }

    else
    {
      v33 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"IndividualBalance=%d",  v4);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(v33);
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v39);

    uint64_t v38 = 0LL;
LABEL_16:
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v38,  v9,  (double)0x384uLL));

    goto LABEL_17;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](&OBJC_CLASS____CDContextQueries, "keyPathForLastUseDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v15 timeIntervalSinceDate:v14];
  double v17 = v16;
  if (v16 <= *(double *)&qword_1001574A0
    || (v18 = (void *)objc_claimAutoreleasedReturnValue([v7 startAfter]),
        [v15 timeIntervalSinceDate:v18],
        double v20 = v19,
        double v21 = *(double *)&qword_1001574A8,
        v18,
        v20 >= v21))
  {

    goto LABEL_6;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"timeSinceRecentUsage=%d",  ((int)v17 / 60)));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v9,  (double)0x384uLL));
LABEL_17:

  return v23;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  unsigned int v5 = objc_msgSend( a3,  "isEqualToString:",  @"com.apple.duetactivityscheduler.widget.overridelist",  a4);
  if (v5) {
    -[_DASBudgetManager reinstantiateConfiguredBudgets](self->_budgetManager, "reinstantiateConfiguredBudgets");
  }
  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (double)baselineScoreForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 0;
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
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

- (NSArray)overrideListWidgets
{
  return self->_overrideListWidgets;
}

- (void)setOverrideListWidgets:(id)a3
{
}

- (_CDContextualKeyPath)widgetOverrideKeypath
{
  return self->_widgetOverrideKeypath;
}

- (void)setWidgetOverrideKeypath:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
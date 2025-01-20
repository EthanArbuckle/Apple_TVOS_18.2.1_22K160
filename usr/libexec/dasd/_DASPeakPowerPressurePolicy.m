@interface _DASPeakPowerPressurePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)isUnderPeakPowerPressureWithContext:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)peakPowerPressureKeyPath;
- (_DASPeakPowerPressurePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPeakPowerPressureKeyPath:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASPeakPowerPressurePolicy

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A024;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157B38 != -1) {
    dispatch_once(&qword_100157B38, block);
  }
  return (id)qword_100157B40;
}

- (_DASPeakPowerPressurePolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____DASPeakPowerPressurePolicy;
  v2 = -[_DASPeakPowerPressurePolicy init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Peak Power Pressure Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/system/peakPowerPressureLevel"));
    peakPowerPressureKeyPath = v3->_peakPowerPressureKeyPath;
    v3->_peakPowerPressureKeyPath = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASPeakPowerPressurePolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;
  }

  return v3;
}

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_peakPowerPressureKeyPath));
  v6[0] = @"identifier";
  v6[1] = @"predicate";
  v7[0] = @"com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange";
  v7[1] = v2;
  v6[2] = @"deviceSet";
  v6[3] = @"mustWake";
  v7[2] = &off_100121EB8;
  v7[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  4LL));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));

  return v4;
}

- (BOOL)isUnderPeakPowerPressureWithContext:(id)a3
{
  return 0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"com.apple.duetactivityscheduler.peakpowerpressurepolicy.peakpowerpressurechange"]) {
    BOOL v7 = -[_DASPeakPowerPressurePolicy isUnderPeakPowerPressureWithContext:]( self,  "isUnderPeakPowerPressureWithContext:",  v6);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:_DASCTSBypassPeakPowerPressureKey]);
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) != 0)
  {
    BOOL v7 = 0;
  }

  else
  {
    id v8 = [v3 schedulingPriority];
    BOOL v7 = (unint64_t)v8 < _DASSchedulingPriorityUserInitiated;
  }

  return v7;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Peak Power Pressure Policy");
  LODWORD(self) = -[_DASPeakPowerPressurePolicy isUnderPeakPowerPressureWithContext:]( self,  "isUnderPeakPowerPressureWithContext:",  v5);

  if ((_DWORD)self)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"peakPowerPressure == %@",  &__kCFBooleanTrue));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v6, "addRationaleWithCondition:", v7);

    uint64_t v8 = 100LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v8,  v6,  (double)0x384uLL));

  return v9;
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

- (_CDContextualKeyPath)peakPowerPressureKeyPath
{
  return self->_peakPowerPressureKeyPath;
}

- (void)setPeakPowerPressureKeyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
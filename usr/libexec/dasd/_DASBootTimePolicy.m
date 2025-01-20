@interface _DASBootTimePolicy
+ (id)getDeviceBootTime;
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)didExceedMinDurationAfterBoot;
- (BOOL)didExceedMinDurationAfterBootNetworkActivites;
- (BOOL)didExceedMinDurationAfterBootNonRepeatingNonDiscretionary;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)bootTime;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASBootTimePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setBootTime:(id)a3;
- (void)setDidExceedMinDurationAfterBoot:(BOOL)a3;
- (void)setDidExceedMinDurationAfterBootNetworkActivites:(BOOL)a3;
- (void)setDidExceedMinDurationAfterBootNonRepeatingNonDiscretionary:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASBootTimePolicy

- (_DASBootTimePolicy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASBootTimePolicy;
  v2 = -[_DASBootTimePolicy init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Boot Time Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](&OBJC_CLASS____DASBootTimePolicy, "getDeviceBootTime"));
    bootTime = v3->_bootTime;
    v3->_bootTime = (NSDate *)v5;

    *(_WORD *)&v3->_didExceedMinDurationAfterBoot = 0;
    v3->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = 0;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_1001576B8 != -1) {
    dispatch_once(&qword_1001576B8, &stru_100115950);
  }
  return (id)qword_1001576C0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fastPass]);
  if (v4)
  {
    BOOL v5 = 0;
  }

  else
  {
    id v6 = [v3 schedulingPriority];
    BOOL v5 = (unint64_t)v6 < _DASSchedulingPriorityUserInitiated;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

+ (id)getDeviceBootTime
{
  v2 = (void *)qword_1001576C8;
  if (!qword_1001576C8)
  {
    *(void *)v9 = 0x1500000001LL;
    size_t v8 = 16LL;
    if (sysctl(v9, 2u, &v6, &v8, 0LL, 0LL) != -1)
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v7 / 1000000.0 + (double)v6));
      v4 = (void *)qword_1001576C8;
      qword_1001576C8 = v3;
    }

    v2 = (void *)qword_1001576C8;
  }

  return v2;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  if (!self->_bootTime)
  {
    int v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](&OBJC_CLASS____DASBootTimePolicy, "getDeviceBootTime"));
    bootTime = self->_bootTime;
    self->_bootTime = v7;
  }

  id v9 = [v5 schedulingPriority];
  if ((unint64_t)v9 >= _DASSchedulingPriorityUtility)
  {
    [v5 interval];
    BOOL v10 = v11 == 0.0;
  }

  else
  {
    BOOL v10 = 0;
  }

  unsigned int v12 = [v5 requiresNetwork];
  if (self->_bootTime)
  {
    if (!self->_didExceedMinDurationAfterBoot)
    {
      unsigned int v16 = v12;
      if ((!v12 || !self->_didExceedMinDurationAfterBootNetworkActivites)
        && (!v10 || !self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v17 timeIntervalSinceDate:self->_bootTime];
        double v19 = v18;

        if (v19 >= -15.0) {
          double v20 = v19;
        }
        else {
          double v20 = 301.0;
        }
        double v21 = 120.0;
        if (!v16) {
          double v21 = 300.0;
        }
        if (v10) {
          double v21 = 15.0;
        }
        if (v20 <= 300.0)
        {
          if (v20 > 120.0) {
            char v22 = v16;
          }
          else {
            char v22 = 0;
          }
          if ((v22 & 1) == 0)
          {
            if (v20 <= 15.0 || !v10)
            {
              uint64_t v13 = 33LL;
              goto LABEL_29;
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

- (NSDate)bootTime
{
  return self->_bootTime;
}

- (void)setBootTime:(id)a3
{
}

- (BOOL)didExceedMinDurationAfterBoot
{
  return self->_didExceedMinDurationAfterBoot;
}

- (void)setDidExceedMinDurationAfterBoot:(BOOL)a3
{
  self->_didExceedMinDurationAfterBoot = a3;
}

- (BOOL)didExceedMinDurationAfterBootNetworkActivites
{
  return self->_didExceedMinDurationAfterBootNetworkActivites;
}

- (void)setDidExceedMinDurationAfterBootNetworkActivites:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNetworkActivites = a3;
}

- (BOOL)didExceedMinDurationAfterBootNonRepeatingNonDiscretionary
{
  return self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary;
}

- (void)setDidExceedMinDurationAfterBootNonRepeatingNonDiscretionary:(BOOL)a3
{
  self->_didExceedMinDurationAfterBootNonRepeatingNonDiscretionary = a3;
}

- (void).cxx_destruct
{
}

@end
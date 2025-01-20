@interface _DASUrgencyOverridePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)urgentActivities;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASUrgencyOverridePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)rationaleWithUrgencyOverride:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)makeDecisionBasedOnUrgencyOverride:(id)a3;
- (os_unfair_lock_s)lock;
- (void)addActivity:(id)a3 urgencyLevel:(int64_t)a4;
- (void)removeActivity:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setUrgentActivities:(id)a3;
@end

@implementation _DASUrgencyOverridePolicy

- (_DASUrgencyOverridePolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASUrgencyOverridePolicy;
  v2 = -[_DASUrgencyOverridePolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Urgency Override Policy";

    v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](v5, "dictionaryForKey:", @"urgentActivities"));
    v7 = (NSMutableDictionary *)[v6 mutableCopy];
    urgentActivities = v3->_urgentActivities;
    v3->_urgentActivities = v7;

    if (!v3->_urgentActivities)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v10 = v3->_urgentActivities;
      v3->_urgentActivities = v9;
    }

    v3->_lock._os_unfair_lock_opaque = 0;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D21C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157828 != -1) {
    dispatch_once(&qword_100157828, block);
  }
  return (id)qword_100157830;
}

- (void)addActivity:(id)a3 urgencyLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"UrgencyOverride"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Adding %@ to _urgentActivities",  (uint8_t *)&v11,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setValue:forKey:](urgentActivities, "setValue:forKey:", v9, v6);

  os_unfair_lock_unlock(&self->_lock);
  v10 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  -[NSUserDefaults setObject:forKey:](v10, "setObject:forKey:", self->_urgentActivities, @"urgentActivities");
}

- (void)removeActivity:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"UrgencyOverride"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing %@ from _urgentActivities",  (uint8_t *)&v7,  0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_urgentActivities, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
  id v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
  -[NSUserDefaults setObject:forKey:](v6, "setObject:forKey:", self->_urgentActivities, @"urgentActivities");
}

- (BOOL)appliesToActivity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](urgentActivities, "objectForKey:", v7));
  LOBYTE(urgentActivities) = v8 != 0LL;

  os_unfair_lock_unlock(p_lock);
  return (char)urgentActivities;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5 = a3;
  int64_t v6 = -[_DASUrgencyOverridePolicy makeDecisionBasedOnUrgencyOverride:](self, "makeDecisionBasedOnUrgencyOverride:", v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASUrgencyOverridePolicy rationaleWithUrgencyOverride:](self, "rationaleWithUrgencyOverride:", v5));

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v6,  v7,  (double)0x384uLL));
  return v8;
}

- (int64_t)makeDecisionBasedOnUrgencyOverride:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](urgentActivities, "valueForKey:", v7));
  os_unfair_lock_unlock(p_lock);
  if ([v8 intValue] == 2)
  {
    int64_t v9 = 200LL;
  }

  else if ([v8 intValue] == 1)
  {
    int64_t v9 = 67LL;
  }

  else
  {
    int64_t v9 = 0LL;
  }

  return v9;
}

- (id)rationaleWithUrgencyOverride:(id)a3
{
  id v4 = a3;
  id v5 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Urgency Override Policy");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);

  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](urgentActivities, "valueForKey:", v8));
  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"urgencylevel == %@",  v9));
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v5,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  v10,  1.0,  1.0);

  return v5;
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)urgentActivities
{
  return self->_urgentActivities;
}

- (void)setUrgentActivities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
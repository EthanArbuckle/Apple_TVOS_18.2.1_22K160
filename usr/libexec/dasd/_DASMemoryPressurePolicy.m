@interface _DASMemoryPressurePolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (_DASMemoryPressurePolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)currentMemoryPressure;
- (int64_t)memoryPressureLevelWithContext:(id)a3;
- (int64_t)systemMemoryPressure;
- (void)setCurrentMemoryPressure:(int64_t)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASMemoryPressurePolicy

- (_DASMemoryPressurePolicy)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____DASMemoryPressurePolicy;
  v2 = -[_DASMemoryPressurePolicy init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Memory Pressure Policy";

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.memoryPressure", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3->_queue);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v9;

    dispatch_set_qos_class_fallback(v3->_timer, 17LL);
    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0LL, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v11 = (dispatch_source_s *)v3->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003E2F8;
    handler[3] = &unk_1001150D0;
    v14 = v3;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)v3->_timer);
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157858 != -1) {
    dispatch_once(&qword_100157858, &stru_100115D10);
  }
  return (id)qword_100157860;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  else {
    unsigned int v5 = [v3 triggersRestart] ^ 1;
  }

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (int64_t)systemMemoryPressure
{
  int64_t v4 = 1LL;
  size_t v3 = 8LL;
  sysctlbyname("kern.memorystatus_vm_pressure_level", &v4, &v3, 0LL, 0LL);
  return v4;
}

- (int64_t)memoryPressureLevelWithContext:(id)a3
{
  return self->_currentMemoryPressure;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[_DASMemoryPressurePolicy memoryPressureLevelWithContext:](self, "memoryPressureLevelWithContext:", v7);
  dispatch_source_t v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Memory Pressure Policy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
  [v11 timeIntervalSinceDate:v10];
  double v13 = v12;

  if (v13 < 0.0)
  {
    unsigned int v14 = +[_DASSystemContext isPluggedIn:](&OBJC_CLASS____DASSystemContext, "isPluggedIn:", v7);
    unsigned __int8 v15 = +[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7);
    if (v14)
    {
      if ((v15 & 1) == 0)
      {
        id v16 = [v6 schedulingPriority];
        double v17 = 2.0;
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v9,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"memoryPressure",  v17,  (double)v8);
        if ((v8 & 4) == 0
          || (id v25 = [v6 schedulingPriority], (unint64_t)v25 > _DASSchedulingPriorityBackground)
          || v13 <= -86400.0)
        {
          double v18 = (double)0x384uLL;
          uint64_t v19 = 0LL;
LABEL_21:
          uint64_t v24 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v19,  v9,  v18));
          goto LABEL_22;
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

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)currentMemoryPressure
{
  return self->_currentMemoryPressure;
}

- (void)setCurrentMemoryPressure:(int64_t)a3
{
  self->_currentMemoryPressure = a3;
}

- (void).cxx_destruct
{
}

@end
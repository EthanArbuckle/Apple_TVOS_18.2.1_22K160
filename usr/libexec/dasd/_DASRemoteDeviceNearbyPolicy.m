@interface _DASRemoteDeviceNearbyPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (_DASRemoteDeviceNearbyPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRemoteDeviceNearbyPolicy

- (_DASRemoteDeviceNearbyPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____DASRemoteDeviceNearbyPolicy;
  v2 = -[_DASRemoteDeviceNearbyPolicy init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Remote Device Nearby Policy";
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AF04C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157DB8 != -1) {
    dispatch_once(&qword_100157DB8, block);
  }
  return (id)qword_100157DC0;
}

- (BOOL)appliesToActivity:(id)a3
{
  return 0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue([a3 remoteDevice]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:]( &OBJC_CLASS____DASRemoteDeviceNearbyMonitor,  "sharedMonitorWithDaemon:",  v6));

  LODWORD(v6) = [v7 isRemoteDeviceNearby:v5];
  v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  v9 = v8;
  double v10 = 1.0;
  if ((_DWORD)v6)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    double v10 = 0.0;
    uint64_t v11 = 33LL;
  }

  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"remoteDeviceNearby",  1.0,  v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v11,  v9,  (double)0x384uLL));

  return v12;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
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
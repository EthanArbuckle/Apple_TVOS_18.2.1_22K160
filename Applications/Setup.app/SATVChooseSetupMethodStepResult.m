@interface SATVChooseSetupMethodStepResult
- (BOOL)didExecutionSucceed;
- (BOOL)wasSkippedDueToManagedConfiguration;
- (NSDictionary)metricsPayload;
- (NSString)description;
- (NSString)stepResultValue;
- (SATVChooseSetupMethodStepResult)initWithTapToSetupDeviceInfo:(id)a3;
- (TVSKTapToSetupDeviceInfo)tapToSetupDeviceInfo;
- (unint64_t)flowOptions;
@end

@implementation SATVChooseSetupMethodStepResult

- (SATVChooseSetupMethodStepResult)initWithTapToSetupDeviceInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SATVChooseSetupMethodStepResult;
  v6 = -[SATVChooseSetupMethodStepResult init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tapToSetupDeviceInfo, a3);
  }

  return v7;
}

- (BOOL)didExecutionSucceed
{
  return 1;
}

- (unint64_t)flowOptions
{
  return 0LL;
}

- (NSDictionary)metricsPayload
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStepResult tapToSetupDeviceInfo](self, "tapToSetupDeviceInfo"));

  v3 = (id *)&TVSKMetricsPayloadValueSetupMethodManual;
  if (v2) {
    v3 = (id *)&TVSKMetricsPayloadValueSetupMethodTapToSetup;
  }
  id v4 = *v3;
  uint64_t v7 = TVSKMetricsPayloadKeyStepSuffixSetupMethod;
  id v8 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return (NSDictionary *)v5;
}

- (NSString)stepResultValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStepResult tapToSetupDeviceInfo](self, "tapToSetupDeviceInfo"));
  if (v2) {
    v3 = @":phone:";
  }
  else {
    v3 = @":tv:";
  }
  id v4 = v3;

  return v4;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendBool:withName:",  -[SATVChooseSetupMethodStepResult didExecutionSucceed](self, "didExecutionSucceed"),  @"didExecutionSucceed");
  id v5 =  objc_msgSend( v3,  "appendBool:withName:",  -[SATVChooseSetupMethodStepResult wasSkippedDueToManagedConfiguration]( self,  "wasSkippedDueToManagedConfiguration"),  @"wasSkippedDueToManagedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStepResult metricsPayload](self, "metricsPayload"));
  id v7 = [v3 appendObject:v6 withName:@"metricsPayload"];

  if (sub_10002AF30())
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseSetupMethodStepResult tapToSetupDeviceInfo](self, "tapToSetupDeviceInfo"));
    id v9 = [v3 appendObject:v8 withName:@"tapToSetupDeviceInfo"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v10;
}

- (BOOL)wasSkippedDueToManagedConfiguration
{
  return self->_wasSkippedDueToManagedConfiguration;
}

- (TVSKTapToSetupDeviceInfo)tapToSetupDeviceInfo
{
  return self->_tapToSetupDeviceInfo;
}

- (void).cxx_destruct
{
}

@end
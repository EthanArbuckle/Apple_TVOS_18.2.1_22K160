@interface RestrictedPerfMode
+ (id)powerModeInstance;
- (BOOL)allowOnCharger;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (CLPCPolicyAccess)clpcClient;
- (RestrictedPerfMode)init;
- (unint64_t)clientResponsible;
- (void)allowOnCharger:(BOOL)a3;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)logStatusToPowerLog;
- (void)restoreState:(id)a3;
- (void)setAllowOnCharger:(BOOL)a3;
- (void)setClientResponsible:(unint64_t)a3;
- (void)setClpcClient:(id)a3;
@end

@implementation RestrictedPerfMode

- (RestrictedPerfMode)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RestrictedPerfMode;
  v2 = -[RestrictedPerfMode init](&v15, "init");
  os_log_t v3 = os_log_create("com.apple.powerexperienced", "RestrictedPerfMode");
  -[PowerModeObjImpl setLog:](v2, "setLog:", v3);

  -[PowerModeObjImpl setState:](v2, "setState:", 0LL);
  -[PowerModeObjImpl setEnabled:](v2, "setEnabled:", 1LL);
  -[PowerModeObjImpl setEntryDelay:](v2, "setEntryDelay:", 3.0);
  byte_10001B6C8 = _os_feature_enabled_impl("powerexperienced", "RestrictedPerfMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kPlatformContext"]);
  if ([v5 isEqual:@"iPhone"])
  {
    -[PowerModeObjImpl setSupportedPlatform:](v2, "setSupportedPlatform:", 1LL);
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"kPlatformContext"]);
    -[PowerModeObjImpl setSupportedPlatform:](v2, "setSupportedPlatform:", [v7 isEqual:@"Watch"]);
  }

  -[RestrictedPerfMode setAllowOnCharger:](v2, "setAllowOnCharger:", 0LL);
  if (!-[PowerModeObjImpl supportedPlatform](v2, "supportedPlatform"))
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Restricted perf mode not supported on this platform",  buf,  2u);
    }

    goto LABEL_15;
  }

  -[PowerModeObjImpl setAppliesPowerTarget:](v2, "setAppliesPowerTarget:", 1LL);
  if (byte_10001B6C8 && (MGGetBoolAnswer(@"IsVirtualDevice") & 1) == 0)
  {
    id v13 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterface createClient:](&OBJC_CLASS___CLPCPolicyInterface, "createClient:", &v13));
    v9 = (os_log_s *)v13;
    -[RestrictedPerfMode setClpcClient:](v2, "setClpcClient:", v8);

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initialized CLPC Policy Interface", buf, 2u);
    }

    if (v9)
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v2, "log"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000D40C((uint64_t)v9, v11);
      }

LABEL_15:
    }
  }

  return v2;
}

+ (id)powerModeInstance
{
  if (qword_10001B6D0 != -1) {
    dispatch_once(&qword_10001B6D0, &stru_1000144A0);
  }
  return (id)qword_10001B6D8;
}

- (void)restoreState:(id)a3
{
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[PowerModeObjImpl supportedPlatform](self, "supportedPlatform"))
  {
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v29 = "Platform not supported";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v29, buf, 2u);
    }

- (void)enterPowerMode
{
  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___RestrictedPerfMode;
    -[PowerModeObjImpl enterPowerMode](&v5, "enterPowerMode");
    os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = -[PowerModeObjImpl state](self, "state");
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Entering restricted perf mode. New state %d",  buf,  8u);
    }

    -[RestrictedPerfMode logStatusToPowerLog](self, "logStatusToPowerLog");
  }

- (void)exitPowerMode
{
  if (-[PowerModeObjImpl state](self, "state"))
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___RestrictedPerfMode;
    -[PowerModeObjImpl exitPowerMode](&v5, "exitPowerMode");
    os_log_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = -[PowerModeObjImpl state](self, "state");
      *(_DWORD *)buf = 67109120;
      unsigned int v7 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Exiting restricted perf mode. New state %d",  buf,  8u);
    }

    -[RestrictedPerfMode logStatusToPowerLog](self, "logStatusToPowerLog");
  }

- (void)allowOnCharger:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting allowOnCharger: %d", (uint8_t *)v6, 8u);
  }

  -[RestrictedPerfMode setAllowOnCharger:](self, "setAllowOnCharger:", v3);
}

- (void)logStatusToPowerLog
{
  if (!-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier")) {
    -[PowerModeObjImpl setPowerlogIdentifier:]( self,  "setPowerlogIdentifier:",  PPSCreateTelemetryIdentifier(@"PowerModes", @"HotInPocket"));
  }
  if (-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    v9[0] = @"status";
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PowerModeObjImpl state](self, "state")));
    v9[1] = @"client";
    v10[0] = v3;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[RestrictedPerfMode clientResponsible](self, "clientResponsible")));
    v10[1] = v4;
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));

    PPSSendTelemetry(-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"), v5);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Logging to powerlog %@", (uint8_t *)&v7, 0xCu);
    }
  }

  else
  {
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000D480(v5);
    }
  }
}

- (CLPCPolicyAccess)clpcClient
{
  return (CLPCPolicyAccess *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setClpcClient:(id)a3
{
}

- (BOOL)allowOnCharger
{
  return self->_allowOnCharger;
}

- (void)setAllowOnCharger:(BOOL)a3
{
  self->_allowOnCharger = a3;
}

- (unint64_t)clientResponsible
{
  return self->_clientResponsible;
}

- (void)setClientResponsible:(unint64_t)a3
{
  self->_clientResponsible = a3;
}

- (void).cxx_destruct
{
}

@end
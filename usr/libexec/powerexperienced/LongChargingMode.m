@interface LongChargingMode
+ (id)powerModeInstance;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (LongChargingMode)init;
- (void)enterPowerMode;
- (void)exitPowerMode;
@end

@implementation LongChargingMode

- (LongChargingMode)init
{
  if (_os_feature_enabled_impl("powerexperienced", "LongChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___LongChargingMode;
    self = -[LongChargingMode init](&v8, "init");
    os_log_t v3 = os_log_create("com.apple.powerexperience", "LongChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0LL);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kPlatformContext"]);
    -[PowerModeObjImpl setSupportedPlatform:]( self,  "setSupportedPlatform:",  [v5 isEqual:@"iPhone"]);

    -[PowerModeObjImpl setAppliesPowerTarget:](self, "setAppliesPowerTarget:", 1LL);
    -[PowerModeObjImpl setMaxEngagementDuration:](self, "setMaxEngagementDuration:", 21600.0);
  }

  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001B6B8 != -1) {
    dispatch_once(&qword_10001B6B8, &stru_100014480);
  }
  return (id)qword_10001B6C0;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"kPluggedInContext"]);
  unsigned int v9 = [v8 BOOLValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Display"]);
  id v11 = [v10 state];
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"kLockStateContext"]);

  unsigned __int8 v13 = [v12 BOOLValue];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CarPlay"]);

  id v15 = [v14 state];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"AudioPlayback"]);

  id v17 = [v16 state];
  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"OnenessSession"]);

  id v19 = [v18 state];
  v20 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"USBDeviceMode"]);

  id v21 = [v20 state];
  char v22 = v13 ^ 1;
  if (v11 != (id)101) {
    char v22 = 0;
  }
  int v23 = 1;
  if ((v22 & 1) != 0
    || v15 == (id)1
    || v17 == (id)1
    || (v19 != (id)1 ? (v24 = v21 == (id)1) : (v24 = 1), !v24 ? (int v23 = 0) : (int v23 = 1), !v9 || (v23 & 1) != 0))
  {
    unsigned int v28 = 0;
    LOBYTE(v27) = 0;
    if (!-[PowerModeObjImpl state](self, "state")) {
      goto LABEL_31;
    }
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](&OBJC_CLASS___ChargeDurationPredictor, "sharedInstance"));
    v26 = v25;
    if (v25) {
      unsigned int v27 = [v25 longChargeExpected];
    }
    else {
      unsigned int v27 = 0;
    }

    if (v27 == -[PowerModeObjImpl state](self, "state")) {
      goto LABEL_31;
    }
    int v23 = 0;
    unsigned int v28 = v27;
  }

  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v30 = v11 == (id)101;
    v31 = (objc_class *)objc_opt_class(self);
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    int v37 = 138413314;
    v38 = v33;
    __int16 v39 = 1024;
    unsigned int v40 = v28;
    __int16 v41 = 1024;
    BOOL v42 = v30;
    __int16 v43 = 1024;
    BOOL v44 = v15 == (id)1;
    __int16 v45 = 1024;
    unsigned int v46 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d",  (uint8_t *)&v37,  0x24u);
  }

  if ((v27 & 1) != 0)
  {
    LOBYTE(v27) = 1;
  }

  else
  {
    uint64_t v34 = 4LL;
    if (v9) {
      uint64_t v34 = 1LL;
    }
    if (v23) {
      uint64_t v35 = 3LL;
    }
    else {
      uint64_t v35 = v34;
    }
    -[PowerModeObjImpl setExitReason:](self, "setExitReason:", v35);
    LOBYTE(v27) = 0;
  }

- (void)enterPowerMode
{
  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___LongChargingMode;
    -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }

- (void)exitPowerMode
{
  if (-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___LongChargingMode;
    -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }

@end
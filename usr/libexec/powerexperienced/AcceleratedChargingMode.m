@interface AcceleratedChargingMode
+ (id)powerModeInstance;
- (AcceleratedChargingMode)init;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (void)enterPowerMode;
- (void)exitPowerMode;
@end

@implementation AcceleratedChargingMode

- (AcceleratedChargingMode)init
{
  if (_os_feature_enabled_impl("powerexperienced", "AcceleratedChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___AcceleratedChargingMode;
    self = -[AcceleratedChargingMode init](&v8, "init");
    os_log_t v3 = os_log_create("com.apple.powerexperience", "AcceleratedChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0LL);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1LL);
    -[PowerModeObjImpl setEntryDelay:](self, "setEntryDelay:", 120.0);
    -[PowerModeObjImpl setMaxEngagementDuration:](self, "setMaxEngagementDuration:", 1800.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kPlatformContext"]);
    -[PowerModeObjImpl setSupportedPlatform:]( self,  "setSupportedPlatform:",  [v5 isEqual:@"iPhone"]);

    -[PowerModeObjImpl setAppliesPowerTarget:](self, "setAppliesPowerTarget:", 1LL);
  }

  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001B6E0 != -1) {
    dispatch_once(&qword_10001B6E0, &stru_1000144C0);
  }
  return (id)qword_10001B6E8;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"kPluggedInContext"]);
  HIDWORD(v37) = [v7 BOOLValue];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"kBatteryLevelContext"]);
  LODWORD(v37) = [v8 intValue];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"kLockStateContext"]);
  unsigned __int8 v10 = [v9 BOOLValue];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Display"]);
  id v12 = [v11 state];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CarPlay"]);

  id v14 = [v13 state];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"AudioPlayback"]);

  id v16 = [v15 state];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"OnenessSession"]);

  id v18 = [v17 state];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"USBDeviceMode"]);

  id v20 = [v19 state];
  char v21 = v10 ^ 1;
  if (v12 != (id)101) {
    char v21 = 0;
  }
  int v22 = 1;
  if ((v21 & 1) != 0 || v14 == (id)1)
  {
    v23 = self;
    goto LABEL_18;
  }

  v23 = self;
  if (v16 == (id)1
    || (v18 != (id)1 ? (BOOL v24 = v20 == (id)1) : (BOOL v24 = 1),
        !v24 ? (int v22 = 0) : (int v22 = 1),
        !HIDWORD(v37) || (v22 & 1) != 0 || (int)v37 > 50))
  {
LABEL_18:
    unsigned int v28 = 0;
    LOBYTE(v27) = 0;
    if (!-[PowerModeObjImpl state](v23, "state", v37)) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](&OBJC_CLASS___ChargeDurationPredictor, "sharedInstance"));
  v26 = v25;
  if (v25) {
    unsigned int v27 = [v25 shortChargeExpected];
  }
  else {
    unsigned int v27 = 0;
  }

  if (v27 == -[PowerModeObjImpl state](self, "state")) {
    goto LABEL_35;
  }
  int v22 = 0;
  unsigned int v28 = v27;
LABEL_23:
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](v23, "log", v37));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = (objc_class *)objc_opt_class(v23);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"kBatteryLevelContext"]);
    *(_DWORD *)buf = 138413570;
    v42 = v32;
    __int16 v43 = 1024;
    unsigned int v44 = v28;
    __int16 v45 = 1024;
    BOOL v46 = v12 == (id)101;
    __int16 v47 = 1024;
    BOOL v48 = v14 == (id)1;
    __int16 v49 = 1024;
    int v50 = v39;
    __int16 v51 = 2112;
    v52 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "evaluatePowerMode: %@: %d display %d, carPlay %d, pluggedIn %d, batterylevel %@",  buf,  0x2Eu);

    v23 = self;
  }

  if ((v27 & 1) != 0)
  {
    LOBYTE(v27) = 1;
  }

  else
  {
    uint64_t v34 = 5LL;
    if (v38 <= 50) {
      uint64_t v34 = 1LL;
    }
    if (!v39) {
      uint64_t v34 = 4LL;
    }
    if (v22) {
      uint64_t v35 = 3LL;
    }
    else {
      uint64_t v35 = v34;
    }
    -[PowerModeObjImpl setExitReason:](v23, "setExitReason:", v35);
    LOBYTE(v27) = 0;
  }

- (void)enterPowerMode
{
  if (!-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___AcceleratedChargingMode;
    -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }

- (void)exitPowerMode
{
  if (-[PowerModeObjImpl state](self, "state"))
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___AcceleratedChargingMode;
    -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
    -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
  }

@end
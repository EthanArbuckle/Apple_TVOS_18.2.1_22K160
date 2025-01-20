@interface InUseChargingMode
+ (id)powerModeInstance;
- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4;
- (InUseChargingMode)init;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)updateChargingPolicy;
@end

@implementation InUseChargingMode

- (InUseChargingMode)init
{
  if (_os_feature_enabled_impl("powerexperienced", "InUseChargingMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___InUseChargingMode;
    self = -[InUseChargingMode init](&v8, "init");
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "InUseChargingMode");
    -[PowerModeObjImpl setLog:](self, "setLog:", v3);

    -[PowerModeObjImpl setState:](self, "setState:", 0LL);
    -[PowerModeObjImpl setEnabled:](self, "setEnabled:", 1LL);
    -[PowerModeObjImpl setEntryDelay:](self, "setEntryDelay:", 30.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kPlatformContext"]);
    -[PowerModeObjImpl setSupportedPlatform:]( self,  "setSupportedPlatform:",  [v5 isEqual:@"iPhone"]);

    -[PowerModeObjImpl setAppliesChargingPolicy:](self, "setAppliesChargingPolicy:", 1LL);
  }

  v6 = self;

  return v6;
}

+ (id)powerModeInstance
{
  if (qword_10001B6A8 != -1) {
    dispatch_once(&qword_10001B6A8, &stru_100014460);
  }
  return (id)qword_10001B6B0;
}

- (BOOL)evaluatePowerModeWithResourceHints:(id)a3 andContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v38 = -[PowerModeObjImpl state](self, "state");
  objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "evaluatePowerMode resources %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Display"]);
  id v10 = [v9 state];
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CarPlay"]);

  id v12 = [v11 state];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Camera"]);

  id v37 = [v13 state];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PersonalHotspot"]);

  id v15 = [v14 state];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kPluggedInContext"]);
  unsigned int v17 = [v16 BOOLValue];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kLockStateContext"]);
  unsigned __int8 v19 = [v18 BOOLValue];

  id v36 = v10;
  char v20 = v19 ^ 1;
  if (v10 != (id)101) {
    char v20 = 0;
  }
  BOOL v21 = 1;
  if ((v20 & 1) == 0 && v12 != (id)1) {
    BOOL v21 = v37 == (id)1 || v15 == (id)1;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kBatteryLevelContext"]);

  int v24 = [v23 intValue];
  if ((v17 & 1) == 0)
  {
    int v27 = 0;
    if ((v38 & 1) == 0) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }

  BOOL v25 = v24 > 19 && v21;
  int v26 = !v25 | v38;
  int v27 = v25 | v26 ^ 1;
  if ((v26 & 1) == 0 && v12 != (id)1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ChargeDurationPredictor sharedInstance](&OBJC_CLASS___ChargeDurationPredictor, "sharedInstance"));
    int v27 = [v28 inTypicalUsageEnvironment];
  }

  if (v38 != v27)
  {
LABEL_23:
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (objc_class *)objc_opt_class(self);
      v31 = NSStringFromClass(v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138413570;
      id v40 = v32;
      __int16 v41 = 1024;
      int v42 = v27;
      __int16 v43 = 1024;
      BOOL v44 = v36 == (id)101;
      __int16 v45 = 1024;
      BOOL v46 = v12 == (id)1;
      __int16 v47 = 1024;
      BOOL v48 = v37 == (id)1;
      __int16 v49 = 1024;
      unsigned int v50 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "evaluatePowerMode: %@: %d display %d, carPlaySession %d cameraActive %d, pluggedIn %d",  buf,  0x2Au);
    }

    if ((v27 & 1) != 0)
    {
      LOBYTE(v27) = 1;
    }

    else
    {
      uint64_t v33 = 5LL;
      if (v24 > 19) {
        uint64_t v33 = 1LL;
      }
      if (!v21) {
        uint64_t v33 = 2LL;
      }
      if (v17) {
        uint64_t v34 = v33;
      }
      else {
        uint64_t v34 = 4LL;
      }
      -[PowerModeObjImpl setExitReason:](self, "setExitReason:", v34);
      LOBYTE(v27) = 0;
    }
  }

- (void)enterPowerMode
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___InUseChargingMode;
  -[PowerModeObjImpl enterPowerMode](&v3, "enterPowerMode");
  -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
}

- (void)exitPowerMode
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___InUseChargingMode;
  -[PowerModeObjImpl exitPowerMode](&v3, "exitPowerMode");
  -[PowerModeObjImpl logStatusToPowerLog](self, "logStatusToPowerLog");
}

- (void)updateChargingPolicy
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SMCSensorExchangeHelper sharedInstance](&OBJC_CLASS___SMCSensorExchangeHelper, "sharedInstance"));
  objc_msgSend(v3, "updateCLTMChargingPolicy:", -[PowerModeObjImpl state](self, "state"));
}

@end
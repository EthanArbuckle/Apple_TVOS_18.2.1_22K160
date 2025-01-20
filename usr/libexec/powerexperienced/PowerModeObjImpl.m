@interface PowerModeObjImpl
- (BOOL)appliesChargingPolicy;
- (BOOL)appliesPowerTarget;
- (BOOL)enabled;
- (BOOL)pendingDelayedEntryTimer;
- (BOOL)state;
- (BOOL)supportedPlatform;
- (NSDate)lastEntryTime;
- (NSDate)lastExitTime;
- (NSNumber)endingSOC;
- (NSNumber)startingSOC;
- (OS_os_log)log;
- (PPSTelemetryIdentifier)powerlogIdentifier;
- (double)entryDelay;
- (double)getEntryDelay;
- (double)getMaxEngagementDuration;
- (double)maxEngagementDuration;
- (unint64_t)exitReason;
- (void)disablePowerMode;
- (void)enablePowerMode;
- (void)enterPowerMode;
- (void)exitPowerMode;
- (void)logStatusToPowerLog;
- (void)restoreState:(id)a3;
- (void)setAppliesChargingPolicy:(BOOL)a3;
- (void)setAppliesPowerTarget:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEndingSOC:(id)a3;
- (void)setEntryDelay:(double)a3;
- (void)setExitReason:(unint64_t)a3;
- (void)setLastEntryTime:(id)a3;
- (void)setLastExitTime:(id)a3;
- (void)setLog:(id)a3;
- (void)setMaxEngagementDuration:(double)a3;
- (void)setPendingDelayedEntryTimer:(BOOL)a3;
- (void)setPowerlogIdentifier:(PPSTelemetryIdentifier *)a3;
- (void)setStartingSOC:(id)a3;
- (void)setState:(BOOL)a3;
- (void)setSupportedPlatform:(BOOL)a3;
- (void)updatePowerTarget;
- (void)updateSMCDebugKey;
@end

@implementation PowerModeObjImpl

- (void)enterPowerMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PowerModeObjImpl setLastEntryTime:](self, "setLastEntryTime:", v3);

  -[PowerModeObjImpl setExitReason:](self, "setExitReason:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kBatteryLevelContext"]);
  -[PowerModeObjImpl setStartingSOC:](self, "setStartingSOC:", v5);

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v18 = 138412290;
    v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Entering Contextual Power Mode %@",  (uint8_t *)&v18,  0xCu);
  }

  if (-[PowerModeObjImpl appliesPowerTarget](self, "appliesPowerTarget")
    && (objc_opt_respondsToSelector(self, "updatePowerTarget") & 1) != 0)
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class(self);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v18 = 138412290;
      v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updating power target for %@",  (uint8_t *)&v18,  0xCu);
    }

    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
  }

  if (-[PowerModeObjImpl appliesChargingPolicy](self, "appliesChargingPolicy")
    && (objc_opt_respondsToSelector(self, "updateChargingPolicy") & 1) != 0)
  {
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class(self);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v18 = 138412290;
      v19 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Updating charging policy for %@",  (uint8_t *)&v18,  0xCu);
    }

    -[PowerModeObjImpl updateChargingPolicy](self, "updateChargingPolicy");
  }

  -[PowerModeObjImpl updateSMCDebugKey](self, "updateSMCDebugKey");
}

- (void)exitPowerMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[PowerModeObjImpl setLastExitTime:](self, "setLastExitTime:", v3);

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    int v28 = 138412290;
    v29 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Exiting Contextual Power Mode %@",  (uint8_t *)&v28,  0xCu);
  }

  if (-[PowerModeObjImpl appliesPowerTarget](self, "appliesPowerTarget")
    && (objc_opt_respondsToSelector(self, "updatePowerTarget") & 1) != 0)
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(self);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v28 = 138412290;
      v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Updating power target for %@",  (uint8_t *)&v28,  0xCu);
    }

    -[PowerModeObjImpl updatePowerTarget](self, "updatePowerTarget");
  }

  if (-[PowerModeObjImpl appliesChargingPolicy](self, "appliesChargingPolicy")
    && (objc_opt_respondsToSelector(self, "updateChargingPolicy") & 1) != 0)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      int v28 = 138412290;
      v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating charging policy for %@",  (uint8_t *)&v28,  0xCu);
    }

    -[PowerModeObjImpl updateChargingPolicy](self, "updateChargingPolicy");
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[DeviceContext sharedInstance](&OBJC_CLASS___DeviceContext, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"kBatteryLevelContext"]);
  -[PowerModeObjImpl setEndingSOC:](self, "setEndingSOC:", v17);

  -[PowerModeObjImpl updateSMCDebugKey](self, "updateSMCDebugKey");
  int v18 = (void *)objc_claimAutoreleasedReturnValue(+[AnalyticsLogger logger](&OBJC_CLASS___AnalyticsLogger, "logger"));
  v19 = (objc_class *)objc_opt_class(self);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl lastEntryTime](self, "lastEntryTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl lastExitTime](self, "lastExitTime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl startingSOC](self, "startingSOC"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl endingSOC](self, "endingSOC"));
  unint64_t v26 = -[PowerModeObjImpl exitReason](self, "exitReason") - 1;
  if (v26 > 4) {
    v27 = @"Unknown";
  }
  else {
    v27 = off_1000144E0[v26];
  }
  [v18 logCAEventforMode:v21 startDate:v22 endDate:v23 startingSOC:v24 endingSOC:v25 exitReason:v27];
}

- (void)enablePowerMode
{
}

- (void)disablePowerMode
{
}

- (void)restoreState:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    *(_DWORD *)buf = 138412546;
    id v22 = (id)objc_opt_class(&OBJC_CLASS___NSString);
    __int16 v23 = 2112;
    id v24 = v4;
    id v7 = v22;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restoring state for %@: %@", buf, 0x16u);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys", 0));
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ([v13 isEqualToString:@"state"])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"state"]);
          -[PowerModeObjImpl setState:](self, "setState:", [v14 BOOLValue]);
        }

        if ([v13 isEqualToString:@"lastExitTime"])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastExitTime"]);
          -[PowerModeObjImpl setLastExitTime:](self, "setLastExitTime:", v15);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

- (void)logStatusToPowerLog
{
  if (!-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    v3 = (objc_class *)objc_opt_class(self);
    id v4 = NSStringFromClass(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[PowerModeObjImpl setPowerlogIdentifier:]( self,  "setPowerlogIdentifier:",  PPSCreateTelemetryIdentifier(@"PowerModes", v5));
  }

  if (-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"))
  {
    if (-[PowerModeObjImpl exitReason](self, "exitReason"))
    {
      v14[0] = @"status";
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PowerModeObjImpl state](self, "state")));
      v14[1] = @"ExitReason";
      v15[0] = v6;
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[PowerModeObjImpl exitReason](self, "exitReason")));
      v15[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    }

    else
    {
      v12 = @"status";
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[PowerModeObjImpl state](self, "state")));
      v13 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerModeObjImpl log](self, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Logging %@ to powerlog",  (uint8_t *)&v10,  0xCu);
    }

    PPSSendTelemetry(-[PowerModeObjImpl powerlogIdentifier](self, "powerlogIdentifier"), v8);
  }

- (double)getEntryDelay
{
  return result;
}

- (double)getMaxEngagementDuration
{
  return result;
}

- (void)updatePowerTarget
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[CLPCPolicyInterfaceHelper sharedInstance](&OBJC_CLASS___CLPCPolicyInterfaceHelper, "sharedInstance"));
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v6, "updatePowerTargetForMode:withState:", v5, -[PowerModeObjImpl state](self, "state"));
}

- (void)updateSMCDebugKey
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SMCSensorExchangeHelper sharedInstance](&OBJC_CLASS___SMCSensorExchangeHelper, "sharedInstance"));
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v6, "updateSMCDebugKey:withState:", v5, -[PowerModeObjImpl state](self, "state"));
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supportedPlatform
{
  return self->_supportedPlatform;
}

- (void)setSupportedPlatform:(BOOL)a3
{
  self->_supportedPlatform = a3;
}

- (NSDate)lastEntryTime
{
  return self->_lastEntryTime;
}

- (void)setLastEntryTime:(id)a3
{
}

- (NSDate)lastExitTime
{
  return self->_lastExitTime;
}

- (void)setLastExitTime:(id)a3
{
}

- (double)entryDelay
{
  return self->_entryDelay;
}

- (void)setEntryDelay:(double)a3
{
  self->_entryDelay = a3;
}

- (double)maxEngagementDuration
{
  return self->_maxEngagementDuration;
}

- (void)setMaxEngagementDuration:(double)a3
{
  self->_maxEngagementDuration = a3;
}

- (unint64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unint64_t)a3
{
  self->_exitReason = a3;
}

- (NSNumber)startingSOC
{
  return self->_startingSOC;
}

- (void)setStartingSOC:(id)a3
{
}

- (NSNumber)endingSOC
{
  return self->_endingSOC;
}

- (void)setEndingSOC:(id)a3
{
}

- (PPSTelemetryIdentifier)powerlogIdentifier
{
  return self->_powerlogIdentifier;
}

- (void)setPowerlogIdentifier:(PPSTelemetryIdentifier *)a3
{
  self->_powerlogIdentifier = a3;
}

- (BOOL)appliesPowerTarget
{
  return self->_appliesPowerTarget;
}

- (void)setAppliesPowerTarget:(BOOL)a3
{
  self->_appliesPowerTarget = a3;
}

- (BOOL)appliesChargingPolicy
{
  return self->_appliesChargingPolicy;
}

- (void)setAppliesChargingPolicy:(BOOL)a3
{
  self->_appliesChargingPolicy = a3;
}

- (BOOL)pendingDelayedEntryTimer
{
  return self->_pendingDelayedEntryTimer;
}

- (void)setPendingDelayedEntryTimer:(BOOL)a3
{
  self->_pendingDelayedEntryTimer = a3;
}

- (void).cxx_destruct
{
}

@end
@interface _DASSystemConditionsRecorder
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContext)context;
- (_DASSystemConditionsRecorder)init;
- (void)recordBatteryStatus;
- (void)recordForKeyPaths:(id)a3;
- (void)recordMotionStatus;
- (void)recordNetworkStatus;
- (void)recordPowerManagementStatus;
- (void)setContext:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASSystemConditionsRecorder

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003F94C;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157890 != -1) {
    dispatch_once(&qword_100157890, block);
  }
  return (id)qword_100157888;
}

- (_DASSystemConditionsRecorder)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____DASSystemConditionsRecorder;
  v2 = -[_DASSystemConditionsRecorder init](&v14, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v2->_context;
    v2->_context = (_CDContext *)v3;

    os_log_t v5 = os_log_create("com.apple.duetactivityscheduler", "systemconditionrecorder");
    log = v2->_log;
    v2->_log = v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.duetactivityscheduler.systemConditionsRecorder", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;
  }

  return v2;
}

- (void)recordPowerManagementStatus
{
  id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  context = self->_context;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForThermalPressureLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForThermalPressureLevel"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  [v16 setObject:v5 forKeyedSubscript:@"ThermalPressure"];

  v6 = self->_context;
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));
  [v16 setObject:v8 forKeyedSubscript:@"UserActivityStatus"];

  dispatch_queue_attr_t v9 = self->_context;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/system/peakPowerPressureLevel"));
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  [v16 setObject:v11 forKeyedSubscript:@"PeakPowerPressure"];

  v12 = self->_context;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForEnergyBudgetRemainingStatus"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  [v16 setObject:v14 forKeyedSubscript:@"EnergyBudget"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v15 sendDataToPPS:v16 subsystem:@"BackgroundProcessing" category:@"SystemConditionsPowerManagement"];
}

- (void)recordNetworkStatus
{
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = +[_CDNetworkContext wifiQuality:](&OBJC_CLASS____CDNetworkContext, "wifiQuality:", self->_context);
  id v4 = +[_CDNetworkContext cellQuality:](&OBJC_CLASS____CDNetworkContext, "cellQuality:", self->_context);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
  [v11 setObject:v5 forKeyedSubscript:@"WifiQuality"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
  [v11 setObject:v6 forKeyedSubscript:@"CellQuality"];

  context = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNetworkingBudgetRemainingStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForNetworkingBudgetRemainingStatus"));
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8));
  [v11 setObject:v9 forKeyedSubscript:@"DataBudget"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v10 sendDataToPPS:v11 subsystem:@"BackgroundProcessing" category:@"SystemConditionsNetwork"];
}

- (void)recordMotionStatus
{
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  context = self->_context;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForMotionState](&OBJC_CLASS____CDContextQueries, "keyPathForMotionState"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));
  id v6 = [v5 integerValue];

  dispatch_queue_attr_t v7 = self->_context;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCallInProgressStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCallInProgressStatus"));
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8));
  LOBYTE(v7) = [v9 BOOLValue];

  v10 = self->_context;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForCarplayConnectedStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForCarplayConnectedStatus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11));
  unsigned __int8 v13 = [v12 BOOLValue];

  objc_super v14 = self->_context;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/car/isConnected"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15));
  unsigned __int8 v17 = [v16 BOOLValue];

  v18 = self->_context;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath ephemeralKeyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "ephemeralKeyPathWithKey:",  @"/maps/navigationInProgress"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));
  unsigned __int8 v21 = [v20 BOOLValue];

  if ((v7 & 1) != 0
    || (v13 & 1) != 0
    || (v17 & 1) != 0
    || (v21 & 1) != 0
    || v6 != (id)_DASMotionStateAny && v6 != (id)_DASMotionStateStationary)
  {
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:@"InUseOrMotion"];
  }

  [v23 setObject:&__kCFBooleanFalse forKeyedSubscript:@"InUseOrMotion"];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v22 sendDataToPPS:v23 subsystem:@"BackgroundProcessing" category:@"SystemConditionsInUseOrMotion"];
}

- (void)recordBatteryStatus
{
  context = self->_context;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryStateDataDictionary]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryStateDataDictionary"));
  id v22 = (id)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4));

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v6 = self->_context;
  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7));
  [v5 setObject:v8 forKeyedSubscript:@"BatteryLevel"];

  dispatch_queue_attr_t v9 = self->_context;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10));
  [v5 setObject:v11 forKeyedSubscript:@"IsPluggedIn"];

  v12 = self->_context;
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForLowPowerModeStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForLowPowerModeStatus"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(-[_CDContext objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13));
  [v5 setObject:v14 forKeyedSubscript:@"LowPowerMode"];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries batteryAdapterIsWirelessKey]( &OBJC_CLASS____CDContextQueries,  "batteryAdapterIsWirelessKey"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v15]);
  [v5 setObject:v16 forKeyedSubscript:@"IsWireless"];

  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryIsChargingKey](&OBJC_CLASS____CDContextQueries, "batteryIsChargingKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v17]);
  [v5 setObject:v18 forKeyedSubscript:@"IsCharging"];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryAdapterTypeKey](&OBJC_CLASS____CDContextQueries, "batteryAdapterTypeKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v19]);
  [v5 setObject:v20 forKeyedSubscript:@"AdapterType"];

  unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v21 sendDataToPPS:v5 subsystem:@"BackgroundProcessing" category:@"SystemConditionsBattery"];
}

- (void)recordForKeyPaths:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000401FC;
  block[3] = &unk_100115148;
  id v8 = v4;
  dispatch_queue_attr_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _DASBatteryTemperatureRecorder
+ (id)sharedInstance;
- (BOOL)storeBatteryTemperatureEvent:(int64_t)a3 metaData:(id)a4;
- (IONotificationPort)notifyPort;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBatteryTemperatureRecorder)init;
- (_DKEventStream)targetStream;
- (_DKKnowledgeSaving)knowledgeStore;
- (double)highTemperatureDelta;
- (double)lowTemperatureCeiling;
- (double)lowTemperatureDelta;
- (double)mediumTemperatureCeiling;
- (double)mediumTemperatureDelta;
- (double)nonPluggedInDelta;
- (id)getBatteryStatus;
- (int64_t)currentBatteryTemperature;
- (int64_t)recentBatteryTemperature;
- (int64_t)roundedTemperature:(int64_t)a3;
- (unsigned)batteryNotification;
- (unsigned)powerService;
- (void)handleBatteryNotification;
- (void)setBatteryNotification:(unsigned int)a3;
- (void)setCurrentBatteryTemperature:(int64_t)a3;
- (void)setHighTemperatureDelta:(double)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLog:(id)a3;
- (void)setLowTemperatureCeiling:(double)a3;
- (void)setLowTemperatureDelta:(double)a3;
- (void)setMediumTemperatureCeiling:(double)a3;
- (void)setMediumTemperatureDelta:(double)a3;
- (void)setNonPluggedInDelta:(double)a3;
- (void)setNotifyPort:(IONotificationPort *)a3;
- (void)setPowerService:(unsigned int)a3;
- (void)setQueue:(id)a3;
- (void)setRecentBatteryTemperature:(int64_t)a3;
- (void)setTargetStream:(id)a3;
- (void)startRecording;
@end

@implementation _DASBatteryTemperatureRecorder

- (_DASBatteryTemperatureRecorder)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____DASBatteryTemperatureRecorder;
  v2 = -[_DASBatteryTemperatureRecorder init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"batteryTemperatureRecorder"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Device does not have an internal battery",  v7,  2u);
    }
  }

  return 0LL;
}

+ (id)sharedInstance
{
  if (qword_100157B70 != -1) {
    dispatch_once(&qword_100157B70, &stru_100116638);
  }
  return (id)qword_100157B78;
}

- (void)startRecording
{
  self->_currentBatteryTemperature = -1000LL;
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.batteryTemperature.datacollection", v4);
  queue = self->_queue;
  self->_queue = v5;

  IONotificationPortSetDispatchQueue(self->_notifyPort, (dispatch_queue_t)self->_queue);
  if (IOServiceAddInterestNotification( self->_notifyPort,  self->_powerService,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10005C87C,  self,  &self->_batteryNotification))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B52F8(log, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  else
  {
    v15 = (_DKEventStream *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  @"/dasd/batterytemperature"));
    targetStream = self->_targetStream;
    self->_targetStream = v15;

    v17 = (_DKKnowledgeSaving *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
    knowledgeStore = self->_knowledgeStore;
    self->_knowledgeStore = v17;

    self->_recentBatteryTemperature = -1000LL;
  }

- (void)handleBatteryNotification
{
  dispatch_queue_attr_t v3 = (void *)os_transaction_create("com.apple.dasd.batterytemperature.datacollection");
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBatteryTemperatureRecorder getBatteryStatus](self, "getBatteryStatus"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"batteryTemperature"]);
    id v8 = [v7 integerValue];

    if (v8)
    {
      self->_currentBatteryTemperature = (int64_t)v8;
      uint64_t v9 = -[_DASBatteryTemperatureRecorder roundedTemperature:](self, "roundedTemperature:", v8);
      p_int64_t recentBatteryTemperature = &self->_recentBatteryTemperature;
      int64_t recentBatteryTemperature = self->_recentBatteryTemperature;
      log = self->_log;
      uint64_t v13 = v9 - recentBatteryTemperature;
      if (v9 == recentBatteryTemperature)
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
          sub_1000B5328(&self->_recentBatteryTemperature, v9, log);
        }
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_INFO))
      {
        int64_t v14 = *p_recentBatteryTemperature;
        *(_DWORD *)buf = 134218496;
        uint64_t v28 = v9;
        __int16 v29 = 2048;
        uint64_t v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Current temp %ld, recent temp %ld, change %ld",  buf,  0x20u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pluggedIn"]);

      if (v15)
      {
        if (self->_lowTemperatureCeiling <= (double)v9)
        {
          uint64_t v16 = 13LL;
        }

        else
        {
          uint64_t v16 = 11LL;
        }
      }

      else
      {
        uint64_t v16 = 14LL;
      }

      uint64_t v17 = (uint64_t)*(double *)&(&self->super.isa)[v16];
      if (v13 >= 0) {
        uint64_t v18 = v13;
      }
      else {
        uint64_t v18 = -v13;
      }
      if (v18 > v17)
      {
        v19 = self->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v28 = v13;
          __int16 v29 = 2048;
          uint64_t v30 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Writing event since delta %ld is greater than %ld",  buf,  0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pluggedIn"]);
        id v21 = [v20 BOOLValue];

        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21, @"pluggedIn"));
        v26 = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
        unsigned int v24 = -[_DASBatteryTemperatureRecorder storeBatteryTemperatureEvent:metaData:]( self,  "storeBatteryTemperatureEvent:metaData:",  v9,  v23);

        if (v24) {
          *p_int64_t recentBatteryTemperature = v9;
        }
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (id)getBatteryStatus
{
  kern_return_t v4;
  int v5;
  OS_os_log *log;
  CFMutableDictionaryRef v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OS_os_log *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFMutableDictionaryRef properties;
  io_registry_entry_t powerService = self->_powerService;
  if (!powerService) {
    return 0LL;
  }
  v4 = IORegistryEntryCreateCFProperties(powerService, &properties, kCFAllocatorDefault, 0);
  if (v4)
  {
    v5 = v4;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_1000B5420(v5, log);
    }
    return 0LL;
  }

  id v8 = properties;
  uint64_t v9 = -[__CFDictionary copy](properties, "copy");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Temperature"]);
  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Temperature"]);
    [v11 setObject:v12 forKeyedSubscript:@"batteryTemperature"];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ExternalConnected"]);
    [v11 setObject:v13 forKeyedSubscript:@"pluggedIn"];
  }

  else
  {
    int64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000B53B8((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v11 = 0LL;
  }

  return v11;
}

- (BOOL)storeBatteryTemperatureEvent:(int64_t)a3 metaData:(id)a4
{
  targetStream = self->_targetStream;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:]( &OBJC_CLASS____DKEvent,  "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:",  targetStream,  v8,  v9,  a3,  v7));

  if (v10)
  {
    knowledgeStore = self->_knowledgeStore;
    uint64_t v32 = v10;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
    id v31 = 0LL;
    -[_DKKnowledgeSaving saveObjects:error:](knowledgeStore, "saveObjects:error:", v12, &v31);
    id v13 = v31;

    BOOL v14 = v13 == 0LL;
    if (v13)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1000B54C0((uint64_t)v13, log, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  else
  {
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000B5490(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)roundedTemperature:(int64_t)a3
{
  return (uint64_t)(round((double)a3 / 100.0) * 100.0);
}

- (int64_t)currentBatteryTemperature
{
  return self->_currentBatteryTemperature;
}

- (void)setCurrentBatteryTemperature:(int64_t)a3
{
  self->_currentBatteryTemperature = a3;
}

- (unsigned)powerService
{
  return self->_powerService;
}

- (void)setPowerService:(unsigned int)a3
{
  self->_io_registry_entry_t powerService = a3;
}

- (unsigned)batteryNotification
{
  return self->_batteryNotification;
}

- (void)setBatteryNotification:(unsigned int)a3
{
  self->_batteryNotification = a3;
}

- (IONotificationPort)notifyPort
{
  return self->_notifyPort;
}

- (void)setNotifyPort:(IONotificationPort *)a3
{
  self->_notifyPort = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DKEventStream)targetStream
{
  return self->_targetStream;
}

- (void)setTargetStream:(id)a3
{
}

- (_DKKnowledgeSaving)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)recentBatteryTemperature
{
  return self->_recentBatteryTemperature;
}

- (void)setRecentBatteryTemperature:(int64_t)a3
{
  self->_int64_t recentBatteryTemperature = a3;
}

- (double)lowTemperatureCeiling
{
  return self->_lowTemperatureCeiling;
}

- (void)setLowTemperatureCeiling:(double)a3
{
  self->_lowTemperatureCeiling = a3;
}

- (double)mediumTemperatureCeiling
{
  return self->_mediumTemperatureCeiling;
}

- (void)setMediumTemperatureCeiling:(double)a3
{
  self->_mediumTemperatureCeiling = a3;
}

- (double)lowTemperatureDelta
{
  return self->_lowTemperatureDelta;
}

- (void)setLowTemperatureDelta:(double)a3
{
  self->_lowTemperatureDelta = a3;
}

- (double)mediumTemperatureDelta
{
  return self->_mediumTemperatureDelta;
}

- (void)setMediumTemperatureDelta:(double)a3
{
  self->_mediumTemperatureDelta = a3;
}

- (double)highTemperatureDelta
{
  return self->_highTemperatureDelta;
}

- (void)setHighTemperatureDelta:(double)a3
{
  self->_highTemperatureDelta = a3;
}

- (double)nonPluggedInDelta
{
  return self->_nonPluggedInDelta;
}

- (void)setNonPluggedInDelta:(double)a3
{
  self->_nonPluggedInDelta = a3;
}

- (void).cxx_destruct
{
}

@end
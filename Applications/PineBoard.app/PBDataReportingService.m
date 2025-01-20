@interface PBDataReportingService
+ (id)_sharedInstance;
+ (id)_userAppsMetricsDictionary;
+ (id)_userAppsMetricsDictionaryWithSortedApplicationRecords:(id)a3;
+ (id)serviceLog;
+ (unint64_t)_averageDiskUsageInMB:(unint64_t)a3 numberOfApps:(unint64_t)a4;
+ (unint64_t)_roundDiskUsageInBytesToMB:(unint64_t)a3;
+ (unint64_t)_totalDiskUsageInBytesWithLSApplicationRecord:(id)a3;
+ (void)incrementB239ButtonPresses;
+ (void)incrementB239TVButtonPresses;
+ (void)incrementEventCountForAppleBluetoothRemote;
+ (void)incrementEventCountForBluetoothKeyboard;
+ (void)incrementEventCountForCEC;
+ (void)incrementEventCountForGameController;
+ (void)incrementEventCountForIRRemote;
+ (void)incrementEventCountForRemoteApp;
+ (void)incrementEventCountForRemoteButtonWithType:(int64_t)a3;
+ (void)incrementLongMenuButtonPresses:(__IOHIDEvent *)a3;
+ (void)incrementLongTVButtonPresses:(__IOHIDEvent *)a3;
+ (void)incrementOccurrenceCountForAction:(unint64_t)a3;
+ (void)noteApplicationExit;
+ (void)noteGuideEventResultForAction:(unint64_t)a3;
+ (void)reportNow;
+ (void)startService;
+ (void)startTimingForAction:(unint64_t)a3;
+ (void)stopTimingForAction:(unint64_t)a3;
- (BOOL)_isDiagnosticsSubmissionAllowed;
- (NSDate)lastSentEDIDTimestamp;
- (NSDictionary)cachedCoreControlUsage;
- (NSMutableDictionary)buttonPressTotals;
- (NSMutableDictionary)keyTimingStarts;
- (NSMutableDictionary)keyTimingTotals;
- (NSMutableDictionary)toReportEDIDData;
- (NSMutableSet)seenEDIDs;
- (NSString)persistentDisplayModeString;
- (NSThread)NANDReportingThread;
- (OS_dispatch_queue)serialQueue;
- (PBDataReportingService)init;
- (id)DisplayModeBinding;
- (id)_arcPreferenceData;
- (id)_coreControlCapabilityDataForDisplay:(id)a3;
- (id)_coreControlDisplayAttributesForCurrentDisplay:(id)a3;
- (id)_dataReportingGUID;
- (id)_reportingURLForTopic:(id)a3;
- (int64_t)persistentDisplayModeValue;
- (unint64_t)_integer:(unint64_t)a3 quantizedBy:(unint64_t)a4;
- (unint64_t)_quantizedTimeForKey:(id)a3;
- (unint64_t)qmsToggleCount;
- (void)_cacheCoreControlUsageNow;
- (void)_computeDisplayMetrics;
- (void)_configureAggregateDataReporting;
- (void)_configureEDIDReporting;
- (void)_configureMemoryPressureReporting;
- (void)_configureSleepWakeReporting;
- (void)_handleDisplayModeDidChange;
- (void)_incrementButtonEventCount:(id)a3;
- (void)_recordEDID;
- (void)_reportBluetoothDeviceMetrics;
- (void)_reportButtonEventMetrics;
- (void)_reportButtonPressMetrics;
- (void)_reportCurrentAudioOutputConfiguration;
- (void)_reportCurrentAudioSettingsMetrics;
- (void)_reportCurrentSystemSettingsMetrics;
- (void)_reportCurrentVideoSettingsMetrics;
- (void)_reportDailyDataNow;
- (void)_reportFrequentDataNow;
- (void)_reportNANDStatistics;
- (void)_reportOptInConditionalMetrics;
- (void)_reportOptInUnconditionalMetrics;
- (void)_reportRecoveryActions;
- (void)_reportUserAppMetrics;
- (void)_schedulePeriodicTrigger;
- (void)_sendCoreControlUsage;
- (void)_sendEDIDLogs;
- (void)_sendEDIDURLRequest:(id)a3;
- (void)_sendToURL:(id)a3 withSubtopic:(id)a4 andParameters:(id)a5;
- (void)_threadReportNANDStatistics;
- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
- (void)setButtonPressTotals:(id)a3;
- (void)setCachedCoreControlUsage:(id)a3;
- (void)setKeyTimingStarts:(id)a3;
- (void)setKeyTimingTotals:(id)a3;
- (void)setLastSentEDIDTimestamp:(id)a3;
- (void)setNANDReportingThread:(id)a3;
- (void)setPersistentDisplayModeString:(id)a3;
- (void)setPersistentDisplayModeValue:(int64_t)a3;
- (void)setQmsToggleCount:(unint64_t)a3;
- (void)setSeenEDIDs:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setToReportEDIDData:(id)a3;
- (void)tvs_bindDisplayModeBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5;
@end

@implementation PBDataReportingService

+ (void)startService
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService _sharedInstance](&OBJC_CLASS___PBDataReportingService, "_sharedInstance"));
  [v2 _configureAggregateDataReporting];
  [v2 _configureMemoryPressureReporting];
  [v2 _configureEDIDReporting];
  [v2 _configureSleepWakeReporting];
}

+ (void)reportNow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService _sharedInstance](&OBJC_CLASS___PBDataReportingService, "_sharedInstance"));
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 serialQueue]);
  dispatch_async(v3, &stru_1003D4C30);
}

+ (void)noteApplicationExit
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService _sharedInstance](&OBJC_CLASS___PBDataReportingService, "_sharedInstance"));
  [v2 _reportNANDStatistics];
}

+ (void)incrementOccurrenceCountForAction:(unint64_t)a3
{
  if (a3 > 0x1D)
  {
    v3 = 0LL;
    v4 = 0LL;
    v5 = 0LL;
  }

  else
  {
    v3 = off_1003D5060[a3];
    v4 = off_1003D5150[a3];
    v5 = off_1003D5240[a3];
  }

  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 serviceLog]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10027A478();
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000AB5B8;
  v7[3] = &unk_1003D4C58;
  v8 = v5;
  v9 = v4;
  AnalyticsSendEventLazy(v3, v7);
}

+ (void)incrementB239ButtonPresses
{
}

+ (void)incrementB239TVButtonPresses
{
}

+ (void)incrementEventCountForAppleBluetoothRemote
{
}

+ (void)incrementEventCountForIRRemote
{
}

+ (void)incrementEventCountForCEC
{
}

+ (void)incrementEventCountForBluetoothKeyboard
{
}

+ (void)incrementEventCountForGameController
{
}

+ (void)incrementEventCountForRemoteApp
{
}

+ (void)incrementLongMenuButtonPresses:(__IOHIDEvent *)a3
{
  uint64_t v3 = sub_1000AB7CC((uint64_t)a3);
  uint64_t v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  v3,  @"vendorDefinedUsagePage"));
  v9[1] = @"vendorDefinedUsage";
  v10[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v5));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  AnalyticsSendEvent(@"com.apple.appletv.buttonpresses.longmenupress", v8);
}

+ (void)incrementLongTVButtonPresses:(__IOHIDEvent *)a3
{
  uint64_t v3 = sub_1000AB7CC((uint64_t)a3);
  uint64_t v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  v3,  @"vendorDefinedUsagePage"));
  v9[1] = @"vendorDefinedUsage";
  v10[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v5));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL));
  AnalyticsSendEvent(@"com.apple.appletv.buttonpresses.longtvpress", v8);
}

+ (void)startTimingForAction:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyTimingStarts]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 serviceLog]);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      sub_10027A554();
    }
  }

  else
  {
    if (v10) {
      sub_10027A4F4();
    }

    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 keyTimingStarts]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v12 setObject:v9 forKeyedSubscript:v13];
  }
}

+ (void)stopTimingForAction:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyTimingStarts]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 _sharedInstance]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyTimingTotals]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v9]);
  [v10 doubleValue];
  double v12 = v11;

  if (v12 == 0.0)
  {
    +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
    double v14 = v13 - v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v15]);
    [v16 doubleValue];
    if (v17 == 0.0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v18]);
      [v19 doubleValue];
      double v21 = v20;
    }

    else
    {
      double v21 = 0.0;
    }

    double v23 = v14 + v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v6 removeObjectForKey:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    [v8 setObject:v25 forKeyedSubscript:v26];

    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 serviceLog]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v27 = 134218496;
      unint64_t v28 = a3;
      __int16 v29 = 2048;
      double v30 = v14;
      __int16 v31 = 2048;
      double v32 = v23;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%lu time: %f (%f total)",  (uint8_t *)&v27,  0x20u);
    }
  }

  else
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 serviceLog]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10027A5B4();
    }
  }
}

+ (void)incrementEventCountForRemoteButtonWithType:(int64_t)a3
{
  uint64_t v3 = @"menu";
  switch(a3)
  {
    case 0LL:
      uint64_t v3 = @"up";
      goto LABEL_26;
    case 1LL:
      uint64_t v3 = @"down";
      goto LABEL_26;
    case 2LL:
      uint64_t v3 = @"left";
      goto LABEL_26;
    case 3LL:
      uint64_t v3 = @"right";
      goto LABEL_26;
    case 4LL:
      uint64_t v3 = @"select";
      goto LABEL_26;
    case 5LL:
      goto LABEL_26;
    case 6LL:
    case 8LL:
    case 9LL:
      uint64_t v3 = @"playpause";
      goto LABEL_26;
    case 7LL:
    case 17LL:
    case 22LL:
    case 23LL:
    case 24LL:
    case 25LL:
    case 26LL:
    case 27LL:
    case 28LL:
    case 29LL:
      return;
    case 10LL:
      uint64_t v3 = @"stop";
      goto LABEL_26;
    case 11LL:
      uint64_t v3 = @"rewind";
      goto LABEL_26;
    case 12LL:
      uint64_t v3 = @"fastforward";
      goto LABEL_26;
    case 13LL:
      uint64_t v3 = @"nexttrack";
      goto LABEL_26;
    case 14LL:
      uint64_t v3 = @"previoustrack";
      goto LABEL_26;
    case 15LL:
      uint64_t v3 = @"skipforward";
      goto LABEL_26;
    case 16LL:
      uint64_t v3 = @"skipbackward";
      goto LABEL_26;
    case 18LL:
      uint64_t v3 = @"microphone";
      goto LABEL_26;
    case 19LL:
      uint64_t v3 = @"guide";
      goto LABEL_26;
    case 20LL:
      uint64_t v3 = @"mute";
      goto LABEL_26;
    case 21LL:
      uint64_t v3 = @"tvprovider";
      goto LABEL_26;
    case 30LL:
    case 31LL:
      uint64_t v3 = @"page";
      goto LABEL_26;
    case 32LL:
      uint64_t v3 = @"tvremoteonetwothree";
      goto LABEL_26;
    case 33LL:
      uint64_t v3 = @"tvremotefourcolors";
      goto LABEL_26;
    default:
      if ((unint64_t)(a3 - 102) >= 2)
      {
        if (a3 != 101) {
          return;
        }
        uint64_t v3 = @"home";
      }

      else
      {
        uint64_t v3 = @"volume";
      }

+ (void)noteGuideEventResultForAction:(unint64_t)a3
{
  uint64_t v3 = @"other";
  if (a3 == 1) {
    uint64_t v3 = @"providerlaunch";
  }
  if (!a3) {
    uint64_t v3 = @"foregroundapp";
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000ABEE8;
  v4[3] = &unk_1003D4C58;
  uint64_t v5 = @"guide";
  v6 = (__CFString *)v3;
  AnalyticsSendEventLazy(@"com.apple.appletv.guide.invocation", v4);
}

+ (id)_sharedInstance
{
  if (qword_100470958 != -1) {
    dispatch_once(&qword_100470958, &stru_1003D4C78);
  }
  return (id)qword_100470950;
}

- (PBDataReportingService)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBDataReportingService;
  v2 = -[PBDataReportingService init](&v22, "init");
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    seenEDIDs = v2->_seenEDIDs;
    v2->_seenEDIDs = v3;

    uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    toReportEDIDData = v2->_toReportEDIDData;
    v2->_toReportEDIDData = v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -7201.0));
    lastSentEDIDTimestamp = v2->_lastSentEDIDTimestamp;
    v2->_lastSentEDIDTimestamp = (NSDate *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    keyTimingStarts = v2->_keyTimingStarts;
    v2->_keyTimingStarts = v9;

    double v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    keyTimingTotals = v2->_keyTimingTotals;
    v2->_keyTimingTotals = v11;

    double v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    buttonPressTotals = v2->_buttonPressTotals;
    v2->_buttonPressTotals = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.pineboard.datareportingqueue", 0LL);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v15;

    cachedCoreControlUsage = v2->_cachedCoreControlUsage;
    v2->_cachedCoreControlUsage = 0LL;

    persistentDisplayModeString = v2->_persistentDisplayModeString;
    v2->_persistentDisplayModeValue = 0LL;
    v2->_persistentDisplayModeString = 0LL;

    v19 = -[NSThread initWithBlock:](objc_alloc(&OBJC_CLASS___NSThread), "initWithBlock:", &stru_1003D4C98);
    NANDReportingThread = v2->_NANDReportingThread;
    v2->_NANDReportingThread = v19;

    -[NSThread setName:](v2->_NANDReportingThread, "setName:", @"com.apple.PineBoard.NANDReporting");
    -[NSThread setQualityOfService:](v2->_NANDReportingThread, "setQualityOfService:", 9LL);
    -[NSThread start](v2->_NANDReportingThread, "start");
  }

  return v2;
}

+ (id)serviceLog
{
  if (qword_100470968 != -1) {
    dispatch_once(&qword_100470968, &stru_1003D4CB8);
  }
  return (id)qword_100470960;
}

- (void)_incrementButtonEventCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService buttonPressTotals](self, "buttonPressTotals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v7 intValue] + 1));
    [v5 setObject:v8 forKeyedSubscript:v4];
  }

  else
  {
    [v5 setObject:&off_1003FDA58 forKeyedSubscript:v4];
  }
}

- (BOOL)_isDiagnosticsSubmissionAllowed
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  else {
    unsigned __int8 v2 = +[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode");
  }

  return v2;
}

- (void)_configureAggregateDataReporting
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"DiagnosticsAllowed", @"com.apple.iqagent", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat
    || (CFPreferencesSetAppValue(@"DiagnosticsAllowed", kCFBooleanTrue, @"com.apple.iqagent"),
        CFPreferencesAppSynchronize(@"com.apple.iqagent")))
  {
    -[PBDataReportingService _schedulePeriodicTrigger](self, "_schedulePeriodicTrigger");
  }

  else
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10027A614();
    }
  }

- (void)_configureMemoryPressureReporting
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v3 =  [v2 addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:0 queue:0 usingBlock:&stru_1003D4CF8];
}

- (void)_configureEDIDReporting
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  -[PBDataReportingService tvs_bind:toObject:withKeyPath:options:]( self,  "tvs_bind:toObject:withKeyPath:options:",  @"DisplayModeBinding",  v3,  @"currentDisplayMode",  0LL);
}

- (void)_schedulePeriodicTrigger
{
  if (qword_100470970 != -1) {
    dispatch_once(&qword_100470970, &stru_1003D4D18);
  }
}

- (void)_configureSleepWakeReporting
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  [v3 addObserver:self];
}

- (void)_reportFrequentDataNow
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Periodic data reporting triggered.", v6, 2u);
  }

  if (-[PBDataReportingService _isDiagnosticsSubmissionAllowed](self, "_isDiagnosticsSubmissionAllowed"))
  {
    dispatch_time_t v4 = dispatch_time(0LL, 100000000LL);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService serialQueue](self, "serialQueue"));
    dispatch_after(v4, v5, &stru_1003D4DB8);
  }

- (void)_reportDailyDataNow
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Daily data reporting triggered.", v4, 2u);
  }

  -[PBDataReportingService _computeDisplayMetrics](self, "_computeDisplayMetrics");
  -[PBDataReportingService _reportOptInUnconditionalMetrics](self, "_reportOptInUnconditionalMetrics");
  if (-[PBDataReportingService _isDiagnosticsSubmissionAllowed](self, "_isDiagnosticsSubmissionAllowed")) {
    -[PBDataReportingService _reportOptInConditionalMetrics](self, "_reportOptInConditionalMetrics");
  }
}

- (void)_computeDisplayMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userSelectedDisplayMode]);

  if ([v4 isVirtual])
  {
    uint64_t v5 = @"virtual";
  }

  else
  {
    unsigned int v6 = [v4 promotedToReal];
    uint64_t v5 = @"real";
    if (v6) {
      uint64_t v5 = @"promoted";
    }
  }

  uint64_t v7 = v5;
  if ([v4 isValid])
  {
    if (PBSDisplayResolutionIs4K([v4 resolution]))
    {
      v8 = @"4K";
      uint64_t v9 = 3000000LL;
    }

    else if (PBSDisplayResolutionIs1080p([v4 resolution]))
    {
      v8 = @"1080";
      uint64_t v9 = 2000000LL;
    }

    else if (PBSDisplayResolutionIs720p([v4 resolution]))
    {
      v8 = @"720";
      uint64_t v9 = 1000000LL;
    }

    else if (PBSDisplayResolutionIs576p([v4 resolution]))
    {
      v8 = @"576";
      uint64_t v9 = 7000000LL;
    }

    else if (PBSDisplayResolutionIs480p([v4 resolution]))
    {
      v8 = @"480";
      uint64_t v9 = 8000000LL;
    }

    else
    {
      [v4 resolution];
      uint64_t v13 = v12;
      [v4 resolution];
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%4.0fx%4.0f",  v13,  v14));
      uint64_t v9 = 0LL;
    }

    if ((PBSDisplayRefreshRateEqualToRefreshRate([v4 refreshRate]) & 1) != 0
      || PBSDisplayRefreshRateEqualToRefreshRate([v4 refreshRate]))
    {
      uint64_t v15 = v9 + 20000;
      v16 = @"60";
    }

    else
    {
      int refreshed = PBSDisplayRefreshRateEqualToRefreshRate([v4 refreshRate]);
      if (refreshed) {
        uint64_t v15 = v9 + 10000;
      }
      else {
        uint64_t v15 = v9;
      }
      if (refreshed) {
        v16 = @"50";
      }
      else {
        v16 = @"rateOTHER";
      }
    }

    if ([v4 dynamicRange] == (id)538423555)
    {
      int64_t v10 = v15 + 405;
      v18 = @"DoViLL";
LABEL_31:
      v19 = @"422";
LABEL_32:
      double v11 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@_%@_%@_%@",  v8,  v16,  v18,  v19,  v7));
      goto LABEL_33;
    }

    if ([v4 dynamicRange] == (id)538423554)
    {
      int64_t v10 = v15 + 305;
      v18 = @"DoVi";
      goto LABEL_31;
    }

    if ([v4 dynamicRange] == (id)538423556)
    {
      id v21 = [v4 HDR10ChromaSubsampling];
      if (v21 != (id)538423810)
      {
        if (v21 == (id)538423811)
        {
          int64_t v10 = v15 + 205;
          v18 = @"HDR";
          goto LABEL_31;
        }

        if (v21 == (id)538423812)
        {
          int64_t v10 = v15 + 204;
          v18 = @"HDR";
LABEL_43:
          v19 = @"420";
          goto LABEL_32;
        }

        int64_t v10 = v15 + 200;
        v18 = @"HDR";
        goto LABEL_57;
      }

      int64_t v10 = v15 + 206;
      v18 = @"HDR";
    }

    else
    {
      id v22 = [v4 SDRChromaSubsampling];
      if (v22 != (id)538423810)
      {
        if (v22 == (id)538423811)
        {
          int64_t v10 = v15 + 105;
          v18 = @"SDR";
          goto LABEL_31;
        }

        if (v22 == (id)538423812)
        {
          int64_t v10 = v15 + 104;
          v18 = @"SDR";
          goto LABEL_43;
        }

        id v23 = [v4 SDRColorMapping];
        if (v23 == (id)538424068)
        {
          int64_t v10 = v15 + 101;
          v18 = @"SDR";
          v19 = @"RGBF";
          goto LABEL_32;
        }

        if (v23 == (id)538424067)
        {
          int64_t v10 = v15 + 102;
          v18 = @"SDR";
          v19 = @"RGBL";
          goto LABEL_32;
        }

        if (v23 == (id)538424066)
        {
          int64_t v10 = v15 + 103;
          v18 = @"SDR";
          v19 = @"YCbCr";
          goto LABEL_32;
        }

        int64_t v10 = v15 + 100;
        v18 = @"SDR";
LABEL_57:
        v19 = @"chromaOTHER";
        goto LABEL_32;
      }

      int64_t v10 = v15 + 106;
      v18 = @"SDR";
    }

    v19 = @"444";
    goto LABEL_32;
  }

  int64_t v10 = 0LL;
  v8 = @"rezOTHER";
  double v11 = @"not_set";
LABEL_33:
  persistentDisplayModeString = self->_persistentDisplayModeString;
  self->_persistentDisplayModeValue = v10;
  self->_persistentDisplayModeString = &v11->isa;
}

- (void)_reportOptInUnconditionalMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPAggregateDictionary sharedAggregateDictionary]( &OBJC_CLASS___CPAggregateDictionary,  "sharedAggregateDictionary"));
  [v3 significantTimeChanged];

  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
  char v5 = objc_opt_respondsToSelector(v4, "_fetchCoreAnalyticsDailyEvent:");

  if ((v5 & 1) != 0)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVProfileService sharedInstance](&OBJC_CLASS___TVProfileService, "sharedInstance"));
    [v6 _fetchCoreAnalyticsDailyEvent:&stru_1003D4DF8];
  }

  uint64_t v7 = (void *)CFPreferencesCopyAppValue(@"AppGridAnalytics", @"com.apple.HeadBoard");
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___NSDictionary, v8);
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v10);

  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Sending main menu app grid properties event. {appGridProperties=%@}",  buf,  0xCu);
    }

    AnalyticsSendEvent(@"com.apple.appletv.mainmenu.appgridproperties", v7);
  }

  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Sending PBUserProfileManager daily analytics events.",  buf,  2u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  [v14 sendDailyAnalyticsEvents];

  v24 = @"enabled";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[SFRestrictionsPasscodeController settingEnabled]( &OBJC_CLASS___SFRestrictionsPasscodeController,  "settingEnabled")));
  *(void *)buf = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  buf,  &v24,  1LL));
  AnalyticsSendEvent(@"com.apple.appletv.restrictions.daily", v16);

  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBUserProfileManager sharedInstance]( &OBJC_CLASS___PBUserProfileManager,  "sharedInstance",  @"usersCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 userProfilesSnapshot]);
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v18 _customNamesCount]));
  id v22 = v19;
  double v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  AnalyticsSendEvent(@"com.apple.appletv.multiuser.customname", v20);
}

- (void)_reportOptInConditionalMetrics
{
}

- (id)DisplayModeBinding
{
  if (qword_100470978 != -1) {
    dispatch_once(&qword_100470978, &stru_1003D4E18);
  }
  return (id)qword_100470980;
}

- (void)tvs_bindDisplayModeBindingToObject:(id)a3 withKeyPath:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService tvs_bindingAdaptor](self, "tvs_bindingAdaptor"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService DisplayModeBinding](self, "DisplayModeBinding"));
  [v11 establishBinding:v12 toObject:v10 withKeyPath:v9 bindingOptions:v8 updateHandler:&stru_1003D4E58];
}

- (void)_handleDisplayModeDidChange
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayMode]);

  if (v4) {
    -[PBDataReportingService _recordEDID](self, "_recordEDID");
  }
}

- (id)_dataReportingGUID
{
  if (qword_100470990 != -1) {
    dispatch_once(&qword_100470990, &stru_1003D4E78);
  }
  return (id)qword_100470988;
}

- (id)_coreControlDisplayAttributesForCurrentDisplay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
  [v5 latency];
  double v7 = v6;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v7));
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v8, @"pb_ccLatency_Display");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 physicalAddress]);
    if ([v10 length])
    {
      double v11 = (unsigned __int8 *)[v10 bytes];
      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d.%d.%d.%d",  *v11 >> 4,  *v11 & 0xF,  v11[1] >> 4,  v11[1] & 0xF));
        if ([v12 length]) {
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"pb_ccPhyAddr");
        }
      }
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 manufacturer]);
    if ([v13 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v13, @"pb_ccMfrPNPID");
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 audioLatencyProgressive]);
    if (v14) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v14, @"pb_ccLatency_Audio_P");
    }
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 audioLatencyInterlaced]);
    if (v15) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, @"pb_ccLatency_Audio_I");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 videoLatencyProgressive]);
    if (v16) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v16, @"pb_ccLatency_Video_P");
    }
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v9 videoLatencyInterlaced]);
    if (v17) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, @"pb_ccLatency_Video_I");
    }
  }

  return v4;
}

- (id)_arcPreferenceData
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.audio.piper");
  -[NSUserDefaults floatForKey:](v3, "floatForKey:", @"DebounceTimeout");
  dispatch_time_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v2 setObject:v4 forKey:@"arc_ccDebounceTimeout"];

  char v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"EnableArcFeature")));
  [v2 setObject:v5 forKey:@"arc_ccEnableARC"];

  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSUserDefaults BOOLForKey:](v3, "BOOLForKey:", @"EnableEarcFeature")));
  [v2 setObject:v6 forKey:@"arc_ccEnableEARC"];

  -[NSUserDefaults floatForKey:](v3, "floatForKey:", @"HdmiRegulatorToggleTimeout");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v2 setObject:v7 forKey:@"arc_ccHDMIRegulatorToggleTimeout"];

  -[NSUserDefaults floatForKey:](v3, "floatForKey:", @"MuteDelay");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v2 setObject:v8 forKey:@"arc_ccMuteDelay"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[NSUserDefaults integerForKey:](v3, "integerForKey:", @"PapagaioDeviceTimeout")));
  [v2 setObject:v9 forKey:@"arc_ccPapagaioDeviceTimeout"];

  -[NSUserDefaults floatForKey:](v3, "floatForKey:", @"SystemLatency");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  [v2 setObject:v10 forKey:@"arc_ccSystemLatency"];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](v3, "dictionaryForKey:", @"PiperProperties"));
  if ([v11 count])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v11, "tvs_BOOLForKey:defaultValue:", @"Is ARC Enabled", 0)));
    [v2 setObject:v12 forKey:@"arc_ccPiperIsARCEnabled"];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v11, "tvs_BOOLForKey:defaultValue:", @"Is eARC Feature Enabled", 0)));
    [v2 setObject:v13 forKey:@"arc_ccPiperIsEARCEnabled"];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v11, "tvs_BOOLForKey:defaultValue:", @"Is SAM Enabled", 0)));
    [v2 setObject:v14 forKey:@"arc_ccPiperIsSAMEnabled"];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(v11, "tvs_BOOLForKey:defaultValue:", @"Is Stream Valid", 0)));
    [v2 setObject:v15 forKey:@"arc_ccPiperIsStreamValid"];

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_stringForKey:", @"State"));
    if ([v16 length]) {
      [v2 setObject:v16 forKey:@"arc_ccPiperState"];
    }
    double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_dataForKey:", @"Audio Channel Layout"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 base64EncodedStringWithOptions:0]);
    if ([v18 length]) {
      [v2 setObject:v18 forKey:@"arc_ccPiperAudioChannelLayout"];
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_dataForKey:", @"Audio Channel Map"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 base64EncodedStringWithOptions:0]);
    if ([v20 length]) {
      [v2 setObject:v20 forKey:@"arc_ccPiperAudioChannelMap"];
    }
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_dataForKey:", @"Audio Virtual Format"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 base64EncodedStringWithOptions:0]);
    if ([v22 length]) {
      [v2 setObject:v22 forKey:@"arc_ccPiperAudioVirtualFormat"];
    }
  }

  return v2;
}

- (id)_coreControlCapabilityDataForDisplay:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 capabilities]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supports4K]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v8,  @"pb_ccVideo18gbpsModes");

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 supportsDolbyVision]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v9,  @"pb_ccVideoDoViModes");

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 supportsDynamicRange:538423555]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v10,  @"pb_ccVideoDoViLLModes");

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 supportsHDR]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v11,  @"pb_ccVideoHDR10Modes");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 supportsQMS]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v12,  @"pb_ccQMSAvailable");

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v7 supportsHDR10Plus]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v13,  @"pb_ccHDR10PlusAvailable");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userSelectedDisplayMode]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v14 promotedToReal]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v15,  @"pb_ccVideoVirtualModeAccepted");

  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 audioLatencyForDisplayMode:v14]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v16,  @"pb_ccAudCalLatency");

  double v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 isAdvertisingHDMI2]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v17,  @"pb_ccVideoEDIDMaybeHDMI2.0");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  id v19 = [v18 isDolbyAtmosAvailable];

  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v20,  @"pb_ccAudioAtmosHW");

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  id v22 = [v21 isDolbyDigitalEncoderAvailable];

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v22));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, @"pb_ccAudioDD5_1");

  unint64_t v24 = (unint64_t)[v6 eARCStatus];
  if (v24 > 3) {
    v25 = @"unknown";
  }
  else {
    v25 = off_1003D5330[v24];
  }
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v25, @"pb_ccAudARCState");
  if (-[PBDataReportingService persistentDisplayModeValue](self, "persistentDisplayModeValue"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[PBDataReportingService persistentDisplayModeValue](self, "persistentDisplayModeValue")));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v26, @"pb_ccVideoModeValue");
  }

  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService persistentDisplayModeString](self, "persistentDisplayModeString"));
  id v28 = [v27 length];

  if (v28)
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService persistentDisplayModeString](self, "persistentDisplayModeString"));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v29, @"pb_ccVideoModeString");
  }

  return v5;
}

- (void)_cacheCoreControlUsageNow
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v4 = [v3 powerState];

  if (v4 == (id)3)
  {
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = 0;
      double v6 = "Not caching CoreControl usage - asleep.";
      double v7 = (uint8_t *)&v24;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_18;
    }

    goto LABEL_18;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService cachedCoreControlUsage](self, "cachedCoreControlUsage"));
  id v9 = [v8 count];

  if (!v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBExternalControlSystem sharedSystem](&OBJC_CLASS___PBExternalControlSystem, "sharedSystem"));
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 gatherUsageReportingData]);

    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService _dataReportingGUID](self, "_dataReportingGUID"));
    uint64_t v13 = v12;
    if (v5 && [v12 length]) {
      [v11 setObject:v13 forKey:@"pb_guid"];
    }
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBDataReportingService _coreControlCapabilityDataForDisplay:]( self,  "_coreControlCapabilityDataForDisplay:",  v14));
    [v11 addEntriesFromDictionary:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBDataReportingService _coreControlDisplayAttributesForCurrentDisplay:]( self,  "_coreControlDisplayAttributesForCurrentDisplay:",  v14));
    [v11 addEntriesFromDictionary:v16];

    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService _arcPreferenceData](self, "_arcPreferenceData"));
    [v11 addEntriesFromDictionary:v17];

    if ([v11 count])
    {
      -[PBDataReportingService setCachedCoreControlUsage:](self, "setCachedCoreControlUsage:", v11);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = 0;
        id v19 = "Cached CoreControl usage.";
        double v20 = (uint8_t *)&v22;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
      }
    }

    else
    {
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = 0;
        id v19 = "Not re-caching CoreControl usage - no data.";
        double v20 = (uint8_t *)&v21;
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }

  char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    double v6 = "Not re-caching CoreControl usage - already cached.";
    double v7 = buf;
    goto LABEL_7;
  }

- (void)_recordEDID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBDisplayIdentifier mainDisplayIdentifier]( &OBJC_CLASS___PBDisplayIdentifier,  "mainDisplayIdentifier"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 attributes]);

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 displayEDID]);
  double v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService seenEDIDs](self, "seenEDIDs"));
    id v9 = [v8 count];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService seenEDIDs](self, "seenEDIDs"));
    [v10 addObject:v6];

    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService seenEDIDs](self, "seenEDIDs"));
    id v12 = [v11 count];

    if (v12 > v9)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 productID]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 manufacturer]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 product]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 physicalAddress]);
      double v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (v13 && [v13 integerValue])
      {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v13, @"ProductID");
      }

      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v4 WOM]);
        if (v18) {
          -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, @"WeekOfManufacture");
        }
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 YOM]);
      if (v19) {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v19, @"YearOfManufacture");
      }
      if (v14) {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v14, @"ManufacturerPNPID");
      }
      if (v15) {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v15, @"Product");
      }
      if (v16) {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v16, @"PhysicalAddress");
      }
      if (-[NSMutableDictionary count](v17, "count"))
      {
        double v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService toReportEDIDData](self, "toReportEDIDData"));
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
        [v20 setObject:v17 forKey:v21];
      }
    }
  }
}

- (void)_sendEDIDLogs
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending EDID logs.", v15, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService toReportEDIDData](self, "toReportEDIDData"));
  id v5 = [v4 copy];

  if (v5 && [v5 count])
  {
    double v6 = objc_alloc_init(&OBJC_CLASS___NSDate);
    double v7 = 0.0;
    if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild"))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v8 EDIDLoggingTimePeriodInSeconds];
      double v7 = v9;
    }

    if (v7 >= 60.0) {
      double v10 = v7;
    }
    else {
      double v10 = 7200.0;
    }
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService lastSentEDIDTimestamp](self, "lastSentEDIDTimestamp"));
    -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", v11);
    double v13 = v12;

    if (v13 <= v10)
    {
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10027A66C();
      }
    }

    else
    {
      -[PBDataReportingService setLastSentEDIDTimestamp:](self, "setLastSentEDIDTimestamp:", v6);
      -[PBDataReportingService _sendEDIDURLRequest:](self, "_sendEDIDURLRequest:", v5);
    }
  }

  else
  {
    double v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEBUG)) {
      sub_10027A640();
    }
  }
}

- (void)_sendEDIDURLRequest:(id)a3
{
  id v4 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PBDataReportingService _reportingURLForTopic:]( self,  "_reportingURLForTopic:",  @"atv_av_connectivity"));
  if (v19)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService _dataReportingGUID](self, "_dataReportingGUID"));
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10027A6C4(v4, v6);
    }

    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v18 = v4;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", *(void *)(*((void *)&v20 + 1)
                                                                                             + 8LL * (void)i), v18));
          if (v12)
          {
            double v13 = (void *)v12;
            if ([v5 length])
            {
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
              [v14 setObject:v5 forKey:@"pb_guid"];
              id v15 = [v14 copy];

              double v13 = v15;
            }

            -[PBDataReportingService _sendToURL:withSubtopic:andParameters:]( self,  "_sendToURL:withSubtopic:andParameters:",  v19,  @"EDID",  v13);
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v9);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[PBDataReportingService setToReportEDIDData:](self, "setToReportEDIDData:", v16);

    id v4 = v18;
  }

  else
  {
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10027A698();
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[PBDataReportingService setToReportEDIDData:](self, "setToReportEDIDData:", v5);
  }
}

- (void)_sendCoreControlUsage
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending CoreControl usage.", v13, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBDataReportingService _reportingURLForTopic:]( self,  "_reportingURLForTopic:",  @"atv_av_connectivity"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    id v6 = [v5 powerState];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService cachedCoreControlUsage](self, "cachedCoreControlUsage"));
    id v8 = v7;
    BOOL v9 = v6 == (id)1 || v7 == 0LL;
    if (v9 || ![v7 count])
    {
      -[PBDataReportingService _cacheCoreControlUsageNow](self, "_cacheCoreControlUsageNow");
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[PBDataReportingService cachedCoreControlUsage](self, "cachedCoreControlUsage"));
      if ([v11 count])
      {
        uint64_t v12 = (os_log_s *)[v11 copy];
        -[PBDataReportingService _sendToURL:withSubtopic:andParameters:]( self,  "_sendToURL:withSubtopic:andParameters:",  v4,  @"CoreControl",  v12);
      }

      else
      {
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10027A774();
        }
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_10027A7A0();
      }

      id v11 = [v8 copy];
      -[PBDataReportingService _sendToURL:withSubtopic:andParameters:]( self,  "_sendToURL:withSubtopic:andParameters:",  v4,  @"CoreControl",  v11);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_10027A748();
    }
  }
}

- (id)_reportingURLForTopic:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 figaroLoggingURL]);

  if (![v6 length])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"userxp-edid-url"]);
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
        BOOL v9 = v7;
      }
      else {
        BOOL v9 = 0LL;
      }
    }

    else
    {
      BOOL v9 = 0LL;
    }

    id v10 = v9;

    id v6 = v10;
  }

  if (![v6 length])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"atvMetricsTopics"]);
    if (v11)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      {
        if ([v11 containsObject:v3])
        {
          double v13 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:@"metrics"]);
          if (v13)
          {
            uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
              id v15 = v13;
            }
            else {
              id v15 = 0LL;
            }
          }

          else
          {
            id v15 = 0LL;
          }

          id v16 = v15;
          double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 valueForKey:@"ATV"]);

          if (v17)
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
              id v19 = v17;
            }
            else {
              id v19 = 0LL;
            }
          }

          else
          {
            id v19 = 0LL;
          }

          id v20 = v19;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 valueForKey:@"metricsUrl"]);

          if (v21)
          {
            uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
              __int128 v23 = v21;
            }
            else {
              __int128 v23 = 0LL;
            }
          }

          else
          {
            __int128 v23 = 0LL;
          }

          id v24 = v23;
          if ([v24 length])
          {
            uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v24,  @"2"));

            id v6 = (void *)v25;
          }
        }
      }
    }
  }

  if ([v6 length])
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v6, v3));
  }

  else
  {
    int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10027A7CC();
    }

    v26 = 0LL;
  }

  return v26;
}

- (void)_sendToURL:(id)a3 withSubtopic:(id)a4 andParameters:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a5));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice productType](&OBJC_CLASS___TVSDevice, "productType"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByReplacingOccurrencesOfString:@"." withString:@"_"]);

  uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 stringByReplacingOccurrencesOfString:@"," withString:@"_"]);
  if (-[__CFString length](v12, "length")) {
    double v13 = v12;
  }
  else {
    double v13 = @"NA";
  }
  uint64_t v14 = v13;

  [v9 setObject:v14 forKey:@"device"];
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[TVSDevice systemBuildVersion](&OBJC_CLASS___TVSDevice, "systemBuildVersion"));
  if (-[__CFString length](v15, "length")) {
    id v16 = v15;
  }
  else {
    id v16 = @"NA";
  }
  double v17 = v16;

  [v9 setObject:v17 forKey:@"os-ver"];
  [v9 setObject:@"2" forKey:@"version"];
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10027A82C();
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
  +[PBiTunesStoreMetricsUploader uploadData:withSubtopic:toURL:withCompletion:]( &OBJC_CLASS___PBiTunesStoreMetricsUploader,  "uploadData:withSubtopic:toURL:withCompletion:",  v9,  v7,  v19,  &stru_1003D4EB8);
}

- (void)_reportBluetoothDeviceMetrics
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting Bluetooth device metrics.", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBBluetoothObserver sharedInstance](&OBJC_CLASS___PBBluetoothObserver, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pairedDevices]);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000AF228;
  v26[3] = &unk_1003D2080;
  id v6 =  -[PBBluetoothDeviceStatistics initWithDevices:]( objc_alloc(&OBJC_CLASS___PBBluetoothDeviceStatistics),  "initWithDevices:",  v5);
  int v27 = v6;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000AF2E8;
  v24[3] = &unk_1003D2080;
  id v7 = v6;
  uint64_t v25 = v7;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v24);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000AF3A8;
  v22[3] = &unk_1003D2080;
  id v8 = v7;
  __int128 v23 = v8;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000AF468;
  v20[3] = &unk_1003D2080;
  BOOL v9 = v8;
  __int128 v21 = v9;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v20);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000AF528;
  v18[3] = &unk_1003D2080;
  id v10 = v9;
  id v19 = v10;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000AF5E8;
  v16[3] = &unk_1003D2080;
  double v17 = v10;
  id v11 = v10;
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000AF6A8;
  v15[3] = &unk_1003D4ED8;
  v15[4] = -[PBDataReportingService _quantizedTimeForKey:](self, "_quantizedTimeForKey:", @"inertialsensortime");
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth.siriremote", v15);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService keyTimingTotals](self, "keyTimingTotals"));
  [v12 removeObjectForKey:@"inertialsensortime"];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000AF760;
  v14[3] = &unk_1003D4ED8;
  v14[4] = -[PBDataReportingService _quantizedTimeForKey:](self, "_quantizedTimeForKey:", @"audiostreamtime");
  AnalyticsSendEventLazy(@"com.apple.appletv.devices.bluetooth.siriremote", v14);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService keyTimingTotals](self, "keyTimingTotals"));
  [v13 removeObjectForKey:@"audiostreamtime"];
}

- (void)_reportUserAppMetrics
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting user app metrics", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000AF8C8;
  v4[3] = &unk_1003D2080;
  void v4[4] = self;
  AnalyticsSendEventLazy(@"com.apple.appletv.apps.user", v4);
}

+ (id)_userAppsMetricsDictionary
{
  id v3 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  id v5 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v3,  "initWithInfoStore:filter:delegate:",  v4,  &stru_1003D4EF8,  0LL);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v53 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](v5, "appInfos"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000AFF30;
  v60[3] = &unk_1003D4F20;
  id v8 = v6;
  v61 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v60];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1000AFFEC;
  v59[3] = &unk_1003D4F40;
  v59[4] = a1;
  v52 = v8;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v8, "sortedArrayUsingComparator:", v59));
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = [(id)objc_opt_class(a1) _userAppsMetricsDictionaryWithSortedApplicationRecords:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  int v58 = 0;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v14 = objc_msgSend( v13,  "tvs_onDiskSizeOfDirectoryAtPath:status:",  @"/var/mobile/Library/OnDemandResources/",  &v58);

  if (!v58)
  {
    id v15 = [(id)objc_opt_class(a1) _roundDiskUsageInBytesToMB:v14];
    id v16 = [v12 mutableCopy];
    double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15));
    [v16 setObject:v17 forKey:@"onDemandResourcesTotalDiskUsage"];

    id v18 = [v16 copy];
    uint64_t v12 = v18;
  }

  -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v12, v12);
  v51 = v9;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bs_filter:", &stru_1003D4F80));
  id v20 = a1;
  id v21 = [(id)objc_opt_class(a1) _userAppsMetricsDictionaryWithSortedApplicationRecords:v19];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"installed"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v10, "bs_setSafeObject:forKey:", v23, @"gamesInstalled");

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"totalDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v10, "bs_setSafeObject:forKey:", v24, @"gamesTotalDiskUsage");

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"meanDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v10, "bs_setSafeObject:forKey:", v25, @"gamesMeanDiskUsage");

  v26 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"medianDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v10, "bs_setSafeObject:forKey:", v26, @"gamesMedianDiskUsage");

  int v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v29 = v19;
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v55 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        else {
          v35 = v28;
        }
        -[NSMutableArray addObject:](v35, "addObject:", v34);
      }

      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }

    while (v31);
  }

  id v36 = [(id)objc_opt_class(v20) _userAppsMetricsDictionaryWithSortedApplicationRecords:v27];
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"installed"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:](v10, "bs_setSafeObject:forKey:", v38, @"arcadeGamesInstalled");

  v39 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"totalDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v39,  @"arcadeGamesTotalDiskUsage");

  v40 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"meanDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v40,  @"arcadeGamesMeanDiskUsage");

  v41 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:@"medianDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v41,  @"arcadeGamesMedianDiskUsage");

  id v42 = [(id)objc_opt_class(v20) _userAppsMetricsDictionaryWithSortedApplicationRecords:v28];
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"installed"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v44,  @"nonArcadeGamesInstalled");

  v45 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"totalDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v45,  @"nonArcadeGamesTotalDiskUsage");

  v46 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"meanDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v46,  @"nonArcadeGamesMeanDiskUsage");

  v47 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"medianDiskUsage"]);
  -[NSMutableDictionary bs_setSafeObject:forKey:]( v10,  "bs_setSafeObject:forKey:",  v47,  @"nonArcadeGamesMedianDiskUsage");

  id v48 = -[NSMutableDictionary copy](v10, "copy");
  return v48;
}

+ (unint64_t)_totalDiskUsageInBytesWithLSApplicationRecord:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 diskUsage]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 staticUsage]);
  id v6 = (char *)[v5 unsignedIntegerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 diskUsage]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dynamicUsage]);
  BOOL v9 = &v6[(void)[v8 unsignedIntegerValue]];

  return (unint64_t)v9;
}

+ (id)_userAppsMetricsDictionaryWithSortedApplicationRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v6 = (unint64_t)[v4 count];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v6));
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"installed");

  if (v6)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000B03E4;
    v28[3] = &unk_1003D4FA0;
    v28[4] = a1;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", v28));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += (uint64_t)[*(id *)(*((void *)&v24 + 1) + 8 * (void)i) unsignedIntegerValue];
        }

        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, @"totalDiskUsage");

    id v15 = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [(id)objc_opt_class(a1) _averageDiskUsageInMB:v11 numberOfApps:v6]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v16, @"meanDiskUsage");

    double v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v6 >> 1]);
    id v18 = (char *)[v17 unsignedIntegerValue];

    if ((v6 & 1) == 0)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:(v6 >> 1) - 1]);
      id v20 = &v18[(void)[v19 unsignedIntegerValue]];

      id v18 = (char *)[(id)objc_opt_class(a1) _averageDiskUsageInMB:v20 numberOfApps:2];
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v18));
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v21, @"medianDiskUsage");
  }

  id v22 = -[NSMutableDictionary copy](v5, "copy");

  return v22;
}

+ (unint64_t)_averageDiskUsageInMB:(unint64_t)a3 numberOfApps:(unint64_t)a4
{
  unint64_t v4 = vcvtpd_u64_f64((double)(unint64_t)round((double)a3 / (double)a4) / 50.0);
  if (v4) {
    return 50 * v4;
  }
  else {
    return 50LL;
  }
}

+ (unint64_t)_roundDiskUsageInBytesToMB:(unint64_t)a3
{
  unint64_t v3 = vcvtpd_u64_f64((double)a3 / 52428800.0);
  if (v3) {
    return 50 * v3;
  }
  else {
    return 50LL;
  }
}

- (void)_reportButtonPressMetrics
{
  unsigned __int8 v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reporting button press metrics.", buf, 2u);
  }

  if ((unint64_t)(qword_100470928
                        + qword_100470920
                        + qword_100470930
                        + qword_100470938
                        + qword_100470940
                        + qword_100470948) <= 1)
    unint64_t v3 = 1LL;
  else {
    unint64_t v3 = qword_100470928 + qword_100470920 + qword_100470930 + qword_100470938 + qword_100470940 + qword_100470948;
  }
  unint64_t v4 = 100 * qword_100470920 / v3;
  unint64_t v5 = 100 * qword_100470928 / v3;
  unint64_t v6 = 100 * qword_100470930 / v3;
  unint64_t v7 = 100 * qword_100470938 / v3;
  unint64_t v8 = 100 * qword_100470940 / v3;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000B0928;
  v24[3] = &unk_1003D4ED8;
  void v24[4] = v4;
  unint64_t v9 = 100 * qword_100470948 / v3;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000B09F4;
  v23[3] = &unk_1003D4ED8;
  v23[4] = v5;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000B0AC0;
  v22[3] = &unk_1003D4ED8;
  void v22[4] = v6;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B0B8C;
  v21[3] = &unk_1003D4ED8;
  v21[4] = v7;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000B0C58;
  v20[3] = &unk_1003D4ED8;
  void v20[4] = v8;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000B0D24;
  v19[3] = &unk_1003D4ED8;
  v19[4] = v9;
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v19);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    unint64_t v26 = v4;
    __int16 v27 = 2048;
    uint64_t v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = v6;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    uint64_t v36 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Button Percents: BTRemote: %ld, IR: %ld, CEC: %ld, Keyboard: %ld, GC: %ld, Remote App: %ld",  buf,  0x3Eu);
  }

  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219520;
    unint64_t v26 = v3;
    __int16 v27 = 2048;
    uint64_t v28 = qword_100470920;
    __int16 v29 = 2048;
    uint64_t v30 = qword_100470928;
    __int16 v31 = 2048;
    uint64_t v32 = qword_100470930;
    __int16 v33 = 2048;
    uint64_t v34 = qword_100470938;
    __int16 v35 = 2048;
    uint64_t v36 = qword_100470940;
    __int16 v37 = 2048;
    uint64_t v38 = qword_100470948;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Button Count: Total:%ld BTRemote: %ld, IR: %ld, CEC: %ld, Keyboard: %ld, GC: %ld, Remote App: %ld",  buf,  0x48u);
  }

  qword_100470920 = 0LL;
  qword_100470928 = 0LL;
  qword_100470930 = 0LL;
  qword_100470938 = 0LL;
  qword_100470940 = 0LL;
  qword_100470948 = 0LL;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueForKey:@"atvMetricsQuantizeButtonPresses"]);

  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
    uint64_t v15 = (uint64_t)[v13 unsignedIntegerValue];
  }
  else {
    uint64_t v15 = 5LL;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000B0DF0;
  v18[3] = &unk_1003D4ED8;
  void v18[4] = -[PBDataReportingService _integer:quantizedBy:](self, "_integer:quantizedBy:", qword_100470910, v15);
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v18);
  qword_100470910 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000B0EBC;
  v17[3] = &unk_1003D4ED8;
  v17[4] = -[PBDataReportingService _integer:quantizedBy:](self, "_integer:quantizedBy:", qword_100470918, v15);
  AnalyticsSendEventLazy(@"com.apple.appletv.buttonpress", v17);
  qword_100470918 = 0LL;
}

- (void)_reportButtonEventMetrics
{
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Reporting remote button press count metrics.",  v7,  2u);
  }

  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService buttonPressTotals](self, "buttonPressTotals"));
  id v5 = [v4 copy];

  [v5 enumerateKeysAndObjectsUsingBlock:&stru_1003D4FE0];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[PBDataReportingService setButtonPressTotals:](self, "setButtonPressTotals:", v6);
}

- (void)_reportNANDStatistics
{
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting NAND data.", v4, 2u);
  }

  -[PBDataReportingService performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_threadReportNANDStatistics",  self->_NANDReportingThread,  0LL,  0LL);
}

- (void)_threadReportNANDStatistics
{
  unsigned __int8 v2 = objc_autoreleasePoolPush();
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting NAND usage.", v4, 2u);
  }

  CopyCRUsageInfo();
  objc_autoreleasePoolPop(v2);
}

- (void)_reportRecoveryActions
{
  unsigned __int8 v2 = &OBJC_METACLASS___PBSystemGestureDefaultSelectionPolicy;
  unint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting RecoveryMode data.", buf, 2u);
  }

  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRecoveryModeReporter reportedActions](&OBJC_CLASS___PBSRecoveryModeReporter, "reportedActions"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v24;
    unint64_t v9 = &PBSRecoveryModeActionResetAllSettings;
    id v10 = &PBSRecoveryModeActionRestore;
    uint64_t v11 = &PBSRecoveryModeActionRestart;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v22 = v6;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        double v13 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v12);
        if (objc_msgSend(v13, "isEqualToString:", PBSRecoveryModeActionTriggered, v22))
        {
          uint64_t v14 = v2 + 86;
          uint64_t v15 = 8LL;
LABEL_16:
          -[__objc2_class incrementOccurrenceCountForAction:](v14, "incrementOccurrenceCountForAction:", v15);
          goto LABEL_17;
        }

        if ([v13 isEqualToString:*v9])
        {
          uint64_t v14 = v2 + 86;
          uint64_t v15 = 9LL;
          goto LABEL_16;
        }

        if ([v13 isEqualToString:*v10])
        {
          uint64_t v14 = v2 + 86;
          uint64_t v15 = 11LL;
          goto LABEL_16;
        }

        unsigned int v16 = [v13 isEqualToString:*v11];
        uint64_t v14 = v2 + 86;
        if (v16)
        {
          uint64_t v15 = 10LL;
          goto LABEL_16;
        }

        double v17 = v9;
        id v18 = v10;
        id v19 = v11;
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__objc2_class serviceLog](v14, "serviceLog"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v22;
          uint64_t v28 = v13;
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Ignoring unrecognized RecoveryMode action %@.",  buf,  0xCu);
        }

        uint64_t v11 = v19;
        id v10 = v18;
        unint64_t v9 = v17;
        unsigned __int8 v2 = &OBJC_METACLASS___PBSystemGestureDefaultSelectionPolicy;
LABEL_17:
        uint64_t v12 = (char *)v12 + 1;
      }

      while (v7 != v12);
      id v21 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      id v7 = v21;
    }

    while (v21);
  }
}

- (void)_reportCurrentAudioSettingsMetrics
{
}

- (void)_reportCurrentVideoSettingsMetrics
{
  if (!-[PBDataReportingService persistentDisplayModeValue](self, "persistentDisplayModeValue")) {
    -[PBDataReportingService _computeDisplayMetrics](self, "_computeDisplayMetrics");
  }
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000B1668;
  v3[3] = &unk_1003D2080;
  v3[4] = self;
  AnalyticsSendEventLazy(@"com.apple.appletv.videoSettings", v3);
}

- (void)_reportCurrentSystemSettingsMetrics
{
}

- (void)_reportCurrentAudioOutputConfiguration
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localAccessory]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 hmAccessory]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 audioDestinationController]);

  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 destination]);
  __int16 v27 = @"odeonEnabled";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6 != 0LL));
  uint64_t v28 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v9 = [v8 mutableCopy];

  if (v6)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___HMMediaSystem);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", isKindOfClass & 1));
    [v9 setObject:v12 forKeyedSubscript:@"stereoPair"];

    if ((isKindOfClass & 1) != 0)
    {
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v6 components]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mediaProfile]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accessory]);
      id v17 = [v16 homePodVariant];
    }

    else
    {
      id v17 = [v6 homePodVariant];
    }

    id v18 = @"B238";
    if (v17 == (id)3) {
      id v18 = @"B620";
    }
    if (v17 == (id)2) {
      id v19 = @"B520";
    }
    else {
      id v19 = v18;
    }
    [v9 setObject:v19 forKeyedSubscript:@"homePodVariant"];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[PBSEARCConfigurator sharedInstance](&OBJC_CLASS___PBSEARCConfigurator, "sharedInstance"));
  id v21 = (char *)[v20 eARCStatus];

  else {
    __int128 v22 = @"ARC Enabled";
  }
  else {
    __int128 v23 = v22;
  }
  [v9 setObject:v23 forKeyedSubscript:@"arcStatus"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B1CF0;
  v25[3] = &unk_1003D2080;
  id v26 = v9;
  id v24 = v9;
  AnalyticsSendEventLazy(@"com.apple.appletv.audio.output", v25);
}

- (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)(a4 - 1) <= 7) {
    +[PBDataReportingService incrementOccurrenceCountForAction:]( &OBJC_CLASS___PBDataReportingService,  "incrementOccurrenceCountForAction:",  a4 + 11);
  }
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService serialQueue](self, "serialQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B1DD0;
  v12[3] = &unk_1003D0070;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  dispatch_async(v10, v12);
}

- (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ((unint64_t)(a4 - 129) <= 8) {
    +[PBDataReportingService incrementOccurrenceCountForAction:]( &OBJC_CLASS___PBDataReportingService,  "incrementOccurrenceCountForAction:",  qword_1002EC4D8[a4 - 129]);
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBDataReportingService serviceLog](&OBJC_CLASS___PBDataReportingService, "serviceLog"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Clearing CoreControl usage cache on willWake.",  v11,  2u);
  }

  -[PBDataReportingService setCachedCoreControlUsage:](self, "setCachedCoreControlUsage:", 0LL);
  v9[2](v9);
}

- (unint64_t)_quantizedTimeForKey:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"atvMetricsQuantizeSeconds"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    uint64_t v8 = (uint64_t)[v6 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = 10LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDataReportingService keyTimingTotals](self, "keyTimingTotals"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);

  id v11 = [v10 unsignedIntegerValue];
  unint64_t v12 = -[PBDataReportingService _integer:quantizedBy:](self, "_integer:quantizedBy:", v11, v8);

  return v12;
}

- (unint64_t)_integer:(unint64_t)a3 quantizedBy:(unint64_t)a4
{
  if (!a3) {
    return 0LL;
  }
  if (a4 <= 1) {
    unint64_t v4 = 1LL;
  }
  else {
    unint64_t v4 = a4;
  }
  return a3 / v4 * v4;
}

- (NSMutableSet)seenEDIDs
{
  return self->_seenEDIDs;
}

- (void)setSeenEDIDs:(id)a3
{
}

- (NSMutableDictionary)toReportEDIDData
{
  return self->_toReportEDIDData;
}

- (void)setToReportEDIDData:(id)a3
{
}

- (NSDate)lastSentEDIDTimestamp
{
  return self->_lastSentEDIDTimestamp;
}

- (void)setLastSentEDIDTimestamp:(id)a3
{
}

- (NSMutableDictionary)keyTimingStarts
{
  return self->_keyTimingStarts;
}

- (void)setKeyTimingStarts:(id)a3
{
}

- (NSMutableDictionary)keyTimingTotals
{
  return self->_keyTimingTotals;
}

- (void)setKeyTimingTotals:(id)a3
{
}

- (NSMutableDictionary)buttonPressTotals
{
  return self->_buttonPressTotals;
}

- (void)setButtonPressTotals:(id)a3
{
}

- (NSThread)NANDReportingThread
{
  return self->_NANDReportingThread;
}

- (void)setNANDReportingThread:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSDictionary)cachedCoreControlUsage
{
  return self->_cachedCoreControlUsage;
}

- (void)setCachedCoreControlUsage:(id)a3
{
}

- (int64_t)persistentDisplayModeValue
{
  return self->_persistentDisplayModeValue;
}

- (void)setPersistentDisplayModeValue:(int64_t)a3
{
  self->_persistentDisplayModeValue = a3;
}

- (NSString)persistentDisplayModeString
{
  return self->_persistentDisplayModeString;
}

- (void)setPersistentDisplayModeString:(id)a3
{
}

- (unint64_t)qmsToggleCount
{
  return self->_qmsToggleCount;
}

- (void)setQmsToggleCount:(unint64_t)a3
{
  self->_qmsToggleCount = a3;
}

- (void).cxx_destruct
{
}

@end
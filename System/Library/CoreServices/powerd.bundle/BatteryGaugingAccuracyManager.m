@interface BatteryGaugingAccuracyManager
+ (id)InstanceManager;
- (BOOL)chargeToFullDueToDOD0:(double)a3 time:(id)a4;
- (BOOL)chargeToFullDueToQMax:(double)a3 time:(id)a4;
- (BOOL)disableSocLimitPolicy;
- (BOOL)lastChargeToFullRequested;
- (NSArray)lastDOD0Values;
- (NSArray)lastQMaxArray;
- (NSDate)lastAttemptedFullChargeDate;
- (NSDate)lastDOD0Update;
- (NSDate)lastFullChargeDate;
- (NSDate)lastQMaxUpdate;
- (NSDate)lastQualifiedQmaxDate;
- (NSNumber)lastDOD0ValueAtQualQmax;
- (NSNumber)testDOD0UpdateDate;
- (NSNumber)testFullyChargedDate;
- (NSNumber)testQmaxUpdateDate;
- (NSNumber)testQualifiedQMaxDOD0Value;
- (NSNumber)testQualifiedQMaxDate;
- (double)timeSinceLastDOD0Update;
- (double)timeSinceLastQmaxUpdate;
- (id)batteryPercentFromBatteryProperties:(id)a3;
- (id)dod0ArrayFromBatteryProperties:(id)a3;
- (id)dod0AtQualQmaxFromBatteryProperties:(id)a3;
- (id)externalConnectedFromBatteryProperties:(id)a3;
- (id)fcStatusFromBatteryProperties:(id)a3;
- (id)gaugingAccuracyMetricGet;
- (id)gaugingMitigationStatistics;
- (id)getBatteryProperties;
- (id)initBatteryGaugingAccuracyData;
- (id)qMaxFromBatteryProperties:(id)a3;
- (unint64_t)lastMaxDaysSinceFC;
- (unint64_t)lastMaxDaysSinceOcv;
- (unint64_t)lastMaxDaysSinceQmax;
- (unint64_t)lastNumOfChargeToFullReached;
- (unint64_t)lastNumOfChargeToFullRequest;
- (unint64_t)lastNumOfDOD0QualQmaxUpdates;
- (unint64_t)lastNumOfOcvRequested;
- (unint64_t)lastNumOfQmaxRequested;
- (unint64_t)lastNumOfQmaxTooOld;
- (unint64_t)lastNumOfQmaxTooRecent;
- (unint64_t)lastNumOfQmaxTooSmall;
- (unint64_t)maxDaysSinceFC;
- (unint64_t)maxDaysSinceOcv;
- (unint64_t)maxDaysSinceQmax;
- (unint64_t)numOfChargeToFullReached;
- (unint64_t)numOfChargeToFullRequest;
- (unint64_t)numOfDOD0QualQmaxUpdates;
- (unint64_t)numOfOcvRequested;
- (unint64_t)numOfQmaxRequested;
- (unint64_t)numOfQmaxTooOld;
- (unint64_t)numOfQmaxTooRecent;
- (unint64_t)numOfQmaxTooSmall;
- (void)handleAlarmEvent:(id)a3;
- (void)handleBatteryStateDataUpdate;
- (void)incrAnalyticsMetricsAttribute:(unint64_t *)a3;
- (void)periodicActions;
- (void)periodicChargeToFullCheck;
- (void)reportMonthlyData;
- (void)requestPeriodicActionsInMinutes:(int)a3 waking:(BOOL)a4;
- (void)restoreAnalyticDataFromDisk:(id)a3 :(unint64_t *)a4;
- (void)setLastAttemptedFullChargeDate:(id)a3;
- (void)setLastChargeToFullRequested:(BOOL)a3;
- (void)setLastDOD0Update:(id)a3;
- (void)setLastDOD0ValueAtQualQmax:(id)a3;
- (void)setLastDOD0Values:(id)a3;
- (void)setLastFullChargeDate:(id)a3;
- (void)setLastMaxDaysSinceFC:(unint64_t)a3;
- (void)setLastMaxDaysSinceOcv:(unint64_t)a3;
- (void)setLastMaxDaysSinceQmax:(unint64_t)a3;
- (void)setLastNumOfChargeToFullReached:(unint64_t)a3;
- (void)setLastNumOfChargeToFullRequest:(unint64_t)a3;
- (void)setLastNumOfDOD0QualQmaxUpdates:(unint64_t)a3;
- (void)setLastNumOfOcvRequested:(unint64_t)a3;
- (void)setLastNumOfQmaxRequested:(unint64_t)a3;
- (void)setLastNumOfQmaxTooOld:(unint64_t)a3;
- (void)setLastNumOfQmaxTooRecent:(unint64_t)a3;
- (void)setLastNumOfQmaxTooSmall:(unint64_t)a3;
- (void)setLastQMaxArray:(id)a3;
- (void)setLastQMaxUpdate:(id)a3;
- (void)setLastQualifiedQmaxDate:(id)a3;
- (void)setMaxDaysSinceFC:(unint64_t)a3;
- (void)setMaxDaysSinceOcv:(unint64_t)a3;
- (void)setMaxDaysSinceQmax:(unint64_t)a3;
- (void)setNumOfChargeToFullReached:(unint64_t)a3;
- (void)setNumOfChargeToFullRequest:(unint64_t)a3;
- (void)setNumOfDOD0QualQmaxUpdates:(unint64_t)a3;
- (void)setNumOfOcvRequested:(unint64_t)a3;
- (void)setNumOfQmaxRequested:(unint64_t)a3;
- (void)setNumOfQmaxTooOld:(unint64_t)a3;
- (void)setNumOfQmaxTooRecent:(unint64_t)a3;
- (void)setNumOfQmaxTooSmall:(unint64_t)a3;
- (void)setTestDOD0UpdateDate:(id)a3;
- (void)setTestFullyChargedDate:(id)a3;
- (void)setTestQmaxUpdateDate:(id)a3;
- (void)setTestQualifiedQMaxDOD0Value:(id)a3;
- (void)setTestQualifiedQMaxDate:(id)a3;
- (void)setTimeSinceLastDOD0Update:(double)a3;
- (void)setTimeSinceLastQmaxUpdate:(double)a3;
- (void)updateAnalyticsData;
- (void)updateAnalyticsMetricsMaxAttribute:(unint64_t *)a3 interval:(double)a4;
- (void)updateLastDOD0Values:(id)a3 atDate:(id)a4;
- (void)updateLastQMaxArray:(id)a3 atDate:(id)a4;
- (void)writeNSNumberDataToDisk:(id)a3 :(id)a4;
@end

@implementation BatteryGaugingAccuracyManager

- (id)dod0AtQualQmaxFromBatteryProperties:(id)a3
{
  v3 = (dispatch_queue_s *)qword_100067540;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BatteryData"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Dod0AtQualifiedQmax"]);
  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (id)batteryPercentFromBatteryProperties:(id)a3
{
  v3 = (dispatch_queue_s *)qword_100067540;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BatteryData"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"StateOfCharge"]);
  if (v6) {
    id v7 = v6;
  }

  return v6;
}

- (id)fcStatusFromBatteryProperties:(id)a3
{
  v3 = (dispatch_queue_s *)qword_100067540;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"FullyCharged"]);

  if (v5) {
    id v6 = v5;
  }

  return v5;
}

- (id)externalConnectedFromBatteryProperties:(id)a3
{
  v3 = (dispatch_queue_s *)qword_100067540;
  id v4 = a3;
  dispatch_assert_queue_V2(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"ExternalConnected"]);

  if (v5) {
    id v6 = v5;
  }

  return v5;
}

- (id)dod0ArrayFromBatteryProperties:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BatteryData"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"DOD0"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BatteryFCCData"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"DOD0"]);

    if (v9)
    {
      v11 = v9;
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    }

    else
    {
      id v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

- (id)qMaxFromBatteryProperties:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BatteryData"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Qmax"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"BatteryData"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"ITMiscStatus"]);

    if (v9)
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v7 addObject:v9];
    }

    else
    {
      id v7 = &__NSArray0__struct;
    }
  }

  return v7;
}

- (BOOL)chargeToFullDueToDOD0:(double)a3 time:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  testDOD0UpdateDate = self->_testDOD0UpdateDate;
  if (!testDOD0UpdateDate)
  {
    if (a3 >= 259200.0) {
      goto LABEL_7;
    }
    -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  &self->_numOfOcvRequested);
    v10 = (os_log_s *)qword_100068818;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v17 = 134217984;
    double v18 = a3 / 86400.0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Last DOD0 Change: %.1f days too recent",  (uint8_t *)&v17,  0xCu);
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }

  -[NSNumber doubleValue](testDOD0UpdateDate, "doubleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  [v6 timeIntervalSinceDate:v8];
  if (v9 < 259200.0)
  {
    v13 = (void *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      [v6 timeIntervalSinceDate:v8];
      int v17 = 134217984;
      double v18 = v15 / 86400.0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "(Test) Last DOD0 Change: %.1f days too recent",  (uint8_t *)&v17,  0xCu);
    }

    goto LABEL_13;
  }

LABEL_7:
  v12 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    double v18 = a3 / 86400.0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Last DOD0 Change: %.1f days ago; charge to full",
      (uint8_t *)&v17,
      0xCu);
  }

  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)chargeToFullDueToQMax:(double)a3 time:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  testQmaxUpdateDate = self->_testQmaxUpdateDate;
  if (testQmaxUpdateDate)
  {
    -[NSNumber doubleValue](testQmaxUpdateDate, "doubleValue");
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    [v6 timeIntervalSinceDate:v8];
    if (v9 < 1209600.0)
    {
      v16 = (void *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = v16;
        [v6 timeIntervalSinceDate:v8];
        int v40 = 134217984;
        double v41 = v18 / 86400.0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "(Test) Last Qmax change was %.1f days ago too recent",  (uint8_t *)&v40,  0xCu);
      }

      goto LABEL_28;
    }
  }

  else if (a3 < 1209600.0)
  {
    v10 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 134217984;
      double v41 = a3 / 86400.0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Last Qmax change was %.1f days ago too recent",  (uint8_t *)&v40,  0xCu);
    }

    p_numOfQmaxTooRecent = &self->_numOfQmaxTooRecent;
    goto LABEL_32;
  }

  testQualifiedQMaxDOD0Value = self->_testQualifiedQMaxDOD0Value;
  if (!testQualifiedQMaxDOD0Value)
  {
    lastDOD0ValueAtQualQmax = self->_lastDOD0ValueAtQualQmax;
    if (lastDOD0ValueAtQualQmax && -[NSNumber intValue](lastDOD0ValueAtQualQmax, "intValue") <= 50000)
    {
      v20 = (void *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_lastDOD0ValueAtQualQmax;
        v22 = v20;
        int v40 = 67109120;
        LODWORD(v41) = -[NSNumber intValue](v21, "intValue");
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "QMax update necessary, but dod0 at last qual Qmax was too small (%d)",  (uint8_t *)&v40,  8u);
      }

      p_numOfQmaxTooRecent = &self->_numOfQmaxTooSmall;
      goto LABEL_32;
    }

- (void)requestPeriodicActionsInMinutes:(int)a3 waking:(BOOL)a4
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  time_t v6 = time(0LL);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (v6 + 60 * a3));
  if (!a4) {
    xpc_dictionary_set_BOOL(xdict, "ShouldWake", 0);
  }
  xpc_set_event("com.apple.alarm", "GaugingMitigationActions", xdict);
}

- (void)handleAlarmEvent:(id)a3
{
  id v4 = (dispatch_queue_s *)qword_100067540;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  time_t v6 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v5, _xpc_event_key_name));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v5);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  xpc_connection_send_message(v10, reply);
  BOOL v11 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Alarm fired for %@", (uint8_t *)&v12, 0xCu);
  }
}

- (id)getBatteryProperties
{
  v2 = IOServiceMatching("IOPMPowerSource");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0LL;
  }
  io_object_t v4 = MatchingService;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0);
  id v5 = -[__CFDictionary copy](properties, "copy");
  IOObjectRelease(v4);

  return v5;
}

- (void)updateAnalyticsMetricsMaxAttribute:(unint64_t *)a3 interval:(double)a4
{
  double v6 = (double)*a3;
  if (a4 / 86400.0 > v6) {
    double v6 = a4 / 86400.0;
  }
  *a3 = (unint64_t)v6;
}

- (void)incrAnalyticsMetricsAttribute:(unint64_t *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryGaugingAccuracyManager getBatteryProperties](self, "getBatteryProperties"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager externalConnectedFromBatteryProperties:]( self,  "externalConnectedFromBatteryProperties:",  v5));

  double v6 = v8;
  if (v8)
  {
    unsigned int v7 = [v8 BOOLValue];
    double v6 = v8;
    if (v7) {
      ++*a3;
    }
  }
}

- (id)gaugingAccuracyMetricGet
{
  id v3 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  10LL);
  io_object_t v4 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "gaugingAccuracyMetricGet policy state\n",  v16,  2u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastDOD0ValueAtQualQmax,  @"lastQualQmaxDODValue");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastQualifiedQmaxDate,  @"lastQualQMaxDate");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastQMaxUpdate,  @"lastQMaxUpdate");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastDOD0Update,  @"lastDOD0Update");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastFullChargeDate,  @"lastFullChargeDate");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  self->_lastAttemptedFullChargeDate,  @"lastAttemptedFullChargeDate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_lastChargeToFullRequested));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"lastFullChargeReq");

  testQmaxUpdateDate = self->_testQmaxUpdateDate;
  if (testQmaxUpdateDate)
  {
    -[NSNumber doubleValue](testQmaxUpdateDate, "doubleValue");
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v7,  @"testQmaxUpdateDate");
  }

  testDOD0UpdateDate = self->_testDOD0UpdateDate;
  if (testDOD0UpdateDate)
  {
    -[NSNumber doubleValue](testDOD0UpdateDate, "doubleValue");
    double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v9,  @"testDOD0UpdateDate");
  }

  testFullyChargedDate = self->_testFullyChargedDate;
  if (testFullyChargedDate)
  {
    -[NSNumber doubleValue](testFullyChargedDate, "doubleValue");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v11,  @"testFullyChargedDate");
  }

  testQualifiedQMaxDate = self->_testQualifiedQMaxDate;
  if (testQualifiedQMaxDate)
  {
    -[NSNumber doubleValue](testQualifiedQMaxDate, "doubleValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v13,  @"testQualQMaxDate");
  }

  testQualifiedQMaxDOD0Value = self->_testQualifiedQMaxDOD0Value;
  if (testQualifiedQMaxDOD0Value) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  testQualifiedQMaxDOD0Value,  @"testQualQmaxDODValue");
  }
  return v3;
}

- (void)periodicActions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryGaugingAccuracyManager getBatteryProperties](self, "getBatteryProperties"));
  io_object_t v4 = v3;
  if (v3 && [v3 count])
  {
    -[BatteryGaugingAccuracyManager reportMonthlyData](self, "reportMonthlyData");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager dod0AtQualQmaxFromBatteryProperties:]( self,  "dod0AtQualQmaxFromBatteryProperties:",  v4));
    unsigned int v7 = v6;
    if (v6
      && (unsigned int v8 = [v6 intValue],
          v8 != -[NSNumber intValue](self->_lastDOD0ValueAtQualQmax, "intValue")))
    {
      objc_storeStrong((id *)&self->_lastDOD0ValueAtQualQmax, v7);
      objc_storeStrong((id *)&self->_lastQualifiedQmaxDate, v5);
      BOOL v11 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        lastDOD0ValueAtQualQmax = self->_lastDOD0ValueAtQualQmax;
        *(_DWORD *)buf = 138412290;
        double v34 = lastDOD0ValueAtQualQmax;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "dod0 at qualQmax value has changed, update it %@\n",  buf,  0xCu);
      }

      -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastQualQmaxDODValue",  v7);
      -[NSDate timeIntervalSinceReferenceDate](self->_lastQualifiedQmaxDate, "timeIntervalSinceReferenceDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastQualQMaxDate",  v13);

      -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  &self->_numOfDOD0QualQmaxUpdates);
      int v9 = 1;
    }

    else
    {
      int v9 = 0;
    }

    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager batteryPercentFromBatteryProperties:]( self,  "batteryPercentFromBatteryProperties:",  v4));
    double v15 = v14;
    if (v14) {
      int v32 = [v14 integerValue];
    }
    else {
      int v32 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager externalConnectedFromBatteryProperties:]( self,  "externalConnectedFromBatteryProperties:",  v4));
    int v17 = v16;
    if (v16) {
      unsigned int v18 = [v16 BOOLValue];
    }
    else {
      unsigned int v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager fcStatusFromBatteryProperties:]( self,  "fcStatusFromBatteryProperties:",  v4));
    v20 = v19;
    v21 = (_DWORD *)&unk_100067000;
    if (v19)
    {
      unsigned int v22 = [v19 integerValue];
      if (v22)
      {
        int v31 = v9;
        objc_storeStrong((id *)&self->_lastFullChargeDate, v5);
        lastAttemptedFullChargeDate = self->_lastAttemptedFullChargeDate;
        self->_lastAttemptedFullChargeDate = 0LL;

        v24 = (os_log_s *)qword_100068818;
        if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
        {
          lastFullChargeDate = self->_lastFullChargeDate;
          *(_DWORD *)buf = 138412290;
          double v34 = lastFullChargeDate;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "FC detected, updating lastFullyCharge date to %@",  buf,  0xCu);
        }

        -[NSDate timeIntervalSinceReferenceDate](self->_lastFullChargeDate, "timeIntervalSinceReferenceDate");
        double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastFullChargeDate",  v26);

        -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastAttemptedFullChargeDate",  0LL);
        v21 = &unk_100067000;
        if (dword_100067548)
        {
          int v9 = v31;
        }

        else
        {
          -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  &self->_numOfChargeToFullReached);
          v21 = &unk_100067000;
          int v9 = 1;
        }
      }

      else
      {
        v21 = (_DWORD *)&unk_100067000;
      }
    }

    else
    {
      unsigned int v22 = 0;
    }

    v21[338] = v22;
    -[BatteryGaugingAccuracyManager periodicChargeToFullCheck](self, "periodicChargeToFullCheck");
    if (v32 > 95) {
      unsigned int v27 = v18;
    }
    else {
      unsigned int v27 = 0;
    }
    if (v27 != 1 || v22)
    {
      double v28 = self;
      uint64_t v29 = 60LL;
      uint64_t v30 = 0LL;
    }

    else
    {
      double v28 = self;
      uint64_t v29 = 5LL;
      uint64_t v30 = 1LL;
    }

    -[BatteryGaugingAccuracyManager requestPeriodicActionsInMinutes:waking:]( v28,  "requestPeriodicActionsInMinutes:waking:",  v29,  v30);
    if (v9) {
      -[BatteryGaugingAccuracyManager updateAnalyticsData](self, "updateAnalyticsData");
    }
  }

  else
  {
    v10 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Invalid batteryProperties, skip updating Qmax",  buf,  2u);
    }
  }
}

- (id)gaugingMitigationStatistics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  io_object_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfChargeToFullRequest - self->_lastNumOfChargeToFullRequest));
  [v3 setObject:v4 forKeyedSubscript:@"nrOfPeriodicFullChargeRequested"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfChargeToFullReached - self->_lastNumOfChargeToFullReached));
  [v3 setObject:v5 forKeyedSubscript:@"nrOfSessionsReachingFullCharge"];

  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfDOD0QualQmaxUpdates - self->_lastNumOfDOD0QualQmaxUpdates));
  [v3 setObject:v6 forKeyedSubscript:@"nrOfDOD0AtQualifiedQmaxUpdates"];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfQmaxTooRecent - self->_lastNumOfQmaxTooRecent));
  [v3 setObject:v7 forKeyedSubscript:@"nrOfQMaxTooRecent"];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfQmaxTooOld - self->_lastNumOfQmaxTooOld));
  [v3 setObject:v8 forKeyedSubscript:@"nrOfQMaxTooOld"];

  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfQmaxTooSmall - self->_lastNumOfQmaxTooSmall));
  [v3 setObject:v9 forKeyedSubscript:@"nrOfDOD0TooSmall"];

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfQmaxRequested - self->_lastNumOfQmaxRequested));
  [v3 setObject:v10 forKeyedSubscript:@"nrOfQMaxRequested"];

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfOcvRequested - self->_lastNumOfOcvRequested));
  [v3 setObject:v11 forKeyedSubscript:@"nrOfOCVRequested"];

  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_maxDaysSinceQmax - self->_lastMaxDaysSinceQmax));
  [v3 setObject:v12 forKeyedSubscript:@"maxDaysSinceQmax"];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_maxDaysSinceOcv - self->_lastMaxDaysSinceOcv));
  [v3 setObject:v13 forKeyedSubscript:@"maxDaysSinceOCV"];

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_maxDaysSinceFC - self->_lastMaxDaysSinceFC));
  [v3 setObject:v14 forKeyedSubscript:@"maxDaysSinceLastFullCharge"];

  __int128 v15 = *(_OWORD *)&self->_numOfChargeToFullRequest;
  __int128 v16 = *(_OWORD *)&self->_numOfDOD0QualQmaxUpdates;
  *(_OWORD *)&self->_lastNumOfChargeToFullRequest = v15;
  *(_OWORD *)&self->_lastNumOfDOD0QualQmaxUpdates = v16;
  __int128 v17 = *(_OWORD *)&self->_numOfQmaxRequested;
  *(_OWORD *)&self->_lastNumOfQmaxTooOld = *(_OWORD *)&self->_numOfQmaxTooOld;
  *(_OWORD *)&self->_lastNumOfQmaxRequested = v17;
  *(_OWORD *)&self->_lastMaxDaysSinceQmax = *(_OWORD *)&self->_maxDaysSinceQmax;
  self->_lastMaxDaysSinceFC = self->_maxDaysSinceFC;
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (void)v15));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfPeriodicFullChargeRequested",  v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfChargeToFullReached));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfSessionsReachingFullCharge",  v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfDOD0QualQmaxUpdates));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfDOD0AtQualifiedQmaxUpdates",  v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfQmaxTooRecent));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfQMaxTooRecent",  v21);

  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfQmaxTooOld));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfQMaxTooOld",  v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfQmaxTooSmall));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfDOD0TooSmall",  v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfQmaxRequested));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfQMaxRequested",  v24);

  double v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastNumOfOcvRequested));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastNrOfOCVRequested",  v25);

  double v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastMaxDaysSinceQmax));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastMaxDaysSinceQmax",  v26);

  unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastMaxDaysSinceOcv));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastMaxDaysSinceOCV",  v27);

  double v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_lastMaxDaysSinceFC));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastMaxDaysSinceLastFullCharge",  v28);

  return v3;
}

- (void)reportMonthlyData
{
  id v3 = (void *)os_transaction_create("com.apple.powerui.smartcharging.reportMonthlyData");
  io_object_t v4 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    unsigned int v8 = v7;
    if (v6 && ([v7 timeIntervalSinceDate:v6], v9 < 2592000.0))
    {
      v10 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v17 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Considered submitting monthly OBC analytics, but not enough time has passed since last submission: %@",  buf,  0xCu);
      }
    }

    else
    {
      [v8 timeIntervalSinceReferenceDate];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"MonthlyDataReportedDate",  v11);

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100033F5C;
      v14[3] = &unk_100059450;
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[BatteryGaugingAccuracyManager gaugingMitigationStatistics](self, "gaugingMitigationStatistics"));
      id v12 = v15;
      AnalyticsSendEventLazy(@"com.apple.das.smartcharging.monthlygaugingdata", v14);
    }
  }

  else
  {
    v13 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "reportMonthlyData invalid interval\n",  buf,  2u);
    }
  }
}

- (void)periodicChargeToFullCheck
{
  id v3 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  io_object_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    unsigned int v7 = v6;
    if (v5 && ([v6 timeIntervalSinceDate:v5], v8 < 43200.0))
    {
      double v9 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Not enough time has passed since last charge to full check: %@",  (uint8_t *)&v12,  0xCu);
      }
    }

    else
    {
      v10 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "periodicChargeToFullCheck run disableSocLimitPolicy\n",  (uint8_t *)&v12,  2u);
      }

      -[BatteryGaugingAccuracyManager handleBatteryStateDataUpdate](self, "handleBatteryStateDataUpdate");
    }
  }

  else
  {
    BOOL v11 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "periodicChargeToFullCheck invalid interval\n",  (uint8_t *)&v12,  2u);
    }
  }
}

- (BOOL)disableSocLimitPolicy
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryGaugingAccuracyManager getBatteryProperties](self, "getBatteryProperties"));
  io_object_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryGaugingAccuracyManager qMaxFromBatteryProperties:](self, "qMaxFromBatteryProperties:", v4));
    unsigned int v7 = v6;
    double v8 = 0.0;
    double v9 = 0.0;
    if (v6)
    {
      [v5 timeIntervalSinceDate:self->_lastQMaxUpdate];
      double v9 = v10;
      self->_timeSinceLastQmaxUpdate = v10;
      -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:]( self,  "updateAnalyticsMetricsMaxAttribute:interval:",  &self->_maxDaysSinceQmax);
    }

    unsigned int v11 = -[BatteryGaugingAccuracyManager chargeToFullDueToQMax:time:](self, "chargeToFullDueToQMax:time:", v5, v9);
    int v12 = (void *)objc_claimAutoreleasedReturnValue( -[BatteryGaugingAccuracyManager dod0ArrayFromBatteryProperties:]( self,  "dod0ArrayFromBatteryProperties:",  v4));
    v13 = v12;
    if (v12)
    {
      [v5 timeIntervalSinceDate:self->_lastDOD0Update];
      double v8 = v14;
      self->_timeSinceLastDOD0Update = v14;
      -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:]( self,  "updateAnalyticsMetricsMaxAttribute:interval:",  &self->_maxDaysSinceOcv);
    }

    unsigned int v15 = v11 | -[BatteryGaugingAccuracyManager chargeToFullDueToDOD0:time:]( self,  "chargeToFullDueToDOD0:time:",  v5,  v8);
    testFullyChargedDate = self->_testFullyChargedDate;
    if (testFullyChargedDate)
    {
      -[NSNumber doubleValue](testFullyChargedDate, "doubleValue");
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      [v5 timeIntervalSinceDate:v17];
      if (v18 > 1814400.0)
      {
        v19 = (void *)qword_100068818;
        if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          [v5 timeIntervalSinceDate:v17];
          int v38 = 134217984;
          double v39 = v21 / 86400.0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "(Test) Last full charge date was %.1f days ago, try and charge to full",  (uint8_t *)&v38,  0xCu);
        }

        unsigned int v15 = 1;
      }

- (void)updateAnalyticsData
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfChargeToFullRequest));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfPeriodicFullChargeRequested",  v3);

  io_object_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfChargeToFullReached));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfSessionsReachingFullCharge",  v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_numOfDOD0QualQmaxUpdates));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfDOD0AtQualifiedQmaxUpdates",  v5);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_numOfQmaxTooRecent));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfQMaxTooRecent",  v6);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_numOfQmaxTooOld));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfQMaxTooOld",  v7);

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_numOfQmaxTooSmall));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfDOD0TooSmall",  v8);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_numOfQmaxRequested));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfQMaxRequested",  v9);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_numOfOcvRequested));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"nrOfOCVRequested",  v10);

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_maxDaysSinceQmax));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"maxDaysSinceQmax",  v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_maxDaysSinceOcv));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"maxDaysSinceOCV",  v12);

  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_maxDaysSinceFC));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"maxDaysSinceLastFullCharge",  v13);
}

- (void)updateLastQMaxArray:(id)a3 atDate:(id)a4
{
  double v6 = (NSArray *)a3;
  unsigned int v7 = (NSDate *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = (NSArray *)&__NSArray0__struct;
  }
  v14[0] = @"lastQMax";
  v14[1] = @"lastQMaxUpdate";
  v15[0] = v8;
  -[NSDate timeIntervalSinceReferenceDate](v7, "timeIntervalSinceReferenceDate");
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[1] = v9;
  double v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  CFPreferencesSetMultiple( v10,  0LL,  @"com.apple.powerd.batterygauging",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  lastQMaxArray = self->_lastQMaxArray;
  self->_lastQMaxArray = v6;
  int v12 = v6;

  lastQMaxUpdate = self->_lastQMaxUpdate;
  self->_lastQMaxUpdate = v7;
}

- (void)updateLastDOD0Values:(id)a3 atDate:(id)a4
{
  double v6 = (NSArray *)a3;
  unsigned int v7 = (NSDate *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = (NSArray *)&__NSArray0__struct;
  }
  v14[0] = @"lastDOD0";
  v14[1] = @"lastDOD0Update";
  v15[0] = v8;
  -[NSDate timeIntervalSinceReferenceDate](v7, "timeIntervalSinceReferenceDate");
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v15[1] = v9;
  double v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  CFPreferencesSetMultiple( v10,  0LL,  @"com.apple.powerd.batterygauging",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);
  lastDOD0Values = self->_lastDOD0Values;
  self->_lastDOD0Values = v6;
  int v12 = v6;

  lastDOD0Update = self->_lastDOD0Update;
  self->_lastDOD0Update = v7;
}

- (void)writeNSNumberDataToDisk:(id)a3 :(id)a4
{
  id v5 = (dispatch_queue_s *)qword_100067540;
  id v6 = a4;
  key = (__CFString *)a3;
  dispatch_assert_queue_V2(v5);
  CFPreferencesSetAppValue(key, v6, @"com.apple.powerd.batterygauging");
}

- (void)restoreAnalyticDataFromDisk:(id)a3 :(unint64_t *)a4
{
  id v5 = (dispatch_queue_s *)qword_100067540;
  id v6 = (__CFString *)a3;
  dispatch_assert_queue_V2(v5);
  double v9 = (void *)CFPreferencesCopyAppValue(v6, @"com.apple.powerd.batterygauging");

  unsigned int v7 = v9;
  if (v9)
  {
    id v8 = [v9 integerValue];
    unsigned int v7 = v9;
  }

  else
  {
    id v8 = 0LL;
  }

  *a4 = (unint64_t)v8;
}

- (id)initBatteryGaugingAccuracyData
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS___BatteryGaugingAccuracyManager;
  id v3 = -[BatteryGaugingAccuracyManager init](&v50, "init");
  if (!v3) {
    return v3;
  }
  io_object_t v4 = (NSNumber *)CFPreferencesCopyAppValue(@"testQmaxUpdateDate", @"com.apple.powerd.batterygauging");
  testQmaxUpdateDate = v3->_testQmaxUpdateDate;
  v3->_testQmaxUpdateDate = v4;

  id v6 = (NSNumber *)CFPreferencesCopyAppValue(@"testDOD0UpdateDate", @"com.apple.powerd.batterygauging");
  testDOD0UpdateDate = v3->_testDOD0UpdateDate;
  v3->_testDOD0UpdateDate = v6;

  id v8 = (NSNumber *)CFPreferencesCopyAppValue(@"testFullyChargedDate", @"com.apple.powerd.batterygauging");
  testFullyChargedDate = v3->_testFullyChargedDate;
  v3->_testFullyChargedDate = v8;

  double v10 = (NSNumber *)CFPreferencesCopyAppValue(@"testQualQMaxDate", @"com.apple.powerd.batterygauging");
  testQualifiedQMaxDate = v3->_testQualifiedQMaxDate;
  v3->_testQualifiedQMaxDate = v10;

  int v12 = (NSNumber *)CFPreferencesCopyAppValue(@"testQualQmaxDODValue", @"com.apple.powerd.batterygauging");
  testQualifiedQMaxDOD0Value = v3->_testQualifiedQMaxDOD0Value;
  v3->_testQualifiedQMaxDOD0Value = v12;

  double v14 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");
  if (!v14)
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue( @"MonthlyDataReportedDate",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"com.apple.powerd.batterygauging");
  }

  __int128 v16 = (void *)CFPreferencesCopyAppValue(@"MonthlyDataReportedDate", @"com.apple.powerd.batterygauging");

  if (!v16)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v17 timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue( @"MonthlyDataReportedDate",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"com.apple.powerd.batterygauging");
  }

  double v18 = (void *)CFPreferencesCopyAppValue(@"lastDOD0", @"com.apple.powerd.batterygauging");
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
  {
    v20 = v18;
LABEL_10:
    lastDOD0Values = v3->_lastDOD0Values;
    v3->_lastDOD0Values = v20;
    goto LABEL_12;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v18, v21) & 1) != 0)
  {
    v52 = v18;
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
    goto LABEL_10;
  }

  lastDOD0Values = v3->_lastDOD0Values;
  v3->_lastDOD0Values = (NSArray *)&__NSArray0__struct;
LABEL_12:

  v23 = (void *)CFPreferencesCopyAppValue(@"lastDOD0Update", @"com.apple.powerd.batterygauging");
  if (v23)
  {
    [v23 doubleValue];
    uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }

  lastDOD0Update = v3->_lastDOD0Update;
  v3->_lastDOD0Update = (NSDate *)v24;

  double v26 = (void *)CFPreferencesCopyAppValue(@"lastQMax", @"com.apple.powerd.batterygauging");
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
  {
    double v28 = v26;
  }

  else
  {
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v26, v29) & 1) == 0)
    {
      lastQMaxArray = v3->_lastQMaxArray;
      v3->_lastQMaxArray = (NSArray *)&__NSArray0__struct;
      goto LABEL_21;
    }

    v51 = v26;
    double v28 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
  }

  lastQMaxArray = v3->_lastQMaxArray;
  v3->_lastQMaxArray = v28;
LABEL_21:

  double v31 = (void *)CFPreferencesCopyAppValue(@"lastQMaxUpdate", @"com.apple.powerd.batterygauging");
  if (v31)
  {
    [v31 doubleValue];
    uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  }

  else
  {
    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }

  lastQMaxUpdate = v3->_lastQMaxUpdate;
  v3->_lastQMaxUpdate = (NSDate *)v32;

  double v34 = (void *)CFPreferencesCopyAppValue(@"lastFullChargeDate", @"com.apple.powerd.batterygauging");
  if (v34)
  {
    [v34 doubleValue];
    uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    lastFullChargeDate = v3->_lastFullChargeDate;
    v3->_lastFullChargeDate = (NSDate *)v35;
  }

  else
  {
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    int v38 = v3->_lastFullChargeDate;
    v3->_lastFullChargeDate = (NSDate *)v37;

    -[NSDate timeIntervalSinceReferenceDate](v3->_lastFullChargeDate, "timeIntervalSinceReferenceDate");
    CFPreferencesSetAppValue( @"lastFullChargeDate",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"com.apple.powerd.batterygauging");
  }

  double v39 = (void *)CFPreferencesCopyAppValue(@"lastQualQMaxDate", @"com.apple.powerd.batterygauging");

  if (v39)
  {
    [v39 doubleValue];
    uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    lastQualifiedQmaxDate = v3->_lastQualifiedQmaxDate;
    v3->_lastQualifiedQmaxDate = (NSDate *)v40;
  }

  else
  {
    uint64_t v42 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v43 = v3->_lastQualifiedQmaxDate;
    v3->_lastQualifiedQmaxDate = (NSDate *)v42;

    -[NSDate timeIntervalSinceReferenceDate](v3->_lastQualifiedQmaxDate, "timeIntervalSinceReferenceDate");
    CFPreferencesSetAppValue( @"lastQualQMaxDate",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"com.apple.powerd.batterygauging");
  }

  v44 = (void *)CFPreferencesCopyAppValue( @"lastAttemptedFullChargeDate",  @"com.apple.powerd.batterygauging");

  if (v44)
  {
    [v44 doubleValue];
    uint64_t v45 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
    lastAttemptedFullChargeDate = v3->_lastAttemptedFullChargeDate;
    v3->_lastAttemptedFullChargeDate = (NSDate *)v45;
  }

  else
  {
    lastAttemptedFullChargeDate = v3->_lastAttemptedFullChargeDate;
    v3->_lastAttemptedFullChargeDate = 0LL;
  }

  v47 = (NSNumber *)CFPreferencesCopyAppValue(@"lastQualQmaxDODValue", @"com.apple.powerd.batterygauging");
  lastDOD0ValueAtQualQmax = v3->_lastDOD0ValueAtQualQmax;
  v3->_lastDOD0ValueAtQualQmax = v47;

  if (!v3->_lastDOD0ValueAtQualQmax)
  {
    v3->_lastDOD0ValueAtQualQmax = (NSNumber *)&off_1000602F0;

    CFPreferencesSetAppValue( @"lastQualQmaxDODValue",  v3->_lastDOD0ValueAtQualQmax,  @"com.apple.powerd.batterygauging");
  }

  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfPeriodicFullChargeRequested",  &v3->_numOfChargeToFullRequest);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfSessionsReachingFullCharge",  &v3->_numOfChargeToFullReached);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfDOD0AtQualifiedQmaxUpdates",  &v3->_numOfDOD0QualQmaxUpdates);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfQMaxTooRecent",  &v3->_numOfQmaxTooRecent);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfQMaxTooOld",  &v3->_numOfQmaxTooOld);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfDOD0TooSmall",  &v3->_numOfQmaxTooSmall);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfQMaxRequested",  &v3->_numOfQmaxRequested);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"nrOfOCVRequested",  &v3->_numOfOcvRequested);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"maxDaysSinceQmax",  &v3->_maxDaysSinceQmax);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"maxDaysSinceOCV",  &v3->_maxDaysSinceOcv);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"maxDaysSinceLastFullCharge",  &v3->_maxDaysSinceFC);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfPeriodicFullChargeRequested",  &v3->_lastNumOfChargeToFullRequest);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfSessionsReachingFullCharge",  &v3->_lastNumOfChargeToFullReached);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfDOD0AtQualifiedQmaxUpdates",  &v3->_lastNumOfDOD0QualQmaxUpdates);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfQMaxTooRecent",  &v3->_lastNumOfQmaxTooRecent);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfQMaxTooOld",  &v3->_lastNumOfQmaxTooOld);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfDOD0TooSmall",  &v3->_lastNumOfQmaxTooSmall);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfQMaxRequested",  &v3->_lastNumOfQmaxRequested);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastNrOfOCVRequested",  &v3->_lastNumOfOcvRequested);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastMaxDaysSinceQmax",  &v3->_lastMaxDaysSinceQmax);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastMaxDaysSinceOCV",  &v3->_lastMaxDaysSinceOcv);
  -[BatteryGaugingAccuracyManager restoreAnalyticDataFromDisk::]( v3,  "restoreAnalyticDataFromDisk::",  @"lastMaxDaysSinceLastFullCharge",  &v3->_lastMaxDaysSinceFC);
  -[BatteryGaugingAccuracyManager periodicActions](v3, "periodicActions");

  return v3;
}

- (void)handleBatteryStateDataUpdate
{
  unsigned int v3 = -[BatteryGaugingAccuracyManager disableSocLimitPolicy](self, "disableSocLimitPolicy");
  BOOL v4 = v3;
  if (self->_lastChargeToFullRequested) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = v3;
  }
  if (v5 == 1)
  {
    id v6 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "HandleBatteryDataUpdate ChargeToFull Enabled",  buf,  2u);
    }

    -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  &self->_numOfChargeToFullRequest);
LABEL_14:
    sub_100008914(v5);
    goto LABEL_15;
  }

  if (self->_lastChargeToFullRequested) {
    char v7 = v3;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = (os_log_s *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "HandleBatteryDataUpdate ChargeToFull Disabled",  v11,  2u);
    }

    goto LABEL_14;
  }

+ (id)InstanceManager
{
  if (qword_100067558 != -1) {
    dispatch_once(&qword_100067558, &stru_10005A2F0);
  }
  return (id)qword_100067550;
}

- (double)timeSinceLastDOD0Update
{
  return self->_timeSinceLastDOD0Update;
}

- (void)setTimeSinceLastDOD0Update:(double)a3
{
  self->_timeSinceLastDOD0Update = a3;
}

- (double)timeSinceLastQmaxUpdate
{
  return self->_timeSinceLastQmaxUpdate;
}

- (void)setTimeSinceLastQmaxUpdate:(double)a3
{
  self->_timeSinceLastQmaxUpdate = a3;
}

- (NSNumber)testQmaxUpdateDate
{
  return self->_testQmaxUpdateDate;
}

- (void)setTestQmaxUpdateDate:(id)a3
{
}

- (NSNumber)testDOD0UpdateDate
{
  return self->_testDOD0UpdateDate;
}

- (void)setTestDOD0UpdateDate:(id)a3
{
}

- (NSNumber)testFullyChargedDate
{
  return self->_testFullyChargedDate;
}

- (void)setTestFullyChargedDate:(id)a3
{
}

- (NSNumber)testQualifiedQMaxDate
{
  return self->_testQualifiedQMaxDate;
}

- (void)setTestQualifiedQMaxDate:(id)a3
{
}

- (NSNumber)testQualifiedQMaxDOD0Value
{
  return self->_testQualifiedQMaxDOD0Value;
}

- (void)setTestQualifiedQMaxDOD0Value:(id)a3
{
}

- (NSArray)lastDOD0Values
{
  return self->_lastDOD0Values;
}

- (void)setLastDOD0Values:(id)a3
{
}

- (BOOL)lastChargeToFullRequested
{
  return self->_lastChargeToFullRequested;
}

- (void)setLastChargeToFullRequested:(BOOL)a3
{
  self->_lastChargeToFullRequested = a3;
}

- (NSDate)lastDOD0Update
{
  return (NSDate *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLastDOD0Update:(id)a3
{
}

- (NSArray)lastQMaxArray
{
  return self->_lastQMaxArray;
}

- (void)setLastQMaxArray:(id)a3
{
}

- (NSDate)lastQMaxUpdate
{
  return (NSDate *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setLastQMaxUpdate:(id)a3
{
}

- (NSNumber)lastDOD0ValueAtQualQmax
{
  return self->_lastDOD0ValueAtQualQmax;
}

- (void)setLastDOD0ValueAtQualQmax:(id)a3
{
}

- (NSDate)lastQualifiedQmaxDate
{
  return self->_lastQualifiedQmaxDate;
}

- (void)setLastQualifiedQmaxDate:(id)a3
{
}

- (NSDate)lastFullChargeDate
{
  return self->_lastFullChargeDate;
}

- (void)setLastFullChargeDate:(id)a3
{
}

- (NSDate)lastAttemptedFullChargeDate
{
  return self->_lastAttemptedFullChargeDate;
}

- (void)setLastAttemptedFullChargeDate:(id)a3
{
}

- (unint64_t)numOfChargeToFullRequest
{
  return self->_numOfChargeToFullRequest;
}

- (void)setNumOfChargeToFullRequest:(unint64_t)a3
{
  self->_numOfChargeToFullRequest = a3;
}

- (unint64_t)numOfChargeToFullReached
{
  return self->_numOfChargeToFullReached;
}

- (void)setNumOfChargeToFullReached:(unint64_t)a3
{
  self->_numOfChargeToFullReached = a3;
}

- (unint64_t)numOfDOD0QualQmaxUpdates
{
  return self->_numOfDOD0QualQmaxUpdates;
}

- (void)setNumOfDOD0QualQmaxUpdates:(unint64_t)a3
{
  self->_numOfDOD0QualQmaxUpdates = a3;
}

- (unint64_t)numOfQmaxTooRecent
{
  return self->_numOfQmaxTooRecent;
}

- (void)setNumOfQmaxTooRecent:(unint64_t)a3
{
  self->_numOfQmaxTooRecent = a3;
}

- (unint64_t)numOfQmaxTooOld
{
  return self->_numOfQmaxTooOld;
}

- (void)setNumOfQmaxTooOld:(unint64_t)a3
{
  self->_numOfQmaxTooOld = a3;
}

- (unint64_t)numOfQmaxTooSmall
{
  return self->_numOfQmaxTooSmall;
}

- (void)setNumOfQmaxTooSmall:(unint64_t)a3
{
  self->_numOfQmaxTooSmall = a3;
}

- (unint64_t)numOfQmaxRequested
{
  return self->_numOfQmaxRequested;
}

- (void)setNumOfQmaxRequested:(unint64_t)a3
{
  self->_numOfQmaxRequested = a3;
}

- (unint64_t)numOfOcvRequested
{
  return self->_numOfOcvRequested;
}

- (void)setNumOfOcvRequested:(unint64_t)a3
{
  self->_numOfOcvRequested = a3;
}

- (unint64_t)maxDaysSinceQmax
{
  return self->_maxDaysSinceQmax;
}

- (void)setMaxDaysSinceQmax:(unint64_t)a3
{
  self->_maxDaysSinceQmax = a3;
}

- (unint64_t)maxDaysSinceOcv
{
  return self->_maxDaysSinceOcv;
}

- (void)setMaxDaysSinceOcv:(unint64_t)a3
{
  self->_maxDaysSinceOcv = a3;
}

- (unint64_t)maxDaysSinceFC
{
  return self->_maxDaysSinceFC;
}

- (void)setMaxDaysSinceFC:(unint64_t)a3
{
  self->_maxDaysSinceFC = a3;
}

- (unint64_t)lastNumOfChargeToFullRequest
{
  return self->_lastNumOfChargeToFullRequest;
}

- (void)setLastNumOfChargeToFullRequest:(unint64_t)a3
{
  self->_lastNumOfChargeToFullRequest = a3;
}

- (unint64_t)lastNumOfChargeToFullReached
{
  return self->_lastNumOfChargeToFullReached;
}

- (void)setLastNumOfChargeToFullReached:(unint64_t)a3
{
  self->_lastNumOfChargeToFullReached = a3;
}

- (unint64_t)lastNumOfDOD0QualQmaxUpdates
{
  return self->_lastNumOfDOD0QualQmaxUpdates;
}

- (void)setLastNumOfDOD0QualQmaxUpdates:(unint64_t)a3
{
  self->_lastNumOfDOD0QualQmaxUpdates = a3;
}

- (unint64_t)lastNumOfQmaxTooRecent
{
  return self->_lastNumOfQmaxTooRecent;
}

- (void)setLastNumOfQmaxTooRecent:(unint64_t)a3
{
  self->_lastNumOfQmaxTooRecent = a3;
}

- (unint64_t)lastNumOfQmaxTooOld
{
  return self->_lastNumOfQmaxTooOld;
}

- (void)setLastNumOfQmaxTooOld:(unint64_t)a3
{
  self->_lastNumOfQmaxTooOld = a3;
}

- (unint64_t)lastNumOfQmaxTooSmall
{
  return self->_lastNumOfQmaxTooSmall;
}

- (void)setLastNumOfQmaxTooSmall:(unint64_t)a3
{
  self->_lastNumOfQmaxTooSmall = a3;
}

- (unint64_t)lastNumOfQmaxRequested
{
  return self->_lastNumOfQmaxRequested;
}

- (void)setLastNumOfQmaxRequested:(unint64_t)a3
{
  self->_lastNumOfQmaxRequested = a3;
}

- (unint64_t)lastNumOfOcvRequested
{
  return self->_lastNumOfOcvRequested;
}

- (void)setLastNumOfOcvRequested:(unint64_t)a3
{
  self->_lastNumOfOcvRequested = a3;
}

- (unint64_t)lastMaxDaysSinceQmax
{
  return self->_lastMaxDaysSinceQmax;
}

- (void)setLastMaxDaysSinceQmax:(unint64_t)a3
{
  self->_lastMaxDaysSinceQmax = a3;
}

- (unint64_t)lastMaxDaysSinceOcv
{
  return self->_lastMaxDaysSinceOcv;
}

- (void)setLastMaxDaysSinceOcv:(unint64_t)a3
{
  self->_lastMaxDaysSinceOcv = a3;
}

- (unint64_t)lastMaxDaysSinceFC
{
  return self->_lastMaxDaysSinceFC;
}

- (void)setLastMaxDaysSinceFC:(unint64_t)a3
{
  self->_lastMaxDaysSinceFC = a3;
}

- (void).cxx_destruct
{
}

@end
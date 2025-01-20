@interface BatteryTrustedData
- (BOOL)doNotRunAnymore;
- (BOOL)hasAuthPassed:(id)a3;
- (BOOL)haveFrameworkToRun;
- (BOOL)isTrustedAuthFeatureDisabled:(id)a3;
- (BOOL)startMatchingNotifications;
- (BatteryTrustedData)initWithIdentifer:(id)a3;
- (IONotificationPort)ioNotificationPort;
- (NSDictionary)initialData;
- (NSDictionary)trustedDataShared;
- (NSNumber)defaultTimer;
- (NSNumber)failedAuthCount;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)periodicTimer;
- (PPSTelemetryIdentifier)ppsId;
- (double)authLastFailedTime;
- (double)authLastPassedTime;
- (double)authTriggeredTime;
- (id)decodeNonce:(id)a3;
- (id)getInitTimerValueForAlarm:(id)a3;
- (unsigned)ioServiceAddedIterator;
- (void)cancelAlarm;
- (void)handleAppleBatteryAuthIORegData:(id)a3;
- (void)handleDataFromService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)handleServiceAdded:(unsigned int)a3;
- (void)readOverrideTimeFromDefaults;
- (void)sendToPPS:(id)a3;
- (void)setAlarmInSeconds:(id)a3;
- (void)setAuthLastFailedTime:(double)a3;
- (void)setAuthLastPassedTime:(double)a3;
- (void)setAuthTriggeredTime:(double)a3;
- (void)setDefaultTimer:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDoNotRunAnymore:(BOOL)a3;
- (void)setFailedAuthCount:(id)a3;
- (void)setInitialData:(id)a3;
- (void)setIoNotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setPeriodicTimer:(id)a3;
- (void)setPpsId:(PPSTelemetryIdentifier *)a3;
- (void)setQueue:(id)a3;
- (void)setTrustedDataShared:(id)a3;
- (void)start;
- (void)stop;
- (void)triggerBatteryReauthentication;
- (void)updatePublishedData:(id)a3;
@end

@implementation BatteryTrustedData

- (BatteryTrustedData)initWithIdentifer:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___BatteryTrustedData;
  v5 = -[BatteryTrustedData init](&v22, "init");
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E424();
    }
    goto LABEL_9;
  }

  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E450();
    }
LABEL_9:
    v19 = 0LL;
    goto LABEL_14;
  }

  failedAuthCount = v5->_failedAuthCount;
  v5->_failedAuthCount = 0LL;

  v6->_ioNotificationPort = 0LL;
  v6->_ioServiceAddedIterator = 0;
  v6->_authLastFailedTime = 0.0;
  v6->_authLastPassedTime = 0.0;
  v6->_authTriggeredTime = 0.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v8]);

  id v10 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@.battery%@", @"com.apple.powerd.batterytrusteddata.dailytaskQueue", v9));
  v11 = (const char *)[v10 UTF8String];
  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
  dispatch_queue_t v14 = dispatch_queue_create(v11, v13);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v14;

  if (v6->_queue)
  {
    defaultTimer = v6->_defaultTimer;
    v6->_defaultTimer = (NSNumber *)&off_100060170;

    v17 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.powerd.batterytrusteddata.dailytask");
    defaults = v6->_defaults;
    v6->_defaults = v17;

    -[BatteryTrustedData readOverrideTimeFromDefaults](v6, "readOverrideTimeFromDefaults");
    v6->_ppsId = 0LL;
    v19 = v6;
  }

  else
  {
    v20 = (void *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E47C(v20);
    }
    v19 = 0LL;
  }

LABEL_14:
  return v19;
}

- (void)readOverrideTimeFromDefaults
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryTrustedData defaults](self, "defaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"OverrideTimeSeconds"]);

  v5 = (os_log_s *)qword_100066E10;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Read defaults Override time in seconds: %@",  (uint8_t *)&v7,  0xCu);
    }

    objc_storeStrong((id *)&self->_defaultTimer, v4);
  }

  else if (v6)
  {
    LOWORD(v7) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No Override found for timer, using default timer value",  (uint8_t *)&v7,  2u);
  }
}

- (id)getInitTimerValueForAlarm:(id)a3
{
  id v4 = a3;
  v5 = self->_defaultTimer;
  if (v4)
  {
    if ([v4 BOOLValue])
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_initialData,  "objectForKeyedSubscript:",  @"TrustedBatteryLastTimePassed"));
      int v7 = v6;
      if (v6)
      {
        v8 = (const __CFString *)[v6 unsignedLongValue];
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v9 timeIntervalSince1970];
        unint64_t v11 = (unint64_t)v10;

        unsigned int v12 = -[NSNumber unsignedIntValue](self->_defaultTimer, "unsignedIntValue");
        if ((unint64_t)v8 >= v11)
        {
          uint64_t v23 = qword_100066E10;
          if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 134218498;
            v27 = v8;
            __int16 v28 = 2048;
            unint64_t v29 = v11;
            __int16 v30 = 2112;
            v31 = v5;
            v20 = "Last auth passed time (%llu) is greater than current time(%llu), timer value is %@ seconds";
LABEL_17:
            v21 = (os_log_s *)v23;
            uint32_t v22 = 32;
            goto LABEL_18;
          }
        }

        else
        {
          v13 = (const __CFString *)((char *)v8 + v12);
          if ((unint64_t)v13 <= v11)
          {

            v25 = (os_log_s *)qword_100066E10;
            v18 = (NSNumber *)&off_100060188;
            if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
            {
              int v26 = 134218498;
              v27 = v13;
              __int16 v28 = 2048;
              unint64_t v29 = v11;
              __int16 v30 = 2112;
              v31 = (NSNumber *)&off_100060188;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "End time(%llu) is greater than current time(%llu), timer value is %@ seconds",  (uint8_t *)&v26,  0x20u);
            }

            goto LABEL_21;
          }

          if ((unint64_t)v13 - v11 < -[NSNumber unsignedIntValue](self->_defaultTimer, "unsignedIntValue"))
          {
            dispatch_queue_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  (char *)v13 - v11));

            v15 = (os_log_s *)qword_100066E10;
            if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
            {
              int v26 = 138412290;
              v27 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Timer value is %@ seconds",  (uint8_t *)&v26,  0xCu);
            }

            v16 = v14;
            goto LABEL_20;
          }

          uint64_t v23 = qword_100066E10;
          if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 134218498;
            v27 = v13;
            __int16 v28 = 2048;
            unint64_t v29 = v11;
            __int16 v30 = 2112;
            v31 = v5;
            v20 = "(%llu) is greater than current time(%llu), timer value is %@ seconds";
            goto LABEL_17;
          }
        }
      }

      else
      {
        uint64_t v19 = qword_100066E10;
        if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412546;
          v27 = @"TrustedBatteryLastTimePassed";
          __int16 v28 = 2112;
          unint64_t v29 = (unint64_t)v5;
          v20 = "%@ key is NULL, timer value is %@ seconds";
          v21 = (os_log_s *)v19;
          uint32_t v22 = 22;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
        }
      }

      v16 = v5;
LABEL_20:
      v18 = v16;
LABEL_21:

      goto LABEL_22;
    }

    v17 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = (const __CFString *)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Initial auth suggest it has failed, timer value is %@ seconds",  (uint8_t *)&v26,  0xCu);
    }
  }

  v18 = v5;
LABEL_22:

  return v18;
}

- (BOOL)haveFrameworkToRun
{
  if (!qword_100066E20)
  {
    __int128 v6 = off_100058FC0;
    uint64_t v7 = 0LL;
    qword_100066E20 = _sl_dlopen(&v6, 0LL);
  }

  if (qword_100066E20 && sub_100005410())
  {
    v2 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "CoreAccessories.framework loaded, continue running !!\n",  (uint8_t *)&v6,  2u);
    }

    return 1;
  }

  else
  {
    id v4 = (os_log_s *)qword_100066E10;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v5)
    {
      LOWORD(v6) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CoreAccessories.framework not loaded, bail out!!\n",  (uint8_t *)&v6,  2u);
      return 0;
    }
  }

  return result;
}

- (void)start
{
  if (!-[BatteryTrustedData startMatchingNotifications](self, "startMatchingNotifications")) {
    goto LABEL_18;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryTrustedData initialData](self, "initialData"));
  unsigned int v4 = -[BatteryTrustedData isTrustedAuthFeatureDisabled:](self, "isTrustedAuthFeatureDisabled:", v3);

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E514();
    }
LABEL_18:
    -[BatteryTrustedData stop](self, "stop");
    return;
  }

  if (!-[BatteryTrustedData haveFrameworkToRun](self, "haveFrameworkToRun"))
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E56C();
    }
    goto LABEL_18;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_initialData,  "objectForKeyedSubscript:",  @"BatteryAuthPassed"));
  __int128 v6 = v5;
  if (v5
    && ([v5 BOOLValue] & 1) == 0
    && os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR))
  {
    sub_10003E540();
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryTrustedData getInitTimerValueForAlarm:](self, "getInitTimerValueForAlarm:", v6));
  v8 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    unint64_t v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Timer value determined to be %@ seconds",  (uint8_t *)&v10,  0xCu);
  }

  -[BatteryTrustedData handleAppleBatteryAuthIORegData:](self, "handleAppleBatteryAuthIORegData:", self->_initialData);
  -[BatteryTrustedData setAlarmInSeconds:](self, "setAlarmInSeconds:", v7);
  v9 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Battery Trusted Data start completed",  (uint8_t *)&v10,  2u);
  }
}

- (void)sendToPPS:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_ppsId)
    {
LABEL_3:
      v17 = self;
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            unint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 stringByReplacingOccurrencesOfString:@" " withString:&stru_10005AC58]);
            v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
            [v5 setObject:v13 forKey:v12];
          }

          id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }

        while (v8);
      }

      ppsId = v17->_ppsId;
      if (ppsId)
      {
        PPSSendTelemetry(ppsId, v5);
      }

      else if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR))
      {
        sub_10003E5F0();
      }

      goto LABEL_20;
    }

    v15 = (PPSTelemetryIdentifier *)PPSCreateTelemetryIdentifier(@"BatteryTrustedData", @"Daily");
    self->_ppsId = v15;
    v16 = (os_log_s *)qword_100066E10;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "ppsId created with subsystem BatteryTrustedData and Daily as BatteryTrustedData",  buf,  2u);
      }

      goto LABEL_3;
    }

    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E5C4();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR))
  {
    sub_10003E598();
  }

- (void)triggerBatteryReauthentication
{
  v3 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Periodic Timer Fired\n", (uint8_t *)&v9, 2u);
  }

  if (!qword_100066E20)
  {
    __int128 v9 = off_100058FC0;
    uint64_t v10 = 0LL;
    qword_100066E20 = _sl_dlopen(&v9, 0LL);
  }

  if (qword_100066E20 && sub_100005410())
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 timeIntervalSince1970];
    self->_authTriggeredTime = v5;

    id v6 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trigger auth!", (uint8_t *)&v9, 2u);
    }

    id v7 = (void (*)(void))sub_100005410();
    if (!v7) {
      sub_10003E61C();
    }
    v7();
    -[BatteryTrustedData setAlarmInSeconds:](self, "setAlarmInSeconds:", self->_defaultTimer);
  }

  else
  {
    id v8 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CoreAccessories.framework not loaded!!\n",  (uint8_t *)&v9,  2u);
    }
  }

- (void)cancelAlarm
{
  if (self->_periodicTimer)
  {
    v3 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling any existing Alarms\n", v4, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_periodicTimer);
  }

- (void)setAlarmInSeconds:(id)a3
{
  id v4 = a3;
  -[BatteryTrustedData cancelAlarm](self, "cancelAlarm");
  double v5 = (os_log_s *)qword_100066E10;
  if (self->_doNotRunAnymore)
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E63C();
    }
    -[BatteryTrustedData stop](self, "stop");
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Arming a new timer for %@ seconds\n",  buf,  0xCu);
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    periodicTimer = self->_periodicTimer;
    self->_periodicTimer = v6;

    id v8 = self->_periodicTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000044F8;
    handler[3] = &unk_100058F38;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
    dispatch_time_t v9 = dispatch_walltime(0, 1000000000 * [v4 unsignedIntValue]);
    dispatch_source_set_timer((dispatch_source_t)self->_periodicTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_periodicTimer);
  }
}

- (BOOL)isTrustedAuthFeatureDisabled:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TrustedBatteryEnabled"]);
    unsigned __int8 v7 = [v6 BOOLValue];
    id v8 = (os_log_s *)qword_100066E10;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trusted data path enabled.", v11, 2u);
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
        sub_10003E694();
      }
      -[BatteryTrustedData updatePublishedData:](self, "updatePublishedData:", &off_100060480);
    }

    char v9 = v7 ^ 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E668();
    }
    -[BatteryTrustedData updatePublishedData:](self, "updatePublishedData:", &off_100060458);
    char v9 = 1;
  }

  return v9;
}

- (BOOL)hasAuthPassed:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"BatteryAuthPassed"]),
        v6,
        !v6))
  {
    id v12 = (os_log_s *)qword_100066E10;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Auth state unknown yet", buf, 2u);
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"BatteryAuthPassed"]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSNumber intValue](self->_failedAuthCount, "intValue") + 1));
    failedAuthCount = self->_failedAuthCount;
    self->_failedAuthCount = v13;

    self->_authLastFailedTime = self->_authTriggeredTime;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E6C0();
    }
    goto LABEL_11;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"TrustedBatteryLastTimePassed"]);
  self->_authLastPassedTime = (double)(unint64_t)[v9 unsignedLongLongValue];

  uint64_t v10 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Auth Passed", v16, 2u);
  }

  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (id)decodeNonce:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (v3 && [v3 length])
  {
    double v5 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decoding Nonce now", (uint8_t *)v14, 2u);
    }

    memset(v14, 0, sizeof(v14));
    id v6 = v3;
    id v7 = [v6 bytes];
    id v8 = [v6 length];
    if ((unint64_t)v8 <= 0x20)
    {
      __memcpy_chk(v14, v7, v8, 32LL);
      char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", BYTE9(v14[0])));
      [v4 setObject:v9 forKeyedSubscript:@"Trusted Maximum Capacity"];

      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", WORD5(v14[0])));
      [v4 setObject:v10 forKeyedSubscript:@"Trusted Cycle Count"];

      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", WORD6(v14[0])));
      [v4 setObject:v11 forKeyedSubscript:@"Trusted LifeTime Max WRdc"];

      if (HIWORD(v14[0]))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(86400 * HIWORD(v14[0]))));
        [v4 setObject:v12 forKeyedSubscript:@"Trusted Date Of First Use"];
      }
    }
  }

  return v4;
}

- (void)handleAppleBatteryAuthIORegData:(id)a3
{
  id v4 = a3;
  if (-[BatteryTrustedData doNotRunAnymore](self, "doNotRunAnymore"))
  {
    if (self->_doNotRunAnymore) {
      goto LABEL_3;
    }
  }

  else
  {
    BOOL v5 = -[BatteryTrustedData isTrustedAuthFeatureDisabled:](self, "isTrustedAuthFeatureDisabled:", v4);
    self->_doNotRunAnymore = v5;
    if (v5)
    {
LABEL_3:
      -[BatteryTrustedData stop](self, "stop");
      if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
        sub_10003E6EC();
      }
      goto LABEL_13;
    }
  }

  id v6 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Data is %@", (uint8_t *)&v14, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TrustedBatteryDataRaw"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryTrustedData decodeNonce:](self, "decodeNonce:", v7));

  if (-[BatteryTrustedData hasAuthPassed:](self, "hasAuthPassed:", v4))
  {
    -[BatteryTrustedData sendToPPS:](self, "sendToPPS:", v8);
  }

  else
  {
    char v9 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Auth has failed/state Unknown",  (uint8_t *)&v14,  2u);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v8));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"TrustedBatteryEnabled"]);
  [v10 setValue:v11 forKeyPath:@"Trusted Data Enabled"];

  id v12 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  (unint64_t)self->_authLastPassedTime);
  [v10 setValue:v12 forKeyPath:@"Trusted Data Timestamp"];
  v13 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  (unint64_t)self->_authLastFailedTime);
  [v10 setValue:v13 forKeyPath:@"Trusted Data Failed Timestamp"];
  [v10 setValue:self->_failedAuthCount forKeyPath:@"Trusted Data Failed Count"];
  -[BatteryTrustedData updatePublishedData:](self, "updatePublishedData:", v10);

LABEL_13:
}

- (void)updatePublishedData:(id)a3
{
}

- (void)stop
{
  id v3 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "STOP Called: Removing transport matching notifications...",  v4,  2u);
  }

  self->_doNotRunAnymore = 1;
  -[BatteryTrustedData cancelAlarm](self, "cancelAlarm");
  if (-[BatteryTrustedData ioServiceAddedIterator](self, "ioServiceAddedIterator")) {
    IOObjectRelease(-[BatteryTrustedData ioServiceAddedIterator](self, "ioServiceAddedIterator"));
  }
  if (-[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort")) {
    IONotificationPortDestroy(-[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort"));
  }
  -[BatteryTrustedData updatePublishedData:](self, "updatePublishedData:", &off_1000604A8);
}

- (BOOL)startMatchingNotifications
{
  id v3 = -[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort");
  if (v3)
  {
    id v4 = -[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort");
    BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[BatteryTrustedData queue](self, "queue"));
    IONotificationPortSetDispatchQueue(v4, v5);

    id v6 = -[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort");
    id v7 = IOServiceMatching("AppleBatteryAuth");
    uint64_t v8 = IOServiceAddMatchingNotification( v6,  "IOServiceFirstMatch",  v7,  (IOServiceMatchingCallback)sub_100004DC8,  self,  &self->_ioServiceAddedIterator);
    if ((_DWORD)v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = (os_log_s *)qword_100066E10;
      LODWORD(v3) = os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v3)
      {
        sub_10003E718(v9, v10, v11, v12, v13, v14, v15, v16);
        LOBYTE(v3) = 0;
      }
    }

    else
    {
      sub_100004DC8(self, -[BatteryTrustedData ioServiceAddedIterator](self, "ioServiceAddedIterator"));
      LOBYTE(v3) = 1;
    }
  }

  return (char)v3;
}

- (void)handleServiceAdded:(unsigned int)a3
{
  kern_return_t v6;
  int v7;
  os_log_s *v8;
  os_log_s *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *initialData;
  NSDictionary *v18;
  io_object_t notification;
  uint8_t buf[16];
  BOOL v5 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Service matching notification callback fired!",  buf,  2u);
  }

  notification = 0;
  id v6 = IOServiceAddInterestNotification( -[BatteryTrustedData ioNotificationPort](self, "ioNotificationPort", 0LL),  a3,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_100004F54,  self,  &notification);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E7E4(v7, v8);
    }
    IOObjectRelease(a3);
  }

  else if (IORegistryEntryCreateCFProperties(a3, (CFMutableDictionaryRef *)&v18, kCFAllocatorDefault, 0))
  {
    uint64_t v9 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E77C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  else
  {
    initialData = self->_initialData;
    self->_initialData = v18;
  }

- (void)handleDataFromService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  id v7 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Callback triggered", buf, 2u);
  }

  CFMutableDictionaryRef properties = 0LL;
  uint64_t v8 = IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  CFMutableDictionaryRef v9 = properties;
  if ((_DWORD)v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = properties == 0LL;
  }
  if (v10)
  {
    uint64_t v11 = v8;
    uint64_t v12 = (os_log_s *)qword_100066E10;
    if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR)) {
      sub_10003E86C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }

  else
  {
    -[BatteryTrustedData cancelAlarm](self, "cancelAlarm");
    -[BatteryTrustedData handleAppleBatteryAuthIORegData:](self, "handleAppleBatteryAuthIORegData:", v9);
    -[BatteryTrustedData setAlarmInSeconds:](self, "setAlarmInSeconds:", self->_defaultTimer);
  }

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIoNotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)doNotRunAnymore
{
  return self->_doNotRunAnymore;
}

- (void)setDoNotRunAnymore:(BOOL)a3
{
  self->_doNotRunAnymore = a3;
}

- (NSDictionary)initialData
{
  return (NSDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInitialData:(id)a3
{
}

- (OS_dispatch_source)periodicTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPeriodicTimer:(id)a3
{
}

- (NSNumber)failedAuthCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFailedAuthCount:(id)a3
{
}

- (double)authTriggeredTime
{
  return self->_authTriggeredTime;
}

- (void)setAuthTriggeredTime:(double)a3
{
  self->_authTriggeredTime = a3;
}

- (double)authLastFailedTime
{
  return self->_authLastFailedTime;
}

- (void)setAuthLastFailedTime:(double)a3
{
  self->_authLastFailedTime = a3;
}

- (double)authLastPassedTime
{
  return self->_authLastPassedTime;
}

- (void)setAuthLastPassedTime:(double)a3
{
  self->_authLastPassedTime = a3;
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDefaults:(id)a3
{
}

- (NSNumber)defaultTimer
{
  return (NSNumber *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setDefaultTimer:(id)a3
{
}

- (NSDictionary)trustedDataShared
{
  return (NSDictionary *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setTrustedDataShared:(id)a3
{
}

- (PPSTelemetryIdentifier)ppsId
{
  return self->_ppsId;
}

- (void)setPpsId:(PPSTelemetryIdentifier *)a3
{
  self->_ppsId = a3;
}

- (void).cxx_destruct
{
}

@end
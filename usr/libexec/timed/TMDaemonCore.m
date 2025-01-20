@interface TMDaemonCore
- (BOOL)isAutomaticTimeEnabled;
- (BOOL)isAutomaticTimeZoneEnabled;
- (BOOL)isSystemTimeSet;
- (BOOL)isSystemTimeZoneSet;
- (BOOL)requiresActiveBBTime;
- (OS_dispatch_workloop)workloop;
- (TMDaemonCore)initWithTimeZoneRules:(id)a3 monotonicClock:(id)a4 preferences:(id)a5 workloop:(id)a6;
- (TMMonotonicClock)clock;
- (TMTimeProvider)timeProvider;
- (TMTimeZone)computedTimeZone;
- (double)accessoryUnc_s;
- (unsigned)rtcResetCount;
- (void)addPlugin:(id)a3;
- (void)addTimeProvider:(id)a3 forKey:(id)a4;
- (void)checkActiveTimeSourceRequired;
- (void)dealloc;
- (void)executeCommand:(id)a3 withHandler:(id)a4;
- (void)handleShutdown;
- (void)resetTime;
- (void)resetTimeZone:(id)a3;
- (void)rtcDidReset;
- (void)setAccessoryUnc_s:(double)a3;
- (void)setAccurateThresholds:(BOOL)a3;
- (void)setAutomaticTimeEnabled:(BOOL)a3;
- (void)setAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)setClock:(id)a3;
- (void)setRequiresActiveBBTime:(BOOL)a3;
- (void)setSourceAvailable:(id)a3;
- (void)setSourceTime:(id)a3;
- (void)setSourceTimeZone:(id)a3;
- (void)setSourceUnavailable:(id)a3;
- (void)setSystemTimeSet:(BOOL)a3;
- (void)setSystemTimeZoneSet:(BOOL)a3;
- (void)testAndApplySystemTime;
- (void)timeZoneManager:(id)a3 didComputeResult:(id)a4;
- (void)timeZoneManager:(id)a3 didReset:(id)a4;
- (void)timeZoneManager:(id)a3 shouldFetch:(id)a4;
@end

@implementation TMDaemonCore

- (void)rtcDidReset
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMRTCResetNotification", 0LL, 0LL, 0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007ECC;
  v4[3] = &unk_100028BA0;
  v4[4] = self;
  AnalyticsSendEventLazy(@"com.apple.timed.rtcDidReset", v4);
}

- (void)setAccurateThresholds:(BOOL)a3
{
}

- (void)handleShutdown
{
  if (!-[TMDaemonCore isSystemTimeSet](self, "isSystemTimeSet")) {
    -[TMDaemonCore testAndApplySystemTime](self, "testAndApplySystemTime");
  }
}

- (TMDaemonCore)initWithTimeZoneRules:(id)a3 monotonicClock:(id)a4 preferences:(id)a5 workloop:(id)a6
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___TMDaemonCore;
  v11 = -[TMDaemonCore init](&v32, "init");
  if (v11)
  {
    v11->_prefs = (TMPreferences *)a5;
    v11->_pendingSetupTimeHandlers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v11->_timeProviders = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[TMPreferences settimeofdayThreshold](v11->_prefs, "settimeofdayThreshold");
    v11->_settimeofdayThreshold = v12;
    v11->_workloop = (OS_dispatch_workloop *)a6;
    -[TMDaemonCore setClock:](v11, "setClock:", a4);
    v11->cache = -[TMCache initWithPath:clock:]( objc_alloc(&OBJC_CLASS___TMCache),  "initWithPath:clock:",  @"/var/db/timed/com.apple.timed.plist",  -[TMDaemonCore clock](v11, "clock"));
    v11->monitor = objc_alloc_init(&OBJC_CLASS___TMTimeSynthesizerMonitor);
    if (-[TMCache isValid](v11->cache, "isValid"))
    {
      v13 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Loading data from cache.", buf, 2u);
      }

      v14 = 0LL;
    }

    else
    {
      if (-[TMCache systemTimeSet](v11->cache, "systemTimeSet"))
      {
        v14 = -[TMCache filesystemTimestampOfPath:]( v11->cache,  "filesystemTimestampOfPath:",  @"/var/db/timed/com.apple.timed.plist");
      }

      else
      {
        v15 = (os_log_s *)qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Cache was never used to set the clock, discarding filesystem timestamp.",  buf,  2u);
        }

        v14 = 0LL;
      }

      -[TMCache emptyPath:](v11->cache, "emptyPath:", @"/var/db/timed/com.apple.timed.plist");
      xpc_activity_unregister("com.apple.timed.check-active");
    }

    if (-[NSUUID isEqual:]( -[TMCache bootUUID](v11->cache, "bootUUID"),  "isEqual:",  sub_10000847C((uint64_t)v11)))
    {
      v16 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[TMCache bootUUID](v11->cache, "bootUUID");
        unsigned int v18 = -[TMCache rtcResetCount](v11->cache, "rtcResetCount");
        *(_DWORD *)buf = 138412546;
        v34 = v17;
        __int16 v35 = 1024;
        unsigned int v36 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Boot UUID matches. Keeping RTC reset count. UUID:%@ Count:%u",  buf,  0x12u);
      }

      v11->_rtcResetCount += -[TMCache rtcResetCount](v11->cache, "rtcResetCount");
    }

    if (-[TMCache rtcReset](v11->cache, "rtcReset")) {
      -[TMDaemonCore rtcDidReset](v11, "rtcDidReset");
    }
    v11->_systemTimeSet = -[TMCache systemTimeSet](v11->cache, "systemTimeSet");
    -[TMCache accessoryUnc_s](v11->cache, "accessoryUnc_s");
    v11->_accessoryUnc_s = v19;
    sub_100008564((uint64_t)v11);
    v20 = -[TMCache STF](v11->cache, "STF");
    if (v20)
    {
      v21 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:]( &OBJC_CLASS___TMTimeSynthesizer,  "newSynthesizerFromDataRepresentation:",  v20);
      v11->_STF = v21;
      if (!-[NSString isEqualToString:](-[TMTimeSynthesizer name](v21, "name"), "isEqualToString:", @"STF")) {
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v11,  @"TMDaemonCore.m",  272LL,  @"Cached STF name mismatch");
      }
    }

    STF = v11->_STF;
    -[TMPreferences RTCWakeUncertainty](v11->_prefs, "RTCWakeUncertainty");
    -[TMTimeSynthesizer inflateHistoricalDataBy:](STF, "inflateHistoricalDataBy:");
    if (-[TMCache TDTF](v11->cache, "TDTF"))
    {
      v23 = +[TMTimeSynthesizer newSynthesizerFromDataRepresentation:]( &OBJC_CLASS___TMTimeSynthesizer,  "newSynthesizerFromDataRepresentation:");
      v11->_timeSynthesizer = v23;
      if (!-[NSString isEqualToString:](-[TMTimeSynthesizer name](v23, "name"), "isEqualToString:", @"TDTF")) {
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  v11,  @"TMDaemonCore.m",  279LL,  @"Cached synthesizer name mismatch");
      }
    }

    else
    {
      v24 = objc_alloc(&OBJC_CLASS___TMTimeSynthesizer);
      -[TMPreferences RTCFrequencyTolerance](v11->_prefs, "RTCFrequencyTolerance");
      double v26 = v25;
      -[TMPreferences RTCFrequencyNoiseDensity](v11->_prefs, "RTCFrequencyNoiseDensity");
      v11->_timeSynthesizer = -[TMTimeSynthesizer initWithClockAccuracy:noiseDensity:name:]( v24,  "initWithClockAccuracy:noiseDensity:name:",  @"TDTF",  v26,  v27);
    }

    timeSynthesizer = v11->_timeSynthesizer;
    -[TMPreferences RTCWakeUncertainty](v11->_prefs, "RTCWakeUncertainty");
    -[TMTimeSynthesizer inflateHistoricalDataBy:](timeSynthesizer, "inflateHistoricalDataBy:");
    -[TMDaemonCore addTimeProvider:forKey:](v11, "addTimeProvider:forKey:", v11->_timeSynthesizer, @"Filtered");
    v11->_timeZoneManager = -[TMTimeZoneManager initWithRules:delegate:]( objc_alloc(&OBJC_CLASS___TMTimeZoneManager),  "initWithRules:delegate:",  a3,  v11);
    if (-[TMPreferences shouldUseFilesystemTimestamp](v11->_prefs, "shouldUseFilesystemTimestamp") && v14)
    {
      v29 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Injecting filesystem timestamp: %@",  buf,  0xCu);
      }

      -[TMDaemonCore setSourceTime:](v11, "setSourceTime:", v14);
    }

    v30 = objc_alloc_init(&OBJC_CLASS___TMBackgroundNtpSource);
    v11->_ntpSource = v30;
    -[TMBackgroundNtpSource setPreferences:](v30, "setPreferences:", v11->_prefs);
    -[TMCache lastNTPFetchAttempt](v11->cache, "lastNTPFetchAttempt");
    -[TMBackgroundNtpSource setLastFetchAttempt:](v11->_ntpSource, "setLastFetchAttempt:");
    -[TMBackgroundNtpSource setClock:](v11->_ntpSource, "setClock:", -[TMDaemonCore clock](v11, "clock"));
    -[TMBackgroundNtpSource setDaemonCore:](v11->_ntpSource, "setDaemonCore:", v11);
    sub_100008598(v11);
  }

  return v11;
}

- (void)dealloc
{
  self->bootUUID = 0LL;
  self->_plugins = 0LL;

  self->_pendingSetupTimeHandlers = 0LL;
  self->_timeProviders = 0LL;
  -[NSNotificationCenter removeObserver:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:",  self);

  self->_timeZoneManager = 0LL;
  self->_timeSynthesizer = 0LL;

  self->_STF = 0LL;
  self->_ntpSource = 0LL;
  -[TMDaemonCore setClock:](self, "setClock:", 0LL);

  self->_prefs = 0LL;
  self->cache = 0LL;

  self->monitor = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMDaemonCore;
  -[TMDaemonCore dealloc](&v3, "dealloc");
}

- (void)addPlugin:(id)a3
{
  plugins = self->_plugins;
  if (!plugins)
  {
    plugins = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    self->_plugins = plugins;
  }

  -[NSMutableSet addObject:](plugins, "addObject:", a3);
}

- (void)testAndApplySystemTime
{
  if (self)
  {
    if (-[TMDaemonCore isAutomaticTimeEnabled](self, "isAutomaticTimeEnabled")) {
      sub_100008DD0((id *)&self->super.isa, 6);
    }
  }

- (void)setSystemTimeSet:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_systemTimeSet != a3)
  {
    self->_systemTimeSet = a3;
    sub_100008598(self);
  }

  if (v3)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    pendingSetupTimeHandlers = self->_pendingSetupTimeHandlers;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingSetupTimeHandlers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(pendingSetupTimeHandlers);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)i) + 16LL))();
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( pendingSetupTimeHandlers,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
      }

      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_pendingSetupTimeHandlers, "removeAllObjects");
  }

- (BOOL)isSystemTimeZoneSet
{
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue( @"timezoneset",  @"com.apple.preferences.datetime",  &keyExistsAndHasValidFormat) != 0;
}

- (void)setSystemTimeZoneSet:(BOOL)a3
{
}

- (void)executeCommand:(id)a3 withHandler:(id)a4
{
  id v7 = -[TMMonotonicClock machTime](-[TMDaemonCore clock](self, "clock"), "machTime");
  unsigned __int8 v8 = sub_10000A458(self, (uint64_t)[a3 objectForKeyedSubscript:@"TMCommand"]);
  if ([a3 objectForKeyedSubscript:@"TMRtcTime"]
    || ![a3 objectForKeyedSubscript:@"TMMachTime"])
  {
    char v9 = 0;
  }

  else
  {
    if ((v8 & 1) == 0)
    {
      __int128 v10 = (os_log_s *)qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001B1C8(a3, v10);
      }
    }

    id v7 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMMachTime"), "unsignedLongLongValue");
    unsigned __int8 v8 = 1;
    char v9 = 1;
  }

  if ([a3 objectForKeyedSubscript:@"TMRtcTime"]
    && [a3 objectForKeyedSubscript:@"TMMachTime"]
    && (!objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"TMCommand"),  "isEqualToString:",  @"TMSetSourceTime")
     || (objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSource"),  "isEqualToString:",  @"NTP") & 1) == 0)
    && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B168();
    if ((v8 & 1) != 0) {
      goto LABEL_14;
    }
  }

  else if ((v8 & 1) != 0)
  {
LABEL_14:
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B390;
    v11[3] = &unk_100028C30;
    char v12 = v9;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a4;
    -[TMMonotonicClock montonicTimeForMachTime:toQueue:withCompletionHandler:]( -[TMDaemonCore clock](self, "clock"),  "montonicTimeForMachTime:toQueue:withCompletionHandler:",  v7,  -[TMDaemonCore workloop](self, "workloop"),  v11);
    return;
  }

  sub_10000A774((NSDictionary *)self, a3, (uint64_t)a4);
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "disabled";
    if (v3) {
      id v6 = "enabled";
    }
    int v7 = 136315138;
    unsigned __int8 v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received automatic time %s\n",  (uint8_t *)&v7,  0xCu);
  }

  -[TMPreferences setAutomaticTimeEnabled:](self->_prefs, "setAutomaticTimeEnabled:", v3);
  if (v3)
  {
    -[TMDaemonCore testAndApplySystemTime](self, "testAndApplySystemTime");
    sub_10000CEF8(self, &stru_100028CC0);
    -[TMTimeSynthesizer reset](self->_STF, "reset");
  }

- (BOOL)isAutomaticTimeEnabled
{
  return -[TMPreferences isAutomaticTimeEnabled](self->_prefs, "isAutomaticTimeEnabled");
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "disabled";
    if (v3) {
      id v6 = "enabled";
    }
    *(_DWORD *)buf = 136315138;
    __int128 v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received automatic time zone %s\n", buf, 0xCu);
  }

  unsigned __int8 v7 = -[TMDaemonCore isAutomaticTimeZoneEnabled](self, "isAutomaticTimeZoneEnabled");
  -[TMPreferences setAutomaticTimeZoneEnabled:](self->_prefs, "setAutomaticTimeZoneEnabled:", v3);
  sub_10000D0D8((uint64_t)self);
  if (v3 && (v7 & 1) == 0)
  {
    -[TMMonotonicClock coarseMonotonicTime](-[TMDaemonCore clock](self, "clock"), "coarseMonotonicTime");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000D160;
    v8[3] = &unk_100028CE8;
    -[TMDaemonCore executeCommand:withHandler:]( self,  "executeCommand:withHandler:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"TMResetTimeZone",  @"TMCommand",  @"AutomaticTimeZoneEnabled",  @"TMResetTimeZoneReason",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"),  @"TMRtcTime",  0LL),  v8);
  }

- (BOOL)isAutomaticTimeZoneEnabled
{
  return -[TMPreferences isAutomaticTimeZoneEnabled](self->_prefs, "isAutomaticTimeZoneEnabled");
}

- (void)checkActiveTimeSourceRequired
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D288;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), block);
}

- (void)setSourceTime:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000DBF0;
  v3[3] = &unk_100028E18;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), v3);
}

- (void)setSourceAvailable:(id)a3
{
  v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"TMSource"];
  id v6 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received source available from %@\n",  buf,  0xCu);
  }

  unsigned __int8 v7 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    *(_DWORD *)buf = 138412802;
    char v12 = @"available";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E4C8;
  v10[3] = &unk_100028BA0;
  v10[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.timed.sourceAvailableCommand", v10);
  sub_1000086C4(self, (uint64_t)"sourceWillBecomeAvailable:", (uint64_t)v5);
  -[TMTimeZoneManager setSourceAvailable:](self->_timeZoneManager, "setSourceAvailable:", v5);
}

- (void)setSourceUnavailable:(id)a3
{
  v5 = (const __CFString *)[a3 objectForKeyedSubscript:@"TMSource"];
  id v6 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received source unavailable from %@\n",  buf,  0xCu);
  }

  unsigned __int8 v7 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    *(_DWORD *)buf = 138412802;
    char v12 = @"unavailable";
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000E778;
  v10[3] = &unk_100028BA0;
  v10[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.timed.sourceUnavailableCommand", v10);
  -[TMTimeZoneManager setSourceUnavailable:](self->_timeZoneManager, "setSourceUnavailable:", v5);
  sub_1000086C4(self, (uint64_t)"sourceBecameUnavailable:", (uint64_t)v5);
}

- (void)setSourceTimeZone:(id)a3
{
  v5 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = (const __CFString *)[a3 objectForKey:@"TMTimeZone"];
    __int16 v15 = 2112;
    id v16 = [a3 objectForKey:@"TMSource"];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received timezone %@ from %@\n",  buf,  0x16u);
  }

  id v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    uint64_t v9 = v8;
    id v10 = [a3 objectForKeyedSubscript:@"TMTimeZone"];
    *(_DWORD *)buf = 138413058;
    id v14 = @"TZ";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,tz,%@", buf, 0x2Au);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000EAB8;
  v12[3] = &unk_100028BA0;
  v12[4] = a3;
  AnalyticsSendEventLazy(@"com.apple.timed.timeZoneCommand", v12);
  if (objc_msgSend( objc_msgSend(a3, "objectForKeyedSubscript:", @"TMSource"),  "isEqualToString:",  @"Location")) {
    sub_1000086C4( self,  (uint64_t)"locationProvidedTimeZone:",  (uint64_t)[a3 objectForKeyedSubscript:@"TMTimeZone"]);
  }
  __int128 v11 = -[TMTimeZone initWithDictionary:](objc_alloc(&OBJC_CLASS___TMTimeZone), "initWithDictionary:", a3);
  -[TMTimeZoneManager setSourceTimeZone:](self->_timeZoneManager, "setSourceTimeZone:", v11);
}

- (void)setRequiresActiveBBTime:(BOOL)a3
{
  BOOL requiresActiveBBTime = self->_requiresActiveBBTime;
  self->_BOOL requiresActiveBBTime = a3;
  if (requiresActiveBBTime != a3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMBBTimeActiveNotification", 0LL, 0LL, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000EDBC;
    v6[3] = &unk_100028E38;
    BOOL v7 = a3;
    AnalyticsSendEventLazy(@"com.apple.timed.proactiveGPSTime", v6);
  }

- (void)resetTime
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F308;
  block[3] = &unk_100028DB0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[TMDaemonCore workloop](self, "workloop"), block);
}

- (void)resetTimeZone:(id)a3
{
  id v5 = [a3 objectForKey:@"TMResetTimeZoneReason"];
  id v6 = (os_log_s *)qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [a3 objectForKeyedSubscript:@"TMSource"];
    objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"TMRtcTime"), "doubleValue");
    *(_DWORD *)buf = 138413058;
    __int128 v11 = @"reset_tz";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,reason,%@", buf, 0x2Au);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000F56C;
  v9[3] = &unk_100028F00;
  v9[4] = v5;
  v9[5] = a3;
  AnalyticsSendEventLazy(@"com.apple.timed.resetTimeZoneCommand", v9);
  -[TMTimeZoneManager reset:](self->_timeZoneManager, "reset:", v5);
}

- (void)timeZoneManager:(id)a3 didReset:(id)a4
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AutomaticTimeZoneUpdateNeeded", 0LL, 0LL, 1u);
  sub_10000D0D8((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 didComputeResult:(id)a4
{
  if (([a3 isEqual:self->_timeZoneManager] & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMDaemonCore.m",  1667LL,  @"Got unexpected callback from manager %@",  a3);
  }
  sub_10000A1F0((id *)&self->super.isa, (__CFString *)[a4 olsonName]);
  sub_100008564((uint64_t)self);
}

- (void)timeZoneManager:(id)a3 shouldFetch:(id)a4
{
}

- (TMTimeZone)computedTimeZone
{
  BOOL v3 = (os_log_s *)qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    timeZoneManager = self->_timeZoneManager;
    int v6 = 138412290;
    id v7 = timeZoneManager;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Asked for computed time zone: %@",  (uint8_t *)&v6,  0xCu);
  }

  return -[TMTimeZoneManager currentTimeZone](self->_timeZoneManager, "currentTimeZone");
}

- (TMTimeProvider)timeProvider
{
  v2 = (TMTimeProvider *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_timeProviders,  "objectForKeyedSubscript:",  -[TMPreferences providerName](self->_prefs, "providerName"));
  if (!v2 && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
    sub_10001B5B0();
  }
  return v2;
}

- (void)addTimeProvider:(id)a3 forKey:(id)a4
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_timeProviders, "objectForKeyedSubscript:", a4)
    && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B61C();
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_timeProviders, "setObject:forKeyedSubscript:", a3, a4);
}

- (BOOL)isSystemTimeSet
{
  return self->_systemTimeSet;
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (double)accessoryUnc_s
{
  return self->_accessoryUnc_s;
}

- (void)setAccessoryUnc_s:(double)a3
{
  self->_accessoryUnc_s = a3;
}

- (unsigned)rtcResetCount
{
  return self->_rtcResetCount;
}

- (BOOL)requiresActiveBBTime
{
  return self->_requiresActiveBBTime;
}

- (TMMonotonicClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

@end
@interface OSADailyTelemetryMonitor
+ (void)collectDeveloperOptIn;
+ (void)evaluateState;
+ (void)sendRTCBeacon:(BOOL)a3;
@end

@implementation OSADailyTelemetryMonitor

+ (void)evaluateState
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running daily telemetry monitor.",  v2,  2u);
  }

  +[OSADailyTelemetryMonitor collectDeveloperOptIn](&OBJC_CLASS___OSADailyTelemetryMonitor, "collectDeveloperOptIn");
}

+ (void)collectDeveloperOptIn
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Collecting developer opt in telemetry",  buf,  2u);
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned __int8 v3 = [v2 optIn3rdParty];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100005B00;
  v4[3] = &unk_100020AD0;
  unsigned __int8 v5 = v3;
  AnalyticsSendEventLazy(@"com.apple.osanalytics.developerOptIn", v4);
}

+ (void)sendRTCBeacon:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (__CFString *)MGCopyAnswer(@"SerialNumber", 0LL);
  unsigned __int8 v5 = (const __CFBoolean *)(id)MGCopyAnswer(@"SigningFuse", 0LL);
  if (v5) {
    BOOL v6 = CFBooleanGetValue(v5) != 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending RTC Beacon CA Event",  buf,  2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100005D88;
  v10[3] = &unk_100020AD0;
  BOOL v11 = v6;
  AnalyticsSendEventLazy(@"com.apple.osanalytics.beacon", v10);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending RTC Beacon",  buf,  2u);
    }

    v7 = @"no_serial";
    if (v4) {
      v7 = v4;
    }
    v14[0] = v7;
    v13[0] = @"serial";
    v13[1] = @"prodFused";
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    v14[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));

    if (v3) {
      rtcsc_send_realtime(2009LL, 2009LL, v9);
    }
    else {
      rtcsc_send(2009LL, 2009LL, v9);
    }
  }
}

@end
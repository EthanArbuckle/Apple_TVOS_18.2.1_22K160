SecTaskRef sub_100004194(uint64_t a1, const __CFString *a2)
{
  SecTaskRef result;
  const void *v4;
  CFTypeRef v5;
  audit_token_t v6;
  audit_token_t v7;
  xpc_connection_get_audit_token(a1, &v7);
  v6 = v7;
  result = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  if (result)
  {
    v4 = result;
    v5 = SecTaskCopyValueForEntitlement(result, a2, 0LL);
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      return (SecTaskRef)1;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100004214(void *a1, void *a2)
{
  v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsManager sharedLTSStatsManager](&OBJC_CLASS___LTSStatsManager, "sharedLTSStatsManager"));
  if ((sub_100004194((uint64_t)v3, @"com.apple.private.LTSStats-read") & 1) != 0)
  {
    int v6 = MKBDeviceUnlockedSinceBoot();
    v7 = (os_log_s *)qword_100014B08;
    if (v6 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received message for LTSStats type",  buf,  2u);
      }

      if (v5)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([v5 getLifetimeStats]);
        v9 = (void *)((uint64_t (*)(void))_CFXPCCreateXPCObjectFromCFObject)();
        xpc_dictionary_set_value(reply, "LTSStats", v9);

        uint64_t v10 = 0LL;
      }

      else
      {
        v11 = (os_log_s *)qword_100014B08;
        if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LTSStats are not supported", v14, 2u);
        }

        v8 = 0LL;
        uint64_t v10 = 45LL;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A5F0();
      }
      v8 = 0LL;
      uint64_t v10 = 35LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
      sub_10000A61C();
    }
    v8 = 0LL;
    uint64_t v10 = 1LL;
  }

  xpc_dictionary_set_int64(reply, "errno", v10);
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
  xpc_dictionary_set_value(reply, "LTSStats", v12);

  xpc_connection_send_message(v3, reply);
  return v10;
}

void start()
{
  char v0 = sub_100004A38();
  int v1 = sub_100004B24();
  os_log_t v2 = os_log_create("com.apple.powerdatad", "main");
  v3 = (void *)qword_100014B08;
  qword_100014B08 = (uint64_t)v2;

  mach_service = xpc_connection_create_mach_service("com.apple.powerdatad", 0LL, 1uLL);
  v5 = objc_autoreleasePoolPush();
  xpc_activity_register("com.apple.powerdatad.3hourlyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010498);
  xpc_connection_set_event_handler(mach_service, &stru_1000104B8);
  xpc_connection_activate(mach_service);
  if ((v0 & 1) != 0 || v1)
  {
    xpc_activity_register("com.apple.powerdatad.15minTask", XPC_ACTIVITY_CHECK_IN, &stru_100010500);
    xpc_activity_register("com.apple.powerdatad.DailyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010520);
  }

  else
  {
    xpc_activity_unregister("com.apple.powerdatad.DailyTask");
    xpc_activity_unregister("com.apple.powerdatad.15minTask");
    xpc_transaction_exit_clean();
  }

  objc_autoreleasePoolPop(v5);
  CFRunLoopRun();
  exit(1);
}

void sub_100004510(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  v3 = objc_autoreleasePoolPush();
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LTS Activity Run!", v11, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsManager sharedLTSStatsManager](&OBJC_CLASS___LTSStatsManager, "sharedLTSStatsManager"));
    v8 = v7;
    if (v7)
    {
      [v7 updateLifetimeStats];
    }

    else
    {
      xpc_activity_unregister("com.apple.powerdatad.3hourlyTask");
      v9 = (os_log_s *)qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Failed to instantiate LTS stats manager. LTS data collection is not supported!!",  v10,  2u);
      }

      xpc_transaction_exit_clean();
    }
  }

  else if (!state)
  {
    v5 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LTS Activity checking in!", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100004660(id a1, OS_xpc_object *a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000046D8;
  handler[3] = &unk_1000104E0;
  v4 = a2;
  os_log_t v2 = v4;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_activate(v2);
}

void sub_1000046D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(v3, "LTSStats"))
    {
    }

    else
    {
      v5 = (os_log_s *)qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A648((uint64_t)v3, v5);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
  {
    sub_10000A6BC();
  }

  objc_autoreleasePoolPop(v4);
}

void sub_1000047AC(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "15 min Activity Run!", v8, 2u);
    }

    if (sub_100004C20())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EnergyTelemetry sharedInstance](&OBJC_CLASS___EnergyTelemetry, "sharedInstance"));
      [v7 getEnergyTelemetry];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A6E8();
      }
      xpc_activity_unregister("com.apple.powerdatad.15minTask");
      xpc_transaction_exit_clean();
    }
  }

  else if (!state)
  {
    v5 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "15 min Activity checking in!", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_1000048E0(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  id v3 = objc_autoreleasePoolPush();
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Daily Activity Run!", v8, 2u);
    }

    if (sub_100004C20())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EnergyTelemetry sharedInstance](&OBJC_CLASS___EnergyTelemetry, "sharedInstance"));
      [v7 calculateEnergyAndPublishTelemetry];
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A6E8();
      }
      xpc_activity_unregister("com.apple.powerdatad.DailyTask");
      xpc_transaction_exit_clean();
    }
  }

  else if (!state)
  {
    v5 = (os_log_s *)qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daily Activity checking in!", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_100004A14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_100004A38()
{
  char v0 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned __int8 v1 = [v0 optInApple];

  if ((v1 & 1) == 0)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0LL;
    if (!v3) {
      return result;
    }
    __int16 v8 = 0;
    v4 = "No opt-in for D&U.";
    v5 = (uint8_t *)&v8;
    goto LABEL_8;
  }

  if ((_os_feature_enabled_impl("EnergyTelemetry", "EnergyTelemetry") & 1) != 0) {
    return 1LL;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v6)
  {
    __int16 v7 = 0;
    v4 = "Feature flag for ET not enabled.";
    v5 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    return 0LL;
  }

  return result;
}

uint64_t sub_100004B24()
{
  char v0 = _os_feature_enabled_impl("CarbonEmissionsAwareness", "CarbonEnergyAccounting");
  unsigned __int8 v1 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  unsigned __int8 v2 = [v1 optInApple];

  if ((v2 & 1) == 0)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0LL;
    if (!v4) {
      return result;
    }
    __int16 v9 = 0;
    v5 = "No opt-in for D&U.";
    BOOL v6 = (uint8_t *)&v9;
    goto LABEL_8;
  }

  if ((v0 & 1) != 0) {
    return 1LL;
  }
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v7)
  {
    __int16 v8 = 0;
    v5 = "Feature flag for CEA not enabled.";
    BOOL v6 = (uint8_t *)&v8;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    return 0LL;
  }

  return result;
}

BOOL sub_100004C20()
{
  char v0 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"PowerTelemetryData", kCFAllocatorDefault, 0);
    BOOL v4 = CFProperty != 0LL;
    if (CFProperty)
    {
      CFRelease(CFProperty);
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PowerTelemetryData key not found",  buf,  2u);
    }

    IOObjectRelease(v2);
  }

  else
  {
    BOOL v4 = 0LL;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "No match for AppleSmartBattery IOService.",  v6,  2u);
      return 0LL;
    }
  }

  return v4;
}

id sub_100004F9C()
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2050000000LL;
  char v0 = (void *)qword_100014B28;
  uint64_t v7 = qword_100014B28;
  if (!qword_100014B28)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000887C;
    v3[3] = &unk_1000106A0;
    v3[4] = &v4;
    sub_10000887C((uint64_t)v3);
    char v0 = (void *)v5[3];
  }

  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100005090(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___EnergyTelemetry);
  io_object_t v2 = (void *)qword_100014B10;
  qword_100014B10 = (uint64_t)v1;
}

void sub_10000529C(_Unwind_Exception *a1)
{
}

void sub_100005304(_Unwind_Exception *a1)
{
}

void sub_10000536C(_Unwind_Exception *a1)
{
}

void sub_1000053E0(_Unwind_Exception *a1)
{
}

void sub_1000055B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100006340(_Unwind_Exception *a1)
{
}

void sub_100007150( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

LABEL_26:
}

id sub_100007DF4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100008010(uint64_t a1)
{
  io_object_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  6LL));
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"average_intensity"];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"domain"];
  if (*(_BYTE *)(a1 + 80)) {
    BOOL v3 = &__kCFBooleanTrue;
  }
  else {
    BOOL v3 = &__kCFBooleanFalse;
  }
  [v2 setObject:v3 forKeyedSubscript:@"is_intensity_static"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 48) + 16) stringFromDate:*(void *)(a1 + 56)]);
  [v2 setObject:v4 forKeyedSubscript:@"date"];

  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"slot"];
  v5 = *(void **)(a1 + 48);
  double v6 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) doubleValue];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 calcSlotValueFromEnergy:v6 withIntensity:v7]);
  [v2 setObject:v8 forKeyedSubscript:@"slot_value"];

  return v2;
}

int64_t sub_100008810(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

void sub_10000887C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("_GDSManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100014B28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_10000AE68();
    sub_1000088D0();
  }
}

void sub_1000088D0()
{
  id v1 = 0LL;
  if (!qword_100014B20)
  {
    __int128 v2 = off_100010680;
    uint64_t v3 = 0LL;
    qword_100014B20 = _sl_dlopen(&v2, &v1);
  }

  char v0 = v1;
  if (!qword_100014B20)
  {
    char v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }

  if (v1) {
LABEL_7:
  }
    free(v0);
}

void sub_10000897C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("_GDSBalancingAuthorityOutput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_100014B30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v10 = (void *)sub_10000AE8C();
    sub_1000089D0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }

void sub_1000089D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000089F4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008A04( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100009898(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  __int128 v2 = (void *)qword_100014B40;
  qword_100014B40 = (uint64_t)v1;
}

LABEL_22:
    __int16 v8 = 0LL;
    goto LABEL_7;
  }

  __int16 v8 = (const void *)v7;
  if (!((uint64_t (*)(void))IOReportGetChannelCount)())
  {
    uint64_t v17 = (os_log_s *)off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    v25 = "RTBuddyIOReportingEndpoint";
    v18 = "No channels found for service %s";
    v19 = v17;
    v20 = 12;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v18, buf, v20);
    goto LABEL_7;
  }

  IOReportPrune(v8, &stru_100010700);
  if (!IOReportGetChannelCount(v8))
  {
    v21 = (os_log_s *)off_100014B00;
    if (!os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    v25 = "PMP";
    v26 = 2080;
    v27 = "Volt-Temp HM";
    v18 = "No channels found for group '%s' subgroup '%s'";
    v19 = v21;
    v20 = 22;
    goto LABEL_27;
  }

  __int16 v9 = IOReportCreateSubscription(0LL, v8, &v5->_subscribedChannels, 0LL, &cf);
  v5->_subscription = (__IOReportSubscriptionCF *)v9;
  if (v9)
  {
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = dispatch_queue_create("com.apple.powerdatad.ltsqueue", v11);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v12;
  }

  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B3A8();
  }

LABEL_7:
  if (cf) {
    CFRelease(cf);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v5->_queue) {
    uint64_t v14 = v5;
  }
  else {
    uint64_t v14 = 0LL;
  }

  return v14;
}

int sub_100009B9C(id a1, __CFDictionary *a2)
{
  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  if (CFStringCompare(Group, @"PMP", 0LL)
    || (CFComparisonResult v5 = CFStringCompare(SubGroup, @"Volt-Temp HM", 0LL)) != kCFCompareEqualTo)
  {
    LODWORD(v5) = 16;
  }

  return v5;
}

id sub_10000A258(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateLifetimeStatsForChannel:a2];
}

id sub_10000A2BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLifetimeStatsGated];
}

uint64_t sub_10000A3A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A3B0(uint64_t a1)
{
}

void sub_10000A3B8(uint64_t a1)
{
  __int128 v2 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = 0LL;
  *(void *)&__int128 v6 = 138543362LL;
  __int128 v11 = v6;
  do
  {
    if (LOBYTE(off_100014940[v5 + 3]))
    {
      id v7 = -[LTSStatsStore initForChannel:]( objc_alloc(&OBJC_CLASS___LTSStatsStore),  "initForChannel:",  off_100014940[v5]);
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getLifetimeStats]);
      __int16 v9 = (os_log_s *)off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = off_100014940[v5 + 2];
        *(_DWORD *)buf = v11;
        v13 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Returning lifetime stats for report %{public}@\n",  buf,  0xCu);
      }

      objc_msgSend( *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  "setValue:forKey:",  v8,  off_100014940[v5 + 2],  v11);
    }

    v5 += 4LL;
  }

  while (v5 != 56);
}

void sub_10000A598(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_10000A5C4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_10000A5E4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

void sub_10000A5F0()
{
}

void sub_10000A61C()
{
}

void sub_10000A648(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Received unexpected message %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000A6BC()
{
}

void sub_10000A6E8()
{
}

void sub_10000A714( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A748()
{
}

void sub_10000A774()
{
}

void sub_10000A7A0()
{
}

void sub_10000A7CC()
{
}

void sub_10000A7F8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A860()
{
}

void sub_10000A8C0()
{
}

void sub_10000A920()
{
}

void sub_10000A94C()
{
}

void sub_10000A978()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Num slots needed %ld would take records beyond max count, available: %ld",  v2,  0x16u);
  sub_1000089E0();
}

void sub_10000A9F4(uint64_t a1, os_log_s *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Last accum telemetry: %@, timeDelta: %f",  (uint8_t *)&v3,  0x16u);
  sub_1000089E0();
}

void sub_10000AA70()
{
}

void sub_10000AAD0()
{
}

void sub_10000AAFC(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Num elements in incremental array %u",  buf,  8u);
}

void sub_10000AB40()
{
}

void sub_10000AB6C()
{
}

void sub_10000AB98()
{
}

void sub_10000ABC4()
{
}

void sub_10000ABF0()
{
}

void sub_10000AC50(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Total emissions slots fetched %lu",  buf,  0xCu);
}

void sub_10000AC94()
{
}

void sub_10000ACC0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 lastUpdatedDate]);
  int v7 = 138412802;
  __int16 v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "@Name %@, ID %@, Date %@!",  (uint8_t *)&v7,  0x20u);
}

void sub_10000ADA8()
{
}

void sub_10000AE08()
{
}

uint64_t sub_10000AE68()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "_GDSManager");
  return sub_10000AE8C(v0);
}

uint64_t sub_10000AE8C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "_GDSBalancingAuthorityOutput");
  return sub_10000AEB0(v0);
}

void sub_10000AEB0()
{
}

void sub_10000AEDC()
{
}

void sub_10000AF08()
{
}

void sub_10000AF68()
{
}

void sub_10000AFC8()
{
}

void sub_10000AFF4()
{
}

void sub_10000B054(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  sub_10000A5C4( (void *)&_mh_execute_header,  a2,  a3,  "Wrote %ld bytes to file %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_1000089E0();
}

void sub_10000B0C4()
{
}

void sub_10000B124()
{
}

void sub_10000B184()
{
}

void sub_10000B1E4()
{
}

void sub_10000B244()
{
}

void sub_10000B2B4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get boot UUID. rc:0x%x",  (uint8_t *)v2,  8u);
  sub_100004A24();
}

void sub_10000B324()
{
}

void sub_10000B350()
{
}

void sub_10000B37C()
{
}

void sub_10000B3A8()
{
}

void sub_10000B408()
{
}

void sub_10000B434()
{
}

void sub_10000B494()
{
}

void sub_10000B4C0()
{
}

void sub_10000B520()
{
}

void sub_10000B580()
{
}

void sub_10000B5AC()
{
}

void sub_10000B60C()
{
}

id objc_msgSend_sendDailySummaryToCoreAnalyticsForDate_withLocation_withCarbon_withEnergy_withSystem_missingIntensity_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:");
}

id objc_msgSend_sendTypedEventToCoreAnalyticsWithDate_withEnergy_andIntensity_forSlot_atLocation_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}
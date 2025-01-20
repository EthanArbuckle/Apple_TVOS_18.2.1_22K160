void sub_10000479C(id a1)
{
  _CDContextServiceManager *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS____CDContextServiceManager);
  v2 = (void *)qword_10000CBC8;
  qword_10000CBC8 = (uint64_t)v1;
}

void sub_100004E50(_Unwind_Exception *a1)
{
}

void sub_100004E80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100004FCC;
    v12[3] = &unk_1000083A0;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v13 = v6;
    id v14 = v5;
    v8 = v12;
    v9 = v7;
    v10 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005820;
    block[3] = &unk_100008458;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }
}

void sub_100004FB8(_Unwind_Exception *a1)
{
}

void sub_100004FCC(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = (id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 _extractInteractionsFromEvents:v5 onStream:v6]);
    v9 = (_BYTE *)(&loc_100005FFC + 4);
    if ([*v7 count])
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100005BE4(v7, v10);
      }

      id v11 = [*v7 count];
      v12 = (void *)objc_claimAutoreleasedReturnValue([*v7 firstObject]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stream]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.coreduet.monitors.HistoricalEventRecorded.%@",  v14));
      +[_CDDiagnosticDataReporter addValue:forScalarKey:]( &OBJC_CLASS____CDDiagnosticDataReporter,  "addValue:forScalarKey:",  v11,  v15);

      v16 = (void *)v4[4];
      id v17 = *v7;
      v21[0] = _NSConcreteStackBlock;
      v9 = (char *)&loc_100005FFC + 4;
      v21[1] = 3221225472LL;
      v21[2] = sub_100005218;
      v21[3] = &unk_100008350;
      id v22 = v17;
      [v16 saveObjects:v22 tracker:&stru_100008328 responseQueue:0 withCompletion:v21];
    }

    if ([v8 count])
    {
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100005B78(v8);
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = *((void *)v9 + 371);
      v19[2] = sub_100005278;
      v19[3] = &unk_100008378;
      id v20 = v8;
      [v4 _recordInteractions:v20 enforceDataLimits:1 enforcePrivacy:1 reply:v19];
    }
  }
}

void sub_1000051FC(id a1, id a2)
{
}

void sub_100005218()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](&OBJC_CLASS____CDLogging, "knowledgeChannel"));
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_100005CC0();
  }
}

void sub_100005278()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](&OBJC_CLASS____CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_100005D38();
  }
}

void sub_1000052D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100005424;
    v12[3] = &unk_1000083A0;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v13 = v5;
    id v14 = v6;
    v8 = v12;
    v9 = v7;
    v10 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005820;
    block[3] = &unk_100008458;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }
}

void sub_100005410(_Unwind_Exception *a1)
{
}

void sub_100005424(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100005EB8(a1, v3);
    }

    v4 = (void *)WeakRetained[4];
    uint64_t v5 = *(void *)(a1 + 40);
    id v10 = 0LL;
    id v6 = [v4 deleteAllEventsMatchingPredicate:v5 error:&v10];
    id v7 = v10;
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging instrumentationChannel](&OBJC_CLASS____CDLogging, "instrumentationChannel"));
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100005E34(a1, (uint64_t)v7, v9);
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_100005DB0((uint64_t)v6);
    }
  }
}

void sub_10000551C(id a1, _CDEventStream *a2, _DKMonitoring *a3)
{
  uint64_t v3 = a3;
  if (-[_DKMonitoring conformsToProtocol:](v3, "conformsToProtocol:", &OBJC_PROTOCOL____DKInstantMonitor)
    && -[_DKMonitoring conformsToProtocol:]( v3,  "conformsToProtocol:",  &OBJC_PROTOCOL____DKHistoricalMonitor))
  {
    v4 = v3;
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_CDLogging contextChannel](&OBJC_CLASS____CDLogging, "contextChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class(v4);
      id v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Running general shutdown handler for monitor %@",  buf,  0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DKMonitoring currentEvent](v4, "currentEvent"));
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DKMonitoring currentEvent](v4, "currentEvent"));
      [v11 setEndDate:v10];

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DKMonitoring historicalHandler](v4, "historicalHandler"));
      if (v12)
      {
        id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[_DKMonitoring historicalHandler](v4, "historicalHandler"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DKMonitoring currentEvent](v4, "currentEvent"));
        v16 = v14;
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
        ((void (**)(void, void *))v13)[2](v13, v15);
      }
    }
  }
}

uint64_t sub_100005820(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000582C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100005864(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100005A2C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextServiceManager sharedInstance](&OBJC_CLASS____CDContextServiceManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 monitorManager]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CDNotifydMonitor xpcDictionaryToFoundation:]( &OBJC_CLASS___CDNotifydMonitor,  "xpcDictionaryToFoundation:",  v2));
    [v4 deliverNotificationEvent:v5];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100006020();
  }
}

uint64_t start()
{
  uint64_t v0 = getpid();
  int v1 = memorystatus_control(14LL, v0, 1LL, 0LL, 0LL);
  if (v1) {
    syslog(3, "Error setting jetsam priority: %d", v1);
  }
  v2 = objc_autoreleasePoolPush();
  uint64_t v3 = (void *)os_transaction_create("contextstored main");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(+[_CDContextServiceManager sharedInstance](&OBJC_CLASS____CDContextServiceManager, "sharedInstance"));
  uint64_t v5 = (void *)qword_10000CBD8;
  qword_10000CBD8 = v4;

  objc_autoreleasePoolPop(v2);
  CFRunLoopRun();
  return 1LL;
}

void sub_100005B78(void *a1)
{
}

void sub_100005BE4(id *a1, os_log_s *a2)
{
  id v4 = [*a1 count];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 firstObject]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stream]);
  uint8_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  int v9 = 134218242;
  id v10 = v4;
  __int16 v11 = 2112;
  v12 = v7;
  sub_100005864( (void *)&_mh_execute_header,  a2,  v8,  "Historical handler called with %lu events for stream %@",  (uint8_t *)&v9);
}

void sub_100005CC0()
{
}

void sub_100005D38()
{
}

void sub_100005DB0(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a1));
  sub_100005884();
  sub_10000582C((void *)&_mh_execute_header, v2, v3, "Deleted %@ historical events", v4, v5, v6, v7, v8);

  sub_100005870();
}

void sub_100005E34(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error deleting historical events from the %@ monitor: %@",  (uint8_t *)&v4,  0x16u);
  sub_10000587C();
}

void sub_100005EB8(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eventStreamProperties]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  sub_100005884();
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  sub_100005864( (void *)&_mh_execute_header,  a2,  v6,  "Historical deleting handler called from the %@ monitor with predicate %@",  v7);
}

void sub_100005F70(void *a1)
{
}

void sub_100005FDC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Registering xpc_set_event_stream_handler(com.apple.notifyd.matching",  v0,  2u);
}

void sub_100006020()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "CDNotifydMonitor: Unexpected event",  v0,  2u);
}

id objc_msgSend_filterAndModifyInteractionsWithPolicies_enforceDataLimits_enforcePrivacy_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:");
}

id objc_msgSend_xpcDictionaryToFoundation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcDictionaryToFoundation:");
}
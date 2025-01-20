uint64_t start()
{
  void *v0;
  void *v1;
  os_log_s *v2;
  SubmissionController *v3;
  NSXPCListener *v4;
  SubmissionController *v5;
  void *v6;
  void handler[4];
  SubmissionController *v9;
  uint8_t buf[16];
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
  v2 = (os_log_s *)[v1 logDomain];

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "*** Starting OTACrashCopier ***", buf, 2u);
  }

  +[OSATasking checkTaskingRelevance](&OBJC_CLASS___OSATasking, "checkTaskingRelevance");
  v3 = objc_alloc_init(&OBJC_CLASS___SubmissionController);
  if (v3)
  {
    v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.OSASubmission.client");
    -[NSXPCListener setDelegate:](v4, "setDelegate:", v3);
    -[NSXPCListener resume](v4, "resume");
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002684();
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100001438;
  handler[3] = &unk_100004300;
  v5 = v3;
  v9 = v5;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);

  objc_autoreleasePoolPop(v0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v6 run];

  return 1LL;
}

void sub_100001438(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        v5 = "Unknown XPC event type - ignoring.";
        uint32_t v6 = 2;
LABEL_7:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v5,  (uint8_t *)&v13,  v6);
        goto LABEL_14;
      }

      goto LABEL_14;
    }

    xpc_object_t value = xpc_dictionary_get_value(v3, _xpc_event_key_name);
    v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v9);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315138;
        string = string_ptr;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Got event called '%s'",  (uint8_t *)&v13,  0xCu);
      }

      if (!strcmp(string_ptr, "SubmissionPreferenceChangedEvent"))
      {
        [*(id *)(a1 + 32) handleOptInChange];
        goto LABEL_13;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        string = string_ptr;
        v10 = "Recieved LaunchEvent with unknown name '%s'";
        uint32_t v11 = 12;
        goto LABEL_12;
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v10 = "Recieved nameless LaunchEvent - ignoring.";
      uint32_t v11 = 2;
LABEL_12:
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v10,  (uint8_t *)&v13,  v11);
    }

LABEL_13:
    goto LABEL_14;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    v5 = "Got XPC error in notifyd event handler: %s";
    uint32_t v6 = 12;
    goto LABEL_7;
  }

LABEL_14:
}

void sub_1000020C4(uint64_t a1)
{
  id v3 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = (uint64_t)v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "submit mode=%{public}@",  buf,  0xCu);
  }

  +[OSAStateMonitor recordEvent:](&OBJC_CLASS___OSAStateMonitor, "recordEvent:", OSAStateMonitorEventSubmissionStarted);
  if (&_CPPowerAssertionCreate)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = 0x4082C00000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "creating power assertion for %.0f secs",  buf,  0xCu);
    }

    *(void *)(*(void *)(a1 + 40) + 32LL) = CPPowerAssertionCreate( @"com.apple.OTACrashCopier.PowerAssertion",  600.0);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100002588;
  v32[3] = &unk_100004328;
  v32[4] = *(void *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v32));
  uint32_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v5,  "main",  0LL,  0LL,  600.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
  unsigned __int8 v8 = [v7 isEqualToString:@"beta"];
  if ((v8 & 1) != 0)
  {
    uint64_t v9 = 1LL;
  }

  else
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
    uint64_t v9 = (uint64_t)[v1 isEqualToString:@"urgent"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
  uint32_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 48) scanOptions]);
  [v11 setObject:v10 forKeyedSubscript:kOSALogScanOptionIncludeOnlyUrgent];

  if ((v8 & 1) == 0) {
  runCrashMoverService(0LL);
  }
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 8) connectionType]);
  [*(id *)(*(void *)(a1 + 40) + 16) setConnectionType:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v15 = [*(id *)(a1 + 32) mutableCopy];
  id v16 = [*(id *)(*(void *)(a1 + 40) + 24) copy];
  [v15 setObject:v16 forKeyedSubscript:@"notifications"];

  [v15 setObject:v14 forKeyedSubscript:@"time"];
  [*(id *)(*(void *)(a1 + 40) + 16) setLaunchInfo:v15];
  uint64_t v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 16);
  uint64_t v19 = *(void *)(v17 + 48);
  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  v29 = sub_100002610;
  v30 = &unk_100004350;
  v20 = v12;
  v31 = v20;
  [v18 submitLogsUsingPolicy:v19 resultsCallback:&v27];
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, @"submissions", v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) submissionURL]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 absoluteString]);
    [v15 setObject:v22 forKeyedSubscript:@"url"];

    v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 16) connectionType]);
    [v15 setObject:v23 forKeyedSubscript:@"connection"];

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](&OBJC_CLASS___OSASystemConfiguration, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 buildVersion]);
    [v15 setObject:v25 forKeyedSubscript:@"version"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "removeAllObjects", v27, v28, v29, v30);
  v26 = *(const void **)(*(void *)(a1 + 40) + 32LL);
  if (v26) {
    CFRelease(v26);
  }
  [v6 invalidate];
  +[OSAStateMonitor recordEvent:]( &OBJC_CLASS___OSAStateMonitor,  "recordEvent:",  OSAStateMonitorEventSubmissionCompleted);

  objc_autoreleasePoolPop(v3);
}

id sub_100002588(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "power assertion expired; aborting submission",
      v3,
      2u);
  }

  +[OSAStateMonitor recordEvent:]( &OBJC_CLASS___OSAStateMonitor,  "recordEvent:",  OSAStateMonitorEventSubmissionErrorPowerAssertionExpired);
  return [*(id *)(*(void *)(a1 + 32) + 16) abort];
}

id sub_100002610(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100002684()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create submission controller object.",  v0,  2u);
}

void sub_1000026C8()
{
  int v0 = 138543362;
  uint64_t v1 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not retrieve data vault submission path: %{public}@",  (uint8_t *)&v0,  0xCu);
}

void sub_100002744()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Client not entitled to submit logs.",  v0,  2u);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
void sub_100001F10(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const void *v26;
  void **v27;
  uint64_t v28;
  id (*v29)(uint64_t, uint64_t);
  void *v30;
  NSMutableArray *v31;
  void v32[5];
  uint8_t buf[4];
  uint64_t v34;
  v3 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
    *(_DWORD *)buf = 138543362;
    v34 = (uint64_t)v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "submit mode=%{public}@",  buf,  0xCu);
  }

  +[OSAStateMonitor recordEvent:](&OBJC_CLASS___OSAStateMonitor, "recordEvent:", OSAStateMonitorEventSubmissionStarted);
  if (&_CPPowerAssertionCreate)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = 0x4082C00000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "creating power assertion for %.0f secs",  buf,  0xCu);
    }

    *(void *)(*(void *)(a1 + 40) + 32LL) = CPPowerAssertionCreate( @"com.apple.OTACrashCopier.PowerAssertion",  600.0);
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000023D4;
  v32[3] = &unk_1000042A8;
  v32[4] = *(void *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v32));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  v5,  "main",  0LL,  0LL,  600.0));

  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
  v8 = [v7 isEqualToString:@"beta"];
  if ((v8 & 1) != 0)
  {
    v9 = 1LL;
  }

  else
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"mode"]);
    v9 = (uint64_t)[v1 isEqualToString:@"urgent"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 48) scanOptions]);
  [v11 setObject:v10 forKeyedSubscript:kOSALogScanOptionIncludeOnlyUrgent];

  if ((v8 & 1) == 0) {
  runCrashMoverService(0LL);
  }
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 8) connectionType]);
  [*(id *)(*(void *)(a1 + 40) + 16) setConnectionType:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v15 = [*(id *)(a1 + 32) mutableCopy];
  v16 = [*(id *)(*(void *)(a1 + 40) + 24) copy];
  [v15 setObject:v16 forKeyedSubscript:@"notifications"];

  [v15 setObject:v14 forKeyedSubscript:@"time"];
  [*(id *)(*(void *)(a1 + 40) + 16) setLaunchInfo:v15];
  v17 = *(void *)(a1 + 40);
  v18 = *(void **)(v17 + 16);
  v19 = *(void *)(v17 + 48);
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472LL;
  v29 = sub_10000245C;
  v30 = &unk_1000042D0;
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

id sub_1000023D4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "power assertion expired; aborting submission",
      v3,
      2u);
  }

  +[OSAStateMonitor recordEvent:]( &OBJC_CLASS___OSAStateMonitor,  "recordEvent:",  OSAStateMonitorEventSubmissionErrorPowerAssertionExpired);
  return [*(id *)(*(void *)(a1 + 32) + 16) abort];
}

id sub_10000245C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t start()
{
  if (MGGetSInt32Answer(@"DeviceClassNumber", 0LL) == 7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running on HomePod. Starting gizmoLogTransfer",  v6,  2u);
    }

    v0 = objc_autoreleasePoolPush();
    id v1 = objc_alloc(&OBJC_CLASS___PCCProxiedDevice);
    id v2 = objc_alloc_init(&OBJC_CLASS___PCCIDSEndpoint);
    id v3 = [v1 initWithEndpoint:v2];

    objc_autoreleasePoolPop(v0);
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
      [v4 run];
    }
  }

  return 1LL;
}

void sub_100002910()
{
  int v0 = 138543362;
  uint64_t v1 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not retrieve data vault submission path: %{public}@",  (uint8_t *)&v0,  0xCu);
}

void sub_10000298C()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Client not entitled to submit logs.",  v0,  2u);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
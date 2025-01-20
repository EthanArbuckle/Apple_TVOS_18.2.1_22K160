void sub_100001910(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __SecTask *v5;
  __SecTask *v6;
  CFTypeRef v7;
  const void *v8;
  CFTypeID v9;
  int Value;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  audit_token_t v23;
  audit_token_t buf;
  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void *)(a1 + 48);
    buf.val[0] = 134217984;
    *(void *)&buf.val[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received XPC event reply from [%llu]",  (uint8_t *)&buf,  0xCu);
  }

  xpc_dictionary_get_audit_token(v3, &buf);
  v23 = buf;
  v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v23);
  if (!v5) {
    goto LABEL_12;
  }
  v6 = v5;
  v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.localizationswitcher", 0LL);
  if (!v7) {
    goto LABEL_11;
  }
  v8 = v7;
  v9 = CFGetTypeID(v7);
  if (v9 != CFBooleanGetTypeID())
  {
    CFRelease(v8);
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }

  Value = CFBooleanGetValue((CFBooleanRef)v8);
  CFRelease(v8);
  CFRelease(v6);
  if (Value)
  {
    v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string( v11, "bundleID", (const char *)[*(id *)(a1 + 32) UTF8String]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) publisher]);
    xpc_event_publisher_fire(v12, *(void *)(a1 + 48), v11);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void *)(a1 + 48);
      v14 = *(void *)(a1 + 32);
      v23.val[0] = 134218242;
      *(void *)&v23.val[1] = v13;
      LOWORD(v23.val[3]) = 2114;
      *(void *)((char *)&v23.val[3] + 2) = v14;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Fired XPC event to [%llu] with bundle ID [%{public}@]",  (uint8_t *)&v23,  0x16u);
    }

    goto LABEL_14;
  }

LABEL_12:
  v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v15) {
    sub_1000027D4(v15, v16, v17, v18, v19, v20, v21, v22);
  }
LABEL_14:
}

void sub_100001BA8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Starting localizationswitcherd...",  v2,  2u);
  }

  v0 = objc_opt_new(&OBJC_CLASS___IPLocalizationSwitcherServiceDelegate);
  sub_100001C50(v0);
  v1 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.localizationswitcherd");
  -[NSXPCListener setDelegate:](v1, "setDelegate:", v0);
  -[NSXPCListener resume](v1, "resume");
  sub_100001D28();
  dispatch_main();
}

void sub_100001C50(void *a1)
{
  id v1 = a1;
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.IntlPreferences.events", 0LL);
  uint64_t v3 = xpc_event_publisher_create("com.apple.IntlPreferences.events", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v1 setPublisher:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100001D78;
  v6[3] = &unk_100004278;
  id v7 = v1;
  id v5 = v1;
  xpc_event_publisher_set_handler(v4, v6);
  xpc_event_publisher_set_error_handler(v4, &stru_1000042B8);
  xpc_event_publisher_activate(v4);
}

void sub_100001D28()
{
  v0 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.IntlPreferences.analytics");
  -[NSBackgroundActivityScheduler setPreregistered:](v0, "setPreregistered:", 1LL);
  -[NSBackgroundActivityScheduler scheduleWithBlock:](v0, "scheduleWithBlock:", &stru_1000042F8);
}

void sub_100001D78(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher received XPC_EVENT_PUBLISHER_ACTION_REMOVE, token = %llu",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 32) removeSubscriber:a3];
  }

  else if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher received XPC_EVENT_PUBLISHER_ACTION_ADD, token = %llu",  (uint8_t *)&v8,  0xCu);
    }

    [*(id *)(a1 + 32) addSubscriber:a3];
  }
}

void sub_100001EA4(id a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a2;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher error occurred: %d",  (uint8_t *)v3,  8u);
  }
}

void sub_100001F40(id a1, id a2)
{
  dispatch_queue_t v2 = (void (**)(id, uint64_t))a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    v4 = @"com.apple.IntlPreferences.analytics";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Running activity %@",  (uint8_t *)&v3,  0xCu);
  }

  +[IPInternationalAnalytics reportStatistics](&OBJC_CLASS___IPInternationalAnalytics, "reportStatistics");
  v2[2](v2, 1LL);
}

void sub_100002208(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    (*((void (**)(void))a1[6] + 2))();
    id v5 = sub_10000272C();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v14 = v4;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Encountered an error [%{public}@] while termianting application with bundle ID [%{public}@] using FrontBoardServices",  buf,  0x16u);
    }
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1[5] bundleIdentifier]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100002374;
    v10[3] = &unk_100004320;
    v12 = (os_log_s *)a1[6];
    id v11 = a1[4];
    [v8 openApplication:v9 withOptions:0 completion:v10];

    v6 = v12;
  }
}

void sub_100002374(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  if (v4)
  {
    v5();
    id v6 = sub_10000272C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      uint64_t v9 = "Encountered an error [%{public}@] while launching application with bundle ID [%{public}@] using FrontBoardServices";
      v10 = v7;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
    }
  }

  else
  {
    v5();
    id v12 = sub_10000272C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      int v14 = 138543362;
      id v15 = v13;
      uint64_t v9 = "Application with bundle ID [%{public}@] was relaunched successfully";
      v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_6;
    }
  }
}

id sub_10000272C()
{
  if (qword_1000089E8 != -1) {
    dispatch_once(&qword_1000089E8, &stru_100004388);
  }
  return (id)qword_1000089F0;
}

void sub_10000276C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.localizationswitcherd", "IPLocalizationSwitcher");
  dispatch_queue_t v2 = (void *)qword_1000089F0;
  qword_1000089F0 = (uint64_t)v1;
}

void sub_10000279C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000027D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
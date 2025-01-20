void sub_100002780()
{
  if (qword_1000088D8 != -1) {
    dispatch_once(&qword_1000088D8, &stru_100004230);
  }
}

void sub_1000027A8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.networkQuality", "netqual");
  v2 = (void *)qword_1000088E0;
  qword_1000088E0 = (uint64_t)v1;
}

uint64_t start()
{
  v0 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v1 setDelegate:v0];
  [v1 resume];

  return 0LL;
}

void sub_100002A04(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(&OBJC_CLASS___NSProgress);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  -[NSOperationQueue setUnderlyingQueue:](v6, "setUnderlyingQueue:", *(void *)(*(void *)(a1 + 32) + 8LL));
  -[NSOperationQueue setMaxConcurrentOperationCount:](v6, "setMaxConcurrentOperationCount:", 1LL);
  id v7 = [[NetworkQualityAssessment alloc] initWithConfiguration:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32) delegateQueue:v6];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100002B48;
  v8[3] = &unk_100004258;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 48);
  [v7 runWithCompletionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  objc_autoreleasePoolPop(v2);
}

void sub_100002B2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100002B48(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  WeakRetained[16] = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100002C68(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 hostName]);

  id v6 = nw_parameters_create();
  nw_parameters_set_include_peer_to_peer(v6, 1);
  bonjour_service = nw_browse_descriptor_create_bonjour_service("_nq._tcp", 0LL);
  v8 = nw_browser_create(bonjour_service, v6);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  nw_browser_set_queue(v8, v10);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100002DC8;
  handler[3] = &unk_1000042A8;
  id v11 = *(id *)(a1 + 32);
  v16 = v3;
  id v17 = v11;
  id v15 = v5;
  v12 = v3;
  id v13 = v5;
  nw_browser_set_browse_results_changed_handler(v8, handler);
  nw_browser_start(v8);

  objc_autoreleasePoolPop(v2);
}

void sub_100002DC8(uint64_t a1, nw_browse_result *a2, void *a3, int a4)
{
  id v7 = a3;
  nw_browse_result_change_t changes = nw_browse_result_get_changes(a2, v7);
  if (changes)
  {
    if ((changes & 1) != 0)
    {
      sub_100002780();
      v14 = (os_log_s *)qword_1000088E0;
      if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 90;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s:%u - nw_browse_result_change_identical, returning",  (uint8_t *)&v17,  0x12u);
      }
    }

    else
    {
      id v9 = nw_browse_result_copy_endpoint(v7);
      sub_100002780();
      id v10 = (os_log_s *)qword_1000088E0;
      if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 95;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%u - Adding %@", (uint8_t *)&v17, 0x1Cu);
      }

      bonjour_service_name = nw_endpoint_get_bonjour_service_name(v9);
      if (bonjour_service_name)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  bonjour_service_name));
      }

      else
      {
        sub_100002780();
        id v15 = (os_log_s *)qword_1000088E0;
        if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315650;
          v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 99;
          __int16 v21 = 2112;
          v22 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s:%u - NULL service_name for %@",  (uint8_t *)&v17,  0x1Cu);
        }
      }

      if (a4)
      {
        id v16 = objc_alloc_init(&OBJC_CLASS___NetworkQualityServersResult);
        [v16 setServers:*(void *)(a1 + 40)];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }
    }
  }

  else
  {
    sub_100002780();
    id v13 = (os_log_s *)qword_1000088E0;
    if (os_log_type_enabled((os_log_t)qword_1000088E0, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[NetworkQualityXPC findLocalMeasurementEndpoints:]_block_invoke_2";
      __int16 v19 = 1024;
      int v20 = 85;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s:%u - nw_browse_result_change_invalid, returning",  (uint8_t *)&v17,  0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
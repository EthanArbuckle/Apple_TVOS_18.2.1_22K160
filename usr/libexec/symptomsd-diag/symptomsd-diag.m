id sub_100003370()
{
  if (qword_100008028 != -1) {
    dispatch_once(&qword_100008028, &stru_100004148);
  }
  return (id)qword_100008030;
}

void sub_1000033B0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.symptomsd-diag", "daemon");
  v2 = (void *)qword_100008030;
  qword_100008030 = (uint64_t)v1;
}

uint64_t start()
{
  if ((_set_user_dir_suffix("com.apple.symptomsd-diag") & 1) == 0)
  {
    id v7 = sub_100003370();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9.version) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Failed to fixup temporary directory to conform to sandbox",  (uint8_t *)&v9,  2u);
    }

    exit(1);
  }

  v0 = NSTemporaryDirectory();
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  id v2 = sub_100003370();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9.version) = 138412290;
    *(CFIndex *)((char *)&v9.version + 4) = (CFIndex)v1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Updated temporary directory to: %@",  (uint8_t *)&v9,  0xCu);
  }

  dispatch_async(&_dispatch_main_q, &stru_100004168);
  v4 = (__CFRunLoopSource *)qword_100008040;
  if (!qword_100008040)
  {
    memset(&v9, 0, 72);
    v9.perform = (void (__cdecl *)(void *))nullsub_1;
    v4 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0LL, &v9);
    qword_100008040 = (uint64_t)v4;
    if (!v4) {
      dispatch_main();
    }
  }

  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v4, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0LL;
}

void sub_100003568(id a1)
{
  os_log_t v1 = objc_autoreleasePoolPush();
  id v2 = sub_100003370();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFRunLoopSourceContext v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing signal handlers.", v9, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, &_dispatch_main_q);
  v5 = (void *)qword_100008038;
  qword_100008038 = (uint64_t)v4;

  if (qword_100008038)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008038, &stru_100004188);
    dispatch_resume((dispatch_object_t)qword_100008038);
  }

  atexit_b(&stru_1000041A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ABCAdministrator sharedInstance](&OBJC_CLASS___ABCAdministrator, "sharedInstance"));
  [v6 startup];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[DRSService sharedInstance](&OBJC_CLASS___DRSService, "sharedInstance"));
  [v7 activateService];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DRSTaskingService sharedInstance](&OBJC_CLASS___DRSTaskingService, "sharedInstance"));
  [v8 activateService];

  objc_autoreleasePoolPop(v1);
}

void sub_100003694(id a1)
{
  id v1 = sub_100003370();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "symptomsd-diag is terminating", v6, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ABCAdministrator sharedInstance](&OBJC_CLASS___ABCAdministrator, "sharedInstance"));
  [v3 shutdown];

  dispatch_source_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[DRSService sharedInstance](&OBJC_CLASS___DRSService, "sharedInstance"));
  [v4 deactivateService];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DRSTaskingService sharedInstance](&OBJC_CLASS___DRSTaskingService, "sharedInstance"));
  [v5 deactivateService];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return [a1 startup];
}
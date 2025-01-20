uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  os_log_s *v4;
  void *v5;
  id v6;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  os_log_s *v13;
  pid_t v14;
  void **v16;
  uint64_t v17;
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  pid_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  v0 = objc_autoreleasePoolPush();
  v1 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  v2 = (void *)MGCopyAnswer(@"HWModelStr", 0LL);
  v3 = _ATLogCategoryFramework();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v23 = getpid();
    v24 = 2114;
    v25 = v2;
    v26 = 2114;
    v27 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ATC starting up. PID:%d, deviceModel=%{public}@, buildVersion=%{public}@",  buf,  0x1Cu);
  }

  NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)sub_100003634);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ATDeviceService sharedInstance](&OBJC_CLASS___ATDeviceService, "sharedInstance"));
  v6 = [[MSVXPCTransaction alloc] initWithName:@"com.apple.atc.startup"];
  [v6 beginTransaction];
  +[ATSession setSessionHost:](&OBJC_CLASS___ATSession, "setSessionHost:", 1LL);
  global_queue = dispatch_get_global_queue(0LL, 0LL);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472LL;
  v18 = sub_100003704;
  v19 = &unk_1000040F8;
  v9 = v5;
  v20 = v9;
  v21 = v6;
  v10 = v6;
  dispatch_async(v8, &v16);

  objc_autoreleasePoolPop(v0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop", v16, v17, v18, v19));
  [v11 run];

  v12 = _ATLogCategoryFramework();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = getpid();
    *(_DWORD *)buf = 67109120;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ATC shutting down, PID:%d", buf, 8u);
  }

  [v9 stop];
  return 0LL;
}

void sub_100003634(void *a1)
{
  id v1 = a1;
  uint64_t v2 = _ATLogCategoryFramework();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v1 callStackSymbols]);
    int v5 = 138543618;
    id v6 = v1;
    __int16 v7 = 2114;
    v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "Uncaught exception in ATC, crashing: %{public}@, %{public}@",  (uint8_t *)&v5,  0x16u);
  }
}

id sub_100003704(uint64_t a1)
{
  return [*(id *)(a1 + 40) endTransaction];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}
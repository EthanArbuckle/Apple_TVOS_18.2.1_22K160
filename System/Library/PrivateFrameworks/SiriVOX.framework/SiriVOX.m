uint64_t start()
{
  void *v0;
  os_log_s *v1;
  id v2;
  void *v3;
  os_log_s *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  v0 = objc_autoreleasePoolPush();
  AFInstallCommonSignalHandlers();
  v1 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "main";
    v8 = 2080;
    v9 = "SiriVOX-3402.8.1";
    v10 = 2080;
    v11 = "169";
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "%s SiriHeadlessService launched build %s~%s",  (uint8_t *)&v6,  0x20u);
  }

  if (AFProcessIsRunningAsInstance())
  {
    v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
      sub_100003654(v5);
    }
    exit(1);
  }

  v2 = objc_alloc_init(&OBJC_CLASS___SVXDaemon);
  [v2 startWithPlatformDependencies:0];
  objc_autoreleasePoolPop(v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v3 run];

  [v2 stop];
  return 0LL;
}

void sub_100003654(os_log_t log)
{
  int v1 = 136315138;
  v2 = "main";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s SiriHeadlessService is launched as multi-instance service unexpectedly. Exit now.",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}
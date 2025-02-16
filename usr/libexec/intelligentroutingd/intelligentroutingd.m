void start()
{
  void *v0;
  os_log_s *v1;
  id v2;
  void *v3;
  uint8_t v4[16];
  IRSetupLogging(objc_autoreleasePoolPush());
  v0 = objc_autoreleasePoolPush();
  v1 = (os_log_s *)IRLogObject;
  if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "starting daemon", v4, 2u);
  }

  v2 = objc_alloc_init(&OBJC_CLASS___IRDaemon);
  v3 = (void *)qword_100008008;
  qword_100008008 = (uint64_t)v2;

  [(id)qword_100008008 run];
  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}
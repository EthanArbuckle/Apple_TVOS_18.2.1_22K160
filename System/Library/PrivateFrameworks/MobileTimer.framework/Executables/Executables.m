uint64_t start()
{
  void *v0;
  uint64_t v1;
  os_log_s *v2;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v4;
  void *v5;
  CFRunLoopRunResult v6;
  uint64_t v7;
  os_log_s *v8;
  uint8_t v10[16];
  v0 = objc_autoreleasePoolPush();
  v1 = MTLogForCategory(1LL);
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "mobiletimerd starting...", v10, 2u);
  }

  global_queue = dispatch_get_global_queue(2LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_100004098);

  do
  {
    v5 = objc_autoreleasePoolPush();
    v6 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10.0, 0);
    objc_autoreleasePoolPop(v5);
  }

  while ((v6 - 3) < 0xFFFFFFFE);
  v7 = MTLogForCategory(1LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100003890(v8);
  }

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_10000386C(id a1)
{
  id v1 = +[MTAgent agent](&OBJC_CLASS___MTAgent, "agent");
}

void sub_100003890(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "mobiletimerd quit unexpectedly", v1, 2u);
}

id objc_msgSend_agent(void *a1, const char *a2, ...)
{
  return [a1 agent];
}
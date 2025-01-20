uint64_t start()
{
  void *v0;
  uint64_t v1;
  os_log_s *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];
  v0 = objc_autoreleasePoolPush();
  v1 = _CDPLogSystem();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Hello world!", v6, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDPDXPCListener sharedInstance](&OBJC_CLASS___CDPDXPCListener, "sharedInstance"));
  [v3 start];

  sub_1000036FC();
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CDPDEDPRecoveryTokenSynchronizeActivity sharedActivity]( &OBJC_CLASS___CDPDEDPRecoveryTokenSynchronizeActivity,  "sharedActivity"));
  [v4 synchronize];

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 1LL;
}

void sub_1000036FC()
{
  id v7 = objc_alloc_init(&OBJC_CLASS___CDPDManateeStateObserver);
  id v0 = objc_alloc_init(&OBJC_CLASS___CDPDAuthObserver);
  [v0 registerListener:v7];
  id v1 = objc_alloc_init(&OBJC_CLASS___CDPDUnlockObserver);
  [v1 registerListener:v7];
  id v2 = objc_alloc_init(&OBJC_CLASS___CDPDCircleStateObserver);
  [v2 registerListener:v7];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDPDXPCEventObserver sharedObserver](&OBJC_CLASS___CDPDXPCEventObserver, "sharedObserver"));
  [v3 registerListener:v2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CDPDXPCEventObserver sharedObserver](&OBJC_CLASS___CDPDXPCEventObserver, "sharedObserver"));
  [v4 registerListener:v0];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CDPDXPCEventObserver sharedObserver](&OBJC_CLASS___CDPDXPCEventObserver, "sharedObserver"));
  [v5 registerListener:v1];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CDPDXPCEventObserver sharedObserver](&OBJC_CLASS___CDPDXPCEventObserver, "sharedObserver"));
  [v6 start];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}
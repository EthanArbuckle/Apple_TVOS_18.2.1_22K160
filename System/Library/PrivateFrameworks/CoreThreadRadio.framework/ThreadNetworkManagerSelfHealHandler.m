@interface ThreadNetworkManagerSelfHealHandler
- (OS_dispatch_queue)selfHealThreadNetworkTimerQueue;
- (OS_dispatch_source)selfHealThreadNetworkTimer;
- (ThreadNetworkManagerSelfHealHandler)init;
- (void)cleanUpThreadKeychainEntries;
- (void)initSelfHealThreadNetworkTimer;
- (void)selfHealThreadNetworkTimerHandler;
- (void)setSelfHealThreadNetworkTimer:(id)a3;
- (void)setSelfHealThreadNetworkTimerQueue:(id)a3;
@end

@implementation ThreadNetworkManagerSelfHealHandler

- (ThreadNetworkManagerSelfHealHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ThreadNetworkManagerSelfHealHandler;
  return -[ThreadNetworkManagerSelfHealHandler init](&v3, "init");
}

- (void)initSelfHealThreadNetworkTimer
{
  uint32_t v3 = arc4random();
  v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = v3 % 0x349 + 600;
  uint64_t v7 = 60 * v6;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v46 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
    __int16 v47 = 1024;
    int v48 = 53;
    __int16 v49 = 2048;
    *(void *)&double v50 = 60 * v6;
    __int16 v51 = 1024;
    LODWORD(v52) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d : initiating self heal thread network timer, default waitTime (secs) : %ld, randomWatiTimeInMinutes : %d",  buf,  0x22u);
  }

  double v8 = sub_100110B88("SelfHealTimeStamp");
  v9 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
    __int16 v47 = 1024;
    int v48 = 58;
    __int16 v49 = 2048;
    double v50 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s:%d : initiating self heal thread network timer, selfHealTimeStamp : %f",  buf,  0x1Cu);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL * v7);
  if (v8 != 0.0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v12 timeIntervalSince1970];
    double v14 = v13;

    if (v14 <= 1657720000.0)
    {
      v21 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        v46 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
        __int16 v47 = 1024;
        int v48 = 82;
        __int16 v49 = 2048;
        double v50 = v14;
        __int16 v51 = 2048;
        uint64_t v52 = 0x41D8B3B330000000LL;
        __int16 v53 = 2048;
        uint64_t v54 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s:%d : Invalid case : current timestamp :%f is less than default time stamp :%f of self heal thread network t imer, default wait time in secs : %ld",  buf,  0x30u);
      }

      goto LABEL_12;
    }

    v15 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    double v17 = v8 + 604800.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v46 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
      __int16 v47 = 1024;
      int v48 = 69;
      __int16 v49 = 2048;
      double v50 = v14;
      __int16 v51 = 2048;
      uint64_t v52 = *(void *)&v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s:%d : self heal thread network timer, current time : %f,  next stop to trigger timer : %f ",  buf,  0x26u);
    }

    if (v14 < v17)
    {
      double v18 = v17 - v14;
      dispatch_time_t v11 = dispatch_time(0LL, (uint64_t)(v18 * 1000000000.0));
      v19 = sub_1000160F4("com.apple.wpantund.tnm", "default");
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[ThreadNetworkManagerSelfHealHandler initSelfHealThreadNetworkTimer]";
        __int16 v47 = 1024;
        int v48 = 75;
        __int16 v49 = 2048;
        double v50 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s:%d : current is less than periodicity of self heal thread network timer, wait time in secs : %f",  buf,  0x1Cu);
      }

- (void)selfHealThreadNetworkTimerHandler
{
  uint32_t v3 = objc_autoreleasePoolPush();
  v4 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[ThreadNetworkManagerSelfHealHandler selfHealThreadNetworkTimerHandler]";
    __int16 v13 = 1024;
    int v14 = 122;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s:%d: Self heal thread network timer handler",  (uint8_t *)&v11,  0x12u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore]( &OBJC_CLASS___THThreadNetworkCredentialsKeychainBackingStore,  "defaultBackingStore"));
  id v7 = -[THThreadNetworkCredentialsStoreLocalClient initApplePrivateStoreWithBackingStore:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreLocalClient),  "initApplePrivateStoreWithBackingStore:",  v6);
  if (v7)
  {
    -[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries](self, "cleanUpThreadKeychainEntries");
    double v8 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      v12 = "-[ThreadNetworkManagerSelfHealHandler selfHealThreadNetworkTimerHandler]";
      __int16 v13 = 1024;
      int v14 = 140;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s:%d: Self heal thread network timer handler Done",  (uint8_t *)&v11,  0x12u);
    }
  }

  else
  {
    v10 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001F0BBC();
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)cleanUpThreadKeychainEntries
{
  v2 = sub_1000160F4("com.apple.wpantund.tnm", "default");
  uint32_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    double v17 = "-[ThreadNetworkManagerSelfHealHandler cleanUpThreadKeychainEntries]";
    __int16 v18 = 1024;
    int v19 = 146;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s:%d: Starting the cleanup for thread keychain database",  (uint8_t *)&v16,  0x12u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore]( &OBJC_CLASS___THThreadNetworkCredentialsKeychainBackingStore,  "defaultBackingStore"));
  id v5 = -[THThreadNetworkCredentialsStoreLocalClient initApplePrivateStoreWithBackingStore:]( objc_alloc(&OBJC_CLASS___THThreadNetworkCredentialsStoreLocalClient),  "initApplePrivateStoreWithBackingStore:",  v4);
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cleanThreadKeychainDatabase:&stru_1002B5B78];
  }

  else
  {
    id v7 = sub_1000160F4("com.apple.wpantund.tnm", "default");
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001F0C34(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (OS_dispatch_source)selfHealThreadNetworkTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSelfHealThreadNetworkTimer:(id)a3
{
}

- (OS_dispatch_queue)selfHealThreadNetworkTimerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setSelfHealThreadNetworkTimerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
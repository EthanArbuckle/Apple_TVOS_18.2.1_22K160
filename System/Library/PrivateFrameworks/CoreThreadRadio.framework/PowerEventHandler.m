@interface PowerEventHandler
- (id)init:(id)a3;
- (void)eventHostPowerState;
- (void)eventNcpReady:(BOOL)a3;
- (void)powerEventListenerSystemPoweredOn:(id)a3;
- (void)powerEventListenerSystemWillPowerOn:(id)a3;
- (void)powerEventListenerSystemWillSleep:(id)a3;
@end

@implementation PowerEventHandler

- (id)init:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PowerEventHandler;
  v5 = -[PowerEventHandler init](&v14, "init");
  if (v5)
  {
    v6 = -[PowerEventListener initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___PowerEventListener),  "initWithDelegate:queue:",  v5,  v4);
    v7 = (void *)qword_1002C9840;
    qword_1002C9840 = (uint64_t)v6;

    v8 = sub_1000160F4("com.apple.wpantund", "default");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (v9)
    {
      if (sub_10015A058(6) && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "PowerEventHandler: Init", buf, 2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1001FF028();
    }

    unsigned int v10 = [(id)qword_1002C9840 registerForEvents];
    v11 = sub_1000160F4("com.apple.wpantund", "default");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      if (sub_10015A058(6) && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v16 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "PowerEventHandler: registerForEvents: %d",  buf,  8u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1001FF028();
    }
  }

  return v5;
}

- (void)powerEventListenerSystemWillSleep:(id)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = sub_1000160F4("com.apple.wpantund", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[PWR_EVT]powerEventListenerSystemWillSleep: Received SystemWillSleep on Q: %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  if (!byte_1002C9848)
  {
    byte_1002C9848 = 1;
    sub_100128754();
  }
}

- (void)powerEventListenerSystemWillPowerOn:(id)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = sub_1000160F4("com.apple.wpantund", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[PWR_EVT]powerEventListenerSystemWillPowerOn: Received SystemWillPoweredOn on Q: %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  byte_1002C9848 = 0;
  byte_1002C9849 = 0;
  byte_1002C984A = 0;
  sub_100128A20();
}

- (void)powerEventListenerSystemPoweredOn:(id)a3
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = sub_1000160F4("com.apple.wpantund", "default");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "[PWR_EVT]powerEventListenerSystemPoweredOn: Received SystemHasPoweredOn on Q: %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  sub_100128C78();
}

- (void)eventNcpReady:(BOOL)a3
{
  byte_1002C9849 = a3;
  if (byte_1002C9848) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && byte_1002C984A != 0)
  {
    byte_1002C9848 = 0;
    [(id)qword_1002C9840 allowSleep];
  }

- (void)eventHostPowerState
{
  v2 = sub_1000160F4("com.apple.wpantund", "default");
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (v3)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[PWR_EVT]eventHostPowerState", v4, 2u);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FF028();
  }

  if (byte_1002C9848 && byte_1002C9849)
  {
    byte_1002C9848 = 0;
    [(id)qword_1002C9840 allowSleep];
  }

  else
  {
    byte_1002C984A = 1;
  }

@end
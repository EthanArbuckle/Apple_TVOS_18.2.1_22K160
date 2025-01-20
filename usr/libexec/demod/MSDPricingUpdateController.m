@interface MSDPricingUpdateController
+ (id)sharedInstance;
- (BOOL)canceled;
- (BOOL)completed;
- (BOOL)needUpdate;
- (BOOL)switchModeAfterCompletion;
- (NSTimer)heartBeatMonitor;
- (int)state;
- (void)operationCanceled;
- (void)pricingUpdateTimeOut:(id)a3;
- (void)receivedCompletionNotice:(id)a3 fromRequest:(id)a4;
- (void)receivedHeartBeat:(id)a3 fromRequest:(id)a4;
- (void)receivedOtherMessages:(id)a3 fromRequest:(id)a4;
- (void)receivedUpdateRequest:(id)a3 fromRequest:(id)a4;
- (void)restartMonitor;
- (void)setCanceled:(BOOL)a3;
- (void)setHeartBeatMonitor:(id)a3;
- (void)setNeedUpdate:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setSwitchModeAfterCompletion:(BOOL)a3;
- (void)stopMonitor;
@end

@implementation MSDPricingUpdateController

+ (id)sharedInstance
{
  if (qword_1001253F0 != -1) {
    dispatch_once(&qword_1001253F0, &stru_1000F9E60);
  }
  return (id)qword_1001253E8;
}

- (void)receivedUpdateRequest:(id)a3 fromRequest:(id)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  id v10 = v8;
  objc_sync_enter(v10);
  else {
    v11 = "YES";
  }
  xpc_dictionary_set_string(reply, "MSDResult", v11);
  objc_sync_exit(v10);

  xpc_connection_send_message(v6, reply);
  id v12 = sub_10003A95C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received Pricing update request.", v14, 2u);
  }

  -[MSDPricingUpdateController setState:](self, "setState:", 1LL);
}

- (void)receivedHeartBeat:(id)a3 fromRequest:(id)a4
{
  id v6 = a4;
  id v7 = (_xpc_connection_s *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Pricing heart beat.", v12, 2u);
  }

  if (([v8 mode] == 2 || objc_msgSend(v8, "mode") == 4)
    && -[MSDPricingUpdateController state](self, "state") <= 1)
  {
    -[MSDPricingUpdateController restartMonitor](self, "restartMonitor");
  }
}

- (void)receivedCompletionNotice:(id)a3 fromRequest:(id)a4
{
  id v6 = a4;
  id v7 = (_xpc_connection_s *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Pricing completion notice.", v12, 2u);
  }

  -[MSDPricingUpdateController stopMonitor](self, "stopMonitor");
  -[MSDPricingUpdateController setState:](self, "setState:", 2LL);
  if (-[MSDPricingUpdateController switchModeAfterCompletion](self, "switchModeAfterCompletion")
    && !-[MSDPricingUpdateController canceled](self, "canceled"))
  {
    [v8 switchModeImmediately:5];
  }
}

- (void)receivedOtherMessages:(id)a3 fromRequest:(id)a4
{
  v5 = (_xpc_connection_s *)a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_object_t message = reply;
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v5, message);
}

- (void)operationCanceled
{
}

- (BOOL)completed
{
  unsigned int v2 = -[MSDPricingUpdateController state](self, "state");
  if (v2 - 2 < 2) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  if (v2)
  {
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknow Pricing app state.", v10, 2u);
    }

    return 1;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastRebootTime]);
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 <= -60.0;

  return v6;
}

- (void)stopMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FF28;
  block[3] = &unk_1000F9768;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)restartMonitor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  unsigned __int8 v4 = [v3 aboutToReboot];

  if ((v4 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100040010;
    block[3] = &unk_1000F9768;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

- (void)pricingUpdateTimeOut:(id)a3
{
  id v4 = sub_10003A95C();
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Heart beat monitor timer triggered.",  (uint8_t *)&v16,  2u);
  }

  -[MSDPricingUpdateController stopMonitor](self, "stopMonitor");
  if (-[MSDPricingUpdateController state](self, "state") <= 1)
  {
    -[MSDPricingUpdateController setState:](self, "setState:", 3LL);
    id v6 = sub_10003A95C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109120;
      int v17 = 120;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No XPC message from Pricing app for %d seconds.",  (uint8_t *)&v16,  8u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727741024LL,  @"Pricing app stopped."));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateStatusHub sharedInstance](&OBJC_CLASS___MSDDemoUpdateStatusHub, "sharedInstance"));
    [v9 demoUpdateFailed:v8];
  }

  if (-[MSDPricingUpdateController switchModeAfterCompletion](self, "switchModeAfterCompletion"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    uint64_t v11 = (uint64_t)[v10 timeShowingFatalError];

    if ((_DWORD)v11)
    {
      id v12 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 67109120;
        int v17 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Override MSDTimeShowingFatalError timeout: %u",  (uint8_t *)&v16,  8u);
      }
    }

    else
    {
      uint64_t v11 = 900LL;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoUpdateTimeKeeper sharedInstance](&OBJC_CLASS___MSDDemoUpdateTimeKeeper, "sharedInstance"));
    id v15 = [v14 setCompletionTimeForFatalError:v11];
  }

- (BOOL)switchModeAfterCompletion
{
  return self->_switchModeAfterCompletion;
}

- (void)setSwitchModeAfterCompletion:(BOOL)a3
{
  self->_switchModeAfterCompletion = a3;
}

- (BOOL)needUpdate
{
  return self->_needUpdate;
}

- (void)setNeedUpdate:(BOOL)a3
{
  self->_needUpdate = a3;
}

- (NSTimer)heartBeatMonitor
{
  return self->_heartBeatMonitor;
}

- (void)setHeartBeatMonitor:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
}

@end
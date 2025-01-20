@interface CMContinuityCaptureAgentXPCClient
- (CMContinuityCaptureAgentXPCClient)initWithDeviceIdentifier:(id)a3;
- (void)currentDeviceList;
- (void)disableAutoTransportSwitch:(BOOL)a3;
- (void)executePostEvent:(id)a3 data:(id)a4;
- (void)executeUserDisconnect;
- (void)logDebugInfo;
- (void)notifyStateChange:(id)a3 forEntity:(unint64_t)a4;
- (void)setControlValue:(id)a3 value:(id)a4;
- (void)unhideDevice;
@end

@implementation CMContinuityCaptureAgentXPCClient

- (CMContinuityCaptureAgentXPCClient)initWithDeviceIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAgentXPCClient;
  v6 = -[CMContinuityCaptureAgentXPCClient init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceIdentifier, a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Client for device identifier %@",  buf,  0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
    [v8 connectToContinuityCaptureServerWithDelegate:v7];
  }

  return v7;
}

- (void)executePostEvent:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_semaphore_create(0LL);
  if (v7)
  {
    uint64_t v9 = kCMContinuityCaptureXPCMessageExpectedStateKey;
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kCMContinuityCaptureXPCMessageExpectedStateKey]);
    if (v10)
    {
      v11 = (void *)v10;
      uint64_t v12 = kCMContinuityCaptureXPCMessageExpectedStateEntity;
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kCMContinuityCaptureXPCMessageExpectedStateEntity]);

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);
        v32 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v9]);
        v33 = v15;
        v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
        expectedStateInfoAfterPostEvent = self->_expectedStateInfoAfterPostEvent;
        self->_expectedStateInfoAfterPostEvent = v16;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Post Event %@ data %@",  buf,  0x16u);
  }

  int64_t v18 = 5000000000LL;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v19 postEvent:v6 data:v7 deviceIdentifier:self->_deviceIdentifier];

  if (v7)
  {
    uint64_t v20 = kCMContinuityCaptureXPCMessageEventChangeWaitTimeKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kCMContinuityCaptureXPCMessageEventChangeWaitTimeKey]);

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v20]);
      id v23 = [v22 unsignedIntegerValue];

      int64_t v18 = 1000000000LL * (void)v23;
    }
  }

  dispatch_time_t v24 = dispatch_time(0LL, v18);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005408;
  block[3] = &unk_100008270;
  block[4] = self;
  dispatch_after(v24, v26, block);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)notifyStateChange:(id)a3 forEntity:(unint64_t)a4
{
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    expectedStateInfoAfterPostEvent = self->_expectedStateInfoAfterPostEvent;
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    int64_t v18 = expectedStateInfoAfterPostEvent;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "State Change to %@ expected %@",  (uint8_t *)&v15,  0x16u);
  }

  v8 = self->_expectedStateInfoAfterPostEvent;
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v8, "objectForKey:", v9));
    if (v10)
    {
      v11 = self->_expectedStateInfoAfterPostEvent;
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12));
      char v14 = [v13 isEqualToString:v6] ^ 1;
    }

    else
    {
      char v14 = 1;
    }

    if ((v14 & 1) == 0 && !gCLIInteractiveMode) {
      exit(0);
    }
  }
}

- (void)executeUserDisconnect
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Post User Disconnect",  v4,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v3 disconnectSession:self->_deviceIdentifier];

  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

- (void)logDebugInfo
{
  dsema = dispatch_semaphore_create(0LL);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v2 debugInfo:&stru_1000082B0];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)disableAutoTransportSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v5 disableAutoTransportSwitch:v3 deviceIdentifier:self->_deviceIdentifier];

  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

- (void)setControlValue:(id)a3 value:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v7 setControl:v8 withValue:v6 deviceIdentifier:self->_deviceIdentifier];

  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

- (void)unhideDevice
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  [v3 unhideDeviceWithIdentifier:self->_deviceIdentifier];

  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

- (void)currentDeviceList
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[CMContinuityCaptureXPCClientCCA sharedInstance]( &OBJC_CLASS___CMContinuityCaptureXPCClientCCA,  "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100005970;
  v5[3] = &unk_1000082D8;
  v4 = v2;
  id v6 = v4;
  [v3 currentDeviceList:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (!gCLIInteractiveMode) {
    exit(0);
  }
}

- (void).cxx_destruct
{
}

@end
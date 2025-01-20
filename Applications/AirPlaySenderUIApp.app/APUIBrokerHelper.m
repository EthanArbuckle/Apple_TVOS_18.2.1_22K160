@interface APUIBrokerHelper
+ (id)sharedInstance;
- (APUIBrokerHelper)init;
- (void)_handleAuthenticationResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleBrokerResponse:(id)a3;
- (void)_handleGetInfoResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_sendBrokerRequest:(id)a3 params:(id)a4 timeout:(unint64_t)a5 completion:(id)a6;
- (void)getBrokerGroupInfo:(id)a3 completion:(id)a4;
- (void)performBrokerAuthenticationForBrokerGroup:(id)a3 withBrokerAuth:(id)a4 completion:(id)a5;
@end

@implementation APUIBrokerHelper

- (APUIBrokerHelper)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___APUIBrokerHelper;
  v2 = -[APUIBrokerHelper init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("APUIBrokerHelper.queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("APUIBrokerHelper.notification", 0LL);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMutableDictionary *)v7;
  }

  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    LogPrintF(&dword_100015F30, "-[APUIBrokerHelper init]", 33554482LL, "APUIBrokerHelper [%{ptr}] created.", v2);
  }

  return v2;
}

- (void)_handleGetInfoResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  objc_super v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    else {
      v14 = v10;
    }
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]",  33554482LL,  "[%{ptr}] Handling discovery broker GetInfo %'@ response error: %{error} %@",  self,  v11,  v12,  v14);
  }

  uint64_t v15 = NSErrorToOSStatus(v12);
  if ((_DWORD)v15)
  {
    int v19 = v15;
    APSLogErrorAt(v15, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 99LL, 0LL);
    v16 = 0LL;
  }

  else
  {
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  @"BrokerGroupInfo"));
    if (v16)
    {
      if (dword_100015F30 <= 50
        && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
      {
        int v17 = IsAppleInternalBuild();
        v18 = @"#Redacted#";
        if (v17) {
          v18 = v16;
        }
        LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]",  33554482LL,  "[%{ptr}] GetInfo response - request %'@ succeeded with brokerGroupInfo %@\n",  self,  v11,  v18);
      }

      int v19 = 0;
    }

    else
    {
      APSLogErrorAt(0LL, "-[APUIBrokerHelper _handleGetInfoResponse:requestUUID:error:completion:]", 102LL, 0LL);
      int v19 = -6705;
    }
  }

  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005988;
    block[3] = &unk_100010578;
    id v23 = v13;
    int v24 = v19;
    v22 = v16;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
}

- (void)getBrokerGroupInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005ABC;
  block[3] = &unk_1000105C8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleAuthenticationResponse:(id)a3 requestUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    else {
      id v14 = v10;
    }
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]",  33554482LL,  "[%{ptr}] Handling discovery broker authentication %'@ response error: %{error} %@",  self,  v11,  v12,  v14);
  }

  uint64_t v15 = NSErrorToOSStatus(v12);
  if ((_DWORD)v15)
  {
    int v19 = v15;
    APSLogErrorAt(v15, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 146LL, 0LL);
    v16 = 0LL;
    goto LABEL_20;
  }

  if (!v10)
  {
    APSLogErrorAt(0LL, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 148LL, 0LL);
    v16 = 0LL;
LABEL_26:
    int v19 = -6705;
    goto LABEL_20;
  }

  v16 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString objectForKeyedSubscript:]( v10,  "objectForKeyedSubscript:",  @"AuthTargetReceiverDeviceID"));
  if (!v16)
  {
    APSLogErrorAt(0LL, "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]", 151LL, 0LL);
    goto LABEL_26;
  }

  if (dword_100015F30 <= 50
    && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554482LL)))
  {
    int v17 = IsAppleInternalBuild();
    v18 = @"#Redacted#";
    if (v17) {
      v18 = v16;
    }
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleAuthenticationResponse:requestUUID:error:completion:]",  33554482LL,  "[%{ptr}] Auth response - request %'@ succeeded with authTargetReceiverDeviceID %@\n",  self,  v11,  v18);
  }

  int v19 = 0;
LABEL_20:
  if (v13)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005DE8;
    block[3] = &unk_100010578;
    id v23 = v13;
    int v24 = v19;
    v22 = v16;
    dispatch_async((dispatch_queue_t)notificationQueue, block);
  }
}

- (void)performBrokerAuthenticationForBrokerGroup:(id)a3 withBrokerAuth:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100005F3C;
  v15[3] = &unk_1000105F0;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)queue, v15);
}

- (void)_sendBrokerRequest:(id)a3 params:(id)a4 timeout:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000060F8;
  block[3] = &unk_100010640;
  void block[4] = self;
  id v18 = v11;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleBrokerResponse:(id)a3
{
  v4 = (__CFString *)a3;
  id v19 = v4;
  if (!v4)
  {
    APSLogErrorAt(0LL, "-[APUIBrokerHelper _handleBrokerResponse:]", 248LL, 0LL);
LABEL_25:
    id v10 = 0LL;
    goto LABEL_16;
  }

  dispatch_queue_t v5 = v4;
  if (dword_100015F30 <= 50)
  {
    if (dword_100015F30 != -1 || (v8 = _LogCategory_Initialize(&dword_100015F30, 33554482LL), dispatch_queue_t v5 = v19, v8))
    {
      int v6 = IsAppleInternalBuild();
      id v7 = @"#Redacted#";
      if (v6) {
        id v7 = v19;
      }
      LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleBrokerResponse:]",  33554482LL,  "[%{ptr}] Handling discovery broker response %@",  self,  v7);
      dispatch_queue_t v5 = v19;
    }
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"RequestType"));
  if (!v9)
  {
    if (dword_100015F30 <= 90
      && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554522LL)))
    {
      LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleBrokerResponse:]",  33554522LL,  "[%{ptr}] Broker response - no command specified\n",  self);
    }

    goto LABEL_25;
  }

  id v10 = (void *)v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", @"RequestUUID"));
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", @"Status"));
    id v14 = [v13 intValue];

    if ((_DWORD)v14) {
      APSLogErrorAt(v14, "-[APUIBrokerHelper _handleBrokerResponse:]", 265LL, 0LL);
    }
    id v15 = self;
    objc_sync_enter(v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v15->_pendingRequests,  "objectForKeyedSubscript:",  v12));
    if (v16)
    {
      id v17 = v16;
      objc_sync_enter(v17);
      [v17 setResponse:v19];
      [v17 setStatus:v14];
      objc_sync_exit(v17);

      objc_sync_exit(v15);
      id v18 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue([v17 semaphore]);
      dispatch_semaphore_signal(v18);
    }

    else
    {
      objc_sync_exit(v15);
    }
  }

  else if (dword_100015F30 <= 90 {
         && (dword_100015F30 != -1 || _LogCategory_Initialize(&dword_100015F30, 33554522LL)))
  }
  {
    LogPrintF( &dword_100015F30,  "-[APUIBrokerHelper _handleBrokerResponse:]",  33554522LL,  "[%{ptr}] Broker response - no request UUID specified\n",  self);
  }

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006918;
  block[3] = &unk_100010660;
  void block[4] = a1;
  if (qword_1000161A0 != -1) {
    dispatch_once(&qword_1000161A0, block);
  }
  return (id)qword_1000161A8;
}

- (void).cxx_destruct
{
}

@end
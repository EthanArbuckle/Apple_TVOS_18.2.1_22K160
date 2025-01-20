@interface BMRapportManager
- (BMRapportManager)initWithQueue:(id)a3;
- (BMRapportManagerDelegate)delegate;
- (BOOL)discoveryManager:(id)a3 supportsDevice:(id)a4;
- (OS_dispatch_queue)queue;
- (id)deviceWithIdentifier:(id)a3;
- (id)discoveredDevices;
- (id)localDevice;
- (void)activateWithCompletion:(id)a3;
- (void)discoveryManager:(id)a3 didDiscoverDevice:(id)a4;
- (void)discoveryManager:(id)a3 didLoseDevice:(id)a4;
- (void)finishedSendingRequestsToDevice:(id)a3;
- (void)handleActivationForDevice:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)registerForSigterm;
- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5;
- (void)sendNextRequestToDevice:(id)a3;
- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BMRapportManager

- (BMRapportManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMRapportManager;
  v6 = -[BMRapportManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[BMRapportDiscoveryManager initWithServiceName:delegate:queue:]( objc_alloc(&OBJC_CLASS___BMRapportDiscoveryManager),  "initWithServiceName:delegate:queue:",  @"com.apple.biomesyncd.rapport",  v7,  v7->_queue);
    discoveryManager = v7->_discoveryManager;
    v7->_discoveryManager = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[BMRapportClient clientForHandlingRequestsWithServiceName:queue:]( &OBJC_CLASS___BMRapportClient,  "clientForHandlingRequestsWithServiceName:queue:",  @"com.apple.biomesyncd.rapport",  v7->_queue));
    requestHandlerClient = v7->_requestHandlerClient;
    v7->_requestHandlerClient = (BMRapportRequestHandlerClient *)v10;

    -[BMRapportManager registerForSigterm](v7, "registerForSigterm");
  }

  return v7;
}

- (void)registerForSigterm
{
  v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)self->_queue);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v3;

  id v5 = self->_sigtermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001852C;
  handler[3] = &unk_100068B70;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  requestHandlerClient = self->_requestHandlerClient;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100018728;
  v20[3] = &unk_1000691D8;
  v20[4] = self;
  v8 = v5;
  v21 = v8;
  v9 = v6;
  v22 = v9;
  -[BMRapportRequestHandlerClient activateWithCompletion:](requestHandlerClient, "activateWithCompletion:", v20);
  dispatch_group_enter(v9);
  discoveryManager = self->_discoveryManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000187BC;
  v17[3] = &unk_1000691D8;
  v17[4] = self;
  v11 = v8;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  -[BMRapportDiscoveryManager startWithCompletion:](discoveryManager, "startWithCompletion:", v17);
  if (v4)
  {
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100018850;
    v14[3] = &unk_100068B98;
    v15 = v11;
    id v16 = v4;
    dispatch_group_notify(v12, (dispatch_queue_t)queue, v14);
  }
}

- (void)start
{
  uint64_t v3 = __biome_log_for_category(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: start", v5, 2u);
  }

  -[BMRapportManager activateWithCompletion:](self, "activateWithCompletion:", 0LL);
}

- (void)stop
{
  uint64_t v3 = __biome_log_for_category(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: stop", v5, 2u);
  }

  -[BMRapportDiscoveryManager stop](self->_discoveryManager, "stop");
}

- (void)invalidate
{
  uint64_t v3 = __biome_log_for_category(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportManager: invalidate", v7, 2u);
  }

  -[BMRapportRequestHandlerClient invalidate](self->_requestHandlerClient, "invalidate");
  requestHandlerClient = self->_requestHandlerClient;
  self->_requestHandlerClient = 0LL;

  -[BMRapportDiscoveryManager invalidate](self->_discoveryManager, "invalidate");
  discoveryManager = self->_discoveryManager;
  self->_discoveryManager = 0LL;
}

- (id)discoveredDevices
{
  return -[BMRapportDiscoveryManager devices](self->_discoveryManager, "devices");
}

- (id)localDevice
{
  return -[BMRapportDiscoveryManager localDevice](self->_discoveryManager, "localDevice");
}

- (id)deviceWithIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[BMRapportDiscoveryManager deviceWithIdentifier:]( self->_discoveryManager,  "deviceWithIdentifier:",  v5));

  return v6;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  -[BMRapportRequestHandlerClient registerRequestID:options:requestHandler:]( self->_requestHandlerClient,  "registerRequestID:options:requestHandler:",  v11,  v10,  v9);
}

- (void)sendRequest:(id)a3 request:(id)a4 toDevice:(id)a5 responseHandler:(id)a6
{
  queue = self->_queue;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  uint64_t v16 = RPOptionTimeoutSeconds;
  v17 = &off_10006EEB8;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  -[BMRapportManager sendRequest:request:device:options:responseHandler:]( self,  "sendRequest:request:device:options:responseHandler:",  v14,  v13,  v12,  v15,  v11);
}

- (void)sendRequest:(id)a3 request:(id)a4 device:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v17 = __biome_log_for_category(11LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v14)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v14 shortenedRapportIdentifier]);
      *(_DWORD *)buf = 138412290;
      v45 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "BMRapportDevice[%@]: enqueueing request",  buf,  0xCu);
    }

    if (v13) {
      v21 = v13;
    }
    else {
      v21 = &__NSDictionary0__struct;
    }
    v19 = (os_log_s *)[v21 mutableCopy];
    -[os_log_s setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v12, @"~~REQUEST_ID~~");
    id v22 = [v16 copy];
    -[os_log_s setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v22, @"~~RESPONSE_HANDLER~~");

    -[os_log_s setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v15, @"~~OPTIONS~~");
    v23 = (void *)objc_claimAutoreleasedReturnValue([v14 requestQueue]);
    [v23 addObject:v19];

    uint64_t v24 = __biome_log_for_category(11LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v14 shortenedRapportIdentifier]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v14 requestQueue]);
      *(_DWORD *)buf = 138412546;
      v45 = v26;
      __int16 v46 = 2112;
      v47 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "BMRapportDevice[%@]: request queue %@",  buf,  0x16u);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v14 client]);
    BOOL v29 = v28 == 0LL;

    if (v29)
    {
      objc_initWeak(&location, v14);
      objc_initWeak(&from, self);
      uint64_t v30 = __biome_log_for_category(11LL);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v14 shortenedRapportIdentifier]);
        *(_DWORD *)buf = 138412290;
        v45 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "BMRapportDevice[%@]: activating client",  buf,  0xCu);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v14 device]);
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[BMRapportClient clientForCommunicatingWithDevice:serviceName:queue:]( &OBJC_CLASS___BMRapportClient,  "clientForCommunicatingWithDevice:serviceName:queue:",  v33,  @"com.apple.biomesyncd.rapport",  self->_queue));
      [v14 setClient:v34];

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1000191D4;
      v40[3] = &unk_100068A60;
      objc_copyWeak(&v41, &location);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v14 client]);
      [v35 setInvalidationHandler:v40];

      v36 = (void *)objc_claimAutoreleasedReturnValue([v14 client]);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_100019204;
      v37[3] = &unk_100069200;
      objc_copyWeak(&v38, &from);
      objc_copyWeak(&v39, &location);
      [v36 activateWithCompletion:v37];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v41);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

  else if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    sub_1000418C4();
  }
}

- (void)handleActivationForDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = __biome_log_for_category(11LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 shortenedRapportIdentifier]);
      id v12 = (void *)v11;
      id v13 = @"failed with error, ";
      if (!v7) {
        id v13 = @"completed";
      }
      *(_DWORD *)v20 = 138412802;
      *(void *)&v20[4] = v11;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v13;
      if (v7) {
        id v14 = v7;
      }
      else {
        id v14 = &stru_100069BD0;
      }
      *(_WORD *)&v20[22] = 2112;
      v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "BMRapportDevice[%@]: activation %@%@",  v20,  0x20u);
    }

    if (v7)
    {
      if (-[__CFString code](v7, "code") == (id)-71165LL)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v7, "domain"));
        unsigned int v16 = [v15 isEqualToString:RPErrorDomain];

        if (v16)
        {
          -[BMRapportDiscoveryManager ignoreDevice:](self->_discoveryManager, "ignoreDevice:", v6);
          uint64_t v17 = __biome_log_for_category(11LL);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v6 shortenedRapportIdentifier]);
            *(_DWORD *)v20 = 138412290;
            *(void *)&v20[4] = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "BMRapportDevice[%@]: determined to not support service com.apple.biomesyncd.rapport",  v20,  0xCu);
          }
        }
      }

      objc_msgSend(v6, "invalidateClientWithError:", v7, *(_OWORD *)v20, *(void *)&v20[16]);
    }

    else
    {
      -[BMRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v6);
    }
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000418F0();
    }
  }
}

- (void)sendNextRequestToDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestQueue]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 popFirstObject]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"~~REQUEST_ID~~"]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"~~OPTIONS~~"]);
      id v9 = [v8 mutableCopy];
      id v10 = v9;
      if (v9) {
        uint64_t v11 = (NSMutableDictionary *)v9;
      }
      else {
        uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      id v13 = v11;

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"]);
      id v15 = (void *)v14;
      if (v7 && v14)
      {
        [v6 setObject:0 forKeyedSubscript:@"~~REQUEST_ID~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~OPTIONS~~"];
        [v6 setObject:0 forKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
        uint64_t v16 = __biome_log_for_category(11LL);
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v4 shortenedRapportIdentifier]);
          *(_DWORD *)buf = 138412802;
          v28 = v18;
          __int16 v29 = 2112;
          uint64_t v30 = v6;
          __int16 v31 = 2112;
          v32 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "BMRapportDevice[%@]: being sent request %@ with options %@",  buf,  0x20u);
        }

        objc_initWeak((id *)buf, v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 requestQueue]);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v19 count] != 0));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v20,  RPOptionMoreComing);

        v21 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_100019808;
        v24[3] = &unk_100069228;
        id v25 = v15;
        objc_copyWeak(&v26, (id *)buf);
        v24[4] = self;
        [v21 sendRequestID:v7 request:v6 options:v13 responseHandler:v24];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        uint64_t v22 = __biome_log_for_category(11LL);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_100041954(v4, (uint64_t)v6, v23);
        }

        -[BMRapportManager sendNextRequestToDevice:](self, "sendNextRequestToDevice:", v4);
      }
    }

    else
    {
      -[BMRapportManager finishedSendingRequestsToDevice:](self, "finishedSendingRequestsToDevice:", v4);
    }
  }

  else
  {
    uint64_t v12 = __biome_log_for_category(11LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT)) {
      sub_100041928();
    }
  }
}

- (void)finishedSendingRequestsToDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = __biome_log_for_category(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 shortenedRapportIdentifier]);
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BMRapportDevice[%@]: request queue empty, invalidating client",  (uint8_t *)&v9,  0xCu);
    }

    [v4 invalidateClientWithError:0];
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100041A04();
    }
  }
}

- (void)discoveryManager:(id)a3 didDiscoverDevice:(id)a4
{
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](self, "delegate"));
  [v7 rapportManager:self didDiscoverBMRapportDevice:v6];
}

- (void)discoveryManager:(id)a3 didLoseDevice:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 shortenedRapportIdentifier]);
    int v11 = 138412290;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BMRapportDevice[%@]: lost", (uint8_t *)&v11, 0xCu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](self, "delegate"));
  [v9 rapportManager:self didLoseNearbyBMRapportDevice:v5];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"BMRapportErrorDomain",  10LL,  0LL));
  [v5 invalidateClientWithError:v10];
}

- (BOOL)discoveryManager:(id)a3 supportsDevice:(id)a4
{
  id v4 = self;
  queue = self->_queue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportManager delegate](v4, "delegate"));
  LOBYTE(v4) = [v7 rapportManager:v4 isDeviceSupported:v6];

  return (char)v4;
}

- (BMRapportManagerDelegate)delegate
{
  return (BMRapportManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end
@interface BTVCBonjourService
- (BOOL)isLocalEndpoint:(id)a3;
- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (BOOL)startDiscovery;
- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4;
- (BTVCBonjourService)initWithQueue:(id)a3;
- (NSMutableDictionary)advToBrowserNwToSFendpoints;
- (NSMutableDictionary)advToBrowserUuidToSFendpoints;
- (NSMutableDictionary)browserToAdvNwToSFendpoints;
- (NSMutableDictionary)browserToAdvUuidToSFendpoints;
- (NSMutableSet)advertiserAdvs;
- (NSMutableSet)resultChanges;
- (OS_nw_browser)browser;
- (OS_nw_endpoint)endpoint;
- (OS_nw_listener)listener;
- (id)_endpointForUniqueID:(id)a3;
- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4;
- (id)advertisingStateUpdateHandler;
- (id)deviceDidConnectHandler;
- (id)deviceDidDisconnectHandler;
- (id)deviceDidReceiveDataHandler;
- (id)deviceDidStartScanning;
- (id)deviceDidStopScanning;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)discoveryStateUpdateHandler;
- (id)getUniqueServiceNameForAdvertiser;
- (id)randomUUID;
- (int)advertiserState;
- (int)browserState;
- (void)_cleanUp;
- (void)_cleanupAdvertiser;
- (void)_cleanupBrowser;
- (void)_reportCachedDiscoveryResults;
- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5;
- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6;
- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6;
- (void)_startAdvertiser;
- (void)_startBrowser;
- (void)_stopAdvertising;
- (void)_stopBrowser;
- (void)_updateAdvertiserState;
- (void)_updateBrowserState;
- (void)connectToDevice:(id)a3;
- (void)dealloc;
- (void)disconnectFromDevice:(id)a3;
- (void)handleBrowseResults:(id)a3;
- (void)setAdvToBrowserNwToSFendpoints:(id)a3;
- (void)setAdvToBrowserUuidToSFendpoints:(id)a3;
- (void)setAdvertiserAdvs:(id)a3;
- (void)setAdvertiserState:(int)a3;
- (void)setAdvertisingStateUpdateHandler:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setBrowserState:(int)a3;
- (void)setBrowserToAdvNwToSFendpoints:(id)a3;
- (void)setBrowserToAdvUuidToSFendpoints:(id)a3;
- (void)setDeviceDidConnectHandler:(id)a3;
- (void)setDeviceDidDisconnectHandler:(id)a3;
- (void)setDeviceDidReceiveDataHandler:(id)a3;
- (void)setDeviceDidStartScanning:(id)a3;
- (void)setDeviceDidStopScanning:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryStateUpdateHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setResultChanges:(id)a3;
- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4;
- (void)stopDiscovery;
@end

@implementation BTVCBonjourService

- (BTVCBonjourService)initWithQueue:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___BTVCBonjourService;
  v6 = -[BTVCBonjourService init](&v28, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serialQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    advertiserAdvs = v7->_advertiserAdvs;
    v7->_advertiserAdvs = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    advToBrowserNwToSFendpoints = v7->_advToBrowserNwToSFendpoints;
    v7->_advToBrowserNwToSFendpoints = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    advToBrowserUuidToSFendpoints = v7->_advToBrowserUuidToSFendpoints;
    v7->_advToBrowserUuidToSFendpoints = v12;

    v7->_advertiserState = 0;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    browserToAdvNwToSFendpoints = v7->_browserToAdvNwToSFendpoints;
    v7->_browserToAdvNwToSFendpoints = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    browserToAdvUuidToSFendpoints = v7->_browserToAdvUuidToSFendpoints;
    v7->_browserToAdvUuidToSFendpoints = v16;

    v7->_browserState = 0;
    uint64_t v18 = [NSMutableSet set];
    resultChanges = v7->_resultChanges;
    v7->_resultChanges = (NSMutableSet *)v18;

    uint64_t v20 = [v7 randomUUID];
    localAdvertiserUUIDString = v7->_localAdvertiserUUIDString;
    v7->_localAdvertiserUUIDString = (NSString *)v20;

    uint64_t v22 = [v7 randomUUID];
    localBrowserUUIDString = v7->_localBrowserUUIDString;
    v7->_localBrowserUUIDString = (NSString *)v22;

    v24 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v7->_localAdvertiserUUIDString;
      v26 = v7->_localBrowserUUIDString;
      *(_DWORD *)buf = 138412546;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] LocalAdvID %@, LocalBrowserID: %@",  buf,  0x16u);
    }
  }

  return v7;
}

- (id)randomUUID
{
  v2 = [NSUUID UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)getUniqueServiceNameForAdvertiser
{
  v2 = [self->_localAdvertiserUUIDString lowercaseString];
  v3 = [v2 substringWithRange:NSMakeRange(12, 12)];

  return v3;
}

- (void)_startAdvertiser
{
  unsigned int v3 = -[BTVCBonjourService advertiserState](self, "advertiserState");
  v4 = (os_log_s *)qword_1008F7710;
  if (v3)
  {
    id v5 = (os_log_s *)(id)qword_1008F7710;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = -[BTVCBonjourService advertiserState](self, "advertiserState");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Unable to start BTVCBonjourServiceAdvertiser, invalid state : %d",  buf,  8u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Starting BTVCBonjourServiceAdvertiser listener/advertiser",  buf,  2u);
    }

    v6 = [BTVCBonjourEndpoint createConnectionParameters];
    v7 = nw_listener_create(v6);
    listener = self->_listener;
    self->_listener = v7;

    if (self->_listener)
    {
      id v9 = [self getUniqueServiceNameForAdvertiser];
      bonjour_service = nw_advertise_descriptor_create_bonjour_service( (const char *)[v9 UTF8String],  "_btvc._tcp",  0);
      if (bonjour_service)
      {
        v11 = (os_log_s *)qword_1008F7710;
        if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "_btvc._tcp";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] nw_advertise_descriptor_create_bonjour_service, %@, ServiceType %s success",  buf,  0x16u);
        }

        nw_listener_set_advertise_descriptor(self->_listener, bonjour_service);
        nw_listener_set_queue(self->_listener, (dispatch_queue_t)self->_serialQueue);
        id location = 0LL;
        objc_initWeak(&location, self);
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        v25 = sub_100201EE8;
        v26 = sub_100201EF8;
        id v27 = 0LL;
        v12 = self->_listener;
        handler[0] = _NSConcreteStackBlock;
        handler[2] = sub_100201F00;
        handler[3] = &unk_100886F28;
        handler[1] = 3221225472LL;
        objc_copyWeak(&v22, &location);
        handler[4] = buf;
        nw_listener_set_state_changed_handler(v12, handler);
        v13 = self->_listener;
        v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472LL;
        uint64_t v18 = sub_10020222C;
        v19 = &unk_100886F50;
        objc_copyWeak(&v20, &location);
        nw_listener_set_new_connection_handler(v13, &v16);
        -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 1LL, v16, v17, v18, v19);
        nw_listener_start(self->_listener);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&v22);
        _Block_object_dispose(buf, 8);

        objc_destroyWeak(&location);
      }

      else
      {
        v14 = self->_listener;
        self->_listener = 0LL;

        v15 = (os_log_s *)qword_1008F7710;
        if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Unable to create to advertiser descriptor",  buf,  2u);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
    {
      sub_10065DF64();
    }
  }

- (void)startAdvertisingWithData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  if (!serialQueue)
  {
    id v9 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[BTVCBonjourService startAdvertisingWithData:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s _serialQueue is nil", buf, 0xCu);
    }

    serialQueue = (dispatch_queue_s *)self->_serialQueue;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100202468;
  block[3] = &unk_100886F78;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(serialQueue, block);
}

- (void)_stopAdvertising
{
  if (-[BTVCBonjourService advertiserState](self, "advertiserState") == 2)
  {
    -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 3LL);
    nw_listener_cancel(self->_listener);
  }

  else
  {
    unsigned int v3 = (os_log_s *)(id)qword_1008F7710;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[BTVCBonjourService advertiserState](self, "advertiserState");
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Unable to stop advertiser, invalid state : %d",  (uint8_t *)v4,  8u);
    }
  }

- (BOOL)stopAdvertisingForData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002027DC;
  block[3] = &unk_100886F78;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);

  return 1;
}

- (void)_cleanupAdvertiser
{
  if (-[BTVCBonjourService advertiserState](self, "advertiserState"))
  {
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Cleaning up the advertiser",  v5,  2u);
    }

    v4 = -[BTVCBonjourService advToBrowserNwToSFendpoints];
    [v4 enumerateKeysAndObjectsUsingBlock:&stru_100886FB8];

    -[BTVCBonjourService _updateAdvertiserState](self, "_updateAdvertiserState");
  }

- (void)_updateAdvertiserState
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService advToBrowserNwToSFendpoints](self, "advToBrowserNwToSFendpoints"));
  id v4 = [v3 keysOfEntriesPassingTest:&stru_100886FF8];

  if (![v4 count] && !self->_listener)
  {
    -[BTVCBonjourService setAdvertiserState:](self, "setAdvertiserState:", 0LL);
    if (self->_shouldRestartAdvertising)
    {
      self->_shouldRestartAdvertising = 0;
      -[BTVCBonjourService _startAdvertiser](self, "_startAdvertiser");
    }
  }
}

- (void)_startBrowser
{
  unsigned int v3 = -[BTVCBonjourService browserState](self, "browserState");
  id v4 = (os_log_s *)qword_1008F7710;
  if (v3)
  {
    id v5 = (os_log_s *)(id)qword_1008F7710;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = -[BTVCBonjourService browserState](self, "browserState");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Unable to start the browser, invalid state : %d",  buf,  8u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Starting the browser",  buf,  2u);
    }

    id v5 = nw_parameters_create();
    nw_parameters_set_include_peer_to_peer(v5, 1);
    bonjour_service = nw_browse_descriptor_create_bonjour_service("_btvc._tcp", 0LL);
    id v7 = nw_browser_create(bonjour_service, v5);
    browser = self->_browser;
    self->_browser = v7;

    id v9 = self->_browser;
    if (v9)
    {
      nw_browser_set_queue(v9, (dispatch_queue_t)self->_serialQueue);
      *(void *)buf = 0LL;
      objc_initWeak((id *)buf, self);
      id v10 = self->_browser;
      state_changed_handler[0] = _NSConcreteStackBlock;
      state_changed_handler[1] = 3221225472LL;
      state_changed_handler[2] = sub_100202E04;
      state_changed_handler[3] = &unk_100887020;
      objc_copyWeak(&v18, (id *)buf);
      nw_browser_set_state_changed_handler(v10, state_changed_handler);
      id v11 = self->_browser;
      v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472LL;
      id v14 = sub_100202FBC;
      v15 = &unk_100887048;
      objc_copyWeak(&v16, (id *)buf);
      nw_browser_set_browse_results_changed_handler(v11, &v12);
      -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 1LL, v12, v13, v14, v15);
      nw_browser_start(self->_browser);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
    {
      sub_10065DFBC();
    }
  }
}

- (BOOL)startDiscovery
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100203180;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(serialQueue, block);
  return 1;
}

- (void)_stopBrowser
{
  if (-[BTVCBonjourService browserState](self, "browserState") == 2)
  {
    -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 3LL);
    nw_browser_cancel(self->_browser);
  }

  else
  {
    unsigned int v3 = (os_log_s *)(id)qword_1008F7710;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = -[BTVCBonjourService browserState](self, "browserState");
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] StopBrowser is not stopping. current browser state %d",  (uint8_t *)v4,  8u);
    }
  }

- (void)stopDiscovery
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100203358;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_reportCachedDiscoveryResults
{
  id location = 0LL;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_1002033F8;
  v4[3] = &unk_100887098;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_cleanupBrowser
{
  if (-[BTVCBonjourService browserState](self, "browserState"))
  {
    unsigned int v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Cleaning up browser",  v7,  2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
    [v4 enumerateKeysAndObjectsUsingBlock:&stru_1008870B8];

    -[BTVCBonjourService _updateBrowserState](self, "_updateBrowserState");
    id v5 = [self deviceDidStopScanning];

    if (v5)
    {
      id v6 = [self deviceDidStopScanning];
      v6[2](v6, 0LL);
    }
  }

- (void)_updateBrowserState
{
  unsigned int v3 = (void *)[self browserToAdvNwToSFendpoints];
  id v4 = [v3 keysOfEntriesPassingTest:&stru_1008870D8];

  if (![v4 count] && !self->_browser)
  {
    id v5 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] _updateBrowserState to kBTVCBonjourBrowserStateStopped",  v6,  2u);
    }

    -[BTVCBonjourService setBrowserState:](self, "setBrowserState:", 0LL);
    if (self->_shouldRestartBrowsing)
    {
      self->_shouldRestartBrowsing = 0;
      -[BTVCBonjourService _startBrowser](self, "_startBrowser");
    }
  }
}

- (void)handleBrowseResults:(id)a3
{
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v27;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v25 = v6;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v9, "change", v25) & 2) != 0)
        {
          v15 = [v9 freshResult];
          id v11 = nw_browse_result_copy_endpoint(v15);

          if (!-[BTVCBonjourService isLocalEndpoint:](self, "isLocalEndpoint:", v11))
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvNwToSFendpoints](self, "browserToAdvNwToSFendpoints"));
            uint64_t v17 = (void *)[v16 objectForKey:v11];
            BOOL v18 = v17 == 0LL;

            v19 = (os_log_s *)qword_1008F7710;
            BOOL v20 = os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v20)
              {
                *(_DWORD *)buf = 138412546;
                __int16 v31 = v11;
                __int16 v32 = 2048;
                v33 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Found endpoint %@, (%p)",  buf,  0x16u);
              }

              v21 = [BTVCBonjourEndpoint createConnectionParameters];
              nw_connection_t v22 = nw_connection_create(v11, v21);

              v23 = (nw_endpoint *)objc_claimAutoreleasedReturnValue( -[BTVCBonjourService _handleConnection:isAdvToBrowserConnection:]( self,  "_handleConnection:isAdvToBrowserConnection:",  v22,  0LL));
              v24 = (os_log_s *)qword_1008F7710;
              if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                __int16 v31 = v22;
                __int16 v32 = 2112;
                v33 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] New Browser to Adv connection %@ (endpoint %@)",  buf,  0x16u);
              }
            }

            else if (v20)
            {
              *(_DWORD *)buf = v25;
              __int16 v31 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Ignoring duplicate endpoint %@",  buf,  0xCu);
            }
          }
        }

        else
        {
          id v10 = [v9 oldResult];
          id v11 = nw_browse_result_copy_endpoint(v10);

          if (!-[BTVCBonjourService isLocalEndpoint:](self, "isLocalEndpoint:", v11))
          {
            v12 = -[BTVCBonjourService browserToAdvNwToSFendpoints];
            uint64_t v13 = (nw_endpoint *)[v12 objectForKey:v11];

            id v14 = (os_log_s *)qword_1008F7710;
            if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v31 = v11;
              __int16 v32 = 2112;
              v33 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Removing endpoint %@ %@",  buf,  0x16u);
            }

            -[nw_endpoint cancel](v13, "cancel");
          }
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v5);
  }
}

- (id)_handleConnection:(id)a3 isAdvToBrowserConnection:(BOOL)a4
{
  BOOL v4 = a4;
  __int128 v6 = (nw_connection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6)
  {
    uint64_t v7 = 5LL;
    if (v4) {
      uint64_t v7 = 4LL;
    }
    v8 = (&self->super.isa)[v7];
    id v9 = -[BTVCBonjourEndpoint initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:]( objc_alloc(&OBJC_CLASS___BTVCBonjourEndpoint),  "initWithConnection:isAdvToBrowserConnection:localUniqueID:withQueue:",  v6,  v4,  v8,  self->_serialQueue);
    if (v9)
    {
      nw_endpoint_t v10 = nw_connection_copy_endpoint(v6);
      if (v4) {
        id v11 = -[BTVCBonjourService advToBrowserNwToSFendpoints];
      }
      else {
        id v11 = [self browserToAdvNwToSFendpoints];
      }
      [v11 setObject:v9 forKey:v10];

      location[0] = 0LL;
      objc_initWeak(location, self);
      id from = 0LL;
      objc_initWeak(&from, v9);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100203F80;
      v21[3] = &unk_100887120;
      objc_copyWeak(&v22, &from);
      objc_copyWeak(&v23, location);
      BOOL v24 = v4;
      -[BTVCBonjourEndpoint setDidConnectHandler:](v9, "setDidConnectHandler:", v21);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1002041C4;
      v18[3] = &unk_100887148;
      objc_copyWeak(&v19, location);
      objc_copyWeak(&v20, &from);
      -[BTVCBonjourEndpoint setDidDisconnectHandler:](v9, "setDidDisconnectHandler:", v18);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1002045C0;
      v15[3] = &unk_100887170;
      objc_copyWeak(&v16, location);
      objc_copyWeak(&v17, &from);
      -[BTVCBonjourEndpoint setDidReceiveDataHandler:](v9, "setDidReceiveDataHandler:", v15);
      uint64_t v13 = v9;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }

    else if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR))
    {
      sub_10065E05C();
    }
  }

  else
  {
    v12 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_10065DFE8(v4, v12);
    }
    id v9 = 0LL;
  }

  return v9;
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toEndpoint:(id)a5 completionCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v27[0] = @"BTVCBonjourServiceMessageType";
  v27[1] = @"BTVCBonjourServiceMessageValue";
  v28[0] = v11;
  v28[1] = v10;
  id v14 = [NSDictionary dictionaryWithObjects:forKeys:count:v28, v27, 2LL];
  v15 = [NSPropertyListSerialization dataWithPropertyList:v14 format:200 options:0 error:0];
  id v16 = (os_log_s *)qword_1008F7710;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[BTVCBonjourService] Sending payload %@ to endpoint %@",  buf,  0x16u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100204FBC;
    v19[3] = &unk_100887198;
    id v20 = v13;
    [v12 sendDataMessage:v15 completion:v19];
    id v17 = v20;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
    sub_10065E284();
  }
  if (v13)
  {
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    __int128 v26 = @"Unable to send message, failed to serialize payload";
    BOOL v18 = [NSDictionary dictionaryWithObjects:forKeys:count:&v26, &v25, 1LL];
    id v17 = [NSError errorWithDomain:NSOSStatusErrorDomain code:-6700LL userInfo:v18];

    (*((void (**)(id, void *))v13 + 2))(v13, v17);
LABEL_9:
  }
}

- (void)_sendMessage:(id)a3 withType:(id)a4 toDevice:(id)a5 completionCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id location = 0LL;
  objc_initWeak(&location, self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10020513C;
  v19[3] = &unk_1008871C0;
  objc_copyWeak(&v24, &location);
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(serialQueue, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)_sendAdvMessageWithData:(id)a3 isStart:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = @"BTVCBonjourServiceMessageTypeStopAdvertiseData";
  if (v6) {
    id v10 = @"BTVCBonjourServiceMessageTypeStartAdvertiseData";
  }
  id v11 = v10;
  id v12 = [self advToBrowserUuidToSFendpoints];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10020545C;
  v16[3] = &unk_100887210;
  v16[4] = self;
  id v15 = v8;
  id v17 = v15;
  id v13 = v11;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v16];

  if (v14) {
    (*((void (**)(id, id, void))v14 + 2))(v14, v15, 0LL);
  }
}

- (void)connectToDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUIDString];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002056C0;
  v7[3] = &unk_100887238;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:]( self,  "_sendMessage:withType:toDevice:completionCallback:",  &__NSDictionary0__struct,  @"BTVCBonjourServiceMessageTypeConnect",  v5,  v7);
}

- (void)disconnectFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUIDString];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10020587C;
  v7[3] = &unk_100887238;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:]( self,  "_sendMessage:withType:toDevice:completionCallback:",  &__NSDictionary0__struct,  @"BTVCBonjourServiceMessageTypeDisconnect",  v5,  v7);
}

- (BOOL)sendData:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 UUIDString];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100205AD8;
  v16[3] = &unk_100887260;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  -[BTVCBonjourService _sendMessage:withType:toDevice:completionCallback:]( self,  "_sendMessage:withType:toDevice:completionCallback:",  v12,  @"BTVCBonjourServiceMessageTypeDataPacket",  v11,  v16);

  return 1;
}

- (BOOL)isLocalEndpoint:(id)a3
{
  id v4 = (nw_endpoint *)a3;
  id v5 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  nw_endpoint_get_bonjour_service_name(v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)[self getUniqueServiceNameForAdvertiser];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (id)_endpointForUniqueID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
      sub_10065E3C0();
    }
    goto LABEL_8;
  }

  id v5 = -[BTVCBonjourService advToBrowserUuidToSFendpoints];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTVCBonjourService browserToAdvUuidToSFendpoints](self, "browserToAdvUuidToSFendpoints"));
    id v6 = [v7 objectForKeyedSubscript:v4];

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_ERROR)) {
        sub_10065E3EC();
      }
LABEL_8:
      id v6 = 0LL;
    }
  }

  return v6;
}

- (void)_cleanUp
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100205D64;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___BTVCBonjourService;
  -[BTVCBonjourService dealloc](&v2, "dealloc");
}

- (id)advertisingStateUpdateHandler
{
  return self->_advertisingStateUpdateHandler;
}

- (void)setAdvertisingStateUpdateHandler:(id)a3
{
}

- (id)discoveryStateUpdateHandler
{
  return self->_discoveryStateUpdateHandler;
}

- (void)setDiscoveryStateUpdateHandler:(id)a3
{
}

- (id)deviceDidStartScanning
{
  return self->_deviceDidStartScanning;
}

- (void)setDeviceDidStartScanning:(id)a3
{
}

- (id)deviceDidStopScanning
{
  return self->_deviceDidStopScanning;
}

- (void)setDeviceDidStopScanning:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (id)deviceDidConnectHandler
{
  return self->_deviceDidConnectHandler;
}

- (void)setDeviceDidConnectHandler:(id)a3
{
}

- (id)deviceDidDisconnectHandler
{
  return self->_deviceDidDisconnectHandler;
}

- (void)setDeviceDidDisconnectHandler:(id)a3
{
}

- (id)deviceDidReceiveDataHandler
{
  return self->_deviceDidReceiveDataHandler;
}

- (void)setDeviceDidReceiveDataHandler:(id)a3
{
}

- (OS_nw_listener)listener
{
  return (OS_nw_listener *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setListener:(id)a3
{
}

- (OS_nw_browser)browser
{
  return (OS_nw_browser *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setBrowser:(id)a3
{
}

- (OS_nw_endpoint)endpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 144LL, 1);
}

- (NSMutableSet)resultChanges
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setResultChanges:(id)a3
{
}

- (NSMutableSet)advertiserAdvs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setAdvertiserAdvs:(id)a3
{
}

- (NSMutableDictionary)advToBrowserNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setAdvToBrowserNwToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)advToBrowserUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setAdvToBrowserUuidToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)browserToAdvNwToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setBrowserToAdvNwToSFendpoints:(id)a3
{
}

- (NSMutableDictionary)browserToAdvUuidToSFendpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setBrowserToAdvUuidToSFendpoints:(id)a3
{
}

- (int)browserState
{
  return self->_browserState;
}

- (void)setBrowserState:(int)a3
{
  self->_browserState = a3;
}

- (int)advertiserState
{
  return self->_advertiserState;
}

- (void)setAdvertiserState:(int)a3
{
  self->_advertiserState = a3;
}

- (void).cxx_destruct
{
}

@end
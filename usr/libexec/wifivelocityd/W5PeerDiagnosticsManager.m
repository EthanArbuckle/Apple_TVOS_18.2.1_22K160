@interface W5PeerDiagnosticsManager
- (W5PeerDiagnosticsManager)initWithStatusManager:(id)a3;
- (id)gatherPeerDiagnostics;
- (id)gatherPeerTypes;
- (id)getDPSSummary;
- (id)getLQMSummary;
- (id)getWiFiStatus;
- (id)localDiagnostics;
- (int64_t)configureDiscoveryClientAndActivate;
- (void)beginPeerDiscovery;
- (void)dealloc;
- (void)invalidateDiscoveryClient;
- (void)registerCallbacksAndActivate;
- (void)registerRequestHandler;
- (void)requestDiagnostics:(id)a3 completionBlock:(id)a4;
@end

@implementation W5PeerDiagnosticsManager

- (W5PeerDiagnosticsManager)initWithStatusManager:(id)a3
{
  self->_discoveryClientStatus = 0LL;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsManager;
  v4 = -[W5PeerDiagnosticsManager init](&v10, "init");
  v5 = v4;
  if (!a3
    || !v4
    || (v4->_status = (W5StatusManager *)a3,
        dispatch_queue_t v6 = dispatch_queue_create("com.apple.wifid.peerdiagnosticsmanager", 0LL),
        (v5->_queue = (OS_dispatch_queue *)v6) == 0LL))
  {

    v7 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[W5PeerDiagnosticsManager initWithStatusManager:]";
      __int16 v13 = 2080;
      v14 = "W5PeerDiagnosticsManager.m";
      __int16 v15 = 1024;
      int v16 = 99;
      LODWORD(v9) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) init error!",  (const char *)&v11,  v9,  LODWORD(v10.receiver));
    }

    return 0LL;
  }

  return v5;
}

- (void)dealloc
{
  self->_cachedPeerTypesResult = 0LL;
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___W5PeerDiagnosticsManager;
  -[W5PeerDiagnosticsManager dealloc](&v4, "dealloc");
}

- (void)invalidateDiscoveryClient
{
  objc_sync_enter(self);
  self->_discoveryClientStatus = 0LL;
  objc_sync_exit(self);
  self->_discoveryClient = 0LL;
}

- (int64_t)configureDiscoveryClientAndActivate
{
  if (self->_discoveryClientStatus)
  {
    v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      __int16 v13 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
      __int16 v14 = 2080;
      __int16 v15 = "W5PeerDiagnosticsManager.m";
      __int16 v16 = 1024;
      int v17 = 131;
      LODWORD(v10) = 28;
      int64_t discoveryClientStatus = 1LL;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Failed to configure discovery client, it's already active",  (const char *)&v12,  v10,  LODWORD(block[0]));
    }

    else
    {
      int64_t discoveryClientStatus = 1LL;
    }
  }

  else
  {
    objc_sync_exit(self);
    v5 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    self->_discoveryClient = v5;
    if (v5)
    {
      -[RPCompanionLinkClient setInvalidationHandler:](v5, "setInvalidationHandler:", &stru_1000D3598);
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", &stru_1000D35B8);
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", &stru_1000D35D8);
      -[RPCompanionLinkClient setDispatchQueue:](self->_discoveryClient, "setDispatchQueue:", self->_queue);
      -[RPCompanionLinkClient setControlFlags:]( self->_discoveryClient,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](self->_discoveryClient, "controlFlags") | 0x109102);
      objc_sync_enter(self);
      self->_int64_t discoveryClientStatus = 2LL;
      objc_sync_exit(self);
      dispatch_queue_t v6 = dispatch_semaphore_create(0LL);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10008F128;
      block[3] = &unk_1000D1BA8;
      block[4] = self;
      block[5] = v6;
      dispatch_async(queue, block);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
      v8 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        __int16 v13 = "-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]";
        __int16 v14 = 2080;
        __int16 v15 = "W5PeerDiagnosticsManager.m";
        __int16 v16 = 1024;
        int v17 = 173;
        LODWORD(v10) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) discovery client activated successfully",  (const char *)&v12,  v10,  LODWORD(block[0]));
      }
    }

    objc_sync_enter(self);
    int64_t discoveryClientStatus = self->_discoveryClientStatus;
  }

  objc_sync_exit(self);
  return discoveryClientStatus;
}

- (id)gatherPeerTypes
{
  cachedPeerTypesResult = self->_cachedPeerTypesResult;
  objc_sync_exit(self);
  return cachedPeerTypesResult;
}

- (void)beginPeerDiscovery
{
  if (_os_feature_enabled_impl("WiFiVelocity", "PeerTypes"))
  {
    if ((id)-[W5PeerDiagnosticsManager configureDiscoveryClientAndActivate]( self,  "configureDiscoveryClientAndActivate") == (id)2)
    {
      v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
      dispatch_time_t v4 = dispatch_time(0LL, 10000000000LL);
      dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472LL;
      v5[2] = sub_10008F3C8;
      v5[3] = &unk_1000D1BA8;
      v5[4] = v3;
      v5[5] = self;
      dispatch_source_set_event_handler(v3, v5);
      dispatch_activate(v3);
    }
  }

- (void)registerCallbacksAndActivate
{
  v3 = dispatch_semaphore_create(0LL);
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008F9FC;
  v5[3] = &unk_1000D1BA8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(queue, v5);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

- (void)registerRequestHandler
{
  discoveryClient = self->_discoveryClient;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10008FBCC;
  v3[3] = &unk_1000D3650;
  v3[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:]( discoveryClient,  "registerRequestID:options:handler:",  @"com.apple.proximity.peerdiagnosticslink",  0LL,  v3);
}

- (id)getWiFiStatus
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = -[W5StatusManager wifiStatus](self->_status, "wifiStatus");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 rssi]),  @"RSSI");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [v4 macAddress],  @"MAC");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [v4 ssidString],  @"SSID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  [v4 bssid],  @"BSSID");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  W5DescriptionForChannel([v4 channel]),  @"Channel");
  return v3;
}

- (id)getLQMSummary
{
  if (objc_msgSend( -[CWFInterface LQMSummary](-[W5StatusManager corewifi](self->_status, "corewifi"), "LQMSummary"),  "bytes"))
  {
    return (id)CWFDebugDescriptionForLQMSummary();
  }

  v3 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    dispatch_queue_t v6 = "-[W5PeerDiagnosticsManager getLQMSummary]";
    __int16 v7 = 2080;
    v8 = "W5PeerDiagnosticsManager.m";
    __int16 v9 = 1024;
    int v10 = 320;
    int v4 = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Failed to obtain LQM Summary",  (const char *)&v5,  v4);
  }

  return 0LL;
}

- (id)getDPSSummary
{
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  v24 = sub_100090108;
  v25 = sub_100090118;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  if (sub_100090124())
  {
    v3 = dispatch_semaphore_create(0LL);
    __int16 v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    int v11 = sub_1000901E4;
    int v12 = &unk_1000D3678;
    __int16 v13 = v3;
    __int16 v14 = self;
    __int16 v15 = &v17;
    __int16 v16 = &v21;
    objc_msgSend( objc_msgSend((id)sub_100090124(), "sharedClientWithIdentifier:", @"wifivelocityd"),  "getDpsStatsandReply:",  &v9);
    dispatch_time_t v4 = dispatch_time(0LL, 2000000000LL);
    if (dispatch_semaphore_wait(v3, v4))
    {
      objc_sync_enter(self);
      *((_BYTE *)v18 + 24) = 1;
      objc_sync_exit(self);
      int v5 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315906;
        v28 = "-[W5PeerDiagnosticsManager getDPSSummary]";
        __int16 v29 = 2080;
        v30 = "W5PeerDiagnosticsManager.m";
        __int16 v31 = 1024;
        int v32 = 354;
        __int16 v33 = 1024;
        int v34 = 2;
        LODWORD(v8) = 34;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v5,  0LL,  "[wifivelocity] %s (%s:%u) %d sec timeout waiting for summarized logs from wifianalyticsd",  (const char *)&v27,  v8,  (_DWORD)v9,  v10);
      }
    }

    dispatch_release(v3);
  }

  id v6 = (id)v22[5];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v6;
}

- (id)localDiagnostics
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(-[RPCompanionLinkClient localDevice](self->_discoveryClient, "localDevice"), "model"),  @"DeviceModel");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  -[W5PeerDiagnosticsManager getWiFiStatus](self, "getWiFiStatus"),  @"WiFiStatus");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  -[W5PeerDiagnosticsManager getDPSSummary](self, "getDPSSummary"),  @"DPSSummary");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  -[W5PeerDiagnosticsManager getLQMSummary](self, "getLQMSummary"),  @"LQMSummary");
  return v3;
}

- (void)requestDiagnostics:(id)a3 completionBlock:(id)a4
{
  id v6 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    int v12 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]";
    __int16 v13 = 2080;
    __int16 v14 = "W5PeerDiagnosticsManager.m";
    __int16 v15 = 1024;
    int v16 = 376;
    __int16 v17 = 2114;
    id v18 = a3;
    int v8 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) sending peerdiagnostic request to %{public}@ ",  &v11,  v8);
  }

  __int16 v7 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
  -[RPCompanionLinkClient setControlFlags:]( v7,  "setControlFlags:",  (unint64_t)-[RPCompanionLinkClient controlFlags](v7, "controlFlags") | 0x8102);
  -[RPCompanionLinkClient setDestinationDevice:](v7, "setDestinationDevice:", a3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100090594;
  v10[3] = &unk_1000D1BF8;
  v10[4] = a3;
  -[RPCompanionLinkClient setInvalidationHandler:](v7, "setInvalidationHandler:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100090680;
  v9[3] = &unk_1000D1D48;
  v9[4] = v7;
  v9[5] = a4;
  -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v9);
}

- (id)gatherPeerDiagnostics
{
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v32 = 0LL;
  __int16 v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  uint64_t v35 = 0LL;
  if (objc_msgSend(-[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices"), "count"))
  {
    v3 = dispatch_group_create();
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v4 = -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    id v5 = [v4 countByEnumeratingWithState:&v28 objects:v48 count:16];
    uint64_t v7 = 0LL;
    if (v5)
    {
      uint64_t v8 = *(void *)v29;
      *(void *)&__int128 v6 = 136315906LL;
      __int128 v24 = v6;
      do
      {
        __int16 v9 = 0LL;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v9);
          if (![v10 model]
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", @"iPhone") & 1) != 0
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", @"iPad") & 1) != 0
            || (objc_msgSend(objc_msgSend(v10, "model"), "containsString:", @"Mac") & 1) != 0)
          {
            dispatch_group_enter(v3);
            ++v7;
            queue = (dispatch_queue_s *)self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100090D9C;
            block[3] = &unk_1000D36F0;
            block[4] = self;
            block[5] = v10;
            block[7] = v3;
            block[8] = &v32;
            void block[6] = v25;
            dispatch_async(queue, block);
          }

          else
          {
            int v12 = (os_log_s *)sub_10008C90C();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              int v36 = v24;
              v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
              __int16 v38 = 2080;
              v39 = "W5PeerDiagnosticsManager.m";
              __int16 v40 = 1024;
              int v41 = 438;
              __int16 v42 = 2114;
              id v43 = v10;
              LODWORD(v23) = 38;
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) skipping device %{public}@",  &v36,  v23);
            }
          }

          __int16 v9 = (char *)v9 + 1;
        }

        while (v5 != v9);
        id v13 = [v4 countByEnumeratingWithState:&v28 objects:v48 count:16];
        id v5 = v13;
      }

      while (v13);
    }

    dispatch_group_enter(v3);
    __int16 v14 = (dispatch_queue_s *)self->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100091010;
    v26[3] = &unk_1000D1858;
    v26[4] = self;
    v26[5] = v25;
    v26[6] = v3;
    dispatch_async(v14, v26);
    dispatch_time_t v15 = dispatch_time(0LL, 5000000000LL);
    if (dispatch_group_wait(v3, v15))
    {
      int v16 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315906;
        v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
        __int16 v38 = 2080;
        v39 = "W5PeerDiagnosticsManager.m";
        __int16 v40 = 1024;
        int v41 = 477;
        __int16 v42 = 1024;
        LODWORD(v43) = 5;
        LODWORD(v23) = 34;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) %d sec timeout waiting for diagnosctic logs from peers",  (const char *)&v36,  v23,  (_DWORD)v24,  DWORD2(v24));
      }
    }

    if (v3) {
      dispatch_release(v3);
    }
    __int16 v17 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_msgSend(-[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices"), "count");
      uint64_t v19 = v33[3];
      int v36 = 136316418;
      v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
      __int16 v38 = 2080;
      v39 = "W5PeerDiagnosticsManager.m";
      __int16 v40 = 1024;
      int v41 = 482;
      __int16 v42 = 2048;
      id v43 = v18;
      __int16 v44 = 2048;
      uint64_t v45 = v7;
      __int16 v46 = 2048;
      uint64_t v47 = v19;
      LODWORD(v23) = 58;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) active peers %lu, requested peers %lu, responses %lu",  &v36,  v23);
    }
  }

  else
  {
    v22 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136315650;
      v37 = "-[W5PeerDiagnosticsManager gatherPeerDiagnostics]";
      __int16 v38 = 2080;
      v39 = "W5PeerDiagnosticsManager.m";
      __int16 v40 = 1024;
      int v41 = 428;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) No active clients, returning",  &v36,  28);
    }
  }

  objc_sync_enter(self);
  id v20 = -[NSMutableArray copy](v25, "copy");
  objc_sync_exit(self);
  _Block_object_dispose(&v32, 8);
  return v20;
}

@end
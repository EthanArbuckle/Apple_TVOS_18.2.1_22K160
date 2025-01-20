@interface MRDNowPlayingStateMonitor
- (MRDNowPlayingStateMonitor)initWithDelegate:(id)a3;
- (MRDNowPlayingStateMonitorDelegate)delegate;
- (MRNowPlayingController)aseNowPlayingController;
- (MRNowPlayingController)localNowPlayingController;
- (NSMutableDictionary)lastPlaybackStates;
- (NSString)nowPlayingApp;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (unsigned)onQueue_lastPlaybackStateForEndpoint:(id)a3;
- (void)_configureNowPlayingController:(id)a3;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)onQueue_controller:(id)a3 didLoadResponse:(id)a4 retry:(BOOL)a5;
- (void)onQueue_setLastPlaybackState:(unsigned int)a3 bundleIdentifier:(id)a4 forEndpoint:(id)a5;
- (void)setAseNowPlayingController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLastPlaybackStates:(id)a3;
- (void)setLocalNowPlayingController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setup;
@end

@implementation MRDNowPlayingStateMonitor

- (MRDNowPlayingStateMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDNowPlayingStateMonitor;
  v5 = -[MRDNowPlayingStateMonitor init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingController userSelectedEndpointController]( &OBJC_CLASS___MRNowPlayingController,  "userSelectedEndpointController"));
    -[MRDNowPlayingStateMonitor setAseNowPlayingController:](v5, "setAseNowPlayingController:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingController localRouteController]( &OBJC_CLASS___MRNowPlayingController,  "localRouteController"));
    -[MRDNowPlayingStateMonitor setLocalNowPlayingController:](v5, "setLocalNowPlayingController:", v7);

    -[MRDNowPlayingStateMonitor setDelegate:](v5, "setDelegate:", v4);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremote.NowPlayingStateMonitor", v9);
    -[MRDNowPlayingStateMonitor setQueue:](v5, "setQueue:", v10);

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mediaremote.NowPlayingStateMonitor.delegateQueue", v12);
    -[MRDNowPlayingStateMonitor setDelegateQueue:](v5, "setDelegateQueue:", v13);

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MRDNowPlayingStateMonitor setLastPlaybackStates:](v5, "setLastPlaybackStates:", v14);

    -[MRDNowPlayingStateMonitor setup](v5, "setup");
  }

  return v5;
}

- (void)setup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor aseNowPlayingController](self, "aseNowPlayingController"));
  -[MRDNowPlayingStateMonitor _configureNowPlayingController:](self, "_configureNowPlayingController:", v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor localNowPlayingController](self, "localNowPlayingController"));
  -[MRDNowPlayingStateMonitor _configureNowPlayingController:](self, "_configureNowPlayingController:", v4);
}

- (void)_configureNowPlayingController:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  [v4 setRequestPlaybackState:1];

  v5 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  [v5 setRequestClientProperties:1];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  [v6 setRequestPlaybackQueue:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  [v7 setRequestSupportedCommands:0];

  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 configuration]);
  [v8 setRequestLastPlayingDate:0];

  [v9 setDelegate:self];
  [v9 beginLoadingUpdates];
}

- (unsigned)onQueue_lastPlaybackStateForEndpoint:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor lastPlaybackStates](self, "lastPlaybackStates"));
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);
  }

  else
  {
    id v9 = 0LL;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
    unsigned int v11 = [v9 unsignedIntValue];
  }
  else {
    unsigned int v11 = 0;
  }

  return v11;
}

- (void)onQueue_setLastPlaybackState:(unsigned int)a3 bundleIdentifier:(id)a4 forEndpoint:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = (MRDNowPlayingStateMonitor *)a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor uniqueIdentifier](v9, "uniqueIdentifier"));

  if (v10)
  {
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
    dispatch_assert_queue_V2(v12);

    uint64_t v13 = -[MRDNowPlayingStateMonitor onQueue_lastPlaybackStateForEndpoint:]( self,  "onQueue_lastPlaybackStateForEndpoint:",  v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor lastPlaybackStates](self, "lastPlaybackStates"));
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor uniqueIdentifier](v9, "uniqueIdentifier"));
    [v15 setObject:v14 forKeyedSubscript:v16];

    if ((_DWORD)v13 != (_DWORD)v6)
    {
      uint64_t v18 = _MRLogForCategory(13LL, v17);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription(v13);
        v21 = (void *)MRMediaRemoteCopyPlaybackStateDescription(v6);
        *(_DWORD *)buf = 138412802;
        v45 = v9;
        __int16 v46 = 2112;
        v47 = v20;
        __int16 v48 = 2112;
        v49 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM updated stored playback state for %@ from %@ to %@",  buf,  0x20u);
      }
    }

    if ((v6 - 2) >= 2)
    {
      if ((_DWORD)v6 == 1)
      {
        BOOL v22 = 1;
        uint64_t v23 = 1LL;
      }

      else
      {
        BOOL v22 = 0;
        uint64_t v23 = 0LL;
      }
    }

    else
    {
      BOOL v22 = v13 == 1;
      uint64_t v23 = 2LL * ((_DWORD)v13 == 1);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue( +[MRSystemMediaBundles systemMediaBundleIDForBundleID:type:]( &OBJC_CLASS___MRSystemMediaBundles,  "systemMediaBundleIDForBundleID:type:",  v8,  1LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRIRRoute routeWithEndpoint:](&OBJC_CLASS___MRIRRoute, "routeWithEndpoint:", v9));
    uint64_t v29 = _MRLogForCategory(13LL, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v13 == (_DWORD)v6 || !v22)
    {
      if (v31)
      {
        v37 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription(v13);
        v38 = (void *)MRMediaRemoteCopyPlaybackStateDescription(v6);
        *(_DWORD *)buf = 138413058;
        v45 = v9;
        __int16 v46 = 2112;
        v47 = v37;
        __int16 v48 = 2112;
        v49 = v38;
        __int16 v50 = 2112;
        id v51 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM Not publishing event, endpoint: %@, storedPreviousState: %@, currentState: %@, bundleIdentifier: %@",  buf,  0x2Au);
      }
    }

    else
    {
      if (v31)
      {
        v32 = (MRDNowPlayingStateMonitor *)MRMediaRemoteCopyPlaybackStateDescription(v13);
        v33 = (void *)MRMediaRemoteCopyPlaybackStateDescription(v6);
        *(_DWORD *)buf = 138413570;
        v45 = v9;
        __int16 v46 = 2112;
        v47 = v32;
        __int16 v48 = 2112;
        v49 = v33;
        __int16 v50 = 2112;
        id v51 = v25;
        __int16 v52 = 2112;
        id v53 = v8;
        __int16 v54 = 2048;
        uint64_t v55 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM Publishing event, endpoint: %@, storedPreviousState: %@, currentState: %@, bundleIdentifier: %@(was %@), event: %ld",  buf,  0x3Eu);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor delegate](self, "delegate"));
      char v35 = objc_opt_respondsToSelector(v34, "route:endpoint:bundleIdentifier:emittedEvent:");

      if ((v35 & 1) != 0)
      {
        v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor delegateQueue](self, "delegateQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100139CC8;
        block[3] = &unk_1003A1768;
        block[4] = self;
        id v40 = v27;
        v41 = v9;
        id v42 = v25;
        uint64_t v43 = v23;
        dispatch_async(v36, block);
      }
    }
  }

  else
  {
    uint64_t v24 = _MRLogForCategory(13LL, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor uniqueIdentifier](v9, "uniqueIdentifier"));
      *(_DWORD *)buf = 138412802;
      v45 = self;
      __int16 v46 = 2112;
      v47 = v9;
      __int16 v48 = 2112;
      v49 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM %@ - endpoint ID is nil, ignoring - %@ (%@)",  buf,  0x20u);
    }
  }
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = _MRLogForCategory(13LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM controller: %@ didFailWithError: %@",  (uint8_t *)&v10,  0x16u);
  }
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(13LL, v8);
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM controller: %@ didLoadResponse: %@",  buf,  0x16u);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100139F24;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);
}

- (void)onQueue_controller:(id)a3 didLoadResponse:(id)a4 retry:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 destination]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 endpoint]);
  if (v12)
  {
    id v13 = (MRDNowPlayingStateMonitor *)v12;

LABEL_4:
    uint64_t v16 = -[MRDNowPlayingStateMonitor onQueue_lastPlaybackStateForEndpoint:]( self,  "onQueue_lastPlaybackStateForEndpoint:",  v13);
    id v17 = [v9 playbackState];
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 destination]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 client]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 representedBundleID]);

    if ((_DWORD)v16 != (_DWORD)v17)
    {
      uint64_t v22 = _MRLogForCategory(13LL, v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = (void *)MRMediaRemoteCopyPlaybackStateDescription(v16);
        v25 = (void *)MRMediaRemoteCopyPlaybackStateDescription(v17);
        *(_DWORD *)buf = 138412802;
        v36 = v13;
        __int16 v37 = 2112;
        id v38 = v24;
        __int16 v39 = 2112;
        id v40 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM updating stored playback state for %@ from %@ to %@",  buf,  0x20u);
      }

      -[MRDNowPlayingStateMonitor onQueue_setLastPlaybackState:bundleIdentifier:forEndpoint:]( self,  "onQueue_setLastPlaybackState:bundleIdentifier:forEndpoint:",  v17,  v20,  v13);
    }

LABEL_9:
    goto LABEL_10;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v8 destination]);
  id v13 = (MRDNowPlayingStateMonitor *)objc_claimAutoreleasedReturnValue([v14 endpoint]);

  if (v13) {
    goto LABEL_4;
  }
  uint64_t v26 = _MRLogForCategory(13LL, v15);
  id v13 = (MRDNowPlayingStateMonitor *)objc_claimAutoreleasedReturnValue(v26);
  BOOL v27 = os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v27)
    {
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue([v8 destination]);
      *(_DWORD *)buf = 138413058;
      v36 = self;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v31;
      __int16 v41 = 2112;
      id v42 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM %@ - endpoint is nil, ignoring - %@ (%@), response: %@",  buf,  0x2Au);
    }

    goto LABEL_9;
  }

  if (v27)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 destination]);
    *(_DWORD *)buf = 138413058;
    v36 = self;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v28;
    __int16 v41 = 2112;
    id v42 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM %@ - endpoint is nil, will retry in 3 seconds - %@ (%@), response: %@",  buf,  0x2Au);
  }

  dispatch_time_t v29 = dispatch_time(0LL, 3000000000LL);
  v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A2A8;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v33 = v8;
  id v34 = v9;
  dispatch_after(v29, v30, block);

LABEL_10:
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  id v8 = a3;
  uint64_t v10 = _MRLogForCategory(13LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 1024;
    unsigned int v23 = a4;
    __int16 v24 = 1024;
    unsigned int v25 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[MRDRRC].NPM controller: %p %@ playbackStateDidChangeFrom: %d to: %d",  buf,  0x22u);
  }

  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013A4F0;
  block[3] = &unk_10039A9B8;
  id v15 = v8;
  uint64_t v16 = self;
  unsigned int v17 = a5;
  id v13 = v8;
  dispatch_async(v12, block);
}

- (NSString)nowPlayingApp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingStateMonitor aseNowPlayingController](self, "aseNowPlayingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 response]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 playerPath]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedBundleID]);

  return (NSString *)v6;
}

- (MRNowPlayingController)aseNowPlayingController
{
  return self->_aseNowPlayingController;
}

- (void)setAseNowPlayingController:(id)a3
{
}

- (MRNowPlayingController)localNowPlayingController
{
  return self->_localNowPlayingController;
}

- (void)setLocalNowPlayingController:(id)a3
{
}

- (MRDNowPlayingStateMonitorDelegate)delegate
{
  return (MRDNowPlayingStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSMutableDictionary)lastPlaybackStates
{
  return self->_lastPlaybackStates;
}

- (void)setLastPlaybackStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
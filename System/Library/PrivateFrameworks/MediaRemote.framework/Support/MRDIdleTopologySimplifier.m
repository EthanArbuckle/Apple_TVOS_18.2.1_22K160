@interface MRDIdleTopologySimplifier
- (BOOL)isMultiplayerHost;
- (MRDIdleTopologySimplifier)init;
- (NSMutableDictionary)playbackTimers;
- (double)recentlyPlayingInterval;
- (double)timeSincePlayingForPlayerPath:(id)a3;
- (id)lastPlayingDateForPlayerPath:(id)a3;
- (id)localDeviceUID;
- (unsigned)playbackStateForPlayerPath:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_initialize;
- (void)_onQueue_adjustPlaybackTimerIfNeededForPlayerPath:(id)a3;
- (void)_onQueue_simplifyToplogyOfPlayerPathIfNeeded:(id)a3;
- (void)dealloc;
- (void)registerForChanges;
- (void)setPlaybackTimers:(id)a3;
- (void)unregisterForChanges;
@end

@implementation MRDIdleTopologySimplifier

- (MRDIdleTopologySimplifier)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MRDIdleTopologySimplifier;
  v2 = -[MRDIdleTopologySimplifier init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    playbackTimers = v3->_playbackTimers;
    v3->_playbackTimers = (NSMutableDictionary *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v12 mediaRecentlyPlayedInterval];
    v3->_recentlyPlayingInterval = v13;

    -[MRDIdleTopologySimplifier _initialize](v3, "_initialize");
  }

  return v3;
}

- (void)_initialize
{
  uint64_t v3 = _MRLogForCategory(2LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    dispatch_queue_attr_t v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDITS] <%p> Initializing",  (uint8_t *)&v5,  0xCu);
  }

  -[MRDIdleTopologySimplifier registerForChanges](self, "registerForChanges");
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(2LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDITS] <%p> Deallocating.", buf, 0xCu);
  }

  -[MRDIdleTopologySimplifier unregisterForChanges](self, "unregisterForChanges");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDIdleTopologySimplifier;
  -[MRDIdleTopologySimplifier dealloc](&v5, "dealloc");
}

- (unsigned)playbackStateForPlayerPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 queryExistingPlayerPath:v3]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playerClient]);
  unsigned int v8 = [v7 playbackState];

  return v8;
}

- (id)lastPlayingDateForPlayerPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 queryExistingPlayerPath:v3]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playerClient]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPlayingDate]);

  return v8;
}

- (double)timeSincePlayingForPlayerPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 queryExistingPlayerPath:v3]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playerClient]);
  [v7 timeSincePlaying];
  double v9 = v8;

  return v9;
}

- (id)localDeviceUID
{
  return (id)MRMediaRemoteCopyDeviceUID(self, a2);
}

- (BOOL)isMultiplayerHost
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v3 = [v2 supportMultiplayerHost];

  return v3;
}

- (void)registerForChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];
}

- (void)unregisterForChanges
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F7524;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)_onQueue_adjustPlaybackTimerIfNeededForPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v5 = -[MRDIdleTopologySimplifier playbackStateForPlayerPath:](self, "playbackStateForPlayerPath:", v4);
  -[MRDIdleTopologySimplifier timeSincePlayingForPlayerPath:](self, "timeSincePlayingForPlayerPath:", v4);
  double v7 = v6;
  BOOL v8 = v5 == 1;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIdleTopologySimplifier playbackTimers](self, "playbackTimers"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v4]);

  if (v8)
  {
    if (v10)
    {
      uint64_t v12 = _MRLogForCategory(2LL, v11);
      double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1002B8F0C();
      }

      [v10 invalidate];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIdleTopologySimplifier playbackTimers](self, "playbackTimers"));
      [v14 setObject:0 forKeyedSubscript:v4];
LABEL_17:
    }
  }

  else if (!v10)
  {
    -[MRDIdleTopologySimplifier recentlyPlayingInterval](self, "recentlyPlayingInterval");
    double v16 = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIdleTopologySimplifier lastPlayingDateForPlayerPath:]( self,  "lastPlayingDateForPlayerPath:",  v4));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    unsigned int v18 = [v14 isEqualToDate:v17];

    if (v18)
    {
      uint64_t v20 = _MRLogForCategory(2LL, v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1002B8F6C();
      }

      -[MRDIdleTopologySimplifier recentlyPlayingInterval](self, "recentlyPlayingInterval");
      double v23 = v22;
    }

    else
    {
      double v23 = v16 - v7;
    }

    if (v23 <= 0.0)
    {
      -[MRDIdleTopologySimplifier _onQueue_simplifyToplogyOfPlayerPathIfNeeded:]( self,  "_onQueue_simplifyToplogyOfPlayerPathIfNeeded:",  v4);
    }

    else
    {
      uint64_t v24 = _MRLogForCategory(2LL, v19);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      double v26 = v23 + 2.0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 134218498;
        *(void *)&location[4] = self;
        __int16 v38 = 2048;
        double v39 = v26;
        __int16 v40 = 2112;
        id v41 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "[MRDITS] <%p> Scheduling idle playback timer for %.2lf seconds - %@",  location,  0x20u);
      }

      objc_initWeak((id *)location, self);
      serialQueue = self->_serialQueue;
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      v33 = sub_1000F78F0;
      v34 = &unk_10039B590;
      objc_copyWeak(&v36, (id *)location);
      id v28 = v4;
      id v35 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:queue:block:",  0LL,  serialQueue,  &v31,  v26));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIdleTopologySimplifier playbackTimers](self, "playbackTimers", v31, v32, v33, v34));
      [v30 setObject:v29 forKeyedSubscript:v28];

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)location);
    }

    goto LABEL_17;
  }
}

- (void)_onQueue_simplifyToplogyOfPlayerPathIfNeeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (-[MRDIdleTopologySimplifier isMultiplayerHost](self, "isMultiplayerHost"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
    unsigned int v6 = [v5 isLocallyHosted];

    if (v6)
    {
      if (-[MRDIdleTopologySimplifier playbackStateForPlayerPath:](self, "playbackStateForPlayerPath:", v4) == 1)
      {
        uint64_t v8 = _MRLogForCategory(2LL, v7);
        double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_1002B8FCC();
        }
      }

      else
      {
        double v9 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
        uint64_t v10 = self->_serialQueue;
        uint64_t v11 = (objc_class *)objc_opt_class(self);
        uint64_t v12 = NSStringFromClass(v11);
        double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1000F7AE0;
        v21[3] = &qword_10039CB30;
        id v22 = v4;
        serialQueue = self->_serialQueue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1000F7B40;
        v17[3] = &unk_1003A0888;
        v17[4] = self;
        id v18 = v22;
        id v19 = v13;
        uint64_t v20 = v10;
        double v15 = v10;
        id v16 = v13;
        -[os_log_s searchEndpointsWithPredicate:timeout:reason:queue:completion:]( v9,  "searchEndpointsWithPredicate:timeout:reason:queue:completion:",  v21,  v16,  serialQueue,  v17,  7.0);
      }
    }
  }
}

- (NSMutableDictionary)playbackTimers
{
  return self->_playbackTimers;
}

- (void)setPlaybackTimers:(id)a3
{
}

- (double)recentlyPlayingInterval
{
  return self->_recentlyPlayingInterval;
}

- (void).cxx_destruct
{
}

@end
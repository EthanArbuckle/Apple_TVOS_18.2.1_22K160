@interface MRDNowPlayingStateObserver
- (BOOL)_shouldNotifyChange:(id)a3;
- (BOOL)wantsCoalescedStateChanged;
- (MRDNowPlayingServer)npServer;
- (MRDNowPlayingStateObserver)init;
- (MRDNowPlayingStateObserverDelegate)delegate;
- (NSMutableDictionary)coalescingStates;
- (id)_onQueue_stateForPlayerPath:(id)a3;
- (id)debugDescription;
- (void)_addNowPlayingNotification:(id)a3 selector:(SEL)a4;
- (void)_handleApplicationClientStateChanged:(id)a3;
- (void)_handleContentItemArtworkChanged:(id)a3;
- (void)_handleContentItemsChanged:(id)a3;
- (void)_handleDefaultSupportedCommandsChanged:(id)a3;
- (void)_handleNowPlayingClientDidChange:(id)a3;
- (void)_handleNowPlayingPlaybackStateChanged:(id)a3;
- (void)_handleNowPlayingPlayerDidChange:(id)a3;
- (void)_handlePlaybackQueueCapabilitiesChanged:(id)a3;
- (void)_handlePlaybackQueueChanged:(id)a3;
- (void)_handlePlayerStateChanged:(id)a3;
- (void)_handleRemoveClient:(id)a3;
- (void)_handleRemovePlayer:(id)a3;
- (void)_handleSupportedCommandsDidChange:(id)a3;
- (void)_handleVolumeAvailabilityDidChangeNotification:(id)a3;
- (void)_onQueue_notifyCoalescedPlayerPath:(id)a3;
- (void)_onQueue_setReceiveNowPlayingUpdates:(BOOL)a3;
- (void)_onQueue_setReceiveVolumeControlUpdates:(BOOL)a3;
- (void)_removeNowPlayingNotifications;
- (void)_setReceiveUpdates:(BOOL)a3 forSource:(int64_t)a4;
- (void)beginReceivingUpdatesForSource:(int64_t)a3;
- (void)dealloc;
- (void)setCoalescingStates:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopReceivingUpdatesForSource:(int64_t)a3;
@end

@implementation MRDNowPlayingStateObserver

- (MRDNowPlayingStateObserver)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MRDNowPlayingStateObserver;
  v2 = -[MRDNowPlayingStateObserver init](&v18, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    observedNowPlayingNotifications = v3->_observedNowPlayingNotifications;
    v3->_observedNowPlayingNotifications = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 nowPlayingServer]);
    npServer = v3->_npServer;
    v3->_npServer = (MRDNowPlayingServer *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    coalescingStates = v3->_coalescingStates;
    v3->_coalescingStates = v15;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDNowPlayingStateObserver;
  -[MRDNowPlayingStateObserver dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1000A4068;
  v10 = sub_1000A4078;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000A4080;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)beginReceivingUpdatesForSource:(int64_t)a3
{
}

- (void)stopReceivingUpdatesForSource:(int64_t)a3
{
}

- (BOOL)_shouldNotifyChange:(id)a3
{
  return 1;
}

- (void)_handleNowPlayingClientDidChange:(id)a3
{
  id v8 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [WeakRetained stateObserver:self didReceiveNowPlayingClientChange:v7];
  }
}

- (void)_handleNowPlayingPlayerDidChange:(id)a3
{
  id v8 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [WeakRetained stateObserver:self didReceiveNowPlayingPlayerChange:v7];
  }
}

- (void)_handleApplicationClientStateChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queryExistingPlayerPath:v7]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]);

    if (v11)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A4398;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v14 = v7;
      id v15 = v10;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handleRemoveClient:(id)a3
{
  id v8 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained stateObserver:self didReceiveClientDidUnregister:v6];
  }
}

- (void)_handleVolumeAvailabilityDidChangeNotification:(id)a3
{
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", a3))
  {
    id v4 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    id v11 = -[MRPlayerPath initWithOrigin:client:player:](v4, "initWithOrigin:client:player:", v5, 0LL, 0LL);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 nowPlayingServer]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 queryExistingPlayerPath:v11]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
    objc_msgSend( WeakRetained,  "stateObserver:didReceiveVolumeControlCapabilitiesChange:playerPath:",  self,  objc_msgSend(v10, "volumeControlCapabilities"),  v11);
  }

- (void)_handleDefaultSupportedCommandsChanged:(id)a3
{
  id v15 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 userInfo]);
    uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 originClientForOrigin:v9]);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 client]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 defaultSupportedCommandsForClient:v13]);
    [WeakRetained stateObserver:self didReceiveDefaultSupportedCommandsChange:v14 playerPath:v6];
  }
}

- (void)_handleSupportedCommandsDidChange:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A47C8;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v12 = v7;
      id v13 = v8;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handleNowPlayingPlaybackStateChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A492C;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v12 = v7;
      id v13 = v8;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handlePlaybackQueueChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A4AE4;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v12 = v7;
      id v13 = v8;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handlePlaybackQueueCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A4C48;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v12 = v7;
      id v13 = v8;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handleContentItemsChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v11 = MRGetContentItemsFromUserInfo(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A4DC8;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v16 = v7;
      id v17 = v12;
      id v14 = v12;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handleContentItemArtworkChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v11 = MRGetContentItemsFromUserInfo(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A4F30;
      block[3] = &unk_100398F40;
      block[4] = self;
      id v16 = v7;
      id v17 = v12;
      id v14 = v12;
      dispatch_async(queue, block);
    }
  }
}

- (void)_handlePlayerStateChanged:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000A5064;
      v11[3] = &unk_100398E60;
      v11[4] = self;
      id v12 = v7;
      dispatch_async(queue, v11);
    }
  }
}

- (void)_handleRemovePlayer:(id)a3
{
  id v4 = a3;
  if (-[MRDNowPlayingStateObserver _shouldNotifyChange:](self, "_shouldNotifyChange:", v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self->_npServer, "queryExistingPlayerPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClient]);

    if (v9)
    {
      queue = (dispatch_queue_s *)self->_queue;
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472LL;
      id v15 = sub_1000A51C8;
      id v16 = &unk_100398E60;
      id v17 = self;
      id v11 = v7;
      id v18 = v11;
      dispatch_async(queue, &v13);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "stateObserver:didReceivePlayerDidUnregister:", self, v11, v13, v14, v15, v16, v17);
    }
  }
}

- (void)_setReceiveUpdates:(BOOL)a3 forSource:(int64_t)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A5234;
  block[3] = &unk_10039E6A8;
  block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_sync(queue, block);
}

- (void)_onQueue_setReceiveNowPlayingUpdates:(BOOL)a3
{
  unsigned int registeredForNowPlayingCount = self->_registeredForNowPlayingCount;
  if (a3)
  {
    self->_unsigned int registeredForNowPlayingCount = registeredForNowPlayingCount + 1;
    if (!registeredForNowPlayingCount)
    {
      uint64_t v5 = _MRLogForCategory(1LL, a2);
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Registering for Now Playing Updates",  buf,  2u);
      }

      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification,  "_handleNowPlayingClientDidChange:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemoteActivePlayerDidChange,  "_handleNowPlayingPlayerDidChange:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemotePlayerSupportedCommandsDidChangeNotification,  "_handleSupportedCommandsDidChange:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemotePlayerPlaybackStateDidChangeNotification,  "_handleNowPlayingPlaybackStateChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRPlayerPlaybackQueueChangedNotification,  "_handlePlaybackQueueChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRPlaybackQueueCapabilitiesChangedNotification,  "_handlePlaybackQueueCapabilitiesChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRPlayerPlaybackQueueContentItemsChangedNotification,  "_handleContentItemsChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRPlayerPlaybackQueueContentItemArtworkChangedNotification,  "_handleContentItemArtworkChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemoteApplicationClientStateDidChange,  "_handleApplicationClientStateChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemotePlayerStateDidChange,  "_handlePlayerStateChanged:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemoteNowPlayingApplicationDidUnregister,  "_handleRemoveClient:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  kMRMediaRemoteNowPlayingPlayerDidUnregister,  "_handleRemovePlayer:");
      -[MRDNowPlayingStateObserver _addNowPlayingNotification:selector:]( self,  "_addNowPlayingNotification:selector:",  _MRMediaRemoteDefaultSupportedCommandsDidChangeNotification,  "_handleDefaultSupportedCommandsChanged:");
    }
  }

  else
  {
    BOOL v7 = registeredForNowPlayingCount != 0;
    unsigned int v9 = registeredForNowPlayingCount - 1;
    BOOL v8 = v9 != 0 && v7;
    if (!v7) {
      unsigned int v9 = 0;
    }
    self->_unsigned int registeredForNowPlayingCount = v9;
    if (!v8)
    {
      -[MRDNowPlayingStateObserver _removeNowPlayingNotifications](self, "_removeNowPlayingNotifications");
      uint64_t v11 = _MRLogForCategory(1LL, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Unregistering for Now Playing Updates",  v13,  2u);
      }
    }
  }

- (void)_onQueue_setReceiveVolumeControlUpdates:(BOOL)a3
{
  unsigned int registeredForVolumeAvailabilityCount = self->_registeredForVolumeAvailabilityCount;
  if (a3)
  {
    self->_unsigned int registeredForVolumeAvailabilityCount = registeredForVolumeAvailabilityCount + 1;
    if (!registeredForVolumeAvailabilityCount)
    {
      uint64_t v5 = _MRLogForCategory(1LL, a2);
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Registering for volume control updates",  (uint8_t *)buf,  2u);
      }

      objc_initWeak(buf, self);
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      uint64_t v8 = kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000A5694;
      v18[3] = &unk_10039B930;
      objc_copyWeak(&v19, buf);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 addObserverForName:v8 object:0 queue:0 usingBlock:v18]);
      id observedVolumeControlNotificationToken = self->_observedVolumeControlNotificationToken;
      self->_id observedVolumeControlNotificationToken = v9;

      objc_destroyWeak(&v19);
      objc_destroyWeak(buf);
    }
  }

  else
  {
    BOOL v11 = registeredForVolumeAvailabilityCount != 0;
    unsigned int v13 = registeredForVolumeAvailabilityCount - 1;
    BOOL v12 = v13 != 0 && v11;
    if (!v11) {
      unsigned int v13 = 0;
    }
    self->_unsigned int registeredForVolumeAvailabilityCount = v13;
    if (!v12 && self->_observedVolumeControlNotificationToken)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 removeObserver:self->_observedVolumeControlNotificationToken];

      uint64_t v16 = _MRLogForCategory(1LL, v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Unregistering for volume control updates",  (uint8_t *)buf,  2u);
      }
    }
  }

- (void)_addNowPlayingNotification:(id)a3 selector:(SEL)a4
{
  id v7 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  if ((-[NSMutableArray containsObject:](self->_observedNowPlayingNotifications, "containsObject:", v7) & 1) == 0)
  {
    [v6 addObserver:self selector:a4 name:v7 object:0];
    -[NSMutableArray addObject:](self->_observedNowPlayingNotifications, "addObject:", v7);
  }
}

- (void)_removeNowPlayingNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = self->_observedNowPlayingNotifications;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend( v3,  "removeObserver:name:object:",  self,  *(void *)(*((void *)&v9 + 1) + 8 * (void)v8),  0,  (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_observedNowPlayingNotifications, "removeAllObjects");
}

- (id)_onQueue_stateForPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (MRDNowPlayingObserverState *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_coalescingStates,  "objectForKeyedSubscript:",  v4));
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v6 nowPlayingObserverCoalesceInterval];
    double v8 = v7;

    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v10 = [v9 verboseNowPlayingStateObserver];

    if (v10)
    {
      uint64_t v12 = _MRLogForCategory(1LL, v11);
      unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v4;
        __int16 v26 = 2048;
        double v27 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] Begin Coalescing for %@ for %lf seconds",  buf,  0x16u);
      }
    }

    id v5 = -[MRDNowPlayingObserverState initWithPlayerPath:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingObserverState),  "initWithPlayerPath:",  v4);
    dispatch_time_t v14 = dispatch_time(0LL, (uint64_t)(v8 * 1000000000.0));
    queue = (dispatch_queue_s *)self->_queue;
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_1000A5A60;
    v21 = &unk_100398E60;
    v22 = self;
    id v16 = v4;
    id v23 = v16;
    dispatch_after(v14, queue, &v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_coalescingStates,  "setObject:forKeyedSubscript:",  v5,  v16,  v18,  v19,  v20,  v21,  v22);
  }

  return v5;
}

- (void)_onQueue_notifyCoalescedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_coalescingStates,  "objectForKeyedSubscript:",  v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v7 = [v6 verboseNowPlayingStateObserver];

    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(1LL, v8);
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v5;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDNowPlayingStateObserver] End Coalescing %@ for %@",  buf,  0x16u);
      }
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A5BEC;
    block[3] = &unk_100398F40;
    block[4] = self;
    id v13 = v5;
    id v11 = v4;
    id v14 = v11;
    dispatch_async(&_dispatch_main_q, block);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_coalescingStates,  "setObject:forKeyedSubscript:",  0LL,  v11);
  }
}

- (MRDNowPlayingStateObserverDelegate)delegate
{
  return (MRDNowPlayingStateObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsCoalescedStateChanged
{
  return self->_wantsCoalescedStateChanged;
}

- (NSMutableDictionary)coalescingStates
{
  return self->_coalescingStates;
}

- (void)setCoalescingStates:(id)a3
{
}

- (MRDNowPlayingServer)npServer
{
  return self->_npServer;
}

- (void).cxx_destruct
{
}

@end
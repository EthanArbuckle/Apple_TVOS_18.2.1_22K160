@interface MRDMediaRemoteServer
+ (MRDMediaRemoteServer)server;
- (BOOL)_internalMediaRemoteNotificationIsLegal:(id)a3;
- (BOOL)_isACriticalSectionActive;
- (BOOL)_isMediaAppInstalled:(id)a3;
- (BOOL)isFirstLaunchAfterBoot;
- (BOOL)shouldSendCommandsDuringPhoneCall;
- (FBSDisplayLayoutMonitor)sharedDisplayMonitor;
- (MRDAVRoutingServer)routingServer;
- (MRDExternalDeviceRemoteServer)externalDeviceServer;
- (MRDGroupSessionServer)groupSessionServer;
- (MRDMediaRemoteClient)MRUIClient;
- (MRDMediaRemoteClient)daemonClient;
- (MRDMediaRemoteClient)frontmostClient;
- (MRDMediaRemoteClient)localNowPlayingClient;
- (MRDMediaRemoteClient)systemMediaClient;
- (MRDMediaRemoteClient)systemPodcastClient;
- (MRDMediaRemoteServer)init;
- (MRDNowPlayingServer)nowPlayingServer;
- (MRDRemoteControlServer)remoteControlServer;
- (MRDTransactionServer)transactionServer;
- (MRDUIServer)uiServer;
- (MRDeviceInfo)deviceInfo;
- (NSArray)availableOrigins;
- (RPCompanionLinkClient)sharedCompanionLinkClient;
- (id)_init;
- (id)allClients;
- (id)canBeNowPlayingClients;
- (id)clientForBundleIdentifier:(id)a3;
- (id)clientForPID:(int)a3;
- (id)clientForPlayerPath:(id)a3;
- (id)clientWithRegisteredCustomOrigin:(id)a3;
- (id)mostRecentCanBeNowPlayingClient;
- (id)mostRecentPlayingClient;
- (void)_clientDidOpenConnection:(id)a3;
- (void)_collectDiagnosticFromClient:(id)a3 completion:(id)a4;
- (void)_handleAdjustSystemVolumeByStepMessage:(id)a3 fromClient:(id)a4;
- (void)_handleAdjustSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCollectClientDiagnosticsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCollectClientDiagnosticsMessageWithCompletion:(id)a3;
- (void)_handleCollectDiagnosticMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCompletePairingHandlerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCriticalSectionTransition:(id)a3 fromClient:(id)a4;
- (void)_handleGetIsBooksAppInstalledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetIsMusicAppInstalledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportsSystemPairingMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSystemIsMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleKeepAliveMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePing:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterPairingHandlerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestBlessMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSelectSourceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleServerXPCMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSystemIsMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSystemVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUnregisterPairingHandler:(id)a3 fromClient:(id)a4;
- (void)_handleWakeMediaAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleWakePlayerServiceMessage:(id)a3 fromClient:(id)a4;
- (void)_postAppActivityNotificationNamed:(id)a3 withActivity:(id)a4;
- (void)_removeClient:(id)a3;
- (void)_restoreNowPlayingClientState;
- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOrigin:(id)a4;
- (void)_terminationHandler;
- (void)_validateAuditTokens:(id)a3 pids:(id)a4 auditTokens:(id)a5;
- (void)addClient:(id)a3;
- (void)addMediaRemoteSeverStartedHandler:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)initializeServer;
- (void)postClientNotificationNamed:(id)a3;
- (void)postClientNotificationNamed:(id)a3 predicate:(id)a4;
- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4;
- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5;
- (void)reevaluateClientsForActiveCriticalSection;
- (void)removeClientForPID:(int)a3;
- (void)restoreClientDeviceInfo:(id)a3;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)start;
- (void)stop;
- (void)virtualAudioInputServer:(id)a3 didUpdateRecordingState:(unsigned int)a4 forDevice:(id)a5;
@end

@implementation MRDMediaRemoteServer

+ (MRDMediaRemoteServer)server
{
  if (qword_1003FDEA0 != -1) {
    dispatch_once(&qword_1003FDEA0, &stru_10039FED0);
  }
  return (MRDMediaRemoteServer *)(id)qword_1003FDE98;
}

- (MRDMediaRemoteServer)init
{
  return 0LL;
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MRDMediaRemoteServer;
  v2 = -[MRDMediaRemoteServer init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremoted.serialQueue", v4);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeClients = v2->_activeClients;
    v2->_activeClients = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    startHandlers = v2->_startHandlers;
    v2->_startHandlers = v9;
  }

  return v2;
}

- (void)initializeServer
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_queue_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  v4);
  termSigHandler = self->_termSigHandler;
  self->_termSigHandler = v5;

  v7 = self->_termSigHandler;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000E0C64;
  handler[3] = &unk_100399250;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  dispatch_resume((dispatch_object_t)self->_termSigHandler);
  int out_token = 0;
  uint32_t v8 = notify_register_dispatch( "AppleLanguagePreferencesChangedNotification",  &out_token,  &_dispatch_main_q,  &stru_10039FF10);
  if (v8)
  {
    int v10 = v8;
    uint64_t v11 = _MRLogForCategory(0LL, v9);
    objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1002B85EC(v10, v12);
    }
  }

  +[MRAVConcreteOutputContext setOutputContextForLocalDeviceDataSource:]( &OBJC_CLASS___MRAVConcreteOutputContext,  "setOutputContextForLocalDeviceDataSource:",  &stru_10039FF50);
  v13 = objc_alloc_init(&OBJC_CLASS___MRDAVRoutingDataSource);
  localRoutingDataSource = self->_localRoutingDataSource;
  self->_localRoutingDataSource = v13;

  v15 = -[MRDVolumeController initWithRoutingDataSource:]( objc_alloc(&OBJC_CLASS___MRDVolumeController),  "initWithRoutingDataSource:",  self->_localRoutingDataSource);
  volumeController = self->_volumeController;
  self->_volumeController = v15;

  v17 = objc_alloc_init(&OBJC_CLASS___MRDNowPlayingServer);
  nowPlayingServer = self->_nowPlayingServer;
  self->_nowPlayingServer = v17;

  v19 = objc_alloc_init(&OBJC_CLASS___MRDRemoteControlServer);
  remoteControlServer = self->_remoteControlServer;
  self->_remoteControlServer = v19;

  v21 = objc_alloc_init(&OBJC_CLASS___MRDBrowsableContentServer);
  browsableContentServer = self->_browsableContentServer;
  self->_browsableContentServer = v21;

  v23 = objc_alloc_init(&OBJC_CLASS___MRDVirtualAudioInputServer);
  virtualAudioInputServer = self->_virtualAudioInputServer;
  self->_virtualAudioInputServer = v23;

  -[MRDVirtualAudioInputServer setDelegate:](self->_virtualAudioInputServer, "setDelegate:", self);
  v25 = objc_alloc_init(&OBJC_CLASS___MRDTransactionServer);
  transactionServer = self->_transactionServer;
  self->_transactionServer = v25;

  v27 = objc_alloc_init(&OBJC_CLASS___MRDBackgroundTasks);
  tasks = self->_tasks;
  self->_tasks = v27;

  v29 = -[MRDAVRoutingServer initWithRoutingDataSource:]( objc_alloc(&OBJC_CLASS___MRDAVRoutingServer),  "initWithRoutingDataSource:",  self->_localRoutingDataSource);
  routingServer = self->_routingServer;
  self->_routingServer = v29;

  v31 = -[MRDExternalDeviceRemoteServer initWithRoutingDataSource:]( objc_alloc(&OBJC_CLASS___MRDExternalDeviceRemoteServer),  "initWithRoutingDataSource:",  self->_localRoutingDataSource);
  externalDeviceServer = self->_externalDeviceServer;
  self->_externalDeviceServer = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned int v34 = [v33 supportGroupSession];

  if (v34)
  {
    v35 = -[MRDGroupSessionServer initWithNowPlayingServer:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionServer),  "initWithNowPlayingServer:",  self->_nowPlayingServer);
    groupSessionServer = self->_groupSessionServer;
    self->_groupSessionServer = v35;
  }

  v37 = objc_alloc_init(&OBJC_CLASS___MRDMediaControlIPCServer);
  mediaControlServer = self->_mediaControlServer;
  self->_mediaControlServer = v37;

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_1000E0D9C;
  v42[3] = &unk_100399350;
  v42[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, v42);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000E1190;
  v41[3] = &unk_10039B878;
  v41[4] = self;
  id v40 =  [v39 addObserverForName:@"MRDMediaRemoteClientDidInvalidate" object:0 queue:0 usingBlock:v41];

  -[MRDMediaRemoteServer _restoreNowPlayingClientState](self, "_restoreNowPlayingClientState");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDMediaRemoteServer;
  -[MRDMediaRemoteServer dealloc](&v3, "dealloc");
}

- (void)start
{
  if (!self->_listenerConnection)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaremoted.connection", v4);
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v5;

    mach_service = xpc_connection_create_mach_service( "com.apple.mediaremoted.xpc",  (dispatch_queue_t)self->_connectionQueue,  1uLL);
    listenerConnection = self->_listenerConnection;
    self->_listenerConnection = mach_service;

    uint64_t v9 = self->_listenerConnection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000E1488;
    handler[3] = &unk_100399350;
    handler[4] = self;
    xpc_connection_set_event_handler(v9, handler);
    xpc_connection_resume(self->_listenerConnection);
  }

  mediaControlServer = self->_mediaControlServer;
  if (mediaControlServer) {
    -[MRDMediaControlIPCServer start](mediaControlServer, "start");
  }
  externalDeviceServer = self->_externalDeviceServer;
  if (externalDeviceServer) {
    -[MRDExternalDeviceRemoteServer start](externalDeviceServer, "start");
  }
  notify_post(kMRMediaRemoteServiceDidResetDistributedNotification);
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_1000E15A4;
  v27 = sub_1000E15B4;
  id v28 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E15BC;
  block[3] = &unk_100399278;
  block[4] = self;
  block[5] = &v23;
  dispatch_sync(serialQueue, block);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = (id)v24[5];
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8LL * (void)v16) + 16LL))(*(void *)(*((void *)&v18 + 1) + 8LL * (void)v16));
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }

    while (v14);
  }

  MRGetSharedService(v17);
  _Block_object_dispose(&v23, 8);
}

- (void)stop
{
  if (self->_listenerConnection)
  {
    uint64_t v3 = _MRLogForCategory(0LL, a2);
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping MediaRemote server", v8, 2u);
    }

    xpc_connection_cancel(self->_listenerConnection);
    listenerConnection = self->_listenerConnection;
    self->_listenerConnection = 0LL;
  }

  connectionQueue = self->_connectionQueue;
  if (connectionQueue)
  {
    self->_connectionQueue = 0LL;
  }

  externalDeviceServer = self->_externalDeviceServer;
  if (externalDeviceServer) {
    -[MRDExternalDeviceRemoteServer stop](externalDeviceServer, "stop");
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E17AC;
  block[3] = &unk_100399DF8;
  id v6 = v4;
  id v9 = v6;
  int v10 = self;
  uint64_t v11 = &v12;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v13 + 24)) {
    -[MRDMediaRemoteServer restoreClientDeviceInfo:](self, "restoreClientDeviceInfo:", v6);
  }
  -[MRDMediaRemoteServer reevaluateClientsForActiveCriticalSection](self, "reevaluateClientsForActiveCriticalSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:@"MRDMediaRemoteClientDidConnect" object:v6];

  _Block_object_dispose(&v12, 8);
}

- (void)removeClientForPID:(int)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E1AD0;
  v5[3] = &unk_10039A990;
  int v6 = a3;
  v5[4] = self;
  dispatch_sync(serialQueue, v5);
  -[MRDMediaRemoteServer reevaluateClientsForActiveCriticalSection](self, "reevaluateClientsForActiveCriticalSection");
}

- (id)clientForPID:(int)a3
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_1000E15A4;
  uint64_t v12 = sub_1000E15B4;
  id v13 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1D84;
  block[3] = &unk_10039AA08;
  void block[4] = self;
  block[5] = &v8;
  int v7 = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)clientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  char v15 = sub_1000E15A4;
  v16 = sub_1000E15B4;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1EC4;
  block[3] = &unk_100399DF8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)clientWithRegisteredCustomOrigin:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self->_nowPlayingServer, "originClientForOrigin:", a3));
  if (v4) {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer daemonClient](self, "daemonClient"));
  }
  else {
    dispatch_queue_t v5 = 0LL;
  }

  return v5;
}

- (id)mostRecentCanBeNowPlayingClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v24 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:v5]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  uint64_t v23 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 nowPlayingClients]);
  id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  id v7 = 0LL;
  if (v28)
  {
    uint64_t v27 = *(void *)v35;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v8;
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerClients]);
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v31;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v31 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 canBeNowPlayingPlayerTimestamp]);
              id v17 = [v2 compare:v16];

              if (v17 == (id)1)
              {
                uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 canBeNowPlayingPlayerTimestamp]);

                id v19 = v9;
                id v7 = v19;
                v2 = (void *)v18;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }

          while (v12);
        }

        uint64_t v8 = v29 + 1;
      }

      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }

    while (v28);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v7 client]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer clientForPID:](self, "clientForPID:", [v20 processIdentifier]));

  return v21;
}

- (id)mostRecentPlayingClient
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer canBeNowPlayingClients](self, "canBeNowPlayingClients", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer localPlayersForXpcClient:]( self->_nowPlayingServer,  "localPlayersForXpcClient:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v8)));
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v6);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v3, "sortedArrayUsingComparator:", &stru_10039FF98));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lastObject]);

  nowPlayingServer = self->_nowPlayingServer;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 playerPath]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer xpcClientForPlayerPath:](nowPlayingServer, "xpcClientForPlayerPath:", v13));

  return v14;
}

- (id)allClients
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000E15A4;
  id v10 = sub_1000E15B4;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E258C;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)canBeNowPlayingClients
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer allClients](self, "allClients"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)clientForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  unsigned int v6 = [v5 isLocal];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer clientForPID:](self, "clientForPID:", [v7 processIdentifier]));
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer clientWithRegisteredCustomOrigin:](self, "clientWithRegisteredCustomOrigin:", v7));
  }

  id v9 = (void *)v8;

  return v9;
}

- (void)addMediaRemoteSeverStartedHandler:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E28C4;
  v7[3] = &unk_100399F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)postClientNotificationNamed:(id)a3
{
}

- (void)postClientNotificationNamed:(id)a3 predicate:(id)a4
{
}

- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4
{
}

- (void)postClientNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace(732233828LL, 0LL, 0LL, 0LL, 0LL);
  if (qword_1003FDEA8 != -1) {
    dispatch_once(&qword_1003FDEA8, &stru_10039FFB8);
  }
  uint64_t v11 = MRGetPlayerPathFromUserInfo(v9);
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v12 copy];

  __int128 v14 = (dispatch_queue_s *)qword_1003FDEB0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2B34;
  block[3] = &unk_10039DCF8;
  id v20 = v9;
  id v21 = v8;
  id v22 = v13;
  uint64_t v23 = self;
  id v24 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = v8;
  id v18 = v9;
  dispatch_async(v14, block);
}

- (void)restoreClientDeviceInfo:(id)a3
{
  id v4 = a3;
  nowPlayingServer = self->_nowPlayingServer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E2F94;
  v7[3] = &unk_10039FFE0;
  id v8 = v4;
  id v6 = v4;
  -[MRDNowPlayingServer restoreDeviceInfoToClient:handler:]( nowPlayingServer,  "restoreDeviceInfoToClient:handler:",  v6,  v7);
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  routingServer = self->_routingServer;
  id v7 = a4;
  id v8 = a3;
  -[MRDAVRoutingServer restoreClientState:handler:](routingServer, "restoreClientState:handler:", v8, v7);
  -[MRDNowPlayingServer restoreClientState:handler:](self->_nowPlayingServer, "restoreClientState:handler:", v8, v7);
  -[MRDGroupSessionServer restoreClientState:handler:](self->_groupSessionServer, "restoreClientState:handler:", v8, v7);
}

- (MRDMediaRemoteClient)localNowPlayingClient
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localActivePlayerPath](self->_nowPlayingServer, "localActivePlayerPath"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer clientForPlayerPath:](self, "clientForPlayerPath:", v3));

  return (MRDMediaRemoteClient *)v4;
}

- (MRDMediaRemoteClient)systemMediaClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000E15A4;
  id v10 = sub_1000E15B4;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E321C;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDMediaRemoteClient *)v3;
}

- (MRDMediaRemoteClient)systemPodcastClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000E15A4;
  id v10 = sub_1000E15B4;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E33A8;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDMediaRemoteClient *)v3;
}

- (MRDMediaRemoteClient)frontmostClient
{
  id v3 = sub_10013D3B4();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer clientForBundleIdentifier:](self, "clientForBundleIdentifier:", v4));
  }
  else {
    id v5 = 0LL;
  }

  return (MRDMediaRemoteClient *)v5;
}

- (MRDMediaRemoteClient)daemonClient
{
  return (MRDMediaRemoteClient *)-[MRDMediaRemoteServer clientForPID:](self, "clientForPID:", getpid());
}

- (MRDMediaRemoteClient)MRUIClient
{
  return (MRDMediaRemoteClient *)-[MRDMediaRemoteServer clientForBundleIdentifier:]( self,  "clientForBundleIdentifier:",  @"com.apple.MediaRemoteUI");
}

- (RPCompanionLinkClient)sharedCompanionLinkClient
{
  if (qword_1003FDEC0 != -1) {
    dispatch_once(&qword_1003FDEC0, &stru_1003A0028);
  }
  return (RPCompanionLinkClient *)(id)qword_1003FDEB8;
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self->_nowPlayingServer, "localOriginClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 deviceInfo]);

  return (MRDeviceInfo *)v3;
}

- (void)_clientDidOpenConnection:(id)a3
{
  id v4 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v4);
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = pid;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client with pid %ld opened connection.",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = -[MRDMediaRemoteClient initWithConnection:]( objc_alloc(&OBJC_CLASS___MRDMediaRemoteClient),  "initWithConnection:",  v4);
  -[MRDMediaRemoteClient setMessageHandler:](v9, "setMessageHandler:", self);
  -[MRDMediaRemoteServer addClient:](self, "addClient:", v9);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_autoreleasePoolPush();
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  switch(HIBYTE(uint64))
  {
    case 1u:
      -[MRDMediaRemoteServer _handleServerXPCMessage:fromClient:](self, "_handleServerXPCMessage:fromClient:", v6, v7);
      break;
    case 2u:
      nowPlayingServer = self->_nowPlayingServer;
      goto LABEL_14;
    case 3u:
      nowPlayingServer = self->_routingServer;
      goto LABEL_14;
    case 4u:
      nowPlayingServer = self->_remoteControlServer;
      goto LABEL_14;
    case 5u:
      nowPlayingServer = self->_browsableContentServer;
      goto LABEL_14;
    case 6u:
      nowPlayingServer = self->_externalDeviceServer;
      goto LABEL_14;
    case 9u:
      nowPlayingServer = self->_virtualAudioInputServer;
      goto LABEL_14;
    case 0xBu:
      nowPlayingServer = self->_uiServer;
      goto LABEL_14;
    case 0xCu:
      nowPlayingServer = self->_groupSessionServer;
LABEL_14:
      [nowPlayingServer handleXPCMessage:v6 fromClient:v7];
      break;
    default:
      uint64_t v12 = _MRLogForCategory(0LL, v9);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 134217984;
        uint64_t v15 = uint64;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "XPC message with id %lu not handled.",  (uint8_t *)&v14,  0xCu);
      }

      break;
  }

  objc_autoreleasePoolPop(v8);
}

- (void)_handleServerXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218498;
    uint64_t v17 = uint64;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Received message %llu from client %@ : %@",  (uint8_t *)&v16,  0x20u);
  }

  switch(uint64)
  {
    case 0x100000000000001uLL:
      -[MRDMediaRemoteServer _handleSelectSourceMessage:fromClient:]( self,  "_handleSelectSourceMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000002uLL:
      -[MRDMediaRemoteServer _handleKeepAliveMessage:fromClient:](self, "_handleKeepAliveMessage:fromClient:", v6, v7);
      break;
    case 0x100000000000003uLL:
      -[MRDMediaRemoteServer _handlePostNotificationMessage:fromClient:]( self,  "_handlePostNotificationMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000004uLL:
      -[MRDMediaRemoteServer _handleGetSystemVolumeMessage:fromClient:]( self,  "_handleGetSystemVolumeMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000005uLL:
      -[MRDMediaRemoteServer _handleSetSystemVolumeMessage:fromClient:]( self,  "_handleSetSystemVolumeMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000006uLL:
      -[MRDMediaRemoteServer _handleAdjustSystemVolumeByStepMessage:fromClient:]( self,  "_handleAdjustSystemVolumeByStepMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000007uLL:
      -[MRDMediaRemoteServer _handleSetSystemIsMutedMessage:fromClient:]( self,  "_handleSetSystemIsMutedMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000008uLL:
      -[MRDMediaRemoteServer _handleGetSystemIsMutedMessage:fromClient:]( self,  "_handleGetSystemIsMutedMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000009uLL:
      transactionServer = self->_transactionServer;
      goto LABEL_14;
    case 0x10000000000000AuLL:
      transactionServer = self->_tasks;
LABEL_14:
      [transactionServer handleXPCMessage:v6 fromClient:v7];
      break;
    case 0x10000000000000CuLL:
      -[MRDMediaRemoteServer _handlePing:fromClient:](self, "_handlePing:fromClient:", v6, v7);
      break;
    case 0x10000000000000DuLL:
      -[MRDMediaRemoteServer _handleGetSupportsSystemPairingMessage:fromClient:]( self,  "_handleGetSupportsSystemPairingMessage:fromClient:",  v6,  v7);
      break;
    case 0x10000000000000EuLL:
      -[MRDMediaRemoteServer _handleCollectDiagnosticMessage:fromClient:]( self,  "_handleCollectDiagnosticMessage:fromClient:",  v6,  v7);
      break;
    case 0x10000000000000FuLL:
      -[MRDMediaRemoteServer _handleCollectClientDiagnosticsMessage:fromClient:]( self,  "_handleCollectClientDiagnosticsMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000010uLL:
      -[MRDMediaRemoteServer _handleWakeMediaAppMessage:fromClient:]( self,  "_handleWakeMediaAppMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000011uLL:
      -[MRDMediaRemoteServer _handleWakePlayerServiceMessage:fromClient:]( self,  "_handleWakePlayerServiceMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000012uLL:
      -[MRDMediaRemoteServer _handleRequestBlessMessage:fromClient:]( self,  "_handleRequestBlessMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000013uLL:
      -[MRDMediaRemoteServer _handleRegisterPairingHandlerMessage:fromClient:]( self,  "_handleRegisterPairingHandlerMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000014uLL:
      -[MRDMediaRemoteServer _handleUnregisterPairingHandler:fromClient:]( self,  "_handleUnregisterPairingHandler:fromClient:",  v6,  v7);
      break;
    case 0x100000000000015uLL:
      -[MRDMediaRemoteServer _handleCompletePairingHandlerMessage:fromClient:]( self,  "_handleCompletePairingHandlerMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000016uLL:
      -[MRDMediaRemoteServer _handleGetIsBooksAppInstalledMessage:fromClient:]( self,  "_handleGetIsBooksAppInstalledMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000017uLL:
      -[MRDMediaRemoteServer _handleGetIsMusicAppInstalledMessage:fromClient:]( self,  "_handleGetIsMusicAppInstalledMessage:fromClient:",  v6,  v7);
      break;
    case 0x100000000000019uLL:
      -[MRDMediaRemoteServer _handleSuspendDisconnectionPauseMessage:fromClient:]( self,  "_handleSuspendDisconnectionPauseMessage:fromClient:",  v6,  v7);
      break;
    case 0x10000000000001AuLL:
      -[MRDMediaRemoteServer _handleAdjustSystemVolumeMessage:fromClient:]( self,  "_handleAdjustSystemVolumeMessage:fromClient:",  v6,  v7);
      break;
    case 0x10000000000001BuLL:
      -[MRDMediaRemoteServer _handleCriticalSectionTransition:fromClient:]( self,  "_handleCriticalSectionTransition:fromClient:",  v6,  v7);
      break;
    default:
      uint64_t v14 = _MRLogForCategory(0LL, v12);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134217984;
        uint64_t v17 = uint64;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Server message with id %llu not handled.",  (uint8_t *)&v16,  0xCu);
      }

      break;
  }
}

- (void)_collectDiagnosticFromClient:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = MRCreateXPCMessage(0x700000000000008LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E3E00;
  v10[3] = &unk_1003A0090;
  id v11 = v5;
  id v9 = v5;
  [v6 relayXPCMessage:v8 andReply:1 resultCallback:v10];
}

- (void)_handleSelectSourceMessage:(id)a3 fromClient:(id)a4
{
  string = xpc_dictionary_get_string(a3, "MRXPC_SOURCE_ID_KEY");
  if (string)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", string));
    -[MRDAVRoutingServer pickCachedRouteWithUID:](self->_routingServer, "pickCachedRouteWithUID:");
  }

  else
  {
    uint64_t v7 = _MRLogForCategory(0LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class(self);
      uint64_t v10 = NSStringFromClass(v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "NULL source ID string sent to %@", buf, 0xCu);
    }
  }

- (void)_handleKeepAliveMessage:(id)a3 fromClient:(id)a4
{
}

- (void)_handleGetSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localOriginClient]);
  [v6 volume];
  float v8 = v7;

  sub_10013AB4C(v9, (uint64_t)"MRXPC_VOLUME_VALUE_KEY", 4LL, COERCE__INT64(v8), 0LL);
}

- (void)_handleSetSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = xpc_dictionary_get_double(v6, "MRXPC_VOLUME_VALUE_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v12;
    __int16 v21 = 2048;
    double v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client: %{public}@ Set system volume: setting volume to %f",  buf,  0x16u);
  }

  volumeController = self->_volumeController;
  id v18 = 0LL;
  *(float *)&double v14 = v8;
  -[MRDVolumeController setVolume:error:](volumeController, "setVolume:error:", &v18, v14);
  id v15 = v18;
  int v16 = v15;
  if (v15) {
    unsigned int v17 = [v15 code];
  }
  else {
    unsigned int v17 = 0;
  }
  sub_10013AD7C(v6, v17);
}

- (void)_handleAdjustSystemVolumeByStepMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = xpc_dictionary_get_double(v6, "MRXPC_VOLUME_VALUE_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 displayName]);
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v12;
    __int16 v21 = 2048;
    double v22 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client: %{public}@ Adjust system volume: stepping volume by %f",  buf,  0x16u);
  }

  volumeController = self->_volumeController;
  id v18 = 0LL;
  *(float *)&double v14 = v8;
  -[MRDVolumeController adjustVolumeWithStepAmount:error:]( volumeController,  "adjustVolumeWithStepAmount:error:",  &v18,  v14);
  id v15 = v18;
  int v16 = v15;
  if (v15) {
    unsigned int v17 = [v15 code];
  }
  else {
    unsigned int v17 = 0;
  }
  sub_10013AD7C(v6, v17);
}

- (void)_handleSetSystemIsMutedMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [v7 isMuted];
  volumeController = self->_volumeController;
  id v13 = 0LL;
  -[MRDVolumeController setIsMuted:error:](volumeController, "setIsMuted:error:", v8, &v13);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E4370;
  v11[3] = &unk_100399350;
  id v12 = v13;
  id v10 = v12;
  sub_10013ADE4(v5, v11);
}

- (void)_handleGetSystemIsMutedMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localOriginClient]);
  unsigned __int8 v8 = [v7 isMuted];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E443C;
  v9[3] = &unk_1003A00B0;
  unsigned __int8 v10 = v8;
  sub_10013ADE4(v4, v9);
}

- (void)_handleAdjustSystemVolumeMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  volumeController = self->_volumeController;
  id v12 = 0LL;
  -[MRDVolumeController adjustVolume:error:]( volumeController,  "adjustVolume:error:",  [v7 adjustment],  &v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E455C;
  v10[3] = &unk_100399350;
  id v11 = v12;
  id v9 = v11;
  sub_10013ADE4(v5, v10);
}

- (void)_handleGetIsBooksAppInstalledMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (id)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
  sub_10013AB4C( v5,  (uint64_t)"MRXPC_APP_INSTALLED_KEY",  2LL,  -[MRDMediaRemoteServer _isMediaAppInstalled:](self, "_isMediaAppInstalled:", v6),  0LL);
}

- (void)_handleGetIsMusicAppInstalledMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v5);
  sub_10013AB4C( v5,  (uint64_t)"MRXPC_APP_INSTALLED_KEY",  2LL,  -[MRDMediaRemoteServer _isMediaAppInstalled:](self, "_isMediaAppInstalled:", v6),  0LL);
}

- (BOOL)_isMediaAppInstalled:(id)a3
{
  if (a3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 appState]);
    unsigned __int8 v5 = [v4 isValid];

    return v5;
  }

  else
  {
    uint64_t v7 = _MRLogForCategory(0LL, a2);
    unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1002B887C();
    }

    return 0;
  }

- (void)_handleWakeMediaAppMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E47C8;
  v15[3] = &unk_1003A00D8;
  id v16 = v5;
  id v7 = v5;
  unsigned __int8 v8 = objc_retainBlock(v15);
  id v9 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E47E4;
  v12[3] = &unk_1003A0100;
  id v13 = v6;
  id v14 = v8;
  id v10 = v6;
  id v11 = v8;
  sub_10013B9E8(v9, &__NSDictionary0__struct, v12, 5.0);
}

- (void)_handleWakePlayerServiceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000E4CB4;
  v48[3] = &unk_1003A00D8;
  id v32 = v5;
  id v49 = v32;
  __int128 v31 = objc_retainBlock(v48);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v33 = v7;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 allClients]);
  id v36 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v45;
    while (2)
    {
      unsigned __int8 v8 = 0LL;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        v39 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)v8);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localPlayersForXpcClient:"));
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v41;
          v38 = v8;
LABEL_8:
          id v14 = 0LL;
          while (1)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(v10);
            }
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 client]);
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 parentApplicationBundleIdentifier]);
            id v18 = v6;
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
            id v20 = v17;
            id v21 = v19;
            if (v20 == v21) {
              break;
            }
            double v22 = v21;
            unsigned __int8 v23 = [v20 isEqual:v21];

            if ((v23 & 1) != 0) {
              goto LABEL_17;
            }
            id v14 = (char *)v14 + 1;
            id v6 = v18;
            if (v12 == v14)
            {
              id v12 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
              unsigned __int8 v8 = v38;
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_15;
            }
          }

LABEL_17:
          id v24 = v39;

          id v6 = v18;
          unsigned __int8 v8 = v38;
          if (!v24) {
            goto LABEL_18;
          }

          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleIdentifier]);
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Player Service Wake - %@",  v29));
          id v28 = v31;
          ((void (*)(void *, id))v31[2])(v31, [v24 takeAssertionAndBlessForReason:v30]);

          goto LABEL_24;
        }

- (void)_handlePing:(id)a3 fromClient:(id)a4
{
}

- (void)_handleRequestBlessMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 entitlements] & 0x10) != 0)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Bless Request - %@",  v8));

    id v10 = objc_alloc(&OBJC_CLASS___MRDTaskAssertion);
    id v11 = [v6 pid];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    uint64_t v13 = -[MRDTaskAssertion initWithType:pid:bundleID:name:](v10, "initWithType:pid:bundleID:name:", 4LL, v11, v12, v9);

    if (-[MRDTaskAssertion invalidateInDuration:](v13, "invalidateInDuration:", 10.0))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
      LODWORD(v7) = sub_10013CEB0(v15);
      if ((v7 & 1) == 0)
      {
        uint64_t v17 = _MRLogForCategory(0LL, v16);
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1002B8938();
        }
      }
    }

    else
    {
      uint64_t v19 = _MRLogForCategory(0LL, v14);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_1002B8964();
      }
      LODWORD(v7) = 0;
    }

    uint64_t v7 = v7;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  sub_10013AB4C(v5, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2LL, v7, 0LL);
}

- (void)_handleGetSupportsSystemPairingMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E4EF0;
  v6[3] = &unk_1003A00B0;
  BOOL v7 = ([a4 entitlements] & 4) != 0;
  sub_10013ADE4(v5, v6);
}

- (void)_handleCollectDiagnosticMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___MRDDiagnostic);
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteServer-diagnostic", v8);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E4FEC;
  block[3] = &unk_100398F40;
  void block[4] = self;
  uint64_t v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)_handleCollectClientDiagnosticsMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000E5664;
  v6[3] = &unk_1003A0150;
  id v7 = a3;
  id v5 = v7;
  -[MRDMediaRemoteServer _handleCollectClientDiagnosticsMessageWithCompletion:]( self,  "_handleCollectClientDiagnosticsMessageWithCompletion:",  v6);
}

- (void)_handleCollectClientDiagnosticsMessageWithCompletion:(id)a3
{
  id v26 = a3;
  id v4 = dispatch_group_create();
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteServer", v6);

  unsigned __int8 v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer allClients](self, "allClients"));
  id v9 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)v12);
        dispatch_group_enter(v4);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_1000E5A14;
        v37[3] = &unk_1003A0178;
        v38 = v7;
        uint64_t v39 = v13;
        __int128 v40 = v8;
        __int128 v41 = v4;
        -[MRDMediaRemoteServer _collectDiagnosticFromClient:completion:]( self,  "_collectDiagnosticFromClient:completion:",  v13,  v37);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }

    while (v10);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000E5B64;
  v33[3] = &unk_100399768;
  dispatch_queue_t v34 = v7;
  uint64_t v35 = v8;
  id v36 = v26;
  id v14 = v26;
  id v15 = v8;
  uint64_t v16 = v7;
  uint64_t v17 = objc_retainBlock(v33);
  id v18 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v19 broadcastCommandWaitDuration];
  double v21 = v20;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000E5D60;
  v31[3] = &unk_100399530;
  double v22 = v17;
  id v32 = v22;
  id v23 = [v18 initWithTimeout:@"clientDiagnose" reason:v31 handler:v21];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E5D6C;
  block[3] = &unk_100399F10;
  id v29 = v23;
  id v30 = v22;
  id v24 = v22;
  id v25 = v23;
  dispatch_group_notify(v4, &_dispatch_main_q, block);
}

- (void)_handleRegisterPairingHandlerMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = MRCreateStringFromXPCMessage(v6, "MRXPC_ROUTE_UID_KEY");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 routingServer]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 routingDataSource]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000E5F40;
    v16[3] = &unk_10039EF78;
    uint64_t v17 = v9;
    id v18 = v5;
    [v12 addAuthorizationCallbackForRouteID:v17 requestCallback:v16];

    unsigned int v13 = 0;
    id v14 = v17;
  }

  else
  {
    uint64_t v15 = _MRLogForCategory(0LL, v8);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Pairing Handler register failed for routeUID: %{public}@",  buf,  0xCu);
    }

    unsigned int v13 = 2;
  }

  sub_10013AD7C(v6, v13);
}

- (void)_handleUnregisterPairingHandler:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  uint64_t v5 = MRCreateStringFromXPCMessage(v4, "MRXPC_ROUTE_UID_KEY");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v8 = _MRLogForCategory(0LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Pairing Handler unregister fro routeUID: %@",  (uint8_t *)&v14,  0xCu);
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s routingServer](v9, "routingServer"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 routingDataSource]);
    [v12 removeAuthorizationCallbackForRouteID:v6];

    unsigned int v13 = 0;
  }

  else
  {
    if (v10)
    {
      int v14 = 138412290;
      uint64_t v15 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Pairing Handler unregister failed for routeUID: %@",  (uint8_t *)&v14,  0xCu);
    }

    unsigned int v13 = 2;
  }

  sub_10013AD7C(v4, v13);
}

- (void)_handleCompletePairingHandlerMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MRCreateStringFromXPCMessage(v5, "MRXPC_ROUTE_UID_KEY");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = MRCreateStringFromXPCMessage(v5, "MRXPC_CUSTOM_DATA_KEY");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v12 = _MRLogForCategory(0LL, v11);
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v14)
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Pairing handler complete attempt for routeUID: %@",  (uint8_t *)&v16,  0xCu);
    }

    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 pairingHandler]);
    -[os_log_s performHandlerForRouteUID:passcode:](v13, "performHandlerForRouteUID:passcode:", v8, v10);
    unsigned int v15 = 0;
  }

  else
  {
    if (v14)
    {
      int v16 = 138412290;
      uint64_t v17 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Pairing Handler complete failed for routeUID: %@",  (uint8_t *)&v16,  0xCu);
    }

    unsigned int v15 = 2;
  }

  sub_10013AD7C(v5, v15);
}

- (void)_handleCriticalSectionTransition:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 entitlements] & 0x4000) != 0)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "MRXPC_CRITICAL_SECTION_TRANSITION_KEY");
    string = xpc_dictionary_get_string(v6, "MRXPC_CRITICAL_SECTION_IDENTIFIER_KEY");
    if (string)
    {
      BOOL v14 = string;
      unsigned int v15 = objc_alloc(&OBJC_CLASS___NSUUID);
      int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
      uint64_t v17 = -[NSUUID initWithUUIDString:](v15, "initWithUUIDString:", v16);

      if (int64 == 1)
      {
        [v7 invalidateCriticalSectionAssertionForRequestID:v17];
      }

      else if (!int64)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000E657C;
        v20[3] = &unk_100399250;
        v20[4] = self;
        [v7 takeCriticalSectionAssertionForRequestID:v17 completion:v20];
      }

      -[MRDMediaRemoteServer reevaluateClientsForActiveCriticalSection]( self,  "reevaluateClientsForActiveCriticalSection");
      sub_10013AB4C(v6, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2LL, 1LL, 0LL);
    }

    else
    {
      uint64_t v18 = _MRLogForCategory(0LL, v13);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1002B89BC();
      }
    }
  }

  else
  {
    uint64_t v9 = _MRLogForCategory(0LL, v8);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1002B8990();
    }

    sub_10013AB4C(v6, (uint64_t)"MRXPC_BOOL_RESULT_KEY", 2LL, 0LL, 0LL);
  }
}

- (BOOL)_isACriticalSectionActive
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_activeClients, "allValues"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mr_filter:", &stru_1003A01B8));
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)reevaluateClientsForActiveCriticalSection
{
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6814;
  block[3] = &unk_100399278;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_sync(serialQueue, block);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer allClients](self, "allClients"));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v8, "isMediaRemoteDaemon", (void)v9) & 1) == 0)
        {
          if (*((_BYTE *)v15 + 24)) {
            [v8 pauseNotifications];
          }
          else {
            [v8 resumeNotifications];
          }
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v17 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)virtualAudioInputServer:(id)a3 didUpdateRecordingState:(unsigned int)a4 forDevice:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v10[0] = kMRVirtualVoiceInputDeviceIDUserInfoKey;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  objc_msgSend(a5, "deviceID", a3)));
  v11[0] = v7;
  v10[1] = kMRVirtualVoiceInputRecordingStateUserInfoKey;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  v11[1] = v8;
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));

  -[MRDMediaRemoteServer postClientNotificationNamed:userInfo:]( self,  "postClientNotificationNamed:userInfo:",  kMRVirtualVoiceInputRecordingStateDidChangeNotification,  v9);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E6A4C;
  block[3] = &unk_100398E60;
  id v12 = v4;
  uint64_t v13 = self;
  id v10 = v4;
  dispatch_sync(serialQueue, block);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer localNowPlayingClient](self, "localNowPlayingClient"));
  [v10 setLocalNowPlayingClient:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer systemMediaClient](self, "systemMediaClient"));
  [v10 setSystemMediaClient:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer frontmostClient](self, "frontmostClient"));
  [v10 setFrontmostClient:v8];

  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDMediaRemoteServer daemonClient](self, "daemonClient"));
  [v10 setDaemonClient:v9];

  [v10 setVolumeController:self->_volumeController];
}

- (void)_postAppActivityNotificationNamed:(id)a3 withActivity:(id)a4
{
  id v6 = a3;
  ExternalRepresentation = (void *)_MRApplicationActivityCreateExternalRepresentation(a4);
  uint64_t v9 = kMRApplicationActivityUserInfoDataKey;
  id v10 = ExternalRepresentation;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  -[MRDMediaRemoteServer postClientNotificationNamed:userInfo:](self, "postClientNotificationNamed:userInfo:", v6, v8);
}

- (BOOL)_internalMediaRemoteNotificationIsLegal:(id)a3
{
  uint64_t v3 = qword_1003FDED0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003FDED0, &stru_1003A0218);
  }
  unsigned __int8 v5 = [(id)qword_1003FDEC8 containsObject:v4];

  return v5;
}

- (void)_removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pid];
  uint64_t v7 = _MRLogForCategory(0LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ invalidated.",  (uint8_t *)&v12,  0xCu);
  }

  -[MRDRemoteControlServer clearContextsForClient:](self->_remoteControlServer, "clearContextsForClient:", v4);
  -[MRDVirtualAudioInputServer clearRegisteredDevicesForClient:]( self->_virtualAudioInputServer,  "clearRegisteredDevicesForClient:",  v4);
  -[MRDVirtualAudioInputServer clearRecordingEndpointsForClient:]( self->_virtualAudioInputServer,  "clearRecordingEndpointsForClient:",  v4);
  -[MRDExternalDeviceRemoteServer clearEndpointForClient:](self->_externalDeviceServer, "clearEndpointForClient:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDAVRoutingServer hostedRoutingService](self->_routingServer, "hostedRoutingService"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 hostedRoutingController]);
  [v10 removeVirtualOutputDevicesForClient:v4];

  -[MRDNowPlayingServer clearNowPlayingClientForXPCClient:]( self->_nowPlayingServer,  "clearNowPlayingClientForXPCClient:",  v4);
  -[MRDMediaRemoteServer removeClientForPID:](self, "removeClientForPID:", v5);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v11 postNotificationName:@"MRDMediaRemoteServerClientInvalidatedNotification" object:v4 userInfo:0];
}

- (void)_sendMediaRemoteCommand:(unsigned int)a3 withOrigin:(id)a4
{
}

- (void)_validateAuditTokens:(id)a3 pids:(id)a4 auditTokens:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v24 = a5;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * (void)i) getBytes:&v29 length:32];
        audit_token_t atoken = v29;
        uint64_t v12 = audit_token_to_pid(&atoken);
        audit_token_t atoken = v29;
        int v13 = audit_token_to_pidversion(&atoken);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
        uint64_t v28 = 0LL;
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v14,  &v28));

        if (!v15)
        {
          uint64_t v20 = _MRLogForCategory(0LL, v16);
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          atoken.val[0] = 67109120;
          atoken.val[1] = v12;
          double v21 = v19;
          double v22 = "No process for pid %d";
          goto LABEL_13;
        }

        [v15 auditToken];
        if (audit_token_to_pidversion(&v27) == v13)
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
          [v25 addObject:v18];

          audit_token_t atoken = v29;
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &atoken,  32LL));
          [v24 addObject:v19];
          goto LABEL_14;
        }

        uint64_t v23 = _MRLogForCategory(0LL, v17);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          atoken.val[0] = 67109120;
          atoken.val[1] = v12;
          double v21 = v19;
          double v22 = "Pidversion out of date for %d";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&atoken, 8u);
        }

- (BOOL)isFirstLaunchAfterBoot
{
  if (qword_1003FDED8 != -1) {
    dispatch_once(&qword_1003FDED8, &stru_1003A0238);
  }
  return byte_1003F6F60;
}

- (void)_restoreNowPlayingClientState
{
  if (-[MRDMediaRemoteServer isFirstLaunchAfterBoot](self, "isFirstLaunchAfterBoot"))
  {
    uint64_t v4 = _MRLogForCategory(0LL, v3);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting client and expected pids", buf, 2u);
    }

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v6 setExpectedClientAuditTokens:&__NSArray0__struct];

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v7 setConnectedClientAuditTokens:&__NSArray0__struct];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connectedClientAuditTokens]);
    id v7 = [v9 copy];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 expectedClientAuditTokens]);
    id v12 = [v11 copy];

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[MRDMediaRemoteServer _validateAuditTokens:pids:auditTokens:]( self,  "_validateAuditTokens:pids:auditTokens:",  v7,  v14,  v13);
    -[MRDMediaRemoteServer _validateAuditTokens:pids:auditTokens:]( self,  "_validateAuditTokens:pids:auditTokens:",  v12,  v15,  v13);
    uint64_t v16 = -[NSMutableSet initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithArray:", v14);
    -[NSMutableSet addObjectsFromArray:](v16, "addObjectsFromArray:", v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v17 setExpectedClientAuditTokens:v13];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v18 setConnectedClientAuditTokens:&__NSArray0__struct];

    uint64_t v20 = _MRLogForCategory(0LL, v19);
    double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Restoring client pids %{public}@", buf, 0xCu);
    }

    uint64_t v23 = _MRLogForCategory(0LL, v22);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v33 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Restoring expected client pids %{public}@",  buf,  0xCu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000E76E4;
    block[3] = &unk_100398E60;
    __int128 v30 = v16;
    __int128 v31 = self;
    audit_token_t v27 = v16;
    dispatch_async(v26, block);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_1000E7868;
  v28[3] = &unk_100399250;
  v28[4] = self;
  dispatch_async(&_dispatch_main_q, v28);
}

- (void)_terminationHandler
{
  uint64_t v2 = _MRLogForCategory(0LL, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SIGTERM received, preparing to shut down",  v5,  2u);
  }

  uint64_t v4 = xpc_transaction_exit_clean();
  MRInvalidateTransactions(v4);
}

- (NSArray)availableOrigins
{
  return self->_availableOrigins;
}

- (MRDNowPlayingServer)nowPlayingServer
{
  return self->_nowPlayingServer;
}

- (MRDRemoteControlServer)remoteControlServer
{
  return self->_remoteControlServer;
}

- (MRDAVRoutingServer)routingServer
{
  return self->_routingServer;
}

- (MRDTransactionServer)transactionServer
{
  return self->_transactionServer;
}

- (MRDExternalDeviceRemoteServer)externalDeviceServer
{
  return self->_externalDeviceServer;
}

- (BOOL)shouldSendCommandsDuringPhoneCall
{
  return self->_shouldSendCommandsDuringPhoneCall;
}

- (MRDGroupSessionServer)groupSessionServer
{
  return self->_groupSessionServer;
}

- (MRDUIServer)uiServer
{
  return self->_uiServer;
}

- (FBSDisplayLayoutMonitor)sharedDisplayMonitor
{
  return self->_sharedDisplayMonitor;
}

- (void).cxx_destruct
{
}

@end
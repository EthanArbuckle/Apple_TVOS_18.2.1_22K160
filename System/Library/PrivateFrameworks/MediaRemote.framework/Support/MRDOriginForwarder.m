@interface MRDOriginForwarder
+ (id)localizedPlayerIDFromPlayerPath:(id)a3;
+ (void)waitUntilForwardingOperationsHaveFinished:(id)a3;
- (MRClient)destinationClient;
- (MRDOriginForwarder)initWithOrigin:(id)a3 destinationOrigin:(id)a4;
- (MROrigin)destinationOrigin;
- (MROrigin)sourceOrigin;
- (id)createDelocalizedPlayerPath:(id)a3;
- (id)createLocalizedPlayerPath:(id)a3;
- (id)debugDescription;
- (void)_handleActiveApplicationDidChangeNotification:(id)a3;
- (void)_handleActivePlayerDidChangeNotification:(id)a3;
- (void)_handleApplicationClientStateDidChangeNotification:(id)a3;
- (void)_handleApplicationDidRegisterNotification:(id)a3;
- (void)_handleApplicationDidUnregisterNotification:(id)a3;
- (void)_handleParticipantsDidChangeNotification:(id)a3;
- (void)_handlePlaybackStateDidChangeNotification:(id)a3;
- (void)_handlePlayerDidRegisterCanBeNowPlayingNotification:(id)a3;
- (void)_handlePlayerDidRegisterNotification:(id)a3;
- (void)_handlePlayerDidUnregisterCanBeNowPlayingNotification:(id)a3;
- (void)_handlePlayerDidUnregisterNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueContentItemsDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3;
- (void)_handlePlayerStateDidChangeNotification:(id)a3;
- (void)_handleSupportedCommandsDidChangeNotification:(id)a3;
- (void)_handleVolumeCapabilitiesDidChangeNotification:(id)a3;
- (void)cleanupForwarding;
- (void)dealloc;
- (void)forwardParticipantDataSourceIfNeeded;
- (void)initializeDestinationOriginWithSourceOriginData;
- (void)registerDestinationOriginCallbacksToRelayToSourceOrigin;
- (void)registerSourceOriginNotifications;
@end

@implementation MRDOriginForwarder

- (MRDOriginForwarder)initWithOrigin:(id)a3 destinationOrigin:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDOriginForwarder;
  v9 = -[MRDOriginForwarder init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceOrigin, a3);
    objc_storeStrong((id *)&v10->_destinationOrigin, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[MRClient localClient](&OBJC_CLASS___MRClient, "localClient"));
    destinationClient = v10->_destinationClient;
    v10->_destinationClient = (MRClient *)v11;

    -[MRDOriginForwarder registerSourceOriginNotifications](v10, "registerSourceOriginNotifications");
    -[MRDOriginForwarder registerDestinationOriginCallbacksToRelayToSourceOrigin]( v10,  "registerDestinationOriginCallbacksToRelayToSourceOrigin");
    -[MRDOriginForwarder initializeDestinationOriginWithSourceOriginData]( v10,  "initializeDestinationOriginWithSourceOriginData");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 nowPlayingServer]);
    [v14 registerOriginForwarder:v10];
  }

  return v10;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  [v4 unregisterOriginForwarder:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDOriginForwarder;
  -[MRDOriginForwarder dealloc](&v5, "dealloc");
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@, %p: sourceOrigin: %@ - destinationOrigin: %@>",  v3,  self,  v4,  v5));

  return v6;
}

- (void)registerSourceOriginNotifications
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"_handleVolumeCapabilitiesDidChangeNotification:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handleApplicationDidRegisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidRegister object:0];
  [v5 addObserver:self selector:"_handleApplicationDidUnregisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidUnregister object:0];
  [v5 addObserver:self selector:"_handleApplicationClientStateDidChangeNotification:" name:kMRMediaRemoteApplicationClientStateDidChange object:0];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v4 = [v3 computeNowPlayingApplication];

  if ((v4 & 1) == 0) {
    [v5 addObserver:self selector:"_handleActiveApplicationDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification object:0];
  }
  [v5 addObserver:self selector:"_handlePlayerDidRegisterNotification:" name:kMRMediaRemoteNowPlayingPlayerDidRegister object:0];
  [v5 addObserver:self selector:"_handlePlayerDidUnregisterNotification:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];
  [v5 addObserver:self selector:"_handlePlayerDidRegisterCanBeNowPlayingNotification:" name:kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying object:0];
  [v5 addObserver:self selector:"_handlePlayerDidUnregisterCanBeNowPlayingNotification:" name:kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying object:0];
  [v5 addObserver:self selector:"_handlePlayerStateDidChangeNotification:" name:kMRMediaRemotePlayerStateDidChange object:0];
  [v5 addObserver:self selector:"_handleActivePlayerDidChangeNotification:" name:kMRMediaRemoteActivePlayerDidChange object:0];
  [v5 addObserver:self selector:"_handlePlaybackStateDidChangeNotification:" name:kMRMediaRemotePlayerPlaybackStateDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handleSupportedCommandsDidChangeNotification:" name:kMRMediaRemotePlayerSupportedCommandsDidChangeNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:" name:kMRPlaybackQueueCapabilitiesChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueDidChangeNotification:" name:kMRPlayerPlaybackQueueChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueContentItemsDidChangeNotification:" name:kMRPlayerPlaybackQueueContentItemsChangedNotification object:0];
  [v5 addObserver:self selector:"_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:" name:kMRPlayerPlaybackQueueContentItemArtworkChangedNotification object:0];
  [v5 addObserver:self selector:"_handleParticipantsDidChangeNotification:" name:MRPlaybackQueueParticipantsDidChangeForPlayerNotification object:0];
}

- (void)registerDestinationOriginCallbacksToRelayToSourceOrigin
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 originClientForOrigin:v4]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003A1E8;
  v20[3] = &unk_10039AE90;
  objc_copyWeak(&v21, &location);
  [v5 setCommandCallback:v20];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10003A434;
  v18[3] = &unk_10039AEE0;
  objc_copyWeak(&v19, &location);
  MRMediaRemotePlaybackQueueDataSourceSetRequestCallback(v6, v18);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10003A5E0;
  v16[3] = &unk_10039AEE0;
  objc_copyWeak(&v17, &location);
  MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin(v7, v16);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10003A78C;
  v14[3] = &unk_10039AF30;
  objc_copyWeak(&v15, &location);
  [v5 setPlaybackSessionMigrateRequestCallback:v14];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10003A968;
  v12[3] = &unk_10039AF58;
  objc_copyWeak(&v13, &location);
  MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin(v8, v12);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003AA64;
  v10[3] = &unk_10039AF80;
  objc_copyWeak(&v11, &location);
  MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin(v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (void)initializeDestinationOriginWithSourceOriginData
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  unsigned __int8 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ Initializing OriginForwarder",  buf,  0xCu);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 originClientForOrigin:v7]);

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v8 nowPlayingClients]);
  id v56 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v56)
  {
    uint64_t v54 = *(void *)v64;
    v55 = v8;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v64 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = v9;
        v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 client]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
        MRMediaRemoteSyncClientProperties(v11, v12, v13, 0LL, 0LL);

        __int128 v61 = 0u;
        __int128 v62 = 0u;
        __int128 v59 = 0u;
        __int128 v60 = 0u;
        v57 = v10;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClients]);
        id v15 = [v14 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v60;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v60 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v20));
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 player]);
              unsigned int v23 = [v22 hasAuxiliaryProperties];

              if (v23) {
                MRMediaRemoteSetPlayerProperties(v21, 0LL, 0LL);
              }
              uint64_t v24 = objc_claimAutoreleasedReturnValue([v19 supportedRemoteControlCommands]);
              v25 = (void *)v24;
              if (v24) {
                MRMediaRemoteSetSupportedCommandsForPlayer(v24, v21, 0LL, 0LL);
              }
              uint64_t v26 = objc_claimAutoreleasedReturnValue([v19 playbackQueue]);
              v27 = (void *)v26;
              if (v26) {
                MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer(v26, v21);
              }
              id v28 = [v19 playbackQueueCapabilities];
              if (v28) {
                MRMediaRemoteSetPlaybackQueueCapabilities(v21, v28, 0LL, 0LL);
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v59 objects:v67 count:16];
          }

          while (v16);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue([v57 activePlayerClient]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 playerPath]);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v30));

        v32 = (void *)objc_claimAutoreleasedReturnValue([v57 client]);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleIdentifier]);
        id v8 = v55;
        v34 = (void *)objc_claimAutoreleasedReturnValue([v55 defaultSupportedCommandsForClient:v33]);

        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue([v31 client]);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
          MRMediaRemoteSetDefaultSupportedCommandsForClient(v35, v36, v34, 0LL, 0LL);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue([v31 client]);
        unsigned int v38 = [v37 hasAuxiliaryProperties];

        if (v38)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v31 client]);
          v40 = (void *)objc_claimAutoreleasedReturnValue([v31 origin]);
          MRMediaRemoteSetClientProperties(v39, v40, 0LL, 0LL);
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue([v31 player]);

        if (v41) {
          MRMediaRemoteSetNowPlayingPlayer(v31, 0LL, 0LL);
        }

        uint64_t v9 = v58 + 1;
      }

      while ((id)(v58 + 1) != v56);
      id v56 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }

    while (v56);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerPath]);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v42));

  if ([v8 volumeControlCapabilities])
  {
    id v44 = [v8 volumeControlCapabilities];
    v45 = (void *)objc_claimAutoreleasedReturnValue([v43 origin]);
    MRMediaRemoteSetPickedRouteVolumeControlCapabilities(v44, v45, 0LL, 0LL);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v47 = [v46 computeNowPlayingApplication];

  if ((v47 & 1) == 0)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue([v43 client]);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
    MRMediaRemoteSetNowPlayingClientForOrigin(v48, v49, 0LL, 0LL);
  }

  -[MRDOriginForwarder forwardParticipantDataSourceIfNeeded](self, "forwardParticipantDataSourceIfNeeded");
  uint64_t v51 = _MRLogForCategory(0LL, v50);
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v70 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ End Initializing OriginForwarder",  buf,  0xCu);
  }
}

- (void)cleanupForwarding
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 originClientForOrigin:v5]);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v20 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 nowPlayingClients]);
  id v23 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v7;
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClients]);
        id v10 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
              id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 participantDataSource]);
              if (v16)
              {
                uint64_t v17 = _MRLogForCategory(0LL, v15);
                v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 playerPath]);
                  *(_DWORD *)buf = 138412546;
                  v34 = v16;
                  __int16 v35 = 2112;
                  v36 = v19;
                  _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] <participantDataSource> Removing participantDataSource instance %@ on playerPath: %@",  buf,  0x16u);
                }

                [v14 setParticipantDataSource:0];
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
          }

          while (v11);
        }

        uint64_t v7 = v24 + 1;
      }

      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    }

    while (v23);
  }
}

- (void)forwardParticipantDataSourceIfNeeded
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v39 = (void *)objc_claimAutoreleasedReturnValue([v3 nowPlayingServer]);
  unsigned int v38 = (void *)objc_claimAutoreleasedReturnValue([v3 daemonClient]);
  if (v38)
  {
    __int128 v30 = v3;
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nowPlayingServer]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 originClientForOrigin:v6]);

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v29 = v7;
    id obj = (id)objc_claimAutoreleasedReturnValue([v7 nowPlayingClients]);
    id v33 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (!v33) {
      goto LABEL_27;
    }
    uint64_t v32 = *(void *)v45;
    uint64_t v35 = MRPlaybackQueueParticipantsDidChangeForPlayerNotification;
    v36 = self;
    while (1)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v8;
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v43 = 0u;
        id v37 = (id)objc_claimAutoreleasedReturnValue([v9 playerClients]);
        id v10 = [v37 countByEnumeratingWithState:&v40 objects:v54 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v41;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v41 != v12) {
                objc_enumerationMutation(v37);
              }
              v14 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 participantDataSource]);
              if (v15)
              {
                id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 playerPath]);
                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDOriginForwarder createLocalizedPlayerPath:]( self,  "createLocalizedPlayerPath:",  v16));
                v18 = (void *)objc_claimAutoreleasedReturnValue([v39 queryPlayerPath:v17 forClient:v38]);
                id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClient]);
                id v21 = v19;
                if (v19)
                {
                  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 participantDataSource]);

                  if (v22 != v15)
                  {
                    uint64_t v24 = _MRLogForCategory(0LL, v23);
                    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412802;
                      v49 = v15;
                      __int16 v50 = 2112;
                      uint64_t v51 = v16;
                      __int16 v52 = 2112;
                      v53 = v17;
                      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] <participantDataSource> Installing instance %@ from playerPath: %@ on playerPath: %@",  buf,  0x20u);
                    }

                    [v21 setParticipantDataSource:v15];
                    __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                    MRAddPlayerPathToUserInfo();
                    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
                    [v27 postClientNotificationNamed:v35 userInfo:v26];
LABEL_20:

                    self = v36;
                    goto LABEL_21;
                  }
                }

                else
                {
                  uint64_t v28 = _MRLogForCategory(0LL, v20);
                  __int128 v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v28);
                  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
                  {
                    __int128 v27 = (void *)MRMediaRemoteErrorCopyDescription([v18 error]);
                    *(_DWORD *)buf = 138412546;
                    v49 = v17;
                    __int16 v50 = 2112;
                    uint64_t v51 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v26,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] <participantDataSource> Player client not found for %@, because %@",  buf,  0x16u);
                    goto LABEL_20;
                  }

- (void)_handleVolumeCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v22 = 138412546;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        __int128 v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kMRAVEndpointVolumeControlCapabilitiesUserInfoKey]);

    id v19 = [v18 intValue];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 origin]);
    MRMediaRemoteSetPickedRouteVolumeControlCapabilities(v19, v21, 0LL, 0LL);
  }
}

- (void)_handleApplicationDidRegisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v26 = 138412546;
        __int128 v27 = self;
        __int16 v28 = 2112;
        __int128 v29 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v26,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 client]);

    if (v22)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 client]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v20 origin]);
      MRMediaRemoteSetClientProperties(v24, v25, 0LL, 0LL);
    }
  }
}

- (void)_handleApplicationDidUnregisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v20 = 138412546;
        id v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 client]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 origin]);
    MRMediaRemoteRemoveClientForOrigin(v18, v19, 0LL, 0LL);
  }
}

- (void)_handleApplicationClientStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v25 = 138412546;
        int v26 = self;
        __int16 v27 = 2112;
        __int16 v28 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v25,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v20));

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 client]);
    if (v22)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 client]);
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v21 origin]);
      MRMediaRemoteSetClientProperties(v23, v24, 0LL, 0LL);
    }
  }
}

- (void)_handleActiveApplicationDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v20 = 138412546;
        id v21 = self;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 client]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
    MRMediaRemoteSetNowPlayingClientForOrigin(v18, v19, 0LL, 0LL);
  }
}

- (void)_handlePlayerDidRegisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v17 = 138412546;
        v18 = self;
        __int16 v19 = 2112;
        int v20 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v17,  0x16u);
      }
    }

    -[MRDOriginForwarder forwardParticipantDataSourceIfNeeded](self, "forwardParticipantDataSourceIfNeeded");
  }
}

- (void)_handlePlayerDidUnregisterNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemoteRemovePlayer(v17, 0LL, 0LL);
  }
}

- (void)_handlePlayerDidRegisterCanBeNowPlayingNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemoteSetCanBeNowPlayingForPlayer(v17, 1LL);
  }
}

- (void)_handlePlayerDidUnregisterCanBeNowPlayingNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemoteSetCanBeNowPlayingForPlayer(v17, 0LL);
  }
}

- (void)_handlePlayerStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v23 = 138412546;
        __int16 v24 = self;
        __int16 v25 = 2112;
        int v26 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v23,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v20));

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 player]);
    if (v22) {
      MRMediaRemoteSetPlayerProperties(v21, 0LL, 0LL);
    }
  }
}

- (void)_handleActivePlayerDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v18,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemoteSetNowPlayingPlayer(v17, 0LL, 0LL);
  }
}

- (void)_handlePlaybackStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v21 = 138412546;
        __int16 v22 = self;
        __int16 v23 = 2112;
        __int16 v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v21,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kMRMediaRemotePlaybackStateUserInfoKey]);
    id v19 = [v18 intValue];

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemoteSetPlaybackStateForPlayer(v20, v19, 0LL, 0LL);
  }
}

- (void)_handleSupportedCommandsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v23 = 138412546;
        __int16 v24 = self;
        __int16 v25 = 2112;
        int v26 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v23,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 playerClient]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 supportedRemoteControlCommands]);
    MRMediaRemoteSetSupportedCommandsForPlayer(v22, v20, 0LL, 0LL);
  }
}

- (void)_handlePlayerPlaybackQueueCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v22 = 138412546;
        int v23 = self;
        __int16 v24 = 2112;
        __int16 v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 playerClient]);
    MRMediaRemoteSetPlaybackQueueCapabilities(v20, [v21 playbackQueueCapabilities], 0, 0);
  }
}

- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v23 = 138412546;
        __int16 v24 = self;
        __int16 v25 = 2112;
        int v26 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v23,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 nowPlayingServer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 queryExistingPlayerPath:v7]);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 playerClient]);
    int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 playbackQueue]);
    MRMediaRemotePlaybackQueueDataSourceInvalidateWithPlaybackQueueForPlayer(v22, v20);
  }
}

- (void)_handlePlayerPlaybackQueueContentItemsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v21 = 138412546;
        int v22 = self;
        __int16 v23 = 2112;
        __int16 v24 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v21,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v18 = MRGetContentItemsFromUserInfo();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer(v19, v20);
  }
}

- (void)_handlePlayerPlaybackQueueContentItemArtworkDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v22 = 138412546;
        __int16 v23 = self;
        __int16 v24 = 2112;
        __int16 v25 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v18 = MRGetContentItemsFromUserInfo();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    __int16 v20 = objc_alloc_init(&OBJC_CLASS___MRPlaybackQueueRequest);
    -[MRPlaybackQueueRequest setArtworkHeight:](v20, "setArtworkHeight:", 1.0);
    -[MRPlaybackQueueRequest setArtworkWidth:](v20, "setArtworkWidth:", 1.0);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer(v19, v20, v21);
  }
}

- (void)_handleParticipantsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v12 = [v11 verboseOriginForwarderLogging];

    if (v12)
    {
      uint64_t v14 = _MRLogForCategory(0LL, v13);
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        int v20 = 138412546;
        int v21 = self;
        __int16 v22 = 2112;
        __int16 v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDOriginForwarder] %@ forwarding %@",  (uint8_t *)&v20,  0x16u);
      }
    }

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder createLocalizedPlayerPath:](self, "createLocalizedPlayerPath:", v7));
    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    MRAddPlayerPathToUserInfo();
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v19 postClientNotificationNamed:MRPlaybackQueueParticipantsDidChangeForPlayerNotification userInfo:v18];
  }
}

- (id)createDelocalizedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder sourceOrigin](self, "sourceOrigin"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);

  uint64_t v9 = -[MRPlayerPath initWithOrigin:client:player:](v5, "initWithOrigin:client:player:", v6, v7, v8);
  return v9;
}

- (id)createLocalizedPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOriginForwarder destinationOrigin](self, "destinationOrigin"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);

  uint64_t v9 = -[MRPlayerPath initWithOrigin:client:player:](v5, "initWithOrigin:client:player:", v6, v7, v8);
  return v9;
}

+ (id)localizedPlayerIDFromPlayerPath:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___NSString);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 player]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);

  unsigned int v10 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@-%@-%d",  v6,  v8,  [v9 processIdentifier]);
  return v10;
}

+ (void)waitUntilForwardingOperationsHaveFinished:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003DA90;
  v6[3] = &unk_10039AFD0;
  id v7 = v3;
  id v5 = v3;
  [v4 postClientNotificationNamed:@"placeholder" predicate:v6];
}

- (MROrigin)sourceOrigin
{
  return self->_sourceOrigin;
}

- (MROrigin)destinationOrigin
{
  return self->_destinationOrigin;
}

- (MRClient)destinationClient
{
  return self->_destinationClient;
}

- (void).cxx_destruct
{
}

@end
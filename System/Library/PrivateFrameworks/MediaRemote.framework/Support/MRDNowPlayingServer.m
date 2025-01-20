@interface MRDNowPlayingServer
- (BOOL)_hasForwarderForOrigin:(id)a3;
- (BOOL)activePlayerIsPlaying;
- (BOOL)hasElectedPlayer;
- (BOOL)localActivePlayerIsPlaying;
- (BOOL)lockScreenPlatterActive;
- (BOOL)lockScreenRecommendationActive;
- (BOOL)nowPlayingLauncher:(id)a3 shouldRelaunch:(id)a4;
- (MRDElectedPlayerController)electedPlayerController;
- (MRDLockScreenController)lockScreenController;
- (MRDLockScreenRoutingControllerProtocol)lockScreenRoutingController;
- (MRDNowPlayingClient)activeNowPlayingClient;
- (MRDNowPlayingClient)localActiveNowPlayingClient;
- (MRDNowPlayingLauncher)nowPlayingCapLauncher;
- (MRDNowPlayingOriginClient)activeOriginClient;
- (MRDNowPlayingOriginClient)companionOriginClient;
- (MRDNowPlayingOriginClient)localOriginClient;
- (MRDNowPlayingPlayerClient)activePlayerClient;
- (MRDNowPlayingPlayerClient)localActivePlayerClient;
- (MRDNowPlayingServer)init;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)localActivePlayerPath;
- (NSArray)originClients;
- (NSSet)allLocalNowPlayingInfoClients;
- (NSSet)allNowPlayingInfoClients;
- (NSString)activeClientBundleIdentifier;
- (NSString)localActiveClientBundleIdentifier;
- (id)_createLockScreenRoutingController;
- (id)_onQueue_activeOriginClient;
- (id)_onQueue_allNowPlayingInfoClients;
- (id)_onQueue_allNowPlayingInfoClientsForOrigin:(id)a3;
- (id)_onQueue_companionOriginClient;
- (id)_onQueue_originClientForDeviceUID:(id)a3;
- (id)_onQueue_originClientForGroupLeaderOfDeviceUID:(id)a3;
- (id)_onQueue_originClientForOrigin:(id)a3;
- (id)_onQueue_queryExistingPlayerPath:(id)a3;
- (id)_onQueue_restoredActiveOrigin;
- (id)augmentedUserInfoForPlayerPath:(id)a3;
- (id)localPlayersForXpcClient:(id)a3;
- (id)onQueue_resolveExistingPlayerPath:(id)a3;
- (id)originClientForDeviceUID:(id)a3;
- (id)originClientForGroupLeaderOfDeviceUID:(id)a3;
- (id)originClientForOrigin:(id)a3;
- (id)overrideClient;
- (id)queryExistingPlayerPath:(id)a3;
- (id)queryExistingPlayerPathForXPCMessage:(id)a3 forClient:(id)a4;
- (id)queryPlayerPath:(id)a3 forClient:(id)a4;
- (id)queryPlayerPathForXPCMessage:(id)a3 fromClient:(id)a4;
- (id)resolveExistingPlayerPath:(id)a3;
- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4;
- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4 useDefaultPlayerIfNoneSpecified:(BOOL)a5;
- (id)xpcClientForPlayerPath:(id)a3;
- (int)activeClientPID;
- (int)localActiveClientPID;
- (unsigned)activePlayerPlaybackState;
- (unsigned)localActivePlayerPlaybackState;
- (void)_addOrigin:(id)a3 withDeviceInfo:(id)a4 emitNotification:(BOOL)a5;
- (void)_handleBeginApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleBeginMusicHandoffSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleContentItemArtworkChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleContentItemChangedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleEndApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleFetchPlaybackQueueParticipantsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetActiveOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetActivePlayerPathsForLocalOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAnyAppIsPlayingMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetApplicationActivityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAudioFormatContentInfoForOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetAvailableOriginsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetDeviceInfo:(id)a3 fromClient:(id)a4;
- (void)_handleGetElectedPlayerPathMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetImageDimensionsForArtworkDataMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetLastPlayingDateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingClientsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetNowPlayingPlayersMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlaybackStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionRequest:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterForWakingNowPlayingNotifications:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRemoveNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestAudioAmplitudeSamplesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4;
- (void)_handleRequestVideoThumbnailsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleResetPlaybackQueueRequests:(id)a3 fromClient:(id)a4;
- (void)_handleResolvePlayerPath:(id)a3 fromClient:(id)a4;
- (void)_handleSendLyricsEvent:(id)a3 fromClient:(id)a4;
- (void)_handleSendMusicHandoffEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetActiveOriginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetCanBeNowPlayingAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetCanBeNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetHardwareRemoteBehaviorMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingAppOverrideMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingClientMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetOriginClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetOverriddenNowPlayingAppMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackQueue:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlaybackStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSupportedCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateClientPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdatePlayerPropertiesMessage:(id)a3 fromClient:(id)a4;
- (void)_onQueue_savePersistentActiveOrigin:(id)a3;
- (void)_onQueue_setActiveOrigin:(id)a3 saveState:(BOOL)a4;
- (void)_removeNowPlayingClient:(id)a3 forOrigin:(id)a4;
- (void)_removeOrigin:(id)a3;
- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 completion:(id)a5;
- (void)clearNowPlayingClientForXPCClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)electedPlayerController:(id)a3 electedPlayerDidChange:(id)a4 change:(int64_t)a5 event:(int64_t)a6 reason:(id)a7;
- (void)handleNowPlayingOriginClient:(id)a3 deviceInfoDidChange:(id)a4 previousDeviceInfo:(id)a5;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)lockScreenController:(id)a3 lockScreenWidgetActiveDidChange:(BOOL)a4;
- (void)lockScreenController:(id)a3 lockScreenWidgetVisibleDidChange:(BOOL)a4;
- (void)lockScreenController:(id)a3 playerPathDidChange:(id)a4;
- (void)maybePostDistributedNotifications;
- (void)nowPlayingClient:(id)a3 activePlayerDidChangeFromPlayerClient:(id)a4 toPlayerClient:(id)a5;
- (void)nowPlayingClient:(id)a3 applicationDidForeground:(BOOL)a4;
- (void)nowPlayingClient:(id)a3 clientStateDidChange:(id)a4;
- (void)nowPlayingClient:(id)a3 playerDidRegister:(id)a4;
- (void)nowPlayingClient:(id)a3 playerDidUnregister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 activePlayerClientsDidChange:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 activePlayerPathDidChange:(id)a4 withPlaybackState:(unsigned int)a5;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidBegin:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidEnd:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 applicationActivityStatusDidChange:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 clientDidRegister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 clientDidUnregister:(id)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteIsMutedDidChange:(BOOL)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeControlCapabilitiesDidChange:(unsigned int)a4;
- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeDidChange:(float)a4;
- (void)nowPlayingOriginClientDidChangeAudioFormatContentInfo:(id)a3;
- (void)nowPlayingOriginClientPlaybackDidTimeout:(id)a3;
- (void)nowPlayingPlayerClient:(id)a3 clientCanBeNowPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 isPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 pictureInPictureEnabledDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueArtworkContentItemsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueCapabilitiesDidChange:(unint64_t)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueContentItemsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueDidChange:(id)a4 nowPlayingItemDidChange:(BOOL)a5;
- (void)nowPlayingPlayerClient:(id)a3 playbackQueueParticipantsDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 playbackStateDidChange:(unsigned int)a4;
- (void)nowPlayingPlayerClient:(id)a3 playerCanBeNowPlayingDidChange:(BOOL)a4;
- (void)nowPlayingPlayerClient:(id)a3 playerStateDidChange:(id)a4;
- (void)nowPlayingPlayerClient:(id)a3 supportedCommandsDidChange:(id)a4;
- (void)nowPlayingServer:(id)a3 activeOriginDidChangeFromOriginClient:(id)a4 toOriginClient:(id)a5;
- (void)postActiveOriginDidChange:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postActivePlayerDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postActivePlayerPathsDidChangeForOrigin:(id)a3 handler:(id)a4;
- (void)postAudioFormatContentInfoDidChangeForOrigin:(id)a3 handler:(id)a4;
- (void)postClientDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidRegisterForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postClientDidUnregisterForPlayerPath:(id)a3 hasDefaultSupportedCommands:(BOOL)a4 canBeNowPlaying:(BOOL)a5 handler:(id)a6;
- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4;
- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5;
- (void)postDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 forOrigin:(id)a5 handler:(id)a6;
- (void)postElectedPlayerDidChange:(id)a3 change:(int64_t)a4 event:(int64_t)a5 reason:(id)a6 handler:(id)a7;
- (void)postIsMutedDidChange:(id)a3 isMuted:(BOOL)a4 handler:(id)a5;
- (void)postIsPlayingDidChange:(BOOL)a3 lastPlayingTimestamp:(double)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postLockScreenActiveDidChange:(BOOL)a3 handler:(id)a4;
- (void)postLockScreenControlsDidChangeDistributedNotification;
- (void)postLockScreenPlayerPathDidChange:(id)a3 handler:(id)a4;
- (void)postLockScreenVisibleDidChange:(BOOL)a3 handler:(id)a4;
- (void)postNowPlayingApplicationDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5;
- (void)postNowPlayingClientStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postNowPlayingPlayerStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postOriginDidRegister:(id)a3 handler:(id)a4;
- (void)postOriginDidUnRegister:(id)a3 deviceInfo:(id)a4 handler:(id)a5;
- (void)postPictureInPictureDidChange:(BOOL)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueCapabilitiesDidChange:(unint64_t)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueContentItemsArtworkDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueContentItemsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackQueueDidChange:(id)a3 nowPlayingItemDidChange:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postPlaybackQueueParticipantsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlaybackStateDidChange:(unsigned int)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postPlayerDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidRegisterForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4;
- (void)postPlayerDidUnregisterWithPlaybackState:(unsigned int)a3 canBeNowPlaying:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6;
- (void)postSupportedCommandsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5;
- (void)postVolumeCapabilitiesDidChange:(id)a3 capabilities:(unsigned int)a4 handler:(id)a5;
- (void)postVolumeDidChange:(id)a3 volume:(float)a4 handler:(id)a5;
- (void)registerOrigin:(id)a3 deviceInfo:(id)a4;
- (void)registerOriginForwarder:(id)a3;
- (void)reregisterOrigin:(id)a3 deviceInfo:(id)a4;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)restoreDeviceInfoToClient:(id)a3 handler:(id)a4;
- (void)setActiveOrigin:(id)a3;
- (void)setActiveOriginClient:(id)a3;
- (void)setLocalOriginClient:(id)a3;
- (void)setNowPlayingCapLauncher:(id)a3;
- (void)setOverrideClient:(id)a3;
- (void)startObservingNowPlayingInfoForNowPlayingPlayerClient:(id)a3;
- (void)stopObservingNowPlayingInfo;
- (void)unregisterOrigin:(id)a3;
- (void)unregisterOriginForwarder:(id)a3;
- (void)updateDeviceInfo:(id)a3 origin:(id)a4;
- (void)wakeDeviceIfNecessaryForNowPlayingPlayerClient:(id)a3;
@end

@implementation MRDNowPlayingServer

- (MRDNowPlayingServer)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MRDNowPlayingServer;
  v2 = -[MRDNowPlayingServer init](&v35, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    id v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = (const char *)[v6 UTF8String];
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaremote.MRDNowPlayingServer.nowPlayingInfoObserverQueue", v13);
    nowPlayingInfoObserverQueue = v3->_nowPlayingInfoObserverQueue;
    v3->_nowPlayingInfoObserverQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___MRDDeviceInfoDataSource);
    deviceInfoDataSource = v3->_deviceInfoDataSource;
    v3->_deviceInfoDataSource = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDDeviceInfoDataSource deviceInfo](v3->_deviceInfoDataSource, "deviceInfo"));
    -[MRDNowPlayingServer _addOrigin:withDeviceInfo:emitNotification:]( v3,  "_addOrigin:withDeviceInfo:emitNotification:",  v18,  v19,  0LL);

    v20 = objc_alloc_init(&OBJC_CLASS___MRDNowPlayingPlaybackQueueServer);
    playbackQueueServer = v3->_playbackQueueServer;
    v3->_playbackQueueServer = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    LODWORD(v19) = [v22 takelockScreenAssertion];

    if ((_DWORD)v19)
    {
      v23 = objc_alloc_init(&OBJC_CLASS___MRDLockScreenController);
      lockScreenController = v3->_lockScreenController;
      v3->_lockScreenController = v23;

      -[MRDLockScreenController setDelegate:](v3->_lockScreenController, "setDelegate:", v3);
      uint64_t v25 = objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer _createLockScreenRoutingController](v3, "_createLockScreenRoutingController"));
      lockScreenRoutingController = v3->_lockScreenRoutingController;
      v3->_lockScreenRoutingController = (MRDLockScreenRoutingControllerProtocol *)v25;

      -[MRDLockScreenRoutingControllerProtocol setDataSource:](v3->_lockScreenRoutingController, "setDataSource:", v3);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned int v28 = [v27 supportElectedPlayer];

    if (v28)
    {
      v30 = -[MRDElectedPlayerController initWithOriginClient:]( objc_alloc(&OBJC_CLASS___MRDElectedPlayerController),  "initWithOriginClient:",  v3->_localOriginClient);
      electedPlayerController = v3->_electedPlayerController;
      v3->_electedPlayerController = v30;

      id v29 = -[MRDElectedPlayerController setDelegate:](v3->_electedPlayerController, "setDelegate:", v3);
    }

    if (MSVDeviceIsAudioAccessory(v29))
    {
      v32 = -[MRDNowPlayingLauncher initWithBundleIdentifier:options:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingLauncher),  "initWithBundleIdentifier:options:",  @"com.apple.NowPlayingCap",  1LL);
      nowPlayingCapLauncher = v3->_nowPlayingCapLauncher;
      v3->_nowPlayingCapLauncher = v32;

      -[MRDNowPlayingLauncher setDelegate:](v3->_nowPlayingCapLauncher, "setDelegate:", v3);
    }
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDNowPlayingServer;
  -[MRDNowPlayingServer dealloc](&v4, "dealloc");
}

- (id)_createLockScreenRoutingController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned int v3 = [v2 supportRouteRecommendations];

  objc_super v4 = off_100397338;
  if (!v3) {
    objc_super v4 = &off_100397348;
  }
  return objc_alloc_init(*v4);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_MESSAGE_ID_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218498;
    uint64_t v16 = uint64;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Received Now Playing message %llu from client %@ : %@",  (uint8_t *)&v15,  0x20u);
  }

  switch(uint64)
  {
    case 0x200000000000001uLL:
      -[MRDNowPlayingServer _handleSetNowPlayingAppOverrideMessage:fromClient:]( self,  "_handleSetNowPlayingAppOverrideMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000002uLL:
      -[MRDNowPlayingServer _handleSetOverriddenNowPlayingAppMessage:fromClient:]( self,  "_handleSetOverriddenNowPlayingAppMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000003uLL:
      -[MRDNowPlayingServer _handleBeginApplicationActivityMessage:fromClient:]( self,  "_handleBeginApplicationActivityMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000004uLL:
      -[MRDNowPlayingServer _handleGetApplicationActivityMessage:fromClient:]( self,  "_handleGetApplicationActivityMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000005uLL:
      -[MRDNowPlayingServer _handleEndApplicationActivityMessage:fromClient:]( self,  "_handleEndApplicationActivityMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000006uLL:
      -[MRDNowPlayingServer _handleSetCanBeNowPlayingAppMessage:fromClient:]( self,  "_handleSetCanBeNowPlayingAppMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000007uLL:
      -[MRDNowPlayingPlaybackQueueServer handlePlaybackQueueRequest:fromClient:]( self->_playbackQueueServer,  "handlePlaybackQueueRequest:fromClient:",  v6,  v7);
      break;
    case 0x200000000000008uLL:
      -[MRDNowPlayingServer _handleSetPlaybackQueue:fromClient:](self, "_handleSetPlaybackQueue:fromClient:", v6, v7);
      break;
    case 0x200000000000009uLL:
      -[MRDNowPlayingServer _handleRequestPlaybackQueueCapabilities:fromClient:]( self,  "_handleRequestPlaybackQueueCapabilities:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000AuLL:
      -[MRDNowPlayingServer _handleSetPlaybackQueueCapabilities:fromClient:]( self,  "_handleSetPlaybackQueueCapabilities:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000BuLL:
      -[MRDNowPlayingServer _handleResetPlaybackQueueRequests:fromClient:]( self,  "_handleResetPlaybackQueueRequests:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000CuLL:
      -[MRDNowPlayingServer _handleGetClientPropertiesMessage:fromClient:]( self,  "_handleGetClientPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000DuLL:
      -[MRDNowPlayingServer _handleSetClientPropertiesMessage:fromClient:]( self,  "_handleSetClientPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000EuLL:
      -[MRDNowPlayingServer _handleUpdateClientPropertiesMessage:fromClient:]( self,  "_handleUpdateClientPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000000FuLL:
      -[MRDNowPlayingServer _handleGetPlayerPropertiesMessage:fromClient:]( self,  "_handleGetPlayerPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000010uLL:
      -[MRDNowPlayingServer _handleSetPlayerPropertiesMessage:fromClient:]( self,  "_handleSetPlayerPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000011uLL:
      -[MRDNowPlayingServer _handleUpdatePlayerPropertiesMessage:fromClient:]( self,  "_handleUpdatePlayerPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000012uLL:
      -[MRDNowPlayingServer _handleGetPlaybackStateMessage:fromClient:]( self,  "_handleGetPlaybackStateMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000013uLL:
      -[MRDNowPlayingServer _handleSetPlaybackStateMessage:fromClient:]( self,  "_handleSetPlaybackStateMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000014uLL:
      -[MRDNowPlayingServer _handleGetAnyAppIsPlayingMessage:fromClient:]( self,  "_handleGetAnyAppIsPlayingMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000015uLL:
      -[MRDNowPlayingServer _handleRequestVideoThumbnailsMessage:fromClient:]( self,  "_handleRequestVideoThumbnailsMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000016uLL:
      -[MRDNowPlayingServer _handleRequestAudioAmplitudeSamplesMessage:fromClient:]( self,  "_handleRequestAudioAmplitudeSamplesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000017uLL:
      -[MRDNowPlayingServer _handleSendLyricsEvent:fromClient:](self, "_handleSendLyricsEvent:fromClient:", v6, v7);
      break;
    case 0x200000000000018uLL:
      -[MRDNowPlayingServer _handleResolvePlayerPath:fromClient:](self, "_handleResolvePlayerPath:fromClient:", v6, v7);
      break;
    case 0x200000000000019uLL:
      -[MRDNowPlayingServer _handleGetAvailableOriginsMessage:fromClient:]( self,  "_handleGetAvailableOriginsMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000001AuLL:
      -[MRDNowPlayingServer _handleSetActiveOriginMessage:fromClient:]( self,  "_handleSetActiveOriginMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000001BuLL:
      -[MRDNowPlayingServer _handleGetActiveOriginMessage:fromClient:]( self,  "_handleGetActiveOriginMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000001FuLL:
      -[MRDNowPlayingServer _handleGetNowPlayingClientsMessage:fromClient:]( self,  "_handleGetNowPlayingClientsMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000020uLL:
      -[MRDNowPlayingServer _handleSetNowPlayingClientMessage:fromClient:]( self,  "_handleSetNowPlayingClientMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000021uLL:
      -[MRDNowPlayingServer _handleGetNowPlayingClientMessage:fromClient:]( self,  "_handleGetNowPlayingClientMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000022uLL:
      -[MRDNowPlayingServer _handleRemoveNowPlayingClientMessage:fromClient:]( self,  "_handleRemoveNowPlayingClientMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000023uLL:
      -[MRDNowPlayingServer _handleGetNowPlayingPlayersMessage:fromClient:]( self,  "_handleGetNowPlayingPlayersMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000024uLL:
      -[MRDNowPlayingServer _handleSetNowPlayingPlayerMessage:fromClient:]( self,  "_handleSetNowPlayingPlayerMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000025uLL:
      -[MRDNowPlayingServer _handleGetNowPlayingPlayerMessage:fromClient:]( self,  "_handleGetNowPlayingPlayerMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000026uLL:
      -[MRDNowPlayingServer _handleRemoveNowPlayingPlayerMessage:fromClient:]( self,  "_handleRemoveNowPlayingPlayerMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000027uLL:
      -[MRDNowPlayingServer _handleGetActivePlayerPathsForLocalOriginMessage:fromClient:]( self,  "_handleGetActivePlayerPathsForLocalOriginMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000029uLL:
      -[MRDNowPlayingServer _handleSetHardwareRemoteBehaviorMessage:fromClient:]( self,  "_handleSetHardwareRemoteBehaviorMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000002AuLL:
      -[MRDNowPlayingServer _handleContentItemArtworkChangedMessage:fromClient:]( self,  "_handleContentItemArtworkChangedMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000002BuLL:
      -[MRDNowPlayingServer _handleContentItemChangedMessage:fromClient:]( self,  "_handleContentItemChangedMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000002CuLL:
      -[MRDNowPlayingServer _handleGetDeviceInfo:fromClient:](self, "_handleGetDeviceInfo:fromClient:", v6, v7);
      break;
    case 0x20000000000002EuLL:
      -[MRDNowPlayingServer _handleGetElectedPlayerPathMessage:fromClient:]( self,  "_handleGetElectedPlayerPathMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000002FuLL:
      -[MRDNowPlayingServer _handlePlaybackSessionRequest:fromClient:]( self,  "_handlePlaybackSessionRequest:fromClient:",  v6,  v7);
      break;
    case 0x200000000000030uLL:
      -[MRDNowPlayingServer _handleGetSupportedCommandsMessage:fromClient:]( self,  "_handleGetSupportedCommandsMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000031uLL:
      -[MRDNowPlayingServer _handleSetSupportedCommandsMessage:fromClient:]( self,  "_handleSetSupportedCommandsMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000032uLL:
      -[MRDNowPlayingServer _handleSetDefaultSupportedCommandsMessage:fromClient:]( self,  "_handleSetDefaultSupportedCommandsMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000033uLL:
      -[MRDNowPlayingServer _handleGetPlayerPictureInPictureEnabledMessage:fromClient:]( self,  "_handleGetPlayerPictureInPictureEnabledMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000034uLL:
      -[MRDNowPlayingServer _handleSetPlayerPictureInPictureEnabledMessage:fromClient:]( self,  "_handleSetPlayerPictureInPictureEnabledMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000035uLL:
      -[MRDNowPlayingServer _handleGetLastPlayingDateMessage:fromClient:]( self,  "_handleGetLastPlayingDateMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000036uLL:
      -[MRDNowPlayingServer _handleSetOriginClientPropertiesMessage:fromClient:]( self,  "_handleSetOriginClientPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000037uLL:
      -[MRDNowPlayingServer _handleSetPlayerClientPropertiesMessage:fromClient:]( self,  "_handleSetPlayerClientPropertiesMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000038uLL:
      -[MRDNowPlayingServer _handleSetCanBeNowPlayingPlayerMessage:fromClient:]( self,  "_handleSetCanBeNowPlayingPlayerMessage:fromClient:",  v6,  v7);
      break;
    case 0x200000000000039uLL:
      -[MRDNowPlayingServer _handleRegisterForWakingNowPlayingNotifications:fromClient:]( self,  "_handleRegisterForWakingNowPlayingNotifications:fromClient:",  v6,  v7);
      break;
    case 0x20000000000003AuLL:
      -[MRDNowPlayingServer _handleGetAudioFormatContentInfoForOriginMessage:fromClient:]( self,  "_handleGetAudioFormatContentInfoForOriginMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000003BuLL:
      -[MRDNowPlayingServer _handleGetImageDimensionsForArtworkDataMessage:fromClient:]( self,  "_handleGetImageDimensionsForArtworkDataMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000003CuLL:
      -[MRDNowPlayingServer _handleFetchPlaybackQueueParticipantsMessage:fromClient:]( self,  "_handleFetchPlaybackQueueParticipantsMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000003DuLL:
      -[MRDNowPlayingServer _handleBeginMusicHandoffSessionMessage:fromClient:]( self,  "_handleBeginMusicHandoffSessionMessage:fromClient:",  v6,  v7);
      break;
    case 0x20000000000003EuLL:
      -[MRDNowPlayingServer _handleSendMusicHandoffEventMessage:fromClient:]( self,  "_handleSendMusicHandoffEventMessage:fromClient:",  v6,  v7);
      break;
    default:
      uint64_t v13 = _MRLogForCategory(0LL, v12);
      dispatch_queue_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        uint64_t v16 = uint64;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Now Playing message with id %llu not handled.",  (uint8_t *)&v15,  0xCu);
      }

      break;
  }
}

- (int)activeClientPID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  int v5 = [v4 processIdentifier];

  return v5;
}

- (int)localActiveClientPID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  int v5 = [v4 processIdentifier];

  return v5;
}

- (NSString)activeClientBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  return (NSString *)v5;
}

- (NSString)localActiveClientBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 client]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);

  return (NSString *)v5;
}

- (BOOL)activePlayerIsPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);
  unsigned __int8 v5 = [v4 isPlaying];

  return v5;
}

- (BOOL)localActivePlayerIsPlaying
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);
  unsigned __int8 v5 = [v4 isPlaying];

  return v5;
}

- (unsigned)activePlayerPlaybackState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);
  unsigned int v5 = [v4 playbackState];

  return v5;
}

- (unsigned)localActivePlayerPlaybackState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);
  unsigned int v5 = [v4 playbackState];

  return v5;
}

- (MRDNowPlayingPlayerClient)activePlayerClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);

  return (MRDNowPlayingPlayerClient *)v4;
}

- (MRDNowPlayingPlayerClient)localActivePlayerClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activePlayerClient]);

  return (MRDNowPlayingPlayerClient *)v4;
}

- (MRDNowPlayingClient)activeNowPlayingClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);

  return (MRDNowPlayingClient *)v3;
}

- (MRDNowPlayingClient)localActiveNowPlayingClient
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activeNowPlayingClient]);

  return (MRDNowPlayingClient *)v3;
}

- (MRDNowPlayingOriginClient)localOriginClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000CCF10;
  uint64_t v10 = sub_1000CCF20;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CCF28;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDNowPlayingOriginClient *)v3;
}

- (MRDNowPlayingOriginClient)activeOriginClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000CCF10;
  uint64_t v10 = sub_1000CCF20;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CD008;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDNowPlayingOriginClient *)v3;
}

- (MRDNowPlayingOriginClient)companionOriginClient
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = sub_1000CCF10;
  uint64_t v10 = sub_1000CCF20;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CD10C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDNowPlayingOriginClient *)v3;
}

- (id)_onQueue_activeOriginClient
{
  id v3 = self->_activeOriginClient;
  if (!v3) {
    id v3 = self->_localOriginClient;
  }
  return v3;
}

- (id)_onQueue_companionOriginClient
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = self->_originClients;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin", (void)v11));
        unsigned int v9 = [v8 identifier];

        if (v9 == 1129140302)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v4) {
        continue;
      }
      break;
    }
  }

- (MRPlayerPath)activePlayerPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePlayerPath]);

  return (MRPlayerPath *)v3;
}

- (MRPlayerPath)localActivePlayerPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePlayerPath]);

  return (MRPlayerPath *)v3;
}

- (NSSet)allNowPlayingInfoClients
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  unsigned int v9 = sub_1000CCF10;
  uint64_t v10 = sub_1000CCF20;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CD3F4;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)_onQueue_allNowPlayingInfoClients
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = self->_originClients;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)i) nowPlayingClients]);
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)j);
            }

            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }

          while (v11);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (NSSet)allLocalNowPlayingInfoClients
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  unsigned int v9 = sub_1000CCF10;
  id v10 = sub_1000CCF20;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000CD6AC;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (id)_onQueue_allNowPlayingInfoClientsForOrigin:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serialQueue);
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer _onQueue_originClientForOrigin:](self, "_onQueue_originClientForOrigin:", v5));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClients]);
  -[NSMutableSet addObjectsFromArray:](v6, "addObjectsFromArray:", v8);

  return v6;
}

- (NSArray)originClients
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_1000CCF10;
  id v11 = sub_1000CCF20;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000CD844;
  v6[3] = &unk_100398EC8;
  v6[4] = self;
  v6[5] = &v7;
  msv_dispatch_sync_on_queue(serialQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)queryPlayerPathForXPCMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MRCreatePlayerPathFromXPCMessage(a3);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryPlayerPath:forClient:](self, "queryPlayerPath:forClient:", v8, v6));

  return v9;
}

- (id)queryPlayerPath:(id)a3 forClient:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolvePlayerPath:fromClient:](self, "resolvePlayerPath:fromClient:", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v5));

  return v6;
}

- (id)queryExistingPlayerPathForXPCMessage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolveExistingPlayerPath:](self, "resolveExistingPlayerPath:", v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v10));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerPath]);
  unsigned __int8 v13 = [v7 isAllowedAccessToDataFromPlayerPath:v12];

  if ((v13 & 1) == 0)
  {
    [v11 setNowPlayingClient:0];
    [v11 setPlayerClient:0];
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 originClient]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 playerPath]);
    [v11 setPlayerPath:v16];

    id v14 = [v11 setXpcClient:0];
  }

  if (MSVDeviceOSIsInternalInstall(v14)
    && ([v7 isEntitledFor:512] & 1) == 0)
  {
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    if (qword_1003FDE58 != -1) {
      dispatch_once(&qword_1003FDE58, &stru_10039F7B8);
    }
    __int128 v18 = self;
    objc_sync_enter(v18);
    if (v17 && ([(id)qword_1003FDE50 containsObject:v17] & 1) == 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000CDC3C;
      v21[3] = &unk_100399650;
      id v19 = v17;
      id v22 = v19;
      MRAnalyticsSendEvent(@"com.apple.nowplaying.entitlement", 0LL, v21);
      [(id)qword_1003FDE50 addObject:v19];
    }

    objc_sync_exit(v18);
  }

  return v11;
}

- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4
{
  return -[MRDNowPlayingServer resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:]( self,  "resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:",  a3,  a4,  1LL);
}

- (id)resolvePlayerPath:(id)a3 fromClient:(id)a4 useDefaultPlayerIfNoneSpecified:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  v24 = sub_1000CCF10;
  uint64_t v25 = sub_1000CCF20;
  id v26 = 0LL;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000CDDE4;
  v15[3] = &unk_10039F7E0;
  id v11 = v8;
  id v16 = v11;
  __int128 v17 = self;
  id v12 = v9;
  BOOL v20 = a5;
  id v18 = v12;
  id v19 = &v21;
  msv_dispatch_sync_on_queue(serialQueue, v15);
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)resolveExistingPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000CCF10;
  id v16 = sub_1000CCF20;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CE2AC;
  v9[3] = &unk_100399CB8;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)onQueue_resolveExistingPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer _onQueue_activeOriginClient](self, "_onQueue_activeOriginClient"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer _onQueue_originClientForOrigin:](self, "_onQueue_originClientForOrigin:", v5));
  id v26 = v4;
  if (!v7)
  {

    id v5 = 0LL;
    id v10 = 0LL;
    id v11 = 0LL;
    uint64_t v12 = 0LL;
    id v13 = 0LL;
    goto LABEL_15;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 activeNowPlayingClient]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v14 client]);
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceInfo]);
  [v10 resolvePlaceholdersForDeviceInfo:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 existingNowPlayingClientForClient:v10]);
  if (!v16) {
    [v10 setProcessIdentifier:0];
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 player]);
  if (!v11)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 activePlayerClient]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 player]);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v16 existingPlayerClientForPlayer:v11]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
  if (!v16)
  {
LABEL_15:
    id v18 = v10;
    id v10 = v18;
    if (!v12) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue([v16 client]);

  if (!v12)
  {
LABEL_14:
    id v19 = v11;
    goto LABEL_17;
  }

- (id)queryExistingPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000CCF10;
  id v16 = sub_1000CCF20;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CE63C;
  v9[3] = &unk_100399CB8;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_onQueue_queryExistingPlayerPath:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = -[MRDNowPlayingServerResult initWithUnresolvedPlayerPath:]( objc_alloc(&OBJC_CLASS___MRDNowPlayingServerResult),  "initWithUnresolvedPlayerPath:",  v4);
  id v6 = objc_alloc_init(&OBJC_CLASS___MRPlayerPath);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer _onQueue_originClientForOrigin:](self, "_onQueue_originClientForOrigin:", v7));
  -[MRDNowPlayingServerResult setOriginClient:](v5, "setOriginClient:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult originClient](v5, "originClient"));
  id v10 = v5;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult originClient](v5, "originClient"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 origin]);
    -[MRPlayerPath setOrigin:](v6, "setOrigin:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult originClient](v5, "originClient"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 existingNowPlayingClientForPlayerPath:v4]);
    -[MRDNowPlayingServerResult setNowPlayingClient:](v5, "setNowPlayingClient:", v14);

    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult nowPlayingClient](v5, "nowPlayingClient"));
    id v10 = v5;
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult nowPlayingClient](v5, "nowPlayingClient"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 client]);

      -[MRPlayerPath setClient:](v6, "setClient:", v17);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult nowPlayingClient](v5, "nowPlayingClient"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 existingPlayerClientForPlayerPath:v4]);
      -[MRDNowPlayingServerResult setPlayerClient:](v5, "setPlayerClient:", v19);

      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult playerClient](v5, "playerClient"));
      if (v20)
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult playerClient](v5, "playerClient"));
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 player]);

        -[MRPlayerPath setPlayer:](v6, "setPlayer:", v22);
      }

      else
      {
        -[MRDNowPlayingServerResult setError:](v5, "setError:", 29LL);
      }

      goto LABEL_10;
    }

    uint64_t v23 = 35LL;
  }

  else
  {
    uint64_t v23 = 5LL;
  }

  -[MRDNowPlayingServerResult setError:](v10, "setError:", v23);
LABEL_10:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer xpcClientForPlayerPath:](self, "xpcClientForPlayerPath:", v4));
  -[MRDNowPlayingServerResult setXpcClient:](v5, "setXpcClient:", v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServerResult xpcClient](v5, "xpcClient"));
  if (!v25 && !-[MRDNowPlayingServerResult error](v5, "error")) {
    -[MRDNowPlayingServerResult setError:](v5, "setError:", 4LL);
  }
  -[MRDNowPlayingServerResult setPlayerPath:](v5, "setPlayerPath:", v6);

  return v5;
}

- (id)xpcClientForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  unsigned int v6 = [v5 isLocal];

  if (!v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientWithRegisteredCustomOrigin:v11]);
    goto LABEL_12;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  unsigned int v8 = -[MRDNowPlayingServer _hasForwarderForOrigin:](self, "_hasForwarderForOrigin:", v7);

  if (!v8)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);
    id v9 = v12;
    if (!v12)
    {
      id v10 = 0LL;
      goto LABEL_13;
    }

    id v13 = [v12 processIdentifier];
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 bundleIdentifier]);
    id v11 = (void *)v14;
    if ((int)v13 < 1)
    {
      if (!v14)
      {
        id v10 = 0LL;
        goto LABEL_12;
      }

      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 clientForBundleIdentifier:v11]);
    }

    else
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 clientForPID:v13]);
    }

    id v10 = (void *)v16;

LABEL_12:
    goto LABEL_13;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 daemonClient]);
LABEL_13:

  return v10;
}

- (id)localPlayersForXpcClient:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___MRClient);
  id v7 = [v4 pid];

  -[MRClient setProcessIdentifier:](v6, "setProcessIdentifier:", v7);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 existingNowPlayingClientForClient:v6]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClients]);

  return v9;
}

- (id)originClientForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000CCF10;
  uint64_t v16 = sub_1000CCF20;
  id v17 = 0LL;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000CEBF0;
  v9[3] = &unk_100399CB8;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000CCF10;
  uint64_t v16 = sub_1000CCF20;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CED00;
  block[3] = &unk_100399CB8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)originClientForGroupLeaderOfDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = sub_1000CCF10;
  uint64_t v16 = sub_1000CCF20;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CEE10;
  block[3] = &unk_100399CB8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)clearNowPlayingClientForXPCClient:(id)a3
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000CF024;
  v22[3] = &unk_10039F808;
  id v4 = a3;
  id v23 = v4;
  v24 = self;
  [v4 flushPendingPlaybackSessionMigrateEvents:v22];
  id v5 = objc_alloc(&OBJC_CLASS___MRClient);
  id v6 = [v4 pid];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  unsigned int v8 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( v5,  "initWithProcessIdentifier:bundleIdentifier:",  v6,  v7);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClients](self, "originClients", 0LL));
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 origin]);
        unsigned int v16 = [v15 isLocallyHosted];

        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 origin]);
          -[MRDNowPlayingServer _removeNowPlayingClient:forOrigin:](self, "_removeNowPlayingClient:forOrigin:", v8, v17);
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }

    while (v11);
  }
}

- (void)restoreDeviceInfoToClient:(id)a3 handler:(id)a4
{
  id v6 = a4;
  if ([a3 isEntitledFor:0x2000])
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClients](self, "originClients", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInfo]);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 origin]);
          -[MRDNowPlayingServer postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:]( self,  "postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:",  v13,  0LL,  v14,  v6);
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v96 = a3;
  id v6 = a4;
  __int128 v138 = 0u;
  __int128 v139 = 0u;
  __int128 v140 = 0u;
  __int128 v141 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClients](self, "originClients"));
  id v8 = [v7 countByEnumeratingWithState:&v138 objects:v147 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v139;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v139 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v138 + 1) + 8 * (void)i) origin]);
        -[MRDNowPlayingServer postOriginDidRegister:handler:](self, "postOriginDidRegister:handler:", v12, v6);
      }

      id v9 = [v7 countByEnumeratingWithState:&v138 objects:v147 count:16];
    }

    while (v9);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activePlayerPath](self, "activePlayerPath"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activePlayerClient](self, "activePlayerClient"));
  -[MRDNowPlayingServer postActiveOriginDidChange:withPlaybackState:handler:]( self,  "postActiveOriginDidChange:withPlaybackState:handler:",  v13,  [v14 playbackState],  v6);

  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClients](self, "originClients"));
  id v86 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v135;
    id v94 = v6;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v135 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v87 = v15;
        __int128 v16 = *(void **)(*((void *)&v134 + 1) + 8 * v15);
        if ([v96 isEntitledFor:0x2000])
        {
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceInfo]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 origin]);
          -[MRDNowPlayingServer postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:]( self,  "postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:",  v17,  0LL,  v18,  v6);
        }

        [v16 volume];
        int v20 = v19;
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v16 playerPath]);
        LODWORD(v22) = v20;
        -[MRDNowPlayingServer postVolumeDidChange:volume:handler:]( self,  "postVolumeDidChange:volume:handler:",  v21,  v6,  v22);

        id v23 = [v16 isMuted];
        v24 = (void *)objc_claimAutoreleasedReturnValue([v16 playerPath]);
        -[MRDNowPlayingServer postIsMutedDidChange:isMuted:handler:]( self,  "postIsMutedDidChange:isMuted:handler:",  v24,  v23,  v6);

        id v25 = [v16 volumeControlCapabilities];
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v16 playerPath]);
        -[MRDNowPlayingServer postVolumeCapabilitiesDidChange:capabilities:handler:]( self,  "postVolumeCapabilitiesDidChange:capabilities:handler:",  v26,  v25,  v6);

        __int128 v132 = 0u;
        __int128 v133 = 0u;
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v16 nowPlayingClients]);
        id v28 = [v27 countByEnumeratingWithState:&v130 objects:v145 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v131;
          do
          {
            for (j = 0LL; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v131 != v30) {
                objc_enumerationMutation(v27);
              }
              -[MRDNowPlayingServer postClientDidRegisterForPlayerPath:handler:]( self,  "postClientDidRegisterForPlayerPath:handler:",  v32,  v6);
            }

            id v29 = [v27 countByEnumeratingWithState:&v130 objects:v145 count:16];
          }

          while (v29);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue([v16 activePlayerPath]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v16 activeNowPlayingClient]);
        objc_super v35 = (void *)objc_claimAutoreleasedReturnValue([v34 activePlayerClient]);
        -[MRDNowPlayingServer postNowPlayingApplicationDidChangeForPlayerPath:withPlaybackState:handler:]( self,  "postNowPlayingApplicationDidChangeForPlayerPath:withPlaybackState:handler:",  v33,  [v35 playbackState],  v6);

        __int128 v128 = 0u;
        __int128 v129 = 0u;
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        id v88 = (id)objc_claimAutoreleasedReturnValue([v16 nowPlayingClients]);
        id v90 = [v88 countByEnumeratingWithState:&v126 objects:v144 count:16];
        if (v90)
        {
          uint64_t v89 = *(void *)v127;
          v95 = v16;
          do
          {
            uint64_t v36 = 0LL;
            do
            {
              if (*(void *)v127 != v89) {
                objc_enumerationMutation(v88);
              }
              uint64_t v91 = v36;
              v37 = *(void **)(*((void *)&v126 + 1) + 8 * v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue([v37 client]);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v37 playerPath]);
              -[MRDNowPlayingServer postNowPlayingClientStateDidChange:forPlayerPath:handler:]( self,  "postNowPlayingClientStateDidChange:forPlayerPath:handler:",  v38,  v39,  v6);

              __int128 v124 = 0u;
              __int128 v125 = 0u;
              __int128 v122 = 0u;
              __int128 v123 = 0u;
              v92 = v37;
              v40 = (void *)objc_claimAutoreleasedReturnValue([v37 playerClients]);
              id v41 = [v40 countByEnumeratingWithState:&v122 objects:v143 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v123;
                do
                {
                  for (k = 0LL; k != v42; k = (char *)k + 1)
                  {
                    if (*(void *)v123 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    -[MRDNowPlayingServer postPlayerDidRegisterForPlayerPath:handler:]( self,  "postPlayerDidRegisterForPlayerPath:handler:",  v45,  v6);
                  }

                  id v42 = [v40 countByEnumeratingWithState:&v122 objects:v143 count:16];
                }

                while (v42);
              }

              v46 = (void *)objc_claimAutoreleasedReturnValue([v92 activePlayerClient]);
              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 playerPath]);
              v48 = (void *)objc_claimAutoreleasedReturnValue([v92 activePlayerClient]);
              -[MRDNowPlayingServer postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:]( self,  "postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:",  v47,  [v48 playbackState],  v6);

              __int128 v120 = 0u;
              __int128 v121 = 0u;
              __int128 v118 = 0u;
              __int128 v119 = 0u;
              id v93 = (id)objc_claimAutoreleasedReturnValue([v92 playerClients]);
              id v98 = [v93 countByEnumeratingWithState:&v118 objects:v142 count:16];
              if (v98)
              {
                uint64_t v97 = *(void *)v119;
                do
                {
                  for (m = 0LL; m != v98; m = (char *)m + 1)
                  {
                    if (*(void *)v119 != v97) {
                      objc_enumerationMutation(v93);
                    }
                    v50 = *(void **)(*((void *)&v118 + 1) + 8LL * (void)m);
                    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 player]);
                    v52 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    -[MRDNowPlayingServer postNowPlayingPlayerStateDidChange:forPlayerPath:handler:]( self,  "postNowPlayingPlayerStateDidChange:forPlayerPath:handler:",  v51,  v52,  v6);

                    [v16 timeSincePlaying];
                    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:"));
                    [v53 timeIntervalSinceReferenceDate];
                    double v55 = v54;

                    id v56 = [v50 isPlaying];
                    v57 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    -[MRDNowPlayingServer postIsPlayingDidChange:lastPlayingTimestamp:forPlayerPath:handler:]( self,  "postIsPlayingDidChange:lastPlayingTimestamp:forPlayerPath:handler:",  v56,  v57,  v6,  v55);

                    id v58 = [v50 playbackState];
                    v59 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    -[MRDNowPlayingServer postPlaybackStateDidChange:forPlayerPath:handler:]( self,  "postPlaybackStateDidChange:forPlayerPath:handler:",  v58,  v59,  v6);

                    v60 = (void *)objc_claimAutoreleasedReturnValue([v50 supportedRemoteControlCommandsData]);
                    v61 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    v114[0] = _NSConcreteStackBlock;
                    v114[1] = 3221225472LL;
                    v114[2] = sub_1000CFD24;
                    v114[3] = &unk_10039F830;
                    id v62 = v96;
                    id v115 = v62;
                    v116 = v50;
                    id v63 = v6;
                    id v117 = v63;
                    -[MRDNowPlayingServer postSupportedCommandsDidChange:forPlayerPath:handler:]( self,  "postSupportedCommandsDidChange:forPlayerPath:handler:",  v60,  v61,  v114);

                    id v64 = [v50 playbackQueueCapabilities];
                    v65 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    -[MRDNowPlayingServer postPlaybackQueueCapabilitiesDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueCapabilitiesDidChange:forPlayerPath:handler:",  v64,  v65,  v63);

                    v66 = (void *)objc_claimAutoreleasedReturnValue([v50 playbackQueue]);
                    v67 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    v109[0] = _NSConcreteStackBlock;
                    v109[1] = 3221225472LL;
                    v109[2] = sub_1000CFDB8;
                    v109[3] = &unk_10039F858;
                    id v68 = v62;
                    id v110 = v68;
                    id v69 = v66;
                    id v111 = v69;
                    v112 = v50;
                    id v70 = v63;
                    id v113 = v70;
                    -[MRDNowPlayingServer postPlaybackQueueDidChange:nowPlayingItemDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueDidChange:nowPlayingItemDidChange:forPlayerPath:handler:",  v69,  1LL,  v67,  v109);

                    v71 = (void *)objc_claimAutoreleasedReturnValue([v69 contentItems]);
                    v72 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    v104[0] = _NSConcreteStackBlock;
                    v104[1] = 3221225472LL;
                    v104[2] = sub_1000CFFB0;
                    v104[3] = &unk_10039F858;
                    id v73 = v68;
                    id v105 = v73;
                    v106 = v50;
                    id v74 = v69;
                    id v107 = v74;
                    id v75 = v70;
                    id v108 = v75;
                    -[MRDNowPlayingServer postPlaybackQueueContentItemsDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueContentItemsDidChange:forPlayerPath:handler:",  v71,  v72,  v104);

                    v76 = (void *)objc_claimAutoreleasedReturnValue([v74 contentItems]);
                    v77 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    v99[0] = _NSConcreteStackBlock;
                    v99[1] = 3221225472LL;
                    v99[2] = sub_1000D0090;
                    v99[3] = &unk_10039F858;
                    id v100 = v73;
                    v101 = v50;
                    id v78 = v74;
                    id v102 = v78;
                    id v79 = v75;
                    id v103 = v79;
                    -[MRDNowPlayingServer postPlaybackQueueContentItemsArtworkDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueContentItemsArtworkDidChange:forPlayerPath:handler:",  v76,  v77,  v99);

                    v80 = (void *)objc_claimAutoreleasedReturnValue([v50 participants]);
                    v81 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                    -[MRDNowPlayingServer postPlaybackQueueParticipantsDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueParticipantsDidChange:forPlayerPath:handler:",  v80,  v81,  v79);

                    if ([v50 canBeNowPlayingPlayer])
                    {
                      v82 = (void *)objc_claimAutoreleasedReturnValue([v50 playerPath]);
                      -[MRDNowPlayingServer postPlayerDidRegisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postPlayerDidRegisterCanBeNowPlayingForPlayerPath:handler:",  v82,  v79);
                    }

                    id v6 = v94;
                    __int128 v16 = v95;
                  }

                  id v98 = [v93 countByEnumeratingWithState:&v118 objects:v142 count:16];
                }

                while (v98);
              }

              if ([v92 canBeNowPlaying])
              {
                v83 = (void *)objc_claimAutoreleasedReturnValue([v92 activePlayerPath]);
                -[MRDNowPlayingServer postClientDidRegisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postClientDidRegisterCanBeNowPlayingForPlayerPath:handler:",  v83,  v6);
              }

              uint64_t v36 = v91 + 1;
            }

            while ((id)(v91 + 1) != v90);
            id v90 = [v88 countByEnumeratingWithState:&v126 objects:v144 count:16];
          }

          while (v90);
        }

        uint64_t v15 = v87 + 1;
      }

      while ((id)(v87 + 1) != v86);
      id v86 = [obj countByEnumeratingWithState:&v134 objects:v146 count:16];
    }

    while (v86);
  }
}

- (void)beginMusicHandoffSessionWithSource:(id)a3 destination:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D039C;
  v16[3] = &unk_10039E2C0;
  id v17 = v8;
  id v18 = v9;
  int v19 = self;
  id v20 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  sub_10013C460(v12, 0LL, v16, 7.0);
}

- (void)_handleGetAvailableOriginsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClients](self, "originClients"));
  id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) origin]);
        -[NSMutableArray addObject:](v7, "addObject:", v13);

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D093C;
  v15[3] = &unk_100399350;
  __int128 v16 = v7;
  id v14 = v7;
  sub_10013ADE4(v5, v15);
}

- (void)_handleSetActiveOriginMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MRCreateOriginFromXPCMessage(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ requesting to set active origin to %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  -[MRDNowPlayingServer setActiveOrigin:](self, "setActiveOrigin:", v8);
}

- (void)_handleGetActiveOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activeOriginClient](self, "activeOriginClient"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D0ADC;
  v9[3] = &unk_100399350;
  id v10 = v7;
  id v8 = v7;
  sub_10013ADE4(v5, v9);
}

- (void)registerOrigin:(id)a3 deviceInfo:(id)a4
{
}

- (void)reregisterOrigin:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Re-registering origin %{public}@", buf, 0xCu);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  [v11 removeOrigin:v6];

  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 routingContextID]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 createCustomOriginClientForOrigin:v6 routingContextID:v13]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  [v15 removeOriginRequests:v6];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 originClientRequestsForPlayerPath:v17]);

  [v18 setDeviceInfo:v7];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self, "originClientForOrigin:", v6));
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nowPlayingClients", 0));
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      v24 = 0LL;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v27 + 1) + 8 * (void)v24) client]);
        [v19 removeNowPlayingClientForClient:v25];

        v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v22);
  }

  [v19 setVolumeControlCapabilities:0];
  LODWORD(v26) = 0;
  [v19 setVolume:v26];
  [v19 clearDefaultSupportedCommandsData];
  [v19 setDeviceInfo:v7];
}

- (void)unregisterOrigin:(id)a3
{
}

- (void)updateDeviceInfo:(id)a3 origin:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self, "originClientForOrigin:", a4));
  [v7 setDeviceInfo:v6];
}

- (void)_handleSetNowPlayingAppOverrideMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_OVERRIDE_ENABLED_KEY");
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = @"disable";
    if (v8) {
      int v12 = @"enable";
    }
    int v27 = 138543618;
    id v28 = v7;
    __int16 v29 = 2114;
    __int128 v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ requesting to %{public}@ itself as now playing app override",  (uint8_t *)&v27,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer overrideClient](self, "overrideClient"));
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingServer]);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 originClientForOrigin:v16]);

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "existingNowPlayingClientForPid:", objc_msgSend(v13, "pid")));
  if (v8)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClientForPlayer:v19]);
    [v20 setCanBeNowPlayingPlayer:1];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClientForPlayer:v22]);
    [v23 setCanBeNowPlayingPlayerTimestamp:v21];

    id v24 = v7;
  }

  else
  {
    unsigned int v25 = [v13 pid];
    if (v25 != [v7 pid])
    {
      unsigned int v26 = 3;
      goto LABEL_11;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v18 playerClientForPlayer:v21]);
    [v22 setCanBeNowPlayingPlayer:0];
    id v24 = 0LL;
  }

  -[MRDNowPlayingServer setOverrideClient:](self, "setOverrideClient:", v24);
  unsigned int v26 = 0;
LABEL_11:
  sub_10013AD7C(v6, v26);
}

- (void)_handleSetOverriddenNowPlayingAppMessage:(id)a3 fromClient:(id)a4
{
  id v6 = (__CFString *)a4;
  id v7 = a3;
  string = (NSString *)xpc_dictionary_get_string(v7, "MRXPC_NOWPLAYING_DISPLAYID_KEY");
  if (string) {
    string = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", string);
  }
  uint64_t v10 = _MRLogForCategory(0LL, v8);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = @"enable";
    *(_DWORD *)buf = 138543874;
    v32 = v6;
    __int16 v33 = 2114;
    if (!string) {
      int v12 = @"disable";
    }
    v34 = v12;
    __int16 v35 = 2114;
    uint64_t v36 = string;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ requesting to %{public}@ now playing app override to %{public}@",  buf,  0x20u);
  }

  if (string)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientForBundleIdentifier:string]);

    if (v14)
    {
      __int128 v30 = self;
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 nowPlayingServer]);

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 originClientForOrigin:v18]);

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "existingNowPlayingClientForPid:", objc_msgSend(v14, "pid")));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 playerClientForPlayer:v21]);
      [v22 setCanBeNowPlayingPlayer:1];

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v20 playerClientForPlayer:v24]);
      [v25 setCanBeNowPlayingPlayerTimestamp:v23];

      -[MRDNowPlayingServer setOverrideClient:](v30, "setOverrideClient:", v14);
      unsigned int v26 = 0;
    }

    else
    {
      uint64_t v27 = _MRLogForCategory(0LL, v15);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        NSUInteger v28 = -[NSString length](string, "length");
        __int16 v29 = @"<unknown>";
        if (v28) {
          __int16 v29 = (const __CFString *)string;
        }
        *(_DWORD *)buf = 138543362;
        v32 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "Could not set override client. Client %{public}@ not found.",  buf,  0xCu);
      }

      unsigned int v26 = 4;
    }
  }

  else
  {
    -[MRDNowPlayingServer setOverrideClient:](self, "setOverrideClient:", 0LL);
    unsigned int v26 = 0;
  }

  sub_10013AD7C(v7, v26);
}

- (void)_handleSetCanBeNowPlayingAppMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClient]);

  if (v8)
  {
    BOOL v10 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_ENABLED_KEY");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClient]);
    [v11 setCanBeNowPlaying:v10];
    if (v10 && xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP") > 2.22044605e-16)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      [v11 setCanBeNowPlayingTimestamp:v12];
LABEL_7:
    }
  }

  else
  {
    uint64_t v13 = _MRLogForCategory(0LL, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
      int v14 = 138412290;
      uint64_t v15 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Unable to set can be now playing app. No now playing client found for %@",  (uint8_t *)&v14,  0xCu);
      goto LABEL_7;
    }
  }
}

- (void)_handleSetCanBeNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);

  if (v8)
  {
    BOOL v10 = xpc_dictionary_get_BOOL(v6, "MRXPC_NOWPLAYING_APP_ENABLED_KEY");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);
    [v11 setCanBeNowPlayingPlayer:v10];
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClient]);
    [v12 setPerPlayerCanBeNowPlaying:1];
    if (v10 && xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP") > 2.22044605e-16)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      [v11 setCanBeNowPlayingPlayerTimestamp:v13];
    }

    goto LABEL_7;
  }

  uint64_t v14 = _MRLogForCategory(0LL, v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
    int v15 = 138412290;
    __int128 v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Unable to set can be now playing player. No player client found for %@",  (uint8_t *)&v15,  0xCu);
LABEL_7:
  }
}

- (void)_handleBeginApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreateAppActivityFromXPCMessage();
  MSVDeviceOSIsInternalInstall(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  MSVDeviceOSIsInternalInstall(v7);
  if (v7)
  {
    id v8 = [v6 mutableCopy];
    MSVDeviceOSIsInternalInstall(v8);
    [v7 setActivity:v8];

    int v9 = 0;
  }

  else
  {
    int v9 = 5;
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D1770;
  v10[3] = &unk_10039F8C8;
  int v11 = v9;
  sub_10013ADE4(v5, v10);
}

- (void)_handleGetApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activity]);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000D1828;
  v9[3] = &unk_100399350;
  id v10 = v7;
  id v8 = v7;
  sub_10013ADE4(v5, v9);
}

- (void)_handleEndApplicationActivityMessage:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  MSVDeviceOSIsInternalInstall(v5);
  if (v5)
  {
    [v5 setActivity:0];
    unsigned int v6 = 0;
  }

  else
  {
    unsigned int v6 = 5;
  }

  sub_10013AD7C(v7, v6);
}

- (void)_handleSetPlaybackQueue:(id)a3 fromClient:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v22,  v6));
  id v8 = (void *)MRCreatePlaybackQueueFromXPCMessage(v22);
  int v9 = v8;
  if (v8)
  {
    id v10 = [v8 range];
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:]( &OBJC_CLASS___MRPlaybackQueueRequest,  "defaultPlaybackQueueRequestWithRange:",  v10,  v11));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackQueueRequests]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 subscriptionControllerForPlayerPath:v14]);

    [v15 subscribeToPlaybackQueue:v9 forRequest:v12];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 daemonClient]);

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 playbackQueueRequests]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 subscriptionControllerForPlayerPath:v19]);

    [v20 subscribeToPlaybackQueue:v9 forRequest:v12];
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);
  [v21 setPlaybackQueue:v9];

  sub_10013AD7C(v22, [v7 error]);
}

- (void)_handleRequestPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D1AF0;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleSetPlaybackQueueCapabilities:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  a4));
  uint64_t v7 = MRCreatePlaybackQueueCapabilitiesFromXPCMessage(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 playerClient]);
  [v8 setPlaybackQueueCapabilities:v7];

  sub_10013AD7C(v6, [v9 error]);
}

- (void)_handleSetHardwareRemoteBehaviorMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_HARDWARE_REMOTE_BEHAVIOR_KEY");
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)MRMediaRemoteCopyHardwareRemoteBehaviorDescription(uint64);
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting hardware remote behavior to %{public}@ for client %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  [v5 setHardwareRemoteBehavior:uint64];
  sub_10013AD7C(v6, 0);
}

- (void)_handleResetPlaybackQueueRequests:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = MRCreatePlayerPathFromXPCMessage(v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackQueueRequests]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subscriptionControllerForPlayerPath:v13]);
  id v10 = (void *)MRCreateDataFromXPCMessage(v6, "MRXPC_PLAYBACK_QUEUE_REQUESTS_DATA");

  id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___MRPlaybackQueueSubscriptionController),  v10,  0LL);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12) {
    [v9 restoreStateFromController:v12];
  }
}

- (void)_handleGetClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D1E7C;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleSetClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:]( self,  "resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:",  v9,  v6,  0LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v10));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingClient]);
  [v13 setClient:v12];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D2010;
  v15[3] = &unk_100399350;
  id v16 = v11;
  id v14 = v11;
  sub_10013ADE4(v7, v15);
}

- (void)_handleUpdateClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:]( self,  "resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:",  v9,  v6,  0LL));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v10));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingClient]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 client]);
  [v12 updateClient:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D2168;
  v15[3] = &unk_100399350;
  id v16 = v11;
  id v14 = v11;
  sub_10013ADE4(v7, v15);
}

- (void)_handleGetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D2264;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleSetPlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolvePlayerPath:fromClient:](self, "resolvePlayerPath:fromClient:", v9, v6));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v10));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerClient]);
  [v12 setPlayerPath:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D23DC;
  v14[3] = &unk_100399350;
  id v15 = v11;
  id v13 = v11;
  sub_10013ADE4(v7, v14);
}

- (void)_handleUpdatePlayerPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolvePlayerPath:fromClient:](self, "resolvePlayerPath:fromClient:", v9, v6));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v10));
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 playerClient]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 player]);
  [v12 updatePlayer:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000D2530;
  v15[3] = &unk_100399350;
  id v16 = v11;
  id v14 = v11;
  sub_10013ADE4(v7, v15);
}

- (void)_handleGetPlaybackStateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D2614;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleSetPlaybackStateMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClient]);

  if (v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_PLAYBACK_STATE_KEY");
    double v11 = xpc_dictionary_get_double(v6, "MRXPC_TIMESTAMP");
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);
    id v13 = v12;
    if (v11 <= 0.0)
    {
      [v12 updatePlaybackState:uint64 date:0];
    }

    else
    {
      id v14 = -[NSDate initWithTimeIntervalSinceReferenceDate:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSinceReferenceDate:",  v11);
      [v13 updatePlaybackState:uint64 date:v14];
    }
  }

  else
  {
    uint64_t v15 = _MRLogForCategory(0LL, v9);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
      int v17 = 138412290;
      __int128 v18 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Unable to set playback state. No now playing client found for %@",  (uint8_t *)&v17,  0xCu);
    }
  }

  sub_10013AD7C(v6, [v7 error]);
}

- (void)_handleGetAnyAppIsPlayingMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
  LODWORD(self) = [v7 isPlaying];

  sub_10013AB4C(v6, (uint64_t)"MRXPC_APP_IS_PLAYING_KEY", 2LL, self, 0LL);
}

- (void)_handleRequestVideoThumbnailsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  v7));
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    int v21 = 138543618;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received video thumbnails request from %{public}@ for %{public}@",  (uint8_t *)&v21,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
  uint64_t v15 = _MRLogForCategory(0LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  int v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
      int v21 = 138543362;
      id v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Relaying video thumbnails request to %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000004uLL);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
    MRAddPlayerPathToXPCMessage(v6, v19);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    [v20 relayXPCMessage:v6 andReply:1];
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002B83C0();
    }

    sub_10013AD7C(v6, [v8 error]);
  }
}

- (void)_handleRequestAudioAmplitudeSamplesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  v7));
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    int v21 = 138543618;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received audio amplitude samples request from %{public}@ for %{public}@",  (uint8_t *)&v21,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
  uint64_t v15 = _MRLogForCategory(0LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  int v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
      int v21 = 138543362;
      id v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Relaying audio amplitude samples request to %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000005uLL);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
    MRAddPlayerPathToXPCMessage(v6, v19);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    [v20 relayXPCMessage:v6 andReply:1];
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002B83EC();
    }

    sub_10013AD7C(v6, [v8 error]);
  }
}

- (void)_handleSendLyricsEvent:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  v7));
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    int v21 = 138543618;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received lyrics event from client %{public}@ and sending to %{public}@",  (uint8_t *)&v21,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
  uint64_t v15 = _MRLogForCategory(0LL, v14);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  int v17 = v16;
  if (v13)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
      int v21 = 138543362;
      id v22 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Relaying lyrics event to %{public}@",  (uint8_t *)&v21,  0xCu);
    }

    xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x700000000000006uLL);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
    MRAddPlayerPathToXPCMessage(v6, v19);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcClient]);
    [v20 relayXPCMessage:v6 andReply:0];
  }

  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002B8418();
    }

    sub_10013AD7C(v6, [v8 error]);
  }
}

- (void)_handleResolvePlayerPath:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolveExistingPlayerPath:](self, "resolveExistingPlayerPath:", v9));
  uint64_t v12 = _MRLogForCategory(0LL, v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    *(_DWORD *)buf = 138543874;
    __int128 v19 = v15;
    __int16 v20 = 2114;
    int v21 = v9;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%{public}@ is requesting to resolve playerPath %{public}@ -> %{public}@",  buf,  0x20u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D3088;
  v16[3] = &unk_100399350;
  id v17 = v10;
  id v14 = v10;
  sub_10013ADE4(v7, v16);
}

- (void)_handleGetNowPlayingClientsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v20 = v6;
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  v7));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v19 originClient]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingClients]);

  int v21 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v14);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000D3354;
        v22[3] = &unk_100399E98;
        id v23 = v7;
        uint64_t v24 = v15;
        id v16 = objc_retainBlock(v22);

        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v12);
  }

  -[NSMutableArray sortUsingComparator:](v21, "sortUsingComparator:", &stru_10039F908);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_map:](v21, "msv_map:", &stru_10039F948));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v17,  200LL,  0LL,  0LL));
  sub_10013AC78(v20, (uint64_t)"MRXPC_NOWPLAYING_CLIENT_ARRAY_DATA_KEY", v18, 0LL);
}

- (void)_handleSetNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0LL;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = 0;
  uint64_t v8 = MRCreatePlayerPathFromXPCMessage(v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D3604;
  block[3] = &unk_10039E848;
  block[4] = self;
  id v12 = v10;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  __int128 v19 = &v20;
  dispatch_sync(serialQueue, block);
  sub_10013AD7C(v6, *((_DWORD *)v21 + 6));

  _Block_object_dispose(&v20, 8);
}

- (void)_handleGetNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D37AC;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleRemoveNowPlayingClientMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 originClient]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
  [v7 removeNowPlayingClientForClient:v9];

  sub_10013AD7C(v6, [v10 error]);
}

- (void)_handleGetNowPlayingPlayersMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingClient]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 playerClients]);

  id v10 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v9 count]);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v15);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nowPlayingClient", (void)v22));
        unsigned int v18 = [v17 canBeNowPlayingForPlayerClient:v16];

        if (v18)
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 player]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 data]);
          -[NSMutableArray addObject:](v10, "addObject:", v20);
        }

        uint64_t v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v13);
  }

  int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  200LL,  0LL,  0LL));
  sub_10013AC78(v6, (uint64_t)"MRXPC_NOWPLAYING_PLAYER_ARRAY_DATA_KEY", v21, 0LL);
}

- (void)_handleSetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = MRCreatePlayerPathFromXPCMessage(v18);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:]( self,  "resolvePlayerPath:fromClient:useDefaultPlayerIfNoneSpecified:",  v8,  v6,  0LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]);
  [v12 setActivePlayerClient:v11];

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v8 player]);
  if ((!v13
     || (uint64_t v14 = (void *)v13,
         uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]),
         v15,
         v14,
         v15))
    && (id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]), v16, v16))
  {
    unsigned int v17 = 0;
  }

  else
  {
    unsigned int v17 = [v10 error];
  }

  sub_10013AD7C(v18, v17);
}

- (void)_handleGetNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D3C84;
  v8[3] = &unk_100399350;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = v9;
  sub_10013ADE4(v6, v8);
}

- (void)_handleRemoveNowPlayingPlayerMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 player]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]);
  [v9 removePlayerClientForPlayer:v8];

  sub_10013AD7C(v6, [v10 error]);
}

- (void)_handleGetActivePlayerPathsForLocalOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activePlayerClients]);
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mr_map:", &stru_10039F988));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  0LL));
  sub_10013AC78(v5, (uint64_t)"MRXPC_NOWPLAYING_PLAYER_PATH_ARRAY_DATA_KEY", v8, 0LL);
}

- (void)_handleGetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);
  unsigned __int8 v9 = [v8 isPictureInPictureEnabled];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D3F3C;
  v11[3] = &unk_10039F9B0;
  id v12 = v7;
  unsigned __int8 v13 = v9;
  id v10 = v7;
  sub_10013ADE4(v6, v11);
}

- (void)_handleSetPlayerPictureInPictureEnabledMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  a4));
  BOOL v7 = xpc_dictionary_get_BOOL(v6, "MRXPC_PICTURE_IN_PICTURE_ENABLED_KEY");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 playerClient]);
  [v8 setPictureInPictureEnabled:v7];

  sub_10013AD7C(v6, [v9 error]);
}

- (void)_handleContentItemChangedMessage:(id)a3 fromClient:(id)a4
{
  id v10 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerClient]);

  if (v6)
  {
    BOOL v7 = (void *)MRCreateContentItemsFromXPCMessage(v10);
    if (v7)
    {
      uint64_t v8 = -[MRPlaybackQueue initWithContentItems:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueue),  "initWithContentItems:",  v7);
      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 playerClient]);
        [v9 updatePlaybackQueue:v8];
      }
    }
  }

  sub_10013AD7C(v10, [v5 error]);
}

- (void)_handleContentItemArtworkChangedMessage:(id)a3 fromClient:(id)a4
{
  id v9 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playerClient]);

  if (v6)
  {
    BOOL v7 = (void *)MRCreateContentItemsFromXPCMessage(v9);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerClient]);
    [v8 notifyArtworkChangedForContentItems:v7];
  }

  sub_10013AD7C(v9, [v5 error]);
}

- (void)_handleGetDeviceInfo:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  v7));
  unsigned int v9 = [v8 error];
  unsigned int v10 = [v7 isEntitledFor:0x2000];

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 originClient]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);
  }

  else
  {
    id v12 = 0LL;
    unsigned int v9 = 3;
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000D42B8;
  v14[3] = &unk_10039F9D8;
  unsigned int v16 = v9;
  id v15 = v12;
  id v13 = v12;
  sub_10013ADE4(v6, v14);
}

- (void)_handleGetElectedPlayerPathMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000D4354;
  v4[3] = &unk_100399350;
  v4[4] = self;
  sub_10013ADE4(a3, v4);
}

- (void)_handlePlaybackSessionRequest:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v8));

  if ([v9 error])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000D4494;
    v11[3] = &unk_100399350;
    id v12 = v9;
    sub_10013ADE4(v5, v11);
  }

  else
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 xpcClient]);
    [v10 relayXPCMessage:v5 andReply:1 resultCallback:0];
  }
}

- (void)_handleGetSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 setHasRequestedSupportedCommands:1];
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x3032000000LL;
  v22[3] = sub_1000CCF10;
  void v22[4] = sub_1000CCF20;
  id v23 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000D46A8;
  v18[3] = &unk_10039FA00;
  v18[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  int v21 = v22;
  unsigned int v10 = objc_retainBlock(v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000D4824;
  v16[3] = &unk_10039FA28;
  id v11 = v8;
  id v17 = v11;
  id v12 = objc_retainBlock(v16);
  id v13 = v9;
  uint64_t v14 = v12;
  id v15 = v10;
  ((void (*)(void))v10[2])();

  _Block_object_dispose(v22, 8);
}

- (void)_handleSetSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 queryPlayerPathForXPCMessage:v5 fromClient:v6]);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingClient]);
  if (v10)
  {
    id v12 = (os_log_s *)MRCreateSupportedCommandsDataFromXPCMessage(v5);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 playerClient]);
    [v13 setSupportedRemoteControlCommandsData:v12];
  }

  else
  {
    uint64_t v14 = _MRLogForCategory(0LL, v11);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "ERROR: now playing client could not be found for setting supported commands",  v15,  2u);
    }
  }

  sub_10013AD7C(v5, [v9 error]);
}

- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  id v7 = (void *)MRCreateSupportedCommandsDataFromXPCMessage(v30);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingServer]);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 queryExistingPlayerPathForXPCMessage:v30 forClient:v6]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 unresolvedPlayerPath]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  if ([v13 isEqualToString:v14])
  {
  }

  else
  {
    unsigned __int8 v15 = [v6 isEntitledFor:256];

    if ((v15 & 1) == 0)
    {
      unsigned int v29 = 3;
      goto LABEL_8;
    }
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 originClient]);
  [v16 updateDefaultSupportedCommandsData:v7 forClient:v13];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingClient]);
  if (!v17)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___MRPlayerPath);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 originClient]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 origin]);
    -[MRPlayerPath setOrigin:](v18, "setOrigin:", v20);

    int v21 = objc_alloc_init(&OBJC_CLASS___MRClient);
    -[MRPlayerPath setClient:](v18, "setClient:", v21);

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v10 unresolvedPlayerPath]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 client]);
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](v18, "client"));
    [v25 setBundleIdentifier:v24];

    -[MRDNowPlayingServer postSupportedCommandsDidChange:forPlayerPath:handler:]( self,  "postSupportedCommandsDidChange:forPlayerPath:handler:",  v7,  v18,  0LL);
  }

  __int128 v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 unresolvedPlayerPath]);
  MRAddPlayerPathToUserInfo(v26, v27);

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v28 postClientNotificationNamed:_MRMediaRemoteDefaultSupportedCommandsDidChangeNotification userInfo:v26];

  unsigned int v29 = 0;
LABEL_8:
  sub_10013AD7C(v30, v29);
}

- (void)_handleGetLastPlayingDateMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreatePlayerPathFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolveExistingPlayerPath:](self, "resolveExistingPlayerPath:", v7));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000D53BC;
  v12[3] = &unk_100399A78;
  id v13 = v7;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v8));
  id v15 = v5;
  id v9 = v5;
  id v10 = v14;
  id v11 = v7;
  sub_10013ADE4(v9, v12);
}

- (void)_handleSetPlayerClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRCreateProtobufFromXPCMessage(v6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryPlayerPathForXPCMessage:fromClient:]( self,  "queryPlayerPathForXPCMessage:fromClient:",  v6,  v7));

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]);
  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 playerClient]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPlayingDate]);
    [v13 updateLastPlayingDate:v14];
  }

  else
  {
    uint64_t v15 = _MRLogForCategory(0LL, v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "Unable to set properties from message %@. No player client found.",  (uint8_t *)&v16,  0xCu);
    }
  }

  sub_10013AD7C(v6, [v10 error]);
}

- (void)_handleSetOriginClientPropertiesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateProtobufFromXPCMessage(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = MRCreateOriginFromXPCMessage(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self, "originClientForOrigin:", v9));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 lastPlayingDate]);
    [v11 updateLastPlayingDate:v12];

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 devicePlaybackSessionID]);
    [v11 setDevicePlaybackSessionID:v13];

    id v14 = v5;
    unsigned int v15 = 0;
  }

  else
  {
    uint64_t v16 = _MRLogForCategory(0LL, v10);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v7;
      __int16 v20 = 2112;
      int v21 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to set properties from message %@. No origin client found for %@",  (uint8_t *)&v18,  0x16u);
    }

    id v14 = v5;
    unsigned int v15 = 5;
  }

  sub_10013AD7C(v14, v15);
}

- (void)_handleRegisterForWakingNowPlayingNotifications:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = MRCreatePlayerPathArrayFromXPCMessage();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ([v5 isEntitledFor:128])
  {
    [v5 setWantsAssertionsForNotificationsWithPlayerPath:v8];
    id v9 = 0LL;
  }

  else
  {
    id v9 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  2LL,  @"Unable to register for waking now playing notifications without entitlement: %@",  @"com.apple.mediaremote.waking-now-playing-notifications");
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D5898;
  v11[3] = &unk_100399350;
  uint64_t v12 = v9;
  uint64_t v10 = v9;
  sub_10013ADE4(v6, v11);
}

- (void)_handleGetAudioFormatContentInfoForOriginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateOriginFromXPCMessage(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self, "originClientForOrigin:", v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nowPlayingAudioFormatContentInfos]);
  id v11 = v9;
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000D5A14;
    v14[3] = &unk_100399350;
    id v15 = v9;
    sub_10013ADE4(v5, v14);
  }

  else
  {
    uint64_t v12 = _MRLogForCategory(0LL, v10);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = objc_opt_class(self);
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      int v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Unable to get audio format content info for origin: %{public}@ | client %{public}@",  buf,  0x20u);
    }

    sub_10013AD7C(v5, 5u);
  }
}

- (void)_handleGetImageDimensionsForArtworkDataMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreateDataFromXPCMessage(v4, "MRXPC_ARTWORK_DATA_KEY");
  +[MRImageUtilities imageDimensionsForImageData:error:]( &OBJC_CLASS___MRImageUtilities,  "imageDimensionsForImageData:error:",  v5,  0LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D5ACC;
  v8[3] = &unk_10039FB50;
  void v8[4] = v6;
  v8[5] = v7;
  sub_10013ADE4(v4, v8);
}

- (void)_handleFetchPlaybackQueueParticipantsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer queryExistingPlayerPathForXPCMessage:forClient:]( self,  "queryExistingPlayerPathForXPCMessage:forClient:",  v6,  a4));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerClient]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 participants]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_compactMap:", &stru_10039FB90));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000D5C28;
  v13[3] = &unk_100399378;
  id v14 = v10;
  id v15 = v7;
  id v11 = v7;
  id v12 = v10;
  sub_10013ADE4(v6, v13);
}

- (void)_handleBeginMusicHandoffSessionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreateDataFromXPCMessage(v5, "MRXPC_MUSIC_HANDOFF_SESSION_KEY");
  id v7 = [[MRMusicHandoffSession alloc] initWithProtobufData:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sourcePlayerPath]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationPlayerPath]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D5D94;
  v11[3] = &unk_10039FBE0;
  id v12 = v5;
  id v10 = v5;
  -[MRDNowPlayingServer beginMusicHandoffSessionWithSource:destination:completion:]( self,  "beginMusicHandoffSessionWithSource:destination:completion:",  v8,  v9,  v11);
}

- (void)_handleSendMusicHandoffEventMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MRCreateDataFromXPCMessage(v6, "MRXPC_MUSIC_HANDOFF_EVENT_KEY");
  id v9 = [[MRMusicHandoffEvent alloc] initWithProtobufData:v8];
  id v10 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 createNowPlayingClient]);

  id v12 = -[MRPlayerPath initWithOrigin:client:player:](v10, "initWithOrigin:client:player:", 0LL, v11, 0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer resolveExistingPlayerPath:](self, "resolveExistingPlayerPath:", v12));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v13));

  if ([v14 error])
  {
    id v15 = -[NSError initWithMRError:]([NSError alloc], "initWithMRError:", [v14 error]);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 playerClient]);
    id v15 = (NSError *)objc_claimAutoreleasedReturnValue([v16 handleHandoffEvent:v9]);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000D61E0;
  v19[3] = &unk_100399378;
  __int16 v20 = v15;
  id v21 = v6;
  id v17 = v6;
  __int16 v18 = v15;
  sub_10013ADE4(v17, v19);
}

- (void)nowPlayingPlayerClient:(id)a3 playerStateDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postNowPlayingPlayerStateDidChange:forPlayerPath:handler:]( self,  "postNowPlayingPlayerStateDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 isPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 timeSincePlaying];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -v7));
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  -[MRDNowPlayingServer postIsPlayingDidChange:lastPlayingTimestamp:forPlayerPath:handler:]( self,  "postIsPlayingDidChange:lastPlayingTimestamp:forPlayerPath:handler:",  v4,  v11,  0LL,  v10);
  -[MRDNowPlayingServer maybePostDistributedNotifications](self, "maybePostDistributedNotifications");
  if (v4)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 origin]);
    if ([v12 isLocal])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      unsigned int v14 = [v13 shouldWakeDeviceForRemoteControlCommands];

      if (v14)
      {
        nowPlayingInfoObserverQueue = (dispatch_queue_s *)self->_nowPlayingInfoObserverQueue;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_1000D63CC;
        v16[3] = &unk_100398E60;
        void v16[4] = self;
        id v17 = v6;
        dispatch_async(nowPlayingInfoObserverQueue, v16);
      }
    }

    else
    {
    }
  }
}

- (void)nowPlayingPlayerClient:(id)a3 playbackStateDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackStateDidChange:forPlayerPath:handler:]( self,  "postPlaybackStateDidChange:forPlayerPath:handler:",  v4,  v6,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 supportedCommandsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postSupportedCommandsDidChange:forPlayerPath:handler:]( self,  "postSupportedCommandsDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueDidChange:(id)a4 nowPlayingItemDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackQueueDidChange:nowPlayingItemDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueDidChange:nowPlayingItemDidChange:forPlayerPath:handler:",  v8,  v5,  v9,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueCapabilitiesDidChange:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackQueueCapabilitiesDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueCapabilitiesDidChange:forPlayerPath:handler:",  a4,  v6,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueContentItemsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackQueueContentItemsDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueContentItemsDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueArtworkContentItemsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackQueueContentItemsArtworkDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueContentItemsArtworkDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)nowPlayingPlayerClient:(id)a3 pictureInPictureEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPictureInPictureDidChange:forPlayerPath:handler:]( self,  "postPictureInPictureDidChange:forPlayerPath:handler:",  v4,  v6,  0LL);

  -[MRDNowPlayingServer maybePostDistributedNotifications](self, "maybePostDistributedNotifications");
}

- (void)nowPlayingPlayerClient:(id)a3 playerCanBeNowPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  if (v4) {
    -[MRDNowPlayingServer postPlayerDidRegisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postPlayerDidRegisterCanBeNowPlayingForPlayerPath:handler:",  v6,  0LL);
  }
  else {
    -[MRDNowPlayingServer postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:handler:",  v6,  0LL);
  }
}

- (void)nowPlayingPlayerClient:(id)a3 playbackQueueParticipantsDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postPlaybackQueueParticipantsDidChange:forPlayerPath:handler:]( self,  "postPlaybackQueueParticipantsDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)startObservingNowPlayingInfoForNowPlayingPlayerClient:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nowPlayingInfoObserverQueue);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  objc_initWeak(location, self);
  objc_initWeak(&from, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v7 = kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000D69F8;
  v25[3] = &unk_10039FC08;
  objc_copyWeak(&v27, location);
  id v8 = v5;
  id v26 = v8;
  objc_copyWeak(&v28, &from);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 addObserverForName:v7 object:0 queue:0 usingBlock:v25]);
  id nowPlayingInfoObserverHandle = self->_nowPlayingInfoObserverHandle;
  self->_id nowPlayingInfoObserverHandle = v9;

  nowPlayingInfoObserverQueue = self->_nowPlayingInfoObserverQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000D6B90;
  v22[3] = &unk_10039FC30;
  objc_copyWeak(&v23, location);
  objc_copyWeak(&v24, &from);
  id v12 = (MSVTimer *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:queue:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:queue:block:",  nowPlayingInfoObserverQueue,  v22,  8.0));
  wakeDeviceTimer = self->_wakeDeviceTimer;
  self->_wakeDeviceTimer = v12;

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 playbackQueue]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 contentItems]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 metadata]);
  id v18 = [v17 mediaType];

  if (v18)
  {
    id v19 = (dispatch_queue_s *)self->_nowPlayingInfoObserverQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000D6BE0;
    block[3] = &unk_100398E60;
    block[4] = self;
    id v21 = v4;
    dispatch_async(v19, block);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (void)stopObservingNowPlayingInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self->_nowPlayingInfoObserverHandle];

  -[MSVTimer invalidate](self->_wakeDeviceTimer, "invalidate");
}

- (void)wakeDeviceIfNecessaryForNowPlayingPlayerClient:(id)a3
{
  nowPlayingInfoObserverQueue = (dispatch_queue_s *)self->_nowPlayingInfoObserverQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(nowPlayingInfoObserverQueue);
  -[MRDNowPlayingServer stopObservingNowPlayingInfo](self, "stopObservingNowPlayingInfo");
  id v14 = (id)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 playbackQueue]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentItems]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  id v10 = [v9 mediaType];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);

  if (v10 != (id)1
    && ([v12 isAirPlayActive] & 1) == 0
    && ([v12 isProxyGroupPlayer] & 1) == 0)
  {
    id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Playback started of type %ld for %@",  v10,  v14);
    sub_10013D8E8(1, 1, v13);
  }
}

- (void)nowPlayingClient:(id)a3 activePlayerDidChangeFromPlayerClient:(id)a4 toPlayerClient:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
  }
  -[MRDNowPlayingServer postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:]( self,  "postActivePlayerDidChangeForPlayerPath:withPlaybackState:handler:",  v8,  [v7 playbackState],  0);
  -[MRDNowPlayingServer maybePostDistributedNotifications](self, "maybePostDistributedNotifications");
}

- (void)nowPlayingClient:(id)a3 clientStateDidChange:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postNowPlayingClientStateDidChange:forPlayerPath:handler:]( self,  "postNowPlayingClientStateDidChange:forPlayerPath:handler:",  v6,  v7,  0LL);
}

- (void)nowPlayingClient:(id)a3 playerDidRegister:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "playerPath", a3));
  -[MRDNowPlayingServer postPlayerDidRegisterForPlayerPath:handler:]( self,  "postPlayerDidRegisterForPlayerPath:handler:",  v5,  0LL);
}

- (void)nowPlayingClient:(id)a3 playerDidUnregister:(id)a4
{
  id v5 = a4;
  id v6 = [v5 playbackState];
  id v7 = [v5 canBeNowPlayingPlayer];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  -[MRDNowPlayingServer postPlayerDidUnregisterWithPlaybackState:canBeNowPlaying:forPlayerPath:handler:]( self,  "postPlayerDidUnregisterWithPlaybackState:canBeNowPlaying:forPlayerPath:handler:",  v6,  v7,  v8,  0LL);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 handoffSessions]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectEnumerator]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "invalidate", (void)v17);
        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

- (void)nowPlayingPlayerClient:(id)a3 clientCanBeNowPlayingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  if (v4) {
    -[MRDNowPlayingServer postClientDidRegisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postClientDidRegisterCanBeNowPlayingForPlayerPath:handler:",  v6,  0LL);
  }
  else {
    -[MRDNowPlayingServer postClientDidUnregisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postClientDidUnregisterCanBeNowPlayingForPlayerPath:handler:",  v6,  0LL);
  }
}

- (void)nowPlayingClient:(id)a3 applicationDidForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  pid_t v7 = getpid();
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);

  MRAddPlayerPathToUserInfo(v8, v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  kMRMediaRemoteApplicationForegroundUserInfoKey);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000D7168;
  v11[3] = &unk_10039FC50;
  pid_t v12 = v7;
  -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:predicate:]( self,  "postClientNowPlayingNotificationNamed:userInfo:predicate:",  _MRMediaRemoteApplicationDidForegroundNotification,  v8,  v11);
}

- (void)nowPlayingOriginClient:(id)a3 activePlayerPathDidChange:(id)a4 withPlaybackState:(unsigned int)a5
{
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidBegin:(id)a4
{
  uint64_t v5 = kMRApplicationActivityHasBegunNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  v5,  v7);
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityDidEnd:(id)a4
{
  uint64_t v5 = kMRApplicationActivityHasEndedNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  v5,  v7);
}

- (void)nowPlayingOriginClient:(id)a3 applicationActivityStatusDidChange:(id)a4
{
  uint64_t v5 = kMRApplicationActivityStatusDidChangeNotification;
  uint64_t v8 = kMRApplicationActivityUserInfoKey;
  id v9 = a4;
  id v6 = a4;
  pid_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));

  -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  v5,  v7);
}

- (void)handleNowPlayingOriginClient:(id)a3 deviceInfoDidChange:(id)a4 previousDeviceInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  pid_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);
  id v14 = (id)objc_claimAutoreleasedReturnValue([v11 existingOriginClientRequestsForPlayerPath:v12]);

  [v14 setDeviceInfo:v9];
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 origin]);

  -[MRDNowPlayingServer postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:]( self,  "postDeviceInfoDidChange:previousDeviceInfo:forOrigin:handler:",  v9,  v8,  v13,  0LL);
}

- (void)nowPlayingOriginClient:(id)a3 clientDidRegister:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "playerPath", a3));
  -[MRDNowPlayingServer postClientDidRegisterForPlayerPath:handler:]( self,  "postClientDidRegisterForPlayerPath:handler:",  v5,  0LL);
}

- (void)nowPlayingOriginClient:(id)a3 clientDidUnregister:(id)a4
{
  id v6 = a4;
  __int128 v17 = (MRDNowPlayingOriginClient *)a3;
  pid_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient origin](v17, "origin"));
  unsigned int v8 = [v7 isHosted];
  localOriginClient = v17;
  if (v8) {
    localOriginClient = self->_localOriginClient;
  }
  id v10 = localOriginClient;

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  pid_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleIdentifier]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingOriginClient defaultSupportedCommandsDataForClient:]( v10,  "defaultSupportedCommandsDataForClient:",  v13));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  id v16 = [v6 canBeNowPlaying];

  -[MRDNowPlayingServer postClientDidUnregisterForPlayerPath:hasDefaultSupportedCommands:canBeNowPlaying:handler:]( self,  "postClientDidUnregisterForPlayerPath:hasDefaultSupportedCommands:canBeNowPlaying:handler:",  v15,  v14 != 0LL,  v16,  0LL);
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postVolumeCapabilitiesDidChange:capabilities:handler:]( self,  "postVolumeCapabilitiesDidChange:capabilities:handler:",  v6,  v4,  0LL);
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteVolumeDidChange:(float)a4
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  *(float *)&double v6 = a4;
  -[MRDNowPlayingServer postVolumeDidChange:volume:handler:](self, "postVolumeDidChange:volume:handler:", v7, 0LL, v6);
}

- (void)nowPlayingOriginClient:(id)a3 currentRouteIsMutedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  -[MRDNowPlayingServer postIsMutedDidChange:isMuted:handler:]( self,  "postIsMutedDidChange:isMuted:handler:",  v6,  v4,  0LL);
}

- (void)nowPlayingOriginClient:(id)a3 activePlayerClientsDidChange:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 origin]);
  -[MRDNowPlayingServer postActivePlayerPathsDidChangeForOrigin:handler:]( self,  "postActivePlayerPathsDidChangeForOrigin:handler:",  v5,  0LL);
}

- (void)nowPlayingOriginClientPlaybackDidTimeout:(id)a3
{
  id v4 = a3;
  pid_t v5 = getpid();
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);

  MRAddPlayerPathToUserInfo(v6, v7);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000D7834;
  v8[3] = &unk_10039FC50;
  pid_t v9 = v5;
  -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:predicate:]( self,  "postClientNowPlayingNotificationNamed:userInfo:predicate:",  _MRMediaRemotePlaybackDidTimeoutNotification,  v6,  v8);
}

- (void)nowPlayingOriginClientDidChangeAudioFormatContentInfo:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 origin]);
  -[MRDNowPlayingServer postAudioFormatContentInfoDidChangeForOrigin:handler:]( self,  "postAudioFormatContentInfoDidChangeForOrigin:handler:",  v4,  0LL);
}

- (void)nowPlayingServer:(id)a3 activeOriginDidChangeFromOriginClient:(id)a4 toOriginClient:(id)a5
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activePlayerPath]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 activeNowPlayingClient]);

  pid_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerClient]);
  -[MRDNowPlayingServer postActiveOriginDidChange:withPlaybackState:handler:]( self,  "postActiveOriginDidChange:withPlaybackState:handler:",  v7,  [v9 playbackState],  0);

  -[MRDNowPlayingServer maybePostDistributedNotifications](self, "maybePostDistributedNotifications");
}

- (BOOL)nowPlayingLauncher:(id)a3 shouldRelaunch:(id)a4
{
  BOOL result = 0;
  if (MSVDeviceIsAudioAccessory(self))
  {
    pid_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    unsigned __int8 v6 = [v5 homepodDemoMode];

    if ((v6 & 1) == 0 && -[MRDNowPlayingServer localActivePlayerIsPlaying](self, "localActivePlayerIsPlaying")) {
      return 1;
    }
  }

  return result;
}

- (void)electedPlayerController:(id)a3 electedPlayerDidChange:(id)a4 change:(int64_t)a5 event:(int64_t)a6 reason:(id)a7
{
}

- (void)lockScreenController:(id)a3 lockScreenWidgetActiveDidChange:(BOOL)a4
{
}

- (void)lockScreenController:(id)a3 lockScreenWidgetVisibleDidChange:(BOOL)a4
{
}

- (void)lockScreenController:(id)a3 playerPathDidChange:(id)a4
{
}

- (BOOL)lockScreenPlatterActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer lockScreenController](self, "lockScreenController"));
  unsigned __int8 v3 = [v2 isLockScreenWidgetActive];

  return v3;
}

- (BOOL)lockScreenRecommendationActive
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer lockScreenController](self, "lockScreenController"));
  unsigned __int8 v3 = [v2 isLockScreenRecommendationActive];

  return v3;
}

- (BOOL)hasElectedPlayer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer electedPlayerController](self, "electedPlayerController"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 electedPlayerPath]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D7AF8;
  block[3] = &unk_100398E60;
  id v8 = v4;
  pid_t v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4
{
}

- (void)postClientNowPlayingNotificationNamed:(id)a3 userInfo:(id)a4 predicate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000D7EA0;
  v13[3] = &unk_10039FCB8;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 postClientNotificationNamed:v9 userInfo:v12 predicate:v13];
}

- (void)postActiveOriginDidChange:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v11 = (void (**)(void))a5;
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v9, v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kMRMediaRemotePlaybackStateUserInfoKey);

  if (v11) {
    v11[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteActiveOriginDidChangeNotification,  v9);
  }
}

- (void)postOriginDidRegister:(id)a3 handler:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v6,  0LL,  0LL);

  id v8 = -[NSMutableDictionary initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableDictionary), "initWithCapacity:", 1LL);
  MRAddPlayerPathToUserInfo(v8, v7);
  if (v9) {
    v9[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteOriginDidRegisterNotification,  v8);
  }
}

- (void)postOriginDidUnRegister:(id)a3 deviceInfo:(id)a4 handler:(id)a5
{
  id v12 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___MRPlayerPath);
  -[MRPlayerPath setOrigin:](v10, "setOrigin:", v9);

  id v11 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  MRAddPlayerPathToUserInfo(v11, v10);
  MRAddDeviceInfoToUserInfo(v11, v8);

  if (v12) {
    v12[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteOriginDidUnregisterNotification,  v11);
  }
}

- (void)postDeviceInfoDidChange:(id)a3 previousDeviceInfo:(id)a4 forOrigin:(id)a5 handler:(id)a6
{
  id v16 = (void (**)(void))a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v9,  0LL,  0LL);

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v13, v12);
  MRAddDeviceInfoToUserInfo(v13, v11);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v10,  kMRPreviousPairedDeviceUserInfoKey);
  uint64_t v14 = _MRDeviceInfoDidChangeNotification;
  if (v16)
  {
    v16[2]();
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v15 postClientNotificationNamed:v14 userInfo:v13 predicate:&stru_10039FCD8];
  }
}

- (void)postVolumeDidChange:(id)a3 volume:(float)a4 handler:(id)a5
{
  id v13 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v8, v7);

  *(float *)&double v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  kMRMediaRemotePickedRouteVolumeUserInfoKey);

  uint64_t v11 = _MRMediaRemotePickedRouteVolumeDidChangeNotification;
  if (v13)
  {
    v13[2]();
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v12 postClientNotificationNamed:v11 userInfo:v8];
  }
}

- (void)postVolumeCapabilitiesDidChange:(id)a3 capabilities:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v13 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v8, v7);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (_DWORD)v5 != 0));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v9,  kMRMediaRemotePickedRouteVolumeControlAvailabilityUserInfoKey);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v10,  kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey);

  uint64_t v11 = _MRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification;
  if (v13)
  {
    v13[2]();
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v12 postClientNotificationNamed:v11 userInfo:v8];
  }
}

- (void)postIsMutedDidChange:(id)a3 isMuted:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  id v12 = (void (**)(void))a5;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v8, v7);

  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v9,  _MRMediaRemotePickedRouteIsMutedUserInfoKey);

  uint64_t v10 = MRMediaRemotePickedRouteVolumeMutedDidChangeNotification;
  if (v12)
  {
    v12[2]();
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v11 postClientNotificationNamed:v10 userInfo:v8];
  }
}

- (void)postNowPlayingApplicationDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v14 = a3;
  id v8 = (void (**)(id, void, NSMutableDictionary *))a5;
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v14 origin]);
  else {
    id v10 = 0LL;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v11 setHomepodDemoMode:v10];

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v12, v14);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, kMRMediaRemotePlaybackStateUserInfoKey);

  if (v8) {
    v8[2](v8, _MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification, v12);
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification,  v12);
  }
}

- (void)postClientDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8)
  {
    v8[2]();
  }

  else if (MRDeviceSupportsExternalTouchBarUI( -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying,  v7)))
  {
    notify_post((const char *)[kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification UTF8String]);
  }
}

- (void)postClientDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8) {
    v8[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying,  v7);
  }
}

- (void)postPlayerDidRegisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8) {
    v8[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteNowPlayingPlayerDidRegisterCanBeNowPlaying,  v7);
  }
}

- (void)postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8) {
    v8[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteNowPlayingPlayerDidUnregisterCanBeNowPlaying,  v7);
  }
}

- (void)postClientDidRegisterForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8) {
    v8[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteNowPlayingApplicationDidRegister,  v7);
  }
}

- (void)postClientDidUnregisterForPlayerPath:(id)a3 hasDefaultSupportedCommands:(BOOL)a4 canBeNowPlaying:(BOOL)a5 handler:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = (void (**)(id, void, NSMutableDictionary *))a6;
  if (a5
    || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 origin]),
        unsigned __int8 v12 = [v11 isLocallyHosted],
        v11,
        (v12 & 1) == 0))
  {
    -[MRDNowPlayingServer postClientDidUnregisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postClientDidUnregisterCanBeNowPlayingForPlayerPath:handler:",  v14,  v10);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v13, v14);
  if (v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  _MRMediaRemoteApplicationHasDefaultSupportedCommandsUserInfoKey);
  }
  if (v10) {
    v10[2](v10, _MRMediaRemoteNowPlayingApplicationDidUnregister, v13);
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteNowPlayingApplicationDidUnregister,  v13);
  }
}

- (void)postNowPlayingClientStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  double v9 = (void (**)(void))a5;
  id v7 = a4;
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v8, v7);

  if (v9) {
    v9[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteApplicationClientStateDidChange,  v8);
  }
}

- (void)postActivePlayerDidChangeForPlayerPath:(id)a3 withPlaybackState:(unsigned int)a4 handler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v11 = (void (**)(void))a5;
  id v8 = a3;
  double v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v9, v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kMRMediaRemotePlaybackStateUserInfoKey);

  if (v11) {
    v11[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteActivePlayerDidChange,  v9);
  }
}

- (void)postIsPlayingDidChange:(BOOL)a3 lastPlayingTimestamp:(double)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  BOOL v8 = a3;
  id v14 = (void (**)(void))a6;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v11, v10);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8));
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  v12,  kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  v13,  _MRMediaRemoteOriginLastPlayingTimestampUserInfoKey);

  if (v14) {
    v14[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemotePlayerIsPlayingDidChangeNotification,  v11);
  }
}

- (void)postPictureInPictureDidChange:(BOOL)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v11 = (void (**)(void))a5;
  id v8 = a4;
  double v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v9, v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary setObject:forKey:]( v9,  "setObject:forKey:",  v10,  kMRMediaRemotePlayerPictureInPictureEnabledUserInfoKey);

  if (v11) {
    v11[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemotePlayerPictureInPictureDidChange,  v9);
  }
}

- (void)postActivePlayerPathsDidChangeForOrigin:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void, NSMutableDictionary *))a4;
  if ([v9 isLocal])
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v9,  0LL,  0LL);
    MRAddPlayerPathToUserInfo(v7, v8);
    if (v6) {
      v6[2](v6, kMRMediaRemoteActivePlayerPathsDidChange, v7);
    }
    else {
      -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteActivePlayerPathsDidChange,  v7);
    }
  }
}

- (void)postAudioFormatContentInfoDidChangeForOrigin:(id)a3 handler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void, NSMutableDictionary *))a4;
  if ([v9 isLocal])
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v9,  0LL,  0LL);
    MRAddPlayerPathToUserInfo(v7, v8);
    if (v6) {
      v6[2](v6, kMRMediaRemoteAudioFormatContentInfoDidChange, v7);
    }
    else {
      -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRMediaRemoteAudioFormatContentInfoDidChange,  v7);
    }
  }
}

- (void)postPlaybackStateDidChange:(unsigned int)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v9, v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, kMRMediaRemotePlaybackStateUserInfoKey);

  if (v11)
  {
    v11[2]();
  }

  else if (MRDeviceSupportsExternalTouchBarUI( -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemotePlayerPlaybackStateDidChangeNotification,  v9)))
  {
    notify_post((const char *)[kMRMediaRemoteNowPlayingExternalTouchBarInvocationNotification UTF8String]);
  }
}

- (void)postNowPlayingPlayerStateDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v9 = (void (**)(void))a5;
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v8, v7);

  if (v9) {
    v9[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemotePlayerStateDidChange,  v8);
  }
}

- (void)postSupportedCommandsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, void, NSMutableDictionary *))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v11, v9);

  unsigned __int8 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v10,  kMRSupportedCommandsDataUserInfoKey);

  uint64_t v13 = _MRMediaRemotePlayerSupportedCommandsDidChangeNotification;
  if (v8)
  {
    v8[2](v8, _MRMediaRemotePlayerSupportedCommandsDidChangeNotification, v11);
  }

  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000D9308;
    v14[3] = &unk_1003995A8;
    id v15 = v12;
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:predicate:]( self,  "postClientNowPlayingNotificationNamed:userInfo:predicate:",  v13,  v11,  v14);
  }
}

- (void)postPlaybackQueueDidChange:(id)a3 nowPlayingItemDidChange:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  BOOL v8 = a4;
  unsigned int v29 = self;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void, NSMutableDictionary *))a6;
  unsigned __int8 v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v12, v10);
  uint64_t v13 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
  id v30 = v10;
  MRAddPlayerPathToUserInfo(v13, v10);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 contentItemWithOffset:0]);
  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:]( &OBJC_CLASS___MRPlaybackQueueRequest,  "defaultPlaybackQueueRequestWithRange:",  0LL,  1LL));
    id v16 = (void *)MRContentItemCreateFromRequest(v14, v15);
    __int128 v17 = objc_alloc(&OBJC_CLASS___MRPlaybackQueue);
    v34 = v16;
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    id v19 = v9;
    BOOL v20 = v8;
    id v21 = (void *)v18;
    id v22 = v19;
    id v23 = -[MRPlaybackQueue initWithContentItems:location:withPropertiesFromPlaybackQueue:]( v17,  "initWithContentItems:location:withPropertiesFromPlaybackQueue:",  v18,  0LL);

    MRPlaybackQueueToUserInfo(v13, v23);
    if (!v20) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v22 = v9;
  id v28 = -[MRPlaybackQueue initWithContentItems:location:withPropertiesFromPlaybackQueue:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueue),  "initWithContentItems:location:withPropertiesFromPlaybackQueue:",  &__NSArray0__struct,  0LL,  v9);
  MRPlaybackQueueToUserInfo(v13, v28);

  id v16 = 0LL;
  if (v8)
  {
LABEL_3:
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL, v29));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v24,  _MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey);
  }

- (void)postPlaybackQueueContentItemsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, NSMutableDictionary *))a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v11, v9);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (MRContentItemGetArtworkData(v17)) {
          MRContentItemSetArtworkData(v17, 0LL);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  uint64_t v18 = _MRPlayerPlaybackQueueContentItemsChangedNotification;
  if (v10)
  {
    v10[2](v10, _MRPlayerPlaybackQueueContentItemsChangedNotification, v11);
  }

  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000D992C;
    v19[3] = &unk_10039FD00;
    id v20 = v9;
    id v21 = v12;
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:predicate:]( self,  "postClientNowPlayingNotificationNamed:userInfo:predicate:",  v18,  v11,  v19);
  }
}

- (void)postPlaybackQueueContentItemsArtworkDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, NSMutableDictionary *))a5;
  if (v8 && [v8 count])
  {
    uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    MRAddPlayerPathToUserInfo(v11, v9);
    uint64_t v12 = _MRPlayerPlaybackQueueContentItemArtworkChangedNotification;
    if (v10)
    {
      v10[2](v10, _MRPlayerPlaybackQueueContentItemArtworkChangedNotification, v11);
    }

    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000D9BD0;
      v13[3] = &unk_10039FD00;
      id v14 = v9;
      id v15 = v8;
      -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:predicate:]( self,  "postClientNowPlayingNotificationNamed:userInfo:predicate:",  v12,  v11,  v13);
    }
  }
}

- (void)postPlaybackQueueCapabilitiesDidChange:(unint64_t)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  uint64_t v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v9, v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v10,  kMRPlaybackQueueCapabilitiesUserInfoKey);

  if (v11) {
    v11[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  kMRPlaybackQueueCapabilitiesChangedNotification,  v9);
  }
}

- (void)postPlaybackQueueParticipantsDidChange:(id)a3 forPlayerPath:(id)a4 handler:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, void, NSMutableDictionary *))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 client]);
  unsigned int v9 = [v8 isSystemMediaApplication];

  if (v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    MRAddPlayerPathToUserInfo(v10, v11);
    if (v7) {
      v7[2](v7, MRPlaybackQueueParticipantsDidChangeForPlayerNotification, v10);
    }
    else {
      -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  MRPlaybackQueueParticipantsDidChangeForPlayerNotification,  v10);
    }
  }
}

- (void)postPlayerDidRegisterForPlayerPath:(id)a3 handler:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  if (v8) {
    v8[2]();
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteNowPlayingPlayerDidRegister,  v7);
  }
}

- (void)postPlayerDidUnregisterWithPlaybackState:(unsigned int)a3 canBeNowPlaying:(BOOL)a4 forPlayerPath:(id)a5 handler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v15 = a5;
  id v10 = (void (**)(id, void, NSMutableDictionary *))a6;
  if (a4
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue([v15 origin]),
        unsigned __int8 v12 = [v11 isLocal],
        v11,
        (v12 & 1) == 0))
  {
    -[MRDNowPlayingServer postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:handler:]( self,  "postPlayerDidUnregisterCanBeNowPlayingForPlayerPath:handler:",  v15,  v10);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v13, v15);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, kMRMediaRemotePlaybackStateUserInfoKey);

  if (v10) {
    v10[2](v10, _MRMediaRemoteNowPlayingPlayerDidUnregister, v13);
  }
  else {
    -[MRDNowPlayingServer postClientNowPlayingNotificationNamed:userInfo:]( self,  "postClientNowPlayingNotificationNamed:userInfo:",  _MRMediaRemoteNowPlayingPlayerDidUnregister,  v13);
  }
}

- (void)postElectedPlayerDidChange:(id)a3 change:(int64_t)a4 event:(int64_t)a5 reason:(id)a6 handler:(id)a7
{
  id v18 = a6;
  id v11 = (void (**)(id, void, NSMutableDictionary *))a7;
  id v12 = a3;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v13, v12);

  if (v18) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v18,  kMRMediaRemoteElectedPlayerReasonUserInfoKey);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v15,  @"MRDElectedPlayerControllerEventUserInfoKey");

  uint64_t v16 = kMRMediaRemoteElectedPlayerDidChangeNotification;
  if (v11)
  {
    v11[2](v11, kMRMediaRemoteElectedPlayerDidChangeNotification, v13);
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v17 postClientNotificationNamed:v16 userInfo:v13 predicate:&stru_10039FD40];

    notify_post("com.apple.mediaremote.electedPlayerDidChange");
  }
}

- (void)postLockScreenVisibleDidChange:(BOOL)a3 handler:(id)a4
{
  id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidAppearNotification;
  if (!a3) {
    id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidDisappearNotification;
  }
  uint64_t v5 = *v4;
  if (a4)
  {
    id v7 = (void (*)(id))*((void *)a4 + 2);
    id v9 = v5;
    v7(a4);
  }

  else
  {
    id v8 = v5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v9 postClientNotificationNamed:v8 predicate:&stru_10039FD60];
  }
}

- (void)postLockScreenActiveDidChange:(BOOL)a3 handler:(id)a4
{
  id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidActivateNotification;
  if (!a3) {
    id v4 = (void **)&kMRMediaRemoteLockScreenControlsDidDeactivateNotification;
  }
  uint64_t v5 = *v4;
  if (a4)
  {
    id v7 = (void (*)(id))*((void *)a4 + 2);
    id v9 = v5;
    v7(a4);
  }

  else
  {
    id v8 = v5;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v9 postClientNotificationNamed:v8 predicate:&stru_10039FD80];
  }
}

- (void)postLockScreenPlayerPathDidChange:(id)a3 handler:(id)a4
{
  id v10 = (void (**)(void))a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  MRAddPlayerPathToUserInfo(v7, v6);

  id v8 = kMRMediaRemoteLockScreenControlsPlayerPathDidChangeNotification;
  if (v10)
  {
    v10[2]();
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v9 postClientNotificationNamed:v8 userInfo:v7 predicate:&stru_10039FDA0];
  }

  block = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_1000DA550;
  id v15 = &unk_100399250;
  uint64_t v16 = self;
  if (qword_1003FDE60 != -1) {
    dispatch_once(&qword_1003FDE60, &block);
  }
  -[MRDNowPlayingServer postLockScreenControlsDidChangeDistributedNotification]( self,  "postLockScreenControlsDidChangeDistributedNotification",  v10,  block,  v13,  v14,  v15,  v16);
}

- (void)postLockScreenControlsDidChangeDistributedNotification
{
  uint64_t v2 = _MRLogForCategory(1LL, a2);
  unsigned __int8 v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  uint64_t v5 = (void *)MRMediaRemoteLockScreenControlsDidChangeDistributedNotification;
  if (v4)
  {
    int v6 = 138412290;
    uint64_t v7 = MRMediaRemoteLockScreenControlsDidChangeDistributedNotification;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v6, 0xCu);
  }

  notify_post((const char *)[v5 UTF8String]);
}

- (void)maybePostDistributedNotifications
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DA888;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (id)augmentedUserInfoForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer activePlayerPath](self, "activePlayerPath"));
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, kMRActiveNowPlayingPlayerPathUserInfoKey);
  }
  if (v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer queryExistingPlayerPath:](self, "queryExistingPlayerPath:", v4));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 originClient]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 activeNowPlayingClient]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 activePlayerClient]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 playerPath]);

    if (v11) {
      goto LABEL_7;
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 originClient]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeNowPlayingClient]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 playerPath]);

    if (v11
      || (id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 originClient]),
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 playerPath]),
          v14,
          v11))
    {
LABEL_7:
      -[NSMutableDictionary setValue:forKey:]( v5,  "setValue:forKey:",  v11,  kMROriginActiveNowPlayingPlayerPathUserInfoKey);
    }
  }

  return v5;
}

- (void)registerOriginForwarder:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DB044;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)unregisterOriginForwarder:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DB114;
  block[3] = &unk_100398E60;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (BOOL)_hasForwarderForOrigin:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = self->_originForwarders;
  id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "destinationOrigin", (void)v12));
        unsigned __int8 v10 = [v9 isEqual:v4];

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }

      id v6 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)_addOrigin:(id)a3 withDeviceInfo:(id)a4 emitNotification:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 routingContextID]);
  id v18 = (id)objc_claimAutoreleasedReturnValue([v10 createCustomOriginClientForOrigin:v8 routingContextID:v11]);

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 originClientRequestsForPlayerPath:v13]);

  [v14 setDeviceInfo:v9];
  serialQueue = self->_serialQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000DB3A0;
  v19[3] = &unk_10039FE28;
  void v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  BOOL v22 = a5;
  id v16 = v9;
  id v17 = v8;
  msv_dispatch_sync_on_queue(serialQueue, v19);
}

- (void)_removeOrigin:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000DB670;
  v8[3] = &unk_100398E60;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v8);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  [v6 removeOrigin:v7];
}

- (void)_removeNowPlayingClient:(id)a3 forOrigin:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer originClientForOrigin:](self, "originClientForOrigin:", a4));
  [v7 removeNowPlayingClientForClient:v6];
}

- (void)setOverrideClient:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  [v5 setOverrideClient:v4];
}

- (id)overrideClient
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingServer localOriginClient](self, "localOriginClient"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 overrideClient]);

  return v3;
}

- (void)setActiveOrigin:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000DBA2C;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_onQueue_setActiveOrigin:(id)a3 saveState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v7 = (MRDNowPlayingOriginClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer _onQueue_originClientForOrigin:]( self,  "_onQueue_originClientForOrigin:",  v6));
  id v9 = self->_activeOriginClient;
  if (v7 != v9)
  {
    uint64_t v10 = _MRLogForCategory(0LL, v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient origin](v9, "origin"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient origin](v7, "origin"));
      int v14 = 138412546;
      __int128 v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting active origin from %@ to %@",  (uint8_t *)&v14,  0x16u);
    }

    -[MRDNowPlayingServer setActiveOriginClient:](self, "setActiveOriginClient:", v7);
    -[MRDNowPlayingServer nowPlayingServer:activeOriginDidChangeFromOriginClient:toOriginClient:]( self,  "nowPlayingServer:activeOriginDidChangeFromOriginClient:toOriginClient:",  self,  self->_activeOriginClient,  v7);
  }

  if (v4) {
    -[MRDNowPlayingServer _onQueue_savePersistentActiveOrigin:](self, "_onQueue_savePersistentActiveOrigin:", v6);
  }
}

- (void)_onQueue_savePersistentActiveOrigin:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Persisting active origin %@",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v9 = v8;
  if (v4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    [v9 setObject:v10 forKey:@"_MRDActiveOriginDataDefaultsKey"];
  }

  else
  {
    [v8 removeObjectForKey:@"_MRDActiveOriginDataDefaultsKey"];
  }
}

- (id)_onQueue_restoredActiveOrigin
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"_MRDActiveOriginDataDefaultsKey"]);
  if (v3) {
    id v4 = -[MROrigin initWithData:](objc_alloc(&OBJC_CLASS___MROrigin), "initWithData:", v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_onQueue_originClientForOrigin:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = self->_originClients;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "origin", (void)v16));
        unsigned int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)_onQueue_originClientForDeviceUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v5 = self->_originClients;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceInfo", (void)v20));
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceUID]);
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            if (!v8
              || (__int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDNowPlayingOriginClient registrationDate](v8, "registrationDate")),
                  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 registrationDate]),
                  id v17 = [v15 compare:v16],
                  v16,
                  v15,
                  v17 == (id)1))
            {
              __int128 v18 = v11;

              uint64_t v8 = v18;
            }
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
      }

      while (v7);
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = self->_localOriginClient;
  }

  return v8;
}

- (id)_onQueue_originClientForGroupLeaderOfDeviceUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v4)
  {
    __int128 v18 = self->_localOriginClient;
LABEL_23:
    id v6 = v18;
    goto LABEL_24;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  uint64_t v5 = self->_originClients;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
  if (!v23)
  {

LABEL_22:
    __int128 v18 = (MRDNowPlayingOriginClient *)objc_claimAutoreleasedReturnValue( -[MRDNowPlayingServer _onQueue_originClientForDeviceUID:]( self,  "_onQueue_originClientForDeviceUID:",  v4));
    goto LABEL_23;
  }

  __int128 v20 = self;
  id obj = v5;
  id v6 = 0LL;
  uint64_t v22 = *(void *)v29;
  do
  {
    for (i = 0LL; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v29 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceInfo", v20));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupedDevices]);

      id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (j = 0LL; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v24 + 1) + 8 * (void)j) deviceUID]);
            unsigned int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              id v17 = v8;

              id v6 = v17;
            }
          }

          id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }

        while (v12);
      }
    }

    id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
  }

  while (v23);

  self = v20;
  if (!v6) {
    goto LABEL_22;
  }
LABEL_24:

  return v6;
}

- (void)setActiveOriginClient:(id)a3
{
}

- (void)setLocalOriginClient:(id)a3
{
}

- (MRDElectedPlayerController)electedPlayerController
{
  return self->_electedPlayerController;
}

- (MRDLockScreenController)lockScreenController
{
  return self->_lockScreenController;
}

- (MRDLockScreenRoutingControllerProtocol)lockScreenRoutingController
{
  return self->_lockScreenRoutingController;
}

- (MRDNowPlayingLauncher)nowPlayingCapLauncher
{
  return self->_nowPlayingCapLauncher;
}

- (void)setNowPlayingCapLauncher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface MRDExternalDeviceRemoteServer
+ (unint64_t)minimumSupportedHangdogApplicationVersion;
+ (unint64_t)minimumSupportedProtocolVersion;
- (BOOL)_connection:(id)a3 canReceiveUpdatesForOrigin:(id)a4;
- (BOOL)_connection:(id)a3 canReceiveUpdatesForPlayerPath:(id)a4;
- (BOOL)_connection:(id)a3 wasPreviouslySubscribedToPlayerPath:(id)a4;
- (BOOL)_isConnectionForManagedConfigIDAllowed:(id)a3;
- (BOOL)_origin:(id)a3 client:(id)a4 matchesSubscribedPlayerPath:(id)a5;
- (BOOL)_origin:(id)a3 client:(id)a4 player:(id)a5 matchesSubscribedPlayerPath:(id)a6;
- (BOOL)_origin:(id)a3 matchesSubscribedPlayerPath:(id)a4;
- (BOOL)_playerPath:(id)a3 matchesSubscribedPlayerPath:(id)a4;
- (BOOL)_shouldSendStateUpdateMessageFromSource:(int64_t)a3 toClient:(id)a4;
- (BOOL)_verifyClientVersionCompatibility:(id)a3 withError:(id *)a4;
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDExternalDeviceRemoteServer)init;
- (MRDExternalDeviceRemoteServer)initWithRoutingDataSource:(id)a3;
- (MRDRemoteControlService)remoteControlService;
- (NSArray)clients;
- (NSArray)endpoints;
- (NSMapTable)clientDisconnectionHandlers;
- (id)_clientForIdentifier:(id)a3;
- (id)_clientForPairingSession:(id)a3;
- (id)_createLocalizedOutputDevice:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6;
- (id)_createLocalizedOutputDevices:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6;
- (id)_findClientIf:(id)a3;
- (id)_unpair:(id)a3;
- (unsigned)serverDiscoveryModeForConfiguration:(id)a3;
- (void)_activeSystemEndpointDidChangeNotification:(id)a3;
- (void)_addNowPlayingStateToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addOutputDevicesToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 nowPlayingClient:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 originClient:(id)a5;
- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 playerClient:(id)a5;
- (void)_addToMessage:(id)a3 withAllClusterDeviceMembers:(id)a4 block:(id)a5;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 outputDevice:(id)a5 withEndpoint:(id)a6;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5;
- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5 completion:(id)a6;
- (void)_broadcastKeyboardMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5;
- (void)_broadcastRemoteTextInputMessageWithPayload:(id)a3;
- (void)_clearPlaybackQueueForPlayerPath:(id)a3;
- (void)_disconnectClient:(id)a3 withError:(id)a4;
- (void)_handleAdjustVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleClientConnection:(id)a3;
- (void)_handleClientUpdatesConfigMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateHostedEndpointRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeletePairedDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeletePairingIdentityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDeviceInfoRequest:(id)a3 fromClient:(id)a4;
- (void)_handleDeviceInfoUpdateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGenericMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetInputModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetKeyboardSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPairedDevicesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetRemoteTextInputSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeControlCapabilitiesMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetVolumeMutedMessage:(id)a3 fromClient:(id)a4;
- (void)_handleHiliteModeChanged:(id)a3;
- (void)_handleInvalidateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleLyricsEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handleModifyOutputContextRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleMuteVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackQueueRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionMigrateRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlaybackSessionRequestMessage:(id)a3 fromClient:(id)a4;
- (void)_handleReceivedButtonEvent:(_MRHIDButtonEvent)a3 fromClient:(id)a4;
- (void)_handleReceivedCommand:(id)a3 fromClient:(id)a4;
- (void)_handleReceivedVoiceInputMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterGameControllerMessage:(id)a3 client:(id)a4;
- (void)_handleRegisterHIDDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRegisterVoiceInputDeviceMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRemoteDeviceInfo:(id)a3;
- (void)_handleRemoteTextInputMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendTelevisionCustomDataMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetConnectionStateMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetConversationDetectionEnabledMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetDiscoveryModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetHiliteModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetInputModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetListeningModeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetMessageLogging:(id)a3 fromClient:(id)a4;
- (void)_handleSetVolumeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTelevisionEndpointAvailableMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTextInputMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTouchEvent:(_MRHIDTouchEvent *)a3 withDeviceID:(unint64_t)a4 fromClient:(id)a5;
- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4;
- (void)_handleUpdateActiveSystemEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)_notifyAndDisconnectClient:(id)a3 withError:(id)a4;
- (void)_notifyAndDisconnectClients:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_onQueue_registerDisconnectionHandler:(id)a3 forClient:(id)a4;
- (void)_prewarmMediaApps;
- (void)_registerCallbacks;
- (void)_sendMessageFromEndpoint:(id)a3 outputDevice:(id)a4 withSource:(int64_t)a5 handler:(id)a6;
- (void)_sendMessageFromEndpoint:(id)a3 withSource:(int64_t)a4 handler:(id)a5;
- (void)_sendStateUpdateMessageFromOrigin:(id)a3 source:(int64_t)a4 handler:(id)a5;
- (void)_sendStateUpdateMessageFromPlayerPath:(id)a3 source:(int64_t)a4 handler:(id)a5;
- (void)_setGameControllerInputMode:(unsigned int)a3;
- (void)_syncStateToClient:(id)a3;
- (void)addAuthorizationCallbackForOutputDevice:(id)a3 callback:(id)a4;
- (void)addAuthorizationCallbackForOutputDevice:(id)a3 client:(id)a4;
- (void)clearEndpointForClient:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)deviceInfoDidChangeNotification:(id)a3;
- (void)endpointDidAddOutputDeviceNotification:(id)a3;
- (void)endpointDidChangeOutputDeviceNotification:(id)a3;
- (void)endpointDidRemoveOutputDeviceNotification:(id)a3;
- (void)endpointVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)endpointVolumeDidChangeNotification:(id)a3;
- (void)endpointVolumeMutedDidChangeNotification:(id)a3;
- (void)externalDeviceClient:(id)a3 gameController:(unint64_t)a4 propertiesChanged:(id)a5;
- (void)gameControllerConnectionDidInterrupt:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)outputDevicesChanged:(id)a3 forConfiguration:(id)a4;
- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4;
- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4;
- (void)pairingSession:(id)a3 showSetupCode:(id)a4;
- (void)pinPairingDialogDidClose:(id)a3 forClient:(id)a4 userCancelled:(BOOL)a5;
- (void)playbackDidTimeoutNotification:(id)a3;
- (void)playerParticipantsDidChangeNotification:(id)a3;
- (void)purgeUnusedDiscoverySessions;
- (void)registerNotifications;
- (void)remoteControlService:(id)a3 didAcceptClientConnection:(id)a4;
- (void)removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)setServerDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)sleepObserverSystemWillSleep:(id)a3 completion:(id)a4;
- (void)start;
- (void)stateObserver:(id)a3 didReceiveClientDidUnregister:(id)a4;
- (void)stateObserver:(id)a3 didReceiveCoalescedNowPlayingStateChange:(id)a4 playerPath:(id)a5;
- (void)stateObserver:(id)a3 didReceiveDefaultSupportedCommandsChange:(id)a4 playerPath:(id)a5;
- (void)stateObserver:(id)a3 didReceiveNowPlayingClientChange:(id)a4;
- (void)stateObserver:(id)a3 didReceiveNowPlayingPlayerChange:(id)a4;
- (void)stateObserver:(id)a3 didReceivePlayerDidUnregister:(id)a4;
- (void)stateObserver:(id)a3 didReceiveVolumeControlCapabilitiesChange:(unsigned int)a4 playerPath:(id)a5;
- (void)stop;
- (void)textEditingService:(id)a3 attributesDidChange:(id)a4 payload:(id)a5;
- (void)textEditingService:(id)a3 echoWithText:(id)a4;
- (void)textEditingService:(id)a3 textDidChange:(id)a4 payload:(id)a5;
- (void)textEditingService:(id)a3 textEditingDidBegin:(id)a4 withAttributes:(id)a5 payload:(id)a6;
- (void)textEditingServiceTextEditingDidEnd:(id)a3;
- (void)updateASEAssertionForRemoteDeviceID:(id)a3 isAsserting:(BOOL)a4;
@end

@implementation MRDExternalDeviceRemoteServer

+ (unint64_t)minimumSupportedProtocolVersion
{
  return 1LL;
}

+ (unint64_t)minimumSupportedHangdogApplicationVersion
{
  return 74LL;
}

- (MRDExternalDeviceRemoteServer)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceRemoteServer;
  v6 = -[MRDExternalDeviceRemoteServer init](&v48, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routingDataSource, a3);
    v8 = -[MRDRemoteControlService initWithRoutingDataSource:]( objc_alloc(&OBJC_CLASS___MRDRemoteControlService),  "initWithRoutingDataSource:",  v5);
    remoteControlService = v7->_remoteControlService;
    v7->_remoteControlService = v8;

    -[MRDRemoteControlService setDelegate:](v7->_remoteControlService, "setDelegate:", v7);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connectedClients = v7->_connectedClients;
    v7->_connectedClients = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    tvEndpoints = v7->_tvEndpoints;
    v7->_tvEndpoints = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    activeReconSessions = v7->_activeReconSessions;
    v7->_activeReconSessions = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDeviceRemoteServer.SerialQueue", v17);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v18;

    v7->_serverIsRunning = 0;
    v20 = objc_alloc_init(&OBJC_CLASS___MRDNowPlayingStateObserver);
    stateObserver = v7->_stateObserver;
    v7->_stateObserver = v20;

    -[MRDNowPlayingStateObserver setDelegate:](v7->_stateObserver, "setDelegate:", v7);
    v7->_gameControllerInputMode = 0;
    v22 = objc_alloc_init(&OBJC_CLASS___MRDPinPairingDialog);
    pinPairingDialog = v7->_pinPairingDialog;
    v7->_pinPairingDialog = v22;

    -[MRDPinPairingDialog setDelegate:](v7->_pinPairingDialog, "setDelegate:", v7);
    v24 = objc_alloc_init(&OBJC_CLASS___MRDSleepObserver);
    sleepObserver = v7->_sleepObserver;
    v7->_sleepObserver = v24;

    -[MRDSleepObserver setDelegate:](v7->_sleepObserver, "setDelegate:", v7);
    v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    outputDeviceCallbackTokens = v7->_outputDeviceCallbackTokens;
    v7->_outputDeviceCallbackTokens = v26;

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    discoverySessions = v7->_discoverySessions;
    v7->_discoverySessions = v28;

    v30 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  512LL,  0LL,  0LL);
    clientDisconnectionHandlers = v7->_clientDisconnectionHandlers;
    v7->_clientDisconnectionHandlers = v30;

    -[MRDExternalDeviceRemoteServer registerNotifications](v7, "registerNotifications");
    if (sub_10013DAD4())
    {
      v32 = objc_alloc_init(&OBJC_CLASS___MRDTelevisionSiriService);
      siriService = v7->_siriService;
      v7->_siriService = v32;

      v34 = objc_alloc_init(&OBJC_CLASS___MRDSystemHIDEventManager);
      hidEventManager = v7->_hidEventManager;
      v7->_hidEventManager = v34;

      v36 = objc_alloc_init(&OBJC_CLASS___MRDTextEditingService);
      textEditingService = v7->_textEditingService;
      v7->_textEditingService = v36;

      -[MRDTextEditingService setDelegate:](v7->_textEditingService, "setDelegate:", v7);
      -[MRDTextEditingService start](v7->_textEditingService, "start");
    }

    v38 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activeSystemEndpointAssertionsByOrigin = v7->_activeSystemEndpointAssertionsByOrigin;
    v7->_activeSystemEndpointAssertionsByOrigin = v38;

    if (sub_10013DAD4())
    {
      id v40 = objc_msgSend( (id)MSVWeakLinkClass(@"PBSSystemServiceConnection", @"PineBoardServices"),  "sharedConnection");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v41 systemServiceProxy]);
      v7->_hiliteMode = [v42 hiliteModeActive];
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v43 transactionWaitDurationOnNetworkSend];
    v7->_transactionWaitDuration = v44;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000B61C8;
    block[3] = &unk_100399250;
    v47 = v7;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v7;
}

- (MRDExternalDeviceRemoteServer)init
{
  return -[MRDExternalDeviceRemoteServer initWithRoutingDataSource:](self, "initWithRoutingDataSource:", 0LL);
}

- (void)registerNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_activeSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointDidAddOutputDeviceNotification:" name:MRAVEndpointDidAddOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointDidChangeOutputDeviceNotification:" name:MRAVEndpointDidChangeOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointDidRemoveOutputDeviceNotification:" name:MRAVEndpointDidRemoveOutputDeviceNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeControlCapabilitiesDidChangeNotification:" name:kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeDidChangeNotification:" name:kMRAVEndpointVolumeDidChangeNotification object:0];
  [v3 addObserver:self selector:"endpointVolumeMutedDidChangeNotification:" name:MRAVEndpointVolumeMutedDidChangeNotification object:0];
  [v3 addObserver:self selector:"deviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
  [v3 addObserver:self selector:"playerParticipantsDidChangeNotification:" name:MRPlaybackQueueParticipantsDidChangeForPlayerNotification object:0];
  [v3 addObserver:self selector:"playbackDidTimeoutNotification:" name:_MRMediaRemotePlaybackDidTimeoutNotification object:0];
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[MRDExternalDeviceRemoteServer stop](self, "stop");
  -[MRDNowPlayingStateObserver setDelegate:](self->_stateObserver, "setDelegate:", 0LL);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v4 = self->_connectedClients;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) cryptoSession]);
        [v9 setDelegate:0];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceRemoteServer;
  -[MRDExternalDeviceRemoteServer dealloc](&v10, "dealloc");
}

- (void)start
{
  self->_serverIsRunning = 1;
}

- (void)stop
{
  self->_serverIsRunning = 0;
}

- (void)clearEndpointForClient:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(3LL, v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Removing television endpoint for client %{public}@",  buf,  0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B662C;
  v10[3] = &unk_100398E60;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(serialQueue, v10);
}

- (NSArray)clients
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000B66EC;
  objc_super v10 = sub_1000B66FC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B6704;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)endpoints
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_1000B66EC;
  objc_super v10 = sub_1000B66FC;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B67F0;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)remoteControlService:(id)a3 didAcceptClientConnection:(id)a4
{
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v7 type];
  id v9 = v6;
  if ([v7 type] == (id)15 || objc_msgSend(v7, "type") == (id)37)
  {
    id v10 = v7;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);

    if (v11)
    {
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
      [v9 setDeviceInfo:v12];

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 supportedProtocolMessages]);
      [v9 setSupportedMessages:v13];

      uint64_t v15 = _MRLogForCategory(4LL, v14);
      dispatch_queue_attr_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
        *(_DWORD *)buf = 138543362;
        v55 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Received device info: %{public}@",  buf,  0xCu);
      }
    }
  }

  id v53 = 0LL;
  unsigned __int8 v18 = -[MRDExternalDeviceRemoteServer _verifyClientVersionCompatibility:withError:]( self,  "_verifyClientVersionCompatibility:withError:",  v9,  &v53);
  Error = (os_log_s *)v53;
  if ((v18 & 1) == 0)
  {
    uint64_t v27 = _MRLogForCategory(3LL, v19);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1002B7B80();
    }
    goto LABEL_18;
  }

  if ([v7 encryptionType] == (id)1)
  {
    if ([v9 cryptoEnabled])
    {
      if ([v7 encryptionType] != (id)1
        || (v22 = (void *)objc_claimAutoreleasedReturnValue([v9 cryptoSession]),
            unsigned __int8 v23 = [v22 isValid],
            v22,
            (v23 & 1) == 0))
      {
        uint64_t v24 = _MRLogForCategory(3LL, v21);
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1002B7B54();
        }

        v26 = Error;
        Error = (os_log_s *)MRMediaRemoteCreateError(101LL);
LABEL_18:
      }
    }
  }

  if (([v9 isAllowedToSendMessageType:v8] & 1) == 0)
  {
    uint64_t v29 = _MRLogForCategory(3LL, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1002B7AF4();
    }

    uint64_t v31 = MRMediaRemoteCreateError(3LL);
    Error = (os_log_s *)v31;
  }

  if (Error)
  {
    id v32 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:Error];
    [v7 replyWithMessage:v32];
LABEL_25:
  }

  else if (v8 > 105)
  {
    switch(v8)
    {
      case 121LL:
        -[MRDExternalDeviceRemoteServer _handleCreateHostedEndpointRequestMessage:fromClient:]( self,  "_handleCreateHostedEndpointRequestMessage:fromClient:",  v7,  v9);
        break;
      case 122LL:
      case 123LL:
      case 124LL:
      case 127LL:
      case 129LL:
      case 131LL:
      case 133LL:
        break;
      case 125LL:
        -[MRDExternalDeviceRemoteServer _handleAdjustVolumeMessage:fromClient:]( self,  "_handleAdjustVolumeMessage:fromClient:",  v7,  v9);
        break;
      case 126LL:
        -[MRDExternalDeviceRemoteServer _handleGetVolumeMutedMessage:fromClient:]( self,  "_handleGetVolumeMutedMessage:fromClient:",  v7,  v9);
        break;
      case 128LL:
        -[MRDExternalDeviceRemoteServer _handleMuteVolumeMessage:fromClient:]( self,  "_handleMuteVolumeMessage:fromClient:",  v7,  v9);
        break;
      case 130LL:
        -[MRDExternalDeviceRemoteServer _handleSetConversationDetectionEnabledMessage:fromClient:]( self,  "_handleSetConversationDetectionEnabledMessage:fromClient:",  v7,  v9);
        break;
      case 132LL:
        -[MRDExternalDeviceRemoteServer _handleRequestGroupSessionMessage:fromClient:]( self,  "_handleRequestGroupSessionMessage:fromClient:",  v7,  v9);
        break;
      case 134LL:
        -[MRDExternalDeviceRemoteServer _handleCreateApplicationConnectionMessage:fromClient:]( self,  "_handleCreateApplicationConnectionMessage:fromClient:",  v7,  v9);
        break;
      case 135LL:
        -[MRDExternalDeviceRemoteServer _handleApplicationConnectionMessage:fromClient:]( self,  "_handleApplicationConnectionMessage:fromClient:",  v7,  v9);
        break;
      case 136LL:
        -[MRDExternalDeviceRemoteServer _handleInvalidateApplicationConnectionMessage:fromClient:]( self,  "_handleInvalidateApplicationConnectionMessage:fromClient:",  v7,  v9);
        break;
      default:
        if (v8 == 106)
        {
          -[MRDExternalDeviceRemoteServer _handleTriggerAudioFadeMessage:fromClient:]( self,  "_handleTriggerAudioFadeMessage:fromClient:",  v7,  v9);
        }

        else if (v8 == 110)
        {
          -[MRDExternalDeviceRemoteServer _handleSetListeningModeMessage:fromClient:]( self,  "_handleSetListeningModeMessage:fromClient:",  v7,  v9);
        }

        break;
    }
  }

  else
  {
    switch(v8)
    {
      case 0LL:
        uint64_t v35 = _MRLogForCategory(3LL, v28);
        id v32 = (id)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
          sub_1002B7A8C((os_log_s *)v32, v36, v37, v38, v39, v40, v41, v42);
        }
        goto LABEL_25;
      case 1LL:
        -[MRDExternalDeviceRemoteServer _handleReceivedCommand:fromClient:]( self,  "_handleReceivedCommand:fromClient:",  v7,  v9);
        break;
      case 2LL:
      case 3LL:
      case 4LL:
      case 5LL:
      case 7LL:
      case 9LL:
      case 11LL:
      case 12LL:
      case 13LL:
      case 14LL:
      case 17LL:
      case 20LL:
      case 22LL:
      case 23LL:
      case 26LL:
      case 27LL:
      case 29LL:
      case 30LL:
      case 33LL:
      case 34LL:
      case 35LL:
      case 45LL:
      case 46LL:
      case 47LL:
      case 50LL:
      case 52LL:
      case 53LL:
      case 54LL:
      case 55LL:
      case 56LL:
      case 57LL:
      case 58LL:
      case 59LL:
      case 60LL:
      case 61LL:
      case 63LL:
      case 64LL:
      case 65LL:
      case 66LL:
      case 71LL:
      case 72LL:
      case 74LL:
        break;
      case 6LL:
        -[MRDExternalDeviceRemoteServer _handleRegisterHIDDeviceMessage:fromClient:]( self,  "_handleRegisterHIDDeviceMessage:fromClient:",  v7,  v9);
        break;
      case 8LL:
      case 39LL:
        id v33 = [v7 buttonEvent];
        -[MRDExternalDeviceRemoteServer _handleReceivedButtonEvent:fromClient:]( self,  "_handleReceivedButtonEvent:fromClient:",  v33,  v34,  v9);
        break;
      case 10LL:
        id v43 = v7;
        id v44 = v43;
        if (v43) {
          [v43 event];
        }
        else {
          memset(v52, 0, sizeof(v52));
        }
        id v48 = [v44 virtualDeviceID];
        v49 = v52;
        goto LABEL_87;
      case 15LL:
        -[MRDExternalDeviceRemoteServer _handleDeviceInfoRequest:fromClient:]( self,  "_handleDeviceInfoRequest:fromClient:",  v7,  v9);
        break;
      case 16LL:
        -[MRDExternalDeviceRemoteServer _handleClientUpdatesConfigMessage:fromClient:]( self,  "_handleClientUpdatesConfigMessage:fromClient:",  v7,  v9);
        break;
      case 18LL:
        id v45 = v7;
        id v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "gameControllerWithID:", objc_msgSend(v45, "controllerID")));
        v46 = (void *)objc_claimAutoreleasedReturnValue([v45 event]);

        [v44 sendGameControllerEvent:v46];
        goto LABEL_88;
      case 19LL:
        -[MRDExternalDeviceRemoteServer _handleRegisterGameControllerMessage:client:]( self,  "_handleRegisterGameControllerMessage:client:",  v7,  v9);
        break;
      case 21LL:
        objc_msgSend(v9, "removeGameController:", objc_msgSend(v7, "controllerID"));
        break;
      case 24LL:
        -[MRDExternalDeviceRemoteServer _handleGetKeyboardSessionMessage:fromClient:]( self,  "_handleGetKeyboardSessionMessage:fromClient:",  v7,  v9);
        break;
      case 25LL:
        -[MRDExternalDeviceRemoteServer _handleTextInputMessage:fromClient:]( self,  "_handleTextInputMessage:fromClient:",  v7,  v9);
        break;
      case 28LL:
        -[MRDExternalDeviceRemoteServer _handleRegisterVoiceInputDeviceMessage:fromClient:]( self,  "_handleRegisterVoiceInputDeviceMessage:fromClient:",  v7,  v9);
        break;
      case 31LL:
        -[MRDExternalDeviceRemoteServer _handleReceivedVoiceInputMessage:fromClient:]( self,  "_handleReceivedVoiceInputMessage:fromClient:",  v7,  v9);
        break;
      case 32LL:
        -[MRDExternalDeviceRemoteServer _handlePlaybackQueueRequestMessage:fromClient:]( self,  "_handlePlaybackQueueRequestMessage:fromClient:",  v7,  v9);
        break;
      case 36LL:
        id v44 = [[MRSetConnectionStateMessage alloc] initWithConnectionState:2];
        -[MRDExternalDeviceRemoteServer clientConnection:didReceiveMessage:]( self,  "clientConnection:didReceiveMessage:",  v9,  v44);
        goto LABEL_88;
      case 37LL:
        -[MRDExternalDeviceRemoteServer _handleDeviceInfoUpdateMessage:fromClient:]( self,  "_handleDeviceInfoUpdateMessage:fromClient:",  v7,  v9);
        break;
      case 38LL:
        -[MRDExternalDeviceRemoteServer _handleSetConnectionStateMessage:fromClient:]( self,  "_handleSetConnectionStateMessage:fromClient:",  v7,  v9);
        break;
      case 40LL:
        -[MRDExternalDeviceRemoteServer _handleSetHiliteModeMessage:fromClient:]( self,  "_handleSetHiliteModeMessage:fromClient:",  v7,  v9);
        break;
      case 41LL:
        sub_10013D8E8(1, 0, &stru_1003AE680);
        break;
      case 42LL:
        -[MRDExternalDeviceRemoteServer _handleGenericMessage:fromClient:]( self,  "_handleGenericMessage:fromClient:",  v7,  v9);
        break;
      case 43LL:
        id v47 = v7;
        id v44 = v47;
        if (v47)
        {
          [v47 event];
        }

        else
        {
          __int128 v50 = 0u;
          __int128 v51 = 0u;
        }

        id v48 = objc_msgSend(v44, "virtualDeviceID", v50, v51);
        v49 = &v50;
LABEL_87:
        -[MRDExternalDeviceRemoteServer _handleTouchEvent:withDeviceID:fromClient:]( self,  "_handleTouchEvent:withDeviceID:fromClient:",  v49,  v48,  v9);
LABEL_88:

        break;
      case 44LL:
        -[MRDExternalDeviceRemoteServer _handleLyricsEventMessage:fromClient:]( self,  "_handleLyricsEventMessage:fromClient:",  v7,  v9);
        break;
      case 48LL:
        -[MRDExternalDeviceRemoteServer _handleModifyOutputContextRequestMessage:fromClient:]( self,  "_handleModifyOutputContextRequestMessage:fromClient:",  v7,  v9);
        break;
      case 49LL:
        -[MRDExternalDeviceRemoteServer _handleGetVolumeMessage:fromClient:]( self,  "_handleGetVolumeMessage:fromClient:",  v7,  v9);
        break;
      case 51LL:
        -[MRDExternalDeviceRemoteServer _handleSetVolumeMessage:fromClient:]( self,  "_handleSetVolumeMessage:fromClient:",  v7,  v9);
        break;
      case 62LL:
        -[MRDExternalDeviceRemoteServer _handleGetVolumeControlCapabilitiesMessage:fromClient:]( self,  "_handleGetVolumeControlCapabilitiesMessage:fromClient:",  v7,  v9);
        break;
      case 67LL:
        -[MRDExternalDeviceRemoteServer _handleRemoteTextInputMessage:fromClient:]( self,  "_handleRemoteTextInputMessage:fromClient:",  v7,  v9);
        break;
      case 68LL:
        -[MRDExternalDeviceRemoteServer _handleGetRemoteTextInputSessionMessage:fromClient:]( self,  "_handleGetRemoteTextInputSessionMessage:fromClient:",  v7,  v9);
        break;
      case 69LL:
        notify_post((const char *)[@"kAirPlayWHANotification_BreakAwayFromCurrentGroup" UTF8String]);
        break;
      case 70LL:
        -[MRDExternalDeviceRemoteServer _handlePlaybackSessionRequestMessage:fromClient:]( self,  "_handlePlaybackSessionRequestMessage:fromClient:",  v7,  v9);
        break;
      case 73LL:
        -[MRDExternalDeviceRemoteServer _handlePlaybackSessionMigrateRequestMessage:fromClient:]( self,  "_handlePlaybackSessionMigrateRequestMessage:fromClient:",  v7,  v9);
        break;
      case 75LL:
        -[MRDExternalDeviceRemoteServer _handlePlaybackSessionMigrateBeginMessage:fromClient:]( self,  "_handlePlaybackSessionMigrateBeginMessage:fromClient:",  v7,  v9);
        break;
      case 76LL:
        -[MRDExternalDeviceRemoteServer _handlePlaybackSessionMigrateEndMessage:fromClient:]( self,  "_handlePlaybackSessionMigrateEndMessage:fromClient:",  v7,  v9);
        break;
      case 77LL:
        -[MRDExternalDeviceRemoteServer _handleUpdateActiveSystemEndpointMessage:fromClient:]( self,  "_handleUpdateActiveSystemEndpointMessage:fromClient:",  v7,  v9);
        break;
      default:
        if (v8 == 101) {
          -[MRDExternalDeviceRemoteServer _handleSetDiscoveryModeMessage:fromClient:]( self,  "_handleSetDiscoveryModeMessage:fromClient:",  v7,  v9);
        }
        break;
    }
  }
}

- (void)stateObserver:(id)a3 didReceiveClientDidUnregister:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _MRLogForCategory(3LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7BAC();
  }

  id v9 = objc_alloc(&OBJC_CLASS___MRRemoveClientMessage);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
  id v11 = [v9 initWithClient:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000B70EC;
  v13[3] = &unk_10039E9E0;
  id v14 = v11;
  id v12 = v11;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v5,  1LL,  v13);
}

- (void)stateObserver:(id)a3 didReceivePlayerDidUnregister:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _MRLogForCategory(3LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7C0C();
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B71C8;
  v10[3] = &unk_10039E9E0;
  id v11 = [[MRRemovePlayerMessage alloc] initWithPlayerPath:v5];
  id v9 = v11;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v5,  1LL,  v10);
}

- (void)stateObserver:(id)a3 didReceiveNowPlayingClientChange:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _MRLogForCategory(3LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7C6C();
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
  [v9 setPriority:4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingServer]);

  id v12 = objc_alloc(&OBJC_CLASS___MRSetNowPlayingClientMessage);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 client]);
  id v14 = [v12 initWithClient:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000B7348;
  v19[3] = &unk_10039EA08;
  id v20 = v9;
  id v21 = v14;
  v22 = self;
  id v23 = v5;
  id v24 = v11;
  id v15 = v11;
  id v16 = v5;
  id v17 = v14;
  id v18 = v9;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v16,  1LL,  v19);
}

- (void)stateObserver:(id)a3 didReceiveNowPlayingPlayerChange:(id)a4
{
  id v5 = a4;
  uint64_t v7 = _MRLogForCategory(3LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7CCC();
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B7538;
  v10[3] = &unk_10039E9E0;
  id v11 = [[MRSetNowPlayingPlayerMessage alloc] initWithPlayerPath:v5];
  id v9 = v11;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v5,  1LL,  v10);
}

- (void)stateObserver:(id)a3 didReceiveVolumeControlCapabilitiesChange:(unsigned int)a4 playerPath:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  uint64_t v9 = _MRLogForCategory(3LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7D2C(v5, v10);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000B7618;
  v12[3] = &unk_10039E9E0;
  id v13 = [[MRLegacyVolumeControlCapabilitiesDidChangeMessage alloc] initWithCapabilities:v5];
  id v11 = v13;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v7,  2LL,  v12);
}

- (void)stateObserver:(id)a3 didReceiveDefaultSupportedCommandsChange:(id)a4 playerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v10 = _MRLogForCategory(3LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7DB0();
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000B7778;
  v18[3] = &unk_10039EA30;
  uint64_t v19 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  id v20 = v7;
  id v21 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v19;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000B782C;
  v16[3] = &unk_10039EA58;
  id v17 = objc_retainBlock(v18);
  id v15 = v17;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v12,  1LL,  v16);
}

- (void)stateObserver:(id)a3 didReceiveCoalescedNowPlayingStateChange:(id)a4 playerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v10 = _MRLogForCategory(3LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7E10();
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000B7998;
  v14[3] = &unk_10039EA80;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v12,  1LL,  v14);
}

- (void)textEditingService:(id)a3 textEditingDidBegin:(id)a4 withAttributes:(id)a5 payload:(id)a6
{
  id v9 = a6;
  -[MRDExternalDeviceRemoteServer _broadcastKeyboardMessageWithState:text:attributes:]( self,  "_broadcastKeyboardMessageWithState:text:attributes:",  2LL,  a4,  a5);
  -[MRDExternalDeviceRemoteServer _broadcastRemoteTextInputMessageWithPayload:]( self,  "_broadcastRemoteTextInputMessageWithPayload:",  v9);
}

- (void)textEditingService:(id)a3 textDidChange:(id)a4 payload:(id)a5
{
  id v7 = a5;
  -[MRDExternalDeviceRemoteServer _broadcastKeyboardMessageWithState:text:attributes:]( self,  "_broadcastKeyboardMessageWithState:text:attributes:",  4LL,  a4,  0LL);
  -[MRDExternalDeviceRemoteServer _broadcastRemoteTextInputMessageWithPayload:]( self,  "_broadcastRemoteTextInputMessageWithPayload:",  v7);
}

- (void)textEditingService:(id)a3 attributesDidChange:(id)a4 payload:(id)a5
{
  id v7 = a5;
  -[MRDExternalDeviceRemoteServer _broadcastKeyboardMessageWithState:text:attributes:]( self,  "_broadcastKeyboardMessageWithState:text:attributes:",  7LL,  0LL,  a4);
  -[MRDExternalDeviceRemoteServer _broadcastRemoteTextInputMessageWithPayload:]( self,  "_broadcastRemoteTextInputMessageWithPayload:",  v7);
}

- (void)textEditingServiceTextEditingDidEnd:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[RTIDataPayload payloadWithData:](&OBJC_CLASS___RTIDataPayload, "payloadWithData:", 0LL));
  -[MRDExternalDeviceRemoteServer _broadcastRemoteTextInputMessageWithPayload:]( self,  "_broadcastRemoteTextInputMessageWithPayload:",  v4);
}

- (void)textEditingService:(id)a3 echoWithText:(id)a4
{
}

- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _clientForPairingSession:](self, "_clientForPairingSession:", v6));
  uint64_t v10 = _MRLogForCategory(3LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      id v13 = [v7 length];
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
      int v16 = 134218242;
      id v17 = v13;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Exchanging %llu bytes of crypto pairing data with client \"%{public}@\"",  (uint8_t *)&v16,  0x16u);
    }

    id v11 = (os_log_s *)[[MRCryptoPairingMessage alloc] initWithPairingData:v7 status:0];
    [v8 sendMessage:v11];
  }

  else if (v12)
  {
    int v16 = 138543362;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] ERROR: Unable to exchange pairing data. Unknown client for crypto pairing session: %{public}@",  (uint8_t *)&v16,  0xCu);
  }
}

- (void)pairingSession:(id)a3 showSetupCode:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _clientForPairingSession:](self, "_clientForPairingSession:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000B8054;
  v11[3] = &unk_10039EAA8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:queue:completion:",  v8,  &_dispatch_main_q,  v11);
}

- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _clientForPairingSession:](self, "_clientForPairingSession:", v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);

  if (!v7)
  {
    uint64_t v17 = _MRLogForCategory(3LL, v11);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    v24[0] = v10;
    __int16 v18 = "[ExternalDeviceServer] Successfully opened security session with peer %{public}@";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    goto LABEL_11;
  }

  if (!v8)
  {
    uint64_t v19 = _MRLogForCategory(3LL, v11);
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    v24[0] = v6;
    __int16 v18 = "[ExternalDeviceServer] ERROR: Unable to send pairing failure message. Unknown client for crypto pairing session: %{public}@";
    goto LABEL_10;
  }

  id v12 = [v7 code];
  uint64_t v14 = _MRLogForCategory(3LL, v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v24[0]) = (_DWORD)v12;
    WORD2(v24[0]) = 2114;
    *(void *)((char *)v24 + 6) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Returning OSStatus code %d back to %{public}@",  buf,  0x12u);
  }

  int v16 = (os_log_s *)[[MRCryptoPairingMessage alloc] initWithPairingData:0 status:v12];
  [v8 sendMessage:v16];
LABEL_11:

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B8490;
  v21[3] = &unk_100398E60;
  v21[4] = self;
  id v22 = v8;
  id v20 = v8;
  dispatch_async(&_dispatch_main_q, v21);
}

- (void)pinPairingDialogDidClose:(id)a3 forClient:(id)a4 userCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v11 cryptoSession]);
  unsigned __int8 v8 = [v7 isValid];

  if ((v8 & 1) == 0)
  {
    if (v5) {
      uint64_t v9 = 111LL;
    }
    else {
      uint64_t v9 = 112LL;
    }
    Error = (void *)MRMediaRemoteCreateError(v9);
    -[MRDExternalDeviceRemoteServer _notifyAndDisconnectClient:withError:]( self,  "_notifyAndDisconnectClient:withError:",  v11,  Error);
  }
}

- (void)externalDeviceClient:(id)a3 gameController:(unint64_t)a4 propertiesChanged:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[MRGameControllerPropertiesMessage alloc] initWithGameControllerProperties:v7 controllerID:a4];

  [v8 sendMessage:v9];
}

- (void)gameControllerConnectionDidInterrupt:(id)a3
{
}

- (id)_createLocalizedOutputDevice:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6
{
  if (!a3) {
    return 0LL;
  }
  BOOL v7 = a4;
  id v17 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceRemoteServer _createLocalizedOutputDevices:redactVolume:forClient:endpoint:]( self,  "_createLocalizedOutputDevices:redactVolume:forClient:endpoint:",  v13,  v7,  v11,  v10,  v17));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

  return v15;
}

- (id)_createLocalizedOutputDevices:(id)a3 redactVolume:(BOOL)a4 forClient:(id)a5 endpoint:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mr_allOutputDevices"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mr_redactClusterMembers"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000B882C;
  v25[3] = &unk_10039AC00;
  id v13 = v9;
  id v26 = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "msv_filter:", v25));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000B88BC;
  v22[3] = &unk_10039B9A8;
  id v23 = v13;
  id v24 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_map:", v22));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000B891C;
  v20[3] = &unk_10039EAC8;
  BOOL v21 = a4;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "msv_map:", v20));

  return v18;
}

- (void)endpointDidAddOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B8AD4;
  v10[3] = &unk_10039EAF0;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v8,  v9,  3LL,  v10);
}

- (void)endpointDidChangeOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B8CEC;
  v10[3] = &unk_10039EAF0;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v8,  v9,  3LL,  v10);
}

- (void)endpointDidRemoveOutputDeviceNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000B8ED0;
  v10[3] = &unk_10039EAF0;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v8,  v9,  3LL,  v10);
}

- (void)endpointVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointVolumeControlCapabilitiesUserInfoKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);

  if (v9)
  {
    unsigned int v10 = [v7 intValue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000B9080;
    v11[3] = &unk_10039EB18;
    void v11[4] = self;
    id v12 = v9;
    id v13 = v5;
    unsigned int v14 = v10;
    -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v13,  v12,  2LL,  v11);
  }
}

- (void)endpointVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointVolumeUserInfoKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);

  if (v9)
  {
    [v7 floatValue];
    int v11 = v10;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000B9260;
    v12[3] = &unk_10039EB18;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v5;
    int v15 = v11;
    -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v14,  v13,  2LL,  v12);
  }
}

- (void)endpointVolumeMutedDidChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRAVEndpointVolumeMutedUserInfoKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRAVEndpointOutputDeviceUserInfoKey]);

  if (v9)
  {
    unsigned __int8 v10 = [v7 BOOLValue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000B9438;
    v11[3] = &unk_10039EB40;
    void v11[4] = self;
    id v12 = v9;
    id v13 = v5;
    unsigned __int8 v14 = v10;
    -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:outputDevice:withSource:handler:]( self,  "_sendMessageFromEndpoint:outputDevice:withSource:handler:",  v13,  v12,  2LL,  v11);
  }
}

- (void)deviceInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetPlayerPathFromUserInfo(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v10 = MRGetDeviceInfoFromUserInfo(v8, v9);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x3032000000LL;
    v16[3] = sub_1000B66EC;
    void v16[4] = sub_1000B66FC;
    id v17 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 origin]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000B9604;
    v13[3] = &unk_10039EB68;
    int v15 = v16;
    id v14 = v11;
    -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromOrigin:source:handler:]( self,  "_sendStateUpdateMessageFromOrigin:source:handler:",  v12,  0LL,  v13);

    _Block_object_dispose(v16, 8);
  }
}

- (void)playerParticipantsDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6 && [v6 isResolved])
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 nowPlayingServer]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 queryExistingPlayerPath:v6]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerClient]);
    int v11 = v10;
    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 participantDataSource]);

      if (v12)
      {
        id v13 = objc_alloc(&OBJC_CLASS___MRPlayerClientParticipantsUpdateMessage);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 playerPath]);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 participantDataSource]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 participants]);
        id v17 = [v13 initWithPlayerPath:v14 participants:v16];

        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000B9808;
        v20[3] = &unk_10039E9E0;
        id v21 = v17;
        id v19 = v17;
        -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromOrigin:source:handler:]( self,  "_sendStateUpdateMessageFromOrigin:source:handler:",  v18,  1LL,  v20);
      }
    }
  }
}

- (void)playbackDidTimeoutNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v6 = MRGetOriginFromUserInfo(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3032000000LL;
  v12[3] = sub_1000B66EC;
  void v12[4] = sub_1000B66FC;
  id v13 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000B9918;
  v9[3] = &unk_10039EB68;
  int v11 = v12;
  id v8 = v7;
  id v10 = v8;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromOrigin:source:handler:]( self,  "_sendStateUpdateMessageFromOrigin:source:handler:",  v8,  1LL,  v9);

  _Block_object_dispose(v12, 8);
}

- (void)_addToMessage:(id)a3 withAllClusterDeviceMembers:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = (uint64_t (**)(id, void *, id))a5;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "clusterComposition", 0));
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        id v14 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 uid]);
        uint64_t v16 = v8[2](v8, v15, [v14 deviceSubtype]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (v17) {
          [v7 addMessage:v17];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v11);
  }
}

- (void)_activeSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v6 = [v5 disablePairedDeviceActiveEndpointSync];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey]);
    id v9 = [v8 copy];

    if (v9
      && ![v9 type]
      && ([v9 isPairedDeviceSync] & 1) == 0
      && ([v9 suppressPairedDeviceSync] & 1) == 0)
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 outputDeviceUID]);
      if (!v10
        || (id v11 = (void *)v10,
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDeviceUID]),
            id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID")),
            unsigned int v14 = [v12 isEqualToString:v13],
            v13,
            v12,
            v11,
            v14))
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MRDeviceInfoRequest deviceInfoForOrigin:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:",  v15));

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 WHAIdentifier]);
        [v9 setOutputDeviceUID:v17];
      }

      id v18 = [[MRUpdateActiveSystemEndpointMessage alloc] initWithRequest:v9];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000B9D68;
      v21[3] = &unk_10039E9E0;
      id v22 = v18;
      id v20 = v18;
      -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromOrigin:source:handler:]( self,  "_sendStateUpdateMessageFromOrigin:source:handler:",  v19,  4LL,  v21);
    }
  }
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x600000000000001uLL:
      -[MRDExternalDeviceRemoteServer _handleGetInputModeMessage:fromClient:]( self,  "_handleGetInputModeMessage:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000002uLL:
      -[MRDExternalDeviceRemoteServer _handleSetInputModeMessage:fromClient:]( self,  "_handleSetInputModeMessage:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000003uLL:
      -[MRDExternalDeviceRemoteServer _handleDeletePairingIdentityMessage:fromClient:]( self,  "_handleDeletePairingIdentityMessage:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000004uLL:
      -[MRDExternalDeviceRemoteServer _handleGetPairedDevicesMessage:fromClient:]( self,  "_handleGetPairedDevicesMessage:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000005uLL:
      -[MRDExternalDeviceRemoteServer _handleDeletePairedDeviceMessage:fromClient:]( self,  "_handleDeletePairedDeviceMessage:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000006uLL:
      -[MRDExternalDeviceRemoteServer _handleSetMessageLogging:fromClient:]( self,  "_handleSetMessageLogging:fromClient:",  xdict,  v6);
      break;
    case 0x600000000000009uLL:
      -[MRDExternalDeviceRemoteServer _handleTelevisionEndpointAvailableMessage:fromClient:]( self,  "_handleTelevisionEndpointAvailableMessage:fromClient:",  xdict,  v6);
      break;
    case 0x60000000000000AuLL:
      -[MRDExternalDeviceRemoteServer _handleSendTelevisionCustomDataMessage:fromClient:]( self,  "_handleSendTelevisionCustomDataMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)sleepObserverSystemWillSleep:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id Error = (id)MRMediaRemoteCreateError(115LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  -[MRDExternalDeviceRemoteServer _notifyAndDisconnectClients:withError:completion:]( self,  "_notifyAndDisconnectClients:withError:completion:",  v6,  Error,  v5);
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B9F70;
  block[3] = &unk_100398E60;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)_handleClientConnection:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _MRLogForCategory(3LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Client connected: %{public}@",  buf,  0xCu);
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  int v15 = sub_1000BA2F4;
  uint64_t v16 = &unk_100398E60;
  id v17 = self;
  id v18 = v4;
  id v9 = v4;
  dispatch_sync(serialQueue, &v13);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRUserSettings currentSettings]( &OBJC_CLASS___MRUserSettings,  "currentSettings",  v13,  v14,  v15,  v16,  v17));
  [v10 externalDeviceSleepAssertionOnClientConnectDuration];
  uint64_t v12 = -[MRDSleepAssertion initWithName:timeout:]( objc_alloc(&OBJC_CLASS___MRDSleepAssertion),  "initWithName:timeout:",  @"com.apple.MediaRemote.Television.KeepAlive10SecondsForUser",  v11);
  -[MRDExternalDeviceRemoteServer _prewarmMediaApps](self, "_prewarmMediaApps");
  [v9 requestDestinationEndpoint:0];
}

- (void)_prewarmMediaApps
{
  v2 = objc_alloc(&OBJC_CLASS___MRClient);
  id v3 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
  id v9 = -[MRClient initWithBundleIdentifier:](v2, "initWithBundleIdentifier:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  MRMediaRemoteGetSupportedCommandsForClient(v9, v4, &_dispatch_main_q, &stru_10039EBD0);

  uint64_t v5 = objc_alloc(&OBJC_CLASS___MRClient);
  uint64_t v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID(v5);
  id v7 = -[MRClient initWithBundleIdentifier:](v5, "initWithBundleIdentifier:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  MRMediaRemoteGetSupportedCommandsForClient(v7, v8, &_dispatch_main_q, &stru_10039EBF0);
}

- (void)_disconnectClient:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v10 = _MRLogForCategory(3LL, v9);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] MRExternalClientConnection did disconnect client: %{public}@ with error %{public}@",  buf,  0x16u);
  }

  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v41 = sub_1000B66EC;
  uint64_t v42 = sub_1000B66FC;
  id v43 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BA834;
  block[3] = &unk_10039EC18;
  id v33 = &v35;
  void block[4] = self;
  id v13 = v8;
  id v32 = v13;
  unsigned int v34 = buf;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v36 + 24))
  {
    if ([v13 registeredToNowPlayingUpdates]) {
      -[MRDNowPlayingStateObserver stopReceivingUpdatesForSource:]( self->_stateObserver,  "stopReceivingUpdatesForSource:",  1LL);
    }
    if ([v13 registeredToVolumeUpdates]) {
      -[MRDNowPlayingStateObserver stopReceivingUpdatesForSource:]( self->_stateObserver,  "stopReceivingUpdatesForSource:",  2LL);
    }
    -[MRDPinPairingDialog closeForClient:](self->_pinPairingDialog, "closeForClient:", v13);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000BA8B0;
    v30[3] = &unk_10039EC40;
    v30[4] = self;
    [v13 flushVolumeEvents:v30];
    [v13 flushLyricsEvents:&stru_10039EC80];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000BA9D0;
    v28[3] = &unk_10039ECA8;
    id v14 = v13;
    id v29 = v14;
    [v14 flushPendingPlaybackSessionMigrateEvents:v28];
    if (MSVDeviceIsAudioAccessory( -[MRDExternalDeviceRemoteServer purgeUnusedDiscoverySessions]( self,  "purgeUnusedDiscoverySessions")))
    {
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 WHAIdentifier]);
      -[MRDExternalDeviceRemoteServer updateASEAssertionForRemoteDeviceID:isAsserting:]( self,  "updateASEAssertionForRemoteDeviceID:isAsserting:",  v16,  0LL);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v17 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v14 connection]);
    [v18 postNotificationName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v19 userInfo:0];

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v20 = *(id *)(*(void *)&buf[8] + 40LL);
    id v21 = [v20 countByEnumeratingWithState:&v24 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v20);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8LL * (void)i) + 16LL))(*(void *)(*((void *)&v24 + 1) + 8LL * (void)i));
        }

        id v21 = [v20 countByEnumeratingWithState:&v24 objects:v39 count:16];
      }

      while (v21);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v35, 8);
}

- (id)_findClientIf:(id)a3
{
  id v4 = (unsigned int (**)(id, void *))a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)_clientForPairingSession:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BAC38;
  v7[3] = &unk_10039ECD0;
  id v8 = a3;
  id v4 = v8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _findClientIf:](self, "_findClientIf:", v7));

  return v5;
}

- (id)_clientForIdentifier:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BACF8;
  v7[3] = &unk_10039ECD0;
  id v8 = a3;
  id v4 = v8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _findClientIf:](self, "_findClientIf:", v7));

  return v5;
}

- (BOOL)_verifyClientVersionCompatibility:(id)a3 withError:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 deviceInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleVersion]);
  id v10 = [v6 protocolVersion];
  if (v10 >= [(id)objc_opt_class(self) minimumSupportedProtocolVersion])
  {
    if (![v8 isEqualToString:@"com.apple.TVRemote"]
      || (id v15 = [v9 integerValue],
          v15 >= [(id)objc_opt_class(self) minimumSupportedHangdogApplicationVersion]))
    {
      id Error = 0LL;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }

    uint64_t v17 = _MRLogForCategory(3LL, v16);
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      id v21 = v7;
      __int16 v22 = 2048;
      id v23 = [v9 integerValue];
      __int16 v24 = 2048;
      id v25 = [(id)objc_opt_class(self) minimumSupportedHangdogApplicationVersion];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Client %{public}@ is not compatible. TVRemote application version %llu is less than the r equired minimum version %llu",  (uint8_t *)&v20,  0x20u);
    }

    uint64_t v14 = 109LL;
  }

  else
  {
    uint64_t v12 = _MRLogForCategory(3LL, v11);
    __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543874;
      id v21 = v7;
      __int16 v22 = 2048;
      id v23 = [v6 protocolVersion];
      __int16 v24 = 2048;
      id v25 = [(id)objc_opt_class(self) minimumSupportedProtocolVersion];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Client %{public}@ is not compatible. Protocol version %llu is less than the required mini mum version %llu",  (uint8_t *)&v20,  0x20u);
    }

    uint64_t v14 = 108LL;
  }

  id Error = (void *)MRMediaRemoteCreateError(v14);
  if (a4) {
LABEL_11:
  }
    *a4 = Error;
LABEL_12:

  return Error == 0LL;
}

- (BOOL)_connection:(id)a3 wasPreviouslySubscribedToPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v6 subscribedPlayerPaths]);
    id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      id v22 = v6;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin", v22));
          unsigned int v14 = -[MRDExternalDeviceRemoteServer _origin:matchesSubscribedPlayerPath:]( self,  "_origin:matchesSubscribedPlayerPath:",  v13,  v12);

          if (v14)
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 client]);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRClient anyClient](&OBJC_CLASS___MRClient, "anyClient"));
            if ([v15 isEqual:v16])
            {

LABEL_16:
              BOOL v20 = 1;
              goto LABEL_17;
            }

            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 client]);
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 client]);
            unsigned __int8 v19 = [v17 isEqual:v18];

            if ((v19 & 1) != 0) {
              goto LABEL_16;
            }
          }
        }

        id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }

      BOOL v20 = 0;
LABEL_17:
      id v6 = v22;
    }

    else
    {
      BOOL v20 = 0;
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)_connection:(id)a3 canReceiveUpdatesForPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscribedPlayerPaths", 0));
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (-[MRDExternalDeviceRemoteServer _playerPath:matchesSubscribedPlayerPath:]( self,  "_playerPath:matchesSubscribedPlayerPath:",  v7,  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)))
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 0;
LABEL_12:
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_connection:(id)a3 canReceiveUpdatesForOrigin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscribedPlayerPaths", 0));
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (-[MRDExternalDeviceRemoteServer _origin:matchesSubscribedPlayerPath:]( self,  "_origin:matchesSubscribedPlayerPath:",  v7,  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i)))
          {
            BOOL v13 = 1;
            goto LABEL_12;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 0;
LABEL_12:
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_sendMessageFromEndpoint:(id)a3 withSource:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if (-[MRDExternalDeviceRemoteServer _shouldSendStateUpdateMessageFromSource:toClient:]( self,  "_shouldSendStateUpdateMessageFromSource:toClient:",  a4,  v14))
        {
          objc_initWeak(&location, self);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472LL;
          v15[2] = sub_1000BB5F8;
          v15[3] = &unk_10039ECF8;
          id v16 = v8;
          objc_copyWeak(&v19, &location);
          __int128 v17 = v14;
          id v18 = v9;
          [v14 requestDestinationEndpoint:v15];

          objc_destroyWeak(&v19);
          objc_destroyWeak(&location);
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }
}

- (void)_sendMessageFromEndpoint:(id)a3 outputDevice:(id)a4 withSource:(int64_t)a5 handler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000BB764;
  v12[3] = &unk_10039ED20;
  id v13 = a4;
  id v14 = a6;
  id v10 = v14;
  id v11 = v13;
  -[MRDExternalDeviceRemoteServer _sendMessageFromEndpoint:withSource:handler:]( self,  "_sendMessageFromEndpoint:withSource:handler:",  a3,  a5,  v12);
}

- (void)_sendStateUpdateMessageFromPlayerPath:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[MRDExternalDeviceRemoteServer _shouldSendStateUpdateMessageFromSource:toClient:]( self,  "_shouldSendStateUpdateMessageFromSource:toClient:",  a4,  v15)
          && -[MRDExternalDeviceRemoteServer _connection:canReceiveUpdatesForPlayerPath:]( self,  "_connection:canReceiveUpdatesForPlayerPath:",  v15,  v8))
        {
          uint64_t v16 = v9[2](v9, v15);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17) {
            [v15 sendMessage:v17];
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }
}

- (void)_sendStateUpdateMessageFromOrigin:(id)a3 source:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if (-[MRDExternalDeviceRemoteServer _shouldSendStateUpdateMessageFromSource:toClient:]( self,  "_shouldSendStateUpdateMessageFromSource:toClient:",  a4,  v15)
          && -[MRDExternalDeviceRemoteServer _connection:canReceiveUpdatesForOrigin:]( self,  "_connection:canReceiveUpdatesForOrigin:",  v15,  v8))
        {
          uint64_t v16 = v9[2](v9, v15);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17) {
            [v15 sendMessage:v17];
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }
}

- (BOOL)_shouldSendStateUpdateMessageFromSource:(int64_t)a3 toClient:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  switch(a3)
  {
    case 1LL:
      unsigned __int8 v7 = [v5 registeredToNowPlayingUpdates];
      goto LABEL_7;
    case 2LL:
      unsigned __int8 v7 = [v5 registeredToVolumeUpdates];
      goto LABEL_7;
    case 3LL:
      unsigned __int8 v7 = [v5 registeredToOutputDeviceUpdates];
      goto LABEL_7;
    case 4LL:
      unsigned __int8 v7 = [v5 registeredToSystemEndpointUpdates];
LABEL_7:
      BOOL v8 = v7;
      break;
    default:
      BOOL v8 = 1;
      break;
  }

  return v8;
}

- (void)_broadcastKeyboardMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v15 registeredKeyboardUpdates])
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cryptoSession]);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[MRKeyboardMessage encryptedMessageWithState:text:attributes:usingCryptoSession:]( &OBJC_CLASS___MRKeyboardMessage,  "encryptedMessageWithState:text:attributes:usingCryptoSession:",  a3,  v8,  v9,  v16));

          [v15 sendMessage:v17];
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v12);
  }
}

- (void)_broadcastRemoteTextInputMessageWithPayload:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  __int128 v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int128 v23 = sub_1000B66EC;
  __int128 v24 = sub_1000B66FC;
  id v25 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BBF10;
  block[3] = &unk_100399278;
  void block[4] = self;
  void block[5] = &v20;
  dispatch_sync(serialQueue, block);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = (id)v21[5];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "registeredKeyboardUpdates", (void)v15))
        {
          id v11 = objc_alloc(&OBJC_CLASS___MRRemoteTextInputMessage);
          id v12 = [v4 version];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
          id v14 = [v11 initWithVersion:v12 data:v13];

          [v10 sendMessage:v14];
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }

    while (v7);
  }

  _Block_object_dispose(&v20, 8);
}

- (void)_setGameControllerInputMode:(unsigned int)a3
{
  if (self->_gameControllerInputMode != a3)
  {
    uint64_t v3 = *(void *)&a3;
    uint64_t v5 = _MRLogForCategory(3LL, a2);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      Description = (void *)MRGameControllerInputModeCreateDescription(v3);
      *(_DWORD *)buf = 138543362;
      __int128 v16 = Description;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Setting game controller input mode to %{public}@",  buf,  0xCu);
    }

    self->_gameControllerInputMode = v3;
    id v8 = [[MRRegisterForGameControllerEventsMessage alloc] initWithInputMode:v3];
    id v9 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
    id v11 = -[MRPlayerPath initWithOrigin:client:player:](v9, "initWithOrigin:client:player:", v10, 0LL, 0LL);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000BC0CC;
    v13[3] = &unk_10039E9E0;
    id v14 = v8;
    id v12 = v8;
    -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v11,  0LL,  v13);
  }

- (id)_unpair:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___MRDeviceInfo);
  -[MRDeviceInfo setIdentifier:](v5, "setIdentifier:", v4);
  id v6 = [[MRCoreUtilsPairingSession alloc] initWithRole:0 device:v5];
  [v6 open];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 removePeer]);
  if (v8)
  {
    uint64_t v9 = _MRLogForCategory(3LL, v7);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      __int128 v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Error unpairing device: %{public}@ error: %{public}@",  (uint8_t *)&v14,  0x16u);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _clientForIdentifier:](self, "_clientForIdentifier:", v4));
  if (v11)
  {
    id Error = (void *)MRMediaRemoteCreateError(110LL);
    -[MRDExternalDeviceRemoteServer _notifyAndDisconnectClient:withError:]( self,  "_notifyAndDisconnectClient:withError:",  v11,  Error);
  }

  return v8;
}

- (void)_notifyAndDisconnectClient:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_autoreleasePoolPush();
  id v10 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[MRDExternalDeviceRemoteServer _notifyAndDisconnectClients:withError:completion:]( self,  "_notifyAndDisconnectClients:withError:completion:",  v9,  v7,  0LL);

  objc_autoreleasePoolPop(v8);
}

- (void)_notifyAndDisconnectClients:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_autoreleasePoolPush();
  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = dispatch_queue_create("com.apple.MediaRemote.MRTelevisionRemoteServer.WorkerQueue", v13);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000BC41C;
  v18[3] = &unk_100399120;
  id v15 = v9;
  id v19 = v15;
  id v16 = v8;
  id v20 = v16;
  __int128 v21 = self;
  id v17 = v10;
  id v22 = v17;
  dispatch_async(v14, v18);

  objc_autoreleasePoolPop(v11);
}

- (void)_registerCallbacks
{
  if (sub_10013DAD4())
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v4 = MSVWeakLinkStringConstant("PBSPresenceDetectionDidBeginNotification", @"PineBoardServices");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    [v3 addObserver:self selector:"_handleHiliteModeChanged:" name:v5 object:0];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v7 = MSVWeakLinkStringConstant("PBSPresenceDetectionDidEndNotification", @"PineBoardServices");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 addObserver:self selector:"_handleHiliteModeChanged:" name:v8 object:0];
  }

  id v9 = (CUPairingManager *)objc_claimAutoreleasedReturnValue( +[MRCoreUtilsSystemPairingSession pairingManager]( &OBJC_CLASS___MRCoreUtilsSystemPairingSession,  "pairingManager"));
  pairingManager = self->_pairingManager;
  self->_pairingManager = v9;

  if (self->_pairingManager)
  {
    objc_initWeak(&location, self);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    uint64_t v13 = sub_1000BCA1C;
    int v14 = &unk_10039ED48;
    objc_copyWeak(&v15, &location);
    -[CUPairingManager setPairedPeerRemovedHandler:](self->_pairingManager, "setPairedPeerRemovedHandler:", &v11);
    -[CUPairingManager startMonitoringWithOptions:]( self->_pairingManager,  "startMonitoringWithOptions:",  4LL,  v11,  v12,  v13,  v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

- (BOOL)_isConnectionForManagedConfigIDAllowed:(id)a3
{
  id v3 = a3;
  uint64_t v5 = _MRLogForCategory(3LL, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7F28();
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 effectiveValuesForUnionSetting:MCFeatureTVRemoteAllowedRemotes]);

  if ([v8 count])
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (!v11) {
      goto LABEL_16;
    }
    uint64_t v12 = *(void *)v23;
LABEL_6:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v10);
      }
      int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "lowercaseString", (void)v22));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_16;
      }
    }
  }

  else
  {
    uint64_t v17 = _MRLogForCategory(3LL, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
      sub_1002B7EF0();
    }
  }

  LOBYTE(v11) = 1;
LABEL_16:

  uint64_t v19 = _MRLogForCategory(3LL, v18);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1002B7E70();
  }

  return (char)v11;
}

- (void)_onQueue_registerDisconnectionHandler:(id)a3 forClient:(id)a4
{
  id v13 = a4;
  clientDisconnectionHandlers = self->_clientDisconnectionHandlers;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](clientDisconnectionHandlers, "objectForKey:", v13));

  if (!v8)
  {
    uint64_t v9 = self->_clientDisconnectionHandlers;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMapTable setObject:forKey:](v9, "setObject:forKey:", v10, v13);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_clientDisconnectionHandlers, "objectForKey:", v13));
  id v12 = objc_retainBlock(v7);

  [v11 addObject:v12];
}

- (void)setServerDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = self->_discoverySessions;
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_outputDeviceCallbackTokens,  "objectForKeyedSubscript:",  v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoverySessions,  "objectForKeyedSubscript:",  v6));
  id v10 = v9;
  if ((_DWORD)v4)
  {
    if (!v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRAVRoutingDiscoverySession discoverySessionWithConfiguration:]( &OBJC_CLASS___MRAVRoutingDiscoverySession,  "discoverySessionWithConfiguration:",  v6));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoverySessions,  "setObject:forKeyedSubscript:",  v10,  v6);
    }

    if (!v8)
    {
      objc_initWeak(&location, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1000BD0B0;
      v12[3] = &unk_10039ED70;
      objc_copyWeak(&v14, &location);
      id v11 = v6;
      id v13 = v11;
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 addOutputDevicesChangedCallback:v12]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outputDeviceCallbackTokens,  "setObject:forKeyedSubscript:",  v8,  v11);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

    [v10 setDiscoveryMode:v4];
  }

  else
  {
    [v9 removeOutputDevicesChangedCallback:v8];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_outputDeviceCallbackTokens,  "setObject:forKeyedSubscript:",  0LL,  v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_discoverySessions,  "setObject:forKeyedSubscript:",  0LL,  v6);
  }

  objc_sync_exit(v7);
}

- (void)purgeUnusedDiscoverySessions
{
  id obj = self->_discoverySessions;
  objc_sync_enter(obj);
  discoverySessions = self->_discoverySessions;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000BD198;
  v5[3] = &unk_10039EB90;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](discoverySessions, "enumerateKeysAndObjectsUsingBlock:", v5);
  objc_sync_exit(obj);
}

- (unsigned)serverDiscoveryModeForConfiguration:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)i) discoveryModeForConfiguration:v4];
        if (v11 > v8) {
          unsigned int v8 = v11;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (void)outputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer clients](self, "clients"));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ([v13 discoveryModeForConfiguration:v7])
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472LL;
          v14[2] = sub_1000BD48C;
          v14[3] = &unk_10039ED98;
          id v15 = v6;
          id v16 = v7;
          uint64_t v17 = v13;
          [v13 requestDestinationEndpoint:v14];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

- (void)_handleGetInputModeMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t original = a3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(original);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    unsigned int v8 = reply;
    if (reply)
    {
      xpc_dictionary_set_uint64(reply, "MRXPC_GAMECONTROLLER_INPUT_MODE_KEY", self->_gameControllerInputMode);
      xpc_connection_send_message(v6, v8);
    }
  }
}

- (void)_handleSetInputModeMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  -[MRDExternalDeviceRemoteServer _setGameControllerInputMode:]( self,  "_setGameControllerInputMode:",  xpc_dictionary_get_uint64(xdict, "MRXPC_GAMECONTROLLER_INPUT_MODE_KEY"));
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  id v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (reply) {
      xpc_connection_send_message(v6, reply);
    }
  }
}

- (void)_handleDeletePairingIdentityMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = [[MRCryptoPairingSession alloc] initWithRole:1 device:0];
  id v12 = 0LL;
  unsigned __int8 v6 = [v5 deleteIdentityWithError:&v12];
  id v8 = v12;
  if ((v6 & 1) != 0)
  {
    unsigned int v9 = 0;
  }

  else
  {
    uint64_t v10 = _MRLogForCategory(3LL, v7);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Error deleting pairing identity. %{public}@",  buf,  0xCu);
    }

    unsigned int v9 = 1;
  }

  sub_10013AD7C(v4, v9);
}

- (void)_handleGetPairedDevicesMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v10 = [[MRCoreUtilsPairingSession alloc] initWithRole:0 device:0];
  [v10 open];
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v10 pairedDevices]);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BD8C0;
  block[3] = &unk_100398E60;
  id v12 = v6;
  __int128 v13 = self;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDeviceInfo dataFromDeviceInfos:](&OBJC_CLASS___MRDeviceInfo, "dataFromDeviceInfos:", v8));
  sub_10013AC78(v5, (uint64_t)"MRXPC_PAIRED_EXTERNAL_DEVICES_DATA", v9, 0LL);
}

- (void)_handleDeletePairedDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_dictionary_get_string(v5, "MRXPC_PAIRED_EXTERNAL_DEVICE"),  4LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer _unpair:](self, "_unpair:", v7));
  if (v9)
  {
    uint64_t v10 = _MRLogForCategory(3LL, v8);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Error unpairing device: %{public}@ error: %{public}@",  (uint8_t *)&v13,  0x16u);
    }

    unsigned int v12 = 1;
  }

  else
  {
    unsigned int v12 = 0;
  }

  sub_10013AD7C(v5, v12);
}

- (void)_handleSetMessageLogging:(id)a3 fromClient:(id)a4
{
  BOOL v4 = xpc_dictionary_get_BOOL(a3, "MRXPC_EXTERNAL_DEVICE_LOGGING_KEY");
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MRProtocolMessageLogger sharedLogger](&OBJC_CLASS___MRProtocolMessageLogger, "sharedLogger"));
  [v5 setShouldVerboselyLog:v4];
}

- (void)_handleTelevisionEndpointAvailableMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  BOOL v7 = xpc_dictionary_get_BOOL(a3, "MRXPC_TELEVISION_ENDPOINT_AVAILABLE_KEY");
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000BDCC4;
  block[3] = &unk_10039AA30;
  BOOL v13 = v7;
  id v11 = v6;
  unsigned int v12 = self;
  id v9 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)_handleSendTelevisionCustomDataMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreatePropertyListFromXPCMessage(v5, "MRXPC_CUSTOM_DATA_NAME_KEY");
  BOOL v7 = (void *)MRCreatePropertyListFromXPCMessage(v5, "MRXPC_CUSTOM_DATA_KEY");

  id v8 = [[MRGenericMessage alloc] initWithKey:v6 data:v7];
  id v9 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v11 = -[MRPlayerPath initWithOrigin:client:player:](v9, "initWithOrigin:client:player:", v10, 0LL, 0LL);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000BDEFC;
  v13[3] = &unk_10039E9E0;
  id v14 = v8;
  id v12 = v8;
  -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v11,  0LL,  v13);
}

- (void)_handleDeviceInfoRequest:(id)a3 fromClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000BDF80;
  v7[3] = &unk_10039EDC0;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  [a4 requestConnectedDestinationEndpoint:v7];
}

- (void)_handleReceivedCommand:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BE1A4;
  v10[3] = &unk_10039EDE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleRegisterHIDDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = _MRLogForCategory(3LL, v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceDescriptor]);
    int v23 = 138543362;
    id v24 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Registering HID device with descriptor: %{public}@",  (uint8_t *)&v23,  0xCu);
  }

  id v11 = objc_alloc(&OBJC_CLASS___MRDVirtualTouchDevice);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceDescriptor]);
  BOOL v13 = -[MRDVirtualTouchDevice initWithDeviceDescriptor:](v11, "initWithDeviceDescriptor:", v12);

  if (v13)
  {
    id v15 = [v6 addVirtualTouchDevice:v13];
    uint64_t v17 = _MRLogForCategory(3LL, v16);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = -[MRDVirtualTouchDevice uniqueIdentifier](v13, "uniqueIdentifier");
      int v23 = 134217984;
      id v24 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Registered new virtual touch device with ID %llu",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v20 = 0LL;
  }

  else
  {
    uint64_t v21 = _MRLogForCategory(3LL, v14);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1002B8074();
    }
    id v15 = 0LL;
    uint64_t v20 = 1LL;
  }

  id v22 = [[MRRegisterHIDDeviceResultMessage alloc] initWithErrorCode:v20 deviceIdentifier:v15];
  [v5 replyWithMessage:v22];
}

- (void)_handleReceivedButtonEvent:(_MRHIDButtonEvent)a3 fromClient:(id)a4
{
  unsigned int v4 = *(_DWORD *)&a3.down;
  uint64_t v5 = *(void *)&a3.usagePage;
  uint64_t usage = a3.usage;
  id v8 = a4;
  id v16 = v8;
  if ((_DWORD)usage == 4)
  {
    id v9 = v8;
    siriService = self->_siriService;
    if ((v4 & 1) != 0) {
      -[MRDTelevisionSiriService handleMicrophoneButtonDownFromClient:]( siriService,  "handleMicrophoneButtonDownFromClient:",  v9);
    }
    else {
      -[MRDTelevisionSiriService handleMicrophoneButtonUpFromClient:]( siriService,  "handleMicrophoneButtonUpFromClient:",  v9);
    }
  }

  else
  {
    uint64_t v11 = mach_absolute_time();
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(kCFAllocatorDefault, v11, v5, usage, v4 & 1, 0LL);
    uint64_t TimeStamp = IOHIDEventGetTimeStamp(KeyboardEvent);
    uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent( kCFAllocatorDefault,  TimeStamp,  65299LL,  16LL,  1LL,  0LL,  0LL,  0LL);
    if (VendorDefinedEvent)
    {
      id v15 = (const void *)VendorDefinedEvent;
      IOHIDEventAppendEvent(KeyboardEvent, VendorDefinedEvent, 0LL);
      CFRelease(v15);
    }

    -[MRDSystemHIDEventManager dispatchHIDEvent:](self->_hidEventManager, "dispatchHIDEvent:", KeyboardEvent);
    CFRelease(KeyboardEvent);
  }
}

- (void)_handleTouchEvent:(_MRHIDTouchEvent *)a3 withDeviceID:(unint64_t)a4 fromClient:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 virtualTouchDeviceWithID:a4]);
  id v9 = v8;
  if (v8)
  {
    __int128 v10 = *(_OWORD *)&a3->var2;
    v14[0] = *(_OWORD *)&a3->var0.var0.var0;
    v14[1] = v10;
    [v8 handleTouchEvent:v14];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 gameControllerWithID:a4]);
  if (v11)
  {
    id v12 = (void *)MRGameControllerDigitizerCreateWithHIDTouchEvent(a3);
    BOOL v13 = (void *)MRGameControllerEventCreateWithDigitizer();
    [v11 sendGameControllerEvent:v13];
  }
}

- (void)_handleRegisterGameControllerMessage:(id)a3 client:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc(&OBJC_CLASS___MREmulatedGameController);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 properties]);
  id v11 = [v7 initWithProperties:v8];

  id v9 = [v5 addGameController:v11];
  id v10 = [[MRRegisterGameControllerResponseMessage alloc] initWithControllerID:v9];
  [v6 replyWithMessage:v10];
}

- (void)_handleClientUpdatesConfigMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 registeredToNowPlayingUpdates];
  unsigned __int8 v9 = [v7 registeredToVolumeUpdates];
  unsigned __int8 v10 = [v7 registeredToOutputDeviceUpdates];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 subscribedPlayerPaths]);
  unsigned int v12 = [v7 registeredToNowPlayingUpdates];
  if (v12 != [v6 nowPlayingUpdates])
  {
    objc_msgSend(v7, "setRegisteredToNowPlayingUpdates:", objc_msgSend(v6, "nowPlayingUpdates"));
    unsigned int v13 = [v6 nowPlayingUpdates];
    stateObserver = self->_stateObserver;
    if (v13) {
      -[MRDNowPlayingStateObserver beginReceivingUpdatesForSource:]( stateObserver,  "beginReceivingUpdatesForSource:",  1LL);
    }
    else {
      -[MRDNowPlayingStateObserver stopReceivingUpdatesForSource:](stateObserver, "stopReceivingUpdatesForSource:", 1LL);
    }
  }

  unsigned int v15 = [v7 registeredToVolumeUpdates];
  if (v15 != [v6 volumeUpdates])
  {
    objc_msgSend(v7, "setRegisteredToVolumeUpdates:", objc_msgSend(v6, "volumeUpdates"));
    unsigned int v16 = [v6 volumeUpdates];
    uint64_t v17 = self->_stateObserver;
    if (v16) {
      -[MRDNowPlayingStateObserver beginReceivingUpdatesForSource:](v17, "beginReceivingUpdatesForSource:", 2LL);
    }
    else {
      -[MRDNowPlayingStateObserver stopReceivingUpdatesForSource:](v17, "stopReceivingUpdatesForSource:", 2LL);
    }
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000BEBD0;
  v21[3] = &unk_10039EE38;
  id v22 = v6;
  id v23 = v7;
  unsigned __int8 v26 = v10;
  unsigned __int8 v27 = v9;
  id v24 = self;
  id v25 = v11;
  unsigned __int8 v28 = v8;
  id v18 = v11;
  id v19 = v7;
  id v20 = v6;
  [v19 requestConnectedDestinationEndpoint:v21];
}

- (void)_syncStateToClient:(id)a3
{
  id v8 = a3;
  if ([v8 isDestinationLocal])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MRCompositeMessage);
    if (self->_gameControllerInputMode)
    {
      id v5 = [[MRRegisterForGameControllerEventsMessage alloc] initWithInputMode:self->_gameControllerInputMode];
      [v4 addMessage:v5];
    }

    if (self->_hiliteMode)
    {
      id v6 = [[MRSetHiliteModeMessage alloc] initWithHiliteMode:self->_hiliteMode];
      [v4 addMessage:v6];
    }

    [v8 sendMessage:v4];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v7 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];
  }
}

- (void)_addOutputDevicesToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDevicesForEndpoint:v8]);
  id v13 = (id)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceRemoteServer _createLocalizedOutputDevices:redactVolume:forClient:endpoint:]( self,  "_createLocalizedOutputDevices:redactVolume:forClient:endpoint:",  v11,  1LL,  v9,  v8));

  id v12 = [[MRSyncOutputDevicesMessage alloc] initWithOutputDevices:v13];
  [v10 addMessage:v12];
}

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5 completion:(id)a6
{
  id v44 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(void))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);
  if (([v14 supportsOutputContextSync] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
  unsigned int v16 = [v15 supportsOutputContextSync];

  if (v16)
  {
    -[MRDExternalDeviceRemoteServer _addVolumeToMessage:forClient:withEndpoint:]( self,  "_addVolumeToMessage:forClient:withEndpoint:",  v44,  v10,  v11);
    v12[2](v12);
    goto LABEL_21;
  }

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nowPlayingServer]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 origin]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 originClientForOrigin:v13]);

  id v15 = [v14 volumeControlCapabilities];
  if ((_DWORD)v15)
  {
    id v16 = [[MRLegacyVolumeControlCapabilitiesDidChangeMessage alloc] initWithCapabilities:v15];
    [v8 addMessage:v16];
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v9 outputDevicesForEndpoint:v10]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceRemoteServer _createLocalizedOutputDevices:redactVolume:forClient:endpoint:]( self,  "_createLocalizedOutputDevices:redactVolume:forClient:endpoint:",  v17,  0LL,  v9,  v10));

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      id v23 = 0LL;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[MRDExternalDeviceRemoteServer _addVolumeToMessage:forClient:outputDevice:withEndpoint:]( self,  "_addVolumeToMessage:forClient:outputDevice:withEndpoint:",  v8,  v9,  *(void *)(*((void *)&v24 + 1) + 8LL * (void)v23),  v10,  (void)v24);
        id v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v21);
  }
}

- (void)_addVolumeToMessage:(id)a3 forClient:(id)a4 outputDevice:(id)a5 withEndpoint:(id)a6
{
  id v21 = a3;
  id v7 = a5;
  id v8 = [v7 volumeCapabilities];
  if ((_DWORD)v8)
  {
    id v9 = v8;
    id v10 = objc_alloc(&OBJC_CLASS___MRVolumeControlCapabilitiesDidChangeMessage);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 groupID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 uid]);
    id v13 = [v10 initWithCapabilities:v9 endpointUID:v11 outputDeviceUID:v12];
    [v21 addMessage:v13];

    if ((v9 & 2) != 0)
    {
      [v7 volume];
      int v15 = v14;
      id v16 = objc_alloc(&OBJC_CLASS___MRVolumeDidChangeMessage);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v7 groupID]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 uid]);
      LODWORD(v19) = v15;
      id v20 = [v16 initWithVolume:v17 endpointUID:v18 outputDeviceUID:v19];
      [v21 addMessage:v20];
    }
  }
}

- (BOOL)_origin:(id)a3 matchesSubscribedPlayerPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v6 origin]);
  if (v7 == v5)
  {
    unsigned __int8 v13 = 1;
    int v14 = v5;
    int v15 = v5;
LABEL_9:

    goto LABEL_10;
  }

  id v8 = v7;
  unsigned __int8 v9 = [v7 isEqual:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin anyOrigin](&OBJC_CLASS___MROrigin, "anyOrigin"));
    unsigned __int8 v12 = [v10 isEqual:v11];

    if ((v12 & 1) == 0)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      int v15 = (void *)objc_claimAutoreleasedReturnValue([v16 nowPlayingServer]);

      int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
      if (v14)
      {
        unsigned __int8 v13 = 0;
      }

      else
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 activeOriginClient]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 origin]);
        unsigned __int8 v13 = [v5 isEqual:v18];
      }

      goto LABEL_9;
    }
  }

  unsigned __int8 v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)_origin:(id)a3 client:(id)a4 matchesSubscribedPlayerPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 nowPlayingServer]);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 originClientForOrigin:v9]);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);

  id v14 = [v13 copy];
  if ([v14 hasPlaceholder])
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInfo]);
    [v14 resolvePlaceholdersForDeviceInfo:v15];
  }

  id v16 = v14;
  uint64_t v17 = v16;
  if (v16 == v7)
  {
    unsigned __int8 v21 = 1;
    uint64_t v22 = v7;
LABEL_8:

    goto LABEL_9;
  }

  unsigned __int8 v18 = [v16 isEqual:v7];

  if ((v18 & 1) == 0)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRClient anyClient](&OBJC_CLASS___MRClient, "anyClient"));
    unsigned __int8 v20 = [v17 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      if (v17)
      {
        unsigned __int8 v21 = 0;
        goto LABEL_9;
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v12 activeNowPlayingClient]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 client]);
      unsigned __int8 v21 = [v7 isEqual:v24];

      goto LABEL_8;
    }
  }

  unsigned __int8 v21 = 1;
LABEL_9:

  return v21;
}

- (BOOL)_origin:(id)a3 client:(id)a4 player:(id)a5 matchesSubscribedPlayerPath:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (id)objc_claimAutoreleasedReturnValue([v12 player]);
  if (v13 == v11)
  {
    BOOL v19 = 1;
    unsigned __int8 v20 = v11;
    unsigned __int8 v21 = v11;
LABEL_13:

    goto LABEL_14;
  }

  id v14 = v13;
  unsigned __int8 v15 = [v13 isEqual:v11];

  if ((v15 & 1) == 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 player]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer anyPlayer](&OBJC_CLASS___MRPlayer, "anyPlayer"));
    unsigned __int8 v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v22 nowPlayingServer]);

      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v21 originClientForOrigin:v9]);
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 existingNowPlayingClientForClient:v10]);
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 activePlayerClient]);
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 player]);

      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v12 player]);
      if (v26)
      {
      }

      else if (!v25 || ([v11 isEqual:v25] & 1) != 0)
      {
        BOOL v19 = 1;
        goto LABEL_12;
      }

      BOOL v19 = 0;
LABEL_12:

      goto LABEL_13;
    }
  }

  BOOL v19 = 1;
LABEL_14:

  return v19;
}

- (BOOL)_playerPath:(id)a3 matchesSubscribedPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
  unsigned int v9 = -[MRDExternalDeviceRemoteServer _origin:matchesSubscribedPlayerPath:]( self,  "_origin:matchesSubscribedPlayerPath:",  v8,  v7);

  if (!v9) {
    goto LABEL_5;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 client]);
  unsigned int v12 = -[MRDExternalDeviceRemoteServer _origin:client:matchesSubscribedPlayerPath:]( self,  "_origin:client:matchesSubscribedPlayerPath:",  v10,  v11,  v7);

  if (!v12) {
    goto LABEL_5;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 origin]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 client]);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 player]);
  unsigned __int8 v16 = -[MRDExternalDeviceRemoteServer _origin:client:player:matchesSubscribedPlayerPath:]( self,  "_origin:client:player:matchesSubscribedPlayerPath:",  v13,  v14,  v15,  v7);

  if ((v16 & 1) != 0) {
    BOOL v17 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v17 = 0;

  return v17;
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 originClient:(id)a5
{
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 origin]);
  LODWORD(self) = -[MRDExternalDeviceRemoteServer _connection:canReceiveUpdatesForOrigin:]( self,  "_connection:canReceiveUpdatesForOrigin:",  v8,  v11);

  if ((_DWORD)self)
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
    unsigned int v13 = [v12 supportsSharedQueue];

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 origin]);
      if ([v14 isHosted])
      {
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
        unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 nowPlayingServer]);
        id v17 = (id)objc_claimAutoreleasedReturnValue([v16 localOriginClient]);
      }

      else
      {
        id v17 = v9;
      }

      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 defaultSupportedCommands]);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000C04D8;
      v32[3] = &unk_10039EED8;
      id v19 = v31;
      id v33 = v19;
      id v34 = v8;
      [v18 enumerateKeysAndObjectsUsingBlock:v32];

      id v20 = objc_alloc(&OBJC_CLASS___MROriginClientPropertiesMessage);
      [v9 timeSincePlaying];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -v21));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v9 devicePlaybackSessionID]);
      id v24 = [v20 initWithLastPlayingDate:v22 devicePlaybackSessionID:v23];
      [v19 addMessage:v24];
    }

    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 activeNowPlayingClient]);
    if (v25)
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
      unsigned int v27 = [v26 supportsSharedQueue];

      if (v27)
      {
        id v28 = objc_alloc(&OBJC_CLASS___MRSetNowPlayingClientMessage);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v25 client]);
        id v30 = [v28 initWithClient:v29];

        [v31 addMessage:v30];
      }
    }
  }
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 nowPlayingClient:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 playerPath]);
  LODWORD(self) = -[MRDExternalDeviceRemoteServer _connection:canReceiveUpdatesForPlayerPath:]( self,  "_connection:canReceiveUpdatesForPlayerPath:",  v9,  v10);

  if ((_DWORD)self)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 client]);
    if ([v11 hasAuxiliaryProperties])
    {
      id v12 = [[MRUpdateClientMessage alloc] initWithClient:v11];
      [v21 addMessage:v12];
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerClient]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 player]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRPlayer defaultPlayer](&OBJC_CLASS___MRPlayer, "defaultPlayer"));
    unsigned __int8 v16 = [v14 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      id v17 = objc_alloc(&OBJC_CLASS___MRSetNowPlayingPlayerMessage);
      unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 activePlayerClient]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 playerPath]);
      id v20 = [v17 initWithPlayerPath:v19];

      [v21 addMessage:v20];
    }
  }
}

- (void)_addSubscribedStateToMessage:(id)a3 forClient:(id)a4 playerClient:(id)a5
{
  id v44 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
  LODWORD(self) = -[MRDExternalDeviceRemoteServer _connection:canReceiveUpdatesForPlayerPath:]( self,  "_connection:canReceiveUpdatesForPlayerPath:",  v8,  v10);

  if ((_DWORD)self)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingState]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 exportNowPlayingState:v11 forPlayerPath:v12]);

    id v14 = objc_alloc(&OBJC_CLASS___MRSetStateMessage);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
    id v16 = objc_msgSend(v14, "initWithNowPlayingState:encoding:", v13, objc_msgSend(v15, "preferredEncoding"));

    [v44 addMessage:v16];
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueRequest defaultPlaybackQueueRequest]( &OBJC_CLASS___MRPlaybackQueueRequest,  "defaultPlaybackQueueRequest"));
    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 playbackQueueRequests]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 playerPath]);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 subscriptionControllerForPlayerPath:v20]);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v16 state]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playbackQueue]);
    [v21 subscribeToPlaybackQueue:v23 forRequest:v17];

    id v24 = objc_alloc(&OBJC_CLASS___MRPlayerClientPropertiesMessage);
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPlayingDate]);
    id v27 = [v24 initWithPlayerPath:v25 lastPlayingDate:v26];
    [v44 addMessage:v27];

    id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 player]);
    if ([v28 hasAuxiliaryProperties])
    {
      id v29 = objc_alloc(&OBJC_CLASS___MRUpdatePlayerMessage);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
      id v31 = [v29 initWithPlayerPath:v30];

      [v44 addMessage:v31];
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue([v9 participantDataSource]);

    if (v32)
    {
      id v33 = objc_alloc(&OBJC_CLASS___MRPlayerClientParticipantsUpdateMessage);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v9 playerPath]);
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v9 participantDataSource]);
      id v43 = v8;
      uint64_t v36 = v28;
      id v37 = v16;
      char v38 = v21;
      id v39 = v17;
      id v40 = v13;
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v35 participants]);
      id v42 = [v33 initWithPlayerPath:v34 participants:v41];

      unsigned int v13 = v40;
      id v17 = v39;
      id v21 = v38;
      id v16 = v37;
      id v28 = v36;
      id v8 = v43;

      [v44 addMessage:v42];
    }
  }
}

- (void)_addNowPlayingStateToMessage:(id)a3 forClient:(id)a4 withEndpoint:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v28 = v10;
  id obj = (id)objc_claimAutoreleasedReturnValue([v10 originClients]);
  id v11 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v43;
    uint64_t v29 = *(void *)v43;
    do
    {
      id v14 = 0LL;
      id v30 = v12;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v14);
        -[MRDExternalDeviceRemoteServer _addSubscribedStateToMessage:forClient:originClient:]( self,  "_addSubscribedStateToMessage:forClient:originClient:",  v7,  v8,  v15);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceInfo]);
        unsigned int v17 = [v16 supportsSharedQueue];

        if (v17)
        {
          id v32 = v14;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          id v33 = (id)objc_claimAutoreleasedReturnValue([v15 nowPlayingClients]);
          id v18 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v39;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v39 != v20) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
                -[MRDExternalDeviceRemoteServer _addSubscribedStateToMessage:forClient:nowPlayingClient:]( self,  "_addSubscribedStateToMessage:forClient:nowPlayingClient:",  v7,  v8,  v22);
                __int128 v36 = 0u;
                __int128 v37 = 0u;
                __int128 v34 = 0u;
                __int128 v35 = 0u;
                id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 playerClients]);
                id v24 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
                if (v24)
                {
                  id v25 = v24;
                  uint64_t v26 = *(void *)v35;
                  do
                  {
                    for (j = 0LL; j != v25; j = (char *)j + 1)
                    {
                      if (*(void *)v35 != v26) {
                        objc_enumerationMutation(v23);
                      }
                      -[MRDExternalDeviceRemoteServer _addSubscribedStateToMessage:forClient:playerClient:]( self,  "_addSubscribedStateToMessage:forClient:playerClient:",  v7,  v8,  *(void *)(*((void *)&v34 + 1) + 8LL * (void)j));
                    }

                    id v25 = [v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
                  }

                  while (v25);
                }
              }

              id v19 = [v33 countByEnumeratingWithState:&v38 objects:v47 count:16];
            }

            while (v19);
          }

          uint64_t v13 = v29;
          id v12 = v30;
          id v14 = v32;
        }

        id v14 = (char *)v14 + 1;
      }

      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v12);
  }
}

- (void)_handleGetKeyboardSessionMessage:(id)a3 fromClient:(id)a4
{
  textEditingService = self->_textEditingService;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService currentTextEditingSession](textEditingService, "currentTextEditingSession"));
  id v14 = v8;
  if (v8)
  {
    else {
      uint64_t v9 = 1LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v14 text]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 attributes]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 cryptoSession]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[MRKeyboardMessage encryptedMessageWithState:text:attributes:usingCryptoSession:]( &OBJC_CLASS___MRKeyboardMessage,  "encryptedMessageWithState:text:attributes:usingCryptoSession:",  v9,  v10,  v11,  v12));
  [v7 replyWithMessage:v13];
}

- (void)_handleTextInputMessage:(id)a3 fromClient:(id)a4
{
  textEditingService = self->_textEditingService;
  id v10 = 0LL;
  unsigned __int8 v5 = -[MRDTextEditingService handleTextInputMessage:withError:]( textEditingService,  "handleTextInputMessage:withError:",  a3,  &v10);
  id v7 = v10;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = _MRLogForCategory(3LL, v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Failed to handle text input message. %{public}@",  buf,  0xCu);
    }
  }
}

- (void)_handleGetRemoteTextInputSessionMessage:(id)a3 fromClient:(id)a4
{
  textEditingService = self->_textEditingService;
  id v5 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService currentRTISession](textEditingService, "currentRTISession"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v11 currentDataPayload]);
  id v7 = objc_alloc(&OBJC_CLASS___MRRemoteTextInputMessage);
  id v8 = [v6 version];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  id v10 = [v7 initWithVersion:v8 data:v9];
  [v5 replyWithMessage:v10];
}

- (void)_handleRemoteTextInputMessage:(id)a3 fromClient:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 data]);
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[RTIDataPayload payloadWithData:](&OBJC_CLASS___RTIDataPayload, "payloadWithData:", v5));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTextEditingService currentRTISession](self->_textEditingService, "currentRTISession"));
  [v6 handleTextActionPayload:v7];
}

- (void)_handleRegisterVoiceInputDeviceMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptor]);
  uint64_t v9 = _MRLogForCategory(3LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Registering new virtual voice input device with descriptor: %{public}@",  buf,  0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C1170;
  v13[3] = &unk_10039EF00;
  id v14 = v6;
  id v15 = v5;
  id v11 = v5;
  id v12 = v6;
  MRVirtualVoiceInputRegisterDevice(v7, &_dispatch_main_q, v13);
}

- (void)_handleReceivedVoiceInputMessage:(id)a3 fromClient:(id)a4
{
  id v14 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a4 registeredVirtualVoiceInputDevices]);
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    id v7 = [v6 unsignedIntValue];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v14 buffer]);
    [v14 time];
    double v10 = v9;
    double v12 = v11;
    [v14 gain];
    MRVirtualVoiceInputProcessAudioData(v7, v8, v10, v12, v13);
  }
}

- (void)_handlePlaybackQueueRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C1428;
  v10[3] = &unk_10039EDE8;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v9 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleDeviceInfoUpdateMessage:(id)a3 fromClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 isDestinationLocal])
  {
    id v7 = objc_alloc(&OBJC_CLASS___MRExternalDevicePairingSession);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    id v9 = [v7 initWithDevice:v8];

    [v9 open];
    id v10 = [v9 updatePeer];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v11 postClientNotificationNamed:kMRTelevisionServicePairedDevicesDidChangeNotification];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceInfo]);
  -[MRDExternalDeviceRemoteServer _handleRemoteDeviceInfo:](self, "_handleRemoteDeviceInfo:", v12);
}

- (void)_handleSetConnectionStateMessage:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  unsigned int v6 = [a3 state];
  if (v6 == 3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
    id v9 = -[MRDExternalDeviceRemoteServer _unpair:](self, "_unpair:", v8);
  }

  else if (v6 == 2)
  {
    -[MRDExternalDeviceRemoteServer _syncStateToClient:](self, "_syncStateToClient:", v10);
  }
}

- (void)_handleSetHiliteModeMessage:(id)a3 fromClient:(id)a4
{
  if (sub_10013DAD4())
  {
    id v4 = objc_msgSend( (id)MSVWeakLinkClass(@"PBSSystemServiceConnection", @"PineBoardServices"),  "sharedConnection");
    id v6 = (id)objc_claimAutoreleasedReturnValue(v4);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaRemoteServiceProxy]);
    [v5 noteUserPresenceDetected];
  }

- (void)_handleHiliteModeChanged:(id)a3
{
  id v4 = a3;
  if (sub_10013DAD4())
  {
    uint64_t v6 = _MRLogForCategory(3LL, v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
      *(_DWORD *)buf = 138543362;
      id v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] HiliteMode notification receieved %{public}@",  buf,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    uint64_t v10 = MSVWeakLinkStringConstant("PBSPresenceDetectionDidBeginNotification", @"PineBoardServices");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = [v9 isEqualToString:v11];

    if (self->_hiliteMode != (_DWORD)v12)
    {
      self->_hiliteMode = (char)v12;
      id v13 = [[MRSetHiliteModeMessage alloc] initWithHiliteMode:v12];
      id v14 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
      id v16 = -[MRPlayerPath initWithOrigin:client:player:](v14, "initWithOrigin:client:player:", v15, 0LL, 0LL);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_1000C1B44;
      v18[3] = &unk_10039E9E0;
      id v19 = v13;
      id v17 = v13;
      -[MRDExternalDeviceRemoteServer _sendStateUpdateMessageFromPlayerPath:source:handler:]( self,  "_sendStateUpdateMessageFromPlayerPath:source:handler:",  v16,  0LL,  v18);
    }
  }
}

- (void)_handleGenericMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  if ([a4 isDestinationLocal])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 key]);
    if ([v7 isEqualToString:MRGenericMessageSetNameKey])
    {
      id v8 = objc_claimAutoreleasedReturnValue([v6 data]);
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [v8 bytes]));

      uint64_t v11 = _MRLogForCategory(3LL, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Changing name to %{public}@",  buf,  0xCu);
      }

      if ((MCLockdownSetDeviceName(v9) & 1) == 0)
      {
        uint64_t v14 = _MRLogForCategory(3LL, v13);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v38 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Could not set device name to %{public}@",  buf,  0xCu);
        }
      }
    }

    else if (v7)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceRemoteServer endpoints](self, "endpoints"));
      if ([v9 count])
      {
        id v32 = v7;
        uint64_t v16 = MRCreateXPCMessage(0x60000000000000ALL);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        MRAddPropertyListToXPCMessage(v17, [v6 key], "MRXPC_CUSTOM_DATA_NAME_KEY");
        id v18 = v6;
        MRAddPropertyListToXPCMessage(v17, [v6 data], "MRXPC_CUSTOM_DATA_KEY");
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        id v31 = v9;
        id v19 = v9;
        id v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v20)
        {
          id v22 = v20;
          uint64_t v23 = *(void *)v34;
          do
          {
            for (i = 0LL; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v19);
              }
              id v25 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
              uint64_t v26 = _MRLogForCategory(3LL, v21);
              id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v18 key]);
                *(_DWORD *)buf = 138543618;
                id v38 = v28;
                __int16 v39 = 2114;
                __int128 v40 = v25;
                _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Sending custom data %{public}@ to endpoint %{public}@",  buf,  0x16u);
              }

              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v25 connection]);
              id v30 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue([v29 connection]);
              xpc_connection_send_message(v30, v17);
            }

            id v22 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }

          while (v22);
        }

        id v6 = v18;
        id v9 = v31;
        id v7 = v32;
      }
    }

    else
    {
      id v9 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:0];
      [v6 replyWithMessage:v9];
    }
  }
}

- (void)_handleLyricsEventMessage:(id)a3 fromClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C1F68;
  v7[3] = &unk_10039EF50;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  [v5 localizeDestinationOrigin:0 completion:v7];
}

- (void)addAuthorizationCallbackForOutputDevice:(id)a3 callback:(id)a4
{
  routingDataSource = self->_routingDataSource;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 primaryID]);
  -[MRDAVRoutingDataSource addAuthorizationCallbackForRouteID:requestCallback:]( routingDataSource,  "addAuthorizationCallbackForRouteID:requestCallback:",  v7,  v6);
}

- (void)removeAuthorizationCallbackForOutputDevice:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 primaryID]);
  -[MRDAVRoutingDataSource removeAuthorizationCallbackForRouteID:]( routingDataSource,  "removeAuthorizationCallbackForRouteID:",  v4);
}

- (void)addAuthorizationCallbackForOutputDevice:(id)a3 client:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000C2134;
  v8[3] = &unk_10039EF78;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[MRDExternalDeviceRemoteServer addAuthorizationCallbackForOutputDevice:callback:]( self,  "addAuthorizationCallbackForOutputDevice:callback:",  v7,  v8);
}

- (void)_handleModifyOutputContextRequestMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(3LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Received request to modify output context: %{public}@",  buf,  0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C2394;
  v13[3] = &unk_10039ED98;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  [v11 requestDestinationEndpoint:v13];
}

- (void)_handleGetVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C3810;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleGetVolumeControlCapabilitiesMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C3988;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleSetVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C3AF8;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handlePlaybackSessionRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000C3CE0;
  v9[3] = &unk_10039F148;
  id v10 = v5;
  id v8 = v5;
  [v6 localizeDestinationPlayerPath:v7 completion:v9];
}

- (void)_handlePlaybackSessionMigrateRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C3F04;
  v10[3] = &unk_10039EDE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handlePlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C496C;
  v10[3] = &unk_10039EDE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_clearPlaybackQueueForPlayerPath:(id)a3
{
  id v3 = a3;
  uint64_t v5 = _MRLogForCategory(3LL, v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceServer] Clearing playback queue for %@",  buf,  0xCu);
  }

  uint64_t v7 = MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 8LL);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(kCFAllocatorDefault, v7);
  uint64_t v14 = kMRMediaRemoteOptionSystemAppPlaybackQueueData;
  id v15 = ExternalRepresentation;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  200LL,  0LL,  0LL));
  id v11 = -[MRDRemoteControlCommand initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:]( objc_alloc(&OBJC_CLASS___MRDRemoteControlCommand),  "initWithCommandType:playerPath:unresolvedPlayerPath:senderAppDisplayID:optionsData:",  122LL,  v3,  v3,  @"Cayenne",  v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteControlServer]);
  [v13 sendRemoteControlCommand:v11 completion:&stru_10039F200];
}

- (void)_handlePlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 playerPath]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C4EEC;
  v10[3] = &unk_10039EDE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v8 localizeDestinationPlayerPath:v7 completion:v10];
}

- (void)_handleUpdateActiveSystemEndpointMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v8 = [v7 disablePairedDeviceActiveEndpointSync];

  if ((v8 & 1) == 0 && [v6 isDestinationLocal])
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSString);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 reason]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceUID]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
    id v16 = -[NSString initWithFormat:]( v9,  "initWithFormat:",  @"%@ from external device client: %@<%@>",  v11,  v13,  v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
    id v18 = [v17 copy];

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleIdentifier]);
    [v18 setClientBundleIdentifier:v20];

    [v18 setPairedDeviceSync:1];
    [v18 setReason:v16];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000C5380;
    v21[3] = &unk_10039DE88;
    id v22 = v5;
    [v18 perform:&_dispatch_main_q completion:v21];
  }
}

- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 nowPlayingServer]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 resolveExistingPlayerPath:v7]);

  id v9 = [v4 fadeType];
  id v10 = [[MRNowPlayingRequest alloc] initWithPlayerPath:v8];
  if (v9)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    _OWORD v14[2] = sub_1000C55D0;
    v14[3] = &unk_100399508;
    id v11 = &v15;
    id v15 = v4;
    id v12 = v4;
    [v10 triggerAudioFadeInWithReplyQueue:&_dispatch_main_q completion:v14];
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C5564;
    v16[3] = &unk_10039F228;
    id v11 = &v17;
    id v17 = v4;
    id v13 = v4;
    [v10 triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:&_dispatch_main_q completion:v16];
  }
}

- (void)_handleSetDiscoveryModeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  objc_msgSend(v7, "setDiscoveryMode:forConfiguration:", objc_msgSend(v6, "mode"), v8);
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_1000B66EC;
  uint64_t v21 = sub_1000B66FC;
  id v22 = 0LL;
  id v9 = self->_discoverySessions;
  objc_sync_enter(v9);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_discoverySessions, "objectForKeyedSubscript:", v8));
  id v11 = (void *)v18[5];
  v18[5] = v10;

  objc_sync_exit(v9);
  if (v18[5])
  {
    if ([v6 mode])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v18[5] availableOutputDevices]);

      if (v12)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_1000C5804;
        v13[3] = &unk_10039F250;
        id v16 = &v17;
        id v14 = v8;
        id v15 = v7;
        [v15 requestDestinationEndpoint:v13];
      }
    }
  }

  -[MRDExternalDeviceRemoteServer setServerDiscoveryMode:forConfiguration:]( self,  "setServerDiscoveryMode:forConfiguration:",  -[MRDExternalDeviceRemoteServer serverDiscoveryModeForConfiguration:]( self,  "serverDiscoveryModeForConfiguration:",  v8),  v8);
  _Block_object_dispose(&v17, 8);
}

- (void)_handleSetListeningModeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C59DC;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleSetConversationDetectionEnabledMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C5B7C;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleCreateHostedEndpointRequestMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___MRRequestDetails);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  uint64_t v10 = -[MRRequestDetails initWithName:requestID:reason:]( v7,  "initWithName:requestID:reason:",  @"_handleCreateHostedEndpointRequestMessage",  0LL,  v9);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDeviceUIDs]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C5DB8;
  v13[3] = &unk_10039F278;
  id v14 = v5;
  id v12 = v5;
  +[MRDCreateHostedEndpointRequest createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:]( &OBJC_CLASS___MRDCreateHostedEndpointRequest,  "createHostedEndpointWithOutputDeviceUIDs:timeout:details:completion:",  v11,  v10,  v13,  30.0);
}

- (void)_handleAdjustVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C5F64;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleGetVolumeMutedMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C611C;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleMuteVolumeMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C62B8;
  v6[3] = &unk_10039F0D0;
  id v7 = a3;
  id v5 = v7;
  [a4 requestDestinationEndpoint:v6];
}

- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000C6470;
  v6[3] = &unk_10039F308;
  id v7 = a3;
  id v5 = v7;
  [a4 requestConnectedDestinationEndpoint:v6];
}

- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v6 context]);
  objc_initWeak(&location, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 destinationPlayerPath]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C66B0;
  v13[3] = &unk_10039F3A8;
  id v10 = v8;
  id v14 = v10;
  id v11 = v6;
  id v15 = v11;
  objc_copyWeak(&v18, &location);
  id v16 = self;
  id v12 = v7;
  id v17 = v12;
  [v12 localizeDestinationPlayerPath:v9 completion:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_handleApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationPlayerPath]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C6C8C;
  v11[3] = &unk_10039EDE8;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v6 localizeDestinationPlayerPath:v8 completion:v11];
}

- (void)_handleInvalidateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 context]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationPlayerPath]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C6E58;
  v11[3] = &unk_10039EDE8;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v6 localizeDestinationPlayerPath:v8 completion:v11];
}

- (void)_handleRemoteDeviceInfo:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRDeviceInfoRequest deviceInfoForOrigin:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:",  v9));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 activeSystemEndpointUID]);
  id v7 = [v5 containsDevice:v6];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 WHAIdentifier]);
  -[MRDExternalDeviceRemoteServer updateASEAssertionForRemoteDeviceID:isAsserting:]( self,  "updateASEAssertionForRemoteDeviceID:isAsserting:",  v8,  v7);
}

- (void)updateASEAssertionForRemoteDeviceID:(id)a3 isAsserting:(BOOL)a4
{
  id v6 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C70A8;
  block[3] = &unk_10039AA30;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDRemoteControlService)remoteControlService
{
  return self->_remoteControlService;
}

- (NSMapTable)clientDisconnectionHandlers
{
  return self->_clientDisconnectionHandlers;
}

- (void).cxx_destruct
{
}

@end
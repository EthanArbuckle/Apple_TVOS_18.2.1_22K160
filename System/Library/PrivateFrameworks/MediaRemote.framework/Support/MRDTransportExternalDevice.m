@interface MRDTransportExternalDevice
- (BOOL)_maybeBatchRequest:(id)a3;
- (BOOL)isCallingClientCallback;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)isValid;
- (BOOL)supportsIdleDisconnection;
- (BOOL)wantsEndpointChangeNotifications;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRDTransportExternalDevice)initWithTransport:(id)a3;
- (MRDeviceInfo)deviceInfo;
- (MRExternalClientConnection)clientConnection;
- (MRExternalDeviceTransport)transport;
- (MROrigin)customOrigin;
- (MSVTimer)powerLogIntervalTimer;
- (NSMutableArray)pendingConnectCompletionHandlers;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)connectionStateCallbackQueue;
- (OS_dispatch_queue)customDataCallbackQueue;
- (OS_dispatch_queue)deviceInfoCallbackQueue;
- (OS_dispatch_queue)nameCallbackQueue;
- (OS_dispatch_queue)outputContextCallbackQueue;
- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue;
- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue;
- (OS_dispatch_queue)pairingAllowedCallbackQueue;
- (OS_dispatch_queue)pairingCallbackQueue;
- (OS_dispatch_queue)volumeCallbackQueue;
- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue;
- (OS_dispatch_queue)volumeMutedCallbackQueue;
- (OS_dispatch_queue)workerQueue;
- (id)_onSerialQueue_deviceInfo;
- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3;
- (id)_onWorkerQueue_initializeConnectionWithOptions:(unsigned int)a3 userInfo:(id)a4;
- (id)_onWorkerQueue_loadDeviceInfoWithUserInfo:(id)a3;
- (id)_onWorkerQueue_reRegisterCustomOriginWithUserInfo:(id)a3;
- (id)_onWorkerQueue_registerCustomOriginWithUserInfo:(id)a3;
- (id)_onWorkerQueue_syncClientStateWithUserInfo:(id)a3;
- (id)connectionStateCallback;
- (id)currentClientUpdatesConfigMessage;
- (id)customDataCallback;
- (id)deviceInfoCallback;
- (id)errorForCurrentState;
- (id)groupSessionToken;
- (id)hostName;
- (id)name;
- (id)nameCallback;
- (id)outputDevicesRemovedCallback;
- (id)outputDevicesUpdatedCallback;
- (id)pairingAllowedCallback;
- (id)pairingCallback;
- (id)personalOutputDevices;
- (id)shortDescription;
- (id)subscribedPlayerPaths;
- (id)supportedMessages;
- (id)uid;
- (id)volumeCallback;
- (id)volumeControlCapabilitiesCallback;
- (id)volumeMutedCallback;
- (int64_t)connectionRecoveryBehavior;
- (int64_t)port;
- (unsigned)connectionState;
- (void)_activeSystemEndpointDidChangeNotification:(id)a3;
- (void)_callAllPendingCompletionsWithError:(id)a3;
- (void)_callClientAllowsPairingCallback;
- (void)_callClientConnectionStateCallback:(unsigned int)a3 previousConnectionState:(unsigned int)a4 error:(id)a5;
- (void)_callClientCustomDataCallback:(id)a3 name:(id)a4;
- (void)_callClientNameCallback;
- (void)_callClientPairingCallback:(id)a3;
- (void)_callDeviceInfoCallback:(id)a3 oldDeviceInfo:(id)a4;
- (void)_callIsMutedCallback:(BOOL)a3 outputDeviceUID:(id)a4;
- (void)_callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:(id)a3;
- (void)_callOutputDevicesUpdatedCallbackWithOutputDevices:(id)a3;
- (void)_callVolumeCallback:(float)a3 outputDeviceUID:(id)a4;
- (void)_callVolumeControlCapabilitiesCallback:(unsigned int)a3 outputDeviceUID:(id)a4;
- (void)_cleanUpStreamsWithReason:(int64_t)a3 error:(id)a4;
- (void)_cleanUpWithReason:(int64_t)a3 error:(id)a4;
- (void)_handleApplicationConnectionProtocolMessage:(id)a3;
- (void)_handleDeviceInfoChange:(id)a3 oldDevice:(id)a4;
- (void)_handleDeviceInfoUpdateMessage:(id)a3;
- (void)_handleDiscoveryUpdateOutputDevicesMessage:(id)a3;
- (void)_handleGenericMessage:(id)a3;
- (void)_handleInvalidateApplicationConnectionMessage:(id)a3;
- (void)_handleLegacyVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)_handleNotificationMessage:(id)a3;
- (void)_handleOutputDevicesRemovedMessage:(id)a3;
- (void)_handleOutputDevicesUpdatedMessage:(id)a3;
- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6;
- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5;
- (void)_handlePlayerClientParticipantsUpdateMessage:(id)a3;
- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3;
- (void)_handlePromptForRouteAuthorizationMessage:(id)a3;
- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6;
- (void)_handleRemoveClientMessage:(id)a3;
- (void)_handleRemovePlayerMessage:(id)a3;
- (void)_handleSetConnectionStateMessage:(id)a3;
- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3;
- (void)_handleSetNowPlayingClientMessage:(id)a3;
- (void)_handleSetNowPlayingPlayerMessage:(id)a3;
- (void)_handleSetOriginClientPropertiesMessage:(id)a3;
- (void)_handleSetPlayerClientPropertiesMessage:(id)a3;
- (void)_handleSetStateMessage:(id)a3;
- (void)_handleUpdateActiveSystemEndpoint:(id)a3;
- (void)_handleUpdateClientMessage:(id)a3;
- (void)_handleUpdateContentItemsMessage:(id)a3;
- (void)_handleUpdatePlayerMessage:(id)a3;
- (void)_handleVolumeControlCapabilitiesDidChangeMessage:(id)a3;
- (void)_handleVolumeDidChangeMessage:(id)a3;
- (void)_handleVolumeMutedDidChangeMessage:(id)a3;
- (void)_localDeviceInfoDidChangeNotification:(id)a3;
- (void)_onSerialQueue_completeGroupSessionRequestsWithIdentifier:(id)a3 error:(id)a4;
- (void)_onSerialQueue_prepareToConnectWithOptions:(unsigned int)a3 userInfo:(id)a4 connectionAttemptDetails:(id)a5 connectionHandler:(id)a6;
- (void)_onSerialQueue_prepareToDisconnect:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)_onSerialQueue_registerOriginCallbacks;
- (void)_onWorkerQueue_connectWithOptions:(unsigned int)a3 isRetry:(BOOL)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_disconnect:(id)a3;
- (void)_onWorkerQueue_sendBatchedMessages;
- (void)_sendClientMessage:(id)a3 completion:(id)a4;
- (void)_transportDeviceInfoDidChangeNotification:(id)a3;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)clientDidDisconnect:(id)a3 error:(id)a4;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(_MRHIDButtonEvent)a3;
- (void)sendClientUpdatesConfigMessage;
- (void)sendClientUpdatesConfigMessageWithCompletion:(id)a3;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setClientConnection:(id)a3;
- (void)setConnectionRecoveryBehavior:(int64_t)a3;
- (void)setConnectionState:(unsigned int)a3 error:(id)a4;
- (void)setConnectionStateCallback:(id)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConnectionStateCallbackQueue:(id)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setCustomDataCallback:(id)a3;
- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4;
- (void)setCustomDataCallbackQueue:(id)a3;
- (void)setCustomOrigin:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceInfoCallback:(id)a3;
- (void)setDeviceInfoCallbackQueue:(id)a3;
- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setIsCallingClientCallback:(BOOL)a3;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setName:(id)a3;
- (void)setNameCallback:(id)a3;
- (void)setNameCallback:(id)a3 withQueue:(id)a4;
- (void)setNameCallbackQueue:(id)a3;
- (void)setOutputContextCallbackQueue:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setOutputDevicesRemovedCallback:(id)a3;
- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesRemovedCallbackQueue:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3;
- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4;
- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3;
- (void)setPairingAllowedCallback:(id)a3;
- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingAllowedCallbackQueue:(id)a3;
- (void)setPairingCallback:(id)a3;
- (void)setPairingCallback:(id)a3 withQueue:(id)a4;
- (void)setPairingCallbackQueue:(id)a3;
- (void)setPendingConnectCompletionHandlers:(id)a3;
- (void)setPowerLogIntervalTimer:(id)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setUsingSystemPairing:(BOOL)a3;
- (void)setVolumeCallback:(id)a3;
- (void)setVolumeCallbackQueue:(id)a3;
- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallback:(id)a3;
- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3;
- (void)setVolumeMutedCallback:(id)a3;
- (void)setVolumeMutedCallbackQueue:(id)a3;
- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4;
- (void)setWantsEndpointChangeNotifications:(BOOL)a3;
- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3;
- (void)setWantsNowPlayingNotifications:(BOOL)a3;
- (void)setWantsOutputDeviceNotifications:(BOOL)a3;
- (void)setWantsSystemEndpointNotifications:(BOOL)a3;
- (void)setWantsVolumeNotifications:(BOOL)a3;
- (void)setWorkerQueue:(id)a3;
- (void)verifyConnectionStatusAndMaybeDisconnect:(id)a3;
@end

@implementation MRDTransportExternalDevice

- (MRDTransportExternalDevice)initWithTransport:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MRDTransportExternalDevice;
  v6 = (MRDTransportExternalDevice *)-[MRDTransportExternalDevice _init](&v27, "_init");
  v7 = v6;
  if (v6)
  {
    p_transport = (id *)&v6->_transport;
    objc_storeStrong((id *)&v6->_transport, a3);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.SerialQueue", v10);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.WorkerQueue", v14);
    workerQueue = v7->_workerQueue;
    v7->_workerQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.MediaRemote.MRExternalDevice.NotificationQueue", v18);
    notificationQueue = v7->_notificationQueue;
    v7->_notificationQueue = (OS_dispatch_queue *)v19;

    v7->_connectionState = 3;
    v7->_reconnectionAttemptCount = 0LL;
    v7->_connectionOptions = 0;
    v7->_forceReconnectOnConnectionFailure = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 UUIDString]);
    connectionUID = v7->_connectionUID;
    v7->_connectionUID = (NSString *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v24 addObserver:v7 selector:"_localDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v24 addObserver:v7 selector:"_transportDeviceInfoDidChangeNotification:" name:MRExternalDeviceTransportDeviceInfoDidChangeNotification object:*p_transport];
    [v24 addObserver:v7 selector:"_activeSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
    v25 = (void *)objc_claimAutoreleasedReturnValue([*p_transport deviceInfo]);
    -[MRDTransportExternalDevice _handleDeviceInfoChange:oldDevice:](v7, "_handleDeviceInfoChange:oldDevice:", v25, 0LL);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  -[MRExternalClientConnection setDelegate:](self->_clientConnection, "setDelegate:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRDTransportExternalDevice;
  -[MRDTransportExternalDevice dealloc](&v4, "dealloc");
}

- (id)shortDescription
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%p",  objc_opt_class(self),  self);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice transport](self, "transport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p %@ transport=%@>",  v3,  self,  v4,  v5));

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class(self);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice name](self, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice transport](self, "transport"));
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromObject(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  uint64_t v12 = MRCreateIndentedDebugDescriptionFromObject(v11);
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p {\n    device=%@\n    origin=%@\n    transport=%@\n    connection=%@\n}>",  v3,  self,  v4,  v7,  v10,  v13));

  return (NSString *)v14;
}

- (id)name
{
  transport = (MRExternalDeviceTransport *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  objc_super v4 = transport;
  if (!transport) {
    transport = self->_transport;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport name](transport, "name"));

  return v5;
}

- (id)hostName
{
  return -[MRExternalDeviceTransport hostname](self->_transport, "hostname");
}

- (int64_t)port
{
  return (int64_t)-[MRExternalDeviceTransport port](self->_transport, "port");
}

- (id)uid
{
  return -[MRExternalDeviceTransport uid](self->_transport, "uid");
}

- (id)groupSessionToken
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 groupSessionToken]);
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 equivalentMediaIdentifier]);
  if (!v5)
  {

    goto LABEL_5;
  }

  uint64_t v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRSharedSettings currentSettings](&OBJC_CLASS___MRSharedSettings, "currentSettings"));
  unsigned int v8 = [v7 supportGroupSessionHome];

  if (v8)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v10 groupSessionToken]);

    return v9;
  }

  uint64_t v9 = 0LL;
  return v9;
}

- (BOOL)isValid
{
  return self->_transport != 0LL;
}

- (BOOL)isPaired
{
  return 0;
}

- (BOOL)isUsingSystemPairing
{
  return self->_usingSystemPairing;
}

- (void)setUsingSystemPairing:(BOOL)a3
{
  self->_usingSystemPairing = a3;
}

- (BOOL)wantsNowPlayingNotifications
{
  return self->_wantsNowPlayingNotifications;
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  if (self->_wantsNowPlayingNotifications != a3)
  {
    self->_wantsNowPlayingNotifications = a3;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return self->_wantsNowPlayingArtworkNotifications;
}

- (void)setWantsNowPlayingArtworkNotifications:(BOOL)a3
{
  if (self->_wantsNowPlayingArtworkNotifications != a3)
  {
    self->_wantsNowPlayingArtworkNotifications = a3;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (BOOL)wantsVolumeNotifications
{
  return self->_wantsVolumeNotifications;
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  if (self->_wantsVolumeNotifications != a3)
  {
    self->_wantsVolumeNotifications = a3;
    MRMediaRemoteSetWantsVolumeControlNotifications(a3, a2);
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (BOOL)wantsOutputDeviceNotifications
{
  return self->_wantsOutputDeviceNotifications;
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  if (self->_wantsOutputDeviceNotifications != a3)
  {
    self->_wantsOutputDeviceNotifications = a3;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (BOOL)wantsEndpointChangeNotifications
{
  return self->_wantsEndpointChangeNotifications;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  if (self->_wantsEndpointChangeNotifications != a3)
  {
    self->_wantsEndpointChangeNotifications = a3;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (BOOL)wantsSystemEndpointNotifications
{
  return self->_wantsSystemEndpointNotifications;
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  if (self->_wantsSystemEndpointNotifications != a3)
  {
    self->_wantsSystemEndpointNotifications = a3;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
  }

- (id)subscribedPlayerPaths
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport subscribedPlayerPaths](self->_transport, "subscribedPlayerPaths"));
  id v4 = [v3 copy];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = -[NSArray copy](self->_subscribedPlayerPaths, "copy");
  }
  v7 = v6;

  return v7;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  unsigned int v8 = (NSArray *)a3;
  id v4 = self->_subscribedPlayerPaths;
  if (v4 == v8)
  {
  }

  else
  {
    unsigned __int8 v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      id v6 = (NSArray *)-[NSArray copy](v8, "copy");
      subscribedPlayerPaths = self->_subscribedPlayerPaths;
      self->_subscribedPlayerPaths = v6;

      -[MRDTransportExternalDevice sendClientUpdatesConfigMessage](self, "sendClientUpdatesConfigMessage");
    }
  }
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UTF8String];
  id v6 = [v4 length];

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  id v8 = objc_alloc(&OBJC_CLASS___MRGenericMessage);
  id v9 = [v8 initWithKey:MRGenericMessageSetNameKey data:v10];
  [v7 sendMessage:v9];
}

- (void)setClientConnection:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083CB0;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (MRExternalClientConnection)clientConnection
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100083DE0;
  id v10 = sub_100083DF0;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100083DF8;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRExternalClientConnection *)v3;
}

- (void)setCustomOrigin:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083E98;
  v7[3] = &unk_100398E60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (MROrigin)customOrigin
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100083DE0;
  id v10 = sub_100083DF0;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084004;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MROrigin *)v3;
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = [a3 copy];
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000840A8;
  v7[3] = &unk_100398E60;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (id)_onSerialQueue_deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    return deviceInfo;
  }
  else {
    return (id)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport deviceInfo](self->_transport, "deviceInfo"));
  }
}

- (MRDeviceInfo)deviceInfo
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100083DE0;
  id v10 = sub_100083DF0;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100084260;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDeviceInfo *)v3;
}

- (id)supportedMessages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 supportedMessages]);

  return v3;
}

- (unsigned)connectionState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008437C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setConnectionState:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  serialQueue = self->_serialQueue;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_100084488;
  uint64_t v12 = &unk_10039D740;
  dispatch_queue_t v15 = &v17;
  dispatch_queue_attr_t v13 = self;
  int v16 = v4;
  id v8 = v6;
  id v14 = v8;
  msv_dispatch_sync_on_queue(serialQueue, &v9);
  -[MRDTransportExternalDevice _callClientConnectionStateCallback:previousConnectionState:error:]( self,  "_callClientConnectionStateCallback:previousConnectionState:error:",  v4,  *((unsigned int *)v18 + 6),  v8,  v9,  v10,  v11,  v12,  v13);

  _Block_object_dispose(&v17, 8);
}

- (void)setPairingCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000846F4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000847E4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setNameCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000848D4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setPairingAllowedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000849C4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084AB4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setOutputDevicesUpdatedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084BA4;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setOutputDevicesRemovedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084C94;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setVolumeChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084D84;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084E74;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setVolumeMutedChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100084F64;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setDeviceInfoChangedCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  if (!v7)
  {
    v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085054;
  block[3] = &unk_10039D198;
  dispatch_queue_attr_t v13 = v7;
  id v14 = v6;
  block[4] = self;
  uint64_t v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  unsigned int v3 = *(_DWORD *)&a3.down;
  uint64_t v4 = *(void *)&a3.usagePage;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (!v6)
  {
    id v7 = objc_msgSend([MRSendButtonEventMessage alloc], "initWithButtonEvent:", v4, v3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    [v8 sendMessage:v7];

    id v6 = 0LL;
  }
}

- (id)personalOutputDevices
{
  return 0LL;
}

- (BOOL)supportsIdleDisconnection
{
  return -[MRExternalDeviceTransport supportsIdleDisconnection]( self->_transport,  "supportsIdleDisconnection");
}

- (void)_onWorkerQueue_connectWithOptions:(unsigned int)a3 isRetry:(BOOL)a4 userInfo:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v109 = a5;
  id v9 = a6;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  v107 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport description](self->_transport, "description"));
  dispatch_queue_attr_t v13 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions",  v11);
  dispatch_queue_t v15 = v13;
  if (v12) {
    -[NSMutableString appendFormat:](v13, "appendFormat:", @" for %@", v12);
  }
  if (v107) {
    -[NSMutableString appendFormat:](v15, "appendFormat:", @" because %@", v107);
  }
  uint64_t v16 = _MRLogForCategory(10LL, v14);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472LL;
  v128[2] = sub_100086164;
  v128[3] = &unk_10039B658;
  id v99 = v12;
  id v129 = v99;
  v130 = @"TransportExternalDevice.connectWithOptions";
  id v18 = v11;
  id v131 = v18;
  id v19 = v10;
  id v132 = v19;
  id v98 = v9;
  id v133 = v98;
  v103 = objc_retainBlock(v128);
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472LL;
  v127[2] = sub_1000863B0;
  v127[3] = &unk_10039D768;
  v127[4] = self;
  v106 = objc_retainBlock(v127);
  if (v7) {
    -[MRDTransportExternalDevice setConnectionState:error:](self, "setConnectionState:error:", 1LL, 0LL);
  }
  else {
    self->_reconnectionAttemptCount = 0LL;
  }
  v100 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  if (v7)
  {
    -[MRDTransportExternalDevice _cleanUpStreamsWithReason:error:](self, "_cleanUpStreamsWithReason:error:", 2LL, 0LL);
  }

  else
  {
    int v20 = objc_autoreleasePoolPush();
    -[MRDTransportExternalDevice _cleanUpWithReason:error:](self, "_cleanUpWithReason:error:", 2LL, 0LL);
    objc_autoreleasePoolPop(v20);
  }

  uint64_t v21 = ((uint64_t (*)(void))v106[2])();
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v21);
  if (v23)
  {
    uint64_t v24 = _MRLogForCategory(3LL, v22);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v26 = @"Interrupted";
LABEL_20:

      v105 = v19;
      goto LABEL_21;
    }

    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v135 = v23;
    v63 = "<%{public}@> Exiting connection attempt due to disconnection request for device %{public}@. %{public}@";
LABEL_40:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, v63, buf, 0x20u);
    goto LABEL_15;
  }

  v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_initializeConnectionWithOptions:userInfo:]( self,  "_onWorkerQueue_initializeConnectionWithOptions:userInfo:",  a3,  v109));
  if (v23)
  {
    uint64_t v28 = _MRLogForCategory(3LL, v27);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v135 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Failed to initialize IO streams for device: %{public}@. %{public}@",  buf,  0x20u);
    }

    v26 = @"Failed to create IO Streams";
    goto LABEL_20;
  }

  uint64_t v60 = ((uint64_t (*)(void))v106[2])();
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v60);
  if (v23)
  {
    uint64_t v62 = _MRLogForCategory(3LL, v61);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v62);
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }

  [v19 timeIntervalSinceNow];
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v64)));
  [v100 setObject:v65 forKeyedSubscript:kMRConnectionCreateIOStreamsDurationKey];

  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_loadDeviceInfoWithUserInfo:]( self,  "_onWorkerQueue_loadDeviceInfoWithUserInfo:",  v109));
  if (v23)
  {
    uint64_t v68 = _MRLogForCategory(3LL, v67);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v135 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Error loading device info for device %{public}@. %{public}@",  buf,  0x20u);
    }

    v26 = @"Failed to load device info";
LABEL_45:
    id v19 = v66;
    goto LABEL_20;
  }

  uint64_t v69 = ((uint64_t (*)(void))v106[2])();
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v69);
  if (v23)
  {
    uint64_t v71 = _MRLogForCategory(3LL, v70);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v71);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v135 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@",  buf,  0x20u);
    }

    v26 = @"Interrupted";
    goto LABEL_45;
  }

  [v66 timeIntervalSinceNow];
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v72)));
  [v100 setObject:v73 forKeyedSubscript:kMRConnectionLoadDeviceInfoDurationKey];

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  LODWORD(v73) = v74 == 0LL;

  if ((_DWORD)v73)
  {
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_registerCustomOriginWithUserInfo:]( self,  "_onWorkerQueue_registerCustomOriginWithUserInfo:",  v109));
    if (v23)
    {
      uint64_t v78 = _MRLogForCategory(3LL, v77);
      dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v135 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Failed to register custom origin for device %{public}@. %{public}@",  buf,  0x20u);
      }

      v26 = @"Failed to register custom origin";
      goto LABEL_20;
    }
  }

  else
  {
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_reRegisterCustomOriginWithUserInfo:]( self,  "_onWorkerQueue_reRegisterCustomOriginWithUserInfo:",  v109));
    if (v23)
    {
      uint64_t v76 = _MRLogForCategory(3LL, v75);
      dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v76);
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2114;
        v135 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Failed to re-register custom origin for device %{public}@. %{public}@",  buf,  0x20u);
      }

      v26 = @"Failed to re-register custom origin";
      goto LABEL_20;
    }
  }

  uint64_t v79 = ((uint64_t (*)(void))v106[2])();
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v79);
  if (v23)
  {
    uint64_t v81 = _MRLogForCategory(3LL, v80);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v81);
    if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
LABEL_34:
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    v135 = v23;
    v63 = "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@";
    goto LABEL_40;
  }

  [v19 timeIntervalSinceNow];
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v82)));
  [v100 setObject:v83 forKeyedSubscript:kMRConnectionRegisterCustomOriginDurationKey];

  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_syncClientStateWithUserInfo:]( self,  "_onWorkerQueue_syncClientStateWithUserInfo:",  v109));
  if (v23)
  {
    uint64_t v85 = _MRLogForCategory(3LL, v84);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v85);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v135 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Failed to sync client state for device %{public}@. %{public}@",  buf,  0x20u);
    }

    v26 = @"Failed to sync client state";
LABEL_70:
    id v19 = v105;
    goto LABEL_20;
  }

  uint64_t v86 = ((uint64_t (*)(void))v106[2])();
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(v86);
  if (v23)
  {
    uint64_t v88 = _MRLogForCategory(3LL, v87);
    dispatch_semaphore_t v25 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2114;
      v135 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_ERROR,  "<%{public}@> Exiting connection attempt due to disconnection request for %{public}@. %{public}@",  buf,  0x20u);
    }

    v26 = @"Interrupted";
    goto LABEL_70;
  }

  [v105 timeIntervalSinceNow];
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fabs(v89)));
  [v100 setObject:v90 forKeyedSubscript:kMRConnectionSyncClientStateDurationKey];

  -[MRDTransportExternalDevice _onWorkerQueue_sendBatchedMessages](self, "_onWorkerQueue_sendBatchedMessages");
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v91 externalDeviceArtificalConnectionDelay];
  double v93 = v92;

  if (v93 > 0.0)
  {
    uint64_t v95 = _MRLogForCategory(10LL, v94);
    v96 = (os_log_s *)objc_claimAutoreleasedReturnValue(v95);
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = @"TransportExternalDevice.connectWithOptions";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v135 = @"Artifical Delay...";
      _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    dispatch_semaphore_t v25 = dispatch_semaphore_create(0LL);
    dispatch_time_t v97 = dispatch_time(0LL, (uint64_t)(v93 * 1000000000.0));
    dispatch_semaphore_wait(v25, v97);
    v26 = 0LL;
    v23 = 0LL;
    goto LABEL_70;
  }

  v26 = 0LL;
  v23 = 0LL;
LABEL_21:
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v29 timeIntervalSinceDate:v105];
  v31 = v30;

  v32 = objc_alloc(&OBJC_CLASS___NSString);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport name](self->_transport, "name"));
  uint64_t v34 = objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport uid](self->_transport, "uid"));
  v35 = (void *)v34;
  char v36 = a3 & 1;
  if (v23) {
    v37 = v23;
  }
  else {
    v37 = @"success";
  }
  v102 = -[NSString initWithFormat:]( v32,  "initWithFormat:",  @"<%@> Connection to: %@ (%@) from client: %@ isRetry: %u allowAuth: %u reason: %@ result: %@ in: %.2f",  v18,  v33,  v34,  v104,  v7,  a3 & 1,  v107,  v37,  v31);

  uint64_t v39 = _MRLogForCategory(10LL, v38);
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = @"TransportExternalDevice.connectWithOptions";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v135 = v102;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472LL;
  v117[2] = sub_1000864D4;
  v117[3] = &unk_10039D790;
  objc_copyWeak(v123, &location);
  uint64_t v41 = kMREventConnection;
  BOOL v124 = v7;
  id v42 = v107;
  id v118 = v42;
  id v108 = v18;
  id v119 = v108;
  id v43 = v104;
  id v120 = v43;
  char v125 = v36;
  v123[1] = v31;
  id v44 = v100;
  id v121 = v44;
  v122 = (__CFString *)v26;
  MRAnalyticsSendEvent(v41, v23, v117);
  if (v23)
  {
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008670C;
    block[3] = &unk_100399120;
    block[4] = self;
    v114 = v23;
    id v115 = v109;
    v116 = v103;
    dispatch_async(serialQueue, block);
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v135) = 0;
    v46 = (dispatch_queue_s *)self->_serialQueue;
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472LL;
    v112[2] = sub_10008671C;
    v112[3] = &unk_100398EC8;
    v112[4] = self;
    v112[5] = buf;
    dispatch_sync(v46, v112);
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v47 setObject:v43 forKeyedSubscript:MRPowerLogInfoKeyClientBundleID];
      [v47 setObject:v42 forKeyedSubscript:MRPowerLogInfoKeyReason];
      [v47 setObject:self->_connectionUID forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionID];
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
      v49 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  MRPowerLogDeviceTypeFromDeviceInfo());
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      [v47 setObject:v50 forKeyedSubscript:MRPowerLogInfoKeyDeviceType];

      v51 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  MRPowerLogConnectionTransportTypeFromTransport(self->_transport));
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      [v47 setObject:v52 forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionTransportType];

      [v47 setObject:&__kCFBooleanTrue forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionIsActive];
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[MRPowerLogger sharedLogger](&OBJC_CLASS___MRPowerLogger, "sharedLogger"));
      [v53 logEvent:MRPowerLogEventRemoteControlSession withInfo:v47];

      v54 = objc_alloc(&OBJC_CLASS___MSVTimer);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
      v56 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      v110[2] = sub_10008678C;
      v110[3] = &unk_100399250;
      id v57 = v47;
      id v111 = v57;
      v58 = -[MSVTimer initWithInterval:repeats:queue:block:]( v54,  "initWithInterval:repeats:queue:block:",  1LL,  v56,  v110,  1800.0);
      powerLogIntervalTimer = self->_powerLogIntervalTimer;
      self->_powerLogIntervalTimer = v58;
    }

    ((void (*)(void *, void))v103[2])(v103, 0LL);
    -[MRDTransportExternalDevice setConnectionState:error:](self, "setConnectionState:error:", 2LL, 0LL);
    _Block_object_dispose(buf, 8);
  }

  objc_destroyWeak(v123);
  objc_destroyWeak(&location);
}

- (void)_onSerialQueue_prepareToConnectWithOptions:(unsigned int)a3 userInfo:(id)a4 connectionAttemptDetails:(id)a5 connectionHandler:(id)a6
{
  id v40 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = objc_alloc(&OBJC_CLASS___MRBlockGuard);
  uint64_t v12 = objc_alloc(&OBJC_CLASS___NSString);
  dispatch_queue_attr_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 reason]);
  dispatch_queue_t v15 = -[NSString initWithFormat:]( v12,  "initWithFormat:",  @"%@<%@:%@>",  @"TransportExternalDevice.connectWithOptions",  v13,  v14);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_100086C88;
  v48[3] = &unk_100399530;
  id v16 = v10;
  id v49 = v16;
  id v17 = [v11 initWithTimeout:v15 reason:v48 handler:30.0];

  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100086C94;
  v45[3] = &unk_10039BAB8;
  id v18 = v17;
  id v46 = v18;
  id v19 = v16;
  id v47 = v19;
  uint64_t v21 = objc_retainBlock(v45);
  unsigned int connectionState = self->_connectionState;
  if (connectionState == 1)
  {
    uint64_t v27 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Connection already in progress, batching connection attempt %@",  self->_pendingConnectCompletionHandlers);
    uint64_t v29 = _MRLogForCategory(10LL, v28);
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
      *(_DWORD *)buf = 138543874;
      v51 = @"TransportExternalDevice.connectWithOptions";
      __int16 v52 = 2114;
      v53 = v31;
      __int16 v54 = 2112;
      v55 = (const __CFString *)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    if ((a3 & 1) != 0 && (self->_connectionOptions & 1) == 0)
    {
      uint64_t v33 = _MRLogForCategory(10LL, v32);
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
        *(_DWORD *)buf = 138543874;
        v51 = @"TransportExternalDevice.connectWithOptions";
        __int16 v52 = 2114;
        v53 = v35;
        __int16 v54 = 2112;
        v55 = @"AuthUpgrade required";
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
      }

      self->_forceReconnectOnConnectionFailure = 1;
      self->_connectionOptions = a3;
    }

    [v18 disarm];

    dispatch_semaphore_t v25 = v40;
  }

  else if (connectionState == 2)
  {
    uint64_t v23 = _MRLogForCategory(10LL, v20);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_semaphore_t v25 = v40;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v9 requestID]);
      *(_DWORD *)buf = 138543874;
      v51 = @"TransportExternalDevice.connectWithOptions";
      __int16 v52 = 2114;
      v53 = v26;
      __int16 v54 = 2112;
      v55 = @"Already Connected";
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }

    ((void (*)(void *, void))v21[2])(v21, 0LL);
  }

  else
  {
    self->_connectionOptions = a3;
    -[MRDTransportExternalDevice setConnectionState:error:](self, "setConnectionState:error:", 1LL, 0LL);
    workerQueue = (dispatch_queue_s *)self->_workerQueue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100086CE0;
    v41[3] = &unk_10039D7B8;
    v41[4] = self;
    unsigned int v44 = a3;
    dispatch_semaphore_t v25 = v40;
    id v42 = v40;
    id v43 = v21;
    uint64_t v37 = MRCreateDonatedQosBlock(v41);
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    dispatch_async(workerQueue, v38);
  }
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v42 = a5;
  id v8 = a4;
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v9 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v8);
  int v44 = v6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v6));
  id v43 = v9;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, @"ConnectOptions");

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey]);

  dispatch_queue_attr_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:%p, connectionID=%@",  objc_opt_class(self),  self,  self->_connectionUID);
  uint64_t v14 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions",  v11);
  id v16 = v14;
  if (v13) {
    -[NSMutableString appendFormat:](v14, "appendFormat:", @" for %@", v13);
  }
  if (v12) {
    -[NSMutableString appendFormat:](v16, "appendFormat:", @" because %@", v12);
  }
  v45 = (void *)v12;
  uint64_t v17 = _MRLogForCategory(10LL, v15);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v19 = qos_class_self();
  uint64_t v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.mediaremote.transportExternalDevice.connect.%@", v11);
  uint64_t v21 = -[NSString UTF8String](v20, "UTF8String");
  dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
  dispatch_queue_attr_t v24 = dispatch_queue_attr_make_with_qos_class(v23, (dispatch_qos_class_t)v19, 0);
  dispatch_semaphore_t v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice connectionStateCallbackQueue]( self,  "connectionStateCallbackQueue"));
  dispatch_queue_t v27 = dispatch_queue_create_with_target_V2(v21, v25, v26);

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_100087148;
  v50[3] = &unk_10039D7E0;
  int v56 = v19;
  id v51 = v11;
  __int16 v52 = v13;
  dispatch_queue_t v54 = v27;
  id v55 = v42;
  id v53 = v41;
  id v40 = v27;
  id v28 = v42;
  id v29 = v41;
  v30 = v13;
  id v31 = v11;
  uint64_t v32 = objc_retainBlock(v50);
  id v33 = objc_alloc_init(&OBJC_CLASS___MRExternalDeviceConnectionDetails);
  [v33 setStartDate:v29];
  [v33 setRequestID:v31];
  [v33 setReason:v12];
  [v33 setQos:v19];
  id v34 = [v32 copy];
  [v33 setCompletion:v34];

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000874B0;
  v46[3] = &unk_10039D808;
  v46[4] = self;
  id v47 = v33;
  int v49 = v44;
  v48 = v43;
  char v36 = v43;
  id v37 = v33;
  uint64_t v38 = MRCreateDonatedQosBlock(v46);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  dispatch_async(serialQueue, v39);
}

- (void)_onWorkerQueue_disconnect:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  batchedRequestsDuringReconnectionAttempt = self->_batchedRequestsDuringReconnectionAttempt;
  self->_batchedRequestsDuringReconnectionAttempt = 0LL;

  -[MRExternalDeviceTransport resetWithError:](self->_transport, "resetWithError:", v6);
  -[MRDTransportExternalDevice _cleanUpWithReason:error:](self, "_cleanUpWithReason:error:", 3LL, v6);
  if (self->_connectionState != 3) {
    -[MRDTransportExternalDevice setConnectionState:error:](self, "setConnectionState:error:", 3LL, v6);
  }
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100087644;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)_onSerialQueue_prepareToDisconnect:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  id v11 = a4;
  dispatch_assert_queue_V2(serialQueue);
  uint64_t v13 = _MRLogForCategory(3LL, v12);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1002B6F68();
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:MRExternalDeviceConnectionClientBundleIDUserInfoKey]);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  unsigned int v19 = [v18 isEqualToString:kMRMediaRemoteFrameworkErrorDomain];

  if (v19) {
    uint64_t v20 = (uint64_t)[v8 code];
  }
  else {
    uint64_t v20 = 1LL;
  }
  id v66 = v15;
  v65 = v16;
  id v21 = v17;
  double v64 = v9;
  if (qword_1003FDD80 != -1) {
    dispatch_once(&qword_1003FDD80, &stru_10039D828);
  }
  uint64_t v22 = qword_1003FDD78;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v20));
  LOBYTE(v22) = [(id)v22 containsObject:v23];

  id v24 = v21;
  dispatch_semaphore_t v25 = v65;
  id v26 = v66;
  if ((v22 & 1) == 0)
  {
    if (self->_forceReconnectOnConnectionFailure) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = (_DWORD)v20 != 119
    }
         && self->_connectionRecoveryBehavior == 1
    dispatch_semaphore_t v25 = v65;
    if (!v65)
    {
      id v28 = objc_alloc(&OBJC_CLASS___NSString);
      if (self->_forceReconnectOnConnectionFailure)
      {
        id v29 = @"authUpgrade";
      }

      else
      {
        int64_t connectionRecoveryBehavior = self->_connectionRecoveryBehavior;
        id v31 = @"?";
        if (connectionRecoveryBehavior == 1) {
          id v31 = @"AutoRetry";
        }
        if (connectionRecoveryBehavior) {
          id v29 = v31;
        }
        else {
          id v29 = @"None";
        }
      }

      dispatch_semaphore_t v25 = -[NSString initWithFormat:](v28, "initWithFormat:", @"attemptReconnection due to <%@>", v29);
    }

    id v26 = v66;
    if (!v66)
    {
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v26 = (id)objc_claimAutoreleasedReturnValue([v32 UUIDString]);
    }

    id v24 = v21;
    if (!v21)
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 daemonClient]);
      id v24 = (id)objc_claimAutoreleasedReturnValue([v34 bundleIdentifier]);

      id v21 = 0LL;
    }

    -[NSDate timeIntervalSinceNow](self->_connectionStateTimestamp, "timeIntervalSinceNow");
    unint64_t reconnectionAttemptCount = self->_reconnectionAttemptCount;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_100087F24;
    v78[3] = &unk_10039D848;
    *(double *)&v78[4] = -v36;
    v78[5] = reconnectionAttemptCount;
    BOOL v79 = v27;
    MRAnalyticsSendEvent(kMREventDisconnection, v8, v78);
    uint64_t v38 = _MRLogForCategory(3LL, v37);
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v40)
      {
        unint64_t v41 = self->_reconnectionAttemptCount + 1;
        *(_DWORD *)buf = 138543874;
        uint64_t v81 = self;
        __int16 v82 = 2048;
        unint64_t v83 = v41;
        __int16 v84 = 2048;
        uint64_t v85 = 1LL;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Attempting to reconnect to external device %{public}@ (retry %llu out of %llu)",  buf,  0x20u);
      }

      ++self->_reconnectionAttemptCount;
      self->_forceReconnectOnConnectionFailure = 0;
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v42 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.attemptReconnection",  v26);
      id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

      if (v43)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
        -[NSMutableString appendFormat:](v42, "appendFormat:", @" for %@", v45);
      }

      uint64_t v46 = _MRLogForCategory(10LL, v44);
      id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v81 = (MRDTransportExternalDevice *)v42;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
      }

      -[MRDTransportExternalDevice setConnectionState:error:](self, "setConnectionState:error:", 1LL, 0LL);
      v48 = -[NSMutableArray initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithArray:",  self->_batchedRequestsDuringReconnectionAttempt);
      batchedRequestsDuringReconnectionAttempt = self->_batchedRequestsDuringReconnectionAttempt;
      self->_batchedRequestsDuringReconnectionAttempt = v48;

      dispatch_time_t v50 = dispatch_time(0LL, 3500000000LL);
      workerQueue = (dispatch_queue_s *)self->_workerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100088028;
      block[3] = &unk_10039D870;
      dispatch_semaphore_t v25 = v25;
      double v72 = v25;
      id v26 = v26;
      id v73 = v26;
      id v24 = v24;
      id v74 = v24;
      uint64_t v75 = self;
      id v76 = v63;
      id v77 = v64;
      id v52 = v64;
      id v53 = v63;
      dispatch_after(v50, workerQueue, block);

      goto LABEL_46;
    }

    if (v40)
    {
      int64_t v54 = self->_connectionRecoveryBehavior;
      unint64_t v55 = self->_reconnectionAttemptCount;
      *(_DWORD *)buf = 138544130;
      if (v54 == 1) {
        int v56 = "retry";
      }
      else {
        int v56 = "none";
      }
      uint64_t v81 = self;
      __int16 v82 = 2114;
      unint64_t v83 = (unint64_t)v8;
      __int16 v84 = 2082;
      uint64_t v85 = (uint64_t)v56;
      __int16 v86 = 2048;
      unint64_t v87 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Not attempting reconnect of external device %{public}@ (error = %{public}@, recovery behavior = %{public}s, atte mpt count = %llu)",  buf,  0x2Au);
    }
  }

  powerLogIntervalTimer = self->_powerLogIntervalTimer;
  self->_powerLogIntervalTimer = 0LL;

  if (self->_originalConnectionStartDate)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v58 setObject:self->_connectionUID forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionID];
    [v58 setObject:&__kCFBooleanFalse forKeyedSubscript:MRPowerLogInfoKeyRemoteControlConnectionIsActive];
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[MRPowerLogger sharedLogger](&OBJC_CLASS___MRPowerLogger, "sharedLogger"));
    [v59 logEvent:MRPowerLogEventRemoteControlSession withInfo:v58];
  }

  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalClientConnection cryptoSession](self->_clientConnection, "cryptoSession"));
  [v60 close];

  self->_disconnecting = 1;
  objc_initWeak((id *)buf, self);
  uint64_t v61 = (dispatch_queue_s *)self->_workerQueue;
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472LL;
  v67[2] = sub_1000883D4;
  v67[3] = &unk_10039D898;
  objc_copyWeak(&v70, (id *)buf);
  id v68 = v8;
  id v69 = v64;
  id v62 = v64;
  dispatch_async(v61, v67);

  objc_destroyWeak(&v70);
  objc_destroyWeak((id *)buf);
LABEL_46:
  -[MRDTransportExternalDevice _onSerialQueue_completeGroupSessionRequestsWithIdentifier:error:]( self,  "_onSerialQueue_completeGroupSessionRequestsWithIdentifier:error:",  0LL,  v8);
}

- (void)_callAllPendingCompletionsWithError:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_100083DE0;
  BOOL v27 = sub_100083DF0;
  id v28 = 0LL;
  serialQueue = self->_serialQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000886EC;
  v22[3] = &unk_100399278;
  v22[4] = self;
  v22[5] = &v23;
  msv_dispatch_sync_on_queue(serialQueue, v22);
  if ((unint64_t)[(id)v24[5] count] >= 2)
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSString);
    BOOL v7 = -[NSString initWithFormat:](v6, "initWithFormat:", @"Calling batched completions %@", v24[5]);
    uint64_t v9 = _MRLogForCategory(10LL, v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([(id)v24[5] firstObject]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);
      *(_DWORD *)buf = 138543874;
      id v31 = @"TransportExternalDevice.connectWithOptions";
      __int16 v32 = 2114;
      id v33 = v12;
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Update: %{public}@<%{public}@> %@",  buf,  0x20u);
    }
  }

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v13 = (id)v24[5];
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v18 + 1) + 8 * (void)v16) completion]);
        ((void (**)(void, id))v17)[2](v17, v4);

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }

    while (v14);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)disconnect:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000887BC;
  v7[3] = &unk_100398E60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (void)verifyConnectionStatusAndMaybeDisconnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000888B0;
  v6[3] = &unk_10039D8C0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[MRDTransportExternalDevice ping:callback:withQueue:](self, "ping:callback:withQueue:", v6, self->_workerQueue, 7.0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v9)
  {
    uint64_t v10 = _MRLogForCategory(3LL, v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002B7060((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  else
  {
    id v18 = [[MRGenericMessage alloc] initWithKey:v7 data:v6];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    [v19 sendMessage:v18];
  }
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100088C74;
  v25[3] = &unk_10039D908;
  uint64_t v10 =  -[MSVBlockGuard initWithDeallocHandler:]( objc_alloc(&OBJC_CLASS___MSVBlockGuard),  "initWithDeallocHandler:",  &stru_10039D8E0);
  id v26 = v10;
  id v11 = v8;
  id v28 = v11;
  id v12 = v9;
  id v27 = v12;
  uint64_t v13 = objc_retainBlock(v25);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v15)
  {
    uint64_t v16 = _MRLogForCategory(3LL, v14);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002B70C4();
    }

    ((void (*)(void *, void *))v13[2])(v13, v15);
  }

  else
  {
    id v18 = [[MRBlockGuard alloc] initWithTimeout:@"ping" reason:v13 handler:a3];
    id v19 = [[MRGenericMessage alloc] initWithKey:0 data:0];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100088D24;
    v22[3] = &unk_10039D930;
    id v23 = v18;
    id v24 = v13;
    id v21 = v18;
    [v20 sendMessage:v19 reply:v22];
  }
}

- (id)errorForCurrentState
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_100083DE0;
  uint64_t v10 = sub_100083DF0;
  id v11 = 0LL;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100088E5C;
  v5[3] = &unk_100398EC8;
  v5[4] = self;
  v5[5] = &v6;
  msv_dispatch_sync_on_queue(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)currentClientUpdatesConfigMessage
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
  [v3 setPriority:5];
  [v3 setWaking:1];
  id v4 = objc_alloc(&OBJC_CLASS___MRClientUpdatesConfigMessage);
  BOOL v5 = -[MRDTransportExternalDevice wantsNowPlayingNotifications](self, "wantsNowPlayingNotifications");
  BOOL v6 = -[MRDTransportExternalDevice wantsNowPlayingArtworkNotifications](self, "wantsNowPlayingArtworkNotifications");
  BOOL v7 = -[MRDTransportExternalDevice wantsVolumeNotifications](self, "wantsVolumeNotifications");
  BOOL v8 = -[MRDTransportExternalDevice wantsOutputDeviceNotifications](self, "wantsOutputDeviceNotifications");
  BOOL v9 = -[MRDTransportExternalDevice wantsSystemEndpointNotifications](self, "wantsSystemEndpointNotifications");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice subscribedPlayerPaths](self, "subscribedPlayerPaths"));
  id v11 = [v4 initWithNowPlayingUpdates:v5 artworkUpdates:v6 volumeUpdates:v7 keyboardUpdates:0 outputDeviceUpdates:v8 systemEndpointUpdat es:v9 subscribedPlayerPaths:v10];

  [v11 setTransportOptions:v3];
  return v11;
}

- (void)sendClientUpdatesConfigMessage
{
}

- (void)sendClientUpdatesConfigMessageWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000892B8;
  v17[3] = &unk_10039D980;
  objc_copyWeak(&v19, &location);
  id v6 = v4;
  id v18 = v6;
  BOOL v7 = objc_retainBlock(v17);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v8)
  {
    ((void (*)(void *, void *))v7[2])(v7, v8);
  }

  else
  {
    self->_isClientSyncActive = 1;
    unsigned int SharedQueueVersion = MRPairedDeviceGetSharedQueueVersion(v5);
    if (v6 && SharedQueueVersion >= 2)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice currentClientUpdatesConfigMessage]( self,  "currentClientUpdatesConfigMessage"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000893A4;
      v15[3] = &unk_10039D9A8;
      uint64_t v16 = v7;
      [v10 sendMessage:v11 reply:v15];

      Error = v16;
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice currentClientUpdatesConfigMessage]( self,  "currentClientUpdatesConfigMessage"));
      [v13 sendMessage:v14];

      Error = (void *)MRMediaRemoteCreateError(0LL);
      ((void (*)(void *, void *))v7[2])(v7, Error);
    }
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000896D8;
  v34[3] = &unk_10039BC48;
  id v15 = a7;
  id v36 = v15;
  id v16 = v14;
  id v35 = v16;
  uint64_t v17 = objc_retainBlock(v34);
  id v18 = self;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v18, "errorForCurrentState"));
  if (v19)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000897C8;
    v26[3] = &unk_10039D9D0;
    v26[4] = v18;
    float v31 = a3;
    id v27 = v12;
    id v28 = v13;
    id v29 = v16;
    id v30 = v15;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v18, "_maybeBatchRequest:", v26)) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }

  else
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = objc_alloc(&OBJC_CLASS___MRSetVolumeMessage);
    *(float *)&double v22 = a3;
    id v25 = v12;
    id v23 = [v21 initWithVolume:v12 outputDeviceUID:v13 details:v22];
    [v23 setTransportOptions:v20];
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v18, "clientConnection"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100089780;
    v32[3] = &unk_10039D9A8;
    id v33 = v17;
    [v24 sendMessage:v23 reply:v32];

    id v12 = v25;
  }
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100089A2C;
  v33[3] = &unk_10039BC48;
  id v15 = a7;
  id v35 = v15;
  id v16 = v14;
  id v34 = v16;
  uint64_t v17 = objc_retainBlock(v33);
  id v18 = self;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v18, "errorForCurrentState"));
  if (v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100089B1C;
    v25[3] = &unk_10039C2F8;
    void v25[4] = v18;
    BOOL v30 = v10;
    id v26 = v12;
    id v27 = v13;
    id v28 = v16;
    id v29 = v15;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v18, "_maybeBatchRequest:", v25)) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }

  else
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = [[MRMuteVolumeMessage alloc] initWithMuted:v10 outputDeviceUID:v12 details:v13];
    [v21 setTransportOptions:v20];
    id v22 = v13;
    id v23 = v12;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v18, "clientConnection"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100089AD4;
    v31[3] = &unk_10039D9A8;
    __int16 v32 = v17;
    [v24 sendMessage:v21 reply:v31];

    id v12 = v23;
    id v13 = v22;
  }
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100089D80;
  v33[3] = &unk_10039BC48;
  id v15 = a7;
  id v35 = v15;
  id v16 = v14;
  id v34 = v16;
  uint64_t v17 = objc_retainBlock(v33);
  id v18 = self;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v18, "errorForCurrentState"));
  if (v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100089E70;
    v25[3] = &unk_10039D9F8;
    void v25[4] = v18;
    int64_t v30 = a3;
    id v26 = v12;
    id v27 = v13;
    id v28 = v16;
    id v29 = v15;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v18, "_maybeBatchRequest:", v25)) {
      ((void (*)(void *, void *))v17[2])(v17, v19);
    }
  }

  else
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v20 setPriority:4];
    [v20 setWaking:1];
    id v21 = [[MRAdjustVolumeMessage alloc] initWithAdjustment:a3 outputDeviceUID:v12 details:v13];
    [v21 setTransportOptions:v20];
    id v22 = v13;
    id v23 = v12;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v18, "clientConnection"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100089E28;
    v31[3] = &unk_10039D9A8;
    __int16 v32 = v17;
    [v24 sendMessage:v21 reply:v31];

    id v12 = v23;
    id v13 = v22;
  }
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100089FF4;
  v18[3] = &unk_10039DA20;
  id v10 = a5;
  id v20 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = objc_retainBlock(v18);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v13)
  {
    ((void (*)(void *, void *, float))v12[2])(v12, v13, 0.0);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    id v15 = [[MRGetVolumeMessage alloc] initWithOutputDeviceUID:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008A13C;
    v16[3] = &unk_10039D9A8;
    uint64_t v17 = v12;
    [v14 sendMessage:v15 timeout:v16 reply:30.0];
  }
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10008A3D4;
  v27[3] = &unk_10039DA48;
  id v10 = a5;
  id v29 = v10;
  id v11 = v9;
  id v28 = v11;
  id v12 = objc_retainBlock(v27);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v13)
  {
    ((void (*)(void *, void, void *))v12[2])(v12, 0LL, v13);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 supportedMessages]);
    unsigned int v16 = [v15 isSupported:62];

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      id v18 = [[MRGetVolumeControlCapabilitiesMessage alloc] initWithOutputDeviceUID:v8];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10008A514;
      v25[3] = &unk_10039D9A8;
      id v26 = v12;
      [v17 sendMessage:v18 timeout:v25 reply:30.0];

      id v19 = v26;
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10008A5A0;
      v23[3] = &unk_10039DA70;
      id v24 = v12;
      MRMediaRemoteGetPickedRoutedVolumeControlCapabilities(v20, v22, v23);

      id v19 = v24;
    }
  }
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10008A734;
  v21[3] = &unk_10039BC48;
  id v13 = a6;
  id v23 = v13;
  id v14 = v12;
  id v22 = v14;
  id v15 = objc_retainBlock(v21);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v16)
  {
    ((void (*)(void *, void *))v15[2])(v15, v16);
  }

  else
  {
    id v17 = [[MRSetListeningModeMessage alloc] initWithListeningMode:v10 outputDeviceUID:v11];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10008A868;
    v19[3] = &unk_10039D9A8;
    id v20 = v15;
    [v18 sendMessage:v17 reply:v19];
  }
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10008AA20;
  v20[3] = &unk_10039BC48;
  id v12 = a6;
  id v22 = v12;
  id v13 = v11;
  id v21 = v13;
  id v14 = objc_retainBlock(v20);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v15)
  {
    ((void (*)(void *, void *))v14[2])(v14, v15);
  }

  else
  {
    id v16 = [[MRSetConversationDetectionEnabledMessage alloc] initWithOutputDeviceUID:v10 enabled:v8];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10008AB54;
    v18[3] = &unk_10039D9A8;
    id v19 = v14;
    [v17 sendMessage:v16 reply:v18];
  }
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10008AD74;
  v23[3] = &unk_10039BC48;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v13, "errorForCurrentState"));
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008AE64;
    v17[3] = &unk_100399120;
    void v17[4] = v13;
    id v18 = v8;
    id v19 = v11;
    id v20 = v10;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v13, "_maybeBatchRequest:", v17)) {
      ((void (*)(void *, void *))v12[2])(v12, v14);
    }
  }

  else
  {
    id v15 = [[MRModifyOutputContextRequestMessage alloc] initWithRequest:v8];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v13, "clientConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10008AE1C;
    v21[3] = &unk_10039D9A8;
    id v22 = v12;
    [v16 sendMessage:v15 reply:v21];
  }
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10008B050;
  v23[3] = &unk_10039DA98;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v13, "errorForCurrentState"));
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10008B224;
    v17[3] = &unk_100399120;
    void v17[4] = v13;
    id v18 = v8;
    id v19 = v11;
    id v20 = v10;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v13, "_maybeBatchRequest:", v17)) {
      ((void (*)(void *, void, void *))v12[2])(v12, 0LL, v14);
    }
  }

  else
  {
    id v15 = [[MRCreateHostedEndpointRequestMessage alloc] initWithOutputDeviceUIDs:v8];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v13, "clientConnection"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10008B124;
    v21[3] = &unk_10039D9A8;
    id v22 = v12;
    [v16 sendMessage:v15 reply:v21];
  }
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10008B444;
  v23[3] = &unk_10039BC48;
  id v10 = a5;
  id v25 = v10;
  id v11 = v9;
  id v24 = v11;
  id v12 = objc_retainBlock(v23);
  id v13 = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v13, "errorForCurrentState"));
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10008B578;
    v19[3] = &unk_100399120;
    void v19[4] = v13;
    id v20 = v8;
    id v21 = v11;
    id v22 = v10;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v13, "_maybeBatchRequest:", v19)) {
      ((void (*)(void *, void *))v12[2])(v12, v14);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v13, "clientConnection"));
    id v16 = objc_alloc(&OBJC_CLASS___MRRemoveFromParentGroupMessage);
    id v26 = v8;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    id v18 = [v16 initWithOutputDeviceUIDs:v17];
    [v15 sendMessage:v18];

    ((void (*)(void *, void))v12[2])(v12, 0LL);
  }
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10008B75C;
  v25[3] = &unk_10039DAC0;
  id v11 = v9;
  id v26 = v11;
  id v12 = v10;
  id v27 = v12;
  id v13 = objc_retainBlock(v25);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v14)
  {
    ((void (*)(void *, void, void *))v13[2])(v13, 0LL, v14);
  }

  else
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    char v24 = 1;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008B828;
    block[3] = &unk_10039DAE8;
    void block[4] = self;
    id v20 = &v21;
    id v19 = v13;
    dispatch_sync(serialQueue, block);
    if (*((_BYTE *)v22 + 24))
    {
      id v16 = [[MRRequestGroupSessionMessage alloc] initWithDetails:v8];
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      [v17 sendMessage:v16];
    }

    _Block_object_dispose(&v21, 8);
  }
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (uint64_t)[v5 type];
  uint64_t v8 = v6;
  if (v6 > 103)
  {
    if (v6 <= 128)
    {
      switch(v6)
      {
        case 'h':
          -[MRDTransportExternalDevice _handleSetPlayerClientPropertiesMessage:]( self,  "_handleSetPlayerClientPropertiesMessage:",  v5);
          break;
        case 'i':
          -[MRDTransportExternalDevice _handleSetOriginClientPropertiesMessage:]( self,  "_handleSetOriginClientPropertiesMessage:",  v5);
          break;
        case 'm':
          -[MRDTransportExternalDevice _handleDiscoveryUpdateOutputDevicesMessage:]( self,  "_handleDiscoveryUpdateOutputDevicesMessage:",  v5);
          break;
      }
    }

    else
    {
      switch(v6)
      {
        case 129LL:
          -[MRDTransportExternalDevice _handleVolumeMutedDidChangeMessage:]( self,  "_handleVolumeMutedDidChangeMessage:",  v5);
          break;
        case 131LL:
          -[MRDTransportExternalDevice _handlePlayerClientParticipantsUpdateMessage:]( self,  "_handlePlayerClientParticipantsUpdateMessage:",  v5);
          break;
        case 135LL:
          -[MRDTransportExternalDevice _handleApplicationConnectionProtocolMessage:]( self,  "_handleApplicationConnectionProtocolMessage:",  v5);
          break;
        case 136LL:
          -[MRDTransportExternalDevice _handleInvalidateApplicationConnectionMessage:]( self,  "_handleInvalidateApplicationConnectionMessage:",  v5);
          break;
        default:
          break;
      }
    }
  }

  else if (v6 <= 16)
  {
    if (v6)
    {
      if (v6 == 4)
      {
        -[MRDTransportExternalDevice _handleSetStateMessage:](self, "_handleSetStateMessage:", v5);
      }

      else if (v6 == 11)
      {
        -[MRDTransportExternalDevice _handleNotificationMessage:](self, "_handleNotificationMessage:", v5);
      }
    }

    else
    {
LABEL_12:
      uint64_t v9 = _MRLogForCategory(3LL, v7);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueIdentifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 replyIdentifier]);
        int v13 = 134218754;
        uint64_t v14 = v8;
        __int16 v15 = 2112;
        id v16 = v11;
        __int16 v17 = 2112;
        id v18 = v12;
        __int16 v19 = 2114;
        id v20 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unknown message type=%ld identifier=%@ replyIdentifier=%@ attempting to be handled for device %{public}@",  (uint8_t *)&v13,  0x2Au);
      }
    }
  }

  else
  {
    switch(v6)
    {
      case '!':
      case '""':
      case '9':
        goto LABEL_12;
      case '#':
      case '$':
      case '\'':
      case '(':
      case ')':
      case '+':
      case ',':
      case '-':
      case '0':
      case '1':
      case '2':
      case '3':
      case '<':
      case '>':
      case '?':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
        break;
      case '%':
        -[MRDTransportExternalDevice _handleDeviceInfoUpdateMessage:](self, "_handleDeviceInfoUpdateMessage:", v5);
        break;
      case '&':
        -[MRDTransportExternalDevice _handleSetConnectionStateMessage:](self, "_handleSetConnectionStateMessage:", v5);
        break;
      case '*':
        -[MRDTransportExternalDevice _handleGenericMessage:](self, "_handleGenericMessage:", v5);
        break;
      case '.':
        -[MRDTransportExternalDevice _handleSetNowPlayingClientMessage:](self, "_handleSetNowPlayingClientMessage:", v5);
        break;
      case '/':
        -[MRDTransportExternalDevice _handleSetNowPlayingPlayerMessage:](self, "_handleSetNowPlayingPlayerMessage:", v5);
        break;
      case '4':
        -[MRDTransportExternalDevice _handleVolumeDidChangeMessage:](self, "_handleVolumeDidChangeMessage:", v5);
        break;
      case '5':
        -[MRDTransportExternalDevice _handleRemoveClientMessage:](self, "_handleRemoveClientMessage:", v5);
        break;
      case '6':
        -[MRDTransportExternalDevice _handleRemovePlayerMessage:](self, "_handleRemovePlayerMessage:", v5);
        break;
      case '7':
        -[MRDTransportExternalDevice _handleUpdateClientMessage:](self, "_handleUpdateClientMessage:", v5);
        break;
      case '8':
        -[MRDTransportExternalDevice _handleUpdateContentItemsMessage:](self, "_handleUpdateContentItemsMessage:", v5);
        break;
      case ':':
        -[MRDTransportExternalDevice _handleUpdatePlayerMessage:](self, "_handleUpdatePlayerMessage:", v5);
        break;
      case ';':
        -[MRDTransportExternalDevice _handlePromptForRouteAuthorizationMessage:]( self,  "_handlePromptForRouteAuthorizationMessage:",  v5);
        break;
      case '=':
        -[MRDTransportExternalDevice _handlePresentRouteAuthorizationStatusMessage:]( self,  "_handlePresentRouteAuthorizationStatusMessage:",  v5);
        break;
      case '@':
        -[MRDTransportExternalDevice _handleVolumeControlCapabilitiesDidChangeMessage:]( self,  "_handleVolumeControlCapabilitiesDidChangeMessage:",  v5);
        break;
      case 'A':
        -[MRDTransportExternalDevice _handleOutputDevicesUpdatedMessage:]( self,  "_handleOutputDevicesUpdatedMessage:",  v5);
        break;
      case 'B':
        -[MRDTransportExternalDevice _handleOutputDevicesRemovedMessage:]( self,  "_handleOutputDevicesRemovedMessage:",  v5);
        break;
      case 'H':
        -[MRDTransportExternalDevice _handleSetDefaultSupportedCommandsMessage:]( self,  "_handleSetDefaultSupportedCommandsMessage:",  v5);
        break;
      case 'M':
        -[MRDTransportExternalDevice _handleUpdateActiveSystemEndpoint:](self, "_handleUpdateActiveSystemEndpoint:", v5);
        break;
      default:
        if (v6 == 17) {
          -[MRDTransportExternalDevice _handleLegacyVolumeControlCapabilitiesDidChangeMessage:]( self,  "_handleLegacyVolumeControlCapabilitiesDidChangeMessage:",  v5);
        }
        break;
    }
  }
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v9 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
  [v9 setPriority:4];
  [v9 setWaking:1];
  id v7 = [[MRSetDiscoveryModeMessage alloc] initWithMode:v4 configuration:v6];

  [v7 setTransportOptions:v9];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  [v8 sendMessage:v7];
}

- (void)_handleDiscoveryUpdateOutputDevicesMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 outputDevices]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 configuration]);

  -[MRDTransportExternalDevice notifyDiscoveryOutputDevicesChanged:forConfiguration:]( self,  "notifyDiscoveryOutputDevicesChanged:forConfiguration:",  v6,  v5);
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
}

- (void)_localDeviceInfoDidChangeNotification:(id)a3
{
  id v13 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
  uint64_t v5 = MRGetOriginFromUserInfo(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if ([v6 isLocal])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v9 = MRGetDeviceInfoFromUserInfo(v7, v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      id v12 = [[MRDeviceInfoUpdateMessage alloc] initWithDeviceInfo:v10];
      [v11 sendMessage:v12];
    }
  }
}

- (void)_transportDeviceInfoDidChangeNotification:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:MRExternalDeviceTransportNewDeviceInfoUserInfoKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  if (!v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:MRExternalDeviceTransportOldDeviceInfoUserInfoKey]);

    -[MRDTransportExternalDevice _handleDeviceInfoChange:oldDevice:](self, "_handleDeviceInfoChange:oldDevice:", v5, v7);
LABEL_6:

    goto LABEL_7;
  }

  if (self->_deviceInfo)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 bluetoothAddress]);
    if (v7) {
      MRPairedDeviceSetBluetoothAddress(self->_deviceInfo, v7);
    }
    goto LABEL_6;
  }

- (void)_activeSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v6 = [v5 disablePairedDeviceActiveEndpointSync];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:MRUpdateActiveSystemEndpointRequestUserInfoKey]);

    id v9 = [v8 type];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 outputDeviceUID]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVOutputDevice localDeviceUID](&OBJC_CLASS___MRAVOutputDevice, "localDeviceUID"));
      unsigned int v13 = [v11 isEqualToString:v12] ^ 1;
    }

    else
    {
      unsigned int v13 = 0;
    }

    if (v9) {
      goto LABEL_15;
    }
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);
    if ([v15 isCompanion] && !objc_msgSend(v8, "isPairedDeviceSync"))
    {
      unsigned int v16 = v13 & ~[v8 suppressPairedDeviceSync];

      if (v16 != 1)
      {
LABEL_15:

        goto LABEL_16;
      }

      id v14 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
      [v14 setPriority:4];
      if ([v8 demoteWhenSyncingToCompanion])
      {
        [v8 setType:2];
        uint64_t v18 = _MRLogForCategory(3LL, v17);
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          id v22 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Demoted Gizmo's %@ to RSE",  (uint8_t *)&v21,  0xCu);
        }
      }

      id v15 = [[MRUpdateActiveSystemEndpointMessage alloc] initWithRequest:v8];
      [v15 setTransportOptions:v14];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
      [v20 sendMessage:v15];
    }

    goto LABEL_15;
  }

- (id)_onWorkerQueue_createClientConnectionWithTransport:(id)a3
{
  uint64_t v3 = qword_1003FDD90;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003FDD90, &stru_10039DB08);
  }
  uint64_t v5 = objc_alloc(&OBJC_CLASS___MRExternalClientConnection);
  unsigned __int8 v6 = -[MRExternalClientConnection initWithConnection:queue:](v5, "initWithConnection:queue:", v4, qword_1003FDD88);

  return v6;
}

- (id)_onWorkerQueue_initializeConnectionWithOptions:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  id v9 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.initializeConnection",  v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  if (v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    -[NSMutableString appendFormat:](v9, "appendFormat:", @" for %@", v12);
  }

  uint64_t v13 = _MRLogForCategory(10LL, v11);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v52 = (const __CFString *)v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRExternalDeviceTransport setShouldUseSystemAuthenticationPrompt:]( self->_transport,  "setShouldUseSystemAuthenticationPrompt:",  v4 & 1);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MRExternalDeviceTransport createConnectionWithUserInfo:]( self->_transport,  "createConnectionWithUserInfo:",  v6));
  unsigned int v16 = v15;
  if (!v15)
  {
    int64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport error](self->_transport, "error"));

    if (v30)
    {
      float v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRExternalDeviceTransport error](self->_transport, "error"));
      id Error = [v31 copy];
    }

    else
    {
      id Error = (id)MRMediaRemoteCreateError(100LL);
    }

    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

    uint64_t v40 = _MRLogForCategory(10LL, v39);
    unint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    id v22 = v41;
    if (Error)
    {
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v38)
      {
        if (!v42) {
          goto LABEL_17;
        }
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v44 timeIntervalSinceDate:v7];
        *(_DWORD *)buf = 138544386;
        id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
        __int16 v53 = 2114;
        int64_t v54 = v8;
        __int16 v55 = 2114;
        id v56 = Error;
        __int16 v57 = 2114;
        v58 = v43;
        __int16 v59 = 2048;
        uint64_t v60 = v45;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
      }

      else
      {
        if (!v42) {
          goto LABEL_17;
        }
        id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v43 timeIntervalSinceDate:v7];
        *(_DWORD *)buf = 138544130;
        id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
        __int16 v53 = 2114;
        int64_t v54 = v8;
        __int16 v55 = 2114;
        id v56 = Error;
        __int16 v57 = 2048;
        v58 = v48;
        _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);
      }

      goto LABEL_17;
    }

    BOOL v46 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      if (!v46) {
        goto LABEL_16;
      }
      char v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v25 timeIntervalSinceDate:v7];
      *(_DWORD *)buf = 138544130;
      id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
      __int16 v53 = 2114;
      int64_t v54 = v8;
      __int16 v55 = 2114;
      id v56 = v24;
      __int16 v57 = 2048;
      v58 = v47;
      id v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v28 = v22;
      uint32_t v29 = 42;
      goto LABEL_9;
    }

    if (!v46) {
      goto LABEL_16;
    }
    char v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v24 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138543874;
    id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v53 = 2114;
    int64_t v54 = v8;
    __int16 v55 = 2048;
    id v56 = v49;
    id v34 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v35 = v22;
    uint32_t v36 = 32;
    goto LABEL_14;
  }

  [v15 setConnectOptions:v4];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice _onWorkerQueue_createClientConnectionWithTransport:]( self,  "_onWorkerQueue_createClientConnectionWithTransport:",  v16));
  [v17 setDelegate:self];
  objc_msgSend( v17,  "setCryptoEnabled:",  -[MRExternalDeviceTransport requiresCustomPairing](self->_transport, "requiresCustomPairing"));
  -[MRDTransportExternalDevice setClientConnection:](self, "setClientConnection:", v17);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008C9E4;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(serialQueue, block);

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
  uint64_t v21 = _MRLogForCategory(10LL, v20);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (!v23) {
      goto LABEL_16;
    }
    char v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v24 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544130;
    id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v53 = 2114;
    int64_t v54 = v8;
    __int16 v55 = 2112;
    id v56 = v16;
    __int16 v57 = 2048;
    v58 = v33;
    id v34 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v35 = v22;
    uint32_t v36 = 42;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_15;
  }

  if (v23)
  {
    char v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v25 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544386;
    id v52 = @"TransportExternalDevice.connectWithOptions.initializeConnection";
    __int16 v53 = 2114;
    int64_t v54 = v8;
    __int16 v55 = 2112;
    id v56 = v16;
    __int16 v57 = 2114;
    v58 = v24;
    __int16 v59 = 2048;
    uint64_t v60 = v26;
    id v27 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    id v28 = v22;
    uint32_t v29 = 52;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);

LABEL_15:
  }

- (id)_onWorkerQueue_loadDeviceInfoWithUserInfo:(id)a3
{
  id v47 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);
  uint64_t v4 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.loadDeviceInfo",  v48);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  if (v5)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    -[NSMutableString appendFormat:](v4, "appendFormat:", @" for %@", v7);
  }

  uint64_t v8 = _MRLogForCategory(10LL, v6);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  if (v10)
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    id v12 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v12 setPriority:5];
    [v12 setWaking:1];
    id v13 = objc_alloc(&OBJC_CLASS___MRDeviceInfoMessage);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);
    id v16 = [v13 initWithDeviceInfo:v15];

    [v16 setTransportOptions:v12];
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    __int16 v57 = sub_100083DE0;
    *(void *)v58 = sub_100083DF0;
    *(void *)&v58[8] = 0LL;
    objc_initWeak(&location, self);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_10008D194;
    v51[3] = &unk_10039DB30;
    objc_copyWeak(&v54, &location);
    __int16 v53 = buf;
    uint64_t v17 = v11;
    id v52 = v17;
    uint64_t v18 = objc_retainBlock(v51);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v19 externalDeviceTimeoutDuration];
    double v21 = v20;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472LL;
    v49[2] = sub_10008D398;
    v49[3] = &unk_10039D9A8;
    id v22 = v18;
    id v50 = v22;
    [v10 sendMessage:v16 timeout:v49 reply:v21];

    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    [v23 externalDeviceTimeoutDuration];
    dispatch_time_t v25 = dispatch_time(0LL, (uint64_t)(v24 * 1000000000.0));

    if (dispatch_semaphore_wait(v17, v25)) {
      uint64_t v26 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 113LL);
    }
    else {
      uint64_t v26 = (NSError *)*(id *)(*(void *)&buf[8] + 40LL);
    }
    id v27 = v26;

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    id v27 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 100LL);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  uint64_t v30 = _MRLogForCategory(10LL, v29);
  float v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  __int16 v32 = v31;
  if (v27)
  {
    BOOL v33 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v33)
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v35 timeIntervalSinceDate:v46];
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2114;
        __int16 v57 = (uint64_t (*)(uint64_t, uint64_t))v27;
        *(_WORD *)v58 = 2114;
        *(void *)&v58[2] = v34;
        *(_WORD *)&v58[10] = 2048;
        *(void *)&v58[12] = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds",  buf,  0x34u);
      }
    }

    else if (v33)
    {
      unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v41 timeIntervalSinceDate:v46];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2114;
      __int16 v57 = (uint64_t (*)(uint64_t, uint64_t))v27;
      *(_WORD *)v58 = 2048;
      *(void *)&v58[2] = v42;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);
    }
  }

  else
  {
    BOOL v37 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v37)
      {
        uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( -[MRDTransportExternalDevice shortDescription]( self,  "shortDescription"));
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v39 timeIntervalSinceDate:v46];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2114;
        __int16 v57 = v38;
        *(_WORD *)v58 = 2048;
        *(void *)&v58[2] = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds",  buf,  0x2Au);
      }
    }

    else if (v37)
    {
      id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v43 timeIntervalSinceDate:v46];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = @"TransportExternalDevice.connectWithOptions.loadDeviceInfo";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v48;
      *(_WORD *)&buf[22] = 2048;
      __int16 v57 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    }
  }

  return v27;
}

- (id)_onWorkerQueue_registerCustomOriginWithUserInfo:(id)a3
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workerQueue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  else {
    uint64_t v8 = arc4random();
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice name](self, "name"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);

  dispatch_semaphore_t v11 = -[MROrigin initWithIdentifier:type:displayName:]( objc_alloc(&OBJC_CLASS___MROrigin),  "initWithIdentifier:type:displayName:",  v8,  1LL,  v9);
  id v12 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.registerCustomOrigin",  v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    -[NSMutableString appendFormat:](v12, "appendFormat:", @" for %@", v15);
  }

  uint64_t v16 = _MRLogForCategory(10LL, v14);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = (const __CFString *)v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 nowPlayingServer]);
  [v19 registerOrigin:v11 deviceInfo:v7];

  -[MRDTransportExternalDevice setCustomOrigin:](self, "setCustomOrigin:", v11);
  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  uint64_t v22 = _MRLogForCategory(10LL, v21);
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v20)
    {
      if (v24)
      {
        dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v26 timeIntervalSinceDate:v6];
        *(_DWORD *)buf = 138544386;
        uint64_t v39 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
        __int16 v40 = 2114;
        unint64_t v41 = v10;
        __int16 v42 = 2112;
        id v43 = v11;
        __int16 v44 = 2114;
        uint64_t v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v27;
        id v28 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        uint64_t v29 = v23;
        uint32_t v30 = 52;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

LABEL_21:
        goto LABEL_22;
      }

      goto LABEL_22;
    }

    if (!v24) {
      goto LABEL_22;
    }
    dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v25 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v40 = 2114;
    unint64_t v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 2048;
    uint64_t v45 = v32;
    BOOL v33 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    id v34 = v23;
    uint32_t v35 = 42;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    goto LABEL_21;
  }

  if (!v20)
  {
    if (!v24) {
      goto LABEL_22;
    }
    dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v25 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    uint64_t v39 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v40 = 2114;
    unint64_t v41 = v10;
    __int16 v42 = 2048;
    id v43 = v36;
    BOOL v33 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v34 = v23;
    uint32_t v35 = 32;
    goto LABEL_20;
  }

  if (v24)
  {
    dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v26 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138544130;
    uint64_t v39 = @"TransportExternalDevice.connectWithOptions.registerCustomOrigin";
    __int16 v40 = 2114;
    unint64_t v41 = v10;
    __int16 v42 = 2114;
    id v43 = (MROrigin *)v25;
    __int16 v44 = 2048;
    uint64_t v45 = v31;
    id v28 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    uint64_t v29 = v23;
    uint32_t v30 = 42;
    goto LABEL_15;
  }

- (id)_onWorkerQueue_reRegisterCustomOriginWithUserInfo:(id)a3
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workerQueue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);

  uint64_t v8 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin",  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));

  if (v9)
  {
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", v11);
  }

  uint64_t v12 = _MRLogForCategory(10LL, v10);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    float v31 = (const __CFString *)v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 nowPlayingServer]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  [v15 reregisterOrigin:v16 deviceInfo:v17];

  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008DC14;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_sync(serialQueue, block);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  uint64_t v21 = _MRLogForCategory(10LL, v20);
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v23)
    {
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
      dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v25 timeIntervalSinceDate:v6];
      *(_DWORD *)buf = 138544130;
      float v31 = @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin";
      __int16 v32 = 2114;
      BOOL v33 = v7;
      __int16 v34 = 2114;
      uint32_t v35 = v24;
      __int16 v36 = 2048;
      uint64_t v37 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds",  buf,  0x2Au);

LABEL_10:
    }
  }

  else if (v23)
  {
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v24 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    float v31 = @"TransportExternalDevice.connectWithOptions.reregisterCustomOrigin";
    __int16 v32 = 2114;
    BOOL v33 = v7;
    __int16 v34 = 2048;
    uint32_t v35 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    goto LABEL_10;
  }

  return 0LL;
}

- (id)_onWorkerQueue_syncClientStateWithUserInfo:(id)a3
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workerQueue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey]);

  uint64_t v8 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  @"TransportExternalDevice.connectWithOptions.syncClientState",  v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  if (v9)
  {
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", v11);
  }

  uint64_t v12 = _MRLogForCategory(10LL, v10);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v38 = (const __CFString *)v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  [v14 externalDeviceTimeoutDuration];
  double v16 = v15;
  id v17 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
  [v17 setPriority:5];
  [v17 setWaking:1];
  id v18 = [[MRSetConnectionStateMessage alloc] initWithConnectionState:2];
  [v18 setTransportOptions:v17];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  [v19 sendMessage:v18];

  if (-[MRDTransportExternalDevice wantsNowPlayingNotifications](self, "wantsNowPlayingNotifications")
    || -[MRDTransportExternalDevice wantsVolumeNotifications](self, "wantsVolumeNotifications")
    || -[MRDTransportExternalDevice wantsOutputDeviceNotifications](self, "wantsOutputDeviceNotifications")
    || -[MRDTransportExternalDevice wantsNowPlayingArtworkNotifications](self, "wantsNowPlayingArtworkNotifications")
    || -[MRDTransportExternalDevice wantsSystemEndpointNotifications](self, "wantsSystemEndpointNotifications")
    || (uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice subscribedPlayerPaths](self, "subscribedPlayerPaths")),
        id v21 = [v20 count],
        v20,
        v21))
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10008E068;
    v35[3] = &unk_10039DB58;
    uint64_t v22 = dispatch_semaphore_create(0LL);
    __int16 v36 = v22;
    -[MRDTransportExternalDevice sendClientUpdatesConfigMessageWithCompletion:]( self,  "sendClientUpdatesConfigMessageWithCompletion:",  v35);
    dispatch_time_t v23 = dispatch_time(0LL, (uint64_t)(v16 * 1000000000.0));
    if (dispatch_semaphore_wait(v22, v23)) {
      id Error = (void *)MRMediaRemoteCreateError(113LL);
    }
    else {
      id Error = 0LL;
    }
  }

  else
  {
    id Error = 0LL;
  }

  dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));

  uint64_t v27 = _MRLogForCategory(10LL, v26);
  id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v29)
    {
      uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice shortDescription](self, "shortDescription"));
      float v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v31 timeIntervalSinceDate:v6];
      *(_DWORD *)buf = 138544130;
      uint64_t v38 = @"TransportExternalDevice.connectWithOptions.syncClientState";
      __int16 v39 = 2114;
      __int16 v40 = v7;
      __int16 v41 = 2114;
      __int16 v42 = v30;
      __int16 v43 = 2048;
      uint64_t v44 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds",  buf,  0x2Au);

LABEL_20:
    }
  }

  else if (v29)
  {
    uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v30 timeIntervalSinceDate:v6];
    *(_DWORD *)buf = 138543874;
    uint64_t v38 = @"TransportExternalDevice.connectWithOptions.syncClientState";
    __int16 v39 = 2114;
    __int16 v40 = v7;
    __int16 v41 = 2048;
    __int16 v42 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    goto LABEL_20;
  }

  return Error;
}

- (void)_onWorkerQueue_sendBatchedMessages
{
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = sub_100083DE0;
  id v21 = sub_100083DF0;
  id v22 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008E278;
  block[3] = &unk_100399278;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(serialQueue, block);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (id)v18[5];
  id v5 = [v3 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v7);
        uint64_t v9 = _MRLogForCategory(3LL, v4);
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)dispatch_semaphore_t v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending batched request...", v11, 2u);
        }

        (*(void (**)(uint64_t))(v8 + 16))(v8);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }

    while (v5);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)_cleanUpStreamsWithReason:(int64_t)a3 error:(id)a4
{
  id v14 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  id v7 = v6;
  if (v6)
  {
    [v6 setDelegate:0];
    if (a3)
    {
      if (a3 != 1)
      {
        uint64_t v8 = 0LL;
        if (a3 != 3)
        {
LABEL_10:
          [v7 disconnectWithError:v8];

          goto LABEL_11;
        }

        uint64_t v9 = (NSError *)v14;
LABEL_9:
        uint64_t v8 = v9;
        goto LABEL_10;
      }

      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v11 = 123LL;
    }

    else
    {
      uint64_t v10 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v11 = 1LL;
    }

    uint64_t v9 = -[NSError initWithMRError:](v10, "initWithMRError:", v11);
    goto LABEL_9;
  }

- (void)_cleanUpWithReason:(int64_t)a3 error:(id)a4
{
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008E438;
  v6[3] = &unk_100399250;
  void v6[4] = self;
  msv_dispatch_sync_on_queue(serialQueue, v6);
}

- (void)_onSerialQueue_registerOriginCallbacks
{
  customOrigin = self->_customOrigin;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10008EA10;
  v50[3] = &unk_10039AE90;
  objc_copyWeak(&v51, &location);
  MRMediaRemoteSetCommandHandler(customOrigin, v50);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedMessages]);
  unsigned int v6 = [v5 isSupported:32];

  if (v6)
  {
    id v7 = self->_customOrigin;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_10008EB18;
    v48[3] = &unk_10039AEE0;
    objc_copyWeak(&v49, &location);
    MRMediaRemotePlaybackQueueDataSourceSetRequestCallback(v7, v48);
    objc_destroyWeak(&v49);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 supportedMessages]);
  unsigned int v10 = [v9 isSupported:44];

  if (v10)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_10008EC04;
    v46[3] = &unk_10039DBA8;
    objc_copyWeak(&v47, &location);
    uint64_t v11 = objc_retainBlock(v46);
    MRMediaRemoteSetBeginLyricsEventCallback(self->_customOrigin, v11);
    MRMediaRemoteSetEndLyricsEventCallback(self->_customOrigin, v11);

    objc_destroyWeak(&v47);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 supportedMessages]);
  unsigned int v14 = [v13 isSupported:73];

  if (v14)
  {
    __int128 v15 = self->_customOrigin;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10008ECB8;
    v44[3] = &unk_10039AEE0;
    objc_copyWeak(&v45, &location);
    MRMediaRemotePlaybackSessionSetRequestCallbackForOrigin(v15, v44);
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 originClientForOrigin:self->_customOrigin]);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10008ED90;
    v42[3] = &unk_10039AF30;
    objc_copyWeak(&v43, &location);
    [v17 setPlaybackSessionMigrateRequestCallback:v42];
    objc_destroyWeak(&v43);

    objc_destroyWeak(&v45);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 supportedMessages]);
  unsigned int v20 = [v19 isSupported:75];

  if (v20)
  {
    id v21 = self->_customOrigin;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10008EE68;
    v40[3] = &unk_10039AF58;
    objc_copyWeak(&v41, &location);
    MRMediaRemotePlaybackSessionSetMigrateBeginCallbackForOrigin(v21, v40);
    objc_destroyWeak(&v41);
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  dispatch_time_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 supportedMessages]);
  unsigned int v24 = [v23 isSupported:76];

  if (v24)
  {
    dispatch_time_t v25 = self->_customOrigin;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10008EF58;
    v38[3] = &unk_10039AF80;
    objc_copyWeak(&v39, &location);
    MRMediaRemotePlaybackSessionSetMigrateEndCallbackForOrigin(v25, v38);
    objc_destroyWeak(&v39);
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[MRNowPlayingOriginClientManager sharedManager]( &OBJC_CLASS___MRNowPlayingOriginClientManager,  "sharedManager"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 originClientForOrigin:self->_customOrigin]);

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10008F058;
  v36[3] = &unk_10039DBF8;
  objc_copyWeak(&v37, &location);
  [v27 setClientMessageCallback:v36];
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue([v28 nowPlayingServer]);
  uint32_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 originClientForOrigin:self->_customOrigin]);

  float v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 supportedMessages]);
  LODWORD(v29) = [v32 isSupported:134];

  if (!(_DWORD)v29)
  {
    BOOL v33 = &stru_10039DC80;
LABEL_16:
    [v30 registerCreateNewApplicationConnectionCallback:v33];
    goto LABEL_17;
  }

  if (!_os_feature_enabled_impl("MediaRemote", "ApplicationConnection"))
  {
    BOOL v33 = &stru_10039DC60;
    goto LABEL_16;
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10008F0BC;
  v34[3] = &unk_10039DC20;
  objc_copyWeak(&v35, &location);
  [v30 registerCreateNewApplicationConnectionCallback:v34];
  objc_destroyWeak(&v35);
LABEL_17:

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&location);
}

- (void)_handlePlaybackQueueRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v11)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10008F93C;
    v18[3] = &unk_10039DCD0;
    objc_copyWeak(&v22, &location);
    id v19 = v8;
    id v20 = v9;
    id v12 = v10;
    id v21 = v12;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](self, "_maybeBatchRequest:", v18)) {
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v11);
    }

    objc_destroyWeak(&v22);
  }

  else
  {
    id v13 = [v8 copy];
    id v14 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v14 setPriority:4];
    [v14 setWaking:1];
    id v15 = [[MRPlaybackQueueRequestMessage alloc] initWithRequest:v13 forPlayerPath:v9];
    [v15 setTransportOptions:v14];
    double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10008F6E8;
    v23[3] = &unk_10039DCA8;
    objc_copyWeak(&v26, &location);
    id v25 = v10;
    id v17 = v13;
    id v24 = v17;
    [v16 sendMessage:v15 timeout:v23 reply:30.0];

    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (void)_handlePlaybackSessionRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](self, "errorForCurrentState"));
  if (v11)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10008FBF8;
    v15[3] = &unk_10039DCD0;
    objc_copyWeak(&v19, &location);
    id v16 = v8;
    id v17 = v9;
    id v12 = v10;
    id v18 = v12;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](self, "_maybeBatchRequest:", v15)) {
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v11);
    }

    objc_destroyWeak(&v19);
  }

  else
  {
    id v13 = [[MRPlaybackSessionRequestMessage alloc] initWithRequest:v8 forPlayerPath:v9];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](self, "clientConnection"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10008FB64;
    v20[3] = &unk_10039D9A8;
    id v21 = v10;
    [v14 sendMessage:v13 timeout:v20 reply:30.0];
  }

  objc_destroyWeak(&location);
}

- (void)_handlePlaybackSessionMigrateRequest:(id)a3 request:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v14, "errorForCurrentState"));
  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10008FE88;
    v19[3] = &unk_10039DCF8;
    void v19[4] = v14;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v16 = v13;
    id v23 = v16;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v14, "_maybeBatchRequest:", v19)) {
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0LL, v15);
    }
  }

  else
  {
    id v17 = [[MRPlaybackSessionMigrateRequestMessage alloc] initWithPlaybackSession:v10 request:v11 forPlayerPath:v12];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v14, "clientConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10008FDF4;
    v24[3] = &unk_10039D9A8;
    id v25 = v13;
    [v18 sendMessage:v17 timeout:v24 reply:30.0];
  }
}

- (void)_handlePlaybackSessionMigrateBeginRequest:(id)a3 forPlayerPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v11, "errorForCurrentState"));
  if (v12)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100090074;
    v16[3] = &unk_100399120;
    void v16[4] = v11;
    id v17 = v8;
    id v18 = v9;
    id v13 = v10;
    id v19 = v13;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v11, "_maybeBatchRequest:", v16)) {
      (*((void (**)(id, void *))v13 + 2))(v13, v12);
    }
  }

  else
  {
    id v14 = [[MRPlaybackSessionMigrateBeginMessage alloc] initWithRequest:v8 playerPath:v9];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v11, "clientConnection"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10009002C;
    v20[3] = &unk_10039D9A8;
    id v21 = v10;
    [v15 sendMessage:v14 reply:v20];
  }
}

- (void)_handlePlaybackSessionMigrateEndRequest:(id)a3 error:(id)a4 forPlayerPath:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v14, "errorForCurrentState"));
  if (v15)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100090280;
    v19[3] = &unk_10039DCF8;
    void v19[4] = v14;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    id v16 = v13;
    id v23 = v16;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v14, "_maybeBatchRequest:", v19)) {
      (*((void (**)(id, void *))v16 + 2))(v16, v15);
    }
  }

  else
  {
    id v17 = [[MRPlaybackSessionMigrateEndMessage alloc] initWithRequest:v10 error:v11 playerPath:v12];
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v14, "clientConnection"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100090238;
    v24[3] = &unk_10039D9A8;
    id v25 = v13;
    [v18 sendMessage:v17 reply:v24];
  }
}

- (void)_callClientConnectionStateCallback:(unsigned int)a3 previousConnectionState:(unsigned int)a4 error:(id)a5
{
  id v7 = a5;
  serialQueue = self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100090328;
  v10[3] = &unk_10039A9B8;
  unsigned int v12 = a3;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  msv_dispatch_sync_on_queue(serialQueue, v10);
}

- (void)_callClientPairingCallback:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000905D8;
  v7[3] = &unk_100399F10;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_callClientNameCallback
{
  id v3 = (void *)MRExternalDeviceCopyName(self, a2);
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100090968;
  v6[3] = &unk_100398E60;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  msv_dispatch_sync_on_queue(serialQueue, v6);
}

- (void)_callClientAllowsPairingCallback
{
  serialQueue = self->_serialQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100090B54;
  v3[3] = &unk_100399250;
  v3[4] = self;
  msv_dispatch_sync_on_queue(serialQueue, v3);
}

- (void)_callClientCustomDataCallback:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100090DBC;
  v11[3] = &unk_100398F40;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  msv_dispatch_sync_on_queue(serialQueue, v11);
}

- (void)_callOutputDevicesUpdatedCallbackWithOutputDevices:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100090FAC;
  v7[3] = &unk_100398E60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100091130;
  v7[3] = &unk_100398E60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  msv_dispatch_sync_on_queue(serialQueue, v7);
}

- (void)_callVolumeCallback:(float)a3 outputDeviceUID:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000912C4;
  v9[3] = &unk_10039A9B8;
  float v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
}

- (void)_callVolumeControlCapabilitiesCallback:(unsigned int)a3 outputDeviceUID:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009151C;
  v9[3] = &unk_10039A9B8;
  unsigned int v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
}

- (void)_callIsMutedCallback:(BOOL)a3 outputDeviceUID:(id)a4
{
  id v6 = a4;
  serialQueue = self->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000916B4;
  v9[3] = &unk_10039AA30;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v9);
}

- (void)_callDeviceInfoCallback:(id)a3 oldDeviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100091870;
  v11[3] = &unk_100398F40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v11);
}

- (BOOL)_maybeBatchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091B30;
  block[3] = &unk_10039DE10;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)_handleRemoteCommand:(unsigned int)a3 withOptions:(id)a4 playerPath:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v36 = a6;
  uint64_t v13 = _MRLogForCategory(3LL, v12);
  char v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t Description = MRMediaRemoteCommandCreateDescription(v8, v10, 0LL);
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(Description);
    *(_DWORD *)id location = 138543874;
    *(void *)&location[4] = v34;
    __int16 v52 = 2114;
    id v53 = v11;
    __int16 v54 = 2114;
    __int16 v55 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Received command %{public}@ for path %{public}@ for device %{public}@",  location,  0x20u);
  }

  id v15 = self;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v15, "errorForCurrentState"));
  if (v16)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000922AC;
    v37[3] = &unk_10039DE60;
    v37[4] = v15;
    int v41 = v8;
    id v38 = v10;
    id v39 = v11;
    id v17 = v36;
    id v40 = v17;
    unsigned __int8 v18 = -[MRDTransportExternalDevice _maybeBatchRequest:](v15, "_maybeBatchRequest:", v37);
    if (v17) {
      char v19 = v18;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[MRCommandResult commandResultWithSendError:]( &OBJC_CLASS___MRCommandResult,  "commandResultWithSendError:",  2LL));
      (*((void (**)(id, void *))v17 + 2))(v17, v20);
    }
  }

  else
  {
    id v21 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v21 setPriority:4];
    [v21 setWaking:1];
    id v35 = [[MRSendCommandMessage alloc] initWithCommand:v8 options:v10 playerPath:v11];
    [v35 setTransportOptions:v21];
    dispatch_queue_attr_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v23 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v22);
    qos_class_t v24 = qos_class_self();
    dispatch_queue_attr_t v25 = dispatch_queue_attr_make_with_qos_class(v23, v24, 0);
    id v26 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v25);
    dispatch_queue_t v27 = dispatch_queue_create(0LL, v26);

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v15, "clientConnection"));
    BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v15, "clientConnection"));
    objc_initWeak((id *)location, v29);

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_100091FEC;
    v45[3] = &unk_10039DE38;
    void v45[4] = v15;
    int v50 = v8;
    id v46 = v10;
    objc_copyWeak(&v49, (id *)location);
    id v47 = v11;
    id v48 = v36;
    uint32_t v30 = objc_retainBlock(v45);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100092208;
    v42[3] = &unk_10039D930;
    float v31 = v27;
    id v43 = v31;
    uint64_t v32 = v30;
    id v44 = v32;
    [v28 sendMessage:v35 timeout:v42 reply:30.0];

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)location);
  }
}

- (void)_handleSetStateMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 playerPath]);
  id v8 = [v7 copy];

  id v9 = (const void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v8, v5);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 supportedCommands]);
  id v11 = (void *)v10;
  if (v10) {
    MRMediaRemoteSetSupportedCommandsForPlayer(v10, v9, 0LL, 0LL);
  }
  if ([v6 playbackState])
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
    unsigned int v13 = [v12 hasPlaybackStateTimestamp];

    if (v13)
    {
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v4 state]);
      [v14 playbackStateTimestamp];
      double v16 = v15;
    }

    else
    {
      double v16 = 0.0;
      if (!self->_isClientSyncActive)
      {
        +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
        double v16 = v17;
      }
    }

    MRMediaRemoteSetPlaybackStateForPlayerWithTimestamp(v9, [v6 playbackState], 0, 0, v16);
  }

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v6 playbackQueue]);
  id v19 = [v18 copy];

  if (v19)
  {
    id v27 = v8;
    id v28 = v5;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 contentItems]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          dispatch_queue_attr_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) metadata]);
          [v25 setDeviceSpecificUserInfo:0];
        }

        id v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v22);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 contentItems]);
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer(v26, v9);

    MRMediaRemoteSetPlaybackQueue(v9, v19, 0LL, 0LL);
    id v8 = v27;
    id v5 = v28;
  }

  if ([v6 playbackQueueCapabilities]) {
    MRMediaRemoteSetPlaybackQueueCapabilities(v9, [v6 playbackQueueCapabilities], 0, 0);
  }
  CFRelease(v9);
}

- (void)_handleSetNowPlayingClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);

  MRMediaRemoteSetNowPlayingClientForOrigin(v5, v6, 0LL, 0LL);
}

- (void)_handleSetNowPlayingPlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v5, v7);
  MRMediaRemoteSetNowPlayingPlayer(v6, 0LL, 0LL);
}

- (void)_handleRemoveClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);

  MRMediaRemoteRemoveClientForOrigin(v5, v6, 0LL, 0LL);
}

- (void)_handleRemovePlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v5, v7);
  MRMediaRemoteRemovePlayer(v6, 0LL, 0LL);
}

- (void)_handleUpdateClientMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 client]);

  MRMediaRemoteUpdateClientProperties(v5, v6, 0LL, 0LL);
}

- (void)_handleUpdatePlayerMessage:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);

  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v5, v7);
  MRMediaRemoteUpdatePlayerProperties(v6, 0LL, 0LL);
}

- (void)_handleUpdateContentItemsMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v7 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v6, v5);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 contentItems]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) metadata]);
        [v13 setDeviceSpecificUserInfo:0];

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  MRMediaRemotePlaybackQueueDataSourceContentItemsChangedForPlayer(v8, v7);
}

- (void)_handleNotificationMessage:(id)a3
{
  id v4 = a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 notification]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);

  id v8 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v7, v12);
  if ([v5 isEqualToString:kMRPlaybackQueueContentItemArtworkChangedNotification])
  {
    id v9 = -[MRPlaybackQueueRequest initWithRange:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueRequest),  "initWithRange:",  0LL,  1LL);
    -[MRPlaybackQueueRequest setArtworkWidth:](v9, "setArtworkWidth:", 600.0);
    -[MRPlaybackQueueRequest setArtworkHeight:](v9, "setArtworkHeight:", 600.0);
    uint64_t v10 = MRGetContentItemsFromUserInfo(v6);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    MRMediaRemotePlaybackQueueDataSourceContentItemsChangedWithRequestForPlayer(v11, v9, v8);
  }

  else
  {
    if (![v5 isEqualToString:kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification])
    {
      MRMediaRemotePostClientNotification(v5, v6);
      goto LABEL_7;
    }

    id v9 = (MRPlaybackQueueRequest *)objc_claimAutoreleasedReturnValue( [v6 objectForKey:kMRMediaRemotePickedRouteVolumeControlAvailabilityUserInfoKey]);
    MRMediaRemoteSetPickedRouteHasVolumeControlForOrigin( -[MRPlaybackQueueRequest BOOLValue](v9, "BOOLValue"),  v12,  0LL,  0LL);
  }

LABEL_7:
}

- (void)_handleOutputDevicesUpdatedMessage:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 outputDevices]);
  -[MRDTransportExternalDevice _callOutputDevicesUpdatedCallbackWithOutputDevices:]( self,  "_callOutputDevicesUpdatedCallbackWithOutputDevices:",  v4);
}

- (void)_handleOutputDevicesRemovedMessage:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 outputDeviceUIDs]);
  -[MRDTransportExternalDevice _callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:]( self,  "_callOutputDevicesRemovedCallbackWithOutputDeviceUIDs:",  v4);
}

- (void)_handleVolumeDidChangeMessage:(id)a3
{
  id v4 = a3;
  [v4 volume];
  int v6 = v5;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 outputDeviceUID]);

  LODWORD(v7) = v6;
  -[MRDTransportExternalDevice _callVolumeCallback:outputDeviceUID:]( self,  "_callVolumeCallback:outputDeviceUID:",  v8,  v7);
}

- (void)_handleVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 capabilities];
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 outputDeviceUID]);

  -[MRDTransportExternalDevice _callVolumeControlCapabilitiesCallback:outputDeviceUID:]( self,  "_callVolumeControlCapabilitiesCallback:outputDeviceUID:",  v5,  v6);
}

- (void)_handleLegacyVolumeControlCapabilitiesDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v5 = [v4 capabilities];

  MRMediaRemoteSetPickedRouteVolumeControlCapabilities(v5, v6, 0LL, 0LL);
}

- (void)_handleDeviceInfoUpdateMessage:(id)a3
{
  id v4 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice deviceInfo](self, "deviceInfo"));
  id v5 = [v7 copy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  -[MRDTransportExternalDevice _handleDeviceInfoChange:oldDevice:](self, "_handleDeviceInfoChange:oldDevice:", v6, v5);
}

- (void)_handleDeviceInfoChange:(id)a3 oldDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100092DFC;
  v11[3] = &unk_100398F40;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  msv_dispatch_sync_on_queue(serialQueue, v11);
}

- (void)_onSerialQueue_completeGroupSessionRequestsWithIdentifier:(id)a3 error:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v6 | v7)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v8 = self->_requestGroupSessionCompletions;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v12) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v12));
          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v10);
    }

    requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
    self->_requestGroupSessionCompletions = 0LL;
  }
}

- (void)_handleSetConnectionStateMessage:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 error]);
    -[MRDTransportExternalDevice disconnect:](self, "disconnect:", v4);
  }
}

- (void)_handleGenericMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 data]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 key]);

  -[MRDTransportExternalDevice _callClientCustomDataCallback:name:](self, "_callClientCustomDataCallback:name:", v6, v5);
}

- (void)_handlePromptForRouteAuthorizationMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MRGetSharedService();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRMediaRemoteServiceClient sharedServiceClient]( &OBJC_CLASS___MRMediaRemoteServiceClient,  "sharedServiceClient"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 workerQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000932CC;
  v8[3] = &unk_10039C568;
  id v9 = v3;
  id v7 = v3;
  MRMediaRemoteServicePromptRouteAuthorization(v4, v7, v6, v8);
}

- (void)_handlePresentRouteAuthorizationStatusMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MRGetSharedService();
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRMediaRemoteServiceClient sharedServiceClient]( &OBJC_CLASS___MRMediaRemoteServiceClient,  "sharedServiceClient"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 workerQueue]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100093390;
  v8[3] = &unk_10039C568;
  id v9 = v3;
  id v7 = v3;
  MRMediaRemoteServicePresentRouteAuthorizationStatus(v4, v7, v6, v8);
}

- (void)_handleSetDefaultSupportedCommandsMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MRClient);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
  id v9 = -[MRClient initWithProcessIdentifier:bundleIdentifier:]( v5,  "initWithProcessIdentifier:bundleIdentifier:",  0LL,  v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 supportedCommands]);

  MRMediaRemoteSetDefaultSupportedCommandsForClient(v9, v7, v8, 0LL, 0LL);
}

- (void)_handleUpdateActiveSystemEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v5 = [v4 disablePairedDeviceActiveEndpointSync];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 request]);
    id v7 = [v6 copy];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    [v7 setClientBundleIdentifier:v9];

    [v7 setPairedDeviceSync:1];
    [v7 setReason:@"Received update from companion"];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009356C;
    v10[3] = &unk_10039DE88;
    id v11 = v3;
    [v7 perform:&_dispatch_main_q completion:v10];
  }
}

- (void)_handleSetPlayerClientPropertiesMessage:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v6 = (void *)MRNowPlayingPlayerPathResolveExternalDevicePlayerPath(v5, v8);

  uint64_t v7 = MRGetSharedService();
  MRMediaRemoteServiceSetPlayerClientProperties(v7, v6, v4, 0LL, 0LL);
}

- (void)_handleSetOriginClientPropertiesMessage:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  uint64_t v5 = MRGetSharedService();
  MRMediaRemoteServiceSetOriginClientProperties(v5, v6, v4, 0LL, 0LL);
}

- (void)_handleVolumeMutedDidChangeMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isMuted];
  id v6 = (id)objc_claimAutoreleasedReturnValue([v4 outputDeviceUID]);

  -[MRDTransportExternalDevice _callIsMutedCallback:outputDeviceUID:]( self,  "_callIsMutedCallback:outputDeviceUID:",  v5,  v6);
}

- (void)_handlePlayerClientParticipantsUpdateMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MRPlayerPath);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice customOrigin](self, "customOrigin"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 client]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 playerPath]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 player]);
  id v11 = -[MRPlayerPath initWithOrigin:client:player:](v5, "initWithOrigin:client:player:", v6, v8, v10);

  if (-[MRPlayerPath isResolved](v11, "isResolved"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 nowPlayingServer]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 daemonClient]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 queryPlayerPath:v11 forClient:v15]);

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 playerClient]);
    unsigned __int8 v18 = v17;
    if (v17)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 remoteParticipantDataSource]);

      if (v19)
      {
        __int128 v30 = v16;
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 participants]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]));

        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 participants]);
        id v23 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v32;
          do
          {
            id v26 = 0LL;
            do
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v22);
              }
              id v27 = -[MRPlaybackQueueParticipant initWithProtobuf:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueParticipant),  "initWithProtobuf:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)v26));
              [v21 addObject:v27];

              id v26 = (char *)v26 + 1;
            }

            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }

          while (v24);
        }

        id v28 = (void *)objc_claimAutoreleasedReturnValue([v18 remoteParticipantDataSource]);
        id v29 = [v21 copy];
        [v28 updateParticipants:v29];

        __int128 v16 = v30;
      }
    }
  }
}

- (void)_handleApplicationConnectionProtocolMessage:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteControlServer]);
  [v4 handleClientBoundApplicationConnectionMessage:v3];
}

- (void)_handleInvalidateApplicationConnectionMessage:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteControlServer]);
  [v4 handleInvalidateApplicationConnectionMessage:v3];
}

- (void)_sendClientMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice errorForCurrentState](v8, "errorForCurrentState"));
  if (v9)
  {
    __int128 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    __int128 v17 = sub_100093C34;
    unsigned __int8 v18 = &unk_100399768;
    id v19 = v8;
    id v20 = v6;
    id v10 = v7;
    id v21 = v10;
    if (!-[MRDTransportExternalDevice _maybeBatchRequest:](v8, "_maybeBatchRequest:", &v15))
    {
      id v11 = objc_alloc(&OBJC_CLASS___MRProtocolMessage);
      id v12 = objc_msgSend(v11, "initWithUnderlyingCodableMessage:error:", 0, v9, v15, v16, v17, v18, v19);
      (*((void (**)(id, id))v10 + 2))(v10, v12);
    }

    id v13 = v20;
  }

  else
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDTransportExternalDevice clientConnection](v8, "clientConnection"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100093C28;
    v22[3] = &unk_10039D9A8;
    id v23 = v7;
    [v14 sendMessage:v6 reply:v22];

    id v13 = v23;
  }
}

- (int64_t)connectionRecoveryBehavior
{
  return self->_connectionRecoveryBehavior;
}

- (void)setConnectionRecoveryBehavior:(int64_t)a3
{
  self->_int64_t connectionRecoveryBehavior = a3;
}

- (MRExternalDeviceTransport)transport
{
  return self->_transport;
}

- (BOOL)isCallingClientCallback
{
  return self->_isCallingClientCallback;
}

- (void)setIsCallingClientCallback:(BOOL)a3
{
  self->_isCallingClientCallback = a3;
}

- (id)pairingCallback
{
  return self->_pairingCallback;
}

- (void)setPairingCallback:(id)a3
{
}

- (OS_dispatch_queue)pairingCallbackQueue
{
  return self->_pairingCallbackQueue;
}

- (void)setPairingCallbackQueue:(id)a3
{
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
}

- (id)nameCallback
{
  return self->_nameCallback;
}

- (void)setNameCallback:(id)a3
{
}

- (OS_dispatch_queue)nameCallbackQueue
{
  return self->_nameCallbackQueue;
}

- (void)setNameCallbackQueue:(id)a3
{
}

- (id)pairingAllowedCallback
{
  return self->_pairingAllowedCallback;
}

- (void)setPairingAllowedCallback:(id)a3
{
}

- (OS_dispatch_queue)pairingAllowedCallbackQueue
{
  return self->_pairingAllowedCallbackQueue;
}

- (void)setPairingAllowedCallbackQueue:(id)a3
{
}

- (id)customDataCallback
{
  return self->_customDataCallback;
}

- (void)setCustomDataCallback:(id)a3
{
}

- (OS_dispatch_queue)customDataCallbackQueue
{
  return self->_customDataCallbackQueue;
}

- (void)setCustomDataCallbackQueue:(id)a3
{
}

- (id)outputDevicesUpdatedCallback
{
  return self->_outputDevicesUpdatedCallback;
}

- (void)setOutputDevicesUpdatedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesUpdatedCallbackQueue
{
  return self->_outputDevicesUpdatedCallbackQueue;
}

- (void)setOutputDevicesUpdatedCallbackQueue:(id)a3
{
}

- (id)outputDevicesRemovedCallback
{
  return self->_outputDevicesRemovedCallback;
}

- (void)setOutputDevicesRemovedCallback:(id)a3
{
}

- (OS_dispatch_queue)outputDevicesRemovedCallbackQueue
{
  return self->_outputDevicesRemovedCallbackQueue;
}

- (void)setOutputDevicesRemovedCallbackQueue:(id)a3
{
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
}

- (id)volumeControlCapabilitiesCallback
{
  return self->_volumeControlCapabilitiesCallback;
}

- (void)setVolumeControlCapabilitiesCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeControlCapabilitiesCallbackQueue
{
  return self->_volumeControlCapabilitiesCallbackQueue;
}

- (void)setVolumeControlCapabilitiesCallbackQueue:(id)a3
{
}

- (id)volumeMutedCallback
{
  return self->_volumeMutedCallback;
}

- (void)setVolumeMutedCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeMutedCallbackQueue
{
  return self->_volumeMutedCallbackQueue;
}

- (void)setVolumeMutedCallbackQueue:(id)a3
{
}

- (id)deviceInfoCallback
{
  return self->_deviceInfoCallback;
}

- (void)setDeviceInfoCallback:(id)a3
{
}

- (OS_dispatch_queue)deviceInfoCallbackQueue
{
  return self->_deviceInfoCallbackQueue;
}

- (void)setDeviceInfoCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)outputContextCallbackQueue
{
  return self->_outputContextCallbackQueue;
}

- (void)setOutputContextCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableArray)pendingConnectCompletionHandlers
{
  return self->_pendingConnectCompletionHandlers;
}

- (void)setPendingConnectCompletionHandlers:(id)a3
{
}

- (MSVTimer)powerLogIntervalTimer
{
  return self->_powerLogIntervalTimer;
}

- (void)setPowerLogIntervalTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface MRDExternalDeviceServerClientConnection
- (BOOL)_wantsLibraryCommands;
- (BOOL)hasAccessToPlayerPath:(id)a3;
- (BOOL)isAllowedToSendCommand:(unsigned int)a3;
- (BOOL)isAllowedToSendMessageType:(unint64_t)a3;
- (BOOL)isDestinationLocal;
- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3;
- (MRAVEndpoint)destinationEndpoint;
- (MRCoreUtilsPairingSessionPeer)sessionPeer;
- (MRDExternalDeviceServerClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (MRDExternalDeviceServerClientConnectionDelegate)serverDelegate;
- (MRPasscodeCredentials)credentials;
- (MRPlaybackQueueClient)playbackQueueRequests;
- (NSArray)discoverySessionConfigurations;
- (NSArray)registeredVirtualVoiceInputDevices;
- (NSArray)virtualTouchDevices;
- (NSDictionary)connectUserInfo;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)destinationGroupUID;
- (NSString)destinationOutputDeviceUID;
- (id)exportContentItemArtworkUpdates:(id)a3 forPlayerPath:(id)a4;
- (id)exportContentItems:(id)a3 forPlayerPath:(id)a4;
- (id)exportNowPlayingState:(id)a3 forPlayerPath:(id)a4;
- (id)exportPlaybackQueue:(id)a3 forPlayerPath:(id)a4;
- (id)exportSupportedCommands:(id)a3;
- (id)gameControllerWithID:(unint64_t)a3;
- (id)outputDevicesForEndpoint:(id)a3;
- (id)pinPairingToken;
- (id)virtualTouchDeviceWithID:(unint64_t)a3;
- (unint64_t)addGameController:(id)a3;
- (unint64_t)addVirtualTouchDevice:(id)a3;
- (unint64_t)virtualTouchIDWithPackedID:(unint64_t)a3;
- (unsigned)connectOptions;
- (unsigned)discoveryModeForConfiguration:(id)a3;
- (void)_handleEndpointDidDisconnect:(id)a3;
- (void)addLyricsEvent:(id)a3;
- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4;
- (void)addRegisteredVirtualVoiceInputDevice:(unsigned int)a3;
- (void)addVolumeEvent:(_MRHIDButtonEvent)a3;
- (void)dealloc;
- (void)flushLyricsEvents:(id)a3;
- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3;
- (void)flushVolumeEvents:(id)a3;
- (void)gameController:(id)a3 propertiesDidChange:(id)a4;
- (void)localizeDestinationOrigin:(id)a3 completion:(id)a4;
- (void)localizeDestinationPlayerPath:(id)a3 completion:(id)a4;
- (void)removeAllVirtualTouchDevices;
- (void)removeGameController:(unint64_t)a3;
- (void)removeLyricsEvent:(id)a3;
- (void)requestConnectedDestinationEndpoint:(id)a3;
- (void)requestDestinationEndpoint:(id)a3;
- (void)setConnectUserInfo:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setDestinationEndpoint:(id)a3;
- (void)setDestinationGroupUID:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setPinPairingToken:(id)a3;
- (void)setServerDelegate:(id)a3;
- (void)unregisterAllVirtualVoiceInputDevices;
@end

@implementation MRDExternalDeviceServerClientConnection

- (MRDExternalDeviceServerClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceServerClientConnection;
  v4 = -[MRDExternalDeviceServerClientConnection initWithConnection:queue:](&v26, "initWithConnection:queue:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    v9 = (objc_class *)objc_opt_class(v4);
    Name = class_getName(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    v14 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v13;

    v15 = -[MRPlaybackQueueClient initWithQueue:]( objc_alloc(&OBJC_CLASS___MRPlaybackQueueClient),  "initWithQueue:",  *((void *)v4 + 3));
    v16 = (void *)*((void *)v4 + 16);
    *((void *)v4 + 16) = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v18 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v20 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v22 = (void *)*((void *)v4 + 8);
    *((void *)v4 + 8) = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v24 = (void *)*((void *)v4 + 14);
    *((void *)v4 + 14) = v23;

    *((void *)v4 + 9) = 0LL;
    *((_DWORD *)v4 + 20) = 0;
    *(void *)(v4 + 84) = 0LL;
    *((_DWORD *)v4 + 23) = 0;
    *((_WORD *)v4 + 20) = 0;
    *((_WORD *)v4 + 28) = 0x3FFF;
  }

  return (MRDExternalDeviceServerClientConnection *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDExternalDeviceServerClientConnection;
  -[MRDExternalDeviceServerClientConnection dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connection](self, "connection"));
  v6 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@:%p %@", v4, self, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"destination=%@", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationGroupUID](self, "destinationGroupUID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationGroupUID](self, "destinationGroupUID"));
    -[NSMutableString appendFormat:](v6, "appendFormat:", @"destinationGroup=%@", v10);
  }

  -[NSMutableString appendString:](v6, "appendString:", @">");
  return (NSString *)v6;
}

- (NSString)debugDescription
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  if (-[MRDExternalDeviceServerClientConnection registeredToNowPlayingUpdates]( self,  "registeredToNowPlayingUpdates")) {
    -[NSMutableString appendString:](v3, "appendString:", @"NowPlaying ");
  }
  if (-[MRDExternalDeviceServerClientConnection registeredToOutputDeviceUpdates]( self,  "registeredToOutputDeviceUpdates")) {
    -[NSMutableString appendString:](v3, "appendString:", @"OutputDevices ");
  }
  if (-[MRDExternalDeviceServerClientConnection registeredToVolumeUpdates]( self,  "registeredToVolumeUpdates")) {
    -[NSMutableString appendString:](v3, "appendString:", @"Volume ");
  }
  if (-[MRDExternalDeviceServerClientConnection registeredKeyboardUpdates]( self,  "registeredKeyboardUpdates")) {
    -[NSMutableString appendString:](v3, "appendString:", @"Keyboard ");
  }
  if (-[MRDExternalDeviceServerClientConnection registeredToSystemEndpointUpdates]( self,  "registeredToSystemEndpointUpdates")) {
    -[NSMutableString appendString:](v3, "appendString:", @"SystemEndpointUpdates ");
  }
  uint64_t v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection deviceInfo](self, "deviceInfo"));
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject(v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection supportedMessages](self, "supportedMessages"));
  id v27 = [v30 lastSupportedMessageType];
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromArray(self->_virtualTouchDevices);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = MRCreateIndentedDebugDescriptionFromArray(self->_registeredVirtualVoiceInputDevices);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  playbackQueueRequests = self->_playbackQueueRequests;
  id pinPairingToken = self->_pinPairingToken;
  sessionPeer = self->_sessionPeer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection subscribedPlayerPaths](self, "subscribedPlayerPaths"));
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromArray(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationGroupUID](self, "destinationGroupUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationEndpoint](self, "destinationEndpoint"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connection](self, "connection"));
  v17 = v3;
  objc_super v26 = v3;
  v18 = (void *)v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p {\n    deviceInfo = %@\n    lastSupportedMessageType = %ld\n    virtualTouchDevices = %@\n    registeredVirtualVoiceInputDevices = %@\n    playbackQueueRequests = %@\n    sessionPeer = %@\n    id pinPairingToken = %@\n    serverDelegate = %@\n    registeredUpdates = %@\n    subscribedPlayerPaths = %@\n    destinationOutputDeviceUID = %@\n    destinationGroupID = %@\n    destinationEndpoint = %@\n    connection = %@\n}>",  v29,  self,  v28,  v27,  v22,  v9,  playbackQueueRequests,  sessionPeer,  pinPairingToken,  WeakRetained,  v17,  v12,  v13,  v14,  v15,  v16));

  return (NSString *)v19;
}

- (unsigned)connectOptions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connectUserInfo](self, "connectUserInfo"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"ConnectOptions"]);
  unsigned int v4 = [v3 intValue];

  return v4;
}

- (NSArray)virtualTouchDevices
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100057764;
  v10 = sub_100057774;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005777C;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)registeredVirtualVoiceInputDevices
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_100057764;
  v10 = sub_100057774;
  id v11 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100057878;
  v5[3] = &unk_100399278;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (unint64_t)addGameController:(id)a3
{
  id v4 = a3;
  signed __int16 v5 = self->_gameControllerDeviceIDCounter + 1;
  self->_gameControllerDeviceIDCounter = v5;
  unint64_t v6 = v5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000579E4;
  block[3] = &unk_100399030;
  block[4] = self;
  id v14 = v4;
  uint64_t v15 = v5;
  id v8 = v4;
  dispatch_sync(serialQueue, block);
  uint64_t v10 = _MRLogForCategory(0LL, v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[ExternalDeviceConnection(Server)] Added gamecontroller with deviceID: %llu",  buf,  0xCu);
  }

  return v6;
}

- (id)gameControllerWithID:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100057764;
  id v11 = sub_100057774;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057B08;
  block[3] = &unk_100398EF0;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeGameController:(unint64_t)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100057BDC;
  v4[3] = &unk_100399B70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

- (unint64_t)addVirtualTouchDevice:(id)a3
{
  id v4 = a3;
  signed __int16 v5 = self->_deviceIDCounter + 1;
  self->_deviceIDCounter = v5;
  unint64_t v6 = v5;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057CDC;
  block[3] = &unk_100399030;
  block[4] = self;
  id v11 = v4;
  uint64_t v12 = v5;
  id v8 = v4;
  dispatch_sync(serialQueue, block);

  return v6;
}

- (id)virtualTouchDeviceWithID:(unint64_t)a3
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_100057764;
  id v11 = sub_100057774;
  id v12 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057E38;
  block[3] = &unk_100399F60;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)removeAllVirtualTouchDevices
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058008;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)addRegisteredVirtualVoiceInputDevice:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058158;
  block[3] = &unk_10039A990;
  block[4] = self;
  unsigned int v11 = a3;
  dispatch_sync(serialQueue, block);
  objc_initWeak(&location, self);
  unint64_t v6 = &_dispatch_main_q;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000581B4;
  v7[3] = &unk_10039BB80;
  objc_copyWeak(&v8, &location);
  MRVirtualVoiceInputSetRecordingStateCallback(v3, &_dispatch_main_q, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)unregisterAllVirtualVoiceInputDevices
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_100057764;
  unint64_t v17 = sub_100057774;
  id v18 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058498;
  block[3] = &unk_100399278;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(serialQueue, block);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = (id)v14[5];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        MRVirtualVoiceInputSetRecordingStateCallback(objc_msgSend(v7, "unsignedIntValue", (void)v8), 0, 0);
        MRVirtualVoiceInputUnregisterDevice([v7 unsignedIntValue], 0, 0);
      }

      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }

    while (v4);
  }

  _Block_object_dispose(&v13, 8);
}

- (unint64_t)virtualTouchIDWithPackedID:(unint64_t)a3
{
  packedDeviceIDToDeviceIDMapping = self->_packedDeviceIDToDeviceIDMapping;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](packedDeviceIDToDeviceIDMapping, "objectForKey:", v4));
  id v6 = [v5 longLongValue];

  return (unint64_t)v6;
}

- (void)addLyricsEvent:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000585C4;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)removeLyricsEvent:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005865C;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (void)flushLyricsEvents:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100057764;
  v19 = sub_100057774;
  id v20 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058978;
  block[3] = &unk_100399278;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync(serialQueue, block);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v6 = (id)v16[5];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      __int128 v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        __int128 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }

    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)addVolumeEvent:(_MRHIDButtonEvent)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058A28;
  block[3] = &unk_10039BBA8;
  _MRHIDButtonEvent v5 = a3;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)flushVolumeEvents:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v11 = 0LL;
  __int128 v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058BB0;
  block[3] = &unk_10039BBD0;
  block[4] = self;
  void block[5] = &v11;
  void block[6] = &v7;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v12 + 24)) {
    v4[2](v4, 0xE90000000CLL, 0LL);
  }
  if (*((_BYTE *)v8 + 24)) {
    v4[2](v4, 0xEA0000000CLL, 0LL);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)addPendingPlaybackSessionMigrateEvent:(id)a3 playerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058CAC;
  block[3] = &unk_100398F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

- (BOOL)removePendingPlaybackSessionMigrateEvent:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058DFC;
  block[3] = &unk_100399DF8;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (void)flushPendingPlaybackSessionMigrateEvents:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    v21 = sub_100057764;
    v22 = sub_100057774;
    id v23 = 0LL;
    serialQueue = (dispatch_queue_s *)self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100059080;
    block[3] = &unk_100399278;
    block[4] = self;
    void block[5] = &v18;
    dispatch_sync(serialQueue, block);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = (id)v19[5];
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "first", (void)v13));
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 second]);
          v4[2](v4, v11, v12);
        }

        id v7 = [v6 countByEnumeratingWithState:&v13 objects:v24 count:16];
      }

      while (v7);
    }

    _Block_object_dispose(&v18, 8);
  }
}

- (void)localizeDestinationPlayerPath:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100059174;
  v8[3] = &unk_10039BBF8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[MRDExternalDeviceServerClientConnection requestConnectedDestinationEndpoint:]( self,  "requestConnectedDestinationEndpoint:",  v8);
}

- (void)localizeDestinationOrigin:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[MRPlayerPath initWithOrigin:client:player:]( objc_alloc(&OBJC_CLASS___MRPlayerPath),  "initWithOrigin:client:player:",  v7,  0LL,  0LL);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100059308;
  v10[3] = &unk_10039BC20;
  id v11 = v6;
  id v9 = v6;
  -[MRDExternalDeviceServerClientConnection localizeDestinationPlayerPath:completion:]( self,  "localizeDestinationPlayerPath:completion:",  v8,  v10);
}

- (void)requestConnectedDestinationEndpoint:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000593C8;
  v4[3] = &unk_10039BC70;
  _MRHIDButtonEvent v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[MRDExternalDeviceServerClientConnection requestDestinationEndpoint:](v5, "requestDestinationEndpoint:", v4);
}

- (void)requestDestinationEndpoint:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  _MRHIDButtonEvent v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationEndpoint](self, "destinationEndpoint"));
  if (v5)
  {
    if (v4) {
      v4[2](v4, v5);
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MRDAutoConnectionControllerReason reasonWithType:string:]( &OBJC_CLASS___MRDAutoConnectionControllerReason,  "reasonWithType:string:",  4LL,  @"ExternalDeviceServerDestination"));
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    __int128 v13 = sub_100059620;
    __int128 v14 = &unk_10039BC70;
    __int128 v15 = self;
    __int128 v16 = v4;
    id v7 = objc_retainBlock(&v11);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationGroupUID]( self,  "destinationGroupUID",  v11,  v12,  v13,  v14,  v15));

    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MRDAutoConnectionController sharedConnectionController]( &OBJC_CLASS___MRDAutoConnectionController,  "sharedConnectionController"));
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection destinationGroupUID](self, "destinationGroupUID"));
      [v9 discoverGroup:v10 reason:v6 queue:&_dispatch_main_q completion:v7];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));
      [v9 discoverOutputDevice:v10 reason:v6 queue:&_dispatch_main_q completion:v7];
    }
  }
}

- (BOOL)isDestinationLocal
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));

  if (!v3) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MROrigin localOrigin](&OBJC_CLASS___MROrigin, "localOrigin"));
  _MRHIDButtonEvent v5 = (void *)objc_claimAutoreleasedReturnValue( +[MRDeviceInfoRequest deviceInfoForOrigin:]( &OBJC_CLASS___MRDeviceInfoRequest,  "deviceInfoForOrigin:",  v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection destinationOutputDeviceUID]( self,  "destinationOutputDeviceUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 WHAIdentifier]);
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  return v8;
}

- (void)setDestinationEndpoint:(id)a3
{
  _MRHIDButtonEvent v5 = (MRAVEndpoint *)a3;
  id v6 = self;
  objc_sync_enter(v6);
  p_destinationEndpoint = (id *)&v6->_destinationEndpoint;
  destinationEndpoint = v6->_destinationEndpoint;
  if (destinationEndpoint != v5)
  {
    if (destinationEndpoint)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v9 removeObserver:v6 name:MRAVEndpointDidDisconnectNotification object:*p_destinationEndpoint];

      id v10 = *p_destinationEndpoint;
    }

    else
    {
      id v10 = 0LL;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 debugName]);

    if (v11)
    {
      uint64_t v13 = _MRLogForCategory(0LL, v12);
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*p_destinationEndpoint debugName]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
        *(_DWORD *)buf = 138544130;
        v29 = v6;
        __int16 v30 = 2114;
        v31 = @"destinationEndpoint";
        __int16 v32 = 2112;
        v33 = v15;
        __int16 v34 = 2112;
        v35 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  buf,  0x2Au);
      }
    }

    else
    {
      uint64_t v17 = _MRLogForCategory(0LL, v12);
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](v5, "debugName"));
        *(_DWORD *)buf = 138543874;
        v29 = v6;
        __int16 v30 = 2114;
        v31 = @"destinationEndpoint";
        __int16 v32 = 2112;
        v33 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  buf,  0x20u);
      }
    }

    objc_storeStrong((id *)&v6->_destinationEndpoint, a3);
    if (*p_destinationEndpoint
      || (v19 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 24LL),
          -[MRDExternalDeviceServerClientConnection disconnectWithError:](v6, "disconnectWithError:", v19),
          v19,
          *p_destinationEndpoint))
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v20 addObserver:v6 selector:"_handleEndpointDidDisconnect:" name:MRAVEndpointDidDisconnectNotification object:*p_destinationEndpoint];
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection label](v6, "label"));
    BOOL v22 = [v21 length] == 0;

    if (v22)
    {
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection label](v6, "label"));
      uint64_t v24 = objc_claimAutoreleasedReturnValue([*p_destinationEndpoint debugName]);
      v25 = (void *)v24;
      objc_super v26 = &stru_1003AE680;
      if (v23) {
        objc_super v26 = v23;
      }
      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v26,  v24));
      -[MRDExternalDeviceServerClientConnection setLabel:](v6, "setLabel:", v27);
    }

    else
    {
      id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([*p_destinationEndpoint debugName]);
      -[MRDExternalDeviceServerClientConnection setLabel:](v6, "setLabel:", v23);
    }
  }

  objc_sync_exit(v6);
}

- (MRAVEndpoint)destinationEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_destinationEndpoint;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_wantsLibraryCommands
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection deviceInfo](self, "deviceInfo"));
  unsigned __int8 v4 = [v3 isGizmo];

  if ((v4 & 1) != 0) {
    return 1;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection deviceInfo](self, "deviceInfo"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
  unsigned __int8 v8 = [v7 isEqualToString:@"com.apple.TVRemote"];

  return v8;
}

- (id)exportNowPlayingState:(id)a3 forPlayerPath:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v6 = a4;
    id v7 = v4;
    id v4 = [v7 copy];
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedCommands]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection exportSupportedCommands:]( self,  "exportSupportedCommands:",  v8));
    [v4 setSupportedCommands:v9];

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 playbackQueue]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MRDExternalDeviceServerClientConnection exportPlaybackQueue:forPlayerPath:]( self,  "exportPlaybackQueue:forPlayerPath:",  v10,  v6));

    [v4 setPlaybackQueue:v11];
  }

  return v4;
}

- (id)exportSupportedCommands:(id)a3
{
  id v4 = a3;
  if (-[MRDExternalDeviceServerClientConnection _wantsLibraryCommands](self, "_wantsLibraryCommands"))
  {
    id v5 = v4;
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100059CD4;
    v7[3] = &unk_10039BC98;
    unsigned __int8 v8 = &off_1003BBAC8;
    id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "msv_filter:", v7));
  }

  return v5;
}

- (id)exportPlaybackQueue:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [v6 range];
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MRPlaybackQueueRequest defaultPlaybackQueueRequestWithRange:]( &OBJC_CLASS___MRPlaybackQueueRequest,  "defaultPlaybackQueueRequestWithRange:",  v8,  v9));
    id v11 = (void *)MRPlaybackQueueCreateFromRequest(v6, v10);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentItems", 0));
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) metadata]);
          [v17 setDeviceSpecificUserInfo:0];

          __int128 v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v14);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection playbackQueueRequests](self, "playbackQueueRequests"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 existingSubscriptionControllerForPlayerPath:v7]);

    [v19 subscribeToPlaybackQueue:v11 forRequest:v10];
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)exportContentItems:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection playbackQueueRequests](self, "playbackQueueRequests"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 existingSubscriptionControllerForPlayerPath:v7]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue([v9 filteredContentItemsBySubscriptionsForContentItems:v6]);
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v14), "metadata", (void)v19));
          [v15 setDeviceSpecificUserInfo:0];

          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  if (objc_msgSend(v10, "count", (void)v19)) {
    __int128 v16 = v10;
  }
  else {
    __int128 v16 = 0LL;
  }
  id v17 = v16;

  return v17;
}

- (id)exportContentItemArtworkUpdates:(id)a3 forPlayerPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection playbackQueueRequests](self, "playbackQueueRequests"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 existingSubscriptionControllerForPlayerPath:v7]);

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 filteredContentItemsBySubscriptionsForContentItems:v6]);
  }

  else
  {
    id v10 = 0LL;
  }

  if ([v10 count]) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }
  id v12 = v11;

  return v12;
}

- (unsigned)discoveryModeForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5->_discoveryModes, "objectForKeyedSubscript:", v4));
  unsigned int v7 = [v6 intValue];

  objc_sync_exit(v5);
  return v7;
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_discoveryModes, "setObject:forKeyedSubscript:", v7, v8);

  objc_sync_exit(v6);
}

- (NSArray)discoverySessionConfigurations
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_discoveryModes, "allKeys"));
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)outputDevicesForEndpoint:(id)a3
{
  id v4 = a3;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100057764;
  void v10[4] = sub_100057774;
  id v11 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005A39C;
  v9[3] = &unk_10039BCC0;
  v9[4] = self;
  v9[5] = v10;
  id v5 = objc_retainBlock(v9);
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 outputDevices]);
  }
  unsigned int v7 = (void *)v6;

  _Block_object_dispose(v10, 8);
  return v7;
}

- (BOOL)hasAccessToPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connection](self, "connection"));
  unsigned __int8 v6 = [v5 hasAccessToPlayerPath:v4];

  return v6;
}

- (BOOL)isAllowedToSendMessageType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connection](self, "connection"));
  LOBYTE(a3) = [v4 isAllowedToSendMessageType:a3];

  return a3;
}

- (BOOL)isAllowedToSendCommand:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRDExternalDeviceServerClientConnection connection](self, "connection"));
  LOBYTE(v3) = [v4 isAllowedToSendCommand:v3];

  return v3;
}

- (void)_handleEndpointDidDisconnect:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  -[MRDExternalDeviceServerClientConnection disconnectWithError:](self, "disconnectWithError:", v5);
  -[MRDExternalDeviceServerClientConnection setDestinationEndpoint:](self, "setDestinationEndpoint:", 0LL);
}

- (void)gameController:(id)a3 propertiesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  uint64_t v19 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005A6EC;
  block[3] = &unk_100399DF8;
  block[4] = self;
  id v9 = v6;
  id v14 = v9;
  uint64_t v15 = &v16;
  dispatch_sync(serialQueue, block);
  if (v17[3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
    char v11 = objc_opt_respondsToSelector(WeakRetained, "externalDeviceClient:gameController:propertiesChanged:");

    if ((v11 & 1) != 0)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_serverDelegate);
      [v12 externalDeviceClient:self gameController:v17[3] propertiesChanged:v7];
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (MRPasscodeCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (MRPlaybackQueueClient)playbackQueueRequests
{
  return self->_playbackQueueRequests;
}

- (MRCoreUtilsPairingSessionPeer)sessionPeer
{
  return self->_sessionPeer;
}

- (id)pinPairingToken
{
  return self->_pinPairingToken;
}

- (void)setPinPairingToken:(id)a3
{
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (NSString)destinationGroupUID
{
  return self->_destinationGroupUID;
}

- (void)setDestinationGroupUID:(id)a3
{
}

- (MRDExternalDeviceServerClientConnectionDelegate)serverDelegate
{
  return (MRDExternalDeviceServerClientConnectionDelegate *)objc_loadWeakRetained((id *)&self->_serverDelegate);
}

- (void)setServerDelegate:(id)a3
{
}

- (NSDictionary)connectUserInfo
{
  return self->_connectUserInfo;
}

- (void)setConnectUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
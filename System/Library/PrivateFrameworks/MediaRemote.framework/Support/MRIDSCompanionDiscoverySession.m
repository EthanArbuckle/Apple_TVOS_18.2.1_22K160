@interface MRIDSCompanionDiscoverySession
- (BOOL)devicePresenceDetected;
- (MRIDSCompanionDiscoverySession)init;
- (MRIDSCompanionDiscoverySession)initWithConfiguration:(id)a3;
- (MRProtocolClientConnection)discoveryChannel;
- (NSString)debugDescription;
- (id)availableOutputDevices;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)_handleCompanionDeviceDidConnectNotification:(id)a3;
- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3;
- (void)_onIDSQueue_connectDiscoveryChannel:(id)a3;
- (void)_onIDSQueue_disconnectDiscoveryChannel:(id)a3;
- (void)_onIDSQueue_initializeDiscoveryChannel;
- (void)_syncClientStateToConnection:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)handleUpdateOutputDevicesMessage:(id)a3 forClient:(id)a4;
- (void)setDiscoveryChannel:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRIDSCompanionDiscoverySession

- (MRIDSCompanionDiscoverySession)init
{
  return -[MRIDSCompanionDiscoverySession initWithFeatures:](self, "initWithFeatures:", 16LL);
}

- (MRIDSCompanionDiscoverySession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MRIDSCompanionDiscoverySession;
  v5 = -[MRIDSCompanionDiscoverySession initWithConfiguration:](&v20, "initWithConfiguration:", v4);
  if (v5)
  {
    v5->_endpointFeatures = [v4 features];
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaremote.MRExternalRoutingDiscoverySession.idsQueue", v7);
    idsQueue = v5->_idsQueue;
    v5->_idsQueue = (OS_dispatch_queue *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v11 = MRIDSCompanionConnectionDeviceDidDisconnect;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    [v10 addObserver:v5 selector:"_handleCompanionDeviceDisconnectedNotification:" name:v11 object:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v14 = MRIDSCompanionConnectionDeviceDidConnect;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    [v13 addObserver:v5 selector:"_handleCompanionDeviceDidConnectNotification:" name:v14 object:v15];

    v16 = (dispatch_queue_s *)v5->_idsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012ECD8;
    block[3] = &unk_100399250;
    v19 = v5;
    dispatch_async(v16, block);
  }

  return v5;
}

- (NSString)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRIDSCompanionDiscoverySession;
  id v4 = -[MRIDSCompanionDiscoverySession debugDescription](&v10, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRIDSCompanionDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  dispatch_queue_t v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@\nIDSCompanion: %@\navailableDevices = %@\n",  v5,  v6,  v7);

  return v8;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t discoveryMode = v4->_discoveryMode;
  if ((_DWORD)discoveryMode != (_DWORD)v3)
  {
    v7 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(discoveryMode, v5);

    if (v7)
    {
      uint64_t v9 = _MRLogForCategory(9LL, v8);
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (objc_class *)objc_opt_class(v4);
        v12 = NSStringFromClass(v11);
        id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
        id v15 = (id)MRMediaRemoteCopyRouteDiscoveryModeDescription(v4->_discoveryMode, v14);
        v17 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v16);
        int v26 = 138544130;
        id v27 = v13;
        __int16 v28 = 2114;
        v29 = @"discoveryMode";
        __int16 v30 = 2112;
        id v31 = v15;
        __int16 v32 = 2112;
        v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  (uint8_t *)&v26,  0x2Au);
      }
    }

    else
    {
      uint64_t v18 = _MRLogForCategory(9LL, v8);
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class(v4);
        objc_super v20 = NSStringFromClass(v19);
        id v21 = (id)objc_claimAutoreleasedReturnValue(v20);
        v23 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v3, v22);
        int v26 = 138543874;
        id v27 = v21;
        __int16 v28 = 2114;
        v29 = @"discoveryMode";
        __int16 v30 = 2112;
        id v31 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v26,  0x20u);
      }
    }

    v4->_uint64_t discoveryMode = v3;
    id v24 = objc_msgSend( [MRSetDiscoveryModeMessage alloc],  "initWithMode:features:",  v3,  -[MRIDSCompanionDiscoverySession endpointFeatures](v4, "endpointFeatures"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRIDSCompanionDiscoverySession discoveryChannel](v4, "discoveryChannel"));
    [v25 sendMessage:v24];
  }

  objc_sync_exit(v4);
}

- (unsigned)discoveryMode
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int discoveryMode = v2->_discoveryMode;
  objc_sync_exit(v2);

  return discoveryMode;
}

- (unsigned)endpointFeatures
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int endpointFeatures = v2->_endpointFeatures;
  objc_sync_exit(v2);

  return endpointFeatures;
}

- (MRProtocolClientConnection)discoveryChannel
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  else {
    discoveryChannel = 0LL;
  }
  uint64_t v5 = discoveryChannel;

  return v5;
}

- (BOOL)devicePresenceDetected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRIDSCompanionDiscoverySession availableOutputDevices](self, "availableOutputDevices"));
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)availableOutputDevices
{
  return -[MRIDSCompanionDiscoverySession outputDevicesSnapshot](self, "outputDevicesSnapshot");
}

- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3
{
  idsQueue = (dispatch_queue_s *)self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012F1E0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(idsQueue, block);
}

- (void)_handleCompanionDeviceDidConnectNotification:(id)a3
{
  idsQueue = (dispatch_queue_s *)self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10012F254;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(idsQueue, block);
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 type] == (id)109) {
    -[MRIDSCompanionDiscoverySession handleUpdateOutputDevicesMessage:forClient:]( self,  "handleUpdateOutputDevicesMessage:forClient:",  v6,  v7);
  }
}

- (void)handleUpdateOutputDevicesMessage:(id)a3 forClient:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 outputDevices]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "msv_map:", &stru_1003A1DF8));

  -[MRIDSCompanionDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v6);
}

- (void)_onIDSQueue_connectDiscoveryChannel:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  -[MRIDSCompanionDiscoverySession _onIDSQueue_disconnectDiscoveryChannel:]( self,  "_onIDSQueue_disconnectDiscoveryChannel:",  v4);
  uint64_t v6 = _MRLogForCategory(9LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceInfo]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      int v14 = 138412290;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRIDSDiscoverySession] Connecting discoveryChannel to <%@>...",  (uint8_t *)&v14,  0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceInfo]);
    [v4 setDeviceInfo:v13];

    -[MRIDSCompanionDiscoverySession _syncClientStateToConnection:](self, "_syncClientStateToConnection:", v4);
  }

  else
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = (void *)IDSDefaultPairedDevice;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRIDSDiscoverySession] No device to connect discoveryChannel to <%@>...",  (uint8_t *)&v14,  0xCu);
    }
  }
}

- (void)_syncClientStateToConnection:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
  [v4 setPriority:5];
  [v4 setWaking:1];
  id v5 = objc_alloc_init(&OBJC_CLASS___MRCompositeMessage);
  [v5 setTransportOptions:v4];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [[MRSetConnectionStateMessage alloc] initWithConnectionState:2];
  [v5 addMessage:v7];

  id v8 = (id)-[MRIDSCompanionDiscoverySession discoveryMode](v6, "discoveryMode");
  if ((_DWORD)v8)
  {
    id v9 = objc_msgSend( [MRSetDiscoveryModeMessage alloc],  "initWithMode:features:",  v8,  -[MRIDSCompanionDiscoverySession endpointFeatures](v6, "endpointFeatures"));
    [v5 addMessage:v9];
  }

  objc_sync_exit(v6);

  [v10 sendMessage:v5];
}

- (void)_onIDSQueue_disconnectDiscoveryChannel:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deviceInfo]);

  if (v5)
  {
    uint64_t v7 = _MRLogForCategory(9LL, v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = IDSDefaultPairedDevice;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRIDSDiscoverySession] Disconnecting discoveryChannel for <%@>...",  (uint8_t *)&v9,  0xCu);
    }

    [v4 setDeviceInfo:0];
    -[MRIDSCompanionDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", 0LL);
  }
}

- (void)_onIDSQueue_initializeDiscoveryChannel
{
  uint64_t v4 = _MRLogForCategory(9LL, v3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    uint64_t v14 = IDSDefaultPairedDevice;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[MRIDSDiscoverySession] Initializing discoveryChannel for <%@>",  (uint8_t *)&v13,  0xCu);
  }

  id v6 = objc_alloc(&OBJC_CLASS___MRIDSCompanionTransportConnection);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  id v8 = [v6 initWithConnection:v7 type:MRIDSServiceMessageTypeDiscovery destination:0 session:0];

  if (qword_1003FE0D8 != -1) {
    dispatch_once(&qword_1003FE0D8, &stru_1003A1E18);
  }
  int v9 = objc_alloc(&OBJC_CLASS___MRIDSClientConnection);
  uint64_t v10 = -[MRIDSClientConnection initWithConnection:queue:](v9, "initWithConnection:queue:", v8, qword_1003FE0D0);
  discoveryChannel = self->_discoveryChannel;
  self->_discoveryChannel = v10;

  -[MRProtocolClientConnection setDelegate:](self->_discoveryChannel, "setDelegate:", self);
  -[MRProtocolClientConnection setLabel:](self->_discoveryChannel, "setLabel:", @"IDSDiscoveryChannel");
  id v12 = [[MRSupportedProtocolMessages alloc] initWithAllSupportedMessages];
  -[MRProtocolClientConnection setSupportedMessages:](self->_discoveryChannel, "setSupportedMessages:", v12);
}

- (void)setDiscoveryChannel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
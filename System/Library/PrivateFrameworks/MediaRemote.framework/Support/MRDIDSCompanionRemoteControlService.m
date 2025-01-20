@interface MRDIDSCompanionRemoteControlService
- (BOOL)isDiscoveryChannelConnected;
- (MRDIDSCompanionRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDIDSCompanionRemoteControlServiceDelegate)delegate;
- (MRDIDSServerClientConnection)discoveryChannel;
- (NSRunLoop)runLoop;
- (NSString)description;
- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_handleCompanionDeviceConnectedNotification:(id)a3;
- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleOutputDevicesDidChangeNotification:(id)a3;
- (void)_onWorkerQueue_connectDiscoveryChannelWithReason:(id)a3;
- (void)_onWorkerQueue_connectRemoteControlChannelForDestination:(id)a3 session:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_disconnectAllRemoteControlChannelsWithError:(id)a3;
- (void)_onWorkerQueue_disconnectDiscoveryChannel;
- (void)_onWorkerQueue_disconnectRemoteControlChannelsForDestination:(id)a3 error:(id)a4;
- (void)_onWorkerQueue_initializeDiscoveryChannel;
- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4;
- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDIDSCompanionRemoteControlService

- (MRDIDSCompanionRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MRDIDSCompanionRemoteControlService;
  v6 = -[MRDIDSCompanionRemoteControlService init](&v37, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mediaremote.MRDIDSCompanionRemoteControlServiceConnection.workerQueue", v8);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v9;

    v11 = -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]( objc_alloc(&OBJC_CLASS___MRAVRoutingDiscoverySessionConfiguration),  "initWithEndpointFeatures:",  16LL);
    configuration = v6->_configuration;
    v6->_configuration = v11;

    objc_storeStrong((id *)&v6->_routingDataSource, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000812A4;
    v35[3] = &unk_10039D650;
    v14 = v6;
    v36 = v14;
    [v13 setMessageHandler:v35 forType:MRIDSServiceMessageTypeConnectRemoteControl];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v16 = MRIDSCompanionConnectionDeviceDidConnect;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    [v15 addObserver:v14 selector:"_handleCompanionDeviceConnectedNotification:" name:v16 object:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v19 = MRIDSCompanionConnectionDeviceDidDisconnect;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    [v18 addObserver:v14 selector:"_handleCompanionDeviceDisconnectedNotification:" name:v19 object:v20];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v21 addObserver:v14 selector:"_handleDeviceInfoDidChangeNotification:" name:kMRDeviceInfoDidChangeNotification object:0];

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v23 = MRAVEndpointDidAddOutputDeviceNotification;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    [v22 addObserver:v14 selector:"_handleOutputDevicesDidChangeNotification:" name:v23 object:v24];

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v26 = MRAVEndpointDidChangeOutputDeviceNotification;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    [v25 addObserver:v14 selector:"_handleOutputDevicesDidChangeNotification:" name:v26 object:v27];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v29 = MRAVEndpointDidRemoveOutputDeviceNotification;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    [v28 addObserver:v14 selector:"_handleOutputDevicesDidChangeNotification:" name:v29 object:v30];

    v31 = (dispatch_queue_s *)v6->_workerQueue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_1000814D4;
    v33[3] = &unk_100399250;
    v34 = v14;
    dispatch_async(v31, v33);
  }

  return v6;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_attr_t v7 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"%@ %p", v6, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"IDSWatch: %@\n", v8);

  id v9 = -[MRDIDSServerClientConnection discoveryMode](self->_discoveryChannel, "discoveryMode");
  v11 = (void *)MRMediaRemoteCopyRouteDiscoveryModeDescription(v9, v10);
  -[NSMutableString appendFormat:](v7, "appendFormat:", @"DiscoveryChannelMode: %@\n", v11);

  -[NSMutableString appendFormat:](v7, "appendFormat:", @"Connections: %@\n", self->_remoteControlConnections);
  lastSentEndpoint = self->_lastSentEndpoint;
  -[NSDate timeIntervalSinceNow](self->_lastSentEndpointDate, "timeIntervalSinceNow");
  -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @"lastSentEndpoint: %@ (%.1fs ago)\n",  lastSentEndpoint,  -v13);
  return (NSString *)v7;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_started)
  {
    v2->_started = 1;
    workerQueue = (dispatch_queue_s *)v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100081660;
    block[3] = &unk_100399250;
    block[4] = v2;
    dispatch_async(workerQueue, block);
  }

  objc_sync_exit(v2);
}

- (void)stop
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_started)
  {
    v2->_started = 0;
    workerQueue = (dispatch_queue_s *)v2->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000816F0;
    block[3] = &unk_100399250;
    block[4] = v2;
    dispatch_async(workerQueue, block);
  }

  objc_sync_exit(v2);
}

- (MRDIDSServerClientConnection)discoveryChannel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  else {
    discoveryChannel = 0LL;
  }
  id v5 = discoveryChannel;

  return v5;
}

- (void)_handleCompanionDeviceConnectedNotification:(id)a3
{
  v3 = self;
  objc_sync_enter(v3);
  if (v3->_started)
  {
    workerQueue = (dispatch_queue_s *)v3->_workerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000817C8;
    block[3] = &unk_100399250;
    block[4] = v3;
    dispatch_async(workerQueue, block);
  }

  objc_sync_exit(v3);
}

- (void)_handleCompanionDeviceDisconnectedNotification:(id)a3
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100081830;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 playerPath]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 origin]);
  unsigned int v6 = [v5 isLocal];

  if (v6)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlService discoveryChannel](self, "discoveryChannel"));
    -[MRDIDSCompanionRemoteControlService _sendEndpoint:toClient:options:]( self,  "_sendEndpoint:toClient:options:",  v8,  v7,  0LL);
  }

- (void)_handleOutputDevicesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_sendEndpointScheduled)
  {
    v5->_sendEndpointScheduled = 1;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
    dispatch_time_t v7 = dispatch_time(0LL, 300000000LL);
    workerQueue = (dispatch_queue_s *)v5->_workerQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100081A34;
    v10[3] = &unk_100398E60;
    v10[4] = v5;
    id v11 = v6;
    id v9 = v6;
    dispatch_after(v7, workerQueue, v10);
  }

  objc_sync_exit(v5);
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v6;
  id v8 = [v7 type];
  if (v8 == (id)101)
  {
    -[MRDIDSCompanionRemoteControlService handleSetDiscoveryModeMessage:forClient:]( self,  "handleSetDiscoveryModeMessage:forClient:",  v7,  v9);
  }

  else if (v8 == (id)38)
  {
    -[MRDIDSCompanionRemoteControlService handleSetConnectionStateMessage:forClient:]( self,  "handleSetConnectionStateMessage:forClient:",  v7,  v9);
  }
}

- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4
{
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100081B94;
  block[3] = &unk_100399250;
  block[4] = self;
  dispatch_async(workerQueue, block);
}

- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mode];
  [v6 setDiscoveryMode:v7];

  if ((_DWORD)v7)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___MRProtocolMessageOptions);
    [v10 setPriority:5];
    [v10 setWaking:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRAVLocalEndpoint sharedLocalEndpoint](&OBJC_CLASS___MRAVLocalEndpoint, "sharedLocalEndpoint"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlService discoveryChannel](self, "discoveryChannel"));
    -[MRDIDSCompanionRemoteControlService _sendEndpoint:toClient:options:]( self,  "_sendEndpoint:toClient:options:",  v8,  v9,  v10);
  }

- (void)_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100081D84;
  v15[3] = &unk_100399880;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workerQueue, v15);
}

- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 discoveryMode])
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 exportEndpoint:v19]);

    if (v11)
    {
      id v12 = objc_alloc(&OBJC_CLASS___MRDiscoveryUpdateOutputDevicesMessage);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 outputDevices]);
      id v14 = [v12 initWithOutputDevices:v13 configuration:self->_configuration];

      [v14 setTransportOptions:v9];
      [v8 sendMessage:v14];
      lastSentEndpoint = self->_lastSentEndpoint;
      self->_lastSentEndpoint = (MRAVEndpoint *)v11;
      id v16 = v11;

      id v17 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      lastSentEndpointDate = self->_lastSentEndpointDate;
      self->_lastSentEndpointDate = v17;
    }
  }
}

- (void)_onWorkerQueue_connectDiscoveryChannelWithReason:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  -[MRDIDSCompanionRemoteControlService _onWorkerQueue_disconnectDiscoveryChannel]( self,  "_onWorkerQueue_disconnectDiscoveryChannel");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  unsigned int v6 = [v5 isConnected];

  uint64_t v7 = MRLogCategoryConnections();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceInfo]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
      int v15 = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[IDSCompanionRemoteControlService] Connecting discoveryChannel to <%@> for reason <%@>...",  (uint8_t *)&v15,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
    [v13 resetConnection];

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MRIDSCompanionConnection sharedManager]( &OBJC_CLASS___MRIDSCompanionConnection,  "sharedManager"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s deviceInfo](v8, "deviceInfo"));
    -[MRDIDSServerClientConnection setDeviceInfo:](self->_discoveryChannel, "setDeviceInfo:", v14);
  }

  else if (v9)
  {
    int v15 = 138412546;
    id v16 = (void *)IDSDefaultPairedDevice;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[IDSCompanionRemoteControlService] No device avaiable to connect discoveryChannel to <%@> for reason <%@>",  (uint8_t *)&v15,  0x16u);
  }
}

- (void)_onWorkerQueue_disconnectDiscoveryChannel
{
  lastSentEndpoint = self->_lastSentEndpoint;
  self->_lastSentEndpoint = 0LL;

  lastSentEndpointDate = self->_lastSentEndpointDate;
  self->_lastSentEndpointDate = 0LL;
}

- (void)_onWorkerQueue_initializeDiscoveryChannel
{
  if (qword_1003FDD70 != -1) {
    dispatch_once(&qword_1003FDD70, &stru_10039D670);
  }
  id v3 = objc_alloc(&OBJC_CLASS___MRIDSCompanionTransportConnection);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  id v9 = [v3 initWithConnection:v4 type:MRIDSServiceMessageTypeDiscovery destination:0 session:0];

  id v5 = objc_alloc(&OBJC_CLASS___MRDIDSServerClientConnection);
  unsigned int v6 = -[MRDIDSServerClientConnection initWithConnection:queue:](v5, "initWithConnection:queue:", v9, qword_1003FDD68);
  discoveryChannel = self->_discoveryChannel;
  self->_discoveryChannel = v6;

  -[MRDIDSServerClientConnection setDelegate:](self->_discoveryChannel, "setDelegate:", self);
  -[MRDIDSServerClientConnection setLabel:](self->_discoveryChannel, "setLabel:", @"IDSDiscoveryChannel");
  id v8 = [[MRSupportedProtocolMessages alloc] initWithAllSupportedMessages];
  -[MRDIDSServerClientConnection setSupportedMessages:](self->_discoveryChannel, "setSupportedMessages:", v8);
}

- (void)_onWorkerQueue_connectRemoteControlChannelForDestination:(id)a3 session:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  id v39 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteControlConnections,  "objectForKeyedSubscript:",  v10));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v11]);

  id v14 = -[NSError initWithMRError:format:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithMRError:format:",  121LL,  @"New replacement connection %@-%@ established",  v10,  v11);
  -[MRDIDSCompanionRemoteControlService _onWorkerQueue_disconnectRemoteControlChannelsForDestination:error:]( self,  "_onWorkerQueue_disconnectRemoteControlChannelsForDestination:error:",  v10,  v14);

  uint64_t v15 = MRLogCategoryConnections();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v56 = v10;
    __int16 v57 = 2112;
    id v58 = v11;
    __int16 v59 = 2112;
    id v60 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[IDSCompanionRemoteControlService] Connecting remoteControlChannel to <%@-%@> with userInfo %@...",  buf,  0x20u);
  }

  id v17 = objc_alloc(&OBJC_CLASS___MRIDSCompanionTransportConnection);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRIDSCompanionConnection sharedManager](&OBJC_CLASS___MRIDSCompanionConnection, "sharedManager"));
  id v41 = [v17 initWithConnection:v18 type:MRIDSServiceMessageTypeRemoteControl destination:v10 session:v11];

  id v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"IDSRemoteControlChannel-<%@/%@>",  v10,  v11);
  [v41 setLabel:v19];

  [v41 setDestinationOutputDeviceUID:v10];
  [v41 setConnectUserInfo:v40];
  v20 = objc_alloc_init(&OBJC_CLASS___MRDIDSCompanionRemoteControlServiceConnection);

  -[MRDIDSCompanionRemoteControlServiceConnection setDestination:](v20, "setDestination:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MRDIDSCompanionRemoteControlServiceConnection setConnectionAttemptDate:](v20, "setConnectionAttemptDate:", v21);

  -[MRDIDSCompanionRemoteControlServiceConnection setConnection:](v20, "setConnection:", v41);
  objc_initWeak((id *)buf, self);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlServiceConnection connection](v20, "connection"));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10008273C;
  v51[3] = &unk_10039D698;
  objc_copyWeak(&v54, (id *)buf);
  id v24 = v10;
  id v52 = v24;
  id v25 = v11;
  id v53 = v25;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( [v22 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v23 queue:0 usingBlock:v51]);
  -[MRDIDSCompanionRemoteControlServiceConnection setNotificationToken:](v20, "setNotificationToken:", v26);

  remoteControlConnections = self->_remoteControlConnections;
  if (!remoteControlConnections)
  {
    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v29 = self->_remoteControlConnections;
    self->_remoteControlConnections = v28;

    remoteControlConnections = self->_remoteControlConnections;
  }

  v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( remoteControlConnections,  "objectForKeyedSubscript:",  v24));
  if (!v30)
  {
    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteControlConnections,  "setObject:forKeyedSubscript:",  v30,  v24);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v20, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlService delegate](self, "delegate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSCompanionRemoteControlServiceConnection connection](v20, "connection"));
  v33 = (void *)objc_claimAutoreleasedReturnValue([v31 idsCompanionRemoteControlService:self didAcceptConnection:v32]);

  char v34 = [v33 connectOptions] & 1;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100082924;
  v43[3] = &unk_10039D6C0;
  id v35 = v41;
  id v44 = v35;
  id v42 = v24;
  id v45 = v42;
  id v36 = v39;
  id v49 = v36;
  id v37 = v33;
  char v50 = v34;
  id v46 = v37;
  v47 = self;
  id v38 = v25;
  id v48 = v38;
  [v37 requestDestinationEndpoint:v43];

  objc_destroyWeak(&v54);
  objc_destroyWeak((id *)buf);
}

- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  routingDataSource = self->_routingDataSource;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 primaryID]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100082C74;
  v16[3] = &unk_10039C148;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  -[MRDAVRoutingDataSource addAuthorizationCallbackForRouteID:requestCallback:]( routingDataSource,  "addAuthorizationCallbackForRouteID:requestCallback:",  v12,  v16);
}

- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3
{
  routingDataSource = self->_routingDataSource;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 primaryID]);
  -[MRDAVRoutingDataSource removeAuthorizationCallbackForRouteID:]( routingDataSource,  "removeAuthorizationCallbackForRouteID:",  v4);
}

- (void)_onWorkerQueue_disconnectRemoteControlChannelsForDestination:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v10 = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteControlConnections,  "objectForKeyedSubscript:",  v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100082F88;
  v11[3] = &unk_10039D6E8;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [v10 enumerateKeysAndObjectsUsingBlock:v11];
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteControlConnections,  "setObject:forKeyedSubscript:",  0LL,  v9);
}

- (void)_onWorkerQueue_disconnectAllRemoteControlChannelsWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v6 = -[NSMutableDictionary copy](self->_remoteControlConnections, "copy");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083110;
  v7[3] = &unk_10039D710;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (MRDIDSCompanionRemoteControlServiceDelegate)delegate
{
  return (MRDIDSCompanionRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDiscoveryChannelConnected
{
  return self->_isDiscoveryChannelConnected;
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void).cxx_destruct
{
}

@end
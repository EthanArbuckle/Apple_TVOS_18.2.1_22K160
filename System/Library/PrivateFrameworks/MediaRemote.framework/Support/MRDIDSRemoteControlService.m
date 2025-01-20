@interface MRDIDSRemoteControlService
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDIDSRemoteControlService)initWithRoutingDataSource:(id)a3;
- (MRDIDSRemoteControlServiceDelegate)delegate;
- (MRDIDSService)service;
- (NSMutableDictionary)discoveryChannels;
- (NSMutableDictionary)remoteControlChannels;
- (NSString)debugDescription;
- (OS_dispatch_queue)workerQueue;
- (id)_createDiscoveryChannelForIDSConnection:(id)a3 deviceInfo:(id)a4;
- (id)_createRemoteControlChannelForIDSConnection:(id)a3 deviceInfo:(id)a4 destination:(id)a5 session:(id)a6 userInfo:(id)a7;
- (id)serviceToken;
- (void)_addAuthorizationCallbackForOutputDevice:(id)a3 destination:(id)a4 session:(id)a5;
- (void)_handleConnectRemoteControlMessage:(id)a3 fromDevice:(id)a4 destination:(id)a5 session:(id)a6;
- (void)_handleDiscoveryMessage:(id)a3 fromDevice:(id)a4;
- (void)_intializeClient:(id)a3 forRemoteControlChannel:(id)a4 authCallback:(id)a5 completion:(id)a6;
- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5;
- (void)_removeAuthorizationCallbackForOutputDevice:(id)a3;
- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4;
- (void)clientDidDisconnect:(id)a3 error:(id)a4;
- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4;
- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiscoveryChannels:(id)a3;
- (void)setRemoteControlChannels:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setWorkerQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDIDSRemoteControlService

- (MRDIDSRemoteControlService)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRDIDSRemoteControlService;
  v6 = -[MRDIDSRemoteControlService init](&v14, "init");
  if (v6)
  {
    v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"com.apple.mediaremote.%@", objc_opt_class(v6));
    v8 = -[NSString UTF8String](v7, "UTF8String");
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create(v8, v10);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_routingDataSource, a3);
  }

  return v6;
}

- (NSString)debugDescription
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@:%p {\n",  objc_opt_class(self),  self);
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(self->_service);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" Service = %@\n", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_discoveryChannels, "allValues"));
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromArray(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" DiscoveryChannels = %@\n", v8);

  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_remoteControlChannels, "allValues"));
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(v9);
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @" RemoteControlChannels = %@\n", v11);

  -[NSMutableString appendFormat:](v3, "appendFormat:", @"}>");
  return (NSString *)v3;
}

- (void)start
{
  if (!self->_service)
  {
    v3 = (MRDIDSService *)objc_claimAutoreleasedReturnValue(+[MRDIDSService sharedService](&OBJC_CLASS___MRDIDSService, "sharedService"));
    service = self->_service;
    self->_service = v3;

    objc_initWeak(&location, self);
    id v5 = self->_service;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10005DF0C;
    v8[3] = &unk_10039BFF0;
    objc_copyWeak(&v9, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSService addMessageHandler:](v5, "addMessageHandler:", v8));
    id serviceToken = self->_serviceToken;
    self->_id serviceToken = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)stop
{
  id serviceToken = self->_serviceToken;
  self->_id serviceToken = 0LL;

  service = self->_service;
  self->_service = 0LL;
}

- (void)clientConnection:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v6;
  id v8 = [v7 type];
  if (v8 == (id)101)
  {
    -[MRDIDSRemoteControlService handleSetDiscoveryModeMessage:forClient:]( self,  "handleSetDiscoveryModeMessage:forClient:",  v7,  v9);
  }

  else if (v8 == (id)38)
  {
    -[MRDIDSRemoteControlService handleSetConnectionStateMessage:forClient:]( self,  "handleSetConnectionStateMessage:forClient:",  v7,  v9);
  }
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E22C;
  block[3] = &unk_100398F40;
  id v12 = v6;
  id v13 = v7;
  objc_super v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, block);
}

- (void)handleSetConnectionStateMessage:(id)a3 forClient:(id)a4
{
}

- (void)handleSetDiscoveryModeMessage:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = (dispatch_queue_s *)self->_workerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E3F4;
  block[3] = &unk_100398F40;
  id v12 = v6;
  id v13 = v7;
  objc_super v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, block);
}

- (void)_handleDiscoveryMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mr_deviceInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceUID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_discoveryChannels,  "objectForKeyedSubscript:",  v9));
  if (!v10)
  {
    dispatch_queue_t v11 = -[MRDIDSServiceConnection initWithDevice:]( objc_alloc(&OBJC_CLASS___MRDIDSServiceConnection),  "initWithDevice:",  v7);
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005E6A4;
    v18[3] = &unk_100399B28;
    objc_copyWeak(&v20, &location);
    id v12 = v9;
    id v19 = v12;
    -[MRDIDSServiceConnection setInvalidationHandler:](v11, "setInvalidationHandler:", v18);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSRemoteControlService _createDiscoveryChannelForIDSConnection:deviceInfo:]( self,  "_createDiscoveryChannelForIDSConnection:deviceInfo:",  v11,  v8));
    discoveryChannels = self->_discoveryChannels;
    if (!discoveryChannels)
    {
      objc_super v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v15 = self->_discoveryChannels;
      self->_discoveryChannels = v14;

      discoveryChannels = self->_discoveryChannels;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](discoveryChannels, "setObject:forKeyedSubscript:", v10, v12);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v10 transport]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  [v16 ingestData:v17];
}

- (void)_handleConnectRemoteControlMessage:(id)a3 fromDevice:(id)a4 destination:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mr_deviceInfo"));
  v36 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceUID]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 data]);
    id v43 = 0LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v16,  0LL,  0LL,  &v43));
    id v31 = v43;
  }

  else
  {
    uint64_t v17 = 0LL;
    id v31 = 0LL;
  }

  v18 = -[MRDIDSServiceConnection initWithDevice:]( objc_alloc(&OBJC_CLASS___MRDIDSServiceConnection),  "initWithDevice:",  v11);
  v33 = (void *)v17;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[MRDIDSRemoteControlService _createRemoteControlChannelForIDSConnection:deviceInfo:destination:session:userInfo:]( self,  "_createRemoteControlChannelForIDSConnection:deviceInfo:destination:session:userInfo:",  v18,  v14,  v12,  v13,  v17));
  remoteControlChannels = self->_remoteControlChannels;
  if (!remoteControlChannels)
  {
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v22 = self->_remoteControlChannels;
    self->_remoteControlChannels = v21;

    remoteControlChannels = self->_remoteControlChannels;
  }

  v34 = v14;
  v35 = v11;
  v23 = (MRDIDSRemoteControlServiceRemoteControlChannels *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( remoteControlChannels,  "objectForKeyedSubscript:",  v36,  v31));
  if (!v23)
  {
    v23 = objc_alloc_init(&OBJC_CLASS___MRDIDSRemoteControlServiceRemoteControlChannels);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_remoteControlChannels,  "setObject:forKeyedSubscript:",  v23,  v36);
  }

  -[MRDIDSRemoteControlServiceRemoteControlChannels addChannel:forDestination:session:]( v23,  "addChannel:forDestination:session:",  v19,  v12,  v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSRemoteControlService delegate](self, "delegate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v19 transport]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v24 idsRemoteControlService:self didAcceptConnection:v25]);

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10005EAB4;
  v39[3] = &unk_10039C060;
  v40 = v18;
  id v41 = v12;
  id v42 = v13;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10005EC98;
  v37[3] = &unk_100399508;
  id v38 = v10;
  id v27 = v10;
  id v28 = v13;
  id v29 = v12;
  v30 = v18;
  -[MRDIDSRemoteControlService _intializeClient:forRemoteControlChannel:authCallback:completion:]( self,  "_intializeClient:forRemoteControlChannel:authCallback:completion:",  v26,  v19,  v39,  v37);
}

- (id)_createDiscoveryChannelForIDSConnection:(id)a3 deviceInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003FDCF0 != -1) {
    dispatch_once(&qword_1003FDCF0, &stru_10039C080);
  }
  id v8 = objc_alloc(&OBJC_CLASS___MRDIDSTransportConnection);
  id v9 = -[MRDIDSTransportConnection initWithConnection:type:destination:session:]( v8,  "initWithConnection:type:destination:session:",  v6,  MRIDSServiceMessageTypeDiscovery,  0LL,  0LL);
  id v10 = objc_alloc(&OBJC_CLASS___MRDIDSServerClientConnection);
  id v11 = -[MRDIDSServerClientConnection initWithConnection:queue:](v10, "initWithConnection:queue:", v9, qword_1003FDCE8);
  -[MRDIDSServerClientConnection setDeviceInfo:](v11, "setDeviceInfo:", v7);
  id v12 = [[MRSupportedProtocolMessages alloc] initWithAllSupportedMessages];
  -[MRDIDSServerClientConnection setSupportedMessages:](v11, "setSupportedMessages:", v12);

  -[MRDIDSServerClientConnection setDelegate:](v11, "setDelegate:", self);
  id v13 = objc_alloc_init(&OBJC_CLASS___MRDIDSRemoteControlServiceDiscoveryChannel);
  -[MRDIDSRemoteControlServiceDiscoveryChannel setTransport:](v13, "setTransport:", v9);
  -[MRDIDSRemoteControlServiceDiscoveryChannel setClient:](v13, "setClient:", v11);
  uint64_t v15 = _MRLogForCategory(9LL, v14);
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v13;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSRemoteControlService] Created new DiscoveryChannel %@ for device=%@",  (uint8_t *)&v18,  0x16u);
  }

  return v13;
}

- (id)_createRemoteControlChannelForIDSConnection:(id)a3 deviceInfo:(id)a4 destination:(id)a5 session:(id)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v39 = a7;
  v37 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceUID]);
  id v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_remoteControlChannels,  "objectForKeyedSubscript:",  v16));
  [v38 removeChannelForDestination:v14];
  uint64_t v17 = objc_alloc(&OBJC_CLASS___MRDIDSTransportConnection);
  int v18 = -[MRDIDSTransportConnection initWithConnection:type:destination:session:]( v17,  "initWithConnection:type:destination:session:",  v12,  MRIDSServiceMessageTypeRemoteControl,  v14,  v15);
  id v19 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"IDSRemoteControlChannel-<%@/%@>",  v14,  v15);
  -[MRDIDSTransportConnection setLabel:](v18, "setLabel:", v19);

  __int16 v20 = (void *)IDSCopyLocalDeviceUniqueID();
  else {
    id v21 = v14;
  }
  -[MRDIDSTransportConnection setDestinationOutputDeviceUID:](v18, "setDestinationOutputDeviceUID:", v21);

  -[MRDIDSTransportConnection setConnectUserInfo:](v18, "setConnectUserInfo:", v39);
  v22 = objc_alloc_init(&OBJC_CLASS___MRDIDSRemoteControlServiceRemoteControlChannel);
  -[MRDIDSRemoteControlServiceRemoteControlChannel setDestination:](v22, "setDestination:", v14);
  -[MRDIDSRemoteControlServiceRemoteControlChannel setSession:](v22, "setSession:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MRDIDSRemoteControlServiceRemoteControlChannel setConnectionAttemptDate:](v22, "setConnectionAttemptDate:", v23);

  -[MRDIDSRemoteControlServiceRemoteControlChannel setTransport:](v22, "setTransport:", v18);
  objc_initWeak(&location, self);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MRDIDSRemoteControlServiceRemoteControlChannel transport](v22, "transport"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10005F2E8;
  v40[3] = &unk_10039B158;
  objc_copyWeak(&v45, &location);
  id v26 = v16;
  id v41 = v26;
  id v27 = v14;
  id v42 = v27;
  id v28 = v15;
  id v43 = v28;
  id v29 = v12;
  id v44 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue( [v24 addObserverForName:@"MRDMediaRemoteExternalDeviceServerClientInvalidatedNotification" object:v25 queue:0 usingBlock:v40]);
  -[MRDIDSRemoteControlServiceRemoteControlChannel setNotificationToken:](v22, "setNotificationToken:", v30);

  uint64_t v32 = _MRLogForCategory(9LL, v31);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v48 = v22;
    __int16 v49 = 2112;
    v50 = v37;
    __int16 v51 = 2112;
    id v52 = v27;
    __int16 v53 = 2112;
    id v54 = v28;
    __int16 v55 = 2112;
    id v56 = v39;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "[MRDIDSRemoteControlService] Created new RemoteControlChannel %@ for device=%@ destination=%@ session=%@ with userInfo=%@",  buf,  0x34u);
  }

  v34 = v44;
  v35 = v22;

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

  return v35;
}

- (void)_intializeClient:(id)a3 forRemoteControlChannel:(id)a4 authCallback:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10005F5C4;
  v18[3] = &unk_10039C0F8;
  id v19 = v11;
  id v20 = v10;
  char v24 = [v10 connectOptions] & 1;
  id v21 = self;
  id v22 = v13;
  id v23 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  [v15 requestDestinationEndpoint:v18];
}

- (void)_onWorkerQueue_sendEndpoint:(id)a3 toClient:(id)a4 options:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  if ([v7 discoveryMode])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 connection]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 exportEndpoint:v15]);

    if (v10)
    {
      id v11 = objc_alloc(&OBJC_CLASS___MRDiscoveryUpdateOutputDevicesMessage);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 outputDevices]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 configuration]);
      id v14 = [v11 initWithOutputDevices:v12 configuration:v13];

      [v14 setTransportOptions:v8];
      [v7 sendMessage:v14];
    }
  }
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
  v16[2] = sub_10005FAA4;
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

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (MRDIDSRemoteControlServiceDelegate)delegate
{
  return (MRDIDSRemoteControlServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
}

- (MRDIDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
}

- (NSMutableDictionary)discoveryChannels
{
  return self->_discoveryChannels;
}

- (void)setDiscoveryChannels:(id)a3
{
}

- (NSMutableDictionary)remoteControlChannels
{
  return self->_remoteControlChannels;
}

- (void)setRemoteControlChannels:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
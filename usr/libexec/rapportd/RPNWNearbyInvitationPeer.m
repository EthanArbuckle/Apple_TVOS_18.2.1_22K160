@interface RPNWNearbyInvitationPeer
+ (const)responseCodeToString:(int)a3;
+ (const)statusCodeToString:(int)a3;
+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5;
+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5;
- (BOOL)findNearbyInvitationListenerAndCreateConnection:(id)a3 applicationService:(id)a4 listenerID:(id)a5 connectionID:(id)a6 agentClient:(id)a7;
- (RPNWNearbyInvitationPeer)init;
- (RPNearbyInvitationDevice)destinationDevice;
- (RPNearbyInvitationDiscovery)nearbyInvitationDiscovery;
- (RPNearbyInvitationServer)nearbyInvitationServer;
- (RPNearbyInvitationSession)nearbyInvitationSession;
- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7 connectHandler:(id)a8 disconnectHandler:(id)a9;
- (void)dealloc;
- (void)handleConnectionData:(BOOL)a3;
- (void)handleConnectionRequest:(id)a3 agentClient:(id)a4;
- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4;
- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4;
- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6;
- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6;
- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 listenerID:(id)a7 connectionID:(id)a8 responseHandler:(id)a9;
- (void)setDestinationDevice:(id)a3;
- (void)setNearbyInvitationDiscovery:(id)a3;
- (void)setNearbyInvitationServer:(id)a3;
- (void)setNearbyInvitationSession:(id)a3;
- (void)startDiscovery:(id)a3 foundHandler:(id)a4 updateHandler:(id)a5 lostHandler:(id)a6 invalidationHandler:(id)a7;
- (void)startServer:(id)a3 withCompletion:(id)a4 disconnectHandler:(id)a5;
- (void)stopDiscovery;
- (void)stopServer;
@end

@implementation RPNWNearbyInvitationPeer

- (RPNWNearbyInvitationPeer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationPeer;
  v2 = -[RPNWNearbyInvitationPeer init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationPeer;
  -[RPNWNearbyInvitationPeer dealloc](&v2, "dealloc");
}

- (void)startDiscovery:(id)a3 foundHandler:(id)a4 updateHandler:(id)a5 lostHandler:(id)a6 invalidationHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_nearbyInvitationDiscovery)
  {
    if (dword_1001322F0 <= 90
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 90LL)))
    {
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]",  90LL,  "Failed to start RPNearbyInvitationDiscovery while existing discovery running.");
    }
  }

  else
  {
    if (dword_1001322F0 <= 30
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL)))
    {
      v17 = self;
      v18 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v18, "appendFormat:", @"%p", v17);

      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]",  30LL,  "Starting RPNWNearbyInvitationPeer[%@] discovery",  v18);
    }

    v19 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationDiscovery);
    nearbyInvitationDiscovery = self->_nearbyInvitationDiscovery;
    self->_nearbyInvitationDiscovery = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dispatchQueue]);
    -[RPNearbyInvitationDiscovery setDispatchQueue:](self->_nearbyInvitationDiscovery, "setDispatchQueue:", v22);

    -[RPNearbyInvitationDiscovery setDiscoveryFlags:](self->_nearbyInvitationDiscovery, "setDiscoveryFlags:", 1LL);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10006CCD0;
    v31[3] = &unk_100113618;
    id v32 = v13;
    -[RPNearbyInvitationDiscovery setDeviceFoundHandler:]( self->_nearbyInvitationDiscovery,  "setDeviceFoundHandler:",  v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10006CCDC;
    v29[3] = &unk_100113640;
    id v30 = v14;
    -[RPNearbyInvitationDiscovery setDeviceChangedHandler:]( self->_nearbyInvitationDiscovery,  "setDeviceChangedHandler:",  v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10006CCF0;
    v27[3] = &unk_100113618;
    id v28 = v15;
    -[RPNearbyInvitationDiscovery setDeviceLostHandler:](self->_nearbyInvitationDiscovery, "setDeviceLostHandler:", v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10006CCFC;
    v25[3] = &unk_100113668;
    id v26 = v16;
    -[RPNearbyInvitationDiscovery setInvalidationHandler:]( self->_nearbyInvitationDiscovery,  "setInvalidationHandler:",  v25);
    v23 = self->_nearbyInvitationDiscovery;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10006CD08;
    v24[3] = &unk_1001118A0;
    v24[4] = self;
    -[RPNearbyInvitationDiscovery activateWithCompletion:](v23, "activateWithCompletion:", v24);
  }
}

- (void)stopDiscovery
{
  if (!self->_nearbyInvitationDiscovery)
  {
    if (dword_1001322F0 <= 30
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL)))
    {
      v3 = self;
      v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer stopDiscovery]",  30LL,  "Stopping RPNWNearbyInvitationPeer[%@] discovery",  v4);
    }

    -[RPNearbyInvitationDiscovery invalidate](self->_nearbyInvitationDiscovery, "invalidate");
  }

- (void)startServer:(id)a3 withCompletion:(id)a4 disconnectHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_nearbyInvitationServer)
  {
    if (dword_1001322F0 <= 90
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 90LL)))
    {
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]",  90LL,  "Server: Failed to start server while one already active.\n");
    }
  }

  else
  {
    v11 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationServer);
    nearbyInvitationServer = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = v11;

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationService]);
    -[RPNearbyInvitationServer setServiceType:](self->_nearbyInvitationServer, "setServiceType:", v13);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10006D08C;
    v19[3] = &unk_1001136B8;
    v19[4] = self;
    id v21 = v10;
    id v20 = v8;
    -[RPNearbyInvitationServer setSessionStartHandler:](self->_nearbyInvitationServer, "setSessionStartHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10006D3F0;
    v18[3] = &unk_1001136E0;
    v18[4] = self;
    -[RPNearbyInvitationServer setSessionEndedHandler:](self->_nearbyInvitationServer, "setSessionEndedHandler:", v18);
    -[RPNearbyInvitationServer setInvalidationHandler:]( self->_nearbyInvitationServer,  "setInvalidationHandler:",  &stru_100113700);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10006D508;
    v17[3] = &unk_1001110A8;
    v17[4] = self;
    -[RPNearbyInvitationServer setInterruptionHandler:](self->_nearbyInvitationServer, "setInterruptionHandler:", v17);
    id v14 = self->_nearbyInvitationServer;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006D5A0;
    v15[3] = &unk_100113728;
    v15[4] = self;
    id v16 = v9;
    -[RPNearbyInvitationServer activateWithCompletion:](v14, "activateWithCompletion:", v15);
  }
}

- (void)stopServer
{
  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    -[RPNearbyInvitationServer invalidate](nearbyInvitationServer, "invalidate");
    v4 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0LL;
  }

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7 connectHandler:(id)a8 disconnectHandler:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v13 && !self->_nearbyInvitationSession)
  {
    if (dword_1001322F0 <= 90
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 90LL)))
    {
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHan dler:disconnectHandler:]",  90LL,  "Connect called for incoming connection without an existing NearbyInvitationSession.");
    }

    (*((void (**)(id, void, void))v19 + 2))(v19, 0LL, 0LL);
  }

  else
  {
    if (dword_1001322F0 <= 30
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL)))
    {
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer connectToPeer:inboundConnection:applicationService:listenerID:connectionID:connectHan dler:disconnectHandler:]",  30LL,  "Client: Connecting to peer device '%@'",  v15);
    }

    id v21 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationSession);
    nearbyInvitationSession = self->_nearbyInvitationSession;
    self->_nearbyInvitationSession = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dispatchQueue]);
    -[RPNearbyInvitationSession setDispatchQueue:](self->_nearbyInvitationSession, "setDispatchQueue:", v24);

    -[RPNearbyInvitationSession setDestinationDevice:](self->_nearbyInvitationSession, "setDestinationDevice:", v15);
    v25 = self->_nearbyInvitationSession;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10006D974;
    v26[3] = &unk_100113778;
    id v27 = v15;
    id v32 = v19;
    id v28 = self;
    id v33 = v20;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    -[RPNearbyInvitationSession activateWithCompletion:](v25, "activateWithCompletion:", v26);
  }
}

- (BOOL)findNearbyInvitationListenerAndCreateConnection:(id)a3 applicationService:(id)a4 listenerID:(id)a5 connectionID:(id)a6 agentClient:(id)a7
{
  id v10 = a7;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc(&OBJC_CLASS___RPNWNearbyInvitationConnection);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 destinationDevice]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v17 = -[RPNWNearbyInvitationConnection initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:]( v14,  "initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:",  v15,  v13,  1LL,  1LL,  v12,  v11,  v16);

  [v10 setNearbyInvitationConnection:v17];
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 nearbyInvitationConnection]);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "listen_framer"));
    +[RPNWFramer startConnection:](&OBJC_CLASS___RPNWFramer, "startConnection:", v19);

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 nearbyInvitationConnection]);
    [v20 setIsConnected:1];
  }

  return v18 != 0LL;
}

- (void)handleConnectionData:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006DF5C;
  v3[3] = &unk_100113798;
  BOOL v4 = a3;
  -[RPNWNearbyInvitationPeer receiveDataForConnection:statusHandler:]( self,  "receiveDataForConnection:statusHandler:",  v3,  &stru_1001137D8);
}

- (void)handleConnectionRequest:(id)a3 agentClient:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006E304;
  v7[3] = &unk_100113800;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]( v8,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.nearbyinvitation.connection",  v7);
}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___RPNWNearbyInvitationEndpoint);
  -[RPNWNearbyInvitationEndpoint setEndpointUUID:](v11, "setEndpointUUID:", v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 createNWEndpointForEndpoint:v11 agentID:v9 applicationService:v8]);
  return v12;
}

+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 UTF8String];
  v26[0] = 0LL;
  v26[1] = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  [v10 getUUIDBytes:v26];

  application_service = (void *)nw_endpoint_create_application_service(v9, v26);
  if (v8)
  {
    v25[0] = 0LL;
    v25[1] = 0LL;
    [v8 getUUIDBytes:v25];
    nw_endpoint_set_agent_identifier(application_service, v25);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 model]);

    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v16 = objc_claimAutoreleasedReturnValue([v15 model]);
      nw_endpoint_set_device_model(application_service, [v16 UTF8String]);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);

    if (v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v20 = objc_claimAutoreleasedReturnValue([v19 identifier]);
      nw_endpoint_set_device_id(application_service, [v20 UTF8String]);
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    unsigned int v22 = [v21 deviceColor];

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      nw_endpoint_set_device_color(application_service, [v23 deviceColor]);
    }
  }

  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  else {
    return (&off_1001138C0)[a3];
  }
}

+ (const)statusCodeToString:(int)a3
{
  else {
    return (&off_1001138E0)[a3 - 1];
  }
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_nearbyInvitationSession)
  {
    if (dword_1001322F0 <= 30
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL)))
    {
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]",  30LL,  "Registering RX DATA: requestID=%@",  v6);
    }

    nearbyInvitationSession = self->_nearbyInvitationSession;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006E834;
    v9[3] = &unk_100113828;
    id v10 = v6;
    id v11 = v7;
    -[RPNearbyInvitationSession registerRequestID:options:handler:]( nearbyInvitationSession,  "registerRequestID:options:handler:",  v10,  0LL,  v9);
  }

  else if (dword_1001322F0 <= 90 {
         && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 90LL)))
  }
  {
    LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]",  90LL,  "Error registering RX DATA: requestID=%@, no active NearbyInvitationSession",  v6);
  }
}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 listenerID:(id)a7 connectionID:(id)a8 responseHandler:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = v20;
  if (self->_nearbyInvitationSession)
  {
    id v33 = v20;
    unsigned int v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  &off_10011B1C8,  @"version");
    if (v16)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v16, @"request");
      -[NSMutableString appendFormat:](v23, "appendFormat:", @" data=%zu bytes", [v16 length]);
    }

    else if ((_DWORD)v12)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, @"status");
      -[NSMutableString appendFormat:]( v23,  "appendFormat:",  @" status=%s",  +[RPNWNearbyInvitationPeer statusCodeToString:]( &OBJC_CLASS___RPNWNearbyInvitationPeer,  "statusCodeToString:",  v12));
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v17,  @"applicationService");
    if (v18)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v25, @"listenerID");

      -[NSMutableString appendFormat:](v23, "appendFormat:", @" listenerID=%@", v18);
    }

    if (v19)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v26,  @"connectionID");

      -[NSMutableString appendFormat:](v23, "appendFormat:", @" connectionID=%@", v19);
    }

    id v32 = v18;
    id v34 = v16;
    if (dword_1001322F0 <= 30
      && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL)))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationPeer destinationDevice](self, "destinationDevice"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
      LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]",  30LL,  "TX REQ to '%@': requestID=%@ appSvc=%@%@\n",  v28,  v15,  v17,  v23);
    }

    nearbyInvitationSession = self->_nearbyInvitationSession;
    v39 = @"timeoutSeconds";
    v40 = &off_10011B030;
    id v30 = v15;
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10006F07C;
    v35[3] = &unk_100113850;
    v35[4] = self;
    id v36 = v30;
    id v37 = v17;
    id v21 = v33;
    id v38 = v33;
    -[RPNearbyInvitationSession sendRequestID:request:destinationID:options:responseHandler:]( nearbyInvitationSession,  "sendRequestID:request:destinationID:options:responseHandler:",  v36,  v22,  @"rapport:rdid:DirectPeer",  v31,  v35);

    id v15 = v30;
    id v16 = v34;
    id v18 = v32;
  }

  else if (dword_1001322F0 <= 90 {
         && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 90LL)))
  }
  {
    LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]",  90LL,  "Error sending: requestID=%@, no active NearbyInvitationSession",  v15);
  }
}

- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006F390;
  v8[3] = &unk_100113878;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[RPNWNearbyInvitationPeer receiveWithRequestID:receiveHandler:]( self,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.nearbyinvitation.data",  v8);
}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_1001322F0 <= 30 && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL))) {
    LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer sendDataForConnection:applicationService:connectionID:responseHandler:]",  30LL,  "Calling send data for NearbyInvitation flow with data: %@",  v10);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10006F6AC;
  v15[3] = &unk_1001138A0;
  id v16 = v13;
  id v14 = v13;
  -[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]( self,  "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:",  @"com.apple.oneapi.nearbyinvitation.data",  v10,  0LL,  v11,  0LL,  v12,  v15);
}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_1001322F0 <= 30 && (dword_1001322F0 != -1 || _LogCategory_Initialize(&dword_1001322F0, 30LL))) {
    LogPrintF( &dword_1001322F0,  "-[RPNWNearbyInvitationPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]",  30LL,  "Sending status %s for connection %@",  +[RPNWNearbyInvitationPeer statusCodeToString:](&OBJC_CLASS___RPNWNearbyInvitationPeer, "statusCodeToString:", v7),  v11);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10006F7EC;
  v14[3] = &unk_1001138A0;
  id v15 = v12;
  id v13 = v12;
  -[RPNWNearbyInvitationPeer sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:]( self,  "sendWithRequestID:data:status:applicationService:listenerID:connectionID:responseHandler:",  @"com.apple.oneapi.nearbyinvitation.data",  0LL,  v7,  v10,  0LL,  v11,  v14);
}

- (RPNearbyInvitationDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
}

- (RPNearbyInvitationDiscovery)nearbyInvitationDiscovery
{
  return self->_nearbyInvitationDiscovery;
}

- (void)setNearbyInvitationDiscovery:(id)a3
{
}

- (RPNearbyInvitationServer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
}

- (RPNearbyInvitationSession)nearbyInvitationSession
{
  return self->_nearbyInvitationSession;
}

- (void)setNearbyInvitationSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
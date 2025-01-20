@interface RPNWPeer
+ (const)responseCodeToString:(int)a3;
+ (const)statusCodeToString:(int)a3;
+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5;
+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5;
- (RPNWPeer)init;
- (int)findListenerAndCreateConnection:(id)a3 version:(id)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7;
- (int64_t)_rssiThresholdForApplicationService:(id)a3;
- (void)connectToOneAPIPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9;
- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 controlFlags:(unint64_t)a5 applicationService:(id)a6 listenerID:(id)a7 automapListener:(BOOL)a8 connectionID:(id)a9 connectHandler:(id)a10 lostHandler:(id)a11;
- (void)dealloc;
- (void)handleConnectionData:(BOOL)a3;
- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4;
- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4;
- (void)resolvePeer:(id)a3 controlFlags:(unint64_t)a4 applicationService:(id)a5 clientPublicKey:(id)a6 resolveHandler:(id)a7;
- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6;
- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6;
- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 clientPublicKey:(id)a7 listenerID:(id)a8 automapListener:(BOOL)a9 connectionID:(id)a10 responseHandler:(id)a11;
- (void)startDiscovery:(unsigned int)a3 applicationService:(id)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 connectedHandler:(id)a7 updateHandler:(id)a8 lostHandler:(id)a9 invalidationHandler:(id)a10;
- (void)stopDiscovery;
@end

@implementation RPNWPeer

- (RPNWPeer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNWPeer;
  v2 = -[RPNWPeer init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWPeer;
  -[RPNWPeer dealloc](&v2, "dealloc");
}

- (void)startDiscovery:(unsigned int)a3 applicationService:(id)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 connectedHandler:(id)a7 updateHandler:(id)a8 lostHandler:(id)a9 invalidationHandler:(id)a10
{
  id v15 = a4;
  id v34 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  p_info = &OBJC_METACLASS___RPNearFieldAuthenticationPayload.info;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
  {
    id v32 = v15;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    v22 = self;
    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v23, "appendFormat:", @"%p", v22);

    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___RPNearFieldAuthenticationPayload + 32);
    LogPrintF( &dword_100132848,  "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler: invalidationHandler:]",  30LL,  "%@ Starting RPNWPeer[%@] discovery",  v21,  v23);

    id v15 = v32;
  }

  -[RPNWPeer setControlFlags:](self, "setControlFlags:", a5);
  -[RPNWPeer setDeviceFilter:](self, "setDeviceFilter:", v34);
  -[RPNWPeer setRssiThreshold:]( self,  "setRssiThreshold:",  -[RPNWPeer _rssiThresholdForApplicationService:](self, "_rssiThresholdForApplicationService:", v15));
  int v24 = _os_feature_enabled_impl("Rapport", "nw_rescan_interval");
  if ((a5 & 0x10000) != 0 && v24)
  {
    -[RPNWPeer setBleScreenOffRescanInterval:](self, "setBleScreenOffRescanInterval:", 900LL);
LABEL_13:
    -[RPNWPeer setBleScreenOffScanRate:](self, "setBleScreenOffScanRate:", 10LL);
    goto LABEL_14;
  }

  if (dword_100132848 <= 10 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 10LL))) {
    LogPrintF( &dword_100132848,  "-[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler: invalidationHandler:]",  10LL,  "No rescan interval enabled");
  }
  if ((a5 & 0x10000) != 0) {
    goto LABEL_13;
  }
LABEL_14:
  v25 = (void *)objc_claimAutoreleasedReturnValue([p_info + 301 sharedNetworkAgent]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dispatchQueue]);
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v26);

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10007F184;
  v41[3] = &unk_100113EE0;
  unsigned int v44 = a3;
  id v42 = v16;
  unint64_t v43 = a5;
  id v27 = v16;
  -[RPNWPeer setDeviceFoundHandler:](self, "setDeviceFoundHandler:", v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10007F3E4;
  v39[3] = &unk_100113F08;
  id v40 = v17;
  id v28 = v17;
  -[RPNWPeer setDeviceChangedHandler:](self, "setDeviceChangedHandler:", v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10007F3F8;
  v37[3] = &unk_100113F30;
  id v38 = v18;
  id v29 = v18;
  -[RPNWPeer setDeviceLostHandler:](self, "setDeviceLostHandler:", v37);
  -[RPNWPeer setInvalidationHandler:](self, "setInvalidationHandler:", v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer invalidationHandler](self, "invalidationHandler"));
  -[RPNWPeer setInterruptionHandler:](self, "setInterruptionHandler:", v30);

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10007F404;
  v35[3] = &unk_100112CA8;
  id v36 = v19;
  id v31 = v19;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v35);
}

- (void)stopDiscovery
{
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
  {
    v3 = self;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

    LogPrintF(&dword_100132848, "-[RPNWPeer stopDiscovery]", 30LL, "Stopping RPNWPeer[%@] discovery", v4);
  }

  -[RPNWPeer invalidate](self, "invalidate");
}

- (void)resolvePeer:(id)a3 controlFlags:(unint64_t)a4 applicationService:(id)a5 clientPublicKey:(id)a6 resolveHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    LogPrintF( &dword_100132848,  "-[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:]",  30LL,  "%@ Resolving peer device '%@'",  v16,  v12);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 dispatchQueue]);
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v18);

  -[RPNWPeer setDestinationDevice:](self, "setDestinationDevice:", v12);
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", a4);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007F77C;
  v23[3] = &unk_100113F80;
  id v27 = v14;
  id v28 = v15;
  id v24 = v12;
  v25 = self;
  id v26 = v13;
  id v19 = v14;
  id v20 = v13;
  id v21 = v15;
  id v22 = v12;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v23);
}

- (void)connectToOneAPIPeer:(id)a3 inboundConnection:(BOOL)a4 applicationService:(id)a5 listenerID:(id)a6 automapListener:(BOOL)a7 connectionID:(id)a8 connectHandler:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = v19;
  if (v18 && v13)
  {
    (*((void (**)(id, uint64_t, void))v19 + 2))(v19, 2LL, 0LL);
  }

  else
  {
    if (v18) {
      id v21 = @"com.apple.oneapi.connection";
    }
    else {
      id v21 = @"com.apple.oneapi.browsing";
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10007FA80;
    v23[3] = &unk_100113FA8;
    id v24 = v15;
    id v25 = v20;
    LOBYTE(v22) = a7;
    -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:]( self,  "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:",  v21,  0LL,  0LL,  v16,  0LL,  v17,  v22,  v18,  v23);
  }
}

- (void)connectToPeer:(id)a3 inboundConnection:(BOOL)a4 controlFlags:(unint64_t)a5 applicationService:(id)a6 listenerID:(id)a7 automapListener:(BOOL)a8 connectionID:(id)a9 connectHandler:(id)a10 lostHandler:(id)a11
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    LogPrintF( &dword_100132848,  "-[RPNWPeer connectToPeer:inboundConnection:controlFlags:applicationService:listenerID:automapListener:connectionID :connectHandler:lostHandler:]",  30LL,  "%@ Connecting to peer device '%@'",  v21,  v15);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent sharedNetworkAgent](&OBJC_CLASS___RPNWNetworkAgent, "sharedNetworkAgent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dispatchQueue]);
  -[RPNWPeer setDispatchQueue:](self, "setDispatchQueue:", v23);

  -[RPNWPeer setDestinationDevice:](self, "setDestinationDevice:", v15);
  if (a5) {
    unint64_t v24 = a5;
  }
  else {
    unint64_t v24 = 32774LL;
  }
  -[RPNWPeer setControlFlags:](self, "setControlFlags:", v24);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10007FDB0;
  v33[3] = &unk_100113FD0;
  id v34 = v15;
  v35 = self;
  id v39 = v19;
  id v40 = v20;
  BOOL v41 = a4;
  id v36 = v16;
  id v37 = v17;
  BOOL v42 = a8;
  id v38 = v18;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v20;
  id v29 = v19;
  id v30 = v15;
  -[RPNWPeer activateWithCompletion:](self, "activateWithCompletion:", v33);
}

- (int)findListenerAndCreateConnection:(id)a3 version:(id)a4 applicationService:(id)a5 listenerID:(id)a6 connectionID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100132848 <= 40 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 40LL))) {
    LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  40LL,  "Received request for appSvc='%@' from '%@'",  v13,  v11);
  }
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWListener findListenerForID:applicationService:fromPeer:]( &OBJC_CLASS___RPNWListener,  "findListenerForID:applicationService:fromPeer:",  v14,  v13,  v11));
  id v17 = v16;
  if (v16)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 getConnectionWithID:v15]);
    if (v18)
    {
      id v19 = (RPNWConnection *)v18;
      if (dword_100132848 <= 40
        && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 40LL)))
      {
        LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  40LL,  "Found RPNWConnection[%@] on listener\n",  v19,  v33);
      }
    }

    else
    {
      id v20 = objc_alloc(&OBJC_CLASS___RPNWConnection);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      id v19 = -[RPNWConnection initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:]( v20,  "initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:",  v11,  v12,  1LL,  1LL,  v13,  v15,  v21);

      [v17 addIncomingConnection:v19];
      if (dword_100132848 <= 30
        && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
      {
        LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "Created incoming RPNWConnection[%@] and attached to listener %@",  v19,  v17);
      }
    }

    memset(buffer, 0, 96);
    if (proc_pidinfo((int)[v17 pid], 4, 0, buffer, 96) == 96)
    {
      if (dword_100132848 <= 30
        && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
      {
        LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30,  "Succeeded accessing client app PID (%d)",  [v17 pid]);
      }

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v17 agentClient]);
      if (v23)
      {
        unint64_t v24 = (void *)v23;
        if (dword_100132848 <= 30
          && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
        {
          LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "Listener mapping has listener agent client, starting connection");
        }

        -[RPNWConnection setIsConnected:](v19, "setIsConnected:", 1LL);
        if ([v17 hasTriggeredConnection])
        {
          if (dword_100132848 <= 30
            && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
          {
            LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "Already have outstanding triggered connection, not triggering this connection");
          }
        }

        else
        {
          id v25 = v12;
          if (dword_100132848 <= 30
            && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
          {
            LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "No outstanding triggered connection, triggering this connection");
          }

          id v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "listen_framer"));
          +[RPNWFramer startConnection:](&OBJC_CLASS___RPNWFramer, "startConnection:", v30);

          [v17 markConnectionAsTriggered:v19];
          id v12 = v25;
        }

        [v12 doubleValue];
        if (v31 >= 2.0) {
          int v22 = 1;
        }
        else {
          int v22 = 2;
        }
      }

      else
      {
        id v36 = v12;
        if (dword_100132848 <= 30
          && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
        {
          LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "Listener mapping has no listener agent client");
        }

        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v19, "peer"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v19, "peer"));
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v35 destinationDevice]);
        unsigned int v34 = -[RPNWConnection inbound](v19, "inbound");
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](v19, "endpointUUID"));
        id v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](v19, "connectionUUID"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_1000806E8;
        v37[3] = &unk_100113FF8;
        id v38 = v19;
        [v26 connectToPeer:v27 inboundConnection:v34 controlFlags:0 applicationService:v13 listenerID:v28 automapListener:0 connectionID:v29 connec tHandler:v37 lostHandler:&stru_100114018];

        unint64_t v24 = 0LL;
        int v22 = 1;
        id v12 = v36;
      }
    }

    else
    {
      if (dword_100132848 <= 30
        && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
      {
        LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30,  "Failed to access client app PID info (%d)",  [v17 pid]);
      }

      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v17 agentClient]);
      if (dword_100132848 <= 30
        && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
      {
        LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  30LL,  "Agent client process no longer live, rejecting connection");
      }

      int v22 = 0;
    }
  }

  else
  {
    if (dword_100132848 <= 90
      && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 90LL)))
    {
      LogPrintF( &dword_100132848,  "-[RPNWPeer findListenerAndCreateConnection:version:applicationService:listenerID:connectionID:]",  90LL,  "Failed to find listener\n");
    }

    int v22 = 0;
  }

  return v22;
}

- (void)handleConnectionData:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100080860;
  v3[3] = &unk_100113798;
  BOOL v4 = a3;
  -[RPNWPeer receiveDataForConnection:statusHandler:]( self,  "receiveDataForConnection:statusHandler:",  v3,  &stru_100114038);
}

+ (id)createNWEndpointWithID:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(&OBJC_CLASS___RPNWEndpoint);
  -[RPNWEndpoint setEndpointUUID:](v11, "setEndpointUUID:", v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 createNWEndpointForEndpoint:v11 agentID:v9 applicationService:v8]);
  return v12;
}

+ (id)createNWEndpointForEndpoint:(id)a3 agentID:(id)a4 applicationService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 UTF8String];
  v67[0] = 0LL;
  v67[1] = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 endpointUUID]);
  [v11 getUUIDBytes:v67];

  application_service = (void *)nw_endpoint_create_application_service(v10, v67);
  if (v8)
  {
    v66[0] = 0LL;
    v66[1] = 0LL;
    [v8 getUUIDBytes:v66];
    nw_endpoint_set_agent_identifier(application_service, v66);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v17 = objc_claimAutoreleasedReturnValue([v16 name]);
      nw_endpoint_set_device_name(application_service, [v17 UTF8String]);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 contactID]);

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v21 = objc_claimAutoreleasedReturnValue([v20 contactID]);
      nw_endpoint_set_contact_id(application_service, [v21 UTF8String]);
    }

    int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 model]);

    if (v23)
    {
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v25 = objc_claimAutoreleasedReturnValue([v24 model]);
      nw_endpoint_set_device_model(application_service, [v25 UTF8String]);
    }

    id v26 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 idsDeviceIdentifier]);

    if (v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      id v29 = objc_claimAutoreleasedReturnValue([v28 idsDeviceIdentifier]);
      nw_endpoint_set_device_id(application_service, [v29 UTF8String]);
    }

    dictionary = nw_txt_record_create_dictionary();
    double v31 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v31 activityLevel]));
    id v33 = objc_claimAutoreleasedReturnValue([v32 stringValue]);
    unsigned int v34 = (const char *)[v33 cStringUsingEncoding:4];

    size_t v35 = strlen(v34);
    nw_txt_record_set_key(dictionary, "ActivityLevel", (const uint8_t *)v34, v35);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 idsDeviceIdentifier]);
    id v39 = [v36 featureFlagsForIdentityMatchingIDSDeviceIdentifier:v38];

    if (v39)
    {
      id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v39));
      id v41 = objc_claimAutoreleasedReturnValue([v40 stringValue]);
      BOOL v42 = (const char *)[v41 cStringUsingEncoding:4];

      size_t v43 = strlen(v42);
      nw_txt_record_set_key(dictionary, "FeatureFlags", (const uint8_t *)v42, v43);
    }

    unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    id v45 = [v44 statusFlags];

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v45));
      id v47 = objc_claimAutoreleasedReturnValue([v46 stringValue]);
      v48 = (const char *)[v47 cStringUsingEncoding:4];

      size_t v49 = strlen(v48);
      nw_txt_record_set_key(dictionary, "StatusFlags", (const uint8_t *)v48, v49);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
    v51 = v50;
    if (v50) {
      [v50 operatingSystemVersion];
    }
    else {
      memset(v65, 0, sizeof(v65));
    }
    id v52 = sub_10000A85C(v65);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

    if (v53)
    {
      v54 = (const char *)[v53 cStringUsingEncoding:4];
      if (v54)
      {
        v55 = (const uint8_t *)v54;
        size_t v56 = strlen(v54);
        nw_txt_record_set_key(dictionary, "OSVersion", v55, v56);
      }
    }

    if (v9)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue([v7 device]);
      v58 = (void *)objc_claimAutoreleasedReturnValue([v57 serviceTypes]);
      unsigned int v59 = [v58 containsObject:v9];

      if (v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
        id v61 = objc_claimAutoreleasedReturnValue([v60 stringValue]);
        v62 = (const char *)[v61 cStringUsingEncoding:4];

        size_t v63 = strlen(v62);
        nw_txt_record_set_key(dictionary, "HasService", (const uint8_t *)v62, v63);
      }
    }

    nw_endpoint_set_txt_record(application_service, dictionary);
  }

  return application_service;
}

+ (const)responseCodeToString:(int)a3
{
  else {
    return (&off_1001140A8)[a3];
  }
}

+ (const)statusCodeToString:(int)a3
{
  else {
    return (&off_1001140C8)[a3 - 1];
  }
}

- (void)receiveWithRequestID:(id)a3 receiveHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL))) {
    LogPrintF( &dword_100132848,  "-[RPNWPeer receiveWithRequestID:receiveHandler:]",  30LL,  "Registering RX DATA: requestID=%@",  v6);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000816DC;
  v10[3] = &unk_100113828;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[RPNWPeer registerRequestID:options:handler:](self, "registerRequestID:options:handler:", v9, 0LL, v10);
}

- (void)sendWithRequestID:(id)a3 data:(id)a4 status:(int)a5 applicationService:(id)a6 clientPublicKey:(id)a7 listenerID:(id)a8 automapListener:(BOOL)a9 connectionID:(id)a10 responseHandler:(id)a11
{
  uint64_t v14 = *(void *)&a5;
  id v33 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v32 = a11;
  id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v22 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  &off_10011B1D8,  @"version");
  if (v16)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v16, @"request");
    -[NSMutableString appendFormat:](v22, "appendFormat:", @" data=%zu bytes", [v16 length]);
  }

  else if ((_DWORD)v14)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, @"status");
    -[NSMutableString appendFormat:]( v22,  "appendFormat:",  @" status=%s",  +[RPNWPeer statusCodeToString:](&OBJC_CLASS___RPNWPeer, "statusCodeToString:", v14));
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v17,  @"applicationService");
  if (v18)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v18,  @"clientPublicKey");
    -[NSMutableString appendFormat:]( v22,  "appendFormat:",  @" clientPublicKey=%zu bytes",  [v18 length]);
  }

  if (v19)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v19, @"listenerID");
    -[NSMutableString appendFormat:](v22, "appendFormat:", @" listenerID=%@", v19);
  }

  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a9));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v21,  "setObject:forKeyedSubscript:",  v24,  @"automapListener");

  if (v20)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, @"connectionID");
    -[NSMutableString appendFormat:](v22, "appendFormat:", @" connectionID=%@", v20);
  }

  unsigned int v34 = v16;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL)))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer destinationDevice](self, "destinationDevice"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
    LogPrintF( &dword_100132848,  "-[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionI D:responseHandler:]",  30LL,  "%@ TX REQ to '%@': requestID=%@ appSvc=%@%@\n",  v25,  v27,  v33,  v17,  v22);
  }

  id v40 = @"timeoutSeconds";
  id v41 = &off_10011B060;
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000821A4;
  v36[3] = &unk_100113850;
  v36[4] = self;
  id v37 = v33;
  id v38 = v17;
  id v39 = v32;
  id v29 = v32;
  id v30 = v17;
  id v31 = v33;
  -[RPNWPeer sendRequestID:request:destinationID:options:responseHandler:]( self,  "sendRequestID:request:destinationID:options:responseHandler:",  v31,  v21,  @"rapport:rdid:DirectPeer",  v28,  v36);
}

- (void)receiveDataForConnection:(id)a3 statusHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10008251C;
  v8[3] = &unk_100114060;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[RPNWPeer receiveWithRequestID:receiveHandler:]( self,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.data",  v8);
}

- (void)sendDataForConnection:(id)a3 applicationService:(id)a4 connectionID:(id)a5 responseHandler:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000827F8;
  v12[3] = &unk_100114088;
  id v13 = a6;
  id v10 = v13;
  LOBYTE(v11) = 0;
  -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:]( self,  "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:",  @"com.apple.oneapi.data",  a3,  0LL,  a4,  0LL,  0LL,  v11,  a5,  v12);
}

- (void)sendStatusUpdateForConnection:(id)a3 connectionID:(id)a4 status:(int)a5 responseHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (dword_100132848 <= 30 && (dword_100132848 != -1 || _LogCategory_Initialize(&dword_100132848, 30LL))) {
    LogPrintF( &dword_100132848,  "-[RPNWPeer sendStatusUpdateForConnection:connectionID:status:responseHandler:]",  30LL,  "Sending status %s for connection %@",  +[RPNWPeer statusCodeToString:](&OBJC_CLASS___RPNWPeer, "statusCodeToString:", v7),  v11);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10008293C;
  v15[3] = &unk_100114088;
  id v16 = v12;
  id v13 = v12;
  LOBYTE(v14) = 0;
  -[RPNWPeer sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:]( self,  "sendWithRequestID:data:status:applicationService:clientPublicKey:listenerID:automapListener:connectionID:responseHandler:",  @"com.apple.oneapi.data",  0LL,  v7,  v10,  0LL,  0LL,  v14,  v11,  v15);
}

- (int64_t)_rssiThresholdForApplicationService:(id)a3
{
  else {
    return 0LL;
  }
}

@end
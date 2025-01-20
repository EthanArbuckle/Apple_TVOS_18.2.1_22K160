@interface RPNearbyInvitationXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4;
- (NSMutableDictionary)devices;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPConnection)netCnx;
- (RPNearbyInvitationDaemon)daemon;
- (RPNearbyInvitationDiscovery)activatedDiscovery;
- (RPNearbyInvitationServer)activatedServer;
- (RPNearbyInvitationSession)activatedSession;
- (RPNearbyInvitationXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (id)activateCompletionHandler;
- (unsigned)xpcID;
- (void)connectionInvalidated;
- (void)nearbyInvitationActivateDiscovery:(id)a3 completion:(id)a4;
- (void)nearbyInvitationActivateServer:(id)a3 completion:(id)a4;
- (void)nearbyInvitationActivateSession:(id)a3 completion:(id)a4;
- (void)nearbyInvitationInvalidateClientSession;
- (void)nearbyInvitationInvalidateSessionID:(id)a3;
- (void)nearbyInvitationSendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)nearbyInvitationSendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)reportLostDevice:(id)a3;
- (void)sessionActivatedWithError:(id)a3;
- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4;
- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setNetCnx:(id)a3;
- (void)setXpcID:(unsigned int)a3;
@end

@implementation RPNearbyInvitationXPCConnection

- (RPNearbyInvitationXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPNearbyInvitationXPCConnection;
  v9 = -[RPNearbyInvitationXPCConnection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
  }

  return v10;
}

- (void)connectionInvalidated
{
  if (dword_100131F70 <= 20 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 20LL))) {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  objc_super v12 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0LL;

  if (v12)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedDiscoverySet, "removeObject:", v12);
    -[RPNearbyInvitationDiscovery invalidate](v12, "invalidate");
  }

  v4 = self->_activatedServer;
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0LL;

  if (v4)
  {
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearbyInvitationServer serviceType](v4, "serviceType"));
    -[NSMutableDictionary removeObjectForKey:](activatedServerXPCCnxMap, "removeObjectForKey:", v7);

    -[RPNearbyInvitationServer invalidate](v4, "invalidate");
  }

  activatedSession = self->_activatedSession;
  if (activatedSession)
  {
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    v10 = activatedSession;
    -[NSMutableSet removeObject:](activatedSessionSet, "removeObject:", v10);
    -[RPNearbyInvitationSession invalidate](v10, "invalidate");
    v11 = self->_activatedSession;
    self->_activatedSession = 0LL;
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.NearbyInvitation"));
  unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

  if ((v7 & 1) != 0)
  {
    v14 = 0LL;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100131F70 <= 90
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 90LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection _entitledAndReturnError:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.rapport.NearbyInvitation");
    }

    id v15 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)@"com.apple.rapport.NearbyInvitation");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  id v16 = v14;
  *a3 = v16;

  return self->_entitled;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___RPNearbyInvitationDevice);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDeviceInfo]);
  if (v12) {
    -[RPNearbyInvitationDevice updateWithEndpoint:](v11, "updateWithEndpoint:", v12);
  }
  netCnx = self->_netCnx;
  self->_netCnx = (RPConnection *)v9;
  id v14 = v9;

  if (dword_100131F70 <= 30 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL))) {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection sessionStartWithID:netCnx:completion:]",  30LL,  "Server session started: %@ device:%@\n",  v8,  v11);
  }
  xpcCnx = self->_xpcCnx;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100059664;
  v18[3] = &unk_100112CA8;
  id v19 = v10;
  id v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  v18));
  [v17 nearbyInvitationStartServerSessionID:v8 device:v11 completion:v16];
}

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_activatedServer)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection sessionEndedWithID:netCnx:]",  30LL,  "Server session ended: %@\n",  v8);
    }

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    [v7 nearbyInvitationSessionEndedWithID:v8];
  }
}

- (void)sessionActivatedWithError:(id)a3
{
  id v6 = a3;
  -[RPNearbyInvitationSession setWaitingToConnect:](self->_activatedSession, "setWaitingToConnect:", 0LL);
  -[RPNearbyInvitationSession setFailedToConnect:](self->_activatedSession, "setFailedToConnect:", v6 != 0LL);
  activateCompletionHandler = (void (**)(id, id))self->_activateCompletionHandler;
  if (activateCompletionHandler)
  {
    activateCompletionHandler[2](activateCompletionHandler, v6);
    id v5 = self->_activateCompletionHandler;
    self->_activateCompletionHandler = 0LL;
  }
}

- (void)nearbyInvitationActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v19 = 0LL;
  BOOL v9 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v19);
  id v10 = v19;
  self->_entitled = v9;
  if (v9)
  {
    if (dword_100131F70 <= 30
      && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
    {
      LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateDiscovery:completion:]",  30LL,  "Activate discovery from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      id v14 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v12;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }

    -[NSMutableSet addObject:](activatedDiscoverySet, "addObject:", v7);
    if (v8) {
      v8[2](v8, v10);
    }
    -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
    discoveredDevices = self->_daemon->_discoveredDevices;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000599EC;
    v16[3] = &unk_100113058;
    id v17 = v7;
    v18 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v16);
  }

  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)nearbyInvitationActivateServer:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v33 = 0LL;
  unsigned __int8 v9 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v33);
  id v10 = v33;
  if ((v9 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);

    if (v11)
    {
      activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activatedServerXPCCnxMap, "objectForKey:", v19));

      if (v20)
      {
        if (v8)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
          id v28 = RPErrorF( 4294960575LL,  (uint64_t)"Server with service type %@ is already active",  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v8[2](v8, v29);
        }
      }

      else
      {
        if (dword_100131F70 <= 30
          && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
        {
          LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateServer:completion:]",  30LL,  "Activate server %@ from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
        }

        [v7 setDispatchQueue:self->_dispatchQueue];
        objc_storeStrong((id *)&self->_activatedServer, a3);
        -[RPNearbyInvitationDaemon _handleServerActivation:](self->_daemon, "_handleServerActivation:", self);
        if (v8) {
          v8[2](v8, v10);
        }
        -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
      }
    }

    else
    {
      id v30 = RPErrorF(4294896129LL, (uint64_t)"Missing service type for server\n", v12, v13, v14, v15, v16, v17, v32);
      uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

      if (v8) {
        v8[2](v8, (void *)v31);
      }
      id v10 = (id)v31;
    }
  }

  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)nearbyInvitationActivateSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x3032000000LL;
  v67 = sub_100059FD0;
  v68 = sub_100059FE0;
  id v69 = 0LL;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_100059FE8;
  v61[3] = &unk_100112140;
  v63 = &v64;
  id v9 = v8;
  id v62 = v9;
  id v10 = objc_retainBlock(v61);
  uint64_t v11 = (id *)(v65 + 5);
  id obj = (id)v65[5];
  unsigned __int8 v12 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v11, obj);
  if ((v12 & 1) != 0)
  {
    if (self->_activatedSession)
    {
      id v19 = RPErrorF(4294960575LL, (uint64_t)"Session already active", v13, v14, v15, v16, v17, v18, v59);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)v65[5];
      v65[5] = v20;
LABEL_19:

      goto LABEL_20;
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationDevice]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);

    if (v21)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue( -[RPNearbyInvitationDaemon _findMatchingDeviceWithIdentifier:]( self->_daemon,  "_findMatchingDeviceWithIdentifier:",  v21));
      v36 = v29;
      if (v29)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v29 identifier]);
        unsigned __int8 v38 = [v21 isEqualToString:v37];

        if ((v38 & 1) != 0)
        {
          [v7 setDaemonDevice:v36];
          if (dword_100131F70 <= 30
            && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL)))
          {
            uint64_t v45 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
            LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection nearbyInvitationActivateSession:completion:]",  30LL,  "Activate session from %#{pid} service type %@ to %@\n",  v45,  v46,  v36);
          }

          [v7 setWaitingToConnect:1];
          [v7 setDispatchQueue:self->_dispatchQueue];
          objc_storeStrong((id *)&self->_activatedSession, a3);
          id v53 = objc_retainBlock(v9);
          id activateCompletionHandler = self->_activateCompletionHandler;
          self->_id activateCompletionHandler = v53;

          activatedSessionSet = self->_daemon->_activatedSessionSet;
          if (!activatedSessionSet)
          {
            v56 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
            daemon = self->_daemon;
            v58 = daemon->_activatedSessionSet;
            daemon->_activatedSessionSet = v56;

            activatedSessionSet = self->_daemon->_activatedSessionSet;
          }

          -[NSMutableSet addObject:](activatedSessionSet, "addObject:", v7);
          -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
          goto LABEL_18;
        }

        id v51 = RPErrorF( 4294960548LL,  (uint64_t)"Destination device identifier did not match the cached device identifier",  v39,  v40,  v41,  v42,  v43,  v44,  v59);
        uint64_t v50 = objc_claimAutoreleasedReturnValue(v51);
      }

      else
      {
        id v49 = RPErrorF(4294960569LL, (uint64_t)"Destination device not found", v30, v31, v32, v33, v34, v35, v59);
        uint64_t v50 = objc_claimAutoreleasedReturnValue(v49);
      }

      v52 = (void *)v65[5];
      v65[5] = v50;
    }

    else
    {
      id v47 = RPErrorF(4294960591LL, (uint64_t)"No destination device", v23, v24, v25, v26, v27, v28, v59);
      uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);
      v36 = (void *)v65[5];
      v65[5] = v48;
    }

- (void)nearbyInvitationInvalidateClientSession
{
  if (dword_100131F70 <= 30 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL))) {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection nearbyInvitationInvalidateClientSession]",  30LL,  "Invalidate client session from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  if (self->_activatedSession)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
    v3 = self->_netCnx;
    -[RPConnection invalidate](v3, "invalidate");
    netCnx = self->_netCnx;
    self->_netCnx = 0LL;
  }

  -[RPNearbyInvitationDaemon _update](self->_daemon, "_update");
}

- (void)nearbyInvitationInvalidateSessionID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100131F70 <= 30 && (dword_100131F70 != -1 || _LogCategory_Initialize(&dword_100131F70, 30LL))) {
    LogPrintF( &dword_100131F70,  "-[RPNearbyInvitationXPCConnection nearbyInvitationInvalidateSessionID:]",  30LL,  "Invalidate session %@ from %#{pid}\n",  v4,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
}

- (void)nearbyInvitationSendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v27 = 0LL;
  unsigned __int8 v14 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  id v15 = v27;
  if ((v14 & 1) != 0)
  {
    uint64_t v16 = self->_netCnx;
    uint64_t v23 = v16;
    if (v16)
    {
      -[RPConnection sendEncryptedEventID:event:options:completion:]( v16,  "sendEncryptedEventID:event:options:completion:",  v10,  v11,  v12,  v13);
    }

    else if (v13)
    {
      id v24 = RPErrorF(4294960543LL, (uint64_t)"No connection", v17, v18, v19, v20, v21, v22, v26);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v13[2](v13, v25);
    }
  }

  else if (v13)
  {
    v13[2](v13, v15);
  }
}

- (void)nearbyInvitationSendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = 0LL;
  unsigned __int8 v14 = -[RPNearbyInvitationXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  id v21 = v26;
  if ((v14 & 1) != 0)
  {
    netCnx = self->_netCnx;
    if (netCnx)
    {
      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:]( netCnx,  "sendEncryptedRequestID:request:xpcID:options:responseHandler:",  v10,  v11,  self->_xpcID,  v12,  v13);
    }

    else
    {
      id v23 = RPErrorF(4294960543LL, (uint64_t)"No connection", v15, v16, v17, v18, v19, v20, v25);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v24);
    }
  }

  else
  {
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0LL, 0LL, v21);
  }
}

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (!v7)
  {
    if (a4)
    {
      BOOL v14 = 0;
      uint64_t v15 = @"missingDeviceIdentifier";
LABEL_11:
      *a4 = v15;
      goto LABEL_15;
    }

- (void)reportLostDevice:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0LL, v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v6 nearbyInvitationLostDevice:v7];
    }
  }
}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
    if (-[RPNearbyInvitationDiscovery shouldReportDevice:]( self->_activatedDiscovery,  "shouldReportDevice:",  v13))
    {
      devices = self->_devices;
      if (v7)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v13, v6);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v9 nearbyInvitationChangedDevice:v13 changes:v4];
      }

      else
      {
        id v10 = v13;
        if (!devices)
        {
          id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          id v12 = self->_devices;
          self->_devices = v11;

          id v10 = v13;
          devices = self->_devices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v6);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v9 nearbyInvitationFoundDevice:v13];
      }
    }

    else
    {
      if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0LL, v6);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v9 nearbyInvitationLostDevice:v13];
    }

    goto LABEL_11;
  }

- (id)activateCompletionHandler
{
  return self->_activateCompletionHandler;
}

- (RPNearbyInvitationDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPNearbyInvitationServer)activatedServer
{
  return self->_activatedServer;
}

- (RPNearbyInvitationSession)activatedSession
{
  return self->_activatedSession;
}

- (RPNearbyInvitationDaemon)daemon
{
  return self->_daemon;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (void)setNetCnx:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (unsigned)xpcID
{
  return self->_xpcID;
}

- (void)setXpcID:(unsigned int)a3
{
  self->_xpcID = a3;
}

- (void).cxx_destruct
{
}

@end
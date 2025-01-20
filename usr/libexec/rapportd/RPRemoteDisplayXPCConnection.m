@interface RPRemoteDisplayXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BOOL)netConnectionStartWithDevice:(id)a3 session:(id)a4 error:(id *)a5;
- (BOOL)usingNearbyActionV2;
- (NSMutableSet)serverNetCnxs;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPConnection)activeNetCnx;
- (RPConnection)clientNetCnx;
- (RPRemoteDisplayDaemon)daemon;
- (RPRemoteDisplayDiscovery)activatedDiscovery;
- (RPRemoteDisplayServer)activatedServer;
- (RPRemoteDisplaySession)activatedSession;
- (RPRemoteDisplayXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (unsigned)xpcID;
- (void)_authCompletion:(id)a3;
- (void)_promptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)connectionInvalidated;
- (void)hidePasswordWithFlags:(unsigned int)a3;
- (void)remoteDisplayActivateDiscovery:(id)a3 completion:(id)a4;
- (void)remoteDisplayActivateServer:(id)a3 completion:(id)a4;
- (void)remoteDisplayActivateSession:(id)a3 completion:(id)a4;
- (void)remoteDisplayChangeDedicatedDevice:(id)a3;
- (void)remoteDisplayChangeDiscoverySessionStateForDevice:(id)a3 reason:(id)a4;
- (void)remoteDisplayDedicatedDeviceConfirmationWithCompletion:(id)a3;
- (void)remoteDisplayInvalidateClientSession;
- (void)remoteDisplayInvalidateSessionID:(id)a3;
- (void)remoteDisplayPersonCanceled:(id)a3;
- (void)remoteDisplayPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4;
- (void)remoteDisplaySendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)remoteDisplaySendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)remoteDisplayStartPairingServerWithCompletion:(id)a3;
- (void)remoteDisplayStopPairingServer;
- (void)remoteDisplayTryPassword:(id)a3;
- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4;
- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5;
- (void)setActiveNetCnx:(id)a3;
- (void)setClientNetCnx:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setServerNetCnxs:(id)a3;
- (void)setUsingNearbyActionV2:(BOOL)a3;
- (void)setXpcID:(unsigned int)a3;
- (void)showPassword:(id)a3 flags:(unsigned int)a4;
- (void)updateErrorFlags:(unint64_t)a3;
@end

@implementation RPRemoteDisplayXPCConnection

- (RPRemoteDisplayXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___RPRemoteDisplayXPCConnection;
  v9 = -[RPRemoteDisplayXPCConnection init](&v12, "init");
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
  if (dword_100132BB0 <= 20 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 20LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection connectionInvalidated]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  tcpServerConnections = self->_daemon->_tcpServerConnections;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000A6814;
  v22[3] = &unk_100114AA0;
  v22[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( tcpServerConnections,  "enumerateKeysAndObjectsUsingBlock:",  v22);
  v4 = self->_activatedDiscovery;
  activatedDiscovery = self->_activatedDiscovery;
  self->_activatedDiscovery = 0LL;

  if (v4)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedDiscoverySet, "removeObject:", v4);
    -[RPRemoteDisplayDiscovery invalidate](v4, "invalidate");
  }

  -[RPRemoteDisplayServer invalidate](self->_activatedServer, "invalidate");
  activatedServer = self->_activatedServer;
  self->_activatedServer = 0LL;

  id v7 = self->_activatedSession;
  activatedSession = self->_activatedSession;
  self->_activatedSession = 0LL;

  if (v7)
  {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:", v7);
    -[RPRemoteDisplaySession invalidate](v7, "invalidate");
  }

  activeNetCnx = self->_activeNetCnx;
  self->_activeNetCnx = 0LL;

  -[RPConnection invalidate](self->_clientNetCnx, "invalidate");
  clientNetCnx = self->_clientNetCnx;
  self->_clientNetCnx = 0LL;

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v11 = self->_serverNetCnxs;
  id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * (void)i) invalidate];
      }

      id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v13);
  }

  -[NSMutableSet removeAllObjects](self->_serverNetCnxs, "removeAllObjects");
  serverNetCnxs = self->_serverNetCnxs;
  self->_serverNetCnxs = 0LL;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0LL;
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.RemoteDisplay"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100132BB0 <= 90
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection _entitledAndReturnError:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay");
    }

    if (a3)
    {
      id v14 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)@"com.apple.RemoteDisplay");
      id v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      BOOL result = 0;
      *a3 = v15;
    }

    else
    {
      return 0;
    }
  }

  return result;
}

- (BOOL)netConnectionStartWithDevice:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bonjourDevice]);
  if (!v10)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 bonjourDevice]);
    if (!v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);

      if (!v11)
      {
        if (a5)
        {
          id v37 = RPErrorF( 4294960569LL,  (uint64_t)"Bonjour device or address not found",  v12,  v13,  v14,  v15,  v16,  v17,  v38);
          BOOL v35 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue(v37);
        }

        else
        {
          BOOL v35 = 0;
        }

        goto LABEL_19;
      }

      uint64_t v10 = 0LL;
    }
  }

  ++self->_daemon->_sessionIDLast;
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:"));
  __int128 v19 = self->_clientNetCnx;
  if (!v19)
  {
    __int128 v19 = objc_alloc_init(&OBJC_CLASS___RPConnection);
    objc_storeStrong((id *)&self->_clientNetCnx, v19);
    objc_storeStrong((id *)&self->_activeNetCnx, v19);
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);

  if (v20)
  {
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v8 ipAddress]);
    -[RPConnection setDestinationString:](v19, "setDestinationString:", v21);
  }

  else
  {
    -[RPConnection setBonjourPeerDevice:](v19, "setBonjourPeerDevice:", v10);
  }

  -[RPConnection setControlFlags:](v19, "setControlFlags:", 576LL);
  if (((unint64_t)[v8 statusFlags] & 0x1000080000) == 0) {
    -[RPConnection setControlFlags:]( v19,  "setControlFlags:",  (unint64_t)-[RPConnection controlFlags](v19, "controlFlags") | 0x400000000000LL);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue([v9 pairingInfo]);

  if (v22) {
    -[RPConnection setControlFlags:]( v19,  "setControlFlags:",  (unint64_t)-[RPConnection controlFlags](v19, "controlFlags") | 0x8000000000LL);
  }
  -[RPConnection setDispatchQueue:](v19, "setDispatchQueue:", self->_dispatchQueue);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
  -[RPConnection setIdentityDaemon:](v19, "setIdentityDaemon:", v23);

  -[RPConnection setKeepAliveSeconds:](v19, "setKeepAliveSeconds:", 10LL);
  v24 = objc_alloc(&OBJC_CLASS___NSString);
  daemon = self->_daemon;
  uint64_t v26 = daemon->_cnxIDLast + 1;
  daemon->_cnxIDLast = v26;
  v27 = -[NSString initWithFormat:](v24, "initWithFormat:", @"%@Cnx-%u", @"RDLink", v26);
  -[RPConnection setLabel:](v19, "setLabel:", v27);

  -[RPConnection setLocalDeviceInfo:](v19, "setLocalDeviceInfo:", self->_daemon->_localDeviceInfo);
  -[RPConnection setPasswordType:](v19, "setPasswordType:", [v9 passwordType]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  -[RPConnection setPeerIdentifier:](v19, "setPeerIdentifier:", v28);

  -[RPConnection setPresent:](v19, "setPresent:", 1LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceType]);
  -[RPConnection setServiceType:](v19, "setServiceType:", v29);

  if (([v9 internalAuthFlags] & 8) != 0)
  {
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_1000A6E1C;
    v51[3] = &unk_1001118A0;
    v51[4] = self;
    -[RPConnection setAuthCompletionHandler:](v19, "setAuthCompletionHandler:", v51);
  }

  if (([v9 internalAuthFlags] & 4) != 0)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000A6E28;
    v50[3] = &unk_100114CF8;
    v50[4] = self;
    -[RPConnection setPromptForPasswordHandler:](v19, "setPromptForPasswordHandler:", v50);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000A6E38;
  v47[3] = &unk_100111708;
  v47[4] = self;
  id v30 = v18;
  id v48 = v30;
  v31 = v19;
  v49 = v31;
  -[RPConnection setInvalidationHandler:](v31, "setInvalidationHandler:", v47);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000A6E48;
  v45[3] = &unk_100111990;
  v45[4] = self;
  id v32 = v30;
  id v46 = v32;
  -[RPConnection setReceivedEventHandler:](v31, "setReceivedEventHandler:", v45);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1000A6E60;
  v43[3] = &unk_1001119B8;
  v43[4] = self;
  id v44 = v32;
  id v33 = v32;
  -[RPConnection setReceivedRequestHandler:](v31, "setReceivedRequestHandler:", v43);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000A6E7C;
  v39[3] = &unk_100111A30;
  id v40 = v9;
  v41 = self;
  v42 = v31;
  v34 = v31;
  -[RPConnection setStateChangedHandler:](v34, "setStateChangedHandler:", v39);
  -[RPConnection activate](v34, "activate");

  BOOL v35 = 1;
LABEL_19:

  return v35;
}

- (void)sessionStartWithID:(id)a3 netCnx:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDevice);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 peerDeviceInfo]);
  if (v12) {
    -[RPRemoteDisplayDevice updateWithEndpoint:](v11, "updateWithEndpoint:", v12);
  }

  id v13 = [v9 linkType];
  id v14 = v13;
  if ((_DWORD)v13 == 4)
  {
    uint64_t v15 = 8LL;
LABEL_7:
    -[RPRemoteDisplayDevice setStatusFlags:]( v11,  "setStatusFlags:",  (unint64_t)-[RPRemoteDisplayDevice statusFlags](v11, "statusFlags") | v15);
    goto LABEL_8;
  }

  if ((v13 & 0xFFFFFFFE) == 8)
  {
    uint64_t v15 = 0x1000000LL;
    goto LABEL_7;
  }

- (void)sessionEndedWithID:(id)a3 netCnx:(id)a4
{
  id v18 = a3;
  v6 = (RPConnection *)a4;
  if (self->_activatedServer)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]",  30LL,  "Server session ended: %@\n",  v18);
    }

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    [v7 remoteDisplaySessionEndedWithID:v18];

    -[NSMutableSet removeObject:](self->_serverNetCnxs, "removeObject:", v6);
    if (self->_activeNetCnx == v6)
    {
      self->_activeNetCnx = 0LL;
    }
  }

  else if (self->_activatedSession)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]",  30LL,  "Client session ended: %@\n",  v18);
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    id v15 = RPErrorF(4294960543LL, (uint64_t)"Session ended", v9, v10, v11, v12, v13, v14, v17);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v8 remoteDisplaySessionError:v16];
  }

  else if (dword_100132BB0 <= 30 {
         && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
  }
  {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection sessionEndedWithID:netCnx:]",  30LL,  "Session ended: %@\n",  v18);
  }
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v17 = a6;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy"));
  uint64_t v16 = v15;
  if (activatedServer) {
    [v15 remoteDisplayReceivedEventID:v14 event:v13 options:v12 sessionID:v17];
  }
  else {
    [v15 remoteDisplayReceivedEventID:v14 event:v13 options:v12];
  }
}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  activatedServer = self->_activatedServer;
  xpcCnx = self->_xpcCnx;
  if (activatedServer)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000A7BE0;
    v28[3] = &unk_100112CA8;
    uint64_t v25 = &v29;
    id v16 = v12;
    id v29 = v16;
    id v17 = a5;
    id v18 = a4;
    id v19 = a3;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  v28));
    [v20 remoteDisplayReceivedRequestID:v19 request:v18 options:v17 responseHandler:v16 sessionID:v13];
  }

  else
  {
    v26[1] = 3221225472LL;
    v26[2] = sub_1000A7C84;
    v26[3] = &unk_100112CA8;
    uint64_t v25 = &v27;
    v26[0] = _NSConcreteStackBlock;
    id v21 = v12;
    id v27 = v21;
    id v22 = a5;
    id v23 = a4;
    id v24 = a3;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  v26));
    [v20 remoteDisplayReceivedRequestID:v24 request:v23 options:v22 responseHandler:v21];
  }
}

- (void)_authCompletion:(id)a3
{
  id v5 = a3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection _authCompletion:]",  30LL,  "Session auth completion: %{error}\n",  v5);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v4 remoteDisplayAuthCompleted:v5];
}

- (void)showPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection showPassword:flags:]",  30LL,  "Server show password with flags %#{flags}\n",  v4,  &unk_10010B290);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v6 remoteDisplayShowPassword:v7 flags:v4];
}

- (void)hidePasswordWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection hidePasswordWithFlags:]",  30LL,  "Server hide password with flags %#{flags}\n",  v3,  &unk_10010B290);
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v5 remoteDisplayHidePasswordWithFlags:v3];
}

- (void)_promptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection _promptForPasswordWithFlags:throttleSeconds:]",  30LL,  "Session prompt for password with flags %#{flags}, throttle seconds %d\n",  v5,  &unk_10010B290,  v4);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v7 remoteDisplayPromptForPasswordWithFlags:v5 throttleSeconds:v4];
}

- (void)updateErrorFlags:(unint64_t)a3
{
  uint64_t v5 = self->_activatedDiscovery;
  if (v5)
  {
    id v8 = v5;
    BOOL v6 = -[RPRemoteDisplayDiscovery errorFlags](v5, "errorFlags") == (id)a3;
    uint64_t v5 = v8;
    if (!v6)
    {
      -[RPRemoteDisplayDiscovery setErrorFlags:](v8, "setErrorFlags:", a3);
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection updateErrorFlags:]",  30LL,  "Update error flags for %#{pid}, %#ll{flags}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  a3,  &unk_10010B404);
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v7 remoteDisplayUpdateErrorFlags:a3];

      uint64_t v5 = v8;
    }
  }
}

- (void)remoteDisplayActivateDiscovery:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v33 = 0LL;
  unsigned __int8 v9 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v33);
  id v10 = v33;
  if ((v9 & 1) != 0)
  {
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateDiscovery:completion:]",  30LL,  "Activate discovery %@ from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    id v12 = [v11 errorFlags];

    [v7 setErrorFlags:v12];
    objc_storeStrong((id *)&self->_activatedDiscovery, a3);
    activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    if (!activatedDiscoverySet)
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      daemon = self->_daemon;
      id v16 = daemon->_activatedDiscoverySet;
      daemon->_activatedDiscoverySet = v14;

      activatedDiscoverySet = self->_daemon->_activatedDiscoverySet;
    }

    -[NSMutableSet addObject:](activatedDiscoverySet, "addObject:", v7);
    if (v8) {
      v8[2](v8, v12, v10);
    }
    -[RPRemoteDisplayDaemon _updateForXPCClientChange](self->_daemon, "_updateForXPCClientChange");
    discoveredDevices = self->_daemon->_discoveredDevices;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000A8384;
    v30[3] = &unk_100114D48;
    id v31 = v7;
    id v32 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredDevices,  "enumerateKeysAndObjectsUsingBlock:",  v30);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    BOOL v19 = v18 != 0LL;

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
    if (v20) {
      uint64_t v23 = 1LL;
    }
    else {
      uint64_t v23 = 2LL;
    }
    [v21 remoteDisplayNotifyDiscoverySessionState:v19 forDevice:v22 startReason:v23];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_xpcCnx,  "valueForEntitlement:",  @"com.apple.RemoteDisplay.Dedicated"));
    if (v26)
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v24, v25);
      if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      {
        if ([v26 BOOLValue])
        {
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          id v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
          [v28 remoteDisplayDedicatedDeviceChanged:v29];
        }
      }
    }
  }

  else if (v8)
  {
    v8[2](v8, 0LL, v10);
  }
}

- (void)remoteDisplayActivateServer:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = 0LL;
  unsigned __int8 v9 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  id v10 = v26;
  if ((v9 & 1) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);

    if (!v11) {
      [v7 setServiceType:@"_rdlink._tcp"];
    }
    activatedServerXPCCnxMap = self->_daemon->_activatedServerXPCCnxMap;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](activatedServerXPCCnxMap, "objectForKey:", v13));

    if (v14)
    {
      if (v8)
      {
        id v21 = RPErrorF(4294960575LL, (uint64_t)"Server is already active", v15, v16, v17, v18, v19, v20, v24);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v8[2](v8, v22);
      }
    }

    else
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateServer:completion:]",  30LL,  "Activate server %@ from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
      }

      [v7 setDispatchQueue:self->_dispatchQueue];
      objc_storeStrong((id *)&self->_activatedServer, a3);
      -[RPRemoteDisplayDaemon _handleServerActivation:](self->_daemon, "_handleServerActivation:", self);
      if (v8) {
        v8[2](v8, v10);
      }
      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000A85F4;
      block[3] = &unk_1001110A8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
      -[RPRemoteDisplayDaemon _update](self->_daemon, "_update");
    }
  }

  else if (v8)
  {
    v8[2](v8, v10);
  }
}

- (void)remoteDisplayActivateSession:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472LL;
  v85[2] = sub_1000A8EC0;
  v85[3] = &unk_100111E90;
  id v86 = 0LL;
  id v9 = v8;
  id v87 = v9;
  id v10 = objc_retainBlock(v85);
  id v84 = 0LL;
  unsigned __int8 v11 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v84);
  id v12 = v84;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 pairingInfo]);

    if (v13)
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.rapport.SessionPaired"));
      unsigned __int8 v21 = [v20 isEqual:&__kCFBooleanTrue];

      if ((v21 & 1) == 0)
      {
        self->_entitled = 0;
        if (dword_100132BB0 <= 90
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.rapport.SessionPaired");
        }

        id v45 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)@"com.apple.rapport.SessionPaired");
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v45);
        goto LABEL_23;
      }
    }

    if (self->_activatedSession)
    {
      id v22 = RPErrorF(4294960575LL, (uint64_t)"Session already active", v14, v15, v16, v17, v18, v19, v77);
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
LABEL_23:
      uint64_t v25 = v12;
      id v12 = (id)v23;
LABEL_74:

      goto LABEL_75;
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v7 destinationDevice]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);

    if (!v25)
    {
      id v35 = RPErrorF(4294960591LL, (uint64_t)"No destination device", v26, v27, v28, v29, v30, v31, v77);
      uint64_t v36 = objc_claimAutoreleasedReturnValue(v35);
LABEL_20:
      id v44 = v12;
      id v12 = (id)v36;
LABEL_73:

      goto LABEL_74;
    }

    uint64_t v32 = objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon _findMatchingDeviceWithIdentifier:]( self->_daemon,  "_findMatchingDeviceWithIdentifier:",  v25));
    if (!v32)
    {
      id v37 = (void *)objc_claimAutoreleasedReturnValue([v7 pairingInfo]);

      if (!v37 || (uint64_t v32 = objc_claimAutoreleasedReturnValue([v7 destinationDevice])) == 0)
      {
        id v43 = RPErrorF(4294960569LL, (uint64_t)"Destination device not found", v32, v38, v39, v40, v41, v42, v77);
        uint64_t v36 = objc_claimAutoreleasedReturnValue(v43);
        goto LABEL_20;
      }
    }

    v81 = (void *)v32;
    objc_msgSend(v7, "setDaemonDevice:");
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);

    if (!v33) {
      [v7 setServiceType:@"_rdlink._tcp"];
    }
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      uint64_t v34 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      v78 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
      uint64_t v77 = v34;
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  30LL,  "Activate session from %#{pid} service type %@ to %@\n");
    }

    if (([v7 controlFlags] & 0x40000) != 0)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v81 bonjourDevice]);
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v80 deviceInfo]);
      char Int64Ranged = CFDictionaryGetInt64Ranged(v50, @"TrTy", 0LL, 0xFFFFFFFFLL, 0LL);

      if (!v80 || (Int64Ranged & 0x18) == 0)
      {
        id v58 = RPErrorF(4294960569LL, (uint64_t)"ForceUSB with no USB device", v52, v53, v54, v55, v56, v57, v77);
        uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);

        id v12 = (id)v59;
LABEL_72:

        id v44 = v81;
        goto LABEL_73;
      }

      __int128 v49 = "Infra";
      goto LABEL_43;
    }

    if (([v7 controlFlags] & 0x20000) == 0)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue([v81 bonjourDevice]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 deviceInfo]);
      char v79 = CFDictionaryGetInt64Ranged(v47, @"TrTy", 0LL, 0xFFFFFFFFLL, 0LL);

      if (([v7 controlFlags] & 0x200000) != 0
        || (daemon = self->_daemon, daemon->_prefNoInfra))
      {
        if ((v79 & 0x18) != 0 && !self->_daemon->_prefNoUSB)
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue([v81 bonjourDevice]);
          __int128 v49 = "USB";
          goto LABEL_40;
        }
      }

      else if (!daemon->_prefNoUSB)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue([v81 bonjourDevice]);
        if ((v79 & 0x18) != 0) {
          __int128 v49 = "USB";
        }
        else {
          __int128 v49 = "Infra";
        }
LABEL_40:
        if (v80) {
          goto LABEL_43;
        }
      }
    }

    v80 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_daemon->_bonjourAWDLDevices,  "objectForKeyedSubscript:",  v25));
    if (!v80)
    {
      if (dword_100132BB0 <= 30
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  30LL,  "Deferring connection until found to %@\n",  v81);
      }

      -[RPRemoteDisplayDaemon addNeedsAWDLPeer:](self->_daemon, "addNeedsAWDLPeer:", v81);
      if (!self->_clientNetCnx)
      {
        v63 = objc_alloc_init(&OBJC_CLASS___RPConnection);
        clientNetCnx = self->_clientNetCnx;
        self->_clientNetCnx = v63;

        -[RPConnection setDispatchQueue:](self->_clientNetCnx, "setDispatchQueue:", self->_dispatchQueue);
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](&OBJC_CLASS___RPIdentityDaemon, "sharedIdentityDaemon"));
        -[RPConnection setIdentityDaemon:](self->_clientNetCnx, "setIdentityDaemon:", v65);

        objc_storeStrong((id *)&self->_activeNetCnx, self->_clientNetCnx);
      }

      [v7 setNeedsAWDL:1];
      v80 = 0LL;
      goto LABEL_56;
    }

    objc_msgSend(v7, "setBonjourDevice:");
    [v7 setNeedsAWDL:1];
    __int128 v49 = "AWDL";
LABEL_43:
    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceType]);
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  30LL,  "Start connection (%s) to %@ for service type %@ with bonjour device %@\n",  v49,  v81,  v60,  v80);
    }

    id v83 = v12;
    unsigned __int8 v61 = -[RPRemoteDisplayXPCConnection netConnectionStartWithDevice:session:error:]( self,  "netConnectionStartWithDevice:session:error:",  v81,  v7,  &v83);
    id v62 = v83;

    id v12 = v62;
    if ((v61 & 1) == 0) {
      goto LABEL_72;
    }
LABEL_56:
    [v7 setDispatchQueue:self->_dispatchQueue];
    [v7 setXpcCnx:self->_xpcCnx];
    objc_storeStrong((id *)&self->_activatedSession, a3);
    activatedSessionSet = self->_daemon->_activatedSessionSet;
    if (!activatedSessionSet)
    {
      v67 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      v68 = self->_daemon;
      v69 = v68->_activatedSessionSet;
      v68->_activatedSessionSet = v67;

      activatedSessionSet = self->_daemon->_activatedSessionSet;
    }

    -[NSMutableSet addObject:](activatedSessionSet, "addObject:", v7);
    if (v9) {
      (*((void (**)(id, id))v9 + 2))(v9, v12);
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue([v7 pairingInfo]);

    if (!v70) {
      goto LABEL_71;
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue([v7 pairingInfo]);
    id v82 = 0LL;
    v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v71,  16LL,  &v82));
    id v73 = v82;

    if (v73)
    {
      if (dword_100132BB0 > 30)
      {
LABEL_70:
        v74 = objc_alloc_init(&OBJC_CLASS___RPRemoteDisplayDevice);
        v75 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"_pubID"]);
        -[RPRemoteDisplayDevice setIdentifier:](v74, "setIdentifier:", v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:@"_pinC"]);
        -[RPConnection setPassword:](self->_clientNetCnx, "setPassword:", v76);

        -[RPConnection setPasswordType:](self->_clientNetCnx, "setPasswordType:", 10LL);
        -[RPConnection setPreferredIdentityType:](self->_clientNetCnx, "setPreferredIdentityType:", 13LL);
        [v7 setNeedsAWDL:1];

LABEL_71:
        -[RPRemoteDisplayDaemon _update](self->_daemon, "_update");
        goto LABEL_72;
      }

      if (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)) {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  30LL,  "JSON error: %@\n",  v73);
      }
    }

    if (dword_100132BB0 <= 30
      && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayActivateSession:completion:]",  30LL,  "Session pairing info: %@\n",  v72);
    }

    goto LABEL_70;
  }

- (void)remoteDisplayInvalidateSessionID:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayInvalidateSessionID:]",  30LL,  "Invalidate session %@ from %#{pid}\n",  v6,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_daemon->_tcpServerConnections,  "objectForKeyedSubscript:",  v6));
  uint64_t v5 = v4;
  if (v4) {
    [v4 invalidate];
  }
}

- (void)remoteDisplayInvalidateClientSession
{
  if (dword_100132BB0 <= 30 && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL))) {
    LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayInvalidateClientSession]",  30LL,  "Invalidate client session from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  if (self->_activatedSession) {
    -[NSMutableSet removeObject:](self->_daemon->_activatedSessionSet, "removeObject:");
  }
  clientNetCnx = self->_clientNetCnx;
  if (clientNetCnx)
  {
    -[RPConnection invalidate](clientNetCnx, "invalidate");
    uint64_t v4 = self->_clientNetCnx;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  self->_clientNetCnx = 0LL;

  activatedSession = self->_activatedSession;
  self->_activatedSession = 0LL;
}

- (void)remoteDisplaySendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v27 = 0LL;
  unsigned __int8 v14 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  id v15 = v27;
  if ((v14 & 1) != 0)
  {
    uint64_t v16 = self->_activeNetCnx;
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

- (void)remoteDisplayStartPairingServerWithCompletion:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  uint64_t v5 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_activatedServer)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v12 UUIDString]);

    -[RPRemoteDisplayServer setPasswordType:](self->_activatedServer, "setPasswordType:", 10LL);
    -[RPRemoteDisplayServer setPassword:](self->_activatedServer, "setPassword:", v15);
    -[RPRemoteDisplayDaemon _startPairingServerWithPassword:completion:]( self->_daemon,  "_startPairingServerWithPassword:completion:",  v15,  v5);
  }

  else
  {
    id v13 = RPErrorF(4294960569LL, (uint64_t)"No active server", v6, v7, v8, v9, v10, v11, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v13);
    v5[2](v5, 0LL);
  }
}

- (void)remoteDisplayStopPairingServer
{
}

- (void)remoteDisplaySendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = 0LL;
  unsigned __int8 v14 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  id v21 = v26;
  if ((v14 & 1) != 0)
  {
    activeNetCnx = self->_activeNetCnx;
    if (activeNetCnx)
    {
      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:]( activeNetCnx,  "sendEncryptedRequestID:request:xpcID:options:responseHandler:",  v10,  v11,  self->_xpcID,  v12,  v13);
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

- (void)remoteDisplayTryPassword:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = 0LL;
  unsigned int v5 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  id v6 = v9;
  if (v5)
  {
    uint64_t v7 = self->_activeNetCnx;
    uint64_t v8 = v7;
    if (v7)
    {
      -[RPConnection tryPassword:](v7, "tryPassword:", v4);
    }

    else if (dword_100132BB0 <= 90 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayTryPassword:]",  90LL,  "### No connection to try password from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }
  }
}

- (void)remoteDisplayPersonCanceled:(id)a3
{
  id v8 = 0LL;
  unsigned int v4 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v8);
  id v5 = v8;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.RemoteDisplay.SessionState"));
    unsigned __int8 v7 = [v6 isEqual:&__kCFBooleanTrue];

    if ((v7 & 1) != 0)
    {
      -[RPRemoteDisplayDaemon _sendConfirmationCancelToAllDevices](self->_daemon, "_sendConfirmationCancelToAllDevices");
    }

    else if (dword_100132BB0 <= 90 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayPersonCanceled:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay.SessionState");
    }
  }
}

- (void)remoteDisplayPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v12 = 0LL;
  unsigned int v7 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v12);
  id v8 = v12;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.RemoteDisplay.SessionState"));
    unsigned __int8 v10 = [v9 isEqual:&__kCFBooleanTrue];

    if ((v10 & 1) != 0)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 accountID]);

      if (v11)
      {
        -[RPRemoteDisplayDaemon _requestConfirmationFromPerson:forDedicated:]( self->_daemon,  "_requestConfirmationFromPerson:forDedicated:",  v6,  v4);
      }

      else if (dword_100132BB0 <= 90 {
             && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      }
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayPersonSelected:forDedicatedPairing:]",  90LL,  "### Selected person has no accountID\n");
      }
    }

    else if (dword_100132BB0 <= 90 {
           && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
    }
    {
      LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayPersonSelected:forDedicatedPairing:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay.SessionState");
    }
  }
}

- (void)remoteDisplayChangeDiscoverySessionStateForDevice:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v26 = 0LL;
  unsigned int v8 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v26);
  id v9 = v26;
  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_xpcCnx,  "valueForEntitlement:",  @"com.apple.RemoteDisplay.SessionState"));
    if (!v12
      || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v10, v11), (objc_opt_isKindOfClass(v12, v13) & 1) == 0)
      || ([v12 BOOLValue] & 1) == 0)
    {
      if (dword_100132BB0 <= 90
        && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay.SessionState");
      }

      goto LABEL_32;
    }

    unsigned __int8 v14 = &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface;
    if (v6)
    {
      else {
        uint64_t v15 = 0LL;
      }
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
      if (!v16
        || (uint64_t v17 = (void *)v16,
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[RPRemoteDisplayDaemon deviceConfirmedIdentifier]( self->_daemon,  "deviceConfirmedIdentifier")),  v19 = [v6 isEqualToString:v18],  v18,  v17,  (v19 & 1) != 0))
      {
LABEL_27:
        int opt_inst_meths = (int)v14[41].opt_inst_meths;
        if (opt_inst_meths <= 30
          && (opt_inst_meths != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]",  30LL,  "Discovery session state change from %#{pid}, peer %@ reason '%@' start reason %s\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v6,  v7,  (&off_100114E78)[v15]);
        }

        -[RPRemoteDisplayDaemon _changeDiscoverySessionStateForDevice:startReason:]( self->_daemon,  "_changeDiscoverySessionStateForDevice:startReason:",  v6,  v15);
LABEL_32:

        goto LABEL_33;
      }
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    if ([v7 isEqualToString:@"User disconnect"])
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 idsDeviceIdentifier]);
      unsigned int v23 = [v21 isEqualToString:v22];

      if (v23)
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon deviceConfirmedIdentifier](self->_daemon, "deviceConfirmedIdentifier"));
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDiscoverySessionStateForDevice:reason:]",  30LL,  "Exit session with reason '%@' for dedicated device %@ -> clear dedicated device\n",  v7,  v24);
        }

        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", 0LL);
      }

      unsigned __int8 v14 = &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface;
    }

    -[RPRemoteDisplayDaemon _sendDiscoverySessionExitWithReason:]( self->_daemon,  "_sendDiscoverySessionExitWithReason:",  v7);
    goto LABEL_27;
  }

- (void)remoteDisplayChangeDedicatedDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (_os_feature_enabled_impl("Sharing", "DedicatedLaguna"))
  {
    id v11 = 0LL;
    unsigned int v5 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
    id v6 = v11;
    if (v5)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_xpcCnx,  "valueForEntitlement:",  @"com.apple.RemoteDisplay.Dedicated"));
      if (v9
        && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber, v7, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        && ([v9 BOOLValue] & 1) != 0)
      {
        if (dword_100132BB0 <= 30
          && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
        {
          LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDedicatedDevice:]",  30LL,  "Dedicated device change from %#{pid}: %@\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v4);
        }

        -[RPRemoteDisplayDaemon saveDedicatedDevice:](self->_daemon, "saveDedicatedDevice:", v4);
      }

      else if (dword_100132BB0 <= 90 {
             && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      }
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayChangeDedicatedDevice:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay.Dedicated");
      }
    }
  }
}

- (void)remoteDisplayDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ((_os_feature_enabled_impl("Sharing", "DedicatedLaguna") & 1) != 0)
  {
    id v28 = 0LL;
    unsigned __int8 v11 = -[RPRemoteDisplayXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v28);
    id v12 = v28;
    if ((v11 & 1) != 0)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_xpcCnx,  "valueForEntitlement:",  @"com.apple.RemoteDisplay.Dedicated"));
      if (v15
        && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v13, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        && ([v15 BOOLValue] & 1) != 0)
      {
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPRemoteDisplayDaemon dedicatedDevice](self->_daemon, "dedicatedDevice"));
        if (v23)
        {
          if (dword_100132BB0 <= 30
            && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 30LL)))
          {
            LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayDedicatedDeviceConfirmationWithCompletion:]",  30LL,  "Discovery session will request confirmation from dedicated device %@ for %#{pid}\n",  v23,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
          }

          -[RPRemoteDisplayDaemon _requestConfirmationFromDevice:forDedicated:]( self->_daemon,  "_requestConfirmationFromDevice:forDedicated:",  v23,  1LL);
          if (v4) {
            v4[2](v4, v12);
          }
        }

        else if (v4)
        {
          id v25 = RPErrorF(4294960578LL, (uint64_t)"No dedicated device configured", v17, v18, v19, v20, v21, v22, v27);
          id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v4[2](v4, v26);
        }
      }

      else if (dword_100132BB0 <= 90 {
             && (dword_100132BB0 != -1 || _LogCategory_Initialize(&dword_100132BB0, 90LL)))
      }
      {
        LogPrintF( &dword_100132BB0,  "-[RPRemoteDisplayXPCConnection remoteDisplayDedicatedDeviceConfirmationWithCompletion:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.RemoteDisplay.Dedicated");
      }

      goto LABEL_26;
    }

    if (!v4)
    {
LABEL_26:

      goto LABEL_27;
    }

- (RPRemoteDisplayDiscovery)activatedDiscovery
{
  return self->_activatedDiscovery;
}

- (RPConnection)activeNetCnx
{
  return self->_activeNetCnx;
}

- (void)setActiveNetCnx:(id)a3
{
}

- (RPRemoteDisplayServer)activatedServer
{
  return self->_activatedServer;
}

- (RPRemoteDisplaySession)activatedSession
{
  return self->_activatedSession;
}

- (RPConnection)clientNetCnx
{
  return self->_clientNetCnx;
}

- (void)setClientNetCnx:(id)a3
{
}

- (RPRemoteDisplayDaemon)daemon
{
  return self->_daemon;
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

- (NSMutableSet)serverNetCnxs
{
  return self->_serverNetCnxs;
}

- (void)setServerNetCnxs:(id)a3
{
}

- (BOOL)usingNearbyActionV2
{
  return self->_usingNearbyActionV2;
}

- (void)setUsingNearbyActionV2:(BOOL)a3
{
  self->_usingNearbyActionV2 = a3;
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
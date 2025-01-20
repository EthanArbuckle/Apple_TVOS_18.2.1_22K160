@interface RPCompanionLinkXPCConnection
- (BOOL)_checkRSSIThresholdForDevice:(id)a3;
- (BOOL)_connectionHasActiveSessions:(id)a3;
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)clientNeedsWiFiAssertion;
- (BOOL)entitled;
- (BOOL)isContextCollector;
- (BOOL)localDeviceUpdated;
- (BOOL)needsCLink;
- (BOOL)needsNearbyActionV2;
- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4;
- (CUBonjourDevice)bonjourDevice;
- (NSMutableDictionary)devices;
- (NSMutableDictionary)registeredEvents;
- (NSMutableDictionary)registeredRequests;
- (NSMutableSet)registeredProfileIDs;
- (NSString)appID;
- (NSString)personaUUID;
- (NSUUID)launchInstanceID;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_source)discoveryTimer;
- (OS_os_transaction)osTransaction;
- (RBSProcessIdentifier)rbsPID;
- (RPCompanionLinkClient)client;
- (RPCompanionLinkDaemon)daemon;
- (RPCompanionLinkDevice)daemonDevice;
- (RPCompanionLinkXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (RPConnection)netCnx;
- (RPDiscovery)discoveryClient;
- (RPServer)server;
- (RPSession)session;
- (id)_devicesForClient:(id)a3;
- (id)_findMatchingDevice:(id)a3 inDeviceDictionary:(id)a4;
- (id)_updateOptionsWithProcessInfo:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unint64_t)startTicks;
- (unsigned)xpcID;
- (void)_invalidateConnectionInList:(id)a3 listDescription:(id)a4;
- (void)authCompletion:(id)a3;
- (void)companionLinkActivateAssertion:(id)a3 completion:(id)a4;
- (void)companionLinkActivateClient:(id)a3 completion:(id)a4;
- (void)companionLinkCreateDeviceToEndpointMappingForDeviceID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterEventID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterProfileID:(id)a3 completion:(id)a4;
- (void)companionLinkDeregisterRequestID:(id)a3 completion:(id)a4;
- (void)companionLinkRegisterEventID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)companionLinkRegisterProfileID:(id)a3 completion:(id)a4;
- (void)companionLinkRegisterRequestID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)companionLinkRemoveLocalDeviceAsContextCollector:(id)a3;
- (void)companionLinkSendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 completion:(id)a8;
- (void)companionLinkSendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 responseHandler:(id)a8;
- (void)companionLinkSetLocalDeviceAsContextCollector:(id)a3;
- (void)companionLinkTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5;
- (void)companionLinkTryPassword:(id)a3;
- (void)companionLinkUpdateClient:(id)a3;
- (void)connectionInvalidated;
- (void)connectionInvalidatedCore;
- (void)handleDisconnect;
- (void)promptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5;
- (void)receivedEventID:(id)a3 event:(id)a4 options:(id)a5;
- (void)receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4;
- (void)reportLostDevice:(id)a3;
- (void)setAppID:(id)a3;
- (void)setBonjourDevice:(id)a3;
- (void)setClient:(id)a3;
- (void)setClientNeedsWiFiAssertion:(BOOL)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setDiscoveryTimer:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsContextCollector:(BOOL)a3;
- (void)setLaunchInstanceID:(id)a3;
- (void)setLocalDeviceUpdated:(BOOL)a3;
- (void)setNeedsCLink:(BOOL)a3;
- (void)setNeedsNearbyActionV2:(BOOL)a3;
- (void)setNetCnx:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPersonaUUID:(id)a3;
- (void)setRbsPID:(id)a3;
- (void)setServer:(id)a3;
- (void)setSession:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setXpcID:(unsigned int)a3;
- (void)updateErrorFlags:(unint64_t)a3;
- (void)xpcDiscoveryActivate:(id)a3 completion:(id)a4;
- (void)xpcDiscoveryUpdate:(id)a3;
- (void)xpcServerActivate:(id)a3 completion:(id)a4;
- (void)xpcServerUpdate:(id)a3;
- (void)xpcSessionActivate:(id)a3 completion:(id)a4;
@end

@implementation RPCompanionLinkXPCConnection

- (RPCompanionLinkXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___RPCompanionLinkXPCConnection;
  v9 = -[RPCompanionLinkXPCConnection init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    v10->_startTicks = mach_absolute_time();
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  return -[RPCompanionLinkXPCConnection descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  id v56 = 0LL;
  NSAppendPrintF( &v56,  "    %#{pid}",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier", *(void *)&a3));
  id v5 = v56;
  v6 = self->_client;
  unsigned int v7 = -[RPCompanionLinkClient clientID](v6, "clientID");
  if (v7)
  {
    id v55 = v5;
    NSAppendPrintF(&v55, ", CID 0x%X", v7);
    id v8 = v55;

    id v5 = v8;
  }

  server = self->_server;
  if (server)
  {
    id v54 = v5;
    v10 = server;
    NSAppendPrintF(&v54, ", %@", v10);
    id v11 = v54;

    id v5 = v11;
  }

  id v12 = -[NSMutableDictionary count](self->_registeredEvents, "count");
  if (v12)
  {
    id v53 = v5;
    NSAppendPrintF(&v53, ", %d event(s)", (_DWORD)v12);
    id v13 = v53;

    id v5 = v13;
  }

  id v14 = -[NSMutableDictionary count](self->_registeredRequests, "count");
  if (v14)
  {
    id v52 = v5;
    NSAppendPrintF(&v52, ", %d request(s)", (_DWORD)v14);
    id v15 = v52;

    id v5 = v15;
  }

  id v16 = -[NSMutableSet count](self->_registeredProfileIDs, "count");
  if (v16)
  {
    id v51 = v5;
    NSAppendPrintF(&v51, ", %d profile(s)", (_DWORD)v16);
    id v17 = v51;

    id v5 = v17;
  }

  id v18 = -[RPCompanionLinkClient controlFlags](v6, "controlFlags");
  if (v18)
  {
    id v50 = v5;
    NSAppendPrintF(&v50, ", CF %ll{flags}", v18, &unk_10010986C);
    id v19 = v50;

    id v5 = v19;
  }

  if ((-[RPCompanionLinkClient flags](v6, "flags") & 1) != 0)
  {
    id v49 = v5;
    NSAppendPrintF(&v49, ", Unauth");
    id v20 = v49;

    id v5 = v20;
  }

  if (self->_needsCLink)
  {
    id v48 = v5;
    NSAppendPrintF(&v48, ", nCL");
    id v21 = v48;

    id v5 = v21;
  }

  if (self->_needsNearbyActionV2)
  {
    id v47 = v5;
    NSAppendPrintF(&v47, ", nAV2");
    id v22 = v47;

    id v5 = v22;
  }

  uint64_t v23 = objc_claimAutoreleasedReturnValue(-[RPConnection label](self->_netCnx, "label"));
  v24 = (void *)v23;
  if (v23)
  {
    id v46 = v5;
    NSAppendPrintF(&v46, ", %@", v23);
    id v25 = v46;

    id v5 = v25;
  }

  if ((-[RPCompanionLinkClient flags](v6, "flags") & 0x2000) != 0)
  {
    id v45 = v5;
    NSAppendPrintF(&v45, ", HHDevice");
    id v26 = v45;

    id v5 = v26;
  }

  if ((-[RPCompanionLinkClient flags](v6, "flags") & 0x4000) != 0)
  {
    id v44 = v5;
    NSAppendPrintF(&v44, ", NoAPChecks");
    id v27 = v44;

    id v5 = v27;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](v6, "destinationDevice"));
  v29 = v28;
  if (v28)
  {
    id v43 = v5;
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v28 idsDeviceIdentifier]);
    v31 = (void *)v30;
    if (v30)
    {
      int v32 = 0;
      v33 = (void *)v30;
    }

    else
    {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v29 identifier]);
      v3 = (void *)v34;
      if (v34)
      {
        int v32 = 0;
        v33 = (void *)v34;
      }

      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v29 publicIdentifier]);
        int v32 = 1;
      }
    }

    NSAppendPrintF(&v43, ", device %@", v33);
    id v35 = v43;

    if (v32) {
    if (!v31)
    }

    id v5 = v35;
  }

  uint64_t v36 = mach_absolute_time();
  id v42 = v5;
  uint64_t v37 = UpTicksToSeconds(v36 - self->_startTicks);
  NSAppendPrintF(&v42, ", %ll{dur}", v37);
  id v38 = v42;

  id v41 = v38;
  NSAppendPrintF(&v41, "\n");
  id v39 = v41;

  return v39;
}

- (void)connectionInvalidated
{
  v3 = self->_session;
  if (v3)
  {
    v4 = v3;
    daemon = self->_daemon;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPSession cnx](v3, "cnx"));
    uint64_t xpcID = self->_xpcID;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100035768;
    v8[3] = &unk_100112230;
    v8[4] = v4;
    v8[5] = self;
    -[RPCompanionLinkDaemon sessionStopSend:session:xpcID:completion:]( daemon,  "sessionStopSend:session:xpcID:completion:",  v6,  v4,  xpcID,  v8);
  }

  else
  {
    -[RPCompanionLinkXPCConnection connectionInvalidatedCore](self, "connectionInvalidatedCore");
  }

- (BOOL)_connectionHasActiveSessions:(id)a3
{
  v4 = (RPConnection *)a3;
  uint64_t v5 = -[RPCompanionLinkDaemon _sessionsActiveOnConnection:xpcConnection:]( self->_daemon,  "_sessionsActiveOnConnection:xpcConnection:",  v4,  self);
  if (v5 >= 1)
  {
    v6 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue(-[RPConnection client](v4, "client"));
    client = self->_client;

    if (v6 == client)
    {
      if (dword_100131328 <= 40
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 40LL)))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection label](v4, "label"));
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection _connectionHasActiveSessions:]",  40LL,  "Connection %@ has %llu active sessions in progress, skip invalidating",  v8,  v5);
      }

      -[RPConnection setClient:](v4, "setClient:", 0LL);
      if (self->_netCnx == v4)
      {
        self->_netCnx = 0LL;
      }
    }
  }

  return v5 > 0;
}

- (void)_invalidateConnectionInList:(id)a3 listDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon dispatchQueue](self->_daemon, "dispatchQueue"));
  dispatch_assert_queue_V2(v8);

  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10000B284;
  id v14 = sub_10000B294;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100035A90;
  v9[3] = &unk_100112258;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  if ([(id)v11[5] count])
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:]",  30LL,  "Removing connection from %@ with unique ID: %@",  v7,  v11[5]);
    }

    [v6 removeObjectsForKeys:v11[5]];
  }

  _Block_object_dispose(&v10, 8);
}

- (void)connectionInvalidatedCore
{
  if (dword_100131328 <= 20 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 20LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]",  20LL,  "XPC connection invalidated from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
  if (self->_client)
  {
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:]( self,  "_invalidateConnectionInList:listDescription:",  self->_daemon->_tcpClientConnections,  @"tcp client connections");
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:]( self,  "_invalidateConnectionInList:listDescription:",  self->_daemon->_tcpOnDemandClientConnections,  @"tcp on-demand client connections");
    -[RPCompanionLinkXPCConnection _invalidateConnectionInList:listDescription:]( self,  "_invalidateConnectionInList:listDescription:",  self->_daemon->_bleClientConnections,  @"ble client connections");
    netCnx = self->_netCnx;
    self->_netCnx = 0LL;

    -[RPCompanionLinkClient invalidate](self->_client, "invalidate");
    client = self->_client;
    self->_client = 0LL;
  }

  discoveryClient = self->_discoveryClient;
  if (discoveryClient)
  {
    if (dword_100131328 <= 30)
    {
      if (dword_100131328 != -1
        || (int v6 = _LogCategory_Initialize(&dword_100131328, 30LL), discoveryClient = self->_discoveryClient, v6))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]",  30LL,  "Invalidate: %@, from %#{pid}\n",  discoveryClient,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
        discoveryClient = self->_discoveryClient;
      }
    }

    -[RPDiscovery invalidate](discoveryClient, "invalidate");
    id v7 = self->_discoveryClient;
    self->_discoveryClient = 0LL;
  }

  server = self->_server;
  if (server)
  {
    v9 = server;
    -[RPServer invalidate](v9, "invalidate");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon activeServers](self->_daemon, "activeServers"));
    [v10 removeObject:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    [v11 setServersChangedState:6];

    uint64_t v12 = self->_server;
    self->_server = 0LL;

    -[RPCompanionLinkDaemon _updateForXPCServerChange](self->_daemon, "_updateForXPCServerChange");
  }

  session = self->_session;
  if (session)
  {
    id v14 = session;
    -[RPSession invalidate](v14, "invalidate");
    id v15 = self->_session;
    self->_session = 0LL;
  }

  discoveryTimer = self->_discoveryTimer;
  if (discoveryTimer)
  {
    id v17 = discoveryTimer;
    dispatch_source_cancel(v17);
    id v18 = self->_discoveryTimer;
    self->_discoveryTimer = 0LL;
  }

  *(_WORD *)&self->_needsCLink = 0;
  id v19 = self->_netCnx;
  self->_netCnx = 0LL;

  registeredEvents = self->_registeredEvents;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100035F44;
  v32[3] = &unk_100112280;
  v32[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registeredEvents, "enumerateKeysAndObjectsUsingBlock:", v32);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v21 = self->_registeredProfileIDs;
  id v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection connectionInvalidatedCore]",  30LL,  "Deregister profileID on XPC disconnect: '%@'\n",  v26);
        }

        -[NSMutableSet removeObject:](self->_daemon->_registeredProfileIDs, "removeObject:", v26);
      }

      id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v28,  v33,  16LL);
    }

    while (v23);
  }

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_registeredProfileIDs, "removeAllObjects");
  osTransaction = self->_osTransaction;
  self->_osTransaction = 0LL;

  if (self->_isContextCollector) {
    -[RPCompanionLinkXPCConnection companionLinkRemoveLocalDeviceAsContextCollector:]( self,  "companionLinkRemoveLocalDeviceAsContextCollector:",  &stru_1001122A0);
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"com.apple.CompanionLink"));
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }

  else
  {
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection _entitledAndReturnError:]",  90LL,  "### %#{pid} missing entitlement '%@'\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  @"com.apple.CompanionLink");
    }

    if (a3)
    {
      id v14 = RPErrorF( 4294896128LL,  (uint64_t)"Missing entitlement '%@'",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)@"com.apple.CompanionLink");
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

- (id)_updateOptionsWithProcessInfo:(id)a3
{
  v4 = (NSMutableDictionary *)a3;
  uint64_t v5 = self->_netCnx;
  int v6 = v5;
  if (v5
    && (-[RPConnection controlFlags](v5, "controlFlags") & 0x200) != 0
    && (-[RPConnection containsInUseProcess:]( v6,  "containsInUseProcess:",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier")) & 1) == 0)
  {
    -[RPConnection addInUseProcess:]( v6,  "addInUseProcess:",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    unsigned int v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4, "mutableCopy");
    if (!v7) {
      unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    id v8 = sub_10000A8B0(-[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"inUseProcess");

    v4 = v7;
  }

  return v4;
}

- (void)authCompletion:(id)a3
{
  id v5 = a3;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection authCompletion:]",  30LL,  "Client auth completion: %{error}\n",  v5);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v4 companionLinkAuthCompleted:v5];
}

- (void)handleDisconnect
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v3 companionLinkHandleDisconnect];
}

- (id)_devicesForClient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 destinationDevice]);

  if (v6)
  {
    unsigned int v7 = v5;
  }

  else
  {
    activeDevices = self->_daemon->_activeDevices;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000365E8;
    v38[3] = &unk_1001122C8;
    id v9 = v4;
    id v39 = v9;
    v40 = self;
    id v41 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](activeDevices, "enumerateKeysAndObjectsUsingBlock:", v38);
    if ([v9 flags])
    {
      unauthDevices = self->_daemon->_unauthDevices;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10003665C;
      v34[3] = &unk_1001122C8;
      id v35 = v9;
      uint64_t v36 = self;
      uint64_t v37 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( unauthDevices,  "enumerateKeysAndObjectsUsingBlock:",  v34);
    }

    if (((unint64_t)[v9 controlFlags] & 0x2104000002) != 0)
    {
      bleDevices = self->_daemon->_bleDevices;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000366D0;
      v30[3] = &unk_1001122C8;
      id v12 = v9;
      id v31 = v12;
      int v32 = self;
      v33 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bleDevices, "enumerateKeysAndObjectsUsingBlock:", v30);
      nearbyInfoV2Devices = self->_daemon->_nearbyInfoV2Devices;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_100036744;
      v26[3] = &unk_1001122C8;
      id v27 = v12;
      __int128 v28 = self;
      __int128 v29 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( nearbyInfoV2Devices,  "enumerateKeysAndObjectsUsingBlock:",  v26);
    }

    if (((unint64_t)[v9 controlFlags] & 0x400000000) != 0
      && ([v9 flags] & 0x2000) != 0)
    {
      homeHubDevices = self->_daemon->_homeHubDevices;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_1000367B8;
      v22[3] = &unk_1001122C8;
      id v23 = v9;
      uint64_t v24 = self;
      id v25 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( homeHubDevices,  "enumerateKeysAndObjectsUsingBlock:",  v22);
    }

    if (((unint64_t)[v9 controlFlags] & 0x1000000000000) != 0)
    {
      authenticatedAWDLPairingModeDevices = self->_daemon->_authenticatedAWDLPairingModeDevices;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10003682C;
      v18[3] = &unk_1001122C8;
      id v19 = v9;
      id v20 = self;
      id v21 = v5;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( authenticatedAWDLPairingModeDevices,  "enumerateKeysAndObjectsUsingBlock:",  v18);
    }

    id v16 = v5;
  }

  return v5;
}

- (NSUUID)launchInstanceID
{
  if (!self->_didFetchForLaunchID && !self->_launchInstanceID)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](self->_xpcCnx, "_xpcConnection"));
    if (xpc_connection_get_peer_instance(v3, v7))
    {
      id v4 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v7);
      launchInstanceID = self->_launchInstanceID;
      self->_launchInstanceID = v4;
    }

    self->_didFetchForLaunchID = 1;
  }

  return self->_launchInstanceID;
}

- (void)promptForPasswordType:(int)a3 flags:(unsigned int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    else {
      id v9 = off_100112518[(int)v7];
    }
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection promptForPasswordType:flags:throttleSeconds:]",  30LL,  "Client prompt for password with type %s, flags %#{flags}, throttle seconds %d\n",  v9,  v6,  &unk_100109AF1,  v5);
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v10 companionLinkPromptForPasswordType:v7 flags:v6 throttleSeconds:v5];
}

- (void)receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](&OBJC_CLASS___RPMetrics, "sharedMetrics"));
  [v11 logReceivedMessageType:1 identifier:v10 options:v8 appID:self->_appID ctx:&self->_metricsCtx];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v12 companionLinkReceivedEventID:v10 event:v9 options:v8];
}

- (void)receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPMetrics sharedMetrics](&OBJC_CLASS___RPMetrics, "sharedMetrics"));
  [v14 logReceivedMessageType:2 identifier:v13 options:v11 appID:self->_appID ctx:&self->_metricsCtx];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
  [v15 companionLinkReceivedRequestID:v13 request:v12 options:v11 responseHandler:v10];
}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  id v4 = a3;
  if (-[RPCompanionLinkClient rssiThreshold](self->_client, "rssiThreshold")) {
    uint64_t v5 = (uint64_t)-[RPCompanionLinkClient rssiThreshold](self->_client, "rssiThreshold");
  }
  else {
    uint64_t v5 = -60LL;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bleDevice]);
  id v8 = [v7 rssi];

  if (v8) {
    BOOL v9 = (uint64_t)v8 < v5;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = !v9;

  return v10;
}

- (BOOL)reportFoundDevice:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
  LOBYTE(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:]( client,  "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:",  v6,  v8,  a4);

  if ((client & 1) == 0)
  {
    BOOL v17 = 0;
    if (!a4 || self->_client) {
      goto LABEL_22;
    }
    BOOL v17 = 0;
    id v18 = @"nilClientCnx";
    goto LABEL_16;
  }

  if (!-[RPCompanionLinkXPCConnection _checkRSSIThresholdForDevice:](self, "_checkRSSIThresholdForDevice:", v6))
  {
    if (!a4) {
      goto LABEL_21;
    }
    BOOL v17 = 0;
    id v18 = @"RSSI.tooLow";
LABEL_16:
    *a4 = v18;
    goto LABEL_22;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (!v9)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 publicIdentifier]);
    if (!v9)
    {
      if (a4)
      {
        BOOL v17 = 0;
        id v18 = @"missingDeviceIdentifier";
        goto LABEL_16;
      }

- (void)reportLostDevice:(id)a3
{
  id v10 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
  if (v4 || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 publicIdentifier])) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v5)
    {
      client = self->_client;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
      LODWORD(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:]( client,  "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:",  v10,  v7,  0LL);

      devices = self->_devices;
      if ((_DWORD)client)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v10, v4);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v9 companionLinkChangedDevice:v10 changes:2];
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", 0LL, v4);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v9 companionLinkLostDevice:v10];
      }
    }
  }
}

- (void)reportChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v15 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
  if (v6 || (id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 publicIdentifier])) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
    client = self->_client;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection launchInstanceID](self, "launchInstanceID"));
    LODWORD(client) = -[RPCompanionLinkClient shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:]( client,  "shouldReportDevice:toXPCConnectionWithLaunchInstanceID:outReason:",  v15,  v9,  0LL);

    if ((_DWORD)client)
    {
      unsigned int v10 = -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      if (v10 == getpid()) {
        objc_msgSend( v15,  "setEncodeSensitiveProperties:",  -[RPCompanionLinkClient encodeSensitiveProperties](self->_client, "encodeSensitiveProperties"));
      }
      if (v7)
      {
        if ((_DWORD)v4 != 32)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v15, v6);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
          [v11 companionLinkChangedDevice:v15 changes:v4];
LABEL_15:
        }
      }

      else if (-[RPCompanionLinkXPCConnection _checkRSSIThresholdForDevice:]( self,  "_checkRSSIThresholdForDevice:",  v15))
      {
        devices = self->_devices;
        if (!devices)
        {
          id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          unsigned int v14 = self->_devices;
          self->_devices = v13;

          devices = self->_devices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v15, v6);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
        [v11 companionLinkFoundDevice:v15];
        goto LABEL_15;
      }
    }

    else if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0LL, v6);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v11 companionLinkLostDevice:v15];
      goto LABEL_15;
    }
  }
}

- (void)updateErrorFlags:(unint64_t)a3
{
  uint64_t v5 = self->_client;
  if (v5)
  {
    id v11 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
    unint64_t v7 = (unint64_t)[v6 errorFlags] | a3;

    id v8 = -[RPCompanionLinkClient errorFlags](v11, "errorFlags");
    uint64_t v5 = v11;
    if (v8 != (id)v7)
    {
      if (dword_100131328 <= 20)
      {
        if (dword_100131328 != -1 || (v9 = _LogCategory_Initialize(&dword_100131328, 20LL), uint64_t v5 = v11, v9))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection updateErrorFlags:]",  20LL,  "Updating error flags to %#ll{flags} and notifying %@\n",  v7,  &unk_100109C65,  self->_appID);
          uint64_t v5 = v11;
        }
      }

      -[RPCompanionLinkClient setErrorFlags:](v5, "setErrorFlags:", v7);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy"));
      [v10 companionLinkUpdateErrorFlags:a3];

      uint64_t v5 = v11;
    }
  }
}

- (void)companionLinkActivateAssertion:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)companionLinkActivateClient:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v169 = 0LL;
  v170 = &v169;
  uint64_t v171 = 0x3032000000LL;
  v172 = sub_10000B284;
  v173 = sub_10000B294;
  id v174 = 0LL;
  v164[0] = _NSConcreteStackBlock;
  v164[1] = 3221225472LL;
  v164[2] = sub_100038170;
  v164[3] = &unk_1001122F0;
  v168 = &v169;
  id v139 = v7;
  id v165 = v139;
  v166 = self;
  id v136 = v8;
  id v167 = v136;
  v135 = objc_retainBlock(v164);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v9 = (id *)(v170 + 5);
  id obj = (id)v170[5];
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v9, obj);
  if (!v170[5])
  {
    if (self->_client)
    {
      id v124 = RPErrorF(4294960575LL, (uint64_t)"Client already activated", v10, v11, v12, v13, v14, v15, (uint64_t)v134);
      uint64_t v125 = objc_claimAutoreleasedReturnValue(v124);
      v126 = (void *)v170[5];
      v170[5] = v125;

      goto LABEL_104;
    }

    if (!self->_appID)
    {
      id v16 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection cuValueForEntitlementNoCache:]( self->_xpcCnx,  "cuValueForEntitlementNoCache:",  @"application-identifier"));
      appID = self->_appID;
      self->_appID = v16;
    }

    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      id v134 = v139;
      -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier");
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Activate: %@, from %#{pid}\n");
    }

    [v139 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_client, a3);
    unint64_t v137 = (unint64_t)[v139 controlFlags];
    if (sub_100009D20())
    {
      unint64_t v137 = v137 & 0xFFFFFDFFFF9DFEFFLL | 0x20000400000LL;
      if (dword_100131328 < 31
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        id v134 = [v139 clientID];
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Updated CID 0x%X control flags due to current supported virtualized transports: CF %#ll{flags}\n");
      }
    }

    id location = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v139 destinationDevice]);
    id v138 = v18;
    if (!v18) {
      goto LABEL_48;
    }
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
    if (v19)
    {
      id v140 = v19;
    }

    else
    {
      id v140 = (id)objc_claimAutoreleasedReturnValue([v138 publicIdentifier]);

      if (!v140)
      {
        id v129 = RPErrorF( 4294960569LL,  (uint64_t)"No destination device identifier",  v20,  v21,  v22,  v23,  v24,  v25,  (uint64_t)v134);
        uint64_t v130 = objc_claimAutoreleasedReturnValue(v129);
        v84 = (void *)v170[5];
        v170[5] = v130;
        goto LABEL_103;
      }
    }

    if (([v138 statusFlags] & 0x10000000) != 0)
    {
      objc_msgSend(v139, "setControlFlags:", (unint64_t)objc_msgSend(v139, "controlFlags") | 0x400000000);
      objc_msgSend(v139, "setFlags:", objc_msgSend(v139, "flags") | 0x2000);
      unint64_t v137 = (unint64_t)[v139 controlFlags];
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:]( self->_daemon,  "findConnectedDeviceForIdentifier:controlFlags:cnx:",  v140,  v137,  &location));
    if (v26) {
      goto LABEL_30;
    }
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v138 idsDeviceIdentifier]);
    BOOL v28 = v27 == 0LL;

    if (v28)
    {
      uint64_t v37 = 0LL;
    }

    else
    {
      daemon = self->_daemon;
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v138 idsDeviceIdentifier]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:]( daemon,  "findConnectedDeviceForIdentifier:controlFlags:cnx:",  v36,  v137,  &location));
    }

    if ((v137 & 0x400000000LL) != 0 && !v37)
    {
      id v131 = RPErrorF( 4294960569LL,  (uint64_t)"HomeHub device is not found %@",  v29,  v30,  v31,  v32,  v33,  v34,  (uint64_t)v138);
      uint64_t v122 = objc_claimAutoreleasedReturnValue(v131);
    }

    else
    {
      uint64_t v26 = (void *)v37;
      if (v37)
      {
LABEL_30:
        id v50 = v26;
        id v51 = (void *)objc_claimAutoreleasedReturnValue([v26 idsDeviceIdentifier]);
        BOOL v52 = v51 == 0LL;

        if (v52)
        {
          id v53 = (void *)objc_claimAutoreleasedReturnValue(+[RPCloudDaemon sharedCloudDaemon](&OBJC_CLASS___RPCloudDaemon, "sharedCloudDaemon"));
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 idsDeviceArray]);

          __int128 v154 = 0u;
          __int128 v155 = 0u;
          __int128 v152 = 0u;
          __int128 v153 = 0u;
          id v55 = v54;
          id v56 = [v55 countByEnumeratingWithState:&v152 objects:v176 count:16];
          if (v56)
          {
            uint64_t v57 = *(void *)v153;
            do
            {
              for (i = 0LL; i != v56; i = (char *)i + 1)
              {
                if (*(void *)v153 != v57) {
                  objc_enumerationMutation(v55);
                }
                v59 = *(void **)(*((void *)&v152 + 1) + 8LL * (void)i);
                v60 = (void *)objc_claimAutoreleasedReturnValue([v59 nsuuid]);
                v61 = (void *)objc_claimAutoreleasedReturnValue([v60 UUIDString]);
                unsigned int v62 = [v61 isEqualToString:v140];

                if (v62)
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue([v59 uniqueIDOverride]);
                  [v50 setIdsDeviceIdentifier:v63];

                  if (dword_100131328 <= 30
                    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
                  {
                    v64 = (void *)objc_claimAutoreleasedReturnValue([v50 idsDeviceIdentifier]);
                    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Found IDS identifier %@ for device %@",  v64,  v140);
                  }
                }
              }

              id v56 = [v55 countByEnumeratingWithState:&v152 objects:v176 count:16];
            }

            while (v56);
          }
        }

        objc_storeStrong((id *)&self->_daemonDevice, v50);

LABEL_48:
        if ((v137 & 0x800000000LL) != 0) {
          -[RPCompanionLinkDaemon _clientOnDemandAWDLDiscoveryStartForXPC:]( self->_daemon,  "_clientOnDemandAWDLDiscoveryStartForXPC:",  self);
        }
        if (!self->_osTransaction)
        {
          v151 = 0LL;
          v65 = (void *)objc_claimAutoreleasedReturnValue([v138 identifier]);
          v66 = v65;
          if (v65)
          {
            v67 = v65;
          }

          else
          {
            uint64_t v68 = objc_claimAutoreleasedReturnValue([v138 publicIdentifier]);
            v69 = (void *)v68;
            v70 = @"Discovery";
            if (v68) {
              v70 = (__CFString *)v68;
            }
            v67 = v70;
          }

          ASPrintF( &v151,  "com.apple.rapport.client-%#{pid}-%@",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v67);
          if (v151) {
            v71 = (const char *)v151;
          }
          else {
            v71 = "com.apple.rapport.client-?";
          }
          v72 = (OS_os_transaction *)os_transaction_create(v71);
          osTransaction = self->_osTransaction;
          self->_osTransaction = v72;

          if (!self->_osTransaction
            && dword_100131328 <= 90
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  90LL,  "### Create OS transaction failed: %s\n",  (const char *)v151);
          }

          if (v151) {
            free(v151);
          }
        }

        if (!location) {
          objc_storeStrong(&location, self->_netCnx);
        }
        if (dword_100131328 <= 30
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[RPConnection label](self->_netCnx, "label"));
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Activating using connection %@\n",  v83);
        }

        v84 = (void *)objc_claimAutoreleasedReturnValue([v139 serviceType]);
        if (v84 && location)
        {
          v85 = objc_alloc_init(&OBJC_CLASS___RPSession);
          -[RPSession setCnx:](v85, "setCnx:", location);
          -[RPSession setServiceType:](v85, "setServiceType:", v84);
          -[RPSession setStartTicks:](v85, "setStartTicks:", mach_absolute_time());
          objc_storeStrong((id *)&self->_session, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue([v138 identifier]);
          v87 = v86;
          if (v86)
          {
            id v88 = v86;
          }

          else
          {
            v94 = (void *)objc_claimAutoreleasedReturnValue([v138 publicIdentifier]);
            v95 = v94;
            if (v94) {
              id v96 = v94;
            }
            else {
              id v96 = (id)objc_claimAutoreleasedReturnValue([v138 idsDeviceIdentifier]);
            }
            id v88 = v96;
          }

          v97 = self->_daemon;
          id v98 = location;
          uint64_t xpcID = self->_xpcID;
          v147[0] = _NSConcreteStackBlock;
          v147[1] = 3221225472LL;
          v147[2] = sub_100038240;
          v147[3] = &unk_100112318;
          v147[4] = self;
          id v148 = v139;
          v149 = v84;
          id v150 = v136;
          -[RPCompanionLinkDaemon sessionStartSend:session:xpcID:destinationID:completion:]( v97,  "sessionStartSend:session:xpcID:destinationID:completion:",  v98,  v85,  xpcID,  v88,  v147);
        }

        else
        {
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection _devicesForClient:](self, "_devicesForClient:", v139));
          if (v136) {
            (*((void (**)(id, void *, uint64_t))v136 + 2))(v136, v89, v170[5]);
          }
          __int128 v145 = 0u;
          __int128 v146 = 0u;
          __int128 v143 = 0u;
          __int128 v144 = 0u;
          v85 = v89;
          id v90 = -[RPSession countByEnumeratingWithState:objects:count:]( v85,  "countByEnumeratingWithState:objects:count:",  &v143,  v175,  16LL);
          if (v90)
          {
            uint64_t v91 = *(void *)v144;
            do
            {
              for (j = 0LL; j != v90; j = (char *)j + 1)
              {
                if (*(void *)v144 != v91) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v93 = *(void *)(*((void *)&v143 + 1) + 8LL * (void)j);
                v142 = @"success";
                -[RPCompanionLinkXPCConnection reportFoundDevice:outReason:]( self,  "reportFoundDevice:outReason:",  v93,  &v142);
              }

              id v90 = -[RPSession countByEnumeratingWithState:objects:count:]( v85,  "countByEnumeratingWithState:objects:count:",  &v143,  v175,  16LL);
            }

            while (v90);
          }

          id v88 = (id)objc_claimAutoreleasedReturnValue(+[RPDaemon sharedDaemon](&OBJC_CLASS___RPDaemon, "sharedDaemon"));
          -[RPCompanionLinkXPCConnection updateErrorFlags:](self, "updateErrorFlags:", [v88 errorFlags]);
        }

        v100 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkXPCConnection xpcCnx](self, "xpcCnx"));
        id v101 = [v100 processIdentifier];

        v102 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  v101));
        id v141 = 0LL;
        v103 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v102,  &v141));
        id v104 = v141;
        if (!v104 && v102 && [v103 isApplication])
        {
          objc_storeStrong((id *)&self->_rbsPID, v102);
          -[RPCompanionLinkDaemon _addApplicationPID:](self->_daemon, "_addApplicationPID:", self->_rbsPID);
        }

        -[RPCompanionLinkDaemon _updateForXPCClientChange](self->_daemon, "_updateForXPCClientChange");

        goto LABEL_103;
      }

      id v38 = (void *)objc_claimAutoreleasedReturnValue([v138 ipAddress]);
      BOOL v39 = v38 == 0LL;

      if (!v39)
      {
        id v46 = v138;
        id v47 = self->_daemon;
        id v48 = (id *)(v170 + 5);
        id v161 = (id)v170[5];
        id v49 = v46;
        -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:]( v47,  "_clientConnectionStartOnDemand:xpcCnx:error:");
        objc_storeStrong(v48, v161);
        goto LABEL_29;
      }

      unint64_t v74 = v137;
      if ((v137 & 0x10000000) == 0)
      {
        id v49 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _findMatchingDevice:inDeviceDictionary:]( self,  "_findMatchingDevice:inDeviceDictionary:",  v138,  self->_daemon->_bleDevices));
        if (v49
          || (id v49 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _findMatchingDevice:inDeviceDictionary:]( self,  "_findMatchingDevice:inDeviceDictionary:",  v138,  self->_daemon->_nearbyInfoV2Devices))) != 0LL)
        {
          if (![v139 reactivateCalled]
            || ((unint64_t)[v139 controlFlags] & 0x20100) != 0)
          {
            objc_storeStrong((id *)&self->_daemonDevice, v49);
            v81 = self->_daemon;
            v82 = (id *)(v170 + 5);
            id v160 = (id)v170[5];
            -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:]( v81,  "_clientConnectionStartOnDemand:xpcCnx:error:",  v49,  self,  &v160);
            objc_storeStrong(v82, v160);
            goto LABEL_29;
          }

          if (dword_100131328 <= 30
            && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
          {
            LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Avoid bringing up on-demand connection when the client is reactivated\n");
          }

          id v127 = RPErrorF( 4294960573LL,  (uint64_t)"Re-activation of on-demand connection failed",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)v134);
          uint64_t v122 = objc_claimAutoreleasedReturnValue(v127);
          goto LABEL_131;
        }

        v105 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findUnauthDeviceForIdentifier:]( self->_daemon,  "findUnauthDeviceForIdentifier:",  v140));
        id v49 = v105;
        unint64_t v74 = v137;
        if (v105)
        {
          objc_storeStrong((id *)&self->_daemonDevice, v105);
          v106 = self->_daemon;
          v107 = (id *)(v170 + 5);
          id v159 = (id)v170[5];
          -[RPCompanionLinkDaemon _clientConnectionStartUnauth:client:publicID:xpcCnx:error:]( v106,  "_clientConnectionStartUnauth:client:publicID:xpcCnx:error:",  v49,  v139,  v140,  self,  &v159);
          objc_storeStrong(v107, v159);
          goto LABEL_29;
        }
      }

      if ((v74 & 0x1000010000000LL) == 0x1000000000000LL)
      {
        v108 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findAuthAWDLPairingModeDeviceForIdentifier:]( self->_daemon,  "findAuthAWDLPairingModeDeviceForIdentifier:",  v140));
        id v49 = v108;
        if (v108)
        {
          [v108 setIdentifier:v140];
          objc_storeStrong((id *)&self->_daemonDevice, v49);
          v109 = self->_daemon;
          v110 = (id *)(v170 + 5);
          id v158 = (id)v170[5];
          -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:]( v109,  "_clientConnectionStartOnDemand:xpcCnx:error:",  v49,  self,  &v158);
          objc_storeStrong(v110, v158);
          goto LABEL_29;
        }
      }

      if ((v137 & 0x10800000) != 0)
      {
        v111 = (__CFString *)objc_claimAutoreleasedReturnValue([v139 cloudServiceID]);
        if (v111) {
          goto LABEL_118;
        }
        if ((-[NSString isEqual:](self->_appID, "isEqual:", @"com.apple.coreduetd") & 1) != 0
          || -[NSString isEqual:](self->_appID, "isEqual:", @"com.apple.knowledge-agent"))
        {
          v111 = @"com.apple.private.alloy.coreduet.sync";
          [v139 setCloudServiceID:v111];
LABEL_118:
          id v118 = v138;
          objc_msgSend(v118, "setStatusFlags:", (unint64_t)objc_msgSend(v118, "statusFlags") | 0x100000);
          objc_storeStrong((id *)&self->_daemonDevice, v138);
          objc_msgSend(v139, "setControlFlags:", (unint64_t)objc_msgSend(v139, "controlFlags") | 0x10000000);
          v119 = self->_daemon;
          v120 = (id *)(v170 + 5);
          id v157 = (id)v170[5];
          -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:]( v119,  "_clientConnectionStartOnDemand:xpcCnx:error:",  v118,  self,  &v157);
          objc_storeStrong(v120, v157);
          LOBYTE(v120) = v170[5] == 0;

          uint64_t v26 = v118;
          goto LABEL_132;
        }

        id v123 = RPErrorF(4294960591LL, (uint64_t)"No cloudServiceID", v112, v113, v114, v115, v116, v117, (uint64_t)v134);
        uint64_t v122 = objc_claimAutoreleasedReturnValue(v123);
      }

      else
      {
        if ((~(_DWORD)v137 & 0x220000) == 0)
        {
          id v49 = (void *)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkDaemon findConnectedDeviceForIdentifier:controlFlags:cnx:]( self->_daemon,  "findConnectedDeviceForIdentifier:controlFlags:cnx:",  v140,  v137 & 0xFFFFFFFFFFDFFFFFLL,  0LL));
          if (v49)
          {
            if (dword_100131328 <= 30
              && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
            {
              LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkActivateClient:completion:]",  30LL,  "Found WiFi device destination for ForceAWDL client: %@\n",  v138);
            }

            objc_storeStrong((id *)&self->_daemonDevice, v138);
            v132 = self->_daemon;
            v133 = (id *)(v170 + 5);
            id v156 = (id)v170[5];
            -[RPCompanionLinkDaemon _clientConnectionStartOnDemand:xpcCnx:error:]( v132,  "_clientConnectionStartOnDemand:xpcCnx:error:",  v138,  self,  &v156);
            objc_storeStrong(v133, v156);
LABEL_29:
            uint64_t v26 = v49;
            if (!v170[5]) {
              goto LABEL_30;
            }
            goto LABEL_132;
          }
        }

        id v121 = RPErrorF( 4294960569LL,  (uint64_t)"Destination device not found: %@",  v40,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v138);
        uint64_t v122 = objc_claimAutoreleasedReturnValue(v121);
      }
    }

    id v49 = 0LL;
LABEL_131:
    v128 = (void *)v170[5];
    v170[5] = v122;

    uint64_t v26 = v49;
LABEL_132:

    v84 = v140;
LABEL_103:
  }

- (void)companionLinkUpdateClient:(id)a3
{
  id v29 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0LL);
  uint64_t v5 = v29;
  if (v4)
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkUpdateClient:]",  30LL,  "Update client from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    id v6 = -[RPCompanionLinkClient controlFlags](self->_client, "controlFlags");
    id v7 = [v29 controlFlags];
    if (v7 != v6) {
      -[RPCompanionLinkClient setControlFlags:](self->_client, "setControlFlags:", v7);
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient serviceType](self->_client, "serviceType"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v29 serviceType]);
    id v10 = v8;
    id v11 = v9;
    uint64_t v12 = v11;
    if (v10 == v11)
    {
    }

    else
    {
      if ((v10 == 0LL) != (v11 != 0LL))
      {
        unsigned __int8 v13 = [v10 isEqual:v11];

        if ((v13 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      -[RPCompanionLinkClient setServiceType:](self->_client, "setServiceType:", v12);
    }

- (void)companionLinkTriggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v9 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v15 = 0LL;
  unsigned __int8 v10 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v15);
  id v11 = v15;
  if ((v10 & 1) != 0)
  {
    daemon = self->_daemon;
    id v14 = v11;
    -[RPCompanionLinkDaemon triggerEnhancedDiscoveryForReason:useCase:error:]( daemon,  "triggerEnhancedDiscoveryForReason:useCase:error:",  v8,  v6,  &v14);
    id v13 = v14;

    id v11 = v13;
  }

  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)companionLinkCreateDeviceToEndpointMappingForDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v15 = 0LL;
  unsigned __int8 v8 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v15);
  id v9 = v15;
  if ((v8 & 1) != 0)
  {
    daemon = self->_daemon;
    id v13 = v9;
    id v14 = 0LL;
    -[RPCompanionLinkDaemon createDeviceToEndpointMappingForDeviceID:endpointUUID:error:]( daemon,  "createDeviceToEndpointMappingForDeviceID:endpointUUID:error:",  v6,  &v14,  &v13);
    id v11 = v14;
    id v12 = v13;

    if (v7) {
      v7[2](v7, v11, v12);
    }
  }

  else
  {
    if (v7) {
      v7[2](v7, 0LL, v9);
    }
    id v12 = v9;
  }
}

- (void)companionLinkRegisterEventID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v27 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v27);
  id v11 = v27;
  if (v11)
  {
    id v12 = v11;
LABEL_3:
    if (v10) {
      v10[2](v10, v12);
    }
    goto LABEL_17;
  }

  if (CFDictionaryGetInt64(v9, @"interest", 0LL))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (!v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 identifier]);

      if (!v13)
      {
        id v25 = RPErrorF(4294960588LL, (uint64_t)"Interest with no peer identifier", v15, v16, v17, v18, v19, v20, v26);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v25);
        if (dword_100131328 <= 90
          && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
        {
          LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkRegisterEventID:options:completion:]",  90LL,  "### Register interest event failed: '%@', %{error}\n",  v8,  v12);
        }

        goto LABEL_3;
      }
    }

    -[RPCompanionLinkDaemon interestRegisterEventID:peerIdentifier:owner:]( self->_daemon,  "interestRegisterEventID:peerIdentifier:owner:",  v8,  v13,  self);
  }

  registeredEvents = self->_registeredEvents;
  if (!registeredEvents)
  {
    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v23 = self->_registeredEvents;
    self->_registeredEvents = v22;

    registeredEvents = self->_registeredEvents;
  }

  if (v9) {
    unsigned __int8 v24 = v9;
  }
  else {
    unsigned __int8 v24 = &__NSDictionary0__struct;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](registeredEvents, "setObject:forKeyedSubscript:", v24, v8);
  if (v10) {
    v10[2](v10, 0LL);
  }
  id v12 = 0LL;
LABEL_17:
}

- (void)companionLinkDeregisterEventID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v8 = v11;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v9
      || (unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]),
          v10,
          v9))
    {
      -[RPCompanionLinkDaemon interestDeregisterEventID:peerIdentifier:owner:]( self->_daemon,  "interestDeregisterEventID:peerIdentifier:owner:",  v6,  v9,  self);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredEvents,  "setObject:forKeyedSubscript:",  0LL,  v6);
    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)companionLinkSendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  uint64_t v19 = (void (**)(id, void *))a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v36 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v36);
  id v20 = v36;
  if (v20)
  {
    uint64_t v33 = v20;
    id v21 = 0LL;
    if (!v19) {
      goto LABEL_10;
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWActivityMetrics metricsUsingToken:]( &OBJC_CLASS___RPNWActivityEventMetrics,  "metricsUsingToken:",  v18));
    [v21 setDestination:v16];
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWActivityUtils updateOptions:withNWActivityMetrics:]( &OBJC_CLASS___RPNWActivityUtils,  "updateOptions:withNWActivityMetrics:",  v17,  v21));

    if (![v16 isEqual:@"rapport:rdid:DirectPeer"])
    {
LABEL_8:
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _updateOptionsWithProcessInfo:]( self,  "_updateOptionsWithProcessInfo:",  v22));

      -[RPCompanionLinkDaemon sendEventID:event:destinationID:options:completion:]( self->_daemon,  "sendEventID:event:destinationID:options:completion:",  v14,  v15,  v16,  v17,  v19);
      goto LABEL_9;
    }

    uint64_t v23 = self->_netCnx;
    if (v23)
    {
      unsigned __int8 v24 = v23;
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _updateOptionsWithProcessInfo:]( self,  "_updateOptionsWithProcessInfo:",  v22));

      -[RPConnection sendEncryptedEventID:event:options:completion:]( v24,  "sendEncryptedEventID:event:options:completion:",  v14,  v15,  v17,  v19);
LABEL_9:
      uint64_t v33 = 0LL;
      goto LABEL_10;
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v25
      || (uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v26 identifier]),
          v26,
          v25))
    {

      id v16 = (id)v25;
      goto LABEL_8;
    }

    id v34 = RPErrorF(4294960591LL, (uint64_t)"DirectPeer with no destination device", v27, v28, v29, v30, v31, v32, v35);
    id v17 = v22;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (!v19) {
      goto LABEL_10;
    }
  }

  if (v33) {
    v19[2](v19, v33);
  }
LABEL_10:
}

- (void)companionLinkRegisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v25 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v25);
  id v8 = v25;
  if (v8)
  {
    id v9 = v8;
LABEL_3:
    if (v7) {
      v7[2](v7, v9);
    }
    goto LABEL_5;
  }

  if ((-[NSMutableSet containsObject:](self->_registeredProfileIDs, "containsObject:", v6) & 1) != 0
    || -[NSMutableSet containsObject:](self->_daemon->_registeredProfileIDs, "containsObject:", v6))
  {
    id v16 = RPErrorF(4294960566LL, (uint64_t)"Profile already registered", v10, v11, v12, v13, v14, v15, v24);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (dword_100131328 <= 90
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkRegisterProfileID:completion:]",  90LL,  "### Register profileID failed: '%@', %{error}\n",  v6,  v9);
    }

    goto LABEL_3;
  }

  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL))) {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkRegisterProfileID:completion:]",  30LL,  "Register profileID '%@'\n",  v6);
  }
  registeredProfileIDs = self->_registeredProfileIDs;
  if (!registeredProfileIDs)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v19 = self->_registeredProfileIDs;
    self->_registeredProfileIDs = v18;

    registeredProfileIDs = self->_registeredProfileIDs;
  }

  -[NSMutableSet addObject:](registeredProfileIDs, "addObject:", v6);
  id v20 = self->_daemon->_registeredProfileIDs;
  if (!v20)
  {
    id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    daemon = self->_daemon;
    uint64_t v23 = daemon->_registeredProfileIDs;
    daemon->_registeredProfileIDs = v21;

    id v20 = self->_daemon->_registeredProfileIDs;
  }

  -[NSMutableSet addObject:](v20, "addObject:", v6);
  if (v7) {
    v7[2](v7, 0LL);
  }
  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  id v9 = 0LL;
LABEL_5:
}

- (void)companionLinkDeregisterProfileID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  id v8 = v9;
  if (v8)
  {
    if (v7) {
      v7[2](v7, v8);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkDeregisterProfileID:completion:]",  30LL,  "Deregister profileID '%@'\n",  v6);
    }

    -[NSMutableSet removeObject:](self->_registeredProfileIDs, "removeObject:", v6);
    -[NSMutableSet removeObject:](self->_daemon->_registeredProfileIDs, "removeObject:", v6);
    if (v7) {
      v7[2](v7, 0LL);
    }
    -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  }
}

- (void)companionLinkRegisterRequestID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v16 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v16);
  id v11 = v16;
  if (!v11)
  {
    registeredRequests = self->_registeredRequests;
    if (!registeredRequests)
    {
      uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v14 = self->_registeredRequests;
      self->_registeredRequests = v13;

      registeredRequests = self->_registeredRequests;
    }

    if (v9) {
      uint64_t v15 = v9;
    }
    else {
      uint64_t v15 = &__NSDictionary0__struct;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](registeredRequests, "setObject:forKeyedSubscript:", v15, v8);
  }

  if (v10) {
    v10[2](v10, v11);
  }
}

- (void)companionLinkDeregisterRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v9);
  id v8 = v9;
  if (!v8) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_registeredRequests,  "setObject:forKeyedSubscript:",  0LL,  v6);
  }
  if (v7) {
    v7[2](v7, v8);
  }
}

- (void)companionLinkSendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 nwActivityToken:(id)a7 responseHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v36 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v36);
  id v20 = v36;
  if (v20)
  {
    uint64_t v33 = v20;
    id v21 = 0LL;
    if (!v19) {
      goto LABEL_10;
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWActivityMetrics metricsUsingToken:]( &OBJC_CLASS___RPNWActivityRequestMetrics,  "metricsUsingToken:",  v18));
    [v21 setDestination:v16];
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWActivityUtils updateOptions:withNWActivityMetrics:]( &OBJC_CLASS___RPNWActivityUtils,  "updateOptions:withNWActivityMetrics:",  v17,  v21));

    if (![v16 isEqual:@"rapport:rdid:DirectPeer"])
    {
LABEL_8:
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _updateOptionsWithProcessInfo:]( self,  "_updateOptionsWithProcessInfo:",  v22));

      -[RPCompanionLinkDaemon sendRequestID:request:destinationID:xpcID:options:responseHandler:]( self->_daemon,  "sendRequestID:request:destinationID:xpcID:options:responseHandler:",  v14,  v15,  v16,  self->_xpcID,  v17,  v19);
      goto LABEL_9;
    }

    uint64_t v23 = self->_netCnx;
    if (v23)
    {
      uint64_t v24 = v23;
      id v17 = (id)objc_claimAutoreleasedReturnValue( -[RPCompanionLinkXPCConnection _updateOptionsWithProcessInfo:]( self,  "_updateOptionsWithProcessInfo:",  v22));

      -[RPConnection sendEncryptedRequestID:request:xpcID:options:responseHandler:]( v24,  "sendEncryptedRequestID:request:xpcID:options:responseHandler:",  v14,  v15,  self->_xpcID,  v17,  v19);
LABEL_9:
      uint64_t v33 = 0LL;
      goto LABEL_10;
    }

    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDevice identifier](self->_daemonDevice, "identifier"));
    if (v25
      || (uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient destinationDevice](self->_client, "destinationDevice")),
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v26 identifier]),
          v26,
          v25))
    {

      id v16 = (id)v25;
      goto LABEL_8;
    }

    id v34 = RPErrorF(4294960591LL, (uint64_t)"DirectPeer with no destination device", v27, v28, v29, v30, v31, v32, v35);
    id v17 = v22;
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (!v19) {
      goto LABEL_10;
    }
  }

  if (v33) {
    (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0LL, 0LL, v33);
  }
LABEL_10:
}

- (void)companionLinkTryPassword:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v4 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0LL);
  uint64_t v5 = v8;
  if (v4)
  {
    id v6 = self->_netCnx;
    id v7 = v6;
    if (v6)
    {
      -[RPConnection tryPassword:](v6, "tryPassword:", v8);
    }

    else if (dword_100131328 <= 90 {
           && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 90LL)))
    }
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkTryPassword:]",  90LL,  "### No connection to try password from %#{pid}\n",  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    uint64_t v5 = v8;
  }
}

- (void)companionLinkSetLocalDeviceAsContextCollector:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0LL;
  unsigned __int8 v5 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v6 = v11;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v10 = v6;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
  objc_msgSend(v8, "setStatusFlags:", (unint64_t)objc_msgSend(v8, "statusFlags") | 0x400000000);

  self->_isContextCollector = 1;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkSetLocalDeviceAsContextCollector:]",  30LL,  "Setting local device as context collector: '%@'\n",  v9);
  }

  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  if (v4)
  {
    id v10 = 0LL;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v10);
  }

- (void)companionLinkRemoveLocalDeviceAsContextCollector:(id)a3
{
  unsigned int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v11 = 0LL;
  unsigned __int8 v5 = -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v11);
  id v6 = v11;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v10 = v6;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
  objc_msgSend(v8, "setStatusFlags:", (unint64_t)objc_msgSend(v8, "statusFlags") & 0xFFFFFFFBFFFFFFFFLL);

  self->_isContextCollector = 0;
  if (dword_100131328 <= 30 && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection companionLinkRemoveLocalDeviceAsContextCollector:]",  30LL,  "Removing local device as context collector: '%@'\n",  v9);
  }

  -[RPCompanionLinkDaemon _update](self->_daemon, "_update");
  if (v4)
  {
    id v10 = 0LL;
LABEL_10:
    ((void (**)(id, id))v4)[2](v4, v10);
  }

- (void)xpcDiscoveryActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v10);
  id v9 = v10;
  if (v9)
  {
    if (v8) {
      v8[2](v8, 0LL, v9);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection xpcDiscoveryActivate:completion:]",  30LL,  "Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_discoveryClient, a3);
  }
}

- (void)xpcDiscoveryUpdate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0LL)
    && dword_100131328 <= 30
    && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
  {
    LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection xpcDiscoveryUpdate:]",  30LL,  "Update: %@, from %#{pid}\n",  v4,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
  }
}

- (void)xpcServerActivate:(id)a3 completion:(id)a4
{
  id v37 = a3;
  id v6 = a3;
  uint64_t v49 = 0LL;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  BOOL v52 = sub_10000B284;
  id v53 = sub_10000B294;
  id v54 = 0LL;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100039DE8;
  v46[3] = &unk_100112140;
  id v48 = &v49;
  id v7 = a4;
  id v47 = v7;
  id v38 = objc_retainBlock(v46);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v8 = (id *)(v50 + 5);
  id obj = (id)v50[5];
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj);
  objc_storeStrong(v8, obj);
  if (!v50[5])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceType]);
    if ([v9 length])
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon activeServers](self->_daemon, "activeServers"));
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v17 = v16;
      id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
      if (v18)
      {
        uint64_t v19 = *(void *)v42;
        while (2)
        {
          for (i = 0LL; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v41 + 1) + 8 * (void)i) serviceType]);
            unsigned int v22 = [v21 isEqual:v9];

            if (v22)
            {
              id v30 = RPErrorF( 4294960575LL,  (uint64_t)"Service type already in use: '%@'",  v23,  v24,  v25,  v26,  v27,  v28,  (uint64_t)v9);
              uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
              uint64_t v32 = (void *)v50[5];
              v50[5] = v31;

              goto LABEL_23;
            }
          }

          id v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v41,  v55,  16LL);
          if (v18) {
            continue;
          }
          break;
        }
      }

      unsigned __int8 v29 = [v6 internalAuthFlags];
      if ((v29 & 1) != 0)
      {
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100039EA4;
        v40[3] = &unk_100111C38;
        v40[4] = self;
        [v6 setShowPasswordHandler:v40];
      }

      if ((v29 & 2) != 0)
      {
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_100039F04;
        v39[3] = &unk_100111C60;
        v39[4] = self;
        [v6 setHidePasswordHandler:v39];
      }

      if (dword_100131328 <= 30
        && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
      {
        LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection xpcServerActivate:completion:]",  30LL,  "Activate: %@, from %#{pid}\n",  v6,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"),  v37);
      }

      [v6 setDispatchQueue:self->_dispatchQueue];
      objc_storeStrong((id *)&self->_server, v37);
      if (!v17)
      {
        id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        -[RPCompanionLinkDaemon setActiveServers:](self->_daemon, "setActiveServers:", v17);
      }

      -[NSMutableSet addObject:](v17, "addObject:", v6);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkDaemon localDeviceInfo](self->_daemon, "localDeviceInfo"));
      [v33 setServersChangedState:6];

      -[RPCompanionLinkDaemon _updateForXPCServerChange](self->_daemon, "_updateForXPCServerChange");
      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    }

    else
    {
      id v34 = RPErrorF(4294960591LL, (uint64_t)"No service type", v10, v11, v12, v13, v14, v15, v36);
      uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
      id v17 = (NSMutableSet *)v50[5];
      v50[5] = v35;
    }

- (void)xpcServerUpdate:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!-[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", 0LL)) {
    goto LABEL_23;
  }
  server = self->_server;
  if (server)
  {
    id v5 = -[RPServer controlFlags](server, "controlFlags");
    id v6 = [v17 controlFlags];
    BOOL v7 = v6 != v5;
    if (v6 != v5) {
      -[RPServer setControlFlags:](self->_server, "setControlFlags:", v6);
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v17 password]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPServer password](self->_server, "password"));
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }

    else
    {
      uint64_t v12 = v11;
      if ((v10 == 0LL) != (v11 != 0LL))
      {
        unsigned __int8 v13 = [v10 isEqual:v11];

        if ((v13 & 1) != 0) {
          goto LABEL_12;
        }
      }

      else
      {
      }

      -[RPServer setPassword:](self->_server, "setPassword:", v10);
      BOOL v7 = 1;
    }

- (void)xpcSessionActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v10 = 0LL;
  -[RPCompanionLinkXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &v10);
  id v9 = v10;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
  }

  else
  {
    if (dword_100131328 <= 30
      && (dword_100131328 != -1 || _LogCategory_Initialize(&dword_100131328, 30LL)))
    {
      LogPrintF( &dword_100131328,  "-[RPCompanionLinkXPCConnection xpcSessionActivate:completion:]",  30LL,  "Activate: %@, from %#{pid}\n",  v7,  -[NSXPCConnection processIdentifier](self->_xpcCnx, "processIdentifier"));
    }

    [v7 setDispatchQueue:self->_dispatchQueue];
    objc_storeStrong((id *)&self->_session, a3);
  }
}

- (id)_findMatchingDevice:(id)a3 inDeviceDictionary:(id)a4
{
  id v5 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allValues", 0));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ([v10 isEqualToDevice:v5])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)clientNeedsWiFiAssertion
{
  return self->_clientNeedsWiFiAssertion;
}

- (void)setClientNeedsWiFiAssertion:(BOOL)a3
{
  self->_clientNeedsWiFiAssertion = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)isContextCollector
{
  return self->_isContextCollector;
}

- (void)setIsContextCollector:(BOOL)a3
{
  self->_isContextCollector = a3;
}

- (RBSProcessIdentifier)rbsPID
{
  return self->_rbsPID;
}

- (void)setRbsPID:(id)a3
{
}

- (RPConnection)netCnx
{
  return self->_netCnx;
}

- (void)setNetCnx:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
}

- (RPCompanionLinkDaemon)daemon
{
  return self->_daemon;
}

- (RPCompanionLinkDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (RPDiscovery)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (OS_dispatch_source)discoveryTimer
{
  return self->_discoveryTimer;
}

- (void)setDiscoveryTimer:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setLaunchInstanceID:(id)a3
{
}

- (BOOL)localDeviceUpdated
{
  return self->_localDeviceUpdated;
}

- (void)setLocalDeviceUpdated:(BOOL)a3
{
  self->_localDeviceUpdated = a3;
}

- (BOOL)needsCLink
{
  return self->_needsCLink;
}

- (void)setNeedsCLink:(BOOL)a3
{
  self->_needsCLink = a3;
}

- (BOOL)needsNearbyActionV2
{
  return self->_needsNearbyActionV2;
}

- (void)setNeedsNearbyActionV2:(BOOL)a3
{
  self->_needsNearbyActionV2 = a3;
}

- (NSString)personaUUID
{
  return self->_personaUUID;
}

- (void)setPersonaUUID:(id)a3
{
}

- (NSMutableDictionary)registeredEvents
{
  return self->_registeredEvents;
}

- (NSMutableSet)registeredProfileIDs
{
  return self->_registeredProfileIDs;
}

- (NSMutableDictionary)registeredRequests
{
  return self->_registeredRequests;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (RPServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (RPSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
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
  self->_uint64_t xpcID = a3;
}

- (void).cxx_destruct
{
}

@end
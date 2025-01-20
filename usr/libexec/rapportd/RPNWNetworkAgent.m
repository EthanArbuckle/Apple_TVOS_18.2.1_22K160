@interface RPNWNetworkAgent
+ (id)getCurrentPersona;
+ (id)getLogInfo;
+ (id)sharedNetworkAgent;
- (BOOL)_isTCPTransport:(id)a3;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)createBrowseAgent;
- (BOOL)createConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7;
- (BOOL)createListenerFramer:(id)a3;
- (BOOL)createNearbyInvitationConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7;
- (BOOL)createNetworkAgent;
- (BOOL)createRapportServer;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)discoverDevices:(id)a3 response:(id)a4 nearbyInvitation:(BOOL)a5;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (BOOL)setupBrowseHandlers;
- (BOOL)setupFlowHandlers;
- (BOOL)setupListenHandlers;
- (BOOL)setupPolicyWithQueue:(id)a3 browseAgent:(BOOL)a4;
- (BOOL)setupResolveHandlers;
- (NSUUID)browseAgentID;
- (NSUUID)networkAgentID;
- (OS_dispatch_queue)dispatchQueue;
- (id)_applicationServiceAdvertiseDescriptorForClient:(id)a3;
- (id)_localPublicKeyForAgentClient:(id)a3;
- (id)_quicProtocolOptionsFromParameters:(id)a3;
- (id)descriptionWithLevel:(int)a3;
- (id)getDiscoveryDeviceTypesDescription:(unsigned int)a3;
- (id)getPersonaFromParameters:(id)a3;
- (unint64_t)convertBrowseParamsToControlFlags:(id)a3;
- (unint64_t)convertBrowseScopeToControlFlags:(unsigned int)a3;
- (unint64_t)convertConnectionParametersToControlFlags:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_update;
- (void)activate;
- (void)createListener:(id)a3 nearbyInvitation:(BOOL)a4;
- (void)executeAgentLogicInPersona:(id)a3 pid:(int)a4 handlerDescription:(id)a5 handler:(id)a6;
- (void)invalidate;
- (void)resolveRequest:(id)a3 existingEndpoint:(id)a4 controlFlags:(unint64_t)a5 clientPublicKey:(id)a6 client:(id)a7;
- (void)setBrowseAgentID:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNetworkAgentID:(id)a3;
- (void)setupAssertHandlers:(id)a3;
- (void)startFlow:(id)a3 listener:(id)a4 client:(id)a5 assign:(id)a6 parameters:(id)a7;
@end

@implementation RPNWNetworkAgent

+ (id)sharedNetworkAgent
{
  if (qword_100133590 != -1) {
    dispatch_once(&qword_100133590, &stru_100113A88);
  }
  return (id)qword_100133588;
}

- (id)getPersonaFromParameters:(id)a3
{
  uint64_t v3 = nw_parameters_copy_application_id(a3, a2);
  v4 = (void *)v3;
  if (v3)
  {
    *(void *)uu = 0LL;
    uint64_t v10 = 0LL;
    nw_application_id_get_persona(v3, uu);
    v5 = 0LL;
    if (!uuid_is_null(uu))
    {
      v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", uu);
      v7 = v6;
      if (v6) {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v6, "UUIDString"));
      }
      else {
        v5 = 0LL;
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)executeAgentLogicInPersona:(id)a3 pid:(int)a4 handlerDescription:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v8 = a5;
  v9 = (void (**)(void))a6;
  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent executeAgentLogicInPersona:pid:handlerDescription:handler:]",  30LL,  "Executing '%@' as default persona\n",  v8,  v10);
  }
  v9[2](v9);
}

+ (id)getLogInfo
{
  return &stru_1001152C8;
}

+ (id)getCurrentPersona
{
  return 0LL;
}

- (id)descriptionWithLevel:(int)a3
{
  id v5 = 0LL;
  NSAppendPrintF(&v5, "-- RPNWNetworkAgent --\n", *(void *)&a3);
  id v3 = v5;
  +[RPNWAgentClient listAgentClients:](&OBJC_CLASS___RPNWAgentClient, "listAgentClients:", v3);
  +[RPNWEndpoint listEndpoints:](&OBJC_CLASS___RPNWEndpoint, "listEndpoints:", v3);
  +[RPNWListener listAllowedApplicationServices:](&OBJC_CLASS___RPNWListener, "listAllowedApplicationServices:", v3);
  +[RPNWConnection listConnections:](&OBJC_CLASS___RPNWConnection, "listConnections:", v3);
  return v3;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075278;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100075340;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent _invalidate]", 30LL, "Invalidate\n");
    }

    -[RPNWNetworkAgent _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)_update
{
  if (self->_prefNetworkAgentEnabled) {
    -[RPNWNetworkAgent _ensureStarted](self, "_ensureStarted");
  }
  else {
    -[RPNWNetworkAgent _ensureStopped](self, "_ensureStopped");
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (id)getDiscoveryDeviceTypesDescription:(unsigned int)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v4, "appendString:", @"<");
  if (a3 == -1)
  {
    id v5 = @" all devices";
LABEL_16:
    -[NSMutableString appendString:](v4, "appendString:", v5);
    goto LABEL_17;
  }

  if ((a3 & 1) != 0)
  {
    -[NSMutableString appendString:](v4, "appendString:", @" iPhone");
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }

  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }

  -[NSMutableString appendString:](v4, "appendString:", @" iPad");
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }

- (unint64_t)convertBrowseScopeToControlFlags:(unsigned int)a3
{
  uint64_t v3 = 12288LL;
  if (a3) {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (a3 << 18) & 0x100000LL | ((((unint64_t)(a3 & 8) >> 3) & 1) << 44) | v3 | (a3 << 11) & 0x1000 | (a3 << 9) & 0x2000 | ((unint64_t)(a3 & 0x40) << 37) & 0xFFFFDFFFFFFFFFFFLL | ((((unint64_t)(a3 & 0x20) >> 5) & 1) << 45);
  if ((a3 & 0x80) != 0) {
    return 0x380000103C00LL;
  }
  else {
    return v4;
  }
}

- (unint64_t)convertConnectionParametersToControlFlags:(id)a3
{
  id v3 = a3;
  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent convertConnectionParametersToControlFlags:]",  30LL,  "Called convertConnectionParametersToControlFlags with parameters=%@",  v3);
  }
  unint64_t v4 = 0x60000220000LL;
  int next_hop_required_interface_subtype = nw_parameters_get_next_hop_required_interface_subtype(v3);
  if (next_hop_required_interface_subtype != 1002)
  {
    if (next_hop_required_interface_subtype == 1001)
    {
      unint64_t v4 = 0x60000400000LL;
    }

    else if (nw_parameters_get_include_ble(v3))
    {
      unint64_t v4 = 0x40000600100LL;
    }

    else
    {
      unint64_t v4 = 0LL;
    }
  }

  v6 = (void *)nw_parameters_copy_prohibited_interface_subtypes(v3);
  if (xpc_array_get_count(v6))
  {
    size_t v7 = 0LL;
    do
    {
      int uint64 = xpc_array_get_uint64(v6, v7);
      uint64_t v9 = v4 | 0x400000;
      else {
        unint64_t v4 = v9;
      }
      ++v7;
    }

    while (v7 < xpc_array_get_count(v6));
  }

  id v10 = (void *)nw_parameters_copy_preferred_interface_subtypes(v3);
  if (xpc_array_get_count(v10))
  {
    size_t v11 = 0LL;
    do
    {
      ++v11;
    }

    while (v11 < xpc_array_get_count(v10));
  }

  if (dword_100132768 < 31 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent convertConnectionParametersToControlFlags:]",  30LL,  "Returning control flags: CF %#ll{flags}\n",  v4,  &unk_10010A9C5);
  }

  return v4;
}

- (unint64_t)convertBrowseParamsToControlFlags:(id)a3
{
  id v3 = a3;
  int include_ble = nw_parameters_get_include_ble(v3);
  int include_screen_off_devices = nw_parameters_get_include_screen_off_devices(v3);
  uint64_t v6 = 2LL;
  if (!include_ble) {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = 65538LL;
  if (!include_ble) {
    uint64_t v7 = 0LL;
  }
  if (include_screen_off_devices) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (nw_parameters_get_next_hop_required_interface_type(v3))
  {
    LOBYTE(include_ble) = 1;
  }

  if (nw_parameters_get_next_hop_required_interface_subtype(v3))
  {
    int next_hop_required_interface_subtype = nw_parameters_get_next_hop_required_interface_subtype(v3);
    if (next_hop_required_interface_subtype == 1002)
    {
      if (dword_100132768 <= 60
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 60LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]",  60LL,  "Browsing with AWDL unsupported over Rapport");
      }
    }

    else if (next_hop_required_interface_subtype == 1001)
    {
      v8 |= 4uLL;
    }

    id v10 = (void *)nw_parameters_copy_preferred_interface_subtypes(v3);
    goto LABEL_18;
  }

  size_t v11 = (void *)nw_parameters_copy_preferred_interface_subtypes(v3);
  id v10 = v11;
  if ((include_ble & 1) != 0)
  {
LABEL_18:
    BOOL v12 = 1;
    goto LABEL_19;
  }

  BOOL v12 = xpc_array_get_count(v11) != 0;
LABEL_19:
  if (xpc_array_get_count(v10))
  {
    size_t v13 = 0LL;
    do
    {
      int uint64 = xpc_array_get_uint64(v10, v13);
      if (uint64 == 1002)
      {
        if (dword_100132768 <= 60
          && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 60LL)))
        {
          LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]",  60LL,  "Browsing with AWDL unsupported over Rapport");
        }
      }

      else if (uint64 == 1001)
      {
        v8 |= 4uLL;
      }

      ++v13;
    }

    while (v13 < xpc_array_get_count(v10));
  }

  v15 = (void *)nw_parameters_copy_prohibited_interface_subtypes(v3);
  if (xpc_array_get_count(v15))
  {
    size_t v16 = 0LL;
    do
    {
      int v17 = xpc_array_get_uint64(v15, v16);
      unint64_t v18 = v8 & 0xFFFFFFFFFFFFFFFBLL;
      if (v17 != 1001) {
        unint64_t v18 = v8;
      }
      if (v17 == 1002) {
        v8 &= ~8uLL;
      }
      else {
        unint64_t v8 = v18;
      }
      ++v16;
    }

    while (v16 < xpc_array_get_count(v15));
  }

  if (v15)
  {
    if (dword_100132768 <= 60
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 60LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent convertBrowseParamsToControlFlags:]",  60LL,  "Both prohibited interface types and prohibited interface subtypes are set. Overriding types with subtypes");
    }
  }

  else
  {
    v19 = (void *)nw_parameters_copy_prohibited_interface_types(v3);
    v20 = v19;
    if (v19) {
      int v21 = 1;
    }
    else {
      int v21 = v12;
    }
    if (xpc_array_get_count(v19))
    {
      size_t v22 = 0LL;
      do
      {
        int v23 = xpc_array_get_uint64(v20, v22);
        unint64_t v24 = v8 & 0xFFFFFFFFFFFFFFFBLL;
        if (v23 != 1001) {
          unint64_t v24 = v8;
        }
        if (v23 == 1002) {
          v8 &= ~8uLL;
        }
        else {
          unint64_t v8 = v24;
        }
        ++v22;
      }

      while (v22 < xpc_array_get_count(v20));
    }

    if (!v21) {
      unint64_t v8 = 32774LL;
    }
  }

  return v8;
}

- (BOOL)discoverDevices:(id)a3 response:(id)a4 nearbyInvitation:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 browseDescriptor]);

  if (!v10)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  30LL,  "Called discoverDevices with nil browse_descriptor");
    }

    goto LABEL_46;
  }

  if (!v5)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      size_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 browseDescriptor]);
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  30LL,  "Called discoverDevices, browse_descriptor=%@\n",  v11);
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 browseDescriptor]);
    uint64_t device_types = nw_browse_descriptor_get_device_types();

    if ((_DWORD)device_types)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v8 browseDescriptor]);
      uint64_t browse_scope = nw_browse_descriptor_get_browse_scope();

      if (dword_100132768 <= 10
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 10LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  10LL,  "Got browse scope %X\n",  browse_scope);
      }

      unint64_t v16 = -[RPNWNetworkAgent convertBrowseScopeToControlFlags:]( self,  "convertBrowseScopeToControlFlags:",  browse_scope);
      int v17 = (void *)objc_claimAutoreleasedReturnValue([v8 browseClient]);
      unint64_t v18 = (void *)nw_agent_client_copy_parameters();

      if (dword_100132768 <= 10
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 10LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  10LL,  "Got browse params %@\n",  v18);
      }

      unint64_t v19 = -[RPNWNetworkAgent convertBrowseParamsToControlFlags:](self, "convertBrowseParamsToControlFlags:", v18) | v16;
      v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v8 browseDescriptor]);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_100075FEC;
      v32[3] = &unk_100113AB0;
      size_t v22 = v20;
      v33 = v22;
      nw_browse_descriptor_enumerate_device_filters(v21, v32);

      if (dword_100132768 <= 10
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 10LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  10LL,  "Got control flags: %ll{flags}",  v19,  &unk_10010A9C5);
      }

      int v23 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationService]);

      if (v23)
      {
        if (dword_100132768 <= 30
          && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
        {
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationService]);
          v25 = (void *)objc_claimAutoreleasedReturnValue( -[RPNWNetworkAgent getDiscoveryDeviceTypesDescription:]( self,  "getDiscoveryDeviceTypesDescription:",  device_types));
          LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  30LL,  "Called discoverDevices with appSvc='%@', device types=%@\n",  v24,  v25);
        }

        networkAgentID = self->_networkAgentID;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v8 applicationService]);
        [v8 startDiscovery:v9 deviceTypes:device_types controlFlags:v19 deviceFilter:v22 agentUUID:networkAgentID applicationService:v29];
      }

      else if (dword_100132768 <= 30 {
             && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
      }
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  30LL,  "Called discoverDevices with no application service name\n");
      }

      if (v23) {
        goto LABEL_44;
      }
    }

    else if (dword_100132768 <= 30 {
           && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    }
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent discoverDevices:response:nearbyInvitation:]",  30LL,  "Called discoverDevices with no device types\n");
    }

- (BOOL)createRapportServer
{
  id v3 = objc_alloc_init(&OBJC_CLASS___RPNWPeer);
  server = self->server;
  self->server = v3;

  -[RPNWPeer receiveWithRequestID:receiveHandler:]( self->server,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.browsing",  &stru_100113AF0);
  BOOL v5 = self->server;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100076304;
  v9[3] = &unk_100113B18;
  v9[4] = self;
  -[RPNWPeer receiveWithRequestID:receiveHandler:]( v5,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.resolve",  v9);
  uint64_t v6 = self->server;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000766A0;
  v8[3] = &unk_100113B18;
  v8[4] = self;
  -[RPNWPeer receiveWithRequestID:receiveHandler:]( v6,  "receiveWithRequestID:receiveHandler:",  @"com.apple.oneapi.connection",  v8);
  -[RPNWPeer handleConnectionData:](self->server, "handleConnectionData:", 1LL);
  return 1;
}

- (BOOL)createListenerFramer:(id)a3
{
  id v4 = a3;
  if ([v4 type] != (id)1)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createListenerFramer:]",  30LL,  "createListenerFramer: incorrect agent type\n");
    }

    goto LABEL_23;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listen_framer"));

  if (v5)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createListenerFramer:]",  30LL,  "createListenerFramer: listen_framer already set\n");
    }

- (BOOL)createConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  id v15 = a7;
  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Setting connection framer options, local=%@, remote=%@\n",  v13,  v14);
  }
  if ([v11 type] != (id)4)
  {
    if ([v11 type] == (id)3)
    {
      if (dword_100132768 <= 30
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Received connection framer request on incoming connection (%@)\n",  v11);
      }

      if (v15)
      {
        id v52 = v15;
        v26 = (RPNWConnection *)v15;
        v54 = v13;
        id v55 = v12;
        v53 = v14;
        v49 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationService]);
        if (dword_100132768 <= 30
          && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
        {
          LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Using incoming connection=%@\n",  v26);
        }

        unsigned int v51 = 0;
        goto LABEL_51;
      }

      if (dword_100132768 <= 90
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "No incoming connection provided\n",  v48);
      }
    }

    else if (dword_100132768 <= 90 {
           && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    }
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "Received connection framer request on invalid agent client type (%@)\n",  v11);
    }

    goto LABEL_75;
  }

  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Received connection framer request on outgoing connection (%@)\n",  v11);
  }
  v64[0] = 0LL;
  v64[1] = 0LL;
  nw_endpoint_get_service_identifier(v14, v64);
  unint64_t v16 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v64);
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](&OBJC_CLASS___RPNWEndpoint, "findEndpoint:", v16));
  if (!v17)
  {
    uint64_t apple_service_apple_id = nw_endpoint_get_apple_service_apple_id(v14);
    if (apple_service_apple_id)
    {
      id v55 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  apple_service_apple_id));
      unint64_t v19 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v28);

      uint64_t v29 = objc_claimAutoreleasedReturnValue(+[RPNWEndpoint findEndpoint:](&OBJC_CLASS___RPNWEndpoint, "findEndpoint:", v19));
      if (v29)
      {
        id v18 = (void *)v29;
        id v52 = v15;
        v53 = v14;
        v54 = v13;

        goto LABEL_19;
      }

      if (dword_100132768 <= 90
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "Failed to find endpoint from ID=%@\n",  v19);
      }

      id v12 = v55;
    }

    else
    {
      if (dword_100132768 <= 90
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "Failed to get UUID from endpoint=%@\n",  v14);
      }

      unint64_t v19 = v16;
    }

LABEL_75:
    id v20 = 0LL;
LABEL_76:
    BOOL v30 = 0;
    goto LABEL_77;
  }

  id v18 = (void *)v17;
  id v52 = v15;
  v53 = v14;
  v54 = v13;
  id v55 = v12;
  unint64_t v19 = v16;
LABEL_19:
  id v20 = (id)objc_claimAutoreleasedReturnValue([v18 applicationService]);
  unsigned int v51 = [v18 shouldAutomapListener];
  int v21 = objc_alloc(&OBJC_CLASS___RPNWConnection);
  size_t v22 = (void *)objc_claimAutoreleasedReturnValue([v18 device]);
  id v23 = [v18 browseSession];
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointUUID]);
  v26 = -[RPNWConnection initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:]( v21,  "initWithPeer:version:inbound:internal:applicationService:connectionID:endpointID:",  v22,  0LL,  0LL,  v23,  v20,  v24,  v25);

  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Found remote endpoint=%@, created connection=%@\n",  v18,  v26);
  }

  if (v26)
  {
    v49 = v20;
LABEL_51:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v26, "peer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v26, "peer"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 destinationDevice]);
    BOOL v34 = -[RPNWConnection inbound](v26, "inbound");
    id v35 = [v11 controlFlags];
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](v26, "endpointUUID"));
    v37 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](v26, "connectionUUID"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472LL;
    v61[2] = sub_1000775CC;
    v61[3] = &unk_100113B90;
    v62 = v26;
    v50 = v37;
    id v39 = v37;
    id v63 = v39;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_100077868;
    v59[3] = &unk_1001110A8;
    v40 = v62;
    v60 = v40;
    [v31 connectToPeer:v33 inboundConnection:v34 controlFlags:v35 applicationService:v49 listenerID:v36 automapListener:v51 connectionID:v38 connectHan dler:v61 lostHandler:v59];

    [v39 setConnection:v40];
    start_handler[0] = _NSConcreteStackBlock;
    start_handler[1] = 3221225472LL;
    start_handler[2] = sub_100077908;
    start_handler[3] = &unk_100113BE0;
    v57 = v40;
    id v20 = v49;
    id v58 = v20;
    v41 = v40;
    definition = nw_framer_create_definition("client-pipe", 0, start_handler);
    nw_protocol_options_t options = nw_framer_create_options(definition);

    nw_protocol_definition_t v44 = nwrapport_copy_protocol_definition();
    if (dword_100132768 <= 40
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 40LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  40LL,  "Setting peer protocol definition: '%@'",  v44);
    }

    nw_framer_options_set_peer_protocol_definition(options, v44);
    id v13 = (__CFString *)v54;
    id v12 = v55;
    v14 = (__CFString *)v53;
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      v45 = @"<NULL>";
      if (v54) {
        v46 = v54;
      }
      else {
        v46 = @"<NULL>";
      }
      if (v53) {
        v45 = v53;
      }
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "assigning connection %@ <-> %@",  v46,  v45);
    }

    (*((void (**)(id, const __CFString *, const __CFString *, nw_protocol_options_t))v55 + 2))( v55,  v54,  v53,  options);

    BOOL v30 = 1;
    id v11 = v50;
    goto LABEL_65;
  }

  if (dword_100132768 <= 90)
  {
    id v13 = (__CFString *)v54;
    id v12 = v55;
    id v15 = v52;
    v14 = (__CFString *)v53;
    if (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)) {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "Failed to find endpoint\n");
    }
    goto LABEL_76;
  }

  BOOL v30 = 0;
  id v13 = (__CFString *)v54;
  id v12 = v55;
  v14 = (__CFString *)v53;
LABEL_65:
  id v15 = v52;
LABEL_77:

  return v30;
}

- (BOOL)createNearbyInvitationConnectionFramer:(id)a3 assign:(id)a4 local:(id)a5 remote:(id)a6 incomingConnection:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  v14 = (__CFString *)a6;
  id v15 = a7;
  unint64_t v16 = &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface;
  if (dword_100132768 <= 30 && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Setting NearbyInvitation connection framer options, local=%@, remote=%@\n",  v13,  v14);
  }
  if ([v11 type] == (id)4)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Received NearbyInvitation connection framer request on outgoing connection (%@)\n",  v11);
    }

    v62[0] = 0LL;
    v62[1] = 0LL;
    nw_endpoint_get_service_identifier(v14, v62);
    unint64_t v19 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v62);
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWNearbyInvitationEndpoint findEndpoint:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "findEndpoint:",  v19));
    if (v20)
    {
      int v21 = v20;
      id v52 = v13;
      id v53 = v12;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v20 applicationService]);
      size_t v22 = objc_alloc(&OBJC_CLASS___RPNWNearbyInvitationConnection);
      id v50 = v15;
      id v23 = v14;
      id v24 = v11;
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 device]);
      id v26 = [v21 browseSession];
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v21 endpointUUID]);
      uint64_t v29 = v22;
      unint64_t v16 = &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface;
      uint64_t v17 = -[RPNWNearbyInvitationConnection initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:]( v29,  "initWithPeer:session:inbound:internal:applicationService:connectionID:endpointID:",  v25,  0LL,  0LL,  v26,  v18,  v27,  v28);

      id v11 = v24;
      v14 = v23;
      id v15 = v50;

      goto LABEL_17;
    }

    if (dword_100132768 <= 90
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "Failed to find NearbyInvitation endpoint from ID=%@\n",  v19);
    }

LABEL_46:
    BOOL v46 = 0;
    goto LABEL_47;
  }

  if ([v11 type] == (id)3)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Received connection framer request on NearbyInvitation incoming connection (%@)\n",  v11);
    }

    if (v15)
    {
      uint64_t v17 = (RPNWNearbyInvitationConnection *)v15;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationService]);
      id v52 = v13;
      id v53 = v12;
      if (dword_100132768 <= 30
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "Using incoming NearbyInvitation connection=%@\n",  v17);
      }

      goto LABEL_17;
    }

    if (dword_100132768 <= 90
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  90LL,  "No NearbyInvitation incoming connection provided\n");
    }

    goto LABEL_46;
  }

  id v52 = v13;
  id v53 = v12;
  uint64_t v17 = 0LL;
  id v18 = 0LL;
LABEL_17:
  BOOL v30 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 nearbyInvitationSession]);

  if (!v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v17, "peer"));
    id v51 = v15;
    v33 = v11;
    BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v49 destinationDevice]);
    unsigned int v48 = -[RPNWNearbyInvitationConnection inbound](v17, "inbound");
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection endpointUUID](v17, "endpointUUID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection connectionUUID](v17, "connectionUUID"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_100078574;
    v59[3] = &unk_100113B90;
    v60 = v17;
    id v61 = v33;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1000787D4;
    v57[3] = &unk_1001110A8;
    id v58 = v60;
    [v32 connectToPeer:v34 inboundConnection:v48 applicationService:v18 listenerID:v35 connectionID:v36 connectHandler:v59 disconnectHandler:v57];

    unint64_t v16 = &OBJC_PROTOCOL___RPNearbyInvitationXPCDaemonInterface;
    id v11 = v33;
    id v15 = v51;
  }

  [v11 setNearbyInvitationConnection:v17];
  start_handler[0] = _NSConcreteStackBlock;
  start_handler[1] = 3221225472LL;
  start_handler[2] = sub_100078874;
  start_handler[3] = &unk_100113BE0;
  id v55 = v17;
  id v56 = v18;
  id v37 = v18;
  v38 = v17;
  definition = nw_framer_create_definition("client-pipe-nbinv", 0, start_handler);
  nw_protocol_options_t options = nw_framer_create_options(definition);

  nw_protocol_definition_t v41 = nwrapport_copy_protocol_definition();
  int inst_meths = (int)v16[26].inst_meths;
  if (inst_meths <= 40 && (inst_meths != -1 || _LogCategory_Initialize(&dword_100132768, 40LL))) {
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  40LL,  "Setting peer protocol definition: '%@'",  v41);
  }
  nw_framer_options_set_peer_protocol_definition(options, v41);
  int v43 = (int)v16[26].inst_meths;
  id v13 = (__CFString *)v52;
  id v12 = v53;
  if (v43 <= 30 && (v43 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
  {
    nw_protocol_definition_t v44 = @"<NULL>";
    if (v52) {
      v45 = v52;
    }
    else {
      v45 = @"<NULL>";
    }
    if (v14) {
      nw_protocol_definition_t v44 = v14;
    }
    LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]",  30LL,  "assigning connection %@ <-> %@",  v45,  v44);
  }

  (*((void (**)(id, const __CFString *, __CFString *, nw_protocol_options_t))v53 + 2))( v53,  v52,  v14,  options);

  BOOL v46 = 1;
LABEL_47:

  return v46;
}

- (BOOL)setupPolicyWithQueue:(id)a3 browseAgent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]",  30LL,  "Configuring agent policies");
    }

    v14 = objc_alloc_init(&OBJC_CLASS___NEPolicySession);
    policySession = self->_policySession;
    self->_policySession = v14;

    unint64_t v16 = self->_policySession;
    if (v16)
    {
      id v30 = v6;
      -[NEPolicySession setPriority:](v16, "setPriority:", 300LL);
      -[NEPolicySession lockSessionToCurrentProcess](self->_policySession, "lockSessionToCurrentProcess");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyResult netAgentUUID:]( &OBJC_CLASS___NEPolicyResult,  "netAgentUUID:",  self->_browseAgentID));
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition allInterfaces](&OBJC_CLASS___NEPolicyCondition, "allInterfaces"));
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition requiredAgentDomain:agentType:]( &OBJC_CLASS___NEPolicyCondition,  "requiredAgentDomain:agentType:",  @"com.apple.rapport.browse",  @"RapportBrowseAgent"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NEPolicyCondition customEntitlement:]( &OBJC_CLASS___NEPolicyCondition,  "customEntitlement:",  @"com.apple.private.application-service-browse"));
      uint64_t v21 = geteuid();
      if (dword_100132768 <= 30
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]",  30LL,  "Constraining agent to UID %d",  v21);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NEPolicyCondition uid:](&OBJC_CLASS___NEPolicyCondition, "uid:", v21));
      v34[0] = v18;
      v34[1] = v19;
      v34[2] = v20;
      v34[3] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 4LL));
      id v26 = [[NEPolicy alloc] initWithOrder:10 result:v17 conditions:v25];
      id v27 = -[NEPolicySession addPolicy:](self->_policySession, "addPolicy:", v26);
      if (v27)
      {
        if (dword_100132768 <= 30
          && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
        {
          LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]",  30LL,  "Applying policies for agent %@",  self->_browseAgentID);
        }

        -[NEPolicySession apply](self->_policySession, "apply");
      }

      else if (dword_100132768 <= 90 {
             && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      }
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]",  90LL,  "Failed to add entitlement allow policy for agent %@",  self->_browseAgentID);
      }

      id v6 = v30;
      if (v27) {
        goto LABEL_42;
      }
    }

    else if (dword_100132768 <= 90 {
           && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    }
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]",  90LL,  "Failed to create policy session");
    }

- (BOOL)setupBrowseHandlers
{
  browseAgent = self->_browseAgent;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000792C4;
  v5[3] = &unk_100113C30;
  v5[4] = self;
  nw_agent_set_browse_handlers(browseAgent, v5, &stru_100113C70);
  return 1;
}

- (void)resolveRequest:(id)a3 existingEndpoint:(id)a4 controlFlags:(unint64_t)a5 clientPublicKey:(id)a6 client:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  unint64_t v16 = objc_alloc_init(&OBJC_CLASS___RPNWPeer);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 device]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 applicationService]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000798E4;
  v21[3] = &unk_100113CC0;
  v21[4] = self;
  id v22 = v13;
  id v23 = v12;
  id v19 = v12;
  id v20 = v13;
  -[RPNWPeer resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:]( v16,  "resolvePeer:controlFlags:applicationService:clientPublicKey:resolveHandler:",  v17,  a5,  v18,  v14,  v21);
}

- (BOOL)setupResolveHandlers
{
  browseAgent = self->_browseAgent;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100079D78;
  v6[3] = &unk_100113C30;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007A43C;
  v5[3] = &unk_100113D10;
  nw_agent_add_resolve_handlers(browseAgent, 6LL, 3LL, v6, v5);
  return 1;
}

- (void)createListener:(id)a3 nearbyInvitation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  else {
    networkAgentID = self->_networkAgentID;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationService]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWPeer createNWEndpointWithID:agentID:applicationService:]( &OBJC_CLASS___RPNWPeer,  "createNWEndpointWithID:agentID:applicationService:",  v7,  networkAgentID,  v9));

  id v11 = (void *)nw_array_create();
  nw_array_append(v11, v10);
  id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v6 browseResponse]);
  ((void (**)(void, void *))v12)[2](v12, v11);

  if (v4)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createListener:nearbyInvitation:]",  30LL,  "%@ LISTEN: Creating NearbyInvitation server\n",  v13);
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___RPNWNearbyInvitationPeer);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10007A9F8;
    v22[3] = &unk_100112230;
    id v23 = v6;
    id v24 = v15;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007AAB4;
    v19[3] = &unk_100111968;
    id v16 = v23;
    id v20 = v16;
    uint64_t v17 = v24;
    uint64_t v21 = v17;
    -[RPNWNearbyInvitationPeer startServer:withCompletion:disconnectHandler:]( v17,  "startServer:withCompletion:disconnectHandler:",  v16,  v22,  v19);
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createListener:nearbyInvitation:]",  30LL,  "%@ LISTEN: Creating NearbyInvitation listen framer\n",  v18);
    }

    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v16);
  }

  else
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createListener:nearbyInvitation:]",  30LL,  "%@ LISTEN: Creating listen framer\n",  v14);
    }

    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v6);
  }
}

- (BOOL)setupListenHandlers
{
  networkAgent = self->_networkAgent;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007AC6C;
  v6[3] = &unk_100113C30;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B148;
  v5[3] = &unk_100113D10;
  nw_agent_set_browse_handlers(networkAgent, v6, v5);
  return 1;
}

- (id)_applicationServiceAdvertiseDescriptorForClient:(id)a3
{
  uint64_t v3 = nw_agent_client_copy_advertise_descriptor(a3, a2);
  BOOL v4 = (void *)v3;
  if (!v3)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _applicationServiceAdvertiseDescriptorForClient:]",  30LL,  "LISTEN: No advertise descriptor available\n");
    }

    goto LABEL_14;
  }

  if (nw_advertise_descriptor_get_type(v3) != 2)
  {
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _applicationServiceAdvertiseDescriptorForClient:]",  30LL,  "LISTEN: Not an application service advertise descriptor, found type=%d\n");
    }

- (void)startFlow:(id)a3 listener:(id)a4 client:(id)a5 assign:(id)a6 parameters:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (nw_parameters *)a7;
  id v16 = (void *)nw_agent_client_copy_endpoint(v13);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v12 nearbyInvitationConnection]);

  id v18 = 0LL;
  if (v12 && !v17)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWListener findListenerForAgentClient:sender:browseRequest:]( &OBJC_CLASS___RPNWListener,  "findListenerForAgentClient:sender:browseRequest:",  v12,  0LL,  0LL));
    id v20 = v19;
    if (v19)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 removeTriggeredConnection]);
      if (v21)
      {
        id v18 = (void *)v21;
        v54 = v11;
        id v22 = v16;
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 incomingConnections]);
        id v24 = [v23 count];

        if (v24)
        {
          if (dword_100132768 <= 30
            && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
          {
            LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]",  30LL,  "FLOW: Found received incoming connection, triggering connection\n");
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue([v20 incomingConnections]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectAtIndexedSubscript:0]);

          id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "listen_framer"));
          +[RPNWFramer startConnection:](&OBJC_CLASS___RPNWFramer, "startConnection:", v27);

          [v20 markConnectionAsTriggered:v26];
        }

        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointUUID]);
        id v48 = v14;
        id v51 = v15;
        else {
          networkAgentID = self->_networkAgentID;
        }
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationService]);
        uint64_t v49 = objc_claimAutoreleasedReturnValue( +[RPNWPeer createNWEndpointWithID:agentID:applicationService:]( &OBJC_CLASS___RPNWPeer,  "createNWEndpointWithID:agentID:applicationService:",  v28,  networkAgentID,  v30));

        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v18 peer]);
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 destinationDevice]);
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v18 endpointUUID]);
        BOOL v34 = (void *)objc_claimAutoreleasedReturnValue([v18 applicationService]);
        +[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]( &OBJC_CLASS___RPNWEndpoint,  "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:",  v32,  v33,  v34,  0LL,  1LL);

        id v14 = v48;
        id v16 = (void *)v49;
        id v15 = v51;
        goto LABEL_25;
      }

      if (dword_100132768 <= 30
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]",  30LL,  "FLOW: Received incoming connection but listener does not have a triggered connection\n");
      }
    }

    else if (dword_100132768 <= 90 {
           && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    }
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]",  90LL,  "FLOW: Received incoming connection but listener agent has no mapping\n");
    }

    goto LABEL_50;
  }

  v54 = v11;
LABEL_25:
  nw_endpoint_t v36 = nw_parameters_copy_local_endpoint(v15);
  if (!v36)
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    else {
      v38 = self->_networkAgentID;
    }
    nw_endpoint_t v36 = (nw_endpoint_t)objc_claimAutoreleasedReturnValue( +[RPNWPeer createNWEndpointWithID:agentID:applicationService:]( &OBJC_CLASS___RPNWPeer,  "createNWEndpointWithID:agentID:applicationService:",  v37,  v38,  @"dummy"));
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]",  30LL,  "FLOW: Created local endpoint=%@\n",  v36);
    }
  }

  id v39 = (void *)nw_agent_client_copy_path(v13, v35);
  if (nw_path_is_listener())
  {
    id v11 = v54;
    [v54 setFlowAssignHandler:v14];
    [v54 setLocalEndpoint:v36];
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent startFlow:listener:client:assign:parameters:]",  30LL,  "FLOW: Creating listen framer\n");
    }

    -[RPNWNetworkAgent createListenerFramer:](self, "createListenerFramer:", v54);
  }

  else
  {
    id v50 = v13;
    id v52 = v15;
    id v40 = v14;
    v55[0] = 0LL;
    v55[1] = 0LL;
    nw_endpoint_get_service_identifier(v16, v55);
    nw_protocol_definition_t v41 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v55);
    uint64_t v42 = objc_claimAutoreleasedReturnValue( +[RPNWNearbyInvitationEndpoint findEndpoint:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "findEndpoint:",  v41));
    uint64_t v43 = objc_claimAutoreleasedReturnValue([v12 nearbyInvitationConnection]);
    uint64_t v44 = v42 | v43;

    if (v44)
    {
      v45 = v16;
      if (v42)
      {
        BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([(id)v42 applicationService]);
        [v54 setApplicationService:v46];
      }

      id v14 = v40;
      if (_os_feature_enabled_impl("Rapport", "NearbyInvitation"))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v12 nearbyInvitationConnection]);
        -[RPNWNetworkAgent createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:]( self,  "createNearbyInvitationConnectionFramer:assign:local:remote:incomingConnection:",  v54,  v40,  v36,  v16,  v47);

        id v14 = v40;
      }
    }

    else
    {
      id v14 = v40;
      v45 = v16;
      -[RPNWNetworkAgent createConnectionFramer:assign:local:remote:incomingConnection:]( self,  "createConnectionFramer:assign:local:remote:incomingConnection:",  v54,  v40,  v36,  v16,  v18);
    }

    id v16 = v45;
    id v11 = v54;
    id v13 = v50;
    id v15 = v52;
  }

LABEL_50:
}

- (BOOL)setupFlowHandlers
{
  networkAgent = self->_networkAgent;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007B9CC;
  v5[3] = &unk_100113D88;
  v5[4] = self;
  nw_agent_set_flow_handlers(networkAgent, 4LL, 6LL, 1LL, v5, &stru_100113DA8);
  return 1;
}

- (void)setupAssertHandlers:(id)a3
{
  id v3 = a3;
  nw_agent_set_assert_handlers(v3, &stru_100113DE8, &stru_100113E08);
}

- (BOOL)createBrowseAgent
{
  id v3 = (OS_nw_agent *)nw_agent_create( "com.apple.rapport.browse",  "RapportBrowseAgent",  "Rapport Browse Agent",  self->_dispatchQueue);
  browseAgent = self->_browseAgent;
  self->_browseAgent = v3;

  id v5 = self->_browseAgent;
  if (v5)
  {
    v9[0] = 0LL;
    v9[1] = 0LL;
    nw_agent_get_uuid(v5, v9);
    id v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v9);
    browseAgentID = self->_browseAgentID;
    self->_browseAgentID = v6;

    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createBrowseAgent]",  30LL,  "Browse Agent UUID=%@",  self->_browseAgentID);
    }

    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]( self,  "setupPolicyWithQueue:browseAgent:",  self->_dispatchQueue,  1LL);
    -[RPNWNetworkAgent setupBrowseHandlers](self, "setupBrowseHandlers");
    -[RPNWNetworkAgent setupResolveHandlers](self, "setupResolveHandlers");
    -[RPNWNetworkAgent setupAssertHandlers:](self, "setupAssertHandlers:", self->_browseAgent);
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createBrowseAgent]", 30LL, "Activating browse agent\n");
    }

    nw_agent_change_state(self->_browseAgent, 1LL, 4LL, 0LL);
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createBrowseAgent]", 30LL, "Browse agent ready!\n");
    }
  }

  else if (dword_100132768 <= 90 {
         && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
  }
  {
    LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createBrowseAgent]", 90LL, "Failed to create browse agent\n");
  }

  return v5 != 0LL;
}

- (BOOL)createNetworkAgent
{
  id v3 = (OS_nw_agent *)nw_agent_create( "com.apple.rapport",  "RapportNetworkAgent",  "Rapport Network Agent",  self->_dispatchQueue);
  networkAgent = self->_networkAgent;
  self->_networkAgent = v3;

  id v5 = self->_networkAgent;
  if (v5)
  {
    v9[0] = 0LL;
    v9[1] = 0LL;
    nw_agent_get_uuid(v5, v9);
    id v6 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v9);
    networkAgentID = self->_networkAgentID;
    self->_networkAgentID = v6;

    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent createNetworkAgent]",  30LL,  "Network Agent UUID=%@",  self->_networkAgentID);
    }

    -[RPNWNetworkAgent setupPolicyWithQueue:browseAgent:]( self,  "setupPolicyWithQueue:browseAgent:",  self->_dispatchQueue,  0LL);
    -[RPNWNetworkAgent setupListenHandlers](self, "setupListenHandlers");
    -[RPNWNetworkAgent setupFlowHandlers](self, "setupFlowHandlers");
    -[RPNWNetworkAgent setupAssertHandlers:](self, "setupAssertHandlers:", self->_networkAgent);
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createNetworkAgent]", 30LL, "Activating network agent\n");
    }

    nw_agent_change_state(self->_networkAgent, 1LL, 4LL, 0LL);
    if (dword_100132768 <= 30
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 30LL)))
    {
      LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createNetworkAgent]", 30LL, "Network agent ready!\n");
    }
  }

  else if (dword_100132768 <= 90 {
         && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
  }
  {
    LogPrintF(&dword_100132768, "-[RPNWNetworkAgent createNetworkAgent]", 90LL, "Failed to create agent\n");
  }

  return v5 != 0LL;
}

- (id)_localPublicKeyForAgentClient:(id)a3
{
  id v4 = a3;
  id v5 = (void *)nw_agent_client_copy_parameters(v4);
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[RPNWNetworkAgent _quicProtocolOptionsFromParameters:](self, "_quicProtocolOptionsFromParameters:", v5));
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      id v8 = (void *)nw_quic_options_copy_local_public_key(v6);
      id v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }

      else if (dword_100132768 <= 90 {
             && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      }
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]",  90LL,  "Failed to copy public key from options=%@, parameters=%@, agent_client=%@\n",  v7,  v5,  v4);
      }
    }

    else
    {
      if (dword_100132768 <= 90
        && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
      {
        LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]",  90LL,  "Failed to find QUIC protocol options from parameters=%@, agent_client=%@\n",  v5,  v4);
      }

      id v9 = 0LL;
    }
  }

  else
  {
    if (dword_100132768 <= 90
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _localPublicKeyForAgentClient:]",  90LL,  "Failed to copy parameters from agent_client=%@\n",  v4);
    }

    id v9 = 0LL;
  }

  return v9;
}

- (id)_quicProtocolOptionsFromParameters:(id)a3
{
  id v3 = (nw_parameters *)a3;
  id v4 = nw_parameters_copy_default_protocol_stack(v3);
  id v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    id v12 = sub_10007CA18;
    id v13 = sub_10007CA28;
    id v14 = 0LL;
    iterate_block[0] = _NSConcreteStackBlock;
    iterate_block[1] = 3221225472LL;
    iterate_block[2] = sub_10007CA30;
    iterate_block[3] = &unk_100113E30;
    iterate_block[4] = &v9;
    nw_protocol_stack_iterate_application_protocols(v4, iterate_block);
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  else
  {
    if (dword_100132768 <= 90
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _quicProtocolOptionsFromParameters:]",  90LL,  "Failed to copy default protocol stack from parameters=%@",  v3);
    }

    id v6 = 0LL;
  }

  return v6;
}

- (BOOL)_isTCPTransport:(id)a3
{
  id v3 = (nw_parameters *)a3;
  nw_protocol_stack_t v4 = nw_parameters_copy_default_protocol_stack(v3);
  if (v4)
  {
    nw_protocol_definition_t v5 = nw_protocol_copy_tcp_definition();
    char v6 = nw_protocol_stack_includes_protocol(v4, v5);
  }

  else
  {
    if (dword_100132768 <= 90
      && (dword_100132768 != -1 || _LogCategory_Initialize(&dword_100132768, 90LL)))
    {
      LogPrintF( &dword_100132768,  "-[RPNWNetworkAgent _isTCPTransport:]",  90LL,  "Failed to copy default protocol stack from parameters=%@",  v3);
    }

    char v6 = 0;
  }

  return v6;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSUUID)networkAgentID
{
  return self->_networkAgentID;
}

- (void)setNetworkAgentID:(id)a3
{
}

- (NSUUID)browseAgentID
{
  return self->_browseAgentID;
}

- (void)setBrowseAgentID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
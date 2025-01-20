@interface RPNWAgentClient
+ (id)addAgentClient;
+ (id)findAgentClient:(id)a3 tryPort:(BOOL)a4 isTCP:(BOOL)a5 isFlowHandler:(BOOL)a6;
+ (id)findAgentClientFromConnectionID:(id)a3;
+ (id)findListenerAgentClientFromApplicationServiceName:(id)a3;
+ (unsigned)findAgentClientPort:(id)a3;
+ (void)initialize;
+ (void)listAgentClients:(id)a3;
+ (void)removeAgentClient:(id)a3;
+ (void)removeAgentClient:(id)a3 isFlowHandler:(BOOL)a4;
- (BOOL)isTCP;
- (BOOL)isUsingQUIC;
- (NSString)applicationService;
- (NSString)persona;
- (NSUUID)agentClientID;
- (OS_nw_advertise_descriptor)advertiseDescriptor;
- (OS_nw_agent_client)browseClient;
- (OS_nw_agent_client)flowClient;
- (OS_nw_browse_descriptor)browseDescriptor;
- (OS_nw_endpoint)localEndpoint;
- (OS_nw_framer)listen_framer;
- (RPNWAgentClient)init;
- (RPNWConnection)connection;
- (RPNWDiscoverySession)discoverySession;
- (RPNWNearbyInvitationConnection)nearbyInvitationConnection;
- (RPNWNearbyInvitationDiscoverySession)nearbyInvitationDiscoverySession;
- (RPNWNearbyInvitationPeer)nearbyInvitationServer;
- (RPServer)applicationServiceServer;
- (const)getTypeDescription;
- (id)browseResponse;
- (id)description;
- (id)flowAssignHandler;
- (id)longDescription;
- (int)advertiseInvitationRoute;
- (int)advertiseInvitationScope;
- (int)browseInvitationScope;
- (int)pid;
- (int64_t)type;
- (unint64_t)controlFlags;
- (unsigned)port;
- (void)dealloc;
- (void)setAdvertiseDescriptor:(id)a3;
- (void)setAdvertiseInvitationRoute:(int)a3;
- (void)setAdvertiseInvitationScope:(int)a3;
- (void)setAgentClientID:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setApplicationServiceServer:(id)a3;
- (void)setBrowseClient:(id)a3;
- (void)setBrowseDescriptor:(id)a3;
- (void)setBrowseInvitationScope:(int)a3;
- (void)setBrowseResponse:(id)a3;
- (void)setConnection:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDiscoverySession:(id)a3;
- (void)setFlowAssignHandler:(id)a3;
- (void)setFlowClient:(id)a3;
- (void)setIsTCP:(BOOL)a3;
- (void)setIsUsingQUIC:(BOOL)a3;
- (void)setListen_framer:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setNearbyInvitationConnection:(id)a3;
- (void)setNearbyInvitationDiscoverySession:(id)a3;
- (void)setNearbyInvitationServer:(id)a3;
- (void)setPersona:(id)a3;
- (void)setPid:(int)a3;
- (void)setPort:(unsigned __int16)a3;
- (void)setType:(int64_t)a3;
- (void)startDiscovery:(id)a3 deviceTypes:(unsigned int)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 agentUUID:(id)a7 applicationService:(id)a8;
- (void)startNearbyInvitationDiscovery:(id)a3 agentUUID:(id)a4 applicationService:(id)a5;
- (void)stopAgentClient;
- (void)updateAgentClientInfo:(id)a3 browseResponse:(id)a4 listener:(id)a5 bundleID:(id)a6 advertiseDescriptor:(id)a7 browseDescriptor:(id)a8 isFlowHandler:(BOOL)a9 isUsingQUIC:(BOOL)a10 isTCP:(BOOL)a11 agentClientPID:(int)a12 persona:(id)a13;
@end

@implementation RPNWAgentClient

+ (void)initialize
{
  if (qword_1001335A0 != -1) {
    dispatch_once(&qword_1001335A0, &stru_100113E50);
  }
}

- (RPNWAgentClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPNWAgentClient;
  v2 = -[RPNWAgentClient init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPNWAgentClient;
  -[RPNWAgentClient dealloc](&v3, "dealloc");
}

+ (unsigned)findAgentClientPort:(id)a3
{
  objc_super v3 = (nw_path *)nw_agent_client_copy_path(a3, a2);
  v4 = nw_path_copy_effective_local_endpoint(v3);
  v5 = v4;
  if (v4) {
    uint16_t port = nw_endpoint_get_port(v4);
  }
  else {
    uint16_t port = 0;
  }

  return port;
}

- (void)stopAgentClient
{
  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
  {
    objc_super v3 = self;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

    LogPrintF(&dword_1001327D8, "-[RPNWAgentClient stopAgentClient]", 30LL, "Stopping RPNWAgentClient[%@]", v4);
  }

  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    if (dword_1001327D8 <= 30)
    {
      if (dword_1001327D8 != -1
        || (int v8 = _LogCategory_Initialize(&dword_1001327D8, 30LL), discoverySession = self->_discoverySession, v8))
      {
        objc_super v6 = discoverySession;
        v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        -[NSMutableString appendFormat:](v7, "appendFormat:", @"%p", v6);

        LogPrintF(&dword_1001327D8, "-[RPNWAgentClient stopAgentClient]", 30LL, "Stopping RPNWDiscoverySession[%@]", v7);
        discoverySession = self->_discoverySession;
      }
    }

    -[RPNWDiscoverySession stopDiscovery](discoverySession, "stopDiscovery");
    v9 = self->_discoverySession;
    self->_discoverySession = 0LL;
  }

  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  if (nearbyInvitationDiscoverySession)
  {
    if (dword_1001327D8 <= 30)
    {
      if (dword_1001327D8 != -1
        || (int v13 = _LogCategory_Initialize(&dword_1001327D8, 30LL),
            nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession,
            v13))
      {
        v11 = nearbyInvitationDiscoverySession;
        v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        -[NSMutableString appendFormat:](v12, "appendFormat:", @"%p", v11);

        LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient stopAgentClient]",  30LL,  "Stopping RPNWNearbyInvitationDiscoverySession[%@]",  v12);
        nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
      }
    }

    -[RPNWNearbyInvitationDiscoverySession stopDiscovery](nearbyInvitationDiscoverySession, "stopDiscovery");
    v14 = self->_nearbyInvitationDiscoverySession;
    self->_nearbyInvitationDiscoverySession = 0LL;
  }

  connection = self->_connection;
  if (connection)
  {
    if (dword_1001327D8 <= 30)
    {
      if (dword_1001327D8 != -1
        || (int v20 = _LogCategory_Initialize(&dword_1001327D8, 30LL), connection = self->_connection, v20))
      {
        v16 = connection;
        v17 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        -[NSMutableString appendFormat:](v17, "appendFormat:", @"%p", v16);

        unsigned int v18 = -[RPNWConnection isConnected](self->_connection, "isConnected");
        v19 = "no";
        if (v18) {
          v19 = "yes";
        }
        LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient stopAgentClient]",  30LL,  "Stopping RPNWConnection[%@], isConnected=%s",  v17,  v19);

        connection = self->_connection;
      }
    }

    unsigned int v21 = -[RPNWConnection isConnected](connection, "isConnected");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](self->_connection, "peer"));
    id v23 = v22;
    if (v21)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection applicationService](self->_connection, "applicationService"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection connectionUUID](self->_connection, "connectionUUID"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472LL;
      v44[2] = sub_10007D2BC;
      v44[3] = &unk_1001115C8;
      id v45 = v23;
      id v23 = v23;
      [v23 sendStatusUpdateForConnection:v24 connectionID:v25 status:1 responseHandler:v44];
    }

    else
    {
      [v22 deregisterRequestID:@"com.apple.oneapi.data"];
      [v23 invalidate];
    }

    -[RPNWConnection setFramer:](self->_connection, "setFramer:", 0LL);
    v26 = self->_connection;
    self->_connection = 0LL;
  }

  nearbyInvitationConnection = self->_nearbyInvitationConnection;
  if (nearbyInvitationConnection)
  {
    if (dword_1001327D8 <= 30)
    {
      if (dword_1001327D8 != -1
        || (int v32 = _LogCategory_Initialize(&dword_1001327D8, 30LL),
            nearbyInvitationConnection = self->_nearbyInvitationConnection,
            v32))
      {
        v28 = nearbyInvitationConnection;
        v29 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
        -[NSMutableString appendFormat:](v29, "appendFormat:", @"%p", v28);

        unsigned int v30 = -[RPNWNearbyInvitationConnection isConnected](self->_nearbyInvitationConnection, "isConnected");
        v31 = "no";
        if (v30) {
          v31 = "yes";
        }
        LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient stopAgentClient]",  30LL,  "Stopping RPNWNearbyInvitationConnection[%@], isConnected=%s",  v29,  v31);

        nearbyInvitationConnection = self->_nearbyInvitationConnection;
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](nearbyInvitationConnection, "peer"));
    v34 = v33;
    if (self->_type == 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue( -[RPNWNearbyInvitationConnection applicationService]( self->_nearbyInvitationConnection,  "applicationService"));
      v36 = (void *)objc_claimAutoreleasedReturnValue( -[RPNWNearbyInvitationConnection connectionUUID]( self->_nearbyInvitationConnection,  "connectionUUID"));
      [v34 sendStatusUpdateForConnection:v35 connectionID:v36 status:4 responseHandler:&stru_100113E90];
    }

    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue([v33 nearbyInvitationSession]);
      [v37 deregisterRequestID:@"com.apple.oneapi.nearbyinvitation.data"];

      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 nearbyInvitationSession]);
      [v35 invalidate];
    }

    if (self->_type == 1)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v34 nearbyInvitationSession]);
      [v38 deregisterRequestID:@"com.apple.oneapi.nearbyinvitation.connection"];
    }

    -[RPNWNearbyInvitationConnection setFramer:](self->_nearbyInvitationConnection, "setFramer:", 0LL);
    v39 = self->_nearbyInvitationConnection;
    self->_nearbyInvitationConnection = 0LL;
  }

  applicationServiceServer = self->_applicationServiceServer;
  if (applicationServiceServer)
  {
    -[RPServer invalidate](applicationServiceServer, "invalidate");
    v41 = self->_applicationServiceServer;
    self->_applicationServiceServer = 0LL;
  }

  nearbyInvitationServer = self->_nearbyInvitationServer;
  if (nearbyInvitationServer)
  {
    -[RPNWNearbyInvitationPeer stopServer](nearbyInvitationServer, "stopServer");
    v43 = self->_nearbyInvitationServer;
    self->_nearbyInvitationServer = 0LL;
  }

- (const)getTypeDescription
{
  unint64_t type = self->_type;
  if (type > 4) {
    return "LSTNR";
  }
  else {
    return off_100113EB0[type];
  }
}

- (id)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"RPNWAgentClient[%p]", self);
  if (self->_type)
  {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" (%s): < ",  -[RPNWAgentClient getTypeDescription](self, "getTypeDescription"));
    if (self->_applicationService) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"appSvc=%@ ", self->_applicationService);
    }
    persona = self->_persona;
    if (persona)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](persona, "substringToIndex:", 8LL));
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"persona:%@ ", v5);
    }

    if (self->_pid) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"PID=%d ", self->_pid);
    }
    if (self->_browseClient) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"browse_client=%p ", self->_browseClient);
    }
    if (self->_browseResponse) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"browse_response=%p ", self->_browseResponse);
    }
    if (self->_flowClient) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"flow_client=%p ", self->_flowClient);
    }
    if (self->_isUsingQUIC) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"using_QUIC=YES ");
    }
    if (self->_port) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"port=%d ", self->_port);
    }
    if (self->_isTCP) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"(TCP) ");
    }
    if (self->_advertiseDescriptor) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"adesc=%@ ", self->_advertiseDescriptor);
    }
    if (self->_advertiseInvitationRoute) {
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"advertise_invitation_route=%d",  self->_advertiseInvitationRoute);
    }
    if (self->_advertiseInvitationScope) {
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"advertise_invitation_scope=%d",  self->_advertiseInvitationScope);
    }
    if (self->_browseDescriptor) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"bdesc=%@ ", self->_browseDescriptor);
    }
    if (self->_browseInvitationScope) {
      -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"browse_invitation_scope=%d",  self->_browseInvitationScope);
    }
    if (self->_listen_framer) {
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"lframer=%@ ", self->_listen_framer);
    }
    -[NSMutableString appendString:](v3, "appendString:", @">");
  }

  return v3;
}

- (id)longDescription
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWAgentClient description](self, "description"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"%@\n", v4);

  if (self->_connection) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"   + %@\n", self->_connection);
  }
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWDiscoverySession description](discoverySession, "description"));
    -[NSMutableString appendString:](v3, "appendString:", v6);
  }

  return v3;
}

- (void)startDiscovery:(id)a3 deviceTypes:(unsigned int)a4 controlFlags:(unint64_t)a5 deviceFilter:(id)a6 agentUUID:(id)a7 applicationService:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v22 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
  {
    v17 = self;
    unsigned int v18 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v18, "appendFormat:", @"%p", v17);

    LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient startDiscovery:deviceTypes:controlFlags:deviceFilter:agentUUID:applicationService:]",  30LL,  "RPNWAgentClient[%@] starting discovery...",  v18);
  }

  v19 = objc_alloc_init(&OBJC_CLASS___RPNWDiscoverySession);
  discoverySession = self->_discoverySession;
  self->_discoverySession = v19;

  -[RPNWDiscoverySession setBrowseClient:](self->_discoverySession, "setBrowseClient:", self->_browseClient);
  -[RPNWDiscoverySession setBrowseResponse:](self->_discoverySession, "setBrowseResponse:", v22);
  if (self->_isUsingQUIC) {
    id v21 = 0LL;
  }
  else {
    id v21 = v15;
  }
  -[RPNWDiscoverySession setAgentUUID:](self->_discoverySession, "setAgentUUID:", v21);
  -[RPNWDiscoverySession setPid:](self->_discoverySession, "setPid:", self->_pid);
  -[RPNWDiscoverySession setApplicationService:](self->_discoverySession, "setApplicationService:", v16);
  -[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]( self->_discoverySession,  "startDiscovery:controlFlags:deviceFilter:",  v12,  a5,  v14);
}

- (void)startNearbyInvitationDiscovery:(id)a3 agentUUID:(id)a4 applicationService:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(&OBJC_CLASS___RPNWNearbyInvitationDiscoverySession);
  nearbyInvitationDiscoverySession = self->_nearbyInvitationDiscoverySession;
  self->_nearbyInvitationDiscoverySession = v11;

  -[RPNWNearbyInvitationDiscoverySession setBrowseClient:]( self->_nearbyInvitationDiscoverySession,  "setBrowseClient:",  self->_browseClient);
  -[RPNWNearbyInvitationDiscoverySession setBrowseResponse:]( self->_nearbyInvitationDiscoverySession,  "setBrowseResponse:",  v10);

  if (self->_isUsingQUIC) {
    id v13 = 0LL;
  }
  else {
    id v13 = v9;
  }
  -[RPNWNearbyInvitationDiscoverySession setAgentUUID:](self->_nearbyInvitationDiscoverySession, "setAgentUUID:", v13);

  -[RPNWNearbyInvitationDiscoverySession setApplicationService:]( self->_nearbyInvitationDiscoverySession,  "setApplicationService:",  v8);
  -[RPNWNearbyInvitationDiscoverySession startDiscovery](self->_nearbyInvitationDiscoverySession, "startDiscovery");
}

- (void)updateAgentClientInfo:(id)a3 browseResponse:(id)a4 listener:(id)a5 bundleID:(id)a6 advertiseDescriptor:(id)a7 browseDescriptor:(id)a8 isFlowHandler:(BOOL)a9 isUsingQUIC:(BOOL)a10 isTCP:(BOOL)a11 agentClientPID:(int)a12 persona:(id)a13
{
  id v44 = a3;
  id v20 = a4;
  id v43 = a5;
  id v45 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a13;
  if (v23) {
    objc_storeStrong((id *)&self->_persona, a13);
  }
  uint64_t v24 = 12LL;
  if (a9) {
    uint64_t v24 = 14LL;
  }
  objc_storeStrong((id *)&(&self->super.isa)[v24], a3);
  if (v20)
  {
    id v25 = objc_retainBlock(v20);
    id browseResponse = self->_browseResponse;
    self->_id browseResponse = v25;
  }

  self->_isUsingQUIC = a10;
  v27 = v44;
  if (!self->_port) {
    self->_uint16_t port = +[RPNWAgentClient findAgentClientPort:](&OBJC_CLASS___RPNWAgentClient, "findAgentClientPort:", v44);
  }
  if (!self->_pid) {
    self->_pid = a12;
  }
  self->_isTCP = a11;
  if (v21)
  {
    objc_storeStrong((id *)&self->_advertiseDescriptor, a7);
    self->_advertiseInvitationRoute = nw_advertise_descriptor_get_invitation_route(v21);
    self->_advertiseInvitationScope = nw_advertise_descriptor_get_invitation_scope(v21);
  }

  if (v22)
  {
    objc_storeStrong((id *)&self->_browseDescriptor, a8);
    self->_browseInvitationScope = nw_browse_descriptor_get_invitation_scope(v22);
    application_service_name = nw_browse_descriptor_get_application_service_name(self->_browseDescriptor);
    if (application_service_name)
    {
      v29 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  application_service_name));
      applicationService = self->_applicationService;
      self->_applicationService = v29;
    }
  }

  if (self->_advertiseDescriptor)
  {
    if (dword_1001327D8 <= 30
      && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
    {
      LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescriptor:is FlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]",  30LL,  "Upgrading agentClient to listener");
    }

    v34 = nw_advertise_descriptor_get_application_service_name(self->_advertiseDescriptor);
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v34));
      if (v45)
      {
        v36 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v45,  v35));
        v37 = self->_applicationService;
        self->_applicationService = v36;

        if (dword_1001327D8 <= 30
          && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
        {
          LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescripto r:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]",  30LL,  "Constructing bundleID+appSvc=%@",  self->_applicationService);
        }
      }

      else
      {
        objc_storeStrong((id *)&self->_applicationService, v35);
        if (dword_1001327D8 <= 30
          && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
        {
          LogPrintF( &dword_1001327D8,  "-[RPNWAgentClient updateAgentClientInfo:browseResponse:listener:bundleID:advertiseDescriptor:browseDescripto r:isFlowHandler:isUsingQUIC:isTCP:agentClientPID:persona:]",  30LL,  "Using appSvc without bundleID=%@",  self->_applicationService);
        }
      }

      applicationServiceServer = self->_applicationServiceServer;
      if (!applicationServiceServer)
      {
        v39 = objc_alloc_init(&OBJC_CLASS___RPServer);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10007DD1C;
        v47[3] = &unk_1001118A0;
        v47[4] = self;
        -[RPServer setErrorHandler:](v39, "setErrorHandler:", v47);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_10007DDB0;
        v46[3] = &unk_1001110A8;
        v46[4] = self;
        -[RPServer setInterruptionHandler:](v39, "setInterruptionHandler:", v46);
        -[RPServer activate](v39, "activate");
        v40 = self->_applicationServiceServer;
        self->_applicationServiceServer = v39;
        v41 = v39;

        v27 = v44;
        applicationServiceServer = self->_applicationServiceServer;
      }

      -[RPServer setServiceType:](applicationServiceServer, "setServiceType:", self->_applicationService);
    }

    self->_unint64_t type = 1LL;
    +[RPNWListener addListenerAgentClient:](&OBJC_CLASS___RPNWListener, "addListenerAgentClient:", self);
  }

  else
  {
    if (self->_browseDescriptor)
    {
      int64_t v31 = 2LL;
    }

    else
    {
      if (v43)
      {
        self->_unint64_t type = 3LL;
        int v32 = (OS_nw_advertise_descriptor *)objc_claimAutoreleasedReturnValue([v43 advertiseDescriptor]);
        advertiseDescriptor = self->_advertiseDescriptor;
        self->_advertiseDescriptor = v32;

        goto LABEL_42;
      }

      int64_t v31 = 4LL;
    }

    self->_unint64_t type = v31;
  }

+ (id)addAgentClient
{
  v2 = objc_alloc_init(&OBJC_CLASS___RPNWAgentClient);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  -[RPNWAgentClient setAgentClientID:](v2, "setAgentClientID:", v3);

  [(id)qword_100133598 addObject:v2];
  return v2;
}

+ (id)findAgentClient:(id)a3 tryPort:(BOOL)a4 isTCP:(BOOL)a5 isFlowHandler:(BOOL)a6
{
  BOOL v6 = a6;
  int v7 = a5;
  id v9 = a3;
  if (a4)
  {
    uint64_t v10 = +[RPNWAgentClient findAgentClientPort:](&OBJC_CLASS___RPNWAgentClient, "findAgentClientPort:", v9);
    if (!(_DWORD)v10) {
      goto LABEL_39;
    }
    uint64_t v11 = v10;
    if (dword_1001327D8 <= 30
      && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
    {
      uint64_t v12 = @"NO";
      if (v7) {
        uint64_t v12 = @"YES";
      }
      LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]",  30LL,  "Looking up agent client from port=%d/isTCP=%@",  v11,  v12);
    }

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v15 = (id)qword_100133598;
    id v23 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      while (2)
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v15);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          if ([v27 port] == (_DWORD)v11 && objc_msgSend(v27, "isTCP") == v7)
          {
            if (dword_1001327D8 <= 30
              && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
            {
              LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]",  30LL,  "Found matching client %@",  v27);
            }

            id v29 = v27;
            goto LABEL_51;
          }
        }

        id v24 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    if (dword_1001327D8 <= 30
      && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
    {
      id v13 = v9;
      id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v14, "appendFormat:", @"%p", v13);

      LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]",  30LL,  "Looking up agent client from client=%@",  v14);
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v15 = (id)qword_100133598;
    id v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v36;
      while (2)
      {
        for (j = 0LL; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
          if (v6)
          {
            id v21 = (id)objc_claimAutoreleasedReturnValue([v20 flowClient]);
            if (v21 == v9)
            {

LABEL_25:
              if (dword_1001327D8 <= 30
                && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
              {
                LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]",  30LL,  "Found matching client %@",  v20);
              }

              id v29 = v20;
LABEL_51:
              v28 = v29;

              goto LABEL_52;
            }
          }

          else
          {
            id v22 = (id)objc_claimAutoreleasedReturnValue([v20 browseClient]);

            if (v22 == v9) {
              goto LABEL_25;
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
  }

LABEL_39:
  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL))) {
    LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClient:tryPort:isTCP:isFlowHandler:]",  30LL,  "Failed to find agent client");
  }
  v28 = 0LL;
LABEL_52:

  return v28;
}

+ (id)findListenerAgentClientFromApplicationServiceName:(id)a3
{
  id v3 = a3;
  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL))) {
    LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]",  30LL,  "Searching for listener agent client with appSvc='%@'",  v3);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (id)qword_100133598;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v9 type] == (id)1)
        {
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 applicationService]);
          unsigned int v11 = [v10 isEqualToString:v3];

          if (v11)
          {
            if (dword_1001327D8 <= 30
              && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
            {
              LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]",  30LL,  "Listener found agentClient=%@",  v9);
            }

            id v12 = v9;

            goto LABEL_24;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL))) {
    LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findListenerAgentClientFromApplicationServiceName:]",  30LL,  "Failed to find listener agent client");
  }
  id v12 = 0LL;
LABEL_24:

  return v12;
}

+ (id)findAgentClientFromConnectionID:(id)a3
{
  id v3 = a3;
  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL))) {
    LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClientFromConnectionID:]",  30LL,  "Searching for agent client with connectionID=%@",  v3);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)qword_100133598;
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 connectionUUID]);
        if ([v10 isEqual:v3])
        {

LABEL_18:
          if (dword_1001327D8 <= 30
            && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL)))
          {
            __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 connection]);
            LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClientFromConnectionID:]",  30LL,  "Found agentClient=%@, connection=%@",  v8,  v14);
          }

          id v15 = v8;

          goto LABEL_25;
        }

        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 nearbyInvitationConnection]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 connectionUUID]);
        unsigned int v13 = [v12 isEqual:v3];

        if (v13) {
          goto LABEL_18;
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  if (dword_1001327D8 <= 30 && (dword_1001327D8 != -1 || _LogCategory_Initialize(&dword_1001327D8, 30LL))) {
    LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient findAgentClientFromConnectionID:]",  30LL,  "Failed to find agent client");
  }
  id v15 = 0LL;
LABEL_25:

  return v15;
}

+ (void)removeAgentClient:(id)a3 isFlowHandler:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 findAgentClient:a3 tryPort:0 isTCP:0 isFlowHandler:a4]);
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned int v11 = v5;
    if (v4) {
      [v5 setFlowClient:0];
    }
    else {
      [v5 setBrowseClient:0];
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v11 flowClient]);
    if (v7) {
      goto LABEL_6;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 browseClient]);

    uint64_t v6 = v11;
    if (!v8)
    {
      if (dword_1001327D8 <= 30)
      {
        if (dword_1001327D8 != -1 || (v9 = _LogCategory_Initialize(&dword_1001327D8, 30LL), uint64_t v6 = v11, v9)) {
          LogPrintF( &dword_1001327D8,  "+[RPNWAgentClient removeAgentClient:isFlowHandler:]",  30LL,  "Removing client %@",  v6);
        }
      }

      [(id)qword_100133598 removeObject:v11];
      [v11 stopAgentClient];
      id v10 = [v11 type];
      uint64_t v6 = v11;
      if (v10 == (id)1)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationService]);
        +[RPNWListener startListenerMappingTimeout:](&OBJC_CLASS___RPNWListener, "startListenerMappingTimeout:", v7);
LABEL_6:

        uint64_t v6 = v11;
      }
    }
  }
}

+ (void)removeAgentClient:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v6 = v3;
    if (dword_1001327D8 <= 30)
    {
      if (dword_1001327D8 != -1 || (v5 = _LogCategory_Initialize(&dword_1001327D8, 30LL), BOOL v4 = v6, v5)) {
        LogPrintF(&dword_1001327D8, "+[RPNWAgentClient removeAgentClient:]", 30LL, "Removing client %@", v4);
      }
    }

    [(id)qword_100133598 removeObject:v6];
    BOOL v4 = v6;
  }
}

+ (void)listAgentClients:(id)a3
{
  id v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (id)qword_100133598;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "longDescription", (void)v10));
        [v3 appendString:v9];

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSUUID)agentClientID
{
  return self->_agentClientID;
}

- (void)setAgentClientID:(id)a3
{
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (OS_nw_advertise_descriptor)advertiseDescriptor
{
  return self->_advertiseDescriptor;
}

- (void)setAdvertiseDescriptor:(id)a3
{
}

- (int)advertiseInvitationRoute
{
  return self->_advertiseInvitationRoute;
}

- (void)setAdvertiseInvitationRoute:(int)a3
{
  self->_advertiseInvitationRoute = a3;
}

- (int)advertiseInvitationScope
{
  return self->_advertiseInvitationScope;
}

- (void)setAdvertiseInvitationScope:(int)a3
{
  self->_advertiseInvitationScope = a3;
}

- (RPServer)applicationServiceServer
{
  return self->_applicationServiceServer;
}

- (void)setApplicationServiceServer:(id)a3
{
}

- (OS_nw_framer)listen_framer
{
  return self->_listen_framer;
}

- (void)setListen_framer:(id)a3
{
}

- (OS_nw_browse_descriptor)browseDescriptor
{
  return self->_browseDescriptor;
}

- (void)setBrowseDescriptor:(id)a3
{
}

- (int)browseInvitationScope
{
  return self->_browseInvitationScope;
}

- (void)setBrowseInvitationScope:(int)a3
{
  self->_browseInvitationScope = a3;
}

- (RPNWDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (void)setDiscoverySession:(id)a3
{
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
}

- (OS_nw_agent_client)flowClient
{
  return self->_flowClient;
}

- (void)setFlowClient:(id)a3
{
}

- (BOOL)isUsingQUIC
{
  return self->_isUsingQUIC;
}

- (void)setIsUsingQUIC:(BOOL)a3
{
  self->_isUsingQUIC = a3;
}

- (RPNWNearbyInvitationDiscoverySession)nearbyInvitationDiscoverySession
{
  return self->_nearbyInvitationDiscoverySession;
}

- (void)setNearbyInvitationDiscoverySession:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_uint16_t port = a3;
}

- (BOOL)isTCP
{
  return self->_isTCP;
}

- (void)setIsTCP:(BOOL)a3
{
  self->_isTCP = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (RPNWConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (RPNWNearbyInvitationConnection)nearbyInvitationConnection
{
  return self->_nearbyInvitationConnection;
}

- (void)setNearbyInvitationConnection:(id)a3
{
}

- (id)flowAssignHandler
{
  return self->_flowAssignHandler;
}

- (void)setFlowAssignHandler:(id)a3
{
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (RPNWNearbyInvitationPeer)nearbyInvitationServer
{
  return self->_nearbyInvitationServer;
}

- (void)setNearbyInvitationServer:(id)a3
{
}

- (NSString)persona
{
  return self->_persona;
}

- (void)setPersona:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
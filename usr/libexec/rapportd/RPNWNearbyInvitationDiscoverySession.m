@interface RPNWNearbyInvitationDiscoverySession
- (NSString)applicationService;
- (NSUUID)agentUUID;
- (NSUUID)discoverySessionID;
- (OS_nw_agent_client)browseClient;
- (RPNWNearbyInvitationDiscoverySession)init;
- (RPNWNearbyInvitationPeer)discoveryClient;
- (id)browseResponse;
- (id)description;
- (void)addMappingForDevice:(id)a3 endpointID:(id)a4;
- (void)dealloc;
- (void)removeAllDevices;
- (void)removeDevice:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setApplicationService:(id)a3;
- (void)setBrowseClient:(id)a3;
- (void)setBrowseResponse:(id)a3;
- (void)setDiscoveryClient:(id)a3;
- (void)setDiscoverySessionID:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
- (void)updateClientBrowseResult;
- (void)updateMappingForDevice:(id)a3;
@end

@implementation RPNWNearbyInvitationDiscoverySession

- (RPNWNearbyInvitationDiscoverySession)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationDiscoverySession;
  v2 = -[RPNWNearbyInvitationDiscoverySession init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    discoverySessionID = v2->_discoverySessionID;
    v2->_discoverySessionID = (NSUUID *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationDiscoverySession;
  -[RPNWNearbyInvitationDiscoverySession dealloc](&v2, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  RPNWNearbyInvitationDiscoverySession[%p] id=%@\n",  self,  self->_discoverySessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWNearbyInvitationEndpoint listEndpointsForDiscoverySession:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "listEndpointsForDiscoverySession:",  self->_discoverySessionID));
  -[NSMutableString appendString:](v3, "appendString:", v4);

  return v3;
}

- (void)updateClientBrowseResult
{
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWNearbyInvitationEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "addEndpointMapping:endpointID:applicationService:discoverySessionID:",  a3,  a4,  self->_applicationService,  self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint updateEndpointMapping:discoverySessionID:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "updateEndpointMapping:discoverySessionID:",  a3,  self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)removeDevice:(id)a3
{
  if (+[RPNWNearbyInvitationEndpoint removeEndpointMapping:discoverySessionID:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "removeEndpointMapping:discoverySessionID:",  a3,  self->_discoverySessionID))
  {
    -[RPNWNearbyInvitationDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)removeAllDevices
{
  if (self->_discoverySessionID)
  {
    if (dword_100131C78 <= 30
      && (dword_100131C78 != -1 || _LogCategory_Initialize(&dword_100131C78, 30LL)))
    {
      uint64_t v3 = self;
      v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

      LogPrintF( &dword_100131C78,  "-[RPNWNearbyInvitationDiscoverySession removeAllDevices]",  30LL,  "DISCOVER: RPNWNearbyInvitationDiscoverySession[%@]: Ending discovery session",  v4);
    }

    +[RPNWNearbyInvitationEndpoint removeDiscoverySessionFromAllEndpoints:]( &OBJC_CLASS___RPNWNearbyInvitationEndpoint,  "removeDiscoverySessionFromAllEndpoints:",  self->_discoverySessionID);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0LL;
  }

- (void)startDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_100131C78 <= 90
      && (dword_100131C78 != -1 || _LogCategory_Initialize(&dword_100131C78, 90LL)))
    {
      LogPrintF( &dword_100131C78,  "-[RPNWNearbyInvitationDiscoverySession startDiscovery]",  90LL,  "DISCOVER: Failed to start RPNWNearbyInvitationDiscoverySession - discovery already running.");
    }
  }

  else
  {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPNWNearbyInvitationPeer);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v3;

    v5 = self->_discoveryClient;
    applicationService = self->_applicationService;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10004FD34;
    v10[3] = &unk_100112D10;
    v10[4] = self;
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10004FD94;
    v9[3] = &unk_100112D10;
    v9[4] = self;
    v7[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004FDA0;
    v8[3] = &unk_100112D10;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10004FDAC;
    v7[3] = &unk_1001110A8;
    -[RPNWNearbyInvitationPeer startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:]( v5,  "startDiscovery:foundHandler:updateHandler:lostHandler:invalidationHandler:",  applicationService,  v10,  v9,  v8,  v7);
  }

- (void)stopDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_100131C78 <= 30
      && (dword_100131C78 != -1 || _LogCategory_Initialize(&dword_100131C78, 30LL)))
    {
      uint64_t v3 = self;
      v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%p", v3);

      LogPrintF( &dword_100131C78,  "-[RPNWNearbyInvitationDiscoverySession stopDiscovery]",  30LL,  "DISCOVER: Stopping RPNWNearbyInvitationDiscoverySession[%@]",  v4);
    }

    -[RPNWNearbyInvitationPeer stopDiscovery](self->_discoveryClient, "stopDiscovery");
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0LL;
  }

  -[RPNWNearbyInvitationDiscoverySession removeAllDevices](self, "removeAllDevices");
}

- (RPNWNearbyInvitationPeer)discoveryClient
{
  return self->_discoveryClient;
}

- (void)setDiscoveryClient:(id)a3
{
}

- (NSUUID)agentUUID
{
  return self->_agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSUUID)discoverySessionID
{
  return self->_discoverySessionID;
}

- (void)setDiscoverySessionID:(id)a3
{
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (id)browseResponse
{
  return self->_browseResponse;
}

- (void)setBrowseResponse:(id)a3
{
}

- (OS_nw_agent_client)browseClient
{
  return self->_browseClient;
}

- (void)setBrowseClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
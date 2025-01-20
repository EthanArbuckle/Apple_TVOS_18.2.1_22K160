@interface RPNWDiscoverySession
- (NSString)applicationService;
- (NSUUID)agentUUID;
- (NSUUID)discoverySessionID;
- (OS_nw_agent_client)browseClient;
- (RPNWDiscoverySession)init;
- (RPNWPeer)discoveryClient;
- (id)browseResponse;
- (id)description;
- (int)pid;
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
- (void)setPid:(int)a3;
- (void)startDiscovery:(unsigned int)a3 controlFlags:(unint64_t)a4 deviceFilter:(id)a5;
- (void)stopDiscovery;
- (void)updateClientBrowseResult;
- (void)updateMappingForDevice:(id)a3;
@end

@implementation RPNWDiscoverySession

- (RPNWDiscoverySession)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RPNWDiscoverySession;
  v2 = -[RPNWDiscoverySession init](&v7, "init");
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
  v2.super_class = (Class)&OBJC_CLASS___RPNWDiscoverySession;
  -[RPNWDiscoverySession dealloc](&v2, "dealloc");
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"  RPNWDiscoverySession[%p] id=%@\n",  self,  self->_discoverySessionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[RPNWEndpoint listEndpointsForDiscoverySession:]( &OBJC_CLASS___RPNWEndpoint,  "listEndpointsForDiscoverySession:",  self->_discoverySessionID));
  -[NSMutableString appendString:](v3, "appendString:", v4);

  return v3;
}

- (void)updateClientBrowseResult
{
}

- (void)addMappingForDevice:(id)a3 endpointID:(id)a4
{
  if (+[RPNWEndpoint addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:]( &OBJC_CLASS___RPNWEndpoint,  "addEndpointMapping:endpointID:applicationService:discoverySessionID:shouldAutomapListener:",  a3,  a4,  self->_applicationService,  self->_discoverySessionID,  1LL))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)updateMappingForDevice:(id)a3
{
  if (+[RPNWEndpoint updateEndpointMapping:discoverySessionID:]( &OBJC_CLASS___RPNWEndpoint,  "updateEndpointMapping:discoverySessionID:",  a3,  self->_discoverySessionID))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)removeDevice:(id)a3
{
  if (+[RPNWEndpoint removeEndpointMapping:discoverySessionID:immediate:]( &OBJC_CLASS___RPNWEndpoint,  "removeEndpointMapping:discoverySessionID:immediate:",  a3,  self->_discoverySessionID,  0LL))
  {
    -[RPNWDiscoverySession updateClientBrowseResult](self, "updateClientBrowseResult");
  }

- (void)removeAllDevices
{
  if (self->_discoverySessionID)
  {
    if (dword_1001326F8 <= 30
      && (dword_1001326F8 != -1 || _LogCategory_Initialize(&dword_1001326F8, 30LL)))
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
      v4 = self;
      v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v5, "appendFormat:", @"%p", v4);

      LogPrintF( &dword_1001326F8,  "-[RPNWDiscoverySession removeAllDevices]",  30LL,  "%@ DISCOVER: RPNWDiscoverySession[%@]: Ending discovery session",  v3,  v5);
    }

    +[RPNWEndpoint removeDiscoverySessionFromAllEndpoints:]( &OBJC_CLASS___RPNWEndpoint,  "removeDiscoverySessionFromAllEndpoints:",  self->_discoverySessionID);
    discoverySessionID = self->_discoverySessionID;
    self->_discoverySessionID = 0LL;
  }

- (void)startDiscovery:(unsigned int)a3 controlFlags:(unint64_t)a4 deviceFilter:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = objc_alloc_init(&OBJC_CLASS___RPNWPeer);
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = v9;

  if (dword_1001326F8 <= 30 && (dword_1001326F8 != -1 || _LogCategory_Initialize(&dword_1001326F8, 30LL)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
    v12 = self;
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v13, "appendFormat:", @"%p", v12);

    v14 = self->_discoveryClient;
    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    -[NSMutableString appendFormat:](v15, "appendFormat:", @"%p", v14);

    LogPrintF( &dword_1001326F8,  "-[RPNWDiscoverySession startDiscovery:controlFlags:deviceFilter:]",  30LL,  "%@ DISCOVER: Starting RPNWDiscoverySession[%@], _discoveryClient=%@ with controlFlags %ll{flags}",  v11,  v13,  v15,  a4,  &unk_10010A740);
  }

  v16 = self->_discoveryClient;
  applicationService = self->_applicationService;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100074998;
  v21[3] = &unk_100112EA0;
  v21[4] = self;
  v19[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100074AA4;
  v20[3] = &unk_100112EA0;
  v20[4] = self;
  v18[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100074B94;
  v19[3] = &unk_100112EA0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100074C84;
  v18[3] = &unk_1001110A8;
  -[RPNWPeer startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:]( v16,  "startDiscovery:applicationService:controlFlags:deviceFilter:connectedHandler:updateHandler:lostHandler:invalidationHandler:",  v6,  applicationService,  a4,  v8,  v21,  v20,  v19,  v18);
}

- (void)stopDiscovery
{
  if (self->_discoveryClient)
  {
    if (dword_1001326F8 <= 30
      && (dword_1001326F8 != -1 || _LogCategory_Initialize(&dword_1001326F8, 30LL)))
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[RPNWNetworkAgent getLogInfo](&OBJC_CLASS___RPNWNetworkAgent, "getLogInfo"));
      v4 = self;
      v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      -[NSMutableString appendFormat:](v5, "appendFormat:", @"%p", v4);

      LogPrintF( &dword_1001326F8,  "-[RPNWDiscoverySession stopDiscovery]",  30LL,  "%@ DISCOVER: Stopping RPNWDiscoverySession[%@]",  v3,  v5);
    }

    -[RPNWPeer stopDiscovery](self->_discoveryClient, "stopDiscovery");
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = 0LL;
  }

  -[RPNWDiscoverySession removeAllDevices](self, "removeAllDevices");
}

- (RPNWPeer)discoveryClient
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

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
}

@end
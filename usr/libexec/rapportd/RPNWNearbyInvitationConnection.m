@interface RPNWNearbyInvitationConnection
+ (void)addConnection:(id)a3;
+ (void)initialize;
+ (void)listConnections:(id)a3;
+ (void)removeConnection:(id)a3;
- (BOOL)inbound;
- (BOOL)internal;
- (BOOL)isConnected;
- (NSString)applicationService;
- (NSUUID)connectionUUID;
- (NSUUID)endpointUUID;
- (OS_nw_framer)framer;
- (RPNWNearbyInvitationConnection)init;
- (RPNWNearbyInvitationConnection)initWithPeer:(id)a3 session:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9;
- (RPNWNearbyInvitationPeer)peer;
- (id)description;
- (void)dealloc;
- (void)sendStatusUpdate:(int)a3;
- (void)setApplicationService:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setFramer:(id)a3;
- (void)setInbound:(BOOL)a3;
- (void)setInternal:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setPeer:(id)a3;
@end

@implementation RPNWNearbyInvitationConnection

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___RPNWNearbyInvitationConnection, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  5LL,  5LL,  10LL);
    v6 = (void *)qword_100133538;
    qword_100133538 = (uint64_t)v5;
  }

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  endpointUUID = self->_endpointUUID;
  connectionUUID = self->_connectionUUID;
  if (self->_inbound) {
    v6 = "IN";
  }
  else {
    v6 = "OUT";
  }
  if (self->_isConnected) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  peer = self->_peer;
  applicationService = self->_applicationService;
  v10 = self->_framer;
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v11, "appendFormat:", @"%p", v10);

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"CONN[%@] (%s): appSvc=%@ connected=%s EP={%@:%@} framer=%@",  connectionUUID,  v6,  applicationService,  v7,  peer,  endpointUUID,  v11);
  return v3;
}

- (RPNWNearbyInvitationConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationConnection;
  v2 = -[RPNWNearbyInvitationConnection init](&v5, "init");
  if (v2)
  {
    +[RPNWNearbyInvitationConnection addConnection:](&OBJC_CLASS___RPNWNearbyInvitationConnection, "addConnection:", v2);
    uint64_t v3 = v2;
  }

  return v2;
}

- (RPNWNearbyInvitationConnection)initWithPeer:(id)a3 session:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationConnection;
  v20 = -[RPNWNearbyInvitationConnection init](&v27, "init");
  v21 = v20;
  if (v20)
  {
    -[RPNWNearbyInvitationConnection setInbound:](v20, "setInbound:", v12);
    -[RPNWNearbyInvitationConnection setInternal:](v21, "setInternal:", v11);
    -[RPNWNearbyInvitationConnection setApplicationService:](v21, "setApplicationService:", v17);
    -[RPNWNearbyInvitationConnection setConnectionUUID:](v21, "setConnectionUUID:", v18);
    -[RPNWNearbyInvitationConnection setEndpointUUID:](v21, "setEndpointUUID:", v19);
    v22 = objc_alloc_init(&OBJC_CLASS___RPNWNearbyInvitationPeer);
    -[RPNWNearbyInvitationConnection setPeer:](v21, "setPeer:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v21, "peer"));
    [v23 setDestinationDevice:v15];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWNearbyInvitationConnection peer](v21, "peer"));
    [v24 setNearbyInvitationSession:v16];

    +[RPNWNearbyInvitationConnection addConnection:]( &OBJC_CLASS___RPNWNearbyInvitationConnection,  "addConnection:",  v21);
    v25 = v21;
  }

  return v21;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RPNWNearbyInvitationConnection;
  -[RPNWNearbyInvitationConnection dealloc](&v3, "dealloc");
}

- (void)sendStatusUpdate:(int)a3
{
}

+ (void)addConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100132450 <= 30)
  {
    if (dword_100132450 != -1 || (v5 = _LogCategory_Initialize(&dword_100132450, 30LL), id v3 = v8, v5))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
      LogPrintF( &dword_100132450,  "+[RPNWNearbyInvitationConnection addConnection:]",  30LL,  "addConnection for key=%@\n",  v4);

      id v3 = v8;
    }
  }

  v6 = (void *)qword_100133538;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
  [v6 setObject:v8 forKey:v7];
}

+ (void)removeConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100132450 <= 30)
  {
    if (dword_100132450 != -1 || (v5 = _LogCategory_Initialize(&dword_100132450, 30LL), id v3 = v8, v5))
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
      LogPrintF( &dword_100132450,  "+[RPNWNearbyInvitationConnection removeConnection:]",  30LL,  "removeConnection for key=%@\n",  v4);

      id v3 = v8;
    }
  }

  v6 = (void *)qword_100133538;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
  [v6 removeObjectForKey:v7];
}

+ (void)listConnections:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Connections\n"];
  if ([(id)qword_100133538 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = (id)qword_100133538;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133538 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)]);
          v10 = v9;
          if (v9)
          {
            BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
            [v3 appendFormat:@"  %@\n", v11];
          }

          id v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v6);
    }
  }

  else
  {
    [v3 appendString:@"  <empty>\n"];
  }
}

- (BOOL)inbound
{
  return self->_inbound;
}

- (void)setInbound:(BOOL)a3
{
  self->_inbound = a3;
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (OS_nw_framer)framer
{
  return self->_framer;
}

- (void)setFramer:(id)a3
{
}

- (RPNWNearbyInvitationPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
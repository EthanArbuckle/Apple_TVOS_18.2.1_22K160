@interface RPNWConnection
+ (void)addConnection:(id)a3;
+ (void)initialize;
+ (void)listConnections:(id)a3;
+ (void)removeConnection:(id)a3;
+ (void)stopAllOutgoingConnectionsNotForPeer:(id)a3;
- (BOOL)inbound;
- (BOOL)internal;
- (BOOL)isConnected;
- (NSMutableData)outgoingBuffer;
- (NSNumber)version;
- (NSString)applicationService;
- (NSUUID)connectionUUID;
- (NSUUID)endpointUUID;
- (OS_nw_framer)framer;
- (RPNWConnection)init;
- (RPNWConnection)initWithPeer:(id)a3 version:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9;
- (RPNWPeer)peer;
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
- (void)setOutgoingBuffer:(id)a3;
- (void)setPeer:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation RPNWConnection

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___RPNWConnection, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    v5 = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  5LL,  5LL,  10LL);
    v6 = (void *)qword_100133350;
    qword_100133350 = (uint64_t)v5;
  }

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  connectionUUID = self->_connectionUUID;
  if (self->_inbound) {
    v5 = "IN";
  }
  else {
    v5 = "OUT";
  }
  -[NSNumber doubleValue](self->_version, "doubleValue");
  uint64_t v7 = v6;
  applicationService = self->_applicationService;
  if (self->_isConnected) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWPeer destinationDevice](self->_peer, "destinationDevice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  endpointUUID = self->_endpointUUID;
  v13 = self->_framer;
  v14 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v14, "appendFormat:", @"%p", v13);

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"CONN[%@] (%s): version=%.2f appSvc=%@ connected=%s EP={%@:%@} framer=%@",  connectionUUID,  v5,  v7,  applicationService,  v9,  v11,  endpointUUID,  v14);
  return v3;
}

- (RPNWConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPNWConnection;
  v2 = -[RPNWConnection init](&v5, "init");
  if (v2)
  {
    +[RPNWConnection addConnection:](&OBJC_CLASS___RPNWConnection, "addConnection:", v2);
    uint64_t v3 = v2;
  }

  return v2;
}

- (RPNWConnection)initWithPeer:(id)a3 version:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___RPNWConnection;
  v20 = -[RPNWConnection init](&v26, "init");
  v21 = v20;
  if (v20)
  {
    -[RPNWConnection setVersion:](v20, "setVersion:", v16);
    -[RPNWConnection setInbound:](v21, "setInbound:", v12);
    -[RPNWConnection setInternal:](v21, "setInternal:", v11);
    -[RPNWConnection setApplicationService:](v21, "setApplicationService:", v17);
    -[RPNWConnection setConnectionUUID:](v21, "setConnectionUUID:", v18);
    -[RPNWConnection setEndpointUUID:](v21, "setEndpointUUID:", v19);
    v22 = objc_alloc_init(&OBJC_CLASS___RPNWPeer);
    -[RPNWConnection setPeer:](v21, "setPeer:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection peer](v21, "peer"));
    [v23 setDestinationDevice:v15];

    +[RPNWConnection addConnection:](&OBJC_CLASS___RPNWConnection, "addConnection:", v21);
    v24 = v21;
  }

  return v21;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWConnection endpointUUID](self, "endpointUUID"));
  +[RPNWEndpoint ageOutEndpointMapping:](&OBJC_CLASS___RPNWEndpoint, "ageOutEndpointMapping:", v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPNWConnection;
  -[RPNWConnection dealloc](&v4, "dealloc");
}

- (void)sendStatusUpdate:(int)a3
{
}

+ (void)addConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100131B90 <= 30)
  {
    if (dword_100131B90 != -1 || (v5 = _LogCategory_Initialize(&dword_100131B90, 30LL), id v3 = v8, v5))
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
      LogPrintF(&dword_100131B90, "+[RPNWConnection addConnection:]", 30LL, "addConnection for key=%@\n", v4);

      id v3 = v8;
    }
  }

  uint64_t v6 = (void *)qword_100133350;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
  [v6 setObject:v8 forKey:v7];
}

+ (void)removeConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100131B90 <= 30)
  {
    if (dword_100131B90 != -1 || (v5 = _LogCategory_Initialize(&dword_100131B90, 30LL), id v3 = v8, v5))
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
      LogPrintF(&dword_100131B90, "+[RPNWConnection removeConnection:]", 30LL, "removeConnection for key=%@\n", v4);

      id v3 = v8;
    }
  }

  uint64_t v6 = (void *)qword_100133350;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 connectionUUID]);
  [v6 removeObjectForKey:v7];
}

+ (void)stopAllOutgoingConnectionsNotForPeer:(id)a3
{
  id v3 = a3;
  if (dword_100131B90 <= 40 && (dword_100131B90 != -1 || _LogCategory_Initialize(&dword_100131B90, 40LL)))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    LogPrintF( &dword_100131B90,  "+[RPNWConnection stopAllOutgoingConnectionsNotForPeer:]",  40LL,  "Stop connections not for peer %@\n",  v4);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (id)qword_100133350;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133350 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)i)]);
        BOOL v11 = v10;
        if (v10)
        {
          if ([v10 isConnected])
          {
            if (([v11 inbound] & 1) == 0
              && ([v11 internal] & 1) == 0)
            {
              BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peer]);
              v13 = (void *)objc_claimAutoreleasedReturnValue([v12 destinationDevice]);
              unsigned __int8 v14 = [v13 isEqualToDevice:v3];

              if ((v14 & 1) == 0)
              {
                if (dword_100131B90 <= 30
                  && (dword_100131B90 != -1 || _LogCategory_Initialize(&dword_100131B90, 30LL)))
                {
                  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 connectionUUID]);
                  LogPrintF( &dword_100131B90,  "+[RPNWConnection stopAllOutgoingConnectionsNotForPeer:]",  30LL,  "Signaling error on framer for connection=%@\n",  v15);
                }

                id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 framer]);
                +[RPNWFramer writeErrorOnFramer:error:]( &OBJC_CLASS___RPNWFramer,  "writeErrorOnFramer:error:",  v16,  50LL);
              }
            }
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v7);
  }
}

+ (void)listConnections:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Connections\n"];
  if ([(id)qword_100133350 count])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v4 = (id)qword_100133350;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_100133350 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)]);
          v10 = v9;
          if (v9)
          {
            BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
            [v3 appendFormat:@"  %@\n", v11];
          }

          uint64_t v8 = (char *)v8 + 1;
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

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
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

- (RPNWPeer)peer
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

- (NSMutableData)outgoingBuffer
{
  return self->_outgoingBuffer;
}

- (void)setOutgoingBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
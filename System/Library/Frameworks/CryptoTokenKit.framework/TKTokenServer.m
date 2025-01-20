@interface TKTokenServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)waitForRegistry;
- (NSXPCListener)SEPKeyListener;
- (NSXPCListener)tokenServerListener;
- (NSXPCListener)tokenWatcherListener;
- (TKClientToken)client;
- (TKHostTokenRegistry)tokenRegistry;
- (TKSEPKeyServer)SEPKeyServer;
- (TKTokenServer)initWithTokenServer:(id)a3;
- (id)ensureSlotWatcherIsRunning;
- (id)pairingNotification:(id *)a3;
- (void)dealloc;
- (void)getEndpoint:(id)a3;
- (void)hostTokenRegistry:(id)a3 addedToken:(id)a4;
- (void)hostTokenRegistry:(id)a3 removedToken:(id)a4;
- (void)setEnsureSlotWatcherIsRunning:(id)a3;
- (void)setTokenRegistry:(id)a3;
- (void)start;
- (void)startWatchingWithReply:(id)a3;
- (void)stop;
@end

@implementation TKTokenServer

- (TKClientToken)client
{
  v3 = objc_alloc(&OBJC_CLASS___TKClientToken);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenServerListener](self, "tokenServerListener"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 endpoint]);
  v6 = -[TKClientToken initWithTokenID:serverEndpoint:targetUID:]( v3,  "initWithTokenID:serverEndpoint:targetUID:",  &stru_10001D228,  v5,  0LL);

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TKTokenServer SEPKeyListener](self, "SEPKeyListener"));

  if (v8 == v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKRemoteSEPKeyProtocol));
    [v7 setExportedInterface:v12];

    v13 = (TKTokenClientConnection *)objc_claimAutoreleasedReturnValue(-[TKTokenServer SEPKeyServer](self, "SEPKeyServer"));
LABEL_7:
    [v7 setExportedObject:v13];
LABEL_9:

    [v7 resume];
    BOOL v11 = 1;
    goto LABEL_10;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenServerListener](self, "tokenServerListener"));

  if (v9 == v6)
  {
    v13 = -[TKTokenClientConnection initWithConnection:server:]( objc_alloc(&OBJC_CLASS___TKTokenClientConnection),  "initWithConnection:server:",  v7,  self);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKClientTokenServerProtocol));
    [v7 setExportedInterface:v14];

    goto LABEL_7;
  }

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenWatcherListener](self, "tokenWatcherListener"));

  if (v10 == v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolTokenWatcherServer));
    [v7 setExportedInterface:v15];

    [v7 setExportedObject:self];
    v13 = (TKTokenClientConnection *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TKProtocolTokenWatcherHost));
    [v7 setRemoteObjectInterface:v13];
    goto LABEL_9;
  }

  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)startWatchingWithReply:(id)a3
{
  v32 = (void (**)(id, id))a3;
  v4 = self->_watcherConnections;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  -[NSHashTable addObject:](self->_watcherConnections, "addObject:", v5);
  v35 = self;

  objc_sync_exit(v4);
  id v6 = [&__NSArray0__struct mutableCopy];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TKClientToken builtinTokenIDs](&OBJC_CLASS___TKClientToken, "builtinTokenIDs"));
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v46 = *(void *)(*((void *)&v40 + 1) + 8LL * (void)v10);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v46,  1LL,  v32));
        [v6 addObject:v11];

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }

    while (v8);
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](v35, "tokenRegistry"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v12 tokens]);

  id v13 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v13)
  {
    uint64_t v34 = *(void *)v37;
    do
    {
      v14 = 0LL;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](v35, "tokenRegistry", v32));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 tokenWithTokenID:v15]);

        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 driver]);
        if (!v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 registry]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 driverCache]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v17 tokenID]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v21 classID]);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v20 hostTokenDriverWithClassID:v22 error:0]);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue([v15 stringRepresentation]);
        v44[0] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v18 extension]);
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 _localizedName]);
        v26 = (void *)v25;
        v27 = &stru_10001D228;
        if (v25) {
          v27 = (const __CFString *)v25;
        }
        v44[1] = v27;
        uint64_t v28 = objc_claimAutoreleasedReturnValue([v17 slotName]);
        v29 = (void *)v28;
        v30 = &stru_10001D228;
        if (v28) {
          v30 = (const __CFString *)v28;
        }
        v44[2] = v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 3LL));
        [v6 addObject:v31];

        v14 = (char *)v14 + 1;
      }

      while (v13 != v14);
      id v13 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v13);
  }

  v32[2](v32, v6);
}

- (void)getEndpoint:(id)a3
{
  tokenWatcherListener = self->_tokenWatcherListener;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCListener endpoint](tokenWatcherListener, "endpoint"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)hostTokenRegistry:(id)a3 addedToken:(id)a4
{
  id v33 = a3;
  id v37 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](self, "tokenRegistry"));
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v6 tokenWithTokenID:v37]);

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v39 driver]);
  if (!v38)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v39 registry]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 driverCache]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v39 tokenID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 classID]);
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v8 hostTokenDriverWithClassID:v10 error:0]);
  }

  id v44 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer pairingNotification:](self, "pairingNotification:", &v44));
  id v35 = v44;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v39 slotName]);
  id v13 = (void *)v12;
  if (v12) {
    v14 = (const __CFString *)v12;
  }
  else {
    v14 = &stru_10001D228;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue([v38 extension]);
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 _localizedName]);
  v17 = (void *)v16;
  if (v16) {
    v18 = (const __CFString *)v16;
  }
  else {
    v18 = &stru_10001D228;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue([v37 stringRepresentation]);
  [v11 tokenInserted:v14 driverName:v18 tokenID:v19 reply:&stru_10001C940];

  [v35 invalidate];
  uint64_t v34 = self->_watcherConnections;
  objc_sync_enter(v34);
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = self->_watcherConnections;
  id v20 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
  if (v20)
  {
    uint64_t v21 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v40 + 1) + 8 * (void)i) remoteObjectProxy]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v37 stringRepresentation]);
        v45[0] = v24;
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v38 extension]);
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 _localizedName]);
        v27 = (void *)v26;
        if (v26) {
          uint64_t v28 = (const __CFString *)v26;
        }
        else {
          uint64_t v28 = &stru_10001D228;
        }
        v45[1] = v28;
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v39 slotName]);
        v30 = (void *)v29;
        if (v29) {
          v31 = (const __CFString *)v29;
        }
        else {
          v31 = &stru_10001D228;
        }
        v45[2] = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL));
        [v23 insertedToken:v32];
      }

      id v20 = -[NSHashTable countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
    }

    while (v20);
  }

  objc_sync_exit(v34);
}

- (void)hostTokenRegistry:(id)a3 removedToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer pairingNotification:](self, "pairingNotification:", &v22));
  id v9 = v22;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringRepresentation]);
  [v8 tokenRemoved:v10 reply:&stru_10001C960];

  [v9 invalidate];
  BOOL v11 = self->_watcherConnections;
  objc_sync_enter(v11);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v12 = self->_watcherConnections;
  id v13 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0LL;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v18 + 1) + 8 * (void)v15),  "remoteObjectProxy",  (void)v18));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v7 stringRepresentation]);
        [v16 removedToken:v17];

        v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v13);
  }

  objc_sync_exit(v11);
}

- (TKTokenServer)initWithTokenServer:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TKTokenServer;
  id v5 = -[TKTokenServer init](&v19, "init");
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSCondition);
    tokenRegistrySetCondition = v5->_tokenRegistrySetCondition;
    v5->_tokenRegistrySetCondition = v6;

    if (v4) {
      id v8 = (NSXPCListener *)v4;
    }
    else {
      id v8 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    }
    tokenServerListener = v5->_tokenServerListener;
    v5->_tokenServerListener = v8;

    -[NSXPCListener setDelegate:](v5->_tokenServerListener, "setDelegate:", v5);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    tokenWatcherListener = v5->_tokenWatcherListener;
    v5->_tokenWatcherListener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v5->_tokenWatcherListener, "setDelegate:", v5);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    watcherConnections = v5->_watcherConnections;
    v5->_watcherConnections = (NSHashTable *)v12;

    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___TKSEPKeyServer);
    SEPKeyServer = v5->_SEPKeyServer;
    v5->_SEPKeyServer = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    SEPKeyListener = v5->_SEPKeyListener;
    v5->_SEPKeyListener = (NSXPCListener *)v16;

    -[NSXPCListener setDelegate:](v5->_SEPKeyListener, "setDelegate:", v5);
  }

  return v5;
}

- (void)setTokenRegistry:(id)a3
{
  id v5 = a3;
  id v6 = sub_10000C30C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000112E0(v7, v8, v9);
  }

  if (!self->_tokenRegistrySet)
  {
    -[NSCondition lock](self->_tokenRegistrySetCondition, "lock");
    self->_tokenRegistrySet = 1;
    objc_storeStrong((id *)&self->_tokenRegistry, a3);
    -[TKHostTokenRegistry setDelegate:](self->_tokenRegistry, "setDelegate:", self);
    -[NSCondition broadcast](self->_tokenRegistrySetCondition, "broadcast");
    -[NSCondition unlock](self->_tokenRegistrySetCondition, "unlock");
  }
}

- (BOOL)waitForRegistry
{
  while (!self->_tokenRegistrySet)
  {
    id v6 = sub_10000C30C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100011348(&v12, v13, v7);
    }

    -[NSCondition wait](self->_tokenRegistrySetCondition, "wait");
    id v8 = sub_10000C30C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100011314(&v10, v11, v9);
    }
  }

  -[NSCondition unlock](self->_tokenRegistrySetCondition, "unlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](self, "tokenRegistry"));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKTokenServer;
  -[TKTokenServer dealloc](&v3, "dealloc");
}

- (void)start
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenServerListener](self, "tokenServerListener"));
  [v3 resume];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenWatcherListener](self, "tokenWatcherListener"));
  [v4 resume];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer SEPKeyListener](self, "SEPKeyListener"));
  [v5 resume];

  uint64_t v6 = TKTokenWatcherServerStartedNotification;
  uint32_t v7 = notify_post((const char *)[TKTokenWatcherServerStartedNotification UTF8String]);
  if (v7)
  {
    int v8 = v7;
    id v9 = sub_10000C30C();
    uint8_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001137C(v6, v8, v10);
    }
  }

- (void)stop
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenServerListener](obj, "tokenServerListener"));
  [v2 invalidate];

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenWatcherListener](obj, "tokenWatcherListener"));
  [v3 invalidate];

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer SEPKeyListener](obj, "SEPKeyListener"));
  [v4 invalidate];

  tokenServerListener = obj->_tokenServerListener;
  obj->_tokenServerListener = 0LL;

  tokenWatcherListener = obj->_tokenWatcherListener;
  obj->_tokenWatcherListener = 0LL;

  SEPKeyListener = obj->_SEPKeyListener;
  obj->_SEPKeyListener = 0LL;

  -[NSCondition lock](obj->_tokenRegistrySetCondition, "lock");
  if (!obj->_tokenRegistrySet)
  {
    obj->_tokenRegistrySet = 1;
    -[NSCondition broadcast](obj->_tokenRegistrySetCondition, "broadcast");
  }

  -[NSCondition unlock](obj->_tokenRegistrySetCondition, "unlock");
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TKTokenServer tokenRegistry](obj, "tokenRegistry"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 driverCache]);
  [v9 invalidate];

  objc_sync_exit(obj);
}

- (id)pairingNotification:(id *)a3
{
  return 0LL;
}

- (TKHostTokenRegistry)tokenRegistry
{
  return self->_tokenRegistry;
}

- (NSXPCListener)tokenServerListener
{
  return self->_tokenServerListener;
}

- (TKSEPKeyServer)SEPKeyServer
{
  return self->_SEPKeyServer;
}

- (id)ensureSlotWatcherIsRunning
{
  return self->_ensureSlotWatcherIsRunning;
}

- (void)setEnsureSlotWatcherIsRunning:(id)a3
{
}

- (NSXPCListener)tokenWatcherListener
{
  return self->_tokenWatcherListener;
}

- (NSXPCListener)SEPKeyListener
{
  return self->_SEPKeyListener;
}

- (void).cxx_destruct
{
}

@end
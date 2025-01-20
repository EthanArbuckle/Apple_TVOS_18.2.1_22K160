@interface SDXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (SDXPCServer)init;
- (id)_stateDumpString;
- (os_state_data_s)_stateDump;
- (void)_activate;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)stateAppendXPCConnections:(id *)a3;
@end

@implementation SDXPCServer

- (SDXPCServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SDXPCServer;
  v2 = -[SDXPCServer init](&v9, "init");
  v4 = v2;
  if (v2)
  {
    uint64_t v5 = SFMainQueue(v2, v3);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    v4->_prefNotifyToken = -1;
  }

  return v4;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D90A4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  id v3 = (id)LogControl("?.*:level=chatty,.*:flags=public");
  if (dword_100642CD8 <= 30)
  {
    if (dword_100642CD8 != -1 || (id v3 = (id)_LogCategory_Initialize(&dword_100642CD8, 30LL), (_DWORD)v3)) {
      id v3 = (id)LogPrintF(&dword_100642CD8, "-[SDXPCServer _activate]", 30LL, "Activate\n");
    }
  }

  if (!self->_xpcListener)
  {
    v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.SharingServices");
    xpcListener = self->_xpcListener;
    self->_xpcListener = v4;

    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    id v3 = -[NSXPCListener resume](self->_xpcListener, "resume");
  }

  uint64_t v6 = SFAWDEnsureInitialized(v3);
  if (!self->_appleIDAgent)
  {
    v7 = (SDAppleIDAgent *)objc_claimAutoreleasedReturnValue(+[SDAppleIDAgent sharedAgent](&OBJC_CLASS___SDAppleIDAgent, "sharedAgent"));
    appleIDAgent = self->_appleIDAgent;
    self->_appleIDAgent = v7;
  }

  if (!self->_nearbyAgent)
  {
    objc_super v9 = (SDNearbyAgent *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    nearbyAgent = self->_nearbyAgent;
    self->_nearbyAgent = v9;

    -[SDNearbyAgent setDispatchQueue:](self->_nearbyAgent, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDNearbyAgent activate](self->_nearbyAgent, "activate");
  }

  if (!self->_riAgent)
  {
    v11 = (SDRemoteInteractionAgent *)objc_claimAutoreleasedReturnValue( +[SDRemoteInteractionAgent sharedAgent]( &OBJC_CLASS___SDRemoteInteractionAgent,  "sharedAgent"));
    riAgent = self->_riAgent;
    self->_riAgent = v11;

    -[SDRemoteInteractionAgent setDispatchQueue:](self->_riAgent, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDRemoteInteractionAgent activate](self->_riAgent, "activate");
  }

  if (!self->_rtiClient)
  {
    v13 = (SDSharedRemoteTextInputClient *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    rtiClient = self->_rtiClient;
    self->_rtiClient = v13;

    -[SDSharedRemoteTextInputClient setDispatchQueue:](self->_rtiClient, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDSharedRemoteTextInputClient activate](self->_rtiClient, "activate");
  }

  if (!self->_setupAgent)
  {
    v15 = (SDSetupAgent *)objc_claimAutoreleasedReturnValue(+[SDSetupAgent sharedSetupAgent](&OBJC_CLASS___SDSetupAgent, "sharedSetupAgent"));
    setupAgent = self->_setupAgent;
    self->_setupAgent = v15;

    -[SDSetupAgent setDispatchQueue:](self->_setupAgent, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDSetupAgent activate](self->_setupAgent, "activate");
  }

  if (!self->_autoFillAgent)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___SDAutoFillAgent);
    autoFillAgent = self->_autoFillAgent;
    self->_autoFillAgent = v17;

    -[SDAutoFillAgent setDispatchQueue:](self->_autoFillAgent, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDAutoFillAgent activate](self->_autoFillAgent, "activate");
  }

  if (!self->_proxHandoffAgent)
  {
    v19 = (SDProxHandoffAgent *)objc_claimAutoreleasedReturnValue(+[SDProxHandoffAgent sharedAgent](&OBJC_CLASS___SDProxHandoffAgent, "sharedAgent"));
    proxHandoffAgent = self->_proxHandoffAgent;
    self->_proxHandoffAgent = v19;

    -[SDProxHandoffAgent setDispatchQueue:](self->_proxHandoffAgent, "setDispatchQueue:", self->_dispatchQueue);
    uint64_t v6 = (uint64_t)-[SDProxHandoffAgent activate](self->_proxHandoffAgent, "activate");
  }

  p_prefNotifyToken = &self->_prefNotifyToken;
  if (self->_prefNotifyToken == -1)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000D93A0;
    handler[3] = &unk_1005CB7B8;
    handler[4] = self;
    uint64_t v6 = notify_register_dispatch("com.apple.Sharing.prefsChanged", p_prefNotifyToken, dispatchQueue, handler);
  }

  if (!self->_stateHandle)
  {
    if (IsAppleInternalBuild(v6, p_prefNotifyToken))
    {
      v23 = self->_dispatchQueue;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_1000D945C;
      v24[3] = &unk_1005CC510;
      v24[4] = self;
      self->_stateHandle = os_state_add_handler(v23, v24);
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D94BC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  unint64_t stateHandle = self->_stateHandle;
  if (stateHandle)
  {
    os_state_remove_handler(stateHandle, v3);
    self->_unint64_t stateHandle = 0LL;
  }

  int prefNotifyToken = self->_prefNotifyToken;
  if (prefNotifyToken != -1)
  {
    notify_cancel(prefNotifyToken);
    self->_int prefNotifyToken = -1;
  }

  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0LL;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v7 = self->_xpcConnections;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*(void *)(*((void *)&v20 + 1) + 8 * (void)i) + 120), "invalidate", (void)v20);
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    }

    while (v9);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0LL;

  appleIDAgent = self->_appleIDAgent;
  self->_appleIDAgent = 0LL;

  -[SDNearbyAgent invalidate](self->_nearbyAgent, "invalidate");
  nearbyAgent = self->_nearbyAgent;
  self->_nearbyAgent = 0LL;

  -[SDRemoteInteractionAgent invalidate](self->_riAgent, "invalidate");
  riAgent = self->_riAgent;
  self->_riAgent = 0LL;

  -[SDSharedRemoteTextInputClient invalidate](self->_rtiClient, "invalidate");
  rtiClient = self->_rtiClient;
  self->_rtiClient = 0LL;

  -[SDSetupAgent invalidate](self->_setupAgent, "invalidate");
  setupAgent = self->_setupAgent;
  self->_setupAgent = 0LL;

  -[SDAutoFillAgent invalidate](self->_autoFillAgent, "invalidate");
  autoFillAgent = self->_autoFillAgent;
  self->_autoFillAgent = 0LL;

  -[SDProxHandoffAgent invalidate](self->_proxHandoffAgent, "invalidate");
  proxHandoffAgent = self->_proxHandoffAgent;
  self->_proxHandoffAgent = 0LL;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v8 = (NSXPCListener *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v9 = -[SDXPCConnection initWithServer:xpcConnection:]( objc_alloc(&OBJC_CLASS___SDXPCConnection),  "initWithServer:xpcConnection:",  self,  v6);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v12 = self->_xpcConnections;
    self->_xpcConnections = v11;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v9);
  xpcListener = self->_xpcListener;

  if (xpcListener == v8)
  {
    v14 = self->_xpcInterfaceClient;
    if (!v14)
    {
      v14 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SFXPCInterface));
      objc_storeStrong((id *)&self->_xpcInterfaceClient, v14);
    }

    v15 = self->_xpcInterfaceServer;
    if (!v15)
    {
      v15 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SDXPCInterface));
      v16 = objc_alloc(&OBJC_CLASS___NSSet);
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v17);
      __int128 v20 = -[NSSet initWithObjects:]( v16,  "initWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___SFPeopleSuggesterResult, v19),  0LL);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v20,  "getPeopleSuggestions:completion:",  0LL,  1LL);

      objc_storeStrong((id *)&self->_xpcInterfaceServer, v15);
    }

    [v6 _setQueue:self->_dispatchQueue];
    [v6 setExportedInterface:v15];
    [v6 setExportedObject:v9];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000D99D0;
    v22[3] = &unk_1005CB480;
    v22[4] = self;
    __int128 v23 = v9;
    [v6 setInvalidationHandler:v22];
    [v6 setRemoteObjectInterface:v14];
    [v6 resume];
    if (dword_100642CD8 <= 20
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 20LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCServer listener:shouldAcceptNewConnection:]",  20,  "XPC connection started from %#{pid}\n",  [v6 processIdentifier]);
    }
  }

  else
  {
    if (dword_100642CD8 <= 60
      && (dword_100642CD8 != -1 || _LogCategory_Initialize(&dword_100642CD8, 60LL)))
    {
      LogPrintF( &dword_100642CD8,  "-[SDXPCServer listener:shouldAcceptNewConnection:]",  60LL,  "### Unknown XPC listener\n");
    }

    -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v9);
  }

  return xpcListener == v8;
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);
}

- (void)stateAppendXPCConnections:(id *)a3
{
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  obj = self->_xpcConnections;
  id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v16)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        NSAppendPrintF(a3, "%#{pid}", [*(id *)(v6 + 120) processIdentifier]);
        if ([*(id *)(v6 + 16) count])
        {
          uint64_t v18 = i;
          NSAppendPrintF(a3, ", Assertions: ");
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          uint64_t v17 = v6;
          id v7 = *(id *)(v6 + 16);
          id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8)
          {
            id v9 = v8;
            int v10 = 0;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v7);
                }
                if (v10 + (_DWORD)j) {
                  v13 = ", ";
                }
                else {
                  v13 = "";
                }
                NSAppendPrintF( a3,  "%s%@ (%ld total)",  v13,  *(void *)(*((void *)&v19 + 1) + 8LL * (void)j),  -[NSCountedSet countForObject:]( self->_assertions,  "countForObject:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)j)));
              }

              id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
              v10 += (int)j;
            }

            while (v9);
          }

          uint64_t v6 = v17;
          i = v18;
        }

        if (*(void *)(v6 + 24)) {
          NSAppendPrintF(a3, ", %@", *(void *)(v6 + 24));
        }
        if (*(void *)(v6 + 32)) {
          NSAppendPrintF(a3, ", %@", *(void *)(v6 + 32));
        }
        if (*(void *)(v6 + 56)) {
          NSAppendPrintF(a3, ", Note: %@", *(void *)(v6 + 56));
        }
        if (*(void *)(v6 + 64)) {
          NSAppendPrintF(a3, ", PreventExit: '%@'", *(void *)(v6 + 64));
        }
        if (*(void *)(v6 + 80)) {
          NSAppendPrintF(a3, ", %@", *(void *)(v6 + 80));
        }
        if (*(void *)(v6 + 88)) {
          NSAppendPrintF(a3, ", %@", *(void *)(v6 + 88));
        }
        if (*(void *)(v6 + 96)) {
          NSAppendPrintF(a3, ", %@", *(void *)(v6 + 96));
        }
        NSAppendPrintF(a3, "\n");
      }

      id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
    }

    while (v16);
  }
}

- (os_state_data_s)_stateDump
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCServer _stateDumpString](self, "_stateDumpString"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  200LL,  0LL,  0LL));
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 length];
      id v7 = (os_state_data_s *)calloc(1uLL, (size_t)v6 + 200);
      id v8 = v7;
      if (v7)
      {
        v7->var0 = 1;
        v7->var1.var1 = v6;
        __strlcpy_chk(v7->var3, "SharingServices State", 64LL, 64LL);
        id v5 = v5;
        memcpy(v8->var4, [v5 bytes], (size_t)v6);
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
    id v5 = 0LL;
  }

  return v8;
}

- (id)_stateDumpString
{
  id v35 = 0LL;
  NSAppendPrintF(&v35, "\n");
  id v3 = v35;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent description](self->_nearbyAgent, "description"));
  id v5 = (void *)v4;
  if (v4)
  {
    id v34 = v3;
    NSAppendPrintF(&v34, "%@\n", v4);
    id v6 = v34;

    id v3 = v6;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDRemoteInteractionAgent description](self->_riAgent, "description"));

  if (v7)
  {
    id v33 = v3;
    NSAppendPrintF(&v33, "%@\n", v7);
    id v8 = v33;

    id v3 = v8;
  }

  uint64_t v9 = CUDescriptionWithLevel(self->_setupAgent, 0LL);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    id v32 = v3;
    NSAppendPrintF(&v32, "%@\n", v10);
    id v11 = v32;

    id v3 = v11;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoFillAgent description](self->_autoFillAgent, "description"));

  if (v12)
  {
    id v31 = v3;
    NSAppendPrintF(&v31, "%@\n", v12);
    id v13 = v31;

    id v3 = v13;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent description](self->_proxHandoffAgent, "description"));

  if (v14)
  {
    id v30 = v3;
    NSAppendPrintF(&v30, "%@\n", v14);
    id v15 = v30;

    id v3 = v15;
  }

  id v29 = v3;
  -[SDXPCServer stateAppendXPCConnections:](self, "stateAppendXPCConnections:", &v29);
  id v16 = v29;

  id v28 = v16;
  NSAppendPrintF(&v28, "\n");
  id v17 = v28;

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDAgent detailedDescription](self->_appleIDAgent, "detailedDescription"));
  if (v18)
  {
    id v27 = v17;
    NSAppendPrintF(&v27, "%@\n", v18);
    id v19 = v27;

    id v17 = v19;
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 description]);

  if (v21)
  {
    id v26 = v17;
    NSAppendPrintF(&v26, "%@\n", v21);
    id v22 = v26;

    id v17 = v22;
  }

  id v25 = v17;
  NSAppendPrintF(&v25, "SharingServices State End\n");
  id v23 = v25;

  return v23;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
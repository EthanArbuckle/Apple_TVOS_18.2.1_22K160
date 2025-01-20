@interface MRDApplicationConnection
- (MRApplicationConnectionContext)context;
- (MRDApplicationConnection)initWithContext:(id)a3;
- (MRDMediaRemoteClient)invalidationXPCClient;
- (MRExternalDevice)invalidationExternalDevice;
- (MRPlayerPath)invalidationPlayerPath;
- (NSMutableArray)pendingMessages;
- (NSString)identifier;
- (id)clientBoundMessageHandler;
- (id)installInvalidationObserversAndCheckForPostActivationInvalidations;
- (id)serverBoundMessageHandler;
- (os_unfair_lock_s)lock;
- (unint64_t)state;
- (unint64_t)type;
- (void)activate;
- (void)dealloc;
- (void)handleClientBoundMessage:(id)a3;
- (void)handleClientInvalidation:(id)a3;
- (void)handlePlayerInvalidation:(id)a3;
- (void)handleRemoteExternalDeviceInvalidation:(id)a3;
- (void)handleServerBoundMessage:(id)a3;
- (void)handleXPCClientInvalidation:(id)a3;
- (void)invalidate:(id)a3;
- (void)setClientBoundMessageHandler:(id)a3;
- (void)setInvalidationExternalDevice:(id)a3;
- (void)setInvalidationPlayerPath:(id)a3;
- (void)setInvalidationXPCClient:(id)a3;
- (void)setLocalHostedInvalidationPlayerPath:(id)a3;
- (void)setLocalInvalidationXPCClient:(id)a3;
- (void)setRemoteInvalidationExternalDevice:(id)a3;
- (void)setServerBoundMessageHandler:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MRDApplicationConnection

- (MRDApplicationConnection)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDApplicationConnection;
  v6 = -[MRDApplicationConnection init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = _MRLogForCategory(0LL, a2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDApplicationConnection]<%p> dealloc",  buf,  0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRDApplicationConnection;
  -[MRDApplicationConnection dealloc](&v5, "dealloc");
}

- (NSString)identifier
{
  return (NSString *)-[MRApplicationConnectionContext identifier](self->_context, "identifier");
}

- (void)handleServerBoundMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 1)
  {
    v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MRDApplicationConnection serverBoundMessageHandler]( self,  "serverBoundMessageHandler"));
    os_unfair_lock_unlock(&self->_lock);
    if (v12)
    {
      ((void (**)(void, MRDApplicationConnection *, id))v12)[2](v12, self, v4);
    }
  }

  else
  {
    if (state)
    {
      uint64_t v13 = _MRLogForCategory(0LL, v5);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1002B9CC4();
      }
    }

    else
    {
      uint64_t v7 = _MRLogForCategory(0LL, v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 134217984;
        v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDApplicationConnection]<%p> handleServerBoundMessage - state: .initial -> enqueuing",  (uint8_t *)&v15,  0xCu);
      }

      pendingMessages = self->_pendingMessages;
      if (!pendingMessages)
      {
        v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v11 = self->_pendingMessages;
        self->_pendingMessages = v10;

        pendingMessages = self->_pendingMessages;
      }

      -[NSMutableArray addObject:](pendingMessages, "addObject:", v4);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)handleClientBoundMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  if (state == 1)
  {
    objc_super v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[MRDApplicationConnection clientBoundMessageHandler]( self,  "clientBoundMessageHandler"));
    os_unfair_lock_unlock(&self->_lock);
    if (v9)
    {
      ((void (**)(void, MRDApplicationConnection *, id))v9)[2](v9, self, v4);
    }
  }

  else
  {
    if (state)
    {
      uint64_t v10 = _MRLogForCategory(0LL, v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1002B9D24();
      }
    }

    else
    {
      uint64_t v7 = _MRLogForCategory(0LL, v5);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_1002B9D84();
      }
    }

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_state)
  {
    self->_unint64_t state = 1LL;
    uint64_t v7 = self->_pendingMessages;
    pendingMessages = self->_pendingMessages;
    self->_pendingMessages = 0LL;

    objc_super v9 = (void (**)(id, MRDApplicationConnection *, void))objc_retainBlock(self->_serverBoundMessageHandler);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[MRDApplicationConnection installInvalidationObserversAndCheckForPostActivationInvalidations]( self,  "installInvalidationObserversAndCheckForPostActivationInvalidations"));
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      -[MRDApplicationConnection invalidate:](self, "invalidate:", v10);
    }

    else
    {
      if (!v9) {
        goto LABEL_17;
      }
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      uint64_t v7 = v7;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          v14 = 0LL;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v7);
            }
            v9[2](v9, self, *(void *)(*((void *)&v15 + 1) + 8LL * (void)v14));
            v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
        }

        while (v12);
      }
    }

    goto LABEL_17;
  }

  uint64_t v5 = _MRLogForCategory(0LL, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1002B9DF0();
  }

  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = 0LL;
LABEL_17:
}

- (void)setClientBoundMessageHandler:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state)
  {
    id v4 = objc_retainBlock(v8);
    id clientBoundMessageHandler = self->_clientBoundMessageHandler;
    self->_id clientBoundMessageHandler = v4;
  }

  id v6 = objc_retainBlock(v8);
  id v7 = self->_clientBoundMessageHandler;
  self->_id clientBoundMessageHandler = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServerBoundMessageHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = objc_retainBlock(v5);

  id serverBoundMessageHandler = self->_serverBoundMessageHandler;
  self->_id serverBoundMessageHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_type = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 2)
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    id v5 = (void (**)(id, MRDApplicationConnection *, id))objc_retainBlock(self->_clientBoundMessageHandler);
    id v6 = (void (**)(id, MRDApplicationConnection *, id))objc_retainBlock(self->_serverBoundMessageHandler);
    self->_unint64_t state = 2LL;
    id clientBoundMessageHandler = self->_clientBoundMessageHandler;
    self->_id clientBoundMessageHandler = 0LL;

    id serverBoundMessageHandler = self->_serverBoundMessageHandler;
    self->_id serverBoundMessageHandler = 0LL;

    id v9 = objc_alloc(&OBJC_CLASS___MRInvalidateApplicationConnectionMessage);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDApplicationConnection context](self, "context"));
    id v11 = [v9 initWithConnectionContext:v10 error:v4];

    if ([v4 code] == (id)181)
    {
      uint64_t v13 = @"ClosedByClient";
    }

    else if ([v4 code] == (id)182)
    {
      uint64_t v13 = @"ClosedByServer";
    }

    else
    {
      uint64_t v13 = @"error";
    }

    uint64_t v14 = _MRLogForCategory(0LL, v12);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      id v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[MRDApplicationConnection]<%p> invalidate - reason: %@, error: %@",  buf,  0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      uint64_t v17 = _MRLogForCategory(0LL, v16);
      __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v27 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[MRDApplicationConnection]<%p> invalidate - notify client",  buf,  0xCu);
      }

      v5[2](v5, self, v11);
    }

    if (v6)
    {
      uint64_t v19 = _MRLogForCategory(0LL, v16);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v27 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[MRDApplicationConnection]<%p> invalidate - notify server",  buf,  0xCu);
      }

      v6[2](v6, self, v11);
    }

    qos_class_t v21 = qos_class_self();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v21, 0LL);
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10011DC74;
    v24[3] = &unk_100398E60;
    v24[4] = self;
    v25 = (__CFString *)v13;
    dispatch_async(v23, v24);
  }
}

- (void)setRemoteInvalidationExternalDevice:(id)a3
{
  id v4 = (MRExternalDevice *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationExternalDevice = self->_invalidationExternalDevice;
  self->_invalidationExternalDevice = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalHostedInvalidationPlayerPath:(id)a3
{
  id v4 = (MRPlayerPath *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationPlayerPath = self->_invalidationPlayerPath;
  self->_invalidationPlayerPath = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setLocalInvalidationXPCClient:(id)a3
{
  id v4 = (MRDMediaRemoteClient *)a3;
  os_unfair_lock_lock(&self->_lock);
  invalidationXPCClient = self->_invalidationXPCClient;
  self->_invalidationXPCClient = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)installInvalidationObserversAndCheckForPostActivationInvalidations
{
  uint64_t v3 = self->_invalidationExternalDevice;
  id v4 = self->_invalidationPlayerPath;
  id v5 = self->_invalidationXPCClient;
  if (!v4)
  {
LABEL_7:
    if (v3
      && (uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter")),
          [v13 addObserver:self selector:"handleRemoteExternalDeviceInvalidation:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:v3],  v13,  (-[MRExternalDevice isConnected](v3, "isConnected") & 1) == 0))
    {
      __int128 v18 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v19 = 176LL;
    }

    else
    {
      if (!v5) {
        goto LABEL_11;
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v14 addObserver:self selector:"handleXPCClientInvalidation:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:v5];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allClients]);
      unsigned __int8 v17 = [v16 containsObject:v5];

      if ((v17 & 1) != 0)
      {
LABEL_11:
        uint64_t v12 = 0LL;
        goto LABEL_15;
      }

      __int128 v18 = objc_alloc(&OBJC_CLASS___NSError);
      uint64_t v19 = 179LL;
    }

    uint64_t v12 = -[NSError initWithMRError:](v18, "initWithMRError:", v19);
    goto LABEL_15;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 addObserver:self selector:"handleClientInvalidation:" name:kMRMediaRemoteNowPlayingApplicationDidUnregister object:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath player](v4, "player"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:self selector:"handlePlayerInvalidation:" name:kMRMediaRemoteNowPlayingPlayerDidUnregister object:0];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 nowPlayingServer]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 queryExistingPlayerPath:v4]);

  if (![v11 error])
  {

    goto LABEL_7;
  }

  uint64_t v12 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 178LL);

LABEL_15:
  return v12;
}

- (void)handleXPCClientInvalidation:(id)a3
{
  id v4 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 179LL);
  -[MRDApplicationConnection invalidate:](self, "invalidate:", v4);
}

- (void)handleRemoteExternalDeviceInvalidation:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_invalidationExternalDevice;
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = -[MRExternalDevice isConnected](v5, "isConnected");

  if ((p_lock & 1) == 0)
  {
    id v6 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 176LL);
    -[MRDApplicationConnection invalidate:](self, "invalidate:", v6);
  }

- (void)handleClientInvalidation:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
  id v13 = (id)objc_claimAutoreleasedReturnValue(v5);

  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_invalidationPlayerPath, "client"));
  unint64_t type = self->_type;
  os_unfair_lock_unlock(&self->_lock);
  id v8 = (NSError *)objc_claimAutoreleasedReturnValue([v13 origin]);
  if (!-[NSError isLocallyHosted](v8, "isLocallyHosted"))
  {
LABEL_7:

    goto LABEL_8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v13 client]);
  unsigned int v10 = [v9 isEqual:v6];

  if (v10)
  {
    id v11 = objc_alloc(&OBJC_CLASS___NSError);
    if (type == 1) {
      uint64_t v12 = 178LL;
    }
    else {
      uint64_t v12 = 179LL;
    }
    id v8 = -[NSError initWithMRError:](v11, "initWithMRError:", v12);
    -[MRDApplicationConnection invalidate:](self, "invalidate:", v8);
    goto LABEL_7;
  }

- (void)handlePlayerInvalidation:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = MRGetPlayerPathFromUserInfo(v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue(v5);

  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath client](self->_invalidationPlayerPath, "client"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRPlayerPath player](self->_invalidationPlayerPath, "player"));
  os_unfair_lock_unlock(&self->_lock);
  id v8 = (NSError *)objc_claimAutoreleasedReturnValue([v12 origin]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v12 client]);
  if (([v9 isEqual:v6] & 1) == 0)
  {

    goto LABEL_6;
  }

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v12 player]);
  unsigned int v11 = [v10 isEqual:v7];

  if (v11)
  {
    id v8 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 178LL);
    -[MRDApplicationConnection invalidate:](self, "invalidate:", v8);
LABEL_6:
  }
}

- (MRApplicationConnectionContext)context
{
  return self->_context;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)serverBoundMessageHandler
{
  return self->_serverBoundMessageHandler;
}

- (id)clientBoundMessageHandler
{
  return self->_clientBoundMessageHandler;
}

- (NSMutableArray)pendingMessages
{
  return self->_pendingMessages;
}

- (unint64_t)state
{
  return self->_state;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (MRDMediaRemoteClient)invalidationXPCClient
{
  return self->_invalidationXPCClient;
}

- (void)setInvalidationXPCClient:(id)a3
{
}

- (MRExternalDevice)invalidationExternalDevice
{
  return self->_invalidationExternalDevice;
}

- (void)setInvalidationExternalDevice:(id)a3
{
}

- (MRPlayerPath)invalidationPlayerPath
{
  return self->_invalidationPlayerPath;
}

- (void)setInvalidationPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
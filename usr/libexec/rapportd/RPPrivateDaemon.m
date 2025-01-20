@interface RPPrivateDaemon
+ (id)sharedPrivateDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPPrivateDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_processAnnouncementPtr:(const char *)a3 end:(const char *)a4;
- (void)_processAnswerPtr:(const char *)a3 end:(const char *)a4;
- (void)_processPacketPtr:(const char *)a3 end:(const char *)a4;
- (void)_processProbePtr:(const char *)a3 end:(const char *)a4;
- (void)_processQueryPtr:(const char *)a3 end:(const char *)a4;
- (void)_processResponsePtr:(const char *)a3 end:(const char *)a4;
- (void)_update;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)activate;
- (void)addAdvertiser:(id)a3 completion:(id)a4;
- (void)addDiscovery:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)removeAdvertiser:(id)a3 completion:(id)a4;
- (void)removeDiscovery:(id)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPPrivateDaemon

+ (id)sharedPrivateDaemon
{
  if (qword_100133608 != -1) {
    dispatch_once(&qword_100133608, &stru_1001147C8);
  }
  return (id)qword_100133600;
}

- (RPPrivateDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPPrivateDaemon;
  v2 = -[RPPrivateDaemon init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    objc_storeStrong(&gRPPrivateDaemon, v3);
    v4 = v3;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 >= 11) {
    uint64_t v4 = 50LL;
  }
  else {
    uint64_t v4 = 30LL;
  }
  id v34 = 0LL;
  NSAppendPrintF( &v34,  "-- RPPrivateDaemon: %d XPC --\n",  -[NSMutableSet count](self->_xpcConnections, "count"));
  id v5 = v34;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  obj = self->_xpcConnections;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if ([v10 direct])
        {
          id v29 = v5;
          NSAppendPrintF(&v29, "    direct");
          id v11 = v29;
        }

        else
        {
          id v28 = v5;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 xpcCnx]);
          NSAppendPrintF(&v28, "    %#{pid}", [v12 processIdentifier]);
          id v11 = v28;

          id v5 = v12;
        }

        uint64_t v13 = objc_claimAutoreleasedReturnValue([v10 activatedAdvertiser]);
        v14 = (void *)v13;
        if (v13)
        {
          id v27 = v11;
          uint64_t v15 = CUDescriptionWithLevel(v13, v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          NSAppendPrintF(&v27, ", %@", v16);
          id v17 = v27;

          id v11 = v17;
        }

        uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 activatedDiscovery]);
        v19 = (void *)v18;
        if (v18)
        {
          id v26 = v11;
          uint64_t v20 = CUDescriptionWithLevel(v18, v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          NSAppendPrintF(&v26, ", %@", v21);
          id v22 = v26;

          id v11 = v22;
        }

        id v25 = v11;
        NSAppendPrintF(&v25, "\n");
        id v5 = v25;
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
    }

    while (v7);
  }

  return v5;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091550;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091670;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _invalidate]", 30LL, "Invalidate\n");
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    -[RPPrivateDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)_update
{
  if (self->_prefPrivateDiscoveryEnabled) {
    -[RPPrivateDaemon _ensureStarted](self, "_ensureStarted");
  }
  else {
    -[RPPrivateDaemon _ensureStopped](self, "_ensureStopped");
  }
}

- (void)_processPacketPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 0)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processPacketPtr:end:]", 30LL, "No header\n");
    }
  }

  else
  {
    char v5 = *a3;
    uint64_t v4 = a3 + 1;
    int v6 = v5 & 0x1F;
    switch(v5 & 0x1F)
    {
      case 1:
        -[RPPrivateDaemon _processProbePtr:end:](self, "_processProbePtr:end:", v4);
        break;
      case 2:
        -[RPPrivateDaemon _processResponsePtr:end:](self, "_processResponsePtr:end:", v4);
        break;
      case 3:
        -[RPPrivateDaemon _processAnnouncementPtr:end:](self, "_processAnnouncementPtr:end:", v4);
        break;
      case 4:
        -[RPPrivateDaemon _processQueryPtr:end:](self, "_processQueryPtr:end:", v4);
        break;
      case 5:
        -[RPPrivateDaemon _processAnswerPtr:end:](self, "_processAnswerPtr:end:", v4);
        break;
      default:
        if (dword_100132A80 <= 30
          && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
        {
          LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon _processPacketPtr:end:]",  30LL,  "Unknown message type: %d\n",  v6);
        }

        break;
    }
  }

- (void)_processProbePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    uint64_t v8 = "No EPK1\n";
LABEL_15:
    LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processProbePtr:end:]", 30LL, v8);
    return;
  }

  int v6 = a3 + 36;
  if (a4 - (a3 + 36) <= 63)
  {
    uint64_t v8 = "No SIG1\n";
    goto LABEL_15;
  }

  if (dword_100132A80 <= 30)
  {
    unsigned int v7 = *((_DWORD *)a3 + 8);
    if (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)) {
      LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon _processProbePtr:end:]",  30LL,  "Probe: EPK1 <%H>, TS1 %u, SIG1 <%H>, Extra %td\n",  a3,  32LL,  8LL,  bswap32(v7),  v6,  64LL,  8LL,  a4 - (a3 + 100));
    }
  }

- (void)_processResponsePtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31)
  {
    unsigned int v7 = "No EPK2\n";
LABEL_14:
    LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processResponsePtr:end:]", 30LL, v7);
    return;
  }

  int v6 = a3 + 32;
  if (a4 - (a3 + 32) <= 95)
  {
    unsigned int v7 = "No ESIG2\n";
    goto LABEL_14;
  }

  if (dword_100132A80 <= 30 && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL))) {
    LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon _processResponsePtr:end:]",  30LL,  "Response: EPK2 <%H>, ESIG2 <%H>, Extra %td\n",  a3,  32LL,  8LL,  v6,  96LL,  8LL,  a4 - (a3 + 128));
  }
}

- (void)_processAnnouncementPtr:(const char *)a3 end:(const char *)a4
{
  if (a4 - a3 <= 31 || a4 - a3 - 32 <= 3)
  {
    uint64_t v8 = "No EPK1\n";
LABEL_15:
    LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processAnnouncementPtr:end:]", 30LL, v8);
    return;
  }

  int v6 = a3 + 36;
  if (a4 - (a3 + 36) <= 63)
  {
    uint64_t v8 = "No SIG1\n";
    goto LABEL_15;
  }

  if (dword_100132A80 <= 30)
  {
    unsigned int v7 = *((_DWORD *)a3 + 8);
    if (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)) {
      LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon _processAnnouncementPtr:end:]",  30LL,  "Announcement: EPK1 <%H>, TS1 %u, SIG1 <%H>, Extra %td\n",  a3,  32LL,  8LL,  bswap32(v7),  v6,  64LL,  8LL,  a4 - (a3 + 100));
    }
  }

- (void)_processQueryPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v4 = a4 - a3;
  if (a4 - a3 <= 31)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processQueryPtr:end:]", 30LL, "No EMSG1\n");
    }
  }

  else if (dword_100132A80 <= 30 {
         && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
  }
  {
    LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processQueryPtr:end:]", 30LL, "Query: EMSG1 <%H>\n", a3, v4, 16LL);
  }

- (void)_processAnswerPtr:(const char *)a3 end:(const char *)a4
{
  int64_t v4 = a4 - a3;
  if (a4 - a3 <= 31)
  {
    if (dword_100132A80 <= 30
      && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
    {
      LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processAnswerPtr:end:]", 30LL, "No EMSG2\n");
    }
  }

  else if (dword_100132A80 <= 30 {
         && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 30LL)))
  }
  {
    LogPrintF(&dword_100132A80, "-[RPPrivateDaemon _processAnswerPtr:end:]", 30LL, "Query: EMSG2 <%H>\n", a3, v4, 16LL);
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

- (void)addAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100091FFC;
  block[3] = &unk_1001147F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)removeAdvertiser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100092150;
  block[3] = &unk_1001147F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)addDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009234C;
  block[3] = &unk_1001147F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)removeDiscovery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000924A0;
  block[3] = &unk_1001147F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___RPPrivateXPCConnection);
  -[RPPrivateXPCConnection setDaemon:](v6, "setDaemon:", self);
  -[RPPrivateXPCConnection setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
  -[RPPrivateXPCConnection setXpcCnx:](v6, "setXpcCnx:", v5);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }

  -[NSMutableSet addObject:](xpcConnections, "addObject:", v6);
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPPrivateDiscoveryXPCDaemonInterface));
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000927A4;
  v13[3] = &unk_100111968;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPPrivateDiscoveryXPCClientInterface));
  [v5 setRemoteObjectInterface:v11];

  [v5 resume];
  if (dword_100132A80 <= 20 && (dword_100132A80 != -1 || _LogCategory_Initialize(&dword_100132A80, 20LL))) {
    LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon listener:shouldAcceptNewConnection:]",  20,  "XPC connection started: %#{pid}\n",  [v5 processIdentifier]);
  }

  return 1;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (dword_100132A80 <= 20)
  {
    if (dword_100132A80 != -1 || (int v6 = _LogCategory_Initialize(&dword_100132A80, 20LL), v4 = v7, v6))
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 xpcCnx]);
      LogPrintF( &dword_100132A80,  "-[RPPrivateDaemon _xpcConnectionInvalidated:]",  20,  "XPC connection ended: %#{pid}\n",  [v5 processIdentifier]);

      id v4 = v7;
    }
  }

  [v4 xpcConnectionInvalidated];
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v7);
  -[RPPrivateDaemon _update](self, "_update");
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
@interface RPNearFieldDaemon
+ (id)sharedNearFieldDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)hasCurrentTransaction;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldDaemon)init;
- (RPNearFieldDaemonController)nearFieldController;
- (id)_exportedInterface;
- (id)_remoteObjectInterface;
- (id)transactionChangedHandler;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)_updateNearFieldDiscoveryPref;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setNearFieldController:(id)a3;
- (void)setTransactionChangedHandler:(id)a3;
@end

@implementation RPNearFieldDaemon

+ (id)sharedNearFieldDaemon
{
  if (qword_100133348 != -1) {
    dispatch_once(&qword_100133348, &stru_100112C80);
  }
  return (id)qword_100133340;
}

- (RPNearFieldDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RPNearFieldDaemon;
  v2 = -[RPNearFieldDaemon init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[RPNearFieldDaemon _updateNearFieldDiscoveryPref](v2, "_updateNearFieldDiscoveryPref");
  }
  return v3;
}

- (BOOL)hasCurrentTransaction
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
  unsigned __int8 v4 = [v3 hasCurrentTransaction];

  return v4;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004CF84;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if ((sub_10004D858() & 1) != 0)
  {
    if (!self->_xpcListener)
    {
      v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.rapport.nearfield.service");
      xpcListener = self->_xpcListener;
      self->_xpcListener = v3;

      -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
      -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
      -[NSXPCListener resume](self->_xpcListener, "resume");
    }

    self->_invalidateCalled = 0;
    if (dword_100131AC0 <= 30
      && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 30LL)))
    {
      objc_super v5 = "Activated\n";
      uint64_t v6 = 30LL;
LABEL_14:
      LogPrintF(&dword_100131AC0, "-[RPNearFieldDaemon _activate]", v6, v5);
    }
  }

  else if (dword_100131AC0 <= 90 {
         && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 90LL)))
  }
  {
    objc_super v5 = "Failed to activate: not supported on this platform.\n";
    uint64_t v6 = 90LL;
    goto LABEL_14;
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004D1B0;
  block[3] = &unk_1001110A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_100131AC0 <= 30
      && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 30LL)))
    {
      LogPrintF(&dword_100131AC0, "-[RPNearFieldDaemon _invalidate]", 30LL, "Invalidating\n");
    }

    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0LL;

    -[RPNearFieldDaemonController invalidate](self->_nearFieldController, "invalidate");
    nearFieldController = self->_nearFieldController;
    self->_nearFieldController = 0LL;

    -[RPNearFieldDaemon _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_nearFieldController && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    self->_activateCalled = 0;
    if (dword_100131AC0 <= 30
      && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 30LL)))
    {
      LogPrintF(&dword_100131AC0, "-[RPNearFieldDaemon _invalidated]", 30LL, "Invalidated\n");
    }
  }

- (void)_updateNearFieldDiscoveryPref
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.rapport", @"nearFieldSeverDiscoveryEnabled", &v7);
  if (v7) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  self->_prefEnableDiscovery = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
  [v6 setEnabled:v5];
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

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cuValueForEntitlementNoCache:@"com.apple.rapport.nearfield"]);
  unsigned int v7 = [v6 isEqual:&__kCFBooleanFalse];

  if (v7)
  {
    if (dword_100131AC0 <= 90
      && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 90LL)))
    {
      LogPrintF( &dword_100131AC0,  "-[RPNearFieldDaemon listener:shouldAcceptNewConnection:]",  90,  "### %#{pid} missing entitlement '%@'\n",  [v5 processIdentifier],  @"com.apple.rapport.nearfield");
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
      [v9 invalidate];
    }

    v10 = -[RPNearFieldDaemonController initWithConnection:dispatchQueue:]( objc_alloc(&OBJC_CLASS___RPNearFieldDaemonController),  "initWithConnection:dispatchQueue:",  v5,  self->_dispatchQueue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004D610;
    v15[3] = &unk_1001110A8;
    v15[4] = self;
    -[RPNearFieldDaemonController setTransactionChangedHandler:](v10, "setTransactionChangedHandler:", v15);
    -[RPNearFieldDaemonController setEnabled:](v10, "setEnabled:", self->_prefEnableDiscovery);
    -[RPNearFieldDaemon setNearFieldController:](self, "setNearFieldController:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon _exportedInterface](self, "_exportedInterface"));
    [v5 setExportedInterface:v11];

    [v5 setExportedObject:v10];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10004D678;
    v14[3] = &unk_1001110A8;
    v14[4] = self;
    [v5 setInvalidationHandler:v14];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon _remoteObjectInterface](self, "_remoteObjectInterface"));
    [v5 setRemoteObjectInterface:v12];

    [v5 _setQueue:self->_dispatchQueue];
    [v5 resume];
    if (dword_100131AC0 <= 30
      && (dword_100131AC0 != -1 || _LogCategory_Initialize(&dword_100131AC0, 30LL)))
    {
      LogPrintF( &dword_100131AC0,  "-[RPNearFieldDaemon listener:shouldAcceptNewConnection:]",  30,  "XPC connection started from %#{pid}\n",  [v5 processIdentifier]);
    }
  }

  return v7 ^ 1;
}

- (id)_remoteObjectInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPNearFieldXPCClientInterface));
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(RPNFCTransaction, v3, v4),  "didBeginTransaction:",  0,  0);
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(RPNFCTransaction, v5, v6),  "didUpdateTransaction:",  0,  0);
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(RPNFCTransaction, v7, v8),  "didInterruptTransaction:withError:",  0,  0);
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(NSError, v9, v10),  "didInterruptTransaction:withError:",  1,  0);
  return v2;
}

- (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RPNearFieldXPCDaemonInterface));
  objc_msgSend( v2,  "setClass:forSelector:argumentIndex:ofReply:",  objc_opt_class(RPNearFieldContext, v3, v4),  "startPolling:context:",  1,  0);
  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
}

- (RPNearFieldDaemonController)nearFieldController
{
  return self->_nearFieldController;
}

- (void)setNearFieldController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
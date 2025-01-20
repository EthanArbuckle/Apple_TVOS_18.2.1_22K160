@interface AAAudioSessionControl
+ (BOOL)supportsSecureCoding;
- (AAAudioSessionControl)init;
- (AAAudioSessionControl)initWithCoder:(id)a3;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)conversationDetectSignal;
- (unsigned)clientID;
- (void)_activate:(BOOL)a3;
- (void)_activateDirect:(id)a3;
- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectSignal:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AAAudioSessionControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioSessionControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[AAAudioSessionControl init](self, "init");
  if (v5)
  {
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  id v7 = v4;
  if ((_DWORD)clientID)
  {
    [v4 encodeInt64:clientID forKey:@"cid"];
    id v4 = v7;
  }

  uint64_t conversationDetectSignal = self->_conversationDetectSignal;
  if ((_DWORD)conversationDetectSignal)
  {
    [v7 encodeInteger:conversationDetectSignal forKey:@"cds"];
    id v4 = v7;
  }
}

- (id)description
{
  id v10 = 0LL;
  uint64_t conversationDetectSignal = self->_conversationDetectSignal;
  else {
    id v4 = (&off_1002060A0)[conversationDetectSignal];
  }
  NSAppendPrintF(&v10, "AAAudioSessionControl, CID 0x%X, cds %s", self->_clientID, v4);
  id v5 = v10;
  v6 = v5;
  if (self->_direct)
  {
    id v9 = v5;
    NSAppendPrintF_safe(&v9, ", direct");
    id v7 = v9;

    v6 = v7;
  }

  return v6;
}

- (AAAudioSessionControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AAAudioSessionControl;
  v2 = -[AAAudioSessionControl init](&v5, "init");
  if (v2)
  {
    v2->_uint64_t clientID = sub_10000441C();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3 = v2;
  }

  return v2;
}

- (void)setConversationDetectSignal:(int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v4->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100002FD0;
    v6[3] = &unk_100205F18;
    v6[4] = v4;
    int v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }

  else
  {
    v4->_uint64_t conversationDetectSignal = a3;
  }

  objc_sync_exit(v4);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4
{
  __int128 v4 = *(_OWORD *)&a4->var0[4];
  v5[0] = *(_OWORD *)a4->var0;
  v5[1] = v4;
  -[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:]( self,  "setMuteAction:auditToken:bundleIdentifier:",  *(void *)&a3,  v5,  0LL);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  if (dword_100233F90 <= 30 && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 30LL)))
  {
    else {
      id v9 = (&off_100206100)[a3];
    }
    LogPrintF( &dword_100233F90,  "-[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:]",  30LL,  "Mute Control: setMuteAction: %s",  v9);
  }

  id v10 = self;
  objc_sync_enter(v10);
  if (v10->_activateCalled)
  {
    dispatchQueue = (dispatch_queue_s *)v10->_dispatchQueue;
    block[1] = 3221225472LL;
    __int128 v12 = *(_OWORD *)&a4->var0[4];
    __int128 v16 = *(_OWORD *)a4->var0;
    block[0] = _NSConcreteStackBlock;
    block[2] = sub_100003210;
    block[3] = &unk_100205F40;
    block[4] = v10;
    int v15 = a3;
    __int128 v17 = v12;
    id v14 = v8;
    dispatch_async(dispatchQueue, block);
  }

  else if (dword_100233F90 <= 90 {
         && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 90LL)))
  }
  {
    LogPrintF( &dword_100233F90,  "-[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:]",  90LL,  "### setMuteAction failed: AAudioSessionControl not activated");
  }

  objc_sync_exit(v10);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003398;
  v7[3] = &unk_100205F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_activate:(BOOL)a3
{
  BOOL v3 = a3;
  else {
    BOOL v5 = qword_10023DCB0 == 0;
  }
  BOOL v6 = !v5;
  self->_direct = v6;
  if (self->_invalidateCalled)
  {
    uint64_t v7 = NSErrorF(NSOSStatusErrorDomain, 4294896148LL, "Activate after invalidate");
    id v11 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (dword_100233F90 <= 90
      && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 90LL)))
    {
      LogPrintF(&dword_100233F90, "-[AAAudioSessionControl _activate:]", 90LL, "### Activate failed: %@, %@", self, v11);
    }

    id v9 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0LL;

    if (v9) {
      v9[2](v9, v11);
    }
  }

  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100003674;
    v12[3] = &unk_100205F90;
    v12[4] = self;
    BOOL v13 = v3;
    id v8 = objc_retainBlock(v12);
    if (self->_direct) {
      -[AAAudioSessionControl _activateDirect:](self, "_activateDirect:", v8);
    }
    else {
      -[AAAudioSessionControl _activateXPC:reactivate:](self, "_activateXPC:reactivate:", v8, v3);
    }
  }

- (void)_activateDirect:(id)a3
{
  id v4 = a3;
  if (dword_100233F90 <= 30 && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 30LL))) {
    LogPrintF( &dword_100233F90,  "-[AAAudioSessionControl _activateDirect:]",  30LL,  "Activate direct, CID 0x%X",  self->_clientID);
  }
  BOOL v5 = (void *)qword_10023DCB0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000038C8;
  v7[3] = &unk_100205FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 activateAudioSessionControl:self completion:v7];
}

- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (dword_100233F90 > 30) {
      goto LABEL_15;
    }
  }

  else
  {
    if (dword_100233F90 > 30) {
      goto LABEL_15;
    }
  }

  if (dword_100233F90 <= 30 && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 30LL))) {
    LogPrintF( &dword_100233F90,  "-[AAAudioSessionControl _activateXPC:reactivate:]",  30LL,  "Activate XPC, CID 0x%X",  self->_clientID);
  }
LABEL_15:
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AAAudioSessionControl _ensureXPCStarted](self, "_ensureXPCStarted"));
  if (v7)
  {
    v6[2](v6, v7);
  }

  else
  {
    xpcCnx = self->_xpcCnx;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100003B60;
    v13[3] = &unk_100206008;
    BOOL v15 = v4;
    id v9 = v6;
    id v14 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( xpcCnx,  "remoteObjectProxyWithErrorHandler:",  v13));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100003C54;
    v11[3] = &unk_100206030;
    __int128 v12 = v9;
    [v10 audioSessionControlActivate:self completion:v11];
  }
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    BOOL v3 = self->_testListenerEndpoint;
    BOOL v4 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
    if (v3) {
      BOOL v5 = -[NSXPCConnection initWithListenerEndpoint:](v4, "initWithListenerEndpoint:", v3);
    }
    else {
      BOOL v5 = -[NSXPCConnection initWithMachServiceName:options:]( v4,  "initWithMachServiceName:options:",  @"com.apple.AudioAccessoryServices",  0LL);
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AAServicesXPCClientInterface));
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100003DC4;
    v11[3] = &unk_100206058;
    void v11[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100003DCC;
    v10[3] = &unk_100206058;
    v10[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v10);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AAServicesXPCDaemonInterface));
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }

  return 0LL;
}

- (void)_interrupted
{
  uint64_t v3 = BTErrorF(4294960596LL, "XPC interrupted");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[AAAudioSessionControl _reportError:](self, "_reportError:", v4);

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (self->_activateCalled) {
    -[AAAudioSessionControl _activate:](self, "_activate:", 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003F28;
  block[3] = &unk_100206058;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateDirect
{
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && dword_100233F90 <= 50
      && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 50LL)))
    {
      LogPrintF( &dword_100233F90,  "-[AAAudioSessionControl _invalidated]",  50LL,  "### XPC connection unexpectedly invalidated");
    }

    if (!self->_direct && !self->_xpcCnx)
    {
      id v9 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0LL;

      if (v9)
      {
        uint64_t v4 = BTErrorF(4294896148LL, "Unexpectedly invalidated");
        BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        v9[2](v9, v5);
      }

      id v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0LL;

      if (v6) {
        v6[2](v6);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0LL;

      self->_invalidateDone = 1;
      if (dword_100233F90 <= 10
        && (dword_100233F90 != -1 || _LogCategory_Initialize(&dword_100233F90, 10LL)))
      {
        LogPrintF(&dword_100233F90, "-[AAAudioSessionControl _invalidated]", 10LL, "Invalidated");
      }
    }
  }

- (void)_reportError:(id)a3
{
  id v6 = a3;
  uint64_t v4 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0LL;

  if (v4) {
    v4[2](v4, v6);
  }
}

- (int)conversationDetectSignal
{
  return self->_conversationDetectSignal;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
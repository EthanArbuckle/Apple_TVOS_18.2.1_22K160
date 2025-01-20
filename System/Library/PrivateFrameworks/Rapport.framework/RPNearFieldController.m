@interface RPNearFieldController
- (NSString)currentApplicationLabel;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldContext)currentContext;
- (RPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4;
- (RPNearFieldControllerDelegate)delegate;
- (RPNearFieldTransaction)currentTransaction;
- (id)_exportedInterface;
- (id)_remoteObjectInterface;
- (id)_remoteObjectProxy;
- (id)_synchronousRemoteObjectProxy;
- (int64_t)currentPreferredPollingType;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_startPolling;
- (void)didBeginTransaction:(id)a3;
- (void)didDetectDeviceNearbyWithInitiatorRole:(BOOL)a3;
- (void)didInterruptTransaction:(id)a3 withError:(id)a4;
- (void)didUpdateTransaction:(id)a3;
- (void)invalidate;
- (void)invalidateTransaction:(id)a3;
- (void)invalidateTransaction:(id)a3 context:(id)a4;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentPreferredPollingType:(int64_t)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)startPolling:(int64_t)a3 context:(id)a4;
- (void)startPolling:(int64_t)a3 forApplicationLabel:(id)a4;
- (void)stop;
@end

@implementation RPNearFieldController

- (RPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RPNearFieldController;
  v9 = -[RPNearFieldController init](&v11, sel_init);
  if (v9)
  {
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

- (NSString)currentApplicationLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 applicationLabel];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcConnection)
  {
    v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.rapport.nearfield.service" options:0];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;
    v5 = -[RPNearFieldController _exportedInterface](self, "_exportedInterface");
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    v6 = -[RPNearFieldController _remoteObjectInterface](self, "_remoteObjectInterface");
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_dispatchQueue);
    uint64_t v7 = MEMORY[0x1895F87A8];
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v9);
    v8[0] = v7;
    v8[1] = 3221225472LL;
    v8[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_18A031A30;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v8);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (id)_exportedInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setClass:objc_opt_class() forSelector:sel_didBeginTransaction_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didUpdateTransaction_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didInterruptTransaction_withError_ argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:sel_didInterruptTransaction_withError_ argumentIndex:1 ofReply:0];
  return v2;
}

- (id)_remoteObjectInterface
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setClass:objc_opt_class() forSelector:sel_startPolling_context_ argumentIndex:1 ofReply:0];
  return v2;
}

- (void)_interrupted
{
  v9[1] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = -[RPNearFieldController currentTransaction](self, "currentTransaction");
  if (v3)
  {
    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
    v4 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *MEMORY[0x1896075E0];
    v9[0] = @"XPC connection was interrupted.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 errorWithDomain:@"RPNearFieldControllerErrorDomain" code:0 userInfo:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPNearFieldController delegate](self, "delegate");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 nearFieldController:self didInterruptTransaction:v3 error:v6];
  }

  if (self->_didStart) {
    -[RPNearFieldController _startPolling](self, "_startPolling");
  }
}

- (void)invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[RPNearFieldController stop](self, "stop");
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    -[RPNearFieldController _invalidated](self, "_invalidated");
  }

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0LL;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (id)_remoteObjectProxy
{
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __43__RPNearFieldController__remoteObjectProxy__block_invoke;
  v4[3] = &unk_18A031AC0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__RPNearFieldController__remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 nearFieldController:*(void *)(a1 + 32) didInvalidateWithError:v5];
}

- (id)_synchronousRemoteObjectProxy
{
  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke;
  v4[3] = &unk_18A031AC0;
  v4[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    id v4 = v5;
    LogPrintF();
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 nearFieldController:*(void *)(a1 + 32) didInvalidateWithError:v5];
}

- (void)startPolling:(int64_t)a3 forApplicationLabel:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  id v8 = -[RPNearFieldContext initWitApplicationLabel:]( objc_alloc(&OBJC_CLASS___RPNearFieldContext),  "initWitApplicationLabel:",  v7);

  -[RPNearFieldController startPolling:context:](self, "startPolling:context:", a3, v8);
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  id v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType") != a3)
  {
LABEL_8:
    self->_didStart = 1;
    *(_WORD *)&self->_invalidateCalled = 0;
    -[RPNearFieldController setCurrentContext:](self, "setCurrentContext:", v10);
    -[RPNearFieldController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", a3);
    -[RPNearFieldController _ensureXPCStarted](self, "_ensureXPCStarted");
    -[RPNearFieldController _startPolling](self, "_startPolling");
    goto LABEL_9;
  }

  -[RPNearFieldController currentContext](self, "currentContext");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v10;
  id v8 = v7;
  if (v6 != v7)
  {
    if ((v7 != 0LL) != (v6 == 0LL))
    {
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    goto LABEL_8;
  }

LABEL_9:
}

- (void)_startPolling
{
  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentApplicationLabel](self, "currentApplicationLabel");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = -[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType");
    LogPrintF();
  }

  -[RPNearFieldController _synchronousRemoteObjectProxy](self, "_synchronousRemoteObjectProxy", v5, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v3 = -[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType");
  -[RPNearFieldController currentContext](self, "currentContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 startPolling:v3 context:v4];
}

- (void)stop
{
  if (self->_didStart)
  {
    self->_didStart = 0;
    -[RPNearFieldController _remoteObjectProxy](self, "_remoteObjectProxy");
    int64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 stop];

    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
    -[RPNearFieldController setCurrentContext:](self, "setCurrentContext:", 0LL);
    -[RPNearFieldController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", 0LL);
  }

- (void)invalidateTransaction:(id)a3
{
  id v4 = a3;
  -[RPNearFieldController currentContext](self, "currentContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController invalidateTransaction:context:](self, "invalidateTransaction:context:", v4, v5);
}

- (void)invalidateTransaction:(id)a3 context:(id)a4
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPNearFieldController _remoteObjectProxy](self, "_remoteObjectProxy");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v8 identifier];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 invalidateTransactionWithIdentifier:v9 context:v7];
}

- (void)didDetectDeviceNearbyWithInitiatorRole:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPNearFieldController delegate](self, "delegate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 nearFieldController:self didDetectDeviceNearbyWithInitiatorRole:v3];
}

- (void)didBeginTransaction:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", v5);
  -[RPNearFieldController delegate](self, "delegate");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 nearFieldController:self didBeginTransaction:v5];
}

- (void)didUpdateTransaction:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v13 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController currentTransaction](self, "currentTransaction");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) != 0)
  {
    -[RPNearFieldController delegate](self, "delegate");
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 state] == 1)
    {
      -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
      [v13 error];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 nearFieldController:self didInterruptTransaction:v13 error:v10];
LABEL_11:

      goto LABEL_12;
    }

    if ([v13 state] == 2)
    {
      [v13 tapEvent];
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 handleFailureInMethod:a2, self, @"RPNearFieldController.m", 266, @"tapEvent is nil for transaction:%@", v13 object file lineNumber description];
      }

      [v13 tapEvent];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 nearFieldController:self transaction:v13 didReceiveTapEvent:v10];
      goto LABEL_11;
    }

- (void)didInterruptTransaction:(id)a3 withError:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v12 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController currentTransaction](self, "currentTransaction");
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 identifier];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) != 0)
  {
    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0LL);
    -[RPNearFieldController delegate](self, "delegate");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 nearFieldController:self didInterruptTransaction:v12 error:v6];
LABEL_6:

    goto LABEL_7;
  }

  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentTransaction](self, "currentTransaction");
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_6;
  }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNearFieldControllerDelegate)delegate
{
  return (RPNearFieldControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  self->_currentPreferredPollingType = a3;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (RPNearFieldTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
}

@end
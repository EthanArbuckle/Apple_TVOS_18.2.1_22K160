@interface RPSiriAudioSession
+ (BOOL)supportsSecureCoding;
- (NSString)label;
- (NSString)sessionID;
- (OS_dispatch_queue)dispatchQueue;
- (RPSiriAudioSession)init;
- (RPSiriAudioSession)initWithCoder:(id)a3;
- (RPSiriAudioSessionDelegate)delegate;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)receivedSiriAudioEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSessionID:(id)a3;
- (void)xpcSiriStopClientRecordingWithDeviceId:(id)a3;
@end

@implementation RPSiriAudioSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPSiriAudioSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPSiriAudioSession;
  v2 = -[RPSiriAudioSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    v4 = v3;
  }

  return v3;
}

- (RPSiriAudioSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___RPSiriAudioSession;
  v5 = -[RPSiriAudioSession init](&v10, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RPSiriAudioSession;
  -[RPSiriAudioSession dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  sessionID = self->_sessionID;
  if (sessionID) {
    [a3 encodeObject:sessionID forKey:@"sid"];
  }
}

- (id)description
{
  return 0LL;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __45__RPSiriAudioSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_18A031B60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__RPSiriAudioSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  v2 = *(void **)(a1 + 32);
  if (!v2[8])
  {
    id v3 = NSRandomData();
    [v3 bytes];
    [v3 length];
    [v3 length];
    uint64_t v4 = NSPrintF();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    v2 = *(void **)(a1 + 32);
  }

  return [v2 _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }

  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

  -[RPSiriAudioSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke;
  v16[3] = &unk_18A032340;
  BOOL v18 = v4;
  v16[4] = self;
  id v10 = v6;
  id v17 = v10;
  v11 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2;
  v13[3] = &unk_18A032340;
  BOOL v15 = v4;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 xpcSiriAudioSessionActivate:self completion:v13];
}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16LL);
  id v8 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), id v3 = v8, v5))
      {
LABEL_7:
        LogPrintF();
        id v3 = v8;
      }
    }
  }

  else if (v4 <= 90)
  {
    if (v4 != -1) {
      goto LABEL_7;
    }
    int v6 = _LogCategory_Initialize();
    id v3 = v8;
    if (v6) {
      goto LABEL_7;
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    id v3 = v8;
  }
}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16LL);
  id v7 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
LABEL_15:
      }
        LogPrintF();
    }

    else if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }

  else if (*(_BYTE *)(a1 + 48))
  {
  }

  else if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }

  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    int v6 = v7;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.rapport.siri-audio" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E0E58];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke;
    v10[3] = &unk_18A031A30;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472LL;
    v9[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5E00];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    int var0 = self->_ucat->var0;
  }

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  int var0 = self->_ucat->var0;
  if (self->_activateCalled) {
    -[RPSiriAudioSession _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0LL, 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__RPSiriAudioSession_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPSiriAudioSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }

    [*(id *)(v3 + 24) invalidate];
    return [*(id *)(v2 + 32) _invalidated];
  }

  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    delegate = self->_delegate;
    self->_delegate = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)receivedSiriAudioEvent:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke;
  v7[3] = &unk_18A031AE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (v3)
  {
    [v3 remoteObjectProxy];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 xpcSiriAudioReceived:*(void *)(a1 + 40)];
  }

  else
  {
    int v4 = **(_DWORD **)(v2 + 16);
  }

- (void)xpcSiriStopClientRecordingWithDeviceId:(id)a3
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    int var0 = self->_ucat->var0;
    id v5 = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) != 0) {
      -[RPSiriAudioSessionDelegate siriAudioSessionDidReceiveStopRecordingWithDeviceId:]( v5,  "siriAudioSessionDidReceiveStopRecordingWithDeviceId:",  v6);
    }
  }
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

- (NSString)label
{
  return self->_label;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (RPSiriAudioSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
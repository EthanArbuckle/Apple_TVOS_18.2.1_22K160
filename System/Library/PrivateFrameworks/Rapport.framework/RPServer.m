@interface RPServer
+ (BOOL)supportsSecureCoding;
- (BOOL)advertiseDeviceName;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSString)label;
- (NSString)password;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPServer)init;
- (RPServer)initWithCoder:(id)a3;
- (id)acceptHandler;
- (id)authCompletionHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)errorHandler;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)promptForPasswordHandler;
- (id)showPasswordHandler;
- (int)passwordType;
- (int)passwordTypeActual;
- (unint64_t)controlFlags;
- (unsigned)internalAuthFlags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_activateWithReactivate:(BOOL)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setAcceptHandler:(id)a3;
- (void)setAdvertiseDeviceName:(BOOL)a3;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)xpcServerAcceptSession:(id)a3 completion:(id)a4;
- (void)xpcServerHidePassword:(unsigned int)a3;
- (void)xpcServerShowPassword:(id)a3 flags:(unsigned int)a4;
@end

@implementation RPServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPServer;
  v2 = -[RPServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPServer;
    v4 = v3;
  }

  return v3;
}

- (RPServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RPServer;
  v5 = -[RPServer init](&v15, sel_init);
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPServer;
    id v7 = v4;

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v8 = v7;

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v11 = label;
      -[NSString UTF8String](v11, "UTF8String");
      LogCategoryReplaceF();
    }

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    if ((NSDecodeSInt64RangedIfPresent() & 1) != 0) {
      v6->_passwordType = v16;
    }
    id v12 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  allowedMACAddresses = self->_allowedMACAddresses;
  id v12 = v4;
  if (allowedMACAddresses)
  {
    [v4 encodeObject:allowedMACAddresses forKey:@"MAcAddrs"];
    id v4 = v12;
  }

  if (self->_advertiseDeviceName)
  {
    [v12 encodeBool:1 forKey:@"devName"];
    id v4 = v12;
  }

  unint64_t controlFlags = self->_controlFlags;
  if (controlFlags)
  {
    [v12 encodeInt64:controlFlags forKey:@"cFl"];
    id v4 = v12;
  }

  uint64_t internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    [v12 encodeInt64:internalAuthFlags forKey:@"iaf"];
    id v4 = v12;
  }

  label = self->_label;
  if (label)
  {
    [v12 encodeObject:label forKey:@"label"];
    id v4 = v12;
  }

  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    [v12 encodeObject:pairSetupACL forKey:@"acl"];
    id v4 = v12;
  }

  uint64_t passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    [v12 encodeInteger:passwordType forKey:@"pwTy"];
    id v4 = v12;
  }

  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v12 encodeObject:serviceType forKey:@"st"];
    id v4 = v12;
  }
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
  v4.super_class = (Class)&OBJC_CLASS___RPServer;
  -[RPServer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPServer descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  serviceType = self->_serviceType;
  NSAppendPrintF();
  id v4 = 0LL;
  v5 = v4;
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
  {
    v17 = v4;
    id v7 = allowedMACAddresses;
    -[NSArray count](v7, "count", serviceType);
    NSAppendPrintF();
    id v8 = v17;

    v5 = v8;
  }

  if (self->_advertiseDeviceName)
  {
    NSAppendPrintF();
    id v9 = v5;

    v5 = v9;
  }

  if (self->_controlFlags)
  {
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }

  if (self->_passwordType)
  {
    NSAppendPrintF();
    id v11 = v5;

    v5 = v11;
  }

  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    uint64_t v16 = pairSetupACL;
    NSAppendPrintF();
    id v13 = v5;

    v5 = v13;
  }

  return v5;
}

- (void)setControlFlags:(unint64_t)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __28__RPServer_setControlFlags___block_invoke;
  v3[3] = &unk_18A033DD8;
  v3[4] = self;
  v3[5] = a3;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __28__RPServer_setControlFlags___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 128);
  if (v1 != v3) {
    *(void *)(v2 + 128) = v1;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setPassword:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __24__RPServer_setPassword___block_invoke;
  v6[3] = &unk_18A033B68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __24__RPServer_setPassword___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 72LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {

LABEL_8:
    return v5;
  }

  objc_super v6 = v4;
  if ((v3 == 0LL) == (v4 != 0LL))
  {

    goto LABEL_7;
  }

  char v7 = [v3 isEqual:v4];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = v8;
    id v3 = *(id *)(v9 + 72);
    *(void *)(v9 + 72) = v10;
    goto LABEL_8;
  }

  return 0LL;
}

- (void)setServiceType:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __27__RPServer_setServiceType___block_invoke;
  v6[3] = &unk_18A033B68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);
}

BOOL __27__RPServer_setServiceType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 176LL);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {

LABEL_8:
    return v5;
  }

  objc_super v6 = v4;
  if ((v3 == 0LL) == (v4 != 0LL))
  {

    goto LABEL_7;
  }

  char v7 = [v3 isEqual:v4];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = v8;
    id v3 = *(id *)(v9 + 176);
    *(void *)(v9 + 176) = v10;
    goto LABEL_8;
  }

  return 0LL;
}

- (void)setPasswordType:(int)a3
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __28__RPServer_setPasswordType___block_invoke;
  v3[3] = &unk_18A0330F0;
  int v4 = a3;
  v3[4] = self;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __28__RPServer_setPasswordType___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 44);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 44) = v1;
  }
  return v1 != v3;
}

- (void)activate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL activateCalled = v2->_activateCalled;
  v2->_BOOL activateCalled = 1;
  dispatchQueue = (dispatch_queue_s *)v2->_dispatchQueue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __20__RPServer_activate__block_invoke;
  v5[3] = &unk_18A033E00;
  v5[4] = v2;
  BOOL v6 = activateCalled;
  dispatch_async(dispatchQueue, v5);
  objc_sync_exit(v2);
}

int *__20__RPServer_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 10))
  {
    result = *(int **)(v2 + 16);
    if (*result > 115) {
      return result;
    }
    if (*result == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!(_DWORD)result) {
        return result;
      }
    }

    return (int *)LogPrintF();
  }

  if (*(_BYTE *)(a1 + 40))
  {
    result = *(int **)(v2 + 16);
    if (*result > 30) {
      return result;
    }
    if (*result == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!(_DWORD)result) {
        return result;
      }
    }

    return (int *)LogPrintF();
  }

  if (*(void *)(v2 + 80))
  {
    *(_DWORD *)(v2 + 52) |= 8u;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(void *)(v2 + 88))
  {
    *(_DWORD *)(v2 + 52) |= 1u;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(void *)(v2 + 96))
  {
    *(_DWORD *)(v2 + 52) |= 2u;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if (*(void *)(v2 + 104))
  {
    *(_DWORD *)(v2 + 52) |= 4u;
    uint64_t v2 = *(void *)(a1 + 32);
  }

  return (int *)[(id)v2 _activateWithReactivate:0];
}

- (void)_activateWithReactivate:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
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

  -[RPServer _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __36__RPServer__activateWithReactivate___block_invoke;
  v11[3] = &unk_18A033B90;
  BOOL v12 = a3;
  v11[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v11);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472LL;
  v9[2] = __36__RPServer__activateWithReactivate___block_invoke_2;
  v9[3] = &unk_18A033B90;
  BOOL v10 = a3;
  v9[4] = self;
  [v8 xpcServerActivate:self completion:v9];
}

void __36__RPServer__activateWithReactivate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 16LL);
  if (*(_BYTE *)(a1 + 40))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }

  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

  uint64_t v4 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 144LL));
  BOOL v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void __36__RPServer__activateWithReactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16LL);
  id v7 = v3;
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
    }

    else if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }

    LogPrintF();
    goto LABEL_24;
  }

  if (*(_BYTE *)(a1 + 40))
  {
  }

  else if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_21;
  }

  LogPrintF();
LABEL_21:
  uint64_t v5 = MEMORY[0x1895A4770](*(void *)(*(void *)(a1 + 32) + 144LL));
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

LABEL_24:
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.CompanionLink" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6D7EE8];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    uint64_t v6 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __29__RPServer__ensureXPCStarted__block_invoke;
    v10[3] = &unk_18A031A30;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472LL;
    v9[2] = __29__RPServer__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_18A031A30;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E5C20];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    int var0 = self->_ucat->var0;
  }

uint64_t __29__RPServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __29__RPServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
    -[RPServer _activateWithReactivate:](self, "_activateWithReactivate:", 1LL);
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__RPServer_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__RPServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 10))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 10) = 1;
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
    id acceptHandler = self->_acceptHandler;
    self->_id acceptHandler = 0LL;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0LL;

    id v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id showPasswordHandler = self->_showPasswordHandler;
    self->_id showPasswordHandler = 0LL;

    id hidePasswordHandler = self->_hidePasswordHandler;
    self->_id hidePasswordHandler = 0LL;

    id promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_id promptForPasswordHandler = 0LL;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
  }

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = (dispatch_queue_s *)v5->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__RPServer__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_18A031A30;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }

  objc_sync_exit(v5);
}

uint64_t __37__RPServer__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL changesPending = v2->_changesPending;
    v2->_BOOL changesPending = 0;
    objc_sync_exit(v2);

    int var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        int v5 = v2;
        LogPrintF();
      }

      -[NSXPCConnection remoteObjectProxy](v2->_xpcCnx, "remoteObjectProxy", v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [v6 xpcServerUpdate:v2];
    }

    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (void)xpcServerAcceptSession:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  uint64_t v8 = MEMORY[0x1895A4770](self->_acceptHandler);
  uint64_t v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v6);
  }
}

- (void)xpcServerShowPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  uint64_t v7 = MEMORY[0x1895A4770](self->_showPasswordHandler);
  uint64_t v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v4, v9);
  }
}

- (void)xpcServerHidePassword:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  id v6 = (void (**)(void, void))MEMORY[0x1895A4770](self->_hidePasswordHandler);
  if (v6)
  {
    id v7 = v6;
    v6[2](v6, v3);
    id v6 = (void (**)(void, void))v7;
  }
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
}

- (BOOL)advertiseDeviceName
{
  return self->_advertiseDeviceName;
}

- (void)setAdvertiseDeviceName:(BOOL)a3
{
  self->_advertiseDeviceName = a3;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
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

- (NSString)serviceType
{
  return self->_serviceType;
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (void).cxx_destruct
{
}

@end
@interface RPAppSignInService
- (NSArray)associatedDomains;
- (NSString)appBundleID;
- (NSString)appName;
- (OS_dispatch_queue)dispatchQueue;
- (RPAppSignInService)init;
- (id)description;
- (unsigned)flags;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)activate;
- (void)invalidate;
- (void)setAppBundleID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation RPAppSignInService

- (RPAppSignInService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RPAppSignInService;
  v2 = -[RPAppSignInService init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v4 = v3;
  }

  return v3;
}

- (id)description
{
  return 0LL;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__RPAppSignInService_activate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__RPAppSignInService_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(v2 + 32) _activate];
  }

  return result;
}

- (void)_activate
{
  if (gLogCategory_RPAppSignInService <= 30
    && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  id v3 = objc_alloc_init((Class)getSFServiceClass[0]());
  objc_storeStrong((id *)&self->_bleAdvertiser, v3);
  [v3 setDeviceActionType:28];
  [MEMORY[0x189607AB8] UUID];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 UUIDString];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setIdentifier:v5];

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __31__RPAppSignInService__activate__block_invoke;
  v7[3] = &unk_18A031A58;
  id v8 = v3;
  v9 = self;
  id v6 = v3;
  [v6 activateWithCompletion:v7];
}

void __31__RPAppSignInService__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 16LL))
  {
    if (v3)
    {
      id v9 = v3;
      if (gLogCategory_RPAppSignInService <= 30
        && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
      {
        id v8 = v9;
        LogPrintF();
      }

      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "invalidate", v8);
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = 0LL;

      goto LABEL_11;
    }

    if (gLogCategory_RPAppSignInService <= 30)
    {
      id v9 = 0LL;
      if (gLogCategory_RPAppSignInService != -1 || (int v7 = _LogCategory_Initialize(), v4 = 0LL, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__RPAppSignInService_invalidate__block_invoke;
  block[3] = &unk_18A031A30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPAppSignInService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    return [*(id *)(v2 + 32) _invalidate];
  }

  return result;
}

- (void)_invalidate
{
  if (self->_bleAdvertiser)
  {
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    -[SFService invalidate](self->_bleAdvertiser, "invalidate");
    bleAdvertiser = self->_bleAdvertiser;
    self->_bleAdvertiser = 0LL;
  }

  -[RPAppSignInService _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    if (gLogCategory_RPAppSignInService <= 30
      && (gLogCategory_RPAppSignInService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
}

@end
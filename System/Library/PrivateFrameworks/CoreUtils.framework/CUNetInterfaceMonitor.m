@interface CUNetInterfaceMonitor
- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv4Addr;
- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv6Addr;
- (CUNetInterfaceMonitor)init;
- (NSArray)interfaces;
- (NSString)label;
- (NSString)primaryNetworkSignature;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)flagsChangedHandler;
- (id)interfacesChangedHandler;
- (id)invalidationHandler;
- (id)primaryIPChangedHandler;
- (id)primaryNetworkChangedHandler;
- (unsigned)controlFlags;
- (unsigned)flags;
- (void)_ensureStartedNW;
- (void)_ensureStartedSC;
- (void)_ensureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_networkInterfacesChanged:(BOOL)a3;
- (void)_primaryIPChanged:(BOOL)a3;
- (void)_primaryIPChangedNW:(BOOL)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlagsChangedHandler:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setInterfacesChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPrimaryIPChangedHandler:(id)a3;
- (void)setPrimaryNetworkChangedHandler:(id)a3;
@end

@implementation CUNetInterfaceMonitor

- (CUNetInterfaceMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUNetInterfaceMonitor;
  v2 = -[CUNetInterfaceMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetInterfaceMonitor;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CUNetInterfaceMonitor;
  -[CUNetInterfaceMonitor dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return NSPrintF();
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__CUNetInterfaceMonitor_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v8);
    }

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id flagsChangedHandler = self->_flagsChangedHandler;
    self->_id flagsChangedHandler = 0LL;

    id interfacesChangedHandler = self->_interfacesChangedHandler;
    self->_id interfacesChangedHandler = 0LL;

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id primaryIPChangedHandler = self->_primaryIPChangedHandler;
    self->_id primaryIPChangedHandler = 0LL;

    id primaryNetworkChangedHandler = self->_primaryNetworkChangedHandler;
    self->_id primaryNetworkChangedHandler = 0LL;

    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_9;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v9,  v10,  v11,  v12,  v14);
LABEL_9:
    self->_invalidateDone = 1;
  }

- (void)_ensureStartedSC
{
  if (!self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_6;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        context.version = 0LL;
        context.info = self;
        context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1896030F0];
        context.release = (void (__cdecl *)(const void *))MEMORY[0x1896030E0];
        context.copyDescription = 0LL;
        if (self->_label) {
          label = self->_label;
        }
        else {
          label = (void *)getprogname();
        }
        NSPrintF();
        char v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        SCDynamicStoreRef v9 = SCDynamicStoreCreate(0LL, v8, (SCDynamicStoreCallBack)_networkInterfacesChanged, &context);
        if (!v9)
        {
          if (!SCError())
          {
            LOBYTE(v28) = -44;
            goto LABEL_33;
          }

          int v29 = SCError();
          LOBYTE(v28) = v29;
          if (v29) {
            goto LABEL_33;
          }
        }

        CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228]);
        if (!Mutable)
        {
          int v28 = -6728;
          if (!v9)
          {
LABEL_30:
            if (!v28) {
              goto LABEL_38;
            }
LABEL_33:
            v31 = self->_ucat;
            if (v31->var0 <= 90)
            {
              if (v31->var0 == -1)
              {
                v31 = self->_ucat;
              }

              LogPrintF( (uint64_t)v31,  (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedSC]",  0x5Au,  (uint64_t)"### Monitoring start failed: %#m\n",  v11,  v12,  v13,  v14,  v28);
            }

- (void)_ensureStartedNW
{
  if (self->_nwPathEvaluator) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = MEMORY[0x1896099E0] == 0LL;
  }
  if (v6) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedNW]",  0x1Eu,  (uint64_t)"Monitoring start NW",  v2,  v3,  v4,  v5,  v14);
  }

- (void)_ensureStopped
{
  if (self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _ensureStopped]",  0x1Eu,  (uint64_t)"Monitoring stop SC",  v2,  v3,  v4,  v5,  v10);
    }

- (void)_networkInterfacesChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  int v5 = socket(2, 2, 0);
  if (v5 < 0)
  {
    if (*__error())
    {
      int v17 = *__error();
      if (!v17) {
        goto LABEL_2;
      }
    }

    else
    {
      LOBYTE(v17) = -44;
    }

    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]",  0x5Au,  (uint64_t)"### Open socket failed: %#m\n",  v13,  v14,  v15,  v16,  v17);
    return;
  }

- (void)_primaryIPChanged:(BOOL)a3
{
  scStore = self->_scStore;
  if (!scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]",  0x5Au,  (uint64_t)"### PrimaryIP changed with no SCStore\n",  v3,  v4,  v5,  v6,  v49);
    return;
  }

  v48[1] = 0;
  v47[1] = 0;
  int PrimaryIPAddress = GetPrimaryIPAddressEx(scStore, (uint64_t)v48, (uint64_t)v47);
  if (!PrimaryIPAddress)
  {
    p_primaryIPv4Addr = &self->_primaryIPv4Addr;
    if (v48[1])
    {
      if (v48[1] == 30)
      {
        p_primaryIPv4Addr->sa = *(sockaddr *)v48;
        *(in6_addr *)((char *)&self->_primaryIPv4Addr.v6.sin6_addr + 4) = *(in6_addr *)&v48[12];
        if (!a3) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }

      if (v48[1] == 2)
      {
        p_primaryIPv4Addr->sa = *(sockaddr *)v48;
        if (!a3)
        {
LABEL_23:
          v24 = self->_ucat;
          if (v24->var0 <= 30)
          {
            if (v24->var0 == -1)
            {
              v24 = self->_ucat;
            }

            LogPrintF( (uint64_t)v24,  (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]",  0x1Eu,  (uint64_t)"PrimaryIPv4 changed: %##a\n",  v19,  v20,  v21,  v22,  (char)v48);
          }

- (void)_primaryIPChangedNW:(BOOL)a3
{
  uint64_t v4 = (nw_path *)nw_path_evaluator_copy_path();
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF_safe( (uint64_t)ucat,  (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]",  0x5Au,  (uint64_t)"### No NW path",  v5,  v6,  v7,  v8,  v48);
    }

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
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

- (unsigned)flags
{
  return self->_flags;
}

- (id)flagsChangedHandler
{
  return self->_flagsChangedHandler;
}

- (void)setFlagsChangedHandler:(id)a3
{
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (id)interfacesChangedHandler
{
  return self->_interfacesChangedHandler;
}

- (void)setInterfacesChangedHandler:(id)a3
{
}

- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv4Addr
{
  retstr->var0 = (sockaddr)self[4].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[4].var2.sin6_addr + 12);
  return self;
}

- ($4FF8D77539A8BD95DCE0A545902499A9)primaryIPv6Addr
{
  retstr->var0 = (sockaddr)self[5].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[5].var2.sin6_addr + 12);
  return self;
}

- (id)primaryIPChangedHandler
{
  return self->_primaryIPChangedHandler;
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
}

- (id)primaryNetworkChangedHandler
{
  return self->_primaryNetworkChangedHandler;
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
}

- (NSString)primaryNetworkSignature
{
  return self->_primaryNetworkSignature;
}

- (void).cxx_destruct
{
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    JUMPOUT(0x186E42F24LL);
  }
  return result;
}

void __41__CUNetInterfaceMonitor__ensureStartedNW__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _primaryIPChangedNW:0];
}

uint64_t __35__CUNetInterfaceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 32);
  if (*v10 > 30) {
    goto LABEL_5;
  }
  if (*v10 != -1) {
    goto LABEL_3;
  }
  BOOL v11 = _LogCategory_Initialize(*(void *)(v9 + 32), 0x1Eu);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v10 = *(int **)(v9 + 32);
LABEL_3:
    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNetInterfaceMonitor activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

@end
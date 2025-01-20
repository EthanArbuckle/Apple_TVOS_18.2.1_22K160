@interface CUTCPServer
- ($4FF8D77539A8BD95DCE0A545902499A9)interfaceAddress;
- (BOOL)activateDirectAndReturnError:(id *)a3;
- (CUBonjourAdvertiser)bonjourAdvertiser;
- (CUNetLinkManager)netLinkManager;
- (CUTCPServer)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)connectionAcceptHandler;
- (id)connectionEndedHandler;
- (id)connectionPrepareHandler;
- (id)connectionStartedHandler;
- (id)description;
- (id)detailedDescription;
- (id)invalidationHandler;
- (int)tcpListenPort;
- (int)tcpListeningPort;
- (unsigned)flags;
- (unsigned)maxConnectionCount;
- (void)_handleConnectionAccept:(int)a3;
- (void)_handleConnectionInvalidated:(id)a3 addr:(id *)a4;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setBonjourAdvertiser:(id)a3;
- (void)setConnectionAcceptHandler:(id)a3;
- (void)setConnectionEndedHandler:(id)a3;
- (void)setConnectionPrepareHandler:(id)a3;
- (void)setConnectionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInterfaceAddress:(id *)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxConnectionCount:(unsigned int)a3;
- (void)setNetLinkManager:(id)a3;
- (void)setTcpListenPort:(int)a3;
- (void)setTcpListeningPort:(int)a3;
@end

@implementation CUTCPServer

- (CUTCPServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CUTCPServer;
  v2 = -[CUTCPServer init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUTCPServer;
    v3 = v2;
  }

  return v2;
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
  v4.super_class = (Class)&OBJC_CLASS___CUTCPServer;
  -[CUTCPServer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  CFMutableStringRef v8 = 0LL;
  -[NSMutableSet count](self->_connections, "count");
  NSAppendPrintF(&v8);
  v3 = v8;
  objc_super v4 = v3;
  if (self->_flags)
  {
    CFMutableStringRef v7 = v3;
    NSAppendPrintF(&v7);
    objc_super v5 = v7;

    objc_super v4 = v5;
  }

  return v4;
}

- (id)detailedDescription
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  CFMutableStringRef v18 = 0LL;
  NSAppendPrintF(&v18);
  v3 = v18;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  objc_super v4 = self->_connections;
  uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL,  self);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      v9 = v3;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        CFMutableStringRef v13 = v9;
        NSAppendPrintF(&v13);
        v3 = v13;

        ++v8;
        v9 = v3;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL,  v12);
    }

    while (v6);
  }

  return v3;
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
  v7[2] = __38__CUTCPServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_189F33060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  int v49 = -1;
  int v50 = -1;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPServer activateDirectAndReturnError:]",  0x1Eu,  (uint64_t)"Activate\n",  v5,  v6,  v7,  v8,  v40);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__CUTCPServer_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateDone) {
    return;
  }
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPServer _invalidated]",  0x3Cu,  (uint64_t)"### Unexpectedly invalidated\n",  v3,  v4,  v5,  v6,  v19);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)_handleConnectionAccept:(int)a3
{
  socklen_t v36 = 28;
  uint64_t v8 = accept(a3, (sockaddr *)v37, &v36);
  if ((v8 & 0x80000000) != 0)
  {
    if (*__error())
    {
      int v9 = *__error();
      if (!v9) {
        goto LABEL_4;
      }
    }

    else
    {
      LOBYTE(v9) = -44;
    }

    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPServer _handleConnectionAccept:]",  0x1Eu,  (uint64_t)"### accept() failed: %#m\n",  v4,  v5,  v6,  v7,  v9);
    }

- (void)_handleConnectionInvalidated:(id)a3 addr:(id *)a4
{
  char v4 = (char)a4;
  id v6 = a3;
  ucat = self->_ucat;
  id v14 = v6;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUTCPServer _handleConnectionInvalidated:addr:]",  0x1Eu,  (uint64_t)"Connection ended from %##a\n",  v7,  v8,  v9,  v10,  v4);
      id v6 = v14;
      goto LABEL_5;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    id v6 = v14;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (CUBonjourAdvertiser)bonjourAdvertiser
{
  return self->_bonjourAdvertiser;
}

- (void)setBonjourAdvertiser:(id)a3
{
}

- (id)connectionAcceptHandler
{
  return self->_connectionAcceptHandler;
}

- (void)setConnectionAcceptHandler:(id)a3
{
}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
{
}

- (id)connectionPrepareHandler
{
  return self->_connectionPrepareHandler;
}

- (void)setConnectionPrepareHandler:(id)a3
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

- ($4FF8D77539A8BD95DCE0A545902499A9)interfaceAddress
{
  retstr->var0 = *(sockaddr *)&self[4].var2.sin6_scope_id;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = self[5].var2.sin6_addr;
  return self;
}

- (void)setInterfaceAddress:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_interfaceAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_interfaceAddress.sa = var0;
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

- (unsigned)maxConnectionCount
{
  return self->_maxConnectionCount;
}

- (void)setMaxConnectionCount:(unsigned int)a3
{
  self->_maxConnectionCount = a3;
}

- (CUNetLinkManager)netLinkManager
{
  return self->_netLinkManager;
}

- (void)setNetLinkManager:(id)a3
{
}

- (int)tcpListenPort
{
  return self->_tcpListenPort;
}

- (void)setTcpListenPort:(int)a3
{
  self->_tcpListenPort = a3;
}

- (int)tcpListeningPort
{
  return self->_tcpListeningPort;
}

- (void)setTcpListeningPort:(int)a3
{
  self->_tcpListeningPort = a3;
}

- (void).cxx_destruct
{
}

uint64_t __39__CUTCPServer__handleConnectionAccept___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionInvalidated:*(void *)(a1 + 40) addr:a1 + 48];
}

uint64_t __25__CUTCPServer_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(result + 32);
  if (*(_BYTE *)(v8 + 16)) {
    return result;
  }
  uint64_t v9 = result;
  *(_BYTE *)(v8 + 16) = 1;
  uint64_t v10 = *(void *)(result + 32);
  v11 = *(int **)(v10 + 40);
  if (*v11 <= 30)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
      uint64_t v10 = *(void *)(v9 + 32);
      if (!v12) {
        goto LABEL_6;
      }
      v11 = *(int **)(v10 + 40);
    }

    LogPrintF( (uint64_t)v11,  (uint64_t)"-[CUTCPServer invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidating\n",  a5,  a6,  a7,  a8,  v23);
    uint64_t v10 = *(void *)(v9 + 32);
  }

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionAccept:*(unsigned int *)(a1 + 40)];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleConnectionAccept:*(unsigned int *)(a1 + 40)];
}

uint64_t __44__CUTCPServer_activateDirectAndReturnError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

void __38__CUTCPServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = 0LL;
  [v2 activateDirectAndReturnError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

@end
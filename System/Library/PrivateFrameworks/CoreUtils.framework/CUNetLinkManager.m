@interface CUNetLinkManager
- (CUNetLinkManager)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (void)_invalidate;
- (void)_invalidated;
- (void)_monitorEnsureStarted;
- (void)_monitorEnsureStopped;
- (void)_monitorReadPacket:(int)a3;
- (void)_monitorSendPacketToEndpoint:(id)a3;
- (void)_monitorSetupSocket:(int)a3;
- (void)_update;
- (void)_updateARP;
- (void)_updateEndpoint:(id)a3 state:(int)a4;
- (void)_updateEndpoints;
- (void)_updateNDP;
- (void)activate;
- (void)addEndpoint:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeEndpoint:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUNetLinkManager

- (CUNetLinkManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUNetLinkManager;
  v2 = -[CUNetLinkManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1895F8AE0]);
    v3->_probeSocketV4 = -1;
    v3->_probeSocketV6 = -1;
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetLinkManager;
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
  v4.super_class = (Class)&OBJC_CLASS___CUNetLinkManager;
  -[CUNetLinkManager dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[CUNetLinkManager descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  CFMutableStringRef v32 = 0LL;
  uint64_t v5 = -[NSMutableSet count](self->_endpoints, "count");
  uint64_t unreachableCount = self->_unreachableCount;
  uint64_t reReachableCount = self->_reReachableCount;
  uint64_t txCount = self->_txCount;
  uint64_t txErrors = self->_txErrors;
  uint64_t endpointChanges = self->_endpointChanges;
  uint64_t rxCount = self->_rxCount;
  uint64_t v18 = v5;
  NSAppendPrintF(&v32);
  objc_super v6 = v32;
  v7 = v6;
  if (a3 <= 20)
  {
    CFMutableStringRef v31 = v6;
    NSAppendPrintF(&v31);
    v8 = v31;

    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    v9 = self->_endpoints;
    uint64_t v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL,  v18,  endpointChanges,  rxCount,  txCount,  txErrors,  unreachableCount,  reReachableCount);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      if (a3 >= 11) {
        uint64_t v13 = 50LL;
      }
      else {
        uint64_t v13 = 30LL;
      }
      do
      {
        uint64_t v14 = 0LL;
        v15 = v8;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
          CFMutableStringRef v26 = v15;
          CUDescriptionWithLevel(v16, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          NSAppendPrintF(&v26);
          v8 = v26;

          ++v14;
          v15 = v8;
        }

        while (v11 != v14);
        uint64_t v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v27,  v33,  16LL,  v19);
      }

      while (v11);
    }

    v7 = v8;
  }

  return v7;
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CUNetLinkManager_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CUNetLinkManager_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self->_invalidateCalled) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _invalidate]",  0x1Eu,  (uint64_t)"Invalidate\n",  v2,  v3,  v4,  v5,  v16);
  }

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_pollTimer
    && !self->_probeSourceV4
    && !self->_probeSourceV6)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }

    else
    {
      id v4 = 0LL;
    }

    self->_invalidationHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_11:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v5,  v6,  v7,  v8,  v10);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_11;
      }
    }
  }

- (void)addEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__CUNetLinkManager_addEndpoint___block_invoke;
  v7[3] = &unk_189F33088;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)removeEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__CUNetLinkManager_removeEndpoint___block_invoke;
  v7[3] = &unk_189F33088;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_update
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(_WORD *)&self->_hasIPv4Endpoint = 0;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v3 = self->_endpoints;
  uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(unsigned __int8 *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 9LL);
        if (v8 == 30)
        {
          self->_hasIPv6Endpoint = 1;
LABEL_10:
          goto LABEL_11;
        }

        if (v8 != 2) {
          goto LABEL_10;
        }
        self->_hasIPv4Endpoint = 1;
LABEL_11:
      }

      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

- (void)_updateEndpoints
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _updateEndpoints]",  9u,  (uint64_t)"Update endpoints\n",  v2,  v3,  v4,  v5,  v24);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)_updateARP
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  *(_OWORD *)v36 = xmmword_186B49C30;
  uint64_t v37 = 0x40000000009LL;
  __int128 v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, &v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _updateARP]",  0x5Au,  (uint64_t)"### Get IPv4 route info failed: %#m\n",  v3,  v4,  v5,  v6,  v33);
    return;
  }

  gettimeofday(&v32, 0LL);
  if (v34 >= 1)
  {
    uint64_t v7 = v25;
    unint64_t v8 = (unint64_t)v25 + v34;
    unint64_t v26 = (unint64_t)v25 + v34;
    while (1)
    {
      uint64_t v9 = *((_BYTE *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4LL;
      uint64_t v10 = (char *)v7 + v9 + 136;
      uint64_t v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6) {
        break;
      }
LABEL_25:
      uint64_t v7 = (unsigned __int16 *)((char *)v7 + v11);
    }

    uint64_t v27 = *v7;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v12 = self->_endpoints;
    uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v35,  16LL);
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v18 = v13;
    uint64_t v19 = *(void *)v29;
LABEL_11:
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
      if (*(_BYTE *)(v21 + 9) != 2) {
        goto LABEL_20;
      }
      if (*(_DWORD *)(v21 + 12) != *((_DWORD *)v7 + 35)) {
        goto LABEL_20;
      }
      *(void *)(v21 + 48) = *((void *)v7 + 14);
      *(_BYTE *)(v21 + 64) = 1;
      BOOL v22 = self->_ucat;
      if (v22->var0 > 9) {
        goto LABEL_20;
      }
      if (v22->var0 == -1)
      {
        BOOL v22 = self->_ucat;
      }

      LogPrintF( (uint64_t)v22,  (uint64_t)"-[CUNetLinkManager _updateARP]",  9u,  (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n",  v14,  v15,  v16,  v17,  v21 + 8);
LABEL_20:
      if (v18 == ++v20)
      {
        uint64_t v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v35,  16LL);
        uint64_t v18 = v23;
        if (!v23)
        {
LABEL_24:

          unint64_t v8 = v26;
          uint64_t v11 = v27;
          goto LABEL_25;
        }

        goto LABEL_11;
      }
    }
  }

- (void)_updateNDP
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  *(_OWORD *)v36 = xmmword_186B49C40;
  uint64_t v37 = 0x40000000009LL;
  __int128 v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, &v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _updateNDP]",  0x5Au,  (uint64_t)"### Get IPv6 route info failed: %#m\n",  v3,  v4,  v5,  v6,  v33);
    return;
  }

  gettimeofday(&v32, 0LL);
  if (v34 >= 1)
  {
    uint64_t v7 = v25;
    unint64_t v8 = (unint64_t)v25 + v34;
    unint64_t v26 = (unint64_t)v25 + v34;
    while (1)
    {
      uint64_t v9 = *((_BYTE *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4LL;
      uint64_t v10 = (char *)v7 + v9 + 136;
      uint64_t v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6) {
        break;
      }
LABEL_25:
      uint64_t v7 = (unsigned __int16 *)((char *)v7 + v11);
    }

    uint64_t v27 = *v7;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v12 = self->_endpoints;
    uint64_t v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v35,  16LL);
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
LABEL_11:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
      if (*(_BYTE *)(v17 + 9) != 30) {
        goto LABEL_20;
      }
      *(void *)(v17 + 48) = *((void *)v7 + 14);
      *(_BYTE *)(v17 + 64) = 1;
      BOOL v22 = self->_ucat;
      if (v22->var0 > 9) {
        goto LABEL_20;
      }
      if (v22->var0 == -1)
      {
        BOOL v22 = self->_ucat;
      }

      LogPrintF( (uint64_t)v22,  (uint64_t)"-[CUNetLinkManager _updateNDP]",  9u,  (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n",  v18,  v19,  v20,  v21,  v17 + 8);
LABEL_20:
      if (v14 == ++v16)
      {
        uint64_t v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v28,  v35,  16LL);
        uint64_t v14 = v23;
        if (!v23)
        {
LABEL_24:

          unint64_t v8 = v26;
          uint64_t v11 = v27;
          goto LABEL_25;
        }

        goto LABEL_11;
      }
    }
  }

- (void)_updateEndpoint:(id)a3 state:(int)a4
{
  id v6 = a3;
  if (*((_DWORD *)v6 + 9) == a4) {
    goto LABEL_10;
  }
  ucat = self->_ucat;
  id v15 = v6;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_6:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _updateEndpoint:state:]",  0x1Eu,  (uint64_t)"Endpoint state changed: %##a: %s -> %s\n",  v7,  v8,  v9,  v10,  (_BYTE)v6 + 8);
      id v6 = v15;
      goto LABEL_7;
    }

    BOOL v12 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    id v6 = v15;
    if (v12)
    {
      ucat = self->_ucat;
      goto LABEL_6;
    }
  }

- (void)_monitorEnsureStarted
{
  if (!self->_pollTimer)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _monitorEnsureStarted]",  0x1Eu,  (uint64_t)"Monitor start\n",  v2,  v3,  v4,  v5,  v13);
    }

- (void)_monitorEnsureStopped
{
  if (!self->_pollTimer) {
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _monitorEnsureStopped]",  0x1Eu,  (uint64_t)"Monitor stop\n",  v2,  v3,  v4,  v5,  v13);
      goto LABEL_6;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }

- (void)_monitorSetupSocket:(int)a3
{
  if (a3 == 2)
  {
    uint64_t v9 = "IPv4";
    uint64_t v10 = 5LL;
    uint64_t v11 = 4LL;
  }

  else
  {
    if (a3 != 30)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]",  0x5Au,  (uint64_t)"### Probe socket bad family: %d\n",  v3,  v4,  v5,  v6,  a3);
      return;
    }

    uint64_t v9 = "IPv6";
    uint64_t v10 = 7LL;
    uint64_t v11 = 6LL;
  }

  dispatch_time_t v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 == -1)
    {
      dispatch_time_t v12 = self->_ucat;
    }

    LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]",  0x1Eu,  (uint64_t)"Monitor setup socket %s\n",  v3,  v4,  v5,  v6,  (char)v9);
  }

- (void)_monitorReadPacket:(int)a3
{
  int v12 = 0;
  if (!SocketRecvFrom(a3, (uint64_t)&v12, 4LL, &v11, v10, 0x1Cu, 0LL, 0LL, 0LL, 0LL))
  {
    ++self->_rxCount;
    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      return;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]",  9u,  (uint64_t)"Probe recv: %##a, %zu bytes, R# %u, S# %u\n",  v4,  v5,  v6,  v7,  (char)v10);
    return;
  }

  uint64_t v8 = self->_ucat;
  if (v8->var0 <= 90)
  {
    if (v8->var0 != -1)
    {
LABEL_4:
      LogPrintF( (uint64_t)v8,  (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]",  0x5Au,  (uint64_t)"### Probe recv failed: R# %u, %#m\n",  v4,  v5,  v6,  v7,  self->_rxCount);
      return;
    }

    if (_LogCategory_Initialize((uint64_t)v8, 0x5Au))
    {
      uint64_t v8 = self->_ucat;
      goto LABEL_4;
    }
  }

- (void)_monitorSendPacketToEndpoint:(id)a3
{
  uint64_t v4 = (char *)a3;
  int v5 = *((_DWORD *)v4 + 17) + 1;
  *((_DWORD *)v4 + 17) = v5;
  int v18 = v5;
  uint64_t v6 = (const sockaddr *)(v4 + 8);
  int v7 = v4[9];
  if (v7 == 30) {
    int v8 = 28;
  }
  else {
    int v8 = 0;
  }
  BOOL v9 = v7 == 2;
  uint64_t v10 = 6LL;
  if (v9)
  {
    uint64_t v10 = 4LL;
    socklen_t v11 = 16;
  }

  else
  {
    socklen_t v11 = v8;
  }

  if (sendto((int)(&self->super.isa)[v10], &v18, 4uLL, 0, v6, v11) == 4 || *__error() && !*__error())
  {
    ++self->_txCount;
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]",  9u,  (uint64_t)"Probe sent: %##a, S# %u, T# %u, E# %u\n",  v12,  v13,  v14,  v15,  (char)v6);
    }
  }

  else
  {
    ++self->_txErrors;
    uint64_t v17 = self->_ucat;
    if (v17->var0 <= 20)
    {
      if (v17->var0 == -1)
      {
        uint64_t v17 = self->_ucat;
      }

      LogPrintF( (uint64_t)v17,  (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]",  0x14u,  (uint64_t)"### Probe send failed: %##a, S# %u, T# %u, E# %u, %#m\n",  v12,  v13,  v14,  v15,  (char)v6);
    }
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

- (void).cxx_destruct
{
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorReadPacket:*(unsigned int *)(a1 + 40)];
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke_2(uint64_t a1)
{
  int v2 = **(_DWORD **)(a1 + 40);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error()) {
      __error();
    }
    **(_DWORD **)(a1 + 40) = -1;
  }

  uint64_t v3 = *(void ***)(a1 + 48);
  uint64_t v4 = *v3;
  NSMutableSet *v3 = 0LL;

  return [*(id *)(a1 + 32) _invalidated];
}

uint64_t __41__CUNetLinkManager__monitorEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEndpoints];
}

uint64_t __35__CUNetLinkManager_removeEndpoint___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 80);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNetLinkManager removeEndpoint:]_block_invoke",  0x1Eu,  (uint64_t)"Remove endpoint: %##a\n",  a5,  a6,  a7,  a8,  *(_BYTE *)(a1 + 40) + 8);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }

    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 80);
      goto LABEL_3;
    }
  }

uint64_t __32__CUNetLinkManager_addEndpoint___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(unsigned __int8 *)(v9 + 9);
  if (v10 == 30 || v10 == 2) {
    *(_WORD *)(v9 + 10) = -30194;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(int **)(v12 + 80);
  if (*v13 <= 30)
  {
    if (*v13 != -1)
    {
LABEL_9:
      LogPrintF( (uint64_t)v13,  (uint64_t)"-[CUNetLinkManager addEndpoint:]_block_invoke",  0x1Eu,  (uint64_t)"Add endpoint: %##a\n",  a5,  a6,  a7,  a8,  *(_BYTE *)(a1 + 32) + 8);
      uint64_t v12 = *(void *)(a1 + 40);
      goto LABEL_11;
    }

    BOOL v14 = _LogCategory_Initialize((uint64_t)v13, 0x1Eu);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v14)
    {
      uint64_t v13 = *(int **)(v12 + 80);
      goto LABEL_9;
    }
  }

uint64_t __30__CUNetLinkManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

uint64_t __28__CUNetLinkManager_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  int v10 = (int *)v9[10];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void **)(a1 + 32);
      if (!v11) {
        return [v9 _update];
      }
      int v10 = (int *)v9[10];
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CUNetLinkManager activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate: poll %d secs (+/- %d), reach %d secs, unreach %d secs\n",  a5,  a6,  a7,  a8,  13);
    uint64_t v9 = *(void **)(a1 + 32);
  }

  return [v9 _update];
}

@end
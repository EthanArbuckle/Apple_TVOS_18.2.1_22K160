@interface CURangingSession
- (CURangingSession)init;
- (NSArray)peers;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)measurementHandler;
- (id)measurementHandlerEx;
- (id)statusChangedHandler;
- (unsigned)flags;
- (unsigned)statusFlags;
- (void)_invalidated;
- (void)_update;
- (void)_updateResponder;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMeasurementHandler:(id)a3;
- (void)setMeasurementHandlerEx:(id)a3;
- (void)setPeers:(id)a3;
- (void)setStatusChangedHandler:(id)a3;
@end

@implementation CURangingSession

- (CURangingSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CURangingSession;
  v2 = -[CURangingSession init](&v5, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CURangingSession;
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
  v4.super_class = (Class)&OBJC_CLASS___CURangingSession;
  -[CURangingSession dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5 = a3;
  [v5 UTF8String];
  LogCategoryReplaceF((uint64_t *)&self->_ucat);
}

- (void)setPeers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  peers = v6->_peers;
  v8 = v5;
  v9 = peers;
  if (v8 == v9)
  {

    goto LABEL_14;
  }

  v10 = v9;
  if ((v8 == 0LL) != (v9 != 0LL))
  {
    char v11 = -[NSArray isEqual:](v8, "isEqual:", v9);

    if ((v11 & 1) != 0) {
      goto LABEL_14;
    }
  }

  else
  {
  }

  ucat = v6->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = v6->_ucat;
    }

    char v13 = -[NSArray count](v6->_peers, "count");
    -[NSArray count](v8, "count");
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CURangingSession setPeers:]",  0x1Eu,  (uint64_t)"Update peers: %d -> %d total\n",  v14,  v15,  v16,  v17,  v13);
  }

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__CURangingSession_activate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__CURangingSession_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0LL;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0LL;

    id measurementHandler = self->_measurementHandler;
    self->_id measurementHandler = 0LL;

    id measurementHandlerEx = self->_measurementHandlerEx;
    self->_id measurementHandlerEx = 0LL;

    id statusChangedHandler = self->_statusChangedHandler;
    self->_id statusChangedHandler = 0LL;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CURangingSession _invalidated]",  0x1Eu,  (uint64_t)"Invalidated\n",  v9,  v10,  v11,  v12,  v14);
        return;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    if ((self->_flags & 1) != 0) {
      -[CURangingSession _updateResponder](self, "_updateResponder");
    }
    else {
      -[CURangingSession _updateInitiator](self, "_updateInitiator");
    }
  }

- (void)_updateResponder
{
  if (self->_peersChanged)
  {
    self->_peersChanged = 0;
    -[CURangingSession _updatePeers](self, "_updatePeers");
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

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
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

- (id)measurementHandler
{
  return self->_measurementHandler;
}

- (void)setMeasurementHandler:(id)a3
{
}

- (id)measurementHandlerEx
{
  return self->_measurementHandlerEx;
}

- (void)setMeasurementHandlerEx:(id)a3
{
}

- (NSArray)peers
{
  return self->_peers;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (void).cxx_destruct
{
}

uint64_t __30__CURangingSession_invalidate__block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 32);
  if (!*(_BYTE *)(v8 + 9))
  {
    uint64_t v9 = result;
    *(_BYTE *)(v8 + 9) = 1;
    uint64_t v10 = *(void **)(result + 32);
    uint64_t v11 = (int *)v10[2];
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x1Eu);
        uint64_t v10 = *(void **)(v9 + 32);
        if (!v12) {
          return [v10 _invalidate];
        }
        uint64_t v11 = (int *)v10[2];
      }

      LogPrintF( (uint64_t)v11,  (uint64_t)"-[CURangingSession invalidate]_block_invoke",  0x1Eu,  (uint64_t)"Invalidate\n",  a5,  a6,  a7,  a8,  v13);
      uint64_t v10 = *(void **)(v9 + 32);
    }

    return [v10 _invalidate];
  }

  return result;
}

uint64_t __28__CURangingSession_activate__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_5;
      }
      uint64_t v10 = *(int **)(v9 + 16);
    }

    LogPrintF( (uint64_t)v10,  (uint64_t)"-[CURangingSession activate]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  a5,  a6,  a7,  a8,  v13);
    uint64_t v9 = *(void *)(a1 + 32);
  }

uint64_t __29__CURangingSession_setPeers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

@end
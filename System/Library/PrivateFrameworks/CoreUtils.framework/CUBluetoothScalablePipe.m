@interface CUBluetoothScalablePipe
- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4;
- (CUBluetoothScalablePipe)init;
- (NSString)description;
- (NSString)identifier;
- (NSString)label;
- (NSUUID)peerIdentifier;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (id)peerHostStateChangedHandler;
- (id)stateChangedHandler;
- (int)_readBytes:(char *)a3 minLen:(unint64_t)a4 maxLen:(unint64_t)a5 offset:(unint64_t *)a6;
- (int)_writeIOArray:(iovec *)a3 ioCount:(int *)a4;
- (int)peerHostState;
- (int)priority;
- (int)state;
- (unint64_t)_writeBytes:(const char *)a3 length:(unint64_t)a4;
- (void)_abortReadsWithError:(id)a3;
- (void)_abortWritesWithError:(id)a3;
- (void)_completeReadRequest:(id)a3 error:(id)a4;
- (void)_completeWriteRequest:(id)a3 error:(id)a4;
- (void)_ensureStarted;
- (void)_ensureStopped:(id)a3;
- (void)_handleBTPeerHostStateChanged;
- (void)_invalidate;
- (void)_prepareReadRequest:(id)a3;
- (void)_processReads;
- (void)_processWrites;
- (void)_setupPipe;
- (void)_tearDownPipe;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readWithRequest:(id)a3;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPeerHostStateChangedHandler:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setPriority:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)writeWithRequest:(id)a3;
@end

@implementation CUBluetoothScalablePipe

- (CUBluetoothScalablePipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CUBluetoothScalablePipe;
  v2 = -[CUBluetoothScalablePipe init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_channelFD = -1;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_priority = 2;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBluetoothScalablePipe;
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
  v4.super_class = (Class)&OBJC_CLASS___CUBluetoothScalablePipe;
  -[CUBluetoothScalablePipe dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)NSPrintF();
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
  v7[2] = __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke;
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
  block[2] = __37__CUBluetoothScalablePipe_invalidate__block_invoke;
  block[3] = &unk_189F34238;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (self->_invalidateCalled || self->_invalidateDone) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _invalidate]",  0x1Eu,  (uint64_t)"Invalidating\n",  v2,  v3,  v4,  v5,  v20);
      goto LABEL_7;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }

- (void)_ensureStarted
{
  v30[1] = *MEMORY[0x1895F89C0];
  if (self->_invalidateCalled) {
    return;
  }
  btPipeManager = self->_btPipeManager;
  if (!btPipeManager)
  {
    uint64_t v12 = (CBScalablePipeManager *)[objc_alloc(getCBScalablePipeManagerClass()) initWithDelegate:self queue:self->_dispatchQueue];
    uint64_t v13 = self->_btPipeManager;
    self->_btPipeManager = v12;

    uint64_t v14 = self->_btPipeManager;
    if (!v14)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      v16 = "### Create CBScalablePipeManager failed\n";
      goto LABEL_28;
    }

    if (-[CBScalablePipeManager state](v14, "state") != 5) {
      return;
    }
LABEL_11:
    if (self->_btEndpointRegistering)
    {
      if (!self->_btEndpointRegistered)
      {
        if (!btPipeManager) {
          return;
        }
        ucat = self->_ucat;
        if (ucat->var0 > 20) {
          return;
        }
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        v16 = "Waiting until endpoint registered\n";
LABEL_33:
        unsigned int v20 = 20;
        goto LABEL_34;
      }

      goto LABEL_18;
    }

    if (self->_btEndpointRegistered)
    {
LABEL_18:
      p_btPipe = &self->_btPipe;
      if (!self->_btPipe)
      {
        if (!btPipeManager) {
          return;
        }
        ucat = self->_ucat;
        if (ucat->var0 > 20) {
          return;
        }
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
        }

        v16 = "Waiting until pipe connected\n";
        goto LABEL_33;
      }

- (void)_ensureStopped:(id)a3
{
  id v4 = a3;
  -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v4);
  -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v4);

  -[CUBluetoothScalablePipe _tearDownPipe](self, "_tearDownPipe");
  btPipe = self->_btPipe;
  self->_btPipe = 0LL;

  uint64_t v6 = self->_identifier;
  if (v6 && (self->_btEndpointRegistered || self->_btEndpointRegistering))
  {
    uint64_t v7 = v6;
    -[CBScalablePipeManager unregisterEndpoint:](self->_btPipeManager, "unregisterEndpoint:", v6);
    uint64_t v6 = v7;
  }

  *(_WORD *)&self->_btEndpointRegistering = 0;
}

- (void)_setupPipe
{
  uint64_t v3 = self->_btPipe;
  id v4 = (channel *)-[CBScalablePipe channel](v3, "channel");
  self->_btChannel = v4;
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      v22 = "### No channel\n";
      goto LABEL_20;
    }

    goto LABEL_21;
  }

  os_channel_ring_id();
  unint64_t v9 = (channel_ring_desc *)os_channel_rx_ring();
  self->_btReadRing = v9;
  if (!v9)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      v22 = "### No rx ring\n";
      goto LABEL_20;
    }

    goto LABEL_21;
  }

  os_channel_ring_id();
  v10 = (channel_ring_desc *)os_channel_tx_ring();
  self->_btWriteRing = v10;
  if (!v10)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      v22 = "### No tx ring\n";
      goto LABEL_20;
    }

- (void)_tearDownPipe
{
  if ((self->_channelFD & 0x80000000) == 0)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_4:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _tearDownPipe]",  0x1Eu,  (uint64_t)"Tear down pipe\n",  v2,  v3,  v4,  v5,  v15);
        goto LABEL_6;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_4;
      }
    }
  }

- (void)_handleBTPeerHostStateChanged
{
  if (self->_btPeerKVORegistered)
  {
    -[CBScalablePipe peer](self->_btPipe, "peer");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 hostState];

    if (v8 == 1) {
      int v9 = 1;
    }
    else {
      int v9 = 2 * (v8 == 2);
    }
  }

  else
  {
    int v9 = 0;
  }

  unsigned int peerHostState = self->_peerHostState;
  if (v9 == peerHostState) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_9:
      if (peerHostState > 2) {
        uint64_t v12 = "?";
      }
      else {
        uint64_t v12 = off_189F30C80[peerHostState];
      }
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _handleBTPeerHostStateChanged]",  0x1Eu,  (uint64_t)"Peer host state changed: %s -> %s\n",  v2,  v3,  v4,  v5,  (char)v12);
      goto LABEL_15;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      unsigned int peerHostState = self->_peerHostState;
      goto LABEL_9;
    }
  }

- (void)readWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__CUBluetoothScalablePipe_readWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_processReads
{
  p_readRequestCurrent = &self->_readRequestCurrent;
  int v4 = 4;
  do
  {
    uint64_t v5 = *p_readRequestCurrent;
    if (!v5)
    {
      uint64_t v6 = -[NSMutableArray firstObject](self->_readRequests, "firstObject");
      if (!v6)
      {
        if (!self->_readSuspended)
        {
          self->_readSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_readSource);
        }

        int v16 = 0LL;
        goto LABEL_18;
      }

      obja = (CUReadRequest *)v6;
      -[NSMutableArray removeObjectAtIndex:](self->_readRequests, "removeObjectAtIndex:", 0LL);
      -[CUBluetoothScalablePipe _prepareReadRequest:](self, "_prepareReadRequest:", obja);
      objc_storeStrong((id *)p_readRequestCurrent, obja);
      uint64_t v5 = obja;
    }

    obj = v5;
    uint64_t v7 = (const char *)-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]( self,  "_readBytes:minLen:maxLen:offset:",  v5->_bufferPtr,  -[CUReadRequest minLength](v5, "minLength"),  -[CUReadRequest maxLength](v5, "maxLength"),  &v5->_length);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1) {
        goto LABEL_7;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_7:
        char v9 = -[CUReadRequest minLength](obj, "minLength");
        -[CUReadRequest maxLength](obj, "maxLength");
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _processReads]",  9u,  (uint64_t)"Read channel, %zu min, %zu max, %zu offset, %zu nread, %#m\n",  v10,  v11,  v12,  v13,  v9);
      }
    }

    if ((_DWORD)v7)
    {
      if ((_DWORD)v7 == 35)
      {
        if (self->_readSuspended)
        {
          self->_readSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_readSource);
        }
      }

      else
      {
        NSErrorWithOSStatusF(v7);
        char v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothScalablePipe _abortReadsWithError:](self, "_abortReadsWithError:", v15);
      }

      int v16 = obj;
LABEL_18:

      return;
    }

    readRequestCurrent = self->_readRequestCurrent;
    self->_readRequestCurrent = 0LL;

    -[CUBluetoothScalablePipe _completeReadRequest:error:](self, "_completeReadRequest:error:", obj, 0LL);
    --v4;
  }

  while (v4);
  if (self->_readSuspended)
  {
    self->_readSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_readSource);
  }

- (void)_prepareReadRequest:(id)a3
{
  v21 = a3;
  if ([v21 bufferBytes])
  {
    v21[1] = [v21 bufferBytes];
    [v21 setData:0];
  }

  else
  {
    [v21 bufferData];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      [v21 bufferData];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v6 = [v5 length];
      unint64_t v7 = [v21 maxLength];

      if (v6 < v7)
      {
        uint64_t v8 = [v21 maxLength];
        [v21 bufferData];
        char v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setLength:v8];
      }
    }

    else
    {
      uint64_t v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FB8]), "initWithLength:", objc_msgSend(v21, "maxLength"));
      [v21 setBufferData:v10];
    }

    id v11 = [v21 bufferData];
    v21[1] = [v11 mutableBytes];

    [v21 bufferData];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setData:v12];
  }

  uint64_t v13 = (void *)v21[2];
  v21[2] = 0LL;
  v21[3] = 0LL;

  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    char v15 = v21;
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      char v15 = v21;
    }

    char v16 = [v15 minLength];
    [v21 maxLength];
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _prepareReadRequest:]",  9u,  (uint64_t)"Read prepared (%zu min, %zu max)\n",  v17,  v18,  v19,  v20,  v16);
  }

- (int)_readBytes:(char *)a3 minLen:(unint64_t)a4 maxLen:(unint64_t)a5 offset:(unint64_t *)a6
{
  unint64_t v7 = a4;
  uint64_t v8 = a3;
  char v9 = &a3[*a6];
  unint64_t v10 = a5 - *a6;
  if (a5 == *a6) {
    goto LABEL_38;
  }
  btReadLeftoverPtr = self->_btReadLeftoverPtr;
  uint64_t v13 = (char *)(self->_btReadLeftoverEnd - btReadLeftoverPtr);
  if (v13)
  {
    size_t v14 = (unint64_t)v13 >= v10 ? a5 - *a6 : self->_btReadLeftoverEnd - btReadLeftoverPtr;
    memcpy(v9, btReadLeftoverPtr, v14);
    self->_btReadLeftoverPtr += v14;
    v9 += v14;
    v10 -= v14;
    if (!v10) {
      goto LABEL_38;
    }
  }

  for (uint64_t i = 0LL; ; uint64_t i = v21)
  {
    uint64_t next_slot = os_channel_get_next_slot();
    if (!next_slot) {
      break;
    }
    uint64_t v21 = next_slot;
    ucat = self->_ucat;
    if (ucat->var0 > 8) {
      goto LABEL_13;
    }
    if (ucat->var0 != -1) {
      goto LABEL_11;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 8u))
    {
      ucat = self->_ucat;
LABEL_11:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _readBytes:minLen:maxLen:offset:]",  8u,  (uint64_t)"Read channel slot %p, remain %zu, slotLen %u\n",  v17,  v18,  v19,  v20,  v21);
    }

- (void)_abortReadsWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (self->_readRequestCurrent || -[NSMutableArray count](self->_readRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _abortReadsWithError:]",  0x1Eu,  (uint64_t)"Abort reads: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)_completeReadRequest:(id)a3 error:(id)a4
{
  uint64_t v16 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    id v8 = v16;
    if (ucat->var0 != -1)
    {
LABEL_3:
      char v9 = [v8 length];
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _completeReadRequest:error:]",  9u,  (uint64_t)"Read completed: %zu byte(s), %{error}\n",  v10,  v11,  v12,  v13,  v9);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      id v8 = v16;
      goto LABEL_3;
    }
  }

- (void)writeWithRequest:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke;
  v7[3] = &unk_189F33088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_processWrites
{
  p_writeRequestCurrent = &self->_writeRequestCurrent;
  int v4 = 4;
  do
  {
    uint64_t v5 = *p_writeRequestCurrent;
    if (!v5)
    {
      uint64_t v13 = -[NSMutableArray firstObject](self->_writeRequests, "firstObject");
      if (!v13)
      {
        if (!self->_writeSuspended)
        {
          self->_writeSuspended = 1;
          dispatch_suspend((dispatch_object_t)self->_writeSource);
        }

        uint64_t v5 = 0LL;
        goto LABEL_25;
      }

      uint64_t v5 = (CUWriteRequest *)v13;
      -[NSMutableArray removeObjectAtIndex:](self->_writeRequests, "removeObjectAtIndex:", 0LL);
      id v18 = 0LL;
      -[CUBluetoothScalablePipe _prepareWriteRequest:error:](self, "_prepareWriteRequest:error:", v5, &v18);
      id v14 = v18;
      if (v14)
      {
        uint64_t v15 = v14;
        -[CUBluetoothScalablePipe _completeWriteRequest:error:](self, "_completeWriteRequest:error:", v5, v14);
        goto LABEL_12;
      }

      objc_storeStrong((id *)p_writeRequestCurrent, v5);
    }

    int ion = v5->_ion;
    uint64_t v11 = (const char *)-[CUBluetoothScalablePipe _writeIOArray:ioCount:]( self,  "_writeIOArray:ioCount:",  &v5->_iop,  &v5->_ion);
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 9u))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _processWrites]",  9u,  (uint64_t)"Write channel, pre-ion %d, post-ion %d, %#m\n",  v7,  v8,  v9,  v10,  ion);
      }
    }

    if ((_DWORD)v11)
    {
      if ((_DWORD)v11 == 35)
      {
        if (self->_writeSuspended)
        {
          self->_writeSuspended = 0;
          dispatch_resume((dispatch_object_t)self->_writeSource);
        }
      }

      else
      {
        NSErrorWithOSStatusF(v11);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUBluetoothScalablePipe _abortWritesWithError:](self, "_abortWritesWithError:", v17);
      }

- (BOOL)_prepareWriteRequest:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v6 = (char *)a3;
  [v6 dataArray];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (!v7)
  {
    *((void *)v6 + 34) = v6 + 16;
    LODWORD(v11) = [v6 bytesIOCount];
    goto LABEL_14;
  }

  unint64_t v9 = [v7 count];
  if (v9 <= [v6 bytesIOMaxCount])
  {
    uint64_t v12 = v6 + 16;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    uint64_t v15 = v6 + 16;
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v33;
      uint64_t v15 = v6 + 16;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          *(void *)uint64_t v15 = [v19 bytes];
          *((void *)v15 + 1) = [v19 length];
          v15 += 16;
        }

        uint64_t v16 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v16);
    }

    *((void *)v6 + 34) = v12;
    unint64_t v11 = (unint64_t)(v15 - v12) >> 4;
LABEL_14:
    *((_DWORD *)v6 + 70) = v11;
    *((void *)v6 + 36) = 0LL;
    __int128 v20 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0LL;

    if (gLogCategory_CUBluetoothScalablePipe > 9
      || gLogCategory_CUBluetoothScalablePipe == -1
      && !_LogCategory_Initialize((uint64_t)&gLogCategory_CUBluetoothScalablePipe, 9u))
    {
      goto LABEL_27;
    }

    int v25 = *((_DWORD *)v6 + 70);
    if (v25)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = 16LL * v25;
      uint64_t v28 = (uint64_t *)(*((void *)v6 + 34) + 8LL);
      do
      {
        uint64_t v29 = *v28;
        v28 += 2;
        v26 += v29;
        v27 -= 16LL;
      }

      while (v27);
    }

    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
      int v25 = *((_DWORD *)v6 + 70);
    }

    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _prepareWriteRequest:error:]",  9u,  (uint64_t)"Write prepared (%d iov, %zu total)\n",  v21,  v22,  v23,  v24,  v25);
LABEL_27:
    BOOL v10 = 1;
    goto LABEL_28;
  }

  if (a4)
  {
    [v6 bytesIOMaxCount];
    NSErrorWithOSStatusF((const char *)0xFFFFE594LL);
    BOOL v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v10 = 0;
  }

- (int)_writeIOArray:(iovec *)a3 ioCount:(int *)a4
{
  uint64_t v4 = *a4;
  if (!(_DWORD)v4) {
    return 0;
  }
  uint64_t v8 = *a3;
  unint64_t v9 = &(*a3)[v4];
  uint64_t v10 = 16 * v4;
  while (1)
  {
    unint64_t v11 = -[CUBluetoothScalablePipe _writeBytes:length:](self, "_writeBytes:length:", v8->iov_base, v8->iov_len);
    size_t iov_len = v8->iov_len;
    BOOL v13 = iov_len > v11;
    size_t v14 = iov_len - v11;
    if (v13) {
      break;
    }
    ++v8;
    v10 -= 16LL;
    if (!v10) {
      return 0;
    }
  }

  v8->iov_base = (char *)v8->iov_base + v11;
  v8->size_t iov_len = v14;
  *a3 = v8;
  *a4 = (unint64_t)((char *)v9 - (char *)v8) >> 4;
  return 35;
}

- (unint64_t)_writeBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v5 = a3;
  if (!a4) {
    return v5 - a3;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = &a3[a4];
  uint64_t v5 = a3;
  while (1)
  {
    uint64_t next_slot = os_channel_get_next_slot();
    if (!next_slot) {
      break;
    }
    uint64_t v7 = next_slot;
    size_t v14 = v8 - v5;
    ucat = self->_ucat;
    if (ucat->var0 <= 8)
    {
      if (ucat->var0 == -1)
      {
        ucat = self->_ucat;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _writeBytes:length:]",  8u,  (uint64_t)"Write channel slot %p, remain %zu, slotLen %u\n",  v10,  v11,  v12,  v13,  v7);
    }

- (void)_abortWritesWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (self->_writeRequestCurrent || -[NSMutableArray count](self->_writeRequests, "count"))
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_5:
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _abortWritesWithError:]",  0x1Eu,  (uint64_t)"Abort writes: %{error}\n",  v4,  v5,  v6,  v7,  (char)v8);
        goto LABEL_7;
      }

      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_5;
      }
    }
  }

- (void)_completeWriteRequest:(id)a3 error:(id)a4
{
  uint64_t v14 = a3;
  id v10 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe _completeWriteRequest:error:]",  9u,  (uint64_t)"Write completed: %{error}\n",  v6,  v7,  v8,  v9,  (char)v10);
      goto LABEL_5;
    }

    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"hostState", a4, a5, a6))
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_189F34238;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = v17;
  if (self->_invalidateCalled) {
    goto LABEL_21;
  }
  unint64_t v9 = [v17 state];
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      ucat = self->_ucat;
    }

    if (v9 > 0xA) {
      uint64_t v11 = "?";
    }
    else {
      uint64_t v11 = off_189F30C98[v9];
    }
    LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManagerDidUpdateState:]",  0x1Eu,  (uint64_t)"Bluetooth scalable pipe state changed: %s\n",  v5,  v6,  v7,  v8,  (char)v11);
  }

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_2;
  }
  if ([v16 isEqual:self->_identifier])
  {
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if (v7)
    {
      if (var0 <= 90)
      {
        if (var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]",  0x5Au,  (uint64_t)"### didRegisterEndpoint error: %{error}\n",  v8,  v9,  v10,  v11,  (char)v7);
      }

      goto LABEL_2;
    }

    if (var0 <= 30)
    {
      char v15 = (char)v16;
      if (var0 == -1)
      {
        ucat = self->_ucat;
        char v15 = (char)v16;
      }

      LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didRegisterEndpoint:error:]",  0x1Eu,  (uint64_t)"Endpoint registered '%@'\n",  v8,  v9,  v10,  v11,  v15);
    }

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v15 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v5 = v15;
  if (!self->_invalidateCalled)
  {
    char v10 = [v15 isEqual:self->_identifier];
    ucat = self->_ucat;
    int var0 = ucat->var0;
    if ((v10 & 1) != 0)
    {
      if (var0 <= 30)
      {
        if (var0 == -1)
        {
          ucat = self->_ucat;
        }

        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:didUnregisterEndpoint:]",  0x1Eu,  (uint64_t)"Endpoint unregistered '%@'\n",  v6,  v7,  v8,  v9,  (char)v15);
      }

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v40 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = v40;
  if (!self->_invalidateCalled)
  {
    [v40 name];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v7 isEqual:self->_identifier];

    if ((v8 & 1) != 0)
    {
      btPipe = self->_btPipe;
      if (!btPipe) {
        goto LABEL_14;
      }
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 == -1)
        {
          ucat = self->_ucat;
          btPipe = self->_btPipe;
        }

        -[CBScalablePipe name](btPipe, "name");
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CBScalablePipe peer](self->_btPipe, "peer");
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 identifier];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 name];
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 peer];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 identifier];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidConnect:]",  0x5Au,  (uint64_t)"Pipe connect when already connected: '%@', Peer %@ -> '%@', Peer %@\n",  v16,  v17,  v18,  v19,  (char)v11);
      }

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v27 = a4;
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    [v27 name];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v8 isEqual:self->_identifier];

    ucat = self->_ucat;
    int var0 = ucat->var0;
    if ((v9 & 1) != 0)
    {
      if (var0 <= 30)
      {
        unint64_t v12 = v27;
        if (var0 == -1)
        {
          ucat = self->_ucat;
          unint64_t v12 = v27;
        }

        [v12 name];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 peer];
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 identifier];
        BOOL v26 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF( (uint64_t)ucat,  (uint64_t)"-[CUBluetoothScalablePipe scalablePipeManager:pipeDidDisconnect:error:]",  0x1Eu,  (uint64_t)"Pipe disconnected: ID '%@', Peer %@, %{error}\n",  v15,  v16,  v17,  v18,  (char)v13);
      }

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (int)peerHostState
{
  return self->_peerHostState;
}

- (id)peerHostStateChangedHandler
{
  return self->_peerHostStateChangedHandler;
}

- (void)setPeerHostStateChangedHandler:(id)a3
{
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_int priority = a3;
}

- (int)state
{
  return self->_state;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

_BYTE *__74__CUBluetoothScalablePipe_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (result[40]) {
    return (_BYTE *)[result _handleBTPeerHostStateChanged];
  }
  return result;
}

void __44__CUBluetoothScalablePipe_writeWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeWriteRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 160) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0) {
      [v4 _processWrites];
    }
  }

void __43__CUBluetoothScalablePipe_readWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    NSErrorWithOSStatusF((const char *)0xFFFFE5BDLL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(id)v2 _completeReadRequest:v3 error:v5];
  }

  else
  {
    [*(id *)(v2 + 128) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[28] & 0x80000000) == 0) {
      [v4 _processReads];
    }
  }

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processReads];
}

uint64_t __37__CUBluetoothScalablePipe__setupPipe__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processWrites];
}

uint64_t __37__CUBluetoothScalablePipe_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

void __50__CUBluetoothScalablePipe_activateWithCompletion___block_invoke(uint64_t a1)
{
  id v22 = *(id *)(*(void *)(a1 + 32) + 200LL);
  if (v22)
  {
    uint64_t v6 = *(int **)(*(void *)(a1 + 32) + 16LL);
    if (*v6 > 30) {
      goto LABEL_9;
    }
    if (*v6 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v6, 0x1Eu))
      {
LABEL_9:
        id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void **)(v14 + 128);
        *(void *)(v14 + 128) = v13;

        id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void **)(v17 + 160);
        *(void *)(v17 + 160) = v16;

        [*(id *)(a1 + 32) _ensureStarted];
        uint64_t v19 = *(void *)(a1 + 40);
        if (v19) {
          (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0LL);
        }
        goto LABEL_15;
      }

      uint64_t v6 = *(int **)(*(void *)(a1 + 32) + 16LL);
    }

    LogPrintF( (uint64_t)v6,  (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke",  0x1Eu,  (uint64_t)"Activate\n",  v2,  v3,  v4,  v5,  v21);
    goto LABEL_9;
  }

  NSErrorWithOSStatusF((const char *)0xFFFFE5CFLL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = *(int **)(*(void *)(a1 + 32) + 16LL);
  if (*v12 <= 90)
  {
    if (*v12 == -1)
    {
      unint64_t v12 = *(int **)(*(void *)(a1 + 32) + 16LL);
    }

    LogPrintF( (uint64_t)v12,  (uint64_t)"-[CUBluetoothScalablePipe activateWithCompletion:]_block_invoke",  0x5Au,  (uint64_t)"### Activate failed: %{error}\n",  v7,  v8,  v9,  v10,  (char)v11);
  }

@end
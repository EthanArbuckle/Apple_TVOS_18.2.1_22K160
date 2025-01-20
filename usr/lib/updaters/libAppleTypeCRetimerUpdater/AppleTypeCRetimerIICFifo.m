@interface AppleTypeCRetimerIICFifo
+ (id)getDeviceNames;
- (AppleTypeCRetimerIICFifo)initWithDeviceHandle:(id)a3 queueLabelSuffix:(id)a4;
- (AppleTypeCRetimerIICFifoDelegate)delegate;
- (BOOL)checkReady;
- (OS_dispatch_queue)delegateQueue;
- (id)getDelegateQueue;
- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5;
- (unsigned)getAvailableReceiveDataLength;
- (void)checkReady;
- (void)dealloc;
- (void)drainTransmitQueue;
- (void)pollForReceiveData;
- (void)receivedData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)start;
- (void)startPacketDumperWithBloodhoundDumper:(id)a3;
- (void)startPollingForReceiveData;
- (void)stop;
- (void)stopPollingforReceiveData;
- (void)transferError:(id)a3;
- (void)updateTransmitFifoSpace;
- (void)writeData:(id)a3;
@end

@implementation AppleTypeCRetimerIICFifo

+ (id)getDeviceNames
{
  return IICGetDeviceNamesWithPrefix(@"atcrtu");
}

- (AppleTypeCRetimerIICFifo)initWithDeviceHandle:(id)a3 queueLabelSuffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICFifo;
  v8 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:](&v23, sel_initWithDeviceHandle_, v6);
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.atcrt", "uarp");
    log = v8->_log;
    v8->_log = v9;

    v11 = (void *)NSString;
    [v6 name];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringWithFormat:@"com.apple.%@.fifo.%@", v12, v7];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___AppleTypeCRetimerFifoQueue);
    txQueue = v8->_txQueue;
    v8->_txQueue = v17;

    [v6 name];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 copy];
    name = v8->_name;
    v8->_name = (NSString *)v20;
  }

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICFifo;
  -[AppleTypeCRetimerIICFifo dealloc](&v3, sel_dealloc);
}

- (void)updateTransmitFifoSpace
{
  v10[1] = *MEMORY[0x1895F89C0];
  int v8 = 0;
  int v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 22LL, &v8, 4LL);
  if (v3)
  {
    int v4 = v3;
    self->_txFifoSpace = 0LL;
    uint64_t v9 = *MEMORY[0x1896075E0];
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Error reading from register %s(%x)",  "-[AppleTypeCRetimerIICFifo updateTransmitFifoSpace]",  "ATCRT_REG_FIFO_STATUS",  22);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v4 userInfo:v6];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerIICFifo transferError:](self, "transferError:", v7);
  }

  else
  {
    self->_txFifoSpace = HIWORD(v8);
  }

- (void)drainTransmitQueue
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (self->_started)
  {
    if (-[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length"))
    {
      if (self->_txFifoSpace
        || (-[AppleTypeCRetimerIICFifo updateTransmitFifoSpace](self, "updateTransmitFifoSpace"), self->_txFifoSpace))
      {
        while (-[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length"))
        {
          unint64_t v3 = -[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length");
          unint64_t txFifoSpace = self->_txFifoSpace;
          if (v3 < txFifoSpace) {
            unint64_t txFifoSpace = -[AppleTypeCRetimerFifoQueue length](self->_txQueue, "length");
          }
          if (txFifoSpace >= 0x7D) {
            uint64_t v5 = 125LL;
          }
          else {
            uint64_t v5 = txFifoSpace;
          }
          id v6 = -[AppleTypeCRetimerFifoQueue dequeueDataOfLength:](self->_txQueue, "dequeueDataOfLength:", v5);
          int v7 = -[AppleTypeCRetimerIICFifo writeRegister:buffer:length:]( self,  "writeRegister:buffer:length:",  20,  [v6 bytes],  v5);
          if (v7)
          {
            int v9 = v7;
            objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Error writing to register %s(%x)",  "-[AppleTypeCRetimerIICFifo drainTransmitQueue]",  "ATCRT_REG_FIFO_TX",  20,  *MEMORY[0x1896075E0]);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v15[0] = v10;
            [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v9 userInfo:0];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained appleTypeCRetimerIICFifoTransferError:self error:v12];

            return;
          }

          unint64_t v8 = self->_txFifoSpace - v5;
          self->_unint64_t txFifoSpace = v8;
          if (!v8) {
            -[AppleTypeCRetimerIICFifo updateTransmitFifoSpace](self, "updateTransmitFifoSpace");
          }

          if (!self->_txFifoSpace) {
            return;
          }
        }
      }
    }
  }

- (void)writeData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__AppleTypeCRetimerIICFifo_writeData___block_invoke;
  block[3] = &unk_18A3C1310;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

uint64_t __38__AppleTypeCRetimerIICFifo_writeData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drainTransmitQueue];
}

- (unsigned)getAvailableReceiveDataLength
{
  v13[1] = *MEMORY[0x1895F89C0];
  int v11 = 0;
  int v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 22LL, &v11, 4LL);
  if (!v3) {
    return v11;
  }
  int v4 = v3;
  uint64_t v12 = *MEMORY[0x1896075E0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Error reading from register %s(%x)",  "-[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength]",  "ATCRT_REG_FIFO_STATUS",  22);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v4 userInfo:v6];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appleTypeCRetimerIICFifoTransferError:self error:v7];

  return 0;
}

- (void)pollForReceiveData
{
  v16[1] = *MEMORY[0x1895F89C0];
  int v3 = -[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength](self, "getAvailableReceiveDataLength");
  if (v3)
  {
    unsigned __int16 v4 = v3;
    [MEMORY[0x189603FB8] data];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      size_t v6 = v4 >= 0x7Eu ? 126LL : v4;
      int v7 = calloc(v6, 1uLL);
      int v8 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 21LL, v7, v6);
      if (v8) {
        break;
      }
      [v5 appendBytes:v7 length:v6];
      free(v7);
      int v9 = -[AppleTypeCRetimerIICFifo getAvailableReceiveDataLength](self, "getAvailableReceiveDataLength");
      unsigned __int16 v4 = v9;
      if (!v9)
      {
        [MEMORY[0x189603F48] dataWithData:v5];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AppleTypeCRetimerIICFifo receivedData:](self, "receivedData:", v10);

        goto LABEL_10;
      }
    }

    int v11 = v8;
    free(v7);
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Error reading from register %s(%x)",  "-[AppleTypeCRetimerIICFifo pollForReceiveData]",  "ATCRT_REG_FIFO_RX",  21,  *MEMORY[0x1896075E0]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v11 userInfo:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerIICFifo transferError:](self, "transferError:", v14);

LABEL_10:
  }

- (void)startPollingForReceiveData
{
  if (!self->_pollingTimerSource)
  {
    int v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)self->_queue);
    pollingTimerSource = self->_pollingTimerSource;
    self->_pollingTimerSource = v3;

    objc_initWeak(&location, self);
    uint64_t v5 = self->_pollingTimerSource;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __54__AppleTypeCRetimerIICFifo_startPollingForReceiveData__block_invoke;
    v7[3] = &unk_18A3C1360;
    objc_copyWeak(&v8, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v5, v7);
    dispatch_time_t v6 = dispatch_time(0LL, 5000000LL);
    dispatch_source_set_timer((dispatch_source_t)self->_pollingTimerSource, v6, 0x4C4B40uLL, 0xF4240uLL);
    dispatch_resume((dispatch_object_t)self->_pollingTimerSource);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

void __54__AppleTypeCRetimerIICFifo_startPollingForReceiveData__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pollForReceiveData];

  id v3 = objc_loadWeakRetained(v1);
  [v3 drainTransmitQueue];
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__AppleTypeCRetimerIICFifo_start__block_invoke;
  block[3] = &unk_18A3C1388;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

_BYTE *__33__AppleTypeCRetimerIICFifo_start__block_invoke(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[72])
  {
    result = (_BYTE *)[result startPollingForReceiveData];
    *(_BYTE *)(*(void *)(a1 + 32) + 72LL) = 1;
  }

  return result;
}

- (void)stopPollingforReceiveData
{
  pollingTimerSource = self->_pollingTimerSource;
  if (pollingTimerSource)
  {
    dispatch_source_cancel((dispatch_source_t)pollingTimerSource);
    unsigned __int16 v4 = self->_pollingTimerSource;
    self->_pollingTimerSource = 0LL;
  }

- (void)stop
{
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__AppleTypeCRetimerIICFifo_stop__block_invoke;
  block[3] = &unk_18A3C1388;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

_BYTE *__32__AppleTypeCRetimerIICFifo_stop__block_invoke(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (result[72])
  {
    result = (_BYTE *)[result stopPollingforReceiveData];
    *(_BYTE *)(*(void *)(a1 + 32) + 72LL) = 0;
  }

  return result;
}

- (id)getDelegateQueue
{
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    return delegateQueue;
  }
  dispatch_get_global_queue(0LL, 0LL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)transferError:(id)a3
{
  id v4 = a3;
  -[AppleTypeCRetimerIICFifo stopPollingforReceiveData](self, "stopPollingforReceiveData");
  -[AppleTypeCRetimerIICFifo getDelegateQueue](self, "getDelegateQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__AppleTypeCRetimerIICFifo_transferError___block_invoke;
  v7[3] = &unk_18A3C1310;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__AppleTypeCRetimerIICFifo_transferError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88LL));
  [WeakRetained appleTypeCRetimerIICFifoTransferError:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  -[AppleTypeCRetimerIICFifo getDelegateQueue](self, "getDelegateQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__AppleTypeCRetimerIICFifo_receivedData___block_invoke;
  v7[3] = &unk_18A3C1310;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __41__AppleTypeCRetimerIICFifo_receivedData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88LL));
  [WeakRetained appleTypeCRetimerIICFifo:*(void *)(a1 + 32) receivedData:*(void *)(a1 + 40)];
}

- (void)startPacketDumperWithBloodhoundDumper:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[AppleTypeCRetimerFifoDumper initWithBloodhoundDumper:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerFifoDumper),  "initWithBloodhoundDumper:",  v4);

  dumper = self->_dumper;
  self->_dumper = v5;
}

- (BOOL)checkReady
{
  char v23 = 0;
  int v3 = -[AppleTypeCRetimerIICFifo readRegister:buffer:length:](self, "readRegister:buffer:length:", 23LL, &v23, 1LL);
  if (v3)
  {
    int v4 = v3;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIICFifo checkReady].cold.3((uint64_t)self, v4, log);
    }
    return 0;
  }

  char v6 = v23;
  BOOL v7 = (v23 & 1) == 0;
  if ((v23 & 1) != 0)
  {
    id v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIICFifo checkReady].cold.2((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
    }
    char v6 = v23;
  }

  if ((v6 & 2) != 0)
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIICFifo checkReady].cold.1((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0;
  }

  return v7;
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICFifo;
  id v9 = (id)-[AppleTypeCRetimerIICBase readRegister:buffer:length:](&v13, sel_readRegister_buffer_length_);
  dumper = self->_dumper;
  if (dumper)
  {
    if ((_DWORD)v9)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      [MEMORY[0x189603F48] dataWithBytes:a4 length:a5];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      dumper = self->_dumper;
    }

    -[AppleTypeCRetimerFifoDumper dumpAccessForRegisterAddress:ioReturn:data:]( dumper,  "dumpAccessForRegisterAddress:ioReturn:data:",  v7,  v9,  v11);
  }

  return (int)v9;
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICFifo;
  id v9 = (id)-[AppleTypeCRetimerIICBase writeRegister:buffer:length:](&v12, sel_writeRegister_buffer_length_);
  if (self->_dumper)
  {
    [MEMORY[0x189603F48] dataWithBytes:a4 length:a5];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerFifoDumper dumpAccessForRegisterAddress:ioReturn:data:]( self->_dumper,  "dumpAccessForRegisterAddress:ioReturn:data:",  v7,  v9,  v10);
  }

  return (int)v9;
}

- (AppleTypeCRetimerIICFifoDelegate)delegate
{
  return (AppleTypeCRetimerIICFifoDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)checkReady
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl( &dword_189540000,  log,  OS_LOG_TYPE_ERROR,  "%@: Failed to read FIFO error register (0x%08x)",  (uint8_t *)&v4,  0x12u);
  OUTLINED_FUNCTION_3();
}

@end
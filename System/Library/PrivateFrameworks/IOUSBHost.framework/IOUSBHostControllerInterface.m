@interface IOUSBHostControllerInterface
- (BOOL)commandAsyncCallbackWithResult:(int)a3 error:(id *)a4;
- (BOOL)deliverInterrupts;
- (BOOL)destroyed;
- (BOOL)doorbellAsyncCallbacKWithResult:(int)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt error:(NSError *)error;
- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt expedite:(BOOL)expedite error:(NSError *)error;
- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count error:(NSError *)error;
- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count expedite:(BOOL)expedite error:(NSError *)error;
- (BOOL)interruptDeliveryPending;
- (IONotificationPort)notificationPortRef;
- (IOUSBHostCIControllerStateMachine)controllerStateMachine;
- (IOUSBHostCIMessage)command;
- (IOUSBHostCIPortStateMachine)getPortStateMachineForCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostCIPortStateMachine)getPortStateMachineForPort:(NSUInteger)port error:(NSError *)error;
- (IOUSBHostControllerInterface)initWithCapabilities:(NSData *)capabilities queue:(dispatch_queue_t)queue interruptRateHz:(NSUInteger)interruptRateHz error:(NSError *)error commandHandler:(IOUSBHostControllerInterfaceCommandHandler)commandHandler doorbellHandler:(IOUSBHostControllerInterfaceDoorbellHandler)doorbellHandler interestHandler:(IOServiceInterestCallback)interestHandler;
- (IOUSBHostInterestNotifier)interestNotifier;
- (NSMutableData)doorbells;
- (NSMutableData)interrupts;
- (NSRecursiveLock)interruptLock;
- (NSString)descriptionForMessage:(const IOUSBHostCIMessage *)message;
- (NSUInteger)interruptRateHz;
- (NSUUID)uuid;
- (OS_dispatch_queue)interruptQueue;
- (OS_os_log)log;
- (const)capabilities;
- (const)capabilitiesForPort:(NSUInteger)port;
- (dispatch_queue_t)queue;
- (id)commandHandler;
- (id)doorbellHandler;
- (unint64_t)interruptConsumerIndex;
- (unint64_t)interruptProducerIndex;
- (unint64_t)nextInterruptTime;
- (unsigned)ioConnect;
- (void)dealloc;
- (void)destroy;
- (void)interestHandler;
- (void)setCapabilities:(const IOUSBHostCIMessage *)a3;
- (void)setCommand:(IOUSBHostCIMessage)a3;
- (void)setCommandHandler:(id)a3;
- (void)setControllerStateMachine:(id)a3;
- (void)setDestroyed:(BOOL)a3;
- (void)setDoorbellHandler:(id)a3;
- (void)setDoorbells:(id)a3;
- (void)setInterestHandler:(void *)a3;
- (void)setInterestNotifier:(id)a3;
- (void)setInterruptConsumerIndex:(unint64_t)a3;
- (void)setInterruptDeliveryPending:(BOOL)a3;
- (void)setInterruptLock:(id)a3;
- (void)setInterruptProducerIndex:(unint64_t)a3;
- (void)setInterruptQueue:(id)a3;
- (void)setInterruptRateHz:(NSUInteger)interruptRateHz;
- (void)setInterrupts:(id)a3;
- (void)setIoConnect:(unsigned int)a3;
- (void)setLog:(id)a3;
- (void)setNextInterruptTime:(unint64_t)a3;
- (void)setNotificationPortRef:(IONotificationPort *)a3;
- (void)setQueue:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation IOUSBHostControllerInterface

- (IOUSBHostControllerInterface)initWithCapabilities:(NSData *)capabilities queue:(dispatch_queue_t)queue interruptRateHz:(NSUInteger)interruptRateHz error:(NSError *)error commandHandler:(IOUSBHostControllerInterfaceCommandHandler)commandHandler doorbellHandler:(IOUSBHostControllerInterfaceDoorbellHandler)doorbellHandler interestHandler:(IOServiceInterestCallback)interestHandler
{
  uint64_t v185 = *MEMORY[0x1895F89C0];
  v15 = capabilities;
  v16 = queue;
  IOUSBHostControllerInterfaceCommandHandler v17 = commandHandler;
  IOUSBHostControllerInterfaceDoorbellHandler v18 = doorbellHandler;
  v177.receiver = self;
  v177.super_class = (Class)&OBJC_CLASS___IOUSBHostControllerInterface;
  v19 = -[IOUSBHostControllerInterface init](&v177, sel_init);
  v176 = v18;
  if (!v19)
  {
    if (error)
    {
      v173 = v15;
      IOUSBHostControllerInterfaceCommandHandler v175 = v17;
      v25 = v16;
      uint64_t v180 = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 localizedStringForKey:@"Failed to create IOUSBHostControllerInterface." value:&stru_18A275388 table:0];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&__int128 connect = v36;
      uint64_t v181 = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 localizedStringForKey:@"Unable to allocate memory." value:&stru_18A275388 table:0];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&connect + 1) = v38;
      uint64_t v182 = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v39 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v40;
      [MEMORY[0x189603F68] dictionaryWithObjects:&connect forKeys:&v180 count:3];
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v32];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v41 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v41) {
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.1( v41,  v42);
      }
      goto LABEL_13;
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IOUSBHostControllerInterface;
  -[IOUSBHostControllerInterface dealloc](&v3, sel_dealloc);
}

- (void)destroy
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!-[IOUSBHostControllerInterface destroyed](self, "destroyed"))
  {
    -[IOUSBHostControllerInterface log](self, "log");
    objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = -[IOUSBHostControllerInterface uuid](self, "uuid");
      [v4 UUIDString];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl( &dword_18874A000,  v3,  OS_LOG_TYPE_INFO,  "destroying IOUSBHostControllerInterface with UUID %@",  (uint8_t *)&buf,  0xCu);
    }

    -[IOUSBHostControllerInterface setDestroyed:](self, "setDestroyed:", 1LL);
    v6 = -[IOUSBHostControllerInterface interestNotifier](self, "interestNotifier");
    BOOL v7 = v6 == 0LL;

    if (!v7)
    {
      v8 = -[IOUSBHostControllerInterface interestNotifier](self, "interestNotifier");
      [v8 destroy];

      -[IOUSBHostControllerInterface setInterestNotifier:](self, "setInterestNotifier:", 0LL);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000LL;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = (IOUSBHostControllerInterface *)0xAAAAAAAAAAAAAAAALL;
    v9 = self;
    uint64_t v10 = MEMORY[0x1895F87A8];
    v26 = v9;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke;
    block[3] = &unk_18A274950;
    block[4] = &buf;
    v11 = (void (**)(void))dispatch_block_create((dispatch_block_flags_t)0LL, block);
    v12 = -[IOUSBHostControllerInterface interruptQueue](v9, "interruptQueue");
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      v16 = -[IOUSBHostControllerInterface queue](v9, "queue");
      BOOL v17 = v16 == 0LL;

      if (v17)
      {
        v11[2](v11);
        goto LABEL_11;
      }

      [*(id *)(*((void *)&buf + 1) + 40) queue];
      v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v11);
    }

    else
    {
      [*(id *)(*((void *)&buf + 1) + 40) interruptQueue];
      v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      v18[1] = 3221225472LL;
      v18[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke_46;
      v18[3] = &unk_18A274978;
      p___int128 buf = &buf;
      v19 = v11;
      dispatch_async(v14, v18);

      v15 = v19;
    }

LABEL_11:
    _Block_object_dispose(&buf, 8);
  }

void __39__IOUSBHostControllerInterface_destroy__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setControllerStateMachine:0];
  for (uint64_t i = 16LL; i != 144; i += 8LL)
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    v4 = *(void **)(v3 + i);
    *(void *)(v3 + i) = 0LL;
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) notificationPortRef])
  {
    IONotificationPortDestroy((IONotificationPortRef)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) notificationPortRef]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNotificationPortRef:0];
  }

  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) ioConnect])
  {
    IOServiceClose([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) ioConnect]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setIoConnect:0];
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setInterruptQueue:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setQueue:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) log];
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) uuid];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 UUIDString];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl( &dword_18874A000,  v5,  OS_LOG_TYPE_INFO,  "destroyed IOUSBHostControllerInterface with UUID %@",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;
}

void __39__IOUSBHostControllerInterface_destroy__block_invoke_46(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) queue];
    uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:]( self,  "enqueueInterrupts:count:expedite:error:",  interrupt,  1LL,  0LL,  error);
}

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt expedite:(BOOL)expedite error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:]( self,  "enqueueInterrupts:count:expedite:error:",  interrupt,  1LL,  expedite,  error);
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:]( self,  "enqueueInterrupts:count:expedite:error:",  interrupts,  count,  0LL,  error);
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count expedite:(BOOL)expedite error:(NSError *)error
{
  BOOL v7 = expedite;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  else {
    int v10 = 1;
  }
  v11 = -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  [v11 lock];

  unint64_t v12 = -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex");
  unint64_t v13 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  else {
    uint64_t v14 = v12 - -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  }
  BOOL v15 = v14 != 0;
  NSUInteger v16 = v14 - 1;
  if (v15) {
    NSUInteger v17 = v16;
  }
  else {
    NSUInteger v17 = 0LL;
  }
  if (v17 < count)
  {
    if (error)
    {
      NSUInteger v55 = v17;
      v61[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 localizedStringForKey:@"Failed to send interrupts." value:&stru_18A275388 table:0];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&__int128 buf = v39;
      v61[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v40 localizedStringForKey:@"Not enough space for interrupts." value:&stru_18A275388 table:0];
      BOOL v41 = (void *)objc_claimAutoreleasedReturnValue();
      *((void *)&buf + 1) = v41;
      v61[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v43;
      [MEMORY[0x189603F68] dictionaryWithObjects:&buf forKeys:v61 count:3];
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870181 userInfo:v44];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v45 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v45) {
        -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:].cold.1(v45, v46);
      }

      NSUInteger v17 = v55;
    }
  }

  else
  {
    int v54 = v10;
    if (count)
    {
      NSUInteger v18 = 0LL;
      NSUInteger v56 = count;
      do
      {
        unint64_t v19 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
        unint64_t v58 = v19;
        if (v19 + count - v18 <= 0x1000) {
          unint64_t v20 = count - v18;
        }
        else {
          unint64_t v20 = 4096 - v19;
        }
        id v21 = &interrupts[v18];
        -[IOUSBHostControllerInterface log](self, "log");
        os_log_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v23 && v20)
        {
          uint64_t v24 = 0LL;
          unsigned int v25 = 1;
          do
          {
            v26 = &v21[v24];
            int v27 = v26->control & 0x3F;
            else {
              os_log_type_t v30 = OS_LOG_TYPE_ERROR;
            }
            -[IOUSBHostControllerInterface log](self, "log");
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, v30))
            {
              id v32 = -[IOUSBHostControllerInterface descriptionForMessage:](self, "descriptionForMessage:", v26);
              uint64_t v33 = [v32 cStringUsingEncoding:4];
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = v33;
              _os_log_impl(&dword_18874A000, v31, v30, "interrupt %s", (uint8_t *)&buf, 0xCu);
            }

            uint64_t v24 = v25;
          }

          while (v20 > v25++);
        }
        v35 = -[IOUSBHostControllerInterface interrupts](self, "interrupts");
        objc_msgSend(v35, "replaceBytesInRange:withBytes:", 16 * v58, 16 * v20, v21);

        -[IOUSBHostControllerInterface setInterruptProducerIndex:]( self,  "setInterruptProducerIndex:",  ((_WORD)v20 + (_WORD)v58) & 0xFFF);
        v18 += v20;
        count = v56;
      }

      while (v18 < v56);
    }

    BOOL v36 = -[IOUSBHostControllerInterface interruptDeliveryPending](self, "interruptDeliveryPending");
    BOOL v37 = v36;
    if (v54)
    {
      -[IOUSBHostControllerInterface deliverInterrupts](self, "deliverInterrupts");
      -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", v37);
    }

    else if (!v36)
    {
      dispatch_time_t v47 = dispatch_time(0LL, 1000000LL);
      unint64_t v48 = -[IOUSBHostControllerInterface nextInterruptTime](self, "nextInterruptTime");
      -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", 1LL);
      if (v47 >= v48)
      {
        -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
        id v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1895F87A8];
        v60[1] = 3221225472LL;
        v60[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke;
        v60[3] = &unk_18A2749A0;
        v60[4] = self;
        dispatch_async(v51, v60);
      }

      else
      {
        dispatch_time_t v49 = -[IOUSBHostControllerInterface nextInterruptTime](self, "nextInterruptTime");
        -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
        v50 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2;
        block[3] = &unk_18A2749A0;
        block[4] = self;
        dispatch_after(v49, v50, block);
      }
    }
  }

  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  dispatch_queue_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 unlock];

  return v17 >= count;
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

- (BOOL)deliverInterrupts
{
  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed")) {
    return 1;
  }
  v4 = -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  [v4 lock];

  if (-[IOUSBHostControllerInterface interruptRateHz](self, "interruptRateHz")) {
    -[IOUSBHostControllerInterface setNextInterruptTime:]( self,  "setNextInterruptTime:",  dispatch_time(0LL, 0x3B9ACA00 / -[IOUSBHostControllerInterface interruptRateHz](self, "interruptRateHz")));
  }
  -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", 0LL);
  unint64_t v5 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  if (v5 == -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex"))
  {
LABEL_11:
    BOOL v3 = 1;
  }

  else
  {
    while (1)
    {
      unint64_t v6 = -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex");
      unint64_t v7 = v5 >= v6 ? v5 : 4096LL;
      id v8 = -[IOUSBHostControllerInterface interrupts](self, "interrupts");
      uint64_t v9 = [v8 mutableBytes];

      if (IOConnectCallStructMethod( -[IOUSBHostControllerInterface ioConnect](self, "ioConnect"),  2u,  (const void *)(v9 + 16 * v6),  16 * (v7 - v6),  0LL,  0LL))
      {
        break;
      }

      -[IOUSBHostControllerInterface setInterruptConsumerIndex:](self, "setInterruptConsumerIndex:", v7 & 0xFFF);
    }

    NSLog(@"Failed to send interrupts to kernel.\n");
    BOOL v3 = 0;
  }

  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 unlock];

  return v3;
}

- (void)setInterruptRateHz:(NSUInteger)interruptRateHz
{
  self->_interruptRateHz = interruptRateHz;
  v4 = -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
  if (v4)
  {
    -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
    unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke;
    block[3] = &unk_18A2749A0;
    block[4] = self;
    dispatch_async(v5, block);
  }

uint64_t __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deliverInterrupts];
}

- (BOOL)commandAsyncCallbackWithResult:(int)a3 error:(id *)a4
{
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  const char *v27;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t reference[2];
  IOUSBHostControllerInterface *v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  void v36[3];
  void v37[5];
  v37[3] = *MEMORY[0x1895F89C0];
  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed")) {
    return 1;
  }
  if (!a3 && (-[IOUSBHostControllerInterface command](self, "command") & 0x8000) != 0)
  {
    -[IOUSBHostControllerInterface log](self, "log");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      -[IOUSBHostControllerInterface log](self, "log");
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:].cold.2((char *)self, v10);
      }
    }

    commandHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, void))self->_commandHandler;
    uint64_t v12 = -[IOUSBHostControllerInterface command](self, "command");
    commandHandler[2](commandHandler, self, v12, v13);
  }

  -[IOUSBHostControllerInterface setCommand:](self, "setCommand:", 0LL, 0LL);
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v14;
  v35 = v14;
  uint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  reference[1] = (uint64_t)_commandAsyncCallback;
  id v32 = self;
  input = (uint64_t)&v32->_command;
  outputCnt = 0;
  mach_port_t v15 = -[IOUSBHostControllerInterface ioConnect](v32, "ioConnect");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostControllerInterface notificationPortRef](v32, "notificationPortRef"));
  NSUInteger v17 = IOConnectCallAsyncScalarMethod(v15, 0, MachPort, reference, 3u, &input, 1u, 0LL, &outputCnt);
  BOOL v7 = v17 == 0;
  if (v17)
  {
    NSUInteger v18 = v17;

    if (a4)
    {
      v36[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 localizedStringForKey:@"Failed to read command from kernel." value:&stru_18A275388 table:0];
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v20;
      v36[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 localizedStringForKey:@"Unable to enqueue asynchronous operation." value:&stru_18A275388 table:0];
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v22;
      v36[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 localizedStringForKey:0 value:&stru_18A275388 table:0];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v24;
      [MEMORY[0x189603F68] dictionaryWithObjects:v37 forKeys:v36 count:3];
      unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v18 userInfo:v25];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v26) {
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:].cold.1(v26, v27);
      }
    }
  }

  return v7;
}

- (BOOL)doorbellAsyncCallbacKWithResult:(int)a3 length:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v32;
  kern_return_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  const char *v42;
  uint32_t outputCnt;
  uint64_t input[2];
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void v50[3];
  void v51[6];
  v51[3] = *MEMORY[0x1895F89C0];
  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed")) {
    return 1;
  }
  if (!a3 && a4)
  {
    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 setLength:a4];

    -[IOUSBHostControllerInterface log](self, "log");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      -[IOUSBHostControllerInterface doorbells](self, "doorbells");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 length] & 0x3FFFFFFFCLL;

      if (v14)
      {
        unint64_t v15 = 0LL;
        do
        {
          id v16 = -[IOUSBHostControllerInterface doorbells](self, "doorbells");
          int v17 = *(_DWORD *)([v16 mutableBytes] + 4 * v15);

          -[IOUSBHostControllerInterface log](self, "log");
          NSUInteger v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__int128 buf = 67109376;
            *(_DWORD *)&buf[4] = v17;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = BYTE1(v17);
            _os_log_debug_impl( &dword_18874A000,  v18,  OS_LOG_TYPE_DEBUG,  "doorbell Device %d Endpoint 0x%02x\n",  buf,  0xEu);
          }

          ++v15;
          -[IOUSBHostControllerInterface doorbells](self, "doorbells");
          unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v20 = (unint64_t)[v19 length] >> 2;
        }

        while (v15 < v20);
      }
    }

    doorbellHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, unint64_t))self->_doorbellHandler;
    id v22 = -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    uint64_t v23 = [v22 mutableBytes];
    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    doorbellHandler[2](doorbellHandler, self, v23, (unint64_t)[v24 length] >> 2);

    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 setLength:4096];
    v26 = -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    objc_msgSend(v26, "resetBytesInRange:", 0, a4);
  }

  *(void *)&__int128 v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v48 = v27;
  dispatch_time_t v49 = v27;
  *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
  dispatch_time_t v47 = v27;
  *(void *)&buf[8] = _doorbellAsyncCallback;
  v28 = self;
  *(void *)&dispatch_time_t v47 = v28;
  id v29 = -[IOUSBHostControllerInterface doorbells](v28, "doorbells");
  input[0] = [v29 mutableBytes];

  -[IOUSBHostControllerInterface doorbells](v28, "doorbells");
  os_log_type_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  input[1] = [v30 length];

  outputCnt = 0;
  LODWORD(v30) = -[IOUSBHostControllerInterface ioConnect](v28, "ioConnect");
  mach_port_t MachPort = IONotificationPortGetMachPort(-[IOUSBHostControllerInterface notificationPortRef](v28, "notificationPortRef"));
  id v32 = IOConnectCallAsyncScalarMethod((mach_port_t)v30, 1u, MachPort, (uint64_t *)buf, 3u, input, 2u, 0LL, &outputCnt);
  BOOL v9 = v32 == 0;
  if (v32)
  {
    uint64_t v33 = v32;

    if (a5)
    {
      v50[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 localizedStringForKey:@"Failed to read doorbells from kernel." value:&stru_18A275388 table:0];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v35;
      v50[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 localizedStringForKey:@"Unable to enqueue asynchronous operation." value:&stru_18A275388 table:0];
      BOOL v37 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v37;
      v50[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 localizedStringForKey:0 value:&stru_18A275388 table:0];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v39;
      [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:3];
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:v33 userInfo:v40];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v41 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v41) {
        -[IOUSBHostControllerInterface doorbellAsyncCallbacKWithResult:length:error:].cold.1(v41, v42);
      }
    }
  }

  return v9;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  if ((command->control & 0x3F) - 24 > 6)
  {
    v4 = 0LL;
  }

  else
  {
    v4 = -[IOUSBHostControllerInterface getPortStateMachineForPort:error:]( self,  "getPortStateMachineForPort:error:",  command->data0 & 0xFLL,  error);
  }

  return (IOUSBHostCIPortStateMachine *)v4;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForPort:(NSUInteger)port error:(NSError *)error
{
  v22[3] = *MEMORY[0x1895F89C0];
  if (port && ((_WORD)-[IOUSBHostControllerInterface capabilities](self, "capabilities")[2] & 0xFu) >= port)
  {
    portStateMachine = self->_portStateMachine;
    NSUInteger v18 = self->_portStateMachine[port];
    if (!v18)
    {
      unint64_t v19 = -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:]( objc_alloc(&OBJC_CLASS___IOUSBHostCIPortStateMachine),  "initWithInterface:portNumber:error:",  self,  port,  error);
      unint64_t v20 = portStateMachine[port];
      portStateMachine[port] = v19;

      NSUInteger v18 = portStateMachine[port];
    }

    return v18;
  }

  else
  {
    if (error)
    {
      v21[0] = *MEMORY[0x1896075E0];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 localizedStringForKey:@"Failed to retrieve port state machine." value:&stru_18A275388 table:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v21[1] = *MEMORY[0x1896075F0];
      [MEMORY[0x1896077F8] mainBundle];
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 localizedStringForKey:@"Port number is out of range." value:&stru_18A275388 table:0];
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v10;
      v21[2] = *MEMORY[0x189607618];
      [MEMORY[0x1896077F8] mainBundle];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 localizedStringForKey:0 value:&stru_18A275388 table:0];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v12;
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x189607870] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v13];
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
      if (v14) {
        -[IOUSBHostControllerInterface getPortStateMachineForPort:error:].cold.1(v14, v15);
      }
    }

    return (IOUSBHostCIPortStateMachine *)0LL;
  }

- (const)capabilitiesForPort:(NSUInteger)port
{
  NSUInteger v5 = -[NSData length](self->_capabilitiesData, "length");
  if (v5 < 0x20) {
    return 0LL;
  }
  unint64_t v6 = v5 >> 4;
  unsigned int v7 = 2;
  uint64_t v8 = 1LL;
  while (1)
  {
    BOOL v9 = -[IOUSBHostControllerInterface capabilities](self, "capabilities");
    uint64_t v8 = v7;
    if (v6 <= v7++) {
      return 0LL;
    }
  }

  return &v9[v8];
}

- (NSString)descriptionForMessage:(const IOUSBHostCIMessage *)message
{
  NSUInteger v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithFormat:",  @"0x%08x %08x %016llx",  message->control,  message->data0,  message->data1);
  if ((message->control & 0x8000) == 0)
  {
    unint64_t v6 = @": Invalid";
LABEL_3:
    [v5 appendString:v6];
    return (NSString *)v5;
  }

  objc_msgSend( v5,  "appendFormat:",  @": %s",  IOUSBHostCIMessageTypeToString((IOUSBHostCIMessageType)(message->control & 0x3F)));
  unsigned int v7 = IOUSBHostCIMessageStatusToString((IOUSBHostCIMessageStatus)((message->control >> 8) & 0xF));
  unint64_t control = message->control;
  BOOL v9 = v7;
  switch(control & 0x3F)
  {
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
      objc_msgSend(v5, "appendFormat:", @" Root Port %u", message->data0 & 0xF);
      if ((message->control & 0x4000) != 0)
      {
        objc_msgSend(v5, "appendFormat:", @" Status %s", v9);
        objc_msgSend(v5, "appendString:", @" (");
        data1 = message->data1;
        if ((data1 & 1) != 0)
        {
          [v5 appendString:@" Powered"];
          data1 = message->data1;
          if ((data1 & 2) == 0)
          {
LABEL_40:
            if ((data1 & 4) == 0) {
              goto LABEL_42;
            }
            goto LABEL_41;
          }
        }

        else if ((data1 & 2) == 0)
        {
          goto LABEL_40;
        }

        [v5 appendString:@" Overcurrent"];
        data1 = message->data1;
        if ((data1 & 4) == 0)
        {
LABEL_42:
          objc_msgSend( v5,  "appendFormat:",  @" Link State %s",  IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(data1 >> 4)));
          if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(LODWORD(message->data1) >> 4))) {
            objc_msgSend( v5,  "appendFormat:",  @" Device Speed %s",  IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((LODWORD(message->data1) >> 8) & 7)));
          }
          uint64_t v20 = message->data1;
          if ((v20 & 0x20000) != 0)
          {
            [v5 appendString:@" Overcurrent Change"];
            uint64_t v20 = message->data1;
            if ((v20 & 0x40000) == 0)
            {
LABEL_46:
              if ((v20 & 0x100000) == 0)
              {
LABEL_48:
                unint64_t v6 = @"");
                goto LABEL_3;
              }

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUInteger)interruptRateHz
{
  return self->_interruptRateHz;
}

- (IOUSBHostCIControllerStateMachine)controllerStateMachine
{
  return self->_controllerStateMachine;
}

- (void)setControllerStateMachine:(id)a3
{
}

- (const)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(const IOUSBHostCIMessage *)a3
{
  self->_capabilities = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (unsigned)ioConnect
{
  return self->_ioConnect;
}

- (void)setIoConnect:(unsigned int)a3
{
  self->_ioConnect = a3;
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (id)doorbellHandler
{
  return self->_doorbellHandler;
}

- (void)setDoorbellHandler:(id)a3
{
}

- (void)interestHandler
{
  return self->_interestHandler;
}

- (void)setInterestHandler:(void *)a3
{
  self->_interestHandler = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
}

- (IOUSBHostCIMessage)command
{
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.data1 = v3;
  result.unint64_t control = v2;
  result.data0 = HIDWORD(v2);
  return result;
}

- (void)setCommand:(IOUSBHostCIMessage)a3
{
  IOUSBHostCIMessage v3 = a3;
  objc_copyStruct(&self->_command, &v3, 16LL, 1, 0);
}

- (NSMutableData)doorbells
{
  return self->_doorbells;
}

- (void)setDoorbells:(id)a3
{
}

- (NSMutableData)interrupts
{
  return self->_interrupts;
}

- (void)setInterrupts:(id)a3
{
}

- (NSRecursiveLock)interruptLock
{
  return self->_interruptLock;
}

- (void)setInterruptLock:(id)a3
{
}

- (unint64_t)interruptProducerIndex
{
  return self->_interruptProducerIndex;
}

- (void)setInterruptProducerIndex:(unint64_t)a3
{
  self->_interruptProducerIndex = a3;
}

- (unint64_t)interruptConsumerIndex
{
  return self->_interruptConsumerIndex;
}

- (void)setInterruptConsumerIndex:(unint64_t)a3
{
  self->_interruptConsumerIndex = a3;
}

- (BOOL)interruptDeliveryPending
{
  return self->_interruptDeliveryPending;
}

- (void)setInterruptDeliveryPending:(BOOL)a3
{
  self->_interruptDeliveryPending = a3;
}

- (OS_dispatch_queue)interruptQueue
{
  return self->_interruptQueue;
}

- (void)setInterruptQueue:(id)a3
{
}

- (unint64_t)nextInterruptTime
{
  return self->_nextInterruptTime;
}

- (void)setNextInterruptTime:(unint64_t)a3
{
  self->_nextInterruptTime = a3;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  for (uint64_t i = 17LL; i != 1; --i)
    objc_storeStrong((id *)&(&self->super.isa)[i], 0LL);
  objc_storeStrong((id *)&self->_capabilitiesData, 0LL);
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.2( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.3( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.4( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.5( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.6( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.7( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.8( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.9( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.10( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.11( uint64_t a1,  const char *a2)
{
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.12( uint64_t a1,  const char *a2)
{
}

- (void)enqueueInterrupts:(uint64_t)a1 count:(const char *)a2 expedite:error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)commandAsyncCallbackWithResult:(uint64_t)a1 error:(const char *)a2 .cold.1( uint64_t a1,  const char *a2)
{
}

- (void)commandAsyncCallbackWithResult:(char *)a1 error:(os_log_s *)a2 .cold.2(char *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = [a1 descriptionForMessage:a1 + 296];
  int v5 = 136315138;
  uint64_t v6 = OUTLINED_FUNCTION_2(v3, v4);
  _os_log_debug_impl(&dword_18874A000, a2, OS_LOG_TYPE_DEBUG, "command %s", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

- (void)doorbellAsyncCallbacKWithResult:(uint64_t)a1 length:(const char *)a2 error:.cold.1( uint64_t a1,  const char *a2)
{
}

- (void)getPortStateMachineForPort:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
}

@end
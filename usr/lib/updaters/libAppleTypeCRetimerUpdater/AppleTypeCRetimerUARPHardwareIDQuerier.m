@interface AppleTypeCRetimerUARPHardwareIDQuerier
- (AppleTypeCRetimerUARPHardwareIDQuerier)initWithDeviceHandle:(id)a3 captureFileName:(id)a4;
- (BOOL)initUARPWithDeviceHandle:(id)a3 captureFileName:(id)a4;
- (id)queryHardwareID;
- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4;
- (void)appleTypeCRetimerIICFifoTransferError:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)queryComplete;
- (void)queryHardwareID;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setChipRev:(unsigned int)a3;
- (void)setECID:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setProductionMode:(unsigned int)a3;
- (void)setSecurityDomain:(unsigned int)a3;
- (void)setSecurityEpoch:(unsigned int)a3;
- (void)setSecurityMode:(unsigned int)a3;
- (void)setUarpChipCallbacks:(uarpChipCallbacks *)a3;
- (void)setUarpContext:(void *)a3;
- (void)writeData:(id)a3;
@end

@implementation AppleTypeCRetimerUARPHardwareIDQuerier

- (AppleTypeCRetimerUARPHardwareIDQuerier)initWithDeviceHandle:(id)a3 captureFileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUARPHardwareIDQuerier;
  v8 = -[AppleTypeCRetimerUARPHardwareIDQuerier init](&v20, sel_init);
  if (!v8) {
    goto LABEL_3;
  }
  os_log_t v9 = os_log_create("com.apple.accessoryupdater.atcrt", "uarp");
  log = v8->_log;
  v8->_log = v9;

  [v6 name];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 copy];
  name = v8->_name;
  v8->_name = (NSString *)v12;

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  querySemaphore = v8->_querySemaphore;
  v8->_querySemaphore = (OS_dispatch_semaphore *)v14;

  uint64_t v16 = [MEMORY[0x189603F48] data];
  nonce = v8->_nonce;
  v8->_nonce = (NSData *)v16;

  v18 = 0LL;
  if (-[AppleTypeCRetimerUARPHardwareIDQuerier initUARPWithDeviceHandle:captureFileName:]( v8,  "initUARPWithDeviceHandle:captureFileName:",  v6,  v7))
  {
LABEL_3:
    v18 = v8;
  }

  return v18;
}

- (void)dealloc
{
  uarpContext = (uint64_t *)self->_uarpContext;
  if (uarpContext)
  {
    UarpRestoreFinalizeEndpoint(uarpContext);
    self->_uarpContext = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUARPHardwareIDQuerier;
  -[AppleTypeCRetimerUARPHardwareIDQuerier dealloc](&v4, sel_dealloc);
}

- (id)queryHardwareID
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (-[AppleTypeCRetimerIICFifo checkReady](self->_fifo, "checkReady"))
  {
    int v12 = 6;
    v11[0] = xmmword_1895874C0;
    v11[1] = unk_1895874D0;
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    unsigned int v3 = UarpRestoreInfoQueries((dispatch_queue_t *)self->_uarpContext, 0LL, 0, v11, 9);
    if (!v3)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_querySemaphore, 0xFFFFFFFFFFFFFFFFLL);
      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      os_log_t v9 = objc_alloc(&OBJC_CLASS___AppleTypeCRetimerHardwareID);
      LOBYTE(v10) = self->_chipRev;
      id v7 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:]( v9,  "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:",  LOWORD(self->_chipID),  LOWORD(self->_boardID),  LOBYTE(self->_securityEpoch),  LOBYTE(self->_productionMode),  LOBYTE(self->_securityMode),  LOBYTE(self->_securityDomain),  self->_ecid,  self->_nonce,  v10);
      return v7;
    }

    unsigned int v4 = v3;
    -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
    v5 = uarpStatusCodeToString(v4);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerUARPHardwareIDQuerier queryHardwareID].cold.1((uint64_t)self, (uint64_t)v5, log);
    }
  }

  id v7 = 0LL;
  return v7;
}

- (BOOL)initUARPWithDeviceHandle:(id)a3 captureFileName:(id)a4
{
  id v6 = a3;
  id v7 = (void *)NSString;
  p_name = (uint64_t *)&self->_name;
  name = self->_name;
  id v10 = a4;
  [v7 stringWithFormat:@"com.apple.%@.uarp.hw_id", name];
  memset(&v21[6], 0, 32);
  uint64_t v22 = 0LL;
  v21[5] = *(_OWORD *)&off_18A3C2B98;
  v21[0] = xmmword_18A3C2B48;
  id v11 = memset(&v21[1], 0, 64);
  int v12 = (const char *)[v11 UTF8String];
  id v13 = v10;
  [v13 UTF8String];

  dispatch_semaphore_t v14 = UarpRestoreInitializeEndpoint(0LL, (uint64_t)self, (uint64_t)v21, v12);
  if (v14)
  {
    v15 = -[AppleTypeCRetimerIICFifo initWithDeviceHandle:queueLabelSuffix:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIICFifo),  "initWithDeviceHandle:queueLabelSuffix:",  v6,  @"uarp_querier");
    fifo = self->_fifo;
    self->_fifo = v15;

    -[AppleTypeCRetimerIICFifo setDelegate:](self->_fifo, "setDelegate:", self);
    id v17 = [NSString stringWithFormat:@"com.apple.%@.hw_id_fifo_delegate", self->_name];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    -[AppleTypeCRetimerIICFifo setDelegateQueue:](self->_fifo, "setDelegateQueue:", v18);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerUARPHardwareIDQuerier initUARPWithDeviceHandle:captureFileName:].cold.1(p_name, log);
    }
  }

  return v14 != 0LL;
}

- (void)setUarpChipCallbacks:(uarpChipCallbacks *)a3
{
  self->_uarpChipCallbacks = *a3;
}

- (void)setUarpContext:(void *)a3
{
  self->_uarpContext = (_UARPSiliconContext *)a3;
}

- (void)writeData:(id)a3
{
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (void)setECID:(unint64_t)a3
{
  self->_ecid = a3;
}

- (void)setSecurityDomain:(unsigned int)a3
{
  self->_securityDomain = a3;
}

- (void)setSecurityMode:(unsigned int)a3
{
  self->_securityMode = a3;
}

- (void)setProductionMode:(unsigned int)a3
{
  self->_productionMode = a3;
}

- (void)setNonce:(id)a3
{
}

- (void)setChipRev:(unsigned int)a3
{
  self->_chipRev = a3;
}

- (void)setSecurityEpoch:(unsigned int)a3
{
  self->_securityEpoch = a3;
}

- (void)queryComplete
{
}

- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4
{
  fRestoreDataRecv = (void (*)(_UARPSiliconContext *, AppleTypeCRetimerUARPHardwareIDQuerier *, uint64_t, uint64_t))self->_uarpChipCallbacks.fRestoreDataRecv;
  if (fRestoreDataRecv)
  {
    uarpContext = self->_uarpContext;
    id v10 = fRestoreDataRecv;
    id v7 = a4;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];

    v10(uarpContext, self, v8, v9);
  }

- (void)appleTypeCRetimerIICFifoTransferError:(id)a3 error:(id)a4
{
  id v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerUARPHardwareIDQuerier appleTypeCRetimerIICFifoTransferError:error:].cold.1( (uint64_t)self,  (uint64_t)v5,  log);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_querySemaphore);
}

- (void).cxx_destruct
{
}

- (void)queryHardwareID
{
  *(_DWORD *)unsigned int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0( &dword_189540000,  a2,  a3,  "%@: Failed to start query (%s)",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)initUARPWithDeviceHandle:(uint64_t *)a1 captureFileName:(os_log_s *)a2 .cold.1( uint64_t *a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl( &dword_189540000,  a2,  OS_LOG_TYPE_ERROR,  "%@: Failed to initialize UARP endpoint for querying the hardware ID",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)appleTypeCRetimerIICFifoTransferError:(os_log_s *)a3 error:.cold.1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0( &dword_189540000,  a2,  a3,  "%@: HW ID Querier FIFO transfer error (%@)",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

@end
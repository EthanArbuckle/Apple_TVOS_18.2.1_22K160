@interface AppleTypeCRetimerDFU
- (AppleTypeCRetimerDFU)dfuWithFTAB:(id)a3 forcePersonalize:(BOOL)a4;
- (AppleTypeCRetimerDFU)initWithRouterID:(unsigned __int8)a3 route:(unint64_t)a4 port:(unsigned int)a5 space:(unsigned int)a6 baudRate:(unsigned int)a7;
- (AppleTypeCRetimerDFUDelegate)delegate;
- (BOOL)b2pDataSessionOpenForSessionID:(unsigned __int8)a3;
- (BOOL)configReadForIndex:(unsigned int)a3 result:(unsigned int *)a4;
- (BOOL)configReadMetadata:(unsigned int *)a3 opCode:(unsigned __int16)a4;
- (BOOL)configWriteForIndex:(unsigned int)a3 value:(unsigned int)a4;
- (BOOL)configWriteMetadata:(unsigned int)a3 opCode:(unsigned __int16)a4;
- (BOOL)dfuBoot;
- (BOOL)dfuValidate;
- (BOOL)enableUART;
- (BOOL)findBaseAddress;
- (BOOL)performRouterOperationWithOpCode:(unsigned __int16)a3 metadata:(unsigned int *)a4 dWordBuffer:(unsigned int *)a5 dWordCount:(unsigned int)a6 returnStatus:(unsigned int *)a7;
- (BOOL)pingChip;
- (BOOL)queryChipIdentification;
- (BOOL)queryManifestForFTAB:(id)a3;
- (BOOL)receivedCommand:(id)a3;
- (BOOL)registerReadForVendorIndex:(unsigned int)a3 result:(unsigned int *)a4;
- (BOOL)registerWriteForVendorIndex:(unsigned int)a3 value:(unsigned int)a4;
- (BOOL)sendDFUImage:(const char *)a3 length:(unsigned int)a4;
- (BOOL)sendManifest;
- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4;
- (BOOL)transferDataBuffer:(const char *)a3 length:(unsigned int)a4 sessionID:(unsigned __int8)a5;
- (BOOL)verifyRouterIsNotEnumerated;
- (BOOL)waitForCurrentRouterOperationToComplete:(unsigned int *)a3;
- (BOOL)writeData:(id)a3;
- (NSString)aceInfo;
- (id)convertDWordsToData:(unsigned int *)a3 bytes:(unsigned int)a4;
- (id)convertDwordToData:(unsigned int)a3 bytes:(unsigned int)a4;
- (id)queryHardwareID;
- (id)queue;
- (id)readData;
- (id)sendB2PCommand:(id)a3 responseClass:(Class)a4;
- (id)sendDataSessionConnectCommandForSessionID:(unsigned __int8)a3 state:(int)a4;
- (id)sendDataSessionDataCommandForSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5;
- (id)sendIdentificationCommand;
- (id)sendPingCommand;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unsigned)bytesAvailableToRead;
- (unsigned)convertBytesToDword:(const char *)a3 length:(unsigned int)a4;
- (unsigned)maxB2PFrameSize;
- (unsigned)registerIndexForVendorIndex:(unsigned int)a3;
- (void)b2pReset:(int)a3;
- (void)bytesAvailableToRead;
- (void)convertBytesToDwords:(const char *)a3 length:(unsigned int)a4 dWordBuffer:(unsigned int *)a5;
- (void)dataTransferUpdateForBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4 sessionID:(unsigned __int8)a5;
- (void)dfuBoot;
- (void)dfuValidate;
- (void)enableUART;
- (void)findBaseAddress;
- (void)pollForB2PResponseForCommand:(id)a3;
- (void)readData;
- (void)receivedResponse:(id)a3;
- (void)sendIdentificationCommand;
- (void)sendPingCommand;
- (void)setDelegate:(id)a3;
- (void)setMaxB2PFrameSize:(unsigned int)a3;
- (void)verifyRouterIsNotEnumerated;
@end

@implementation AppleTypeCRetimerDFU

- (AppleTypeCRetimerDFU)initWithRouterID:(unsigned __int8)a3 route:(unint64_t)a4 port:(unsigned int)a5 space:(unsigned int)a6 baudRate:(unsigned int)a7
{
  uint64_t v11 = a3;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerDFU;
  v12 = -[AppleTypeCRetimerDFU init](&v32, sel_init);
  if (!v12) {
    goto LABEL_4;
  }
  os_log_t v13 = os_log_create("com.apple.accessoryupdater.atcrt", "dfu");
  log = v12->_log;
  v12->_log = v13;

  v15 = -[ThunderboltInterface initWithRouterID:]( objc_alloc(&OBJC_CLASS___ThunderboltInterface),  "initWithRouterID:",  v11);
  tbtInterface = v12->_tbtInterface;
  v12->_tbtInterface = v15;

  if (v12->_tbtInterface)
  {
    dispatch_queue_t v17 = dispatch_queue_create("RT13 B2P Queue", 0LL);
    b2pQueue = v12->_b2pQueue;
    v12->_b2pQueue = (OS_dispatch_queue *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
    b2pSemaphore = v12->_b2pSemaphore;
    v12->_b2pSemaphore = (OS_dispatch_semaphore *)v19;

    v21 = -[B2PEngine initWithDelegate:](objc_alloc(&OBJC_CLASS___B2PEngine), "initWithDelegate:", v12);
    b2p = v12->_b2p;
    v12->_b2p = v21;

    -[B2PEngine setMaxTransmitAttempts:](v12->_b2p, "setMaxTransmitAttempts:", 5LL);
    v12->_maxB2PFrameSize = 51;
    v12->_route = a4;
    v12->_port = a5;
    v12->_space = a6;
    v12->_baudRate = a7;
LABEL_4:
    v23 = v12;
    goto LABEL_8;
  }

  v24 = v12->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:].cold.1(v11, v24, v25, v26, v27, v28, v29, v30);
  }
  v23 = 0LL;
LABEL_8:

  return v23;
}

- (BOOL)configReadForIndex:(unsigned int)a3 result:(unsigned int *)a4
{
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = -[ThunderboltInterface configReadForRoute:port:space:index:result:]( self->_tbtInterface,  "configReadForRoute:port:space:index:result:",  self->_route,  self->_port,  self->_space,  *(void *)&a3,  a4);
  if (v7) {
    -[ThunderboltPacketDumper dumpATCConfigRegisterRead:value:]( self->_dumper,  "dumpATCConfigRegisterRead:value:",  v5,  *a4);
  }
  return v7;
}

- (BOOL)configReadMetadata:(unsigned int *)a3 opCode:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  BOOL v7 = -[ThunderboltInterface configReadForRoute:port:space:index:result:]( self->_tbtInterface,  "configReadForRoute:port:space:index:result:",  self->_route,  self->_port,  self->_space,  25LL,  a3);
  if (v7) {
    -[ThunderboltPacketDumper dumpATCMetadataRead:opCode:](self->_dumper, "dumpATCMetadataRead:opCode:", *a3, v4);
  }
  return v7;
}

- (BOOL)registerReadForVendorIndex:(unsigned int)a3 result:(unsigned int *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = -[AppleTypeCRetimerDFU registerIndexForVendorIndex:](self, "registerIndexForVendorIndex:");
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 1LL);
  BOOL v8 = -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", v7, a4);
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 0LL);
  if (v8) {
    -[ThunderboltPacketDumper dumpATCRegisterRead:value:](self->_dumper, "dumpATCRegisterRead:value:", v5, *a4);
  }
  return v8;
}

- (BOOL)configWriteForIndex:(unsigned int)a3 value:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = -[ThunderboltInterface configWriteForRoute:port:space:index:value:]( self->_tbtInterface,  "configWriteForRoute:port:space:index:value:",  self->_route,  self->_port,  self->_space,  *(void *)&a3,  *(void *)&a4);
  if (v7) {
    -[ThunderboltPacketDumper dumpATCConfigRegisterWrite:value:]( self->_dumper,  "dumpATCConfigRegisterWrite:value:",  v5,  v4);
  }
  return v7;
}

- (BOOL)configWriteMetadata:(unsigned int)a3 opCode:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = -[ThunderboltInterface configWriteForRoute:port:space:index:value:]( self->_tbtInterface,  "configWriteForRoute:port:space:index:value:",  self->_route,  self->_port,  self->_space,  25LL,  *(void *)&a3);
  if (v7) {
    -[ThunderboltPacketDumper dumpATCMetadataWrite:opCode:](self->_dumper, "dumpATCMetadataWrite:opCode:", v5, v4);
  }
  return v7;
}

- (BOOL)registerWriteForVendorIndex:(unsigned int)a3 value:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = -[AppleTypeCRetimerDFU registerIndexForVendorIndex:](self, "registerIndexForVendorIndex:");
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 1LL);
  BOOL v8 = -[AppleTypeCRetimerDFU configWriteForIndex:value:](self, "configWriteForIndex:value:", v7, v4);
  -[ThunderboltPacketDumper setSuppressed:](self->_dumper, "setSuppressed:", 0LL);
  if (v8) {
    -[ThunderboltPacketDumper dumpATCRegisterWrite:value:](self->_dumper, "dumpATCRegisterWrite:value:", v5, v4);
  }
  return v8;
}

- (BOOL)waitForCurrentRouterOperationToComplete:(unsigned int *)a3
{
  unsigned int v8 = 0;
  -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 26LL, &v8);
  unsigned int v5 = v8;
  if ((v8 & 0x80000000) != 0)
  {
    uint64_t v7 = 500LL;
    while (1)
    {
      sleepMS(10);
      -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 26LL, &v8);
      unsigned int v5 = v8;
      if ((v8 & 0x80000000) == 0) {
        break;
      }
      if (!--v7) {
        return 0;
      }
    }
  }

  if (a3) {
    *a3 = v5;
  }
  return 1;
}

- (BOOL)performRouterOperationWithOpCode:(unsigned __int16)a3 metadata:(unsigned int *)a4 dWordBuffer:(unsigned int *)a5 dWordCount:(unsigned int)a6 returnStatus:(unsigned int *)a7
{
  if (a6 < 0x11)
  {
    uint64_t v13 = a3;
    if (-[AppleTypeCRetimerDFU waitForCurrentRouterOperationToComplete:]( self,  "waitForCurrentRouterOperationToComplete:",  0LL))
    {
      if (-[AppleTypeCRetimerDFU configWriteMetadata:opCode:](self, "configWriteMetadata:opCode:", *a4, v13))
      {
        if (a6)
        {
          uint64_t v14 = 0LL;
          while (-[AppleTypeCRetimerDFU configWriteForIndex:value:]( self,  "configWriteForIndex:value:",  (v14 + 9),  a5[v14]))
          {
            if (a6 == ++v14) {
              goto LABEL_10;
            }
          }

          BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.7();
            goto LABEL_36;
          }
        }

        else
        {
LABEL_10:
          unsigned int v17 = v13 | 0x80000000;
          if (-[AppleTypeCRetimerDFU configWriteForIndex:value:](self, "configWriteForIndex:value:", 26LL))
          {
            if (-[AppleTypeCRetimerDFU waitForCurrentRouterOperationToComplete:]( self,  "waitForCurrentRouterOperationToComplete:",  &v17))
            {
              if ((v17 & 0x40000000) != 0)
              {
                BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
                if (v9)
                {
                  -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.4();
                  goto LABEL_36;
                }
              }

              else
              {
                *a7 = HIBYTE(v17) & 0x3F;
                if (-[AppleTypeCRetimerDFU configReadMetadata:opCode:](self, "configReadMetadata:opCode:", a4, v13))
                {
                  LOBYTE(v9) = 1;
                  if ((_DWORD)v13 != 32770 && a6)
                  {
                    uint64_t v15 = 0LL;
                    while (-[AppleTypeCRetimerDFU configReadForIndex:result:]( self,  "configReadForIndex:result:",  (v15 + 9),  a5))
                    {
                      ++v15;
                      ++a5;
                      LOBYTE(v9) = 1;
                      if (a6 == v15) {
                        return v9;
                      }
                    }

                    BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
                    if (v9)
                    {
                      -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.2();
                      goto LABEL_36;
                    }
                  }
                }

                else
                {
                  BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
                  if (v9)
                  {
                    -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.3();
                    goto LABEL_36;
                  }
                }
              }
            }

            else
            {
              BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
              if (v9)
              {
                -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.5();
                goto LABEL_36;
              }
            }
          }

          else
          {
            BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
            if (v9)
            {
              -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.6();
              goto LABEL_36;
            }
          }
        }
      }

      else
      {
        BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
        if (v9)
        {
          -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.8();
          goto LABEL_36;
        }
      }
    }

    else
    {
      BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.9();
        goto LABEL_36;
      }
    }
  }

  else
  {
    BOOL v9 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:].cold.1();
LABEL_36:
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)pingChip
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)queryChipIdentification
{
  BOOL v3 = (B2PIdentificationResponse *)objc_claimAutoreleasedReturnValue();
  idResponse = self->_idResponse;
  self->_idResponse = v3;

  return self->_idResponse != 0LL;
}

- (BOOL)queryManifestForFTAB:(id)a3
{
  id v4 = a3;
  [v4 manifest];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x189603F48];
    [v4 manifest];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 dataPointer];
    [v4 manifest];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataWithBytes:length:", v8, objc_msgSend(v9, "dataLength"));
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    manifestData = self->_manifestData;
    self->_manifestData = v10;
    uint64_t v14 = v10;

    LOBYTE(v15) = 1;
    return v15;
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = -[B2PIdentificationResponse hardwareID](self->_idResponse, "hardwareID");
  [WeakRetained generateManifestForFTAB:v4 hardwareID:v12 apParameters:0];
  v10 = (NSData *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    goto LABEL_4;
  }
  log = self->_log;
  BOOL v15 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    -[AppleTypeCRetimerDFU queryManifestForFTAB:].cold.1(log, v17, v18, v19, v20, v21, v22, v23);
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)dataTransferUpdateForBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4 sessionID:(unsigned __int8)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  if (a5 == 5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained manifestBytesSent:v6 bytesTotal:v5];
  }

  else
  {
    if (a5 != 4) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dfuImageBytesSent:v6 bytesTotal:v5];
  }
}

- (BOOL)transferDataBuffer:(const char *)a3 length:(unsigned int)a4 sessionID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = *(void *)&a4;
  -[AppleTypeCRetimerDFU dataTransferUpdateForBytesSent:bytesTotal:sessionID:]( self,  "dataTransferUpdateForBytesSent:bytesTotal:sessionID:",  0LL);
  if (!(_DWORD)v6) {
    return 1;
  }
  LODWORD(v9) = 0;
  unsigned int v10 = v6;
  while (1)
  {
    unsigned int maxB2PFrameSize = self->_maxB2PFrameSize;
    uint64_t v12 = v10 >= maxB2PFrameSize ? maxB2PFrameSize : v10;
    [MEMORY[0x189603F48] dataWithBytes:a3 length:v12];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[AppleTypeCRetimerDFU sendDataSessionDataCommandForSessionID:status:data:]( self,  "sendDataSessionDataCommandForSessionID:status:data:",  v5,  0LL,  v13);
    if (!v14) {
      break;
    }
    BOOL v15 = (void *)v14;
    v10 -= v12;
    a3 += v12;
    uint64_t v9 = (v12 + v9);
    -[AppleTypeCRetimerDFU dataTransferUpdateForBytesSent:bytesTotal:sessionID:]( self,  "dataTransferUpdateForBytesSent:bytesTotal:sessionID:",  v9,  v6,  v5);

    if (!v10) {
      return 1;
    }
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:].cold.1(log, v18, v19, v20, v21, v22, v23, v24);
  }

  return 0;
}

- (BOOL)b2pDataSessionOpenForSessionID:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:]( self,  "sendDataSessionConnectCommandForSessionID:state:",  a3,  1LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }

  if ([v5 state] != 1)
  {
    stringForB2PDataSessionID(v3);
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:].cold.1();
    }
    goto LABEL_6;
  }

  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)sendDFUImage:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  LODWORD(v7) = -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:](self, "b2pDataSessionOpenForSessionID:", 4LL);
  if ((_DWORD)v7)
  {
    LODWORD(v7) = -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:]( self,  "transferDataBuffer:length:sessionID:",  a3,  v4,  4LL);
    if ((_DWORD)v7)
    {
      id v7 =  -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:]( self,  "sendDataSessionConnectCommandForSessionID:state:",  4LL,  0LL);
      LOBYTE(v7) = 1;
    }
  }

  return (char)v7;
}

- (BOOL)sendManifest
{
  LODWORD(v3) = -[AppleTypeCRetimerDFU b2pDataSessionOpenForSessionID:](self, "b2pDataSessionOpenForSessionID:", 5LL);
  if ((_DWORD)v3)
  {
    LODWORD(v3) = -[AppleTypeCRetimerDFU transferDataBuffer:length:sessionID:]( self,  "transferDataBuffer:length:sessionID:",  -[NSData bytes](self->_manifestData, "bytes"),  -[NSData length](self->_manifestData, "length"),  5LL);
    if ((_DWORD)v3)
    {
      id v3 =  -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:]( self,  "sendDataSessionConnectCommandForSessionID:state:",  5LL,  0LL);
      LOBYTE(v3) = 1;
    }
  }

  return (char)v3;
}

- (BOOL)dfuValidate
{
  id v3 = objc_alloc_init(&OBJC_CLASS___B2PDFUValidateCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4 && ![v4 status])
  {
    BOOL v14 = 1;
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU dfuValidate].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)dfuBoot
{
  id v3 = objc_alloc_init(&OBJC_CLASS___B2PDFUBootCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4 && ![v4 status])
  {
    BOOL v14 = 1;
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU dfuBoot].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (AppleTypeCRetimerDFU)dfuWithFTAB:(id)a3 forcePersonalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bverString];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:].cold.2((uint64_t)v7, log);
    }
  }

  [v6 subfileWithTag:@"rrko"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uint64_t v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_20;
  }

  if (!-[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated](self, "verifyRouterIsNotEnumerated")
    || !-[AppleTypeCRetimerDFU findBaseAddress](self, "findBaseAddress")
    || !-[AppleTypeCRetimerDFU enableUART](self, "enableUART")
    || (id v10 = -[AppleTypeCRetimerDFU readData](self, "readData"),
        !-[AppleTypeCRetimerDFU pingChip](self, "pingChip"))
    || !-[AppleTypeCRetimerDFU queryChipIdentification](self, "queryChipIdentification")
    || (-[B2PIdentificationResponse securityMode](self->_idResponse, "securityMode") || v4)
    && !-[AppleTypeCRetimerDFU queryManifestForFTAB:](self, "queryManifestForFTAB:", v6)
    || !-[AppleTypeCRetimerDFU sendDFUImage:length:]( self,  "sendDFUImage:length:",  [v9 dataPointer],  objc_msgSend(v9, "dataLength"))
    || self->_manifestData && !-[AppleTypeCRetimerDFU sendManifest](self, "sendManifest")
    || !-[AppleTypeCRetimerDFU dfuValidate](self, "dfuValidate"))
  {
LABEL_20:
    uint64_t v11 = 0LL;
    goto LABEL_21;
  }

  uint64_t v11 = (AppleTypeCRetimerDFU *)-[AppleTypeCRetimerDFU dfuBoot](self, "dfuBoot");
LABEL_21:

  return v11;
}

- (BOOL)findBaseAddress
{
  unsigned int v7 = 1;
  if (-[ThunderboltInterface findCapabilityForRoute:port:space:mask:value:offset:]( self->_tbtInterface,  "findCapabilityForRoute:port:space:mask:value:offset:",  self->_route,  self->_port,  self->_space,  65280LL,  1280LL,  &v7))
  {
    int v6 = 0;
    BOOL v3 = -[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", v7, &v6);
    if (v3)
    {
      unsigned int v4 = v7;
      if (!HIBYTE(v6)) {
        unsigned int v4 = v7 + 1;
      }
      self->_dfuBaseAddress = v4;
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[AppleTypeCRetimerDFU findBaseAddress].cold.1();
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU findBaseAddress].cold.2();
    }
    return 0;
  }

  return v3;
}

- (BOOL)enableUART
{
  BOOL v3 = -[AppleTypeCRetimerDFU registerWriteForVendorIndex:value:]( self,  "registerWriteForVendorIndex:value:",  15LL,  (2 * self->_baudRate) | 1);
  if (!v3 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerDFU enableUART].cold.1();
  }
  return v3;
}

- (unsigned)registerIndexForVendorIndex:(unsigned int)a3
{
  return self->_dfuBaseAddress + a3;
}

- (BOOL)verifyRouterIsNotEnumerated
{
  if (!-[AppleTypeCRetimerDFU configReadForIndex:result:](self, "configReadForIndex:result:", 3LL, &v5))
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated].cold.2();
    goto LABEL_9;
  }

  if (v5 < 0)
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated].cold.1();
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }

  LOBYTE(v3) = 1;
  return v3;
}

- (unsigned)bytesAvailableToRead
{
  int v4 = 0;
  if (-[AppleTypeCRetimerDFU registerReadForVendorIndex:result:](self, "registerReadForVendorIndex:result:", 17LL, &v4)) {
    return HIWORD(v4) & 0x7FFF;
  }
  unsigned int result = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
  if (result)
  {
    -[AppleTypeCRetimerDFU bytesAvailableToRead].cold.1();
    return 0;
  }

  return result;
}

- (unsigned)convertBytesToDword:(const char *)a3 length:(unsigned int)a4
{
  if (!a4) {
    return 0;
  }
  unsigned int result = *(unsigned __int8 *)a3;
  if (a4 != 1)
  {
    result |= *((unsigned __int8 *)a3 + 1) << 8;
    if (a4 >= 3)
    {
      result |= *((unsigned __int8 *)a3 + 2) << 16;
      if (a4 != 3) {
        result |= *((unsigned __int8 *)a3 + 3) << 24;
      }
    }
  }

  return result;
}

- (void)convertBytesToDwords:(const char *)a3 length:(unsigned int)a4 dWordBuffer:(unsigned int *)a5
{
  if (a4)
  {
    unsigned int v6 = a4;
    do
    {
      if (v6 >= 4) {
        uint64_t v9 = 4LL;
      }
      else {
        uint64_t v9 = v6;
      }
      *a5++ = -[AppleTypeCRetimerDFU convertBytesToDword:length:](self, "convertBytesToDword:length:", a3, v9);
      a3 += v9;
      v6 -= v9;
    }

    while (v6);
  }

- (BOOL)writeData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unsigned int v5 = [v4 length];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  if (v5)
  {
    uint64_t v9 = v7;
    *(void *)&__int128 v8 = 136315650LL;
    __int128 v24 = v8;
    while (1)
    {
      memset(v32, 0, sizeof(v32));
      uint64_t v10 = v5 >= 0x40 ? 64LL : v5;
      uint64_t v25 = 0LL;
      -[AppleTypeCRetimerDFU convertBytesToDwords:length:dWordBuffer:]( self,  "convertBytesToDwords:length:dWordBuffer:",  v9,  v10,  v32,  v24);
      HIDWORD(v25) |= v10;
      if (!-[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:]( self,  "performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:",  32770LL,  (char *)&v25 + 4,  v32,  16LL,  &v25)) {
        break;
      }
      if (self->_dumper)
      {
        [MEMORY[0x189603F48] dataWithBytes:v9 length:v10];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ThunderboltPacketDumper dumpATCRouterOperationWithOpCode:data:]( self->_dumper,  "dumpATCRouterOperationWithOpCode:data:",  32770LL,  v11);
      }

      if ((_DWORD)v25)
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[AppleTypeCRetimerDFU writeData:].cold.1();
        }
        goto LABEL_20;
      }

      int v12 = BYTE5(v25);
      if (BYTE5(v25) <= v10)
      {
        LODWORD(v10) = BYTE5(v25);
      }

      else
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v24;
          uint64_t v27 = "-[AppleTypeCRetimerDFU writeData:]";
          __int16 v28 = 1024;
          int v29 = v12;
          __int16 v30 = 1024;
          int v31 = v10;
          _os_log_error_impl( &dword_189540000,  log,  OS_LOG_TYPE_ERROR,  "%s: Wrote more bytes than asked! (%u > %u)",  buf,  0x18u);
        }
      }

      v9 += v10;
      v5 -= v10;
      if (!v5) {
        goto LABEL_15;
      }
    }

    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU writeData:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
LABEL_20:
    BOOL v14 = 0;
  }

  else
  {
LABEL_15:
    self->_bytesSent += [v6 length];
    BOOL v14 = 1;
  }

  return v14;
}

- (id)readData
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FB8] data];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v4 = -[AppleTypeCRetimerDFU bytesAvailableToRead](self, "bytesAvailableToRead");
  if (v4)
  {
    LODWORD(v6) = v4;
    *(void *)&__int128 v5 = 136315650LL;
    __int128 v20 = v5;
    while (1)
    {
      memset(v29, 0, sizeof(v29));
      uint64_t v6 = v6 >= 0x40 ? 64LL : v6;
      int v21 = 0;
      int v22 = v6;
      if (!-[AppleTypeCRetimerDFU performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:]( self,  "performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:",  32771LL,  &v22,  v29,  16LL,  &v21,  v20)) {
        break;
      }
      if (v21)
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[AppleTypeCRetimerDFU readData].cold.1();
        }
        goto LABEL_18;
      }

      int v7 = BYTE1(v22);
      if (BYTE1(v22) <= v6)
      {
        uint64_t v6 = BYTE1(v22);
      }

      else
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          __int128 v24 = "-[AppleTypeCRetimerDFU readData]";
          __int16 v25 = 1024;
          int v26 = v7;
          __int16 v27 = 1024;
          int v28 = v6;
          _os_log_error_impl( &dword_189540000,  log,  OS_LOG_TYPE_ERROR,  "%s: Read more bytes than asked! (%u > %u)",  buf,  0x18u);
        }
      }

      -[AppleTypeCRetimerDFU convertDWordsToData:bytes:](self, "convertDWordsToData:bytes:", v29, v6);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 appendData:v9];
      -[ThunderboltPacketDumper dumpATCRouterOperationWithOpCode:data:]( self->_dumper,  "dumpATCRouterOperationWithOpCode:data:",  32771LL,  v9);
      LODWORD(v6) = -[AppleTypeCRetimerDFU bytesAvailableToRead](self, "bytesAvailableToRead");

      if (!(_DWORD)v6) {
        goto LABEL_18;
      }
    }

    uint64_t v10 = self->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU readData].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

- (id)convertDwordToData:(unsigned int)a3 bytes:(unsigned int)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (a4)
  {
    char v13 = a3;
    [v6 appendBytes:&v13 length:1];
    if (a4 != 1)
    {
      char v12 = BYTE1(a3);
      [v7 appendBytes:&v12 length:1];
      if (a4 >= 3)
      {
        char v11 = BYTE2(a3);
        [v7 appendBytes:&v11 length:1];
        if (a4 != 3)
        {
          char v10 = HIBYTE(a3);
          [v7 appendBytes:&v10 length:1];
        }
      }
    }
  }

  [MEMORY[0x189603F48] dataWithData:v7];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)convertDWordsToData:(unsigned int *)a3 bytes:(unsigned int)a4
{
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  while (a4)
  {
    if (a4 >= 4) {
      uint64_t v8 = 4LL;
    }
    else {
      uint64_t v8 = a4;
    }
    unsigned int v9 = *a3++;
    -[AppleTypeCRetimerDFU convertDwordToData:bytes:](self, "convertDwordToData:bytes:", v9, v8);
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendData:v10];
    a4 -= v8;
  }

  [MEMORY[0x189603F48] dataWithData:v7];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sendB2PCommand:(id)a3 responseClass:(Class)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (self->_b2pCommandInFlight)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:].cold.2(log, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    b2pQueue = self->_b2pQueue;
    uint64_t v17 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke;
    block[3] = &unk_18A3C12E8;
    objc_super v32 = &v33;
    block[4] = self;
    id v18 = v5;
    id v31 = v18;
    dispatch_sync((dispatch_queue_t)b2pQueue, block);
    if (*((_BYTE *)v34 + 24))
    {
      dispatch_get_global_queue(0LL, 0LL);
      uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v28[1] = 3221225472LL;
      v28[2] = __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke_11;
      v28[3] = &unk_18A3C1310;
      v28[4] = self;
      id v29 = v18;
      dispatch_async(v19, v28);

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_b2pSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v15 = self->_b2pResponse;
      }
      else {
        uint64_t v15 = 0LL;
      }
    }

    else
    {
      __int128 v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:].cold.1((uint64_t)v18, v20, v21, v22, v23, v24, v25, v26);
      }
      uint64_t v15 = 0LL;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v15;
}

uint64_t __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) sendCommand:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unsigned int v4 = *(void **)(v3 + 88);
    *(void *)(v3 + 88) = 0LL;

    *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 1;
    uint64_t result = [*(id *)(a1 + 40) opCode];
    *(_WORD *)(*(void *)(a1 + 32) + 66LL) = result;
  }

  return result;
}

uint64_t __53__AppleTypeCRetimerDFU_sendB2PCommand_responseClass___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) pollForB2PResponseForCommand:*(void *)(a1 + 40)];
}

- (void)pollForB2PResponseForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  uint64_t v5 = MEMORY[0x1895F87A8];
  do
  {
    sleepMS(2);
    b2pQueue = self->_b2pQueue;
    block[0] = v5;
    block[1] = 3221225472LL;
    block[2] = __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke;
    block[3] = &unk_18A3C1338;
    block[4] = self;
    id v7 = v4;
    id v9 = v7;
    uint64_t v10 = &v11;
    dispatch_sync((dispatch_queue_t)b2pQueue, block);
    LODWORD(b2pQueue) = *((unsigned __int8 *)v12 + 24);
  }

  while (!(_DWORD)b2pQueue);
  _Block_object_dispose(&v11, 8);
}

uint64_t __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(_BYTE *)(result + 104))
  {
    [(id)result readData];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = v3;
    if (v3)
    {
      *(void *)(*(void *)(a1 + 32) + 160) += [v3 length];
      [*(id *)(*(void *)(a1 + 32) + 56) receiveData:v4];
    }

    uint64_t result = *(void *)(a1 + 32);
  }

  if (!*(void *)(result + 88))
  {
    if (!*(_BYTE *)(result + 104)) {
      return result;
    }
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 104))
  {
LABEL_9:
    uint64_t v5 = *(os_log_s **)(result + 24);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }
    uint64_t result = *(void *)(a1 + 32);
  }

  *(_BYTE *)(result + 64) = 0;
  *(_WORD *)(*(void *)(a1 + 32) + 66LL) = 0;
  uint64_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 80LL));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  return result;
}

- (id)sendPingCommand
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___B2PPingCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU sendPingCommand].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v4;
}

- (id)sendIdentificationCommand
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___B2PIdentificationCommand);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v3, objc_opt_class());
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU sendIdentificationCommand].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v4;
}

- (id)sendDataSessionConnectCommandForSessionID:(unsigned __int8)a3 state:(int)a4
{
  unsigned int v5 = a3;
  uint64_t v7 = -[B2PDataSessionConnectCommand initWithSessionID:state:]( objc_alloc(&OBJC_CLASS___B2PDataSessionConnectCommand),  "initWithSessionID:state:",  a3,  *(void *)&a4);
  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v7, objc_opt_class());
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    stringForB2PDataSessionID(v5);
    stringForB2PDataSessionState(a4);
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerDFU sendDataSessionConnectCommandForSessionID:state:].cold.1();
    }
  }

  return v8;
}

- (id)sendDataSessionDataCommandForSessionID:(unsigned __int8)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = a3;
  id v8 = a5;
  uint64_t v9 = -[B2PDataSessionDataCommand initWithSessionID:status:data:]( objc_alloc(&OBJC_CLASS___B2PDataSessionDataCommand),  "initWithSessionID:status:data:",  v6,  v5,  v8);

  -[AppleTypeCRetimerDFU sendB2PCommand:responseClass:](self, "sendB2PCommand:responseClass:", v9, objc_opt_class());
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queue
{
  return self->_b2pQueue;
}

- (void)receivedResponse:(id)a3
{
  id v5 = a3;
  if (self->_b2pCommandInFlight)
  {
    id v7 = v5;
    BOOL v6 = self->_b2pOpCodeInFlight + 1 == [v5 opCode];
    id v5 = v7;
    if (v6)
    {
      objc_storeStrong((id *)&self->_b2pResponse, a3);
      id v5 = v7;
    }
  }
}

- (BOOL)receivedCommand:(id)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerDFU receivedCommand:].cold.1(log, v4, v5, v6, v7, v8, v9, v10);
  }
  return 0;
}

- (void)b2pReset:(int)a3
{
  self->_b2pReset = 1;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerDFU b2pReset:].cold.1();
  }
}

- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4
{
  return 0;
}

- (id)queryHardwareID
{
  if (-[AppleTypeCRetimerDFU verifyRouterIsNotEnumerated](self, "verifyRouterIsNotEnumerated")
    && -[AppleTypeCRetimerDFU findBaseAddress](self, "findBaseAddress")
    && -[AppleTypeCRetimerDFU enableUART](self, "enableUART")
    && (id v3 = -[AppleTypeCRetimerDFU readData](self, "readData"),
        -[AppleTypeCRetimerDFU queryChipIdentification](self, "queryChipIdentification")))
  {
    -[B2PIdentificationResponse hardwareID](self->_idResponse, "hardwareID");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

- (NSString)aceInfo
{
  return (NSString *)objc_getProperty(self, a2, 136LL, 1);
}

- (AppleTypeCRetimerDFUDelegate)delegate
{
  return (AppleTypeCRetimerDFUDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)maxB2PFrameSize
{
  return self->_maxB2PFrameSize;
}

- (void)setMaxB2PFrameSize:(unsigned int)a3
{
  self->_unsigned int maxB2PFrameSize = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void).cxx_destruct
{
}

- (void)initWithRouterID:(uint64_t)a3 route:(uint64_t)a4 port:(uint64_t)a5 space:(uint64_t)a6 baudRate:(uint64_t)a7 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.1()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.2()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.3()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.4()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.5()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.6()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.7()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.8()
{
}

- (void)performRouterOperationWithOpCode:metadata:dWordBuffer:dWordCount:returnStatus:.cold.9()
{
}

- (void)queryManifestForFTAB:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)transferDataBuffer:(uint64_t)a3 length:(uint64_t)a4 sessionID:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)b2pDataSessionOpenForSessionID:.cold.1()
{
}

- (void)dfuValidate
{
}

- (void)dfuBoot
{
}

- (void)dfuWithFTAB:(uint64_t)a3 forcePersonalize:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)dfuWithFTAB:(uint64_t)a1 forcePersonalize:(os_log_s *)a2 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_189540000, a2, OS_LOG_TYPE_DEBUG, "DFUing verson: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)findBaseAddress
{
}

- (void)enableUART
{
}

- (void)verifyRouterIsNotEnumerated
{
}

- (void)bytesAvailableToRead
{
}

- (void)writeData:.cold.1()
{
  OUTLINED_FUNCTION_6(&dword_189540000, v0, v1, "%s: write operation returned %u", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)writeData:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)readData
{
}

- (void)sendB2PCommand:(uint64_t)a3 responseClass:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)sendB2PCommand:(uint64_t)a3 responseClass:(uint64_t)a4 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __53__AppleTypeCRetimerDFU_pollForB2PResponseForCommand___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)sendPingCommand
{
}

- (void)sendIdentificationCommand
{
}

- (void)sendDataSessionConnectCommandForSessionID:state:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( &dword_189540000,  v2,  OS_LOG_TYPE_ERROR,  "%s: No response received for data session connect command (session=%s, state=%s)",  (uint8_t *)v3,  0x20u);
}

- (void)receivedCommand:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)b2pReset:.cold.1()
{
}

@end
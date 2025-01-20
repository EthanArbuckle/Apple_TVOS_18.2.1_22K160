@interface AppleTypeCRetimerUARPUpdaterInstance
- (AppleTypeCRetimerUARPUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5;
- (BOOL)allocateACE;
- (BOOL)allocateUpdaterDFU;
- (BOOL)applyFirmware;
- (BOOL)checkForVersionMatch:(BOOL *)a3 withBver:(id)a4;
- (BOOL)initUARP;
- (BOOL)performDfuUpdateForSuperBinary:(id)a3 withManifestData:(id)a4;
- (BOOL)performUpdateForSuperBinaryData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7 bver:(id)a8;
- (BOOL)printVersions;
- (BOOL)startAppModeUpdateForSuperBinaryData:(id)a3;
- (BOOL)useLocalSigning;
- (NSString)name;
- (id)createChipSpecificSuperBinaryDataForStockSuperBinary:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6;
- (id)description;
- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5;
- (id)queryHardwareID;
- (id)queryPanicStatus:(id *)a3;
- (unsigned)routerID;
- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4;
- (void)appleTypeCRetimerIICFifoTransferError:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)dfuImageBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)firmwareApplyCompleteWithStatus:(unsigned int)a3 flags:(unsigned int)a4;
- (void)firmwareBytesTransferred:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)firmwareStagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4;
- (void)manifestBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)setUarpChipCallbacks:(uarpChipCallbacks *)a3;
- (void)setUarpContext:(void *)a3;
- (void)writeData:(id)a3;
@end

@implementation AppleTypeCRetimerUARPUpdaterInstance

- (AppleTypeCRetimerUARPUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v6 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUARPUpdaterInstance;
  v9 = -[AppleTypeCRetimerUARPUpdaterInstance init](&v25, sel_init);
  v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  objc_storeWeak((id *)&v9->_delegate, v8);
  v10->_routerID = v6;
  v10->_useLocalSigning = 1;
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s%u", "uatcrt", v6);
  name = v10->_name;
  v10->_name = (NSString *)v11;

  v13 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIICDeviceHandle),  "initWithRouterID:namePrefix:",  v10->_routerID,  @"uatcrt");
  deviceHandle = v10->_deviceHandle;
  v10->_deviceHandle = v13;

  if (v10->_deviceHandle)
  {
    if (-[AppleTypeCRetimerUARPUpdaterInstance allocateACE](v10, "allocateACE"))
    {
      *(void *)&v10->_nextDFUFirmwareProgressReportPercentThreshold = 0xA0000000ALL;
      v10->_nextUpdateProgressReportPercentThreshold = 10;
      if (v5)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
        [WeakRetained log:@"Updater instance forcing power on for %@", v10->_name];

        if (-[ACE retimerForcePower](v10->_ace, "retimerForcePower"))
        {
          id v16 = objc_loadWeakRetained((id *)&v10->_delegate);
          [v16 log:@"Failed to force power on for %@ during Updater instance initialization", v10->_name];

          id v24 = 0LL;
          uint64_t v17 = -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](v10, "queryPanicStatus:", &v24);
          id v18 = v24;
          panicStatus = v10->_panicStatus;
          v10->_panicStatus = (AppleTypeCRetimerPanicStatus *)v17;

          if (!v10->_panicStatus)
          {
            id v20 = objc_loadWeakRetained((id *)&v10->_delegate);
            [v20 log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUARPUpdaterInstance initWithRouterID:delegate:forcePower:]", v10->_name, v18];
          }

          goto LABEL_10;
        }
      }

      else
      {
        v10->_dfuCheckHasRun = 1;
      }

      v10->_powerForced = 1;
LABEL_13:
      v22 = v10;
      goto LABEL_14;
    }
  }

  else
  {
    id v21 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v21 log:@"Failed to allocate device handle for %@ during Updater instance initialization", v10->_name];
  }

- (void)dealloc
{
  if (self->_dfuUpdater) {
    -[ACE retimerExitForceDFU](self->_ace, "retimerExitForceDFU");
  }
  if (self->_powerForced && !self->_stageSuccess) {
    -[ACE retimerRemoveForcePower](self->_ace, "retimerRemoveForcePower");
  }
  uarpContext = (uint64_t *)self->_uarpContext;
  if (uarpContext)
  {
    UarpRestoreFinalizeEndpoint(uarpContext);
    self->_uarpContext = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUARPUpdaterInstance;
  -[AppleTypeCRetimerUARPUpdaterInstance dealloc](&v4, sel_dealloc);
}

- (BOOL)allocateACE
{
  v3 = -[ACE initWithRouterID:](objc_alloc(&OBJC_CLASS___ACE), "initWithRouterID:", self->_routerID);
  ace = self->_ace;
  self->_ace = v3;

  BOOL v5 = self->_ace;
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to locate ACE for %@", self];
  }

  return v5 != 0LL;
}

- (BOOL)allocateUpdaterDFU
{
  v3 = -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerDFU),  "initWithRouterID:route:port:space:baudRate:",  self->_routerID,  0LL,  0LL,  2LL,  921600LL);
  dfuUpdater = self->_dfuUpdater;
  self->_dfuUpdater = v3;

  BOOL v5 = self->_dfuUpdater;
  if (v5)
  {
    -[AppleTypeCRetimerDFU setDelegate:](self->_dfuUpdater, "setDelegate:", self);
    -[AppleTypeCRetimerDFU setMaxB2PFrameSize:](self->_dfuUpdater, "setMaxB2PFrameSize:", 1011LL);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to create DFU updater for %@", self];
  }

  return v5 != 0LL;
}

- (id)queryHardwareID
{
  v3 = -[AppleTypeCRetimerUARPHardwareIDQuerier initWithDeviceHandle:captureFileName:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerUARPHardwareIDQuerier),  "initWithDeviceHandle:captureFileName:",  self->_deviceHandle,  0LL);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained log:@"%@: Attempting to query hardware ID via UARP.", self->_name];

  uint64_t v5 = -[AppleTypeCRetimerUARPHardwareIDQuerier queryHardwareID](v3, "queryHardwareID");
  if (!v5)
  {
    id v19 = 0LL;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v19);
    id v8 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    id v9 = v19;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v8;

    if (!self->_panicStatus)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      [v11 log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", v12, v9];
    }

    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 log:@"%s: IIC hardware ID query failed for %@.", "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", self];

    if (self->_dfuCheckHasRun)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      [v14 log:@"%s: Falling back to DFU mode for %@.", "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", v15];

      if (-[AppleTypeCRetimerUARPUpdaterInstance allocateUpdaterDFU](self, "allocateUpdaterDFU"))
      {
        uint64_t v16 = -[AppleTypeCRetimerDFU queryHardwareID](self->_dfuUpdater, "queryHardwareID");
        if (v16)
        {
          unsigned int v6 = (void *)v16;

          goto LABEL_3;
        }

        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 log:@"%s: Unable to query hardware ID in DFU mode for %@.", "-[AppleTypeCRetimerUARPUpdaterInstance queryHardwareID]", self];
      }
    }

    unsigned int v6 = 0LL;
    goto LABEL_12;
  }

  unsigned int v6 = (void *)v5;
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 log:@"%@: UARP hardware ID check succeeded.", self->_name];

LABEL_3:
  self->_useLocalSigning = [v6 requiresPersonalization] ^ 1;
LABEL_12:

  return v6;
}

- (id)createChipSpecificSuperBinaryDataForStockSuperBinary:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"FIRM");
  [v10 payloadWith4ccTag:v13];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    unint64_t v33 = a6;
    if ([v11 length]) {
      [v14 setManifest:v11];
    }
    id v34 = v11;
    v15 = -[AppleTypeCRetimerBoardIDFile initWithBoardID:chipID:portNumber:securityDomain:]( [AppleTypeCRetimerBoardIDFile alloc],  "initWithBoardID:chipID:portNumber:securityDomain:",  [v12 boardID],  (unsigned __int16)objc_msgSend(v12, "chipID"),  self->_routerID,  objc_msgSend(v12, "securityDomain"));
    uint64_t v16 = objc_alloc(&OBJC_CLASS___FTABSubfile);
    -[AppleTypeCRetimerBoardIDFile tag](v15, "tag");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerBoardIDFile data](v15, "data");
    v32 = self;
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = -[FTABSubfile initWithTag:data:](v16, "initWithTag:data:", v17, v18);

    -[FTABSubfile data](v19, "data");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABSubfile tag](v19, "tag");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 addSubfile:v20 tag:v21];

    unint64_t v35 = v33;
    [MEMORY[0x189603F48] dataWithBytes:&v35 length:8];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[FTABSubfile initWithTag:data:]( objc_alloc(&OBJC_CLASS___FTABSubfile),  "initWithTag:data:",  @"dbgb",  v22);
    -[FTABSubfile data](v23, "data");
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABSubfile tag](v23, "tag");
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 addSubfile:v24 tag:v25];

    [v10 generatePersonalizedSuperBinary];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v32->_delegate);
      [WeakRetained log:@"Failed to generate updated super binary for %@", v32];
    }

    id v11 = v34;
  }

  else
  {
    id v29 = objc_loadWeakRetained((id *)&self->_delegate);
    [v29 log:@"Failed to locate firmware super binary payload when updating super binary"];

    v27 = 0LL;
  }

  return v27;
}

- (BOOL)performUpdateForSuperBinaryData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7 bver:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a3;
  id v18 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinary),  "initWithData:delegate:delegateQueue:",  v17,  0LL,  0LL);

  if (v18)
  {
    -[AppleTypeCRetimerUARPUpdaterInstance createChipSpecificSuperBinaryDataForStockSuperBinary:manifestData:apHardwareID:debugFlags:]( self,  "createChipSpecificSuperBinaryDataForStockSuperBinary:manifestData:apHardwareID:debugFlags:",  v18,  v14,  v15,  a7);
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      LOBYTE(v22) = 0;
LABEL_19:

      goto LABEL_20;
    }

    id v20 = -[UARPSuperBinary initWithData:delegate:delegateQueue:]( objc_alloc(&OBJC_CLASS___UARPSuperBinary),  "initWithData:delegate:delegateQueue:",  v19,  0LL,  0LL);
    if (v20)
    {
      if (!self->_dfuUpdater)
      {
        if (!v10) {
          goto LABEL_15;
        }
        char v29 = 0;
        BOOL v22 = -[AppleTypeCRetimerUARPUpdaterInstance checkForVersionMatch:withBver:]( self,  "checkForVersionMatch:withBver:",  &v29,  v16);
        if (v22)
        {
          if (!v29) {
            goto LABEL_15;
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
          objc_super v25 = (void *)objc_claimAutoreleasedReturnValue();
          [WeakRetained log:@"Skipping update for %@ because it already has this firmware version.", v25];
        }

- (BOOL)performDfuUpdateForSuperBinary:(id)a3 withManifestData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained log:@"%@: Performing DFU", v9];

  BOOL v10 = -[UARPAssetTag initWithString:](objc_alloc(&OBJC_CLASS___UARPAssetTag), "initWithString:", @"RRKO");
  [v7 payloadWith4ccTag:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v11 payloadData];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      id v13 = (FTABFile *)objc_loadWeakRetained((id *)&self->_delegate);
      -[FTABFile log:](v13, "log:", @"Failed to locate RRKO data");
      BOOL v18 = 0;
LABEL_14:

      goto LABEL_15;
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___FTABFile);
    if (-[FTABFile addSubfileWithTagName:subfileData:](v13, "addSubfileWithTagName:subfileData:", @"rrko", v12))
    {
      if (v6) {
        -[FTABFile setManifest:](v13, "setManifest:", v6);
      }
      int v14 = (int)-[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:]( self->_dfuUpdater,  "dfuWithFTAB:forcePersonalize:",  v13,  0LL);
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      id v16 = v15;
      if (v14)
      {
        -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 log:@"%s: DFU complete for %@", "-[AppleTypeCRetimerUARPUpdaterInstance performDfuUpdateForSuperBinary:withManifestData:]", v17];

        BOOL v18 = 1;
LABEL_13:

        goto LABEL_14;
      }

      id v21 = "-[AppleTypeCRetimerUARPUpdaterInstance performDfuUpdateForSuperBinary:withManifestData:]";
      BOOL v22 = self;
      id v19 = @"%s: DFU failed for %@";
    }

    else
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      id v16 = v15;
      id v19 = @"Failed to add RRKO data to FTAB";
    }

    objc_msgSend(v15, "log:", v19, v21, v22);
    BOOL v18 = 0;
    goto LABEL_13;
  }

  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 log:@"Failed to locate RRKO payload in super binary"];
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)startAppModeUpdateForSuperBinaryData:(id)a3
{
  id v4 = a3;
  if (-[AppleTypeCRetimerUARPUpdaterInstance initUARP](self, "initUARP"))
  {
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    uarpContext = self->_uarpContext;
    id v6 = v4;
    id v7 = (const void *)[v6 bytes];
    size_t v8 = [v6 length];
    unsigned int v14 = UarpRestoreStageFirmwareDataBuffer((uint64_t)uarpContext, v7, v8, v9, v10, v11, v12, v13);
    if (!v14)
    {
      BOOL v17 = 1;
      goto LABEL_6;
    }

    unsigned int v15 = v14;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"%s: Failed to start UARP update for %@ (%s)", "-[AppleTypeCRetimerUARPUpdaterInstance startAppModeUpdateForSuperBinaryData:]", self, uarpStatusCodeToString(v15)];
  }

  BOOL v17 = 0;
LABEL_6:

  return v17;
}

- (BOOL)checkForVersionMatch:(BOOL *)a3 withBver:(id)a4
{
  id v6 = a4;
  id v7 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIIC),  "initWithDeviceHandle:",  self->_deviceHandle);
  -[AppleTypeCRetimerIICBase bverString](v7, "bverString");
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *a3 = [v6 isEqualToString:v8];
  }

  else
  {
    id v16 = 0LL;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v16);
    uint64_t v9 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    id v10 = v16;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v9;

    if (!self->_panicStatus)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [WeakRetained log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUARPUpdaterInstance checkForVersionMatch:withBver:]", v13, v10];
    }

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 log:@"Version match: Failed to query chip Bver for %@", self];
  }

  return v8 != 0LL;
}

- (BOOL)applyFirmware
{
  BOOL v3 = -[AppleTypeCRetimerUARPUpdaterInstance initUARP](self, "initUARP");
  if (v3)
  {
    -[AppleTypeCRetimerIICFifo start](self->_fifo, "start");
    unsigned int v4 = UarpRestoreApplyStagedAssets((dispatch_queue_t *)self->_uarpContext);
    if (v4)
    {
      uint64_t v5 = uarpStatusCodeToString(v4);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained log:@"%s: Failed to start firmware apply for %@ (%s)", "-[AppleTypeCRetimerUARPUpdaterInstance applyFirmware]", self, v5];

      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      LOBYTE(v3) = 0;
    }

    else
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 log:@"%@: Waiting for UARP apply to complete...", self->_name];

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_uarpSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 log:@"%@: Continuing after UARP apply has completed.", self->_name];

      -[AppleTypeCRetimerIICFifo stop](self->_fifo, "stop");
      LOBYTE(v3) = self->_applySuccess;
    }
  }

  return v3;
}

- (BOOL)printVersions
{
  BOOL v3 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIIC),  "initWithDeviceHandle:",  self->_deviceHandle);
  -[AppleTypeCRetimerIICBase bverString](v3, "bverString");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[AppleTypeCRetimerIICBase internalFirmwareVersion](v3, "internalFirmwareVersion");
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (v7)
  {
    id v16 = 0LL;
    -[AppleTypeCRetimerUARPUpdaterInstance queryPanicStatus:](self, "queryPanicStatus:", &v16);
    id v10 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
    id v9 = v16;
    panicStatus = self->_panicStatus;
    self->_panicStatus = v10;

    if (!self->_panicStatus)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [WeakRetained log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUARPUpdaterInstance printVersions]", v13, v9];
    }

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 log:@"%s: Failed to query new firmware version for %@", "-[AppleTypeCRetimerUARPUpdaterInstance printVersions]", self];
  }

  else
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 log:@"%@: New firmware version %@ (%@)", self->_name, v4, v6];
  }

  return v8;
}

- (id)description
{
  BOOL v3 = (void *)NSString;
  -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ panicState=%d assertID=%u>", v4, -[AppleTypeCRetimerPanicStatus fwPanic](self->_panicStatus, "fwPanic"), -[AppleTypeCRetimerPanicStatus assertID](self->_panicStatus, "assertID")];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queryPanicStatus:(id *)a3
{
  unsigned int v4 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIIC),  "initWithDeviceHandle:",  self->_deviceHandle);
  -[AppleTypeCRetimerIICBase queryRetimerPanicStatus:](v4, "queryRetimerPanicStatus:", a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dfuImageBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUFirmwareProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: DFU firmware transfer: %u%%", v7, v4];

    self->_nextDFUFirmwareProgressReportPercentThreshold = v4 + 10;
  }

- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5
{
  return 0LL;
}

- (void)manifestBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUManifestProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: DFU manifest transfer: %u%%", v7, v4];

    self->_nextDFUManifestProgressReportPercentThreshold = v4 + 10;
  }

- (BOOL)initUARP
{
  if (self->_uarpInitialized) {
    return 1;
  }
  [NSString stringWithFormat:@"com.apple.%@.uarp", self->_name];
  uint64_t v14 = 0LL;
  v13[2] = xmmword_18A3C1590;
  v13[3] = *(_OWORD *)&off_18A3C15A0;
  memset(&v13[4], 0, 64);
  v13[0] = xmmword_18A3C1570;
  id v4 = v13[1] = unk_18A3C1580;
  uint64_t v5 = UarpRestoreInitializeEndpoint(0, (uint64_t)self, (uint64_t)v13, (const char *)[v4 UTF8String]);
  BOOL v2 = v5 != 0LL;
  if (v5)
  {
    id v6 = -[AppleTypeCRetimerIICFifo initWithDeviceHandle:queueLabelSuffix:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIICFifo),  "initWithDeviceHandle:queueLabelSuffix:",  self->_deviceHandle,  @"updater_instance");
    fifo = self->_fifo;
    self->_fifo = v6;

    -[AppleTypeCRetimerIICFifo setDelegate:](self->_fifo, "setDelegate:", self);
    id WeakRetained = [NSString stringWithFormat:@"com.apple.%@.fifo_delegate", self->_name];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[WeakRetained UTF8String], 0);
    -[AppleTypeCRetimerIICFifo setDelegateQueue:](self->_fifo, "setDelegateQueue:", v9);

    id v10 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    uarpSemaphore = self->_uarpSemaphore;
    self->_uarpSemaphore = v10;

    self->_uarpInitialized = 1;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Failed to initialize UARP endpoint for %@", self];
  }

  return v2;
}

- (void)firmwareBytesTransferred:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUARPUpdaterInstance name](self, "name");
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: Update: %u%%", v7, v4];

    self->_nextUpdateProgressReportPercentThreshold = v4 + 10;
  }

- (void)firmwareStagingCompleteWithStatus:(unsigned int)a3 reason:(unsigned int)a4
{
  if (a3 == 1)
  {
    self->_stageSuccess = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"%@: Firmware staging complete.", self->_name, v10, v11, v12, v13];
  }

  else
  {
    uint64_t v6 = *(void *)&a4;
    uint64_t v7 = *(void *)&a3;
    BOOL v8 = uarpProcessingStatusToString((unsigned __int16)a3);
    uint64_t v9 = uarpProcessingFlagsToString((unsigned __int16)v6);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"%@: Firmware staging failed. Status: 0x%08x (%s), Reason: 0x%08x (%s)", self->_name, v7, v8, v6, v9];
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
}

- (void)firmwareApplyCompleteWithStatus:(unsigned int)a3 flags:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v6 = *(void *)&a3;
    uint64_t v7 = uarpStatusCodeToString(a3);
    uint64_t v8 = uarpProcessingFlagsToString((unsigned __int16)v5);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"%@: Firmware apply failed. Status: 0x%08x (%s), Flags 0x%08x (%s)", self->_name, v6, v7, v5, v8];
  }

  else
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 log:@"%@: Firmware apply complete", self->_name];

    self->_applySuccess = 1;
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
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

- (void)appleTypeCRetimerIICFifo:(id)a3 receivedData:(id)a4
{
  fRestoreDataRecv = (void (*)(_UARPSiliconContext *, AppleTypeCRetimerUARPUpdaterInstance *, uint64_t, uint64_t))self->_uarpChipCallbacks.fRestoreDataRecv;
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
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained log:@"%@: FIFO transfer error (%@)", self->_name, v6];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_uarpSemaphore);
}

- (unsigned)routerID
{
  return self->_routerID;
}

- (BOOL)useLocalSigning
{
  return self->_useLocalSigning;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void).cxx_destruct
{
}

@end
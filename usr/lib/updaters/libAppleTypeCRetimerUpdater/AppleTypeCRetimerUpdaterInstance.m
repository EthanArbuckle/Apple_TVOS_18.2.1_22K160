@interface AppleTypeCRetimerUpdaterInstance
- (AppleTypeCRetimerUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5;
- (BOOL)allocateACE;
- (BOOL)allocateUpdaterDFU;
- (BOOL)allocateUpdaterIIC;
- (BOOL)checkForVersionMatch:(BOOL *)a3;
- (BOOL)generateFTABForData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6;
- (BOOL)performUpdateDFU;
- (BOOL)performUpdateForFTABData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7;
- (BOOL)performUpdateIIC;
- (BOOL)shouldResetAfterUpdate;
- (BOOL)useLocalSigning;
- (NSString)name;
- (id)description;
- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5;
- (id)queryHardwareID;
- (unsigned)routerID;
- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)dealloc;
- (void)dfuImageBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)manifestBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)performReset;
- (void)printVersions;
@end

@implementation AppleTypeCRetimerUpdaterInstance

- (AppleTypeCRetimerUpdaterInstance)initWithRouterID:(unsigned __int8)a3 delegate:(id)a4 forcePower:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUpdaterInstance;
  v9 = -[AppleTypeCRetimerUpdaterInstance init](&v23, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_13:
    v15 = v10;
    goto LABEL_14;
  }

  objc_storeWeak((id *)&v9->_delegate, v8);
  v10->_routerID = a3;
  v10->_useLocalSigning = 1;
  if (-[AppleTypeCRetimerUpdaterInstance allocateACE](v10, "allocateACE")
    && -[AppleTypeCRetimerUpdaterInstance allocateUpdaterIIC](v10, "allocateUpdaterIIC"))
  {
    *(void *)&v10->_nextDFUFirmwareProgressReportPercentThreshold = 0xA0000000ALL;
    v10->_nextUpdateProgressReportPercentThreshold = 10;
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s%u", "atcrt", v10->_routerID);
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
      [WeakRetained log:@"Updater instance forcing power on for %@", v10->_name];

      if (-[ACE retimerForcePower](v10->_ace, "retimerForcePower"))
      {
        id v14 = objc_loadWeakRetained((id *)&v10->_delegate);
        [v14 log:@"Failed to force power on for %@ during Updater instance initialization", v10->_name];
      }

      else
      {
        v10->_powerForced = 1;
        iicUpdater = v10->_iicUpdater;
        id v22 = 0LL;
        uint64_t v17 = -[AppleTypeCRetimerUpdaterIIC queryPanicStatus:](iicUpdater, "queryPanicStatus:", &v22);
        id v18 = v22;
        panicStatus = v10->_panicStatus;
        v10->_panicStatus = (AppleTypeCRetimerPanicStatus *)v17;

        if (!v10->_panicStatus)
        {
          id v20 = objc_loadWeakRetained((id *)&v10->_delegate);
          [v20 log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUpdaterInstance initWithRouterID:delegate:forcePower:]", v10->_name, v18];
        }
      }
    }

    else
    {
      *(_WORD *)&v10->_powerForced = 257;
    }

    v10->_skipUpdates = 0;
    goto LABEL_13;
  }

  v15 = 0LL;
LABEL_14:

  return v15;
}

- (void)dealloc
{
  if (self->_dfuUpdater) {
    -[ACE retimerExitForceDFU](self->_ace, "retimerExitForceDFU");
  }
  if (self->_powerForced) {
    -[ACE retimerRemoveForcePower](self->_ace, "retimerRemoveForcePower");
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUpdaterInstance;
  -[AppleTypeCRetimerUpdaterInstance dealloc](&v3, sel_dealloc);
}

- (id)queryHardwareID
{
  iicUpdater = self->_iicUpdater;
  id v19 = 0LL;
  v4 = -[AppleTypeCRetimerUpdaterIIC queryHardwareID:](iicUpdater, "queryHardwareID:", &v19);
  id v5 = v19;
  if (v4) {
    goto LABEL_2;
  }
  v6 = self->_iicUpdater;
  id v18 = 0LL;
  -[AppleTypeCRetimerUpdaterIIC queryPanicStatus:](v6, "queryPanicStatus:", &v18);
  v7 = (AppleTypeCRetimerPanicStatus *)objc_claimAutoreleasedReturnValue();
  id v8 = v18;
  panicStatus = self->_panicStatus;
  self->_panicStatus = v7;

  if (!self->_panicStatus)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%s: IIC panic query failed for %@ (%@), panicState and assertID might not reflect the current panic status", "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", v11, v8];
  }

  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  [v12 log:@"%s: IIC hardware ID query failed for %@ (%@).", "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", self, v5];

  if (!self->_dfuCheckHasRun
    || (id v13 = objc_loadWeakRetained((id *)&self->_delegate),
        -[AppleTypeCRetimerUpdaterInstance name](self, "name"),
        id v14 = (void *)objc_claimAutoreleasedReturnValue(),
        [v13 log:@"%s: Falling back to DFU mode for %@.", "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", v14],  v14,  v13,  !-[AppleTypeCRetimerUpdaterInstance allocateUpdaterDFU](self, "allocateUpdaterDFU")))
  {
LABEL_10:

    v4 = 0LL;
    goto LABEL_11;
  }

  uint64_t v15 = -[AppleTypeCRetimerDFU queryHardwareID](self->_dfuUpdater, "queryHardwareID");
  if (!v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 log:@"%s: Unable to query hardware ID in DFU mode for %@.", "-[AppleTypeCRetimerUpdaterInstance queryHardwareID]", self];

    goto LABEL_10;
  }

  v4 = (void *)v15;

LABEL_2:
  self->_skipUpdates = [v4 chipRev] == 0;
  self->_useLocalSigning = [v4 requiresPersonalization] ^ 1;
LABEL_11:

  return v4;
}

- (BOOL)generateFTABForData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 debugFlags:(unint64_t)a6
{
  v30[2] = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = -[FTABFile initWithData:](objc_alloc(&OBJC_CLASS___FTABFile), "initWithData:", v12);

  if (v13)
  {
    if ([v10 length]) {
      -[FTABFile setManifest:](v13, "setManifest:", v10);
    }
    id v28 = v10;
    id v14 = -[AppleTypeCRetimerBoardIDFile initWithBoardID:chipID:portNumber:securityDomain:]( [AppleTypeCRetimerBoardIDFile alloc],  "initWithBoardID:chipID:portNumber:securityDomain:",  [v11 boardID],  (unsigned __int16)objc_msgSend(v11, "chipID"),  self->_routerID,  objc_msgSend(v11, "securityDomain"));
    uint64_t v15 = objc_alloc(&OBJC_CLASS___FTABSubfile);
    -[AppleTypeCRetimerBoardIDFile tag](v14, "tag");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AppleTypeCRetimerBoardIDFile data](v14, "data");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = -[FTABSubfile initWithTag:data:](v15, "initWithTag:data:", v16, v17);

    unint64_t v29 = a6;
    [MEMORY[0x189603F48] dataWithBytes:&v29 length:8];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = -[FTABSubfile initWithTag:data:]( objc_alloc(&OBJC_CLASS___FTABSubfile),  "initWithTag:data:",  @"dbgb",  v19);
    v30[0] = v18;
    v30[1] = v20;
    [MEMORY[0x189603F18] arrayWithObjects:v30 count:2];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTABFile addSubfiles:](v13, "addSubfiles:", v21);

    -[FTABFile writeToData](v13, "writeToData");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v23 = -[FTABFile initWithData:](objc_alloc(&OBJC_CLASS___FTABFile), "initWithData:", v22);

    LOBYTE(v13) = v23 != 0LL;
    if (v23)
    {
      v24 = v23;
      ftab = self->_ftab;
      self->_ftab = v24;
    }

    else
    {
      ftab = objc_loadWeakRetained((id *)&self->_delegate);
      [ftab log:@"Failed to parse updated FTAB data"];
    }

    id v10 = v28;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Failed to parse FTAB file"];
  }

  return (char)v13;
}

- (BOOL)allocateACE
{
  objc_super v3 = -[ACE initWithRouterID:](objc_alloc(&OBJC_CLASS___ACE), "initWithRouterID:", self->_routerID);
  ace = self->_ace;
  self->_ace = v3;

  id v5 = self->_ace;
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to locate ACE for %@", self];
  }

  return v5 != 0LL;
}

- (BOOL)allocateUpdaterIIC
{
  objc_super v3 = -[AppleTypeCRetimerUpdaterIIC initWithRouterID:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerUpdaterIIC),  "initWithRouterID:",  self->_routerID);
  iicUpdater = self->_iicUpdater;
  self->_iicUpdater = v3;

  id v5 = self->_iicUpdater;
  if (v5)
  {
    -[AppleTypeCRetimerUpdaterIIC setDelegate:](self->_iicUpdater, "setDelegate:", self);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to create IIC updater for %@", self];
  }

  return v5 != 0LL;
}

- (BOOL)allocateUpdaterDFU
{
  objc_super v3 = -[AppleTypeCRetimerDFU initWithRouterID:route:port:space:baudRate:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerDFU),  "initWithRouterID:route:port:space:baudRate:",  self->_routerID,  0LL,  0LL,  2LL,  921600LL);
  dfuUpdater = self->_dfuUpdater;
  self->_dfuUpdater = v3;

  id v5 = self->_dfuUpdater;
  if (v5)
  {
    -[AppleTypeCRetimerDFU setDelegate:](self->_dfuUpdater, "setDelegate:", self);
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to create DFU updater for %@", self];
  }

  return v5 != 0LL;
}

- (BOOL)checkForVersionMatch:(BOOL *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained log:@"Unable to locate bver in FTAB."];
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }

  -[AppleTypeCRetimerUpdaterIIC bverString](self->_iicUpdater, "bverString");
  id WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  if (!WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 log:@"Unable to query chip Bver for %@", self];

    goto LABEL_6;
  }

  *a3 = [v5 isEqualToString:WeakRetained];
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)performUpdateForFTABData:(id)a3 manifestData:(id)a4 apHardwareID:(id)a5 skipSameVersion:(BOOL)a6 debugFlags:(unint64_t)a7
{
  if (!self->_skipUpdates)
  {
    BOOL v9 = a6;
    if (-[AppleTypeCRetimerUpdaterInstance generateFTABForData:manifestData:apHardwareID:debugFlags:]( self,  "generateFTABForData:manifestData:apHardwareID:debugFlags:",  a3,  a4,  a5,  a7)
      && -[AppleTypeCRetimerUpdaterInstance allocateACE](self, "allocateACE")
      && -[AppleTypeCRetimerUpdaterInstance allocateUpdaterIIC](self, "allocateUpdaterIIC"))
    {
      if (!self->_dfuUpdater)
      {
        if (v9)
        {
          char v13 = 0;
          LODWORD(v8) = -[AppleTypeCRetimerUpdaterInstance checkForVersionMatch:](self, "checkForVersionMatch:", &v13);
          if (!(_DWORD)v8) {
            return (char)v8;
          }
          if (v13)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            -[AppleTypeCRetimerUpdaterInstance name](self, "name");
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            [WeakRetained log:@"Skipping update for %@ because it already has this firmware version.", v12];

            return (char)v8;
          }
        }

- (BOOL)performUpdateDFU
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained log:@"Performing DFU for %@", v5];

  int v6 = (int)-[AppleTypeCRetimerDFU dfuWithFTAB:forcePersonalize:]( self->_dfuUpdater,  "dfuWithFTAB:forcePersonalize:",  self->_ftab,  0LL);
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  id v8 = v7;
  if (v6)
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 log:@"DFU complete for %@", v9];
  }

  else
  {
    [v7 log:@"DFU failed for %@", self];
  }

  return v6;
}

- (BOOL)shouldResetAfterUpdate
{
  return self->_dfuUpdater != 0LL;
}

- (BOOL)performUpdateIIC
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained log:@"%s: Starting updating for %@", "-[AppleTypeCRetimerUpdaterInstance performUpdateIIC]", v5];

  BOOL v6 = -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:](self->_iicUpdater, "updateWithFTAB:", self->_ftab);
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  id v8 = v7;
  if (v6)
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 log:@"Update complete for %@", v9];
  }

  else
  {
    [v7 log:@"%s: Update failed for %@", "-[AppleTypeCRetimerUpdaterInstance performUpdateIIC]", self];
  }

  return v6;
}

- (void)performReset
{
}

- (void)printVersions
{
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerUpdaterIIC internalFirmwareVersion](self->_iicUpdater, "internalFirmwareVersion");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7) {
    BOOL v5 = v3 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    [WeakRetained log:@"%s: Failed to query new firmware version for %@", "-[AppleTypeCRetimerUpdaterInstance printVersions]", self];
  }

  else
  {
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@ has new firmware version: %@ (%@)", v6, v7, v3];
  }
}

- (id)description
{
  objc_super v3 = (void *)NSString;
  v4 = -[AppleTypeCRetimerUpdaterInstance name](self, "name");
  [v3 stringWithFormat:@"<%@ panicState=%d assertID=%u>", v4, -[AppleTypeCRetimerPanicStatus fwPanic](self->_panicStatus, "fwPanic"), -[AppleTypeCRetimerPanicStatus assertID](self->_panicStatus, "assertID")];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dfuImageBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUFirmwareProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: DFU firmware transfer: %u%%", v7, v4];

    self->_nextDFUFirmwareProgressReportPercentThreshold = v4 + 10;
  }

- (void)manifestBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextDFUManifestProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: DFU manifest transfer: %u%%", v7, v4];

    self->_nextDFUManifestProgressReportPercentThreshold = v4 + 10;
  }

- (id)generateManifestForFTAB:(id)a3 hardwareID:(id)a4 apParameters:(id)a5
{
  return 0LL;
}

- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((float)((float)a3 / (float)a4) * 100.0);
  if (self->_nextUpdateProgressReportPercentThreshold <= v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[AppleTypeCRetimerUpdaterInstance name](self, "name");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained log:@"%@: Update: %u%%", v7, v4];

    self->_nextUpdateProgressReportPercentThreshold = v4 + 10;
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
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

@end
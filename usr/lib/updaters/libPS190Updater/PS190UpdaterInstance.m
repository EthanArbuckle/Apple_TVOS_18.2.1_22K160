@interface PS190UpdaterInstance
- (BOOL)complete;
- (BOOL)performUpdateForFirmwareFile:(id)a3 inputDict:(id)a4 skipSameVersion:(BOOL)a5;
- (BOOL)programOTPForDevice:(id)a3 withInputParameters:(id)a4;
- (BOOL)useLocalSigning;
- (PS190UpdaterInstance)initWithInstance:(id)a3 tag:(unsigned int)a4 delegate:(id)a5;
- (id)description;
- (id)findHandleAfterReset;
- (id)queryHardwareID;
- (unsigned)tag;
- (void)firmwareBlocksSent:(unsigned int)a3 blocksTotal:(unsigned int)a4;
- (void)firmwareBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)setUseLocalSigning:(BOOL)a3;
@end

@implementation PS190UpdaterInstance

- (PS190UpdaterInstance)initWithInstance:(id)a3 tag:(unsigned int)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PS190UpdaterInstance;
  v11 = -[PS190UpdaterInstance init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ps190Instance, a3);
    v12->_tag = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (id)queryHardwareID
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained log:@"%@: Querying hardware ID.", self->_ps190Instance];

  id v5 = -[PS190Instance findHandle](self->_ps190Instance, "findHandle");
  if (!v5)
  {
    v6 = (PS190Device *)objc_loadWeakRetained((id *)p_delegate);
    -[PS190Device log:](v6, "log:", @"Unable to locate PS190 handle.");
LABEL_19:
    id v13 = 0LL;
    goto LABEL_20;
  }

  v6 = -[PS190Device initWithHandle:](objc_alloc(&OBJC_CLASS___PS190Device), "initWithHandle:", v5);
  if (!-[PS190Device checkForBootFailure](v6, "checkForBootFailure"))
  {
    objc_super v14 = (PS190RecoveryDevice *)objc_loadWeakRetained((id *)p_delegate);
    v15 = v14;
    v16 = @"Boot failure check failed";
LABEL_11:
    -[PS190RecoveryDevice log:](v14, "log:", v16);
    v17 = v15;
LABEL_18:

    goto LABEL_19;
  }

  if (!-[PS190Device bootFailureDetected](v6, "bootFailureDetected"))
  {
    v11 = (PS190RecoveryDevice *)objc_loadWeakRetained((id *)p_delegate);
    id v13 =  -[PS190Device queryHardwareIDIncludingNonce:]( v6,  "queryHardwareIDIncludingNonce:",  -[PS190RecoveryDevice allowNonceQueries](v11, "allowNonceQueries"));
    goto LABEL_13;
  }

  v7 = PS190StringForErrorCode(-[PS190Device bootStatus](v6, "bootStatus"));
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v8, "log:", @"Detected boot failure 0x%02x (%s)", -[PS190Device bootStatus](v6, "bootStatus"), v7);

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v8) = [v9 recoveryModeSupported];

  id v10 = (PS190RecoveryDevice *)objc_loadWeakRetained((id *)p_delegate);
  v11 = v10;
  if ((v8 & 1) == 0)
  {
    -[PS190RecoveryDevice log:]( v10,  "log:",  @"Boot failure detected, but recovery mode is not supported for OTA updates.");
LABEL_17:
    v17 = v11;
    goto LABEL_18;
  }

  char v12 = -[PS190RecoveryDevice allowNonceQueries](v10, "allowNonceQueries");

  if ((v12 & 1) == 0)
  {
    objc_super v14 = (PS190RecoveryDevice *)objc_loadWeakRetained((id *)p_delegate);
    v15 = v14;
    v16 = @"Boot failure detected, but nonce queries are not allowed.";
    goto LABEL_11;
  }

  v11 = -[PS190RecoveryDevice initWithHandle:](objc_alloc(&OBJC_CLASS___PS190RecoveryDevice), "initWithHandle:", v5);
  if (!-[PS190Device hostAccessEnabled](v6, "hostAccessEnabled"))
  {
    id v20 = objc_loadWeakRetained((id *)p_delegate);
    [v20 log:@"Resetting to recovery mode."];

    if (-[PS190RecoveryDevice resetToRecoveryMode](v11, "resetToRecoveryMode"))
    {
      id v21 = -[PS190UpdaterInstance findHandleAfterReset](self, "findHandleAfterReset");
      id v22 = objc_loadWeakRetained((id *)p_delegate);
      v23 = v22;
      if (v21)
      {
        [v22 log:@"Device detected after reset."];

        v24 = -[PS190RecoveryDevice initWithHandle:]( objc_alloc(&OBJC_CLASS___PS190RecoveryDevice),  "initWithHandle:",  v21);
        if (-[PS190RecoveryDevice waitForHostAccessEnable](v24, "waitForHostAccessEnable"))
        {
          id v13 = -[PS190RecoveryDevice queryHardwareID](v24, "queryHardwareID");

          goto LABEL_8;
        }

        id v26 = objc_loadWeakRetained((id *)p_delegate);
        [v26 log:@"Failed to enable host access."];

        v23 = v21;
        goto LABEL_30;
      }

      v25 = @"Failed to locate device after reset.";
    }

    else
    {
      id v22 = objc_loadWeakRetained((id *)p_delegate);
      v23 = v22;
      v25 = @"Failed to reset to recovery mode.";
    }

    [v22 log:v25];
LABEL_30:

    goto LABEL_17;
  }

  id v13 = -[PS190RecoveryDevice queryHardwareID](v11, "queryHardwareID");
LABEL_8:
  self->_recoveryModeActive = 1;
  self->_startedFromRecoveryMode = 1;
LABEL_13:

  if (!v13)
  {
    id v18 = objc_loadWeakRetained((id *)p_delegate);
    [v18 log:@"Failed to query hardware ID"];
  }

  self->_needsOTPProgramming = [v13 needsOTPProgramming];
LABEL_20:

  return v13;
}

- (id)findHandleAfterReset
{
  if (-[PS190Instance type](self->_ps190Instance, "type") == 1)
  {
    sleep(2u);
    id v3 = -[PS190Instance findHandle](self->_ps190Instance, "findHandle");
  }

  else
  {
    unsigned int v4 = 0;
    do
    {
      sleepMS(500);
      id v3 = -[PS190Instance findHandle](self->_ps190Instance, "findHandle");
      if (v3) {
        break;
      }
      unsigned int v5 = v4 >> 2;
      v4 += 500;
    }

    while (v5 < 0x947);
  }

  return v3;
}

- (BOOL)programOTPForDevice:(id)a3 withInputParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = (void *)MGCopyAnswer();
  if (v9)
  {
    id v10 = (id)[v7 objectForKeyedSubscript:@"FirmwareData"];
    id v11 = (id)[v10 objectForKeyedSubscript:@"BoardID"];
    if (!v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend( WeakRetained,  "log:",  @"%s: Unable to locate board ID",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
LABEL_15:
      BOOL v22 = 0;
      goto LABEL_16;
    }

    id WeakRetained = (id)[v10 objectForKeyedSubscript:@"SecurityDomain"];
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = v13;
    if (WeakRetained)
    {
      [v13 log:@"Attempting to program OTP"];

      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 log:@"Setting production mode to %@", v9];

      char v16 = objc_msgSend(v8, "otpWriteProductionMode:", objc_msgSend(v9, "BOOLValue"));
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((v16 & 1) != 0)
      {
        objc_msgSend(v14, "log:", @"Setting board ID to 0x%x", objc_msgSend(v11, "unsignedIntValue"));

        char v17 = objc_msgSend(v8, "otpWriteBoardID:", objc_msgSend(v11, "unsignedIntValue"));
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        id v14 = v18;
        if ((v17 & 1) != 0)
        {
          [v18 log:@"Setting security domain to %@", WeakRetained];

          char v19 = objc_msgSend(v8, "otpWriteSecurityDomain:", objc_msgSend(WeakRetained, "unsignedCharValue"));
          id v20 = objc_loadWeakRetained((id *)&self->_delegate);
          id v21 = v20;
          if ((v19 & 1) != 0)
          {
            [v20 log:@"OTP programmed successfully. Resetting..."];

            [v8 resetToRecoveryMode];
            self->_needsOTPProgramming = 0;
            BOOL v22 = 1;
            sleep(1u);
LABEL_16:

            goto LABEL_17;
          }

          objc_msgSend( v20,  "log:",  @"%s: Failed to program security domain",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
          v23 = v21;
          goto LABEL_14;
        }

        objc_msgSend( v18,  "log:",  @"%s: Failed to program board ID",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
      }

      else
      {
        objc_msgSend( v14,  "log:",  @"%s: Failed to program OTP production mode",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
      }
    }

    else
    {
      objc_msgSend( v13,  "log:",  @"%s: Unable to locate security domain",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
    }

    v23 = v14;
LABEL_14:

    goto LABEL_15;
  }

  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend( v10,  "log:",  @"%s: Failed to query AP production status",  "-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]");
  BOOL v22 = 0;
LABEL_17:

  return v22;
}

- (BOOL)performUpdateForFirmwareFile:(id)a3 inputDict:(id)a4 skipSameVersion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = -[PS190Instance findHandle](self->_ps190Instance, "findHandle");
  if (!v10)
  {
    id WeakRetained = (PS190RecoveryDevice *)objc_loadWeakRetained((id *)&self->_delegate);
    -[PS190RecoveryDevice log:](WeakRetained, "log:", @"Unable to locate PS190 handle.");
LABEL_32:
    BOOL v12 = 0;
    goto LABEL_33;
  }

  if (!self->_needsOTPProgramming)
  {
    if (!self->_recoveryModeActive)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 log:@"%@: Attempting to update flash.", self->_ps190Instance];
LABEL_8:

      if (self->_recoveryModeActive)
      {
        id WeakRetained = -[PS190RecoveryDevice initWithHandle:]( objc_alloc(&OBJC_CLASS___PS190RecoveryDevice),  "initWithHandle:",  v10);
        -[PS190RecoveryDevice setDelegate:](WeakRetained, "setDelegate:", self);
        self->_loadToRAMPercentComplete = 0;
        if (!-[PS190RecoveryDevice loadFile:](WeakRetained, "loadFile:", v8))
        {
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          id v15 = v14;
          char v16 = @"Failed to load firmware from RAM.";
LABEL_31:
          [v14 log:v16];

          goto LABEL_32;
        }
      }

      else
      {
        id WeakRetained = -[PS190Device initWithHandle:](objc_alloc(&OBJC_CLASS___PS190Device), "initWithHandle:", v10);
        -[PS190RecoveryDevice setDelegate:](WeakRetained, "setDelegate:", self);
        if (v5 && !self->_startedFromRecoveryMode)
        {
          char v17 = (PS190Device *)(id)-[PS190RecoveryDevice queryAppFirmwareVersion]( WeakRetained,  "queryAppFirmwareVersion");
          id v18 = v17;
          if (v17
            && PS190RawAppFirmwareVersionsEqual( -[PS190Device version](v17, "version") & 0xFFFFFF,  [v8 version] & 0xFFFFFF))
          {
            id v19 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v19, "log:", @"Skipping firmware update, versions match.");

            BOOL v12 = 1;
            self->_complete = 1;
            goto LABEL_29;
          }
        }

        if ((-[PS190RecoveryDevice updateWithFile:](WeakRetained, "updateWithFile:", v8) & 1) == 0)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          id v15 = v14;
          char v16 = @"Failed to download firmware to flash.";
          goto LABEL_31;
        }

        if ((-[PS190RecoveryDevice commitWithReset](WeakRetained, "commitWithReset") & 1) == 0)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_delegate);
          id v15 = v14;
          char v16 = @"Failed to commit firmware to flash.";
          goto LABEL_31;
        }
      }

      id WeakRetained = (PS190RecoveryDevice *)-[PS190UpdaterInstance findHandleAfterReset](self, "findHandleAfterReset");
      if (WeakRetained)
      {
        id v18 = -[PS190Device initWithHandle:](objc_alloc(&OBJC_CLASS___PS190Device), "initWithHandle:", WeakRetained);
        if (-[PS190Device checkForBootFailure](v18, "checkForBootFailure"))
        {
          if (!-[PS190Device bootFailureDetected](v18, "bootFailureDetected"))
          {
            id v23 = -[PS190Device queryAppFirmwareVersion](v18, "queryAppFirmwareVersion");
            id v21 = v23;
            if (v23)
            {
              if (PS190RawAppFirmwareVersionsEqual( [v23 version] & 0xFFFFFF,  objc_msgSend(v8, "version") & 0xFFFFFF))
              {
                if (!self->_recoveryModeActive)
                {
                  id v27 = objc_loadWeakRetained((id *)&self->_delegate);
                  [v27 log:@"Firmware restored successfully."];

                  BOOL v12 = 1;
                  self->_complete = 1;
                  goto LABEL_28;
                }

                if (self->_needsOTPProgramming)
                {
                  if (!-[PS190UpdaterInstance programOTPForDevice:withInputParameters:]( self,  "programOTPForDevice:withInputParameters:",  v18,  v9)) {
                    goto LABEL_27;
                  }
                  id v24 = objc_loadWeakRetained((id *)&self->_delegate);
                  [v24 log:@"OTP programmed successfully"];
                }

                else
                {
                  id v28 = objc_loadWeakRetained((id *)&self->_delegate);
                  [v28 log:@"Loaded firmware from RAM successfully"];

                  self->_recoveryModeActive = 0;
                }

                BOOL v12 = 1;
                goto LABEL_28;
              }

              id v25 = objc_loadWeakRetained((id *)&self->_delegate);
              id v26 = (id)[v8 versionString];
              [v25 log:@"Update failed. Device firmware version does not match file firmware version. Device is running %@. File is %@.", v21, v26];
            }

            else
            {
              id v25 = objc_loadWeakRetained((id *)&self->_delegate);
              [v25 log:@"Failed to query firmware version after update."];
            }

            goto LABEL_27;
          }

          id v20 = PS190StringForErrorCode(-[PS190Device bootStatus](v18, "bootStatus"));
          id v21 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend( v21,  "log:",  @"Detected boot failure after attempting to load firmware: 0x%02x (%s)",  -[PS190Device bootStatus](v18, "bootStatus"),  v20);
        }

        else
        {
          id v21 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v21, "log:", @"Failed to check for boot failure after loading firmware.", v29, v30);
        }

- (void)firmwareBytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = ((double)a3 / (double)a4 * 100.0);
  if (self->_loadToRAMPercentComplete < v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "log:", @"%u%% Complete", v4);

    self->_loadToRAMPercentComplete = v4;
  }

- (void)firmwareBlocksSent:(unsigned int)a3 blocksTotal:(unsigned int)a4
{
  double v4 = (double)a3 / (double)a4 * 100.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "log:", @"%.02f%% Complete", *(void *)&v4);
}

- (id)description
{
  id v3 = (void *)NSString;
  double v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"<%@: %@>", v5, self->_ps190Instance];

  return v6;
}

- (BOOL)complete
{
  return self->_complete;
}

- (unsigned)tag
{
  return self->_tag;
}

- (BOOL)useLocalSigning
{
  return self->_useLocalSigning;
}

- (void)setUseLocalSigning:(BOOL)a3
{
  self->_useLocalSigning = a3;
}

- (void).cxx_destruct
{
}

@end
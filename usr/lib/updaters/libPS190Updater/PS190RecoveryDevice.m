@interface PS190RecoveryDevice
- (BOOL)checkFieldNamed:(const char *)a3 programmed:(BOOL)a4 valid:(BOOL)a5;
- (BOOL)enableSRAMAccess;
- (BOOL)loadFile:(id)a3;
- (BOOL)queryBoardID;
- (BOOL)queryBootNonceHash:(char *)a3;
- (BOOL)queryBootNonceHashLSB:(char *)a3;
- (BOOL)queryBootNonceHashMSB:(char *)a3;
- (BOOL)queryChipEpoch;
- (BOOL)queryChipID;
- (BOOL)queryChipInfo;
- (BOOL)queryECID;
- (BOOL)queryFlags:(char *)a3;
- (BOOL)querySecurityDomain;
- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)resetToAppMode;
- (BOOL)resetToMemoryImage;
- (BOOL)resetToMode:(unsigned __int8)a3;
- (BOOL)resetToRecoveryMode;
- (BOOL)waitForHostAccessEnable;
- (BOOL)writeFile:(id)a3;
- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5;
- (BOOL)writeRequest:(unsigned __int8)a3;
- (BOOL)writeToSRAMAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5;
- (PS190PacketDumper)dumper;
- (PS190RecoveryDevice)initWithHandle:(id)a3;
- (PS190RecoveryDeviceDelegate)delegate;
- (id)queryHardwareID;
- (id)queryOTPProgrammedFields;
- (id)queryOTPValidFields;
- (void)enableSRAMAccess;
- (void)queryBoardID;
- (void)queryChipEpoch;
- (void)queryChipID;
- (void)queryChipInfo;
- (void)queryECID;
- (void)queryHardwareID;
- (void)queryOTPProgrammedFields;
- (void)queryOTPValidFields;
- (void)querySecurityDomain;
- (void)setDelegate:(id)a3;
- (void)setDumper:(id)a3;
- (void)waitForHostAccessEnable;
@end

@implementation PS190RecoveryDevice

- (PS190RecoveryDevice)initWithHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PS190RecoveryDevice;
  v6 = -[PS190RecoveryDevice init](&v10, sel_init);
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.accessoryupdater.ps190", "recoveryDevice");
    log = v6->_log;
    v6->_log = v7;

    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v6;
}

- (BOOL)waitForHostAccessEnable
{
  *(void *)&v20[5] = *MEMORY[0x1895F89C0];
  id v3 = (id)[MEMORY[0x189603F50] date];
  while (1)
  {
    if (-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1512LL,  &v18,  1LL))
    {
      if (v18 == 22)
      {
        BOOL v16 = 1;
        goto LABEL_12;
      }
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice waitForHostAccessEnable].cold.2(buf, v20, log);
      }
    }

    id v5 = (id)[MEMORY[0x189603F50] date];
    [v5 timeIntervalSinceDate:v3];
    double v7 = v6;

    if (v7 >= 2.0) {
      break;
    }
    sleepMS(2);
  }

  v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[PS190RecoveryDevice waitForHostAccessEnable].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (BOOL)writeRequest:(unsigned __int8)a3
{
  unsigned __int8 v6 = a3;
  BOOL v4 = -[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1488LL,  &v6,  1LL);
  if (!v4 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190RecoveryDevice writeRequest:].cold.1();
  }
  return v4;
}

- (id)queryOTPProgrammedFields
{
  if (!-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
LABEL_6:
    BOOL v4 = 0LL;
    return v4;
  }

  unsigned __int8 v14 = 0;
  if (!-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1484LL,  &v14,  1LL))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice queryOTPProgrammedFields].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_6;
  }

  id v3 = objc_alloc(&OBJC_CLASS___PS190OTPProgrammedFields);
  BOOL v4 = -[PS190OTPProgrammedFields initWithStatus1:](v3, "initWithStatus1:", v14);
  return v4;
}

- (id)queryOTPValidFields
{
  if (!-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
LABEL_6:
    BOOL v4 = 0LL;
    return v4;
  }

  unsigned __int8 v14 = 0;
  if (!-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1485LL,  &v14,  1LL))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice queryOTPValidFields].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_6;
  }

  id v3 = objc_alloc(&OBJC_CLASS___PS190OTPValidFields);
  BOOL v4 = -[PS190OTPValidFields initWithStatus2:](v3, "initWithStatus2:", v14);
  return v4;
}

- (BOOL)queryChipEpoch
{
  BOOL v3 = 0;
  if (-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
    BOOL v3 = 1;
    if (!-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1472LL,  &self->_epoch,  1LL))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice queryChipEpoch].cold.1(log, v5, v6, v7, v8, v9, v10, v11);
      }
      return 0;
    }
  }

  return v3;
}

- (BOOL)querySecurityDomain
{
  BOOL v3 = 0;
  if (-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
    BOOL v3 = -[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1473LL,  &self->_securityDomain,  1LL);
    if (!v3)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice querySecurityDomain].cold.1(log, v5, v6, v7, v8, v9, v10, v11);
      }
    }

    self->_securityDomainValid = 1;
  }

  return v3;
}

- (BOOL)queryFlags:(char *)a3
{
  BOOL v5 = 0;
  if (-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
    BOOL v5 = 1;
    if (!-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1474LL,  a3,  1LL))
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice queryFlags:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
      }
      return 0;
    }
  }

  return v5;
}

- (BOOL)queryBoardID
{
  BOOL v3 = 0;
  if (-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL))
  {
    unsigned int v15 = 0;
    BOOL v3 = -[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1475LL,  &v15,  3LL);
    if (v3)
    {
      BOOL v4 = (NSNumber *)(id)[MEMORY[0x189607968] numberWithUnsignedInt:v15];
      boardID = self->_boardID;
      self->_boardID = v4;
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice queryBoardID].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }

  return v3;
}

- (BOOL)queryChipID
{
  BOOL v3 = -[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 0LL);
  LOBYTE(v4) = 0;
  if (v3)
  {
    if (-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1478LL,  &self->_chipID,  4LL))
    {
      LOBYTE(v4) = 1;
    }

    else
    {
      log = self->_log;
      BOOL v4 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        -[PS190RecoveryDevice queryChipID].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
        LOBYTE(v4) = 0;
      }
    }
  }

  return v4;
}

- (BOOL)queryECID
{
  if (!-[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 1LL)) {
    return 0;
  }
  p_ecid = &self->_ecid;
  BOOL v4 = -[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1472LL,  &self->_ecid,  8LL);
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice queryECID].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  unint64_t *p_ecid = bswap64(*p_ecid);
  return v4;
}

- (BOOL)queryBootNonceHashMSB:(char *)a3
{
  BOOL v5 = -[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 2LL);
  if (v5)
  {
    if (-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1472LL,  a3,  16LL))
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      log = self->_log;
      BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[PS190RecoveryDevice queryBootNonceHashMSB:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (BOOL)queryBootNonceHashLSB:(char *)a3
{
  BOOL v5 = -[PS190RecoveryDevice writeRequest:](self, "writeRequest:", 3LL);
  if (v5)
  {
    if (-[PS190RecoveryDevice readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1472LL,  a3,  16LL))
    {
      LOBYTE(v5) = 1;
    }

    else
    {
      log = self->_log;
      BOOL v5 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        -[PS190RecoveryDevice queryBootNonceHashLSB:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (BOOL)queryBootNonceHash:(char *)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  BOOL v5 = -[PS190RecoveryDevice queryBootNonceHashLSB:](self, "queryBootNonceHashLSB:", &v10);
  if (v5)
  {
    BOOL v5 = -[PS190RecoveryDevice queryBootNonceHashMSB:](self, "queryBootNonceHashMSB:", &v9);
    if (v5)
    {
      int8x16_t v6 = vrev64q_s8(v9);
      int8x16_t v7 = vrev64q_s8(v10);
      *(int8x16_t *)a3 = vextq_s8(v6, v6, 8uLL);
      *((int8x16_t *)a3 + 1) = vextq_s8(v7, v7, 8uLL);
    }
  }

  return v5;
}

- (BOOL)checkFieldNamed:(const char *)a3 programmed:(BOOL)a4 valid:(BOOL)a5
{
  if (a4)
  {
    if (a5) {
      return 1;
    }
    id v7 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%s is not valid.",  a3);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }

  else
  {
    id v7 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%s is not programmed.",  a3);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      -[PS190RecoveryDevice checkFieldNamed:programmed:valid:].cold.1((uint64_t)v7, log, v9, v10, v11, v12, v13, v14);
  }

  return 0;
}

- (BOOL)queryChipInfo
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  if (!self->_infoQueryComplete)
  {
    id v4 = -[PS190RecoveryDevice queryOTPProgrammedFields](self, "queryOTPProgrammedFields");
    if (!v4)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice queryChipInfo].cold.1(log, v11, v12, v13, v14, v15, v16, v17);
      }
      BOOL v2 = 0;
      goto LABEL_35;
    }

    id v5 = -[PS190RecoveryDevice queryOTPValidFields](self, "queryOTPValidFields");
    if (!v5)
    {
      char v18 = self->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice queryChipInfo].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      goto LABEL_33;
    }

    if (-[PS190RecoveryDevice checkFieldNamed:programmed:valid:]( self,  "checkFieldNamed:programmed:valid:",  "Certificate epoch",  [v4 certificateEpoch],  objc_msgSend(v5, "certificateEpoch"))
      && -[PS190RecoveryDevice queryChipEpoch](self, "queryChipEpoch"))
    {
      if ([v4 securityDomain] && (objc_msgSend(v5, "securityDomain") & 1) == 0)
      {
        v27 = self->_log;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[PS190RecoveryDevice queryChipInfo].cold.5(v27, v28, v29, v30, v31, v32, v33, v34);
        }
        goto LABEL_33;
      }

      if (![v4 securityDomain]
        || -[PS190RecoveryDevice querySecurityDomain](self, "querySecurityDomain"))
      {
        char v51 = 0;
        BOOL v2 = 0;
        if (!-[PS190RecoveryDevice queryFlags:](self, "queryFlags:", &v51))
        {
LABEL_34:

LABEL_35:
          return v2;
        }

        if ([v4 productionStatus])
        {
          if (([v5 productionStatus] & 1) == 0)
          {
            v35 = self->_log;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[PS190RecoveryDevice queryChipInfo].cold.4(v35, v36, v37, v38, v39, v40, v41, v42);
            }
            goto LABEL_33;
          }

          int8x16_t v6 = (NSNumber *)(id)[MEMORY[0x189607968] numberWithBool:v51 & 1];
          productionMode = self->_productionMode;
          self->_productionMode = v6;
        }

        if (-[PS190RecoveryDevice checkFieldNamed:programmed:valid:]( self,  "checkFieldNamed:programmed:valid:",  "Security mode",  [v4 securityMode],  objc_msgSend(v5, "securityMode")))
        {
          self->_securityMode = (v51 & 2) != 0;
          if (-[PS190RecoveryDevice checkFieldNamed:programmed:valid:]( self,  "checkFieldNamed:programmed:valid:",  "Debug disable",  [v4 debugDisable],  objc_msgSend(v5, "debugDisable")))
          {
            self->_debugDisable = (v51 & 4) != 0;
            if (-[PS190RecoveryDevice checkFieldNamed:programmed:valid:]( self,  "checkFieldNamed:programmed:valid:",  "Real HDCP Keys Valid",  [v4 realHDCPKeysPresent],  objc_msgSend(v5, "realHDCPKeysPresent")))
            {
              self->_realHDCPKeysPresent = (v51 & 8) != 0;
              if (([v5 boardID] & 1) == 0)
              {
                v43 = self->_log;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  -[PS190RecoveryDevice queryChipInfo].cold.3(v43, v44, v45, v46, v47, v48, v49, v50);
                }
                goto LABEL_33;
              }

              if (-[PS190RecoveryDevice queryBoardID](self, "queryBoardID"))
              {
LABEL_45:
                if (-[PS190RecoveryDevice queryChipID](self, "queryChipID")
                  && -[PS190RecoveryDevice checkFieldNamed:programmed:valid:]( self,  "checkFieldNamed:programmed:valid:",  "ECID",  [v4 ecid],  objc_msgSend(v5, "ecid"))
                  && -[PS190RecoveryDevice queryECID](self, "queryECID"))
                {
                  if (!self->_securityDomain)
                  {
LABEL_27:
                    BOOL v2 = 1;
                    self->_infoQueryComplete = 1;
                    goto LABEL_34;
                  }

                  if (-[PS190RecoveryDevice queryBootNonceHash:](self, "queryBootNonceHash:", v52))
                  {
                    uint64_t v8 = (NSData *)(id)[MEMORY[0x189603F48] dataWithBytes:v52 length:32];
                    nonce = self->_nonce;
                    self->_nonce = v8;

                    goto LABEL_27;
                  }
                }
              }
            }
          }
        }
      }
    }

- (BOOL)enableSRAMAccess
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *(void *)id v7 = 0x258554141524150LL;
  *(_DWORD *)&v7[7] = 1195725314;
  if (-[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1489LL,  v7,  1LL))
  {
    uint64_t v3 = 0LL;
    while (v3 != 10)
    {
      if (!-[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1489LL,  &v7[++v3],  1LL))
      {
        BOOL v5 = (unint64_t)(v3 - 1) > 9;
        goto LABEL_7;
      }
    }

    return 1;
  }

  else
  {
    BOOL v5 = 0;
LABEL_7:
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice enableSRAMAccess].cold.1();
    }
  }

  return v5;
}

- (BOOL)writeToSRAMAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5
{
  if (!a5) {
    return 1;
  }
  unsigned int v5 = a5;
  p_delegate = &self->_delegate;
  while (1)
  {
    uint64_t v10 = v5 >= 0x10 ? 16LL : v5;
    unsigned int v13 = bswap32(a3);
    if (!-[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1490LL,  &v13,  4LL)) {
      break;
    }
    if (!-[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1494LL,  a4,  v10))
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[PS190RecoveryDevice writeToSRAMAddress:bytes:length:].cold.1();
      }
      return 0;
    }

    a3 += v10;
    v5 -= v10;
    a4 = (char *)a4 + v10;
    self->_bytesTransferred += v10;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained firmwareBytesSent:self->_bytesTransferred bytesTotal:self->_bytesToTransfer];

    if (!v5) {
      return 1;
    }
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190RecoveryDevice writeToSRAMAddress:bytes:length:].cold.2();
  }
  return 0;
}

- (BOOL)writeFile:(id)a3
{
  id v4 = a3;
  self->_bytesTransferred = 0;
  int v5 = [v4 imemSize];
  self->_bytesToTransfer = v5 + [v4 dmemSize] + 3084;
  if (!-[PS190RecoveryDevice writeToSRAMAddress:bytes:length:]( self,  "writeToSRAMAddress:bytes:length:",  283648,  [v4 img4Object],  3072))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice writeFile:].cold.4(log, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_14;
  }

  __int16 v41 = 0;
  v40[0] = [v4 checksum];
  v40[1] = 2;
  int v42 = [v4 imemSize];
  int v43 = [v4 dmemSize];
  if (!-[PS190RecoveryDevice writeToSRAMAddress:bytes:length:]( self,  "writeToSRAMAddress:bytes:length:",  282624LL,  v40,  12LL))
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice writeFile:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_14;
  }

  if (!-[PS190RecoveryDevice writeToSRAMAddress:bytes:length:]( self,  "writeToSRAMAddress:bytes:length:",  40960,  [v4 imemImage],  objc_msgSend(v4, "imemSize")))
  {
    uint64_t v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice writeFile:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_14;
  }

  if (!-[PS190RecoveryDevice writeToSRAMAddress:bytes:length:]( self,  "writeToSRAMAddress:bytes:length:",  286720,  [v4 dmemImage],  objc_msgSend(v4, "dmemSize")))
  {
    uint64_t v31 = self->_log;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice writeFile:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }

  BOOL v6 = 1;
LABEL_15:

  return v6;
}

- (BOOL)resetToMode:(unsigned __int8)a3
{
  unsigned __int8 v6 = a3;
  BOOL v4 = -[PS190RecoveryDevice writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1513LL,  &v6,  1LL);
  if (!v4 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190RecoveryDevice resetToMode:].cold.1();
  }
  return v4;
}

- (BOOL)resetToRecoveryMode
{
  return -[PS190RecoveryDevice resetToMode:](self, "resetToMode:", 1LL);
}

- (BOOL)resetToAppMode
{
  return -[PS190RecoveryDevice resetToMode:](self, "resetToMode:", 3LL);
}

- (BOOL)resetToMemoryImage
{
  return -[PS190RecoveryDevice resetToMode:](self, "resetToMode:", 2LL);
}

- (BOOL)loadFile:(id)a3
{
  id v4 = a3;
  if (!-[PS190RecoveryDevice enableSRAMAccess](self, "enableSRAMAccess")
    || !-[PS190RecoveryDevice writeFile:](self, "writeFile:", v4))
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }

  if (!-[PS190RecoveryDevice resetToMemoryImage](self, "resetToMemoryImage"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice loadFile:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_7;
  }

  BOOL v5 = 1;
LABEL_8:

  return v5;
}

- (id)queryHardwareID
{
  if (-[PS190RecoveryDevice queryChipInfo](self, "queryChipInfo"))
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___PS190HardwareID);
    boardID = self->_boardID;
    uint64_t epoch = self->_epoch;
    uint64_t chipID = self->_chipID;
    BOOL debugDisable = self->_debugDisable;
    unint64_t ecid = self->_ecid;
    nonce = self->_nonce;
    productionMode = self->_productionMode;
    BOOL realHDCPKeysPresent = self->_realHDCPKeysPresent;
    if (self->_securityDomainValid)
    {
      BOOL v12 = realHDCPKeysPresent;
      BOOL v27 = debugDisable;
      uint64_t v13 = v3;
      id v14 = (id)[MEMORY[0x189607968] numberWithUnsignedChar:self->_securityDomain];
      LOBYTE(v26) = self->_securityMode;
      LOBYTE(v25) = v12;
      uint64_t v15 = -[PS190HardwareID initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent:securityDomain:securityMode:hardwareRevision:]( v13,  "initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent:security Domain:securityMode:hardwareRevision:",  boardID,  epoch,  chipID,  v27,  ecid,  nonce,  productionMode,  v25,  v14,  v26,  0LL);
    }

    else
    {
      LOBYTE(v26) = self->_securityMode;
      LOBYTE(v25) = realHDCPKeysPresent;
      uint64_t v15 = -[PS190HardwareID initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent:securityDomain:securityMode:hardwareRevision:]( v3,  "initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent:security Domain:securityMode:hardwareRevision:",  boardID,  epoch,  chipID,  debugDisable,  ecid,  nonce,  productionMode,  v25,  0LL,  v26,  0LL);
    }
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190RecoveryDevice queryHardwareID].cold.1(log, v17, v18, v19, v20, v21, v22, v23);
    }
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  int v9 = -[PS190DeviceHandle writeRegisterAddress:bytes:length:](self->_handle, "writeRegisterAddress:bytes:length:");
  if (v9) {
    -[PS190PacketDumper dumpDPCDRegisterWrite:bytes:length:]( self->_dumper,  "dumpDPCDRegisterWrite:bytes:length:",  v7,  a4,  v5);
  }
  return v9;
}

- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  int v9 = -[PS190DeviceHandle readRegisterAddress:buffer:length:](self->_handle, "readRegisterAddress:buffer:length:");
  if (v9) {
    -[PS190PacketDumper dumpDPCDRegisterRead:bytes:length:]( self->_dumper,  "dumpDPCDRegisterRead:bytes:length:",  v7,  a4,  v5);
  }
  return v9;
}

- (PS190RecoveryDeviceDelegate)delegate
{
  return (PS190RecoveryDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PS190PacketDumper)dumper
{
  return (PS190PacketDumper *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setDumper:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)waitForHostAccessEnable
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[PS190RecoveryDevice waitForHostAccessEnable]";
  _os_log_error_impl(&dword_188FDB000, log, OS_LOG_TYPE_ERROR, "%s: Failed to read boot status", buf, 0xCu);
}

- (void)writeRequest:.cold.1()
{
}

- (void)queryOTPProgrammedFields
{
}

- (void)queryOTPValidFields
{
}

- (void)queryChipEpoch
{
}

- (void)querySecurityDomain
{
}

- (void)queryFlags:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queryBoardID
{
}

- (void)queryChipID
{
}

- (void)queryECID
{
}

- (void)queryBootNonceHashMSB:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queryBootNonceHashLSB:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)checkFieldNamed:(uint64_t)a3 programmed:(uint64_t)a4 valid:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queryChipInfo
{
}

- (void)enableSRAMAccess
{
}

- (void)writeToSRAMAddress:bytes:length:.cold.1()
{
}

- (void)writeToSRAMAddress:bytes:length:.cold.2()
{
}

- (void)writeFile:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)writeFile:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)writeFile:(uint64_t)a3 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)writeFile:(uint64_t)a3 .cold.4( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)resetToMode:.cold.1()
{
}

- (void)loadFile:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queryHardwareID
{
}

@end
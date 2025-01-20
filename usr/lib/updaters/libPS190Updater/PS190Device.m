@interface PS190Device
- (BOOL)bootFailureDetected;
- (BOOL)checkForApplicationMode;
- (BOOL)checkForBootFailure;
- (BOOL)checkForRecoveryMode;
- (BOOL)commitWithReset;
- (BOOL)commitWithoutReset;
- (BOOL)fillInCommandRegistersForCommand:(id)a3;
- (BOOL)hostAccessEnabled;
- (BOOL)otpWriteBoardID:(unsigned int)a3;
- (BOOL)otpWriteProductionMode:(unsigned __int8)a3;
- (BOOL)otpWriteSecurityDomain:(unsigned __int8)a3;
- (BOOL)queryHardwareRevision:(char *)a3;
- (BOOL)readCommandStatus:(char *)a3;
- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)sendCommand:(id)a3;
- (BOOL)sendCommandWithData:(id)a3;
- (BOOL)sendCommandWithoutData:(id)a3;
- (BOOL)startPacketDumperWithFileName:(id)a3;
- (BOOL)submitCommandForProcessing:(id)a3;
- (BOOL)submitDataForProcessing:(id)a3;
- (BOOL)updateWithFile:(id)a3;
- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5;
- (BOOL)writeRegisterAddress:(unsigned int)a3 data:(id)a4;
- (PS190Device)initWithHandle:(id)a3;
- (PS190DeviceDelegate)delegate;
- (PS190PacketDumper)dumper;
- (id)otpQueryBoardID;
- (id)otpQueryCPROFuse;
- (id)otpQuerySDOMFuse;
- (id)queryAppFirmwareVersion;
- (id)queryBoardID;
- (id)queryBootNonceHash;
- (id)queryBootStatus;
- (id)queryBootloaderVersion;
- (id)queryCPROFuse;
- (id)queryCRC32ForBlockStartNumber:(unsigned int)a3 endNumber:(unsigned int)a4;
- (id)queryCSECFuse;
- (id)queryChipID;
- (id)queryDBGDFuse;
- (id)queryECID;
- (id)queryEpoch;
- (id)queryHardwareIDIncludingNonce:(BOOL)a3;
- (id)queryInstanceID;
- (id)queryOTPSerialNumber;
- (id)queryRHKPFuse;
- (id)querySDOMFuse;
- (id)querySiliconID;
- (id)readData:(unint64_t)a3;
- (id)sendCommandWithDataResponse:(id)a3;
- (unsigned)bootStatus;
- (unsigned)waitForCommandStatusNotBusy;
- (unsigned)writeBytes:(const char *)a3 length:(unsigned int)a4;
- (void)checkForApplicationMode;
- (void)checkForBootFailure;
- (void)checkForRecoveryMode;
- (void)commitWithoutReset;
- (void)resetToAppLoad;
- (void)resetToRecoveryMode;
- (void)setBootErrorStatus:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setDumper:(id)a3;
- (void)waitForCommandStatusNotBusy;
@end

@implementation PS190Device

- (PS190Device)initWithHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PS190Device;
  v6 = -[PS190Device init](&v10, sel_init);
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.accessoryupdater.ps190", "device");
    log = v6->_log;
    v6->_log = v7;

    objc_storeStrong((id *)&v6->_deviceHandle, a3);
  }

  return v6;
}

- (BOOL)fillInCommandRegistersForCommand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 commandPacket];
  uint64_t v6 = [v5 bytes];
  id v7 = (id)[v4 commandPacket];
  BOOL v8 = -[PS190Device writeRegisterAddress:bytes:length:]( self,  "writeRegisterAddress:bytes:length:",  1512,  v6,  [v7 length]);

  if (!v8 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190Device fillInCommandRegistersForCommand:].cold.1();
  }

  return v8;
}

- (BOOL)submitCommandForProcessing:(id)a3
{
  id v4 = a3;
  char v7 = 0x80;
  BOOL v5 = -[PS190Device writeRegisterAddress:bytes:length:](self, "writeRegisterAddress:bytes:length:", 1517LL, &v7, 1LL);
  if (!v5 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190Device submitCommandForProcessing:].cold.1();
  }

  return v5;
}

- (BOOL)submitDataForProcessing:(id)a3
{
  id v4 = a3;
  char v7 = -120;
  BOOL v5 = -[PS190Device writeRegisterAddress:bytes:length:](self, "writeRegisterAddress:bytes:length:", 1517LL, &v7, 1LL);
  if (!v5 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PS190Device submitDataForProcessing:].cold.1();
  }

  return v5;
}

- (BOOL)readCommandStatus:(char *)a3
{
  BOOL v5 = -[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1517LL, &v19, 1LL);
  if (v5)
  {
    char v6 = v19;
    if (v19 == 32)
    {
      if (-[PS190Device readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1513LL,  &v18,  1LL))
      {
        char v7 = PS190StringForErrorCode(v18);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[PS190Device readCommandStatus:].cold.1((uint64_t)v7, &v18, log);
        }
      }

      else
      {
        v9 = self->_log;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[PS190Device readCommandStatus:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      char v6 = v19;
    }

    *a3 = v6;
  }

  return v5;
}

- (unsigned)waitForCommandStatusNotBusy
{
  id v3 = (id)[MEMORY[0x189603F50] date];
  sleepMS(5);
  if (-[PS190Device readCommandStatus:](self, "readCommandStatus:", &v25))
  {
    while (1)
    {
      unsigned __int8 v4 = v25;
      if (v25 != 64) {
        break;
      }
      id v5 = (id)[MEMORY[0x189603F50] date];
      [v5 timeIntervalSinceDate:v3];
      double v7 = v6;

      if (v7 >= 2.0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[PS190Device waitForCommandStatusNotBusy].cold.2(log, v17, v18, v19, v20, v21, v22, v23);
        }
        unsigned __int8 v4 = v25;
        break;
      }

      sleepMS(2);
      if (!-[PS190Device readCommandStatus:](self, "readCommandStatus:", &v25)) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    BOOL v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PS190Device waitForCommandStatusNotBusy].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)readData:(unint64_t)a3
{
  v8[2] = *MEMORY[0x1895F89C0];
  else {
    uint64_t v5 = a3;
  }
  v8[0] = 0LL;
  v8[1] = 0LL;
  if (-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1520LL, v8, v5))
  {
    id v6 = (id)[MEMORY[0x189603F48] dataWithBytes:v8 length:a3];
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device readData:].cold.1();
    }
    id v6 = 0LL;
  }

  return v6;
}

- (unsigned)writeBytes:(const char *)a3 length:(unsigned int)a4
{
  if (a4 >= 0x10) {
    uint64_t v5 = 16LL;
  }
  else {
    uint64_t v5 = a4;
  }
  if (!-[PS190Device writeRegisterAddress:bytes:length:](self, "writeRegisterAddress:bytes:length:", 1520LL, a3, v5))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device writeBytes:length:].cold.1();
    }
    LODWORD(v5) = 0;
  }

  return v5;
}

- (id)sendCommandWithDataResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[PS190PacketDumper dumpCommand:](self->_dumper, "dumpCommand:", v4);
  if (!-[PS190Device fillInCommandRegistersForCommand:](self, "fillInCommandRegistersForCommand:", v4)
    || !-[PS190Device submitCommandForProcessing:](self, "submitCommandForProcessing:", v4))
  {
LABEL_20:
    id v18 = 0LL;
    goto LABEL_21;
  }

  int v5 = -[PS190Device waitForCommandStatusNotBusy](self, "waitForCommandStatusNotBusy");
  if (v5 != 8)
  {
    int v6 = v5;
    if (v5 != 16)
    {
      uint64_t v16 = PS190StringForCommandStatusCode(v5);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315906;
        uint64_t v23 = "-[PS190Device sendCommandWithDataResponse:]";
        __int16 v24 = 1024;
        int v25 = v6;
        __int16 v26 = 2080;
        v27 = v16;
        __int16 v28 = 2112;
        id v29 = v4;
        _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "%s: Unexpected command status 0x%02x (%s) after submitting %@",  (uint8_t *)&v22,  0x26u);
      }

      goto LABEL_20;
    }
  }

  id v7 = (id)[MEMORY[0x189603FB8] data];
  unsigned int v8 = [v4 responseSize];
  unint64_t v9 = v8;
  if (v8 >= 0x10uLL) {
    uint64_t v10 = 16LL;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = -[PS190Device readData:](self, "readData:", v10);
  if (v11)
  {
    id v12 = v11;
    while (1)
    {
      [v7 appendData:v12];
      v9 -= [v12 length];
      if (!v9)
      {

        id v18 = (id)[MEMORY[0x189603F48] dataWithData:v7];
        goto LABEL_27;
      }

      -[PS190Device submitDataForProcessing:](self, "submitDataForProcessing:", v4);
      int v13 = -[PS190Device waitForCommandStatusNotBusy](self, "waitForCommandStatusNotBusy");
      if (v13 != 8)
      {
        int v14 = v13;
        if (v13 != 16) {
          break;
        }
      }

      if (v9 >= 0x10) {
        uint64_t v15 = 16LL;
      }
      else {
        uint64_t v15 = v9;
      }
      id v12 = -[PS190Device readData:](self, "readData:", v15);
      if (!v12) {
        goto LABEL_26;
      }
    }

    uint64_t v20 = PS190StringForCommandStatusCode(v13);
    uint64_t v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136315906;
      uint64_t v23 = "-[PS190Device sendCommandWithDataResponse:]";
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 2080;
      v27 = v20;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_error_impl( &dword_188FDB000,  v21,  OS_LOG_TYPE_ERROR,  "%s: Unexpected command status 0x%02x (%s) after submitting data request for %@",  (uint8_t *)&v22,  0x26u);
    }
  }

- (id)queryAppFirmwareVersion
{
  id v3 = -[PS190GetVersionCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetVersionCommand),  "initWithSubcommand:",  0LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190AppFirmwareVersion initWithRawAppFirmwareVersion:]( [PS190AppFirmwareVersion alloc], "initWithRawAppFirmwareVersion:", [v4 bytes]);
    -[PS190PacketDumper dumpAppFirmwareVersion:](self->_dumper, "dumpAppFirmwareVersion:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryChipID
{
  id v3 = -[PS190GetVersionCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetVersionCommand),  "initWithSubcommand:",  1LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190ChipID initWithChipID:]( [PS190ChipID alloc], "initWithChipID:", *(unsigned int *)[v4 bytes]);
    -[PS190PacketDumper dumpChipID:](self->_dumper, "dumpChipID:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryBoardID
{
  id v3 = -[PS190GetVersionCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetVersionCommand),  "initWithSubcommand:",  2LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190BoardID initWithBoardID:]( [PS190BoardID alloc], "initWithBoardID:", *(unsigned int *)[v4 bytes]);
    -[PS190PacketDumper dumpBoardID:](self->_dumper, "dumpBoardID:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)otpQueryBoardID
{
  id v3 = -[PS190ReadOTPCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190ReadOTPCommand),  "initWithSubcommand:",  2LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = (unsigned __int16 *)[v4 bytes];
    id v7 = -[PS190BoardID initWithBoardID:]( objc_alloc(&OBJC_CLASS___PS190BoardID),  "initWithBoardID:",  *v6 | (*((unsigned __int8 *)v6 + 2) << 16));
    -[PS190PacketDumper dumpBoardID:](self->_dumper, "dumpBoardID:", v7);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)queryEpoch
{
  id v3 = -[PS190GetVersionCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetVersionCommand),  "initWithSubcommand:",  3LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190Epoch initWithEpoch:]( [PS190Epoch alloc], "initWithEpoch:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpEpoch:](self->_dumper, "dumpEpoch:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryBootloaderVersion
{
  id v3 = -[PS190GetVersionCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetVersionCommand),  "initWithSubcommand:",  4LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190BootloaderVersion initWithRawBootloaderVersion:]( [PS190BootloaderVersion alloc], "initWithRawBootloaderVersion:", [v4 bytes]);
    -[PS190PacketDumper dumpBootloaderVersion:](self->_dumper, "dumpBootloaderVersion:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)querySDOMFuse
{
  id v3 = -[PS190GetInfoCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetInfoCommand),  "initWithSubcommand:",  1LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190SDOMFuse initWithValue:]( [PS190SDOMFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpSDOMFuse:](self->_dumper, "dumpSDOMFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)otpQuerySDOMFuse
{
  id v3 = -[PS190ReadOTPCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190ReadOTPCommand),  "initWithSubcommand:",  0LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190SDOMFuse initWithValue:]( [PS190SDOMFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpSDOMFuse:](self->_dumper, "dumpSDOMFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryCPROFuse
{
  id v3 = -[PS190GetInfoCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetInfoCommand),  "initWithSubcommand:",  2LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190CPROFuse initWithValue:]( [PS190CPROFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpCPROFuse:](self->_dumper, "dumpCPROFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)otpQueryCPROFuse
{
  id v3 = -[PS190ReadOTPCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190ReadOTPCommand),  "initWithSubcommand:",  1LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190CPROFuse initWithValue:]( [PS190CPROFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpCPROFuse:](self->_dumper, "dumpCPROFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryCSECFuse
{
  id v3 = -[PS190GetInfoCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetInfoCommand),  "initWithSubcommand:",  3LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190CSECFuse initWithValue:]( [PS190CSECFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpCSECFuse:](self->_dumper, "dumpCSECFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryRHKPFuse
{
  id v3 = -[PS190GetInfoCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetInfoCommand),  "initWithSubcommand:",  4LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190RHKPFuse initWithValue:]( [PS190RHKPFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpRHKPFuse:](self->_dumper, "dumpRHKPFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryDBGDFuse
{
  id v3 = -[PS190GetInfoCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetInfoCommand),  "initWithSubcommand:",  5LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190DBGDFuse initWithValue:]( [PS190DBGDFuse alloc], "initWithValue:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpDBGDFuse:](self->_dumper, "dumpDBGDFuse:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryBootStatus
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PS190BootStatusCommand);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190BootStatus initWithStatus:]( [PS190BootStatus alloc], "initWithStatus:", *(unsigned __int8 *)[v4 bytes]);
    -[PS190PacketDumper dumpBootStatus:](self->_dumper, "dumpBootStatus:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryOTPSerialNumber
{
  id v3 = -[PS190GetSerialNumberCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetSerialNumberCommand),  "initWithSubcommand:",  0LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  if (v4)
  {
    int v5 = -[PS190OTPSerialNumber initWithData:](objc_alloc(&OBJC_CLASS___PS190OTPSerialNumber), "initWithData:", v4);
    -[PS190PacketDumper dumpOTPSerialNumber:](self->_dumper, "dumpOTPSerialNumber:", v5);
  }

  else
  {
    int v5 = 0LL;
  }

  return v5;
}

- (id)querySiliconID
{
  id v3 = -[PS190GetSerialNumberCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190GetSerialNumberCommand),  "initWithSubcommand:",  1LL);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  if (v4)
  {
    int v5 = -[PS190SiliconID initWithData:](objc_alloc(&OBJC_CLASS___PS190SiliconID), "initWithData:", v4);
    -[PS190PacketDumper dumpSiliconID:](self->_dumper, "dumpSiliconID:", v5);
  }

  else
  {
    int v5 = 0LL;
  }

  return v5;
}

- (id)queryECID
{
  id v3 = objc_alloc_init(&OBJC_CLASS___PS190GetECIDCommand);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    int v6 = -[PS190ECID initWithValue:]( [PS190ECID alloc], "initWithValue:", *(void *)[v4 bytes]);
    -[PS190PacketDumper dumpECID:](self->_dumper, "dumpECID:", v6);
  }

  else
  {
    int v6 = 0LL;
  }

  return v6;
}

- (id)queryBootNonceHash
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(&OBJC_CLASS___PS190GetBootNonceHashCommand);
  id v4 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v3);
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 bytes];
    uint64_t v7 = 0LL;
    unsigned int v8 = (char *)(v6 + 31);
    do
    {
      char v9 = *v8--;
      v12[v7++] = v9;
    }

    while (v7 != 32);
    uint64_t v10 = -[PS190BootNonceHash initWithHash:](objc_alloc(&OBJC_CLASS___PS190BootNonceHash), "initWithHash:", v12);
    -[PS190PacketDumper dumpBootNonceHash:](self->_dumper, "dumpBootNonceHash:", v10);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (BOOL)queryHardwareRevision:(char *)a3
{
  BOOL v4 = -[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1289LL, a3, 1LL);
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device queryHardwareRevision:].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v4;
}

- (id)queryCRC32ForBlockStartNumber:(unsigned int)a3 endNumber:(unsigned int)a4
{
  int v5 = -[PS190CalculateCRC32Command initWithBlockStartNumber:blockEndNumber:]( objc_alloc(&OBJC_CLASS___PS190CalculateCRC32Command),  "initWithBlockStartNumber:blockEndNumber:",  a3,  a4);
  id v6 = -[PS190Device sendCommandWithDataResponse:](self, "sendCommandWithDataResponse:", v5);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = -[PS190CRC32 initWithValue:]( [PS190CRC32 alloc], "initWithValue:", *(unsigned int *)[v6 bytes]);
    -[PS190PacketDumper dumpCRC32:](self->_dumper, "dumpCRC32:", v8);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (id)queryHardwareIDIncludingNonce:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[PS190Device queryChipID](self, "queryChipID");
  if (v5)
  {
    id v6 = -[PS190Device queryBoardID](self, "queryBoardID");
    if (v6)
    {
      unint64_t v7 = (unint64_t)v6;
      if (![v6 boardID])
      {

        unint64_t v7 = 0LL;
      }

      id v8 = -[PS190Device queryEpoch](self, "queryEpoch");
      if (!v8)
      {
        id v18 = 0LL;
LABEL_46:

        goto LABEL_47;
      }

      id v9 = -[PS190Device querySDOMFuse](self, "querySDOMFuse");
      if (!v9 || (id v10 = -[PS190Device queryCPROFuse](self, "queryCPROFuse")) == 0LL)
      {
        id v18 = 0LL;
LABEL_45:

        goto LABEL_46;
      }

      uint64_t v11 = v10;
      id v12 = -[PS190Device queryCSECFuse](self, "queryCSECFuse");
      if (!v12)
      {
        id v18 = 0LL;
LABEL_44:

        goto LABEL_45;
      }

      id v13 = -[PS190Device queryRHKPFuse](self, "queryRHKPFuse");
      if (!v13)
      {
        id v18 = 0LL;
LABEL_43:

        goto LABEL_44;
      }

      id v14 = -[PS190Device queryDBGDFuse](self, "queryDBGDFuse");
      if (!v14)
      {
        id v18 = 0LL;
LABEL_42:

        goto LABEL_43;
      }

      id v15 = -[PS190Device queryECID](self, "queryECID");
      if (!v15)
      {
        id v18 = 0LL;
LABEL_41:

        goto LABEL_42;
      }

      v39 = v15;
      if (v3)
      {
        id v16 = -[PS190Device queryBootNonceHash](self, "queryBootNonceHash");
        if (!v16)
        {
          id v18 = 0LL;
LABEL_40:
          id v15 = v39;
          goto LABEL_41;
        }

        unint64_t v17 = (unint64_t)v16;
        if (![v16 isEmpty])
        {
LABEL_17:
          if (-[PS190Device queryHardwareRevision:](self, "queryHardwareRevision:", &v40)) {
            id v38 = (id)[MEMORY[0x189607968] numberWithUnsignedChar:v40];
          }
          else {
            id v38 = 0LL;
          }
          if (v7 | v17)
          {
            v34 = objc_alloc(&OBJC_CLASS___PS190HardwareID);
            if (v7)
            {
              unint64_t v19 = v17;
              uint64_t v20 = (void *)MEMORY[0x189607968];
              uint64_t v21 = [(id)v7 boardID];
              int v22 = v20;
              unint64_t v17 = v19;
              id v37 = (id)[v22 numberWithUnsignedInt:v21];
LABEL_32:
              unsigned int v33 = [v8 epoch];
              unsigned int v31 = [v5 chipID];
              int v23 = [v14 value];
              uint64_t v30 = [v39 value];
              id v32 = (id)[(id)v17 data];
              v35 = (void *)v17;
              if (v11) {
                id v36 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  objc_msgSend(v11, "value") != 0);
              }
              else {
                id v36 = 0LL;
              }
              BOOL v29 = v23 != 0;
              BOOL v24 = [v13 value] != 0;
              id v25 = (id)objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedChar:",  objc_msgSend(v9, "value"));
              LOBYTE(v28) = [v12 value] != 0;
              LOBYTE(v27) = v24;
              id v18 = -[PS190HardwareID initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent:securityDomain:securityMode:hardwareRevision:]( v34,  "initWithBoardID:certficateEpoch:chipID:debugDisable:ecid:nonce:productionMode:realHDCPKeysPresent: securityDomain:securityMode:hardwareRevision:",  v37,  v33,  v31,  v29,  v30,  v32,  v36,  v27,  v25,  v28,  v38);

              if (v11) {
              if (v7)
              }

              goto LABEL_40;
            }
          }

          else
          {

            v34 = objc_alloc(&OBJC_CLASS___PS190HardwareID);
            uint64_t v11 = 0LL;
          }

          id v37 = 0LL;
          goto LABEL_32;
        }
      }

      unint64_t v17 = 0LL;
      goto LABEL_17;
    }
  }

  id v18 = 0LL;
LABEL_47:

  return v18;
}

- (BOOL)otpWriteSecurityDomain:(unsigned __int8)a3
{
  BOOL v4 = -[PS190ProgramSecurityDomainOTPCommand initWithSecurityDomain:]( objc_alloc(&OBJC_CLASS___PS190ProgramSecurityDomainOTPCommand),  "initWithSecurityDomain:",  a3);
  BOOL v5 = -[PS190Device sendCommand:](self, "sendCommand:", v4);
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device otpWriteSecurityDomain:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return v5;
}

- (BOOL)otpWriteProductionMode:(unsigned __int8)a3
{
  BOOL v4 = -[PS190ProgramProductionModeOTPCommand initWithProductionMode:]( objc_alloc(&OBJC_CLASS___PS190ProgramProductionModeOTPCommand),  "initWithProductionMode:",  a3);
  BOOL v5 = -[PS190Device sendCommand:](self, "sendCommand:", v4);
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device otpWriteProductionMode:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return v5;
}

- (BOOL)otpWriteBoardID:(unsigned int)a3
{
  BOOL v4 = -[PS190ProgramBoardIDOTPCommand initWithBoardID:]( objc_alloc(&OBJC_CLASS___PS190ProgramBoardIDOTPCommand),  "initWithBoardID:",  *(void *)&a3);
  BOOL v5 = -[PS190Device sendCommand:](self, "sendCommand:", v4);
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device otpWriteBoardID:].cold.1(log, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return v5;
}

- (BOOL)sendCommandWithData:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[PS190Device fillInCommandRegistersForCommand:](self, "fillInCommandRegistersForCommand:", v4))
  {
    id v5 = [v4 data];
    uint64_t v6 = [v5 bytes];

    id v7 = (id)[v4 data];
    uint64_t v8 = [v7 length];

    unsigned int v9 = -[PS190Device writeBytes:length:](self, "writeBytes:length:", v6, v8);
    if (v9)
    {
      unsigned int v10 = v9;
      if (-[PS190Device submitCommandForProcessing:](self, "submitCommandForProcessing:", v4))
      {
        uint64_t v11 = v8 - v10;
        int v12 = -[PS190Device waitForCommandStatusNotBusy](self, "waitForCommandStatusNotBusy");
        if ((_DWORD)v11) {
          int v13 = 8;
        }
        else {
          int v13 = 16;
        }
        if (v13 == v12)
        {
          if (!(_DWORD)v11)
          {
            BOOL v19 = 1;
            goto LABEL_20;
          }

          uint64_t v14 = v6 + v10;
          while (1)
          {
            unsigned int v15 = -[PS190Device writeBytes:length:](self, "writeBytes:length:", v14, v11);
            if (!v15) {
              break;
            }
            unsigned int v16 = v15;
            if (!-[PS190Device submitDataForProcessing:](self, "submitDataForProcessing:", v4)) {
              break;
            }
            uint64_t v11 = v11 - v16;
            int v17 = -[PS190Device waitForCommandStatusNotBusy](self, "waitForCommandStatusNotBusy");
            int v18 = v17;
            if ((_DWORD)v11 && v17 != 8 || !(_DWORD)v11 && v17 != 16)
            {
              BOOL v24 = PS190StringForCommandStatusCode(v17);
              log = self->_log;
              if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
                break;
              }
              int v26 = 136315906;
              uint64_t v27 = "-[PS190Device sendCommandWithData:]";
              __int16 v28 = 1024;
              int v29 = v18;
              __int16 v30 = 2080;
              unsigned int v31 = v24;
              __int16 v32 = 2112;
              id v33 = v4;
              id v25 = "%s: Unexpected command status 0x%02x (%s) after submitting data request for %@";
              goto LABEL_25;
            }

            v14 += v16;
            BOOL v19 = 1;
            if (!(_DWORD)v11) {
              goto LABEL_20;
            }
          }
        }

        else
        {
          int v20 = v12;
          uint64_t v21 = PS190StringForCommandStatusCode(v12);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            int v26 = 136315906;
            uint64_t v27 = "-[PS190Device sendCommandWithData:]";
            __int16 v28 = 1024;
            int v29 = v20;
            __int16 v30 = 2080;
            unsigned int v31 = v21;
            __int16 v32 = 2112;
            id v33 = v4;
            id v25 = "%s: Unexpected command status 0x%02x (%s) after submitting %@";
LABEL_25:
            _os_log_error_impl(&dword_188FDB000, log, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v26, 0x26u);
          }
        }
      }
    }
  }

  BOOL v19 = 0;
LABEL_20:

  return v19;
}

- (BOOL)sendCommandWithoutData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[PS190Device fillInCommandRegistersForCommand:](self, "fillInCommandRegistersForCommand:", v4)
    || !-[PS190Device submitCommandForProcessing:](self, "submitCommandForProcessing:", v4))
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }

  if (([v4 causesReset] & 1) == 0)
  {
    int v5 = -[PS190Device waitForCommandStatusNotBusy](self, "waitForCommandStatusNotBusy");
    if (v5 != 16)
    {
      int v7 = v5;
      uint64_t v8 = PS190StringForCommandStatusCode(v5);
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315906;
        int v12 = "-[PS190Device sendCommandWithoutData:]";
        __int16 v13 = 1024;
        int v14 = v7;
        __int16 v15 = 2080;
        unsigned int v16 = v8;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "%s: Unexpected command status 0x%02x (%s) after submitting %@",  (uint8_t *)&v11,  0x26u);
      }

      goto LABEL_8;
    }
  }

  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)sendCommand:(id)a3
{
  dumper = self->_dumper;
  id v5 = a3;
  -[PS190PacketDumper dumpCommand:](dumper, "dumpCommand:", v5);
  id v6 = (id)[v5 data];

  if (v6) {
    BOOL v7 = -[PS190Device sendCommandWithData:](self, "sendCommandWithData:", v5);
  }
  else {
    BOOL v7 = -[PS190Device sendCommandWithoutData:](self, "sendCommandWithoutData:", v5);
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)checkForBootFailure
{
  if (-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1510LL, &v26, 2LL))
  {
    BOOL v4 = v26 == 251 && v27 == 250;
    if (v27) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = v26 == 1;
    }
    if (v5 || v4)
    {
      if (v4)
      {
        if (-[PS190Device readRegisterAddress:buffer:length:]( self,  "readRegisterAddress:buffer:length:",  1512LL,  &v25,  1LL))
        {
          PS190StringForErrorCode(v25);
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            -[PS190Device checkForBootFailure].cold.1();
          }
          if (v25 == 22) {
            self->_hostAccessEnabled = 1;
          }
        }

        else
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            -[PS190Device checkForBootFailure].cold.2(log, v17, v18, v19, v20, v21, v22, v23);
          }
        }

        -[PS190Device setBootErrorStatus:](self, "setBootErrorStatus:");
      }

      LOBYTE(v7) = 1;
    }

    else
    {
      id v6 = self->_log;
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        -[PS190Device checkForBootFailure].cold.3(v6, &v26);
LABEL_17:
        LOBYTE(v7) = 0;
      }
    }
  }

  else
  {
    BOOL v8 = self->_log;
    BOOL v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[PS190Device checkForBootFailure].cold.4(v8, v9, v10, v11, v12, v13, v14, v15);
      goto LABEL_17;
    }
  }

  return v7;
}

- (BOOL)checkForRecoveryMode
{
  if (!-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1510LL, v23, 2LL))
  {
    log = self->_log;
    BOOL v3 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[PS190Device checkForRecoveryMode].cold.4(log, v5, v6, v7, v8, v9, v10, v11);
LABEL_15:
    LOBYTE(v3) = 0;
    return v3;
  }

  if (v23[0] != 251 || v23[1] != 250)
  {
    uint64_t v12 = self->_log;
    BOOL v3 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[PS190Device checkForRecoveryMode].cold.1(v12, v23);
    goto LABEL_15;
  }

  if (!-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1512LL, &v22, 1LL))
  {
    uint64_t v13 = self->_log;
    BOOL v3 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[PS190Device checkForRecoveryMode].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_15;
  }

  -[PS190Device setBootErrorStatus:](self, "setBootErrorStatus:", v22);
  if (v22 != 22)
  {
    PS190StringForErrorCode(v22);
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[PS190Device checkForRecoveryMode].cold.2();
    goto LABEL_15;
  }

  LOBYTE(v3) = 1;
  self->_hostAccessEnabled = 1;
  return v3;
}

- (BOOL)checkForApplicationMode
{
  if (-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1510LL, v14, 2LL))
  {
    LOBYTE(v4) = v14[0] == 1 && v14[1] == 0;
  }

  else
  {
    log = self->_log;
    BOOL v4 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[PS190Device checkForApplicationMode].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (void)setBootErrorStatus:(unsigned __int8)a3
{
  self->_bootFailureDetected = 1;
  self->_bootStatus = a3;
}

- (BOOL)updateWithFile:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = [v4 version];
  __int16 v32 = v5;
  char v33 = BYTE2(v5);
  uint64_t v6 = -[PS190InitFirmwareUpdateCommand initWithSubcommand:version:]( objc_alloc(&OBJC_CLASS___PS190InitFirmwareUpdateCommand),  "initWithSubcommand:version:",  0LL,  &v32);
  if (-[PS190Device sendCommand:](self, "sendCommand:", v6))
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = (id)[v4 blocks];
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unsigned __int8 v26 = v6;
      uint64_t v9 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v12 = -[PS190DownloadFirmwareCommand initWithBlock:]( objc_alloc(&OBJC_CLASS___PS190DownloadFirmwareCommand),  "initWithBlock:",  v11);
          if (!-[PS190Device sendCommand:](self, "sendCommand:", v12))
          {
            if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
              -[PS190Device updateWithFile:].cold.1();
            }

            BOOL v16 = 0;
            goto LABEL_17;
          }

          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          uint64_t v14 = [v11 number] + 1;
          id v15 = (id)[v4 blocks];
          objc_msgSend(WeakRetained, "firmwareBlocksSent:blocksTotal:", v14, objc_msgSend(v15, "count"));
        }

        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      BOOL v16 = 1;
LABEL_17:
      uint64_t v6 = v26;
    }

    else
    {
      BOOL v16 = 1;
    }
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device updateWithFile:].cold.2(log, v18, v19, v20, v21, v22, v23, v24);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)commitWithReset
{
  BOOL v3 = -[PS190CommitFirmwareUpdateCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190CommitFirmwareUpdateCommand),  "initWithSubcommand:",  1LL);
  LOBYTE(self) = -[PS190Device sendCommand:](self, "sendCommand:", v3);

  return (char)self;
}

- (BOOL)commitWithoutReset
{
  BOOL v3 = -[PS190CommitFirmwareUpdateCommand initWithSubcommand:]( objc_alloc(&OBJC_CLASS___PS190CommitFirmwareUpdateCommand),  "initWithSubcommand:",  0LL);
  BOOL v4 = -[PS190Device sendCommand:](self, "sendCommand:", v3);
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[PS190Device commitWithoutReset].cold.1(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return v4;
}

- (void)resetToRecoveryMode
{
  BOOL v3 = -[PS190ResetCommand initWithSubcommand:](objc_alloc(&OBJC_CLASS___PS190ResetCommand), "initWithSubcommand:", 2LL);
  -[PS190Device sendCommand:](self, "sendCommand:", v3);
}

- (void)resetToAppLoad
{
  BOOL v3 = -[PS190ResetCommand initWithSubcommand:](objc_alloc(&OBJC_CLASS___PS190ResetCommand), "initWithSubcommand:", 1LL);
  -[PS190Device sendCommand:](self, "sendCommand:", v3);
}

- (BOOL)writeRegisterAddress:(unsigned int)a3 data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  return -[PS190Device writeRegisterAddress:bytes:length:](self, "writeRegisterAddress:bytes:length:", v4, v7, v8);
}

- (BOOL)startPacketDumperWithFileName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PS190PacketDumper initWithFileName:](objc_alloc(&OBJC_CLASS___PS190PacketDumper), "initWithFileName:", v4);

  dumper = self->_dumper;
  self->_dumper = v5;

  return self->_dumper != 0LL;
}

- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  int v9 = -[PS190DeviceHandle writeRegisterAddress:bytes:length:]( self->_deviceHandle,  "writeRegisterAddress:bytes:length:");
  if (v9) {
    -[PS190PacketDumper dumpDPCDRegisterWrite:bytes:length:]( self->_dumper,  "dumpDPCDRegisterWrite:bytes:length:",  v7,  a4,  v5);
  }
  return v9;
}

- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  int v9 = -[PS190DeviceHandle readRegisterAddress:buffer:length:]( self->_deviceHandle,  "readRegisterAddress:buffer:length:");
  if (v9) {
    -[PS190PacketDumper dumpDPCDRegisterRead:bytes:length:]( self->_dumper,  "dumpDPCDRegisterRead:bytes:length:",  v7,  a4,  v5);
  }
  return v9;
}

- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  int v9 = -[PS190DeviceHandle readRegisterAddressNoErrorLog:buffer:length:]( self->_deviceHandle,  "readRegisterAddressNoErrorLog:buffer:length:");
  if (v9) {
    -[PS190PacketDumper dumpDPCDRegisterRead:bytes:length:]( self->_dumper,  "dumpDPCDRegisterRead:bytes:length:",  v7,  a4,  v5);
  }
  return v9;
}

- (id)queryInstanceID
{
  unsigned __int8 v3 = 0;
  if (-[PS190Device readRegisterAddress:buffer:length:](self, "readRegisterAddress:buffer:length:", 1339LL, &v3, 1LL)) {
    return (id)[MEMORY[0x189607968] numberWithUnsignedChar:(v3 >> 6) & 1];
  }
  else {
    return 0LL;
  }
}

- (PS190DeviceDelegate)delegate
{
  return (PS190DeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)bootFailureDetected
{
  return self->_bootFailureDetected;
}

- (unsigned)bootStatus
{
  return self->_bootStatus;
}

- (BOOL)hostAccessEnabled
{
  return self->_hostAccessEnabled;
}

- (PS190PacketDumper)dumper
{
  return (PS190PacketDumper *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDumper:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fillInCommandRegistersForCommand:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_188FDB000, v0, v1, "%s: Failed to write command packet for %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)submitCommandForProcessing:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_188FDB000, v0, v1, "%s: Failed to submit %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)submitDataForProcessing:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_188FDB000, v0, v1, "%s: Failed to submit %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)readCommandStatus:(os_log_t)log .cold.1(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[PS190Device readCommandStatus:]";
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "%s: Detected '%s' error (0x%02x)",  (uint8_t *)&v4,  0x1Cu);
}

- (void)readCommandStatus:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)waitForCommandStatusNotBusy
{
}

- (void)readData:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_188FDB000, v0, v1, "%s: Failed to read %u byte(s)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)writeBytes:length:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_188FDB000, v0, v1, "%s: Failed to write %u byte(s)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)queryHardwareRevision:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)otpWriteSecurityDomain:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)otpWriteProductionMode:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)otpWriteBoardID:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)checkForBootFailure
{
}

- (void)checkForRecoveryMode
{
}

- (void)checkForApplicationMode
{
}

- (void)updateWithFile:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_188FDB000, v0, v1, "%s: Failed to download %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithFile:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)commitWithoutReset
{
}

@end
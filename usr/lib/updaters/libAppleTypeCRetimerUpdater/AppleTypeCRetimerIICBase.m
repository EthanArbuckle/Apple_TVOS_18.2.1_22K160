@interface AppleTypeCRetimerIICBase
- (AppleTypeCRetimerIICBase)initWithDeviceHandle:(id)a3;
- (NSString)bverString;
- (NSString)internalFirmwareVersion;
- (OS_os_log)log;
- (id)queryChipInfo:(id *)a3;
- (id)queryHardwareID:(id *)a3;
- (id)queryRetimerPanicStatus:(id *)a3;
- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5;
@end

@implementation AppleTypeCRetimerIICBase

- (AppleTypeCRetimerIICBase)initWithDeviceHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICBase;
  v6 = -[AppleTypeCRetimerIICBase init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  return -[AppleTypeCRetimerDeviceHandle readRegister:buffer:length:]( self->_handle,  "readRegister:buffer:length:",  a3,  a4,  *(void *)&a5);
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  return -[AppleTypeCRetimerDeviceHandle writeRegister:buffer:length:]( self->_handle,  "writeRegister:buffer:length:",  a3,  a4,  *(void *)&a5);
}

- (NSString)bverString
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  char v7 = 0;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if (-[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 15LL, v5, 64LL)
    || -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 16LL, v6, 64LL))
  {
    v3 = 0LL;
  }

  else
  {
    [NSString stringWithUTF8String:v5];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)internalFirmwareVersion
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  char v7 = 0;
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  if (-[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 10LL, v5, 64LL)
    || -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 11LL, v6, 64LL))
  {
    v3 = 0LL;
  }

  else
  {
    [NSString stringWithUTF8String:v5];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (id)queryChipInfo:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = (void *)MEMORY[0x189607940];
  v6 = -[AppleTypeCRetimerDeviceHandle name](self->_handle, "name");
  [v5 stringWithFormat:@"%@:\n", v6];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();

  int v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 0LL, &v15, 4LL);
  if (!v8)
  {
    objc_msgSend(v7, "appendFormat:", @"\tVendor ID: 0x%04x\n", v15);
    int v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 1LL, &v14, 4LL);
    if (!v8)
    {
      objc_msgSend(v7, "appendFormat:", @"\tDevice ID: 0x%04x\n", v14);
      memset(v23, 0, 65);
      memset(v22, 0, sizeof(v22));
      int v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 10LL, v22, 64LL);
      if (!v8)
      {
        int v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:]( self,  "readRegister:buffer:length:",  11LL,  v23,  64LL);
        if (!v8)
        {
          objc_msgSend(v7, "appendFormat:", @"\tInternal FW Version: %s\n", v22);
          unsigned __int8 v21 = 0;
          memset(v20, 0, sizeof(v20));
          __int128 v19 = 0u;
          int v8 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:]( self,  "readRegister:buffer:length:",  14LL,  &v19,  49LL);
          if (!v8)
          {
            [v7 appendString:@"\tHardware ID:\n"];
            objc_msgSend(v7, "appendFormat:", @"\t\tChip ID: 0x%02x\n", (unsigned __int16)v19);
            objc_msgSend(v7, "appendFormat:", @"\t\tBoard ID: 0x%04x\n", WORD1(v19));
            objc_msgSend(v7, "appendFormat:", @"\t\tSecurity Epoch: %u\n", BYTE4(v19));
            objc_msgSend(v7, "appendFormat:", @"\t\tProduction Status: %u\n", BYTE5(v19));
            objc_msgSend(v7, "appendFormat:", @"\t\tSecurity Mode: %u\n", BYTE6(v19));
            objc_msgSend(v7, "appendFormat:", @"\t\tSecurity Domain: %u\n", BYTE7(v19));
            objc_msgSend(v7, "appendFormat:", @"\t\tECID: 0x%016llx\n", *((void *)&v19 + 1));
            [MEMORY[0x189603F48] dataWithBytes:v20 length:32];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 byteString];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 appendFormat:@"\t\tNonce: %@\n", v12];

            objc_msgSend(v7, "appendFormat:", @"\t\tChip Revision: %u\n", v21);
            char v18 = 0;
            memset(v17, 0, sizeof(v17));
            memset(v16, 0, sizeof(v16));
            int v13 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:]( self,  "readRegister:buffer:length:",  15LL,  v16,  64LL);
            if (v13)
            {
              if (a3)
              {
LABEL_12:
                [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v13 userInfo:0];
                objc_super v9 = 0LL;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

                goto LABEL_9;
              }
            }

            else
            {
              int v13 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:]( self,  "readRegister:buffer:length:",  16LL,  v17,  64LL);
              if (!v13)
              {
                objc_msgSend(v7, "appendFormat:", @"\tVersion: %s\n", v16);
                [NSString stringWithDescString:v7];
                objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }

              if (a3) {
                goto LABEL_12;
              }
            }

            objc_super v9 = 0LL;
            goto LABEL_17;
          }
        }
      }
    }
  }

  if (a3)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v8 userInfo:0];
    objc_super v9 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_super v9 = 0LL;
  }

- (id)queryHardwareID:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  hardwareID = self->_hardwareID;
  if (hardwareID) {
    return hardwareID;
  }
  char v16 = 0;
  memset(v15, 0, sizeof(v15));
  __int128 v14 = 0u;
  int v7 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 14LL, &v14, 49LL);
  if (v7)
  {
    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v7 userInfo:0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  else
  {
    [MEMORY[0x189603F48] dataWithBytes:v15 length:32];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v9 = objc_alloc(&OBJC_CLASS___AppleTypeCRetimerHardwareID);
    LOBYTE(v13) = v16;
    v10 = -[AppleTypeCRetimerHardwareID initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:]( v9,  "initWithChipID:boardID:securityEpoch:productionStatus:securityMode:securityDomain:ecid:nonce:chipRev:",  (unsigned __int16)v14,  WORD1(v14),  BYTE4(v14),  BYTE5(v14),  BYTE6(v14),  BYTE7(v14),  *((void *)&v14 + 1),  v8,  v13);
    v11 = self->_hardwareID;
    self->_hardwareID = v10;

    v12 = self->_hardwareID;
    return v12;
  }

- (id)queryRetimerPanicStatus:(id *)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  int v4 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 17LL, &v9, 8LL);
  if (!v4) {
    return  -[AppleTypeCRetimerPanicStatus initWithPanicState:assertID:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerPanicStatus),  "initWithPanicState:assertID:",  v9 & 1,  HIDWORD(v9));
  }
  if (a3)
  {
    int v5 = v4;
    uint64_t v10 = *MEMORY[0x1896075E0];
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s: Error reading from register %s(%x)",  "-[AppleTypeCRetimerIICBase queryRetimerPanicStatus:]",  "ATCRT_REG_PANIC_STATUS",  17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607630] code:v5 userInfo:v7];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (OS_os_log)log
{
  return (OS_os_log *)-[AppleTypeCRetimerDeviceHandle log](self->_handle, "log");
}

- (void).cxx_destruct
{
}

@end
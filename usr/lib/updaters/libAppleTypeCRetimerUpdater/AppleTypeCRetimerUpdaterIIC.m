@interface AppleTypeCRetimerUpdaterIIC
+ (id)getDeviceNames;
+ (id)getRouterIDs;
- (AppleTypeCRetimerUpdaterIIC)initWithRouterID:(unsigned __int8)a3;
- (AppleTypeCRetimerUpdaterIICDelegate)delegate;
- (BOOL)startPacketDumperWithFileName:(id)a3;
- (BOOL)updateWithFTAB:(id)a3;
- (NSString)bverString;
- (NSString)internalFirmwareVersion;
- (id)queryChipInfo:(id *)a3;
- (id)queryHardwareID:(id *)a3;
- (id)queryPanicStatus:(id *)a3;
- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4;
- (void)performReset;
- (void)setDelegate:(id)a3;
@end

@implementation AppleTypeCRetimerUpdaterIIC

+ (id)getDeviceNames
{
  return IICGetDeviceNamesWithPrefix(@"atcrt");
}

+ (id)getRouterIDs
{
  return AppleTypeCRetimerGetRouterIDsForIicPrefix(@"atcrt");
}

- (AppleTypeCRetimerUpdaterIIC)initWithRouterID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerUpdaterIIC;
  v4 = -[AppleTypeCRetimerUpdaterIIC init](&v14, sel_init);
  if (!v4) {
    goto LABEL_4;
  }
  os_log_t v5 = os_log_create("com.apple.accessoryupdater.atcrt", "update");
  log = v4->_log;
  v4->_log = v5;

  v7 = -[AppleTypeCRetimerIICDeviceHandle initWithRouterID:namePrefix:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIICDeviceHandle),  "initWithRouterID:namePrefix:",  v3,  @"atcrt");
  if (v7)
  {
    v8 = v7;
    v9 = -[AppleTypeCRetimerIICBase initWithDeviceHandle:]( objc_alloc(&OBJC_CLASS___AppleTypeCRetimerIIC),  "initWithDeviceHandle:",  v7);
    iic = v4->_iic;
    v4->_iic = v9;

    -[AppleTypeCRetimerIIC setDelegate:](v4->_iic, "setDelegate:", v4);
LABEL_4:
    v11 = v4;
    goto LABEL_8;
  }

  v12 = v4->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerUpdaterIIC initWithRouterID:].cold.1(v3, v12);
  }
  v11 = 0LL;
LABEL_8:

  return v11;
}

- (BOOL)updateWithFTAB:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 bverString];
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      v31 = v5;
      _os_log_impl(&dword_189540000, log, OS_LOG_TYPE_INFO, "Updating to version: %@", (uint8_t *)&v30, 0xCu);
    }
  }

  [v4 subfileWithTag:@"rkos"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)[v4 copy];
    [v8 removeSubfileWithTag:@"rrko"];
    [v8 writeToData];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    iic = self->_iic;
    id v11 = v9;
    BOOL v12 = -[AppleTypeCRetimerIIC transferFirmware:length:]( iic,  "transferFirmware:length:",  [v11 bytes],  objc_msgSend(v11, "length"));
    if (!v12)
    {
      v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }

  else
  {
    v21 = self->_log;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerUpdaterIIC updateWithFTAB:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (void)performReset
{
}

- (void)bytesSent:(unsigned int)a3 bytesTotal:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bytesSent:v5 bytesTotal:v4];
}

- (NSString)bverString
{
  return -[AppleTypeCRetimerIICBase bverString](self->_iic, "bverString");
}

- (NSString)internalFirmwareVersion
{
  return -[AppleTypeCRetimerIICBase internalFirmwareVersion](self->_iic, "internalFirmwareVersion");
}

- (BOOL)startPacketDumperWithFileName:(id)a3
{
  return -[AppleTypeCRetimerIIC startPacketDumperWithFileName:](self->_iic, "startPacketDumperWithFileName:", a3);
}

- (id)queryHardwareID:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryHardwareID:](self->_iic, "queryHardwareID:", a3);
}

- (id)queryChipInfo:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryChipInfo:](self->_iic, "queryChipInfo:", a3);
}

- (id)queryPanicStatus:(id *)a3
{
  return -[AppleTypeCRetimerIICBase queryRetimerPanicStatus:](self->_iic, "queryRetimerPanicStatus:", a3);
}

- (AppleTypeCRetimerUpdaterIICDelegate)delegate
{
  return (AppleTypeCRetimerUpdaterIICDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithRouterID:(unsigned __int8)a1 .cold.1(unsigned __int8 a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_189540000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to locate retimer for router ID %u",  (uint8_t *)v2,  8u);
}

- (void)updateWithFTAB:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)updateWithFTAB:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end
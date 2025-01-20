@interface PS190IICDevice
+ (id)allDeviceNames;
+ (id)allDevices;
+ (id)first;
- (BOOL)initIICService;
- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5;
- (NSString)serviceName;
- (PS190IICDevice)initWithInstanceID:(unsigned int)a3;
- (int)readAddress:(const void *)a3 readAddressSize:(unint64_t)a4 buffer:(void *)outputStruct bufferLength:(unint64_t)a6;
- (int)writeBuffer:(id)a3;
- (unsigned)instanceID;
- (void)dealloc;
- (void)initIICService;
@end

@implementation PS190IICDevice

+ (id)allDeviceNames
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v2 = _getAllInstanceIDs();
  id v3 = (id)[MEMORY[0x189603FA8] array];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)NSString;
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) unsignedIntValue];
        id v11 = (id)[v9 stringWithFormat:@"%@%u", @"pcon", v10, (void)v14];
        [v3 addObject:v11];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  id v12 = (id)[MEMORY[0x189603F18] arrayWithArray:v3];
  return v12;
}

+ (id)first
{
  id v2 = +[PS190IICDevice allDevices](&OBJC_CLASS___PS190IICDevice, "allDevices");
  id v3 = (id)[v2 firstObject];

  return v3;
}

+ (id)allDevices
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v2 = _getAllInstanceIDs();
  id v3 = (id)[MEMORY[0x189603FA8] array];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        uint64_t v10 = objc_alloc(&OBJC_CLASS___PS190IICDevice);
        id v11 = -[PS190IICDevice initWithInstanceID:]( v10,  "initWithInstanceID:",  objc_msgSend(v9, "unsignedIntValue", (void)v14));
        if (v11) {
          [v3 addObject:v11];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  id v12 = (id)[MEMORY[0x189603F18] arrayWithArray:v3];
  return v12;
}

- (PS190IICDevice)initWithInstanceID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PS190IICDevice;
  id v4 = -[PS190IICDevice init](&v11, sel_init);
  if (!v4) {
    goto LABEL_3;
  }
  os_log_t v5 = os_log_create("com.apple.accessoryupdater.ps190", "iicDevice");
  log = v4->_log;
  v4->_log = v5;

  v4->_instanceID = v3;
  uint64_t v7 = (NSString *)(id)[NSString stringWithFormat:@"%@%u", @"pcon", v3];
  serviceName = v4->_serviceName;
  v4->_serviceName = v7;

  if (!-[PS190IICDevice initIICService](v4, "initIICService")) {
    v9 = 0LL;
  }
  else {
LABEL_3:
  }
    v9 = v4;

  return v9;
}

- (BOOL)initIICService
{
  kern_return_t v6;
  BOOL v7;
  io_connect_t connect;
  p_serviceName = &self->_serviceName;
  id v4 = IOServiceNameMatching(-[NSString UTF8String](self->_serviceName, "UTF8String"));
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v4);
  *((_DWORD *)p_serviceName - 4) = MatchingService;
  if (MatchingService)
  {
    uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    uint64_t v7 = v6 == 0;
    if (v6)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[PS190IICDevice initIICService].cold.2();
      }
    }

    else
    {
      self->_connection = connect;
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[PS190IICDevice initIICService].cold.1();
    }
    return 0;
  }

  return v7;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  io_connect_t connection = self->_connection;
  if (connection)
  {
    IOServiceClose(connection);
    self->_io_connect_t connection = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190IICDevice;
  -[PS190IICDevice dealloc](&v5, sel_dealloc);
}

- (int)writeBuffer:(id)a3
{
  kern_return_t v7;
  mach_port_t v8;
  id v9;
  id v4 = a3;
  mach_port_t connection = self->_connection;
  id v6 = v4;
  uint64_t v7 = IOConnectCallMethod( connection,  0,  0,  0,  (const void *)[v6 bytes],  objc_msgSend(v6, "length"),  0,  0,  0,  0);
  if (v7 == -536870167)
  {
    usleep(0x186A0u);
    uint64_t v8 = self->_connection;
    v9 = v6;
    uint64_t v7 = IOConnectCallMethod( v8,  0,  0,  0,  (const void *)[v9 bytes],  objc_msgSend(v9, "length"),  0,  0,  0,  0);
  }

  return v7;
}

- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if ((a3 & 0xFFFFFFFB) == 0x5D2) {
    unsigned __int8 v8 = 16 * (a3 != 1490);
  }
  else {
    unsigned __int8 v8 = a3;
  }
  if ((a3 & 0xFFFFFFFB) == 0x5D2) {
    char v9 = -1;
  }
  else {
    char v9 = 4;
  }
  v14[0] = v9;
  v14[1] = v8;
  id v10 = (id)[MEMORY[0x189603FB8] dataWithBytes:v14 length:2];
  [v10 appendBytes:a4 length:a5];
  int v11 = -[PS190IICDevice writeBuffer:](self, "writeBuffer:", v10);
  if (v11)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      int v16 = v8;
      __int16 v17 = 1024;
      unsigned int v18 = a5;
      __int16 v19 = 1024;
      int v20 = v11;
      _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "IIC failed to write address 0x%x length %u (0x%08x)",  buf,  0x14u);
    }
  }

  return v11 == 0;
}

- (int)readAddress:(const void *)a3 readAddressSize:(unint64_t)a4 buffer:(void *)outputStruct bufferLength:(unint64_t)a6
{
  size_t outputStructCnt = a6;
  int result = IOConnectCallMethod(self->_connection, 0, 0LL, 0, a3, a4, 0LL, 0LL, outputStruct, &outputStructCnt);
  if (result == -536870167)
  {
    usleep(0x186A0u);
    mach_port_t connection = self->_connection;
    size_t v13 = a6;
    return IOConnectCallMethod(connection, 0, 0LL, 0, a3, a4, 0LL, 0LL, outputStruct, &v13);
  }

  return result;
}

- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v11[0] = 4;
  v11[1] = a3;
  int v8 = -[PS190IICDevice readAddress:readAddressSize:buffer:bufferLength:]( self,  "readAddress:readAddressSize:buffer:bufferLength:",  v11,  2LL,  a4,  a5);
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      unsigned int v13 = a3;
      __int16 v14 = 1024;
      unsigned int v15 = a5;
      __int16 v16 = 1024;
      int v17 = v8;
      _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "IIC failed to read address 0x%x length %u (0x%08x)",  buf,  0x14u);
    }
  }

  return v8 == 0;
}

- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  v6[0] = 4;
  v6[1] = a3;
  return -[PS190IICDevice readAddress:readAddressSize:buffer:bufferLength:]( self,  "readAddress:readAddressSize:buffer:bufferLength:",  v6,  2LL,  a4,  a5) == 0;
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initIICService
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_188FDB000,  v1,  OS_LOG_TYPE_ERROR,  "%s: Unable to open connection to %@ (0x%08x)",  (uint8_t *)v2,  0x1Cu);
}

@end
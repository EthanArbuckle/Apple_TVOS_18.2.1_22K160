@interface PCONUserClient
- (BOOL)disablePCON;
- (BOOL)enablePCON;
- (BOOL)getPCONStatus;
- (PCONUserClient)initWithInstanceID:(unsigned int)a3;
- (unsigned)instanceID;
- (void)dealloc;
- (void)disablePCON;
- (void)enablePCON;
- (void)getPCONStatus;
@end

@implementation PCONUserClient

- (PCONUserClient)initWithInstanceID:(unsigned int)a3
{
  kern_return_t v11;
  int v12;
  os_log_s *v13;
  os_log_s *v14;
  PCONUserClient *v15;
  objc_super v17;
  CFStringRef v18;
  void v19[2];
  uint64_t v3 = *(void *)&a3;
  v19[1] = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PCONUserClient;
  v4 = -[PCONUserClient init](&v17, sel_init);
  if (!v4) {
    goto LABEL_10;
  }
  os_log_t v5 = os_log_create("com.apple.accessoryupdater.ps190", "pconUserClient");
  log = v4->_log;
  v4->_log = v5;

  v7 = IOServiceMatching("AppleHDMIPortController");
  v18 = @"HDMIPortID";
  id v8 = (id)[MEMORY[0x189607968] numberWithUnsignedInt:v3];
  v19[0] = v8;
  id v9 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"IOPropertyMatch");

  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v7);
  v4->_service = MatchingService;
  if (!MatchingService)
  {
    v14 = v4->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PCONUserClient initWithInstanceID:].cold.1(v3, v14);
    }
    goto LABEL_8;
  }

  v11 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &v4->_connection);
  if (!v11)
  {
    v4->_instanceID = v3;
LABEL_10:
    v15 = v4;
    goto LABEL_11;
  }

  v12 = v11;
  v13 = v4->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PCONUserClient initWithInstanceID:].cold.2(v3, v12, v13);
  }
LABEL_8:
  v15 = 0LL;
LABEL_11:

  return v15;
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
  v5.super_class = (Class)&OBJC_CLASS___PCONUserClient;
  -[PCONUserClient dealloc](&v5, sel_dealloc);
}

- (BOOL)enablePCON
{
  kern_return_t v3;
  uint64_t v3 = IOConnectCallMethod(self->_connection, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v3 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PCONUserClient enablePCON].cold.1();
  }
  return v3 == 0;
}

- (BOOL)disablePCON
{
  kern_return_t v3;
  uint64_t v3 = IOConnectCallMethod(self->_connection, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (v3 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[PCONUserClient disablePCON].cold.1();
  }
  return v3 == 0;
}

- (BOOL)getPCONStatus
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  if (IOConnectCallMethod(self->_connection, 2u, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL))
  {
    BOOL v3 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[PCONUserClient getPCONStatus].cold.1();
      LOBYTE(v3) = 0;
    }
  }

  else
  {
    LOBYTE(v3) = output != 0;
  }

  return v3;
}

- (unsigned)instanceID
{
  return self->_instanceID;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initWithInstanceID:(int)a1 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_188FDB000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to locate PCON service for instance ID %u",  (uint8_t *)v2,  8u);
}

- (void)initWithInstanceID:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "Failed to connect to PCON service for instance ID %u (0x%08x)",  (uint8_t *)v3,  0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)enablePCON
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_188FDB000, v0, v1, "%s: Failed for instance ID %u (0x%08x)", v2, v3, v4);
  OUTLINED_FUNCTION_1();
}

- (void)disablePCON
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_188FDB000, v0, v1, "%s: Failed for instance ID %u (0x%08x)", v2, v3, v4);
  OUTLINED_FUNCTION_1();
}

- (void)getPCONStatus
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_188FDB000, v0, v1, "%s: Failed for instance ID %u (0x%08x)", v2, v3, v4);
  OUTLINED_FUNCTION_1();
}

@end
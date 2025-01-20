@interface AppleTypeCRetimerIICDeviceHandle
- (AppleTypeCRetimerIICDeviceHandle)initWithRouterID:(unsigned __int8)a3 namePrefix:(id)a4;
- (BOOL)initIICServiceForRouterID:(unsigned __int8)a3;
- (NSString)name;
- (OS_os_log)log;
- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5;
- (void)dealloc;
@end

@implementation AppleTypeCRetimerIICDeviceHandle

- (AppleTypeCRetimerIICDeviceHandle)initWithRouterID:(unsigned __int8)a3 namePrefix:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICDeviceHandle;
  v7 = -[AppleTypeCRetimerIICDeviceHandle init](&v14, sel_init);
  if (!v7) {
    goto LABEL_3;
  }
  os_log_t v8 = os_log_create("com.apple.accessoryupdater.atcrt", "retimer");
  log = v7->_log;
  v7->_log = v8;

  uint64_t v10 = [NSString stringWithFormat:@"%@%u", v6, v4];
  serviceName = v7->_serviceName;
  v7->_serviceName = (NSString *)v10;

  if (!-[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:](v7, "initIICServiceForRouterID:", v4)) {
    v12 = 0LL;
  }
  else {
LABEL_3:
  }
    v12 = v7;

  return v12;
}

- (BOOL)initIICServiceForRouterID:(unsigned __int8)a3
{
  kern_return_t v7;
  BOOL v8;
  io_connect_t connect;
  p_serviceName = &self->_serviceName;
  v5 = IOServiceNameMatching(-[NSString UTF8String](self->_serviceName, "UTF8String", a3));
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1896086B0], v5);
  *((_DWORD *)p_serviceName + 2) = MatchingService;
  if (MatchingService)
  {
    v7 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    os_log_t v8 = v7 == 0;
    if (v7)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:].cold.2();
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
      -[AppleTypeCRetimerIICDeviceHandle initIICServiceForRouterID:].cold.1();
    }
    return 0;
  }

  return v8;
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
  v5.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerIICDeviceHandle;
  -[AppleTypeCRetimerIICDeviceHandle dealloc](&v5, sel_dealloc);
}

- (int)readRegister:(unsigned __int8)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  kern_return_t v9;
  OS_os_log *log;
  size_t v12;
  unsigned __int8 inputStruct;
  uint64_t v5 = *(void *)&a5;
  inputStruct = a3;
  v12 = a5 + 1;
  outputStruct = (unsigned __int8 *)calloc(v12, 1uLL);
  v9 = IOConnectCallMethod(self->_connection, 0, 0LL, 0, &inputStruct, 1uLL, 0LL, 0LL, outputStruct, &v12);
  if (v9)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:].cold.2();
    }
    goto LABEL_9;
  }

  if (*outputStruct >= v5)
  {
    memcpy(a4, outputStruct + 1, v5);
LABEL_9:
    free(outputStruct);
    return v9;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:].cold.1(outputStruct, v5, log);
  }
  free(outputStruct);
  return -536870169;
}

- (int)writeRegister:(unsigned __int8)a3 buffer:(const void *)a4 length:(unsigned int)a5
{
  kern_return_t v5;
  _BYTE *v10;
  if (a5 > 0xFF) {
    return -536870206;
  }
  uint64_t v10 = calloc(a5 + 2, 1uLL);
  *uint64_t v10 = a3;
  v10[1] = a5;
  memcpy(v10 + 2, a4, a5);
  uint64_t v5 = IOConnectCallMethod(self->_connection, 0, 0LL, 0, v10, a5 + 2LL, 0LL, 0LL, 0LL, 0LL);
  if (v5 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[AppleTypeCRetimerIICDeviceHandle writeRegister:buffer:length:].cold.1();
  }
  free(v10);
  return v5;
}

- (NSString)name
{
  return self->_serviceName;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

- (void)initIICServiceForRouterID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_189540000, v0, OS_LOG_TYPE_ERROR, "%s: Unable to locate %@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)initIICServiceForRouterID:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl( &dword_189540000,  v1,  OS_LOG_TYPE_ERROR,  "%s: Unable to open connection to %@ (0x%08x)",  (uint8_t *)v2,  0x1Cu);
}

- (void)readRegister:(unsigned __int8 *)a1 buffer:(uint64_t)a2 length:(os_log_s *)a3 .cold.1( unsigned __int8 *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)__int16 v3 = 136315650;
  *(void *)&v3[4] = "-[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:]";
  *(_DWORD *)&v3[14] = *a1;
  *(_WORD *)&v3[18] = 1024;
  OUTLINED_FUNCTION_0_0( &dword_189540000,  a2,  a3,  "%s: Read %u bytes, expected %u",  *(const char **)v3,  (unint64_t)"-[AppleTypeCRetimerIICDeviceHandle readRegister:buffer:length:]" >> 32,  *(_DWORD *)&v3[16]);
  OUTLINED_FUNCTION_3();
}

- (void)readRegister:buffer:length:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_189540000, v0, OS_LOG_TYPE_ERROR, "%s: Read result 0x%08x", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)writeRegister:buffer:length:.cold.1()
{
  LODWORD(v3) = 136315650;
  OUTLINED_FUNCTION_1_0();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_0_0(&dword_189540000, v1, v2, "%s: Write result 0x%08x, length = %u", v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
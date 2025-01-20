@interface AppleTypeCRetimerHPM
- (AppleTypeCRetimerHPM)initWithHPMService:(unsigned int)a3 routerID:(unsigned __int8)a4 deviceService:(unsigned int)a5;
- (BOOL)getAddressForDeviceService:(unsigned int)a3;
- (BOOL)initPluginInterfaceForService:(unsigned int)a3;
- (int)forceRetimerPower:(BOOL)a3;
- (int)forceUpdateMode:(BOOL)a3;
- (void)dealloc;
@end

@implementation AppleTypeCRetimerHPM

- (AppleTypeCRetimerHPM)initWithHPMService:(unsigned int)a3 routerID:(unsigned __int8)a4 deviceService:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerHPM;
  v8 = -[AppleTypeCRetimerHPM init](&v13, sel_init);
  if (!v8
    || (os_log_t v9 = os_log_create("com.apple.accessoryupdater.atcrt", "hpm"),
        log = v8->_log,
        v8->_log = v9,
        log,
        v8->_routerID = a4,
        -[AppleTypeCRetimerHPM initPluginInterfaceForService:](v8, "initPluginInterfaceForService:", v7))
    && -[AppleTypeCRetimerHPM getAddressForDeviceService:](v8, "getAddressForDeviceService:", v5))
  {
    v11 = v8;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (void)dealloc
{
  deviceInterface = self->_deviceInterface;
  if (deviceInterface)
  {
    (*((void (**)(AppleHPMLibInterfaceStructV3 **, SEL))*deviceInterface + 3))(deviceInterface, a2);
    self->_deviceInterface = 0LL;
  }

  cfPlugInInterface = self->_cfPlugInInterface;
  if (cfPlugInInterface)
  {
    IODestroyPlugInInterface(cfPlugInInterface);
    self->_cfPlugInInterface = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AppleTypeCRetimerHPM;
  -[AppleTypeCRetimerHPM dealloc](&v5, sel_dealloc);
}

- (BOOL)initPluginInterfaceForService:(unsigned int)a3
{
  SInt32 theScore = 0;
  objc_super v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x12u,  0xA1u,  0xDCu,  0xCFu,  0xCFu,  0x7Au,  0x47u,  0x75u,  0xBEu,  0xE5u,  0x9Cu,  0x43u,  0x19u,  0xF4u,  0xCDu,  0x2Bu);
  v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  if (IOCreatePlugInInterfaceForService(a3, v5, v6, &self->_cfPlugInInterface, &theScore))
  {
    log = self->_log;
    BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      -[AppleTypeCRetimerHPM initPluginInterfaceForService:].cold.1(log, v9, v10, v11, v12, v13, v14, v15);
LABEL_7:
      LOBYTE(v8) = 0;
    }
  }

  else
  {
    cfPlugInInterface = self->_cfPlugInInterface;
    QueryInterface = (*cfPlugInInterface)->QueryInterface;
    v18 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0xCFu,  0xCAu,  0x49u,  0xA5u,  0xEFu,  0xB5u,  0x47u,  0x6Bu,  0xA2u,  0xF0u,  0x21u,  9u,  0x86u,  0x1Cu,  0xAAu,  4u);
    CFUUIDBytes v19 = CFUUIDGetUUIDBytes(v18);
    LODWORD(cfPlugInInterface) = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, AppleHPMLibInterfaceStructV3 ***))QueryInterface)( cfPlugInInterface,  *(void *)&v19.byte0,  *(void *)&v19.byte8,  &self->_deviceInterface);
    v20 = self->_log;
    BOOL v8 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)cfPlugInInterface)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_189540000, v20, OS_LOG_TYPE_DEFAULT, "HPM v3 interface not supported.", buf, 2u);
        goto LABEL_7;
      }
    }

    else
    {
      if (v8)
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_189540000, v20, OS_LOG_TYPE_DEFAULT, "HPM v3 interface supported.", v22, 2u);
      }

      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (BOOL)getAddressForDeviceService:(unsigned int)a3
{
  kern_return_t v4;
  int v5;
  OS_os_log *log;
  char isKindOfClass;
  void *v8;
  OS_os_log *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFMutableDictionaryRef properties;
  v4 = IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if (v4)
  {
    objc_super v5 = v4;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerHPM getAddressForDeviceService:].cold.2(v5, log);
    }
    isKindOfClass = 0;
  }

  else
  {
    CFDictionaryGetValue(properties, @"Address");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      self->_address = [v8 unsignedIntValue];
    }

    else
    {
      uint64_t v9 = self->_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerHPM getAddressForDeviceService:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    CFRelease(properties);
  }

  return isKindOfClass & 1;
}

- (int)forceRetimerPower:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = "off";
    int routerID = self->_routerID;
    if (v3) {
      v6 = "on";
    }
    int v13 = 136315394;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = routerID;
    _os_log_impl(&dword_189540000, log, OS_LOG_TYPE_INFO, "Force power %s [RID=%u]", (uint8_t *)&v13, 0x12u);
  }

  int v8 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, BOOL, void))*self->_deviceInterface + 16))( self->_deviceInterface,  self->_address,  v3,  0LL);
  if (v8)
  {
    uint64_t v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = "off";
      int v12 = self->_routerID;
      int v13 = 136315650;
      if (v3) {
        uint64_t v11 = "on";
      }
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_error_impl( &dword_189540000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to force power %s (0x%08x) [RID=%u]",  (uint8_t *)&v13,  0x18u);
    }
  }

  return v8;
}

- (int)forceUpdateMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = "off";
    int routerID = self->_routerID;
    if (v3) {
      v6 = "on";
    }
    int v13 = 136315394;
    uint64_t v14 = v6;
    __int16 v15 = 1024;
    int v16 = routerID;
    _os_log_impl(&dword_189540000, log, OS_LOG_TYPE_INFO, "Force update mode %s [RID=%u]", (uint8_t *)&v13, 0x12u);
  }

  int v8 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, BOOL, void))*self->_deviceInterface + 15))( self->_deviceInterface,  self->_address,  v3,  0LL);
  if (v8)
  {
    uint64_t v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = "off";
      int v12 = self->_routerID;
      int v13 = 136315650;
      if (v3) {
        uint64_t v11 = "on";
      }
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_error_impl( &dword_189540000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to force update mode %s (0x%08x) [RID=%u]",  (uint8_t *)&v13,  0x18u);
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)initPluginInterfaceForService:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getAddressForDeviceService:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getAddressForDeviceService:(int)a1 .cold.2(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_189540000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to locate device address (0x%08x)",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_2();
}

@end
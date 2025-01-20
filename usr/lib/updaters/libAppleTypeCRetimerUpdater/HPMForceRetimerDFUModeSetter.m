@interface HPMForceRetimerDFUModeSetter
- (BOOL)dfuModeEnabled;
- (BOOL)doSet;
- (BOOL)getAddressForDeviceService:(unsigned int)a3;
- (BOOL)initHPMInterface;
- (BOOL)lookupThunderboltController;
- (BOOL)setComplete;
- (BOOL)startMonitoringForOperationCompletion;
- (HPMForceRetimerDFUModeSetter)initWithHPMService:(unsigned int)a3 deviceService:(unsigned int)a4 enableDFUMode:(BOOL)a5;
- (const)requestType;
- (id)getACIOParentData;
- (unsigned)getARMIODeviceRegistryEntryForACIOParentProperty:(id)a3;
- (unsigned)getThunderboltControllerForARMIODevice:(unsigned int)a3;
- (void)dealloc;
- (void)doSet;
- (void)getACIOParentData;
- (void)initHPMInterface;
- (void)lookupThunderboltController;
- (void)propertyChanged;
- (void)startMonitoringForOperationCompletion;
@end

@implementation HPMForceRetimerDFUModeSetter

- (HPMForceRetimerDFUModeSetter)initWithHPMService:(unsigned int)a3 deviceService:(unsigned int)a4 enableDFUMode:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___HPMForceRetimerDFUModeSetter;
  id v8 = -[HPMForceRetimerDFUModeSetter init](&v18, sel_init);
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.hpm", "retimerDFU");
    v10 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9;

    *((_DWORD *)v8 + 2) = a3;
    if (![v8 getAddressForDeviceService:v6]
      || ![v8 lookupThunderboltController]
      || ![v8 initHPMInterface])
    {
      v16 = 0LL;
      goto LABEL_8;
    }

    dispatch_queue_t v11 = dispatch_queue_create("HPMForceRetimerDFUModeSetter", 0LL);
    v12 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
    v14 = (void *)*((void *)v8 + 6);
    *((void *)v8 + 6) = v13;

    v15 = IONotificationPortCreate(*MEMORY[0x1896086B0]);
    *((void *)v8 + 7) = v15;
    IONotificationPortSetDispatchQueue(v15, *((dispatch_queue_t *)v8 + 5));
    *((_BYTE *)v8 + 20) = a5;
  }

  v16 = (HPMForceRetimerDFUModeSetter *)v8;
LABEL_8:

  return v16;
}

- (void)dealloc
{
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  io_object_t thunderboltController = self->_thunderboltController;
  if (thunderboltController) {
    IOObjectRelease(thunderboltController);
  }
  hpmInterface = self->_hpmInterface;
  if (hpmInterface)
  {
    (*((void (**)(AppleHPMLibInterfaceStructV3 **, SEL))*hpmInterface + 3))(hpmInterface, a2);
    self->_hpmInterface = 0LL;
  }

  cfPlugInInterface = self->_cfPlugInInterface;
  if (cfPlugInInterface)
  {
    IODestroyPlugInInterface(cfPlugInInterface);
    self->_cfPlugInInterface = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___HPMForceRetimerDFUModeSetter;
  -[HPMForceRetimerDFUModeSetter dealloc](&v8, sel_dealloc);
}

- (BOOL)initHPMInterface
{
  SInt32 theScore = 0;
  io_service_t hpmService = self->_hpmService;
  v4 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x12u,  0xA1u,  0xDCu,  0xCFu,  0xCFu,  0x7Au,  0x47u,  0x75u,  0xBEu,  0xE5u,  0x9Cu,  0x43u,  0x19u,  0xF4u,  0xCDu,  0x2Bu);
  v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  uint64_t v6 = IOCreatePlugInInterfaceForService(hpmService, v4, v5, &self->_cfPlugInInterface, &theScore);
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    log = self->_log;
    BOOL v9 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[HPMForceRetimerDFUModeSetter initHPMInterface].cold.2(v7, log, v10, v11, v12, v13, v14, v15);
LABEL_7:
      LOBYTE(v9) = 0;
    }
  }

  else
  {
    cfPlugInInterface = self->_cfPlugInInterface;
    QueryInterface = (*cfPlugInInterface)->QueryInterface;
    objc_super v18 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC1u,  0x3Au,  0xCDu,  0xD9u,  0x20u,  0x9Eu,  0x4Bu,  1u,  0xB7u,  0xBEu,  0xE0u,  0x5Cu,  0xD8u,  0x83u,  0xC7u,  0xB1u);
    CFUUIDBytes v19 = CFUUIDGetUUIDBytes(v18);
    uint64_t v20 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, AppleHPMLibInterfaceStructV3 ***))QueryInterface)( cfPlugInInterface,  *(void *)&v19.byte0,  *(void *)&v19.byte8,  &self->_hpmInterface);
    if (!(_DWORD)v20)
    {
      LOBYTE(v9) = 1;
      return v9;
    }

    uint64_t v21 = v20;
    v22 = self->_log;
    BOOL v9 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[HPMForceRetimerDFUModeSetter initHPMInterface].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_7;
    }
  }

  return v9;
}

- (BOOL)getAddressForDeviceService:(unsigned int)a3
{
  uint64_t v4 = IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  if ((_DWORD)v4)
  {
    uint64_t v5 = v4;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter getAddressForDeviceService:].cold.2(v5, log, v7, v8, v9, v10, v11, v12);
    }
    char isKindOfClass = 0;
  }

  else
  {
    CFDictionaryGetValue(properties, @"Address");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      self->_address = [v14 unsignedIntValue];
    }

    else
    {
      uint64_t v15 = self->_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[HPMForceRetimerDFUModeSetter getAddressForDeviceService:].cold.1(v15);
      }
    }

    CFRelease(properties);
  }

  return isKindOfClass & 1;
}

- (id)getACIOParentData
{
  io_iterator_t iterator = 0;
  if (MEMORY[0x1895E9914](self->_hpmService, "IOService", &iterator))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter getACIOParentData].cold.1();
    }
    return 0LL;
  }

  else
  {
    io_object_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      io_registry_entry_t v5 = v4;
      uint64_t v6 = 0LL;
      uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, @"acio-parent", v7, 3u);

        IOObjectRelease(v5);
        io_registry_entry_t v5 = IOIteratorNext(iterator);
        uint64_t v6 = CFProperty;
      }

      while (v5);
    }

    else
    {
      CFProperty = 0LL;
    }

    IOObjectRelease(iterator);
    return CFProperty;
  }

- (unsigned)getARMIODeviceRegistryEntryForACIOParentProperty:(id)a3
{
  id v4 = a3;
  io_iterator_t existing = 0;
  mach_port_t v5 = *MEMORY[0x1896086B0];
  uint64_t v6 = IOServiceMatching("AppleARMIODevice");
  if (IOServiceGetMatchingServices(v5, v6, &existing))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter getARMIODeviceRegistryEntryForACIOParentProperty:].cold.1();
    }
    unsigned int v7 = 0;
  }

  else
  {
    io_object_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      io_registry_entry_t v9 = v8;
      unsigned int v7 = 0;
      uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v9, @"AAPL,phandle", v10, 0);
        uint64_t v12 = CFProperty;
        if (CFProperty)
        {
          int v13 = *(_DWORD *)[CFProperty bytes];
          if (v13 == *(_DWORD *)[v4 bytes]) {
            unsigned int v7 = v9;
          }
        }

        if (v7 != v9) {
          IOObjectRelease(v9);
        }

        io_registry_entry_t v9 = IOIteratorNext(existing);
      }

      while (v9);
    }

    else
    {
      unsigned int v7 = 0;
    }

    IOObjectRelease(existing);
  }

  return v7;
}

- (unsigned)getThunderboltControllerForARMIODevice:(unsigned int)a3
{
  io_object_t v3 = a3;
  IOObjectRetain(a3);
  if (IORegistryEntryGetChildEntry(v3, "IOService", &child))
  {
LABEL_4:
    io_registry_entry_t v4 = 0;
  }

  else
  {
    while (!IOObjectConformsTo(child, "IOThunderboltController"))
    {
      IOObjectRelease(v3);
      io_object_t v3 = child;
      if (IORegistryEntryGetChildEntry(child, "IOService", &child)) {
        goto LABEL_4;
      }
    }

    io_registry_entry_t v4 = child;
  }

  IOObjectRelease(v3);
  return v4;
}

- (BOOL)lookupThunderboltController
{
  io_object_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.1(log, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_11;
  }

  uint64_t v4 = -[HPMForceRetimerDFUModeSetter getARMIODeviceRegistryEntryForACIOParentProperty:]( self,  "getARMIODeviceRegistryEntryForACIOParentProperty:",  v3);
  if (!(_DWORD)v4)
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_11;
  }

  io_object_t v5 = v4;
  unsigned int v6 = -[HPMForceRetimerDFUModeSetter getThunderboltControllerForARMIODevice:]( self,  "getThunderboltControllerForARMIODevice:",  v4);
  self->_io_object_t thunderboltController = v6;
  if (!v6)
  {
    uint64_t v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter lookupThunderboltController].cold.3(v24, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }

  IOObjectRelease(v5);
  BOOL v7 = self->_thunderboltController != 0;
LABEL_12:

  return v7;
}

- (BOOL)dfuModeEnabled
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( self->_thunderboltController,  @"Disable Scan",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  CFTypeRef v3 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v3 != 0LL;
}

- (void)propertyChanged
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  v2 = "-[HPMForceRetimerDFUModeSetter propertyChanged]";
  _os_log_debug_impl(&dword_189540000, log, OS_LOG_TYPE_DEBUG, "%s: Set complete.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (BOOL)setComplete
{
  return -[HPMForceRetimerDFUModeSetter dfuModeEnabled](self, "dfuModeEnabled") ^ !self->_enableDFUMode;
}

- (BOOL)startMonitoringForOperationCompletion
{
  if (self->_notification
    || !IOServiceAddInterestNotification( self->_notificationPort,  self->_thunderboltController,  "IOGeneralInterest",  (IOServiceInterestCallback)_generalInterestCallback,  self,  &self->_notification))
  {
    LOBYTE(v2) = 1;
  }

  else
  {
    BOOL v2 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (v2)
    {
      -[HPMForceRetimerDFUModeSetter startMonitoringForOperationCompletion].cold.1();
      LOBYTE(v2) = 0;
    }
  }

  return v2;
}

- (BOOL)doSet
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (-[HPMForceRetimerDFUModeSetter setComplete](self, "setComplete"))
  {
    log = self->_log;
    BOOL v4 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      io_object_t v5 = log;
      int v13 = 136315394;
      uint64_t v14 = "-[HPMForceRetimerDFUModeSetter doSet]";
      __int16 v15 = 2080;
      v16 = -[HPMForceRetimerDFUModeSetter requestType](self, "requestType");
      _os_log_impl(&dword_189540000, v5, OS_LOG_TYPE_INFO, "%s: No work to do for %s request", (uint8_t *)&v13, 0x16u);
    }

    return v4;
  }

  p_enableDFUMode = &self->_enableDFUMode;
  if (self->_enableDFUMode)
  {
    if (!-[HPMForceRetimerDFUModeSetter startMonitoringForOperationCompletion]( self,  "startMonitoringForOperationCompletion")) {
      return 0;
    }
    BOOL v7 = *p_enableDFUMode;
  }

  else
  {
    BOOL v7 = 0LL;
  }

  if ((*((unsigned int (**)(AppleHPMLibInterfaceStructV3 **, void, BOOL))*self->_hpmInterface + 12))( self->_hpmInterface,  self->_address,  v7))
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[HPMForceRetimerDFUModeSetter doSet].cold.4();
    }
    return 0;
  }

  if (*p_enableDFUMode)
  {
    uint64_t v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[HPMForceRetimerDFUModeSetter doSet].cold.3(v9);
    }
    dispatch_time_t v10 = dispatch_time(0LL, 30000000000LL);
    if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_notificationSemaphore, v10))
    {
      uint64_t v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[HPMForceRetimerDFUModeSetter doSet].cold.2(p_enableDFUMode, v11);
      }
      return 0;
    }
  }

  uint64_t v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[HPMForceRetimerDFUModeSetter doSet].cold.1(v12);
  }
  return 1;
}

- (const)requestType
{
  if (self->_enableDFUMode) {
    return "enable";
  }
  else {
    return "disable";
  }
}

- (void).cxx_destruct
{
}

- (void)initHPMInterface
{
}

- (void)getAddressForDeviceService:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_189540000, log, OS_LOG_TYPE_ERROR, "Failed to locate valid address property.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getAddressForDeviceService:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)getACIOParentData
{
}

- (void)getARMIODeviceRegistryEntryForACIOParentProperty:.cold.1()
{
}

- (void)lookupThunderboltController
{
}

- (void)startMonitoringForOperationCompletion
{
}

- (void)doSet
{
}

@end
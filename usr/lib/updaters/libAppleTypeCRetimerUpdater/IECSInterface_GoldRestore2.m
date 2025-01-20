@interface IECSInterface_GoldRestore2
+ (IECSInterface_GoldRestore2)sharedInstance;
+ (id)locatedDevices;
- (IECSInterface_GoldRestore2)init;
- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3;
- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3 isHCPM:(BOOL)a4;
- (NSArray)locatedObjects;
- (NSNumber)rid;
- (id)createFileNameForFirmware:(id *)a3;
- (int)createUserClient;
- (int)iecsAtomicCommand:(unsigned int)a3 data:(void *)a4 dataLength:(unint64_t)a5 retData:(void *)a6 retDataLength:(unint64_t)a7 flags:(unsigned int)a8 timeout:(unint64_t)a9;
- (int)iecsReadForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 andOutReadLength:(unint64_t *)a7;
- (int)iecsWaitForIdle:(unsigned int)a3 pollInterval:(unsigned int)a4 timeout:(unsigned int)a5;
- (int)iecsWriteForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6;
- (unsigned)deviceService;
- (unsigned)service;
- (void)dealloc;
- (void)destroyUserClient;
- (void)setDeviceService:(unsigned int)a3;
- (void)setLocatedObjects:(id)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation IECSInterface_GoldRestore2

- (NSNumber)rid
{
  io_registry_entry_t v2 = -[IECSInterface_GoldRestore2 service](self, "service");
  if (IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0)) {
    return (NSNumber *)0LL;
  }
  Value = (void *)CFDictionaryGetValue(properties, @"RID");
  CFRelease(properties);
  return (NSNumber *)Value;
}

  ;
}

+ (IECSInterface_GoldRestore2)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__IECSInterface_GoldRestore2_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, block);
  }
  return (IECSInterface_GoldRestore2 *)(id)sharedInstance_sharedInstance;
}

- (IECSInterface_GoldRestore2)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IECSInterface_GoldRestore2;
  io_registry_entry_t v2 = -[IECSInterface_GoldRestore2 init](&v5, sel_init);
  v3 = v2;
  if (!v2 || -[IECSInterface_GoldRestore2 createUserClient](v2, "createUserClient"))
  {

    return 0LL;
  }

  return v3;
}

- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3 isHCPM:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___IECSInterface_GoldRestore2;
  v6 = -[IECSInterface_GoldRestore2 init](&v21, sel_init);
  if (!v6) {
    goto LABEL_11;
  }
  io_registry_entry_t parent = 0;
  if (v4)
  {
    io_registry_entry_t parent = v5;
    IOObjectRetain(v5);
    uint64_t v7 = v5;
  }

  else
  {
    uint64_t ParentEntry = IORegistryEntryGetParentEntry(v5, "IOService", &parent);
    if ((_DWORD)ParentEntry)
    {
      NSLog(@"...Unable to find parent for IECS service.  err = 0x%X", ParentEntry);
      goto LABEL_11;
    }

    uint64_t v7 = parent;
  }

  -[IECSInterface_GoldRestore2 setService:](v6, "setService:", v7);
  io_service_t v9 = -[IECSInterface_GoldRestore2 service](v6, "service");
  v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x12u,  0xA1u,  0xDCu,  0xCFu,  0xCFu,  0x7Au,  0x47u,  0x75u,  0xBEu,  0xE5u,  0x9Cu,  0x43u,  0x19u,  0xF4u,  0xCDu,  0x2Bu);
  v11 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  uint64_t v12 = IOCreatePlugInInterfaceForService(v9, v10, v11, &v6->_cfPlugInInterface, &theScore);
  if ((_DWORD)v12)
  {
    NSLog(@"...Unable to create CFPlugInInterface. err = 0x%X", v12);
  }

  else
  {
    cfPlugInInterface = v6->_cfPlugInInterface;
    QueryInterface = (*cfPlugInInterface)->QueryInterface;
    v15 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC1u,  0x3Au,  0xCDu,  0xD9u,  0x20u,  0x9Eu,  0x4Bu,  1u,  0xB7u,  0xBEu,  0xE0u,  0x5Cu,  0xD8u,  0x83u,  0xC7u,  0xB1u);
    CFUUIDBytes v16 = CFUUIDGetUUIDBytes(v15);
    uint64_t v17 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, void, void, AppleHPMLibInterfaceStructV3 ***))QueryInterface)( cfPlugInInterface,  *(void *)&v16.byte0,  *(void *)&v16.byte8,  &v6->_deviceInterface);
    if (!(_DWORD)v17)
    {
      IOObjectRetain(v5);
      -[IECSInterface_GoldRestore2 setDeviceService:](v6, "setDeviceService:", v5);
      v6->_userClientActive = 1;
      return v6;
    }

    NSLog(@"...Unable to create Device Interface. err = 0x%X", v17);
  }

- (IECSInterface_GoldRestore2)initWithService:(unsigned int)a3
{
  return -[IECSInterface_GoldRestore2 initWithService:isHCPM:](self, "initWithService:isHCPM:", *(void *)&a3, 0LL);
}

- (void)dealloc
{
  if (-[IECSInterface_GoldRestore2 service](self, "service")) {
    IOObjectRelease(-[IECSInterface_GoldRestore2 service](self, "service"));
  }
  if (-[IECSInterface_GoldRestore2 deviceService](self, "deviceService")) {
    IOObjectRelease(-[IECSInterface_GoldRestore2 deviceService](self, "deviceService"));
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IECSInterface_GoldRestore2;
  -[IECSInterface_GoldRestore2 dealloc](&v3, sel_dealloc);
}

+ (id)locatedDevices
{
  v14[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] arrayWithCapacity:10];
  io_registry_entry_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  io_iterator_t existing = 0;
  if (v2)
  {
    CFMutableDictionaryRef v12 = IOServiceMatching("AppleHPMDevice");
    uint64_t v3 = 0LL;
    CFMutableDictionaryRef v11 = IOServiceMatching("AppleHCPM");
    v14[0] = &v12;
    v14[1] = &v11;
    mach_port_t v4 = *MEMORY[0x1896086B0];
    do
    {
      uint64_t v5 = *(const __CFDictionary **)v14[v3];
      if (v5)
      {
        if (IOServiceGetMatchingServices(v4, v5, &existing))
        {
          NSLog(@"Did NOT find service(s) matching AppleHPMDevice(index:%d)", v3);
        }

        else
        {
          uint64_t v6 = IOIteratorNext(existing);
          if ((_DWORD)v6)
          {
            uint64_t v7 = v6;
            do
            {
              v8 = -[IECSInterface_GoldRestore2 initWithService:isHCPM:]( objc_alloc(&OBJC_CLASS___IECSInterface_GoldRestore2),  "initWithService:isHCPM:",  v7,  v3 == 1);
              if (v8) {
                [v2 addObject:v8];
              }

              IOObjectRelease(v7);
              uint64_t v7 = IOIteratorNext(existing);
            }

            while ((_DWORD)v7);
          }

          if (existing) {
            IOObjectRelease(existing);
          }
        }
      }

      else
      {
        NSLog(@"Did NOT build matching dict(index:%d)", v3);
      }

      ++v3;
    }

    while (v3 != 2);
    io_service_t v9 = (void *)[v2 copy];
  }

  else
  {
    io_service_t v9 = 0LL;
  }

  return v9;
}

- (int)createUserClient
{
  uint64_t v3 = IOServiceMatching("AppleHPMDevice");
  if (!v3)
  {
    uint64_t v4 = 14LL;
    NSLog(@"Did NOT build matching dict");
LABEL_6:
    int v5 = 0;
    goto LABEL_7;
  }

  -[IECSInterface_GoldRestore2 setService:](self, "setService:", IOServiceGetMatchingService(*MEMORY[0x1896086B0], v3));
  if (!-[IECSInterface_GoldRestore2 service](self, "service"))
  {
    uint64_t v4 = 16LL;
    NSLog(@"Did NOT find service matching AppleHPMDevice");
    goto LABEL_6;
  }

  uint64_t v4 = 0LL;
  int v5 = 1;
LABEL_7:
  NSLog( @"IECS createUserClient - status = 0x%X, self.service = %u, _deviceInterface = %p (prior to IOCreatePlugInInterfaceForService)",  v4,  -[IECSInterface_GoldRestore2 service](self, "service"),  self->_deviceInterface);
  if (v5)
  {
    io_service_t v6 = -[IECSInterface_GoldRestore2 service](self, "service");
    uint64_t v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x12u,  0xA1u,  0xDCu,  0xCFu,  0xCFu,  0x7Au,  0x47u,  0x75u,  0xBEu,  0xE5u,  0x9Cu,  0x43u,  0x19u,  0xF4u,  0xCDu,  0x2Bu);
    v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    p_cfPlugInInterface = &self->_cfPlugInInterface;
    unsigned __int8 v10 = IOCreatePlugInInterfaceForService(v6, v7, v8, &self->_cfPlugInInterface, &theScore);
    uint64_t v4 = v10;
    if (!v10)
    {
      CFMutableDictionaryRef v11 = *p_cfPlugInInterface;
      QueryInterface = (**p_cfPlugInInterface)->QueryInterface;
      v13 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC1u,  0x3Au,  0xCDu,  0xD9u,  0x20u,  0x9Eu,  0x4Bu,  1u,  0xB7u,  0xBEu,  0xE0u,  0x5Cu,  0xD8u,  0x83u,  0xC7u,  0xB1u);
      CFUUIDBytes v14 = CFUUIDGetUUIDBytes(v13);
      if (((unsigned int (*)(IOCFPlugInInterfaceStruct **, void, void, AppleHPMLibInterfaceStructV3 ***))QueryInterface)( v11,  *(void *)&v14.byte0,  *(void *)&v14.byte8,  &self->_deviceInterface))
      {
        uint64_t v4 = 17LL;
      }

      else
      {
        uint64_t v4 = 0LL;
        self->_userClientActive = 1;
      }
    }
  }

  NSLog( @"IECS createUserClient - status = 0x%X, self.service = %u, _deviceInterface = %p (after to IOCreatePlugInInterfaceFo rService or at exit)",  v4,  -[IECSInterface_GoldRestore2 service](self, "service"),  self->_deviceInterface);
  return v4;
}

- (void)destroyUserClient
{
  self->_userClientActive = 0;
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

- (id)createFileNameForFirmware:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (IORegistryEntryGetParentEntry(-[IECSInterface_GoldRestore2 service](self, "service"), "IOService", &parent)) {
    goto LABEL_2;
  }
  int v8 = MEMORY[0x1895E98FC](-[IECSInterface_GoldRestore2 service](self, "service"), v16);
  int v5 = 0LL;
  io_registry_entry_t v6 = parent;
  if (!v8 && parent)
  {
    if (!*a3)
    {
      CFMutableDictionaryRef properties = 0LL;
      int v5 = 0LL;
      if (!IORegistryEntryCreateCFProperties(parent, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0))
      {
        io_service_t v9 = properties;
        -[__CFDictionary objectForKey:](v9, "objectForKey:", @"usbc-fw-personality");
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue();
        id v11 = objc_alloc(NSString);
        if (v10) {
          uint64_t v12 = objc_msgSend( v11, "initWithFormat:", @"USB-C_%s", objc_msgSend(v10, "bytes"));
        }
        else {
          uint64_t v12 = objc_msgSend(v11, "initWithFormat:", @"USB-C_FW", v13);
        }
        int v5 = (void *)v12;
        if (properties) {
          CFRelease(properties);
        }
      }

      goto LABEL_3;
    }

- (int)iecsReadForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 andOutReadLength:(unint64_t *)a7
{
  uint64_t v10 = 0LL;
  if (!self->_userClientActive)
  {
    uint64_t v8 = 17LL;
LABEL_7:
    NSLog(@"Failure code: 0x%08X", a2, a3, a4, a5, *(void *)&a6, a7, v8, v10);
    return v8;
  }

  if (!a7) {
    a7 = (unint64_t *)&v10;
  }
  unsigned __int8 v7 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, void, void *, unint64_t, void, unint64_t *))*self->_deviceInterface
        + 5))( self->_deviceInterface,  0LL,  a3,  a4,  a5,  0LL,  a7);
  uint64_t v8 = v7;
  if (v7) {
    goto LABEL_7;
  }
  return v8;
}

- (int)iecsWriteForAddress:(unsigned __int8)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6
{
  if (self->_userClientActive)
  {
    unsigned __int8 v6 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, void, void *, unint64_t, void))*self->_deviceInterface
          + 6))( self->_deviceInterface,  0LL,  a3,  a4,  a5,  0LL);
    uint64_t v7 = v6;
    if (!v6) {
      return v7;
    }
  }

  else
  {
    uint64_t v7 = 17LL;
  }

  NSLog(@"Failure code: 0x%08X", a2, a3, a4, a5, *(void *)&a6, v7);
  return v7;
}

- (int)iecsAtomicCommand:(unsigned int)a3 data:(void *)a4 dataLength:(unint64_t)a5 retData:(void *)a6 retDataLength:(unint64_t)a7 flags:(unsigned int)a8 timeout:(unint64_t)a9
{
  HIDWORD(v12) = a3;
  if (self->_userClientActive)
  {
    LODWORD(v12) = 0;
    unsigned __int8 v9 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, uint64_t, char *, void *, void, void *, void, void, _WORD, unint64_t, void, uint64_t))*self->_deviceInterface
          + 13))( self->_deviceInterface,  1LL,  (char *)&v12 + 4,  a4,  0LL,  a6,  0LL,  (unsigned __int16)a5,  a7,  a9,  0LL,  v12);
    uint64_t v10 = v9;
    if (!v9) {
      return v10;
    }
  }

  else
  {
    uint64_t v10 = 17LL;
  }

  NSLog(@"Failure code: 0x%08X", a2, *(void *)&a3, a4, a5, a6, a7, *(void *)&a8, v10);
  return v10;
}

- (int)iecsWaitForIdle:(unsigned int)a3 pollInterval:(unsigned int)a4 timeout:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a3;
  unsigned int v13 = 0;
  unsigned int v8 = -1;
  if (!a4 || !a5)
  {
    while (1)
    {
LABEL_7:
      int v9 = -[IECSInterface_GoldRestore2 iecsReadForAddress:buffer:length:flags:andOutReadLength:]( self,  "iecsReadForAddress:buffer:length:flags:andOutReadLength:",  8LL,  &v13,  4LL,  v6,  0LL);
      if (v9)
      {
        if (a4) {
          goto LABEL_9;
        }
      }

      else
      {
        unsigned int v11 = bswap32(v13);
        unsigned int v13 = v11;
        if (v11) {
          BOOL v12 = v11 == 558058820;
        }
        else {
          BOOL v12 = 1;
        }
        if (v12) {
          return 0;
        }
        NSLog( @"IECS command '%c%c%c%c' still outstanding",  HIBYTE(v11),  BYTE2(v11),  BYTE1(v11),  v11);
        if (a4) {
LABEL_9:
        }
          usleep(a4);
      }

      if (v8 == -1) {
        unsigned int v8 = -1;
      }
      else {
        --v8;
      }
      if (v9 || !v8) {
        return v9;
      }
    }
  }

  if (a4 <= a5)
  {
    unsigned int v8 = a5 / a4;
    goto LABEL_7;
  }

  return 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)deviceService
{
  return self->_deviceService;
}

- (void)setDeviceService:(unsigned int)a3
{
  self->_deviceService = a3;
}

- (NSArray)locatedObjects
{
  return self->_locatedObjects;
}

- (void)setLocatedObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
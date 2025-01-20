@interface ThunderboltInterface
- (BOOL)configReadForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 index:(unsigned int)a6 result:(unsigned int *)a7;
- (BOOL)configWriteForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 index:(unsigned int)a6 value:(unsigned int)a7;
- (BOOL)createPluginInterfaceForService:(unsigned int)a3;
- (BOOL)findCapabilityForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 mask:(unsigned int)a6 value:(unsigned int)a7 offset:(unsigned int *)a8;
- (BOOL)initializeDeviceInterfaceForRouterID:(unsigned __int8)a3;
- (BOOL)serviceMatchesRouterID:(unsigned int)a3 routerID:(unsigned __int8)a4;
- (ThunderboltInterface)initWithRouterID:(unsigned __int8)a3;
- (void)dealloc;
@end

@implementation ThunderboltInterface

- (ThunderboltInterface)initWithRouterID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ThunderboltInterface;
  v4 = -[ThunderboltInterface init](&v8, sel_init);
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.accessoryupdater.atcrt", "thunderbolt");
    log = v4->_log;
    v4->_log = v5;

    vm_allocate(*MEMORY[0x1895FBBE0], &v4->_configBuffer, 4uLL, 1);
    if (!-[ThunderboltInterface initializeDeviceInterfaceForRouterID:](v4, "initializeDeviceInterfaceForRouterID:", v3))
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  pluginInterface = self->_pluginInterface;
  if (pluginInterface) {
    IODestroyPlugInInterface(pluginInterface);
  }
  deviceInterface = self->_deviceInterface;
  if (deviceInterface) {
    (*((void (**)(IOThunderboltLibInterfaceStruct **, SEL))*deviceInterface + 3))(deviceInterface, a2);
  }
  unint64_t configBuffer = self->_configBuffer;
  if (configBuffer) {
    MEMORY[0x1895E9F20](*MEMORY[0x1895FBBE0], configBuffer, 4LL);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ThunderboltInterface;
  -[ThunderboltInterface dealloc](&v6, sel_dealloc);
}

- (BOOL)initializeDeviceInterfaceForRouterID:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  io_iterator_t existing = 0;
  mach_port_t v5 = *MEMORY[0x1896086B0];
  objc_super v6 = IOServiceMatching("IOThunderboltController");
  BOOL v7 = 0;
  if (!IOServiceGetMatchingServices(v5, v6, &existing))
  {
    uint64_t v8 = IOIteratorNext(existing);
    if ((_DWORD)v8)
    {
      uint64_t v9 = v8;
      BOOL v7 = 0;
      do
      {
        if (v7)
        {
          BOOL v7 = 1;
        }

        else if (-[ThunderboltInterface serviceMatchesRouterID:routerID:]( self,  "serviceMatchesRouterID:routerID:",  v9,  v3))
        {
          BOOL v7 = -[ThunderboltInterface createPluginInterfaceForService:](self, "createPluginInterfaceForService:", v9);
        }

        else
        {
          BOOL v7 = 0;
        }

        IOObjectRelease(v9);
        uint64_t v9 = IOIteratorNext(existing);
      }

      while ((_DWORD)v9);
    }

    else
    {
      BOOL v7 = 0;
    }

    IOObjectRelease(existing);
  }

  return v7;
}

- (BOOL)serviceMatchesRouterID:(unsigned int)a3 routerID:(unsigned __int8)a4
{
  kern_return_t Class;
  CFDataRef CFProperty;
  CFDataRef v10;
  CFIndex Length;
  UInt8 *v12;
  UInt8 *v13;
  OS_os_log *log;
  os_log_s *v15;
  const char *v16;
  CFDataRef v17;
  CFIndex v18;
  UInt8 *v19;
  OS_os_log *v20;
  io_registry_entry_t v21;
  int v22;
  io_registry_entry_t parent;
  uint8_t buf[4];
  int v25;
  io_name_t className;
  uint64_t v27;
  CFRange v28;
  CFRange v29;
  v22 = a4;
  v27 = *MEMORY[0x1895F89C0];
  parent = 0;
  className[0] = 0;
  if (!IORegistryEntryGetParentEntry(a3, "IOService", &parent))
  {
    BOOL v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    while (1)
    {
      if (className[0])
      {
        Class = 0;
      }

      else
      {
        Class = IOObjectGetClass(parent, className);
        if (Class) {
          className[0] = 0;
        }
      }

      if (IOObjectConformsTo(parent, "IOPCIDevice"))
      {
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(parent, @"ThunderboltDROM", v7, 0);
        if (!CFProperty) {
          goto LABEL_20;
        }
        v10 = CFProperty;
        Length = CFDataGetLength(CFProperty);
        v12 = (UInt8 *)malloc(Length);
        if (!v12) {
          goto LABEL_19;
        }
        v13 = v12;
        v28.location = 0LL;
        v28.length = Length;
        CFDataGetBytes(v10, v28, v12);
        int v5 = v13[1] & 0xF;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v25 = v5;
          v15 = log;
          v16 = "Found rid %d on PCI device";
LABEL_26:
          _os_log_debug_impl(&dword_189540000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 8u);
        }
      }

      else
      {
        if (!IOObjectConformsTo(parent, "AppleARMIODevice")) {
          goto LABEL_19;
        }
        v17 = (const __CFData *)IORegistryEntryCreateCFProperty(parent, @"thunderbolt-drom", v7, 0);
        if (!v17)
        {
LABEL_20:
          int v5 = -2;
          goto LABEL_21;
        }

        v10 = v17;
        v18 = CFDataGetLength(v17);
        v19 = (UInt8 *)malloc(v18);
        if (!v19)
        {
LABEL_19:
          v21 = parent;
          Class = IORegistryEntryGetParentEntry(parent, "IOService", &parent);
          int v5 = -1;
          goto LABEL_22;
        }

        v13 = v19;
        v29.location = 0LL;
        v29.length = v18;
        CFDataGetBytes(v10, v29, v19);
        int v5 = v13[1] & 0xF;
        v20 = self->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v25 = v5;
          v15 = v20;
          v16 = "Found rid %d on ARMIO device";
          goto LABEL_26;
        }
      }

      free(v13);
      CFRelease(v10);
LABEL_21:
      v21 = parent;
LABEL_22:
      IOObjectRelease(v21);
      if (v5 != -1 || Class) {
        return v22 == v5;
      }
    }
  }

  LOBYTE(v5) = -1;
  return v22 == v5;
}

- (BOOL)createPluginInterfaceForService:(unsigned int)a3
{
  int v5 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x3Au,  0xFu,  0x59u,  0x6Bu,  0x5Du,  2u,  0x41u,  0xD3u,  0x99u,  0xD4u,  0xE2u,  0x7Du,  0x4Fu,  0x21u,  0x8Au,  0x54u);
  objc_super v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  if (IOCreatePlugInInterfaceForService(a3, v5, v6, &self->_pluginInterface, &theScore))
  {
    BOOL v7 = os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[ThunderboltInterface createPluginInterfaceForService:].cold.1();
      LOBYTE(v7) = 0;
    }
  }

  else
  {
    pluginInterface = self->_pluginInterface;
    QueryInterface = (*pluginInterface)->QueryInterface;
    v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x5Au,  4u,  0x64u,  0x5Du,  0x4Fu,  0x75u,  0x4Bu,  0xDBu,  0xB2u,  0x86u,  0x4Au,  0xAAu,  0x1Fu,  0x26u,  0x60u,  0x20u);
    CFUUIDBytes v11 = CFUUIDGetUUIDBytes(v10);
    LOBYTE(v7) = ((unsigned int (*)(IOCFPlugInInterfaceStruct **, void, void, IOThunderboltLibInterfaceStruct ***))QueryInterface)( pluginInterface,  *(void *)&v11.byte0,  *(void *)&v11.byte8,  &self->_deviceInterface) == 0;
  }

  return v7;
}

- (BOOL)configReadForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 index:(unsigned int)a6 result:(unsigned int *)a7
{
  int v9 = (*((uint64_t (**)(IOThunderboltLibInterfaceStruct **, unint64_t, void, void, void, uint64_t, unint64_t))*self->_deviceInterface
        + 7))( self->_deviceInterface,  a3,  *(void *)&a4,  *(void *)&a5,  *(void *)&a6,  1LL,  self->_configBuffer);
  if (v9)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[ThunderboltInterface configReadForRoute:port:space:index:result:].cold.1();
    }
  }

  else
  {
    *a7 = bswap32(*(_DWORD *)self->_configBuffer);
  }

  return v9 == 0;
}

- (BOOL)configWriteForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 index:(unsigned int)a6 value:(unsigned int)a7
{
  p_deviceInterface = &self->_deviceInterface;
  deviceInterface = self->_deviceInterface;
  *(_DWORD *)p_deviceInterface[1] = bswap32(a7);
  int v10 = (*((uint64_t (**)(IOThunderboltLibInterfaceStruct **, unint64_t, void, void, void, uint64_t))*deviceInterface
         + 8))( deviceInterface,  a3,  *(void *)&a4,  *(void *)&a5,  *(void *)&a6,  1LL);
  if (v10 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[ThunderboltInterface configWriteForRoute:port:space:index:value:].cold.1();
  }
  return v10 == 0;
}

- (BOOL)findCapabilityForRoute:(unint64_t)a3 port:(unsigned int)a4 space:(unsigned int)a5 mask:(unsigned int)a6 value:(unsigned int)a7 offset:(unsigned int *)a8
{
  int v9 = (*((uint64_t (**)(IOThunderboltLibInterfaceStruct **, unint64_t, void, void, void, void, unsigned int *))*self->_deviceInterface
        + 21))( self->_deviceInterface,  a3,  *(void *)&a4,  *(void *)&a5,  *(void *)&a6,  *(void *)&a7,  a8);
  if (v9 && os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[ThunderboltInterface findCapabilityForRoute:port:space:mask:value:offset:].cold.1();
  }
  return v9 == 0;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)createPluginInterfaceForService:.cold.1()
{
}

- (void)configReadForRoute:port:space:index:result:.cold.1()
{
}

- (void)configWriteForRoute:port:space:index:value:.cold.1()
{
}

- (void)findCapabilityForRoute:port:space:mask:value:offset:.cold.1()
{
}

@end
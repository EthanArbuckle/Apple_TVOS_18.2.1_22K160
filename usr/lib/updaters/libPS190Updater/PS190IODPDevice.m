@interface PS190IODPDevice
+ (id)allDevices;
+ (id)first;
+ (void)allDevices;
- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5;
- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5;
- (NSString)rootPath;
- (PS190IODPDevice)initWithService:(unsigned int)a3 rootPath:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation PS190IODPDevice

+ (id)first
{
  id v2 = +[PS190IODPDevice allDevices](&OBJC_CLASS___PS190IODPDevice, "allDevices");
  id v3 = (id)[v2 firstObject];

  return v3;
}

+ (id)allDevices
{
  kern_return_t MatchingServices;
  int v5;
  os_log_s *v6;
  id v7;
  io_object_t v8;
  io_object_t v9;
  io_registry_entry_t v10;
  kern_return_t ParentEntry;
  CFStringRef v12;
  void *v13;
  os_log_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  PS190IODPDevice *v19;
  id v20;
  uint64_t MatchingService;
  PS190IODPDevice *v22;
  id v23;
  id v25;
  id obj;
  mach_port_t mainPort;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  io_iterator_t existing;
  io_registry_entry_t parent;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  kern_return_t v38;
  uint64_t v39;
  v39 = *MEMORY[0x1895F89C0];
  existing = 0;
  mach_port_t v2 = *MEMORY[0x1896086B0];
  id v3 = (const __CFDictionary *)__IOAVClassMatching();
  mainPort = v2;
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if (MatchingServices)
  {
    v5 = MatchingServices;
    v6 = os_log_create("com.apple.accessoryupdater.ps190", "iodpDevice");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PS190IODPDevice allDevices].cold.1(v5, v6);
    }
    v7 = 0LL;
  }

  else
  {
    v6 = (os_log_s *)(id)[MEMORY[0x189603FE0] set];
    v8 = IOIteratorNext(existing);
    if (v8)
    {
      v9 = v8;
      do
      {
        IOObjectRetain(v9);
        parent = 0;
        v10 = v9;
        do
        {
          ParentEntry = IORegistryEntryGetParentEntry(v10, "IOService", &parent);
          IOObjectRelease(v10);
          if (ParentEntry)
          {
            v14 = os_log_create("com.apple.accessoryupdater.ps190", "iodpDevice");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v36 = "_getDeviceTreePath";
              v37 = 1024;
              v38 = ParentEntry;
              _os_log_error_impl( &dword_188FDB000,  v14,  OS_LOG_TYPE_ERROR,  "%s: IORegistryEntryGetParentEntry failed (0x%08x)",  buf,  0x12u);
            }

            v13 = v14;
            goto LABEL_16;
          }

          v10 = parent;
        }

        while (!IORegistryEntryInPlane(parent, "IODeviceTree"));
        if (parent)
        {
          v12 = IORegistryEntryCopyPath(parent, "IODeviceTree");
          IOObjectRelease(parent);
          if (v12)
          {
            -[os_log_s addObject:](v6, "addObject:", v12);
            v13 = (void *)v12;
LABEL_16:
          }
        }

        IOObjectRelease(v9);
        v9 = IOIteratorNext(existing);
      }

      while (v9);
    }

    IOObjectRelease(existing);
    v7 = (id)-[os_log_s allObjects](v6, "allObjects");
  }

  v25 = (id)[MEMORY[0x189603FA8] array];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v7;
  v15 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v15)
  {
    v16 = v15;
    v17 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = (PS190IODPDevice *)*(id *)(*((void *)&v28 + 1) + 8 * i);
        v20 = (id)__IOAVClassMatching();
        [v20 setObject:&unk_18A337E08 forKeyedSubscript:@"BranchIEEEOUI"];
        [v20 setObject:@"pHDMIg" forKeyedSubscript:@"BranchDeviceID"];
        MatchingService = IOServiceGetMatchingService(mainPort, (CFDictionaryRef)v20);

        if ((_DWORD)MatchingService)
        {
          v22 = -[PS190IODPDevice initWithService:rootPath:]( objc_alloc(&OBJC_CLASS___PS190IODPDevice),  "initWithService:rootPath:",  MatchingService,  v19);
          IOObjectRelease(MatchingService);

          if (!v22) {
            continue;
          }
          [v25 addObject:v22];
          v19 = v22;
        }
      }

      v16 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }

    while (v16);
  }

  v23 = (id)[MEMORY[0x189603F18] arrayWithArray:v25];
  return v23;
}

- (PS190IODPDevice)initWithService:(unsigned int)a3 rootPath:(id)a4
{
  id v5 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PS190IODPDevice;
  v6 = -[PS190IODPDevice init](&v15, sel_init);
  if (!v6) {
    goto LABEL_3;
  }
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.ps190", "iodpDevice");
  log = v6->_log;
  v6->_log = v7;

  uint64_t v9 = [v5 copy];
  rootPath = v6->_rootPath;
  v6->_rootPath = (NSString *)v9;

  uint64_t v11 = IODPDeviceCreateWithService();
  v6->_deviceRef = (__IODPDevice *)v11;
  if (!v11)
  {
    v13 = v6->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PS190IODPDevice initWithService:rootPath:].cold.1(v13);
    }
    v12 = 0LL;
  }

  else
  {
LABEL_3:
    v12 = v6;
  }

  return v12;
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    CFRelease(deviceRef);
    self->_deviceRef = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PS190IODPDevice;
  -[PS190IODPDevice dealloc](&v4, sel_dealloc);
}

- (BOOL)writeRegisterAddress:(unsigned int)a3 bytes:(const void *)a4 length:(unsigned int)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v8 = IODPDeviceWriteDPCD();
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109632;
      v11[1] = a3;
      __int16 v12 = 1024;
      unsigned int v13 = a5;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "DP failed to write address 0x%x length %u (0x%08x)",  (uint8_t *)v11,  0x14u);
    }
  }

  return v8 == 0;
}

- (BOOL)readRegisterAddress:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int DPCD = IODPDeviceReadDPCD();
  if (DPCD)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109632;
      v11[1] = a3;
      __int16 v12 = 1024;
      unsigned int v13 = a5;
      __int16 v14 = 1024;
      int v15 = DPCD;
      _os_log_error_impl( &dword_188FDB000,  log,  OS_LOG_TYPE_ERROR,  "DP failed to read address 0x%x length %u (0x%08x)",  (uint8_t *)v11,  0x14u);
    }
  }

  return DPCD == 0;
}

- (BOOL)readRegisterAddressNoErrorLog:(unsigned int)a3 buffer:(void *)a4 length:(unsigned int)a5
{
  return IODPDeviceReadDPCD() == 0;
}

- (id)description
{
  id v3 = (void *)NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (id)[v3 stringWithFormat:@"<%@: %@>", v5, self->_rootPath];

  return v6;
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

+ (void)allDevices
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  id v3 = "_getAllRootPaths";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( &dword_188FDB000,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to get matching services (0x%08x)",  (uint8_t *)&v2,  0x12u);
}

- (void)initWithService:(os_log_t)log rootPath:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  int v2 = "-[PS190IODPDevice initWithService:rootPath:]";
  _os_log_error_impl(&dword_188FDB000, log, OS_LOG_TYPE_ERROR, "%s: Failed to create IODPDevice.", (uint8_t *)&v1, 0xCu);
}

@end
@interface SKIOObject
- (NSString)ioClassName;
- (SKIOObject)initWithClassName:(id)a3;
- (SKIOObject)initWithIOObject:(unsigned int)a3;
- (SKIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4;
- (SKIOObject)initWithIteratorNext:(id)a3;
- (SKIOObject)initWithSKIOObject:(id)a3;
- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4;
- (id)copyParent;
- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4;
- (id)copyProperties;
- (id)copyPropertyWithClass:(Class)a3 key:(id)a4;
- (id)newIteratorWithOptions:(unsigned int)a3;
- (unsigned)ioObj;
- (void)dealloc;
- (void)waitIOKitQuiet;
@end

@implementation SKIOObject

- (SKIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      IOObjectRetain(a3);
    }
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___SKIOObject;
    v6 = -[SKIOObject init](&v10, sel_init);
    v7 = v6;
    if (v6) {
      v6->_ioObj = a3;
    }
    else {
      IOObjectRelease(a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (SKIOObject)initWithIOObject:(unsigned int)a3
{
  return -[SKIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", *(void *)&a3, 0LL);
}

- (SKIOObject)initWithSKIOObject:(id)a3
{
  return -[SKIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", [a3 ioObj], 1);
}

- (SKIOObject)initWithClassName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  mach_port_t v5 = *MEMORY[0x1896086A8];
  id v6 = v4;
  v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(v5, v7);
  if ((_DWORD)MatchingService)
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v9 = self;
  }

  else
  {
    SKGetOSLog();
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_188F75000, v10, OS_LOG_TYPE_ERROR, "Cannot find IO object of class %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = 0LL;
  }

  return v9;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  return -[SKIOObject initWithIOObject:](self, "initWithIOObject:", [a3 copyNextObject]);
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v8 = 0;
  int v3 = MEMORY[0x1895DB5EC](-[SKIOObject ioObj](self, "ioObj"), "IOService", *(void *)&a3, &v8);
  if (v3)
  {
    int v4 = v3;
    SKGetOSLog();
    mach_port_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = v4;
      _os_log_impl(&dword_188F75000, v5, OS_LOG_TYPE_ERROR, "Failed creating IO iterator, err code %d", buf, 8u);
    }

    return 0LL;
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___SKIOIterator);
    return -[SKIOObject initWithIOObject:retain:](v7, "initWithIOObject:retain:", v8, 0LL);
  }

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[SKIOObject ioObj](self, "ioObj"));
}

- (void)dealloc
{
  io_object_t ioObj = self->_ioObj;
  if (ioObj) {
    IOObjectRelease(ioObj);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKIOObject;
  -[SKIOObject dealloc](&v4, sel_dealloc);
}

- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (const char *)[v6 UTF8String];
  if (v4) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 1LL;
  }
  id v9 = -[SKIOObject newIteratorWithOptions:](self, "newIteratorWithOptions:", v8);
  if (v9)
  {
    int v10 = 0LL;
    while (1)
    {
      uint64_t v11 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOObject), "initWithIteratorNext:", v9);

      if (!v11) {
        break;
      }
      int v10 = v11;
      if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), v7)) {
        goto LABEL_13;
      }
    }

    SKGetOSLog();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_188F75000, v12, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v14, 0xCu);
    }
  }

  uint64_t v11 = 0LL;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  mach_port_t v5 = (__CFString *)a4;
  io_registry_entry_t v6 = -[SKIOObject ioObj](self, "ioObj");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v5, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);

  if (CFProperty && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = CFProperty;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  mach_port_t v5 = (__CFString *)a4;
  io_registry_entry_t v6 = -[SKIOObject ioObj](self, "ioObj");
  v7 = (void *)IORegistryEntrySearchCFProperty(v6, "IOService", v5, (CFAllocatorRef)*MEMORY[0x189604DB0], 3u);

  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (id)copyProperties
{
  CFMutableDictionaryRef properties = 0LL;
  io_registry_entry_t v2 = -[SKIOObject ioObj](self, "ioObj");
  IORegistryEntryCreateCFProperties(v2, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  return properties;
}

- (id)copyParent
{
  kern_return_t ParentEntry;
  kern_return_t v3;
  os_log_s *v4;
  SKIOObject *v6;
  io_registry_entry_t parent;
  uint8_t buf[4];
  kern_return_t v9;
  uint64_t v10;
  int v10 = *MEMORY[0x1895F89C0];
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(-[SKIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if (ParentEntry)
  {
    int v3 = ParentEntry;
    SKGetOSLog();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      id v9 = v3;
      _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "Failed to get parent registry entry, err code %d", buf, 8u);
    }

    return 0LL;
  }

  else
  {
    io_registry_entry_t v6 = objc_alloc(&OBJC_CLASS___SKIOObject);
    return -[SKIOObject initWithIOObject:](v6, "initWithIOObject:", parent);
  }

- (void)waitIOKitQuiet
{
  mach_timespec_t waitTime = (mach_timespec_t)5LL;
  IOServiceWaitQuiet(-[SKIOObject ioObj](self, "ioObj"), &waitTime);
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end
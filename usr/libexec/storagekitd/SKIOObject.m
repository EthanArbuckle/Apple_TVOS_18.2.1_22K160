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
- (id)description;
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
    v6 = -[SKIOObject init](&v10, "init");
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
  id v4 = a3;
  v5 = IOServiceMatching((const char *)[v4 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if ((_DWORD)MatchingService)
  {
    self = -[SKIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v7 = self;
  }

  else
  {
    id v8 = sub_10000E2BC();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Cannot find IO object of class %@",  (uint8_t *)&v11,  0xCu);
    }

    v7 = 0LL;
  }

  return v7;
}

- (SKIOObject)initWithIteratorNext:(id)a3
{
  return -[SKIOObject initWithIOObject:](self, "initWithIOObject:", [a3 copyNextObject]);
}

- (id)newIteratorWithOptions:(unsigned int)a3
{
  kern_return_t v3;
  kern_return_t v4;
  id v5;
  os_log_s *v6;
  SKIOIterator *v8;
  io_iterator_t iterator;
  uint8_t buf[4];
  kern_return_t v11;
  iterator = 0;
  v3 = IORegistryEntryCreateIterator(-[SKIOObject ioObj](self, "ioObj"), "IOService", a3, &iterator);
  if (v3)
  {
    id v4 = v3;
    v5 = sub_10000E2BC();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Failed creating IO iterator, err code %d",  buf,  8u);
    }

    return 0LL;
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___SKIOIterator);
    return -[SKIOObject initWithIOObject:retain:](v8, "initWithIOObject:retain:", iterator, 0LL);
  }

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[SKIOObject ioObj](self, "ioObj"));
}

- (id)description
{
  return -[SKIOObject ioClassName](self, "ioClassName");
}

- (void)dealloc
{
  io_object_t ioObj = self->_ioObj;
  if (ioObj) {
    IOObjectRelease(ioObj);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SKIOObject;
  -[SKIOObject dealloc](&v4, "dealloc");
}

- (SKIOObject)ioObjectWithClassName:(id)a3 iterateParents:(BOOL)a4
{
  BOOL v4 = a4;
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
    objc_super v10 = 0LL;
    while (1)
    {
      int v11 = -[SKIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___SKIOObject), "initWithIteratorNext:", v9);

      if (!v11) {
        break;
      }
      objc_super v10 = v11;
      if (IOObjectConformsTo(-[SKIOObject ioObj](v11, "ioObj"), v7)) {
        goto LABEL_13;
      }
    }

    id v12 = sub_10000E2BC();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cannot find %@ entry", (uint8_t *)&v15, 0xCu);
    }
  }

  int v11 = 0LL;
LABEL_13:

  return v11;
}

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  id v6 = (__CFString *)a4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(-[SKIOObject ioObj](self, "ioObj"), v6, kCFAllocatorDefault, 0);

  if (CFProperty && (objc_opt_isKindOfClass(CFProperty, a3) & 1) != 0) {
    id v8 = CFProperty;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (id)copyParentPropertyWithClass:(Class)a3 key:(id)a4
{
  id v6 = (__CFString *)a4;
  v7 = (void *)IORegistryEntrySearchCFProperty( -[SKIOObject ioObj](self, "ioObj"),  "IOService",  v6,  kCFAllocatorDefault,  3u);

  if (v7 && (objc_opt_isKindOfClass(v7, a3) & 1) != 0) {
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
  IORegistryEntryCreateCFProperties(-[SKIOObject ioObj](self, "ioObj"), &properties, kCFAllocatorDefault, 0);
  return properties;
}

- (id)copyParent
{
  kern_return_t ParentEntry;
  kern_return_t v3;
  id v4;
  os_log_s *v5;
  SKIOObject *v7;
  io_registry_entry_t parent;
  uint8_t buf[4];
  kern_return_t v10;
  parent = 0;
  ParentEntry = IORegistryEntryGetParentEntry(-[SKIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if (ParentEntry)
  {
    v3 = ParentEntry;
    BOOL v4 = sub_10000E2BC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      objc_super v10 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to get parent registry entry, err code %d",  buf,  8u);
    }

    return 0LL;
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___SKIOObject);
    return -[SKIOObject initWithIOObject:](v7, "initWithIOObject:", parent);
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
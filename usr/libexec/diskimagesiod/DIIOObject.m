@interface DIIOObject
+ (id)copyDiskImagesControllerWithError:(id *)a3;
- (DIIOObject)initWithClassName:(id)a3 error:(id *)a4;
- (DIIOObject)initWithDIIOObject:(id)a3;
- (DIIOObject)initWithIOObject:(unsigned int)a3;
- (DIIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4;
- (DIIOObject)initWithIteratorNext:(id)a3;
- (DIIOObject)initWithRegistryEntryID:(unint64_t)a3 error:(id *)a4;
- (DIIOObject)ioObjectWithClassName:(id)a3 iterateParent:(BOOL)a4 error:(id *)a5;
- (NSString)ioClassName;
- (id)copyParentWithError:(id *)a3;
- (id)copyPropertyWithClass:(Class)a3 key:(id)a4;
- (id)description;
- (id)newIteratorWithOptions:(unsigned int)a3 error:(id *)a4;
- (unint64_t)registryEntryIDWithError:(id *)a3;
- (unsigned)ioObj;
- (void)dealloc;
@end

@implementation DIIOObject

- (DIIOObject)initWithIOObject:(unsigned int)a3 retain:(BOOL)a4
{
  if (a3)
  {
    if (a4) {
      IOObjectRetain(a3);
    }
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___DIIOObject;
    v6 = -[DIIOObject init](&v10, "init");
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

- (DIIOObject)initWithIOObject:(unsigned int)a3
{
  return -[DIIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", *(void *)&a3, 0LL);
}

- (DIIOObject)initWithDIIOObject:(id)a3
{
  return -[DIIOObject initWithIOObject:retain:](self, "initWithIOObject:retain:", [a3 ioObj], 1);
}

- (DIIOObject)initWithRegistryEntryID:(unint64_t)a3 error:(id *)a4
{
  v7 = IORegistryEntryIDMatching(a3);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if ((_DWORD)MatchingService)
  {
    self = -[DIIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v9 = self;
  }

  else
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find registry entry ID 0x%llx",  a3));
    v9 = (DIIOObject *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v10,  a4));
  }

  return v9;
}

- (DIIOObject)initWithClassName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = IOServiceMatching((const char *)[v6 UTF8String]);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  if ((_DWORD)MatchingService)
  {
    self = -[DIIOObject initWithIOObject:](self, "initWithIOObject:", MatchingService);
    v9 = self;
  }

  else
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find IO object of class %@",  v6));
    v9 = (DIIOObject *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v10,  a4));
  }

  return v9;
}

- (DIIOObject)initWithIteratorNext:(id)a3
{
  return -[DIIOObject initWithIOObject:](self, "initWithIOObject:", [a3 copyNextObject]);
}

- (id)newIteratorWithOptions:(unsigned int)a3 error:(id *)a4
{
  io_iterator_t iterator = 0;
  uint64_t v5 = IORegistryEntryCreateIterator(-[DIIOObject ioObj](self, "ioObj"), "IOService", a3, &iterator);
  if ((_DWORD)v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed creating IO iterator, err code %d",  v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v6,  a4));
  }

  else
  {
    v8 = objc_alloc(&OBJC_CLASS___DIIOIterator);
    return -[DIIOIterator initWithIOIterator:retain:](v8, "initWithIOIterator:retain:", iterator, 0LL);
  }

  return v7;
}

- (unint64_t)registryEntryIDWithError:(id *)a3
{
  uint64_t entryID = 0LL;
  uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(-[DIIOObject ioObj](self, "ioObj"), &entryID);
  if (!(_DWORD)RegistryEntryID) {
    return entryID;
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get registry entry ID, ret %d",  RegistryEntryID));
  +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  153LL,  v5,  a3);

  return 0LL;
}

- (NSString)ioClassName
{
  return (NSString *)(id)IOObjectCopyClass(-[DIIOObject ioObj](self, "ioObj"));
}

- (id)description
{
  return -[DIIOObject ioClassName](self, "ioClassName");
}

- (void)dealloc
{
  io_object_t ioObj = self->_ioObj;
  if (ioObj)
  {
    IOObjectRelease(ioObj);
    self->_io_object_t ioObj = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DIIOObject;
  -[DIIOObject dealloc](&v4, "dealloc");
}

- (DIIOObject)ioObjectWithClassName:(id)a3 iterateParent:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (const char *)[v8 UTF8String];
  if (v6) {
    uint64_t v10 = 3LL;
  }
  else {
    uint64_t v10 = 1LL;
  }
  id v11 = -[DIIOObject newIteratorWithOptions:error:](self, "newIteratorWithOptions:error:", v10, a5);
  if (v11)
  {
    v12 = 0LL;
    while (1)
    {
      v13 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v11);

      if (!v13) {
        break;
      }
      v12 = v13;
      if (IOObjectConformsTo(-[DIIOObject ioObj](v13, "ioObj"), v9)) {
        goto LABEL_11;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot find %@ entry",  v8));
    v13 = (DIIOObject *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v14,  a5));
  }

  else
  {
    v13 = 0LL;
  }

- (id)copyPropertyWithClass:(Class)a3 key:(id)a4
{
  BOOL v6 = (__CFString *)a4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(-[DIIOObject ioObj](self, "ioObj"), v6, kCFAllocatorDefault, 0);

  if (CFProperty && (objc_opt_isKindOfClass(CFProperty, a3) & 1) != 0) {
    id v8 = CFProperty;
  }
  else {
    id v8 = 0LL;
  }

  return v8;
}

- (id)copyParentWithError:(id *)a3
{
  io_registry_entry_t parent = 0;
  uint64_t ParentEntry = IORegistryEntryGetParentEntry(-[DIIOObject ioObj](self, "ioObj"), "IOService", &parent);
  if ((_DWORD)ParentEntry)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to get parent registry entry, err code %d",  ParentEntry));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  v5,  a3));
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___DIIOObject);
    return -[DIIOObject initWithIOObject:](v7, "initWithIOObject:", parent);
  }

  return v6;
}

+ (id)copyDiskImagesControllerWithError:(id *)a3
{
  objc_super v4 = -[DIIOObject initWithClassName:error:]( objc_alloc(&OBJC_CLASS___DIIOObject),  "initWithClassName:error:",  @"AppleDiskImagesController",  0LL);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = (DIIOObject *)objc_claimAutoreleasedReturnValue( +[DIError nilWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithEnumValue:verboseInfo:error:",  153LL,  @"Failed to find DiskImages2 controller, driver might not be installed",  a3));
  }
  v7 = v6;

  return v7;
}

- (unsigned)ioObj
{
  return self->_ioObj;
}

@end
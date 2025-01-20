@interface DevNodeWriter
- (BOOL)finished;
- (BOOL)isAvailable;
- (DevNodeWriter)init;
- (DevNodeWriter)initWithIOMedia:(unsigned int)a3;
- (DevNodeWriter)initWithService:(unsigned int)a3;
- (DevNodeWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4;
- (NSString)devicePath;
- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4;
- (int)nodeDescriptor;
- (int)preferredBlockSize;
- (int)writeBytes:(const void *)a3 ofLength:(unint64_t)a4 withError:(id *)a5;
- (int)writeData:(id)a3 withError:(id *)a4;
- (unint64_t)numberOfBytesRemainingInBlock;
- (unsigned)service;
- (void)_setupFileDescriptor;
- (void)_waitForDeviceNode:(id)a3 withTimeout:(unsigned int)a4;
- (void)dealloc;
- (void)setNodeDescriptor:(int)a3;
- (void)setPreferredBlockSize:(int)a3;
- (void)setService:(unsigned int)a3;
@end

@implementation DevNodeWriter

- (DevNodeWriter)init
{
  return -[DevNodeWriter initWithIOMedia:](self, "initWithIOMedia:", 0LL);
}

- (DevNodeWriter)initWithIOMedia:(unsigned int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DevNodeWriter;
  v4 = -[DevNodeWriter init](&v13, "init");
  if (v4)
  {
    if (IOObjectConformsTo(a3, "IOMedia"))
    {
      IOServiceWaitQuiet(a3, 0LL);
      IOObjectRetain(a3);
      *((_DWORD *)v4 + 2) = a3;
      *(void *)(v4 + 12) = 0xFFFFFFFFLL;
      if ([v4 isAvailable])
      {
        [v4 _setupFileDescriptor];
        return (DevNodeWriter *)v4;
      }

      CFProperty = (void *)IORegistryEntryCreateCFProperty( *((_DWORD *)v4 + 2),  @"BSD Name",  kCFAllocatorDefault,  0);
      iBU_LOG_real( (uint64_t)@"File descriptor %@ wasn't available at init time.",  "-[DevNodeWriter initWithIOMedia:]",  v6,  v7,  v8,  v9,  v10,  v11,  (uint64_t)CFProperty);
    }

    return 0LL;
  }

  return (DevNodeWriter *)v4;
}

- (DevNodeWriter)initWithService:(unsigned int)a3
{
  uint64_t entryID = 0LL;
  IORegistryEntryGetRegistryEntryID(a3, &entryID);
  IOServiceWaitQuiet(a3, 0LL);
  v15[0] = @"IOParentMatch";
  CFMutableDictionaryRef v5 = IORegistryEntryIDMatching(entryID);
  v16[0] = (id)CFMakeCollectable(v5);
  v16[1] = @"IOMedia";
  v15[1] = @"IOProviderClass";
  v15[2] = @"IOPropertyMatch";
  objc_super v13 = @"Whole";
  v14 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  v16[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL);
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  3LL);
  if (v6) {
    uint64_t v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7);
  uint64_t v9 = -[DevNodeWriter initWithIOMedia:](self, "initWithIOMedia:", MatchingService);
  if ((_DWORD)MatchingService && IOObjectRelease(MatchingService)) {
    sub_100016B1C(&v12, v17);
  }
  return v9;
}

- (DevNodeWriter)initWithServiceNamed:(id)a3 parent:(unsigned int)a4
{
  uint64_t Namespace = MSUBootFirmwareFindNamespace(a4, (uint64_t)a3);
  uint64_t v6 = -[DevNodeWriter initWithService:](self, "initWithService:", Namespace);
  if ((_DWORD)Namespace && IOObjectRelease(Namespace)) {
    sub_100016C38(&v8, v9);
  }
  return v6;
}

- (BOOL)isAvailable
{
  if (self->_nodeDescriptor != -1) {
    return 1;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( -[DevNodeWriter service](self, "service"),  @"BSD Name",  kCFAllocatorDefault,  0);
  -[DevNodeWriter _waitForDeviceNode:withTimeout:](self, "_waitForDeviceNode:withTimeout:", CFProperty, 60LL);
  BOOL v2 = self->_nodeDescriptor != -1;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2;
}

- (void)_waitForDeviceNode:(id)a3 withTimeout:(unsigned int)a4
{
  uint64_t v6 = -[NSString UTF8String](-[DevNodeWriter devicePath](self, "devicePath", a3), "UTF8String");
  iBU_LOG_real( (uint64_t)@"Attempting to open dev node at path: %s",  "-[DevNodeWriter _waitForDeviceNode:withTimeout:]",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)v6);
  do
  {
    int v13 = open(v6, 16777217);
    if (v13 != -1) {
      break;
    }
    v14 = __error();
    if (*v14 != 2)
    {
      strerror(*v14);
      iBU_LOG_real( (uint64_t)@"open(2) on %s failed with error %d: %s. Not trying agin.",  "-[DevNodeWriter _waitForDeviceNode:withTimeout:]",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)v6);
      break;
    }

    iBU_LOG_real( (uint64_t)@"Dev node %s doesn't yet exist. Waiting to try again...",  "-[DevNodeWriter _waitForDeviceNode:withTimeout:]",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)v6);
    sleep(1u);
    --a4;
  }

  while (a4);
  self->_nodeDescriptor = v13;
}

- (NSString)devicePath
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( -[DevNodeWriter service](self, "service"),  @"BSD Name",  kCFAllocatorDefault,  0);
  CFTypeRef v3 = (id)CFMakeCollectable(CFProperty);
  return (NSString *)[@"/dev/" stringByAppendingPathComponent:v3];
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1) {
    close(nodeDescriptor);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DevNodeWriter;
  -[DevNodeWriter dealloc](&v5, "dealloc");
}

- (BOOL)finished
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }

  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    close(nodeDescriptor);
    self->_int nodeDescriptor = -1;
  }

  return 1;
}

- (void)_setupFileDescriptor
{
  int nodeDescriptor = self->_nodeDescriptor;
  if (nodeDescriptor != -1)
  {
    if (fcntl(nodeDescriptor, 48)) {
      iBU_LOG_real( (uint64_t)@"Failed to set F_NOCACHE on descriptor.",  "-[DevNodeWriter _setupFileDescriptor]",  v4,  v5,  v6,  v7,  v8,  v9,  1LL);
    }
    blksize_t v12 = 0;
    memset(&v11, 0, sizeof(v11));
    if (ioctl(self->_nodeDescriptor, 0x40046418uLL, &v12))
    {
      if (fstat(self->_nodeDescriptor, &v11)) {
        blksize_t st_blksize = 0;
      }
      else {
        blksize_t st_blksize = v11.st_blksize;
      }
    }

    else
    {
      blksize_t st_blksize = v12;
    }

    self->_preferredBlockSize = st_blksize;
  }

- (int)writeBytes:(const void *)a3 ofLength:(unint64_t)a4 withError:(id *)a5
{
  unsigned int v9 = -[DevNodeWriter nodeDescriptor](self, "nodeDescriptor");
  if (!a4) {
    return 0;
  }
  int v10 = v9;
  while (1)
  {
    ssize_t v11 = write(v10, a3, a4);
    if (v11 == -1) {
      break;
    }
    a3 = (char *)a3 + v11;
    a4 -= v11;
    if (!a4) {
      return 0;
    }
  }

  int v13 = *__error();
  v14 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v13,  0LL);
  -[DevNodeWriter devicePath](self, "devicePath");
  iBU_LOG_real( (uint64_t)@"Failed to write %lu bytes to %@",  "-[DevNodeWriter writeBytes:ofLength:withError:]",  v15,  v16,  v17,  v18,  v19,  v20,  a4);
  if (a5)
  {
    -[DevNodeWriter devicePath](self, "devicePath");
    *a5 = MSUBootFirmwareError( 3LL,  (uint64_t)v14,  (uint64_t)@"Failed to write %lu bytes to %@",  v27,  v28,  v29,  v30,  v31,  a4);
  }

  iBU_LOG_real( (uint64_t)@"There are %lu bytes left to write.",  "-[DevNodeWriter writeBytes:ofLength:withError:]",  v21,  v22,  v23,  v24,  v25,  v26,  a4);
  return v13 | 0xC000;
}

- (int)writeData:(id)a3 withError:(id *)a4
{
  return -[DevNodeWriter writeBytes:ofLength:withError:]( self,  "writeBytes:ofLength:withError:",  [a3 bytes],  objc_msgSend(a3, "length"),  a4);
}

- (unint64_t)numberOfBytesRemainingInBlock
{
  int v3 = -[DevNodeWriter preferredBlockSize](self, "preferredBlockSize");
  if (v3 < 1) {
    return 0LL;
  }
  unsigned int v4 = v3;
  unint64_t v5 = lseek(-[DevNodeWriter nodeDescriptor](self, "nodeDescriptor"), 0LL, 1);
  if ((v5 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  int v6 = v5 % v4;
  if (v6) {
    return (int)(v4 - v6);
  }
  else {
    return 0;
  }
}

- (int)eraseBytes:(unsigned int)a3 ofLength:(unsigned int)a4
{
  return -536870201;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (int)nodeDescriptor
{
  return self->_nodeDescriptor;
}

- (void)setNodeDescriptor:(int)a3
{
  self->_int nodeDescriptor = a3;
}

- (int)preferredBlockSize
{
  return self->_preferredBlockSize;
}

- (void)setPreferredBlockSize:(int)a3
{
  self->_preferredBlockSize = a3;
}

@end
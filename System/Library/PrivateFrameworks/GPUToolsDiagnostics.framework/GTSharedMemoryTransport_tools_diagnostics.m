@interface GTSharedMemoryTransport_tools_diagnostics
- (BOOL)_clientConnect:(id *)a3;
- (BOOL)_createAndRunSources:(id *)a3;
- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_serverConnect:(id *)a3;
- (BOOL)connected;
- (BOOL)deferred;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8;
- (GTSharedMemoryTransport_tools_diagnostics)init;
- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3;
- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4;
- (id)_getSharedMemoryNameWithSuffix:(id)a3;
- (id)connect;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3;
- (unint64_t)_computeBytesAvailableToRead;
- (unint64_t)_computeBytesAvailableToWrite;
- (unsigned)_nextMessageSerial;
- (void)_accumulateMessageBytes;
- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4;
- (void)_copyToSM:(const void *)a3 size:(int64_t)a4;
- (void)_dequeueIncomingMessages;
- (void)_dequeuePacket;
- (void)_invalidate;
- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5;
- (void)_relayPacket;
- (void)_setupIOBuffers;
- (void)_tearDownSharedMemory;
- (void)_updateReaderOffset:(unint64_t)a3;
- (void)_waitEAGAIN;
- (void)dealloc;
- (void)setRelayTransport:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GTSharedMemoryTransport_tools_diagnostics

- (GTSharedMemoryTransport_tools_diagnostics)init
{
  return 0LL;
}

- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3
{
  return -[GTSharedMemoryTransport_tools_diagnostics initWithMode:initialMessageSerial:]( self,  "initWithMode:initialMessageSerial:",  *(void *)&a3,  0LL);
}

- (GTSharedMemoryTransport_tools_diagnostics)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTSharedMemoryTransport_tools_diagnostics;
  v6 = -[GTBaseStreamTransport_tools_diagnostics init](&v14, "init");
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_mode = a3;
  if ((a3 - 3) <= 0xFFFFFFFD)
  {
    v13 = "_mode == kDYSharedMemoryTransportModeClient || _mode == kDYSharedMemoryTransportModeServer";
    goto LABEL_9;
  }

  atomic_store(a4, &v6->super.super._messageCounter.__a_.__a_value);
  CFUUIDRef v8 = CFUUIDCreate(kCFAllocatorDefault);
  v9 = objc_alloc(&OBJC_CLASS___NSURL);
  CFHashCode v10 = CFHash(v8);
  v7->super.super._url = -[NSURL initWithString:]( v9,  "initWithString:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"dysmt://localhost/%lx%d",  v10,  getpid()));
  CFRelease(v8);
  v7->_consumeBytesSEL = "_accumulateMessageBytes";
  id v11 = -[GTSharedMemoryTransport_tools_diagnostics methodForSelector:](v7, "methodForSelector:");
  v7->_consumeBytesIMP = v11;
  if (!v11)
  {
    v13 = "_consumeBytesIMP";
LABEL_9:
    __assert_rtn("-[GTSharedMemoryTransport initWithMode:initialMessageSerial:]", "", 0, v13);
  }

  v7->_bufferedMessages = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v7->_sm_region_size_large = 104857600LL;
  v7->_sm_region_size_small = 0x1000000LL;
  if (!-[NSProcessInfo isiOSAppOnMac]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "isiOSAppOnMac"))
  {
    v7->_sm_region_size_large = 0x40000LL;
    v7->_sm_region_size_small = 0x4000LL;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTSharedMemoryTransport_tools_diagnostics;
  -[GTBaseStreamTransport_tools_diagnostics dealloc](&v3, "dealloc");
}

- (void)setUrl:(id)a3
{
  if (!a3) {
    __assert_rtn("-[GTSharedMemoryTransport setUrl:]", ", 0, "newUrl != nil"");
  }
  if (-[GTSharedMemoryTransport_tools_diagnostics connected](self, "connected"))
  {
    if (s_logUsingOsLog)
    {
      v6 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "fail: tried to set URL on connected transport";
        CFUUIDRef v8 = v6;
        uint32_t v9 = 2;
        goto LABEL_18;
      }
    }

    else
    {
      id v11 = __stderrp;
      -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fail: tried to set URL on connected transport"),  "UTF8String");
      fprintf(v11, "%s\n");
    }

    goto LABEL_23;
  }

  if ((objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmt") & 1) == 0
    && (objc_msgSend(objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmtdeferred") & 1) == 0)
  {
    if (s_logUsingOsLog)
    {
      CFHashCode v10 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v16 = objc_msgSend(objc_msgSend(a3, "absoluteString"), "UTF8String");
        v7 = "fail: url scheme has to be dysmt: %s";
        goto LABEL_17;
      }

- (void)setRelayTransport:(id)a3
{
  queue = self->super.super._queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __45__GTSharedMemoryTransport_setRelayTransport___block_invoke;
  v4[3] = &unk_209B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)queue, v4);
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  if (self->_deferred)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___GTBufferedSendOperation_tools_diagnostics);
    -[GTBufferedSendOperation_tools_diagnostics setMessage:](v13, "setMessage:", a3);
    -[GTBufferedSendOperation_tools_diagnostics setReplyTo:](v13, "setReplyTo:", a4);
    -[GTBufferedSendOperation_tools_diagnostics setQueue:](v13, "setQueue:", a6);
    -[GTBufferedSendOperation_tools_diagnostics setReplyBlock:](v13, "setReplyBlock:", a8);
    -[NSMutableArray addObject:](self->_bufferedMessages, "addObject:", v13);
    return 1;
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___GTSharedMemoryTransport_tools_diagnostics;
    return -[GTTransport_tools_diagnostics send:inReplyTo:error:replyQueue:timeout:handler:]( &v15,  "send:inReplyTo:error:replyQueue:timeout:handler:",  a3,  a4,  a5,  a6,  a7,  a8);
  }

- (id)_getSharedMemoryNameWithSuffix:(id)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"gdt-%@-%@",  -[NSString substringFromIndex:](-[NSURL path](self->super.super._url, "path"), "substringFromIndex:", 1LL),  a3);
}

- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3
{
  return 2 * a3;
}

- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  size_t v8 = -[GTSharedMemoryTransport_tools_diagnostics _calculateVMRegionMapSize:](self, "_calculateVMRegionMapSize:", a4);
  uint32_t v9 = (char *)mmap(0LL, v8, 0, 4098, -1, 0LL);
  if (v9 == (char *)-1LL)
  {
    if (!a5) {
      return 0LL;
    }
    CFHashCode v10 = 0LL;
    *a5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
  }

  else
  {
    CFHashCode v10 = v9;
    if (mmap(v9, a4, 3, 17, a3, 0LL) != v9 || mmap(&v10[a4], a4 - 0x4000, 3, 17, a3, 0x4000LL) != &v10[a4])
    {
      if (a5) {
        *a5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      }
      munmap(v10, v8);
      return 0LL;
    }
  }

  return v10;
}

- (void)_tearDownSharedMemory
{
  incomingShmem = (unsigned int *)self->_incomingShmem;
  if (incomingShmem)
  {
    munmap( incomingShmem,  -[GTSharedMemoryTransport_tools_diagnostics _calculateVMRegionMapSize:]( self,  "_calculateVMRegionMapSize:",  incomingShmem[6]));
    self->_incomingShmem = 0LL;
    self->_incomingBuffer = 0LL;
  }

  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (outgoingShmem)
  {
    munmap( outgoingShmem,  -[GTSharedMemoryTransport_tools_diagnostics _calculateVMRegionMapSize:]( self,  "_calculateVMRegionMapSize:",  outgoingShmem[6]));
    self->_outgoingShmem = 0LL;
    self->_outgoingBuffer = 0LL;
  }

  self->_masterSMRegion = 0LL;
  if (self->_sendName[0]) {
    shm_unlink(self->_sendName);
  }
  if (self->_receiveName[0]) {
    shm_unlink(self->_receiveName);
  }
}

- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  else {
    unint64_t v9 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  uint64_t v10 = shm_open(a5, 2562, 390LL);
  if ((_DWORD)v10 == -1 || (uint64_t v11 = v10, ftruncate(v10, v9) == -1))
  {
    if (a6)
    {
      objc_super v15 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  *__error(),  0LL);
      LOBYTE(v12) = 0;
      *a6 = v15;
    }

    else
    {
      LOBYTE(v12) = 0;
    }
  }

  else
  {
    v12 = -[GTSharedMemoryTransport_tools_diagnostics _mapSharedMemoryFile:size:error:]( self,  "_mapSharedMemoryFile:size:error:",  v11,  v9,  a6);
    if (v12)
    {
      v13 = v12;
      close(v11);
      memset_pattern16(v13, &-[GTSharedMemoryTransport _initializeSMRegion:size:name:error:]::pattern, v9);
      atomic_store(0, (unsigned int *)v13);
      atomic_store(0, (unsigned int *)v13 + 1);
      atomic_store(0, (unsigned int *)v13 + 2);
      unsigned int v14 = atomic_load(&self->super.super._messageCounter.__a_.__a_value);
      atomic_store(v14, (unsigned int *)v13 + 3);
      atomic_store(0, (unsigned int *)v13 + 4);
      atomic_store(0, (unsigned int *)v13 + 5);
      *((_DWORD *)v13 + 6) = v9;
      *((_DWORD *)v13 + 7) = v9 - 0x4000;
      *a3 = (sm_region_header *)v13;
      LOBYTE(v12) = 1;
    }
  }

  return (char)v12;
}

- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v12 = shm_open(a5, 2, 6LL);
    if ((_DWORD)v12 != -1) {
      break;
    }
    if (*__error() == 4)
    {
      if (i >= 3) {
        goto LABEL_17;
      }
    }

    else if (*__error() != 2 || i >= 3)
    {
      goto LABEL_17;
    }

    sleep(1u);
  }

  int v14 = v12;
  else {
    unint64_t v15 = (a4 + vm_page_size - 1) & -(uint64_t)vm_page_size;
  }
  id v16 = -[GTSharedMemoryTransport_tools_diagnostics _mapSharedMemoryFile:size:error:]( self,  "_mapSharedMemoryFile:size:error:",  v12,  v15,  a6);
  if (v16)
  {
    v17 = v16;
    close(v14);
    if (shm_unlink(a5) != -1)
    {
      *a3 = v17;
      LOBYTE(v16) = 1;
      return (char)v16;
    }

- (void)_setupIOBuffers
{
  self->_outgoingBuffer = (char *)self->_outgoingShmem + 0x4000;
  self->_incomingBuffer = (char *)self->_incomingShmem + 0x4000;
}

- (BOOL)_createAndRunSources:(id *)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  v13 = __Block_byref_object_copy__76;
  int v14 = __Block_byref_object_dispose__77;
  uint64_t v15 = 0LL;
  v4 = objc_alloc(&OBJC_CLASS___GTContinuation_tools_diagnostics);
  queue = self->super.super._queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __48__GTSharedMemoryTransport__createAndRunSources___block_invoke;
  v9[3] = &unk_20C08;
  v9[4] = self;
  v9[5] = &v10;
  v6 = -[GTContinuation_tools_diagnostics initWithQueue:block:](v4, "initWithQueue:block:", queue, v9);
  v11[5] = (uint64_t)v6;
  pthread_create(&v8, &v16, (void *(__cdecl *)(void *))smt_poll_thread_entry, v6);
  pthread_attr_destroy(&v16);
  _Block_object_dispose(&v10, 8);
  return 1;
}

- (BOOL)_serverConnect:(id *)a3
{
  if (!-[GTSharedMemoryTransport_tools_diagnostics _initializeSMRegion:size:name:error:]( self,  "_initializeSMRegion:size:name:error:",  &self->_outgoingShmem,  self->_sm_region_size_small,  self->_sendName,  a3)
    || !-[GTSharedMemoryTransport_tools_diagnostics _initializeSMRegion:size:name:error:]( self,  "_initializeSMRegion:size:name:error:",  &self->_incomingShmem,  self->_sm_region_size_large,  self->_receiveName,  a3))
  {
    return 0;
  }

  -[GTSharedMemoryTransport_tools_diagnostics _setupIOBuffers](self, "_setupIOBuffers");
  BOOL result = -[GTSharedMemoryTransport_tools_diagnostics _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_incomingShmem;
  return result;
}

- (BOOL)_clientConnect:(id *)a3
{
  if (!-[GTSharedMemoryTransport_tools_diagnostics _openSMRegion:size:name:error:]( self,  "_openSMRegion:size:name:error:",  &self->_incomingShmem,  self->_sm_region_size_small,  self->_receiveName,  a3)
    || !-[GTSharedMemoryTransport_tools_diagnostics _openSMRegion:size:name:error:]( self,  "_openSMRegion:size:name:error:",  &self->_outgoingShmem,  self->_sm_region_size_large,  self->_sendName,  a3))
  {
    return 0;
  }

  -[GTSharedMemoryTransport_tools_diagnostics _setupIOBuffers](self, "_setupIOBuffers");
  BOOL result = -[GTSharedMemoryTransport_tools_diagnostics _createAndRunSources:](self, "_createAndRunSources:", a3);
  self->_masterSMRegion = self->_outgoingShmem;
  return result;
}

- (id)connect
{
  id v3 = +[GTFuture_tools_diagnostics future](&OBJC_CLASS___GTFuture_tools_diagnostics, "future");
  queue = self->super.super._queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __34__GTSharedMemoryTransport_connect__block_invoke;
  v6[3] = &unk_209B0;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async((dispatch_queue_t)queue, v6);
  return v3;
}

- (BOOL)connected
{
  return self->_masterSMRegion != 0LL;
}

- (void)_invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GTSharedMemoryTransport_tools_diagnostics;
  -[GTBaseStreamTransport_tools_diagnostics _invalidate](&v3, "_invalidate");
}

- (unint64_t)_computeBytesAvailableToWrite
{
  unsigned int v2 = atomic_load((unsigned int *)self->_outgoingShmem + 5);
  unsigned int v3 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  if (v2 >= v3)
  {
    unsigned int v8 = atomic_load(outgoingShmem + 4);
    unint64_t v9 = (unsigned int *)self->_outgoingShmem;
    if (v2 == v8)
    {
      unsigned int v10 = atomic_load(v9 + 2);
      unsigned int v11 = atomic_load((unsigned int *)self->_outgoingShmem + 1);
      if (v10 == v11) {
        return *((_DWORD *)self->_outgoingShmem + 7);
      }
      else {
        return 0;
      }
    }

    else
    {
      unsigned int v12 = atomic_load(v9 + 4);
      return v2 - v12;
    }
  }

  else
  {
    unsigned int v5 = outgoingShmem[7];
    unsigned int v6 = atomic_load(outgoingShmem + 4);
    return v5 + v2 - v6;
  }

- (unint64_t)_computeBytesAvailableToRead
{
  unsigned int v2 = atomic_load((unsigned int *)self->_incomingShmem + 4);
  unsigned int v3 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  unsigned int v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  if (v3 >= v2)
  {
    incomingShmem = (unsigned int *)self->_incomingShmem;
    if (v2 == v4)
    {
      unsigned int v7 = atomic_load(incomingShmem + 2);
      unsigned int v8 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v7 == v8) {
        return 0;
      }
      else {
        return *((_DWORD *)self->_incomingShmem + 7);
      }
    }

    else
    {
      unsigned int v9 = incomingShmem[7];
      unsigned int v10 = atomic_load(incomingShmem + 5);
      return v9 + v2 - v10;
    }
  }

  else
  {
    return v2 - v4;
  }

- (void)_copyToSM:(const void *)a3 size:(int64_t)a4
{
  uint64_t v6 = atomic_load((unsigned int *)self->_outgoingShmem + 4);
  memcpy((char *)self->_outgoingBuffer + v6, a3, a4);
  outgoingShmem = (unsigned int *)self->_outgoingShmem;
  unint64_t v8 = outgoingShmem[7];
  if (v6 + a4 < v8) {
    LODWORD(v8) = 0;
  }
  atomic_store(v6 + a4 - v8, outgoingShmem + 4);
}

- (void)_waitEAGAIN
{
  unsigned int v3 = 0;
  do
  {
    usleep(0xC8u);
    if (-[GTSharedMemoryTransport_tools_diagnostics _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead") > 4) {
      break;
    }
  }

  while (v3++ < 4);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4)
  {
    unsigned int v7 = atomic_load((unsigned int *)&self->super.super._invalid);
    atomic_store(v7, (unsigned int *)self->_outgoingShmem);
    unint64_t v8 = -[GTSharedMemoryTransport_tools_diagnostics _computeBytesAvailableToWrite]( self,  "_computeBytesAvailableToWrite");
    if (v8 > 4)
    {
      if (v8 - 4 < v4) {
        unint64_t v4 = v8 - 4;
      }
      int v12 = v4 + 4;
      -[GTSharedMemoryTransport_tools_diagnostics _copyToSM:size:](self, "_copyToSM:size:", &v12, 4LL);
      -[GTSharedMemoryTransport_tools_diagnostics _copyToSM:size:](self, "_copyToSM:size:", a3, v4);
      unsigned int v9 = (unsigned int *)((char *)self->_outgoingShmem + 4);
      do
        unsigned int v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }

    else
    {
      *__error() = 35;
      return -1LL;
    }
  }

  return v4;
}

- (unsigned)_nextMessageSerial
{
  unsigned int v2 = (unsigned int *)((char *)self->_masterSMRegion + 12);
  do
  {
    unsigned int v3 = __ldaxr(v2);
    unsigned int result = v3 + 1;
  }

  while (__stlxr(v3 + 1, v2));
  return result;
}

- (void)_updateReaderOffset:(unint64_t)a3
{
  incomingShmem = (unsigned int *)self->_incomingShmem;
  unint64_t v4 = incomingShmem[7];
  if (v4 > a3) {
    LODWORD(v4) = 0;
  }
  atomic_store(a3 - v4, incomingShmem + 5);
}

- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  memcpy(a3, (char *)self->_incomingBuffer + v6, a4);
  -[GTSharedMemoryTransport_tools_diagnostics _updateReaderOffset:](self, "_updateReaderOffset:", v6 + a4);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  if (!a4) {
    return 0LL;
  }
  unint64_t currentPacketBytesLeft = self->_currentPacketBytesLeft;
  if ((_DWORD)currentPacketBytesLeft)
  {
    if (currentPacketBytesLeft >= a4) {
      int64_t v6 = a4;
    }
    else {
      int64_t v6 = self->_currentPacketBytesLeft;
    }
    -[GTSharedMemoryTransport_tools_diagnostics _copyFromSM:size:](self, "_copyFromSM:size:", a3, v6);
    self->_currentPacketBytesLeft -= v6;
  }

  else
  {
    *__error() = 35;
    return -1LL;
  }

  return v6;
}

- (void)_accumulateMessageBytes
{
  while (self->_currentPacketBytesLeft
       && -[GTBaseStreamTransport_tools_diagnostics _readAndAccumulate](self, "_readAndAccumulate") > 0)
    ;
}

- (void)_relayPacket
{
  incomingBuffer = (char *)self->_incomingBuffer;
  uint64_t v4 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  -[GTBaseStreamTransport_tools_diagnostics _relayBuffer:size:]( self->_relayTransport,  "_relayBuffer:size:",  &incomingBuffer[v4],  self->_currentPacketBytesLeft);
  unsigned int v5 = atomic_load((unsigned int *)self->_incomingShmem + 5);
  -[GTSharedMemoryTransport_tools_diagnostics _updateReaderOffset:]( self,  "_updateReaderOffset:",  self->_currentPacketBytesLeft + v5);
  self->_unint64_t currentPacketBytesLeft = 0;
}

- (void)_dequeuePacket
{
  unint64_t v3 = -[GTSharedMemoryTransport_tools_diagnostics _computeBytesAvailableToRead](self, "_computeBytesAvailableToRead");
  if (v3 <= 3)
  {
    unsigned int v5 = objc_autoreleasePoolPush();
    -[GTBaseStreamTransport_tools_diagnostics _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  259LL,  0LL));
    objc_autoreleasePoolPop(v5);
  }

  else
  {
    unint64_t v4 = v3;
    -[GTSharedMemoryTransport_tools_diagnostics _copyFromSM:size:](self, "_copyFromSM:size:", &v7, 4LL);
    if (v4 < v7)
    {
      int64_t v6 = objc_autoreleasePoolPush();
      -[GTBaseStreamTransport_tools_diagnostics _scheduleInvalidation:]( self,  "_scheduleInvalidation:",  +[GTError_tools_diagnostics errorWithDomain:code:userInfo:]( &OBJC_CLASS___GTError_tools_diagnostics,  "errorWithDomain:code:userInfo:",  @"DYErrorDomain",  259LL,  0LL));
      objc_autoreleasePoolPop(v6);
    }

    else
    {
      self->_unint64_t currentPacketBytesLeft = v7 - 4;
    }
  }

- (void)_dequeueIncomingMessages
{
  unsigned int v3 = 0;
  uint64_t v4 = 3LL;
  int v5 = 3;
  while (1)
  {
    while (1)
    {
      unsigned int v6 = atomic_load((unsigned int *)self->_incomingShmem + 2);
      unsigned int v7 = atomic_load((unsigned int *)self->_incomingShmem + 1);
      if (v6 == v7) {
        break;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        goto LABEL_20;
      }
      -[GTSharedMemoryTransport_tools_diagnostics _dequeuePacket](self, "_dequeuePacket");
      if (!self->_currentPacketBytesLeft) {
        return;
      }
      ((void (*)(GTSharedMemoryTransport_tools_diagnostics *, SEL))self->_consumeBytesIMP)( self,  self->_consumeBytesSEL);
      if (self->_currentPacketBytesLeft) {
        goto LABEL_23;
      }
      unsigned int v10 = (unsigned int *)((char *)self->_incomingShmem + 8);
      do
        unsigned int v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      ++v3;
    }

    unsigned int v12 = atomic_load((unsigned int *)self->_incomingShmem);
    BOOL v13 = v5-- != 0;
    BOOL v14 = v13;
    if (!v12 || !v14) {
      break;
    }
    usleep(0xAu);
  }

- (BOOL)deferred
{
  return self->_deferred;
}

@end
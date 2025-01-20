@interface NSConcreteFileHandle
- (BOOL)closeAndReturnError:(id *)a3;
- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)synchronizeAndReturnError:(id *)a3;
- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (NSConcreteFileHandle)init;
- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3;
- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3 closeOnDealloc:(BOOL)a4;
- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5;
- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (NSConcreteFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6;
- (id)_monitor:(int)a3;
- (id)availableData;
- (id)port;
- (id)readDataOfLength:(unint64_t)a3;
- (id)readDataToEndOfFile;
- (id)readDataToEndOfFileAndReturnError:(id *)a3;
- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4;
- (id)readabilityHandler;
- (id)writeabilityHandler;
- (int)fileDescriptor;
- (unint64_t)offsetInFile;
- (unint64_t)readDataOfLength:(unint64_t)a3 buffer:(char *)a4;
- (unint64_t)seekToEndOfFile;
- (void)_cancelDispatchSources;
- (void)_closeOnDealloc;
- (void)_locked_clearHandler:(id *)a3 forSource:(id *)a4;
- (void)acceptConnectionInBackgroundAndNotify;
- (void)acceptConnectionInBackgroundAndNotifyForModes:(id)a3;
- (void)closeFile;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)performActivity:(int64_t)a3 modes:(id)a4;
- (void)readInBackgroundAndNotify;
- (void)readInBackgroundAndNotifyForModes:(id)a3;
- (void)readToEndOfFileInBackgroundAndNotify;
- (void)readToEndOfFileInBackgroundAndNotifyForModes:(id)a3;
- (void)seekToFileOffset:(unint64_t)a3;
- (void)setReadabilityHandler:(id)a3;
- (void)setWriteabilityHandler:(id)a3;
- (void)synchronizeFile;
- (void)truncateFileAtOffset:(unint64_t)a3;
- (void)waitForDataInBackgroundAndNotify;
- (void)waitForDataInBackgroundAndNotifyForModes:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation NSConcreteFileHandle

- (int)fileDescriptor
{
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 4) == 0) {
    return self->_fd;
  }
  v4 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  return -[NSConcreteFileHandle init](v4, v5);
}

- (NSConcreteFileHandle)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v3, sel_dealloc);
  return 0LL;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0]);
    goto LABEL_7;
  }

  char v6 = atomic_load(&self->_flags);
  if ((v6 & 4) != 0)
  {
LABEL_7:
    v9 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    -[NSConcreteFileHandle initWithFileDescriptor:closeOnDealloc:](v9, v10, v11, v12);
    return;
  }

  xpc_object_t v7 = xpc_fd_create(self->_fd);
  if (v7)
  {
    v8 = v7;
    [a3 encodeXPCObject:v7 forKey:@"NS.fd"];
    xpc_release(v8);
  }

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3 closeOnDealloc:(BOOL)a4
{
  self->_fd = a3;
  self->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.1", 0LL);
  if (!a4)
  {
    p_flags = &self->_flags;
    do
      unsigned __int16 v7 = __ldaxr(p_flags);
    while (__stlxr(v7 | 2, p_flags));
  }

  self->_lock._os_unfair_lock_opaque = 0;
  v8 = &self->_flags;
  do
    unsigned __int16 v9 = __ldaxr(v8);
  while (__stlxr(v9 | 1, v8));
  return self;
}

- (NSConcreteFileHandle)initWithFileDescriptor:(int)a3
{
  return -[NSConcreteFileHandle initWithFileDescriptor:closeOnDealloc:]( self,  "initWithFileDescriptor:closeOnDealloc:",  *(void *)&a3,  0LL);
}

- (NSConcreteFileHandle)initWithURL:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  int v8 = a4;
  SEL v10 = self;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  self->_fd = -1;
  if (([a3 getFileSystemRepresentation:v18 maxLength:1026] & 1) == 0)
  {
    -[NSConcreteFileHandle dealloc]( &v17,  sel_dealloc,  v16.receiver,  v16.super_class,  v10,  &OBJC_CLASS___NSConcreteFileHandle);
    return 0LL;
  }

  int v11 = _NSOpenFileDescriptor(v18, v8, a5);
  v10->_fd = v11;
  if (v11 < 0)
  {
    if (a6)
    {
      uint64_t v14 = *__error();
      *a6 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(v14, [a3 path], 0, 0, 0);
    }

    -[NSConcreteFileHandle dealloc]( &v16,  sel_dealloc,  v10,  &OBJC_CLASS___NSConcreteFileHandle,  v17.receiver,  v17.super_class);
    return 0LL;
  }

  p_flags = &v10->_flags;
  do
    unsigned __int16 v13 = __ldaxr(p_flags);
  while (__stlxr(v13 | 1, p_flags));
  v10->_fhQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.2", 0LL);
  v10->_lock._os_unfair_lock_opaque = 0;
  return v10;
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5 error:(id *)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ([a3 length]) {
    return -[NSConcreteFileHandle initWithURL:flags:createMode:error:]( self,  "initWithURL:flags:createMode:error:",  [MEMORY[0x189604030] fileURLWithPath:a3],  a4,  a5,  a6);
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v12, sel_dealloc);
  return 0LL;
}

- (NSConcreteFileHandle)initWithPath:(id)a3 flags:(int64_t)a4 createMode:(int64_t)a5
{
  return -[NSConcreteFileHandle initWithPath:flags:createMode:error:]( self,  "initWithPath:flags:createMode:error:",  a3,  a4,  a5,  0LL);
}

- (id)availableData
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fstat(self->_fd, &v9) < 0) {
    goto LABEL_11;
  }
  if ((v9.st_mode & 0xF000) == 0x8000)
  {
    id result = -[NSConcreteFileHandle readDataToEndOfFile](self, "readDataToEndOfFile");
    if (result) {
      return result;
    }
    return (id)[MEMORY[0x189603F48] data];
  }

  unint64_t v6 = *MEMORY[0x1895FD590];
  unsigned __int16 v7 = (char *)malloc(*MEMORY[0x1895FD590]);
  uint64_t v8 = _NSReadFromFileDescriptorWithProgress(self->_fd, v7, v6, 0LL, 0);
  if (v8 > 0) {
    return (id)[MEMORY[0x189603F48] dataWithBytesNoCopy:v7 length:v8];
  }
  free(v7);
  if (v8 < 0) {
LABEL_11:
  }
    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
  return (id)[MEMORY[0x189603F48] data];
}

- (unint64_t)readDataOfLength:(unint64_t)a3 buffer:(char *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  char v9 = atomic_load(&self->_flags);
  if ((v9 & 4) != 0) {
    goto LABEL_29;
  }
  char v4 = a4;
  unint64_t v5 = a3;
  uint64_t v6 = 12LL;
  if (fstat(self->_fd, &v17) < 0) {
    goto LABEL_29;
  }
  if ((v17.st_mode & 0xF000) != 0x8000) {
    goto LABEL_14;
  }
  off_t v10 = lseek(self->_fd, 0LL, 1);
  if (v10 < 0) {
    goto LABEL_29;
  }
  uint64_t v11 = v17.st_size - v10;
  if (v17.st_size <= v10) {
    return 0LL;
  }
  if (v11 >= v5) {
    uint64_t v11 = v5;
  }
  if (v11 < 1) {
    return 0LL;
  }
  unint64_t v12 = v11 >= 0x80000000LL ? 0x80000000LL : v11;
  unint64_t v13 = _NSReadFromFileDescriptorWithProgress(self->_fd, v4, v12, 0LL, 0);
  if ((v13 & 0x8000000000000000LL) != 0)
  {
LABEL_29:
    while (1)
    {
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
LABEL_14:
      if (!v5) {
        break;
      }
      unint64_t v13 = 0LL;
      if (v5 >= 0x1000) {
        unint64_t v14 = 4096LL;
      }
      else {
        unint64_t v14 = v5;
      }
      while (1)
      {
        uint64_t v15 = _NSReadFromFileDescriptorWithProgress((int)(&self->super.super.isa)[v6], &v4[v13], v14, 0LL, 0);
        if (v15 < 0) {
          break;
        }
        if (v15)
        {
          v13 += v15;
          v5 -= v15;
          unint64_t v14 = v5 >= 0x1000 ? 4096LL : v5;
          if (v5) {
            continue;
          }
        }

        return v13;
      }
    }

    return 0LL;
  }

  return v13;
}

- (id)readDataOfLength:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || fstat(self->_fd, &v21) < 0) {
    goto LABEL_40;
  }
  if ((v21.st_mode & 0xF000) != 0x8000)
  {
    off_t v10 = malloc(0x2000uLL);
    size_t v11 = 0LL;
    unint64_t v14 = a3;
    size_t v15 = 0x2000LL;
    while (v14)
    {
      if (v14 >= 0x2000) {
        unint64_t v16 = 0x2000LL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v15 - v11 < v16)
      {
        v15 *= 2LL;
        stat v17 = reallocf(v10, v15);
        if (!v17) {
          goto LABEL_40;
        }
        off_t v10 = v17;
      }

      uint64_t v18 = _NSReadFromFileDescriptorWithProgress(self->_fd, (char *)v10 + v11, v16, 0LL, 0);
      if (v18 < 0) {
        goto LABEL_39;
      }
      v11 += v18;
      v14 -= v18;
      if (v18) {
        BOOL v19 = v11 == a3;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19) {
        break;
      }
    }

- (id)readDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  return -[NSConcreteFileHandle readDataOfLength:](self, "readDataOfLength:", a3);
}

- (id)readDataToEndOfFile
{
  return -[NSConcreteFileHandle readDataOfLength:](self, "readDataOfLength:", -1LL);
}

- (id)readDataToEndOfFileAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  return -[NSConcreteFileHandle readDataToEndOfFile](self, "readDataToEndOfFile");
}

- (void)writeData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if ([a3 length])
  {
    char v6 = atomic_load(&self->_flags);
    if ((v6 & 4) != 0)
    {
      _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    }

    else
    {
      uint64_t v8 = 0LL;
      char v9 = &v8;
      uint64_t v10 = 0x2020000000LL;
      char v11 = 1;
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __34__NSConcreteFileHandle_writeData___block_invoke;
      v7[3] = &unk_189C99E78;
      v7[4] = self;
      v7[5] = &v8;
      [a3 enumerateByteRangesUsingBlock:v7];
      if (*((_BYTE *)v9 + 24))
      {
        _Block_object_dispose(&v8, 8);
        return;
      }
    }

    _NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    __break(1u);
  }

uint64_t __34__NSConcreteFileHandle_writeData___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  unint64_t a4,  _BYTE *a5)
{
  if (a4)
  {
    uint64_t v8 = result;
    unint64_t v9 = 0LL;
    while (1)
    {
      id result = _NSWriteToFileDescriptorWithProgress( *(_DWORD *)(*(void *)(v8 + 32) + 96LL),  (char *)(a2 + v9),  a4 - v9,  0);
      if (result < 0) {
        break;
      }
      v9 += result;
      if (v9 >= a4) {
        return result;
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(v8 + 40) + 8LL) + 24LL) = 0;
    *a5 = 1;
  }

  return result;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  -[NSConcreteFileHandle writeData:](self, "writeData:", a3);
  return 1;
}

- (unint64_t)offsetInFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (unint64_t result = lseek(self->_fd, 0LL, 1), (result & 0x8000000000000000LL) != 0))
  {
    char v6 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
    return -[NSConcreteFileHandle getOffset:error:](v6, v7, v8, v9);
  }

  return result;
}

- (BOOL)getOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  unint64_t v5 = -[NSConcreteFileHandle offsetInFile](self, "offsetInFile");
  if (a3) {
    *a3 = v5;
  }
  return 1;
}

- (unint64_t)seekToEndOfFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || (unint64_t result = lseek(self->_fd, 0LL, 2), (result & 0x8000000000000000LL) != 0))
  {
    char v6 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
    return -[NSConcreteFileHandle seekToEndReturningOffset:error:](v6, v7, v8, v9);
  }

  return result;
}

- (BOOL)seekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  unint64_t v5 = -[NSConcreteFileHandle seekToEndOfFile](self, "seekToEndOfFile");
  if (a3) {
    *a3 = v5;
  }
  return 1;
}

- (void)seekToFileOffset:(unint64_t)a3
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0)
  {
    char v6 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 1);
    -[NSConcreteFileHandle seekToOffset:error:](v6, v7, v8, v9);
  }

- (BOOL)seekToOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  -[NSConcreteFileHandle seekToFileOffset:](self, "seekToFileOffset:", a3);
  return 1;
}

- (void)truncateFileAtOffset:(unint64_t)a3
{
  char v5 = atomic_load(&self->_flags);
  if ((v5 & 4) != 0 || lseek(self->_fd, a3, 0) < 0 || ftruncate(self->_fd, a3) < 0)
  {
    SEL v7 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    -[NSConcreteFileHandle truncateAtOffset:error:](v7, v8, v9, v10);
  }

- (BOOL)truncateAtOffset:(unint64_t)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  -[NSConcreteFileHandle truncateFileAtOffset:](self, "truncateFileAtOffset:", a3);
  return 1;
}

- (void)synchronizeFile
{
  char v4 = atomic_load(&self->_flags);
  if ((v4 & 4) != 0 || fsync(self->_fd) < 0)
  {
    char v5 = (NSConcreteFileHandle *)_NSFileHandleRaiseOperationExceptionWhileReading((objc_class *)self, a2, 0);
    -[NSConcreteFileHandle synchronizeAndReturnError:](v5, v6, v7);
  }

- (BOOL)synchronizeAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  -[NSConcreteFileHandle synchronizeFile](self, "synchronizeFile");
  return 1;
}

- (void)_cancelDispatchSources
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dsrc = self->_dsrc;
  self->_dsrc = 0LL;
  -[NSConcreteFileHandle _locked_clearHandler:forSource:]( self,  "_locked_clearHandler:forSource:",  &self->_readabilityHandler,  &self->_readMonitoringSource);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:]( self,  "_locked_clearHandler:forSource:",  &self->_writeabilityHandler,  &self->_writeMonitoringSource);
  readChannel = self->_readChannel;
  if (readChannel) {
    dispatch_io_close((dispatch_io_t)readChannel, 1uLL);
  }
  os_unfair_lock_unlock(p_lock);
  if (dsrc) {
    dispatch_source_cancel((dispatch_source_t)dsrc);
  }
}

- (void)closeFile
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v2 = atomic_load(&self->_flags);
  if ((v2 & 4) == 0)
  {
    -[NSConcreteFileHandle _cancelDispatchSources](self, "_cancelDispatchSources");
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __33__NSConcreteFileHandle_closeFile__block_invoke;
    v7[3] = &unk_189C9A030;
    SEL v8 = self;
    monitoringQueue = (dispatch_queue_s *)self->_monitoringQueue;
    if (monitoringQueue)
    {
      dispatch_async(monitoringQueue, v7);
    }

    else
    {
      p_flags = &self->_flags;
      do
        unsigned __int16 v6 = __ldaxr(p_flags);
      while (__stlxr(v6 | 4, p_flags));
      close(v8->_fd);
    }
  }

uint64_t __33__NSConcreteFileHandle_closeFile__block_invoke(uint64_t a1)
{
  v1 = (unsigned __int16 *)(*(void *)(a1 + 32) + 100LL);
  do
    unsigned __int16 v2 = __ldaxr(v1);
  while (__stlxr(v2 | 4, v1));
  return close(*(_DWORD *)(*(void *)(a1 + 32) + 96LL));
}

- (BOOL)closeAndReturnError:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  -[NSConcreteFileHandle closeFile](self, "closeFile");
  return 1;
}

- (id)port
{
  return 0LL;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  -[NSConcreteFileHandle _cancelDispatchSources](self, "_cancelDispatchSources");
  if ((self->_fd & 0x80000000) == 0)
  {
    char v3 = atomic_load(&self->_flags);
    if ((v3 & 4) == 0)
    {
      char v4 = atomic_load(&self->_flags);
      if ((v4 & 2) == 0)
      {
        char v5 = atomic_load(&self->_flags);
        if ((v5 & 1) != 0) {
          close(self->_fd);
        }
      }
    }
  }

  fhQueue = (dispatch_object_s *)self->_fhQueue;
  if (fhQueue) {
    dispatch_release(fhQueue);
  }
  monitoringQueue = (dispatch_object_s *)self->_monitoringQueue;
  if (monitoringQueue) {
    dispatch_release(monitoringQueue);
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSConcreteFileHandle;
  -[NSConcreteFileHandle dealloc](&v8, sel_dealloc);
}

- (void)performActivity:(int64_t)a3 modes:(id)a4
{
  __int16 v5 = a3;
  uint64_t v38 = *MEMORY[0x1895F89C0];
  SEL v7 = (unsigned int *)malloc(0x20uLL);
  atomic_store(0, v7);
  *((void *)v7 + 1) = self;
  *((_WORD *)v7 + 8) = v5;
  context.version = 0LL;
  context.info = v7;
  context.retain = (const void *(__cdecl *)(const void *))_NSFileHandlePerformSourceContextRetain;
  context.release = (void (__cdecl *)(const void *))_NSFileHandlePerformSourceContextRelease;
  memset(&context.copyDescription, 0, 40);
  context.perform = (void (__cdecl *)(void *))_performFileHandleSource;
  if (a4)
  {
    id v8 = a4;
  }

  else
  {
    id v9 = objc_allocWithZone(MEMORY[0x189603F18]);
    a4 = (id)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1896051B0], 0);
  }

  CFRetain(self);
  CFRunLoopSourceRef v10 = CFRunLoopSourceCreate(0LL, 50LL, &context);
  *((void *)v7 + 3) = v10;
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRetain(Current);
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x3052000000LL;
  v36[3] = __Block_byref_object_copy__2;
  v36[4] = __Block_byref_object_dispose__2;
  v36[5] = self;
  int v12 = -[NSConcreteFileHandle fileDescriptor](self, "fileDescriptor");
  dispatch_fd_t v13 = dup(v12);
  atomic_store(0, (unsigned int *)&self->_error);
  CFRetain(v10);
  switch(v5)
  {
    case 12:
    case 20:
      unint64_t v14 = dispatch_source_create(MEMORY[0x1895F8B60], v13, 0LL, (dispatch_queue_t)self->_fhQueue);
      uint64_t v15 = MEMORY[0x1895F87A8];
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4;
      handler[3] = &unk_189C9A9E0;
      dispatch_fd_t v30 = v13;
      handler[4] = v14;
      handler[5] = v10;
      handler[6] = Current;
      dispatch_source_set_cancel_handler(v14, handler);
      v26[0] = v15;
      v26[1] = 3221225472LL;
      v26[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5;
      v26[3] = &unk_189C9AA08;
      __int16 v28 = v5;
      int v27 = v12;
      v26[4] = v36;
      v26[5] = v10;
      v26[6] = Current;
      dispatch_source_set_event_handler(v14, v26);
      os_unfair_lock_lock(&self->_lock);
      self->_dsrc = (OS_dispatch_source *)v14;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_resume(v14);
      break;
    case 14:
      size_t v16 = 16LL * *MEMORY[0x1895FD590];
      fhQueue = (dispatch_queue_s *)self->_fhQueue;
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3;
      v31[3] = &unk_189C9A9B8;
      v31[4] = self;
      v31[5] = v36;
      v31[6] = v10;
      v31[7] = Current;
      dispatch_fd_t v32 = v13;
      dispatch_read(v13, v16, fhQueue, v31);
      break;
    case 16:
      uint64_t v18 = (dispatch_queue_s *)self->_fhQueue;
      uint64_t v19 = MEMORY[0x1895F87A8];
      cleanup_handler[0] = MEMORY[0x1895F87A8];
      cleanup_handler[1] = 3221225472LL;
      cleanup_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke;
      cleanup_handler[3] = &__block_descriptor_36_e8_v12__0i8l;
      dispatch_fd_t v35 = v13;
      v20 = (OS_dispatch_io *)dispatch_io_create(0LL, v13, v18, cleanup_handler);
      os_unfair_lock_lock(&self->_lock);
      self->_readChannel = v20;
      os_unfair_lock_unlock(&self->_lock);
      dispatch_io_set_low_water((dispatch_io_t)v20, 0xFFFFFFFFFFFFFFFFLL);
      stat v21 = (dispatch_queue_s *)self->_fhQueue;
      io_handler[0] = v19;
      io_handler[1] = 3221225472LL;
      io_handler[2] = __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2;
      io_handler[3] = &unk_189C9A990;
      io_handler[4] = self;
      io_handler[5] = v36;
      io_handler[6] = v10;
      io_void handler[7] = Current;
      dispatch_io_read((dispatch_io_t)v20, 0LL, 0xFFFFFFFFFFFFFFFFLL, v21, io_handler);
      break;
    default:
      break;
  }

  uint64_t v22 = [a4 count];
  if (v22 >= 1)
  {
    for (CFIndex i = 0LL; i != v22; ++i)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a4, i);
      v25 = CFRunLoopGetCurrent();
      CFRunLoopAddSource(v25, v10, ValueAtIndex);
    }
  }

  _Block_object_dispose(v36, 8);
}

uint64_t __46__NSConcreteFileHandle_performActivity_modes___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_2( uint64_t a1,  int a2,  dispatch_data_s *a3,  unsigned int a4)
{
  if (a4) {
    atomic_store(a4, (unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 12LL));
  }
  if (a3 && a3 != (dispatch_data_s *)MEMORY[0x1895F8AA8])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = *(dispatch_object_s **)(v7 + 32);
    if (v8)
    {
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 32LL) = dispatch_data_create_concat( *(dispatch_data_t *)(v7 + 32),  a3);
      dispatch_release(v8);
    }

    else
    {
      *(void *)(v7 + 32) = a3;
      dispatch_retain(a3);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
  }

  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    CFRunLoopSourceRef v10 = *(dispatch_object_s **)(v9 + 48);
    *(void *)(v9 + 48) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
    if (v10) {
      dispatch_release(v10);
    }
    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 56));
  }

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_3( uint64_t a1,  dispatch_object_s *a2,  unsigned int a3)
{
  if (a3) {
    atomic_store(a3, (unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 12LL));
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 32LL) = a2;
  dispatch_retain(a2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 48));
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  close(*(_DWORD *)(a1 + 64));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_4(uint64_t a1)
{
}

void __46__NSConcreteFileHandle_performActivity_modes___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 8));
  char v3 = *(dispatch_source_s **)(v2 + 24);
  *(void *)(v2 + 24) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  if (v3) {
    dispatch_source_cancel(v3);
  }
  if (*(_WORD *)(a1 + 60) == 12)
  {
    unsigned int v4 = accept(*(_DWORD *)(a1 + 56), 0LL, 0LL);
    if ((v4 & 0x80000000) != 0) {
      atomic_store(*__error(), (unsigned int *)(v2 + 12));
    }
    atomic_store(v4, (unsigned int *)(v2 + 16));
  }

  CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 40));
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 48));
}

- (void)readInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)readInBackgroundAndNotify
{
}

- (void)readToEndOfFileInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)readToEndOfFileInBackgroundAndNotify
{
}

- (void)acceptConnectionInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)acceptConnectionInBackgroundAndNotify
{
}

- (void)waitForDataInBackgroundAndNotifyForModes:(id)a3
{
}

- (void)waitForDataInBackgroundAndNotify
{
}

- (id)_monitor:(int)a3
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v5 = 7LL;
  if (!a3) {
    uint64_t v5 = 5LL;
  }
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NSConcreteFileHandle__flags[v5]);
  int v7 = dup(self->_fd);
  monitoringQueue = self->_monitoringQueue;
  if (!monitoringQueue)
  {
    monitoringQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NSFileHandle.fd_monitoring", 0LL);
    self->_monitoringQueue = monitoringQueue;
  }

  if (a3) {
    uint64_t v9 = (const dispatch_source_type_s *)MEMORY[0x1895F8B90];
  }
  else {
    uint64_t v9 = (const dispatch_source_type_s *)MEMORY[0x1895F8B60];
  }
  CFRunLoopSourceRef v10 = dispatch_source_create(v9, v7, 0LL, (dispatch_queue_t)monitoringQueue);
  objc_initWeak(location, self);
  uint64_t v11 = MEMORY[0x1895F87A8];
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __33__NSConcreteFileHandle__monitor___block_invoke;
  handler[3] = &unk_189C9AA30;
  objc_copyWeak(&v16, location);
  handler[4] = v6;
  dispatch_source_set_event_handler(v10, handler);
  v13[0] = v11;
  v13[1] = 3221225472LL;
  v13[2] = __33__NSConcreteFileHandle__monitor___block_invoke_2;
  v13[3] = &unk_189C9AA58;
  int v14 = v7;
  v13[4] = v10;
  dispatch_source_set_cancel_handler(v10, v13);
  dispatch_resume(v10);
  objc_destroyWeak(&v16);
  objc_destroyWeak(location);
  return v10;
}

uint64_t __33__NSConcreteFileHandle__monitor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  return _CFAutoreleasePoolPop();
}

void __33__NSConcreteFileHandle__monitor___block_invoke_2(uint64_t a1)
{
}

- (void)_locked_clearHandler:(id *)a3 forSource:(id *)a4
{
  uint64_t v5 = (dispatch_source_s *)*a4;
  *a4 = 0LL;
  if (v5) {
    dispatch_source_cancel(v5);
  }

  *a3 = 0LL;
}

- (id)readabilityHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_readabilityHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReadabilityHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  os_unfair_lock_lock(&self->_lock);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:]( self,  "_locked_clearHandler:forSource:",  &self->_readabilityHandler,  &self->_readMonitoringSource);
  self->_readabilityHandler = v4;
  if (v4) {
    self->_readMonitoringSource = (OS_dispatch_source *)-[NSConcreteFileHandle _monitor:](self, "_monitor:", 0LL);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)writeabilityHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_writeabilityHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setWriteabilityHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  os_unfair_lock_lock(&self->_lock);
  -[NSConcreteFileHandle _locked_clearHandler:forSource:]( self,  "_locked_clearHandler:forSource:",  &self->_writeabilityHandler,  &self->_writeMonitoringSource);
  self->_writeabilityHandler = v4;
  if (v4) {
    self->_writeMonitoringSource = (OS_dispatch_source *)-[NSConcreteFileHandle _monitor:](self, "_monitor:", 1LL);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_closeOnDealloc
{
  p_flags = &self->_flags;
  do
    unsigned __int16 v3 = __ldaxr(p_flags);
  while (__stlxr(v3 & 0xFFFD, p_flags));
}

@end
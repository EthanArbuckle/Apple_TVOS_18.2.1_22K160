@interface CFPDPurgeableBuffer
- (BOOL)beginAccessing;
- (BOOL)purgable;
- (CFPDPurgeableBuffer)initWithFileDescriptor:(int)a3 size:(unint64_t)a4;
- (CFPDPurgeableBuffer)initWithPropertyList:(void *)a3;
- (unint64_t)length;
- (void)beginAccessing;
- (void)bytes;
- (void)dealloc;
- (void)endAccessing;
@end

@implementation CFPDPurgeableBuffer

- (CFPDPurgeableBuffer)initWithFileDescriptor:(int)a3 size:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a3 < 0 || !a4)
  {

    return 0LL;
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CFPDPurgeableBuffer;
  v6 = -[CFPDPurgeableBuffer init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4 >= *MEMORY[0x1895FD590] >> 2)
    {
      context.version = 0LL;
      context.info = v6;
      memset(&context.retain, 0, 24);
      context.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
      context.reallocate = 0LL;
      context.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
      context.preferredSize = 0LL;
      v8 = CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &context);
      if (!v8) {
        goto LABEL_20;
      }
    }

    else
    {
      v8 = (const __CFAllocator *)CFRetain(&__kCFAllocatorSystemDefault);
      v7->usedMalloc = 1;
      if (!v8) {
        goto LABEL_20;
      }
    }

    v9 = (const UInt8 *)CFAllocatorAllocate(v8, a4, 0LL);
    if (v9)
    {
      v10 = (UInt8 *)v9;
      FixedMutableWithBuffer = _CFDataCreateFixedMutableWithBuffer(&__kCFAllocatorSystemDefault, a4, v9, v8);
      if (FixedMutableWithBuffer)
      {
        v12 = (__CFData *)FixedMutableWithBuffer;
        CFRelease(v8);
        CFDataSetLength(v12, a4);
        MutableBytePtr = CFDataGetMutableBytePtr(v12);
        uint64_t v14 = 0LL;
        size_t v15 = a4;
        do
        {
          ssize_t v16 = read(a3, &MutableBytePtr[v14], v15);
          ssize_t v17 = v16;
          if (v16 == -1)
          {
            if (*__error() != 4)
            {
              int v20 = *__error();
              bzero(&context, 0x400uLL);
              fcntl(a3, 50, &context);
              v21 = (os_log_s *)_CFPrefsDaemonLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
                -[CFPDPurgeableBuffer initWithFileDescriptor:size:].cold.2((uint64_t)&context, v20, v21);
              }
              v7->handle = v12;
              goto LABEL_20;
            }
          }

          else
          {
            v14 += v16;
            v15 -= v16;
          }
        }

        while (v17);
        v7->handle = v12;
        if (v14 == a4)
        {
          v7->safe = 1;
          return v7;
        }

        bzero(&context, 0x400uLL);
        fcntl(a3, 50, &context);
        v19 = (os_log_s *)_CFPrefsDaemonLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[CFPDPurgeableBuffer initWithFileDescriptor:size:].cold.1((uint64_t)&context, v19);
        }
        goto LABEL_20;
      }

      CFAllocatorDeallocate(v8, v10);
    }

    CFRelease(v8);
LABEL_20:

    return 0LL;
  }

  return v7;
}

- (CFPDPurgeableBuffer)initWithPropertyList:(void *)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CFPDPurgeableBuffer;
  v4 = -[CFPDPurgeableBuffer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke;
    v8[3] = &unk_189996858;
    v8[4] = v4;
    DataUsingExternalBufferAllocator = __CFBinaryPlistCreateDataUsingExternalBufferAllocator( a3,  0LL,  0LL,  (uint64_t)v8,  0LL);
    if (DataUsingExternalBufferAllocator)
    {
      v5->handle = (__CFData *)DataUsingExternalBufferAllocator;
      v5->safe = 1;
    }

    else
    {

      return 0LL;
    }
  }

  return v5;
}

CFAllocatorRef __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke( uint64_t a1,  unint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a2 >= *MEMORY[0x1895FD590] >> 2)
  {
    v3 = *(void **)(a1 + 32);
    v4.version = 0LL;
    v4.info = v3;
    memset(&v4.retain, 0, 24);
    v4.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
    v4.reallocate = 0LL;
    v4.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
    v4.preferredSize = 0LL;
    return CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &v4);
  }

  else
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 25LL) = 1;
    return (CFAllocatorRef)CFRetain(&__kCFAllocatorSystemDefault);
  }

- (void)bytes
{
}

- (unint64_t)length
{
  return CFDataGetLength(self->handle);
}

- (BOOL)beginAccessing
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (self->usedMalloc) {
    return 1;
  }
  if (self->safe) {
    -[CFPDPurgeableBuffer beginAccessing].cold.1();
  }
  int v7 = 0;
  uint64_t v4 = *MEMORY[0x1895FBBE0];
  BytePtr = CFDataGetBytePtr(self->handle);
  int v6 = MEMORY[0x186E04CFC](v4, BytePtr, 0LL, &v7);
  BOOL result = (v6 | v7) == 0;
  self->safe = result;
  return result;
}

- (void)endAccessing
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!self->usedMalloc && self->safe)
  {
    int v5 = 1;
    uint64_t v3 = *MEMORY[0x1895FBBE0];
    BytePtr = CFDataGetBytePtr(self->handle);
    MEMORY[0x186E04CFC](v3, BytePtr, 0LL, &v5);
    self->safe = 0;
  }

- (BOOL)purgable
{
  return !self->safe;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  handle = self->handle;
  if (handle) {
    CFRelease(handle);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CFPDPurgeableBuffer;
  -[CFPDPurgeableBuffer dealloc](&v4, sel_dealloc);
}

- (void)initWithFileDescriptor:(uint64_t)a1 size:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136380675;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_180A4C000,  a2,  OS_LOG_TYPE_FAULT,  "read an unexpected amount of data from %{private}s. This likely means that someone wrote directly to that file behin d cfprefsd's back, which is unsupported.",  (uint8_t *)&v2,  0xCu);
}

- (void)initWithFileDescriptor:(os_log_s *)a3 size:.cold.2(uint64_t a1, int __errnum, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  int v7 = strerror(__errnum);
  _os_log_fault_impl( &dword_180A4C000,  a3,  OS_LOG_TYPE_FAULT,  "couldn't read preferences file %{public}s due to %{public}s",  (uint8_t *)&v4,  0x16u);
}

- (void)beginAccessing
{
}

@end
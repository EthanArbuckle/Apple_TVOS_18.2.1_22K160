@interface CFPDDataBuffer
+ (id)newBufferFromCFData:(__CFData *)a3;
+ (id)newBufferFromFile:(int)a3 allowMappingIfSafe:(BOOL)a4;
+ (id)newBufferFromPropertyList:(void *)a3;
- (BOOL)beginAccessing;
- (BOOL)purgable;
- (BOOL)validatePlist;
- (__CFData)copyCFData;
- (id)copyXPCData;
- (unint64_t)length;
- (void)bytes;
- (void)copyPropertyListWithMutability:(unint64_t)a3 error:(__CFError *)a4;
- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(id)a3;
@end

@implementation CFPDDataBuffer

+ (id)newBufferFromCFData:(__CFData *)a3
{
  return -[CFPDCFDataBuffer initWithCFData:](objc_alloc(&OBJC_CLASS___CFPDCFDataBuffer), "initWithCFData:", a3);
}

+ (id)newBufferFromFile:(int)a3 allowMappingIfSafe:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v5 = fstat(a3, &v8);
  id result = 0LL;
  if (!v5 && v8.st_size >= 1)
  {
    v7 = objc_alloc(&OBJC_CLASS___CFPDPurgeableBuffer);
    return -[CFPDPurgeableBuffer initWithFileDescriptor:size:](v7, "initWithFileDescriptor:size:", v4, v8.st_size);
  }

  return result;
}

+ (id)newBufferFromPropertyList:(void *)a3
{
  return -[CFPDPurgeableBuffer initWithPropertyList:]( objc_alloc(&OBJC_CLASS___CFPDPurgeableBuffer),  "initWithPropertyList:",  a3);
}

- (void)bytes
{
}

- (unint64_t)length
{
}

- (__CFData)copyCFData
{
  return CFDataCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"),  -[CFPDDataBuffer length](self, "length"));
}

- (id)copyXPCData
{
  return xpc_data_create(-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"));
}

- (void)copyPropertyListWithMutability:(unint64_t)a3 error:(__CFError *)a4
{
  v6 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"),  -[CFPDDataBuffer length](self, "length"),  (CFAllocatorRef)&__kCFAllocatorNull);
  CFPropertyListRef v7 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, a3, 0LL, a4);
  CFRelease(v6);
  if (v7 && CFGetTypeID(v7) != 18)
  {
    stat v8 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CFPDDataBuffer copyPropertyListWithMutability:error:].cold.1(v8);
    }
    CFRelease(v7);
    CFPropertyListRef v7 = 0LL;
    if (a4) {
      *a4 = 0LL;
    }
  }

  return (void *)v7;
}

- (BOOL)validatePlist
{
  v6[1] = *MEMORY[0x1895F89C0];
  v2 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"),  -[CFPDDataBuffer length](self, "length"),  (CFAllocatorRef)&__kCFAllocatorNull);
  char v3 = _CFPropertyListValidateData(v2, v6);
  if (v6[0] == 18LL) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(id)a3
{
  if (-[CFPDDataBuffer length](self, "length") < 8
    || (int v5 = -[CFPDDataBuffer bytes](self, "bytes"), strncmp(v5, "bplist00", 8uLL)) && strncmp(v5, "<?xml", 5uLL))
  {
    (*((void (**)(id))a3 + 2))(a3);
    CFDataRef v6 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"),  -[CFPDDataBuffer length](self, "length"),  (CFAllocatorRef)&__kCFAllocatorNull);
    if (os_variant_has_internal_diagnostics())
    {
      CFPropertyListRef v7 = os_log_create("com.apple.defaults", "diagnostics");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:].cold.1((uint64_t)v6, v7);
      }
    }

    CFRelease(v6);
  }

- (BOOL)beginAccessing
{
  return 1;
}

- (BOOL)purgable
{
  return 0;
}

- (void)copyPropertyListWithMutability:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_ERROR,  "Found non-dictionary property list, which is invalid for preferences. Ignoring it.",  v1,  2u);
}

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_180A4C000, a2, OS_LOG_TYPE_ERROR, "bad plist data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
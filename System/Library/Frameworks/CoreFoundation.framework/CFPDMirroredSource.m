@interface CFPDMirroredSource
- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7;
- (CFPDMirroredSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 mirroredKeys:(__CFArray *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9;
- (id)acceptMessage:(id)a3;
- (id)createDiskWrite;
- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6;
- (void)clearCacheForReason:(__CFString *)a3;
- (void)dealloc;
- (void)drainPendingChanges;
- (void)enqueueMirrorSignatureForKey:(xpc_object_t)xdict fromMessage:;
- (void)handleWritingResult:(__CFDictionary *)a3;
- (void)lock;
- (void)unlock;
@end

@implementation CFPDMirroredSource

- (CFPDMirroredSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 mirroredKeys:(__CFArray *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  v14 = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]( &v23,  sel_initWithDomain_userName_byHost_managed_shmemIndex_daemon_,  a3,  a4,  a5,  a6,  a8,  a9);
  if (v14)
  {
    uint64_t Count = CFArrayGetCount(a7);
    v14->_mirroredKeys = CFSetCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  Count,  &kCFCopyStringSetCallBacks);
    if (Count >= 1)
    {
      for (CFIndex i = 0LL; i != Count; ++i)
      {
        mirroredKeys = v14->_mirroredKeys;
        ValueAtIndex = CFArrayGetValueAtIndex(a7, i);
        CFSetAddValue(mirroredKeys, ValueAtIndex);
      }
    }

    int v19 = CFEqual(a3, @"kCFPreferencesAnyApplication");
    v20 = @".GlobalPreferences";
    if (!v19) {
      v20 = a3;
    }
    CFStringRef v21 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@_m", v20);
    v14->_mirrorSource = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]( objc_alloc(&OBJC_CLASS___CFPDSource),  "initWithDomain:userName:byHost:managed:shmemIndex:daemon:",  v21,  a4,  v11,  v10,  0LL,  0LL);
    CFRelease(v21);
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFRelease(self->_mirroredKeys);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource dealloc](&v3, sel_dealloc);
}

- (id)acceptMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  id v5 = -[CFPDSource acceptMessage:](&v10, sel_acceptMessage_);
  if (xpc_dictionary_get_int64(a3, "CFPreferencesOperation") == 1
    && !xpc_dictionary_get_value(v5, "CFPreferencesErrorType")
    && (_CFPrefsDecodeKeyValuePairFromXPCMessage(a3, 0LL, 0LL, 0LL) & 1) == 0)
  {
    id v6 = -[CFPDSource copyPropertyListValidatingPlist:](self->_mirrorSource, "copyPropertyListValidatingPlist:", 0LL);
    v7 = (void *)[v6 copyXPCData];
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_value(v5, "CFPreferencesValidationPropertyList", v7);
      xpc_release(v8);
    }
  }

  -[CFPDSource closeFileDescriptors]((uint64_t)self->_mirrorSource);
  return v5;
}

- (void)lock
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource lock](&v3, sel_lock);
  -[CFPDSource lock](self->_mirrorSource, "lock");
}

- (void)unlock
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[CFPDSource unlock](self->_mirrorSource, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource unlock](&v3, sel_unlock);
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  unsigned int v11 = -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:]( &v14,  sel_cacheFileInfoForWriting_euid_egid_didCreate_,  v9,  v8,  v7,  a6);
  if (v11 <= 1)
  {
    char v13 = 0;
    -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:]( self->_mirrorSource,  "cacheFileInfoForWriting:euid:egid:didCreate:",  v9,  v8,  v7,  &v13);
  }

  return v11;
}

- (void)enqueueMirrorSignatureForKey:(xpc_object_t)xdict fromMessage:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    memset(buffer, 0, sizeof(buffer));
    remote_connection = xpc_dictionary_get_remote_connection(xdict);
    if (!remote_connection)
    {
      value = (_xpc_connection_s *)xpc_dictionary_get_value(xdict, "connection");
      if (!value
        || (remote_connection = value,
            value = (_xpc_connection_s *)object_getClass(value),
            value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
      {
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:].cold.1((uint64_t)value, v8, v9);
      }
    }

    uint64_t pid = xpc_connection_get_pid(remote_connection);
    uint64_t v11 = pid;
    v12 = "Unknown";
    if ((_DWORD)pid != -1 && proc_name(pid, buffer, 0x40u) >= 0) {
      v12 = (const char *)buffer;
    }
    gettimeofday(&v18, 0LL);
    localtime_r(&v18.tv_sec, &v17);
    char v13 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%s(%d): %04d-%02d-%02d %02d:%02d:%02d (%s)",  v12,  v11,  (v17.tm_year + 1900),  (v17.tm_mon + 1),  v17.tm_mday,  v17.tm_hour,  v17.tm_min,  v17.tm_sec,  v17.tm_zone);
    objc_super v14 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%s%@",  "Sig_",  a2);
    xpc_object_t v15 = _CFXPCCreateXPCObjectFromCFObject(v14);
    xpc_object_t v16 = _CFXPCCreateXPCObjectFromCFObject(v13);
    [*(id *)(a1 + 152) enqueueNewKey:v15 value:v16 encoding:0 inBatch:0 fromMessage:xdict];
    CFRelease(v13);
    CFRelease(v14);
    xpc_release(v15);
    xpc_release(v16);
  }

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  v18[5] = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    CFStringRef v14 = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, string_ptr, 0x8000100u);
    if (v14)
    {
      CFStringRef v15 = v14;
      if (CFSetContainsValue(self->_mirroredKeys, v14))
      {
        if (!a4 || object_getClass(a4) == (Class)MEMORY[0x1895F92A8])
        {
          CFRelease(v15);
          v18[0] = MEMORY[0x1895F87A8];
          v18[1] = 3221225472LL;
          v18[2] = __ERROR_WRITE_REJECTED_block_invoke;
          v18[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
          v18[4] = "the key cannot be deleted";
          _extractCFPDBits(a7, a3, self, (uint64_t)v18);
          return 0;
        }

        -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]( self->_mirrorSource,  "enqueueNewKey:value:encoding:inBatch:fromMessage:",  a3,  a4,  v9,  v8,  a7);
        -[CFPDMirroredSource enqueueMirrorSignatureForKey:fromMessage:]((uint64_t)self, (uint64_t)v15, a7);
      }

      CFRelease(v15);
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]( &v17,  sel_enqueueNewKey_value_encoding_inBatch_fromMessage_,  a3,  a4,  v9,  v8,  a7);
  return 1;
}

- (void)drainPendingChanges
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  -[CFPDSource drainPendingChanges](self->_mirrorSource, "drainPendingChanges");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource drainPendingChanges](&v3, sel_drainPendingChanges);
}

- (id)createDiskWrite
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  id result = -[CFPDSource createDiskWrite](&v7, sel_createDiskWrite);
  if (result)
  {
    id v4 = result;
    id v5 = -[CFPDSource createDiskWrite](self->_mirrorSource, "createDiskWrite");
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __37__CFPDMirroredSource_createDiskWrite__block_invoke;
    v6[3] = &unk_1899ED970;
    v6[4] = v4;
    v6[5] = v5;
    return (id)[v6 copy];
  }

  return result;
}

uint64_t __37__CFPDMirroredSource_createDiskWrite__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      uint64_t v2 = (*(uint64_t (**)(void))(v3 + 16))();
    }
    else {
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource handleWritingResult:](&v5, sel_handleWritingResult_, a3);
  -[CFPDSource handleWritingResult:](self->_mirrorSource, "handleWritingResult:", a3);
}

- (void)clearCacheForReason:(__CFString *)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  -[CFPDSource clearCacheForReason:](self->_mirrorSource, "clearCacheForReason:");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CFPDMirroredSource;
  -[CFPDSource clearCacheForReason:](&v5, sel_clearCacheForReason_, a3);
}

- (void)enqueueMirrorSignatureForKey:(uint64_t)a3 fromMessage:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end
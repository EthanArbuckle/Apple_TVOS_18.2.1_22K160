@interface CFPDCloudSource
- (CFPDCloudSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 storeName:(id)a5 configurationPath:(__CFString *)a6 containerPath:(__CFString *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9;
- (__CFString)cloudConfigurationPath;
- (__CFString)debugDump;
- (id)_writeToDisk:(id *)result;
- (id)copyConfigurationFromPath:(uint64_t)a1;
- (id)copyPropertyListValidatingPlist:(BOOL)a3;
- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(uint64_t)a1;
- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10;
- (uint64_t)enqueueNewKey:(uint64_t)a1 value:(const __CFArray *)a2 encoding:(xpc_object_t)xdict inBatch:(int)a4;
- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4;
- (void)registerForChangeNotifications;
- (void)synchronizeWithCloud:(id)a3 replyHandler:(id)a4;
@end

@implementation CFPDCloudSource

- (id)copyConfigurationFromPath:(uint64_t)a1
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  bzero(buffer, 0x402uLL);
  if (!CFStringGetFileSystemRepresentation(a2, buffer, 1026LL)) {
    return 0LL;
  }
  uint64_t v3 = open(buffer, 256);
  if ((v3 & 0x80000000) != 0) {
    return 0LL;
  }
  int v4 = v3;
  id v5 = +[CFPDDataBuffer newBufferFromFile:allowMappingIfSafe:]( &OBJC_CLASS___CFPDDataBuffer,  "newBufferFromFile:allowMappingIfSafe:",  v3,  0LL);
  close(v4);
  return v5;
}

- (void)registerForChangeNotifications
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
    v2 = (__CFSet *)registerForChangeNotifications_cloudSources;
    if (!registerForChangeNotifications_cloudSources)
    {
      registerForChangeNotifications_cloudSources = (uint64_t)CFSetCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeSetCallBacks);
      int out_token = 0;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
      notify_register_dispatch( "SYDRemotePreferencesSourceDidChangeExternally",  &out_token,  global_queue,  &__block_literal_global_9);
      v2 = (__CFSet *)registerForChangeNotifications_cloudSources;
    }

    CFSetAddValue(v2, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&registerForChangeNotifications_cloudSourcesLock);
  }

void __49__CFPDCloudSource_registerForChangeNotifications__block_invoke()
{
}

- (CFPDCloudSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 storeName:(id)a5 configurationPath:(__CFString *)a6 containerPath:(__CFString *)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CFPDCloudSource;
  v12 = -[CFPDContainerSource initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:]( &v20,  sel_initWithDomain_userName_container_byHost_managed_shmemIndex_daemon_,  a3,  a4,  a7,  0LL,  0LL,  a8,  a9);
  if (v12)
  {
    CFDataRef v13 = _CFXPCCreateCFObjectFromXPCObject((const __CFArray *)a5);
    if (a6) {
      v14 = (__CFString *)CFRetain(a6);
    }
    else {
      v14 = 0LL;
    }
    v12->_configurationPath = v14;
    cloudSource = (SYDRemotePreferencesSource *)[objc_alloc((Class)getSYDRemotePreferencesSourceClass()) initWithApplicationID:@"NSUserDefaults" storeID:v13 shared:1 additionalSource:1 containerPath:a7];
    v12->cloudSource = cloudSource;
    if (v13)
    {
      CFRelease(v13);
      cloudSource = v12->cloudSource;
    }

    -[SYDRemotePreferencesSource registerForSynchronizedDefaults](cloudSource, "registerForSynchronizedDefaults");
    id v16 = -[CFPDCloudSource copyConfigurationFromPath:]((uint64_t)v12, a6);
    v17 = (const void *)[v16 copyPropertyListWithMutability:0 error:0];

    if (v17)
    {
      if (CFGetTypeID(v17) == 18)
      {
        SEL v18 = sel_registerName("setDefaultsConfiguration:");
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          -[SYDRemotePreferencesSource performSelector:withObject:]( v12->cloudSource,  "performSelector:withObject:",  v18,  v17);
        }
      }

      CFRelease(v17);
    }

    -[CFPDCloudSource registerForChangeNotifications](v12);
  }

  return v12;
}

- (uint64_t)enqueueNewKey:(uint64_t)a1 value:(const __CFArray *)a2 encoding:(xpc_object_t)xdict inBatch:(int)a4
{
  uint64_t v4 = a1;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return v4;
  }
  if (a4 == 1)
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    char v21 = 1;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __56__CFPDCloudSource_enqueueNewKey_value_encoding_inBatch___block_invoke;
    v17[3] = &unk_18999B478;
    v17[4] = a1;
    v17[5] = &v18;
    xpc_dictionary_apply(xdict, v17);
    uint64_t v4 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
    return v4;
  }

  CFDataRef v7 = _CFXPCCreateCFObjectFromXPCObject(a2);
  if (object_getClass(xdict) == (Class)MEMORY[0x1895F9240])
  {
    size_t length = xpc_data_get_length(xdict);
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(xdict);
    v11 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  bytes_ptr,  length,  (CFAllocatorRef)&__kCFAllocatorNull);
    uint64_t v8 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v11, 0LL, 0LL, 0LL);
    CFRelease(v11);
    if (!v7) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v8 = _CFXPCCreateCFObjectFromXPCObject((const __CFArray *)xdict);
    if (!v7) {
      goto LABEL_11;
    }
  }

  if (v8)
  {
    CFTypeID v12 = CFGetTypeID(v8);
    CFTypeID TypeID = CFNullGetTypeID();
    v14 = *(void **)(v4 + 152);
    if (v12 == TypeID) {
      [v14 setValue:0 forKey:v7];
    }
    else {
      [v14 setValue:v8 forKey:v7];
    }
    [*(id *)(v4 + 152) synchronizeForced:0];
    [(id)v4 updateShmemEntry];
    v15 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CFPDCloudSource enqueueNewKey:value:encoding:inBatch:].cold.1((uint64_t)a2, v4, v15);
    }
    uint64_t v4 = 1LL;
    goto LABEL_17;
  }

uint64_t __56__CFPDCloudSource_enqueueNewKey_value_encoding_inBatch___block_invoke( uint64_t a1,  char *string,  void *a3)
{
  xpc_object_t v5 = xpc_string_create(string);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (*(_BYTE *)(v6 + 24))
  {
    char v7 = -[CFPDCloudSource enqueueNewKey:value:encoding:inBatch:](*(void *)(a1 + 32), (int)v5, a3);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  }

  else
  {
    char v7 = 0;
  }

  *(_BYTE *)(v6 + 24) = v7;
  xpc_release(v5);
  return 1LL;
}

- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = [*(id *)(a1 + 152) copyDictionary];
  if (!v1) {
    return 0LL;
  }
  v2 = (const void *)v1;
  id v3 = +[CFPDDataBuffer newBufferFromPropertyList:](&OBJC_CLASS___CFPDDataBuffer, "newBufferFromPropertyList:", v1);
  CFRelease(v2);
  return v3;
}

- (void)synchronizeWithCloud:(id)a3 replyHandler:(id)a4
{
  v8[6] = *MEMORY[0x1895F89C0];
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  cloudSource = self->cloudSource;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __53__CFPDCloudSource_synchronizeWithCloud_replyHandler___block_invoke;
  v8[3] = &unk_18999B4A0;
  v8[4] = reply;
  v8[5] = a4;
  -[SYDRemotePreferencesSource synchronizationWithCompletionHandler:]( cloudSource,  "synchronizationWithCompletionHandler:",  v8);
}

void __53__CFPDCloudSource_synchronizeWithCloud_replyHandler___block_invoke(uint64_t a1)
{
}

- (id)copyPropertyListValidatingPlist:(BOOL)a3
{
  return -[CFPDCloudSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:]((uint64_t)self);
}

- (__CFString)debugDump
{
  return (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"\n*****************************************************\nCLOUD\nDomain: %@\nUser: %@\nContainer: %@\nplist data:%@\nshmem index:%d\ndirty:%d\n",  self->super.super._domain,  self->super.super._userName,  -[CFPDContainerSource container](self, "container"),  self->super.super._plist,  self->super.super._generationShmemIndex,  (*((unsigned __int8 *)&self->super.super + 142) >> 1) & 1);
}

- (__CFString)cloudConfigurationPath
{
  return self->_configurationPath;
}

- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10
{
  return 1;
}

- (id)_writeToDisk:(id *)result
{
  v2[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (a2)
    {
      return (id *)[result[19] synchronizeForced:0];
    }

    else
    {
      v2[0] = MEMORY[0x1895F87A8];
      v2[1] = 3221225472LL;
      v2[2] = __32__CFPDCloudSource__writeToDisk___block_invoke;
      v2[3] = &unk_18999B4C8;
      v2[4] = result;
      return (id *)[result lockedAsync:v2];
    }
  }

  return result;
}

uint64_t __32__CFPDCloudSource__writeToDisk___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) synchronizeForced:0];
}

- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  *a3 = 0;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CFPDCloudSource;
  -[CFPDSource processEndOfMessageIntendingToRemoveSource:replacingWithTombstone:]( &v4,  sel_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone_);
}

- (void)enqueueNewKey:(os_log_t)log value:encoding:inBatch:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a2 + 48);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_DEBUG,  "writing key %{public}@ in cloud domain %{public}@",  (uint8_t *)&v4,  0x16u);
}

@end
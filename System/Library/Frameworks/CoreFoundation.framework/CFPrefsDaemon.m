@interface CFPrefsDaemon
+ (BOOL)_getUncanonicalizedSourcePath:(__CFString *)a3 withDomain:(const __CFString *)a4 user:(int)a5 byHost:(const __CFString *)a6 containerPath:(int)a7 managed:(int)a8 managedUsesContainer:;
+ (CFStringRef)_copyUncanonicalizedSourcePathWithDomain:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 containerPath:(int)a6 managed:(int)a7 managedUsesContainer:;
- (BOOL)enterSandbox;
- (BOOL)isInTestMode;
- (CFPDContainerSource)_createSourceWithDomain:(const void *)a3 user:(uint64_t)a4 container:(uint64_t)a5 byHost:(uint64_t)a6 managed:(uint64_t)a7 shmemIndex:;
- (os_unfair_lock_s)initWithRole:(int)a3 testMode:;
- (uint64_t)_initializeShmemPage:(uint64_t)result;
- (uint64_t)_setSource:(int)a3 isDead:;
- (uint64_t)getShmemName:(uint64_t)result bufLen:(char *)__str;
- (uint64_t)listener;
- (uint64_t)role;
- (uint64_t)shmem;
- (uint64_t)updateEntireShmem;
- (uint64_t)updateShmemForDomain:(uint64_t)result;
- (uint64_t)updateShmemIndex:(uint64_t)result;
- (uint64_t)userID;
- (void)handleAgentCheckInMessage:(uint64_t)a1;
- (void)handleFlushManagedMessage:(uint64_t)a3 replyHandler:;
- (void)handleFlushSourceForDomainMessage:(uint64_t)a3 replyHandler:;
- (void)handleMessage:(_xpc_connection_s *)a3 fromPeer:(uint64_t)a4 replyHandler:;
- (void)handleMultiMessage:(uint64_t)a3 replyHandler:;
- (void)handleSimulateTimerSynchronizeForTesting;
- (void)handleSourceMessage:(uint64_t)a3 replyHandler:;
- (void)handleUserDeletedMessage:(uint64_t)a1 replyHandler:(void *)a2;
- (void)logDomainInconsistencyForProcess:(void *)a3 message:(void *)a4 source:;
- (void)shmem;
- (void)synchronousWithSourceCache:(uint64_t)a1;
- (void)withAllKnownManagedSources:(uint64_t)a1;
- (void)withSnapshotOfSourcesForDomainIdentifier:(uint64_t)a3 performBlock:;
- (void)withSourceForDomain:(const __CFString *)a3 inContainer:(const __CFString *)a4 user:(int)a5 byHost:(int)a6 managed:(int)a7 managedUsesContainer:(uint64_t)a8 cloudStoreEntitlement:(const void *)a9 cloudConfigurationPath:(uint64_t)a10 performWithSourceLock:(uint64_t)a11 afterReleasingSourceLock:;
@end

@implementation CFPrefsDaemon

- (void)synchronousWithSourceCache:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }

- (void)withSnapshotOfSourcesForDomainIdentifier:(uint64_t)a3 performBlock:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    uint64_t v20 = 0LL;
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    uint64_t v16 = 0LL;
    v7.i64[0] = MEMORY[0x1895F87A8];
    v7.i64[1] = 3221225472LL;
    v8 = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke;
    v9 = &unk_1899ED440;
    v10 = &v13;
    v11 = &v17;
    uint64_t v12 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke( &v7,  *(CFSetRef *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v18[3], v14[3]);
    v5 = (void *)v18[3];
    if (v5)
    {
      if (v14[3])
      {
        unint64_t v6 = 0LL;
        do
          CFRelease(*(CFTypeRef *)(v18[3] + 8 * v6++));
        while (v6 < v14[3]);
        v5 = (void *)v18[3];
      }

      free(v5);
    }

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

CFIndex __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke( int8x16_t *a1,  CFSetRef theSet)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  CFIndex result = CFSetGetCount(theSet);
  *(void *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = result;
  uint64_t v5 = *(void *)(*(void *)(a1[2].i64[0] + 8) + 24LL);
  if (v5)
  {
    *(void *)(*(void *)(a1[2].i64[1] + 8) + 24LL) = calloc(1uLL, 8 * v5);
    *(void *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = 0LL;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2;
    v6[3] = &unk_1899ED418;
    uint64_t v8 = a1[3].i64[0];
    int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
    return CFSetApply(theSet, (uint64_t)v6);
  }

  return result;
}

uint64_t __86__CFPrefsDaemon_SourceSupport__withSnapshotOfSourcesForDomainIdentifier_performBlock___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    if (!*(void *)(a1 + 48)
      || (uint64_t result = CFEqual((CFTypeRef)[a2 domain], *(CFTypeRef *)(a1 + 48)), (_DWORD)result))
    {
      uint64_t result = (uint64_t)CFRetain(a2);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
                + 8LL * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))++) = result;
    }
  }

  return result;
}

- (void)withAllKnownManagedSources:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    uint64_t v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    uint64_t v14 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000LL;
    uint64_t v10 = 0LL;
    v24 = &v23;
    uint64_t v25 = 0x22010000000LL;
    v26 = &unk_180EDD4B7;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke;
    v6[3] = &unk_1899ED490;
    v6[6] = &v11;
    v6[7] = &v7;
    v6[8] = &v15;
    v6[9] = &v23;
    void v6[4] = a1;
    v6[5] = &v19;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke(v6, *(CFSetRef *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(a2 + 16))( a2,  v20[3],  v12[3],  v16[3],  v8[3],  v24 + 4);
    if (v20[3])
    {
      if (v12[3])
      {
        unint64_t v4 = 0LL;
        do
          CFRelease(*(CFTypeRef *)(v20[3] + 8 * v4++));
        while (v4 < v12[3]);
      }

      if (v8[3])
      {
        unint64_t v5 = 0LL;
        do
          CFRelease(*(CFTypeRef *)(v16[3] + 8 * v5++));
        while (v5 < v8[3]);
      }

      free((void *)v20[3]);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }

void *__59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke( void *a1,  CFSetRef theSet)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  CFIndex Count = CFSetGetCount(theSet);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = malloc(8 * Count);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2;
    v7[3] = &unk_1899ED468;
    __int128 v8 = *(_OWORD *)(a1 + 5);
    uint64_t v9 = a1[7];
    CFIndex v10 = v5;
    CFSetApply(theSet, (uint64_t)v7);
    *(void *)(*(void *)(a1[8] + 8LL) + 24LL) = *(void *)(*(void *)(a1[5] + 8LL) + 24LL)
                                                 + 8 * v5
                                                 - 8LL * *(void *)(*(void *)(a1[7] + 8LL) + 24LL);
  }

  return memcpy((void *)(*(void *)(a1[9] + 8LL) + 32LL), (const void *)(a1[4] + 56LL), 0x200uLL);
}

uint64_t __59__CFPrefsDaemon_SourceSupport__withAllKnownManagedSources___block_invoke_2(void *a1, void *a2)
{
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 managed])
  {
    uint64_t result = (uint64_t)CFRetain(a2);
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    uint64_t v6 = *(void *)(a1[5] + 8LL);
    uint64_t v7 = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = v7 + 1;
    *(void *)(v5 + 8 * v7) = result;
  }

  else
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      uint64_t result = [a2 managed];
      if ((_DWORD)result)
      {
        ++*(void *)(*(void *)(a1[6] + 8LL) + 24LL);
        uint64_t result = (uint64_t)CFRetain(a2);
        *(void *)(*(void *)(*(void *)(a1[4] + 8LL) + 24LL)
                  + 8LL * (a1[7] - *(void *)(*(void *)(a1[6] + 8LL) + 24LL))) = result;
      }
    }
  }

  return result;
}

+ (BOOL)_getUncanonicalizedSourcePath:(__CFString *)a3 withDomain:(const __CFString *)a4 user:(int)a5 byHost:(const __CFString *)a6 containerPath:(int)a7 managed:(int)a8 managedUsesContainer:
{
  if (a7) {
    BOOL PathForManagedBundleID = _CFPrefsGetPathForManagedBundleID(a3, a4, a8, a2);
  }
  else {
    BOOL PathForManagedBundleID = _CFPrefsGetPathForTriplet(a3, a4, a5, a6, a2);
  }
  if (!strncmp("/private/var/empty", (const char *)a2, 0x12uLL) || !strncmp("/var/empty", (const char *)a2, 0xAuLL))
  {
    size_t v16 = strlen((const char *)a2);
    bzero(a2, v16);
    BOOL PathForManagedBundleID = 0LL;
  }

  if (!strncmp((const char *)a2, "/private", 8uLL))
  {
    size_t v17 = strlen((const char *)a2);
    memmove(a2, a2 + 8, v17 - 7);
  }

  return PathForManagedBundleID;
}

+ (CFStringRef)_copyUncanonicalizedSourcePathWithDomain:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 containerPath:(int)a6 managed:(int)a7 managedUsesContainer:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  bzero(cStr, 0x402uLL);
  if (!+[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]( (uint64_t)&OBJC_CLASS___CFPrefsDaemon,  (UInt8 *)cStr,  a2,  a3,  a4,  a5,  a6,  a7)) {
    return 0LL;
  }
  CFStringEncoding v13 = CFStringFileSystemEncoding();
  return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v13);
}

- (uint64_t)_setSource:(int)a3 isDead:
{
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_assert_owner((os_unfair_lock_t)(result + 48));
    uint64_t result = [a2 managed];
    if ((_DWORD)result)
    {
      uint64_t result = [a2 shmemIndex];
      uint64_t v6 = *(void *)(v5 + 56 + 8LL * (result >> 6));
      uint64_t v7 = v6 | (1LL << result);
      uint64_t v8 = v6 & ~(1LL << result);
      if (a3) {
        uint64_t v8 = v7;
      }
      *(void *)(v5 + 56 + 8LL * (result >> 6)) = v8;
    }
  }

  return result;
}

- (CFPDContainerSource)_createSourceWithDomain:(const void *)a3 user:(uint64_t)a4 container:(uint64_t)a5 byHost:(uint64_t)a6 managed:(uint64_t)a7 shmemIndex:
{
  if (result)
  {
    uint64_t v12 = (uint64_t)result;
    if (a4)
    {
      return -[CFPDContainerSource initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:]( objc_alloc(&OBJC_CLASS___CFPDContainerSource),  "initWithDomain:userName:container:byHost:managed:shmemIndex:daemon:",  cf1,  a3,  a4,  a5,  a6,  a7,  result);
    }

    else
    {
      if (CFEqual(cf1, @"kCFPreferencesAnyApplication"))
      {
        if (CFEqual(a3, @"kCFPreferencesAnyUser")) {
          int v13 = 0;
        }
        else {
          int v13 = (a5 | a6) ^ 1;
        }
      }

      else
      {
        int v13 = 0;
      }

      BOOL v14 = (_CFPrefsCurrentProcessIsCFPrefsD() & 1) == 0 && CFStringHasSuffix(cf1, @"_TestMirror") != 0;
      if ((v13 | v14) == 1) {
        return (CFPDContainerSource *)-[CFPDMirroredSource initWithDomain:userName:byHost:managed:mirroredKeys:shmemIndex:daemon:]( objc_alloc(&OBJC_CLASS___CFPDMirroredSource),  "initWithDomain:userName:byHost:managed:mirroredKeys:shmemIndex:daemon:",  cf1,  a3,  a5,  a6,  &off_189B40348,  a7,  v12);
      }
      else {
        return (CFPDContainerSource *)-[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:]( objc_alloc(&OBJC_CLASS___CFPDSource),  "initWithDomain:userName:byHost:managed:shmemIndex:daemon:",  cf1,  a3,  a5,  a6,  a7,  v12);
      }
    }
  }

  return result;
}

- (void)withSourceForDomain:(const __CFString *)a3 inContainer:(const __CFString *)a4 user:(int)a5 byHost:(int)a6 managed:(int)a7 managedUsesContainer:(uint64_t)a8 cloudStoreEntitlement:(const void *)a9 cloudConfigurationPath:(uint64_t)a10 performWithSourceLock:(uint64_t)a11 afterReleasingSourceLock:
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a7 && (a6 & 1) == 0) {
      -[CFPrefsDaemon withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:].cold.1();
    }
    uint64_t v18 = 0LL;
    if (a2 && a4)
    {
      uint64_t v23 = a8;
      if (-[CFPrefsDaemon shmem](a1))
      {
        CFStringRef v19 = +[CFPrefsDaemon _copyUncanonicalizedSourcePathWithDomain:user:byHost:containerPath:managed:managedUsesContainer:]( (uint64_t)&OBJC_CLASS___CFPrefsDaemon,  a2,  a4,  a5,  a3,  a6,  a7);
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___CFPDSourceLookUpKey);
        if (a9) {
          uint64_t v20 = (__CFString *)CFRetain(a9);
        }
        else {
          uint64_t v20 = 0LL;
        }
        v18->cloudPath = v20;
        if (v19)
        {
          v18->uncanonicalizedPath = (__CFString *)CFRetain(v19);
          CFRelease(v19);
        }

        else
        {
          v18->uncanonicalizedPath = 0LL;
        }
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      a8 = v23;
    }

    uint64_t v29 = 0LL;
    v30 = &v29;
    uint64_t v31 = 0x3052000000LL;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    uint64_t v34 = 0LL;
    uint64_t v21 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke;
    v25[3] = &unk_1899ED4B8;
    v25[8] = a2;
    v25[9] = a3;
    char v26 = a5;
    char v27 = a6;
    v25[10] = a4;
    v25[11] = a9;
    v25[4] = v18;
    v25[5] = a8;
    v25[6] = a1;
    v25[7] = &v29;
    char v28 = a7;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke( (uint64_t)v25,  *(CFSetRef *)(a1 + 32),  *(__CFBag **)(a1 + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    uint64_t v22 = (void *)v30[5];
    if (v22)
    {
      v24[0] = v21;
      v24[1] = 3221225472LL;
      v24[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2;
      v24[3] = &unk_1899ED508;
      v24[5] = a10;
      v24[6] = &v29;
      v24[4] = a1;
      [v22 lockedSync:v24];
    }

    else
    {
      (*(void (**)(uint64_t, void))(a10 + 16))(a10, 0LL);
    }

    if (a11) {
      (*(void (**)(uint64_t, uint64_t))(a11 + 16))(a11, v30[5]);
    }

    _Block_object_dispose(&v29, 8);
  }

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke( uint64_t a1,  CFSetRef theSet,  __CFBag *a3)
{
  unint64_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = CFSetGetValue(theSet, v4);
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    if (v7)
    {
      [v7 setUncanonicalizedPathCached:1];
      CFBagAddValue(a3, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
      id v8 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    }

    else
    {
      uint64_t v9 = *(const __CFString **)(a1 + 64);
      uint64_t v10 = *(void *)(a1 + 72);
      int v11 = *(unsigned __int8 *)(a1 + 96);
      int v12 = *(unsigned __int8 *)(a1 + 97);
      int v13 = *(__CFString **)(a1 + 80);
      uint64_t v14 = *(void *)(a1 + 88);
      if (v9)
      {
        CFHashCode v15 = 7 * (CFHash(*(CFTypeRef *)(a1 + 64)) % 0x249);
        CFIndex v16 = CFStringGetLength(v9) % 7;
      }

      else
      {
        LODWORD(v15) = 0;
        LODWORD(v16) = 0;
      }

      else {
        __int16 v18 = v16 + v15;
      }
      if (v10) {
        __int16 v19 = 6;
      }
      else {
        __int16 v19 = 5;
      }
      if (!(v10 | v14))
      {
        __int16 v19 = @"kCFPreferencesAnyUser" == v13 ? 2 : v11 == 0;
        __int16 v20 = @"kCFPreferencesAnyUser" == v13 ? 4 : 3;
        if (v12) {
          __int16 v19 = v20;
        }
      }

      __int16 v21 = v19 + v18;
      if (*(void *)(a1 + 88)) {
        uint64_t v22 = -[CFPDCloudSource initWithDomain:userName:storeName:configurationPath:containerPath:shmemIndex:daemon:]( objc_alloc(&OBJC_CLASS___CFPDCloudSource),  "initWithDomain:userName:storeName:configurationPath:containerPath:shmemIndex:daemon:",  *(void *)(a1 + 64),  *(void *)(a1 + 80),  *(void *)(a1 + 40),  *(void *)(a1 + 88),  *(void *)(a1 + 72),  v21,  *(void *)(a1 + 48));
      }
      else {
        uint64_t v22 = (CFPDCloudSource *)-[CFPrefsDaemon _createSourceWithDomain:user:container:byHost:managed:shmemIndex:]( *(CFPDContainerSource **)(a1 + 48),  *(const __CFString **)(a1 + 64),  *(const void **)(a1 + 80),  *(void *)(a1 + 72),  *(unsigned __int8 *)(a1 + 96),  *(unsigned __int8 *)(a1 + 97),  v21);
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v22;
      uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      if (v23)
      {
        [v23 setUncanonicalizedPathCached:1];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setManagedPreferencesUseContainer:*(unsigned __int8 *)(a1 + 98)];
        CFSetAddValue(theSet, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
        CFBagAddValue(a3, *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
        -[CFPrefsDaemon _setSource:isDead:]( *(void *)(a1 + 48),  *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL),  0);
        id v24 = -[CFPDObserverOnlyTombstone initMatchingSource:]( objc_alloc(&OBJC_CLASS___CFPDObserverOnlyTombstone),  "initMatchingSource:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
        Value = (void *)CFSetGetValue(theSet, v24);

        if (Value)
        {
          [Value transferObservingConnectionsToSource:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          CFSetRemoveValue(theSet, Value);
        }
      }
    }
  }

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_2( void *a1)
{
  v4[6] = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(a1[5] + 16LL))();
  uint64_t v2 = a1[4];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3;
  v4[3] = &unk_1899ED4E0;
  uint64_t v3 = a1[6];
  v4[4] = v2;
  v4[5] = v3;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
  __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3( (uint64_t)v4,  *(__CFSet **)(v2 + 32),  *(void *)(v2 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
}

void __197__CFPrefsDaemon_SourceSupport__withSourceForDomain_inContainer_user_byHost_managed_managedUsesContainer_cloudStoreEntitlement_cloudConfigurationPath_performWithSourceLock_afterReleasingSourceLock___block_invoke_3( uint64_t a1,  __CFSet *a2,  uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = CFBasicHashRemoveValue(a3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  BOOL v6 = v5 == 1;
  if (v5 == 1) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUncanonicalizedPathCached:0];
  }
  BOOL v8 = v6;
  value = 0LL;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processEndOfMessageIntendingToRemoveSource:&v8 replacingWithTombstone:&value];
  if (v8)
  {
    -[CFPrefsDaemon _setSource:isDead:]( *(void *)(a1 + 32),  *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  1);
    CFSetRemoveValue(a2, *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    if (value) {
      CFSetAddValue(a2, value);
    }
  }

- (void)logDomainInconsistencyForProcess:(void *)a3 message:(void *)a4 source:
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    id v8 = a4;
    xpc_retain(a3);
    qos_class_t v9 = qos_class_main();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(v9, 2uLL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke;
    block[3] = &unk_1899EDCA8;
    int v12 = a2;
    block[4] = a3;
    block[5] = a1;
    block[6] = a4;
    dispatch_async(global_queue, block);
  }

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
  uint64_t v3 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1(a1, v3);
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_48;
  v8[3] = &unk_1899EDC80;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  int v9 = int64;
  int v10 = v6;
  uint64_t v7 = *(void *)(a1 + 32);
  v8[4] = v5;
  v8[5] = v7;
  -[CFPrefsDaemon synchronousWithSourceCache:](v4, (uint64_t)v8);
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_48( uint64_t a1,  CFSetRef theSet)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int context = *(_DWORD *)(a1 + 48);
  uint64_t v22 = &v23;
  id v23 = 0LL;
  CFSetApplyFunction(theSet, (CFSetApplierFunction)indexSearchCallback, &context);
  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2;
  v12[3] = &unk_1899ED998;
  v12[4] = v23;
  v12[5] = &v17;
  [v23 lockedSync:v12];
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = v3;
  v11[1] = 3221225472LL;
  v11[2] = __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3;
  v11[3] = &unk_1899ED998;
  v11[4] = v4;
  v11[5] = &v13;
  [v4 lockedSync:v11];
  uint64_t v5 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v8 = *(_DWORD *)(a1 + 52);
    uint64_t v9 = v18[3];
    uint64_t v10 = v14[3];
    *(_DWORD *)buf = 67240706;
    int v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    uint64_t v29 = v10;
    _os_log_fault_impl( &dword_180A4C000,  v5,  OS_LOG_TYPE_FAULT,  "CFPreferences detected an inconsistency. An attempt by process %{public}d to access preferences in \n %{public}@\n actually resolved to \n %{public}@\n Typically this indicates that the process's sandbox profile changed in a way that added or removed a shared-prefe rence-* rule or changed its container path. To avoid overwriting data incorrectly, cfprefsd is disconnecting this client from this source, its preferences will not be saved to disk",  buf,  0x1Cu);
  }

  int v6 = (const void *)v18[3];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)v14[3];
  if (v7) {
    CFRelease(v7);
  }

  xpc_release(*(xpc_object_t *)(a1 + 40));
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) debugDump];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) debugDump];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (void)handleMessage:(_xpc_connection_s *)a3 fromPeer:(uint64_t)a4 replyHandler:
{
  if (a1)
  {
    Class Class = object_getClass(a2);
    if (Class != (Class)MEMORY[0x1895F9268])
    {
      if (Class != (Class)MEMORY[0x1895F9250]) {
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:].cold.1();
      }
      if (byte_18C536DA0 && !xpc_dictionary_get_BOOL(a2, "PreviousMessageInjectedFailure"))
      {
        xpc_connection_cancel(a3);
      }

      else
      {
        xpc_dictionary_set_value(a2, "connection", a3);
        int64_t int64 = xpc_dictionary_get_int64(a2, "CFPreferencesOperation");
        switch(int64)
        {
          case 1LL:
          case 7LL:
          case 8LL:
          case 9LL:
            -[CFPrefsDaemon handleSourceMessage:replyHandler:](a1, a2, a4);
            break;
          case 2LL:
            -[CFPrefsDaemon handleAgentCheckInMessage:](a1);
            goto LABEL_13;
          case 3LL:
            -[CFPrefsDaemon handleFlushManagedMessage:replyHandler:](a1, a2, a4);
            break;
          case 4LL:
            -[CFPrefsDaemon handleFlushSourceForDomainMessage:replyHandler:](a1, a2, a4);
            break;
          case 5LL:
            -[CFPrefsDaemon handleMultiMessage:replyHandler:](a1, a2, a4);
            break;
          case 6LL:
            log_client_activity(a2, (uint64_t)"reported a user was deleted", 0LL);
            break;
          default:
            if (int64 == 999)
            {
              uint64_t v10 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
              -[_CFPrefsSynchronizer synchronize](v10);
LABEL_13:
              (*(void (**)(uint64_t, void))(a4 + 16))(a4, 0LL);
            }

            else
            {
              xpc_object_t ErrorReply = createErrorReply("Unsupported CFPreferences Daemon Operation", a2);
              (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, ErrorReply);
              xpc_release(ErrorReply);
            }

            break;
        }
      }
    }
  }

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  _CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded(a2);
  xpc_retain(a2);
  __int16 v61 = 0;
  CFStringRef v6 = _CFPrefsCopyFixedUpUserForMessage(a2, (BOOL *)&v61 + 1, &v61);
  v60 = 0LL;
  BOOL v46 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsByHost");
  FixedUpDomainForMessage = (__CFString *)_CFPrefsGetFixedUpDomainForMessage(a2, v6, v46, &v60);
  if (FixedUpDomainForMessage)
  {
    BOOL v47 = xpc_dictionary_get_BOOL(a2, "CFPreferencesIsManaged");
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    if (!remote_connection)
    {
      value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
      remote_connection = value;
      if (!value
        || (value = (_xpc_connection_s *)object_getClass(value), value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
      {
        -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.1((uint64_t)value, v10, v11);
      }
    }

    size_t length = 0LL;
    p_size_t length = &length;
    uint64_t v56 = 0x2020000000LL;
    LOBYTE(v57) = 1;
    *(void *)&__int128 v62 = MEMORY[0x1895F87A8];
    *((void *)&v62 + 1) = 3221225472LL;
    *(void *)&__int128 v63 = ___CFPrefsMessageSenderIsSandboxed_block_invoke_0;
    *((void *)&v63 + 1) = &unk_1899EDB00;
    v64 = (_xpc_connection_s *)a2;
    v65 = &length;
    withClientContext(remote_connection, (uint64_t)&v62);
    int v12 = *((unsigned __int8 *)p_length + 24);
    _Block_object_dispose(&length, 8);
    BOOL v13 = xpc_dictionary_get_BOOL(a2, "CFPreferencesCurrentApplicationDomain");
    if (v47)
    {
      if (handleSourceMessage_replyHandler__onceToken != -1) {
        dispatch_once(&handleSourceMessage_replyHandler__onceToken, &__block_literal_global_58);
      }
      if (handleSourceMessage_replyHandler__enableContainerizedManagedPrefs == 1)
      {
        uint64_t v14 = xpc_dictionary_get_remote_connection(a2);
        if (!v14)
        {
          Class Class = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
          uint64_t v14 = Class;
          if (!Class
            || (Class Class = (_xpc_connection_s *)object_getClass(Class), Class != (_xpc_connection_s *)MEMORY[0x1895F9238]))
          {
            -[CFPrefsDaemon handleSourceMessage:replyHandler:].cold.2((uint64_t)Class, v16, v17);
          }
        }

        size_t length = 0LL;
        p_size_t length = &length;
        uint64_t v56 = 0x2020000000LL;
        LOBYTE(v57) = 0;
        *(void *)&__int128 v62 = MEMORY[0x1895F87A8];
        *((void *)&v62 + 1) = 3221225472LL;
        *(void *)&__int128 v63 = ___CFPrefsIsConnectionPlatformBinary_block_invoke;
        *((void *)&v63 + 1) = &unk_1899EE010;
        v64 = v14;
        v65 = &length;
        withClientContext(v14, (uint64_t)&v62);
        BOOL v45 = *((_BYTE *)p_length + 24) == 0;
        _Block_object_dispose(&length, 8);
      }

      else
      {
        BOOL v45 = 0;
      }

      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0LL);
      int v48 = 0;
      theString = 0LL;
      if (!v12) {
        goto LABEL_33;
      }
    }

    else
    {
      xpc_dictionary_set_value(a2, "CFPreferencesHasFixedUpContainer", 0LL);
      theString = _CFPrefsCopyFixedUpContainerForMessage( a2,  (uint64_t)FixedUpDomainForMessage,  (uint64_t)v60,  HIBYTE(v61),  v12 != 0);
      if (theString)
      {
        xpc_dictionary_set_BOOL(a2, "CFPreferencesHasFixedUpContainer", 1);
        BOOL v45 = 0;
        int v48 = 1;
        if (!v12) {
          goto LABEL_33;
        }
      }

      else
      {
        int v48 = 0;
        theString = 0LL;
        BOOL v45 = 0;
        if (!v12) {
          goto LABEL_33;
        }
      }
    }

    size_t length = 0LL;
    data = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", &length);
    if (data && length == 32)
    {
      __int128 v20 = data[1];
      __int128 v62 = *data;
      __int128 v63 = v20;
    }

    else
    {
      if (!xpc_dictionary_get_remote_connection(a2))
      {
        __int16 v21 = xpc_dictionary_get_value(a2, "connection");
      }

      xpc_connection_get_audit_token();
    }

    if (sandbox_check_by_audit_token())
    {
      BOOL v24 = 0;
      goto LABEL_34;
    }

- (void)handleFlushManagedMessage:(uint64_t)a3 replyHandler:
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    log_client_activity(a2, (uint64_t)"requested flush of managed sources", 0LL);
    _CFPrefsResetManagedPreferencesStateCache();
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (!reply) {
      xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke;
    v7[3] = &unk_1899EDD90;
    v7[5] = reply;
    v7[6] = a3;
    void v7[4] = a1;
    -[CFPrefsDaemon withAllKnownManagedSources:](a1, (uint64_t)v7);
  }

- (void)handleAgentCheckInMessage:(uint64_t)a1
{
  if (a1)
  {
    v1 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsDaemon handleAgentCheckInMessage:].cold.1(v1);
    }
  }

- (void)handleFlushSourceForDomainMessage:(uint64_t)a3 replyHandler:
{
  if (a1)
  {
    string = xpc_dictionary_get_string(xdict, "CFPreferencesDomain");
    if (string)
    {
      uint64_t v7 = string;
      log_client_activity(xdict, (uint64_t)"requested flush of sources", (uint64_t)string);
      CFStringRef v8 = CFStringCreateWithCStringNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v7,  0x8000100u,  (CFAllocatorRef)&__kCFAllocatorNull);
      if (v8)
      {
        uint64_t v9 = v8;
        -[CFPrefsDaemon withSnapshotOfSourcesForDomainIdentifier:performBlock:]( a1,  (uint64_t)v8,  (uint64_t)&__block_literal_global_84);
        -[CFPrefsDaemon updateShmemForDomain:](a1, v9);
        CFRelease(v9);
      }
    }

    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    if (!reply) {
      xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
    }
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
    xpc_release(reply);
  }

- (void)handleMultiMessage:(uint64_t)a3 replyHandler:
{
  v41[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  int v6 = a1;
  if (!xpc_dictionary_get_remote_connection(xdict))
  {
    value = xpc_dictionary_get_value(xdict, "connection");
  }

  xpc_object_t v10 = xpc_dictionary_get_value(xdict, "CFPreferencesMessages");
  if (!v10 || (uint64_t v11 = v10, object_getClass(v10) != (Class)MEMORY[0x1895F9220]))
  {
    int v12 = "There must be an array of contained messages present in multimessages";
LABEL_8:
    xpc_object_t ErrorReply = createErrorReply(v12, xdict);
    (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, ErrorReply);
    xpc_release(ErrorReply);
    return;
  }

  if (!xpc_array_apply(v11, &__block_literal_global_87_0))
  {
    int v12 = "Contained messages must be dictionaries or nulls in multimessages";
    goto LABEL_8;
  }

  size_t count = xpc_array_get_count(v11);
  size_t v16 = count;
  if (count >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  count);
    CFStringRef v30 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v29,  0LL);
    CFRelease(v29);
    objc_exception_throw(v30);
    v32 = v31;
    free(v3);
    _Unwind_Resume(v32);
  }

  if (count <= 1) {
    size_t count = 1LL;
  }
  unint64_t v17 = MEMORY[0x1895F8858](count, v15);
  uint64_t v19 = (xpc_object_t *)((char *)&v33 - v18);
  if (v16 >= 0x101)
  {
    __int128 v20 = (xpc_object_t *)_CFCreateArrayStorage(v17, 0, v41);
    uint64_t v33 = (uint64_t)&v33;
    uint64_t v19 = v20;
    goto LABEL_18;
  }

  __int128 v20 = 0LL;
  if (v16)
  {
    uint64_t v33 = (uint64_t)&v33;
LABEL_18:
    size_t v21 = 0LL;
    uint64_t v34 = v20;
    do
    {
      v19[v21] = xpc_array_get_value(v11, v21);
      ++v21;
    }

    while (v16 != v21);
    uint64_t v22 = 0LL;
    uint64_t v23 = (objc_class *)MEMORY[0x1895F9250];
    do
    {
      xpc_object_t v24 = v19[v22];
      v19[v22] = 0LL;
      if (object_getClass(v24) == v23)
      {
        uint64_t v35 = MEMORY[0x1895F87A8];
        uint64_t v36 = 3221225472LL;
        v37 = __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2;
        v38 = &__block_descriptor_44_e33_v16__0__NSObject_OS_xpc_object__8l;
        char v39 = v19;
        int v40 = v22;
        -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v6, v24);
      }

      if (!v19[v22]) {
        v19[v22] = xpc_null_create();
      }
      ++v22;
    }

    while (v16 != v22);
    int v25 = 1;
    __int128 v20 = v34;
    goto LABEL_27;
  }

  int v25 = 0;
LABEL_27:
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  xpc_object_t v27 = xpc_array_create(v19, v16);
  xpc_dictionary_set_value(reply, "CFPreferencesMessages", v27);
  xpc_release(v27);
  if (v25)
  {
    __int16 v28 = (objc_class *)MEMORY[0x1895F92A8];
    do
    {
      if (object_getClass(*v19) != v28) {
        xpc_release(*v19);
      }
      ++v19;
      --v16;
    }

    while (v16);
  }

  (*(void (**)(uint64_t, xpc_object_t))(a3 + 16))(a3, reply);
  xpc_release(reply);
  free(v20);
}

- (void)handleUserDeletedMessage:(uint64_t)a1 replyHandler:(void *)a2
{
  if (a1) {
    log_client_activity(a2, (uint64_t)"reported a user was deleted", 0LL);
  }
}

- (void)handleSimulateTimerSynchronizeForTesting
{
  if (a1)
  {
    v1 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
    -[_CFPrefsSynchronizer synchronize](v1);
  }

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke()
{
  uint64_t result = access("/containerized_managed_preferences", 0);
  if (!(_DWORD)result) {
    handleSourceMessage_replyHandler__enableContainerizedManagedPrefs = 1;
  }
  return result;
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_67(uint64_t a1, int a2, id a3)
{
  if (object_getClass(a3) != (Class)MEMORY[0x1895F92E8] || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = *(void *)(a1 + 32);
  return result;
}

uint64_t __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_2(uint64_t a1, int a2, id a3)
{
  if (object_getClass(a3) != (Class)MEMORY[0x1895F92E8] || !xpc_equal(*(xpc_object_t *)(a1 + 32), a3)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = *(void *)(a1 + 32);
  return result;
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "FullCloudSync"))
  {
    if (a2)
    {
      xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesShmemIndex");
      if (!value
        || (uint64_t v5 = value, object_getClass(value) != (Class)MEMORY[0x1895F9280])
        || (int v10 = xpc_int64_get_value(v5), v10 == -1)
        || v10 == [a2 shmemIndex])
      {
        xpc_object_t ErrorReply = (xpc_object_t)[a2 acceptMessage:*(void *)(a1 + 32)];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
LABEL_11:
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        xpc_release(ErrorReply);
        return;
      }

      int v12 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      size_t length = 0LL;
      data = (__int128 *)xpc_dictionary_get_data(v12, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        __int128 v14 = data[1];
        __int128 v19 = *data;
        __int128 v20 = v14;
      }

      else
      {
        if (!xpc_dictionary_get_remote_connection(v12))
        {
          Class Class = xpc_dictionary_get_value(v12, "connection");
        }

        xpc_connection_get_audit_token();
      }

      -[CFPrefsDaemon logDomainInconsistencyForProcess:message:source:](v11, SDWORD1(v20), *(void **)(a1 + 32), a2);
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v8 = "Lookup inconsistency";
    }

    else
    {
      uint64_t v8 = "Domain or user not found";
      uint64_t v9 = *(void **)(a1 + 32);
    }

    xpc_object_t ErrorReply = createErrorReply(v8, v9);
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a2 synchronizeWithCloud:*(void *)(a1 + 32) replyHandler:*(void *)(a1 + 48)];
  }

  else
  {
    xpc_object_t v7 = createErrorReply("Domain not cloud-backed", *(xpc_object_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    xpc_release(v7);
  }

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    [a2 cleanUpAfterAcceptingMessage:*(void *)(a1 + 32)];
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke( uint64_t a1,  void **a2,  uint64_t a3,  void **a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v10 = a3;
    do
    {
      int v12 = *a2++;
      [v12 respondToFileWrittenToBehindOurBack];
      --v10;
    }

    while (v10);
  }

  uint64_t v13 = 0LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  __int128 v19 = __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2;
  __int128 v20 = &unk_1899EDD68;
  uint64_t v21 = *(void *)(a1 + 32);
  do
  {
    for (unint64_t i = *(void *)(a6 + 8 * v13); i; i &= ~(1LL << v15))
    {
      __int16 v15 = __clz(__rbit64(i));
      v19((uint64_t)&v17, (__int16)((((_WORD)v13 << 6) | 1) + v15 - 1));
    }

    ++v13;
  }

  while (v13 != 64);
  for (; a5; --a5)
  {
    uint64_t v16 = *a4++;
    objc_msgSend(v16, "notifyObservers", v17, v18);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __56__CFPrefsDaemon_handleFlushManagedMessage_replyHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    uint64_t v4 = (unsigned int *)(result + 4LL * a2);
    do
      unsigned int v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    if (v5 == -1) {
      atomic_store(1u, v4);
    }
  }

  return result;
}

- (uint64_t)updateShmemIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    uint64_t v3 = (unsigned int *)(result + 4LL * a2);
    do
      unsigned int v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    if (v4 == -1) {
      atomic_store(1u, v3);
    }
  }

  return result;
}

uint64_t __64__CFPrefsDaemon_handleFlushSourceForDomainMessage_replyHandler___block_invoke( uint64_t a1,  void **a2,  uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    do
    {
      unsigned int v5 = *a2++;
      uint64_t result = [v5 respondToFileWrittenToBehindOurBack];
      --v3;
    }

    while (v3);
  }

  return result;
}

- (uint64_t)updateShmemForDomain:(uint64_t)result
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    uint64_t v3 = result;
    if (a2)
    {
      CFHashCode v4 = 7 * (CFHash(a2) % 0x249);
      uint64_t result = CFStringGetLength(a2);
      uint64_t v5 = result % 7;
    }

    else
    {
      CFHashCode v4 = 0LL;
      uint64_t v5 = 0LL;
    }

    unint64_t v6 = v5 + v4;
    if ((unsigned __int16)v6 <= 0xFFF8u)
    {
      unint64_t v8 = v6 + 7;
      unint64_t v6 = (unsigned __int16)v6;
      do
      {
        uint64_t v9 = (unsigned int *)(v3 + 4 * v6);
        do
          unsigned int v10 = __ldaxr(v9);
        while (__stlxr(v10 + 1, v9));
        if (v10 == -1) {
          atomic_store(1u, v9);
        }
        ++v6;
      }

      while (v6 < v8);
    }
  }

  return result;
}

BOOL __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke(int a1, int a2, id a3)
{
  Class Class = object_getClass(a3);
  return Class == (Class)MEMORY[0x1895F9250] || Class == (Class)MEMORY[0x1895F92A8];
}

xpc_object_t __49__CFPrefsDaemon_handleMultiMessage_replyHandler___block_invoke_2( xpc_object_t result,  xpc_object_t object)
{
  if (object)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t result = xpc_retain(object);
    *(void *)(*(void *)(v2 + 32) + 8LL * *(int *)(v2 + 40)) = result;
  }

  return result;
}

- (os_unfair_lock_s)initWithRole:(int)a3 testMode:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_CLASS___CFPrefsDaemon;
  CFHashCode v4 = (os_unfair_lock_s *)objc_msgSendSuper2(&v11, sel_init);
  uint64_t v5 = v4;
  if (v4)
  {
    LOBYTE(v4[142]._os_unfair_lock_opaque) = a3;
    unint64_t v6 = "com.apple.cfprefsd.daemon";
    if (a3)
    {
      os_transaction_create();
      if (LOBYTE(v5[142]._os_unfair_lock_opaque)) {
        unint64_t v6 = "com.apple.cfprefsd.daemon.test";
      }
    }

    v5[6]._os_unfair_lock_opaque = 1;
    *(void *)&v5[4]._os_unfair_lock_opaque = v6;
    if (isCFPrefsD == 1) {
      mach_service = xpc_connection_create_mach_service(v6, 0LL, 1uLL);
    }
    else {
      mach_service = xpc_connection_create(0LL, 0LL);
    }
    unint64_t v8 = mach_service;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke;
    v10[3] = &unk_1899ED920;
    v10[4] = v5;
    xpc_connection_set_event_handler(mach_service, v10);
    v5[12]._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(v5 + 12);
    *(void *)&v5[8]._os_unfair_lock_opaque = CFSetCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeSetCallBacks);
    *(void *)&v5[10]._os_unfair_lock_opaque = CFBagCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeBagCallBacks);
    os_unfair_lock_unlock(v5 + 12);
    *(void *)&v5[2]._os_unfair_lock_opaque = v8;
    xpc_connection_activate(v8);
  }

  return v5;
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (object_getClass(a2) == (Class)MEMORY[0x1895F9238])
  {
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2;
    handler[3] = &unk_1899EDE58;
    uint64_t v4 = *(void *)(a1 + 32);
    handler[4] = a2;
    handler[5] = v4;
    xpc_connection_set_event_handler(a2, handler);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    *(_OWORD *)__str = 0u;
    __int128 v11 = 0u;
    pid_t pid = xpc_connection_get_pid(a2);
    if ((snprintf(__str, 0x80uLL, "client-%d", pid) - 1) > 0x7E)
    {
      xpc_object_t v7 = 0LL;
    }

    else
    {
      unint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      xpc_object_t v7 = dispatch_queue_create(__str, v6);
    }

    xpc_connection_set_target_queue(a2, v7);

    unint64_t v8 = objc_alloc_init(&OBJC_CLASS____CFPrefsClientContext);
    v8->_lock._os_unfair_lock_opaque = 0;
    os_unfair_lock_lock(&v8->_lock);
    atomic_store(*(void *)(a1 + 32), (unint64_t *)&v8->_cfprefsd);
    *(_WORD *)&v8->_sandboxed = -1;
    v8->_valid = 1;
    os_unfair_lock_unlock(&v8->_lock);
    xpc_connection_set_context(a2, v8);
    xpc_connection_set_finalizer_f(a2, (xpc_finalizer_t)client_context_finalizer);
    xpc_connection_activate(a2);
  }

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2(uint64_t a1, id a2)
{
  v19[5] = *MEMORY[0x1895F89C0];
  if (object_getClass(a2) == (Class)MEMORY[0x1895F9250])
  {
    unint64_t v8 = *(_xpc_connection_s **)(a1 + 32);
    if (terminating)
    {
      xpc_connection_cancel(v8);
    }

    else
    {
      int context = (unint64_t *)xpc_connection_get_context(v8);
      if (!context) {
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2_cold_1();
      }
      uint64_t v10 = atomic_load(context + 1);
      if (!v10) {
        __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2_cold_2();
      }
      __int128 v11 = *(_xpc_connection_s **)(a1 + 32);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3;
      v19[3] = &unk_1899ED920;
      v19[4] = v11;
      -[CFPrefsDaemon handleMessage:fromPeer:replyHandler:](v10, a2, v11, (uint64_t)v19);
    }
  }

  else if (a2 == (id)MEMORY[0x1895F91A0])
  {
    uint64_t v15 = 0LL;
    __int128 v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0LL;
    uint64_t v4 = MEMORY[0x1895F87A8];
    uint64_t v5 = *(_xpc_connection_s **)(a1 + 32);
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4;
    v14[3] = &unk_1899EDA68;
    v14[4] = &v15;
    withClientContext(v5, (uint64_t)v14);
    unint64_t v6 = (const __CFSet *)v16[3];
    if (v6)
    {
      if (CFSetGetCount(v6) >= 1)
      {
        xpc_object_t v7 = (void *)v16[3];
        v12[0] = v4;
        v12[1] = 3221225472LL;
        v12[2] = __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5;
        v12[3] = &unk_1899ED858;
        __int128 v13 = *(_OWORD *)(a1 + 32);
        CFSetApply(v7, (uint64_t)v12);
      }

      CFRelease((CFTypeRef)v16[3]);
    }

    _Block_object_dispose(&v15, 8);
  }

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2) {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), a2);
  }
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 57) = 0;
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0LL;
  return result;
}

uint64_t __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_5(uint64_t a1, void *a2)
{
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return [a2 observingConnectionWasInvalidated:*(void *)(a1 + 32)];
  }
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0) {
    return [a2 removeObservingConnection:*(void *)(a1 + 32) daemon:*(void *)(a1 + 40)];
  }
  return result;
}

- (uint64_t)role
{
  if (result) {
    return *(unsigned int *)(result + 24);
  }
  return result;
}

- (BOOL)isInTestMode
{
  if (result) {
    return *(_BYTE *)(result + 568) != 0;
  }
  return result;
}

- (uint64_t)_initializeShmemPage:(uint64_t)result
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  bzero(__str, 0x400uLL);
  -[CFPrefsDaemon getShmemName:bufLen:](v3, __str);
  if ((isCFPrefsD & 1) != 0)
  {
    uint64_t result = shm_open(__str, 514, 420LL);
  }

  else
  {
    getpid();
    uint64_t result = sandbox_check();
    if ((_DWORD)result)
    {
LABEL_9:
      uint64_t v5 = *a2;
LABEL_10:
      if (v5) {
        return result;
      }
      goto LABEL_11;
    }

    uint64_t result = shm_open(__str, 2, 420LL);
  }

  if ((result & 0x80000000) != 0) {
    goto LABEL_9;
  }
  int v4 = result;
  ftruncate(result, 0x4000LL);
  *a2 = (uint64_t)mmap(0LL, 0x4000uLL, 3, 1, v4, 0LL);
  uint64_t result = close(v4);
  uint64_t v5 = *a2;
  if (*a2 != -1) {
    goto LABEL_10;
  }
  *a2 = 0LL;
LABEL_11:
  if (isCFPrefsD == 1)
  {
    unint64_t v6 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CFPrefsDaemon _initializeShmemPage:].cold.1((uint64_t)__str, v6);
    }
  }

  uint64_t result = (uint64_t)calloc(1uLL, 0x4000uLL);
  *a2 = result;
  return result;
}

- (uint64_t)getShmemName:(uint64_t)result bufLen:(char *)__str
{
  if (result)
  {
    int v3 = *(_DWORD *)(result + 24);
    if (v3 == 2)
    {
      cfprefsdEuid();
    }

    else if (v3 == 1)
    {
      return snprintf(__str, 0x1FuLL, "%scfprefs.daemonv%d");
    }

    return snprintf(__str, 0x1FuLL, "%scfprefs.%dv%d");
  }

  return result;
}

- (uint64_t)shmem
{
  v2[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (isCFPrefsD == 1)
    {
      v2[0] = MEMORY[0x1895F87A8];
      v2[1] = 3221225472LL;
      v2[2] = __22__CFPrefsDaemon_shmem__block_invoke;
      v2[3] = &unk_18999B4C8;
      v2[4] = result;
      if (shmem_onceToken != -1) {
        dispatch_once(&shmem_onceToken, v2);
      }
    }

    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&shmem_directModeShmemLock);
      if (!*(void *)(v1 + 576)) {
        -[CFPrefsDaemon _initializeShmemPage:](v1, (uint64_t *)(v1 + 576));
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&shmem_directModeShmemLock);
    }

    uint64_t result = *(void *)(v1 + 576);
    if (!result) {
      -[CFPrefsDaemon shmem].cold.1();
    }
  }

  return result;
}

uint64_t __22__CFPrefsDaemon_shmem__block_invoke(uint64_t a1)
{
  return -[CFPrefsDaemon _initializeShmemPage:](*(void *)(a1 + 32), (uint64_t *)(*(void *)(a1 + 32) + 576LL));
}

- (uint64_t)updateEntireShmem
{
  if (result)
  {
    uint64_t result = -[CFPrefsDaemon shmem](result);
    for (uint64_t i = 1LL; i != 4096; ++i)
    {
      uint64_t v2 = (unsigned int *)(result + 4 * i);
      do
        unsigned int v3 = __ldaxr(v2);
      while (__stlxr(v3 + 1, v2));
      if (v3 == -1) {
        atomic_store(1u, v2);
      }
    }
  }

  return result;
}

- (uint64_t)userID
{
  if (a1 && *(_DWORD *)(a1 + 24) == 2) {
    return cfprefsdEuid();
  }
  else {
    return 0LL;
  }
}

- (uint64_t)listener
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (BOOL)enterSandbox
{
  return 1;
}

- (void)withSourceForDomain:inContainer:user:byHost:managed:managedUsesContainer:cloudStoreEntitlement:cloudConfigurationPath:performWithSourceLock:afterReleasingSourceLock:.cold.1()
{
}

void __65__CFPrefsDaemon_logDomainInconsistencyForProcess_message_source___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(a1 + 56);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl( &dword_180A4C000,  a2,  OS_LOG_TYPE_FAULT,  "Lookup inconsistency for request from pid %d",  (uint8_t *)v3,  8u);
  OUTLINED_FUNCTION_2_16();
}

- (void)handleMessage:fromPeer:replyHandler:.cold.1()
{
  __assert_rtn( "-[CFPrefsDaemon handleMessage:fromPeer:replyHandler:]",  "cfprefsd.m",  700,  "type == XPC_TYPE_DICTIONARY");
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleSourceMessage:(os_log_t)log replyHandler:.cold.3(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_ERROR,  "Client (%d) passed an invalid cloud store identifier value.",  buf,  8u);
}

- (void)handleSourceMessage:(uint64_t)a3 replyHandler:.cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)handleAgentCheckInMessage:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_ERROR,  "cfprefsd agents don't exist on non-macOS platforms",  v1,  2u);
  OUTLINED_FUNCTION_2_16();
}

- (void)handleMultiMessage:(uint64_t)a3 replyHandler:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __50__CFPrefsDaemon_handleSourceMessage_replyHandler___block_invoke_3_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2_cold_1()
{
}

void __39__CFPrefsDaemon_initWithRole_testMode___block_invoke_2_cold_2()
{
}

- (void)_initializeShmemPage:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_180A4C000,  a2,  OS_LOG_TYPE_FAULT,  "cfprefsd could not create a shmem named %s, cross-process preferences will not work correctly",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_3_8();
}

- (void)shmem
{
}

@end
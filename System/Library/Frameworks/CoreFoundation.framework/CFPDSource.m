@interface CFPDSource
- (BOOL)_getUncanonicalizedPath:(BOOL)result;
- (BOOL)byHost;
- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7;
- (BOOL)getUncanonicalizedPath:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (BOOL)managed;
- (BOOL)shouldBePurgable;
- (BOOL)validateSandboxForWrite:(const char *)a3 containerPath:;
- (CFPDSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 shmemIndex:(signed __int16)a7 daemon:(id)a8;
- (CFStringRef)_copyUncanonicalizedPath;
- (__CFString)cloudConfigurationPath;
- (__CFString)container;
- (__CFString)copyUncanonicalizedPath;
- (__CFString)debugDump;
- (__CFString)domain;
- (__CFString)user;
- (const)_canTrustUserPropertyForPOSIXPermissionCheckForAccessType:(const __CFString *)result;
- (id)acceptMessage:(id)a3;
- (id)copyPropertyListValidatingPlist:(BOOL)a3;
- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(BOOL)a3 andReturnFileUID:(unsigned int *)a4 andMode:(unsigned __int16 *)a5;
- (id)createDiskWrite;
- (id)description;
- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6;
- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10;
- (os_unfair_lock_s)endHandlingRequest;
- (os_unfair_lock_s)hasObservers;
- (signed)shmemIndex;
- (uint64_t)approximatePlistSizeIncludingPendingChanges;
- (uint64_t)closeFileDescriptors;
- (uint64_t)isEmpty;
- (uint64_t)openActualPath;
- (uint64_t)openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:(mode_t *)a3 andMode:;
- (uint64_t)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(uint64_t)a1;
- (uint64_t)tryEndAccessingPlist;
- (uint64_t)validateAccessToken:(int)a3 accessType:;
- (uint64_t)validatePOSIXPermissionsForMessage:(int)a3 accessType:(int)a4 fileUID:(int)a5 mode:(_BYTE *)a6 fullyValidated:;
- (uint64_t)validateSandboxForRead:(const char *)a3 containerPath:;
- (uint64_t)validateSandboxPermissionsForMessage:(const char *)a3 containerPath:(int)a4 accessType:;
- (void)asyncNotifyObserversOfWriteFromConnection:(id)a3 message:(id)a4;
- (void)attachSizeWarningsToReply:(unint64_t)a3 forByteCount:;
- (void)beginHandlingRequest;
- (void)cacheFileInfo;
- (void)cleanUpIfNecessaryAfterCreatingPlist;
- (void)clearCacheForReason:(__CFString *)a3;
- (void)clearPlist;
- (void)createDiskWrite;
- (void)dealloc;
- (void)drainPendingChanges;
- (void)endHandlingRequest;
- (void)finishedNonRequestWriteWithResult:(__CFDictionary *)a3;
- (void)handleAvoidCache;
- (void)handleDeviceUnlock;
- (void)handleEUIDorEGIDMismatch;
- (void)handleNeverCache;
- (void)handleNoPlistFound;
- (void)handleSynchronous;
- (void)handleWritingResult:(__CFDictionary *)a3;
- (void)lock;
- (void)lockedAsync:(id)a3;
- (void)lockedSync:(id)a3;
- (void)markNeedsToReloadFromDiskDueToFailedWrite;
- (void)observingConnectionWasInvalidated:(id)a3;
- (void)observingConnectionsLockedSync:(os_unfair_lock_s *)a1;
- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4;
- (void)respondToFileWrittenToBehindOurBack;
- (void)setDirty:(BOOL)a3;
- (void)setManagedPreferencesUseContainer:(BOOL)a3;
- (void)setObserved:(void *)a3 bySenderOfMessage:;
- (void)setPlist:(int)a3 owner:(unsigned int)a4 mode:;
- (void)setUncanonicalizedPathCached:(BOOL)a3;
- (void)stopNotifyingObserver:(uint64_t)a1;
- (void)syncWriteToDisk;
- (void)syncWriteToDiskAndFlushCacheForReason:(__CFString *)a3;
- (void)unlock;
- (void)updateShmemEntry;
@end

@implementation CFPDSource

- (BOOL)shouldBePurgable
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_assert_owner((os_unfair_lock_t)(result + 108));
    if ((*(_BYTE *)(v1 + 142) & 3) != 0)
    {
      return 0LL;
    }

    else
    {
      v2 = (os_unfair_lock_s *)(v1 + 104);
      result = os_unfair_lock_trylock(v2);
      if (result)
      {
        os_unfair_lock_unlock(v2);
        return 1LL;
      }
    }
  }

  return result;
}

- (uint64_t)tryEndAccessingPlist
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 16);
    if (result)
    {
      result = [(id)result purgable];
      if ((result & 1) == 0)
      {
        result = -[CFPDSource shouldBePurgable](v1);
        if ((_DWORD)result) {
          return [*(id *)(v1 + 16) endAccessing];
        }
      }
    }
  }

  return result;
}

- (void)beginHandlingRequest
{
}

- (void)clearPlist
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 108));

    *(void *)(a1 + 16) = 0LL;
    *(_DWORD *)(a1 + 112) = 0;
    *(_BYTE *)(a1 + 142) &= ~0x80u;
    *(_BYTE *)(a1 + 143) &= ~1u;
  }

- (os_unfair_lock_s)endHandlingRequest
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    os_unfair_lock_assert_owner(result + 27);
    if ((*(_BYTE *)(v1 + 142) & 1) == 0) {
      -[CFPDSource endHandlingRequest].cold.1();
    }
    *(_BYTE *)(v1 + 142) &= ~1u;
    return (os_unfair_lock_s *)-[CFPDSource tryEndAccessingPlist](v1);
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  return _CFPrefsEqualKeyOrSource(self, a3);
}

- (uint64_t)openActualPath
{
  if (!a1) {
    return 0LL;
  }
  int v2 = *(_DWORD *)(a1 + 132);
  if (v2 == -1)
  {
    int v4 = *(_DWORD *)(a1 + 128);
    if (v4 == -1 || (v5 = *(const char **)(a1 + 64)) == 0LL)
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v3 = openat(v4, v5, 0);
    }
  }

  else
  {
    uint64_t v3 = dup(v2);
    lseek(*(_DWORD *)(a1 + 132), 0LL, 0);
  }

  return v3;
}

- (void)cacheFileInfo
{
}

- (int)cacheFileInfoForWriting:(BOOL)a3 euid:(unsigned int)a4 egid:(unsigned int)a5 didCreate:(BOOL *)a6
{
  v6 = (os_unfair_lock_s *)MEMORY[0x1895F8858](self, a2);
  v8 = v7;
  int v10 = v9;
  uint64_t v11 = (uint64_t)v6;
  uint64_t v69 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(v6 + 27);
  free(*(void **)(v11 + 56));
  *(void *)(v11 + 56) = 0LL;
  *(_BYTE *)(v11 + 143) &= ~2u;
  free(*(void **)(v11 + 64));
  *(void *)(v11 + 64) = 0LL;
  int v12 = *(_DWORD *)(v11 + 132);
  if ((v12 & 0x80000000) == 0) {
    close(v12);
  }
  *(_DWORD *)(v11 + 132) = -1;
  int v13 = *(_DWORD *)(v11 + 128);
  if ((v13 & 0x80000000) == 0) {
    close(v13);
  }
  *(_DWORD *)(v11 + 128) = -1;
  bzero(__s2, 0x402uLL);
  if (!-[CFPDSource getUncanonicalizedPath:](v11, __s2))
  {
    v18 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.7(v11, v18, v19, v20, v21, v22, v23, v24);
    }
    return 7;
  }

  int v57 = -1;
  bzero(__s1, 0x402uLL);
  bzero(&v65, 0x402uLL);
  if (v10)
  {
    unsigned int v14 = atomic_load((unsigned int *)&unk_18C536DA8);
    if (v14 == 3)
    {
      v15 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.1(v15);
      }
      int v16 = 0;
      int v17 = 0;
      *__error() = 28;
      goto LABEL_70;
    }
  }

  int IsCFPrefsD = _CFPrefsCurrentProcessIsCFPrefsD();
  if (byte_18C536DA2) {
    int v26 = 1;
  }
  else {
    int v26 = IsCFPrefsD;
  }
  if (v26 == 1)
  {
    if (dirname_r(__s2, (char *)&v65))
    {
      if (basename_r(__s2, __s1))
      {
        int v27 = open((const char *)&v65, 1074790400);
        int v57 = v27;
        if (v27 != -1) {
          goto LABEL_25;
        }
        int v28 = *__error();
        v29 = (os_log_s *)_CFPrefsDaemonLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.6();
        }
        *__error() = v28;
      }

      else
      {
        v33 = (os_log_s *)_CFPrefsDaemonLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.5();
        }
      }
    }

    else
    {
      v32 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:].cold.4();
      }
    }
  }

  else
  {
    int v57 = -2;
    __strlcpy_chk();
  }

  int v27 = v57;
  if (v57 == -1)
  {
LABEL_32:
    int v17 = 0;
    int v30 = -1;
    goto LABEL_39;
  }

- (BOOL)getUncanonicalizedPath:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  int v4 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  v5 = *(const __CFString **)(a1 + 88);
  if (v5)
  {
    CFStringEncoding v6 = CFStringFileSystemEncoding();
    BOOL v7 = CFStringGetCString(v5, a2, 1024LL, v6) != 0;
    os_unfair_lock_unlock(v4);
    return v7;
  }

  os_unfair_lock_unlock(v4);
  return -[CFPDSource _getUncanonicalizedPath:](a1, (UInt8 *)a2);
}

id __58__CFPDSource_cacheFileInfoForWriting_euid_egid_didCreate___block_invoke(uint64_t a1, int token)
{
  v4[5] = *MEMORY[0x1895F89C0];
  notify_cancel(token);
  cacheFileInfoForWriting_euid_egid_didCreate__deviceEverUnlocked = 1;
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v4[3] = &unk_18999B4C8;
    v4[4] = result;
    return (id)[result lockedSync:v4];
  }

  return result;
}

- (void)handleDeviceUnlock
{
  v1[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __32__CFPDSource_handleDeviceUnlock__block_invoke;
    v1[3] = &unk_18999B4C8;
    v1[4] = result;
    return (void *)[result lockedSync:v1];
  }

  return result;
}

- (CFStringRef)_copyUncanonicalizedPath
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (result)
  {
    BOOL v1 = (BOOL)result;
    bzero(cStr, 0x402uLL);
    if (-[CFPDSource _getUncanonicalizedPath:](v1, (UInt8 *)cStr))
    {
      CFStringEncoding v2 = CFStringFileSystemEncoding();
      return CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, cStr, v2);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)_getUncanonicalizedPath:(BOOL)result
{
  if (result) {
    return +[CFPrefsDaemon _getUncanonicalizedSourcePath:withDomain:user:byHost:containerPath:managed:managedUsesContainer:]( (uint64_t)CFPrefsDaemon,  a2,  *(__CFString **)(result + 48),  *(const __CFString **)(result + 40),  *(unsigned __int8 *)(result + 138),  (const __CFString *)[(id)result container],  *(unsigned __int8 *)(result + 139),  *(unsigned __int8 *)(result + 140));
  }
  return result;
}

- (__CFString)copyUncanonicalizedPath
{
  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (uncanonicalizedPathCache)
  {
    v5 = (__CFString *)CFRetain(uncanonicalizedPathCache);
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
    if (v5) {
      return v5;
    }
  }

  else
  {
    os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
  }

  return (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
}

- (void)setUncanonicalizedPathCached:(BOOL)a3
{
  BOOL v3 = a3;
  p_uncanonicalizedPathCacheLock = &self->_uncanonicalizedPathCacheLock;
  os_unfair_lock_lock(&self->_uncanonicalizedPathCacheLock);
  uncanonicalizedPathCache = self->_uncanonicalizedPathCache;
  if (v3)
  {
    if (!uncanonicalizedPathCache)
    {
      BOOL v7 = (__CFString *)-[CFPDSource _copyUncanonicalizedPath]((CFStringRef)self);
LABEL_6:
      self->_uncanonicalizedPathCache = v7;
    }
  }

  else if (uncanonicalizedPathCache)
  {
    CFRelease(uncanonicalizedPathCache);
    BOOL v7 = 0LL;
    goto LABEL_6;
  }

  os_unfair_lock_unlock(p_uncanonicalizedPathCacheLock);
}

- (CFPDSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 byHost:(BOOL)a5 managed:(BOOL)a6 shmemIndex:(signed __int16)a7 daemon:(id)a8
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CFPDSource;
  unsigned int v14 = -[CFPDSource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_cfprefsd = (CFPrefsDaemon *)a8;
    *(void *)&v14->_uncanonicalizedPathCacheLock._os_unfair_lock_opaque = 0LL;
    *(void *)&v14->_writeLock._os_unfair_lock_opaque = 0LL;
    *((_BYTE *)v14 + 142) &= ~2u;
    v14->_byHost = a5;
    v14->_domain = (__CFString *)_internString(a3);
    v15->_userName = (__CFString *)_internString(a4);
    v15->_managed = a6;
    v15->_generationShmemIndex = a7;
    *(void *)&v15->_parentFD = -1LL;
  }

  return v15;
}

- (BOOL)managed
{
  return self->_managed;
}

- (void)setManagedPreferencesUseContainer:(BOOL)a3
{
  self->_managedUsesContainer = a3;
}

- (__CFString)domain
{
  return self->_domain;
}

- (__CFString)user
{
  return self->_userName;
}

- (__CFString)container
{
  return 0LL;
}

- (__CFString)cloudConfigurationPath
{
  return 0LL;
}

- (void)respondToFileWrittenToBehindOurBack
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke;
  v2[3] = &unk_18999B4C8;
  v2[4] = self;
  -[CFPDSource lockedSync:](self, "lockedSync:", v2);
}

uint64_t __49__CFPDSource_respondToFileWrittenToBehindOurBack__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) asyncNotifyObserversOfWriteFromConnection:0 message:0];
}

- (BOOL)byHost
{
  return self->_byHost;
}

- (id)description
{
  return -[CFPDSource debugDump](self, "debugDump");
}

- (signed)shmemIndex
{
  return self->_generationShmemIndex;
}

- (void)updateShmemEntry
{
}

- (void)setDirty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (v3) {
    -[CFPDSource updateShmemEntry](self, "updateShmemEntry");
  }
  char v5 = *((_BYTE *)self + 142);
  if (((((v5 & 2) == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((_BYTE *)self + 142) = v5 & 0xFD | v6;
    if (v3)
    {
      uint64_t v7 = +[_CFPrefsSynchronizer sharedInstance]();
      -[_CFPrefsSynchronizer noteDirtySource:](v7, self);
      memcpy(__dst, "CFPrefs domain dirty: ", sizeof(__dst));
      if (!CFStringGetCString(self->_domain, &__dst[22], 490LL, 0x8000100u)) {
        __strncat_chk();
      }
      self->_dirtyTransaction = (OS_os_transaction *)os_transaction_create();
    }

    else
    {

      self->_dirtyTransaction = 0LL;
    }
  }

- (uint64_t)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = (os_log_s *)_CFPrefsDaemonLog();
  char v5 = v4;
  if (a2 != 28)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CFPDSource shouldStayDirtyAfterOpenForWritingFailureWithErrno:].cold.1(a1, a2, v5);
    }
    return 0LL;
  }

  uint64_t v6 = 1LL;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl( &dword_180A4C000,  v5,  OS_LOG_TYPE_INFO,  "Re-marking { %@, %@ } as dirty because attempt to open temporary path failed with ENOSPC",  (uint8_t *)&v10,  0x16u);
  }

  return v6;
}

- (void)cleanUpIfNecessaryAfterCreatingPlist
{
  BOOL v3 = OUTLINED_FUNCTION_14();
  strerror(*v3);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_31(&dword_180A4C000, a2, v4, "couldn't stat file at %{private}s due to \"%{public}s\"", v5);
  OUTLINED_FUNCTION_6_3();
}

- (id)createDiskWrite
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable")) {
    -[CFPDSource createDiskWrite].cold.1();
  }
  -[CFPDSource drainPendingChanges](self, "drainPendingChanges");
  os_unfair_lock_lock(&self->_writeLock);
  if ((*((_BYTE *)self + 142) & 2) == 0) {
    goto LABEL_16;
  }
  if (!self->_plist) {
    goto LABEL_16;
  }
  if (self->_parentFD == -1) {
    goto LABEL_16;
  }
  actualPath = self->_actualPath;
  if (!actualPath) {
    goto LABEL_16;
  }
  size_t v4 = strlen(self->_actualPath);
  CFURLRef v5 = CFURLCreateFromFileSystemRepresentation( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)actualPath,  v4,  0);
  uint64_t lastEuid = self->_lastEuid;
  unsigned int lastEgid = self->_lastEgid;
  __int16 v8 = 384;
  if ((*((_BYTE *)self + 142) & 0x10) == 0)
  {
    if (CFEqual(self->_userName, @"kCFPreferencesAnyUser")) {
      __int16 v8 = 420;
    }
    else {
      __int16 v8 = 384;
    }
  }

  int v9 = _CFPrefsTemporaryFDToWriteTo((uint64_t)v5, lastEuid);
  CFRelease(v5);
  if (v9 < 0)
  {
    v15 = __error();
    -[CFPDSource setDirty:]( self,  "setDirty:",  -[CFPDSource shouldStayDirtyAfterOpenForWritingFailureWithErrno:]((uint64_t)self, *v15));
LABEL_16:
    os_unfair_lock_unlock(&self->_writeLock);
    return 0LL;
  }

  memcpy(__dst, "CFPrefs domain writing: ", sizeof(__dst));
  if (!CFStringGetCString(self->_domain, &__dst[24], 488LL, 0x8000100u)) {
    __strncat_chk();
  }
  uint64_t v10 = os_transaction_create();
  uint64_t v11 = self->_plist;
  int v12 = (*((unsigned __int8 *)self + 142) >> 6) & 1;
  int parentFD = self->_parentFD;
  if (parentFD == -2) {
    int v14 = -2;
  }
  else {
    int v14 = dup(parentFD);
  }
  objc_super v17 = strdup(self->_fileName);
  -[CFPDSource setDirty:](self, "setDirty:", 0LL);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __29__CFPDSource_createDiskWrite__block_invoke;
  v18[3] = &unk_1899ED578;
  int v19 = v9;
  int v20 = lastEuid;
  __int16 v23 = v8;
  char v24 = v12;
  unsigned int v21 = lastEgid;
  int v22 = v14;
  v18[4] = v11;
  v18[5] = self;
  v18[6] = v10;
  v18[7] = v17;
  return (id)[v18 copy];
}

CFDictionaryRef __29__CFPDSource_createDiskWrite__block_invoke(uint64_t a1)
{
  values[5] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v2 = a1 + 40;
  int v3 = _CFPrefsWritePlistToFDThenClose( *(void **)(a1 + 32),  *(_DWORD *)(v2 + 24),  *(_DWORD *)(v2 + 28),  *(_DWORD *)(v2 + 32),  *(_WORD *)(v2 + 40),  *(unsigned __int8 *)(v2 + 42),  *(_DWORD *)(v2 + 36),  *(const char **)(v2 + 16),  *(void *)(*(void *)(a1 + 40) + 56LL));
  size_t v4 = *(os_unfair_lock_s **)v2;
  if (v3 == 47837 && v4)
  {
    values[0] = (void *)MEMORY[0x1895F87A8];
    values[1] = (void *)3221225472LL;
    values[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
    values[3] = &unk_18999B4C8;
    values[4] = v4;
    -[os_unfair_lock_s lockedAsync:](v4, "lockedAsync:", values);
    size_t v4 = *(os_unfair_lock_s **)v2;
  }

  os_unfair_lock_unlock(v4 + 26);

  int v5 = *(_DWORD *)(a1 + 76);
  if ((v5 & 0x80000000) == 0) {
    close(v5);
  }
  free(*(void **)(a1 + 56));

  if (!v3) {
    return 0LL;
  }
  values[0] = (void *)v3;
  return CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const void **)v2,  (const void **)values,  1LL,  0LL,  0LL);
}

- (void)markNeedsToReloadFromDiskDueToFailedWrite
{
  v1[5] = *MEMORY[0x1895F89C0];
  if (result)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke;
    v1[3] = &unk_18999B4C8;
    v1[4] = result;
    return (void *)[result lockedAsync:v1];
  }

  return result;
}

- (void)handleWritingResult:(__CFDictionary *)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!a3)
  {
LABEL_4:
    if ((*((_BYTE *)self + 142) & 2) == 0)
    {
      int cachedPlistFD = self->_cachedPlistFD;
      if ((cachedPlistFD & 0x80000000) == 0) {
        close(cachedPlistFD);
      }
      self->_int cachedPlistFD = -1;
      int parentFD = self->_parentFD;
      if ((parentFD & 0x80000000) == 0) {
        close(parentFD);
      }
      self->_int parentFD = -1;
      free(self->_fileName);
      self->_fileName = 0LL;
    }

    return;
  }

  Value = CFDictionaryGetValue(a3, self);
  if (Value != (const void *)28)
  {
    if (Value) {
      return;
    }
    goto LABEL_4;
  }

  __int16 v8 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    userName = self->_userName;
    domain = self->_domain;
    int v11 = 138412546;
    int v12 = domain;
    __int16 v13 = 2112;
    int v14 = userName;
    _os_log_impl( &dword_180A4C000,  v8,  OS_LOG_TYPE_INFO,  "Re-marking { %@, %@ } as dirty because previous write failed with ENOSPC",  (uint8_t *)&v11,  0x16u);
  }

  -[CFPDSource setDirty:](self, "setDirty:", 1LL);
}

- (void)finishedNonRequestWriteWithResult:(__CFDictionary *)a3
{
}

- (void)setPlist:(int)a3 owner:(unsigned int)a4 mode:
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 108));
    __int16 v8 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = a2;
    if (v8) {

    }
    *(_DWORD *)(a1 + 112) = a3;
    *(_BYTE *)(a1 + 142) = (a4 >> 1) & 0x80 | *(_BYTE *)(a1 + 142) & 0x7F;
    *(_BYTE *)(a1 + 143) = *(_BYTE *)(a1 + 143) & 0xFE | ((a4 & 4) != 0);
  }

- (void)syncWriteToDiskAndFlushCacheForReason:(__CFString *)a3
{
}

- (void)syncWriteToDisk
{
  int v3 = -[CFPDSource createDiskWrite](self, "createDiskWrite");
  if (v3)
  {
    int v5 = v3;
    size_t v4 = (const void *)v3[2]();
    -[CFPDSource handleWritingResult:](self, "handleWritingResult:", v4);
    int v3 = v5;
    if (v4)
    {
      CFRelease(v4);
      int v3 = v5;
    }
  }
}

uint64_t __55__CFPDSource_markNeedsToReloadFromDiskDueToFailedWrite__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateShmemEntry];
}

uint64_t __32__CFPDSource_handleDeviceUnlock__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v5 = v3[5];
    uint64_t v4 = v3[6];
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = [v3 container];
    _os_log_impl( &dword_180A4C000,  v2,  OS_LOG_TYPE_INFO,  "Responding to device unlock to refresh preferences reads previously denied by data protection { %@, %@, %@ }",  (uint8_t *)&v7,  0x20u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 142LL) &= ~0x20u;
  [*(id *)(a1 + 32) syncWriteToDiskAndFlushCacheForReason:@"device was unlocked"];
  [*(id *)(a1 + 32) updateShmemEntry];
  return [*(id *)(a1 + 32) asyncNotifyObserversOfWriteFromConnection:0 message:0];
}

- (uint64_t)openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:(mode_t *)a3 andMode:
{
  uint64_t v3 = (uint64_t)a1;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = a1 + 26;
    os_unfair_lock_lock(a1 + 26);
    int v7 = *(_DWORD *)(v3 + 128);
    if (v7 == -1 && ([(id)v3 cacheFileInfo], int v7 = *(_DWORD *)(v3 + 128), v7 == -1))
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v8 = openat(v7, *(const char **)(v3 + 64), 256);
      uint64_t v3 = v8;
      if ((_DWORD)v8 != -1)
      {
        if (fstat(v8, &v10) || v10.st_size < 0x100000)
        {
          close(v3);
          uint64_t v3 = 0xFFFFFFFFLL;
        }

        if (a2) {
          *a2 = v10.st_uid;
        }
        if (a3) {
          *a3 = v10.st_mode;
        }
      }
    }

    os_unfair_lock_unlock(v6);
  }

  return v3;
}

- (id)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:(BOOL)a3 andReturnFileUID:(unsigned int *)a4 andMode:(unsigned __int16 *)a5
{
  BOOL v7 = a3;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable")) {
    -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:].cold.1();
  }
  plist = self->_plist;
  if (plist) {
    BOOL v10 = !v7;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (!plist) {
      goto LABEL_22;
    }
    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    v38[2] = __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke;
    v38[3] = &unk_18999B4C8;
    v38[4] = self;
    -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:]( plist,  "quicklyValidatePlistAndOnFailureInvokeBlock:",  v38);
  }

  else
  {
    BOOL v11 = -[CFPDDataBuffer validatePlist](plist, "validatePlist");
    uint64_t v12 = (os_log_s *)_CFPrefsDaemonLog();
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        userName = self->_userName;
        domain = self->_domain;
        buf.st_dev = 138412546;
        *(void *)&buf.mode_t st_mode = domain;
        WORD2(buf.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)userName;
        _os_log_impl( &dword_180A4C000,  v13,  OS_LOG_TYPE_INFO,  "Validation of pre-existing plist succeeded. {%@ %@}",  (uint8_t *)&buf,  0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CFPDSource copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:].cold.3();
      }
      -[CFPDSource clearCacheForReason:](self, "clearCacheForReason:", @"cached plist is invalid");
    }
  }

  int v16 = self->_plist;
  if (v16)
  {
LABEL_16:
    if (a4) {
      *a4 = self->_plistFileOwner;
    }
    if (!a5) {
      return v16;
    }
    unsigned __int16 v17 = (2 * (*((_BYTE *)self + 142) & 0x80)) & 0xFFFB | (4 * (*((_BYTE *)self + 143) & 1));
    goto LABEL_20;
  }

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke()
{
  v0 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1();
  }
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59()
{
  v0 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59_cold_1();
  }
}

- (id)copyPropertyListValidatingPlist:(BOOL)a3
{
  return self->_plist;
}

- (void)asyncNotifyObserversOfWriteFromConnection:(id)a3 message:(id)a4
{
  v4[7] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke;
  v4[3] = &unk_1899ED5D0;
  v4[4] = self;
  v4[5] = a3;
  void v4[6] = a4;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v4);
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (-[CFPDSource hasObservers](*(os_unfair_lock_s **)(a1 + 32)))
  {
    values[0] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(void *)(a1 + 32) + 48LL));
    values[1] = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(*(void *)(a1 + 32) + 40LL));
    values[2] = xpc_BOOL_create(*(_BYTE *)(*(void *)(a1 + 32) + 138LL));
    values[3] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)[*(id *)(a1 + 32) container]);
    values[4] = _CFXPCCreateXPCObjectFromCFObject((__CFString *)[*(id *)(a1 + 32) cloudConfigurationPath]);
    if (*(void *)(a1 + 40) && (uint64_t v2 = *(void **)(a1 + 48)) != 0LL)
    {
      size_t length = 0LL;
      data = (__int128 *)xpc_dictionary_get_data(v2, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        __int128 v4 = data[1];
        __int128 context = *data;
        __int128 v20 = v4;
      }

      else
      {
        if (!xpc_dictionary_get_remote_connection(v2))
        {
          value = xpc_dictionary_get_value(v2, "connection");
          if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1895F9238])) {
            __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1( (uint64_t)value,  v7,  v8);
          }
        }

        xpc_connection_get_audit_token();
      }

      pid_t v5 = DWORD1(v20);
    }

    else
    {
      pid_t v5 = getpid();
    }

    xpc_object_t v9 = xpc_int64_create(v5);
    uint64_t v10 = *(void *)(a1 + 32);
    values[5] = v9;
    *(void *)&__int128 context = v10;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)_CFPrefsNotifyFuncKeys, values, 6uLL);
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)(a1 + 40);
    *((void *)&context + 1) = v11;
    *(void *)&__int128 v20 = v13;
    do
    {
      xpc_object_t v14 = values[v12];
      if (v14) {
        xpc_release(v14);
      }
      ++v12;
    }

    while (v12 != 6);
    uint64_t v15 = *(void **)(a1 + 32);
    int v16 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      _extractCFPDBits(0LL, 0LL, v15, (uint64_t)&__block_literal_global_341);
    }
    CFSetApplyFunction(*(CFSetRef *)(*(void *)(a1 + 32) + 72LL), (CFSetApplierFunction)notifyFunc, &context);
    xpc_release(*((xpc_object_t *)&context + 1));
  }

- (os_unfair_lock_s)hasObservers
{
  if (result)
  {
    BOOL v1 = result;
    os_unfair_lock_assert_owner(result + 25);
    id result = *(os_unfair_lock_s **)&v1[18]._os_unfair_lock_opaque;
    if (result) {
      return (os_unfair_lock_s *)(CFSetGetCount((CFSetRef)result) > 0);
    }
  }

  return result;
}

- (void)observingConnectionsLockedSync:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    uint64_t v3 = a1 + 25;
    os_unfair_lock_lock(a1 + 25);
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    os_unfair_lock_unlock(v3);
  }

- (void)observingConnectionWasInvalidated:(id)a3
{
  v3[6] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __48__CFPDSource_observingConnectionWasInvalidated___block_invoke;
  v3[3] = &unk_1899EB4A8;
  v3[4] = self;
  v3[5] = a3;
  -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v3);
}

void __48__CFPDSource_observingConnectionWasInvalidated___block_invoke(uint64_t a1)
{
}

- (void)stopNotifyingObserver:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 100));
    __int128 v4 = *(__CFSet **)(a1 + 72);
    if (v4)
    {
      CFSetRemoveValue(v4, a2);
      if (!CFSetGetCount(*(CFSetRef *)(a1 + 72)))
      {
        CFRelease(*(CFTypeRef *)(a1 + 72));
        *(void *)(a1 + 72) = 0LL;
      }
    }
  }

- (void)drainPendingChanges
{
  __assert_rtn("-[CFPDSource drainPendingChanges]", "CFPDSource.m", 1744, "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

void __33__CFPDSource_drainPendingChanges__block_invoke()
{
  v0 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __33__CFPDSource_drainPendingChanges__block_invoke_cold_1();
  }
}

- (BOOL)enqueueNewKey:(id)a3 value:(id)a4 encoding:(int)a5 inBatch:(BOOL)a6 fromMessage:(id)a7
{
  applier[6] = *MEMORY[0x1895F89C0];
  if (object_getClass(a3) != (Class)MEMORY[0x1895F92E8]) {
    -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:].cold.2();
  }
  if (a5 == 1)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke;
    applier[3] = &unk_1899ED5F8;
    applier[4] = self;
    applier[5] = a7;
    xpc_dictionary_apply(a4, applier);
  }

  else
  {
    pendingChangesQueue = self->_pendingChangesQueue;
    if (!pendingChangesQueue)
    {
      pendingChangesQueue = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
      self->_pendingChangesQueue = pendingChangesQueue;
    }

    size_t count = xpc_array_get_count(pendingChangesQueue);
    size_t v15 = count;
    if ((count & 1) != 0) {
      -[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:].cold.1();
    }
    if (count)
    {
      size_t v16 = 1LL;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(self->_pendingChangesQueue, v16 - 1);
        if (xpc_equal(a3, value)) {
          break;
        }
        size_t v18 = v16 + 1;
        v16 += 2LL;
        if (v18 >= v15) {
          goto LABEL_11;
        }
      }

      xpc_object_t v20 = xpc_array_get_value(self->_pendingChangesQueue, v16);
      uint64_t v21 = _CFPrefsSizeOfValue(a4, 0);
      uint64_t v22 = v21 - _CFPrefsSizeOfValue(v20, 0);
      __int16 v23 = self->_pendingChangesQueue;
      self->_pendingChangesSize += v22;
      xpc_array_set_value(v23, v16, a4);
    }

    else
    {
LABEL_11:
      xpc_array_append_value(self->_pendingChangesQueue, a3);
      xpc_array_append_value(self->_pendingChangesQueue, a4);
      if (object_getClass(a4) != (Class)MEMORY[0x1895F92A8])
      {
        uint64_t v19 = _CFPrefsSizeOfValue(a4, 0);
        self->_pendingChangesSize += _CFPrefsSizeOfValue(a3, 0) + v19;
      }
    }
  }

  -[CFPDSource setDirty:](self, "setDirty:", 1LL);
  if (!a6 && self->_pendingChangesSize > 0x20000)
  {

    self->_pendingChangesSize = 0LL;
  }

  return 1;
}

uint64_t __63__CFPDSource_enqueueNewKey_value_encoding_inBatch_fromMessage___block_invoke( uint64_t a1,  char *string,  uint64_t a3)
{
  xpc_object_t v5 = xpc_string_create(string);
  [*(id *)(a1 + 32) enqueueNewKey:v5 value:a3 encoding:0 inBatch:1 fromMessage:*(void *)(a1 + 40)];
  xpc_release(v5);
  return 1LL;
}

- (__CFString)debugDump
{
  uint64_t v3 = -[CFPDSource copyUncanonicalizedPath](self, "copyUncanonicalizedPath");
  userName = self->_userName;
  domain = self->_domain;
  plist = self->_plist;
  uint64_t generationShmemIndex = self->_generationShmemIndex;
  unsigned int v8 = *((unsigned __int8 *)self + 142);
  uint64_t v9 = (v8 >> 1) & 1;
  BOOL byHost = self->_byHost;
  uint64_t v11 = 384LL;
  if ((v8 & 0x10) == 0)
  {
    if (CFEqual(userName, @"kCFPreferencesAnyUser")) {
      uint64_t v11 = 420LL;
    }
    else {
      uint64_t v11 = 384LL;
    }
  }

  uint64_t v12 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"\n*****************************************************\nDomain: %@\nUser: %@\nPath: %@\nplist data:%@\nshmem index:%d\ndirty:%d\nbyHost:%d\nmode:%o\n",  domain,  userName,  v3,  plist,  generationShmemIndex,  v9,  byHost,  v11);
  if (v3) {
    CFRelease(v3);
  }
  return v12;
}

- (void)clearCacheForReason:(__CFString *)a3
{
  v8[5] = *MEMORY[0x1895F89C0];
  xpc_object_t v5 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __DEBUG_CACHE_EVICT_block_invoke;
    v8[3] = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
    v8[4] = a3;
    _extractCFPDBits(0LL, 0LL, self, (uint64_t)v8);
  }

  -[CFPDSource setDirty:](self, "setDirty:", 0LL);
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue) {
    xpc_release(pendingChangesQueue);
  }
  -[CFPDSource clearPlist]((uint64_t)self);
  self->_pendingChangesQueue = 0LL;
  self->_pendingChangesSize = 0LL;
  free(self->_actualPath);
  self->_actualPath = 0LL;
  *((_BYTE *)self + 143) &= ~2u;
  free(self->_fileName);
  self->_fileName = 0LL;
  int parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0) {
    close(parentFD);
  }
  self->_int parentFD = -1;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)lockedAsync:(id)a3
{
  block[6] = *MEMORY[0x1895F89C0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__CFPDSource_lockedAsync___block_invoke;
  block[3] = &unk_1899ED620;
  block[4] = self;
  block[5] = a3;
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  qos_class_t v4 = qos_class_self();
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v4, 0LL);
  dispatch_async(global_queue, v3);
}

uint64_t __26__CFPDSource_lockedAsync___block_invoke(uint64_t a1)
{
  BOOL v1 = *(os_unfair_lock_s **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  -[os_unfair_lock_s lock](v1, "lock");
  -[CFPDSource beginHandlingRequest]((uint64_t)v1);
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  -[CFPDSource endHandlingRequest](v1);
  return -[os_unfair_lock_s unlock](v1, "unlock");
}

- (void)lockedSync:(id)a3
{
}

- (uint64_t)validateAccessToken:(int)a3 accessType:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (a2 == -1) {
    return 4LL;
  }
  if (a3) {
    uint64_t v6 = 3LL;
  }
  else {
    uint64_t v6 = 2LL;
  }
  bzero(__s2, 0x400uLL);
  if ((a2 & 0x80000000) == 0)
  {
    if (fstat(a2, &v43))
    {
      uint64_t v7 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = *__error();
        *(_DWORD *)stat buf = 67109120;
        LODWORD(v39) = v8;
        uint64_t v9 = "Failed access token check because fstat failed: %{darwin.errno}d";
LABEL_12:
        uint64_t v10 = buf;
        uint64_t v11 = v7;
        uint32_t v12 = 8;
LABEL_13:
        _os_log_impl(&dword_180A4C000, v11, OS_LOG_TYPE_INFO, v9, v10, v12);
        return v6;
      }

      return v6;
    }

    if (fcntl(a2, 50, __s2) == -1)
    {
      uint64_t v7 = (os_log_s *)_CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      int v15 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v15;
      uint64_t v9 = "Failed access token check because F_GETPATH failed: %{darwin.errno}d";
      goto LABEL_12;
    }

    uint64_t v13 = *(const char **)(a1 + 56);
    if (v13) {
      xpc_object_t v14 = strdup(v13);
    }
    else {
      xpc_object_t v14 = 0LL;
    }
    if (*(_DWORD *)(a1 + 128) == -1)
    {
      [(id)a1 cacheFileInfo];
      if (*(_DWORD *)(a1 + 128) == -1)
      {
        uint64_t v25 = (os_log_s *)_CFPrefsDaemonLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)stat buf = 0;
          _os_log_impl( &dword_180A4C000,  v25,  OS_LOG_TYPE_INFO,  "Failed access token check because cacheFileInfo failed",  buf,  2u);
        }

        free(v14);
        return v6;
      }
    }

    if (v14 && strcmp(*(const char **)(a1 + 56), v14))
    {
      size_t v16 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 56);
        *(_DWORD *)stat buf = 136315394;
        int v39 = v14;
        __int16 v40 = 2080;
        uint64_t v41 = v17;
        _os_log_impl( &dword_180A4C000,  v16,  OS_LOG_TYPE_INFO,  "Failed access token check because _actualPath has changed since the last-known path (%s vs %s)",  buf,  0x16u);
      }

      [(id)a1 clearCacheForReason:@"observed actual path changed"];
      free(v14);
      return 4LL;
    }

    free(v14);
    if (byte_18C536DA5)
    {
      [(id)a1 setDirty:1];
      [(id)a1 syncWriteToDisk];
      [(id)a1 cacheFileInfo];
      byte_18C536DA5 = 0;
    }

    int v19 = -[CFPDSource openActualPath](a1);
    if (v19 == -1)
    {
      uint64_t v7 = (os_log_s *)_CFPrefsDaemonLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      int v24 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v24;
      uint64_t v9 = "Failed access token check because the file could not be opened: %{darwin.errno}d";
      goto LABEL_12;
    }

    int v20 = v19;
    if (fstat(v19, &v42))
    {
      uint64_t v21 = (os_log_s *)_CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_36:
        close(v20);
        return v6;
      }

      int v22 = *__error();
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v39) = v22;
      __int16 v23 = buf;
LABEL_35:
      _os_log_impl( &dword_180A4C000,  v21,  OS_LOG_TYPE_INFO,  "Failed access token check because F_GETPATH failed: %{darwin.errno}d",  v23,  8u);
      goto LABEL_36;
    }

    bzero(buf, 0x400uLL);
    if (fcntl(v20, 50, buf) == -1)
    {
      uint64_t v21 = (os_log_s *)_CFPrefsDaemonLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      int v27 = *__error();
      *(_DWORD *)int v34 = 67109120;
      LODWORD(v35) = v27;
      __int16 v23 = v34;
      goto LABEL_35;
    }

    close(v20);
    if (strcmp((const char *)buf, __s2))
    {
      int v26 = (os_log_s *)_CFPrefsDaemonLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        return v6;
      }
      *(_DWORD *)int v34 = 136315394;
      v35 = __s2;
      __int16 v36 = 2080;
      v37 = buf;
      uint64_t v9 = "Failed access token check because path of token doesn't match verification path (%s vs %s)";
      uint64_t v10 = v34;
      uint64_t v11 = v26;
      uint32_t v12 = 22;
      goto LABEL_13;
    }

    int v28 = *(const char **)(a1 + 56);
    if (!v28 || strcmp((const char *)buf, v28))
    {
      v29 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int v30 = *(uint8_t **)(a1 + 56);
        *(_DWORD *)int v34 = 136315394;
        v35 = __s2;
        __int16 v36 = 2080;
        v37 = v30;
        _os_log_impl( &dword_180A4C000,  v29,  OS_LOG_TYPE_INFO,  "Failed access token check because verification path doesn't match known actual path (%s vs %s)",  v34,  0x16u);
      }

      [(id)a1 clearCacheForReason:@"observed actual path changed"];
      return v6;
    }

    if (v42.st_dev == v43.st_dev && v42.st_ino == v43.st_ino)
    {
      if (v42.st_nlink)
      {
        if (a3 != 1 || (fcntl(a2, 3, 0LL) & 3) == 2) {
          return 1LL;
        }
        v33 = (os_log_s *)_CFPrefsDaemonLog();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO)) {
          return v6;
        }
        *(_WORD *)int v34 = 0;
        uint64_t v9 = "Failed access token check because the it was not opened for writing";
        uint64_t v10 = v34;
        uint64_t v11 = v33;
        uint32_t v12 = 2;
        goto LABEL_13;
      }

      BOOL v31 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v34 = 0;
        v32 = "Failed access token check because the file it references has been unlinked";
        goto LABEL_61;
      }
    }

    else
    {
      BOOL v31 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v34 = 0;
        v32 = "Failed access token check because inode of token doesn't match verification inode";
LABEL_61:
        _os_log_impl(&dword_180A4C000, v31, OS_LOG_TYPE_INFO, v32, v34, 2u);
      }
    }

    return 4LL;
  }

  uint64_t v7 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 67109120;
    LODWORD(v39) = a2;
    uint64_t v9 = "Failed access token check because %d is invalid";
    goto LABEL_12;
  }

  return v6;
}

- (BOOL)validateSandboxForWrite:(const char *)a3 containerPath:
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    os_unfair_lock_assert_owner((os_unfair_lock_t)(result + 108));
    if (*(_DWORD *)(v5 + 128) == -1)
    {
      return 0LL;
    }

    else if (_CFPrefsMessageSenderIsSandboxed(a2))
    {
      string = xpc_dictionary_get_string(a2, "CFPreferencesDomain");
      size_t v7 = strlen(a3);
      if (v7) {
        BOOL v8 = strncmp(*(const char **)(v5 + 56), a3, v7) != 0;
      }
      else {
        BOOL v8 = 1;
      }
      uint64_t v9 = strchr(string, 47);
      BOOL v10 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
      int v11 = 0;
      if (v8 && !v10 && !v9)
      {
        length[0] = 0LL;
        data = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          __int128 v27 = *data;
          __int128 v28 = data[1];
        }

        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t value = xpc_dictionary_get_value(a2, "connection");
          }

          xpc_connection_get_audit_token();
        }

        *(_OWORD *)size_t length = v27;
        __int128 v31 = v28;
        if (sandbox_check_by_audit_token())
        {
          int v16 = *(_DWORD *)(v5 + 128);
          uint64_t v17 = *(const char **)(v5 + 64);
          uint64_t v18 = 384LL;
          if ((*(_BYTE *)(v5 + 142) & 0x10) == 0)
          {
            if (CFEqual(*(CFTypeRef *)(v5 + 40), @"kCFPreferencesAnyUser")) {
              uint64_t v18 = 420LL;
            }
            else {
              uint64_t v18 = 384LL;
            }
          }

          *(_OWORD *)size_t length = v27;
          __int128 v31 = v28;
          int v11 = sandbox_check_by_audit_token();
          if (v11)
          {
            int v19 = openat(v16, v17, 536871426, v18);
            if (v19 < 0) {
              goto LABEL_30;
            }
            int v20 = v19;
            bzero(length, 0x400uLL);
            fcntl(v20, 50, length);
            *(_OWORD *)&v29.st_dev = v27;
            *(_OWORD *)&v29.uid_t st_uid = v28;
            int v11 = sandbox_check_by_audit_token();
            int v21 = fstat(v20, &v29);
            close(v20);
            if (!v21 && !v29.st_size) {
              unlinkat(v16, v17, 2048);
            }
            if (v11)
            {
LABEL_30:
              *(void *)&v29.st_dev = 0LL;
              int v22 = xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", (size_t *)&v29);
              if (v22 && *(void *)&v29.st_dev == 32LL)
              {
                __int128 v23 = v22[1];
                *(_OWORD *)size_t length = *v22;
                __int128 v31 = v23;
              }

              else
              {
                if (!xpc_dictionary_get_remote_connection(a2))
                {
                  Class = xpc_dictionary_get_value(a2, "connection");
                }

                xpc_connection_get_audit_token();
              }

              sandbox_check_by_audit_token();
            }
          }
        }

        else
        {
          int v11 = 0;
        }
      }

      return v11 == 0;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (uint64_t)validateSandboxForRead:(const char *)a3 containerPath:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (result)
  {
    if (!a2) {
      -[CFPDSource validateSandboxForRead:containerPath:].cold.1();
    }
    uint64_t v5 = result;
    if (*(void *)(result + 56))
    {
LABEL_8:
      if (_CFPrefsMessageSenderIsSandboxed(a2))
      {
        string = xpc_dictionary_get_string(a2, "CFPreferencesDomain");
        length[0] = 0LL;
        data = (__int128 *)xpc_dictionary_get_data(a2, "CFPreferencesAuditToken", length);
        if (data && length[0] == 32)
        {
          __int128 v12 = data[1];
          __int128 v28 = *data;
          __int128 v29 = v12;
        }

        else
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            xpc_object_t value = xpc_dictionary_get_value(a2, "connection");
          }

          xpc_connection_get_audit_token();
        }

        if (*(_BYTE *)(v5 + 139))
        {
          if (!xpc_dictionary_get_remote_connection(a2))
          {
            Class = xpc_dictionary_get_value(a2, "connection");
          }

          int v19 = (const char *)xpc_connection_copy_bundle_id();
          int v20 = (char *)v19;
          if (v19 && !strcmp(v19, string))
          {
            int v21 = 0;
          }

          else
          {
            *(_OWORD *)size_t length = v28;
            __int128 v27 = v29;
            int v21 = sandbox_check_by_audit_token();
          }

          free(v20);
          if (!v21) {
            return 1LL;
          }
          return 2LL;
        }

        size_t v22 = strlen(a3);
        if (v22) {
          BOOL v23 = strncmp(*(const char **)(v5 + 56), a3, v22) != 0;
        }
        else {
          BOOL v23 = 1;
        }
        int v24 = strchr(string, 47);
        BOOL v25 = xpc_dictionary_get_BOOL(a2, "CFPreferencesHasFixedUpContainer");
        if (!v23 || v25 || v24)
        {
          *(_OWORD *)size_t length = v28;
          __int128 v27 = v29;
        }

        else
        {
          *(_OWORD *)size_t length = v28;
          __int128 v27 = v29;
          if (sandbox_check_by_audit_token())
          {
            *(_OWORD *)size_t length = v28;
            __int128 v27 = v29;
            if (sandbox_check_by_audit_token())
            {
              *(_OWORD *)size_t length = v28;
              __int128 v27 = v29;
              sandbox_check_by_audit_token();
              return 2LL;
            }
          }
        }
      }

      return 1LL;
    }

    [(id)result cacheFileInfo];
    uint64_t v6 = *(void *)(v5 + 56);
    size_t v7 = (void *)MEMORY[0x186E04ED0](a2);
    BOOL v8 = (os_log_s *)_CFPrefsDaemonLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9) {
        -[CFPDSource validateSandboxForRead:containerPath:].cold.5();
      }
      free(v7);
      goto LABEL_8;
    }

    if (v9) {
      -[CFPDSource validateSandboxForRead:containerPath:].cold.2();
    }
    free(v7);
    return 9LL;
  }

  return result;
}

- (const)_canTrustUserPropertyForPOSIXPermissionCheckForAccessType:(const __CFString *)result
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v2 = (__CFString *)result;
    id result = (const __CFString *)result[1].data;
    if (result)
    {
      if (CFStringHasPrefix(result, @"/")) {
        return 0LL;
      }
      data = (const __CFString *)v2[1].data;
      v9.size_t length = CFStringGetLength(data);
      v9.location = 0LL;
      if (CFStringFindWithOptions(data, @"..", v9, 0LL, 0LL)) {
        return 0LL;
      }
      uint64_t v5 = (const __CFString *)-[__CFString container](v2, "container");
      else {
        return (const __CFString *)((v2[4].info & 0x200000000000000LL) == 0 || a2 != 0);
      }
    }
  }

  return result;
}

- (uint64_t)validatePOSIXPermissionsForMessage:(int)a3 accessType:(int)a4 fileUID:(int)a5 mode:(_BYTE *)a6 fullyValidated:
{
  if (!a1) {
    return 0LL;
  }
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 108));
  remote_connection = xpc_dictionary_get_remote_connection(a2);
  if (!remote_connection)
  {
    xpc_object_t value = (_xpc_connection_s *)xpc_dictionary_get_value(a2, "connection");
    if (!value
      || (remote_connection = value,
          xpc_object_t value = (_xpc_connection_s *)object_getClass(value),
          value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
    {
      -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:].cold.1( (uint64_t)value,  v14,  v15);
    }
  }

  uid_t euid = xpc_connection_get_euid(remote_connection);
  int v17 = cfprefsdEuid();
  if (euid && v17 != euid && (a3 == 1 || (euid != a4 ? (int v18 = 4) : (int v18 = 256), (v18 & a5) == 0)))
  {
    if (-[CFPDSource _canTrustUserPropertyForPOSIXPermissionCheckForAccessType:]( (const __CFString *)a1,  a3))
    {
      int v19 = _CFPrefsCopyUserNameForUID(euid);
      if (v19)
      {
        int v20 = v19;
        if (CFEqual(*(CFTypeRef *)(a1 + 40), v19))
        {
          *a6 = 0;
          CFRelease(v20);
          return 1LL;
        }

        CFRelease(v20);
      }
    }
  }

  else if (!byte_18C536DA3)
  {
    *a6 = 0;
    return 1LL;
  }

  int v22 = xpc_dictionary_dup_fd(a2, "CFPreferencesAccessToken");
  uint64_t v21 = -[CFPDSource validateAccessToken:accessType:](a1, v22, a3);
  if ((v22 & 0x80000000) == 0) {
    close(v22);
  }
  *a6 = 1;
  return v21;
}

- (uint64_t)validateSandboxPermissionsForMessage:(const char *)a3 containerPath:(int)a4 accessType:
{
  if (result)
  {
    if (a4 == 1)
    {
      if (-[CFPDSource validateSandboxForWrite:containerPath:](result, a2, a3)) {
        return 1LL;
      }
      else {
        return 3LL;
      }
    }

    else
    {
      return -[CFPDSource validateSandboxForRead:containerPath:](result, a2, a3);
    }
  }

  return result;
}

- (int)validateMessage:(id)a3 withNewKey:(id)a4 newValue:(id)a5 plistIsAvailableToRead:(BOOL)a6 containerPath:(const char *)a7 fileUID:(unsigned int)a8 mode:(unsigned __int16)a9 diagnosticMessage:(const char *)a10
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  BOOL v13 = a4 != 0LL;
  if (!a4 && !a6) {
    return 1;
  }
  char v16 = 0;
  int result = -[CFPDSource validatePOSIXPermissionsForMessage:accessType:fileUID:mode:fullyValidated:]( (uint64_t)self,  a3,  a4 != 0LL,  a8,  a9,  &v16);
  if (v16)
  {
    if (result == 3)
    {
      uint64_t v15 = "writing to another user's preferences requires sufficient permissions to write to the file";
    }

    else
    {
      if (result != 2) {
        return result;
      }
      uint64_t v15 = "accessing another user's preferences requires sufficient permissions to be able to read the file";
    }
  }

  else
  {
    int result = -[CFPDSource validateSandboxPermissionsForMessage:containerPath:accessType:]((uint64_t)self, a3, a7, v13);
    if (a7 && *a7)
    {
      if (result == 3)
      {
        uint64_t v15 = "setting preferences outside an application's container requires user-preference-write or file-write-data sandbox access";
      }

      else
      {
        if (result != 2) {
          return result;
        }
        uint64_t v15 = "accessing preferences outside an application's container requires user-preference-read or file-read-data sandbox access";
      }
    }

    else if (result == 3)
    {
      uint64_t v15 = "setting these preferences requires user-preference-write or file-write-data sandbox access";
    }

    else
    {
      if (result != 2) {
        return result;
      }
      uint64_t v15 = "accessing these preferences requires user-preference-read or file-read-data sandbox access";
    }
  }

  *a10 = v15;
  return result;
}

- (void)setObserved:(void *)a3 bySenderOfMessage:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 27);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    if (!remote_connection)
    {
      xpc_object_t value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
      if (!value
        || (remote_connection = value,
            xpc_object_t value = (_xpc_connection_s *)object_getClass(value),
            value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
      {
        -[CFPDSource setObserved:bySenderOfMessage:].cold.1((uint64_t)value, v8, v9);
      }
    }

    uint64_t v10 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke;
    v14[3] = &unk_1899ED678;
    char v15 = a2;
    v14[4] = a1;
    if (withClientContext(remote_connection, (uint64_t)v14))
    {
      v12[0] = v10;
      v12[1] = 3221225472LL;
      v12[2] = __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2;
      v12[3] = &unk_1899ED6A0;
      char v13 = a2;
      v12[4] = a1;
      v12[5] = a3;
      int v11 = a1 + 25;
      v12[6] = remote_connection;
      os_unfair_lock_lock(v11);
      __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2((uint64_t)v12);
      os_unfair_lock_unlock(v11);
    }
  }

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v4 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v5 = *(__CFSet **)(a2 + 24);
  if (v4)
  {
    if (!v5)
    {
      CFSetCallBacks v6 = *(CFSetCallBacks *)byte_1899ED640;
      *(void *)(a2 + 24) = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &v6);
      uint64_t v5 = *(__CFSet **)(a2 + 24);
    }

    CFSetAddValue(v5, *(const void **)(a1 + 32));
  }

  else if (v5)
  {
    CFSetRemoveValue(v5, *(const void **)(a1 + 32));
    if (!CFSetGetCount(*(CFSetRef *)(a2 + 24)))
    {
      CFRelease(*(CFTypeRef *)(a2 + 24));
      *(void *)(a2 + 24) = 0LL;
    }
  }

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  if (*(_BYTE *)(a1 + 56))
  {
    if (!v3)
    {
      *(void *)(*(void *)(a1 + 32) + 72LL) = CFSetCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeSetCallBacks);
      uint64_t v2 = *(void **)(a1 + 32);
    }

    int v4 = *(void **)(a1 + 40);
    uint64_t v5 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _extractCFPDBits(v4, 0LL, v2, (uint64_t)&__block_literal_global_349);
    }
    CFSetAddValue(*(CFMutableSetRef *)(*(void *)(a1 + 32) + 72LL), *(const void **)(a1 + 48));
  }

  else if (v3)
  {
    CFSetCallBacks v6 = *(void **)(a1 + 40);
    size_t length = 0LL;
    data = (__int128 *)xpc_dictionary_get_data(v6, "CFPreferencesAuditToken", &length);
    if (data && length == 32)
    {
      __int128 v8 = data[1];
      __int128 v16 = *data;
      __int128 v17 = v8;
    }

    else
    {
      if (!xpc_dictionary_get_remote_connection(v6))
      {
        xpc_object_t value = xpc_dictionary_get_value(v6, "connection");
      }

      xpc_connection_get_audit_token();
    }

    int v12 = DWORD1(v17);
    char v13 = *(void **)(a1 + 32);
    uint64_t v14 = (os_log_s *)_CFPrefsDaemonLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(void *)&__int128 v16 = MEMORY[0x1895F87A8];
      *((void *)&v16 + 1) = 3221225472LL;
      *(void *)&__int128 v17 = __DEBUG_STOPPED_OBSERVING_block_invoke;
      *((void *)&v17 + 1) = &unk_1899EDB48;
      int v18 = v6;
      int v19 = v12;
      _extractCFPDBits(v6, 0LL, v13, (uint64_t)&v16);
    }

    -[CFPDSource stopNotifyingObserver:](*(void *)(a1 + 32), *(const void **)(a1 + 48));
  }

- (void)handleAvoidCache
{
  if (result) {
    return (void *)[result syncWriteToDiskAndFlushCacheForReason:@"we're avoiding the cache"];
  }
  return result;
}

- (void)handleNeverCache
{
  if (result) {
    return (void *)[result syncWriteToDiskAndFlushCacheForReason:@"we're never caching"];
  }
  return result;
}

- (void)handleEUIDorEGIDMismatch
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

- (void)handleSynchronous
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

- (void)handleNoPlistFound
{
  if (result) {
    return (void *)[result syncWriteToDisk];
  }
  return result;
}

- (void)attachSizeWarningsToReply:(unint64_t)a3 forByteCount:
{
  if (a1)
  {
    int64_t v4 = _CFPrefsDomainSizeAcceptabilityForByteCount(a3);
    xpc_dictionary_set_int64(a2, "CFPreferencesByteCountThreshold", v4);
  }

- (uint64_t)approximatePlistSizeIncludingPendingChanges
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 16))
  {
    v1 += [*(id *)(a1 + 16) length];
  }

  else if (*(_DWORD *)(a1 + 128) != -1)
  {
    int v2 = fstatat(*(_DWORD *)(a1 + 128), *(const char **)(a1 + 64), &v5, 0);
    off_t st_size = v5.st_size;
    if (v2) {
      off_t st_size = 0LL;
    }
    v1 += st_size;
  }

  return v1;
}

- (uint64_t)isEmpty
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *(void **)(result + 24);
    if (v2 && xpc_array_get_count(v2) || [*(id *)(v1 + 16) length])
    {
      return 0LL;
    }

    else
    {
      int v3 = *(_DWORD *)(v1 + 128);
      if (v3 == -1) {
        return 1LL;
      }
      else {
        return fstatat(v3, *(const char **)(v1 + 64), &v5, 0) || v5.st_size < 1;
      }
    }
  }

  return result;
}

- (id)acceptMessage:(id)a3
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[CFPDDataBuffer purgable](self->_plist, "purgable")) {
    -[CFPDSource acceptMessage:].cold.1();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0LL, 0LL, 0LL);
  }
  uint64_t v6 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(void *)&__int128 v81 = MEMORY[0x1895F87A8];
    *((void *)&v81 + 1) = 3221225472LL;
    *(void *)&__int128 v82 = __DEBUG_REQUEST_block_invoke;
    *((void *)&v82 + 1) = &unk_1899EDB70;
    v83 = self;
    _extractCFPDBits(a3, 0LL, self, (uint64_t)&v81);
  }

  xpc_object_t v74 = 0LL;
  xpc_object_t v75 = 0LL;
  int64_t int64 = xpc_dictionary_get_int64(a3, "CFPreferencesOperation");
  int v8 = _CFPrefsDecodeKeyValuePairFromXPCMessage(a3, &v75, &v74, (int *)&v73);
  char v72 = 0;
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesAvoidCache")) {
    -[CFPDSource syncWriteToDiskAndFlushCacheForReason:]( self,  "syncWriteToDiskAndFlushCacheForReason:",  @"we're avoiding the cache");
  }
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesRestrictedReadability")) {
    *((_BYTE *)self + 142) |= 0x10u;
  }
  if (xpc_dictionary_get_BOOL(a3, "CFPreferencesDisableBackups")) {
    *((_BYTE *)self + 142) |= 0x40u;
  }
  self->_fileProtectionClass = xpc_dictionary_get_int64(a3, "CFPreferencesFileProtectionClass");
  if (xpc_dictionary_get_BOOL(a3, "kCFPreferencesTestingSimulateSlowFilesystem")) {
    byte_18C536D9F = 1;
  }
  atomic_store( xpc_dictionary_get_int64(a3, "kCFPreferencesTestingSimulateOutOfDiskSpace"),  (unsigned int *)&unk_18C536DA8);
  remote_connection = xpc_dictionary_get_remote_connection(a3);
  if (!remote_connection)
  {
    xpc_object_t value = (_xpc_connection_s *)xpc_dictionary_get_value(a3, "connection");
    if (!value
      || (remote_connection = value,
          xpc_object_t value = (_xpc_connection_s *)object_getClass(value),
          value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
    {
      -[CFPDSource acceptMessage:].cold.2((uint64_t)value, v11, v12);
    }
  }

  *(void *)&__int128 v81 = 0LL;
  data = (__int128 *)xpc_dictionary_get_data(a3, "CFPreferencesAuditToken", (size_t *)&v81);
  if (data && (void)v81 == 32LL)
  {
    __int128 v14 = data[1];
    __int128 v85 = *data;
    __int128 v86 = v14;
  }

  else
  {
    if (!xpc_dictionary_get_remote_connection(a3))
    {
      Class = xpc_dictionary_get_value(a3, "connection");
    }

    xpc_connection_get_audit_token();
  }

  bzero(v84, 0x400uLL);
  __int128 v81 = v85;
  __int128 v82 = v86;
  sandbox_container_path_for_audit_token();
  if (!v8)
  {
LABEL_38:
    int v18 = 0;
    goto LABEL_39;
  }

  if ((_CFPrefsReadOnly() & 1) == 0)
  {
    if (xpc_dictionary_get_BOOL(a3, "CFPreferencesUseCorrectOwner"))
    {
      CFIndex Length = CFStringGetLength(self->_userName);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      size_t v21 = MaximumSizeForEncoding + 1;
      MEMORY[0x1895F8858](MaximumSizeForEncoding, v22);
      int v24 = (char *)&v65 - v23;
      bzero((char *)&v65 - v23, v21);
      CFStringGetCString(self->_userName, v24, v21, 0x8000100u);
      BOOL v25 = getpwnam(v24);
      if (v25)
      {
        uint64_t pw_uid = v25->pw_uid;
        uint64_t pw_gid = v25->pw_gid;
LABEL_34:
        if ((_DWORD)pw_uid != self->_lastEuid || (_DWORD)pw_gid != self->_lastEgid) {
          -[CFPDSource syncWriteToDisk](self, "syncWriteToDisk");
        }
        self->_uint64_t lastEuid = pw_uid;
        self->_unsigned int lastEgid = pw_gid;
        if (self->_parentFD == -1)
        {
          int v18 = -[CFPDSource cacheFileInfoForWriting:euid:egid:didCreate:]( self,  "cacheFileInfoForWriting:euid:egid:didCreate:",  1LL,  pw_uid,  pw_gid,  &v72);
          goto LABEL_39;
        }

        goto LABEL_38;
      }

      __int128 v28 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[CFPDSource acceptMessage:].cold.4();
      }
    }

    uint64_t pw_uid = xpc_connection_get_euid(remote_connection);
    uint64_t pw_gid = xpc_connection_get_egid(remote_connection);
    goto LABEL_34;
  }

  int v18 = 8;
LABEL_39:
  v71 = 0LL;
  mode_t v70 = 0;
  uid_t v69 = 0;
  BOOL v29 = xpc_dictionary_get_BOOL(a3, "ValidatePlist");
  if ((v8 & 1) == 0)
  {
    BOOL v34 = v29;
    if (self->_plist
      || self->_parentFD != -1
      || (-[CFPDSource cacheFileInfo](self, "cacheFileInfo"), self->_parentFD != -1))
    {
      if (!_os_feature_enabled_impl()
        || CFStringFind(self->_domain, @"com.apple.", 0LL).location == -1)
      {
        goto LABEL_56;
      }

      if (acceptMessage__onceToken != -1) {
        dispatch_once(&acceptMessage__onceToken, &__block_literal_global_114);
      }
      if (acceptMessage___CFMKBDeviceUnlockedSinceBoot && !acceptMessage___CFMKBDeviceUnlockedSinceBoot())
      {
        actualPath = self->_actualPath;
        *(void *)&__int128 v81 = MEMORY[0x1895F87A8];
        *((void *)&v81 + 1) = 3221225472LL;
        *(void *)&__int128 v82 = __ERROR_LOG_PREUNLOCK_ACCESS_block_invoke;
        *((void *)&v82 + 1) = &__block_descriptor_40_e29_v64__0i8_12_20_28_36_44_52B60l;
        v83 = (CFPDSource *)actualPath;
        _extractCFPDBits(a3, 0LL, self, (uint64_t)&v81);
        if (v34) {
          goto LABEL_58;
        }
      }

      else
      {
LABEL_56:
        if (v34) {
          goto LABEL_58;
        }
      }

      if (!self->_plist)
      {
        int v43 = -[CFPDSource openPropertyListWithoutDrainingPendingChangesOrValidatingPlistAndReturnFileUID:andMode:]( (os_unfair_lock_s *)self,  &v69,  &v70);
        if (v43 != -1)
        {
          int v32 = v43;
          id v31 = 0LL;
LABEL_59:
          BOOL v30 = v32 != -1 || v31 != 0LL;
          if (v18) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
      }

uint64_t (*__28__CFPDSource_acceptMessage___block_invoke())(void)
{
  v0 = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 256);
  int result = (uint64_t (*)(void))dlsym(v0, "MKBDeviceUnlockedSinceBoot");
  acceptMessage___CFMKBDeviceUnlockedSinceBoot = result;
  return result;
}

void __28__CFPDSource_acceptMessage___block_invoke_2()
{
  v0 = (os_log_s *)_CFPrefsDaemonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __28__CFPDSource_acceptMessage___block_invoke_2_cold_1();
  }
}

uint64_t __28__CFPDSource_acceptMessage___block_invoke_122(uint64_t a1, int a2, xpc_object_t value)
{
  return 1LL;
}

- (uint64_t)closeFileDescriptors
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 142) & 2) == 0)
    {
      int v2 = *(_DWORD *)(result + 128);
      if ((v2 & 0x80000000) == 0) {
        close(v2);
      }
      *(_DWORD *)(v1 + 128) = -1;
      free(*(void **)(v1 + 64));
      *(void *)(v1 + 64) = 0LL;
    }

    int result = *(unsigned int *)(v1 + 132);
    if ((result & 0x80000000) == 0) {
      int result = close(result);
    }
    *(_DWORD *)(v1 + 132) = -1;
  }

  return result;
}

- (void)processEndOfMessageIntendingToRemoveSource:(BOOL *)a3 replacingWithTombstone:(id *)a4
{
  v22[6] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_assert_owner(&self->_lock);
  if (*a3)
  {
    if ((*((_BYTE *)self + 142) & 0x20) != 0 || !-[CFPDSource isEmpty]((uint64_t)self))
    {
      *a3 = 0;
    }

    else
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke;
      v22[3] = &unk_1899ED710;
      v22[4] = self;
      v22[5] = a4;
      -[CFPDSource observingConnectionsLockedSync:]((os_unfair_lock_s *)self, (uint64_t)v22);
    }
  }

  if (self->_actualPath)
  {
    if (_CFPrefsCurrentProcessIsCFPrefsD())
    {
      size_t v8 = strlen(self->_actualPath);
      uint64_t v9 = CFURLCreateFromFileSystemRepresentation( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const UInt8 *)self->_actualPath,  v8,  0);
      if (v9)
      {
        uint64_t v10 = v9;
        PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9);
        CFRelease(v10);
        if (PathComponent)
        {
          CFStringRef v12 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
          CFRelease(PathComponent);
          if (v12)
          {
            BOOL v13 = *a3;
            os_unfair_lock_assert_owner(p_lock);
            if (v13)
            {
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 0;
                Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v12);
                if (Value)
                {
                  char v15 = Value;
                  v23.size_t length = CFArrayGetCount(Value);
                  v23.location = 0LL;
                  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v15, v23, self);
                  if (FirstIndexOfValue != -1) {
                    CFArrayRemoveValueAtIndex(v15, FirstIndexOfValue);
                  }
                  if (!CFArrayGetCount(v15))
                  {
                    CFDictionaryRemoveValue((CFMutableDictionaryRef)dirWatcherTargets, v12);
                    uint64_t v17 = (const __CFArray *)watchedDirs;
                    v24.size_t length = CFArrayGetCount((CFArrayRef)watchedDirs);
                    v24.location = 0LL;
                    CFIndex v18 = CFArrayGetFirstIndexOfValue(v17, v24, v12);
                    if (v18 != -1)
                    {
                      CFArrayRemoveValueAtIndex((CFMutableArrayRef)watchedDirs, v18);
LABEL_34:
                      os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
                      os_unfair_lock_assert_not_owner((os_unfair_lock_t)&dirWatcherLock);
                      dispatch_async((dispatch_queue_t)fseventsQueue, &__block_literal_global_366);
                      goto LABEL_31;
                    }
                  }
                }
              }
            }

            else
            {
              if (initializeFSEvents_predicate != -1) {
                dispatch_once(&initializeFSEvents_predicate, &__block_literal_global_357);
              }
              if (_CFPrefsWatchForDeletionOfDirectory_onceToken != -1) {
                dispatch_once(&_CFPrefsWatchForDeletionOfDirectory_onceToken, &__block_literal_global_355);
              }
              int v19 = _internString(v12);
              os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
              if (!self->_watchingParentDirectory)
              {
                self->_watchingParentDirectory = 1;
                Mutable = (void *)CFDictionaryGetValue((CFDictionaryRef)dirWatcherTargets, v19);
                if (!Mutable)
                {
                  Mutable = CFArrayCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeArrayCallBacks);
                  if (Mutable)
                  {
                    CFDictionarySetValue((CFMutableDictionaryRef)dirWatcherTargets, v19, Mutable);
                    CFRelease(Mutable);
                  }
                }

                v25.size_t length = CFArrayGetCount((CFArrayRef)Mutable);
                v25.location = 0LL;
                if (!CFArrayContainsValue((CFArrayRef)Mutable, v25, self)) {
                  CFArrayAppendValue((CFMutableArrayRef)Mutable, self);
                }
                size_t v21 = (const __CFArray *)watchedDirs;
                v26.size_t length = CFArrayGetCount((CFArrayRef)watchedDirs);
                v26.location = 0LL;
                if (!CFArrayContainsValue(v21, v26, v19))
                {
                  CFArrayAppendValue((CFMutableArrayRef)watchedDirs, v19);
                  goto LABEL_34;
                }
              }
            }

            os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
LABEL_31:
            CFRelease(v12);
          }
        }
      }
    }
  }

os_unfair_lock_s *__80__CFPDSource_processEndOfMessageIntendingToRemoveSource_replacingWithTombstone___block_invoke( uint64_t a1)
{
  int result = -[CFPDSource hasObservers](*(os_unfair_lock_s **)(a1 + 32));
  if ((_DWORD)result)
  {
    **(void **)(a1 + 40) =  -[CFPDObserverOnlyTombstone initMatchingSource:]( objc_alloc(&OBJC_CLASS___CFPDObserverOnlyTombstone),  "initMatchingSource:",  *(void *)(a1 + 32));
    return (os_unfair_lock_s *)objc_msgSend( **(id **)(a1 + 40),  "alreadyLocked_transferObservingConnectionsFromSource:",  *(void *)(a1 + 32));
  }

  return result;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  observingConnections = self->_observingConnections;
  if (observingConnections) {
    CFRelease(observingConnections);
  }
  pendingChangesQueue = self->_pendingChangesQueue;
  if (pendingChangesQueue) {
    xpc_release(pendingChangesQueue);
  }

  free(self->_actualPath);
  free(self->_fileName);
  int parentFD = self->_parentFD;
  if ((parentFD & 0x80000000) == 0) {
    close(parentFD);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CFPDSource;
  -[CFPDSource dealloc](&v6, sel_dealloc);
}

- (void)endHandlingRequest
{
}

- (void)cacheFileInfoForWriting:(os_log_t)log euid:egid:didCreate:.cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_180A4C000, log, OS_LOG_TYPE_DEBUG, "Simulating ENOSPC in cacheFileInfo for testing", v1, 2u);
}

- (void)cacheFileInfoForWriting:(uint64_t)a1 euid:(os_log_s *)a2 egid:didCreate:.cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v3 = __error();
  strerror(*v3);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_31(&dword_180A4C000, a2, v4, "Couldn't get real path for %{private}s due to %{public}s", v5);
  OUTLINED_FUNCTION_6_3();
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.3()
{
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.4()
{
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.5()
{
}

- (void)cacheFileInfoForWriting:euid:egid:didCreate:.cold.6()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_11();
  __int16 v3 = 1024;
  int v4 = v0;
  OUTLINED_FUNCTION_13( &dword_180A4C000,  v1,  (uint64_t)v1,  "Couldn't open parent path %{private}s due to %{darwin.errno}d",  v2);
  OUTLINED_FUNCTION_1_21();
}

- (void)cacheFileInfoForWriting:(uint64_t)a3 euid:(uint64_t)a4 egid:(uint64_t)a5 didCreate:(uint64_t)a6 .cold.7( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)shouldStayDirtyAfterOpenForWritingFailureWithErrno:(os_log_s *)a3 .cold.1( int a1,  int __errnum,  os_log_s *a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  strerror(__errnum);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_31( &dword_180A4C000,  a3,  v4,  "cfprefsd couldn't open temporary path appropriate for %{private}s for writing due to %{public}s. Cancelling atte mpt to save preferences",  v5);
  OUTLINED_FUNCTION_6_3();
}

- (void)createDiskWrite
{
}

- (void)setPlist:owner:mode:.cold.1()
{
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.1()
{
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_31( &dword_180A4C000,  v0,  v1,  "Validation of plist read from disk failed. DELETING file. {%@ %@}",  v2);
  OUTLINED_FUNCTION_1_21();
}

- (void)copyPropertyListWithoutDrainingPendingChangesValidatingPlist:andReturnFileUID:andMode:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_0_31( &dword_180A4C000,  v0,  v1,  "Validation of pre-existing plist failed. Clearing cache and re-reading from disk. {%@ %@}",  v2);
  OUTLINED_FUNCTION_1_21();
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_cold_1()
{
}

void __100__CFPDSource_copyPropertyListWithoutDrainingPendingChangesValidatingPlist_andReturnFileUID_andMode___block_invoke_59_cold_1()
{
}

void __64__CFPDSource_asyncNotifyObserversOfWriteFromConnection_message___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __33__CFPDSource_drainPendingChanges__block_invoke_cold_1()
{
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.1()
{
  __assert_rtn( "-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]",  "CFPDSource.m",  1819,  "count % CHANGE_QUEUE_TUPLE_COUNT == 0");
}

- (void)enqueueNewKey:value:encoding:inBatch:fromMessage:.cold.2()
{
  __assert_rtn( "-[CFPDSource enqueueNewKey:value:encoding:inBatch:fromMessage:]",  "CFPDSource.m",  1801,  "xpc_get_type(key) == XPC_TYPE_STRING");
}

- (void)validateSandboxForWrite:(uint64_t)a3 containerPath:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForWrite:(uint64_t)a3 containerPath:.cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.1()
{
}

- (void)validateSandboxForRead:containerPath:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_31( &dword_180A4C000,  v0,  (uint64_t)v0,  "unable to validate sandbox access of message %{private}s in container %{private}s due to no plist path, conservative ly assuming not allowed.",  v1);
  OUTLINED_FUNCTION_1_21();
}

- (void)validateSandboxForRead:(uint64_t)a3 containerPath:.cold.3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:(uint64_t)a3 containerPath:.cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)validateSandboxForRead:containerPath:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_0_31( &dword_180A4C000,  v0,  (uint64_t)v0,  "Initial attempt to validate sandbox access of message %{private}s in container %{private}s due to no plist path, but we recovered successfully by recalculating the path.",  v1);
  OUTLINED_FUNCTION_1_21();
}

- (void)validatePOSIXPermissionsForMessage:(uint64_t)a3 accessType:fileUID:mode:fullyValidated:.cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)setObserved:(uint64_t)a3 bySenderOfMessage:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __44__CFPDSource_setObserved_bySenderOfMessage___block_invoke_2_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.1()
{
}

- (void)acceptMessage:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

- (void)acceptMessage:.cold.3()
{
  __assert_rtn("-[CFPDSource acceptMessage:]", "CFPDSource.m", 2755, "validity != _CFPrefsInvalidValidity");
}

- (void)acceptMessage:.cold.4()
{
}

- (void)acceptMessage:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

void __28__CFPDSource_acceptMessage___block_invoke_2_cold_1()
{
}

@end
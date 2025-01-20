@interface CFPrefsPlistSource
- (BOOL)_logLoudlyAboutSettingKey:(BOOL)result;
- (BOOL)_shouldEnableDirectMode;
- (BOOL)attachAccessTokenToMessage:(int)a3 accessType:;
- (BOOL)isByHost;
- (BOOL)isDirectModeEnabled;
- (BOOL)isVolatile;
- (BOOL)synchronize;
- (CFPrefsPlistSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)container;
- (__CFString)domainIdentifier;
- (__CFString)userIdentifier;
- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)createSynchronizeMessage;
- (int)alreadylocked_updateObservingRemoteChanges;
- (int64_t)alreadylocked_generationCount;
- (int64_t)generationCount;
- (uint64_t)alreadylocked_requestNewData;
- (uint64_t)handleErrorReply:(void *)a3 toMessage:(const void *)a4 settingKeys:(const void *)a5 toValues:(CFIndex)a6 count:(int)a7 retryCount:(uint64_t)a8 retryContinuation:;
- (uint64_t)handleErrorReply:(void *)a3 toMessage:(int)a4 retryCount:(uint64_t)a5 retryContinuation:;
- (uint64_t)sendMessageSettingValues:(__objc2_class *)a3 forKeys:(uint64_t)a4 count:;
- (uint64_t)volatilizeIfInvalidHomeDir;
- (void)_sharedCleanup;
- (void)addPIDImpersonationIfNecessary:(void *)a1;
- (void)alreadylocked_clearCache;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)copyValueForKey:(__CFString *)a3;
- (void)createSynchronizeMessage;
- (void)dealloc;
- (void)goReadOnlyAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:;
- (void)goVolatileAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:;
- (void)handlePossibleOversizedMessage:(const void *)a3 forWritingKeys:(const void *)a4 values:(CFIndex)a5 count:;
- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7;
- (void)requestPlistValidation;
- (void)sendFullyPreparedMessage:(xpc_connection_t)connection toConnection:(uint64_t)a4 settingValues:(uint64_t)a5 forKeys:(uint64_t)a6 count:(int)a7 retryCount:;
- (void)sendRequestNewDataMessage:(uint64_t)a3 toConnection:(uint64_t)a4 retryCount:(BOOL *)a5 error:;
- (void)setAccessRestricted:(BOOL)a3;
- (void)setBackupDisabled:(BOOL)a3;
- (void)setContainer:(uint64_t)a1;
- (void)setDaemonCacheEnabled:(BOOL)a3;
- (void)setDomainIdentifier:(uint64_t)a1;
- (void)setFileProtectionClass:(int)a3;
- (void)setUserIdentifier:(uint64_t)a1;
- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3;
- (void)writeFailedForKeys:(const __CFString *)a3 values:(uint64_t)a4 count:;
@end

@implementation CFPrefsPlistSource

- (__CFString)userIdentifier
{
  return self->userIdentifier;
}

- (void)setUserIdentifier:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(const __CFString **)(a1 + 64);
    if (v4 != cf1)
    {
      if (cf1)
      {
        v5 = @"kCFPreferencesAnyUser";
        if (CFEqual(cf1, @"kCFPreferencesAnyUser")
          || (v5 = @"kCFPreferencesCurrentUser", CFEqual(cf1, @"kCFPreferencesCurrentUser")))
        {
          *(void *)(a1 + 64) = v5;
          if (!v4) {
            return;
          }
        }

        else
        {
          *(void *)(a1 + 64) = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
          if (!v4) {
            return;
          }
        }
      }

      else
      {
        *(void *)(a1 + 64) = 0LL;
        if (!v4) {
          return;
        }
      }

      CFRelease(v4);
    }
  }

- (__CFString)domainIdentifier
{
  return self->domainIdentifier;
}

- (void)setDomainIdentifier:(uint64_t)a1
{
  if (a1)
  {
    if (cf1)
    {
      if (CFEqual(cf1, @"kCFPreferencesCurrentApplication")) {
        -[CFPrefsPlistSource setDomainIdentifier:].cold.1();
      }
      v4 = *(__CFString **)(a1 + 72);
      if (v4 != cf1)
      {
        CFTypeRef v5 = @"kCFPreferencesAnyApplication" == cf1
          || (__CFString *)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication") == cf1
           ? CFRetain(cf1)
           : _CFStringCopyBundleUnloadingProtectedString((unint64_t *)cf1);
        *(void *)(a1 + 72) = v5;
        if (v4) {
          goto LABEL_12;
        }
      }
    }

    else
    {
      v4 = *(__CFString **)(a1 + 72);
      if (v4)
      {
        *(void *)(a1 + 72) = 0LL;
LABEL_12:
        CFRelease(v4);
      }
    }
  }

- (void)setContainer:(uint64_t)a1
{
  if (a1)
  {
    CFTypeRef v3 = *(CFTypeRef *)(a1 + 80);
    if (v3 != cf)
    {
      if (cf) {
        CFTypeRef v4 = CFRetain(cf);
      }
      else {
        CFTypeRef v4 = 0LL;
      }
      *(void *)(a1 + 80) = v4;
      if (v3) {
        CFRelease(v3);
      }
    }
  }

- (__CFString)container
{
  return self->container;
}

- (BOOL)isByHost
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isByHost);
  return v2 & 1;
}

- (CFPrefsPlistSource)initWithDomain:(__CFString *)a3 user:(__CFString *)a4 byHost:(BOOL)a5 containerPath:(__CFString *)a6 containingPreferences:(id)a7
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CFPrefsPlistSource;
  v11 = -[CFPrefsSource initWithContainingPreferences:](&v14, sel_initWithContainingPreferences_, a7);
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    -[CFPrefsPlistSource setDomainIdentifier:]((uint64_t)v11, a3);
    -[CFPrefsPlistSource setUserIdentifier:](v12, a4);
    -[CFPrefsPlistSource setContainer:](v12, a6);
    atomic_store(a5, (unsigned __int8 *)(v12 + 104));
    atomic_store(0LL, (unint64_t *)(v12 + 40));
    atomic_store(0, (unsigned int *)(v12 + 48));
  }

  return (CFPrefsPlistSource *)v12;
}

- (void)setBackupDisabled:(BOOL)a3
{
}

- (void)setFileProtectionClass:(int)a3
{
}

- (void)setAccessRestricted:(BOOL)a3
{
}

- (void)setDaemonCacheEnabled:(BOOL)a3
{
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  return (void *)_copyValueForKey((uint64_t)self, a3);
}

- (void)copyValueForKey:(__CFString *)a3
{
  CFTypeRef v5 = _copyValueForKey((uint64_t)self, a3);
  os_unfair_lock_unlock(&self->super._lock);
  return (void *)v5;
}

- (__CFArray)alreadylocked_copyKeyList
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (byte_18C536D9D) {
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v11 = __alreadylocked_requestNewDataIfStale_block_invoke;
  uint64_t v12 = &unk_18999B4C8;
  v13 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    CFTypeRef v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v11((uint64_t)v10);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CFPrefsPlistSource;
  return -[CFPrefsSource alreadylocked_copyKeyList](&v9, sel_alreadylocked_copyKeyList);
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (byte_18C536D9D) {
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  }
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v16 = __alreadylocked_requestNewDataIfStale_block_invoke;
  v17 = &unk_18999B4C8;
  v18 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    CFTypeRef v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v16((uint64_t)v15);
    }
  }

  if (atomic_load((unint64_t *)&self->_locallySetDict))
  {
    dict = self->super._dict;
    if (dict) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, dict);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }
    CFMutableDictionaryRef v11 = MutableCopy;
    os_unfair_lock_lock(&locallySetDictLock);
    uint64_t v12 = (const __CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)locallySetValueOverlayMergeFunc, v11);
    os_unfair_lock_unlock(&locallySetDictLock);
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___CFPrefsPlistSource;
    return -[CFPrefsSource alreadylocked_copyDictionary](&v14, sel_alreadylocked_copyDictionary);
  }

  return v11;
}

- (BOOL)_logLoudlyAboutSettingKey:(BOOL)result
{
  if (result)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(result + 105));
    if ((v2 & 1) != 0) {
      return 0LL;
    }
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)(result + 106));
    if ((v3 & 1) != 0) {
      return 0LL;
    }
    else {
      return CFEqual(cf1, @"AppleLanguages") || CFEqual(cf1, @"AppleLocale") != 0;
    }
  }

  return result;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (_CFPrefsTestingFlags) {
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  }
  v10 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
  if (!v10)
  {
    BOOL v13 = 1;
LABEL_8:
    char cf = v13;
    goto LABEL_9;
  }

  unsigned int v11 = atomic_load(v10);
  unsigned int v12 = atomic_load((unsigned int *)&sentinelGeneration);
  if (v11 != v12)
  {
    unsigned int v14 = atomic_load(&self->super.lastKnownShmemState);
    BOOL v13 = v11 != v14;
    goto LABEL_8;
  }

  char cf = 0;
LABEL_9:
  if (a5 < 1)
  {
LABEL_42:
    BOOL cfb = 0;
    goto LABEL_71;
  }

  char v15 = 0;
  int v16 = 0;
  uint64_t v17 = 0LL;
  do
  {
    v18 = a4[v17];
    if (!_CFPrefsTestingFlags)
    {
      uint64_t v19 = a3[v17];
      unint64_t v20 = atomic_load((unint64_t *)&self->_locallySetDict);
      BOOL v26 = v20 == 0;
      char v21 = cf;
      if (!v26) {
        char v21 = 1;
      }
      if ((v21 & 1) != 0)
      {
LABEL_17:
        if (!a4[v17]) {
          goto LABEL_19;
        }
LABEL_18:
        v16 |= -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((BOOL)self, v18);
        char v15 = 1;
        goto LABEL_19;
      }

      dict = self->super._dict;
      if (dict)
      {
        Value = CFDictionaryGetValue(dict, a4[v17]);
        BOOL v24 = Value != 0LL;
        BOOL v25 = v19 != 0LL;
        if (Value) {
          BOOL v26 = v19 == 0LL;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          if (!CFEqual(Value, v19)) {
            goto LABEL_17;
          }
LABEL_32:
          v27 = (os_log_s *)_CFPrefsClientLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
            _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
            v29 = (os_log_s *)_CFPrefsClientLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v56 = (uint64_t)v28;
              __int16 v57 = 2114;
              v58 = v18;
              _os_log_debug_impl( &dword_180A4C000,  v29,  OS_LOG_TYPE_DEBUG,  "%{public}@ skipping setting already-present value for key %{public}@",  buf,  0x16u);
            }

            _CFSetTSD(0xFu, 0LL, 0LL);
            CFRelease(v28);
          }

          a4[v17] = 0LL;
          goto LABEL_19;
        }
      }

      else
      {
        BOOL v24 = 0;
        BOOL v25 = v19 != 0LL;
      }

      if (v24 || !self->super._dict || v25) {
        goto LABEL_17;
      }
      goto LABEL_32;
    }

    if (a4[v17]) {
      goto LABEL_18;
    }
LABEL_19:
    ++v17;
  }

  while (a5 != v17);
  if ((v15 & 1) == 0) {
    goto LABEL_42;
  }
  v30 = (os_log_s *)_CFPrefsClientLog();
  if (((os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG) | v16) & 1) != 0)
  {
    cfa = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    v31 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if ((v16 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_44:
      v33 = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }

    else
    {
      Mutable = 0LL;
      if ((v16 & 1) != 0) {
        goto LABEL_44;
      }
LABEL_41:
      v33 = 0LL;
    }

    int64_t v34 = a5;
    v35 = (const void **)a4;
    v36 = a3;
    do
    {
      if (*v35)
      {
        if (v33 && -[CFPrefsPlistSource _logLoudlyAboutSettingKey:]((BOOL)self, *v35))
        {
          if (*v36) {
            v37 = (const __CFString *)*v36;
          }
          else {
            v37 = @"nil";
          }
          CFDictionarySetValue(v33, *v35, v37);
        }

        else if (Mutable)
        {
          if (*v36) {
            v38 = (const __CFString *)*v36;
          }
          else {
            v38 = @"nil";
          }
          CFDictionarySetValue(Mutable, *v35, v38);
        }
      }

      ++v36;
      ++v35;
      --v34;
    }

    while (v34);
    v39 = (void *)MEMORY[0x186E03CAC]();
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
    if (Mutable)
    {
      if (CFDictionaryGetCount(Mutable) >= 1)
      {
        -[__CFDictionary description](Mutable, "description");
        v40 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          -[CFPrefsPlistSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.1();
        }
      }

      CFRelease(Mutable);
    }

    if (v33)
    {
      if (CFDictionaryGetCount(v33) >= 1)
      {
        uint64_t v41 = -[__CFDictionary description](v33, "description");
        v42 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v56 = v41;
          __int16 v57 = 2114;
          v58 = cfa;
          _os_log_impl(&dword_180A4C000, v42, OS_LOG_TYPE_DEFAULT, "setting %{public}@ in %{public}@", buf, 0x16u);
        }
      }

      CFRelease(v33);
    }

    CFRelease(cfa);
    _CFSetTSD(0xFu, 0LL, 0LL);
    objc_autoreleasePoolPop(v39);
  }

  BOOL cfb = -[CFPrefsPlistSource sendMessageSettingValues:forKeys:count:]( (uint64_t)self,  (__objc2_class ***)a3,  (__objc2_class ***)a4,  a5) != 1;
LABEL_71:
  unint64_t v43 = atomic_load((unint64_t *)&self->_locallySetDict);
  if (!v43 && _CFPrefsReadOnly())
  {
    os_unfair_lock_lock(&locallySetDictLock);
    atomic_store( (unint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks),  (unint64_t *)&self->_locallySetDict);
    os_unfair_lock_unlock(&locallySetDictLock);
  }

  if (a5 >= 1)
  {
    while (2)
    {
      v44 = *a4;
      if (!*a4) {
        goto LABEL_85;
      }
      v45 = (const __CFString *)*a3;
      v46 = self->super._dict;
      if (*a3)
      {
        if (!v46)
        {
          v46 = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          self->super._dict = v46;
        }

        CFDictionarySetValue(v46, v44, v45);
      }

      else
      {
        if (v46) {
          CFDictionaryRemoveValue(v46, *a4);
        }
        unint64_t v48 = atomic_load((unint64_t *)&self->_locallySetDict);
        v45 = @"MagicRemovedValue";
        if (!v48)
        {
LABEL_85:
          ++a3;
          ++a4;
          if (!--a5) {
            goto LABEL_86;
          }
          continue;
        }
      }

      break;
    }

    os_unfair_lock_lock(&locallySetDictLock);
    v49 = (__CFDictionary *)atomic_load((unint64_t *)&self->_locallySetDict);
    CFDictionarySetValue(v49, v44, v45);
    os_unfair_lock_unlock(&locallySetDictLock);
    goto LABEL_85;
  }

- (uint64_t)sendMessageSettingValues:(__objc2_class *)a3 forKeys:(uint64_t)a4 count:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (result)
  {
    unsigned int v7 = (unsigned __int8 *)result;
    if ((_CFPrefsReadOnly() & 1) != 0) {
      return 0LL;
    }
    unsigned __int8 v8 = atomic_load(v7 + 105);
    if ((v8 & 1) != 0 || (unsigned __int8 v9 = atomic_load(v7 + 106), (v9 & 1) != 0))
    {
      char v15 = (const void *)[v7 copyOSLogDescription];
      if (a4 >= 1)
      {
        do
        {
          if (*a3)
          {
            unsigned __int8 v16 = atomic_load(v7 + 106);
            if ((v16 & 1) != 0)
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
              v18 = (os_log_s *)_CFPrefsClientLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                char v21 = *a2;
                v22 = *a3;
                *(_DWORD *)buf = 138478339;
                *(void *)&uint8_t buf[4] = v21;
                __int16 v25 = 2113;
                BOOL v26 = v22;
                __int16 v27 = 2114;
                v28 = v15;
                _os_log_error_impl( &dword_180A4C000,  v18,  OS_LOG_TYPE_ERROR,  "attempt to set %{private}@ for key in %{private}@ in read-only (due to a previously logged write error) preferences domain %{public}@",  buf,  0x20u);
              }
            }

            else
            {
              _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
              uint64_t v17 = (os_log_s *)_CFPrefsClientLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                uint64_t v19 = *a2;
                unint64_t v20 = *a3;
                *(_DWORD *)buf = 138478339;
                *(void *)&uint8_t buf[4] = v19;
                __int16 v25 = 2113;
                BOOL v26 = v20;
                __int16 v27 = 2114;
                v28 = v15;
                _os_log_error_impl( &dword_180A4C000,  v17,  OS_LOG_TYPE_ERROR,  "attempt to set %{private}@ for key in %{private}@ in non-persistent preferences domain %{public}@",  buf,  0x20u);
              }
            }

            _CFSetTSD(0xFu, 0LL, 0LL);
          }

          ++a2;
          ++a3;
          --a4;
        }

        while (a4);
      }

      CFRelease(v15);
      return 2LL;
    }

    else
    {
      v10 = (void *)[v7 createSynchronizeMessage];
      if (v10)
      {
        unsigned int v11 = v10;
        *(void *)buf = 0LL;
        int v12 = _CFPrefsEncodeKeyValuePairsIntoMessage(v10, a3, a2, a4, buf);
        int v13 = _CFPrefsDomainSizeAcceptabilityForByteCount(*(unint64_t *)buf);
        -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:]( v7,  v13,  (const void **)a3,  (const void **)a2,  a4);
        unsigned __int8 v14 = atomic_load(v7 + 112);
        if ((v14 & 1) == 0 || _CFPrefsDirectMode() || (unsigned __int8 v23 = atomic_load(v7 + 113), (v23 & 1) != 0))
        {
          if (((v12 ^ 1) & 1) == 0 && -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:]((BOOL)v7, v11, 1))
          {
            -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](v7, v11);
            -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:]( (uint64_t)v7,  (uint64_t)v11,  0LL,  (uint64_t)a2,  (uint64_t)a3,  a4,  0);
          }
        }

        xpc_release(v11);
        return 0LL;
      }

      return 3LL;
    }
  }

  return result;
}

- (id)createSynchronizeMessage
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) != 0) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned int v5 = -[CFPrefsPlistSource domainIdentifier](self, "domainIdentifier");
  if ((_CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesDomain", (__objc2_class **)v5, 0LL) & 1) == 0)
  {
    xpc_release(v4);
    return 0LL;
  }

  os_unfair_lock_lock_with_options();
  groupContainersForCurrentUser = self->super._containingPreferences->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser && CFSetContainsValue(groupContainersForCurrentUser, v5))
  {
    bzero(buffer, 0x400uLL);
    if (CFStringGetCString(v5, buffer, 1024LL, 0x8000100u))
    {
      uint64_t v25 = 1LL;
      unsigned int v7 = (void *)container_create_or_lookup_app_group_path_by_app_group_identifier();
      if (v7)
      {
        free(v7);
      }

      else
      {
        unsigned __int8 v9 = (os_log_s *)_CFPrefsDaemonLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource createSynchronizeMessage].cold.1((uint64_t)buffer, (uint64_t)&v25, v9);
        }
      }
    }

    CFSetRemoveValue(self->super._containingPreferences->_groupContainersForCurrentUser, v5);
    if (!CFSetGetCount(self->super._containingPreferences->_groupContainersForCurrentUser))
    {
      CFRelease(self->super._containingPreferences->_groupContainersForCurrentUser);
      self->super._containingPreferences->_groupContainersForCurrentUser = 0LL;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&groupContainersLock);
  CacheStringForBundleID = (__objc2_class **)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesHostBundleIdentifier", CacheStringForBundleID, 0LL);
  if (CFEqual(v5, CacheStringForBundleID)) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesCurrentApplicationDomain", 1);
  }
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_isByHost);
  if ((v11 & 1) != 0) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsByHost", 1);
  }
  xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 1LL);
  if (-[CFPrefsSource managed](self, "managed")) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesIsManaged", 1);
  }
  int v12 = -[CFPrefsPlistSource userIdentifier](self, "userIdentifier", v25);
  CFStringRef Copy = @"kCFPreferencesAnyUser";
  if (CFEqual(@"kCFPreferencesAnyUser", v12)) {
    goto LABEL_32;
  }
  _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesUser", (__objc2_class **)v12, 0LL);
  if (!CFEqual(@"kCFPreferencesCurrentUser", @"kCFPreferencesCurrentUser"))
  {
    if (CFEqual(@"kCFPreferencesCurrentUser", @"kCFPreferencesAnyUser")) {
      goto LABEL_28;
    }
    CFStringRef v14 = CFCopyUserName();
    int v15 = CFEqual(@"kCFPreferencesCurrentUser", v14);
    CFRelease(v14);
    if (!@"kCFPreferencesCurrentUser" || !v15)
    {
      CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, @"kCFPreferencesCurrentUser");
      goto LABEL_28;
    }
  }

  CFStringRef Copy = @"kCFPreferencesCurrentUser";
LABEL_28:
  if (!CFEqual(Copy, v12)) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesUseCorrectOwner", 1);
  }
  if (Copy) {
    CFRelease(Copy);
  }
LABEL_32:
  unsigned __int8 v16 = -[CFPrefsPlistSource container](self, "container");
  if (v16)
  {
    uint64_t v17 = (__objc2_class **)v16;
    if (CFStringGetLength(v16) >= 1) {
      _CFPrefsEncodeValueIntoMessage(v4, "CFPreferencesContainer", v17, 0LL);
    }
  }

  if (_CFPrefsSynchronizeIsSynchronous
    || (unsigned __int8 v24 = atomic_load((unsigned __int8 *)&self->_avoidsDaemonCache), (v24 & 1) != 0)
    || _CFPrefsTestingFlags
    || byte_18C536D9E && (arc4random() & 1) == 0)
  {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesShouldWriteSynchronously", 1);
    xpc_dictionary_set_BOOL(v4, "CFPreferencesAvoidCache", 1);
  }

  unsigned __int8 v18 = atomic_load((unsigned __int8 *)&self->_disableBackup);
  if ((v18 & 1) != 0) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesDisableBackups", 1);
  }
  if (atomic_load((unsigned int *)&self->_fileProtectionClass))
  {
    signed int v20 = atomic_load((unsigned int *)&self->_fileProtectionClass);
    xpc_dictionary_set_int64(v4, "CFPreferencesFileProtectionClass", v20);
  }

  unsigned __int8 v21 = atomic_load((unsigned __int8 *)&self->_restrictedAccess);
  if ((v21 & 1) != 0) {
    xpc_dictionary_set_BOOL(v4, "CFPreferencesRestrictedReadability", 1);
  }
  if (byte_18C536D9F) {
    xpc_dictionary_set_BOOL(v4, "kCFPreferencesTestingSimulateSlowFilesystem", 1);
  }
  if (atomic_load((unsigned int *)&unk_18C536DA8))
  {
    signed int v23 = atomic_load((unsigned int *)&unk_18C536DA8);
    xpc_dictionary_set_int64(v4, "kCFPreferencesTestingSimulateOutOfDiskSpace", v23);
  }

  return v4;
}

- (void)writeFailedForKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    uint64_t v4 = a4;
    if (a4 >= 1)
    {
      do
      {
        unsigned __int8 v8 = *a2;
        if (*a2)
        {
          atomic_store(1u, (unsigned __int8 *)(a1 + 110));
          os_unfair_lock_lock(&locallySetDictLock);
          if (!atomic_load((unint64_t *)(a1 + 88))) {
            atomic_store( (unint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks),  (unint64_t *)(a1 + 88));
          }
          v10 = (__CFDictionary *)atomic_load((unint64_t *)(a1 + 88));
          if (*a3) {
            unsigned __int8 v11 = *a3;
          }
          else {
            unsigned __int8 v11 = @"MagicRemovedValue";
          }
          CFDictionarySetValue(v10, v8, v11);
          os_unfair_lock_unlock(&locallySetDictLock);
        }

        ++a3;
        ++a2;
        --v4;
      }

      while (v4);
    }
  }

- (void)goVolatileAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 105));
  }

- (BOOL)isVolatile
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_volatile);
  return v2 & 1;
}

- (BOOL)_shouldEnableDirectMode
{
  if (result)
  {
    BOOL v1 = result;
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(result + 112));
    if ((v2 & 1) != 0 && !_CFPrefsDirectMode())
    {
      unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v1 + 113));
      return (v3 & 1) == 0;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
  if (-[CFPrefsPlistSource _shouldEnableDirectMode]((BOOL)self))
  {
    unsigned int v5 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    unsigned int v6 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsPlistSource transitionIntoDirectModeIfNeededWithRetryBlock:].cold.1();
    }
    CFRelease(v5);
    os_unfair_lock_lock(&self->super._lock);
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
    atomic_store(0, (unsigned __int8 *)&self->_byteCountLimitExceeded);
    atomic_store(1u, (unsigned __int8 *)&self->_directMode);
    os_unfair_lock_unlock(&self->super._lock);
    (*((void (**)(id))a3 + 2))(a3);
  }

- (BOOL)isDirectModeEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_directMode);
  return v2 & 1;
}

- (void)goReadOnlyAfterTryingToWriteKeys:(const __CFString *)a3 values:(uint64_t)a4 count:
{
  if (a1)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:](a1, a2, a3, a4);
    atomic_store(1u, (unsigned __int8 *)(a1 + 106));
  }

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(int)a4 retryCount:(uint64_t)a5 retryContinuation:
{
  if (result) {
    return -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]( result,  a2,  a3,  0LL,  0LL,  0LL,  a4,  a5);
  }
  return result;
}

- (uint64_t)handleErrorReply:(void *)a3 toMessage:(const void *)a4 settingKeys:(const void *)a5 toValues:(CFIndex)a6 count:(int)a7 retryCount:(uint64_t)a8 retryContinuation:
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  if (!a2) {
    -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.1();
  }
  if (a2 == (id)MEMORY[0x1895F9198])
  {
    if (!__CFProcessIsRestricted() && getenv("__CFPreferencesTestDaemon"))
    {
      v50 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.2();
      }
      abort();
    }

    uint64_t v27 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_180A4C000, v27, OS_LOG_TYPE_INFO, "cfprefsd crashed, retrying message", buf, 2u);
    }

    if (a7 <= 9)
    {
      (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
      return 1LL;
    }

    return 0LL;
  }

  uint64_t v14 = result;
  Class Class = object_getClass(a2);
  unsigned __int8 v16 = (objc_class *)MEMORY[0x1895F9250];
  if (Class != (Class)MEMORY[0x1895F9250]) {
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(a2, "CFPreferencesErrorType");
  if (int64 == 4)
  {
    string = xpc_dictionary_get_string(a2, "CFPreferencesUncanonicalizedPath");
    v38 = string;
    if (a7 >= 4)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v39 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.5();
      }
      goto LABEL_35;
    }

    if (string)
    {
      bzero(buf, 0x402uLL);
      if (dirname_r(v38, (char *)buf))
      {
        geteuid();
        getegid();
        if (_CFPrefsCreatePreferencesDirectory((const char *)buf))
        {
          _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
          v45 = (os_log_s *)_CFPrefsClientLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.9();
          }
          _CFSetTSD(0xFu, 0LL, 0LL);
          (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
          return 1LL;
        }

        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
        unint64_t v48 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = __error();
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.8( (uint64_t)buf,  v49,  (uint64_t)v52,  v48);
        }

        _CFSetTSD(0xFu, 0LL, 0LL);
      }

      else
      {
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
        v47 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.7();
        }
        _CFSetTSD(0xFu, 0LL, 0LL);
      }
    }

    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v46 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.6();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
    }
  }

  else
  {
    uint64_t v29 = xpc_dictionary_get_string(a2, "CFPreferencesAccessToken");
    v30 = v29;
    if (a7 >= 10)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v31 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:].cold.4();
      }
LABEL_35:
      _CFSetTSD(0xFu, 0LL, 0LL);
      return 0LL;
    }

    if (v29)
    {
      xpc_dictionary_set_value(a3, "CFPreferencesAccessToken", 0LL);
      v42 = strdup(v30);
      unint64_t v43 = (unint64_t *)(v14 + 96);
      while (!__ldaxr(v43))
      {
      }

      __clrex();
      free(v42);
LABEL_82:
      (*(void (**)(uint64_t, void))(a8 + 16))(a8, (a7 + 1));
      return 1LL;
    }
  }

- (void)handlePossibleOversizedMessage:(const void *)a3 forWritingKeys:(const void *)a4 values:(CFIndex)a5 count:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2 == 1)
    {
      int v12 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = (const void *)[a1 copyOSLogDescription];
        uint64_t v14 = (const void *)objc_msgSend(a1, "alreadylocked_copyDictionary");
        int v15 = -[_CFPrefsOversizedPlistDescription initWithDict:setKeys:andValues:count:]( objc_alloc(&OBJC_CLASS____CFPrefsOversizedPlistDescription),  v14,  a3,  a4,  a5);
        unsigned __int8 v16 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = 138544642;
          int v18 = v13;
          __int16 v19 = 1024;
          int v20 = 0x80000;
          __int16 v21 = 1026;
          int v22 = 0x100000;
          __int16 v23 = 2082;
          unsigned __int8 v24 = "crash";
          __int16 v25 = 2114;
          uint64_t v26 = _CFProcessNameString();
          __int16 v27 = 2112;
          v28 = v15;
          _os_log_impl( &dword_180A4C000,  v16,  OS_LOG_TYPE_INFO,  "%{public}@: Storing >= %d bytes of data in CFPreferences/NSUserDefaults. If this exceeds %{public}d, it may %{public}s. This is a bug in %{public}@ or a library it uses.\n %@",  (uint8_t *)&v17,  0x36u);
        }

        CFRelease(v13);
        if (v14) {
          CFRelease(v14);
        }
      }

      dispatch_async(MEMORY[0x1895F8AE0], &__block_literal_global_47);
    }

    else if (a2 == 2)
    {
      unsigned __int8 v9 = atomic_load(a1 + 113);
      if ((v9 & 1) != 0 || _CFPrefsDirectMode())
      {
        v10 = (const void *)[a1 copyOSLogDescription];
        unsigned __int8 v11 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          -[CFPrefsPlistSource handlePossibleOversizedMessage:forWritingKeys:values:count:].cold.1();
        }
        CFRelease(v10);
      }

      else
      {
        __CFPREFERENCES_HAS_DETECTED_THIS_APP_TRYING_TO_STORE_TOO_MUCH_DATA__(a1, a3, a4, a5);
        atomic_store(1u, a1 + 112);
      }
    }
  }

void __81__CFPrefsPlistSource_handlePossibleOversizedMessage_forWritingKeys_values_count___block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification( LocalCenter,  @"com.apple.CFPreferences.byteCountLimitReached",  0LL,  0LL,  1u);
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke()
{
  v0 = (os_log_s *)_CFPrefsClientLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1();
  }
}

- (BOOL)attachAccessTokenToMessage:(int)a3 accessType:
{
  if (result)
  {
    BOOL v3 = result;
    unint64_t v4 = atomic_load((unint64_t *)(result + 96));
    result = 1;
    if (v4 && !xpc_dictionary_get_value(xdict, "CFPreferencesAccessToken"))
    {
      unsigned int v7 = (const char *)atomic_load((unint64_t *)(v3 + 96));
      int v8 = a3 ? open(v7, 514, 384LL) : open(v7, 0);
      int v9 = v8;
      if (v8 < 0) {
        return 0;
      }
      xpc_dictionary_set_fd(xdict, "CFPreferencesAccessToken", v8);
      close(v9);
      if (byte_18C536DA4) {
        return 0;
      }
    }
  }

  return result;
}

- (void)addPIDImpersonationIfNecessary:(void *)a1
{
  if (a1)
  {
    if ((void)_CFPrefsAuditTokenToImpersonate) {
      BOOL v2 = 0;
    }
    else {
      BOOL v2 = *((void *)&_CFPrefsAuditTokenToImpersonate + 1) == 0LL;
    }
    if (!v2 || qword_18C53A0D4 != 0 || unk_18C53A0DC != 0LL)
    {
      unsigned int v6 = (const void *)objc_msgSend(a1, "domainIdentifier", 0, 0, 0, 0);
      CacheStringForBundleID = (const void *)_CFPrefsGetCacheStringForBundleID(@"kCFPreferencesCurrentApplication");
      if (CFEqual(v6, CacheStringForBundleID)) {
        xpc_dictionary_set_data(a2, "CFPreferencesAuditTokenToImpersonate", &_CFPrefsAuditTokenToImpersonate, 0x20uLL);
      }
    }
  }

- (void)sendFullyPreparedMessage:(xpc_connection_t)connection toConnection:(uint64_t)a4 settingValues:(uint64_t)a5 forKeys:(uint64_t)a6 count:(int)a7 retryCount:
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke;
    v11[3] = &unk_1899EEDD8;
    v11[4] = a2;
    v11[5] = a1;
    v11[6] = a5;
    v11[7] = a4;
    v11[8] = a6;
    int v12 = a7;
    if (connection)
    {
      __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke( (uint64_t)v11,  connection);
    }

    else
    {
      int v8 = *(void **)(a1 + 8);
      unsigned __int8 v9 = atomic_load((unsigned __int8 *)(a1 + 113));
      if ((v9 & 1) != 0)
      {
        int v10 = 2;
      }

      else if (_CFPrefsDirectMode())
      {
        int v10 = 2;
      }

      else
      {
        int v10 = 1;
      }

      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:]( v8,  v10,  [(id)a1 userIdentifier],  (uint64_t)v11);
    }
  }

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke( uint64_t a1,  xpc_connection_t connection)
{
  v14[10] = *MEMORY[0x1895F89C0];
  if (connection) {
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  }
  else {
    xpc_object_t v4 = xpc_retain(MEMORY[0x1895F91A0]);
  }
  unsigned int v5 = v4;
  unsigned int v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  int v8 = *(const void ***)(a1 + 48);
  unsigned __int8 v9 = *(const void ***)(a1 + 56);
  CFIndex v10 = *(void *)(a1 + 64);
  int v11 = *(_DWORD *)(a1 + 72);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2;
  v14[3] = &unk_1899EEDB0;
  v14[4] = v7;
  v14[5] = v6;
  v14[6] = connection;
  v14[7] = v9;
  v14[8] = v8;
  v14[9] = v10;
  -[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]( v6,  v5,  v7,  v8,  v9,  v10,  v11,  (uint64_t)v14);
  if (object_getClass(v5) == (Class)MEMORY[0x1895F9250])
  {
    uint64_t int64 = xpc_dictionary_get_uint64(v5, "CFPreferencesShmemState");
    if (uint64)
    {
      unsigned int v13 = atomic_load((unsigned int *)(*(void *)(a1 + 40) + 48LL));
    }
  }
}

void __99__CFPrefsPlistSource_sendFullyPreparedMessage_toConnection_settingValues_forKeys_count_retryCount___block_invoke_2( uint64_t a1)
{
  xpc_object_t v2 = xpc_copy(*(xpc_object_t *)(a1 + 32));
  BOOL v3 = v2;
  if (byte_18C536DA0) {
    xpc_dictionary_set_BOOL(v2, "PreviousMessageInjectedFailure", 1);
  }
  BOOL v4 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 40), v3, 1);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    -[CFPrefsPlistSource sendFullyPreparedMessage:toConnection:settingValues:forKeys:count:retryCount:]( *(void *)(a1 + 40),  (int)v3,  *(xpc_connection_t *)(a1 + 48));
  }

  else if (v5)
  {
    -[CFPrefsPlistSource writeFailedForKeys:values:count:]( *(void *)(a1 + 40),  *(const void ***)(a1 + 64),  *(const __CFString ***)(a1 + 56),  *(void *)(a1 + 72));
    atomic_store(1u, (unsigned __int8 *)(v5 + 106));
  }

  xpc_release(v3);
}

- (uint64_t)alreadylocked_requestNewData
{
  BOOL v1 = a1;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 105));
    if ((v2 & 1) != 0)
    {
      return 0LL;
    }

    else
    {
      BOOL v3 = (unsigned int *)atomic_load((unint64_t *)(a1 + 40));
      if (v3
        && ((v4 = atomic_load(v3), unsigned int v5 = atomic_load((unsigned int *)&sentinelGeneration), v4 == v5)
         || (unsigned int v6 = atomic_load((unsigned int *)(a1 + 48)), v4 == v6)))
      {
        return 1LL;
      }

      else
      {
        uint64_t v13 = 0LL;
        uint64_t v14 = &v13;
        uint64_t v15 = 0x2020000000LL;
        char v16 = 0;
        unsigned int v7 = *(void **)(a1 + 8);
        unsigned __int8 v8 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v8 & 1) != 0)
        {
          int v9 = 2;
        }

        else if (_CFPrefsDirectMode())
        {
          int v9 = 2;
        }

        else
        {
          int v9 = 1;
        }

        uint64_t v10 = [(id)v1 userIdentifier];
        v12[0] = MEMORY[0x1895F87A8];
        v12[1] = 3221225472LL;
        v12[2] = __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke;
        v12[3] = &unk_1899EEE00;
        v12[4] = v1;
        v12[5] = &v13;
        -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v7, v9, v10, (uint64_t)v12);
        BOOL v1 = *((_BYTE *)v14 + 24) == 0;
        _Block_object_dispose(&v13, 8);
      }
    }
  }

  return v1;
}

void __50__CFPrefsPlistSource_alreadylocked_requestNewData__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2
    && ((v4 = *(unsigned __int8 **)(a1 + 32), unsigned __int8 v5 = atomic_load(v4 + 113), (v5 & 1) != 0)
      ? (uint64_t v6 = 2LL)
      : !_CFPrefsDirectMode()
      ? (uint64_t v6 = 1LL)
      : (uint64_t v6 = 2LL),
        (unsigned int v7 = (void *)[v4 createRequestNewContentMessageForDaemon:v6]) != 0))
  {
    unsigned __int8 v8 = v7;
    -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:]( *(void *)(a1 + 32),  v7,  a2,  0LL,  (BOOL *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
    xpc_release(v8);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

- (void)sendRequestNewDataMessage:(uint64_t)a3 toConnection:(uint64_t)a4 retryCount:(BOOL *)a5 error:
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (xdict)
    {
      BOOL v10 = -[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](a1, xdict, 0);
      *a5 = !v10;
      if (v10)
      {
        unsigned __int8 v11 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v11 & 1) != 0 || _CFPrefsDirectMode()) {
          int v12 = "Loading Preferences From Direct CFPrefsD";
        }
        else {
          int v12 = "Loading Preferences From System CFPrefsD";
        }
        uint64_t v13 = _os_activity_create(&dword_180A4C000, v12, MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
        os_activity_scope_enter(v13, &state);
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:]((void *)a1, xdict);
        uint64_t v22 = 0LL;
        __int16 v23 = &v22;
        uint64_t v24 = 0x3052000000LL;
        __int16 v25 = __Block_byref_object_copy__7;
        uint64_t v26 = __Block_byref_object_dispose__7;
        uint64_t v27 = 0LL;
        uint64_t v15 = MEMORY[0x1895F87A8];
        uint64_t v16 = 3221225472LL;
        uint64_t v17 = __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke;
        int v18 = &unk_1899EE0B8;
        xpc_object_t v20 = xdict;
        __int16 v21 = &v22;
        uint64_t v19 = a3;
        unsigned __int8 v14 = atomic_load((unsigned __int8 *)(a1 + 113));
        if ((v14 & 1) != 0 || _CFPrefsDirectMode()) {
          CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(*(os_unfair_lock_s **)(a1 + 8), (uint64_t)&v15);
        }
        else {
          CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(*(os_unfair_lock_s **)(a1 + 8), (uint64_t)&v15);
        }
        objc_msgSend( (id)a1,  "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:",  v23[5],  xdict,  a3,  a4,  a5,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22);
        xpc_release((xpc_object_t)v23[5]);

        _Block_object_dispose(&v22, 8);
        os_activity_scope_leave(&state);
      }
    }

    else
    {
      *a5 = 1;
    }
  }

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  uint64_t v19 = 0LL;
  xpc_object_t v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  uint64_t v22 = __Block_byref_object_copy__7;
  __int16 v23 = __Block_byref_object_dispose__7;
  uint64_t v24 = 0LL;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v5 & 1) != 0)
  {
    int v6 = 2;
  }

  else if (_CFPrefsDirectMode())
  {
    int v6 = 2;
  }

  else
  {
    int v6 = 1;
  }

  if (v6 == a3)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    uint64_t v15 = __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke;
    uint64_t v16 = &unk_1899EEE28;
    uint64_t v17 = self;
    int v18 = &v19;
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_volatile);
    if ((v7 & 1) == 0)
    {
      unsigned __int8 v8 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
      if (!v8
        || (unsigned int v9 = atomic_load(v8), v10 = atomic_load((unsigned int *)&sentinelGeneration), v9 != v10)
        && (unsigned int v11 = atomic_load(&self->super.lastKnownShmemState), v9 != v11))
      {
        os_unfair_lock_assert_owner(&self->super._lock);
        v15((uint64_t)v14);
      }
    }
  }

  int v12 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v12;
}

void __62__CFPrefsPlistSource_createRequestNewContentMessageForDaemon___block_invoke(uint64_t a1)
{
  if ((-[CFPrefsPlistSource volatilizeIfInvalidHomeDir](*(void *)(a1 + 32)) & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) createSynchronizeMessage];
    unsigned __int8 v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v2)
    {
      if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 32), v2, 0)) {
        -[CFPrefsPlistSource addPIDImpersonationIfNecessary:]( *(void **)(a1 + 32),  *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      }
    }
  }

- (uint64_t)volatilizeIfInvalidHomeDir
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 109));
  if ((v2 & 1) != 0) {
    return 0LL;
  }
  atomic_store(1u, (unsigned __int8 *)(a1 + 109));
  if (!-[_CFXPreferences euid](*(void *)(a1 + 8))
    || CFEqual(@"kCFPreferencesAnyUser", (CFTypeRef)[(id)a1 userIdentifier])
    || !-[_CFXPreferences currentUserHasInvalidHomeDirectory](*(void *)(a1 + 8)))
  {
    return 0LL;
  }

  BOOL v3 = (os_log_s *)_CFPrefsClientLog();
  uint64_t v4 = 1LL;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v5 = (const void *)[(id)a1 copyOSLogDescription];
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
    int v6 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138543362;
      unsigned int v9 = v5;
      _os_log_impl( &dword_180A4C000,  v6,  OS_LOG_TYPE_INFO,  "Volatilizing domain, because home directory is invalid. %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    _CFSetTSD(0xFu, 0LL, 0LL);
    if (v5) {
      CFRelease(v5);
    }
  }

  atomic_store(1u, (unsigned __int8 *)(a1 + 105));
  return v4;
}

- (void)requestPlistValidation
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unsigned __int8 v1 = atomic_load(requestInvalidPropertyListDeletion);
    if ((v1 & 1) != 0)
    {
      BOOL v3 = *(void **)(a1 + 8);
      unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 113));
      if ((v4 & 1) != 0)
      {
        int v5 = 2;
      }

      else if (_CFPrefsDirectMode())
      {
        int v5 = 2;
      }

      else
      {
        int v5 = 1;
      }

      uint64_t v6 = [(id)a1 userIdentifier];
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __44__CFPrefsPlistSource_requestPlistValidation__block_invoke;
      v7[3] = &unk_1899ED920;
      v7[4] = a1;
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v3, v5, v6, (uint64_t)v7);
    }
  }

void __44__CFPrefsPlistSource_requestPlistValidation__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  unsigned __int8 v4 = (void *)[*(id *)(a1 + 32) createSynchronizeMessage];
  if (v4)
  {
    int v5 = v4;
    if (-[CFPrefsPlistSource attachAccessTokenToMessage:accessType:](*(void *)(a1 + 32), v4, 0))
    {
      -[CFPrefsPlistSource addPIDImpersonationIfNecessary:](*(void **)(a1 + 32), v5);
      xpc_dictionary_set_BOOL(v5, "ValidatePlist", 1);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      uint64_t v6 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl( &dword_180A4C000,  v6,  OS_LOG_TYPE_INFO,  "Requesting validation of plist after invalid data detected",  v8,  2u);
      }

      _CFSetTSD(0xFu, 0LL, 0LL);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
      xpc_connection_send_message_with_reply(a2, v5, global_queue, &__block_literal_global_48);
    }

    xpc_release(v5);
  }

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->super._lock);
  if (!atomic_load((unint64_t *)&self->super.shmemEntry))
  {
    string = xpc_dictionary_get_string(a3, "CFPreferencesShmemName");
    if (string)
    {
      uint64_t v19 = string;
      unsigned __int8 v20 = atomic_load((unsigned __int8 *)&self->_directMode);
      if ((v20 & 1) != 0)
      {
        int v21 = 2;
      }

      else if (_CFPrefsDirectMode())
      {
        int v21 = 2;
      }

      else
      {
        int v21 = 1;
      }

      uint64_t v29 = -[_CFXPreferences shmemForRole:name:]((uint64_t)self->super._containingPreferences, v21, v19);
      if (!v29)
      {
        Mutable = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
        CFIndex v33 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v79.st_dev = 67109634;
          *(_DWORD *)&v79.st_mode = v21;
          LOWORD(v79.st_ino) = 2082;
          *(__darwin_ino64_t *)((char *)&v79.st_ino + 2) = (__darwin_ino64_t)v19;
          HIWORD(v79.st_uid) = 2114;
          *(void *)&v79.st_gid = Mutable;
          _os_log_error_impl( &dword_180A4C000,  v33,  OS_LOG_TYPE_ERROR,  "going volatile, because unable to obtain shmem entry for role: %d name: %{public}s. %{public}@",  (uint8_t *)&v79,  0x1Cu);
        }

        _CFSetTSD(0xFu, 0LL, 0LL);
        atomic_store(1u, (unsigned __int8 *)&self->_volatile);
        *a7 = 1;
        if (Mutable) {
          goto LABEL_123;
        }
        return;
      }

      atomic_store( v29 + 4 * xpc_dictionary_get_int64(a3, "CFPreferencesShmemIndex"),  (unint64_t *)&self->super.shmemEntry);
    }
  }

  v77[0] = MEMORY[0x1895F87A8];
  v77[1] = 3221225472LL;
  v77[2] = __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
  v77[3] = &unk_1899EEE90;
  v77[4] = a4;
  v77[5] = self;
  v77[6] = a5;
  v77[7] = a7;
  if ((-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]( (uint64_t)self,  a3,  a4,  0LL,  0LL,  0LL,  a6,  (uint64_t)v77) & 1) != 0) {
    return;
  }
  atomic_store(xpc_dictionary_get_uint64(a3, "CFPreferencesShmemState"), &self->super.lastKnownShmemState);
  id xdata = xpc_dictionary_get_value(a3, "CFPreferencesPropertyList");
  int v14 = xpc_dictionary_dup_fd(a3, "PlistFD");
  unint64_t value = (unint64_t)xpc_dictionary_get_value(a3, "PlistDiff");
  unint64_t v16 = (unint64_t)xpc_dictionary_get_value(a3, "CFPreferencesValidationPropertyList");
  if (value | v16) {
    int v17 = 0;
  }
  else {
    int v17 = dyld_program_sdk_at_least();
  }
  if (v14 != -1)
  {
    if (fstat(v14, &v79))
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      uint64_t v22 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = __error();
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.8( v23,  (uint8_t *)error,  v22);
      }

      _CFSetTSD(0xFu, 0LL, 0LL);
      goto LABEL_16;
    }

    off_t st_size = v79.st_size;
    if (!_plistSizeIsAppropriateToRead(v79.st_size))
    {
LABEL_16:
      int v24 = 0;
      Mutable = 0LL;
LABEL_17:
      close(v14);
      goto LABEL_21;
    }

    v31 = (UInt8 *)mmap(0LL, st_size, 1, 2, v14, 0LL);
    if (v31 == (UInt8 *)-1LL)
    {
      __error();
      v45 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v46 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.4();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
      CFRelease(v45);
      goto LABEL_16;
    }

    error[0] = 0LL;
    data = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v31,  st_size,  (CFAllocatorRef)&__kCFAllocatorNull);
    v32 = (__CFString *)CFPropertyListCreateWithData( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  data,  v17 ^ 1u,  0LL,  error);
    Mutable = v32;
    if (v32)
    {
      if (CFGetTypeID(v32) == 18)
      {
        int v24 = 1;
LABEL_80:
        if (data) {
          CFRelease(data);
        }
        munmap(v31, st_size);
        goto LABEL_17;
      }

      cfa = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      unint64_t v48 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.7();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
      CFRelease(cfa);
    }

    else
    {
      char cf = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v47 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.6();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
      if (os_variant_has_internal_diagnostics())
      {
        v71 = os_log_create("com.apple.defaults", "diagnostics");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.5();
        }
        _CFSetTSD(0xFu, 0LL, 0LL);
      }

      CFRelease(cf);
      if (error[0]) {
        CFRelease(error[0]);
      }
    }

    int v24 = 0;
    goto LABEL_80;
  }

  if (!xdata)
  {
    Mutable = 0LL;
    BOOL v26 = 1;
    goto LABEL_22;
  }

  if (object_getClass(xdata) != (Class)MEMORY[0x1895F9240]
    || (size_t length = xpc_data_get_length(xdata), !_plistSizeIsAppropriateToRead(length)))
  {
    int v24 = 0;
    Mutable = 0LL;
    goto LABEL_21;
  }

  *(void *)&v79.st_dev = 0LL;
  bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(xdata);
  v40 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  bytes_ptr,  length,  (CFAllocatorRef)&__kCFAllocatorNull);
  uint64_t v41 = (__CFString *)CFPropertyListCreateWithData( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v40,  v17 ^ 1u,  0LL,  (CFErrorRef *)&v79);
  Mutable = v41;
  if (v40 && !v41)
  {
    v42 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
    unint64_t v43 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.11();
    }
    _CFSetTSD(0xFu, 0LL, 0LL);
    CFRelease(v42);
    -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
    if (os_variant_has_internal_diagnostics())
    {
      v44 = os_log_create("com.apple.defaults", "diagnostics");
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.10();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
    }

    int v24 = 0;
    goto LABEL_84;
  }

  int v24 = 1;
  if (v40) {
LABEL_84:
  }
    CFRelease(v40);
  if (*(void *)&v79.st_dev) {
    CFRelease(*(CFTypeRef *)&v79.st_dev);
  }
  if (Mutable && CFGetTypeID(Mutable) != 18)
  {
    v49 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
    v50 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[CFPrefsPlistSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.9();
    }
    _CFSetTSD(0xFu, 0LL, 0LL);
    CFRelease(v49);
    -[CFPrefsPlistSource requestPlistValidation]((uint64_t)self);
    int v24 = 0;
  }

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (byte_18C536DA0) {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "PreviousMessageInjectedFailure", 1);
  }
  -[CFPrefsPlistSource sendRequestNewDataMessage:toConnection:retryCount:error:]( *(void *)(a1 + 40),  *(xpc_object_t *)(a1 + 32),  *(void *)(a1 + 48),  a2,  *(BOOL **)(a1 + 56));
}

void __88__CFPrefsPlistSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke_57( uint64_t a1,  CFStringRef theString,  const void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!CFStringHasPrefix(theString, @"Sig_"))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), theString);
    unsigned __int8 v7 = Value;
    if (!Value || !CFEqual(Value, a3))
    {
      CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%s%@", "Sig_", theString);
      uint64_t v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), v8);
      CFRelease(v8);
      uint64_t v10 = (const void *)[*(id *)(a1 + 32) copyOSLogDescription];
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      unsigned int v11 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544387;
        uint64_t v13 = v10;
        __int16 v14 = 2114;
        CFStringRef v15 = theString;
        __int16 v16 = 2113;
        int v17 = v7;
        __int16 v18 = 2113;
        uint64_t v19 = a3;
        __int16 v20 = 2114;
        int v21 = v9;
        _os_log_error_impl( &dword_180A4C000,  v11,  OS_LOG_TYPE_ERROR,  "%{public}@: Value for key %{public}@ was %{private}@. Expected %{private}@ (%{public}@)",  buf,  0x34u);
      }

      _CFSetTSD(0xFu, 0LL, 0LL);
      CFRelease(v10);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), theString, a3);
    }
  }

xpc_object_t __78__CFPrefsPlistSource_sendRequestNewDataMessage_toConnection_retryCount_error___block_invoke( uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

- (void)alreadylocked_clearCache
{
  dict = self->super._dict;
  if (dict && CFDictionaryGetCount(dict) && !atomic_load((unint64_t *)&self->_locallySetDict))
  {
    CFRelease(self->super._dict);
    self->super._dict = 0LL;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->super._generationCount);
    atomic_store(0, &self->super.lastKnownShmemState);
    atomic_store(0LL, (unint64_t *)&self->super.shmemEntry);
  }

- (BOOL)synchronize
{
  p_lastWriteFailed = &self->_lastWriteFailed;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_lastWriteFailed);
  if ((v3 & 1) != 0)
  {
    BOOL result = 0;
    atomic_store(0, (unsigned __int8 *)p_lastWriteFailed);
  }

  else
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_volatile);
    if ((v4 & 1) != 0)
    {
      return 0;
    }

    else
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_readonly);
      return (v5 & 1) == 0;
    }
  }

  return result;
}

- (int64_t)alreadylocked_generationCount
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (byte_18C536D9D) {
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  }
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  uint64_t v10 = __alreadylocked_requestNewDataIfStale_block_invoke;
  unsigned int v11 = &unk_18999B4C8;
  int v12 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v10((uint64_t)v9);
    }
  }

  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (int64_t)generationCount
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(&self->super._lock);
  if (byte_18C536D9D) {
    -[CFPrefsPlistSource alreadylocked_clearCache](self, "alreadylocked_clearCache");
  }
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  uint64_t v10 = __alreadylocked_requestNewDataIfStale_block_invoke;
  unsigned int v11 = &unk_18999B4C8;
  int v12 = self;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_volatile);
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = (unsigned int *)atomic_load((unint64_t *)&self->super.shmemEntry);
    if (!v4
      || (unsigned int v5 = atomic_load(v4), v6 = atomic_load((unsigned int *)&sentinelGeneration), v5 != v6)
      && (unsigned int v7 = atomic_load(&self->super.lastKnownShmemState), v5 != v7))
    {
      os_unfair_lock_assert_owner(&self->super._lock);
      v10((uint64_t)v9);
    }
  }

  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  if (!-[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount")
    || (unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_observing), (v3 & 1) != 0))
  {
    if (-[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount")) {
      return 0;
    }
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_observing);
    if ((v4 & 1) == 0) {
      return 0;
    }
    atomic_store(0, (unsigned __int8 *)&self->_observing);
  }

  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_observing);
  }

  if (-[CFPrefsPlistSource isVolatile](self, "isVolatile")) {
    return 0;
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_observing);
  if ((v6 & 1) != 0) {
    return 7;
  }
  else {
    return 8;
  }
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  if (!a3) {
    return 0LL;
  }
  id v7 = -[CFPrefsPlistSource createSynchronizeMessage](self, "createSynchronizeMessage");
  xpc_dictionary_set_int64(v7, "CFPreferencesOperation", a3);
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_directMode);
  if ((v8 & 1) != 0)
  {
    int v9 = 2;
  }

  else if (_CFPrefsDirectMode())
  {
    int v9 = 2;
  }

  else
  {
    int v9 = 1;
  }

  *a4 = v9;
  return v7;
}

- (void)_sharedCleanup
{
  if (a1)
  {
    if (atomic_load(a1 + 12))
    {
      unsigned __int8 v3 = (void *)atomic_load(a1 + 12);
      free(v3);
    }

    unsigned __int8 v4 = (const void *)a1[9];
    if (v4)
    {
      a1[9] = 0LL;
      CFRelease(v4);
    }

    unsigned int v5 = (const void *)a1[8];
    if (v5)
    {
      a1[8] = 0LL;
      CFRelease(v5);
    }

    unsigned __int8 v6 = (const void *)a1[10];
    if (v6)
    {
      a1[10] = 0LL;
      CFRelease(v6);
    }

    if (atomic_load(a1 + 11))
    {
      unsigned __int8 v8 = (const void *)atomic_load(a1 + 11);
      CFRelease(v8);
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[CFPrefsPlistSource _sharedCleanup](self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CFPrefsPlistSource;
  -[CFPrefsSource dealloc](&v3, sel_dealloc);
}

- (void)setDomainIdentifier:.cold.1()
{
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
}

- (void)createSynchronizeMessage
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = 136446466;
  uint64_t v5 = a1;
  __int16 v6 = 2082;
  uint64_t error_description = container_get_error_description();
  _os_log_error_impl( &dword_180A4C000,  a3,  OS_LOG_TYPE_ERROR,  "Could not lookup group container %{public}s: %{public}s",  (uint8_t *)&v4,  0x16u);
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:.cold.1()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.1()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.2()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.3()
{
  __assert_rtn( "-[CFPrefsPlistSource handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:]",  "CFPrefsPlistSource.m",  1071,  "xpc_get_type(reply) == XPC_TYPE_DICTIONARY");
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.4()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.5()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.6()
{
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.7()
{
}

- (void)handleErrorReply:(uint64_t)a3 toMessage:(os_log_s *)a4 settingKeys:toValues:count:retryCount:retryContinuation:.cold.8( uint64_t a1,  int *a2,  uint64_t a3,  os_log_s *a4)
{
  int v4 = *a2;
  *(_DWORD *)a3 = 136380931;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v4;
  OUTLINED_FUNCTION_13_0( &dword_180A4C000,  a4,  a3,  "Failed to create directory %{private}s because of %{darwin.errno}d.",  (uint8_t *)a3);
}

- (void)handleErrorReply:toMessage:settingKeys:toValues:count:retryCount:retryContinuation:.cold.9()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_18();
  _os_log_debug_impl( &dword_180A4C000,  v0,  OS_LOG_TYPE_DEBUG,  "Successfully created directory %{private}s. Retrying write.",  v1,  0xCu);
  OUTLINED_FUNCTION_1_25();
}

- (void)handlePossibleOversizedMessage:forWritingKeys:values:count:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12_0();
  int v2 = 0x100000;
  _os_log_debug_impl( &dword_180A4C000,  v0,  OS_LOG_TYPE_DEBUG,  "%{public}@: Attempt to store >= %d bytes of data in CFPreferences/NSUserDefaults was allowed by virtue of direct mode",  v1,  0x12u);
  OUTLINED_FUNCTION_1_25();
}

void __105__CFPrefsPlistSource_handleErrorReply_toMessage_settingKeys_toValues_count_retryCount_retryContinuation___block_invoke_cold_1()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.2()
{
  OUTLINED_FUNCTION_0_36( &dword_180A4C000,  v0,  v1,  "A RequestNewData response gave an invalid plist. We'll return wrong data this time, but NOT going volatile. Sent a r equest to validate the plist in the daemon and remove it if invalid. %{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.3()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.4()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12_0();
  int v3 = v0;
  OUTLINED_FUNCTION_13_0( &dword_180A4C000,  v1,  (uint64_t)v1,  "failed to map file from disk for %{public}@. error: %{darwin.errno}d",  v2);
  OUTLINED_FUNCTION_1_25();
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.5()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.6()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.7()
{
}

- (void)handleReply:(os_log_t)log toRequestNewDataMessage:onConnection:retryCount:error:.cold.8( int *a1,  uint8_t *buf,  os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_180A4C000, log, OS_LOG_TYPE_ERROR, "failed to lstat plist fd: %{darwin.errno}d.", buf, 8u);
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.9()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.10()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.11()
{
}

@end
@interface CFPrefsSearchListSource
- (BOOL)alreadylocked_hasNonRegisteredValueForKey:(uint64_t)a1;
- (BOOL)isDirectModeEnabled;
- (CFMutableArrayRef)_getPendingNotifications;
- (CFMutableDictionaryRef)alreadylocked_copyManagedDictionary;
- (CFPrefsSearchListSource)initWithIdentifier:(__CFString *)a3 containingPreferences:(id)a4;
- (CFStringRef)copyCloudConfigurationWithURL:(void *)a3 outConfigFileSource:(CFStringRef *)a4 outStoreName:;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)copyOSLogDescription;
- (__CFString)domainIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)description;
- (int64_t)generationCount;
- (uint64_t)alreadylocked_copyManagedValueForKey:;
- (uint64_t)alreadylocked_generationCountFromListOfSources:(uint64_t)a3 count:;
- (uint64_t)alreadylocked_hasCloudValueForKey:(uint64_t)result;
- (uint64_t)alreadylocked_requestNewData;
- (uint64_t)alreadylocked_useCloudForKey:(uint64_t)result;
- (uint64_t)freeze;
- (uint64_t)synchronouslySendSystemMessage:(uint64_t)a3 andUserMessage:(uint64_t)a4 andDirectMessage:(uint64_t)a5 replyHandler:;
- (void)_getPendingNotifications;
- (void)addCloudSourceForIdentifier:(uint64_t)a3 configurationPath:(uint64_t)a4 storeName:(const __CFString *)a5 container:;
- (void)addManagedSourceForIdentifier:(uint64_t)a3 user:;
- (void)addNamedVolatileSourceForIdentifier:(uint64_t)a1;
- (void)addPreferencesObserver:(uint64_t)a1;
- (void)addSource:(uint64_t)a1;
- (void)addSourceForIdentifier:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:;
- (void)addSuiteSourceForIdentifier:(const __CFString *)a3 user:;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_getDictionary:(uint64_t)a1;
- (void)alreadylocked_reloadCacheIfStale;
- (void)alreadylocked_setObservingContents:(uint64_t)a1;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)dealloc;
- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)Copy;
- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5;
- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3;
- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4;
- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7;
- (void)removePreferencesObserver:(uint64_t)a1;
- (void)removeSource:(uint64_t)a1;
- (void)replaceSource:(const void *)a3 withSource:;
- (void)setCloudEnabled:(const void *)a3 forKey:;
- (void)setCloudEnabled:(const void *)a3 forKeyPrefix:;
- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3;
- (xpc_object_t)createMultiMessageWithContainedMessages:(uint64_t)a1;
@end

@implementation CFPrefsSearchListSource

- (CFPrefsSearchListSource)initWithIdentifier:(__CFString *)a3 containingPreferences:(id)a4
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CFPrefsSearchListSource;
  v5 = -[CFPrefsSource initWithContainingPreferences:](&v7, sel_initWithContainingPreferences_, a4);
  if (v5)
  {
    v5->_identifier = (__CFString *)_CFStringCopyBundleUnloadingProtectedString((unint64_t *)a3);
    v5->super._isSearchList = 1;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v5->super._generationCount);
  }

  return v5;
}

- (CFStringRef)copyCloudConfigurationWithURL:(void *)a3 outConfigFileSource:(CFStringRef *)a4 outStoreName:
{
  CFStringRef v4 = 0LL;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (!a1 || !eduModeOverride) {
    return v4;
  }
  p_info = (__objc2_class_ro **)(&OBJC_METACLASS_____NSCFTimer + 32);
  if (!cf)
  {
    v10 = 0LL;
    goto LABEL_24;
  }

  v9 = (const __CFURL *)CFRetain(cf);
  v10 = v9;
  if (!v9)
  {
LABEL_24:
    char v26 = 1;
    goto LABEL_35;
  }

  v11 = _CFDataCreateFromURL(v9, 0LL);
  if (!v11) {
    goto LABEL_26;
  }
  v12 = v11;
  CFAllocatorRef v32 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v13 = (const __CFDictionary *)CFPropertyListCreateWithData( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v11,  0LL,  0LL,  0LL);
  CFRelease(v12);
  if (v13)
  {
    p_info = &OBJC_METACLASS_____NSCFTimer.info;
    if (CFGetTypeID(v13) == 18)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      if (makeLogHandles_logToken != -1) {
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_133);
      }
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG)) {
        -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:].cold.2(a1);
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
      CFIndex Count = CFDictionaryGetCount(v13);
      v31[1] = v31;
      uint64_t v16 = MEMORY[0x1895F8858](Count, v15);
      v18 = (const void **)((char *)v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      MEMORY[0x1895F8858](v16, v19);
      v21 = (CFDictionaryRef *)((char *)v31 - v20);
      CFDictionaryGetKeysAndValues(v13, v18, (const void **)((char *)v31 - v20));
      if (Count < 1)
      {
        char v22 = 0;
        if (!a3) {
          goto LABEL_29;
        }
      }

      else
      {
        char v22 = 0;
        do
        {
          if (CFGetTypeID(*v21) == 18)
          {
            if (CFDictionaryGetValue(*v21, @"NSUserDefaultsUbiquitous") != &__kCFBooleanFalse)
            {
              int HasSuffix = CFStringHasSuffix((CFStringRef)*v18, @"*");
              v24 = (const __CFString *)*v18;
              if (HasSuffix)
              {
                v34.length = CFStringGetLength((CFStringRef)*v18) - 1;
                v34.location = 0LL;
                CFStringRef v25 = CFStringCreateWithSubstring(v32, v24, v34);
                -[CFPrefsSearchListSource setCloudEnabled:forKeyPrefix:](a1, 1LL, v25);
                CFRelease(v25);
              }

              else
              {
                -[CFPrefsSearchListSource setCloudEnabled:forKey:](a1, 1LL, *v18);
              }
            }

            char v22 = 1;
          }

          ++v18;
          ++v21;
          --Count;
        }

        while (Count);
        if (!a3)
        {
LABEL_29:
          if (a4)
          {
            Value = (const __CFString *)CFDictionaryGetValue(v13, @"NSUserDefaultsCloudStoreIdentifier");
            if (!Value) {
              Value = *(const __CFString **)(a1 + 72);
            }
            *a4 = CFStringCreateCopy(v32, Value);
          }

          CFRelease(v13);
          if ((v22 & 1) != 0)
          {
            v29 = CFURLCopyAbsoluteURL(v10);
            v30 = v29;
            if (v29)
            {
              CFStringRef v4 = CFURLCopyFileSystemPath(v29, kCFURLPOSIXPathStyle);
              CFRelease(v30);
            }

            else
            {
              CFStringRef v4 = 0LL;
            }

- (void)setCloudEnabled:(const void *)a3 forKeyPrefix:
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    Mutable = *(__CFArray **)(a1 + 96);
    if ((_DWORD)a2)
    {
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
        *(void *)(a1 + 96) = Mutable;
      }

      CFArrayAppendValue(Mutable, a3);
    }

    else
    {
      if (!Mutable) {
        goto LABEL_10;
      }
      v8.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
      v8.location = 0LL;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(Mutable, v8, a3);
      if (FirstIndexOfValue == -1) {
        goto LABEL_10;
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 96), FirstIndexOfValue);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 96))) {
        goto LABEL_10;
      }
    }

    [*(id *)(a1 + 112) setEnabled:a2];
LABEL_10:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }

- (void)setCloudEnabled:(const void *)a3 forKey:
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    Mutable = *(__CFSet **)(a1 + 88);
    if ((_DWORD)a2)
    {
      if (!Mutable)
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFCopyStringSetCallBacks);
        *(void *)(a1 + 88) = Mutable;
      }

      CFSetAddValue(Mutable, a3);
    }

    else
    {
      if (!Mutable) {
        goto LABEL_9;
      }
      CFSetRemoveValue(Mutable, a3);
      if (CFSetGetCount(*(CFSetRef *)(a1 + 88))) {
        goto LABEL_9;
      }
    }

    [*(id *)(a1 + 112) setEnabled:a2];
LABEL_9:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }

- (void)alreadylocked_setObservingContents:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 52));
  CFStringRef v4 = *(const __CFArray **)(a1 + 80);
  if (!v4)
  {
    BOOL v6 = 0;
    CFIndex Count = 0LL;
LABEL_22:
    v9 = 0LL;
    CFRange v8 = 0LL;
    goto LABEL_23;
  }

  CFIndex Count = CFArrayGetCount(v4);
  BOOL v6 = Count > 0;
  if (Count < 1)
  {
    BOOL v6 = 0;
    goto LABEL_22;
  }

  CFIndex v7 = 0LL;
  CFRange v8 = 0LL;
  v9 = 0LL;
  do
  {
    ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), v7);
    os_unfair_lock_lock(ValueAtIndex + 13);
    if (a2) {
      uint64_t v11 = -[CFPrefsSource alreadylocked_addPreferencesObserver:]((uint64_t)ValueAtIndex, a1);
    }
    else {
      uint64_t v11 = -[CFPrefsSource alreadylocked_removePreferencesObserver:]((uint64_t)ValueAtIndex, a1);
    }
    v12 = (void *)-[os_unfair_lock_s alreadylocked_createObserverUpdateMessageWithOperation:forRole:]( ValueAtIndex,  "alreadylocked_createObserverUpdateMessageWithOperation:forRole:",  v11,  &v21);
    objects.opaque[0] = (uint64_t)v12;
    if (v12)
    {
      if (v21 == 1) {
        v13 = v9;
      }
      else {
        v13 = v8;
      }
      if (v13)
      {
        xpc_array_append_value(v13, v12);
      }

      else
      {
        BOOL v14 = v21 == 1;
        xpc_object_t v15 = xpc_array_create((xpc_object_t *)&objects, 1uLL);
        if (v14) {
          v9 = v15;
        }
        else {
          CFRange v8 = v15;
        }
      }

      xpc_release((xpc_object_t)objects.opaque[0]);
    }

    ++v7;
  }

  while (Count != v7);
LABEL_23:
  uint64_t v16 = _os_activity_create( &dword_180A4C000,  "Updating Key-Value Observers Of Preferences",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &objects);
  if (!v9)
  {
    xpc_object_t v17 = 0LL;
    if (v8) {
      goto LABEL_25;
    }
LABEL_27:
    xpc_object_t v18 = 0LL;
    goto LABEL_28;
  }

  xpc_object_t v17 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v9);
  xpc_release(v9);
  if (!v8) {
    goto LABEL_27;
  }
LABEL_25:
  xpc_object_t v18 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:](a1, v8);
  xpc_release(v8);
LABEL_28:
  -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:]( a1,  (uint64_t)v17,  0LL,  (uint64_t)v18,  0LL);
  if (v17) {
    xpc_release(v17);
  }
  if (v18) {
    xpc_release(v18);
  }

  if (v6)
  {
    CFIndex v19 = 0LL;
    do
    {
      uint64_t v20 = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 80), v19);
      os_unfair_lock_unlock(v20 + 13);
      ++v19;
    }

    while (Count != v19);
  }

  os_activity_scope_leave(&objects);
}

- (xpc_object_t)createMultiMessageWithContainedMessages:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v3, "CFPreferencesOperation", 5LL);
  xpc_dictionary_set_value(v3, "CFPreferencesMessages", a2);
  return v3;
}

- (uint64_t)synchronouslySendSystemMessage:(uint64_t)a3 andUserMessage:(uint64_t)a4 andDirectMessage:(uint64_t)a5 replyHandler:
{
  v16[6] = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke;
    v16[3] = &unk_1899EC068;
    v16[4] = result;
    v16[5] = a5;
    if (a2 && a3)
    {
      CFRange v8 = *(os_unfair_lock_s **)(result + 8);
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3;
      v15[3] = &unk_1899EC0B8;
      v15[5] = a3;
      v15[6] = v16;
      v15[4] = a2;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_AND_USER_CFPREFSDS(v8, (uint64_t)v15);
    }

    else if (a2)
    {
      v9 = *(os_unfair_lock_s **)(result + 8);
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5;
      v14[3] = &unk_1899EC0E0;
      v14[4] = a2;
      v14[5] = v16;
      result = CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v9, (uint64_t)v14);
    }

    else if (a3)
    {
      v10 = *(os_unfair_lock_s **)(result + 8);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6;
      v13[3] = &unk_1899EC0E0;
      v13[4] = a3;
      v13[5] = v16;
      result = CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v10, (uint64_t)v13);
    }

    if (a4)
    {
      uint64_t v11 = *(os_unfair_lock_s **)(v6 + 8);
      v12[0] = v7;
      v12[1] = 3221225472LL;
      v12[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7;
      v12[3] = &unk_1899EC0E0;
      v12[4] = a4;
      v12[5] = v16;
      return CFPREFERENCES_IS_WAITING_FOR_DIRECT_CFPREFSD(v11, (uint64_t)v12);
    }
  }

  return result;
}

- (void)addPreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (![*(id *)(a1 + 24) approximateCount]) {
      -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
    }
    if ([*(id *)(a1 + 24) approximateCount] == 1) {
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }

- (void)alreadylocked_reloadCacheIfStale
{
  if (a1) {
    -[CFPrefsSearchListSource alreadylocked_getDictionary:](a1, (uint64_t)&__block_literal_global_32);
  }
}

- (void)removePreferencesObserver:(uint64_t)a1
{
  if (a1 && a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    if (![*(id *)(a1 + 24) approximateCount]) {
      -[CFPrefsSearchListSource alreadylocked_setObservingContents:](a1, 0);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 52));
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier containingPreferences:self->super._containingPreferences];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = *(const void **)(v4 + 80);
    if (v6) {
      CFRelease(v6);
    }
    sourceList = self->_sourceList;
    if (sourceList) {
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, sourceList);
    }
    else {
      CFMutableArrayRef MutableCopy = 0LL;
    }
    v5[10] = MutableCopy;
    v9 = (const void *)v5[3];
    if (v9) {
      CFRelease(v9);
    }
    observers = self->super._observers;
    if (observers) {
      observers = (__CFPrefsWeakObservers *)-[__CFPrefsWeakObservers mutableCopy](observers, "mutableCopy");
    }
    v5[3] = observers;
    uint64_t v11 = (const void *)v5[11];
    if (v11) {
      CFRelease(v11);
    }
    cloudKeys = self->_cloudKeys;
    if (cloudKeys) {
      CFMutableSetRef v13 = CFSetCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, cloudKeys);
    }
    else {
      CFMutableSetRef v13 = 0LL;
    }
    v5[11] = v13;
    cloudPrefixKeys = self->_cloudPrefixKeys;
    if (cloudPrefixKeys) {
      v5[12] = CFArrayCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, cloudPrefixKeys);
    }
    v5[13] = self->_standardSetTarget;
    v5[14] = self->_cloudSetTarget;
    dict = self->super._dict;
    if (dict) {
      v5[2] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, dict);
    }
    keysToSources = self->_keysToSources;
    if (keysToSources) {
      v5[8] = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, keysToSources);
    }
  }

  os_unfair_lock_unlock(&self->super._lock);
  return v5;
}

- (void)transitionIntoDirectModeIfNeededWithRetryBlock:(id)a3
{
}

- (BOOL)isDirectModeEnabled
{
  return -[CFPrefsPlistSource isDirectModeEnabled](self->_standardSetTarget, "isDirectModeEnabled");
}

- (void)addManagedSourceForIdentifier:(uint64_t)a3 user:
{
  v4[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    xpc_object_t v3 = *(os_unfair_lock_s **)(a1 + 8);
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1899EBF50;
    v4[4] = a1;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](v3, a2, a3, (uint64_t)v4);
  }

void __62__CFPrefsSearchListSource_addManagedSourceForIdentifier_user___block_invoke( uint64_t a1,  const void *a2)
{
}

- (void)addSource:(uint64_t)a1
{
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 120)) {
      -[CFPrefsSearchListSource addSource:].cold.1();
    }
    Mutable = *(const __CFArray **)(a1 + 80);
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
      *(void *)(a1 + 80) = Mutable;
    }

    v5.length = CFArrayGetCount(Mutable);
    v5.location = 0LL;
    if (!CFArrayContainsValue(Mutable, v5, a2)) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 80), a2);
    }
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
  }

- (void)addSourceForIdentifier:(const __CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:
{
  v6[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke;
    v6[3] = &unk_1899EBF78;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](v5, a2, a3, a4, a5, 0, (uint64_t)v6);
  }

void __72__CFPrefsSearchListSource_addSourceForIdentifier_user_byHost_container___block_invoke( uint64_t a1,  const void *a2)
{
}

- (void)addCloudSourceForIdentifier:(uint64_t)a3 configurationPath:(uint64_t)a4 storeName:(const __CFString *)a5 container:
{
  v6[7] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 8);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke;
    v6[3] = &unk_1899EBFA0;
    v6[5] = a3;
    void v6[6] = a4;
    v6[4] = a1;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v5,  a2,  @"kCFPreferencesCurrentUser",  0,  a5,  1,  (uint64_t)v6);
  }

void __93__CFPrefsSearchListSource_addCloudSourceForIdentifier_configurationPath_storeName_container___block_invoke( uint64_t *a1,  void *a2)
{
}

- (void)addSuiteSourceForIdentifier:(const __CFString *)a3 user:
{
  v4[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke;
    v4[3] = &unk_1899EBFC8;
    v4[4] = a1;
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:](v3, a2, a3, 1, (uint64_t)v4);
  }

void __60__CFPrefsSearchListSource_addSuiteSourceForIdentifier_user___block_invoke( uint64_t a1,  const void *a2)
{
}

- (void)addNamedVolatileSourceForIdentifier:(uint64_t)a1
{
  v3[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke;
    v3[3] = &unk_1899EBF78;
    v3[4] = a1;
    -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, a2, (uint64_t)v3);
  }

void __63__CFPrefsSearchListSource_addNamedVolatileSourceForIdentifier___block_invoke( uint64_t a1,  const void *a2)
{
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!self->_sourceList) {
    return 0LL;
  }
  uint64_t v13 = 0LL;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke;
  v12[3] = &unk_1899EBFF0;
  v12[4] = &v13;
  v12[5] = a3;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v12);
  if (makeLogHandles_logToken != -1) {
    dispatch_once(&makeLogHandles_logToken, &__block_literal_global_133);
  }
  if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
  {
    if (v14[3]) {
      Value = (void *)CFDictionaryGetValue(self->_keysToSources, a3);
    }
    else {
      Value = 0LL;
    }
    uint64_t v7 = -[CFPrefsSearchListSource copyOSLogDescription](self, "copyOSLogDescription");
    CFRange v8 = (const void *)[Value copyOSLogDescription];
    if (v14[3])
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      if (makeLogHandles_logToken != -1) {
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_133);
      }
      v9 = (os_log_s *)clientHandle;
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = v14[3];
        *(_DWORD *)buf = 138478595;
        uint64_t v18 = v11;
        __int16 v19 = 2114;
        uint64_t v20 = a3;
        __int16 v21 = 2114;
        char v22 = v8;
        __int16 v23 = 2114;
        v24 = v7;
        _os_log_debug_impl( &dword_180A4C000,  v9,  OS_LOG_TYPE_DEBUG,  "looked up value %{private}@ for key %{public}@ in %{public}@ via %{public}@",  buf,  0x2Au);
      }
    }

    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      if (makeLogHandles_logToken != -1) {
        dispatch_once(&makeLogHandles_logToken, &__block_literal_global_133);
      }
      if (os_log_type_enabled((os_log_t)clientHandle, OS_LOG_TYPE_DEBUG)) {
        -[CFPrefsSearchListSource alreadylocked_copyValueForKey:].cold.1((uint64_t)a3);
      }
    }

    _CFSetTSD(0xFu, 0LL, 0LL);
    CFRelease(v7);
    if (v8) {
      CFRelease(v8);
    }
  }

  uint64_t v6 = (void *)v14[3];
  _Block_object_dispose(&v13, 8);
  return v6;
}

const void **__57__CFPrefsSearchListSource_alreadylocked_copyValueForKey___block_invoke( const void **result,  CFDictionaryRef theDict)
{
  if (theDict)
  {
    uint64_t v2 = result;
    *(void *)(*((void *)result[4] + 1) + 24LL) = CFDictionaryGetValue(theDict, result[5]);
    result = *(const void ***)(*((void *)v2[4] + 1) + 24LL);
    if (result) {
      return (const void **)CFRetain(result);
    }
  }

  return result;
}

- (void)alreadylocked_getDictionary:(uint64_t)a1
{
  v24[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 52));
    uint64_t v5 = *(const __CFArray **)(a1 + 80);
    if (!v5)
    {
      CFDictionaryRef v12 = CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      (*(void (**)(uint64_t, CFDictionaryRef))(a2 + 16))(a2, v12);
      CFRelease(v12);
      return;
    }

    if (!byte_18C536D9D) {
      goto LABEL_7;
    }
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
    uint64_t v6 = *(const void **)(a1 + 16);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 16) = 0LL;
    uint64_t v5 = *(const __CFArray **)(a1 + 80);
    if (!v5)
    {
      MEMORY[0x1895F8858](0LL, v4);
      uint64_t v11 = (const void **)&v23;
      uint64_t Count = 0LL;
    }

    else
    {
LABEL_7:
      uint64_t Count = CFArrayGetCount(v5);
      uint64_t v9 = MEMORY[0x1895F8858](Count, v8);
      uint64_t v11 = (const void **)((char *)v24 - v10);
      if (v9 >= 1)
      {
        v25.location = 0LL;
        v25.length = Count;
        CFArrayGetValues(*(CFArrayRef *)(a1 + 80), v25, v11);
      }
    }

    uint64_t v13 = -[CFPrefsSearchListSource alreadylocked_generationCountFromListOfSources:count:](a1, (uint64_t *)v11, Count);
    unint64_t v14 = atomic_load((unint64_t *)(a1 + 32));
    if (v14 == v13)
    {
      uint64_t v15 = *(const void **)(a1 + 16);
      if (!v15)
      {
        *(void *)(a1 + 16) = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        uint64_t v15 = *(const void **)(a1 + 16);
      }

      CFTypeRef v16 = CFRetain(v15);
LABEL_24:
      (*(void (**)(uint64_t, CFTypeRef))(a2 + 16))(a2, v16);
      CFRelease(v16);
      return;
    }

    unint64_t v17 = v13;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef v19 = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke;
    v24[3] = &unk_1899EC170;
    v24[4] = a1;
    if (Count >= 1)
    {
      do
      {
        uint64_t v20 = (void *)*v11++;
        [v20 mergeIntoDictionary:Mutable sourceDictionary:v19 cloudKeyEvaluator:v24];
        --Count;
      }

      while (Count);
    }

    unint64_t v21 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = Mutable;
    char v22 = *(const void **)(a1 + 64);
    *(void *)(a1 + 64) = v19;
    atomic_store(v17, (unint64_t *)(a1 + 32));
    CFTypeRef v16 = CFRetain(*(CFTypeRef *)(a1 + 16));
    if ([*(id *)(a1 + 24) approximateCount])
    {
      if (!(v21 | *(void *)(a1 + 16)))
      {
LABEL_22:
        if (v22) {
          CFRelease(v22);
        }
        goto LABEL_24;
      }

      objc_msgSend((id)a1, "deferredNotifyCausedByLoadingOfChangesFromDictionary:toDictionary:", v21);
    }

    if (v21) {
      CFRelease((CFTypeRef)v21);
    }
    goto LABEL_22;
  }

- (uint64_t)alreadylocked_useCloudForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(const __CFSet **)(result + 88);
    if (v4 && CFSetContainsValue(v4, value))
    {
      return 1LL;
    }

    else
    {
      result = *(void *)(v3 + 96);
      if (result)
      {
        CFIndex Count = CFArrayGetCount((CFArrayRef)result);
        CFIndex v6 = Count - 1;
        if (Count < 1)
        {
          return 0LL;
        }

        else
        {
          CFIndex v7 = 0LL;
          do
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v3 + 96), v7);
            int HasPrefix = CFStringHasPrefix(value, ValueAtIndex);
            BOOL v10 = HasPrefix == 0;
            result = HasPrefix != 0;
            BOOL v10 = !v10 || v6 == v7++;
          }

          while (!v10);
        }
      }
    }
  }

  return result;
}

- (uint64_t)alreadylocked_hasCloudValueForKey:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 80))
    {
      result = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](result, a2);
      if ((_DWORD)result)
      {
        result = [*(id *)(v2 + 112) copyValueForKey:a2];
        if (result)
        {
          CFRelease((CFTypeRef)result);
          return 1LL;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

- (BOOL)alreadylocked_hasNonRegisteredValueForKey:(uint64_t)a1
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = *(const __CFArray **)(a1 + 80);
  if (!v3) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v7 = Count;
  MEMORY[0x1895F8858](Count, v6);
  uint64_t v9 = (const void **)((char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v19.location = 0LL;
  v19.length = v7;
  CFArrayGetValues(*(CFArrayRef *)(a1 + 80), v19, v9);
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v10 = -2LL;
  }
  else {
    uint64_t v10 = -1LL;
  }
  uint64_t v11 = v10 + v7;
  if (v10 + v7 < 1) {
    return 0LL;
  }
  CFDictionaryRef v12 = (const void *)[(id)*v9 copyValueForKey:a2];
  if (!v12)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = v9 + 1;
    uint64_t v16 = v10 + v7 - 1;
    while (v16 != v14)
    {
      CFDictionaryRef v12 = (const void *)[(id)v15[v14++] copyValueForKey:a2];
      if (v12)
      {
        BOOL v13 = v11 > v14;
        goto LABEL_15;
      }
    }

    return 0LL;
  }

  BOOL v13 = 1LL;
LABEL_15:
  CFRelease(v12);
  return v13;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  v88 = a3;
  v96[1] = *MEMORY[0x1895F89C0];
  p_standardSetTarget = &self->_standardSetTarget;
  if (*(_OWORD *)&self->_standardSetTarget == 0LL) {
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.1();
  }
  unint64_t v95 = 16LL;
  if (!self->super._dict) {
    -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  }
  if (!self->_keysToSources) {
    -[CFPrefsSearchListSource alreadylocked_setPrecopiedValues:forKeys:count:from:].cold.2();
  }
  MEMORY[0x1895F8858](self, a2);
  v89 = (char *)&v84 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v89, a5);
  if (*(_OWORD *)&self->_cloudKeys == 0LL)
  {
    int v45 = 0;
  }

  else
  {
    if (a5 < 1)
    {
      char v11 = 0;
    }

    else
    {
      char v11 = 0;
      CFDictionaryRef v12 = a4;
      BOOL v13 = v89;
      int64_t v14 = a5;
      do
      {
        uint64_t v15 = *v12++;
        uint64_t v9 = -[CFPrefsSearchListSource alreadylocked_useCloudForKey:]((uint64_t)self, v15);
        *v13++ = v9;
        if ((_DWORD)v9) {
          char v11 = 1;
        }
        --v14;
      }

      while (v14);
    }

    int v45 = v11 & 1;
  }

  MEMORY[0x1895F8858](v9, v10);
  v93 = (char *)&v84 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v93, a5);
  sourceList = self->_sourceList;
  v97.length = CFArrayGetCount(sourceList);
  v97.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(sourceList, v97, *p_standardSetTarget);
  unint64_t v94 = 80LL;
  LODWORD(v85) = v45;
  if (v45)
  {
    unint64_t v17 = self->_sourceList;
    v98.length = CFArrayGetCount(v17);
    v98.location = 0LL;
    CFIndex v91 = CFArrayGetFirstIndexOfValue(v17, v98, self->_cloudSetTarget);
  }

  else
  {
    CFIndex v91 = -1LL;
  }

  int64_t v84 = a5;
  if (a5 < 1)
  {
    char v19 = 0;
  }

  else
  {
    int64_t v18 = a5;
    char v19 = 0;
    uint64_t v20 = (const void **)a4;
    unint64_t v21 = (BOOL *)v93;
    char v22 = v89;
    do
    {
      Value = CFDictionaryGetValue(self->_keysToSources, *v20);
      BOOL v24 = 1;
      BOOL *v21 = 1;
      if (Value)
      {
        CFRange v25 = Value;
        char v26 = (const __CFArray *)(&self->super.super.isa)[v94 / 8];
        v99.length = CFArrayGetCount(v26);
        v99.location = 0LL;
        CFIndex v27 = CFArrayGetFirstIndexOfValue(v26, v99, v25);
        if (v27 == -1)
        {
          BOOL v24 = 1;
        }

        else
        {
          CFIndex v28 = FirstIndexOfValue;
          if (*v22) {
            CFIndex v28 = v91;
          }
          BOOL v24 = v27 >= v28;
        }

        BOOL *v21 = v24;
      }

      v19 |= v24;
      ++v22;
      ++v21;
      ++v20;
      --v18;
    }

    while (v18);
  }

  unint64_t v29 = -[__CFPrefsWeakObservers approximateCount](self->super._observers, "approximateCount", v84);
  CFMutableDictionaryRef Mutable = 0LL;
  Class v30 = (&self->super.super.isa)[v95 / 8];
  unint64_t v86 = v29;
  if (v30) {
    BOOL v31 = v29 == 0;
  }
  else {
    BOOL v31 = 1;
  }
  if (v31)
  {
    int64_t v32 = v84;
    if (!(_DWORD)v85) {
      goto LABEL_51;
    }
  }

  else
  {
    int64_t v32 = v84;
    int v33 = (int)v85;
    if ((v19 & 1) != 0)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v32 >= 1)
      {
        int64_t v34 = v32;
        v35 = (const void **)a4;
        v36 = v93;
        do
        {
          v37 = CFDictionaryGetValue((CFDictionaryRef)(&self->super.super.isa)[v95 / 8], *v35);
          if (v37 && *v36) {
            CFDictionarySetValue(Mutable, *v35, v37);
          }
          ++v36;
          ++v35;
          --v34;
        }

        while (v34);
      }
    }

    if (!v33) {
      goto LABEL_51;
    }
  }

  if (-[CFPrefsCloudSource enabled](self->_cloudSetTarget, "enabled"))
  {
    if ((((unint64_t)v32 >> 59) & 0xF) != 0)
    {
      CFStringRef v79 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  2 * v32);
      v80 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v79,  0LL);
      CFRelease(v79);
      objc_exception_throw(v80);
      v82 = v81;
      free(v80);
      _Unwind_Resume(v82);
    }

    if (v32) {
      uint64_t v39 = 2 * v32;
    }
    else {
      uint64_t v39 = 1LL;
    }
    unint64_t v40 = MEMORY[0x1895F8858](v39, v38);
    v42 = (char *)&v84 - v41;
    if (v43 >= 0x101)
    {
      v42 = (char *)_CFCreateArrayStorage(v40, 0, v96);
      v44 = v42;
    }

    else
    {
      v44 = 0LL;
    }

    v46 = &v42[8 * v32];
    if (v32 < 1)
    {
      unint64_t v47 = 0LL;
    }

    else
    {
      unint64_t v47 = 0LL;
      v49 = v88;
      v48 = (unsigned __int8 *)v89;
      v50 = a4;
      int64_t v51 = v32;
      do
      {
        if (*v48++)
        {
          *(void *)&v42[8 * v47] = *v50;
          *(void *)&v46[8 * v47++] = *v49;
        }

        ++v49;
        ++v50;
        --v51;
      }

      while (v51);
    }

    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]( (os_unfair_lock_s *)self->_cloudSetTarget,  (uint64_t)&v42[8 * v32],  (uint64_t)v42,  v47,  0,  (uint64_t)self);
    if (v32 < 1)
    {
      unint64_t v53 = 0LL;
    }

    else
    {
      unint64_t v53 = 0LL;
      v55 = v88;
      v54 = (unsigned __int8 *)v89;
      int64_t v56 = v32;
      v57 = a4;
      do
      {
        if (!*v54++)
        {
          *(void *)&v42[8 * v53] = *v57;
          *(void *)&v46[8 * v53++] = *v55;
        }

        ++v55;
        ++v57;
        --v56;
      }

      while (v56);
    }

    -[CFPrefsSource setValues:forKeys:count:copyValues:from:]( (os_unfair_lock_s *)*p_standardSetTarget,  (uint64_t)&v42[8 * v32],  (uint64_t)v42,  v53,  0,  (uint64_t)self);
    free(v44);
    if ((v19 & 1) == 0) {
      return;
    }
    goto LABEL_69;
  }

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
  cloudSetTarget = self->_cloudSetTarget;
  if (cloudSetTarget) {
    -[CFPrefsCloudSource fullCloudSynchronizeWithCompletionHandler:]( cloudSetTarget,  "fullCloudSynchronizeWithCompletionHandler:",  a3);
  }
  else {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (uint64_t)alreadylocked_requestNewData
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(const __CFArray **)(result + 80);
    if (v2 && (CFIndex Count = CFArrayGetCount(v2), Count >= 1))
    {
      CFIndex v4 = Count;
      result = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 80), 0), "synchronize");
      if ((_DWORD)result)
      {
        CFIndex v5 = 1LL;
        do
        {
          CFIndex v6 = v5;
          if (v4 == v5) {
            break;
          }
          char v7 = objc_msgSend((id)CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 80), v5), "synchronize");
          CFIndex v5 = v6 + 1;
        }

        while ((v7 & 1) != 0);
        return v4 <= v6;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

- (__CFArray)alreadylocked_copyKeyList
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!self->_sourceList) {
    return CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
  }
  uint64_t v5 = 0LL;
  CFIndex v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke;
  v4[3] = &unk_1899EC018;
  v4[4] = &v5;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
  CFMutableDictionaryRef Mutable = (__CFArray *)v6[3];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
  }
  _Block_object_dispose(&v5, 8);
  return Mutable;
}

void __52__CFPrefsSearchListSource_alreadylocked_copyKeyList__block_invoke( uint64_t a1,  CFDictionaryRef theDict)
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (theDict)
  {
    unint64_t Count = CFDictionaryGetCount(theDict);
    unint64_t v6 = Count;
    if (Count >> 60)
    {
      CFStringRef v11 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
      CFDictionaryRef v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v11,  0LL);
      CFRelease(v11);
      objc_exception_throw(v12);
      _Unwind_Resume(v13);
    }

    if (Count <= 1) {
      unint64_t Count = 1LL;
    }
    unint64_t v7 = MEMORY[0x1895F8858](Count, v5);
    uint64_t v9 = (const void **)((char *)v14 - v8);
    if (v6 >= 0x101)
    {
      uint64_t v9 = (const void **)_CFCreateArrayStorage(v7, 0, v14);
      uint64_t v10 = v9;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    CFDictionaryGetKeysAndValues(theDict, v9, 0LL);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v9,  v6,  &kCFTypeArrayCallBacks);
    free(v10);
  }

- (void)handleReply:(id)a3 toRequestNewDataMessage:(id)a4 onConnection:(id)a5 retryCount:(int)a6 error:(BOOL *)a7
{
  v17[7] = *MEMORY[0x1895F89C0];
  sourceList = self->_sourceList;
  if (!sourceList) {
    return;
  }
  if (!a3) {
    goto LABEL_5;
  }
  if (object_getClass(a3) != (Class)MEMORY[0x1895F9250])
  {
    sourceList = self->_sourceList;
LABEL_5:
    if (CFArrayGetCount(sourceList) >= 1)
    {
      CFIndex v12 = 0LL;
      do
        objc_msgSend((id)CFArrayGetValueAtIndex(self->_sourceList, v12++), "generationCount");
      while (CFArrayGetCount(self->_sourceList) > v12);
    }

    return;
  }

  xpc_object_t value = xpc_dictionary_get_value(a4, "CFPreferencesMessages");
  xpc_object_t v14 = xpc_dictionary_get_value(a3, "CFPreferencesMessages");
  if (v14)
  {
    uint64_t v15 = v14;
    CFIndex Count = CFArrayGetCount(self->_sourceList);
    if (Count != xpc_array_get_count(v15)) {
      -[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:].cold.1();
    }
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke;
    v17[3] = &unk_1899EC040;
    v17[4] = self;
    v17[5] = value;
    v17[6] = a5;
    xpc_array_apply(v15, v17);
  }

uint64_t __93__CFPrefsSearchListSource_handleReply_toRequestNewDataMessage_onConnection_retryCount_error___block_invoke( uint64_t a1,  size_t a2,  id a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (object_getClass(a3) != (Class)MEMORY[0x1895F92A8])
  {
    char v8 = 0;
    ValueAtIndex = (os_unfair_lock_s *)CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 80LL), a2);
    os_unfair_lock_lock(ValueAtIndex + 13);
    -[os_unfair_lock_s handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]( ValueAtIndex,  "handleReply:toRequestNewDataMessage:onConnection:retryCount:error:",  a3,  xpc_array_get_value(*(xpc_object_t *)(a1 + 40), a2),  *(void *)(a1 + 48),  0LL,  &v8);
    os_unfair_lock_unlock(ValueAtIndex + 13);
  }

  return 1LL;
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  sourceList = self->_sourceList;
  if (!sourceList) {
    return 0LL;
  }
  uint64_t v5 = *(void *)&a3;
  CFIndex Count = CFArrayGetCount(sourceList);
  MEMORY[0x1895F8858](Count, v7);
  char v8 = (const void **)((char *)&v20 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v24.location = 0LL;
  v24.length = Count;
  CFArrayGetValues(self->_sourceList, v24, v8);
  xpc_object_t v9 = xpc_null_create();
  MEMORY[0x1895F8858](v9, v10);
  CFStringRef v11 = (xpc_object_t *)v8;
  if (Count < 1)
  {
    xpc_object_t v18 = 0LL;
  }

  else
  {
    unint64_t v21 = self;
    char v22 = &v20;
    uint64_t v12 = 0LL;
    char v13 = 0;
    do
    {
      xpc_object_t v14 = (os_unfair_lock_s *)v8[v12];
      os_unfair_lock_lock(v14 + 13);
      uint64_t v15 = -[os_unfair_lock_s createRequestNewContentMessageForDaemon:]( v14,  "createRequestNewContentMessageForDaemon:",  v5);
      if (v15) {
        xpc_object_t v16 = (xpc_object_t)v15;
      }
      else {
        xpc_object_t v16 = v9;
      }
      v8[v12] = v16;
      os_unfair_lock_unlock(v14 + 13);
      v13 |= v16 != v9;
      ++v12;
    }

    while (Count != v12);
    if ((v13 & 1) != 0)
    {
      xpc_object_t v17 = xpc_array_create((xpc_object_t *)v8, Count);
      xpc_object_t v18 = -[CFPrefsSearchListSource createMultiMessageWithContainedMessages:]((uint64_t)v21, v17);
      xpc_release(v17);
      do
      {
        if (*v11 != v9) {
          xpc_release(*v11);
        }
        ++v11;
        --Count;
      }

      while (Count);
    }

    else
    {
      xpc_object_t v18 = 0LL;
    }
  }

  xpc_release(v9);
  return v18;
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke( uint64_t a1,  uint64_t a2,  int a3)
{
  v5[6] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  CFIndex v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2;
  v5[3] = &unk_1899EB458;
  v5[4] = a2;
  v5[5] = v3;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](v4, a3, 0LL, (uint64_t)v5);
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_2( uint64_t a1,  xpc_connection_t connection)
{
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(connection, *(xpc_object_t *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, xpc_object_t, xpc_connection_t))(v5 + 16))( v5,  *(void *)(a1 + 32),  v4,  connection);
  }
  xpc_release(v4);
}

void __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_3( uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v1[0] = MEMORY[0x1895F87A8];
  v1[1] = 3221225472LL;
  v1[2] = __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4;
  v1[3] = &unk_1899EC090;
  uint64_t v3 = *(void *)(a1 + 48);
  __int128 v2 = *(_OWORD *)(a1 + 32);
  dispatch_apply(2uLL, 0LL, v1);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = 40LL;
  if (!a2) {
    uint64_t v2 = 32LL;
  }
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + v2),  1LL);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_5( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  1LL);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_6( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  1LL);
}

uint64_t __103__CFPrefsSearchListSource_synchronouslySendSystemMessage_andUserMessage_andDirectMessage_replyHandler___block_invoke_7( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  2LL);
}

- (uint64_t)alreadylocked_generationCountFromListOfSources:(uint64_t)a3 count:
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = (void *)result;
    char v9 = 0;
    result = generationCountFromListOfSources(a2, a3, &v9);
    if (v9)
    {
      unint64_t v6 = (void *)[v5 createRequestNewContentMessageForDaemon:1];
      uint64_t v7 = (void *)[v5 createRequestNewContentMessageForDaemon:2];
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke;
      v8[3] = &unk_1899EC108;
      v8[4] = v5;
      -[CFPrefsSearchListSource synchronouslySendSystemMessage:andUserMessage:andDirectMessage:replyHandler:]( (uint64_t)v5,  (uint64_t)v6,  0LL,  (uint64_t)v7,  (uint64_t)v8);
      if (v6) {
        xpc_release(v6);
      }
      if (v7) {
        xpc_release(v7);
      }
      return generationCountFromListOfSources(a2, a3, &v9);
    }
  }

  return result;
}

uint64_t __80__CFPrefsSearchListSource_alreadylocked_generationCountFromListOfSources_count___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  char v5 = 0;
  return [*(id *)(a1 + 32) handleReply:a3 toRequestNewDataMessage:a2 onConnection:a4 retryCount:0 error:&v5];
}

- (void)handleChangeNotificationForDomainIdentifier:(__CFString *)a3 isRemote:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (self->_sourceList)
  {
    BOOL v4 = a4;
    if (CFEqual(a3, @"Volatile"))
    {
      -[CFPrefsSearchListSource generationCount](self, "generationCount");
    }

    else if (!v4 || (identifier = self->_identifier, identifier == a3) || CFEqual(identifier, a3))
    {
      sourceList = self->_sourceList;
      if (sourceList)
      {
        CFIndex Count = CFArrayGetCount(sourceList);
        uint64_t v11 = MEMORY[0x1895F8858](Count, v10);
        unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        xpc_object_t v14 = (uint64_t *)&v17[-v13];
        if (v11 >= 1)
        {
          v21.location = 0LL;
          v21.length = Count;
          CFArrayGetValues(self->_sourceList, v21, (const void **)&v17[-v13]);
        }
      }

      else
      {
        CFIndex Count = 0LL;
        xpc_object_t v14 = (uint64_t *)&v19;
      }

      char v18 = 0;
      uint64_t v15 = generationCountFromListOfSources(v14, Count, &v18);
    }
  }

- (int64_t)generationCount
{
  if (!self->_sourceList) {
    return 0LL;
  }
  os_unfair_lock_lock(&self->super._lock);
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)&__block_literal_global_32);
  os_unfair_lock_unlock(&self->super._lock);
  return atomic_load((unint64_t *)&self->super._generationCount);
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke;
  v4[3] = &unk_1899EC018;
  v4[4] = &v5;
  -[CFPrefsSearchListSource alreadylocked_getDictionary:]((uint64_t)self, (uint64_t)v4);
  uint64_t v2 = (__CFDictionary *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFMutableDictionaryRef __55__CFPrefsSearchListSource_alreadylocked_copyDictionary__block_invoke( CFMutableDictionaryRef result,  CFDictionaryRef theDict)
{
  if (theDict)
  {
    uint64_t v2 = (uint64_t)result;
    result = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, theDict);
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

uint64_t __55__CFPrefsSearchListSource_alreadylocked_getDictionary___block_invoke( uint64_t a1,  const __CFString *a2)
{
  return -[CFPrefsSearchListSource alreadylocked_useCloudForKey:](*(void *)(a1 + 32), a2);
}

- (CFMutableArrayRef)_getPendingNotifications
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = _CFGetTSD(0x10u);
  if (v1 == 16)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
    _CFSetTSD(0x10u, (uint64_t)Mutable, (uint64_t)pendingKVODestructor);
  }

  else
  {
    CFMutableArrayRef Mutable = (CFMutableArrayRef)v1;
    if (!v1) {
      -[CFPrefsSearchListSource _getPendingNotifications].cold.1();
    }
  }

  return Mutable;
}

- (void)deferredNotifyCausedByLocalWriteOfChangesToKey:(__CFString *)a3 fromValue:(void *)a4 toValue:(void *)a5
{
  uint64_t v6 = (char *)a4;
  keys[1] = *(void **)MEMORY[0x1895F89C0];
  values = a4;
  keys[0] = a3;
  uint64_t v11 = a5;
  os_unfair_lock_assert_owner(&self->super._lock);
  if (v6) {
    uint64_t v6 = (char *)CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const void **)keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  if (a5) {
    uint64_t v8 = (char *)CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  (const void **)keys,  (const void **)&v11,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS____CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](v9, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](v9, v8);
  -[_CFPrefsPendingKVONotification setOldValues:](v9, v6);
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, v9);
}

- (void)deferredNotifyCausedByLoadingOfChangesFromDictionary:(__CFDictionary *)a3 toDictionary:(__CFDictionary *)Copy
{
  if (a3) {
    CFRetain(a3);
  }
  if (Copy) {
    Copy = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, Copy);
  }
  xpc_object_t value = objc_alloc_init(&OBJC_CLASS____CFPrefsPendingKVONotification);
  -[_CFPrefsPendingKVONotification setSource:](value, (char *)self);
  -[_CFPrefsPendingKVONotification setValues:](value, (char *)Copy);
  -[_CFPrefsPendingKVONotification setOldValues:](value, (char *)a3);
  if (a3) {
    CFRelease(a3);
  }
  if (Copy) {
    CFRelease(Copy);
  }
  Pending = -[CFPrefsSearchListSource _getPendingNotifications]((uint64_t)self);
  CFArrayAppendValue(Pending, value);
}

- (uint64_t)alreadylocked_copyManagedValueForKey:
{
  return 0LL;
}

- (CFMutableDictionaryRef)alreadylocked_copyManagedDictionary
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = (const __CFArray *)objc_msgSend(a1, "alreadylocked_copyKeyList");
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFIndex Count = CFArrayGetCount(v1);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0LL; i != v4; ++i)
      CFArrayGetValueAtIndex(v1, i);
  }

  CFRelease(v1);
  return Mutable;
}

- (uint64_t)freeze
{
  if (result) {
    *(_BYTE *)(result + 120) = 1;
  }
  return result;
}

- (void)removeSource:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      CFIndex v4 = *(const __CFArray **)(a1 + 80);
      if (v4)
      {
        if (*(_BYTE *)(a1 + 120)) {
          -[CFPrefsSearchListSource removeSource:].cold.1();
        }
        v6.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
        v6.location = 0LL;
        CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v6, a2);
        if (FirstIndexOfValue != -1) {
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), FirstIndexOfValue);
        }
        atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(a1 + 32));
      }
    }
  }

- (void)replaceSource:(const void *)a3 withSource:
{
  if (a1)
  {
    CFIndex v4 = *(const __CFArray **)(a1 + 80);
    if (v4)
    {
      if (!a2 || !a3 || *(_BYTE *)(a1 + 120)) {
        -[CFPrefsSearchListSource replaceSource:withSource:].cold.1();
      }
      v8.length = CFArrayGetCount(*(CFArrayRef *)(a1 + 80));
      v8.location = 0LL;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v8, a2);
      if (FirstIndexOfValue != -1) {
        CFArraySetValueAtIndex(*(CFMutableArrayRef *)(a1 + 80), FirstIndexOfValue, a3);
      }
    }
  }

- (__CFString)domainIdentifier
{
  return self->_identifier;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  CFMutableDictionaryRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  os_unfair_lock_lock(&self->super._lock);
  sourceList = self->_sourceList;
  if (sourceList && (CFIndex Count = CFArrayGetCount(sourceList), Count >= 1))
  {
    CFIndex v7 = Count;
    MEMORY[0x1895F8858](Count, v6);
    uint64_t v9 = (const void **)((char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    v24.location = 0LL;
    v24.length = v7;
    CFArrayGetValues(self->_sourceList, v24, v9);
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___CFPrefsSearchListSource;
    uint64_t v10 = -[CFPrefsSource description](&v22, sel_description);
    CFStringAppend(Mutable, v10);
    CFStringAppend(Mutable, @"Sources: [\n");
    do
    {
      uint64_t v11 = (void *)_CFAutoreleasePoolPush();
      CFStringAppend(Mutable, @"    ");
      uint64_t v12 = (void *)*v9++;
      CFStringAppend(Mutable, (CFStringRef)[v12 description]);
      CFStringAppend(Mutable, @"\n");
      _CFAutoreleasePoolPop(v11);
      --v7;
    }

    while (v7);
    CFStringAppend(Mutable, @"]\n");
  }

  else
  {
    CFStringAppend(Mutable, @"Sources: []\n");
  }

  CFStringAppend(Mutable, @"Cloud Keys: [");
  cloudKeys = self->_cloudKeys;
  if (cloudKeys)
  {
    CFIndex v14 = CFSetGetCount(cloudKeys);
    uint64_t v16 = MEMORY[0x1895F8858](v14, v15);
    char v18 = (const __CFString **)((char *)&v21 - v17);
    if (v16 >= 1)
    {
      CFSetGetValues(self->_cloudKeys, (const void **)((char *)&v21 - v17));
      do
      {
        char v19 = *v18++;
        CFStringAppend(Mutable, v19);
        CFStringAppend(Mutable, @", ");
        --v14;
      }

      while (v14);
    }
  }

  CFStringAppend(Mutable, @"]\n");
  os_unfair_lock_unlock(&self->super._lock);
  return (id)CFAutorelease(Mutable);
}

- (__CFString)copyOSLogDescription
{
  ClassName = object_getClassName(self);
  return (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%s<%p> (Domain: %@, Container: %@)",  ClassName,  self,  -[CFPrefsSearchListSource domainIdentifier](self, "domainIdentifier"),  -[CFPrefsPlistSource container](self->_standardSetTarget, "container"));
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  sourceList = self->_sourceList;
  if (sourceList) {
    CFRelease(sourceList);
  }
  identifier = self->_identifier;
  if (identifier) {
    CFRelease(identifier);
  }
  cloudKeys = self->_cloudKeys;
  if (cloudKeys) {
    CFRelease(cloudKeys);
  }
  cloudPrefixKeys = self->_cloudPrefixKeys;
  if (cloudPrefixKeys) {
    CFRelease(cloudPrefixKeys);
  }
  keysToSources = self->_keysToSources;
  if (keysToSources) {
    CFRelease(keysToSources);
  }
  self->_identifier = 0LL;
  self->_sourceList = 0LL;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CFPrefsSearchListSource;
  -[CFPrefsSource dealloc](&v8, sel_dealloc);
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.1( uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 72);
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_27( &dword_180A4C000,  v1,  v2,  "No defaults configuration file found for %{public}@ (looked at %{public}@)",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)copyCloudConfigurationWithURL:(uint64_t)a1 outConfigFileSource:outStoreName:.cold.2( uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 72);
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_27( &dword_180A4C000,  v1,  v2,  "Found defaults configuration for %{public}@ at %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)addPreferencesObserver:.cold.1()
{
  __assert_rtn( "-[CFPrefsSearchListSource addPreferencesObserver:]",  "CFPrefsSearchListSource.m",  522,  "CFPreferencesInvalidOperation == [self alreadylocked_addPreferencesObserver:obs]");
}

- (void)removePreferencesObserver:.cold.1()
{
  __assert_rtn( "-[CFPrefsSearchListSource removePreferencesObserver:]",  "CFPrefsSearchListSource.m",  534,  "CFPreferencesInvalidOperation == [self alreadylocked_removePreferencesObserver:obs]");
}

- (void)addSource:.cold.1()
{
}

- (void)alreadylocked_copyValueForKey:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_0_27( &dword_180A4C000,  v1,  v2,  "found no value for key %{public}@ in %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_2_13();
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.1()
{
}

- (void)alreadylocked_setPrecopiedValues:forKeys:count:from:.cold.2()
{
}

- (void)handleReply:toRequestNewDataMessage:onConnection:retryCount:error:.cold.1()
{
  __assert_rtn( "-[CFPrefsSearchListSource handleReply:toRequestNewDataMessage:onConnection:retryCount:error:]",  "CFPrefsSearchListSource.m",  897,  "count == xpc_array_get_count(replyList)");
}

- (void)_getPendingNotifications
{
}

- (void)removeSource:.cold.1()
{
}

- (void)replaceSource:withSource:.cold.1()
{
}

@end
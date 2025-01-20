@interface _CFXPreferences
+ (id)copyDefaultPreferences;
- (BOOL)appValueIsForcedForKey:(__CFString *)a3 appIdentifier:;
- (BOOL)currentUserHasInvalidHomeDirectory;
- (BOOL)hasCloudValueForKey:(__CFString *)theString appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:;
- (BOOL)hasNonRegisteredValueForKey:(__CFString *)theString appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:;
- (CFMutableDictionaryRef)copyDictionaryForApp:(const __CFString *)a3 withContainer:;
- (CFMutableDictionaryRef)copyDictionaryForSourceWithIdentifier:(uint64_t)a1;
- (CFMutableDictionaryRef)copyManagedValuesForKeys:(__CFString *)theString identifier:(int)a4 useSystemContainer:;
- (CFMutableDictionaryRef)copyValuesForKeys:(__CFString *)a3 identifier:(const __CFString *)a4 user:(CFTypeRef)cf1 host:(const __CFString *)a6 container:;
- (CFMutableStringRef)copyDescriptionOfSearchLists;
- (_CFXPreferences)init;
- (uint64_t)_replaceDirectConnection:(uint64_t)result;
- (uint64_t)alreadylocked_withNamedVolatileSources:(uint64_t)result;
- (uint64_t)alreadylocked_withSearchLists:(uint64_t)result;
- (uint64_t)alreadylocked_withSources:(uint64_t)result;
- (uint64_t)appSynchronizeWithIdentifier:(const __CFString *)a3 container:;
- (uint64_t)copyDictionaryForVolatileSourceWithName:(uint64_t)a1;
- (uint64_t)copyKeyListForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)euid;
- (uint64_t)fileProtectionClassForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)preloadAppValuesForIdentifiers:(uint64_t)a3 containers:(uint64_t)a4 configurationURLs:(uint64_t)a5 count:;
- (uint64_t)shmemForRole:(const char *)a3 name:;
- (uint64_t)synchronizeIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)volatileSourceNames;
- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(void *)a1 andUserIdentifier:(int)a2;
- (void)_deliverPendingKVONotifications;
- (void)_setupNewDaemonConnection:(uint64_t)a3 invalidationHandler:;
- (void)addSuitePreferences:(CFTypeRef)cf1 toAppIdentifier:(uint64_t)a4 container:;
- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 containers:(__CFArray *)a5 cloudConfigurationURLs:(__CFArray *)a6;
- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 users:(__CFArray *)a5 hosts:(__CFArray *)a6 containers:(__CFArray *)a7 managedFlags:(__CFArray *)a8 cloudFlags:(__CFArray *)a9;
- (void)copyAppValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 container:(__CFString *)a5 configurationURL:(__CFURL *)a6;
- (void)copyValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7;
- (void)currentUserHasInvalidHomeDirectory;
- (void)dealloc;
- (void)destroyConnections;
- (void)flushCachesForAppIdentifier:(uint64_t)a3 user:;
- (void)flushManagedSources;
- (void)fullCloudSynchronizeForAppIdentifier:(const __CFString *)a3 container:(uint64_t)a4 configurationURL:(uint64_t)a5 completionHandler:;
- (void)generateKVONotificationsForIdentifier:(__CFString *)a3 withOldValues:(id)a4 newValues:(id)a5;
- (void)ingestVolatileStateFromPreferences:(uint64_t)a1;
- (void)registerDefaultValues:(__CFDictionary *)a3;
- (void)registerUserDefaultsInstance:(id)a3 configurationURL:(__CFURL *)a4;
- (void)removeSuite:(uint64_t)a3 fromApp:(uint64_t)a4 withContainer:;
- (void)removeVolatileSourceForName:(uint64_t)a1;
- (void)replaceSearchList:(uint64_t)a3 withSearchList:;
- (void)replaceValuesInSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 host:(uint64_t)a5 container:(const __CFDictionary *)a6 withValues:;
- (void)replaceValuesInVolatileSourceNamed:(const __CFDictionary *)a3 withValues:;
- (void)resetPreferences:(BOOL)a3;
- (void)setAccessRestricted:(__CFString *)cf1 forAppIdentifier:;
- (void)setBackupDisabled:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:;
- (void)setCloudSyncEnabled:(uint64_t)a3 forKey:(__CFString *)theString appIdentifier:(const __CFString *)a5 container:;
- (void)setDaemonCacheEnabled:(BOOL)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7;
- (void)setFileProtectionClass:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:;
- (void)setValue:(uint64_t)a3 forKey:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:;
- (void)setValue:(void *)a3 forKey:(__CFString *)a4 appIdentifier:(__CFString *)a5 container:(__CFString *)a6 configurationURL:(__CFURL *)a7;
- (void)setValuesForKeys:(uint64_t)a3 removingValuesForKeys:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:;
- (void)simulateTimerSynchronizeForTestingForUser:(__CFString *)a3;
- (void)synchronizeEverything;
- (void)unregisterUserDefaultsInstance:(id)a3;
- (void)updateSearchListsForIdentifier:(uint64_t)a1;
- (void)with23930198HackSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:;
- (void)withConnectionForRole:(uint64_t)a3 andUserIdentifier:(uint64_t)a4 performBlock:;
- (void)withManagedSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 perform:;
- (void)withNamedVolatileSourceForIdentifier:(uint64_t)a3 perform:;
- (void)withNamedVolatileSources:(uint64_t)a1;
- (void)withSearchListForIdentifier:(const __CFString *)a3 container:(uint64_t)a4 cloudConfigurationURL:(uint64_t)a5 perform:;
- (void)withSearchLists:(uint64_t)a1;
- (void)withSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:;
- (void)withSources:(uint64_t)a1;
- (void)withSuiteSearchListForIdentifier:(const __CFString *)cf1 user:(int)a4 locked:(uint64_t)a5 perform:;
@end

@implementation _CFXPreferences

- (void)withSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  unsigned __int8 v47 = a4;
  if (a1)
  {
    if (a4 && !CFEqual(@"kCFPreferencesAnyUser", cf2)) {
      unsigned __int8 v47 = 0;
    }
    CFStringRef v45 = 0LL;
    v46 = 0LL;
    v44 = 0LL;
    __int16 v43 = 0;
    _CFPrefsExtractQuadrupleFromPathIfPossible( a2,  (CFStringRef *)&v46,  &v45,  (CFTypeRef *)&v44,  &v47,  (_BYTE *)&v43 + 1,  &v43);
    CFStringRef v13 = v46;
    if (v46)
    {
      a2 = v46;
      if (a6) {
        -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:].cold.1();
      }
    }

    uint64_t v31 = a7;
    uint64_t v32 = a1;
    char v14 = a6;
    v15 = v44;
    CFStringRef v16 = v45;
    if (v45) {
      v17 = v45;
    }
    else {
      v17 = cf2;
    }
    if (v44) {
      v18 = v44;
    }
    else {
      v18 = a5;
    }
    CFStringRef v19 = _CFPrefsCopyUserForContainer(v17, v18);
    Copy = @"kCFPreferencesAnyUser";
    int v21 = CFEqual(@"kCFPreferencesAnyUser", v19);
    if (v47) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == 0;
    }
    if (v22) {
      int v23 = v47;
    }
    else {
      int v23 = 1;
    }
    unsigned __int8 v47 = v23;
    v42[0] = MEMORY[0x1895F87A8];
    v42[1] = 3221225472LL;
    v42[2] = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke;
    v42[3] = &__block_descriptor_64_e5_v8__0l;
    v42[4] = v15;
    v42[5] = v13;
    v42[6] = v16;
    v42[7] = v19;
    if (HIBYTE(v43))
    {
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]((os_unfair_lock_s *)v32, a2, (uint64_t)v19, v31);
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(v42);
    }

    else
    {
      uint64_t v24 = MEMORY[0x1895F87A8];
      CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
      if (CFEqual(v19, @"kCFPreferencesCurrentUser"))
      {
        Copy = @"kCFPreferencesCurrentUser";
        char v26 = v14;
      }

      else
      {
        char v26 = v14;
        if (!CFEqual(v19, @"kCFPreferencesAnyUser"))
        {
          CFStringRef v27 = CFCopyUserName();
          int v28 = CFEqual(v19, v27);
          CFRelease(v27);
          if (!@"kCFPreferencesCurrentUser" || (Copy = @"kCFPreferencesCurrentUser", !v28)) {
            Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v19);
          }
        }
      }

      if (withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce != -1) {
        dispatch_once( &withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce,  &__block_literal_global_166);
      }
      CacheKeyForQuintuplet = _CFPrefsCreateCacheKeyForQuintuplet(CacheStringForBundleID, Copy, v23 != 0, v18, v26);
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x3052000000LL;
      v39 = __Block_byref_object_copy__0;
      v40 = __Block_byref_object_dispose__0;
      uint64_t v41 = 0LL;
      v33[0] = v24;
      v33[1] = 3221225472LL;
      v33[2] = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170;
      v33[3] = &unk_1899E9A10;
      v33[6] = CacheKeyForQuintuplet;
      v33[7] = Copy;
      char v34 = v26;
      char v35 = v23;
      v33[8] = CacheStringForBundleID;
      v33[9] = v18;
      v33[4] = v32;
      v33[5] = &v36;
      os_unfair_lock_lock((os_unfair_lock_t)(v32 + 60));
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170( (uint64_t)v33,  *(CFDictionaryRef *)(v32 + 8));
      os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 60));
      CFRelease(Copy);
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke(v42);
      BOOL v30 = _CFPrefsArmPendingKVOSlot();
      (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, v37[5]);

      if (v30) {
        -[_CFXPreferences _deliverPendingKVONotifications]((os_unfair_lock_s *)v32);
      }
      _Block_object_dispose(&v36, 8);
    }
  }

- (void)withSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 8));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }

- (void)withNamedVolatileSourceForIdentifier:(uint64_t)a3 perform:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v8 = 0LL;
    v9 = &v8;
    uint64_t v10 = 0x3052000000LL;
    v11 = __Block_byref_object_copy__0;
    v12 = __Block_byref_object_dispose__0;
    uint64_t v13 = 0LL;
    CacheStringForBundleID = (const __CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CacheStringForBundleID);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke;
    v7[3] = &unk_1899E9A38;
    v7[4] = a1;
    v7[5] = &v8;
    v7[6] = Copy;
    v7[7] = CacheStringForBundleID;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke( (uint64_t)v7,  *(CFDictionaryRef *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
    LODWORD(CacheStringForBundleID) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9[5]);

    if ((_DWORD)CacheStringForBundleID) {
      -[_CFXPreferences _deliverPendingKVONotifications]((os_unfair_lock_s *)a1);
    }
    _Block_object_dispose(&v8, 8);
  }

- (void)withNamedVolatileSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
  }

- (uint64_t)alreadylocked_withSources:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 8));
  }
  return result;
}

- (uint64_t)alreadylocked_withNamedVolatileSources:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 16));
  }
  return result;
}

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 users:(__CFArray *)a5 hosts:(__CFArray *)a6 containers:(__CFArray *)a7 managedFlags:(__CFArray *)a8 cloudFlags:(__CFArray *)a9
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3052000000LL;
  uint64_t v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  uint64_t v40 = 0LL;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a7)
    || (CFIndex v11 = CFArrayGetCount(a4), v11 != CFArrayGetCount(a5))
    || (CFIndex v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6))
    || (CFIndex v13 = CFArrayGetCount(a4), v13 != CFArrayGetCount(a7))
    || (CFIndex v14 = CFArrayGetCount(a4), v14 != CFArrayGetCount(a8))
    || (CFIndex v15 = CFArrayGetCount(a4), v15 != CFArrayGetCount(a9)))
  {
    __assert_rtn( "-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]",  "CFPrefsSource.m",  1252,  "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(use rs) && CFArrayGetCount(identifiers) == CFArrayGetCount(hosts) && CFArrayGetCount(identifiers) == CFArrayGetCount(c ontainers) && CFArrayGetCount(identifiers) == CFArrayGetCount(managedFlags) && CFArrayGetCount(identifiers) == CFA rrayGetCount(isCloudFlags)");
  }

  CFIndex v16 = 0LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  while (v16 < CFArrayGetCount(a4))
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a7, v16);
    CFStringRef v19 = (const __CFString *)CFArrayGetValueAtIndex(a6, v16);
    v20 = (__objc2_class **)CFArrayGetValueAtIndex(a9, v16);
    int v21 = (__objc2_class **)CFArrayGetValueAtIndex(a8, v16);
    BOOL v22 = (__CFString *)CFArrayGetValueAtIndex(a4, v16);
    int v23 = (const __CFString *)CFArrayGetValueAtIndex(a5, v16);
    if (v21 == &__kCFBooleanTrue && v20 == &__kCFBooleanTrue) {
      __assert_rtn( "-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]",  "CFPrefsSource.m",  1260,  "!(managed && cloud)");
    }
    v33[0] = v17;
    v33[1] = 3221225472LL;
    v33[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke;
    v33[3] = &unk_1899E9A60;
    v33[4] = &v35;
    BOOL v34 = a3;
    if (v21 == &__kCFBooleanTrue)
    {
      v32[0] = v17;
      v32[1] = 3221225472LL;
      v32[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2;
      v32[3] = &unk_1899E9A88;
      v32[4] = v33;
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( (os_unfair_lock_s *)self,  v22,  (uint64_t)v23,  (uint64_t)v32);
    }

    else
    {
      v31[0] = v17;
      v31[1] = 3221225472LL;
      if (ValueAtIndex == &__kCFNull) {
        uint64_t v24 = 0LL;
      }
      else {
        uint64_t v24 = (const __CFString *)ValueAtIndex;
      }
      v31[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3;
      v31[3] = &unk_1899E9AB0;
      v31[4] = v33;
      -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( (uint64_t)self,  v22,  v23,  v19 == @"kCFPreferencesCurrentHost",  v24,  v20 == &__kCFBooleanTrue,  (uint64_t)v31);
    }

    ++v16;
  }

  _Block_object_dispose(&v35, 8);
}

- (CFMutableStringRef)copyDescriptionOfSearchLists
{
  if (!a1) {
    return 0LL;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 24), (CFDictionaryApplierFunction)copyDescriptionApplier, Mutable);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  return Mutable;
}

- (void)withSuiteSearchListForIdentifier:(const __CFString *)cf1 user:(int)a4 locked:(uint64_t)a5 perform:
{
  v27[4] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x2020000000LL;
    v27[3] = a2;
    uint64_t v21 = 0LL;
    BOOL v22 = &v21;
    uint64_t v23 = 0x3052000000LL;
    uint64_t v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    uint64_t v26 = 0LL;
    if (CFEqual(cf1, @"kCFPreferencesCurrentUser"))
    {
      CFStringRef Copy = @"kCFPreferencesCurrentUser";
    }

    else
    {
      CFStringRef Copy = @"kCFPreferencesAnyUser";
      if (!CFEqual(cf1, @"kCFPreferencesAnyUser"))
      {
        CFStringRef v11 = CFCopyUserName();
        int v12 = CFEqual(cf1, v11);
        CFRelease(v11);
        if (!@"kCFPreferencesCurrentUser" || (CFStringRef Copy = @"kCFPreferencesCurrentUser", !v12)) {
          CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
        }
      }
    }

    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    CFIndex v14 = __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke;
    CFIndex v15 = &unk_1899EC210;
    uint64_t v19 = a2;
    CFStringRef v20 = Copy;
    uint64_t v17 = v27;
    v18 = &v21;
    uint64_t v16 = a1;
    if (a4)
    {
      __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke( (uint64_t)v13,  *(const __CFDictionary **)(a1 + 24));
    }

    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
      v14((uint64_t)v13, *(const __CFDictionary **)(a1 + 24));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    }

    (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a5, v22[5]);

    CFRelease(Copy);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v27, 8);
  }

- (void)with23930198HackSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  if (a1) {
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, cf2, a4, a5, a6, a7);
  }
}

- (void)updateSearchListsForIdentifier:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = 0LL;
    v7 = &v6;
    uint64_t v8 = 0x2020000000LL;
    uint64_t v9 = 0LL;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, *(CFDictionaryRef *)(a1 + 24));
    v7[3] = (uint64_t)Copy;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v5 = (const __CFDictionary *)v7[3];
    if (v5)
    {
      CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)notifySearchListOfRemoteChangesCallback, a2);
      CFRelease((CFTypeRef)v7[3]);
    }

    _Block_object_dispose(&v6, 8);
  }

- (void)withSearchLists:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }

- (void)withSearchListForIdentifier:(const __CFString *)a3 container:(uint64_t)a4 cloudConfigurationURL:(uint64_t)a5 perform:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v6 = a3;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = (uint64_t)__108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke;
    v14[3] = (uint64_t)&unk_1899EC1C0;
    v14[5] = a5;
    v14[6] = a4;
    v14[4] = a1;
    char v19 = 0;
    CFStringRef v17 = 0LL;
    CFStringRef v18 = 0LL;
    CFTypeRef cf = 0LL;
    if (a3 || CFStringGetCharacterAtIndex(theString, 0LL) != 47) {
      goto LABEL_35;
    }
    if (a4) {
      -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:].cold.1();
    }
    __int16 v15 = 0;
    _CFPrefsExtractQuadrupleFromPathIfPossible(theString, &v18, &v17, &cf, &v19, (_BYTE *)&v15 + 1, &v15);
    uint64_t v8 = v18;
    if (!v18)
    {
LABEL_35:
      if (CFStringHasSuffix(theString, @".plist"))
      {
        v21.length = CFStringGetLength(theString) - 6;
        v21.location = 0LL;
        uint64_t v8 = CFStringCreateWithSubstring((CFAllocatorRef)&__kCFAllocatorSystemDefault, theString, v21);
        CFStringRef v18 = v8;
      }

      else
      {
        uint64_t v8 = v18;
      }
    }

    if (cf) {
      uint64_t v6 = (const __CFString *)cf;
    }
    if (v8) {
      uint64_t v9 = (__CFString *)v8;
    }
    else {
      uint64_t v9 = theString;
    }
    if (v17) {
      uint64_t v10 = v17;
    }
    else {
      uint64_t v10 = @"kCFPreferencesCurrentUser";
    }
    CFStringRef v11 = _CFPrefsCopyUserForContainer(v10, v6);
    if (CFEqual(@"kCFPreferencesAnyUser", v11)) {
      BOOL v12 = v19 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12) {
      char v19 = 1;
    }
    CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(v9);
    __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke( v14,  CacheStringForBundleID,  (uint64_t)v11,  v19,  v6);
    if (v18) {
      CFRelease(v18);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v17) {
      CFRelease(v17);
    }
    if (v11) {
      CFRelease(v11);
    }
  }

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 containers:(__CFArray *)a5 cloudConfigurationURLs:(__CFArray *)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  uint64_t v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  uint64_t v26 = 0LL;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a5) || (CFIndex v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6))) {
    __assert_rtn( "-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]",  "CFPrefsSearchListSource.m",  1770,  "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(cloudURLs)");
  }
  for (CFIndex i = 0LL; i < CFArrayGetCount(a4); ++i)
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a5, i);
    __int16 v15 = (__objc2_class **)CFArrayGetValueAtIndex(a6, i);
    uint64_t v16 = (__CFString *)CFArrayGetValueAtIndex(a4, i);
    v19[0] = MEMORY[0x1895F87A8];
    if (ValueAtIndex == &__kCFNull) {
      CFStringRef v17 = 0LL;
    }
    else {
      CFStringRef v17 = (const __CFString *)ValueAtIndex;
    }
    v19[1] = 3221225472LL;
    if (v15 == &__kCFNull) {
      uint64_t v18 = 0LL;
    }
    else {
      uint64_t v18 = (uint64_t)v15;
    }
    v19[2] = __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke;
    v19[3] = &unk_1899EC1E8;
    v19[4] = &v21;
    BOOL v20 = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  v16,  v17,  v18,  (uint64_t)v19);
  }

  _Block_object_dispose(&v21, 8);
}

- (uint64_t)alreadylocked_withSearchLists:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 24));
  }
  return result;
}

- (void)replaceSearchList:(uint64_t)a3 withSearchList:
{
  void v7[8] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &kCFTypeArrayCallBacks);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke;
    v7[3] = &unk_1899EC238;
    v7[4] = a2;
    v7[5] = a3;
    v7[6] = a1;
    v7[7] = Mutable;
    __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke( (uint64_t)v7,  *(CFDictionaryRef *)(a1 + 24));
  }

- (void)ingestVolatileStateFromPreferences:(uint64_t)a1
{
  v2[6] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a2 == a1) {
      -[_CFXPreferences ingestVolatileStateFromPreferences:].cold.1();
    }
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke;
    v2[3] = &unk_1899EE460;
    v2[4] = a2;
    v2[5] = a1;
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v2);
  }

- (uint64_t)euid
{
  if (result) {
    return *(unsigned int *)(result + 52);
  }
  return result;
}

- (BOOL)currentUserHasInvalidHomeDirectory
{
  if (result)
  {
    BOOL v1 = result;
    v2 = (unsigned __int8 *)(result + 56);
    if (atomic_load((unsigned __int8 *)(result + 56)))
    {
LABEL_15:
      int v8 = atomic_load(v2);
      return v8 == 2;
    }

    v4 = (const char *)_CFUnsandboxedHomeDirectoryForCurrentUser();
    v5 = (char *)v4;
    if (v4)
    {
      if (*v4 && strncmp(v4, "/var/empty", 0xAuLL))
      {
        atomic_store(1u, (unsigned __int8 *)(v1 + 56));
LABEL_14:
        free(v5);
        goto LABEL_15;
      }

      atomic_store(2u, (unsigned __int8 *)(v1 + 56));
      if (*v5) {
        uint64_t v6 = "starts with /var/empty";
      }
      else {
        uint64_t v6 = "is empty";
      }
    }

    else
    {
      atomic_store(2u, (unsigned __int8 *)(v1 + 56));
      uint64_t v6 = "is null";
    }

    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
    v7 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_CFXPreferences currentUserHasInvalidHomeDirectory].cold.1((uint64_t)v6, v7);
    }
    _CFSetTSD(0xFu, 0LL, 0LL);
    goto LABEL_14;
  }

  return result;
}

- (_CFXPreferences)init
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____CFXPreferences;
  v2 = -[_CFXPreferences init](&v11, sel_init);
  if (v2)
  {
    v2->_sources = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v2->_sourcesLock._os_unfair_lock_opaque = 0;
    v2->_namedVolatileSources = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v2->_namedVolatileSourcesLock._os_unfair_lock_opaque = 0;
    v2->_searchLists = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v2->_searchListsLock._os_unfair_lock_opaque = 0;
    v2->_launchdUID = -1;
    v2->_euid = _CFGetEUID();
    v3 = (void *)xpc_copy_entitlement_for_self();
    v4 = v3;
    if (v3 && object_getClass(v3) == (Class)MEMORY[0x1895F9220] && (size_t count = xpc_array_get_count(v4)) != 0)
    {
      size_t v7 = count;
      size_t v8 = 0LL;
      v2->_groupContainersForCurrentUser = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
      do
      {
        string = xpc_array_get_string(v4, v8);
        CFStringRef v10 = CFStringCreateWithCString(0LL, string, 0x8000100u);
        CFSetAddValue(v2->_groupContainersForCurrentUser, v10);
        CFRelease(v10);
        ++v8;
      }

      while (v7 != v8);
    }

    else
    {
      v2->_groupContainersForCurrentUser = 0LL;
    }

    if (v4) {
      xpc_release(v4);
    }
  }

  return v2;
}

+ (id)copyDefaultPreferences
{
  if ((_CFPrefsCurrentProcessIsCFPrefsD() & 1) != 0) {
    return 0LL;
  }
  if (_CFPrefsCopyDefaultPreferences_onceToken != -1) {
    dispatch_once(&_CFPrefsCopyDefaultPreferences_onceToken, &__block_literal_global_185);
  }
  return (id)[(id)_CFPrefsCopyDefaultPreferences_defaultPrefs copyPrefs];
}

- (void)unregisterUserDefaultsInstance:(id)a3
{
  v7[5] = *MEMORY[0x1895F89C0];
  v5 = (__CFString *)[a3 _identifier];
  uint64_t v6 = (const __CFString *)[a3 _container];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke;
  v7[3] = &unk_1899EBFC8;
  v7[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  v5,  v6,  0LL,  (uint64_t)v7);
}

- (void)registerUserDefaultsInstance:(id)a3 configurationURL:(__CFURL *)a4
{
  v9[5] = *MEMORY[0x1895F89C0];
  size_t v7 = (__CFString *)[a3 _identifier];
  size_t v8 = (const __CFString *)[a3 _container];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke;
  v9[3] = &unk_1899EBFC8;
  v9[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  v7,  v8,  (uint64_t)a4,  (uint64_t)v9);
}

- (void)flushManagedSources
{
  v1[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __38___CFXPreferences_flushManagedSources__block_invoke;
    v1[3] = &unk_1899ED920;
    v1[4] = a1;
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 1, 0LL, (uint64_t)v1);
    _CFPrefsResetManagedPreferencesStateCache();
  }

- (void)withConnectionForRole:(uint64_t)a3 andUserIdentifier:(uint64_t)a4 performBlock:
{
  if (a1)
  {
    v5 = -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:](a1, a2);
    (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v5);
    if (v5) {
      xpc_release(v5);
    }
  }

- (BOOL)appValueIsForcedForKey:(__CFString *)a3 appIdentifier:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v12 = 0LL;
  CFIndex v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke;
  v11[3] = &unk_1899EE0E8;
  v11[4] = &v12;
  v11[5] = a2;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( a1,  a3,  (uint64_t)@"kCFPreferencesCurrentUser",  (uint64_t)v11);
  int v7 = *((unsigned __int8 *)v13 + 24);
  if (!*((_BYTE *)v13 + 24))
  {
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2;
    v10[3] = &unk_1899EE0E8;
    v10[4] = &v12;
    v10[5] = a2;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( a1,  a3,  (uint64_t)@"kCFPreferencesAnyUser",  (uint64_t)v10);
    int v7 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v8 = v7 != 0;
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (BOOL)hasCloudValueForKey:(__CFString *)theString appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1899EE118;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( a1,  theString,  a4,  a5,  (uint64_t)v7);
  BOOL v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)hasNonRegisteredValueForKey:(__CFString *)theString appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1899EE118;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( a1,  theString,  a4,  a5,  (uint64_t)v7);
  BOOL v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (uint64_t)copyKeyListForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke;
  v14[3] = &unk_1899EE148;
  v14[4] = &v15;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v14);
  uint64_t v10 = (const __CFArray *)v16[3];
  if (v10)
  {
    CFIndex Count = CFArrayGetCount(v10);
    uint64_t v12 = v16[3];
    if (!Count)
    {
      CFRelease((CFTypeRef)v16[3]);
      uint64_t v12 = 0LL;
      v16[3] = 0LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)synchronizeEverything
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v3 = 0LL;
    v4 = &v3;
    uint64_t v5 = 0x2020000000LL;
    uint64_t v6 = 0LL;
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __40___CFXPreferences_synchronizeEverything__block_invoke;
    v2[3] = &unk_1899EC018;
    v2[4] = &v3;
    -[_CFXPreferences withSources:](a1, (uint64_t)v2);
    BOOL v1 = (const __CFDictionary *)v4[3];
    if (v1)
    {
      CFDictionaryApplyFunction(v1, (CFDictionaryApplierFunction)synchronizeApplier, 0LL);
      CFRelease((CFTypeRef)v4[3]);
    }

    _Block_object_dispose(&v3, 8);
  }

- (uint64_t)synchronizeIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1899EE148;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)setDaemonCacheEnabled:(BOOL)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  BOOL v12 = CFEqual(a6, @"kCFPreferencesCurrentHost") != 0;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  void v13[2] = __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke;
  v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
  BOOL v14 = a3;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( (uint64_t)self,  a4,  a5,  v12,  a7,  0,  (uint64_t)v13);
}

- (void)flushCachesForAppIdentifier:(uint64_t)a3 user:
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(a2);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke;
    v6[3] = &unk_1899EE190;
    int v7 = 1;
    v6[4] = a1;
    v6[5] = CacheStringForBundleID;
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 1, a3, (uint64_t)v6);
  }

- (void)simulateTimerSynchronizeForTestingForUser:(__CFString *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke;
  v3[3] = &unk_1899EE1B8;
  int v4 = 1;
  v3[4] = self;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](self, 1, (uint64_t)a3, (uint64_t)v3);
}

- (void)setBackupDisabled:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setBackupDisabled:identifier:user:host:container:].cold.1();
    }
    BOOL v12 = CFEqual(a5, @"kCFPreferencesCurrentHost") != 0;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    void v13[2] = __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    char v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  cf1,  a4,  v12,  a6,  0,  (uint64_t)v13);
  }

- (void)setFileProtectionClass:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setFileProtectionClass:identifier:user:host:container:].cold.1();
    }
    BOOL v12 = CFEqual(a5, @"kCFPreferencesCurrentHost") != 0;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    void v13[2] = __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_36_e23_v16__0__CFPrefsSource_8l;
    int v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  cf1,  a4,  v12,  a6,  0,  (uint64_t)v13);
  }

- (uint64_t)fileProtectionClassForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  int v16 = -1;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1899EE148;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  uint64_t v10 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)setAccessRestricted:(__CFString *)cf1 forAppIdentifier:
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setAccessRestricted:forAppIdentifier:].cold.1();
    }
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke;
    v6[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    char v7 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  cf1,  @"kCFPreferencesAnyUser",  1,  0LL,  0,  (uint64_t)v6);
  }

- (void)addSuitePreferences:(CFTypeRef)cf1 toAppIdentifier:(uint64_t)a4 container:
{
  v11[4] = *MEMORY[0x1895F89C0];
  if (a1 && !CFEqual(cf1, a2))
  {
    v11[0] = 0LL;
    v11[1] = v11;
    v11[2] = 0x2020000000LL;
    v11[3] = a2;
    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x2020000000LL;
    v10[3] = a4;
    BOOL v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke;
    v9[3] = &unk_1899EE230;
    v9[4] = a1;
    v9[5] = v11;
    void v9[6] = v10;
    v9[7] = cf1;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v11, 8);
  }

- (void)_deliverPendingKVONotifications
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 15);
    os_unfair_lock_assert_not_owner(a1 + 16);
    os_unfair_lock_assert_not_owner(a1 + 17);
    uint64_t v2 = _CFGetTSD(0x10u);
    if (v2)
    {
      uint64_t v3 = (const __CFArray *)v2;
      _CFSetTSD(0x10u, 0LL, 0LL);
      if (v3 != (const __CFArray *)16)
      {
        _CFPrefsDeliverPendingKVONotificationsGuts(v3);
        CFRelease(v3);
      }
    }
  }

- (void)fullCloudSynchronizeForAppIdentifier:(const __CFString *)a3 container:(uint64_t)a4 configurationURL:(uint64_t)a5 completionHandler:
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke;
    v5[3] = &unk_1899EE258;
    v5[4] = a5;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, a4, (uint64_t)v5);
  }

- (void)setCloudSyncEnabled:(uint64_t)a3 forKey:(__CFString *)theString appIdentifier:(const __CFString *)a5 container:
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke;
    v5[3] = &__block_descriptor_41_e33_v16__0__CFPrefsSearchListSource_8l;
    char v6 = a2;
    v5[4] = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( a1,  theString,  a5,  0LL,  (uint64_t)v5);
  }

- (void)setValuesForKeys:(uint64_t)a3 removingValuesForKeys:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  v14[6] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    BOOL v13 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    v14[4] = a2;
    void v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  a4,  a5,  v13,  a7,  0,  (uint64_t)v14);
  }

- (void)setValue:(void *)a3 forKey:(__CFString *)a4 appIdentifier:(__CFString *)a5 container:(__CFString *)a6 configurationURL:(__CFURL *)a7
{
  void v7[6] = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &__block_descriptor_48_e33_v16__0__CFPrefsSearchListSource_8l;
  v7[4] = a3;
  v7[5] = a4;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  a5,  a6,  (uint64_t)a7,  (uint64_t)v7);
}

- (CFMutableDictionaryRef)copyValuesForKeys:(__CFString *)a3 identifier:(const __CFString *)a4 user:(CFTypeRef)cf1 host:(const __CFString *)a6 container:
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  BOOL v11 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke;
  v14[3] = &unk_1899EE330;
  v14[4] = &v15;
  void v14[5] = a2;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  a3,  a4,  v11,  a6,  0,  (uint64_t)v14);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)v16[3];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  _Block_object_dispose(&v15, 8);
  return Mutable;
}

- (CFMutableDictionaryRef)copyManagedValuesForKeys:(__CFString *)theString identifier:(int)a4 useSystemContainer:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  if (a4)
  {
    BOOL v8 = _CFPreferencesCopyManagedPreferencesContainerURL();
    BOOL v9 = v8;
    if (v8)
    {
      uint64_t v7 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
      CFRelease(v9);
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke;
  v12[3] = &unk_1899EE118;
  v12[4] = &v13;
  void v12[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( a1,  theString,  v7,  0LL,  (uint64_t)v12);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)v14[3];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  _Block_object_dispose(&v13, 8);
  return Mutable;
}

- (void)setValue:(uint64_t)a3 forKey:(__CFString *)a4 identifier:(const __CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  void v14[6] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    BOOL v13 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    v14[4] = a2;
    void v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  a4,  a5,  v13,  a7,  0,  (uint64_t)v14);
  }

- (void)copyValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  BOOL v12 = CFEqual(a6, @"kCFPreferencesCurrentHost") != 0;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke;
  v15[3] = &unk_1899EE330;
  v15[4] = &v16;
  v15[5] = a3;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]( (uint64_t)self,  a4,  a5,  v12,  a7,  0,  (uint64_t)v15);
  BOOL v13 = (void *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (uint64_t)preloadAppValuesForIdentifiers:(uint64_t)a3 containers:(uint64_t)a4 configurationURLs:(uint64_t)a5 count:
{
  if (result) {
    return +[CFPrefsSearchListSource preloadDomainsForIdentifiers:containers:cloudConfigurationURLs:count:containingPreferences:]( &OBJC_CLASS___CFPrefsSearchListSource,  a2,  a3,  a4,  a5,  result);
  }
  return result;
}

- (void)copyAppValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 container:(__CFString *)a5 configurationURL:(__CFURL *)a6
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke;
  v8[3] = &unk_1899EE118;
  v8[4] = &v9;
  v8[5] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  a4,  a5,  (uint64_t)a6,  (uint64_t)v8);
  char v6 = (void *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)replaceValuesInSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 host:(uint64_t)a5 container:(const __CFDictionary *)a6 withValues:
{
  v6[9] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke;
    v6[3] = &unk_1899EE378;
    void v6[4] = a1;
    v6[5] = a2;
    void v6[6] = a3;
    v6[7] = a4;
    v6[8] = a5;
    withKeysAndValues(a6, (uint64_t)v6);
  }

- (void)removeVolatileSourceForName:(uint64_t)a1
{
  void v5[5] = *MEMORY[0x1895F89C0];
  if (a1 && !CFEqual(cf1, @"NSArgumentDomain") && !CFEqual(cf1, @"NSRegistrationDomain"))
  {
    uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(cf1);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __47___CFXPreferences_removeVolatileSourceForName___block_invoke;
    v5[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
    v5[4] = CacheStringForBundleID;
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v5);
  }

- (CFMutableDictionaryRef)copyDictionaryForSourceWithIdentifier:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke;
  v6[3] = &unk_1899EE148;
  void v6[4] = &v7;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( a1,  a2,  @"kCFPreferencesCurrentUser",  0,  0LL,  0,  (uint64_t)v6);
  uint64_t v2 = (const __CFDictionary *)v8[3];
  if (v2)
  {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, v2);
    int v4 = (const void *)v8[3];
    if (v4) {
      CFRelease(v4);
    }
  }

  else
  {
    MutableCFDictionaryRef Copy = 0LL;
  }

  _Block_object_dispose(&v7, 8);
  return MutableCopy;
}

- (uint64_t)copyDictionaryForVolatileSourceWithName:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000LL;
    uint64_t v14 = 0LL;
    if (CFEqual(cf1, @"NSArgumentDomain") || CFEqual(cf1, @"NSRegistrationDomain"))
    {
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke;
      v10[3] = &unk_1899EE148;
      void v10[4] = &v11;
      -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, cf1, (uint64_t)v10);
    }

    else
    {
      uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(cf1);
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2;
      v9[3] = &unk_1899EBFF0;
      v9[4] = &v11;
      v9[5] = CacheStringForBundleID;
      -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v9);
    }

    int v4 = (const __CFDictionary *)v12[3];
    if (v4) {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, v4);
    }
    else {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    }
    uint64_t v2 = (uint64_t)MutableCopy;
    char v6 = (const void *)v12[3];
    if (v6) {
      CFRelease(v6);
    }
    _Block_object_dispose(&v11, 8);
  }

  return v2;
}

- (CFMutableDictionaryRef)copyDictionaryForApp:(const __CFString *)a3 withContainer:
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke;
  v8[3] = &unk_1899EE3C0;
  v8[4] = &v9;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0LL, (uint64_t)v8);
  uint64_t v3 = (const __CFDictionary *)v10[3];
  if (v3) {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, v3);
  }
  else {
    MutableCFDictionaryRef Copy = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  CFMutableDictionaryRef v5 = MutableCopy;
  char v6 = (const void *)v10[3];
  if (v6) {
    CFRelease(v6);
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (uint64_t)volatileSourceNames
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  CFMutableDictionaryRef v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __38___CFXPreferences_volatileSourceNames__block_invoke;
  v3[3] = &unk_1899EC018;
  v3[4] = &v4;
  -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)registerDefaultValues:(__CFDictionary *)a3
{
  void v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __41___CFXPreferences_registerDefaultValues___block_invoke;
  v3[3] = &unk_1899EE3E8;
  v3[4] = self;
  withKeysAndValues(a3, (uint64_t)v3);
}

- (void)resetPreferences:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __36___CFXPreferences_resetPreferences___block_invoke;
  v4[3] = &unk_1899EE500;
  BOOL v5 = a3;
  v4[4] = self;
  v4[5] = &v6;
  -[_CFXPreferences withSearchLists:]((uint64_t)self, (uint64_t)v4);
  uint64_t v3 = (const void *)v7[3];
  if (v3) {
    CFRelease(v3);
  }
  _Block_object_dispose(&v6, 8);
}

- (void)destroyConnections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2) {
      xpc_release(v2);
    }
    *(void *)(a1 + 32) = 0LL;
    _daemonShmem = 0LL;
    _agentShmem = 0LL;
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3) {
      xpc_release(v3);
    }
    *(void *)(a1 + 40) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
  }

- (uint64_t)shmemForRole:(const char *)a3 name:
{
  block[5] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (a2 != 2 && !_CFPrefsDirectMode())
  {
    if (a2 == 1)
    {
      if ((shmemForRole_name__cannotAccessDaemonShmem & 1) == 0)
      {
LABEL_12:
        os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
        uint64_t v7 = &_daemonShmem;
        if (a2 != 1) {
          uint64_t v7 = &_agentShmem;
        }
        uint64_t v6 = (void *)*v7;
        if (*v7)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
          return (uint64_t)v6;
        }

        int v8 = shm_open(a3, 0, 0LL);
        if (v8 == -1)
        {
          uint64_t v6 = 0LL;
        }

        else
        {
          int v9 = v8;
          uint64_t v6 = mmap(0LL, 0x4000uLL, 1, 1, v8, 0LL);
          close(v9);
          if (v6 == (void *)-1LL)
          {
            if (a2 == 1)
            {
              uint64_t v6 = 0LL;
              shmemForRole_name__cannotAccessDaemonShmem = 1;
LABEL_22:
              _daemonShmem = (uint64_t)v6;
LABEL_25:
              os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
              if (v6) {
                return (uint64_t)v6;
              }
              block[0] = MEMORY[0x1895F87A8];
              block[1] = 3221225472LL;
              block[2] = __37___CFXPreferences_shmemForRole_name___block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0l;
              block[4] = a3;
              if (shmemForRole_name__onceToken == -1) {
                return 0LL;
              }
              dispatch_once(&shmemForRole_name__onceToken, block);
              return 0LL;
            }

            uint64_t v6 = 0LL;
            shmemForRole_name__cannotAccessAgentShmem = 1;
LABEL_24:
            _agentShmem = (uint64_t)v6;
            goto LABEL_25;
          }
        }

        if (a2 == 1) {
          goto LABEL_22;
        }
        goto LABEL_24;
      }
    }

    else if ((shmemForRole_name__cannotAccessAgentShmem & 1) == 0)
    {
      goto LABEL_12;
    }

    return 0LL;
  }

  if (directCFPrefsD_onceToken != -1) {
    dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_190);
  }
  return -[CFPrefsDaemon shmem](directCFPrefsD_daemon);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  -[_CFXPreferences destroyConnections]((uint64_t)self);
  sources = self->_sources;
  if (sources) {
    CFRelease(sources);
  }
  namedVolatileSources = self->_namedVolatileSources;
  if (namedVolatileSources) {
    CFRelease(namedVolatileSources);
  }
  searchLists = self->_searchLists;
  if (searchLists) {
    CFRelease(searchLists);
  }
  groupContainersForCurrentUser = self->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser) {
    CFRelease(groupContainersForCurrentUser);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____CFXPreferences;
  -[_CFXPreferences dealloc](&v7, sel_dealloc);
}

- (void)_setupNewDaemonConnection:(uint64_t)a3 invalidationHandler:
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  if (val)
  {
    objc_initWeak(location, val);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke;
    v5[3] = &unk_1899EE570;
    objc_copyWeak(&v6, location);
    v5[4] = a3;
    xpc_connection_set_event_handler(a2, v5);
    xpc_connection_activate(a2);
    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }

- (uint64_t)_replaceDirectConnection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (xpc_object_t *)result;
    os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    uint64_t v4 = (_xpc_connection_s *)v3[5];
    if (v4)
    {
      xpc_connection_cancel(v4);
      xpc_release(v3[5]);
      void v3[5] = 0LL;
    }

    void v3[5] = xpc_retain(a2);
    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](v3, (_xpc_connection_s *)a2, 0LL);
    os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    return -[xpc_object_t resetPreferences:](v3, "resetPreferences:", 0LL);
  }

  return result;
}

- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(void *)a1 andUserIdentifier:(int)a2
{
  if (!a1) {
    return 0LL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  BOOL v4 = _CFPrefsDirectMode();
  int v5 = a2 == 2 || v4;
  if (v5) {
    uint64_t v6 = 5LL;
  }
  else {
    uint64_t v6 = 4LL;
  }
  objc_super v7 = (void *)a1[v6];
  if (!v7)
  {
    if (v5)
    {
      if (directCFPrefsD_onceToken != -1) {
        dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_190);
      }
      uint64_t v8 = (_xpc_connection_s *)-[CFPrefsDaemon listener](directCFPrefsD_daemon);
      int v9 = xpc_endpoint_create(v8);
      a1[5] = xpc_connection_create_from_endpoint(v9);
      xpc_release(v9);
    }

    else
    {
      uint64_t v10 = "com.apple.cfprefsd.daemon";
      else {
        uint64_t v11 = 2LL * (getenv("__CFPreferencesTestDaemon") == 0LL);
      }
      a1[4] = xpc_connection_create_mach_service(v10, 0LL, v11);
    }

    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](a1, (_xpc_connection_s *)a1[v6], 0LL);
    objc_super v7 = (void *)a1[v6];
  }

  xpc_retain(v7);
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  return v7;
}

- (uint64_t)appSynchronizeWithIdentifier:(const __CFString *)a3 container:
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke;
  v5[3] = &unk_1899EE3C0;
  v5[4] = &v6;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0LL, (uint64_t)v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)removeSuite:(uint64_t)a3 fromApp:(uint64_t)a4 withContainer:
{
  void v9[8] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    BOOL v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke;
    v9[3] = &unk_1899EE5E8;
    v9[4] = a1;
    v9[5] = a3;
    void v9[6] = a2;
    v9[7] = a4;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
  }

- (void)replaceValuesInVolatileSourceNamed:(const __CFDictionary *)a3 withValues:
{
  void v3[6] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke;
    v3[3] = &unk_1899EE2C8;
    v3[4] = a1;
    void v3[5] = a2;
    withKeysAndValues(a3, (uint64_t)v3);
  }

- (void)generateKVONotificationsForIdentifier:(__CFString *)a3 withOldValues:(id)a4 newValues:(id)a5
{
  v10[7] = *MEMORY[0x1895F89C0];
  uint64_t v9 = [a4 count];
  if (v9 != [a5 count]) {
    -[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:].cold.1();
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke;
  v10[3] = &unk_1899EE638;
  void v10[4] = a4;
  void v10[5] = a5;
  void v10[6] = self;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]( (uint64_t)self,  a3,  0LL,  0LL,  (uint64_t)v10);
}

- (void)withManagedSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 perform:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    uint64_t v8 = _CFPrefsGetCacheStringForBundleID(CacheStringForBundleID);
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"managed/%@/%@", v8, a3);
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3052000000LL;
    uint64_t v14 = __Block_byref_object_copy__7;
    uint64_t v15 = __Block_byref_object_dispose__7;
    uint64_t v16 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke;
    v10[3] = &unk_1899EEEE0;
    void v10[6] = v9;
    v10[7] = CacheStringForBundleID;
    void v10[8] = a3;
    void v10[4] = a1;
    void v10[5] = &v11;
    -[_CFXPreferences withSources:]((uint64_t)a1, (uint64_t)v10);
    LODWORD(a3) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v12[5]);

    if ((_DWORD)a3) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
    _Block_object_dispose(&v11, 8);
  }

- (void)withSourceForIdentifier:user:byHost:container:cloud:perform:.cold.1()
{
}

- (void)withSearchListForIdentifier:container:cloudConfigurationURL:perform:.cold.1()
{
}

- (void)ingestVolatileStateFromPreferences:.cold.1()
{
  __assert_rtn("-[_CFXPreferences ingestVolatileStateFromPreferences:]", "CFXPreferences.m", 1218, "prefs != self");
}

- (void)currentUserHasInvalidHomeDirectory
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_180A4C000,  a2,  OS_LOG_TYPE_ERROR,  "All kCFPreferencesCurrentUser domains in this process will be volatile, because homeDirPath %{public}s",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_0_33();
}

- (void)setBackupDisabled:identifier:user:host:container:.cold.1()
{
}

- (void)setFileProtectionClass:identifier:user:host:container:.cold.1()
{
}

- (void)setAccessRestricted:forAppIdentifier:.cold.1()
{
}

- (void)generateKVONotificationsForIdentifier:withOldValues:newValues:.cold.1()
{
  __assert_rtn( "-[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:]",  "CFXPreferences.m",  1775,  "oldValues.count == newValues.count");
}

@end
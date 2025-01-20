@interface CFXPreferences
@end

@implementation CFXPreferences

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke( void *a1)
{
  v2 = (const void *)a1[4];
  if (v2) {
    CFRelease(v2);
  }
  v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)a1[6];
  if (v4) {
    CFRelease(v4);
  }
  v5 = (const void *)a1[7];
  if (v5) {
    CFRelease(v5);
  }
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_2()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  if ((__CF_FORK_STATE & 2) == 0) {
    __CF_USED();
  }
  if ((__CF_FORK_STATE & 1) != 0) {
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  }
  if ((__CF_FORK_STATE & 1) == 0)
  {
    int out_token = 0;
    notify_register_dispatch( "com.apple.CFPreferences._domainsChangedExternally",  &out_token,  MEMORY[0x1895F8AE0],  &__block_literal_global_169);
  }

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_3()
{
  if ((__CF_FORK_STATE & 2) == 0) {
    __CF_USED();
  }
  if ((__CF_FORK_STATE & 1) != 0) {
    __THE_PROCESS_HAS_FORKED_AND_YOU_CANNOT_USE_THIS_COREFOUNDATION_FUNCTIONALITY___YOU_MUST_EXEC__();
  }
  if ((__CF_FORK_STATE & 1) == 0)
  {
    if (_CFPreferencesDoesNSUserDefaultsExist())
    {
      id v0 = _CFPreferencesCopyStandardUserDefaults();
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, @"NSUserDefaultsDidChangeNotification", v0, 0LL, 1u);
    }

    v2 = CFDictionaryCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    v3 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification( v3,  @"com.apple.CFPreferences._didChange",  @"com.apple.CFPreferences",  v2,  1u);
    CFRelease(v2);
  }

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170( uint64_t a1,  CFDictionaryRef theDict)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    v6 = *(const __CFString **)(a1 + 56);
    if (CFEqual(v6, @"kCFPreferencesAnyUser")) {
      goto LABEL_29;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    Mutable = (const __CFDictionary *)__useVolatileDomainsForUser_volatileHomeDirs;
    if (!__useVolatileDomainsForUser_volatileHomeDirs)
    {
      Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      __useVolatileDomainsForUser_volatileHomeDirs = (uint64_t)Mutable;
    }

    Value = (__objc2_class **)CFDictionaryGetValue(Mutable, v6);
    if (!Value)
    {
      if (CFEqual(@"kCFPreferencesCurrentUser", v6)) {
        v9 = 0LL;
      }
      else {
        v9 = v6;
      }
      v10 = CFCopyHomeDirectoryURLForUser(v9);
      if ((_CFURLExists((const __CFURL *)v10) & 1) != 0)
      {
        Value = &__kCFBooleanFalse;
      }

      else
      {
        bzero(buffer, 0x400uLL);
        CFURLGetFileSystemRepresentation((CFURLRef)v10, 1u, buffer, 1024LL);
        CFStringGetCString(v6, v14, 100LL, 0x8000100u);
        v11 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170_cold_2(v11);
        }
        Value = &__kCFBooleanTrue;
      }

      if (v10) {
        CFRelease(v10);
      }
      CFDictionarySetValue((CFMutableDictionaryRef)__useVolatileDomainsForUser_volatileHomeDirs, v6, Value);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&__useVolatileDomainsForUser_volatileHomeDirsLock);
    if (Value == &__kCFBooleanTrue || (__overrideUseVolatileDomainsForUser & 1) != 0)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      v13 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170_cold_1( a1,  (uint64_t *)(a1 + 56),  v13);
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
      v12 = -[CFPrefsSource initWithContainingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsSource),  "initWithContainingPreferences:",  *(void *)(a1 + 32));
    }

    else
    {
LABEL_29:
      if (*(_BYTE *)(a1 + 80)) {
        v12 = -[CFPrefsCloudSource initWithDomain:user:byHost:containerPath:containingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsCloudSource),  "initWithDomain:user:byHost:containerPath:containingPreferences:",  *(void *)(a1 + 64),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 81),  *(void *)(a1 + 72),  *(void *)(a1 + 32));
      }
      else {
        v12 = -[CFPrefsPlistSource initWithDomain:user:byHost:containerPath:containingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsPlistSource),  "initWithDomain:user:byHost:containerPath:containingPreferences:",  *(void *)(a1 + 64),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 81),  *(void *)(a1 + 72),  *(void *)(a1 + 32));
      }
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v12;
    CFDictionarySetValue( theDict,  *(const void **)(a1 + 48),  *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

void __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke( uint64_t a1,  CFDictionaryRef theDict)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[CFPrefsSource initWithContainingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsSource),  "initWithContainingPreferences:",  *(void *)(a1 + 32));
    CFDictionarySetValue( theDict,  *(const void **)(a1 + 48),  *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    _addBackstopValuesForIdentifierAndSource( *(const void **)(a1 + 56),  *(os_unfair_lock_s **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
}

id __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke( uint64_t a1,  void *a2)
{
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v4 == a2) {
        goto LABEL_6;
      }
      _CFThrowFormattedException((uint64_t)@"NSInvalidArgumentException", @"%@ doesn't match %@", v4, a2);
    }

    if (v4 == a2) {
      __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1((uint64_t)a2);
    }
  }

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke( uint64_t *a1,  __CFString *theString,  uint64_t a3,  char a4,  const __CFString *a5)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3052000000LL;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  uint64_t v24 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  MutableCopy = theString;
  char v18 = 0;
  if (a5)
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, theString);
    CFStringAppend(MutableCopy, a5);
  }

  BOOL v11 = _CFPrefsArmPendingKVOSlot();
  uint64_t v12 = a1[4];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_113;
  v13[3] = &unk_1899EC198;
  v13[4] = v12;
  v13[5] = &v19;
  v13[8] = theString;
  v13[9] = a3;
  v13[10] = a1[6];
  v13[11] = a5;
  char v14 = a4;
  v13[6] = &v15;
  v13[7] = MutableCopy;
  -[_CFXPreferences withSearchLists:](v12, (uint64_t)v13);
  if (a5) {
    CFRelease(MutableCopy);
  }
  if (*((_BYTE *)v16 + 24)) {
    [*(id *)(v20[5] + 112) setEnabled:1];
  }
  (*(void (**)(void))(a1[5] + 16))();

  if (v11) {
    -[_CFXPreferences _deliverPendingKVONotifications]((os_unfair_lock_s *)a1[4]);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

id __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke_113( uint64_t a1,  CFDictionaryRef theDict)
{
  v17[1] = *(const void **)MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 56));
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[CFPrefsSearchListSource initWithIdentifier:containingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsSearchListSource),  "initWithIdentifier:containingPreferences:",  *(void *)(a1 + 64),  *(void *)(a1 + 32));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(__CFString **)(a1 + 64),  *(void *)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(__CFString **)(a1 + 64),  (uint64_t)@"kCFPreferencesAnyUser");
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"NSArgumentDomain");
    uint64_t v16 = 0LL;
    v17[0] = 0LL;
    CFStringRef v5 = -[CFPrefsSearchListSource copyCloudConfigurationWithURL:outConfigFileSource:outStoreName:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(CFTypeRef *)(a1 + 80),  v17,  (CFStringRef *)&v16);
    if (v5)
    {
      CFStringRef v6 = v5;
      -[CFPrefsSearchListSource addCloudSourceForIdentifier:configurationPath:storeName:container:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(__CFString **)(a1 + 64),  (uint64_t)v5,  v16,  *(const __CFString **)(a1 + 88));
      v7 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 80LL);
      CFIndex Count = CFArrayGetCount(v7);
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 112LL) = CFArrayGetValueAtIndex( v7,  Count - 1);
      CFRelease(v6);
    }

    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(__CFString **)(a1 + 64),  *(const __CFString **)(a1 + 72),  *(unsigned __int8 *)(a1 + 96),  *(const __CFString **)(a1 + 88));
    v9 = *(const __CFArray **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 80LL);
    CFIndex v10 = CFArrayGetCount(v9);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 104LL) = CFArrayGetValueAtIndex( v9,  v10 - 1);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void *)(a1 + 64),  *(const __CFString **)(a1 + 72));
    -[CFPrefsSearchListSource addManagedSourceForIdentifier:user:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"kCFPreferencesAnyApplication",  *(void *)(a1 + 72));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"kCFPreferencesAnyApplication",  *(const __CFString **)(a1 + 72),  *(unsigned __int8 *)(a1 + 96),  *(const __CFString **)(a1 + 88));
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(__CFString **)(a1 + 64),  @"kCFPreferencesAnyUser",  1,  0LL);
    -[CFPrefsSearchListSource addSuiteSourceForIdentifier:user:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void *)(a1 + 64),  @"kCFPreferencesAnyUser");
    -[CFPrefsSearchListSource addSourceForIdentifier:user:byHost:container:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"kCFPreferencesAnyApplication",  @"kCFPreferencesAnyUser",  1,  0LL);
    -[CFPrefsSearchListSource addNamedVolatileSourceForIdentifier:]( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  @"NSRegistrationDomain");
    if (v17[0])
    {
      -[CFPrefsSearchListSource addSource:](*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v17[0]);
    }

    BOOL v11 = *(const __CFSet **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 88LL);
    if (v11) {
      BOOL v12 = CFSetGetCount(v11) > 0;
    }
    else {
      BOOL v12 = 0;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v12;
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v13)
    {
      *(_BYTE *)(v13 + 120) = 1;
      char v14 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    }

    else
    {
      char v14 = 0LL;
    }

    CFDictionarySetValue(theDict, *(const void **)(a1 + 56), v14);

    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  }

  return v4;
}

id __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke( uint64_t a1,  void *a2)
{
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v4)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v4 != a2) {
        __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2();
      }
    }

    else if (v4 == a2)
    {
      __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1();
    }
  }

  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  return result;
}

void __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke( uint64_t a1,  const __CFDictionary *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(*(__CFString **)(a1 + 56));
  CFStringRef v6 = CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"suite/%@/%@",  CacheStringForBundleID,  v4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = CFDictionaryGetValue(a2, v6);
  v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (!v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = -[CFPrefsSearchListSource initWithIdentifier:containingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsSuiteSearchListSource),  "initWithIdentifier:containingPreferences:",  *(void *)(a1 + 56),  *(void *)(a1 + 32));
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    if (v8)
    {
      *(_BYTE *)(v8 + 120) = 1;
      v9 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    }

    else
    {
      v9 = 0LL;
    }

    CFDictionarySetValue(a2, v6, v9);

    v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  }

  id v10 = v7;
  CFRelease(v6);
}

void __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke( uint64_t a1,  CFDictionaryRef theDict)
{
  v24[1] = *MEMORY[0x1895F89C0];
  unint64_t Count = CFDictionaryGetCount(theDict);
  if (((Count >> 59) & 0xF) != 0)
  {
    CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  2 * Count);
    v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
    CFRelease(v22);
    objc_exception_throw(v23);
  }

  uint64_t v6 = Count;
  if (Count) {
    uint64_t v7 = 2 * Count;
  }
  else {
    uint64_t v7 = 1LL;
  }
  unint64_t v8 = MEMORY[0x1895F8858](v7, v5);
  id v10 = (const void **)((char *)v24 - v9);
  if (v11 >= 0x101)
  {
    id v10 = (const void **)_CFCreateArrayStorage(v8, 0, v24);
    BOOL v12 = v10;
  }

  else
  {
    BOOL v12 = 0LL;
  }

  id v13 = *(id *)(a1 + 32);
  CFDictionaryGetKeysAndValues(theDict, v10, &v10[v6]);
  if (v6 >= 1)
  {
    uint64_t v14 = v6;
    do
    {
      uint64_t v15 = v10[v6];
      if (v15 == *(const void **)(a1 + 32))
      {
        CFDictionaryReplaceValue(theDict, *v10, *(const void **)(a1 + 40));
      }

      else
      {
        uint64_t v16 = (const __CFArray *)*((void *)v15 + 10);
        if (v16)
        {
          v25.length = CFArrayGetCount(*((CFArrayRef *)v15 + 10));
          v25.location = 0LL;
        }
      }

      ++v10;
      --v14;
    }

    while (v14);
  }

  free(v12);
  CFIndex v17 = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
  if (v17 >= 1)
  {
    for (CFIndex i = 0LL; i != v17; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
      Value = (void *)CFDictionaryGetValue(theDict, ValueAtIndex);
      uint64_t v21 = (_BYTE *)[Value copy];
      -[CFPrefsSearchListSource replaceSource:withSource:]( (uint64_t)v21,  *(const void **)(a1 + 32),  *(const void **)(a1 + 40));
      if (v21) {
        v21[120] = 1;
      }
      -[_CFXPreferences replaceSearchList:withSearchList:](*(void *)(a1 + 48), Value, v21);
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
}

void __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke( uint64_t a1,  uint64_t a2)
{
}

void __38___CFXPreferences_flushManagedSources__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v4 = _os_activity_create( &dword_180A4C000,  "Notifying CFPrefsD Of Updated Managed Preferences",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v4, &state);
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v5, "CFPreferencesOperation", 3LL);
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x3052000000LL;
    BOOL v12 = __Block_byref_object_copy__6;
    id v13 = __Block_byref_object_dispose__6;
    uint64_t v14 = 0LL;
    uint64_t v6 = *(os_unfair_lock_s **)(a1 + 32);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __38___CFXPreferences_flushManagedSources__block_invoke_50;
    v8[3] = &unk_1899EE0B8;
    v8[5] = v5;
    v8[6] = &v9;
    v8[4] = a2;
    CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v6, (uint64_t)v8);
    xpc_release(v5);
    uint64_t v7 = (void *)v10[5];
    if (v7) {
      xpc_release(v7);
    }

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }

xpc_object_t __38___CFXPreferences_flushManagedSources__block_invoke_50(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (const void *)[a2 copyValueForKey:*(void *)(a1 + 40)];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3 != 0LL;
    if (v3) {
      CFRelease(v3);
    }
  }

void __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = (const void *)[a2 copyValueForKey:*(void *)(a1 + 40)];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3 != 0LL;
    if (v3) {
      CFRelease(v3);
    }
  }

uint64_t __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = -[CFPrefsSearchListSource alreadylocked_hasCloudValueForKey:](a2, *(const __CFString **)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

BOOL __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke( uint64_t a1,  uint64_t a2)
{
  BOOL result = -[CFPrefsSearchListSource alreadylocked_hasNonRegisteredValueForKey:](a2, *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

os_unfair_lock_s *__64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  BOOL result = -[CFPrefsSource copyKeyList](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

CFDictionaryRef __40___CFXPreferences_synchronizeEverything__block_invoke( uint64_t a1,  const __CFDictionary *a2)
{
  CFDictionaryRef result = CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 synchronize];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 setDaemonCacheEnabled:*(unsigned __int8 *)(a1 + 32)];
}

void __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t v5 = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 40));
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = _os_activity_create( &dword_180A4C000,  "Flushing Cached Preferences Data",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v7, &state);
      xpc_dictionary_set_value(v4, "CFPreferencesDomain", v6);
      xpc_release(v6);
      xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 4LL);
      uint64_t v11 = 0LL;
      BOOL v12 = &v11;
      uint64_t v13 = 0x3052000000LL;
      uint64_t v14 = __Block_byref_object_copy__6;
      uint64_t v15 = __Block_byref_object_dispose__6;
      uint64_t v16 = 0LL;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2;
      v10[3] = &unk_1899EE0B8;
      v10[5] = v4;
      v10[6] = &v11;
      v10[4] = a2;
      unint64_t v8 = *(os_unfair_lock_s **)(a1 + 32);
      if (*(_DWORD *)(a1 + 48) == 1) {
        CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v8, (uint64_t)v10);
      }
      else {
        CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v8, (uint64_t)v10);
      }
      xpc_release(v4);
      uint64_t v9 = (void *)v12[5];
      if (v9) {
        xpc_release(v9);
      }

      _Block_object_dispose(&v11, 8);
      os_activity_scope_leave(&state);
    }

    else
    {
      xpc_release(v4);
    }
  }

xpc_object_t __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke_2(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

void __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v4, "CFPreferencesOperation", 999LL);
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000LL;
    uint64_t v11 = __Block_byref_object_copy__6;
    BOOL v12 = __Block_byref_object_dispose__6;
    uint64_t v13 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2;
    v7[3] = &unk_1899EE0B8;
    v7[5] = v4;
    v7[6] = &v8;
    v7[4] = a2;
    xpc_object_t v5 = *(os_unfair_lock_s **)(a1 + 32);
    if (*(_DWORD *)(a1 + 40) == 1) {
      CFPREFERENCES_IS_WAITING_FOR_SYSTEM_CFPREFSD(v5, (uint64_t)v7);
    }
    else {
      CFPREFERENCES_IS_WAITING_FOR_USER_CFPREFSD(v5, (uint64_t)v7);
    }
    xpc_release(v4);
    uint64_t v6 = (void *)v9[5];
    if (v6) {
      xpc_release(v6);
    }
    _Block_object_dispose(&v8, 8);
  }

xpc_object_t __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke_2(uint64_t a1)
{
  xpc_object_t result = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  return result;
}

uint64_t __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 setBackupDisabled:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 setFileProtectionClass:*(unsigned int *)(a1 + 32)];
}

uint64_t __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  bzero(v6, 0x400uLL);
  uint64_t result = _CFPrefsGetPathForTriplet( (__CFString *)[a2 domainIdentifier],  (const __CFString *)objc_msgSend(a2, "userIdentifier"),  objc_msgSend(a2, "isByHost"),  (CFStringRef)objc_msgSend(a2, "container"),  (UInt8 *)v6);
  if ((_DWORD)result)
  {
    uint64_t result = open_dprotected_np(v6, 0, 0, 1);
    if ((_DWORD)result != -1)
    {
      int v5 = result;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = fcntl(result, 63);
      return close(v5);
    }
  }

  return result;
}

uint64_t __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessRestricted:*(unsigned __int8 *)(a1 + 32)];
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke(uint64_t a1)
{
  v21[1] = *(CFStringRef *)MEMORY[0x1895F89C0];
  CFStringRef v20 = 0LL;
  v21[0] = 0LL;
  CFTypeRef v19 = 0LL;
  __int16 v18 = 0;
  char v17 = 0;
  _CFPrefsExtractQuadrupleFromPathIfPossible( *(const __CFString **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  v21,  &v20,  &v19,  &v18,  (_BYTE *)&v18 + 1,  &v17);
  if (v21[0]) {
    *(CFStringRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v21[0];
  }
  if (v20)
  {
    CFRelease(v20);
    CFStringRef v20 = 0LL;
  }

  CFTypeRef v2 = v19;
  if (v19) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v19;
  }
  uint64_t v3 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  uint64_t v13 = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2;
  uint64_t v14 = &__block_descriptor_48_e5_v8__0l;
  CFTypeRef v15 = v2;
  CFStringRef v16 = v21[0];
  if (HIBYTE(v18))
  {
    __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2((uint64_t)v12);
  }

  else
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3;
    v9[3] = &unk_1899EE208;
    __int128 v10 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:]( v10,  v4,  @"kCFPreferencesCurrentUser",  1,  (uint64_t)v9);
    v6[0] = v3;
    v6[1] = 3221225472LL;
    v6[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7;
    v6[3] = &unk_1899EE208;
    __int128 v7 = *(_OWORD *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:]( v7,  v5,  @"kCFPreferencesAnyUser",  1,  (uint64_t)v6);
    v13((uint64_t)v12);
  }

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_2(uint64_t a1)
{
  CFTypeRef v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_3( uint64_t *a1,  void *a2)
{
  v16[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (os_unfair_lock_s *)a1[4];
  uint64_t v6 = MEMORY[0x1895F87A8];
  __int128 v7 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4;
  v16[3] = &unk_1899EBF50;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( v5,  v7,  (uint64_t)@"kCFPreferencesCurrentUser",  (uint64_t)v16);
  uint64_t v8 = a1[4];
  uint64_t v9 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  __int128 v10 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24LL);
  v15[0] = v6;
  v15[1] = 3221225472LL;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5;
  v15[3] = &unk_1899EBF78;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v8,  v9,  @"kCFPreferencesCurrentUser",  1,  v10,  0,  (uint64_t)v15);
  uint64_t v11 = a1[4];
  BOOL v12 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  uint64_t v13 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24LL);
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6;
  v14[3] = &unk_1899EBF78;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v11,  v12,  @"kCFPreferencesCurrentUser",  0,  v13,  0,  (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_4( uint64_t a1,  const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_5( uint64_t a1,  const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_6( uint64_t a1,  const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_7( uint64_t *a1,  void *a2)
{
  v16[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = (os_unfair_lock_s *)a1[4];
  uint64_t v6 = MEMORY[0x1895F87A8];
  __int128 v7 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8;
  v16[3] = &unk_1899EBF50;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( v5,  v7,  (uint64_t)@"kCFPreferencesAnyUser",  (uint64_t)v16);
  uint64_t v8 = a1[4];
  uint64_t v9 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  __int128 v10 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24LL);
  v15[0] = v6;
  v15[1] = 3221225472LL;
  v15[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9;
  v15[3] = &unk_1899EBF78;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v8,  v9,  @"kCFPreferencesAnyUser",  1,  v10,  0,  (uint64_t)v15);
  uint64_t v11 = a1[4];
  BOOL v12 = *(__CFString **)(*(void *)(a1[5] + 8) + 24LL);
  uint64_t v13 = *(const __CFString **)(*(void *)(a1[6] + 8) + 24LL);
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10;
  v14[3] = &unk_1899EBF78;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v11,  v12,  @"kCFPreferencesAnyUser",  0,  v13,  0,  (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_8( uint64_t a1,  const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_9( uint64_t a1,  const void *a2)
{
}

void __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke_10( uint64_t a1,  const void *a2)
{
}

uint64_t __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 fullCloudSynchronizeWithCompletionHandler:*(void *)(a1 + 32)];
}

void __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke( uint64_t a1,  uint64_t a2)
{
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2;
  v4[3] = &unk_1899EE2C8;
  CFTypeRef v2 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  v4[5] = v3;
  withKeysAndValues(v2, (uint64_t)v4);
}

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  unint64_t a4)
{
  v22[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(const __CFArray **)(a1 + 40);
  if (v8)
  {
    unint64_t Count = CFArrayGetCount(v8);
    unint64_t v11 = Count;
    if (Count >> 60)
    {
      CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
      __int16 v18 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v17,  0LL);
      CFRelease(v17);
      objc_exception_throw(v18);
      _Unwind_Resume(v19);
    }

    if (Count <= 1) {
      unint64_t Count = 1LL;
    }
    unint64_t v12 = MEMORY[0x1895F8858](Count, v10);
    uint64_t v14 = (const void **)((char *)v21 - v13);
    if (v11 >= 0x101)
    {
      CFTypeRef v15 = (const void **)_CFCreateArrayStorage(v12, 0, v22);
      uint64_t v14 = v15;
    }

    else
    {
      CFTypeRef v15 = 0LL;
      if (!v11) {
        goto LABEL_11;
      }
    }

    v23.location = 0LL;
    v23.length = v11;
    CFArrayGetValues(*(CFArrayRef *)(a1 + 40), v23, v14);
  }

  else
  {
    MEMORY[0x1895F8858](0LL, a2);
    uint64_t v14 = (const void **)&v20;
    CFTypeRef v15 = 0LL;
    unint64_t v11 = 0LL;
  }

void __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke_3( uint64_t a1)
{
}

uint64_t __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[CFPrefsSource setValue:forKey:from:](a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2;
  v5[3] = &unk_1899EE088;
  v5[4] = a2;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  return -[os_unfair_lock_s transitionIntoDirectModeIfNeededWithRetryBlock:]( a2,  "transitionIntoDirectModeIfNeededWithRetryBlock:",  v5);
}

void __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke_2( uint64_t a1)
{
}

void __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0LL; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        uint64_t v9 = (const void *)-[os_unfair_lock_s alreadylocked_copyValueForKey:]( a2,  "alreadylocked_copyValueForKey:",  ValueAtIndex);
        if (v9)
        {
          uint64_t v10 = v9;
          CFDictionarySetValue( *(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  ValueAtIndex,  v9);
          CFRelease(v10);
        }
      }
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[os_unfair_lock_s alreadylocked_copyDictionary]( a2,  "alreadylocked_copyDictionary");
  }

  os_unfair_lock_unlock(a2 + 13);
}

void __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t v4 = *(const __CFArray **)(a1 + 40);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0LL; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        uint64_t v9 = (const void *)-[CFPrefsSearchListSource alreadylocked_copyManagedValueForKey:]();
        if (v9)
        {
          uint64_t v10 = v9;
          CFDictionarySetValue( *(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  ValueAtIndex,  v9);
          CFRelease(v10);
        }
      }
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -[CFPrefsSearchListSource alreadylocked_copyManagedDictionary](a2);
  }

  os_unfair_lock_unlock(a2 + 13);
}

uint64_t __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  -[CFPrefsSource setValue:forKey:from:](a2, *(void *)(a1 + 32), *(void *)(a1 + 40), 0LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2;
  v5[3] = &unk_1899EE088;
  v5[4] = a2;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  return -[os_unfair_lock_s transitionIntoDirectModeIfNeededWithRetryBlock:]( a2,  "transitionIntoDirectModeIfNeededWithRetryBlock:",  v5);
}

void __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke_2(uint64_t a1)
{
}

uint64_t __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 copyValueForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t result = [a2 copyValueForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  v13[7] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(__CFString **)(a1 + 40);
  uint64_t v10 = *(const __CFString **)(a1 + 48);
  BOOL v11 = CFEqual(*(CFTypeRef *)(a1 + 56), @"kCFPreferencesCurrentHost") != 0;
  unint64_t v12 = *(const __CFString **)(a1 + 64);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2;
  v13[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v13[4] = a3;
  v13[5] = a2;
  v13[6] = a4;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]( v8,  v9,  v10,  v11,  v12,  0,  (uint64_t)v13);
}

void __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke_2( uint64_t a1,  os_unfair_lock_s *a2)
{
}

void __47___CFXPreferences_removeVolatileSourceForName___block_invoke( uint64_t a1,  CFMutableDictionaryRef theDict)
{
}

os_unfair_lock_s *__57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

os_unfair_lock_s *__59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2( uint64_t a1,  CFDictionaryRef theDict)
{
  uint64_t result = (os_unfair_lock_s *)CFDictionaryGetValue(theDict, *(const void **)(a1 + 40));
  if (result)
  {
    uint64_t result = -[CFPrefsSource copyDictionary](result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

os_unfair_lock_s *__54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  uint64_t result = -[CFPrefsSource copyDictionary](a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void __38___CFXPreferences_volatileSourceNames__block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  v13[1] = *MEMORY[0x1895F89C0];
  CFIndex Count = CFDictionaryGetCount(theDict);
  if (Count >= 1)
  {
    unint64_t v6 = Count;
    if ((unint64_t)Count >> 60)
    {
      CFStringRef v10 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
      BOOL v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v10,  0LL);
      CFRelease(v10);
      objc_exception_throw(v11);
      _Unwind_Resume(v12);
    }

    MEMORY[0x1895F8858](Count, v5);
    uint64_t v8 = (const void **)((char *)v13 - v7);
    if (v6 >= 0x101)
    {
      uint64_t v8 = (const void **)_CFCreateArrayStorage(v6, 0, v13);
      uint64_t v9 = v8;
    }

    else
    {
      uint64_t v9 = 0LL;
    }

    CFDictionaryGetKeysAndValues(theDict, v8, 0LL);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreate( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  v8,  v6,  &kCFTypeArrayCallBacks);
    free(v9);
  }

void __41___CFXPreferences_registerDefaultValues___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  v5[7] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __41___CFXPreferences_registerDefaultValues___block_invoke_2;
  v5[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  v5[4] = a3;
  void v5[5] = a2;
  v5[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, @"NSRegistrationDomain", (uint64_t)v5);
}

void __41___CFXPreferences_registerDefaultValues___block_invoke_2(uint64_t a1, os_unfair_lock_s *a2)
{
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  v3[6] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2;
  v3[3] = &unk_1899EE438;
  uint64_t v2 = *(void *)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  v3[5] = a2;
  -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v3);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_2( uint64_t a1,  CFDictionaryRef theDict)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  context[0] = MEMORY[0x1895F87A8];
  context[1] = 3221225472LL;
  context[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3;
  context[3] = &unk_1899EE410;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)applyBlockApplier, context);
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3( uint64_t a1,  const void *a2,  void *a3)
{
  uint64_t v5 = (void *)[a3 copyVolatileSourceWithContainingPreferences:*(void *)(a1 + 32)];
  if (!v5) {
    __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1();
  }
  id v6 = v5;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, v5);
}

void __36___CFXPreferences_resetPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __36___CFXPreferences_resetPreferences___block_invoke_2;
  v2[3] = &unk_1899EE4D8;
  char v3 = *(_BYTE *)(a1 + 48);
  v2[6] = a2;
  -[_CFXPreferences withNamedVolatileSources:](*(void *)(a1 + 32), (uint64_t)v2);
}

void __36___CFXPreferences_resetPreferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __36___CFXPreferences_resetPreferences___block_invoke_3;
  v3[3] = &unk_1899EE4B0;
  char v4 = *(_BYTE *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 48);
  v3[6] = a2;
  void v3[7] = v2;
  -[_CFXPreferences withSources:](*(void *)(a1 + 32), (uint64_t)v3);
}

void __36___CFXPreferences_resetPreferences___block_invoke_3(uint64_t a1, __CFDictionary *a2)
{
  v12[5] = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  if (*(_BYTE *)(a1 + 64)) {
    -[_CFXPreferences destroyConnections](*(void *)(a1 + 32));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  char v4 = *(const __CFDictionary **)(a1 + 48);
  if (v4)
  {
    Value = (void *)CFDictionaryGetValue(v4, @"NSRegistrationDomain");
    id v6 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), @"NSArgumentDomain");
    if (Value) {
      id v7 = Value;
    }
    if (v6) {
      id v8 = v6;
    }
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 48));
    if (a2) {
      goto LABEL_9;
    }
  }

  else
  {
    id v6 = 0LL;
    Value = 0LL;
    if (a2) {
LABEL_9:
    }
      CFDictionaryRemoveAllValues(a2);
  }

  uint64_t v9 = *(const __CFDictionary **)(a1 + 56);
  if (v9)
  {
    CFIndex Count = CFDictionaryGetCount(v9);
    if (Count)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFArrayCreateMutable( 0LL,  Count,  &kCFTypeArrayCallBacks);
      BOOL v11 = *(const __CFDictionary **)(a1 + 56);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      void v12[2] = __36___CFXPreferences_resetPreferences___block_invoke_4;
      v12[3] = &unk_1899EE488;
      v12[4] = *(void *)(a1 + 40);
      CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)applyBlockApplier, v12);
    }

    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 56));
  }

  if (Value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), @"NSRegistrationDomain", Value);
  }
  if (v6) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), @"NSArgumentDomain", v6);
  }
}

void __36___CFXPreferences_resetPreferences___block_invoke_4(uint64_t a1, int a2, void *value)
{
}

void __37___CFXPreferences_shmemForRole_name___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)_CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(a1, v2);
  }
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke(uint64_t a1, id a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (object_getClass(a2) == (Class)MEMORY[0x1895F9250])
  {
    remote_connection = xpc_dictionary_get_remote_connection(a2);
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      id v7 = reply;
      xpc_connection_send_message(remote_connection, reply);
      xpc_release(v7);
    }

    else
    {
      id v8 = (void *)MEMORY[0x186E04ED0](a2);
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      uint64_t v9 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v14 = v8;
        _os_log_impl(&dword_180A4C000, v9, OS_LOG_TYPE_INFO, "CFPrefs client received non-reply message: %s", buf, 0xCu);
      }

      _CFSetTSD(0xFu, 0LL, 0LL);
      free(v8);
    }

    if (_block_invoke_onceToken != -1) {
      dispatch_once(&_block_invoke_onceToken, &__block_literal_global_44);
    }
    CFStringRef v10 = (dispatch_queue_s *)_block_invoke_observationCallBackQueue;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2;
    v11[3] = &unk_1899EE548;
    v11[4] = a2;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    dispatch_async(v10, v11);
    objc_destroyWeak(&v12);
  }

  else if (a2 == (id)MEMORY[0x1895F91A0])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }

dispatch_queue_t __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_81()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("CFPreferences Remote KVO Callback Queue", v0);
  _block_invoke_observationCallBackQueue = (uint64_t)result;
  return result;
}

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_CFPrefsClientLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "CFPreferencesPID");
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
    uint64_t v5 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUncanonicalizedPath");
    BOOL v6 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "CFPreferencesIsByHost");
    id v7 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesCloudConfig");
    id v8 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "CFPreferencesUser");
    uint64_t v9 = (os_log_s *)_CFPrefsClientLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219266;
      int64_t v21 = int64;
      __int16 v22 = 2080;
      CFRange v23 = string;
      __int16 v24 = 2080;
      CFRange v25 = v8;
      __int16 v26 = 1024;
      BOOL v27 = v6;
      __int16 v28 = 2080;
      v29 = v5;
      __int16 v30 = 2080;
      v31 = v7;
      _os_log_debug_impl( &dword_180A4C000,  v9,  OS_LOG_TYPE_DEBUG,  "Received remote change notification from process %lld for { domain: %s, user: %s, byHost: %d, path: %s, cloud co nfiguration path: %s }",  buf,  0x3Au);
    }
  }

  _CFPrefsArmPendingKVOSlot();
  value = (const __CFArray *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "CFPreferencesDomain");
  CFDataRef v11 = _CFXPCCreateCFObjectFromXPCObject(value);
  if (v11)
  {
    CFDataRef v12 = v11;
    uint64_t v13 = (id *)(a1 + 40);
    if (objc_loadWeak(v13))
    {
      id Weak = objc_loadWeak(v13);
      -[_CFXPreferences updateSearchListsForIdentifier:]((uint64_t)Weak, v12);
    }

    CFRelease(v12);
  }

  uint64_t v15 = _CFGetTSD(0x10u);
  if (v15)
  {
    CFStringRef v16 = (const void *)v15;
    _CFSetTSD(0x10u, 0LL, 0LL);
    if (v16 != (const void *)16)
    {
      Main = CFRunLoopGetMain();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_88;
      block[3] = &unk_18999B4C8;
      block[4] = v16;
      CFRunLoopPerformBlock(Main, @"kCFRunLoopCommonModes", block);
      __int16 v18 = CFRunLoopGetMain();
      CFRunLoopWakeUp(v18);
      CFRelease(v16);
    }
  }

void __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke_88(uint64_t a1)
{
}

uint64_t __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 synchronize];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2;
  v9[3] = &unk_1899EE5C0;
  void v9[4] = v2;
  __int128 v10 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:]( v2,  v3,  @"kCFPreferencesCurrentUser",  1,  (uint64_t)v9);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = v4;
  v7[1] = 3221225472LL;
  v7[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6;
  v7[3] = &unk_1899EE5C0;
  v7[4] = v5;
  __int128 v8 = *(_OWORD *)(a1 + 48);
  -[_CFXPreferences withSuiteSearchListForIdentifier:user:locked:perform:]( v5,  v6,  @"kCFPreferencesAnyUser",  1,  (uint64_t)v7);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_2(uint64_t *a1, void *a2)
{
  v16[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = (os_unfair_lock_s *)a1[4];
  id v7 = (__CFString *)a1[5];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3;
  v16[3] = &unk_1899EE598;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( v6,  v7,  (uint64_t)@"kCFPreferencesCurrentUser",  (uint64_t)v16);
  uint64_t v8 = a1[4];
  uint64_t v9 = (__CFString *)a1[5];
  __int128 v10 = (const __CFString *)a1[6];
  v15[0] = v5;
  v15[1] = 3221225472LL;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4;
  v15[3] = &unk_1899EBF78;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v8,  v9,  @"kCFPreferencesCurrentUser",  1,  v10,  0,  (uint64_t)v15);
  uint64_t v11 = a1[4];
  CFDataRef v12 = (__CFString *)a1[5];
  uint64_t v13 = (const __CFString *)a1[6];
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5;
  v14[3] = &unk_1899EBF78;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v11,  v12,  @"kCFPreferencesCurrentUser",  0,  v13,  0,  (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_3(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_4(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_5(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_6(uint64_t *a1, void *a2)
{
  v16[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 copy];
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = (os_unfair_lock_s *)a1[4];
  id v7 = (__CFString *)a1[5];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7;
  v16[3] = &unk_1899EE598;
  v16[4] = v4;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]( v6,  v7,  (uint64_t)@"kCFPreferencesAnyUser",  (uint64_t)v16);
  uint64_t v8 = a1[4];
  uint64_t v9 = (__CFString *)a1[5];
  __int128 v10 = (const __CFString *)a1[6];
  v15[0] = v5;
  v15[1] = 3221225472LL;
  v15[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8;
  v15[3] = &unk_1899EBF78;
  v15[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v8,  v9,  @"kCFPreferencesAnyUser",  1,  v10,  0,  (uint64_t)v15);
  uint64_t v11 = a1[4];
  CFDataRef v12 = (__CFString *)a1[5];
  uint64_t v13 = (const __CFString *)a1[6];
  v14[0] = v5;
  v14[1] = 3221225472LL;
  v14[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9;
  v14[3] = &unk_1899EBF78;
  v14[4] = v4;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]( v11,  v12,  @"kCFPreferencesAnyUser",  0,  v13,  0,  (uint64_t)v14);
  -[CFPrefsSearchListSource freeze]((uint64_t)v4);
  -[_CFXPreferences replaceSearchList:withSearchList:](a1[4], (uint64_t)a2, (uint64_t)v4);
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_7(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_8(uint64_t a1, const void *a2)
{
}

void __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke_9(uint64_t a1, const void *a2)
{
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  v6[7] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(__CFString **)(a1 + 40);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2;
  v6[3] = &__block_descriptor_56_e23_v16__0__CFPrefsSource_8l;
  void v6[4] = a3;
  v6[5] = a2;
  v6[6] = a4;
  -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v4, v5, (uint64_t)v6);
}

void __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke_2( uint64_t a1,  os_unfair_lock_s *a2)
{
}

void __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke( uint64_t a1,  os_unfair_lock_s *a2)
{
  v6[6] = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(a2 + 13);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2;
  v6[3] = &unk_1899EE610;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = a2;
  v6[5] = v5;
  [v4 enumerateObjectsUsingBlock:v6];
  os_unfair_lock_unlock(a2 + 13);
  -[_CFXPreferences _deliverPendingKVONotifications](*(os_unfair_lock_s **)(a1 + 48));
}

uint64_t __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "deferredNotifyCausedByLoadingOfChangesFromDictionary:toDictionary:",  a2,  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:"));
}

void __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke( uint64_t a1,  CFDictionaryRef theDict)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = CFDictionaryGetValue(theDict, *(const void **)(a1 + 48));
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___CFPrefsManagedSource);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 32);
      v10.receiver = v6;
      v10.super_class = (Class)&OBJC_CLASS___CFPrefsManagedSource;
      uint64_t v6 = (CFPrefsManagedSource *)objc_msgSendSuper2( &v10,  sel_initWithDomain_user_byHost_containerPath_containingPreferences_,  v7,  v8,  1,  0,  v9);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v6;
    CFDictionarySetValue( theDict,  *(const void **)(a1 + 48),  *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170_cold_1( uint64_t a1,  uint64_t *a2,  os_log_t log)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a2;
  uint64_t v4 = "current host";
  if (!*(_BYTE *)(a1 + 81)) {
    uint64_t v4 = "any host";
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  int v7 = 138544131;
  uint64_t v8 = v5;
  __int16 v9 = 2113;
  uint64_t v10 = v3;
  __int16 v11 = 2082;
  CFDataRef v12 = v4;
  __int16 v13 = 2114;
  uint64_t v14 = v6;
  _os_log_error_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_ERROR,  "Disabling saving preferences for { %{public}@, %{private}@, %{public}s, %{public}@ } because home directory is inaccessible",  (uint8_t *)&v7,  0x2Au);
}

void __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_170_cold_2( os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( &dword_180A4C000,  log,  OS_LOG_TYPE_DEBUG,  "CFPreferences: user home directory is unavailable. User domains will be volatile.",  v1,  2u);
}

void __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_cold_1( uint64_t a1)
{
  uint64_t v1 = _CFThrowFormattedException((uint64_t)@"NSInvalidArgumentException", @"%@ unexpectedly matched", a1);
  _CFURLCopyHostName_cold_1(v1);
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_1()
{
  __assert_rtn( "-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke",  "CFPrefsSearchListSource.m",  1782,  "previous != src");
}

void __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke_cold_2()
{
  __assert_rtn( "-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]_block_invoke",  "CFPrefsSearchListSource.m",  1780,  "previous == src");
}

void __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke_3_cold_1()
{
  __assert_rtn( "-[_CFXPreferences ingestVolatileStateFromPreferences:]_block_invoke_3",  "CFXPreferences.m",  1223,  "copy != NULL");
}

void __37___CFXPreferences_shmemForRole_name___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_fault_impl( &dword_180A4C000,  a2,  OS_LOG_TYPE_FAULT,  "Couldn't map preferences shmem named %{public}s",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_0_33();
}

@end
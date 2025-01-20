@interface NSBundleODRDataCommon
@end

@implementation NSBundleODRDataCommon

NSError *__58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke( void *a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  v25[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 objectForKey:@"_NSODRURLKey"];
  if (v7)
  {
    uint64_t v8 = v7;
    if (qword_18C497F90 != -1) {
      dispatch_once(&qword_18C497F90, &__block_literal_global_300);
    }
    v9 = (os_log_s *)qword_18C497F88;
    if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *(void *)(a1[4] + 24LL);
      *(_DWORD *)buf = 134218499;
      uint64_t v19 = v15;
      __int16 v20 = 2114;
      uint64_t v21 = a2;
      __int16 v22 = 2113;
      uint64_t v23 = v8;
      _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Pin: Bundle 0x%p / Asset Pack ID: %{public}@ / URL: %{private}@",  buf,  0x20u);
    }

    [*(id *)(a1[4] + 8) setObject:v8 forKey:a2];
    [*(id *)(a1[4] + 24) _cfBundle];
    if (_CFBundleAddResourceURL())
    {
      v10 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:]( v10,  "postNotificationName:object:userInfo:",  @"_NSBundleResourceRequestAssetPackPinnedNotification",  *(void *)(a1[4] + 24),  [MEMORY[0x189603F68] dictionaryWithObject:a2 forKey:@"_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey"]);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *a4 = 1;
    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to add the URL %@ to the bundle %@",  v8,  *(void *)(a1[4] + 24LL),  @"NSDebugDescription");
    v12 = (void *)MEMORY[0x189603F68];
    v13 = &v17;
    v14 = (const __CFString **)&v16;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *a4 = 1;
    v24 = @"NSDebugDescription";
    v25[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response to begin was missing a URL (%@)",  *(void *)(a1[4] + 24LL));
    v12 = (void *)MEMORY[0x189603F68];
    v13 = (NSString **)v25;
    v14 = &v24;
  }

  result =  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256,  [v12 dictionaryWithObjects:v13 forKeys:v14 count:1]);
  *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = result;
  return result;
}

NSError *__60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke( void *a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 objectForKey:@"_NSODRURLKey"];
  if (!v7)
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *a4 = 1;
    __int16 v22 = @"NSDebugDescription";
    v23[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response to begin was missing a URL (%@)",  *(void *)(a1[4] + 24LL));
    v12 = (void *)MEMORY[0x189603F68];
    v13 = (NSString **)v23;
    v14 = &v22;
LABEL_10:
    result =  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256,  [v12 dictionaryWithObjects:v13 forKeys:v14 count:1]);
    *(void *)(*(void *)(a1[6] + 8LL) + 40LL) = result;
    return result;
  }

  uint64_t v8 = v7;
  [*(id *)(a1[4] + 24) _cfBundle];
  if (!_CFBundleRemoveResourceURL())
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *a4 = 1;
    __int16 v20 = @"NSDebugDescription";
    uint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to remove the URL %@ to the bundle %@",  v8,  *(void *)(a1[4] + 24LL));
    v12 = (void *)MEMORY[0x189603F68];
    v13 = &v21;
    v14 = &v20;
    goto LABEL_10;
  }

  if (qword_18C497F90 != -1) {
    dispatch_once(&qword_18C497F90, &__block_literal_global_300);
  }
  v9 = (os_log_s *)qword_18C497F88;
  if (os_log_type_enabled((os_log_t)qword_18C497F88, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1[4] + 24LL);
    *(_DWORD *)buf = 134218242;
    uint64_t v17 = v15;
    __int16 v18 = 2114;
    uint64_t v19 = a2;
    _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Unpin: Bundle 0x%p / Asset Pack ID: %{public}@",  buf,  0x16u);
  }

  [*(id *)(a1[4] + 8) removeObjectForKey:a2];
  v10 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
  return (NSError *)-[NSNotificationCenter postNotificationName:object:userInfo:]( v10,  "postNotificationName:object:userInfo:",  @"_NSBundleResourceRequestAssetPackUnpinnedNotification",  *(void *)(a1[4] + 24),  [MEMORY[0x189603F68] dictionaryWithObject:a2 forKey:@"_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey"]);
}

@end
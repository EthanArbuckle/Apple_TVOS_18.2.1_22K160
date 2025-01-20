@interface SecCoreAnalytics
+ (id)appNameFromPath:(id)a3;
+ (void)sendEvent:(id)a3 event:(id)a4;
+ (void)sendEventLazy:(id)a3 builder:(id)a4;
@end

@implementation SecCoreAnalytics

+ (void)sendEvent:(id)a3 event:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    __int128 v13 = xmmword_189667620;
    uint64_t v14 = 0LL;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    id v7 = v5;
    id v8 = v6;
    *(void *)&__int128 v13 = 0LL;
    *((void *)&v13 + 1) = &v13;
    uint64_t v14 = 0x2020000000LL;
    v9 = getAnalyticsSendEventSymbolLoc_ptr;
    v15 = getAnalyticsSendEventSymbolLoc_ptr;
    if (!getAnalyticsSendEventSymbolLoc_ptr)
    {
      v10 = CoreAnalyticsLibrary();
      v9 = dlsym(v10, "AnalyticsSendEvent");
      *(void *)(*((void *)&v13 + 1) + 24LL) = v9;
      getAnalyticsSendEventSymbolLoc_ptr = v9;
    }

    _Block_object_dispose(&v13, 8);
    if (!v9)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void soft_AnalyticsSendEvent(NSString *__strong, NSDictionary<NSString *,NSObject *> *__strong)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v11,  "handleFailureInFunction:file:lineNumber:description:",  v12,  @"SecCoreAnalytics.m",  198,  @"%s",  dlerror());

      __break(1u);
    }

    ((void (*)(id, id))v9)(v7, v8);
  }
}

+ (void)sendEventLazy:(id)a3 builder:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    __int128 v13 = xmmword_189667620;
    uint64_t v14 = 0LL;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    id v7 = v5;
    id v8 = v6;
    *(void *)&__int128 v13 = 0LL;
    *((void *)&v13 + 1) = &v13;
    uint64_t v14 = 0x2020000000LL;
    v9 = getAnalyticsSendEventLazySymbolLoc_ptr;
    v15 = getAnalyticsSendEventLazySymbolLoc_ptr;
    if (!getAnalyticsSendEventLazySymbolLoc_ptr)
    {
      v10 = CoreAnalyticsLibrary();
      v9 = dlsym(v10, "AnalyticsSendEventLazy");
      *(void *)(*((void *)&v13 + 1) + 24LL) = v9;
      getAnalyticsSendEventLazySymbolLoc_ptr = v9;
    }

    _Block_object_dispose(&v13, 8);
    if (!v9)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void soft_AnalyticsSendEventLazy(NSString *__strong, NSDictionary<NSString *,NSObject *> *(^__strong)(void))");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v11,  "handleFailureInFunction:file:lineNumber:description:",  v12,  @"SecCoreAnalytics.m",  200,  @"%s",  dlerror());

      __break(1u);
    }

    ((void (*)(id, id))v9)(v7, v8);
  }
}

+ (id)appNameFromPath:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1896077F8] bundleWithPath:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_2:
    [v4 infoDictionary];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:@"CFBundleVisibleComponentName"];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      [v5 objectForKey:@"CFBundleDisplayName"];
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }

      else
      {
        [v5 objectForKey:@"CFBundleName"];
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }

      id v7 = v15;

      goto LABEL_13;
    }

@end
@interface LSLocalizedStringRecord
@end

@implementation LSLocalizedStringRecord

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__allUnsanitizedStringValues];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2) {
    goto LABEL_17;
  }
  [v2 allKeys];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _resolvedPropertyValueForGetter:sel__missingBundleLocs];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    v4 = (void *)v6;
  }

  else
  {
    _LSDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      Name = sel_getName(*(SEL *)(a1 + 56));
      __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2( (uint64_t)Name,  (uint64_t)v34,  v7);
    }
  }

  if (v4)
  {
    v9 = (const __CFArray *)*(id *)(a1 + 40);
    if (v9
      || ([(id)__LSDefaultsGetSharedInstance() preferredLocalizations],
          (v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
LABEL_10:
      CFArrayRef v10 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v4, v9);
LABEL_11:
      if (-[__CFArray count](v10, "count"))
      {
        v11 = -[__CFArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0LL);
        uint64_t v12 = [v3 objectForKeyedSubscript:v11];
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
        v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }

      goto LABEL_14;
    }

    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      v9 = 0LL;
    }

    else
    {
      if (_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken != -1) {
        dispatch_once( &_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::onceToken,  &__block_literal_global_43);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (!_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache
        || mach_absolute_time()
         - _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime > _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::maxCacheTimeAbsolute)
      {
        uint64_t v31 = 0LL;
        v32[0] = &v31;
        v32[1] = 0x3032000000LL;
        v32[2] = __Block_byref_object_copy__26;
        v32[3] = __Block_byref_object_dispose__26;
        id v33 = 0LL;
        uint64_t v25 = 0LL;
        v26 = &v25;
        uint64_t v27 = 0x3032000000LL;
        v28 = __Block_byref_object_copy__26;
        v29 = __Block_byref_object_dispose__26;
        int v18 = 11;
        id v30 = 0LL;
        uint64_t v19 = MEMORY[0x1895F87A8];
        while (1)
        {
          v20 = +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, 0LL);
          v24[0] = v19;
          v24[1] = 3221225472LL;
          v24[2] = ___ZL78_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcessesv_block_invoke_43;
          v24[3] = &unk_189D774D8;
          v24[4] = &v25;
          v24[5] = &v31;
          [v20 getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler:v24];
        }

LABEL_30:
        v21 = (void *)v26[5];
        if (!v21)
        {
          _LSDefaultLog();
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1( (uint64_t)v32,  v22,  v23);
          }

          v21 = (void *)v26[5];
        }

        objc_storeStrong( (id *)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache,  v21);
        _LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheTime = mach_absolute_time();
        _Block_object_dispose(&v25, 8);

        _Block_object_dispose(&v31, 8);
      }

      v9 = (const __CFArray *)(id)_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cache;
      os_unfair_lock_unlock((os_unfair_lock_t)&_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcesses(void)::cacheLock);
      if (v9) {
        goto LABEL_10;
      }
    }

    CFArrayRef v10 = 0LL;
    goto LABEL_11;
  }

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke( uint64_t a1,  void **a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  uint64_t v6 = LaunchServices::LocalizedString::localizeUnsafely(a5, *a2, *(void **)(a1 + 32));
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __43___LSLocalizedStringRecord_allStringValues__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke( uint64_t a1,  _LSDatabase **a2,  int a3,  int a4,  LaunchServices::LocalizedString *this)
{
  uint64_t v6 = LaunchServices::LocalizedString::getDefaultValueUnsafely(this, *a2);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __46___LSLocalizedStringRecord_defaultStringValue__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 objectForKeyedSubscript:@"LSDefaultLocalizedValue"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v2 = v6;
  }
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)a1 + 40LL);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a2,  a3,  "could not fetch preferred locales for LSLocalizedStringRecord: %@",  (uint8_t *)&v4);
}

void __66___LSLocalizedStringRecord_stringValueWithPreferredLocalizations___block_invoke_2_cold_2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a3,  (uint64_t)a3,  "Could not find missing localizations computing string value in %s... resulting locale may be unexpected!",  (uint8_t *)a2);
}

@end
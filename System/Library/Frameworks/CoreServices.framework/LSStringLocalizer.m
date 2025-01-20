@interface LSStringLocalizer
@end

@implementation LSStringLocalizer

void __40___LSStringLocalizer_coreTypesLocalizer__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" isDirectory:1];
  if (v4)
  {
    v0 = -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:]( objc_alloc(&OBJC_CLASS____LSStringLocalizer),  "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:",  v4,  @"InfoPlist",  0LL,  0LL);
    v1 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v0;
  }

  if (!+[_LSStringLocalizer coreTypesLocalizer]::result)
  {
    v2 = objc_alloc_init(&OBJC_CLASS____LSStringLocalizer);
    v3 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v2;
  }
}

void __52___LSStringLocalizer_missingLocalizationPlaceholder__block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 UUIDString];
  v1 = (void *)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;
  +[_LSStringLocalizer missingLocalizationPlaceholder]::result = v0;
}

uint64_t __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) addObject:a4];
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x186E2A59C]();
  if ([v5 isEqual:&stru_189D7B4C8])
  {
    v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }

  else
  {
    [*(id *)(a1 + 40) objectForKeyedSubscript:@"_LSBundleLibraryPath"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      if (!v10)
      {
        uint64_t v11 = [*(id *)(a1 + 48) bundleURL];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
      }

      [v10 URLByAppendingPathComponent:v9 isDirectory:1];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        [v14 URLByAppendingPathComponent:v5 isDirectory:1];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v8 = (_LSStringLocalizer *)[objc_alloc(*(Class *)(a1 + 72)) initWithBundleURL:v16 stringsFile:@"InfoPlist" checkMainBundle:*(unsigned __int8 *)(a1 + 80) legacyLocalizationList:*(unsigned __int8 *)(a1 + 81)];
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }

        else
        {
          v8 = 0LL;
        }
      }

      else
      {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
    }
  }

  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v20[3] = &unk_189D78B88;
  id v21 = *(id *)(a1 + 56);
  id v17 = v5;
  uint64_t v18 = *(void *)(a1 + 72);
  id v19 = v17;
  id v22 = v17;
  uint64_t v23 = v18;
  -[_LSStringLocalizer enumerateLocalizedStringsForKeys:usingBlock:]( v8,  "enumerateLocalizedStringsForKeys:usingBlock:",  v6,  v20);

  objc_autoreleasePoolPop(v7);
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3( id *a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v19 = a3;
  id v8 = a4;
  [a1[4] objectForKeyedSubscript:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (char v10 = [a1[5] isEqual:&stru_189D7B4C8], v9, (v10 & 1) != 0))
  {
    if ([v8 count])
    {
      uint64_t v11 = (void *)[v19 mutableCopy];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0LL;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
            [a1[6] missingLocalizationPlaceholder];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 setObject:v17 forKeyedSubscript:v16];

            ++v15;
          }

          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v13);
      }

      uint64_t v18 = (void *)[v11 copy];
      [a1[4] setObject:v18 forKeyedSubscript:v7];
    }

    else
    {
      [a1[4] setObject:v19 forKeyedSubscript:v7];
    }
  }
}

uint64_t __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) addObject:a4];
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x186E2A59C]();
  if ([v5 isEqual:&stru_189D7B4C8])
  {
    id v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }

  else
  {
    [*(id *)(a1 + 40) objectForKeyedSubscript:@"_LSBundleLibraryPath"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      char v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      if (!v10)
      {
        CFURLRef v11 = CFBundleCopyBundleURL(*(CFBundleRef *)(a1 + 64));
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        char v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      }

      [v10 URLByAppendingPathComponent:v9 isDirectory:1];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = v14;
      if (v14)
      {
        [v14 URLByAppendingPathComponent:v5 isDirectory:1];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          id v8 = (_LSStringLocalizer *)[objc_alloc(*(Class *)(a1 + 72)) initWithBundleURL:v16 stringsFile:@"InfoPlist" checkMainBundle:*(unsigned __int8 *)(a1 + 80) legacyLocalizationList:*(unsigned __int8 *)(a1 + 81)];
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }

        else
        {
          id v8 = 0LL;
        }
      }

      else
      {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v20[3] = &unk_189D78B88;
  id v21 = *(id *)(a1 + 48);
  id v17 = v5;
  uint64_t v18 = *(void *)(a1 + 72);
  id v19 = v17;
  id v22 = v17;
  uint64_t v23 = v18;
  -[_LSStringLocalizer enumerateLocalizedStringsForKeys:usingBlock:]( v8,  "enumerateLocalizedStringsForKeys:usingBlock:",  v6,  v20);

  objc_autoreleasePoolPop(v7);
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3( id *a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v19 = a3;
  id v8 = a4;
  [a1[4] objectForKeyedSubscript:v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (char v10 = [a1[5] isEqual:&stru_189D7B4C8], v9, (v10 & 1) != 0))
  {
    if ([v8 count])
    {
      CFURLRef v11 = (void *)[v19 mutableCopy];
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0LL;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
            [a1[6] missingLocalizationPlaceholder];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 setObject:v17 forKeyedSubscript:v16];

            ++v15;
          }

          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v13);
      }

      uint64_t v18 = (void *)[v11 copy];
      [a1[4] setObject:v18 forKeyedSubscript:v7];
    }

    else
    {
      [a1[4] setObject:v19 forKeyedSubscript:v7];
    }
  }
}

@end
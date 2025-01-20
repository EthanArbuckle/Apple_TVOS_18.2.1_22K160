@interface _LSStringLocalizer
+ (BOOL)useLegacyLocalizationListForPlatform:(unsigned int)a3 sdkVersion:(unsigned int)a4;
+ (NSArray)preferredLocalizationsForXCTests;
+ (NSString)missingLocalizationPlaceholder;
+ (_LSStringLocalizer)coreTypesLocalizer;
+ (id)localizedStringForCanonicalString:(id)a3 preferredLocalizations:(id)a4 context:(LSContext *)a5;
+ (id)localizedStringsForCanonicalString:(id)a3 context:(LSContext *)a4;
+ (id)newFrameworkBundleLocalizer;
+ (void)findKeysToLocalizeInInfoDictionary:(id)a3 forArrayKey:(__CFString *)a4 stringKey:(__CFString *)a5 localizedKeys:(id)a6;
+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7;
+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 legacyLocalizationList:(BOOL)a6;
+ (void)gatherLocalizedStringsForLSBundleProvider:(id)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7;
+ (void)newFrameworkBundleLocalizer;
+ (void)setPreferredLocalizationsForXCTests:(id)a3;
- (_LSBundleProvider)bundleProvider;
- (_LSStringLocalizer)init;
- (_LSStringLocalizer)initWithBundleProvider:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 checkMainBundle:(BOOL)a5 legacyLocalizationList:(BOOL)a6;
- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4;
- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5;
- (_LSStringLocalizer)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 delegate:(unsigned int)a5;
- (_LSStringLocalizer)initWithDatabase:(id)a3 pluginUnit:(unsigned int)a4;
- (id)debugDescription;
- (id)localizedStringDictionaryWithString:(id)a3 defaultValue:(id)a4;
- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 localeCode:(id)a5;
- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 preferredLocalizations:(id)a5;
- (id)localizedStringWithString:(id)a3 preferredLocalizations:(id)a4;
- (id)localizedStringsWithStrings:(id)a3 preferredLocalizations:(id)a4;
- (void)dealloc;
- (void)enumerateLocalizedStringsForKeys:(id)a3 usingBlock:(id)a4;
- (void)enumerateLocalizedStringsUsingBlock:(id)a3;
@end

@implementation _LSStringLocalizer

- (_LSBundleProvider)bundleProvider
{
  return self->_bundleProvider;
}

+ (id)newFrameworkBundleLocalizer
{
  uint64_t v2 = _LSGetBundle();
  if (!v2
    || (v3 = -[_LSStringLocalizer initWithCFBundle:stringsFile:]( objc_alloc(&OBJC_CLASS____LSStringLocalizer),  "initWithCFBundle:stringsFile:",  v2,  @"Localized")) == 0LL)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____LSStringLocalizer);
    _LSDefaultLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[_LSStringLocalizer newFrameworkBundleLocalizer].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  return v3;
}

+ (_LSStringLocalizer)coreTypesLocalizer
{
  if (+[_LSStringLocalizer coreTypesLocalizer]::once != -1) {
    dispatch_once(&+[_LSStringLocalizer coreTypesLocalizer]::once, &__block_literal_global_65);
  }
  return (_LSStringLocalizer *)(id)+[_LSStringLocalizer coreTypesLocalizer]::result;
}

- (_LSStringLocalizer)init
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:](self, "initWithBundleURL:stringsFile:", 0LL, 0LL);
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:]( self,  "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:",  a3,  a4,  1LL,  a5);
}

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4 checkMainBundle:(BOOL)a5 legacyLocalizationList:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)MEMORY[0x186E2A59C]();
  if (!v10 || !v7)
  {
    if (!v10)
    {
      v18 = 0LL;
      goto LABEL_9;
    }

- (_LSStringLocalizer)initWithBundleURL:(id)a3 stringsFile:(id)a4
{
  return -[_LSStringLocalizer initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:]( self,  "initWithBundleURL:stringsFile:checkMainBundle:legacyLocalizationList:",  a3,  a4,  1LL,  0LL);
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4
{
  return -[_LSStringLocalizer initWithCFBundle:stringsFile:legacyLocalizationList:]( self,  "initWithCFBundle:stringsFile:legacyLocalizationList:",  a3,  a4,  0LL);
}

- (_LSStringLocalizer)initWithCFBundle:(__CFBundle *)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = -[_LSBundleProvider initWithCFBundle:](objc_alloc(&OBJC_CLASS____LSBundleProvider), "initWithCFBundle:", a3);
  id v10 = -[_LSStringLocalizer initWithBundleProvider:stringsFile:legacyLocalizationList:]( self,  "initWithBundleProvider:stringsFile:legacyLocalizationList:",  v9,  v8,  v5);

  return v10;
}

- (_LSStringLocalizer)initWithBundleProvider:(id)a3 stringsFile:(id)a4 legacyLocalizationList:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v67 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (__CFString *)a3;
  id v10 = a4;
  v62.receiver = self;
  v62.super_class = (Class)&OBJC_CLASS____LSStringLocalizer;
  id v11 = -[_LSStringLocalizer init](&v62, sel_init);
  v12 = v11;
  if (!v11) {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&v11->_bundleProvider, a3);
  v13 = (_LSStringsFileContent *)-[_LSStringsFileContent initWithStringsFile:]( objc_alloc(&OBJC_CLASS____LSStringsFileContent),  v10);
  stringsContent = v12->_stringsContent;
  v12->_stringsContent = v13;

  int v15 = (void *)MEMORY[0x186E2A59C]();
  v16 = -[_LSStringLocalizer bundleProvider](v12, "bundleProvider");
  BOOL v17 = v16 == 0LL;

  if (v17)
  {
    p_bundleLocalizations = (id *)&v12->_bundleLocalizations;
    if (!v12->_bundleLocalizations)
    {
      v19 = 0LL;
      goto LABEL_33;
    }

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS____LSStringLocalizer;
  -[_LSStringLocalizer dealloc](&v2, sel_dealloc);
}

- (id)localizedStringWithString:(id)a3 preferredLocalizations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 291, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];
  }

  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 cfBundleRef];

  if (v10)
  {
    -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_LSStringLocalizer localizedStringWithString:inBundle:preferredLocalizations:]( self,  "localizedStringWithString:inBundle:preferredLocalizations:",  v7,  [v11 cfBundleRef],  v8);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

- (id)localizedStringsWithStrings:(id)a3 preferredLocalizations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v21 = v7;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 304, @"Invalid parameter not satisfying: %@", @"strings != nil" object file lineNumber description];
  }

  context = (void *)MEMORY[0x186E2A59C]();
  uint64_t v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v10 = -[_LSBundleProvider cfBundleRef](self->_bundleProvider, "cfBundleRef");
  if (v10)
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v16 = -[_LSStringLocalizer localizedStringWithString:inBundle:preferredLocalizations:]( self,  "localizedStringWithString:inBundle:preferredLocalizations:",  v15,  v10,  v8);
          if (v16) {
            [v9 setObject:v16 forKeyedSubscript:v15];
          }
        }

        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v12);
    }
  }

  BOOL v17 = (void *)[v9 copy];

  objc_autoreleasePoolPop(context);
  return v17;
}

- (id)localizedStringDictionaryWithString:(id)a3 defaultValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v23 = a4;
  __int128 v25 = v7;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 328, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];
  }

  context = (void *)MEMORY[0x186E2A59C]();
  id v24 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 cfBundleRef];

  if (v9)
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v10 = self->_bundleLocalizations;
    uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(const __CFString **)(*((void *)&v26 + 1) + 8 * i);
          v16 = -[_LSStringLocalizer localizedStringWithString:inBundle:localeCode:]( self,  "localizedStringWithString:inBundle:localeCode:",  v25,  v9,  v15);
          if (v16)
          {
            CFLocaleIdentifier CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(v13, v15);
            v18 = (__CFString *)CanonicalLanguageIdentifierFromString;
            if (CanonicalLanguageIdentifierFromString) {
              CFLocaleIdentifier v19 = CanonicalLanguageIdentifierFromString;
            }
            else {
              CFLocaleIdentifier v19 = v15;
            }
            [v24 setObject:v16 forKeyedSubscript:v19];
          }
        }

        uint64_t v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
      }

      while (v11);
    }
  }

  if (v23) {
    [v24 setObject:v23 forKeyedSubscript:@"LSDefaultLocalizedValue"];
  }
  objc_autoreleasePoolPop(context);

  return v24;
}

- (void)enumerateLocalizedStringsUsingBlock:(id)a3
{
}

- (void)enumerateLocalizedStringsForKeys:(id)a3 usingBlock:(id)a4
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  __int16 v65 = (void (**)(id, uint64_t, id, id, void *))a4;
  v72 = v7;
  v68 = self;
  if (!v65)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    [v63 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 358, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }

  context = (void *)MEMORY[0x186E2A59C]();
  if (-[NSArray count](self->_bundleLocalizations, "count"))
  {
    int v8 = [(id)__LSDefaultsGetSharedInstance() isRegionChina];
    char v9 = v8 ^ 1;
    if (!v7) {
      char v9 = 1;
    }
    int v75 = v8;
    if ((v9 & 1) != 0)
    {
      v71 = 0LL;
    }

    else
    {
      uint64_t v10 = (void *)MEMORY[0x186E2A59C]();
      uint64_t v11 = (void *)[v7 mutableCopy];
      __int128 v91 = 0u;
      __int128 v92 = 0u;
      __int128 v89 = 0u;
      __int128 v90 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v98 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v90;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v90 != v14) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v89 + 1) + 8 * i) stringByAppendingString:@"#CH"];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 addObject:v16];
          }

          uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v98 count:16];
        }

        while (v13);
      }

      v71 = (void *)[v11 copy];
      objc_autoreleasePoolPop(v10);
    }

    BOOL v17 = (void *)MEMORY[0x186E2A59C]();
    id v18 = objc_alloc(NSString);
    -[_LSStringLocalizer bundleProvider](v68, "bundleProvider");
    CFLocaleIdentifier v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 bundleURL];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 path];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = (id)[v18 initWithFormat:@"Reading localized string from %@", v21];
    id v23 = (dispatch_queue_s *)_LSLoggingQueue(void)::logQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
    block[3] = &unk_189D741C8;
    id v94 = v22;
    id v24 = v22;
    dispatch_sync(v23, block);

    objc_autoreleasePoolPop(v17);
    id v74 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v73 = objc_alloc_init(MEMORY[0x189603FC8]);
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    obuint64_t j = v68->_bundleLocalizations;
    uint64_t v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v97,  16LL);
    if (v69)
    {
      uint64_t v67 = *(void *)v86;
      do
      {
        uint64_t v25 = 0LL;
        do
        {
          if (*(void *)v86 != v67) {
            objc_enumerationMutation(obj);
          }
          uint64_t v70 = v25;
          __int128 v26 = *(void **)(*((void *)&v85 + 1) + 8 * v25);
          __int128 v27 = (void *)MEMORY[0x186E2A59C]();
          __int128 v28 = v71;
          if (!v71) {
            __int128 v28 = v72;
          }
          if (!v72) {
            __int128 v28 = 0LL;
          }
          id v29 = v28;
          stringsContent = v68->_stringsContent;
          -[_LSStringLocalizer bundleProvider](v68, "bundleProvider");
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[_LSStringsFileContent uncheckedObjectsForKeys:forLocaleCode:fromBundle:cacheLocalizations:]( stringsContent,  v29,  v26,  [v31 cfBundleRef],  v68->_bundleLocalizationsWithDefaultPrefLocs);
          if (v32) {
            BOOL v33 = v72 != 0LL;
          }
          else {
            BOOL v33 = 1;
          }
          if (!v33)
          {
            v34 = (void *)MEMORY[0x189604010];
            uint64_t v35 = [v32 allKeys];
            uint64_t v36 = (void *)v35;
            if (v35) {
              uint64_t v37 = v35;
            }
            else {
              uint64_t v37 = MEMORY[0x189604A58];
            }
            [v34 setWithArray:v37];
            v72 = (void *)objc_claimAutoreleasedReturnValue();
          }

          objc_autoreleasePoolPop(v27);
          if (v32)
          {
            __int128 v83 = 0u;
            __int128 v84 = 0u;
            __int128 v81 = 0u;
            __int128 v82 = 0u;
            id v38 = v72;
            uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v96 count:16];
            if (!v39) {
              goto LABEL_54;
            }
            uint64_t v40 = *(void *)v82;
            while (1)
            {
              for (uint64_t j = 0LL; j != v39; ++j)
              {
                if (*(void *)v82 != v40) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v42 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                uint64_t v43 = (void *)MEMORY[0x186E2A59C]();
                if (v75
                  && ([v42 stringByAppendingString:@"#CH"],
                      uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(),
                      [v32 objectForKeyedSubscript:v44],
                      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(),
                      v44,
                      v45)
                  || ([v32 objectForKeyedSubscript:v42],
                      (uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
                {
                  [v74 objectForKeyedSubscript:v42];
                  id v46 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v46)
                  {
                    id v46 = objc_alloc_init(MEMORY[0x189603FC8]);
                    [v74 setObject:v46 forKeyedSubscript:v42];
                  }

                  [v46 setObject:v45 forKeyedSubscript:v26];
                }

                else
                {
                  [v73 objectForKeyedSubscript:v42];
                  id v46 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v46)
                  {
                    id v46 = objc_alloc_init(MEMORY[0x189603FE0]);
                    [v73 setObject:v46 forKeyedSubscript:v42];
                  }

                  [v46 addObject:v26];
                  uint64_t v45 = 0LL;
                }

LABEL_52:
                objc_autoreleasePoolPop(v43);
              }

              uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:v96 count:16];
              if (!v39)
              {
LABEL_54:

                break;
              }
            }
          }

          uint64_t v25 = v70 + 1;
        }

        while (v70 + 1 != v69);
        uint64_t v69 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v85,  v97,  16LL);
      }

      while (v69);
    }

    dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_169);
    id v47 = objc_alloc_init(MEMORY[0x189603F68]);
    id v48 = objc_alloc_init(MEMORY[0x189604010]);
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    id v76 = v72;
    uint64_t v49 = [v76 countByEnumeratingWithState:&v77 objects:v95 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v78;
LABEL_61:
      uint64_t v51 = 0LL;
      while (1)
      {
        if (*(void *)v78 != v50) {
          objc_enumerationMutation(v76);
        }
        uint64_t v52 = *(void *)(*((void *)&v77 + 1) + 8 * v51);
        uint64_t v53 = (void *)MEMORY[0x186E2A59C]();
        uint64_t v54 = [v74 objectForKeyedSubscript:v52];
        v55 = (void *)v54;
        id v56 = v54 ? (id)v54 : v47;
        id v57 = v56;

        uint64_t v58 = [v73 objectForKeyedSubscript:v52];
        uint64_t v59 = (void *)v58;
        id v60 = v58 ? (id)v58 : v48;
        id v61 = v60;

        LOBYTE(block[0]) = 0;
        v65[2](v65, v52, v57, v61, block);
        int v62 = LOBYTE(block[0]);

        objc_autoreleasePoolPop(v53);
        if (v62) {
          break;
        }
        if (v49 == ++v51)
        {
          uint64_t v49 = [v76 countByEnumeratingWithState:&v77 objects:v95 count:16];
          if (v49) {
            goto LABEL_61;
          }
          break;
        }
      }
    }

    id v7 = v76;
  }

  objc_autoreleasePoolPop(context);
}

+ (NSString)missingLocalizationPlaceholder
{
  if (+[_LSStringLocalizer missingLocalizationPlaceholder]::once != -1) {
    dispatch_once(&+[_LSStringLocalizer missingLocalizationPlaceholder]::once, &__block_literal_global_36);
  }
  return (NSString *)(id)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;
}

+ (BOOL)useLegacyLocalizationListForPlatform:(unsigned int)a3 sdkVersion:(unsigned int)a4
{
  if (a3 - 1 > 8) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_183FBF530[a3 - 1];
  }
  return v4 > a4;
}

+ (void)gatherLocalizedStringsForLSBundleProvider:(id)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  BOOL v7 = a7;
  char v9 = a5;
  v47[2] = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (_LSStringLocalizer *)[objc_alloc((Class)a1) initWithBundleProvider:v12 stringsFile:@"InfoPlist" legacyLocalizationList:v7];
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = __Block_byref_object_copy__39;
  v45[4] = __Block_byref_object_dispose__39;
  id v46 = 0LL;
  if (v14)
  {
    id v33 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    v16 = v15;
    if (v33 && v15)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v14);
      BOOL v17 = (void *)MEMORY[0x189603FE0];
      if ((v9 & 1) != 0)
      {
        uint64_t v19 = *MEMORY[0x189604E10];
        v47[0] = *MEMORY[0x189604AA0];
        v47[1] = v19;
        [MEMORY[0x189603F18] arrayWithObjects:v47 count:2];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 setWithArray:v20];
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v43[0] = MEMORY[0x1895F87A8];
        v43[1] = 3221225472LL;
        v43[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v43[3] = &unk_189D78B60;
        id v18 = v21;
        id v44 = v18;
        _LSBundleDisplayNameContextEnumerate(v43, v22, v23, v24, v25);
        [v16 setObject:v18 forKeyedSubscript:&stru_189D7B4C8];
      }

      else
      {
        id v18 = objc_alloc_init(MEMORY[0x189603FE0]);
        [v16 setObject:v18 forKeyedSubscript:&stru_189D7B4C8];
      }

      if ((v9 & 4) != 0) {
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:*MEMORY[0x189604AA8] stringKey:*MEMORY[0x189604AE8] localizedKeys:v16];
      }
      if ((v9 & 2) != 0)
      {
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:@"UTExportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v16];
        [a1 findKeysToLocalizeInInfoDictionary:v13 forArrayKey:@"UTImportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v16];
      }

      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v34[3] = &unk_189D78BB0;
      uint64_t v35 = v14;
      id v26 = v13;
      id v36 = v26;
      uint64_t v39 = v45;
      id v37 = v12;
      id v40 = a1;
      BOOL v41 = a6;
      BOOL v42 = v7;
      id v27 = v33;
      id v38 = v27;
      [v16 enumerateKeysAndObjectsUsingBlock:v34];
      if ([v27 count])
      {
        uint64_t v28 = *MEMORY[0x189604AA0];
        [v27 objectForKeyedSubscript:*MEMORY[0x189604AA0]];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (!v29 || ![v29 count])
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v26, @"LSHasLocalizedDisplayName"))
          {
            uint64_t v31 = [v27 objectForKeyedSubscript:*MEMORY[0x189604E10]];

            v30 = (void *)v31;
            [v27 setObject:v31 forKeyedSubscript:v28];
          }
        }

        v32 = (void *)[v27 copy];
        [v26 setObject:v32 forKeyedSubscript:@"_LSLocalizedStringsDictionary"];
      }
    }
  }

  _Block_object_dispose(v45, 8);
}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 delegatesMightBeMainBundle:(BOOL)a6 legacyLocalizationList:(BOOL)a7
{
  BOOL v7 = a7;
  char v9 = a5;
  v47[2] = *MEMORY[0x1895F89C0];
  id v33 = a4;
  id v12 = (void *)MEMORY[0x186E2A59C]();
  id v13 = (_LSStringLocalizer *)[objc_alloc((Class)a1) initWithCFBundle:a3 stringsFile:@"InfoPlist" legacyLocalizationList:v7];
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = __Block_byref_object_copy__39;
  v45[4] = __Block_byref_object_dispose__39;
  id v46 = 0LL;
  if (v13)
  {
    id v32 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v15 = v14;
    if (v32 && v14)
    {
      _LSStringLocalizerPrewarmAllLocalizations(v13);
      v16 = (void *)MEMORY[0x189603FE0];
      if ((v9 & 1) != 0)
      {
        uint64_t v18 = *MEMORY[0x189604E10];
        v47[0] = *MEMORY[0x189604AA0];
        v47[1] = v18;
        [MEMORY[0x189603F18] arrayWithObjects:v47 count:2];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 setWithArray:v19];
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v43[0] = MEMORY[0x1895F87A8];
        v43[1] = 3221225472LL;
        v43[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke;
        v43[3] = &unk_189D78B60;
        id v17 = v20;
        id v44 = v17;
        _LSBundleDisplayNameContextEnumerate(v43, v21, v22, v23, v24);
        [v15 setObject:v17 forKeyedSubscript:&stru_189D7B4C8];
      }

      else
      {
        id v17 = objc_alloc_init(MEMORY[0x189603FE0]);
        [v15 setObject:v17 forKeyedSubscript:&stru_189D7B4C8];
      }

      if ((v9 & 4) != 0) {
        [a1 findKeysToLocalizeInInfoDictionary:v33 forArrayKey:*MEMORY[0x189604AA8] stringKey:*MEMORY[0x189604AE8] localizedKeys:v15];
      }
      if ((v9 & 2) != 0)
      {
        [a1 findKeysToLocalizeInInfoDictionary:v33 forArrayKey:@"UTExportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v15];
        [a1 findKeysToLocalizeInInfoDictionary:v33 forArrayKey:@"UTImportedTypeDeclarations" stringKey:@"UTTypeDescription" localizedKeys:v15];
      }

      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2;
      v34[3] = &unk_189D78BD8;
      uint64_t v35 = v13;
      id v25 = v33;
      id v36 = v25;
      id v38 = v45;
      uint64_t v39 = a3;
      id v40 = a1;
      BOOL v41 = a6;
      BOOL v42 = v7;
      id v26 = v32;
      id v37 = v26;
      [v15 enumerateKeysAndObjectsUsingBlock:v34];
      if ([v26 count])
      {
        uint64_t v27 = *MEMORY[0x189604AA0];
        [v26 objectForKeyedSubscript:*MEMORY[0x189604AA0]];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        id v29 = v28;
        if (!v28 || ![v28 count])
        {
          if (_LSGetBooleanFromDict((const __CFDictionary *)v25, @"LSHasLocalizedDisplayName"))
          {
            uint64_t v30 = [v26 objectForKeyedSubscript:*MEMORY[0x189604E10]];

            id v29 = (void *)v30;
            [v26 setObject:v30 forKeyedSubscript:v27];
          }
        }

        uint64_t v31 = (void *)objc_msgSend(v26, "copy", v32);
        [v25 setObject:v31 forKeyedSubscript:@"_LSLocalizedStringsDictionary"];
      }
    }
  }

  _Block_object_dispose(v45, 8);

  objc_autoreleasePoolPop(v12);
}

+ (void)gatherLocalizedStringsForCFBundle:(__CFBundle *)a3 infoDictionary:(id)a4 domains:(unsigned int)a5 legacyLocalizationList:(BOOL)a6
{
}

- (id)debugDescription
{
  BOOL v5 = (void *)NSString;
  BOOL v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 bundleURL];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_LSStringLocalizer bundleProvider](self, "bundleProvider");
    objc_super v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 bundleURL];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 lastPathComponent];
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v10 = @"(no bundle)";
  }

  -[_LSStringsFileContent debugDescription](self->_stringsContent, "debugDescription");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 stringWithFormat:@"<%@ %p> { '%@'; %@ }", v7, self, v10, v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 bundleUnit:(unsigned int)a4 delegate:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v17 = 0LL;
  if (_LSBundleCopyNode(v8, v6, v5, 0LL, &v17))
  {
    char v9 = -[_LSStringLocalizer init](self, "init");
  }

  else
  {
    uint64_t v10 = _LSBundleGet(v8, v6);
    if (v10)
    {
      uint64_t v11 = *(unsigned int *)(v10 + 20);
      uint64x2_t v12 = *(uint64x2_t *)(v10 + 76);
      v18[0] = *(uint64x2_t *)(v10 + 60);
      v18[1] = v12;
      uint64_t v13 = _LSMakeDYLDVersionFromVersionNumber(v18);
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v13 = 0LL;
    }

    BOOL v14 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:]( &OBJC_CLASS____LSStringLocalizer,  "useLegacyLocalizationListForPlatform:sdkVersion:",  v11,  v13);
    [v17 URL];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:]( self,  "initWithBundleURL:stringsFile:legacyLocalizationList:",  v15,  @"InfoPlist",  v14);
  }

  return v9;
}

- (_LSStringLocalizer)initWithDatabase:(id)a3 pluginUnit:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = _LSGetPlugin((uint64_t)v6, a4);
  id v8 = (int *)v7;
  if (!v7) {
    goto LABEL_6;
  }
  if (!*(_DWORD *)v7) {
    goto LABEL_6;
  }
  uint64_t v9 = *(unsigned int *)(v7 + 20);
  uint64x2_t v10 = *(uint64x2_t *)(v7 + 76);
  v17[0] = *(uint64x2_t *)(v7 + 60);
  v17[1] = v10;
  BOOL v11 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:]( &OBJC_CLASS____LSStringLocalizer,  "useLegacyLocalizationListForPlatform:sdkVersion:",  v9,  _LSMakeDYLDVersionFromVersionNumber(v17));
  uint64x2_t v12 = _LSAliasCopyResolvedNode(v6, *v8, 0LL, 0LL, 0LL);
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_6;
  }
  [v12 URL];
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    id v15 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:]( self,  "initWithBundleURL:stringsFile:legacyLocalizationList:",  v14,  @"InfoPlist",  v11);
  }

  else
  {
LABEL_6:
    id v15 = -[_LSStringLocalizer init](self, "init");
  }

  return v15;
}

+ (NSArray)preferredLocalizationsForXCTests
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure]
    && (objc_super v2 = getenv("LS_PREFERRED_LOCALIZATIONS")) != 0LL)
  {
    [NSString stringWithUTF8String:v2];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 componentsSeparatedByString:@"||"];
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    unsigned int v4 = 0LL;
  }

  return (NSArray *)v4;
}

+ (void)setPreferredLocalizationsForXCTests:(id)a3
{
  id v4 = a3;
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    if (v4)
    {
      id v3 = [v4 componentsJoinedByString:@"||"];
      setenv("LS_PREFERRED_LOCALIZATIONS", (const char *)[v3 UTF8String], 1);
    }

    else
    {
      unsetenv("LS_PREFERRED_LOCALIZATIONS");
    }
  }
}

+ (id)localizedStringForCanonicalString:(id)a3 preferredLocalizations:(id)a4 context:(LSContext *)a5
{
  uint64_t v7 = (_LSDatabase *)a3;
  id v9 = a4;
  if (!v7) {
    goto LABEL_6;
  }
  uint64x2_t v10 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find( (LaunchServices::CanonicalString *)a5->db,  v7,  v8);
  if (!v10) {
    goto LABEL_6;
  }
  uint64_t LocalizedString = LaunchServices::CanonicalString::getLocalizedString(v10);
  LaunchServices::LocalizedString::localizeUnsafely(LocalizedString, a5->db, v9);
  uint64x2_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v12;
  if (v12 && [v12 isEqual:v7])
  {

LABEL_6:
    uint64_t v13 = 0LL;
  }

  return v13;
}

+ (id)localizedStringsForCanonicalString:(id)a3 context:(LSContext *)a4
{
  id v6 = (_LSDatabase *)a3;
  if (v6
    && (uint64_t v7 = (LaunchServices::CanonicalString *)LaunchServices::CanonicalString::Find( (LaunchServices::CanonicalString *)a4->db,  v6,  v5)) != 0LL)
  {
    uint64_t LocalizedString = (LaunchServices::LocalizedString *)LaunchServices::CanonicalString::getLocalizedString(v7);
    LaunchServices::LocalizedString::getAllUnsafeLocalizations(LocalizedString, a4->db, 0LL, 0LL, 0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 preferredLocalizations:(id)a5
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = v10;
  if (v9)
  {
    if (!v10)
    {
LABEL_4:
      BOOL v14 = self->_bundleLocalizationsWithDefaultPrefLocs;
      goto LABEL_6;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1019, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];

    if (!v11) {
      goto LABEL_4;
    }
  }

  [(id)__LSDefaultsGetSharedInstance() preferredLocalizations];
  uint64x2_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  int v13 = [v11 isEqual:v12];

  if (v13) {
    goto LABEL_4;
  }
  BOOL v14 = (NSArray *)CFBundleCopyLocalizationsForPreferences((CFArrayRef)self->_bundleLocalizations, (CFArrayRef)v11);
LABEL_6:
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v15 = v14;
  uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        -[_LSStringLocalizer localizedStringWithString:inBundle:localeCode:]( self,  "localizedStringWithString:inBundle:localeCode:",  v9,  a4,  *(void *)(*((void *)&v25 + 1) + 8 * v18));
        uint64_t v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && -[NSArray length](v19, "length"))
        {
          uint64_t v22 = v15;
          goto LABEL_20;
        }

        ++v18;
      }

      while (v16 != v18);
      uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v16) {
        continue;
      }
      break;
    }
  }

  -[_LSLazyPropertyList objectForKey:ofClass:]( self->_unlocalizedInfoPlistStrings,  "objectForKey:ofClass:",  v9,  objc_opt_class());
  uint64_t v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = v21;
  if (v21 && -[NSArray length](v21, "length"))
  {
    uint64_t v22 = v22;
    v20 = v22;
  }

  else
  {
    v20 = 0LL;
  }

- (id)localizedStringWithString:(id)a3 inBundle:(__CFBundle *)a4 localeCode:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v10;
  __int128 v25 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1060, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 handleFailureInMethod:a2, self, @"LSStringLocalizer.mm", 1061, @"Invalid parameter not satisfying: %@", @"localeCode != nil" object file lineNumber description];

LABEL_3:
  uint64x2_t v12 = (void *)MEMORY[0x186E2A59C]();
  CFURLRef v13 = CFBundleCopyBundleURL(a4);
  id v14 = objc_alloc(NSString);
  -[__CFURL path](v13, "path");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (id)[v14 initWithFormat:@"Reading localized string from %@", v15];
  uint64_t v17 = v9;
  uint64_t v18 = (dispatch_queue_s *)_LSLoggingQueue(void)::logQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1;
  block[3] = &unk_189D741C8;
  id v27 = v16;
  id v19 = v16;
  dispatch_sync(v18, block);

  v20 = v17;
  objc_autoreleasePoolPop(v12);
  -[_LSStringsFileContent stringForString:forLocale:fromBundle:cacheLocalizations:]( &self->_stringsContent->super.isa,  v17,  v25,  (uint64_t)a4,  self->_bundleLocalizationsWithDefaultPrefLocs);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_sync((dispatch_queue_t)_LSLoggingQueue(void)::logQueue, &__block_literal_global_169);

  return v21;
}

+ (void)findKeysToLocalizeInInfoDictionary:(id)a3 forArrayKey:(__CFString *)a4 stringKey:(__CFString *)a5 localizedKeys:(id)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v29 = a6;
  context = (void *)MEMORY[0x186E2A59C]();
  __int128 v28 = v9;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v9 objectForKey:a4];
  uint64x2_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64x2_t v12 = 0LL;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if (_NSIsNSDictionary())
        {
          uint64_t v19 = [v18 objectForKeyedSubscript:@"_LSBundleLibraryDelegate"];
          v20 = (void *)v19;
          uint64_t v21 = &stru_189D7B4C8;
          if (v19) {
            uint64_t v21 = (__CFString *)v19;
          }
          uint64_t v22 = v21;

          [v29 objectForKeyedSubscript:v22];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            [MEMORY[0x189603FE0] set];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v29 setObject:v23 forKeyedSubscript:v22];
          }

          uint64_t v24 = objc_opt_class();
          uint64_t v25 = [v18 objectForKey:a5];
          __int128 v26 = (void *)v25;
          if (v24 && v25)
          {
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              __int128 v26 = 0LL;
LABEL_23:

              goto LABEL_24;
            }
          }

          else if (!v25)
          {
            goto LABEL_23;
          }

          [v23 addObject:v26];
          goto LABEL_23;
        }

+ (void)newFrameworkBundleLocalizer
{
}

- (void)initWithBundleProvider:(uint64_t)a3 stringsFile:(uint64_t)a4 legacyLocalizationList:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end
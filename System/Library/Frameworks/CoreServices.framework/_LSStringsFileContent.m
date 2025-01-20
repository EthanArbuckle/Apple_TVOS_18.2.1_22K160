@interface _LSStringsFileContent
+ (id)IOQueue;
- (id)_queryLoadedPlist:(void *)a3 forRawKey:(void *)a4 locale:;
- (id)debugDescription;
- (id)getStringsFileContentAfterLocTableLoadedInBundle:(void *)a3 forLocale:;
- (id)getStringsFileContentInBundle:(void *)a3 forLocale:(const __CFString *)a4 withExtension:;
- (id)initWithStringsFile:(id)a1;
- (id)stringForString:(void *)a3 forLocale:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:;
- (id)subscriptLoctableWithLocale:(uint64_t)a1;
- (void)loadLoctableIfNecessaryFromBundle:(uint64_t)a1;
- (void)prewarmAllLocalizationsWithBundle:(void *)a3 forLocalizations:;
- (void)stringsFileContentFromBundle:(void *)a3 forLocaleCode:(void *)a4 cacheLocalizations:;
- (void)uncheckedObjectsForKeys:(void *)a3 forLocaleCode:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:;
@end

@implementation _LSStringsFileContent

- (id)initWithStringsFile:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_CLASS____LSStringsFileContent;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v4;

      id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
      v7 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v6;

      *((_BYTE *)a1 + 32) = 0;
    }
  }

  return a1;
}

- (void)uncheckedObjectsForKeys:(void *)a3 forLocaleCode:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    v12 = -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    v13 = v12;
    if (v12)
    {
      if (v12 == (void *)a1[3])
      {
        uint64_t v14 = -[_LSStringsFileContent subscriptLoctableWithLocale:]((uint64_t)a1, v10);
        v15 = (void *)v14;
        v16 = (void *)MEMORY[0x189604A60];
        if (v14) {
          v16 = (void *)v14;
        }
        a1 = v16;
      }

      else
      {
        if (v9) {
          [v12 uncheckedObjectsForKeys:v9];
        }
        else {
          -[_LSLazyPropertyList propertyList](v12);
        }
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

- (id)stringForString:(void *)a3 forLocale:(uint64_t)a4 fromBundle:(void *)a5 cacheLocalizations:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    v12 = -[_LSStringsFileContent stringsFileContentFromBundle:forLocaleCode:cacheLocalizations:](a1, a4, v10, v11);
    if (v12)
    {
      if (![(id)__LSDefaultsGetSharedInstance() isRegionChina]
        || ([v9 stringByAppendingString:@"#CH"],
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v13, v10),
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            !v14))
      {
        -[_LSStringsFileContent _queryLoadedPlist:forRawKey:locale:]((uint64_t)a1, v12, v9, v10);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  return v14;
}

+ (id)IOQueue
{
  if (+[_LSStringsFileContent IOQueue]::once != -1) {
    dispatch_once(&+[_LSStringsFileContent IOQueue]::once, &__block_literal_global_138_0);
  }
  return (id)+[_LSStringsFileContent IOQueue]::result;
}

- (id)debugDescription
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__39;
  v17 = __Block_byref_object_dispose__39;
  id v18 = 0LL;
  [(id)objc_opt_class() IOQueue];
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41___LSStringsFileContent_debugDescription__block_invoke;
  block[3] = &unk_189D748F0;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  uint64_t v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(id)v14[5] count];
  [(id)v14[5] allKeys];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", @", ");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 stringWithFormat:@"<%@ %p> { %lu localizations loaded: %@ }", v6, self, v7, v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)loadLoctableIfNecessaryFromBundle:(uint64_t)a1
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
    {
      uint64_t v3 = -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, 0LL, @"loctable");
      uint64_t v4 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v3;

      *(_BYTE *)(a1 + 32) |= 1u;
    }
  }

- (id)getStringsFileContentInBundle:(void *)a3 forLocale:(const __CFString *)a4 withExtension:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a3;
  if (a1)
  {
    CFURLRef v8 = CFBundleCopyResourceURLForLocalization(a2, *(CFStringRef *)(a1 + 8), a4, 0LL, v7);
    if (v8)
    {
      _LSDefaultLog();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        -[__CFURL lastPathComponent](v8, "lastPathComponent");
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:].cold.1( v10,  (uint64_t)v7,  v13,  v9);
      }

      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:]((uint64_t)&OBJC_CLASS____LSLazyPropertyList, v8);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v11 = 0LL;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)getStringsFileContentAfterLocTableLoadedInBundle:(void *)a3 forLocale:
{
  id v5 = a3;
  id v6 = v5;
  if (!a1)
  {
    id v7 = 0LL;
    goto LABEL_7;
  }

  if (!a2)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInFunction:v10, @"LSStringLocalizer.mm", 1158, @"Invalid parameter not satisfying: %@", @"bundle != NULL" file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
LABEL_9:
    [MEMORY[0x1896077D8] currentHandler];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[_LSStringsFileContent getStringsFileContentAfterLocTableLoadedInBundle:forLocale:]"];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 handleFailureInFunction:v12, @"LSStringLocalizer.mm", 1159, @"Invalid parameter not satisfying: %@", @"localeCode != nil" file lineNumber description];

    goto LABEL_4;
  }

  if (!v5) {
    goto LABEL_9;
  }
LABEL_4:
  -[_LSStringsFileContent getStringsFileContentInBundle:forLocale:withExtension:](a1, a2, v6, @"strings");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v7 = *(id *)(a1 + 24);
    if (!v7)
    {
      _LSLazyPropertyListGetSharedEmptyPropertyList();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

- (void)stringsFileContentFromBundle:(void *)a3 forLocaleCode:(void *)a4 cacheLocalizations:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x3032000000LL;
    v34 = __Block_byref_object_copy__39;
    v35 = __Block_byref_object_dispose__39;
    id v36 = 0LL;
    [(id)objc_opt_class() IOQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke;
    block[3] = &unk_189D74C20;
    v30 = &v31;
    block[4] = a1;
    id v11 = v7;
    id v29 = v11;
    dispatch_sync(v9, block);

    v12 = (void *)v32[5];
    if (!v12)
    {
      uint64_t v21 = v10;
      uint64_t v22 = 3221225472LL;
      v23 = __87___LSStringsFileContent_stringsFileContentFromBundle_forLocaleCode_cacheLocalizations___block_invoke_2;
      v24 = &unk_189D78C20;
      v25 = a1;
      uint64_t v27 = a2;
      id v13 = v11;
      id v26 = v13;
      uint64_t v14 = (void (**)(void))MEMORY[0x186E2A7B8](&v21);
      if (objc_msgSend(v8, "containsObject:", v13, v21, v22, v23, v24, v25))
      {
        uint64_t v15 = (void *)a1[2];
        [(id)objc_opt_class() IOQueue];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = _LSLazyLoadObjectForKey(v15, v13, v16, v14);
        id v18 = (void *)v32[5];
        v32[5] = v17;
      }

      else
      {
        uint64_t v19 = v14[2](v14);
        v16 = (void *)v32[5];
        v32[5] = v19;
      }

      v12 = (void *)v32[5];
    }

    a1 = v12;

    _Block_object_dispose(&v31, 8);
  }

  return a1;
}

- (void)prewarmAllLocalizationsWithBundle:(void *)a3 forLocalizations:
{
  id v5 = a3;
  if (a1 && a2)
  {
    -[_LSStringsFileContent loadLoctableIfNecessaryFromBundle:](a1, a2);
    [(id)objc_opt_class() IOQueue];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __76___LSStringsFileContent_prewarmAllLocalizationsWithBundle_forLocalizations___block_invoke;
    uint64_t v15 = &unk_189D78C48;
    id v7 = v5;
    id v16 = v7;
    uint64_t v17 = a1;
    uint64_t v19 = a2;
    id v8 = v6;
    id v18 = v8;
    id v9 = (void (**)(void, void))MEMORY[0x186E2A7B8](&v12);
    uint64_t v10 = *(void **)(a1 + 24);
    if (v10)
    {
      objc_msgSend(v10, "prewarm", v12, v13, v14, v15, v16, v17);
    }

    else if (_LSContextIsCurrentThreadInitializing() || _LSDatabaseGetNoServerLock())
    {
      for (unint64_t i = 0; i < objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17); ++i)
        v9[2](v9, i);
    }

    else
    {
      dispatch_apply(objc_msgSend(v7, "count", v12, v13, v14, v15, v16, v17), 0, v9);
    }
  }
}

- (id)subscriptLoctableWithLocale:(uint64_t)a1
{
  v15[5] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = _LSGetProductNameSuffix();
    id v5 = _LSGetPlatformNameSuffix();
    id v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
    CFStringRef cf = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, @"%@%@%@", v3, v4, v5);
    CFStringRef v7 = CFStringCreateWithFormat(v6, 0LL, @"%@%@%@", v3, v5, v4);
    CFStringRef v8 = CFStringCreateWithFormat(v6, 0LL, @"%@%@", v3, v5);
    CFStringRef v9 = CFStringCreateWithFormat(v6, 0LL, @"%@%@", v3, v4);
    uint64_t v10 = 0LL;
    v15[0] = cf;
    v15[1] = v7;
    v15[2] = v8;
    v15[3] = v9;
    v15[4] = v3;
    do
    {
      [*(id *)(a1 + 24) objectForKey:v15[v10] ofClass:objc_opt_class()];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11) {
        break;
      }
    }

    while (v10++ != 4);
    if (v9) {
      CFRelease(v9);
    }
    if (v8) {
      CFRelease(v8);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)_queryLoadedPlist:(void *)a3 forRawKey:(void *)a4 locale:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (*(id *)(a1 + 24) == v7)
    {
      -[_LSStringsFileContent subscriptLoctableWithLocale:](a1, v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = [v11 objectForKey:v8];
      uint64_t v10 = (void *)v13;
      if (v12 && v13 && (objc_opt_isKindOfClass() & 1) == 0)
      {

        uint64_t v10 = 0LL;
      }
    }

    else
    {
      [v7 objectForKey:v8 ofClass:objc_opt_class()];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (void)getStringsFileContentInBundle:(uint8_t *)buf forLocale:(os_log_t)log withExtension:.cold.1( void *a1,  uint64_t a2,  uint8_t *buf,  os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_183E58000, log, OS_LOG_TYPE_DEBUG, "reading %@ for %@", buf, 0x16u);
}

@end
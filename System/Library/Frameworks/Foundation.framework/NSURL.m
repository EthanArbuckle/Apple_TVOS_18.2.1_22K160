@interface NSURL
+ (uint64_t)setIOPolicy:(uint64_t)a1 type:(uint64_t)a2 scope:forBlock:;
@end

@implementation NSURL

uint64_t __72__NSURL_NSURLPromisedItems__checkPromisedItemIsReachableAndReturnError___block_invoke( uint64_t a1,  void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t result = [a2 checkResourceIsReachableAndReturnError:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  if (v4 != a2 && !*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t result = [*(id *)(a1 + 32) _fixedUpSideFaultError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
    }
  }

  return result;
}

void __62__NSURL_NSURLPromisedItems___valueFromFaultDictionary_forKey___block_invoke()
{
  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_96 = (uint64_t (*)(void, void, void))dlsym( v0,  "UTTypeCreatePreferredIdentifierForTag");
    uint64_t v2 = *(void *)dlsym(v1, "kUTTagClassFilenameExtension");
    qword_18C496600 = v2;
    if (_MergedGlobals_96) {
      BOOL v3 = v2 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3) {
      NSLog((NSString *)@"NSURL_Promises couldn't load a MobileCoreServices symbol.");
    }
  }

void __71__NSURL_NSURLPromisedItems__getPromisedItemResourceValue_forKey_error___block_invoke( uint64_t a1,  void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8LL) + 40LL;
    v11 = a2;
LABEL_11:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 getResourceValue:v8 forKey:v9 error:v10];
    return;
  }

  uint64_t v4 = objc_msgSend( (id)+[x objectForKey:](&unk_189D1EFF0, "objectForKey:", *(void *)(a1 + 40)),  "unsignedIntegerValue");
  switch(v4)
  {
    case 3LL:
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL) + 40LL;
      v11 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
LABEL_10:
      uint64_t v10 = v12 + 40;
      goto LABEL_11;
    case 2LL:
LABEL_7:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      return;
    case 1LL:
      uint64_t v5 = _CFURLCopyPropertiesOfPromiseAtURL();
      if (v5)
      {
        v6 = (const void *)v5;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) _valueFromFaultDictionary:v5 forKey:*(void *)(a1 + 40)];
        id v7 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        CFRelease(v6);
        goto LABEL_7;
      }

      return;
  }

  v13 = *(void **)(a1 + 40);
  else {
    v14 = v13;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [a2 getResourceValue:*(void *)(*(void *)(a1 + 56) + 8) + 40 forKey:v14 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend( *(id *)(a1 + 32),  "_fixedUpSideFaultError:",  *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 40LL));
    return;
  }

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v16 = *(void *)(v15 + 40);
  uint64_t v8 = v15 + 40;
  if (!v16)
  {
    v11 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
    goto LABEL_10;
  }

void __69__NSURL_NSURLPromisedItems__promisedItemResourceValuesForKeys_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  if (*(void **)(a1 + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [a2 resourceValuesForKeys:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    return;
  }

  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v47;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)+[x objectForKey:](&unk_189D1F018, "objectForKey:", v7), "unsignedIntegerValue");
        id v9 = (id)*((void *)&v50 + v8);
        if (!v9)
        {
          id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
          *((void *)&v50 + v8) = v9;
        }

        [v9 addObject:v7];
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v45 count:16];
    }

    while (v4);
    uint64_t v10 = *((void *)&v51 + 1);
    v11 = (void *)[MEMORY[0x189603FC8] dictionary];
    if (v10)
    {
      uint64_t v12 = [*(id *)(a1 + 32) resourceValuesForKeys:v10 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
      if (!v12) {
        goto LABEL_57;
      }
      [v11 addEntriesFromDictionary:v12];
    }
  }

  else
  {
    v11 = (void *)[MEMORY[0x189603FC8] dictionary];
  }

  v13 = (void *)*((void *)&v50 + 1);
  if (*((void *)&v50 + 1))
  {
    CFTypeRef cf = 0LL;
    v14 = (const void *)_CFURLCopyPropertiesOfPromiseAtURL();
    if (v14)
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v42;
        do
        {
          for (uint64_t j = 0LL; j != v15; ++j)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * j);
            uint64_t v19 = [*(id *)(a1 + 32) _valueFromFaultDictionary:v14 forKey:v18];
            if (v19) {
              [v11 setObject:v19 forKey:v18];
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v40 count:16];
        }

        while (v15);
      }

      CFRelease(v14);
    }

    else
    {
      if (cf)
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( *(id *)(a1 + 32),  "_fixedUpSideFaultError:");
        CFRelease(cf);
      }

      v11 = 0LL;
    }
  }

  v20 = (void *)v50;
  if ((void)v50)
  {
    CFTypeRef cf = 0LL;
    p_CFTypeRef cf = &cf;
    uint64_t v54 = 0x3052000000LL;
    v55 = __Block_byref_object_copy__8;
    v56 = __Block_byref_object_dispose__8;
    uint64_t v57 = 0LL;
    *(void *)&__int128 v58 = MEMORY[0x1895F87A8];
    *((void *)&v58 + 1) = 3221225472LL;
    *(void *)&__int128 v59 = ___virtualizeURLKeysForAccessingFault_block_invoke;
    *((void *)&v59 + 1) = &unk_189C9E118;
    *(void *)&__int128 v60 = v50;
    *((void *)&v60 + 1) = &cf;
    [(id)v50 enumerateObjectsUsingBlock:&v58];
    v21 = (void *)p_cf[5];
    id v22 = v20;
    if (v21) {
      id v22 = v21;
    }
    v38 = v20;
    _Block_object_dispose(&cf, 8);
    v23 = (void *)[a2 resourceValuesForKeys:v22 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    id v24 = v23;
    if (!v23)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend( *(id *)(a1 + 32),  "_fixedUpSideFaultError:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 40LL));
      goto LABEL_57;
    }

    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v25 = [v23 countByEnumeratingWithState:&v58 objects:&cf count:16];
    if (v25)
    {
      v26 = 0LL;
      uint64_t v27 = *(void *)v59;
      uint64_t v28 = *MEMORY[0x189604BF8];
      v29 = (void *)*MEMORY[0x189603C60];
      do
      {
        for (uint64_t k = 0LL; k != v25; ++k)
        {
          if (*(void *)v59 != v27) {
            objc_enumerationMutation(v24);
          }
          v31 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          int v32 = [v31 isEqualToString:v28];
          if (v29 == v31) {
            int v33 = 0;
          }
          else {
            int v33 = v32;
          }
          if (v33 == 1)
          {
            if (!v26) {
              v26 = (void *)[v24 mutableCopy];
            }
            objc_msgSend(v26, "setObject:forKey:", objc_msgSend(v24, "objectForKey:", v31), v29);
            [v26 removeObjectForKey:v31];
          }
        }

        uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:&cf count:16];
      }

      while (v25);
      if (v26) {
        id v24 = v26;
      }
    }

    [v11 addEntriesFromDictionary:v24];
    unint64_t v34 = [v24 count];
    if (v34 < [v38 count])
    {
      v35 = (void *)[MEMORY[0x189603FA8] arrayWithArray:v38];
      objc_msgSend(v35, "removeObjectsInArray:", objc_msgSend(v24, "allKeys"));
      uint64_t v36 = [*(id *)(a1 + 32) resourceValuesForKeys:v35 error:0];
      if (v36) {
        [v11 addEntriesFromDictionary:v36];
      }
      else {
        NSLog((NSString *)@"-[NSURL promisedItemResourceValuesForKeys:error:]: Unable to handle keys: %@", v35);
      }
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v11;
LABEL_57:
  for (uint64_t m = 0LL; m != 32; m += 8LL)
}

void __20__NSURL_NSURL__init__block_invoke(uint64_t a1)
{
}

+ (uint64_t)setIOPolicy:(uint64_t)a1 type:(uint64_t)a2 scope:forBlock:
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  getpid();
  if (sandbox_check())
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "[NSURL setIOPolicy:] sandbox_check: current process does not allow iopolicy syscalls",  buf,  2u);
    }

    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }

  int v4 = getiopolicy_np(3, 1);
  if (v4 == 1) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  int v5 = v4;
  if (v4 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      int v7 = 1;
      __int16 v8 = 1024;
      int v9 = 3;
      __int16 v10 = 1024;
      int v11 = 1;
      _os_log_error_impl( &dword_182EB1000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "[NSURL setIOPolicy:] getiopolicy_np failed when setting policy: %d, type: %d, scope: %d",  buf,  0x14u);
    }

    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }

  setiopolicy_np(3, 1, 1);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if ((v5 & 0x80000000) == 0) {
    return setiopolicy_np(3, 1, v5);
  }
  return result;
}

uint64_t __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke(void *a1)
{
  v3[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t result = [*(id *)(*(void *)(a1[6] + 8) + 24) getResourceValue:v3 forKey:*MEMORY[0x189603C48] error:0];
  if ((_DWORD)result)
  {
    uint64_t result = [v3[0] BOOLValue];
    if ((_DWORD)result)
    {
      CFRelease(*(CFTypeRef *)(*(void *)(a1[6] + 8LL) + 24LL));
      uint64_t result = MEMORY[0x186E1E340](*MEMORY[0x189604DB0], a1[4], 0LL, 1LL, a1[5]);
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = result;
    }
  }

  return result;
}

void __31__NSURL_NSURL__parameterString__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_debug_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEBUG,  "NSURL parameterString is deprecated and now always returns nil. The path component now includes the part of the UR L string which parameterString used to return.\n URL = %{private}@",  (uint8_t *)&v4,  0xCu);
  }

uint64_t __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) getResourceValue:*(void *)(*(void *)(a1 + 56) + 8) + 40 forKey:*MEMORY[0x189603C48] error:0];
  if ((_DWORD)result)
  {
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) BOOLValue];
    if ((_DWORD)result)
    {
      uint64_t result = [*(id *)(a1 + 32) URLByAppendingPathComponent:*(void *)(a1 + 40) isDirectory:1];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
    }
  }

  return result;
}

uint64_t __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result = CFURLResourceIsReachable(*(CFURLRef *)(a1 + 40), *(CFErrorRef **)(a1 + 48));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result != 0;
  return result;
}

@end
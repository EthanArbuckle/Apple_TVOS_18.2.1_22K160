@interface NSURL(NSURLPromisedItems)
- (BOOL)checkPromisedItemIsReachableAndReturnError:()NSURLPromisedItems;
- (BOOL)getPromisedItemResourceValue:()NSURLPromisedItems forKey:error:;
- (NSError)_fixedUpSideFaultError:()NSURLPromisedItems;
- (id)_valueFromFaultDictionary:()NSURLPromisedItems forKey:;
- (uint64_t)_promiseExtensionConsume;
- (uint64_t)_promiseExtensionRelease:()NSURLPromisedItems;
- (uint64_t)promisedItemResourceValuesForKeys:()NSURLPromisedItems error:;
- (void)_performWithPhysicalURL:()NSURLPromisedItems;
@end

@implementation NSURL(NSURLPromisedItems)

- (uint64_t)_promiseExtensionConsume
{
  v0 = (const __CFData *)MEMORY[0x186E1ED6C]();
  if (!v0) {
    return -1LL;
  }
  v1 = v0;
  CFDataGetBytePtr(v0);
  uint64_t v2 = sandbox_extension_consume();
  CFRelease(v1);
  return v2;
}

- (uint64_t)_promiseExtensionRelease:()NSURLPromisedItems
{
  if ((a3 & 0x8000000000000000LL) == 0) {
    return sandbox_extension_release();
  }
  return result;
}

- (void)_performWithPhysicalURL:()NSURLPromisedItems
{
  v9[1] = *MEMORY[0x1895F89C0];
  v5 = (void *)_CFURLPromiseCopyPhysicalURL();
  if (v5)
  {
    v6 = v5;
    if (([v5 isEqual:a1] & 1) != 0 || !_CFURLIsItemPromiseAtURL())
    {
      uint64_t v7 = -1LL;
      v8 = a1;
    }

    else
    {
      uint64_t v7 = [v6 _promiseExtensionConsume];
      v9[0] = 0LL;
      else {
        v8 = a1;
      }
    }

    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v8);
    [a1 _promiseExtensionRelease:v7];
    CFRelease(v6);
  }

  else
  {
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, a1);
    [a1 _promiseExtensionRelease:-1];
  }

- (NSError)_fixedUpSideFaultError:()NSURLPromisedItems
{
  v5 = (void *)objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithDictionary:", objc_msgSend(a3, "userInfo"));
  if ([v5 objectForKey:@"NSURL"]) {
    [v5 setObject:a1 forKey:@"NSURL"];
  }
  if ([v5 objectForKey:@"NSFilePath"]) {
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a1, "path"), @"NSFilePath");
  }
  uint64_t v6 = [v5 objectForKey:@"NSUnderlyingError"];
  if (v6) {
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a1, "_fixedUpSideFaultError:", v6), @"NSUnderlyingError");
  }
  return +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  [a3 domain],  objc_msgSend(a3, "code"),  v5);
}

- (BOOL)checkPromisedItemIsReachableAndReturnError:()NSURLPromisedItems
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  uint64_t v18 = 0LL;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __72__NSURL_NSURLPromisedItems__checkPromisedItemIsReachableAndReturnError___block_invoke;
  v8[3] = &unk_189C9E080;
  v8[4] = a1;
  v8[5] = &v9;
  v8[6] = &v13;
  v8[7] = a3;
  [a1 _performWithPhysicalURL:v8];
  v4 = v10;
  int v5 = *((unsigned __int8 *)v10 + 24);
  if (a3 && !*((_BYTE *)v10 + 24))
  {
    *a3 = v14[5];
    int v5 = *((unsigned __int8 *)v4 + 24);
  }

  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (id)_valueFromFaultDictionary:()NSURLPromisedItems forKey:
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x189603D00]), "pathExtension");
  if (v6) {
    uint64_t v7 = (const __CFString *)v6;
  }
  else {
    uint64_t v7 = &stru_189CA6A28;
  }
  if (qword_18C496608 != -1) {
    dispatch_once(&qword_18C496608, &__block_literal_global_15);
  }
  return (id)_MergedGlobals_96(qword_18C496600, v7, 0LL);
}

- (BOOL)getPromisedItemResourceValue:()NSURLPromisedItems forKey:error:
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  uint64_t v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3052000000LL;
  uint64_t v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  uint64_t v21 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __71__NSURL_NSURLPromisedItems__getPromisedItemResourceValue_forKey_error___block_invoke;
  v11[3] = &unk_189C9E0C8;
  v11[6] = &v12;
  v11[7] = &v22;
  v11[4] = a1;
  v11[5] = a4;
  v11[8] = &v16;
  [a1 _performWithPhysicalURL:v11];
  uint64_t v7 = v13;
  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a5 && !*((_BYTE *)v13 + 24))
  {
    *a5 = v17[5];
    int v8 = *((unsigned __int8 *)v7 + 24);
  }

  if (a3 && v8)
  {
    *a3 = v23[5];
    int v8 = *((unsigned __int8 *)v7 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

- (uint64_t)promisedItemResourceValuesForKeys:()NSURLPromisedItems error:
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  uint64_t v18 = __Block_byref_object_copy__8;
  uint64_t v19 = __Block_byref_object_dispose__8;
  uint64_t v20 = 0LL;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  uint64_t v12 = __Block_byref_object_copy__8;
  uint64_t v13 = __Block_byref_object_dispose__8;
  uint64_t v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __69__NSURL_NSURLPromisedItems__promisedItemResourceValuesForKeys_error___block_invoke;
  v8[3] = &unk_189C9E0F0;
  v8[4] = a1;
  v8[5] = a3;
  v8[6] = &v9;
  v8[7] = &v15;
  [a1 _performWithPhysicalURL:v8];
  int v5 = v10;
  uint64_t v6 = v10[5];
  if (a4 && !v6)
  {
    *a4 = v16[5];
    uint64_t v6 = v5[5];
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

@end
@interface _LSLazyPropertyList
+ (BOOL)supportsSecureCoding;
+ (_LSDataBackedPropertyList)lazyPropertyListWithPropertyListData:(uint64_t)a1;
+ (_LSDictionaryBackedPropertyList)lazyPropertyListWithPropertyList:(uint64_t)a1;
+ (_LSLazyPropertyList)lazyPropertyListWithContext:(LSContext *)a3 unit:(unsigned int)a4;
+ (_LSLazyPropertyList)lazyPropertyListWithDatabase:(id)a3 unit:(unsigned int)a4;
+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a1;
+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a3 options:(uint64_t)a4 error:;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSLazyPropertyList)init;
- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)objectsForKeys:(id)a3;
- (id)propertyList;
- (id)uncheckedObjectsForKeys:(id)a3;
@end

@implementation _LSLazyPropertyList

+ (_LSLazyPropertyList)lazyPropertyListWithContext:(LSContext *)a3 unit:(unsigned int)a4
{
  if (a3) {
    a3 = (LSContext *)a3->db;
  }
  return (_LSLazyPropertyList *)[a1 lazyPropertyListWithDatabase:a3 unit:*(void *)&a4];
}

+ (_LSDataBackedPropertyList)lazyPropertyListWithPropertyListData:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  v3 = -[_LSDataBackedPropertyList initWithPropertyListData:]( objc_alloc(&OBJC_CLASS____LSDataBackedPropertyList),  "initWithPropertyListData:",  v2);

  return v3;
}

- (_LSLazyPropertyList)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____LSLazyPropertyList;
  return (_LSLazyPropertyList *)-[LSPropertyList _init](&v3, sel__init);
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyList
{
  if (a1)
  {
    id v2 = 0LL;
    [a1 _getPropertyList:&v2];
    a1 = v2;
  }

  return a1;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = objc_opt_self();
  id v8 = 0LL;
  v4 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:options:error:](v3, v2, 1LL, (uint64_t)&v8);
  id v5 = v8;
  if (v4)
  {
    _LSDefaultLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:].cold.2((uint64_t)v2, v6);
    }
  }

  else
  {
    _LSDefaultLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_LSLazyPropertyList lazyPropertyListWithPropertyListURL:].cold.1((uint64_t)v2, (uint64_t)v5, v6);
    }
  }

  return v4;
}

+ (id)lazyPropertyListWithPropertyListURL:(uint64_t)a3 options:(uint64_t)a4 error:
{
  id v6 = a2;
  uint64_t v7 = objc_opt_self();
  id v8 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithContentsOfURL:v6 options:a3 error:a4];
  if (v8)
  {
    v9 = +[_LSLazyPropertyList lazyPropertyListWithPropertyListData:](v7, v8);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

+ (_LSDictionaryBackedPropertyList)lazyPropertyListWithPropertyList:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  if ([v2 count])
  {
    uint64_t v3 = -[_LSDictionaryBackedPropertyList initWithPropertyList:]( objc_alloc(&OBJC_CLASS____LSDictionaryBackedPropertyList),  "initWithPropertyList:",  v2);
  }

  else
  {
    +[_LSEmptyPropertyList sharedInstance](&OBJC_CLASS____LSEmptyPropertyList, "sharedInstance");
    uint64_t v3 = (_LSDictionaryBackedPropertyList *)objc_claimAutoreleasedReturnValue();
  }

  v4 = v3;

  return v4;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2, self, @"LSLazyPropertyList.mm", 152, @"Invalid parameter not satisfying: %@", @"keys != nil" object file lineNumber description];
  }

  id v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v12 = -[_LSLazyPropertyList objectForKey:ofClass:](self, "objectForKey:ofClass:", v11, 0LL);
        if (v12) {
          [v6 setObject:v12 forKeyedSubscript:v11];
        }
      }

      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  v13 = (void *)[v6 copy];
  return v13;
}

- (BOOL)_getPropertyList:(id *)a3
{
  return 0;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  return 0;
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x186E2A59C]();
  -[_LSLazyPropertyList uncheckedObjectsForKeys:](self, "uncheckedObjectsForKeys:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = -[LSBundleInfoCachedValues _initWithKeys:forDictionary:]( objc_alloc(&OBJC_CLASS___LSBundleInfoCachedValues),  "_initWithKeys:forDictionary:",  v4,  v6);

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)objectForKey:(id)a3 checkingKeyClass:(Class)a4 checkingValueClass:(Class)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v10 = (void *)MEMORY[0x186E2A59C]();
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"LSLazyPropertyList.mm", 204, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }

  id v25 = 0LL;
  BOOL v11 = -[_LSLazyPropertyList _getValue:forPropertyListKey:](self, "_getValue:forPropertyListKey:", &v25, v9);
  id v12 = v25;
  v13 = v12;
  if (v12) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v15 = v12;
    if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0LL;
      id v16 = v15;
LABEL_25:

      goto LABEL_26;
    }

    v13 = v15;
    if (a5)
    {
      if (_NSIsNSArray())
      {
        id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v17 = v15;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t i = 0LL; i != v18; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              if ((objc_opt_isKindOfClass() & 1) != 0) {
                [v16 addObject:v21];
              }
            }

            uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }

          while (v18);
        }

        v13 = (void *)[v16 copy];
        goto LABEL_24;
      }

      v13 = v15;
      if (_NSIsNSDictionary())
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v15, "count"));
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 3221225472LL;
        v30[2] = ___ZN14LaunchServices13PropertyListsL27filterValueFromPropertyListEP11objc_objectP10objc_classS4__block_invoke;
        v30[3] = &unk_189D77380;
        Class v32 = a5;
        id v16 = v22;
        id v31 = v16;
        [v15 enumerateKeysAndObjectsUsingBlock:v30];
        v13 = (void *)[v16 copy];

        id v17 = v31;
LABEL_24:

        goto LABEL_25;
      }
    }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_LSLazyPropertyList)lazyPropertyListWithDatabase:(id)a3 unit:(unsigned int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!v6
    || !a4
    || (_LSPlistGet((uint64_t)v6, a4), (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL)
    || (+[_LSLazyPropertyList lazyPropertyListWithPropertyListData:]((uint64_t)a1, v8),
        id v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    +[_LSEmptyPropertyList sharedInstance](&OBJC_CLASS____LSEmptyPropertyList, "sharedInstance");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (_LSLazyPropertyList *)v9;
}

+ (void)lazyPropertyListWithPropertyListURL:(os_log_t)log .cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Failed to load plist data from %{private}@: %{public}@",  (uint8_t *)&v3,  0x16u);
}

+ (void)lazyPropertyListWithPropertyListURL:(uint64_t)a1 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Loaded plist data at %{private}@ (don't know if valid yet)",  (uint8_t *)&v2,  0xCu);
}

@end
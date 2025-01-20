@interface NSMutableDictionary(MCMDeeplyMutable)
- (id)MCM_deepCopy;
- (id)_createOrConvertToMutableDictionaryFromDictionary:()MCMDeeplyMutable;
- (id)_dictionaryAtKeyPath:()MCMDeeplyMutable;
- (id)_findKeyPathsSortedByDepthFirstOfKindOfClass:()MCMDeeplyMutable;
- (id)_mutableDictionaryAtKeyPath:()MCMDeeplyMutable;
- (void)MCM_overlayDictionary:()MCMDeeplyMutable existingValuesTakePrecedent:;
- (void)MCM_replaceDeepDictionariesWithReplaceHandler:()MCMDeeplyMutable;
- (void)_overlayValueAtKey:()MCMDeeplyMutable intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:;
@end

@implementation NSMutableDictionary(MCMDeeplyMutable)

- (void)MCM_replaceDeepDictionariesWithReplaceHandler:()MCMDeeplyMutable
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v4 = a3;
  [a1 _findKeyPathsSortedByDepthFirstOfKindOfClass:objc_opt_class()];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [a1 _dictionaryAtKeyPath:v8];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 != v9)
        {
          [v8 lastObject];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)[v8 mutableCopy];
          [v12 removeLastObject];
          v13 = (void *)[v12 copy];
          [a1 _mutableDictionaryAtKeyPath:v13];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v10) {
            [v14 setObject:v10 forKeyedSubscript:v11];
          }
          else {
            [v14 removeObjectForKey:v11];
          }
        }
      }

      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v18 count:16];
    }

    while (v6);
  }
}

- (void)MCM_overlayDictionary:()MCMDeeplyMutable existingValuesTakePrecedent:
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  [v5 setObject:v4 forKeyedSubscript:MEMORY[0x189604A58]];
  while ([v5 count])
  {
    context = (void *)MEMORY[0x1895CE3A8]();
    [v5 allKeys];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 firstObject];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 objectForKeyedSubscript:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 removeObjectForKey:v7];
    [a1 _mutableDictionaryAtKeyPath:v7];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    [v8 allKeys];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          [v7 arrayByAddingObject:v15];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1895F87A8];
          v22[1] = 3221225472LL;
          v22[2] = __91__NSMutableDictionary_MCMDeeplyMutable__MCM_overlayDictionary_existingValuesTakePrecedent___block_invoke;
          v22[3] = &unk_18A29CF78;
          id v23 = v5;
          id v24 = v16;
          id v17 = v16;
          [a1 _overlayValueAtKey:v15 intoTargetDictionary:v9 fromSourceDictionary:v8 targetTakePrecedent:a4 nestedDictionaryHandler:v22];
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v25 count:16];
      }

      while (v12);
    }

    objc_autoreleasePoolPop(context);
  }
}

- (id)MCM_deepCopy
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [a1 _findKeyPathsSortedByDepthFirstOfKindOfClass:objc_opt_class()];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [a1 _dictionaryAtKeyPath:v6];
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 lastObject];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)[v6 mutableCopy];
        [v9 removeLastObject];
        v10 = (void *)[v9 copy];
        [a1 _mutableDictionaryAtKeyPath:v10];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (void *)[v7 copy];
        [v11 setObject:v12 forKeyedSubscript:v8];
      }

      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
    }

    while (v3);
  }

  uint64_t v13 = (void *)[a1 copy];

  return v13;
}

- (void)_overlayValueAtKey:()MCMDeeplyMutable intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:
{
  id v15 = a3;
  id v11 = a4;
  uint64_t v12 = a7;
  [a5 objectForKeyedSubscript:v15];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12[2](v12, v13);
  }

  else if (!a6 {
         || ([v11 objectForKeyedSubscript:v15],
  }
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v14,
             !v14))
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v15, v15);
  }
}

- (id)_findKeyPathsSortedByDepthFirstOfKindOfClass:()MCMDeeplyMutable
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v1 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v2 = objc_alloc(MEMORY[0x189603FE0]);
  uint64_t v3 = (void *)objc_msgSend(v2, "initWithObjects:", MEMORY[0x189604A58], 0);
  uint64_t v4 = v3;
  while ([v3 count])
  {
    [v4 anyObject];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 removeObject:v5];
    [a1 _dictionaryAtKeyPath:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          [v6 objectForKeyedSubscript:v11];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v5 arrayByAddingObject:v11];
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v1 addObject:v13];
            [v4 addObject:v13];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }

      while (v8);
    }

    uint64_t v3 = v4;
  }

  [v1 sortUsingComparator:&__block_literal_global_1177];
  v14 = (void *)[v1 copy];

  return v14;
}

- (id)_dictionaryAtKeyPath:()MCMDeeplyMutable
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      v10 = v5;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        [v10 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }

      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }

    while (v7);
  }

  return v5;
}

- (id)_mutableDictionaryAtKeyPath:()MCMDeeplyMutable
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = a1;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = v5;
    do
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = v9;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        [v11 objectForKeyedSubscript:v12];
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 _createOrConvertToMutableDictionaryFromDictionary:v13];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 setObject:v9 forKeyedSubscript:v12];

        ++v10;
        uint64_t v11 = v9;
      }

      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v9 = v5;
  }

  return v9;
}

- (id)_createOrConvertToMutableDictionaryFromDictionary:()MCMDeeplyMutable
{
  id v3 = a3;
  id v4 = v3;
  if (!v3 || (id v5 = (void *)[v3 mutableCopy]) == 0)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
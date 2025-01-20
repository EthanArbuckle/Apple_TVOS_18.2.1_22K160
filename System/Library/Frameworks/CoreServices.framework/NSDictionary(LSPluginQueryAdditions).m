@interface NSDictionary(LSPluginQueryAdditions)
- (id)ls_parseQueryForIdentifiers:()LSPluginQueryAdditions;
- (uint64_t)ls_hashQuery;
@end

@implementation NSDictionary(LSPluginQueryAdditions)

- (id)ls_parseQueryForIdentifiers:()LSPluginQueryAdditions
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FA8] arrayWithCapacity:1];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 objectForKey:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          if (_NSIsNSString())
          {
            objc_msgSend(v11, "ls_cleanForPluginQuery", (void)v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12) {
              [v5 addObject:v12];
            }
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }
  }

  else if (_NSIsNSString())
  {
    objc_msgSend(v6, "ls_cleanForPluginQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      [v5 addObject:v13];
    }
  }

  return v5;
}

- (uint64_t)ls_hashQuery
{
  uint64_t v4 = 0LL;
  v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v7 = 1LL;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __52__NSDictionary_LSPluginQueryAdditions__ls_hashQuery__block_invoke;
  v3[3] = &unk_189D77CF0;
  v3[4] = &v4;
  [a1 enumerateKeysAndObjectsUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

@end
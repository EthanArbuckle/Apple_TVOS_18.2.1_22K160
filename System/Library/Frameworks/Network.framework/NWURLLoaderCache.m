@interface NWURLLoaderCache
- (void)copyVaryStateFromRequest:(void *)a1 varyValueToCopy:(void *)a2;
@end

@implementation NWURLLoaderCache

- (void).cxx_destruct
{
}

- (void)copyVaryStateFromRequest:(void *)a1 varyValueToCopy:(void *)a2
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  [MEMORY[0x189603FC8] dictionary];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  [v4 componentsSeparatedByString:@","];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [MEMORY[0x189607810] whitespaceCharacterSet];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringByTrimmingCharactersInSet:v12];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        [v3 valueForHTTPHeaderField:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14) {
          [v5 setObject:v14 forKeyedSubscript:v13];
        }
        else {
          [v13 caseInsensitiveCompare:@"Cookie"];
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  return v5;
}

@end
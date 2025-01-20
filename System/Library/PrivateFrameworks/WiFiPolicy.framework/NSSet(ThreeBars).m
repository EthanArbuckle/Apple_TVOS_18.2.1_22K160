@interface NSSet(ThreeBars)
- (id)bssidPredicate;
- (id)reformatBSSIDs;
- (id)tilePredicate;
@end

@implementation NSSet(ThreeBars)

- (id)reformatBSSIDs
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1895BA820]();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "reformatBSSID", (void)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9) {
          [v2 addObject:v9];
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  objc_autoreleasePoolPop(v3);
  return v2;
}

- (id)bssidPredicate
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1895BA820]();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)MEMORY[0x1896079C8];
        [*(id *)(*((void *)&v14 + 1) + 8 * v8) reformatBSSID];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 predicateWithFormat:@"bssid == %@", v10];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 addObject:v11];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_autoreleasePoolPop(v3);
  [MEMORY[0x189607820] orPredicateWithSubpredicates:v2];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tilePredicate
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1895BA820]();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)MEMORY[0x1896079C8];
        [*(id *)(*((void *)&v14 + 1) + 8 * v8) key];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 predicateWithFormat:@"key == %@", v10];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 addObject:v11];

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_autoreleasePoolPop(v3);
  [MEMORY[0x189607820] orPredicateWithSubpredicates:v2];
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
@interface NSArray(CUArrayExtensions)
- (id)cuFilteredArrayUsingBlock:()CUArrayExtensions;
@end

@implementation NSArray(CUArrayExtensions)

- (id)cuFilteredArrayUsingBlock:()CUArrayExtensions
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10) {
          objc_msgSend(v5, "addObject:", v10, (void)v13);
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  v11 = (void *)[v5 copy];
  return v11;
}

@end
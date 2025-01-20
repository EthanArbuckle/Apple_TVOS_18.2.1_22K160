@interface NSString(_)
- (uint64_t)hasPrefixFromArray:()_;
@end

@implementation NSString(_)

- (uint64_t)hasPrefixFromArray:()_
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([a1 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * v8)])
        {
          uint64_t v9 = 1LL;
          goto LABEL_11;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 0LL;
LABEL_11:

  return v9;
}

@end
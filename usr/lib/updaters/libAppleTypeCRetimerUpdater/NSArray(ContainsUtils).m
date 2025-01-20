@interface NSArray(ContainsUtils)
- (uint64_t)containsAllObjectsIn:()ContainsUtils;
@end

@implementation NSArray(ContainsUtils)

- (uint64_t)containsAllObjectsIn:()ContainsUtils
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend( a1,  "containsObject:",  *(void *)(*((void *)&v11 + 1) + 8 * v8),  (void)v11))
        {
          uint64_t v9 = 0LL;
          goto LABEL_11;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = 1LL;
LABEL_11:

  return v9;
}

@end
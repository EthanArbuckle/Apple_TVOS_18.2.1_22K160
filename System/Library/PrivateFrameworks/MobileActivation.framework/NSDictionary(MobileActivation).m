@interface NSDictionary(MobileActivation)
- (id)objectForCaseInsensitiveKey:()MobileActivation;
@end

@implementation NSDictionary(MobileActivation)

- (id)objectForCaseInsensitiveKey:()MobileActivation
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)objc_msgSend(a1, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v10 compare:v4 options:1])
        {
          id v11 = (id)[a1 objectForKey:v10];
          goto LABEL_11;
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_11:

  return v11;
}

@end
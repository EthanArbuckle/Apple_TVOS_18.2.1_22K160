@interface NSDictionary(KeySuffixSearch)
- (id)keyWithSuffix:()KeySuffixSearch;
- (id)valueForKeyWithSuffix:()KeySuffixSearch;
@end

@implementation NSDictionary(KeySuffixSearch)

- (id)keyWithSuffix:()KeySuffixSearch
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = a1;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "hasSuffix:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)valueForKeyWithSuffix:()KeySuffixSearch
{
  id v2 = (id)objc_msgSend(a1, "keyWithSuffix:");
  if (v2) {
    id v3 = (id)[a1 objectForKeyedSubscript:v2];
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

@end
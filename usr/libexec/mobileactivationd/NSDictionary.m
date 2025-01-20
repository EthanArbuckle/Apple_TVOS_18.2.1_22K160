@interface NSDictionary
- (id)objectForCaseInsensitiveKey:(id)a3;
@end

@implementation NSDictionary

- (id)objectForCaseInsensitiveKey:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = -[NSDictionary allKeys](self, "allKeys", 0LL);
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (![v10 compare:v4 options:1])
        {
          id v11 = -[NSDictionary objectForKey:](self, "objectForKey:", v10);
          goto LABEL_11;
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
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
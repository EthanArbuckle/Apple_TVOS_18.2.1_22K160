@interface NSMapTable
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
@end

@implementation NSMapTable

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  char v16 = 0;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = self;
  id v6 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](v5, "objectForKey:", v10, (void)v12));
      v4[2](v4, v10, v11, &v16);

      if (v16) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[NSMapTable countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v17,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end
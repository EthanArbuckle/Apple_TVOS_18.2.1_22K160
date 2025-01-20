@interface NSArray
- (id)concatenateWithSeparator:(id)a3;
@end

@implementation NSArray

- (id)concatenateWithSeparator:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v6 = self;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    v10 = &stru_100294B48;
    do
    {
      v11 = 0LL;
      v12 = v10;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
        objc_msgSend(v5, "appendString:", v12, (void)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
        [v5 appendString:v14];

        v10 = (__CFString *)v4;
        v11 = (char *)v11 + 1;
        v12 = v10;
      }

      while (v8 != v11);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  else
  {
    v10 = &stru_100294B48;
  }

  return v5;
}

@end